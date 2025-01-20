@interface HAPMetadataProperty
+ (id)init:(id)a3 withDictionary:(id)a4;
- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5;
- (NSNumber)bitPosition;
- (NSString)propertyDescription;
- (NSString)propertyType;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setBitPosition:(id)a3;
- (void)setPropertyDescription:(id)a3;
- (void)setPropertyType:(id)a3;
@end

@implementation HAPMetadataProperty

- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HAPMetadataProperty;
  v11 = [(HAPMetadataProperty *)&v18 init];
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      v13 = (NSString *)[v8 copy];
      propertyType = v12->_propertyType;
      v12->_propertyType = v13;

      objc_storeStrong((id *)&v12->_bitPosition, a4);
      v15 = (NSString *)[v10 copy];
      propertyDescription = (HAPMetadataProperty *)v12->_propertyDescription;
      v12->_propertyDescription = v15;
    }
    else
    {
      propertyDescription = 0;
    }
  }
  else
  {
    propertyDescription = v11;
    v12 = 0;
  }

  return v12;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 hmf_numberForKey:@"Position"];
  id v8 = [v5 hmf_stringForKey:@"DefaultDescription"];

  id v9 = [[HAPMetadataProperty alloc] initWithType:v6 bitPosition:v7 description:v8];

  return v9;
}

- (id)generateDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(HAPMetadataProperty *)self bitPosition];
  [v3 setObject:v4 forKeyedSubscript:@"Position"];

  id v5 = [(HAPMetadataProperty *)self propertyDescription];
  [v3 setObject:v5 forKeyedSubscript:@"DefaultDescription"];

  [v3 setObject:&stru_10027B0E8 forKeyedSubscript:@"LocalizationKey"];

  return v3;
}

- (id)description
{
  v3 = [(HAPMetadataProperty *)self propertyType];
  v4 = [(HAPMetadataProperty *)self propertyDescription];
  id v5 = [(HAPMetadataProperty *)self bitPosition];
  id v6 = +[NSString stringWithFormat:@"Unit %@ - %@ - bit %@", v3, v4, v5];

  return v6;
}

- (void)dump
{
  v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(0);
    id v5 = [(HAPMetadataProperty *)self propertyType];
    id v6 = [(HAPMetadataProperty *)self propertyDescription];
    v7 = [(HAPMetadataProperty *)self bitPosition];
    int v8 = 138544130;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataProperty %@:  description: %@  bitPosition: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (NSString)propertyDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyDescription:(id)a3
{
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyType:(id)a3
{
}

- (NSNumber)bitPosition
{
  return self->_bitPosition;
}

- (void)setBitPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPosition, 0);
  objc_storeStrong((id *)&self->_propertyType, 0);

  objc_storeStrong((id *)&self->_propertyDescription, 0);
}

@end