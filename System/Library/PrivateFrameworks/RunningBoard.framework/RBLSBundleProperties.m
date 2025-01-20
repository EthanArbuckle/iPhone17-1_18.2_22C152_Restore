@interface RBLSBundleProperties
- (BOOL)continuousBackgroundMode;
- (BOOL)hasPreferredJetsamBand;
- (BOOL)isExtension;
- (BOOL)supportsBackgroundAudio;
- (BOOL)supportsBackgroundContentFetching;
- (BOOL)supportsBackgroundNetworkAuthentication;
- (BOOL)supportsUnboundedTaskCompletion;
- (BOOL)usesSocketMonitoring;
- (NSDictionary)environmentVariables;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)containerOverrideIdentifier;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)dataContainerURL;
- (id)bundleInfoValuesForKeys:(id)a3;
- (id)proxy;
- (int)platform;
- (int)preferredJetsamBand;
- (uint64_t)initWithApplicationProxy:(uint64_t)a1;
- (uint64_t)initWithBundleProxy:(uint64_t)a1;
- (void)proxy;
@end

@implementation RBLSBundleProperties

- (uint64_t)initWithBundleProxy:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 bundleIdentifier];
      v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v4;

      v6 = [v3 bundleURL];
      uint64_t v7 = [v6 path];
      v8 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v7;

      uint64_t v9 = [v3 canonicalExecutablePath];
      v10 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v9;

      uint64_t v11 = [v3 dataContainerURL];
      v12 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v11;

      uint64_t v13 = [v3 environmentVariables];
      v14 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v13;

      uint64_t v15 = objc_msgSend(v3, "_rb_extensionPointIdentifier");
      v16 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v15;

      uint64_t v17 = *(void *)(a1 + 48);
      *(unsigned char *)(a1 + 15) = v17 != 0;
      if (v17)
      {
        uint64_t v18 = [v3 entitlementValueForKey:@"com.apple.private.security.container-required" ofClass:objc_opt_class()];
        v19 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v18;
      }
    }
  }

  return a1;
}

- (uint64_t)initWithApplicationProxy:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = -[RBLSBundleProperties initWithBundleProxy:](a1, v3);
    if (a1)
    {
      uint64_t v4 = [v3 UIBackgroundModes];
      if ([v4 containsObject:@"fetch"]) {
        char v5 = 1;
      }
      else {
        char v5 = [v4 containsObject:@"remote-notification"];
      }
      *(unsigned char *)(a1 + 9) = v5;
      if ([v4 containsObject:@"voip"]) {
        char v6 = 1;
      }
      else {
        char v6 = [v4 containsObject:@"push-to-talk"];
      }
      *(unsigned char *)(a1 + 13) = v6;
      *(unsigned char *)(a1 + 12) = [v4 containsObject:@"unboundedTaskCompletion"];
      *(unsigned char *)(a1 + 10) = [v4 containsObject:@"network-authentication"];
      *(unsigned char *)(a1 + 11) = [v4 containsObject:@"audio"];
      *(unsigned char *)(a1 + 14) = [v4 containsObject:@"continuous"];
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"SBPreferredPriorityBand", 0);
      v8 = [v3 objectsForInfoDictionaryKeys:v7];
      uint64_t v9 = [v8 stringForKey:@"SBPreferredPriorityBand"];
      if ([v9 isEqualToString:@"PriorityBandSuspended"])
      {
        *(_DWORD *)(a1 + 16) = 0;
      }
      else
      {
        if (![v9 isEqualToString:@"PriorityBandMail"])
        {
          char v10 = 0;
          *(_DWORD *)(a1 + 16) = -1;
          goto LABEL_15;
        }
        *(_DWORD *)(a1 + 16) = 40;
      }
      char v10 = 1;
LABEL_15:
      *(unsigned char *)(a1 + 8) = v10;
    }
  }

  return a1;
}

- (id)proxy
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x263F01888];
    v2 = (void *)(a1 + 32);
    id v3 = [NSURL URLWithString:*(void *)(a1 + 32)];
    id v8 = 0;
    uint64_t v4 = [v1 bundleProxyForURL:v3 error:&v8];
    id v5 = v8;

    if (!v4)
    {
      char v6 = rbs_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        [(RBLSBundleProperties *)v2 proxy];
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = -[RBLSBundleProperties proxy]((uint64_t)self);
    char v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
    uint64_t v7 = [v5 objectsForInfoDictionaryKeys:v6];

    id v8 = [v7 rawValues];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_identifier;
}

- (NSString)bundlePath
{
  return self->_path;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)containerOverrideIdentifier
{
  return self->_containerOverrideIdentifier;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)hasPreferredJetsamBand
{
  return self->_hasPreferredJetsamBand;
}

- (int)preferredJetsamBand
{
  return self->_preferredJetsamBand;
}

- (BOOL)supportsBackgroundContentFetching
{
  return self->_supportsBackgroundContentFetching;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  return self->_supportsBackgroundNetworkAuthentication;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  return self->_supportsUnboundedTaskCompletion;
}

- (BOOL)usesSocketMonitoring
{
  return self->_usesSocketMonitoring;
}

- (BOOL)continuousBackgroundMode
{
  return self->_continuousBackgroundMode;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_containerOverrideIdentifier, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)proxy
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [NSURL URLWithString:*a1];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_226AB3000, a3, OS_LOG_TYPE_FAULT, "LSBundleProxy lookup for %{public}@, failed with %{public}@", (uint8_t *)&v6, 0x16u);
}

@end