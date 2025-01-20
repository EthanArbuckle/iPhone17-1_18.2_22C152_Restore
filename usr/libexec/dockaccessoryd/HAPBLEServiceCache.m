@interface HAPBLEServiceCache
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HAPBLEServiceCache)initWithCoder:(id)a3;
- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7;
- (NSArray)linkedServices;
- (NSMutableArray)cachedCharacteristics;
- (NSNumber)serviceInstanceId;
- (NSUUID)serviceUUID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serviceInstanceOrder;
- (unint64_t)serviceProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedCharacteristics:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setServiceInstanceOrder:(unint64_t)a3;
- (void)setServiceProperties:(unint64_t)a3;
- (void)updateWithCharacteristic:(id)a3;
- (void)updateWithService:(id)a3;
@end

@implementation HAPBLEServiceCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPBLEServiceCache;
  v16 = [(HAPBLEServiceCache *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceUUID, a3);
    objc_storeStrong((id *)&v17->_serviceInstanceId, a4);
    v17->_serviceInstanceOrder = a5;
    v17->_serviceProperties = a6;
    objc_storeStrong((id *)&v17->_linkedServices, a7);
    uint64_t v18 = +[NSMutableArray array];
    cachedCharacteristics = v17->_cachedCharacteristics;
    v17->_cachedCharacteristics = (NSMutableArray *)v18;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBLEServiceCache *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAPBLEServiceCache *)self serviceUUID];
      v7 = [(HAPBLEServiceCache *)v5 serviceUUID];
      unsigned int v8 = [v6 isEqual:v7];

      if (v8
        && ([(HAPBLEServiceCache *)self serviceInstanceId],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(HAPBLEServiceCache *)v5 serviceInstanceId],
            v10 = objc_claimAutoreleasedReturnValue(),
            unsigned int v11 = [v9 isEqual:v10],
            v10,
            v9,
            v11))
      {
        id v12 = [(HAPBLEServiceCache *)self serviceInstanceOrder];
        BOOL v13 = v12 == (id)[(HAPBLEServiceCache *)v5 serviceInstanceOrder];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(HAPBLEServiceCache *)self serviceUUID];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(HAPBLEServiceCache *)self serviceInstanceId];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (void)updateWithService:(id)a3
{
  id v4 = a3;
  -[HAPBLEServiceCache setServiceInstanceOrder:](self, "setServiceInstanceOrder:", [v4 serviceInstanceOrder]);
  -[HAPBLEServiceCache setServiceProperties:](self, "setServiceProperties:", [v4 serviceProperties]);
  v5 = [v4 linkedServices];
  [(HAPBLEServiceCache *)self setLinkedServices:v5];

  id v6 = [v4 cachedCharacteristics];

  [(HAPBLEServiceCache *)self setCachedCharacteristics:v6];
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 isEqual:v4])
        {
          [v10 updateWithCharacteristic:v4];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  [v5 addObject:v4];
LABEL_11:
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBLEServiceCache *)self serviceUUID];
  [v4 encodeObject:v5 forKey:@"SUUI"];

  id v6 = [(HAPBLEServiceCache *)self serviceInstanceId];
  [v4 encodeObject:v6 forKey:@"SI"];

  [v4 encodeInteger:-[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder") forKey:@"SO"];
  [v4 encodeInteger:-[HAPBLEServiceCache serviceProperties](self, "serviceProperties") forKey:@"SP"];
  id v7 = [(HAPBLEServiceCache *)self linkedServices];
  [v4 encodeObject:v7 forKey:@"LS"];

  id v8 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  [v4 encodeObject:v8 forKey:@"CC"];
}

- (HAPBLEServiceCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HAPBLEServiceCache;
  v5 = [(HAPBLEServiceCache *)&v20 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUUI"];
  serviceUUID = v5->_serviceUUID;
  v5->_serviceUUID = (NSUUID *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SI"];
  serviceInstanceId = v5->_serviceInstanceId;
  v5->_serviceInstanceId = (NSNumber *)v8;

  v5->_serviceInstanceOrder = (unint64_t)[v4 decodeIntegerForKey:@"SO"];
  v5->_serviceProperties = (unint64_t)[v4 decodeIntegerForKey:@"SP"];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v10 = +[NSArray arrayWithObjects:v22 count:2];
  long long v11 = +[NSSet setWithArray:v10];
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"LS"];
  linkedServices = v5->_linkedServices;
  v5->_linkedServices = (NSArray *)v12;

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  long long v14 = +[NSArray arrayWithObjects:v21 count:2];
  id v15 = +[NSSet setWithArray:v14];
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"CC"];
  cachedCharacteristics = v5->_cachedCharacteristics;
  v5->_cachedCharacteristics = (NSMutableArray *)v16;

  if (!v5->_serviceInstanceId) {
    goto LABEL_5;
  }
  if (v5->_serviceUUID) {
    uint64_t v18 = v5;
  }
  else {
LABEL_5:
  }
    uint64_t v18 = 0;

  return v18;
}

- (id)description
{
  v3 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\nList of Characteristics: %tu\n", [v3 count]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(HAPBLEServiceCache *)self cachedCharacteristics];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = [v10 stringByAppendingFormat:@"%@", *(void *)(*((void *)&v18 + 1) + 8 * (void)v9)];

        v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  long long v11 = [(HAPBLEServiceCache *)self serviceUUID];
  uint64_t v12 = [(HAPBLEServiceCache *)self serviceInstanceId];
  unint64_t v13 = [(HAPBLEServiceCache *)self serviceInstanceOrder];
  long long v14 = sub_100029E0C((char)[(HAPBLEServiceCache *)self serviceProperties]);
  id v15 = [(HAPBLEServiceCache *)self linkedServices];
  uint64_t v16 = +[NSString stringWithFormat:@"\n\nService Info:\n\tService UUID: %@,\n\tInstanceId: %@,\n\tOrder: %lu,\n\tProperties: %@,\n\tLinkedServices: %@,\n\t %@", v11, v12, v13, v14, v15, v4];

  return v16;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (NSNumber)serviceInstanceId
{
  return self->_serviceInstanceId;
}

- (unint64_t)serviceInstanceOrder
{
  return self->_serviceInstanceOrder;
}

- (void)setServiceInstanceOrder:(unint64_t)a3
{
  self->_serviceInstanceOrder = a3;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
}

- (NSMutableArray)cachedCharacteristics
{
  return self->_cachedCharacteristics;
}

- (void)setCachedCharacteristics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceId, 0);

  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

@end