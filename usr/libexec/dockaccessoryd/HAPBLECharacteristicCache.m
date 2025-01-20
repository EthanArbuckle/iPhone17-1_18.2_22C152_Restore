@interface HAPBLECharacteristicCache
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6;
- (HAPBLECharacteristicCache)initWithCoder:(id)a3;
- (HAPCharacteristicMetadata)characteristicMetadata;
- (NSNumber)characteristicInstanceId;
- (NSUUID)characteristicUUID;
- (id)description;
- (unint64_t)characteristicProperties;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCharacteristicMetadata:(id)a3;
- (void)setCharacteristicProperties:(unint64_t)a3;
- (void)updateWithCharacteristic:(id)a3;
@end

@implementation HAPBLECharacteristicCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPBLECharacteristicCache;
  v14 = [(HAPBLECharacteristicCache *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_characteristicUUID, a3);
    objc_storeStrong((id *)&v15->_characteristicInstanceId, a4);
    v15->_characteristicProperties = a5;
    objc_storeStrong((id *)&v15->_characteristicMetadata, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBLECharacteristicCache *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAPBLECharacteristicCache *)self characteristicUUID];
      v7 = [(HAPBLECharacteristicCache *)v5 characteristicUUID];
      unsigned int v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
        v10 = [(HAPBLECharacteristicCache *)v5 characteristicInstanceId];
        unsigned __int8 v11 = [v9 isEqual:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4 = a3;
  -[HAPBLECharacteristicCache setCharacteristicProperties:](self, "setCharacteristicProperties:", [v4 characteristicProperties]);
  id v5 = [v4 characteristicMetadata];

  [(HAPBLECharacteristicCache *)self setCharacteristicMetadata:v5];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  [v4 encodeObject:v5 forKey:@"CUUI"];

  unint64_t v6 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  [v4 encodeObject:v6 forKey:@"CI"];

  [v4 encodeInteger:-[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties") forKey:@"CP"];
  id v7 = [(HAPBLECharacteristicCache *)self characteristicMetadata];
  [v4 encodeObject:v7 forKey:@"CM"];
}

- (HAPBLECharacteristicCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HAPBLECharacteristicCache;
  id v5 = [(HAPBLECharacteristicCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CUUI"];
    characteristicUUID = v5->_characteristicUUID;
    v5->_characteristicUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CI"];
    characteristicInstanceId = v5->_characteristicInstanceId;
    v5->_characteristicInstanceId = (NSNumber *)v8;

    v5->_characteristicProperties = (unint64_t)[v4 decodeIntegerForKey:@"CP"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CM"];
    characteristicMetadata = v5->_characteristicMetadata;
    v5->_characteristicMetadata = (HAPCharacteristicMetadata *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  id v4 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  id v5 = sub_100029188((__int16)[(HAPBLECharacteristicCache *)self characteristicProperties]);
  uint64_t v6 = [(HAPBLECharacteristicCache *)self characteristicMetadata];
  id v7 = +[NSString stringWithFormat:@"\n\tCharacteristic Info:\n\t\tCharacteristic UUID: %@,\n\t\tInstanceId: %@,\n\t\tProperties: %@,\n\t\tMetadata: %@", v3, v4, v5, v6];

  return v7;
}

- (NSUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (NSNumber)characteristicInstanceId
{
  return self->_characteristicInstanceId;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicProperties:(unint64_t)a3
{
  self->_characteristicProperties = a3;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void)setCharacteristicMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceId, 0);

  objc_storeStrong((id *)&self->_characteristicUUID, 0);
}

@end