@interface _TVRCRMSDeviceManager
+ (id)sharedInstance;
- (id)_allRecords;
- (id)pairingGUIDForNetworkName:(id)a3;
- (void)_addOrUpdateRecordInUserDefaults:(id)a3;
- (void)_performWithMutableRecords:(id)a3;
- (void)_removeRecordWithNetworkNameFromUserDefaults:(id)a3;
- (void)addStoredInfoForNetworkName:(id)a3 displayName:(id)a4 pairingGUID:(id)a5;
- (void)removeStoredInfoForNetworkName:(id)a3;
@end

@implementation _TVRCRMSDeviceManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___TVRCRMSDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;

  return v2;
}

- (id)pairingGUIDForNetworkName:(id)a3
{
  id v4 = a3;
  v5 = [(_TVRCRMSDeviceManager *)self _allRecords];
  v6 = [v5 objectForKeyedSubscript:v4];
  if (!v6)
  {
    if ([v4 containsString:@"_"])
    {
      v7 = [v4 componentsSeparatedByString:@"_"];
      v8 = [v7 objectAtIndex:0];
      if (v8)
      {
        v6 = [v5 objectForKeyedSubscript:v8];
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  v9 = [v6 objectForKeyedSubscript:@"pairingGUID"];

  return v9;
}

- (void)addStoredInfoForNetworkName:(id)a3 displayName:(id)a4 pairingGUID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = [v8 UTF8String];
    __int16 v17 = 2080;
    uint64_t v18 = [v9 UTF8String];
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "#LegacyDevice adding stored info for network name %s, display name \"%s\"", buf, 0x16u);
  }

  v13[0] = @"networkName";
  v13[1] = @"displayName";
  v14[0] = v8;
  v14[1] = v9;
  v13[2] = @"pairingGUID";
  v14[2] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  [(_TVRCRMSDeviceManager *)self _addOrUpdateRecordInUserDefaults:v12];
}

- (void)removeStoredInfoForNetworkName:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = _TVRCRMSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = [v4 UTF8String];
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "#LegacyDevice removing stored info for network name %s", (uint8_t *)&v6, 0xCu);
    }

    [(_TVRCRMSDeviceManager *)self _removeRecordWithNetworkNameFromUserDefaults:v4];
  }
}

- (id)_allRecords
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"TVRCStoredLegacyDevices"];

  return v3;
}

- (void)_performWithMutableRecords:(id)a3
{
  uint64_t v8 = (void (**)(id, void *))a3;
  id v4 = [(_TVRCRMSDeviceManager *)self _allRecords];
  v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  }
  v8[2](v8, v5);
  int v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v7 = (void *)[v5 copy];
  [v6 setObject:v7 forKey:@"TVRCStoredLegacyDevices"];
}

- (void)_addOrUpdateRecordInUserDefaults:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58___TVRCRMSDeviceManager__addOrUpdateRecordInUserDefaults___block_invoke;
  v6[3] = &unk_2647AFE98;
  id v7 = v4;
  id v5 = v4;
  [(_TVRCRMSDeviceManager *)self _performWithMutableRecords:v6];
}

- (void)_removeRecordWithNetworkNameFromUserDefaults:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70___TVRCRMSDeviceManager__removeRecordWithNetworkNameFromUserDefaults___block_invoke;
  v6[3] = &unk_2647AFE98;
  id v7 = v4;
  id v5 = v4;
  [(_TVRCRMSDeviceManager *)self _performWithMutableRecords:v6];
}

@end