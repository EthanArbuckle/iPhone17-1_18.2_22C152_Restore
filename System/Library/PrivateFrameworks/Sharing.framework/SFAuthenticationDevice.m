@interface SFAuthenticationDevice
- (BOOL)bluetoothCloudPaired;
- (BOOL)enabledAsKey;
- (BOOL)enabledAsLock;
- (BOOL)isEqual:(id)a3;
- (NSString)idsDeviceID;
- (NSString)modelDescription;
- (SFAuthenticationDevice)init;
- (SFAuthenticationDevice)initWith:(id)a3;
@end

@implementation SFAuthenticationDevice

- (SFAuthenticationDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAuthenticationDevice;
  v2 = [(SFAuthenticationDevice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    modelDescription = v2->_modelDescription;
    v2->_modelDescription = (NSString *)&stru_1EF9BDC68;
  }
  return v3;
}

- (SFAuthenticationDevice)initWith:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAuthenticationDevice;
  v5 = [(SFAuthenticationDevice *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 modelDescription];
    modelDescription = v5->_modelDescription;
    v5->_modelDescription = (NSString *)v6;

    v5->_enabledAsKey = [v4 unlockEnabled];
    v5->_enabledAsLock = [v4 canUnlockDevice];
    v5->_bluetoothCloudPaired = [v4 bluetoothCloudPaired];
    uint64_t v8 = [v4 uniqueID];
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v8;
  }
  v10 = [v4 uniqueID];
  [(SFPeerDevice *)v5 setUniqueID:v10];

  v11 = [v4 modelIdentifier];
  [(SFPeerDevice *)v5 setModelIdentifier:v11];

  v12 = [v4 productName];
  [(SFPeerDevice *)v5 setProductName:v12];

  v13 = [v4 productVersion];
  [(SFPeerDevice *)v5 setProductVersion:v13];

  v14 = [v4 name];
  [(SFPeerDevice *)v5 setName:v14];

  v15 = [v4 deviceColor];
  [(SFPeerDevice *)v5 setDeviceColor:v15];

  v16 = [v4 enclosureColor];
  [(SFPeerDevice *)v5 setEnclosureColor:v16];

  -[SFPeerDevice setDefaultPairedDevice:](v5, "setDefaultPairedDevice:", [v4 isDefaultPairedDevice]);
  -[SFPeerDevice setValidKey:](v5, "setValidKey:", [v4 validKey]);
  -[SFPeerDevice setKeyCounter:](v5, "setKeyCounter:", [v4 keyCounter]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFAuthenticationDevice *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SFAuthenticationDevice *)self idsDeviceID];
      v7 = [(SFAuthenticationDevice *)v5 idsDeviceID];
      int v8 = [v6 isEqual:v7];

      if (v8
        && (BOOL v9 = [(SFAuthenticationDevice *)self bluetoothCloudPaired],
            v9 == [(SFAuthenticationDevice *)v5 bluetoothCloudPaired]))
      {
        v11 = [(SFPeerDevice *)self name];
        v12 = [(SFPeerDevice *)v5 name];
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

- (NSString)modelDescription
{
  return self->_modelDescription;
}

- (BOOL)enabledAsKey
{
  return self->_enabledAsKey;
}

- (BOOL)enabledAsLock
{
  return self->_enabledAsLock;
}

- (BOOL)bluetoothCloudPaired
{
  return self->_bluetoothCloudPaired;
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceID, 0);

  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end