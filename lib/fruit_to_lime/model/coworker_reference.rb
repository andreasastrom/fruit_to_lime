module FruitToLime
    class CoworkerReference
        include SerializeHelper
        attr_accessor :id, :heading, :integration_id

        def initialize(opt = nil)
            if opt != nil
                serialize_variables.each do |myattr|
                    val = opt[myattr[:id]]
                    instance_variable_set("@" + myattr[:id].to_s, val) if val != nil
                end
            end
        end

        def serialize_variables
            [:id, :heading, :integration_id].map {|p| {:id => p, :type => :string} }
        end

        def serialize_name
            "CoworkerReference"
        end
    end
end
