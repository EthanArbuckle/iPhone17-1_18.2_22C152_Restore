@interface WFNetworkListRandomMACManager
- (BOOL)isSSIDinCache:(id)a3;
- (BOOL)shouldEnableRandomMACForSSID:(id)a3;
- (BOOL)shouldResetCache;
- (NSMutableDictionary)cache;
- (WFClient)client;
- (WFNetworkListRandomMACManager)initWithClient:(id)a3;
- (id)cachedRandomMACForSSID:(id)a3;
- (id)newScanRecordWithRandomMACFromScanRecord:(id)a3;
- (void)resetCacheWithCurrentNetworkName:(id)a3;
- (void)setCache:(id)a3;
- (void)setClient:(id)a3;
- (void)setRandomMAC:(id)a3 forNetwork:(id)a4 mode:(unint64_t)a5;
- (void)setShouldResetCache:(BOOL)a3;
@end

@implementation WFNetworkListRandomMACManager

- (WFNetworkListRandomMACManager)initWithClient:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFNetworkListRandomMACManager;
  v5 = [(WFNetworkListRandomMACManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(WFNetworkListRandomMACManager *)v5 setClient:v4];
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(WFNetworkListRandomMACManager *)v6 setCache:v7];

    [(WFNetworkListRandomMACManager *)v6 setShouldResetCache:0];
  }

  return v6;
}

- (void)resetCacheWithCurrentNetworkName:(id)a3
{
  *(void *)&v16[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = WFLogForCategory(8uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    BOOL shouldResetCache = self->_shouldResetCache;
    int v13 = 136315650;
    v14 = "-[WFNetworkListRandomMACManager resetCacheWithCurrentNetworkName:]";
    __int16 v15 = 1024;
    *(_DWORD *)v16 = shouldResetCache;
    v16[2] = 2112;
    *(void *)&v16[3] = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: shouldResetCache=%d currentNetworkName=%@", (uint8_t *)&v13, 0x1Cu);
  }

  if (self->_shouldResetCache)
  {
    if (v4)
    {
      v8 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
      objc_super v9 = [(WFNetworkListRandomMACManager *)self cache];
      [v9 removeAllObjects];

      if (v8)
      {
        v10 = WFLogForCategory(8uLL);
        os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
        {
          int v13 = 136315394;
          v14 = "-[WFNetworkListRandomMACManager resetCacheWithCurrentNetworkName:]";
          __int16 v15 = 2112;
          *(void *)v16 = v4;
          _os_log_impl(&dword_226071000, v10, v11, "%s: leaving current network='%@' in cache", (uint8_t *)&v13, 0x16u);
        }

        v12 = [(WFNetworkListRandomMACManager *)self cache];
        [v12 setObject:v8 forKey:v4];
      }
      self->_BOOL shouldResetCache = 0;
    }
  }
  else
  {
    self->_BOOL shouldResetCache = 1;
  }
}

- (id)newScanRecordWithRandomMACFromScanRecord:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 attributes];
  os_log_type_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [v4 privateAddressMode];
  cache = self->_cache;
  objc_super v9 = [v4 ssid];
  v10 = [(NSMutableDictionary *)cache objectForKey:v9];

  if (v10)
  {
    os_log_type_t v11 = [v10 objectForKey:@"kWFNetworkListRandomMACCacheAddressKey"];
    if (!v11)
    {
      v12 = WFLogForCategory(8uLL);
      os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12)
      {
        v14 = v12;
        if (os_log_type_enabled(v14, v13))
        {
          __int16 v15 = [v4 ssid];
          int v36 = 136315394;
          v37 = "-[WFNetworkListRandomMACManager newScanRecordWithRandomMACFromScanRecord:]";
          __int16 v38 = 2112;
          v39 = v15;
          _os_log_impl(&dword_226071000, v14, v13, "%s: private address not in cache for '%@'", (uint8_t *)&v36, 0x16u);
        }
      }

      v16 = [(WFNetworkListRandomMACManager *)self client];
      v17 = [v4 ssid];
      os_log_type_t v11 = (void *)[v16 newRandomMACAddressForSSID:v17];
    }
    v18 = [v10 objectForKey:@"kWFNetworkListRandomMACCacheStatusKey"];
    uint64_t v7 = (int)[v18 intValue];
  }
  else
  {
    v18 = [(WFNetworkListRandomMACManager *)self client];
    v19 = [v4 ssid];
    os_log_type_t v11 = (void *)[v18 newRandomMACAddressForSSID:v19];
  }
  v20 = WFLogForCategory(8uLL);
  os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v20)
  {
    v22 = v20;
    if (os_log_type_enabled(v22, v21))
    {
      v23 = [v4 ssid];
      int v36 = 136315906;
      v37 = "-[WFNetworkListRandomMACManager newScanRecordWithRandomMACFromScanRecord:]";
      __int16 v38 = 2112;
      v39 = v11;
      __int16 v40 = 2112;
      v41 = v23;
      __int16 v42 = 2048;
      uint64_t v43 = v7;
      _os_log_impl(&dword_226071000, v22, v21, "%s: private address='%@' for '%@' (mode=%lu)", (uint8_t *)&v36, 0x2Au);
    }
  }

  if (v11)
  {
    id v24 = v11;
    v25 = ether_aton((const char *)[v24 UTF8String]);
    if (v25)
    {
      v26 = (const UInt8 *)v25;
      v27 = objc_opt_new();
      CFDataRef v28 = CFDataCreate(0, v26, 6);
      if (v28)
      {
        CFDataRef v29 = v28;
        [v27 setObject:v28 forKey:@"PRIVATE_MAC_ADDRESS_VALUE"];

        v30 = [NSNumber numberWithInt:v7];
        [v27 setObject:v30 forKey:@"PRIVATE_MAC_ADDRESS_TYPE"];

        [v6 setObject:v27 forKey:@"PRIVATE_MAC_ADDRESS"];
      }
    }
    v31 = [v4 ssid];

    if (v31)
    {
      v32 = [v4 ssid];
      [(WFNetworkListRandomMACManager *)self setRandomMAC:v24 forNetwork:v32 mode:v7];
    }
  }
  v33 = (const void *)WiFiNetworkCreate();
  v34 = [[WFNetworkScanRecord alloc] initWithNetworkRef:v33];
  CFRelease(v33);

  return v34;
}

