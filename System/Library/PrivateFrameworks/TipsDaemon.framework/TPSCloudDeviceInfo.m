@interface TPSCloudDeviceInfo
- (BOOL)isPreferred;
- (NSString)displayName;
- (NSString)maxOSVersion;
- (NSString)minOSVersion;
- (NSString)model;
- (NSString)symbolIdentifier;
- (TPSCloudDeviceInfo)initWithDictionary:(id)a3;
- (TPSCloudDeviceInfo)initWithModel:(id)a3;
- (id)debugDescription;
- (void)setDisplayName:(id)a3;
- (void)setMaxOSVersion:(id)a3;
- (void)setMinOSVersion:(id)a3;
- (void)setModel:(id)a3;
- (void)setPreferred:(BOOL)a3;
- (void)setSymbolIdentifier:(id)a3;
@end

@implementation TPSCloudDeviceInfo

- (TPSCloudDeviceInfo)initWithModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSCloudDeviceInfo;
  v6 = [(TPSCloudDeviceInfo *)&v10 init];
  p_isa = (id *)&v6->super.super.isa;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), ![p_isa[2] length])) {
    v8 = 0;
  }
  else {
    v8 = p_isa;
  }

  return v8;
}

- (TPSCloudDeviceInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSCloudDeviceInfo;
  id v5 = [(TPSCloudDeviceInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"model"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F4017D10;
    }
    objc_storeStrong((id *)&v5->_model, v8);

    uint64_t v9 = [v4 TPSSafeStringForKey:@"osMinVersion"];
    minOSVersion = v5->_minOSVersion;
    v5->_minOSVersion = (NSString *)v9;

    uint64_t v11 = [v4 TPSSafeStringForKey:@"osMaxVersion"];
    maxOSVersion = v5->_maxOSVersion;
    v5->_maxOSVersion = (NSString *)v11;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v16.receiver = self;
  v16.super_class = (Class)TPSCloudDeviceInfo;
  id v4 = [(TPSSerializableObject *)&v16 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSCloudDeviceInfo *)self model];
  [v5 appendFormat:@"\n%@ = %@\n", @"model", v6];

  [v5 appendFormat:@"%@ = %d\n", @"isPreferred", -[TPSCloudDeviceInfo isPreferred](self, "isPreferred")];
  v7 = [(TPSCloudDeviceInfo *)self minOSVersion];

  if (v7)
  {
    v8 = [(TPSCloudDeviceInfo *)self minOSVersion];
    [v5 appendFormat:@"%@ = %@\n", @"minOSVersion", v8];
  }
  uint64_t v9 = [(TPSCloudDeviceInfo *)self maxOSVersion];

  if (v9)
  {
    objc_super v10 = [(TPSCloudDeviceInfo *)self maxOSVersion];
    [v5 appendFormat:@"%@ = %@\n", @"maxOSVersion", v10];
  }
  uint64_t v11 = [(TPSCloudDeviceInfo *)self displayName];

  if (v11)
  {
    v12 = [(TPSCloudDeviceInfo *)self displayName];
    [v5 appendFormat:@"%@ = %@\n", @"displayName", v12];
  }
  v13 = [(TPSCloudDeviceInfo *)self symbolIdentifier];

  if (v13)
  {
    objc_super v14 = [(TPSCloudDeviceInfo *)self symbolIdentifier];
    [v5 appendFormat:@"%@ = %@\n", @"symbolIdentifier", v14];
  }

  return v5;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(id)a3
{
}

- (NSString)maxOSVersion
{
  return self->_maxOSVersion;
}

- (void)setMaxOSVersion:(id)a3
{
}

- (NSString)symbolIdentifier
{
  return self->_symbolIdentifier;
}

- (void)setSymbolIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolIdentifier, 0);
  objc_storeStrong((id *)&self->_maxOSVersion, 0);
  objc_storeStrong((id *)&self->_minOSVersion, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end