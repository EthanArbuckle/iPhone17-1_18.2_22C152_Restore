@interface GTServiceProperties
+ (BOOL)supportsSecureCoding;
+ (id)protocolMethods:(id)a3;
- (GTServiceProperties)initWithCoder:(id)a3;
- (GTServiceProperties)initWithProtocol:(id)a3;
- (NSArray)protocolMethods;
- (NSString)deviceUDID;
- (NSString)protocolName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)platform;
- (unint64_t)servicePort;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setPlatform:(int)a3;
- (void)setProtocolMethods:(id)a3;
- (void)setProtocolName:(id)a3;
- (void)setServicePort:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation GTServiceProperties

+ (id)protocolMethods:(id)a3
{
  unsigned int outCount = 0;
  v3 = protocol_copyMethodDescriptionList((Protocol *)a3, 1, 1, &outCount);
  id v4 = objc_alloc((Class)NSMutableArray);
  id v5 = [v4 initWithCapacity:outCount];
  if (outCount)
  {
    unint64_t v6 = 0;
    p_name = &v3->name;
    do
    {
      v8 = *p_name;
      p_name += 2;
      v9 = NSStringFromSelector(v8);
      [v5 addObject:v9];

      ++v6;
    }
    while (v6 < outCount);
  }
  free(v3);
  id v10 = [v5 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTServiceProperties)initWithProtocol:(id)a3
{
  id v4 = (Protocol *)a3;
  v12.receiver = self;
  v12.super_class = (Class)GTServiceProperties;
  id v5 = [(GTServiceProperties *)&v12 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromProtocol(v4);
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v6;

    uint64_t v8 = +[GTServiceProperties protocolMethods:v4];
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v8;

    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = 0;

    v5->_platform = GTCorePlatformGet();
    v5->_version = 0;
  }

  return v5;
}

- (GTServiceProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GTServiceProperties;
  id v5 = [(GTServiceProperties *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protocolName"];
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v6;

    if (v5->_protocolName)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = v5->_protocolName;
        v5->_protocolName = 0;
      }
    }
    uint64_t v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"protocolMethods"];
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v9;

    if (v5->_protocolMethods)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v11 = v5->_protocolMethods;
        objc_super v12 = (char *)[(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v12)
        {
          v13 = v12;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = v5->_protocolMethods;
                v5->_protocolMethods = 0;

                goto LABEL_18;
              }
            }
            v13 = (char *)[(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v11 = v5->_protocolMethods;
        v5->_protocolMethods = 0;
      }
LABEL_18:
    }
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUDID"];
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v17;

    if (v5->_deviceUDID)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = v5->_deviceUDID;
        v5->_deviceUDID = 0;
      }
    }
    v5->_servicePort = (unint64_t)[v4 decodeInt64ForKey:@"servicePort" value:v21];
    v5->_platform = [v4 decodeInt64ForKey:@"platform"];
    v5->_version = (unint64_t)[v4 decodeInt64ForKey:@"version"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  protocolName = self->_protocolName;
  id v5 = a3;
  [v5 encodeObject:protocolName forKey:@"protocolName"];
  [v5 encodeObject:self->_protocolMethods forKey:@"protocolMethods"];
  [v5 encodeInt64:self->_servicePort forKey:@"servicePort"];
  [v5 encodeInt64:self->_platform forKey:@"platform"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeInt64:self->_version forKey:@"version"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GTServiceProperties);
  [(GTServiceProperties *)v4 setProtocolName:self->_protocolName];
  id v5 = [objc_alloc((Class)NSArray) initWithArray:self->_protocolMethods copyItems:1];
  [(GTServiceProperties *)v4 setProtocolMethods:v5];

  [(GTServiceProperties *)v4 setServicePort:self->_servicePort];
  [(GTServiceProperties *)v4 setPlatform:self->_platform];
  [(GTServiceProperties *)v4 setDeviceUDID:self->_deviceUDID];
  [(GTServiceProperties *)v4 setVersion:self->_version];
  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@: protocolName=%@ protocolMethods=%@ servicePort=%llu platform=%u deviceUDID=%@ version=%llu>", v4, self->_protocolName, self->_protocolMethods, self->_servicePort, self->_platform, self->_deviceUDID, self->_version];

  return v5;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
}

- (NSArray)protocolMethods
{
  return self->_protocolMethods;
}

- (void)setProtocolMethods:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (unint64_t)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unint64_t)a3
{
  self->_servicePort = a3;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_protocolMethods, 0);

  objc_storeStrong((id *)&self->_protocolName, 0);
}

@end