@interface WFTimeZoneDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)timeZoneJSONTransformer;
- (BOOL)isEqual:(id)a3;
- (NSNumber)alCityIdentifier;
- (NSString)localizedCityName;
- (NSTimeZone)timeZone;
- (WFTimeZoneDescriptor)initWithALCity:(id)a3;
- (WFTimeZoneDescriptor)initWithTimeZone:(id)a3 localizedCityName:(id)a4 alCityIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation WFTimeZoneDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alCityIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedCityName, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

- (NSNumber)alCityIdentifier
{
  return self->_alCityIdentifier;
}

- (NSString)localizedCityName
{
  return self->_localizedCityName;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(WFTimeZoneDescriptor *)self timeZone];
  v6 = (void *)[v5 copy];
  v7 = [(WFTimeZoneDescriptor *)self localizedCityName];
  v8 = [(WFTimeZoneDescriptor *)self alCityIdentifier];
  v9 = (void *)[v4 initWithTimeZone:v6 localizedCityName:v7 alCityIdentifier:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFTimeZoneDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFTimeZoneDescriptor *)self timeZone];
      v6 = [v5 name];
      v7 = [(WFTimeZoneDescriptor *)v4 timeZone];
      v8 = [v7 name];
      id v9 = v6;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
      }
      else
      {
        LOBYTE(v12) = 0;
        v13 = v10;
        id v14 = v9;
        if (!v9 || !v10)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        int v12 = [v9 isEqualToString:v10];

        if (!v12) {
          goto LABEL_18;
        }
      }
      v15 = [(WFTimeZoneDescriptor *)self localizedCityName];
      v16 = [(WFTimeZoneDescriptor *)v4 localizedCityName];
      id v14 = v15;
      id v17 = v16;
      v13 = v17;
      if (v14 == v17)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        LOBYTE(v12) = 0;
        if (v14 && v17) {
          LOBYTE(v12) = [v14 isEqualToString:v17];
        }
      }

      goto LABEL_17;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (WFTimeZoneDescriptor)initWithALCity:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  v6 = [v5 timeZone];
  v7 = [v4 timeZoneWithName:v6];

  v8 = [v5 displayNameIncludingCountry:1];
  id v9 = NSNumber;
  uint64_t v10 = [v5 identifier];

  v11 = [v9 numberWithInt:v10];
  int v12 = [(WFTimeZoneDescriptor *)self initWithTimeZone:v7 localizedCityName:v8 alCityIdentifier:v11];

  return v12;
}

- (WFTimeZoneDescriptor)initWithTimeZone:(id)a3 localizedCityName:(id)a4 alCityIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFTimeZoneDescriptor;
  int v12 = [(MTLModel *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timeZone, a3);
    uint64_t v14 = [v10 copy];
    localizedCityName = v13->_localizedCityName;
    v13->_localizedCityName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    alCityIdentifier = v13->_alCityIdentifier;
    v13->_alCityIdentifier = (NSNumber *)v16;

    v18 = v13;
  }

  return v13;
}

+ (id)timeZoneJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_38628 reverseBlock:&__block_literal_global_175_38629];
}

uint64_t __47__WFTimeZoneDescriptor_timeZoneJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __47__WFTimeZoneDescriptor_timeZoneJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CAF0] timeZoneWithName:a2];
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end