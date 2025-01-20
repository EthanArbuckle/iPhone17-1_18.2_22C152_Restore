@interface IOKRegistryEntry(daemon_iokit_get_property_proxy)
- (id)iodProperties;
- (id)iodPropertyForKey:()daemon_iokit_get_property_proxy;
@end

@implementation IOKRegistryEntry(daemon_iokit_get_property_proxy)

- (id)iodProperties
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (InitIORegistryPropertyProxy_onceToken != -1) {
    dispatch_once(&InitIORegistryPropertyProxy_onceToken, &__block_literal_global_0);
  }
  if (gIORegistryProxyEnabled)
  {
    id v2 = (id)gProxyDaemonServiceClient;
    if (v2)
    {
      v3 = objc_msgSend(v2, "propertiesForRegistryEntryID:", objc_msgSend(a1, "entryID"));
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136316418;
        v6 = "daemonServiceClient != nil";
        __int16 v7 = 2048;
        uint64_t v8 = 0;
        __int16 v9 = 2048;
        uint64_t v10 = 0;
        __int16 v11 = 2080;
        v12 = "";
        __int16 v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/IOKRegistryEntryExtendedFramework.m";
        __int16 v15 = 1024;
        int v16 = 51;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
      }
      v3 = 0;
    }
  }
  else
  {
    v3 = [a1 properties];
  }
  return v3;
}

- (id)iodPropertyForKey:()daemon_iokit_get_property_proxy
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (InitIORegistryPropertyProxy_onceToken != -1) {
    dispatch_once(&InitIORegistryPropertyProxy_onceToken, &__block_literal_global_0);
  }
  if (gIORegistryProxyEnabled)
  {
    id v5 = (id)gProxyDaemonServiceClient;
    if (v5)
    {
      v6 = objc_msgSend(v5, "propertyForRegistryEntryID:key:", objc_msgSend(a1, "entryID"), v4);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136316418;
        __int16 v9 = "daemonServiceClient != nil";
        __int16 v10 = 2048;
        uint64_t v11 = 0;
        __int16 v12 = 2048;
        uint64_t v13 = 0;
        __int16 v14 = 2080;
        __int16 v15 = "";
        __int16 v16 = 2080;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/IOKRegistryEntryExtendedFramework.m";
        __int16 v18 = 1024;
        int v19 = 72;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = [a1 propertyForKey:v4];
  }

  return v6;
}

@end