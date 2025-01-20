@interface HAPMetadataUnit
+ (id)init:(id)a3 withDictionary:(id)a4;
- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4;
- (NSString)name;
- (NSString)unitDescription;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setName:(id)a3;
- (void)setUnitDescription:(id)a3;
@end

@implementation HAPMetadataUnit

- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HAPMetadataUnit;
  v8 = [(HAPMetadataUnit *)&v15 init];
  v9 = v8;
  if (v7 && v6)
  {
    if (v8)
    {
      v10 = (NSString *)[v6 copy];
      name = v9->_name;
      v9->_name = v10;

      v12 = (NSString *)[v7 copy];
      unitDescription = (HAPMetadataUnit *)v9->_unitDescription;
      v9->_unitDescription = v12;
    }
    else
    {
      unitDescription = 0;
    }
  }
  else
  {
    unitDescription = v8;
    v9 = 0;
  }

  return v9;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 hmf_stringForKey:@"DefaultDescription"];
  id v7 = [[HAPMetadataUnit alloc] initWithName:v5 description:v6];

  return v7;
}

- (id)generateDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(HAPMetadataUnit *)self unitDescription];
  [v3 setObject:v4 forKeyedSubscript:@"DefaultDescription"];

  [v3 setObject:&stru_10027B0E8 forKeyedSubscript:@"LocalizationKey"];

  return v3;
}

- (id)description
{
  v3 = [(HAPMetadataUnit *)self name];
  v4 = [(HAPMetadataUnit *)self unitDescription];
  id v5 = +[NSString stringWithFormat:@"Unit %@ - %@", v3, v4];

  return v5;
}

- (void)dump
{
  v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(0);
    id v5 = [(HAPMetadataUnit *)self name];
    id v6 = [(HAPMetadataUnit *)self unitDescription];
    int v7 = 138543874;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataUnit %@:  description: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)unitDescription
{
  return self->_unitDescription;
}

- (void)setUnitDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end