- (void)setRandomMAC:(id)a3 forNetwork:(id)a4 mode:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [(NSMutableDictionary *)self->_cache objectForKey:v9];
    if (!v10) {
      v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v10 setObject:v8 forKey:@"kWFNetworkListRandomMACCacheAddressKey"];
    os_log_type_t v11 = [NSNumber numberWithUnsignedInteger:a5];
    [v10 setObject:v11 forKey:@"kWFNetworkListRandomMACCacheStatusKey"];

    [(NSMutableDictionary *)self->_cache setObject:v10 forKey:v9];
    v12 = WFLogForCategory(8uLL);
    os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      int v15 = 136315906;
      v16 = "-[WFNetworkListRandomMACManager setRandomMAC:forNetwork:mode:]";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      unint64_t v20 = (unint64_t)v9;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      _os_log_impl(&dword_226071000, v12, v13, "%s: caching private address='%@' for '%@' (mode=%lu)", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    v10 = WFLogForCategory(8uLL);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v14))
    {
      int v15 = 136315650;
      v16 = "-[WFNetworkListRandomMACManager setRandomMAC:forNetwork:mode:]";
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2048;
      unint64_t v20 = a5;
      _os_log_impl(&dword_226071000, v10, v14, "%s: unable to cache nil private address for '%@' (mode=%lu)", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (BOOL)isSSIDinCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
  os_log_type_t v6 = WFLogForCategory(8uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v9 = 136315650;
    v10 = "-[WFNetworkListRandomMACManager isSSIDinCache:]";
    __int16 v11 = 1024;
    BOOL v12 = v5 != 0;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_226071000, v6, v7, "%s: cached=%d private address for '%@'", (uint8_t *)&v9, 0x1Cu);
  }

  return v5 != 0;
}

- (BOOL)shouldEnableRandomMACForSSID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
  os_log_type_t v6 = v5;
  if (v5)
  {
    os_log_type_t v7 = [v5 objectForKey:@"kWFNetworkListRandomMACCacheStatusKey"];
    int v8 = [v7 BOOLValue];

    int v9 = WFLogForCategory(8uLL);
    os_log_type_t v10 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
    {
      int v17 = 136315650;
      id v18 = "-[WFNetworkListRandomMACManager shouldEnableRandomMACForSSID:]";
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v11 = "%s: cached value for '%@' enabled=%d";
      BOOL v12 = v9;
      os_log_type_t v13 = v10;
      uint32_t v14 = 28;
LABEL_10:
      _os_log_impl(&dword_226071000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    int v9 = WFLogForCategory(8uLL);
    os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
    LOBYTE(v8) = 1;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v15))
    {
      int v17 = 136315394;
      id v18 = "-[WFNetworkListRandomMACManager shouldEnableRandomMACForSSID:]";
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v11 = "%s: no cached value for '%@'";
      BOOL v12 = v9;
      os_log_type_t v13 = v15;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  return v8;
}

- (id)cachedRandomMACForSSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
  os_log_type_t v6 = v5;
  if (v5)
  {
    os_log_type_t v7 = [v5 objectForKey:@"kWFNetworkListRandomMACCacheAddressKey"];
    if (v7) {
      goto LABEL_13;
    }
    int v8 = WFLogForCategory(8uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      int v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = [(NSMutableDictionary *)self->_cache count];
        int v13 = 136315650;
        uint32_t v14 = "-[WFNetworkListRandomMACManager cachedRandomMACForSSID:]";
        __int16 v15 = 2112;
        id v16 = v4;
        __int16 v17 = 2048;
        uint64_t v18 = v10;
        _os_log_impl(&dword_226071000, v8, v9, "%s: no private address found for '%@' (cached=%lu)", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    int v8 = WFLogForCategory(8uLL);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v11))
    {
      int v13 = 136315394;
      uint32_t v14 = "-[WFNetworkListRandomMACManager cachedRandomMACForSSID:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_226071000, v8, v11, "%s: '%@' does not exist in cache", (uint8_t *)&v13, 0x16u);
    }
  }

  os_log_type_t v7 = 0;
LABEL_13:

  return v7;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)shouldResetCache
{
  return self->_shouldResetCache;
}

- (void)setShouldResetCache:(BOOL)a3
{
  self->_BOOL shouldResetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end