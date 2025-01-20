@interface SFCompanionService
+ (BOOL)supportsSecureCoding;
+ (id)serviceFromAuthorData:(id)a3;
+ (id)serviceFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToService:(id)a3;
- (NSNumber)nsxpcVersion;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)identifier;
- (NSString)ipAddress;
- (NSString)managerID;
- (NSString)serviceType;
- (SFCompanionService)initWithCoder:(id)a3;
- (SFCompanionService)initWithServiceName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messageData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)messageData;
- (void)setDeviceID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setManagerID:(id)a3;
- (void)setNsxpcVersion:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation SFCompanionService

+ (id)serviceFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SFCompanionService);
  v5 = [v3 objectForKeyedSubscript:@"ServiceName"];
  [(SFCompanionService *)v4 setServiceType:v5];

  v6 = [v3 objectForKeyedSubscript:@"DeviceID"];
  [(SFCompanionService *)v4 setDeviceID:v6];

  v7 = [v3 objectForKeyedSubscript:@"ServiceIdentifier"];
  [(SFCompanionService *)v4 setIdentifier:v7];

  v8 = [v3 objectForKeyedSubscript:@"DeviceName"];
  [(SFCompanionService *)v4 setDeviceName:v8];

  v9 = [v3 objectForKeyedSubscript:@"ManagerID"];
  [(SFCompanionService *)v4 setManagerID:v9];

  v10 = [v3 objectForKeyedSubscript:@"IPAddress"];

  [(SFCompanionService *)v4 setIpAddress:v10];

  return v4;
}

+ (id)serviceFromAuthorData:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:&v10 error:&v9];
  if (v3)
  {
    v4 = objc_alloc_init(SFCompanionService);
    v5 = [v3 objectForKeyedSubscript:@"unique_id"];
    [(SFCompanionService *)v4 setIdentifier:v5];

    v6 = [v3 objectForKeyedSubscript:@"unique_id"];
    [(SFCompanionService *)v4 setServiceType:v6];

    v7 = [v3 objectForKeyedSubscript:@"manager_id"];
    [(SFCompanionService *)v4 setManagerID:v7];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SFCompanionService)initWithServiceName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFCompanionService;
  v5 = [(SFCompanionService *)&v17 init];
  v6 = v5;
  if (v5)
  {
    deviceID = v5->_deviceID;
    v5->_deviceID = 0;

    deviceName = v6->_deviceName;
    v6->_deviceName = 0;

    nsxpcVersion = v6->_nsxpcVersion;
    v6->_nsxpcVersion = 0;

    uint64_t v10 = [v4 copy];
    serviceType = v6->_serviceType;
    v6->_serviceType = (NSString *)v10;

    v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = [v12 UUIDString];
    uint64_t v14 = [v13 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v14;
  }
  return v6;
}

- (id)messageData
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  managerID = self->_managerID;
  if (managerID) {
    [v3 setObject:managerID forKeyedSubscript:@"manager_id"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKeyedSubscript:@"unique_id"];
  }
  serviceType = self->_serviceType;
  if (serviceType) {
    [v4 setObject:serviceType forKeyedSubscript:@"client_id"];
  }
  id v17 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v17];
  id v9 = v17;
  if (v9)
  {
    id v10 = v9;
    v11 = streams_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(SFCompanionService *)(uint64_t)v10 messageData];
    }
    v12 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [v11 setObject:&unk_1EFA09590 forKeyedSubscript:@"message_version"];
    deviceID = self->_deviceID;
    if (deviceID) {
      [v11 setObject:deviceID forKeyedSubscript:@"bonjour_name"];
    }
    if (v8) {
      [v11 setObject:v8 forKeyedSubscript:@"author_data"];
    }
    id v16 = 0;
    v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:&v16];
    id v10 = v16;
    if (v10)
    {
      uint64_t v14 = streams_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(SFCompanionService *)(uint64_t)v10 messageData];
      }
    }
  }

  return v12;
}

