@interface SFAutoUnlockDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)bluetoothCloudPaired;
- (BOOL)canUnlockDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyExists;
- (BOOL)placeholder;
- (BOOL)supportsAdvertisingUnlocked;
- (BOOL)supportsAlwaysDirect;
- (BOOL)supportsApproveIcon;
- (BOOL)supportsApproveWithWatch;
- (BOOL)supportsConnectionCache;
- (BOOL)supportsEncryption;
- (BOOL)supportsHEIC;
- (BOOL)unlockEnabled;
- (NSData)hintToken;
- (NSDictionary)results;
- (NSString)modelDescription;
- (NSString)modelName;
- (NSUUID)bluetoothID;
- (NSUUID)proxyBluetoothID;
- (SFAutoUnlockDevice)init;
- (SFAutoUnlockDevice)initWithCoder:(id)a3;
- (id)description;
- (int64_t)majorOSVersion;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothCloudPaired:(BOOL)a3;
- (void)setBluetoothID:(id)a3;
- (void)setCanUnlockDevice:(BOOL)a3;
- (void)setHintToken:(id)a3;
- (void)setKeyExists:(BOOL)a3;
- (void)setMajorOSVersion:(int64_t)a3;
- (void)setModelDescription:(id)a3;
- (void)setModelName:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setProxyBluetoothID:(id)a3;
- (void)setResults:(id)a3;
- (void)setSupportsAdvertisingUnlocked:(BOOL)a3;
- (void)setSupportsAlwaysDirect:(BOOL)a3;
- (void)setSupportsApproveIcon:(BOOL)a3;
- (void)setSupportsApproveWithWatch:(BOOL)a3;
- (void)setSupportsConnectionCache:(BOOL)a3;
- (void)setSupportsEncryption:(BOOL)a3;
- (void)setSupportsHEIC:(BOOL)a3;
- (void)setUnlockEnabled:(BOOL)a3;
@end

@implementation SFAutoUnlockDevice

