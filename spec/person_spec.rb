require "spec_helper"
require 'fruit_to_lime'

describe "Person" do
    before (:all) do
        @person = FruitToLime::Person.new
    end

    it "can set a customfield" do
        @person.set_custom_field({:integration_id=>'the key',
            :title=> 'the title',
            :value=> 'the value'})

        value = @person.custom_values[0]
        field = value.field
        field.integration_id.should eq 'the key'
        field.title.should eq 'the title'
        value.value.should eq 'the value'
    end

    it "should have a firstname if no lastname" do
        @person.first_name = "Vincent"
        @person.last_name = nil

        error = @person.validate
        error.should be_empty
    end

    it "should be currently employed if nothing specified" do
        expect(@person.currently_employed).to eq(true)
    end

    it "should have a lastname if no firstname" do
        @person.first_name = String.new
        @person.last_name = "Vega"

        error = @person.validate
        error.should be_empty
    end

    it "shouldnt pass validation with no firstname and lastname" do
        @person.first_name = String.new
        @person.last_name = nil

        error = @person.validate
        error.should start_with("A firstname or lastname is required for person")
    end
end