- (SFCompanionService)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFCompanionService;
  v5 = [(SFCompanionService *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device_name"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service_name"];
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device_identifier"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unique_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manager_identifier"];
    managerID = v5->_managerID;
    v5->_managerID = (NSString *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ip_address"];
    uint64_t v17 = [v16 copy];
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"device_name"];
  [v5 encodeObject:self->_serviceType forKey:@"service_name"];
  [v5 encodeObject:self->_deviceID forKey:@"device_identifier"];
  [v5 encodeObject:self->_identifier forKey:@"unique_identifier"];
  [v5 encodeObject:self->_managerID forKey:@"manager_identifier"];
  [v5 encodeObject:self->_ipAddress forKey:@"ip_address"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = [(SFCompanionService *)self deviceID];
    [v4 setDeviceID:v5];

    uint64_t v6 = [(SFCompanionService *)self managerID];
    [v4 setManagerID:v6];

    v7 = [(SFCompanionService *)self ipAddress];
    [v4 setIpAddress:v7];

    uint64_t v8 = [(SFCompanionService *)self deviceName];
    [v4 setDeviceName:v8];

    id v9 = [(SFCompanionService *)self identifier];
    [v4 setIdentifier:v9];

    uint64_t v10 = [(SFCompanionService *)self serviceType];
    [v4 setServiceType:v10];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCompanionService *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFCompanionService *)self isEqualToService:v5];

  return v6;
}

- (BOOL)isEqualToService:(id)a3
{
  id v5 = (SFCompanionService *)a3;
  if (self != v5)
  {
    BOOL v6 = [(SFCompanionService *)self identifier];
    if (v6
      || ([(SFCompanionService *)v5 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [(SFCompanionService *)self identifier];
      uint64_t v8 = [(SFCompanionService *)v5 identifier];
      int v9 = [v7 isEqualToString:v8];

      if (v6)
      {

        if (!v9) {
          goto LABEL_30;
        }
      }
      else
      {

        if ((v9 & 1) == 0) {
          goto LABEL_30;
        }
      }
    }
    v11 = [(SFCompanionService *)self serviceType];
    if (v11
      || ([(SFCompanionService *)v5 serviceType], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [(SFCompanionService *)self serviceType];
      v13 = [(SFCompanionService *)v5 serviceType];
      int v14 = [v12 isEqualToString:v13];

      if (v11)
      {

        if (!v14) {
          goto LABEL_30;
        }
      }
      else
      {

        if ((v14 & 1) == 0) {
          goto LABEL_30;
        }
      }
    }
    v15 = [(SFCompanionService *)self managerID];
    if (v15
      || ([(SFCompanionService *)v5 managerID], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v16 = [(SFCompanionService *)self managerID];
      uint64_t v17 = [(SFCompanionService *)v5 managerID];
      int v18 = [v16 isEqualToString:v17];

      if (v15)
      {

        if (!v18) {
          goto LABEL_30;
        }
      }
      else
      {

        if ((v18 & 1) == 0) {
          goto LABEL_30;
        }
      }
    }
    v19 = [(SFCompanionService *)self deviceID];
    if (!v19)
    {
      id v3 = [(SFCompanionService *)v5 deviceID];
      if (!v3)
      {
LABEL_25:
        v23 = [(SFCompanionService *)self deviceName];
        if (v23
          || ([(SFCompanionService *)v5 deviceName],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v24 = [(SFCompanionService *)self deviceName];
          v25 = [(SFCompanionService *)v5 deviceName];
          int v26 = [v24 isEqualToString:v25] ^ 1;

          if (v23)
          {
LABEL_34:

            char v10 = v26 ^ 1;
            goto LABEL_31;
          }
        }
        else
        {
          LOBYTE(v26) = 0;
        }

        goto LABEL_34;
      }
    }
    objc_super v20 = [(SFCompanionService *)self deviceID];
    v21 = [(SFCompanionService *)v5 deviceID];
    int v22 = [v20 isEqualToString:v21];

    if (v19)
    {

      if (v22) {
        goto LABEL_25;
      }
    }
    else
    {

      if (v22) {
        goto LABEL_25;
      }
    }
LABEL_30:
    char v10 = 0;
    goto LABEL_31;
  }
  char v10 = 1;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_serviceType hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_managerID hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_deviceID hash] - v5 + 32 * v5;
  return [(NSString *)self->_deviceName hash] - v6 + 32 * v6 + 28629151;
}

- (id)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = [(SFCompanionService *)self serviceType];
  NSUInteger v5 = [(SFCompanionService *)self deviceName];
  NSUInteger v6 = [(SFCompanionService *)self deviceID];
  v7 = [(SFCompanionService *)self managerID];
  uint64_t v8 = [(SFCompanionService *)self identifier];
  int v9 = [v3 stringWithFormat:@"SFCompanionService (serviceType = %@, deviceName = %@, deviceID = %@, managerID = %@, identifier = %@)", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceType:(id)a3
{
}

- (NSString)managerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagerID:(id)a3
{
}

- (NSString)ipAddress
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)nsxpcVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNsxpcVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsxpcVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_managerID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)messageData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Author content serialize error = %@", (uint8_t *)&v2, 0xCu);
}

@end