- (SFAutoUnlockDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockDevice;
  v2 = [(SFAutoUnlockDevice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    modelDescription = v2->_modelDescription;
    v2->_modelDescription = (NSString *)&stru_1EF9BDC68;
  }
  return v3;
}

- (int64_t)type
{
  v3 = [(SFPeerDevice *)self modelIdentifier];
  v4 = [v3 lowercaseString];
  char v5 = [v4 containsString:@"watch"];

  if (v5) {
    return 1;
  }
  v7 = [(SFPeerDevice *)self modelIdentifier];
  v8 = [v7 lowercaseString];
  char v9 = [v8 containsString:@"iphone"];

  if (v9) {
    return 2;
  }
  v10 = [(SFPeerDevice *)self modelIdentifier];
  v11 = [v10 lowercaseString];
  char v12 = [v11 containsString:@"ipad"];

  if (v12) {
    return 3;
  }
  v13 = [(SFPeerDevice *)self modelIdentifier];
  v14 = [v13 lowercaseString];
  char v15 = [v14 containsString:@"reality"];

  if (v15) {
    return 5;
  }
  v16 = [(SFPeerDevice *)self modelIdentifier];
  v17 = [v16 lowercaseString];
  int v18 = [v17 containsString:@"mac"];

  if (v18) {
    return 4;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAutoUnlockDevice *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      objc_super v6 = [(SFPeerDevice *)self uniqueID];
      v7 = [(SFPeerDevice *)v5 uniqueID];
      int v8 = [v6 isEqual:v7];

      if (v8
        && (BOOL v9 = [(SFAutoUnlockDevice *)self bluetoothCloudPaired],
            v9 == [(SFAutoUnlockDevice *)v5 bluetoothCloudPaired]))
      {
        v11 = [(SFPeerDevice *)self name];
        char v12 = [(SFPeerDevice *)v5 name];
        char v10 = [v11 isEqualToString:v12];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  int v18 = NSString;
  BOOL v3 = [(SFAutoUnlockDevice *)self placeholder];
  v4 = &stru_1EF9BDC68;
  if (v3) {
    v4 = @"[PLACEHOLDER] ";
  }
  v17 = v4;
  char v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  v7 = [(SFPeerDevice *)self uniqueID];
  int v8 = [(SFAutoUnlockDevice *)self bluetoothID];
  BOOL v9 = @"YES";
  if ([(SFAutoUnlockDevice *)self bluetoothCloudPaired]) {
    char v10 = @"YES";
  }
  else {
    char v10 = @"NO";
  }
  v11 = [(SFPeerDevice *)self modelIdentifier];
  char v12 = [(SFPeerDevice *)self name];
  if ([(SFAutoUnlockDevice *)self unlockEnabled]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (![(SFAutoUnlockDevice *)self canUnlockDevice]) {
    BOOL v9 = @"NO";
  }
  v14 = [(SFAutoUnlockDevice *)self modelDescription];
  char v15 = [v18 stringWithFormat:@"<%@%@: %p, uniqueID:%@, bluetooth ID:%@, cloud paired:%@, modelIdentifier:%@, name:%@, unlockEnabled:%@ canUnlockDevice:%@ modelDescription:%@>", v17, v6, self, v7, v8, v10, v11, v12, v13, v9, v14];

  return v15;
}

- (SFAutoUnlockDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFAutoUnlockDevice;
  char v5 = [(SFPeerDevice *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_bluetoothCloudPaired = [v4 decodeBoolForKey:@"cloudPaired"];
    v5->_unlockEnabled = [v4 decodeBoolForKey:@"unlockEnabled"];
    v5->_canUnlockDevice = [v4 decodeBoolForKey:@"canUnlockDevice"];
    v5->_keyExists = [v4 decodeBoolForKey:@"keyExists"];
    v5->_placeholder = [v4 decodeBoolForKey:@"placeholder"];
    v5->_supportsApproveWithWatch = [v4 decodeBoolForKey:@"supportsApproveWithWatch"];
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelDescription"];
    uint64_t v7 = [v6 copy];
    modelDescription = v5->_modelDescription;
    v5->_modelDescription = (NSString *)v7;

    BOOL v9 = [v4 decodeObjectForKey:@"metrics"];
    uint64_t v10 = [v9 copy];
    results = v5->_results;
    v5->_results = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockDevice;
  id v4 = a3;
  [(SFPeerDevice *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_bluetoothCloudPaired, @"cloudPaired", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_unlockEnabled forKey:@"unlockEnabled"];
  [v4 encodeBool:self->_canUnlockDevice forKey:@"canUnlockDevice"];
  [v4 encodeBool:self->_keyExists forKey:@"keyExists"];
  [v4 encodeBool:self->_placeholder forKey:@"placeholder"];
  [v4 encodeBool:self->_supportsApproveWithWatch forKey:@"supportsApproveWithWatch"];
  [v4 encodeObject:self->_modelDescription forKey:@"modelDescription"];
  char v5 = (void *)[(NSDictionary *)self->_results copy];
  [v4 encodeObject:v5 forKey:@"metrics"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (BOOL)keyExists
{
  return self->_keyExists;
}

- (void)setKeyExists:(BOOL)a3
{
  self->_keyExists = a3;
}

- (BOOL)canUnlockDevice
{
  return self->_canUnlockDevice;
}

- (void)setCanUnlockDevice:(BOOL)a3
{
  self->_canUnlockDevice = a3;
}

- (BOOL)bluetoothCloudPaired
{
  return self->_bluetoothCloudPaired;
}

- (void)setBluetoothCloudPaired:(BOOL)a3
{
  self->_bluetoothCloudPaired = a3;
}

- (BOOL)supportsApproveWithWatch
{
  return self->_supportsApproveWithWatch;
}

- (void)setSupportsApproveWithWatch:(BOOL)a3
{
  self->_supportsApproveWithWatch = a3;
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
}

- (NSUUID)proxyBluetoothID
{
  return self->_proxyBluetoothID;
}

- (void)setProxyBluetoothID:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSData)hintToken
{
  return self->_hintToken;
}

- (void)setHintToken:(id)a3
{
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)supportsAlwaysDirect
{
  return self->_supportsAlwaysDirect;
}

- (void)setSupportsAlwaysDirect:(BOOL)a3
{
  self->_supportsAlwaysDirect = a3;
}

- (BOOL)supportsApproveIcon
{
  return self->_supportsApproveIcon;
}

- (void)setSupportsApproveIcon:(BOOL)a3
{
  self->_supportsApproveIcon = a3;
}

- (BOOL)supportsEncryption
{
  return self->_supportsEncryption;
}

- (void)setSupportsEncryption:(BOOL)a3
{
  self->_supportsEncryption = a3;
}

- (BOOL)supportsAdvertisingUnlocked
{
  return self->_supportsAdvertisingUnlocked;
}

- (void)setSupportsAdvertisingUnlocked:(BOOL)a3
{
  self->_supportsAdvertisingUnlocked = a3;
}

- (BOOL)supportsConnectionCache
{
  return self->_supportsConnectionCache;
}

- (void)setSupportsConnectionCache:(BOOL)a3
{
  self->_supportsConnectionCache = a3;
}

- (BOOL)supportsHEIC
{
  return self->_supportsHEIC;
}

- (void)setSupportsHEIC:(BOOL)a3
{
  self->_supportsHEIC = a3;
}

- (int64_t)majorOSVersion
{
  return self->_majorOSVersion;
}

- (void)setMajorOSVersion:(int64_t)a3
{
  self->_majorOSVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintToken, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_proxyBluetoothID, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);

  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end