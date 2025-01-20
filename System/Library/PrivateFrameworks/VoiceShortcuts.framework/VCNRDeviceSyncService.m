@interface VCNRDeviceSyncService
- (BOOL)isEqual:(id)a3;
- (NSString)syncServiceIdentifier;
- (NSURL)directoryURL;
- (VCCompanionSyncService)service;
- (VCNRDeviceSyncService)initWithCompanionSyncService:(id)a3 device:(id)a4;
- (int64_t)protocolVersion;
- (unint64_t)hash;
- (void)requestFullResync;
- (void)requestSync;
@end

@implementation VCNRDeviceSyncService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_syncServiceIdentifier, 0);
}

- (VCCompanionSyncService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (VCCompanionSyncService *)WeakRetained;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSString)syncServiceIdentifier
{
  return self->_syncServiceIdentifier;
}

- (void)requestFullResync
{
  id v2 = [(VCNRDeviceSyncService *)self service];
  [v2 requestFullResync];
}

- (void)requestSync
{
  id v2 = [(VCNRDeviceSyncService *)self service];
  [v2 requestSync];
}

- (unint64_t)hash
{
  v3 = [(VCNRDeviceSyncService *)self service];
  uint64_t v4 = [v3 hash];
  v5 = [(VCNRDeviceSyncService *)self syncServiceIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(VCNRDeviceSyncService *)self directoryURL];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VCNRDeviceSyncService *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(VCNRDeviceSyncService *)self service];
      uint64_t v6 = [(VCNRDeviceSyncService *)v4 service];
      if ([v5 isEqual:v6])
      {
        v7 = [(VCNRDeviceSyncService *)self syncServiceIdentifier];
        unint64_t v8 = [(VCNRDeviceSyncService *)v4 syncServiceIdentifier];
        if ([v7 isEqual:v8])
        {
          v9 = [(VCNRDeviceSyncService *)self directoryURL];
          v10 = [(VCNRDeviceSyncService *)v4 directoryURL];
          if (v9 == v10)
          {
            char v13 = 1;
          }
          else
          {
            v11 = [(VCNRDeviceSyncService *)self directoryURL];
            v12 = [(VCNRDeviceSyncService *)v4 directoryURL];
            char v13 = [v11 isEqual:v12];
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (VCNRDeviceSyncService)initWithCompanionSyncService:(id)a3 device:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"VCNRDeviceSyncService.m", 38, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"VCNRDeviceSyncService.m", 39, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)VCNRDeviceSyncService;
  v10 = [(VCNRDeviceSyncService *)&v33 init];
  if (v10)
  {
    if (objc_opt_class())
    {
      v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E58]];
      v12 = [v11 componentsSeparatedByString:@"."];
      char v13 = [v12 firstObject];
      uint64_t v14 = [v13 integerValue];

      if (v14 > 6)
      {
        uint64_t v15 = 3;
LABEL_12:
        v10->_protocolVersion = v15;
        objc_storeWeak((id *)&v10->_service, v7);
        v22 = NSString;
        v23 = [v9 pairingID];
        v24 = [v23 UUIDString];
        uint64_t v25 = [v22 stringWithFormat:@"CompanionSync-%@", v24];
        syncServiceIdentifier = v10->_syncServiceIdentifier;
        v10->_syncServiceIdentifier = (NSString *)v25;

        v17 = [v9 valueForProperty:*MEMORY[0x1E4F79DD0]];
        if (v17)
        {
          v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:1];
        }
        else
        {
          v27 = 0;
        }
        uint64_t v28 = [v27 URLByAppendingPathComponent:*MEMORY[0x1E4FB4BB8]];
        directoryURL = v10->_directoryURL;
        v10->_directoryURL = (NSURL *)v28;

        if (v17) {
        v16 = v10;
        }
        goto LABEL_21;
      }
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B8CFCCD2-C6BE-441C-B60D-C5036FB9ABC5"];
      char v21 = [v9 supportsCapability:v20];

      if (v21)
      {
        uint64_t v15 = 2;
        goto LABEL_12;
      }
      v17 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[VCNRDeviceSyncService initWithCompanionSyncService:device:]";
        __int16 v36 = 2114;
        v37 = v9;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, "%s Won't sync to device %{public}@ because it does not support shortcuts", buf, 0x16u);
      }
    }
    else
    {
      v17 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_opt_class();
        *(_DWORD *)buf = 136315394;
        v35 = "-[VCNRDeviceSyncService initWithCompanionSyncService:device:]";
        __int16 v36 = 2114;
        v37 = v18;
        id v19 = v18;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, "%s Can't create a %{public}@ because NanoRegistry is not available", buf, 0x16u);
      }
    }
    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

@end