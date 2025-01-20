@interface _TVRCRapportDeviceManager
- (BOOL)createOrUpdateDeviceImplForLinkDevice:(id)a3;
- (BOOL)removeDeviceImplForLinkDevice:(id)a3;
- (NSMutableDictionary)deviceImplMap;
- (_TVRCRapportDeviceManager)init;
- (id)_identifierForDevice:(id)a3;
- (id)description;
- (id)deviceImplForLinkDevice:(id)a3;
- (void)_checkIfDuplicateNameButDifferentIDSIdentifier:(id)a3 linkDevice:(id)a4;
- (void)setDeviceImplMap:(id)a3;
@end

@implementation _TVRCRapportDeviceManager

- (_TVRCRapportDeviceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRCRapportDeviceManager;
  v2 = [(_TVRCRapportDeviceManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceImplMap = v2->_deviceImplMap;
    v2->_deviceImplMap = v3;
  }
  return v2;
}

- (id)deviceImplForLinkDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_TVRCRapportDeviceManager *)self _identifierForDevice:v4];
  if (!v5
    || ([(_TVRCRapportDeviceManager *)self deviceImplMap],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:v5],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
    v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = [v14 idsIdentifier];
          v16 = [v4 idsDeviceIdentifier];
          int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            v18 = [v14 model];
            v19 = [v4 model];
            char v20 = [v18 isEqualToString:v19];

            if ((v20 & 1) == 0)
            {
              v21 = _TVRCRapportLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
                -[_TVRCRapportDeviceManager deviceImplForLinkDevice:]();
              }
            }
            v22 = _TVRCRapportLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v14;
              __int16 v30 = 2114;
              id v31 = v4;
              _os_log_impl(&dword_2266D3000, v22, OS_LOG_TYPE_DEFAULT, "Found Duplicate record: %{public}@ for device: %{public}@", buf, 0x16u);
            }

            id v7 = v14;
            goto LABEL_19;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v7 = 0;
LABEL_19:
  }

  return v7;
}

- (BOOL)createOrUpdateDeviceImplForLinkDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    v19 = "-[_TVRCRapportDeviceManager createOrUpdateDeviceImplForLinkDevice:]";
    __int16 v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s linkDevice=%@", (uint8_t *)&v18, 0x16u);
  }

  objc_super v6 = [(_TVRCRapportDeviceManager *)self _identifierForDevice:v4];
  uint64_t v7 = [(_TVRCRapportDeviceManager *)self deviceImplForLinkDevice:v4];
  v8 = +[TVRCRPCompanionLinkClientWrapper wrapperWithDevice:v4];
  if (v7)
  {
    [(_TVRCRapportDeviceManager *)self _checkIfDuplicateNameButDifferentIDSIdentifier:v7 linkDevice:v4];
    v9 = (void *)v7;
  }
  else
  {
    v9 = +[TVRCRapportDeviceImpl implWithDevice:v8];
    uint64_t v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
      int v18 = 138543618;
      v19 = v4;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Creating new device impl with device=%{public}@, deviceRecords=%{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v12 = _TVRCRapportLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
    int v18 = 138412290;
    v19 = v13;
    _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Before adding - DeviceImplMap: %@", (uint8_t *)&v18, 0xCu);
  }
  v14 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
  [v14 setObject:v9 forKey:v6];

  v15 = _TVRCRapportLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
    int v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "After adding - DeviceImplMap: %@", (uint8_t *)&v18, 0xCu);
  }
  return v7 == 0;
}

- (BOOL)removeDeviceImplForLinkDevice:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    long long v24 = "-[_TVRCRapportDeviceManager removeDeviceImplForLinkDevice:]";
    __int16 v25 = 2114;
    id v26 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s device=%{public}@", (uint8_t *)&v23, 0x16u);
  }

  objc_super v6 = [(_TVRCRapportDeviceManager *)self _identifierForDevice:v4];
  uint64_t v7 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
  v8 = [v7 objectForKey:v6];

  v9 = _TVRCRapportLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 name];
    uint64_t v11 = [v4 name];
    int v23 = 138412546;
    long long v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Device impl to be removed = %@ for device id = %@", (uint8_t *)&v23, 0x16u);
  }
  if (v8
    && ([v8 name],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v4 name],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 isEqualToString:v13],
        v13,
        v12,
        v14))
  {
    v15 = _TVRCRapportLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
      int v23 = 138412290;
      long long v24 = v16;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Before removing - DeviceImplMap: %@", (uint8_t *)&v23, 0xCu);
    }
    int v17 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
    [v17 removeObjectForKey:v6];

    int v18 = _TVRCRapportLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
      int v23 = 138412290;
      long long v24 = v19;
      _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "After removing - DeviceImplMap: %@", (uint8_t *)&v23, 0xCu);
    }
    __int16 v20 = _TVRCRapportLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      long long v24 = v6;
      _os_log_impl(&dword_2266D3000, v20, OS_LOG_TYPE_DEFAULT, "Removed %{public}@", (uint8_t *)&v23, 0xCu);
    }
    BOOL v21 = 1;
  }
  else
  {
    __int16 v20 = _TVRCRapportLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_TVRCRapportDeviceManager removeDeviceImplForLinkDevice:]((uint64_t)v4, self);
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(_TVRCRapportDeviceManager *)self deviceImplMap];
  id v5 = (id)[v3 appendObject:v4 withName:@"deviceImplMap"];

  objc_super v6 = [v3 build];

  return v6;
}

- (id)_identifierForDevice:(id)a3
{
  return (id)[a3 name];
}

- (void)_checkIfDuplicateNameButDifferentIDSIdentifier:(id)a3 linkDevice:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 deviceWrapper];
  uint64_t v7 = [v6 identifier];
  v8 = [v5 idsDeviceIdentifier];

  LOBYTE(v5) = [v7 isEqualToString:v8];
  if ((v5 & 1) == 0)
  {
    v9 = _TVRCRapportLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_TVRCRapportDeviceManager _checkIfDuplicateNameButDifferentIDSIdentifier:linkDevice:]();
    }
  }
}

- (NSMutableDictionary)deviceImplMap
{
  return self->_deviceImplMap;
}

- (void)setDeviceImplMap:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)deviceImplForLinkDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_2266D3000, v0, OS_LOG_TYPE_FAULT, "Found different device models with same IDS identifiers", v1, 2u);
}

- (void)removeDeviceImplForLinkDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v8 = [a2 deviceImplMap];
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v2, v3, "Asked to remove device we don't already know about, device=%{public}@. devices:%@", v4, v5, v6, v7, 2u);
}

- (void)_checkIfDuplicateNameButDifferentIDSIdentifier:linkDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_2266D3000, v0, OS_LOG_TYPE_FAULT, "Discovered two devices with the same name and different IDS identifiers: <rdar://53121642>", v1, 2u);
}

@end