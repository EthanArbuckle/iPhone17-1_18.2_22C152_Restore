@interface SKPresentDevice
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelfDevice;
- (BOOL)isSelfHandle;
- (NSDate)assertionTime;
- (NSString)deviceIdentifier;
- (NSString)deviceTokenURI;
- (SKHandle)handle;
- (SKPresencePayload)presencePayload;
- (SKPresentDevice)initWithCoder:(id)a3;
- (SKPresentDevice)initWithHandle:(id)a3 deviceIdentifier:(id)a4 deviceTokenURI:(id)a5 payload:(id)a6 assertionTime:(id)a7 selfHandle:(BOOL)a8 selfDevice:(BOOL)a9;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKPresentDevice

- (SKPresentDevice)initWithHandle:(id)a3 deviceIdentifier:(id)a4 deviceTokenURI:(id)a5 payload:(id)a6 assertionTime:(id)a7 selfHandle:(BOOL)a8 selfDevice:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v18 = a7;
  if (!v16) {
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]();
  }
  if (!v17) {
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]();
  }
  v19 = v18;
  if (!v18) {
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKPresentDevice;
  v20 = [(SKPresentDevice *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_handle, a3);
    objc_storeStrong((id *)&v21->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v21->_deviceTokenURI, a5);
    objc_storeStrong((id *)&v21->_assertionTime, a7);
    v21->_isSelfDevice = a9;
    v21->_isSelfHandle = a8;
    objc_storeStrong((id *)&v21->_presencePayload, a6);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"handle"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_deviceTokenURI forKey:@"deviceTokenURI"];
  [v5 encodeObject:self->_presencePayload forKey:@"payload"];
  [v5 encodeObject:self->_assertionTime forKey:@"assertionTime"];
  [v5 encodeBool:self->_isSelfHandle forKey:@"selfHandle"];
  [v5 encodeBool:self->_isSelfDevice forKey:@"selfDevice"];
}

- (SKPresentDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKPresentDevice;
  id v5 = [(SKPresentDevice *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (SKHandle *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceTokenURI"];
    deviceTokenURI = v5->_deviceTokenURI;
    v5->_deviceTokenURI = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assertionTime"];
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    presencePayload = v5->_presencePayload;
    v5->_presencePayload = (SKPresencePayload *)v14;

    v5->_isSelfHandle = [v4 decodeBoolForKey:@"selfHandle"];
    v5->_isSelfDevice = [v4 decodeBoolForKey:@"selfDevice"];
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = +[SKPresentDevice logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    handle = self->_handle;
    *(_DWORD *)buf = 138412290;
    v7 = handle;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing SKPresentDevice for handle \"%@\"", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKPresentDevice;
  [(SKPresentDevice *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SKPresentDevice *)self deviceIdentifier];

    if (v6)
    {
      v7 = [(SKPresentDevice *)self deviceIdentifier];
      uint64_t v8 = [v5 deviceIdentifier];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(SKPresentDevice *)self presencePayload];
        uint64_t v10 = [v5 presencePayload];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SKPresentDevice *)self deviceIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SKPresentDevice *)self presencePayload];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SKPresentDevice *)self handle];
  unint64_t v6 = [(SKPresentDevice *)self deviceIdentifier];
  v7 = [(SKPresentDevice *)self deviceTokenURI];
  uint64_t v8 = [(SKPresentDevice *)self presencePayload];
  v9 = [(SKPresentDevice *)self assertionTime];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; handle = \"%@\"; deviceIdentifier = \"%@\"; deviceTokenURI = \"%@\"; payload = \"%@\"; assertionTime = \"%@\"; selfDevice = \"%d\"; selfHandle = \"%d\">",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    [(SKPresentDevice *)self isSelfDevice],
  uint64_t v10 = [(SKPresentDevice *)self isSelfHandle]);

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_5 != -1) {
    dispatch_once(&logger_onceToken_5, &__block_literal_global_5);
  }
  v2 = (void *)logger__logger_5;
  return v2;
}

uint64_t __25__SKPresentDevice_logger__block_invoke()
{
  logger__logger_5 = (uint64_t)os_log_create("com.apple.StatusKit", "SKPresentDevice");
  return MEMORY[0x270F9A758]();
}

- (BOOL)isSelfDevice
{
  return self->_isSelfDevice;
}

- (BOOL)isSelfHandle
{
  return self->_isSelfHandle;
}

- (SKHandle)handle
{
  return self->_handle;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceTokenURI
{
  return self->_deviceTokenURI;
}

- (SKPresencePayload)presencePayload
{
  return self->_presencePayload;
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_presencePayload, 0);
  objc_storeStrong((id *)&self->_deviceTokenURI, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.1()
{
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.2()
{
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.3()
{
}

@end