@interface REDuetContextDevice
+ (id)companionDevice;
+ (id)localDevice;
- (BOOL)isEqual:(id)a3;
- (NSUUID)identifier;
- (REDuetContextDevice)initWithUUID:(id)a3 type:(unint64_t)a4;
- (unint64_t)deviceType;
- (unint64_t)hash;
@end

@implementation REDuetContextDevice

- (REDuetContextDevice)initWithUUID:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDuetContextDevice;
  v8 = [(REDuetContextDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_deviceType = a4;
  }

  return v9;
}

+ (id)localDevice
{
  if (localDevice_onceToken != -1) {
    dispatch_once(&localDevice_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)localDevice_LocalDevice;
  return v2;
}

uint64_t __34__REDuetContextDevice_localDevice__block_invoke()
{
  v0 = [[REDuetContextDevice alloc] initWithUUID:0 type:2];
  uint64_t v1 = localDevice_LocalDevice;
  localDevice_LocalDevice = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)companionDevice
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"69F29713-2C08-51C0-9C58-DA6DB6AFBD28"];
  v3 = [[REDuetContextDevice alloc] initWithUUID:v2 type:0xFFFFLL];

  return v3;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REDuetContextDevice *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      id v7 = identifier;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSUUID *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
}

@end