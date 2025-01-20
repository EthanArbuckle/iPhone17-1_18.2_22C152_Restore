@interface PCDeviceIdentifier
+ (BOOL)supportsSecureCoding;
- (NSString)deviceName;
- (PCDeviceIdentifier)initWithCoder:(id)a3;
- (PCDeviceIdentifier)initWithDeviceName:(id)a3;
- (int64_t)assetType;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation PCDeviceIdentifier

- (PCDeviceIdentifier)initWithDeviceName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDeviceIdentifier;
  v6 = [(PCDeviceIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceName, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t assetType = self->_assetType;
  id v7 = v4;
  if (assetType)
  {
    [v4 encodeInteger:assetType forKey:@"at"];
    id v4 = v7;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    [v7 encodeObject:deviceName forKey:@"dname"];
    id v4 = v7;
  }
}

- (PCDeviceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDeviceIdentifier;
  id v5 = [(PCDeviceIdentifier *)&v9 init];
  if (v5)
  {
    id v6 = v4;
    if ([v6 containsValueForKey:@"at"]) {
      v5->_int64_t assetType = [v6 decodeIntegerForKey:@"at"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v7 = v5;
  }

  return v5;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_int64_t assetType = a3;
}

- (void).cxx_destruct
{
}

@end