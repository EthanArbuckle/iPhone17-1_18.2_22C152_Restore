@interface WFKnownNetworksManager
- (BOOL)removeNetworks:(id)a3;
- (CWFInterface)interface;
- (NSArray)allKnownProfiles;
- (WFKnownNetworksManager)initWithInterface:(id)a3;
- (WFPrivateAddressConfigManager)privateAddressConfigManager;
- (id)_getAllKnownProfiles;
- (id)allEditableNetworkProfiles;
- (id)allNonEditableNetworkProfiles;
- (id)passwordForNetworksWithSSID:(id)a3;
- (id)privateAddressConfigForNetworkName:(id)a3;
- (void)setAllKnownProfiles:(id)a3;
- (void)setInterface:(id)a3;
- (void)setPrivateAddressConfigManager:(id)a3;
@end

@implementation WFKnownNetworksManager

- (WFKnownNetworksManager)initWithInterface:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFKnownNetworksManager;
  v6 = [(WFKnownNetworksManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_interface, a3);
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
      interface = v7->_interface;
      v7->_interface = (CWFInterface *)v8;

      [(CWFInterface *)v7->_interface resume];
    }
    v10 = objc_alloc_init(WFPrivateAddressConfigManager);
    privateAddressConfigManager = v7->_privateAddressConfigManager;
    v7->_privateAddressConfigManager = v10;

    if (!v7->_privateAddressConfigManager)
    {
      v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFKnownNetworksManager initWithInterface:]";
        _os_log_impl(&dword_226071000, v12, v13, "%s: failed to create WFPrivateAddressConfigManager", buf, 0xCu);
      }
    }
  }

  return v7;
}

- (id)_getAllKnownProfiles
{
  return (id)[(CWFInterface *)self->_interface knownNetworkProfilesWithProperties:0];
}

- (id)allNonEditableNetworkProfiles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(WFKnownNetworksManager *)self _getAllKnownProfiles];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isProfileBased]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allEditableNetworkProfiles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(WFKnownNetworksManager *)self _getAllKnownProfiles];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 isProfileBased] & 1) == 0
          && [v9 shouldShowInKnownNetworkList])
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)removeNetworks:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    uint64_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = [v3 count];
      _os_log_impl(&dword_226071000, v6, v5, "Trying to forget %lu networks.", buf, 0xCu);
    }
  }
  if (v3)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v29 = v3;
      id v10 = 0;
      uint64_t v11 = *(void *)v34;
      char v12 = 1;
      obj = v7;
      do
      {
        uint64_t v13 = 0;
        long long v14 = v10;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          objc_super v15 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
          if (!v15)
          {
            uint64_t v16 = WFLogForCategory(0);
            os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v16, v17, "Invalid CWFNetworkProfile object.", buf, 2u);
            }
          }
          uint64_t v18 = WFLogForCategory(0);
          os_log_type_t v19 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v18)
          {
            v20 = v18;
            if (os_log_type_enabled(v20, v19))
            {
              v21 = [v15 networkName];
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = (uint64_t)v21;
              _os_log_impl(&dword_226071000, v20, v19, "Trying to forget network: %@", buf, 0xCu);
            }
          }

          interface = self->_interface;
          id v32 = v14;
          [(CWFInterface *)interface removeKnownNetworkProfile:v15 reason:2 error:&v32];
          id v10 = v32;

          if ([v10 code])
          {
            v23 = WFLogForCategory(0);
            os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v23)
            {
              v25 = v23;
              if (os_log_type_enabled(v25, v24))
              {
                v26 = [v15 networkName];
                *(_DWORD *)buf = 138412546;
                uint64_t v38 = (uint64_t)v10;
                __int16 v39 = 2112;
                v40 = v26;
                _os_log_impl(&dword_226071000, v25, v24, "Error:%@ happen when trying to remove network profile for %@", buf, 0x16u);
              }
            }

            char v12 = 0;
          }
          ++v13;
          long long v14 = v10;
        }
        while (v9 != v13);
        uint64_t v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v9);

      id v3 = v29;
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    uint64_t v7 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    char v12 = 0;
    if (WFCurrentLogLevel() && v7)
    {
      if (os_log_type_enabled(v7, v27))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v7, v27, "No networks to delete, return function.", buf, 2u);
      }
      char v12 = 0;
    }
  }

  return v12 & 1;
}

- (id)passwordForNetworksWithSSID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WFKnownNetworksManager *)self _getAllKnownProfiles];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "networkName", (void)v18);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v13 = v10;

    if (!v13) {
      goto LABEL_12;
    }
    long long v14 = [[WFNetworkProfile alloc] initWithCoreWiFiProfile:v13];
    objc_super v15 = [(WFNetworkProfile *)v14 password];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v13 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    objc_super v15 = 0;
    if (WFCurrentLogLevel() && v13)
    {
      if (os_log_type_enabled(v13, v16))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_impl(&dword_226071000, v13, v16, "failed to find password for network '%@'", buf, 0xCu);
      }
      objc_super v15 = 0;
    }
  }

  return v15;
}

- (id)privateAddressConfigForNetworkName:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFKnownNetworksManager *)self privateAddressConfigManager];
  uint64_t v6 = [v5 privateAddressConfig];

  if (!v6)
  {
    objc_super v15 = WFLogForCategory(0);
    os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v15 || !os_log_type_enabled(v15, v23)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v17 = "nil private address configs";
    long long v18 = v15;
    os_log_type_t v19 = v23;
    uint32_t v20 = 2;
LABEL_15:
    _os_log_impl(&dword_226071000, v18, v19, v17, buf, v20);
LABEL_16:

    id v21 = 0;
    goto LABEL_18;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v8)
  {
LABEL_10:

LABEL_11:
    objc_super v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v15 || !os_log_type_enabled(v15, v16)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    os_log_type_t v17 = "nil private address config for network '%@'";
    long long v18 = v15;
    os_log_type_t v19 = v16;
    uint32_t v20 = 12;
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v25;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v25 != v10) {
      objc_enumerationMutation(v7);
    }
    char v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
    uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"SSID_STR", (void)v24);
    char v14 = [v13 isEqualToString:v4];

    if (v14) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v21 = v12;

  if (!v21) {
    goto LABEL_11;
  }
LABEL_18:

  return v21;
}

- (NSArray)allKnownProfiles
{
  return self->_allKnownProfiles;
}

- (void)setAllKnownProfiles:(id)a3
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (WFPrivateAddressConfigManager)privateAddressConfigManager
{
  return self->_privateAddressConfigManager;
}

- (void)setPrivateAddressConfigManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAddressConfigManager, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_allKnownProfiles, 0);
}

@end