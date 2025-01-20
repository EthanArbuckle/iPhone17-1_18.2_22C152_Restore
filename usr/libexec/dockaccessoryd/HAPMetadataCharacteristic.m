@interface HAPMetadataCharacteristic
- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7;
- (HAPMetadataCharacteristicValue)valueMetadata;
- (NSNumber)properties;
- (NSString)chrDescription;
- (NSString)format;
- (NSString)name;
- (NSString)units;
- (NSString)uuidStr;
- (id)description;
- (id)generateDictionary:(id)a3;
- (void)dump;
- (void)setChrDescription:(id)a3;
- (void)setFormat:(id)a3;
- (void)setName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setUnits:(id)a3;
- (void)setUuidStr:(id)a3;
- (void)setValueMetadata:(id)a3;
@end

@implementation HAPMetadataCharacteristic

- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  id v18 = 0;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataCharacteristic;
    id v18 = [(HAPMetadataCharacteristic *)&v29 init];
    if (v18)
    {
      id v19 = [v12 copy];
      v20 = (void *)*((void *)v18 + 1);
      *((void *)v18 + 1) = v19;

      id v21 = [v13 copy];
      v22 = (void *)*((void *)v18 + 3);
      *((void *)v18 + 3) = v21;

      id v23 = [v14 copy];
      v24 = (void *)*((void *)v18 + 2);
      *((void *)v18 + 2) = v23;

      id v25 = [v15 copy];
      v26 = (void *)*((void *)v18 + 5);
      *((void *)v18 + 5) = v25;

      id v27 = v17;
      self = (HAPMetadataCharacteristic *)*((void *)v18 + 4);
      *((void *)v18 + 4) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataCharacteristic *)v18;
}

- (id)generateDictionary:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = [(HAPMetadataCharacteristic *)self uuidStr];
  v7 = +[HAPMetadata shortenHAPType:v6 baseUUIDSuffix:v4];

  [v5 setObject:v7 forKeyedSubscript:@"ShortUUID"];
  v8 = [(HAPMetadataCharacteristic *)self chrDescription];
  [v5 setObject:v8 forKeyedSubscript:@"DefaultDescription"];

  v9 = [(HAPMetadataCharacteristic *)self format];
  [v5 setObject:v9 forKeyedSubscript:@"Format"];

  v10 = [(HAPMetadataCharacteristic *)self properties];
  [v5 setObject:v10 forKeyedSubscript:@"Properties"];

  [v5 setObject:&stru_10027B0E8 forKeyedSubscript:@"LocalizationKey"];
  v11 = [(HAPMetadataCharacteristic *)self units];

  if (v11)
  {
    id v12 = [(HAPMetadataCharacteristic *)self units];
    [v5 setObject:v12 forKeyedSubscript:@"Units"];
  }
  id v13 = [(HAPMetadataCharacteristic *)self valueMetadata];
  id v14 = [v13 generateDictionary];
  [v5 addEntriesFromDictionary:v14];

  return v5;
}

- (id)description
{
  v3 = [(HAPMetadataCharacteristic *)self name];
  id v4 = [(HAPMetadataCharacteristic *)self uuidStr];
  v5 = [(HAPMetadataCharacteristic *)self chrDescription];
  v6 = [(HAPMetadataCharacteristic *)self format];
  v7 = [(HAPMetadataCharacteristic *)self properties];
  v8 = +[NSString stringWithFormat:@"HAPMetadataCharacteristic %@(%@) - %@ - format %@, properties %@", v3, v4, v5, v6, v7];

  return v8;
}

- (void)dump
{
  v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100083FD0(0);
    v5 = [(HAPMetadataCharacteristic *)self name];
    v6 = [(HAPMetadataCharacteristic *)self uuidStr];
    v7 = [(HAPMetadataCharacteristic *)self chrDescription];
    v8 = [(HAPMetadataCharacteristic *)self format];
    v9 = [(HAPMetadataCharacteristic *)self properties];
    v10 = [(HAPMetadataCharacteristic *)self units];
    int v11 = 138544898;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharaceristics %@(%@):  description: %@  format: %@  properties: %@  units:%@", (uint8_t *)&v11, 0x48u);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)chrDescription
{
  return self->_chrDescription;
}

- (void)setChrDescription:(id)a3
{
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSString)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
}

- (HAPMetadataCharacteristicValue)valueMetadata
{
  return self->_valueMetadata;
}

- (void)setValueMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_chrDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end