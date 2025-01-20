@interface TVRXManagedConfigManager
+ (id)sharedInstance;
- (BOOL)allowedDeviceWithName:(id)a3;
- (BOOL)isManagedConfigProfileInstalled;
- (NSArray)allowedTVs;
- (NSSet)allowedDeviceNames;
- (TVRXManagedConfigManager)init;
- (id)_convertMACAddressesToData:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)refreshState;
- (void)setAllowedDeviceNames:(id)a3;
- (void)setAllowedTVs:(id)a3;
@end

@implementation TVRXManagedConfigManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;

  return v2;
}

uint64_t __42__TVRXManagedConfigManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_5 = objc_alloc_init(TVRXManagedConfigManager);

  return MEMORY[0x270F9A758]();
}

- (TVRXManagedConfigManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)TVRXManagedConfigManager;
  v2 = [(TVRXManagedConfigManager *)&v7 init];
  if (v2)
  {
    v3 = _TVRCMDMLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Adding MCProfileConnection observer", v6, 2u);
    }

    v4 = [MEMORY[0x263F53C50] sharedConnection];
    [v4 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = _TVRCMDMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Removing MCProfileConnection observer", buf, 2u);
  }

  v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TVRXManagedConfigManager;
  [(TVRXManagedConfigManager *)&v5 dealloc];
}

- (BOOL)isManagedConfigProfileInstalled
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"ManagedConfigProfileInstalledKey"];

  v4 = _TVRCMDMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Checking if managed config profile is installed and contains TVRemote specific features: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (BOOL)allowedDeviceWithName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TVRXManagedConfigManager *)self isManagedConfigProfileInstalled])
  {
    objc_super v5 = [(TVRXManagedConfigManager *)self allowedDeviceNames];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = _TVRCMDMLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(TVRXManagedConfigManager *)self allowedDeviceNames];
        *(_DWORD *)buf = 138543362;
        id v19 = v8;
        _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "MDM profile contains allowed devices: %{public}@", buf, 0xCu);
      }
      v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", v4];
      v10 = [(TVRXManagedConfigManager *)self allowedDeviceNames];
      v11 = [v10 filteredSetUsingPredicate:v9];

      uint64_t v12 = [v11 count];
      BOOL v13 = v12 != 0;
      v14 = _TVRCMDMLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v4;
          v16 = "[%{public}@] is allowed";
LABEL_13:
          _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
        }
      }
      else if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v4;
        v16 = "[%{public}@] is NOT allowed";
        goto LABEL_13;
      }

      goto LABEL_15;
    }
  }
  v9 = _TVRCMDMLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TVRXManagedConfigManager allowedDeviceWithName:](v9);
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (void)refreshState
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v3 = _TVRCMDMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing state", (uint8_t *)&v22, 2u);
  }

  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  objc_super v5 = [v4 effectiveValuesForUnionSetting:*MEMORY[0x263F53A78]];

  uint64_t v6 = [v5 count];
  p_super = _TVRCMDMLog();
  BOOL v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v22 = 138543362;
      v23 = v5;
      _os_log_impl(&dword_2266D3000, p_super, OS_LOG_TYPE_DEFAULT, "MDM profile contains MCFeatureTVRemoteAllowedTVs: %{public}@", (uint8_t *)&v22, 0xCu);
    }

    v9 = [(TVRXManagedConfigManager *)self _convertMACAddressesToData:v5];
    p_super = &self->_allowedTVs->super;
    self->_allowedTVs = v9;
  }
  else if (v8)
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_2266D3000, p_super, OS_LOG_TYPE_DEFAULT, "MDM profile does not contain MCFeatureTVRemoteAllowedTVs", (uint8_t *)&v22, 2u);
  }

  v10 = [MEMORY[0x263F53C50] sharedConnection];
  v11 = [v10 effectiveValuesForUnionSetting:*MEMORY[0x263F53A70]];

  uint64_t v12 = [v11 count];
  BOOL v13 = _TVRCMDMLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v22 = 138543362;
      v23 = v11;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "MDM profile contains MCFeatureTVRemoteAllowedTVDeviceNames: %{public}@", (uint8_t *)&v22, 0xCu);
    }

    BOOL v15 = [MEMORY[0x263EFFA08] setWithArray:v11];
    allowedDeviceNames = self->_allowedDeviceNames;
    self->_allowedDeviceNames = v15;

LABEL_16:
    v18 = _TVRCMDMLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Device is managed, posting TVRXManagedConfigManagerTVRemoteAllowedTVAdded", (uint8_t *)&v22, 2u);
    }

    id v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v19 setBool:1 forKey:@"ManagedConfigProfileInstalledKey"];

    uint64_t v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 postNotificationName:@"TVRXManagedConfigManagerTVRemoteAllowedTVAdded" object:0];
    goto LABEL_19;
  }
  if (v14)
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "MDM profile does not contain MCFeatureTVRemoteAllowedTVDeviceNames", (uint8_t *)&v22, 2u);
  }

  v17 = self->_allowedDeviceNames;
  self->_allowedDeviceNames = 0;

  if (v6) {
    goto LABEL_16;
  }
  v21 = _TVRCMDMLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_2266D3000, v21, OS_LOG_TYPE_DEFAULT, "Device is not mananged", (uint8_t *)&v22, 2u);
  }

  uint64_t v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v20 removeObjectForKey:@"ManagedConfigProfileInstalledKey"];
LABEL_19:
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_super v5 = _TVRCMDMLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "MDM profile list did change", v6, 2u);
  }

  [(TVRXManagedConfigManager *)self refreshState];
}

- (id)_convertMACAddressesToData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([v11 UTF8String])
          {
            if (TextToHardwareAddress())
            {
              uint64_t v12 = _TVRCMDMLog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                [(TVRXManagedConfigManager *)&v16 _convertMACAddressesToData:v12];
              }
            }
            else
            {
              uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:buf length:6];
              [v4 addObject:v12];
            }
          }
          else
          {
            uint64_t v12 = _TVRCMDMLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v23 = v11;
              _os_log_error_impl(&dword_2266D3000, v12, OS_LOG_TYPE_ERROR, "MAC address was not a UTF8String: %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          BOOL v13 = _TVRCMDMLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v23 = v10;
            _os_log_error_impl(&dword_2266D3000, v13, OS_LOG_TYPE_ERROR, "MAC address was not a string: %{public}@", buf, 0xCu);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v14;
}

- (NSSet)allowedDeviceNames
{
  return self->_allowedDeviceNames;
}

- (void)setAllowedDeviceNames:(id)a3
{
}

- (NSArray)allowedTVs
{
  return self->_allowedTVs;
}

- (void)setAllowedTVs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTVs, 0);

  objc_storeStrong((id *)&self->_allowedDeviceNames, 0);
}

- (void)allowedDeviceWithName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2266D3000, log, OS_LOG_TYPE_DEBUG, "No specified allowed devices so all will be shown", v1, 2u);
}

- (void)_convertMACAddressesToData:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Error parsing MAC address to 6-byte array", buf, 2u);
}

@end