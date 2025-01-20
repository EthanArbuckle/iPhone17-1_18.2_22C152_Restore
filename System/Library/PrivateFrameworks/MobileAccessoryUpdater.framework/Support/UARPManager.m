@interface UARPManager
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4;
- (UARPAssetManager)assetManager;
- (UARPManager)init;
- (id)copyAssetIDForAccessoryID:(id)a3;
- (id)getAttestationCertificates:(id)a3;
- (id)getSupplementalAssetNameForAccessoryID:(id)a3;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5;
- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4;
- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5;
- (int64_t)checkForUpdate:(id)a3;
- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5;
- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4;
- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4;
- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (int64_t)removeAccessory:(id)a3;
- (int64_t)requestConsent:(id)a3;
- (int64_t)revokeConsentRequest:(id)a3;
- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (void)consumeSandboxExtensionToken:(id)a3 url:(id)a4;
- (void)dealloc;
- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)removeSandboxExtensionWithURL:(id)a3;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)settingsChangedForSerialNumber:(id)a3;
@end

@implementation UARPManager

- (UARPManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)UARPManager;
  v2 = [(UARPManager *)&v4 init];
  if (v2)
  {
    v2->_assetManager = [[UARPAssetManager alloc] initWithDelegate:v2];
    v2->_sandboxExtensions = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPManager;
  [(UARPManager *)&v3 dealloc];
}

- (int64_t)addAccessory:(id)a3 assetID:(id)a4
{
  return [(UARPAssetManager *)self->_assetManager addAccessoryID:a3 assetID:a4];
}

- (int64_t)removeAccessory:(id)a3
{
  return [(UARPAssetManager *)self->_assetManager removeAccessoryID:a3];
}

- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4
{
  return [(UARPAssetManager *)self->_assetManager changeAssetLocation:a3 assetID:a4];
}

- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5
{
  return [(UARPAssetManager *)self->_assetManager downloadFirmwareForAccessory:a3 assetID:a4 userIntent:a5];
}

- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4
{
  return [(UARPAssetManager *)self->_assetManager downloadReleaseNotesForAccessoryID:a3 assetID:a4];
}

- (int64_t)checkForUpdate:(id)a3
{
  return [(UARPAssetManager *)self->_assetManager checkForUpdate:a3];
}

- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return [(UARPAssetManager *)self->_assetManager personalizationVectorForAccessoryID:a3 assetTag:*(void *)&a4 outVector:a5];
}

- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
}

- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  return [(UARPAssetManager *)self->_assetManager updateProperty:a3 value:a4 forAccessory:a5];
}

- (id)copyAssetIDForAccessoryID:(id)a3
{
  return [(UARPAssetManager *)self->_assetManager copyAssetIDForAccessoryID:a3];
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  return [(UARPAssetManager *)self->_assetManager getSupplementalAssetNameForAccessoryID:a3];
}

- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  return [(UARPAssetManager *)self->_assetManager getFetchedSupportedAccessories:a3 forProductGroup:a4];
}

- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  return [(UARPAssetManager *)self->_assetManager getSupportedAccessories:a3 assetID:a4 batchRequest:a5];
}

- (id)getAttestationCertificates:(id)a3
{
  return [(UARPAssetManager *)self->_assetManager getAttestationCertificates:a3];
}

- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  return [(UARPAssetManager *)self->_assetManager getAttestationCertificates:a3 assetID:a4];
}

- (int64_t)requestConsent:(id)a3
{
  return 2;
}

- (int64_t)revokeConsentRequest:(id)a3
{
  return 2;
}

- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  return 2;
}

- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  return 2;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  return 0;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  return 0;
}

- (void)removeSandboxExtensionWithURL:(id)a3
{
}

- (void)consumeSandboxExtensionToken:(id)a3 url:(id)a4
{
  if (a3 && a4)
  {
    if ([(NSMutableDictionary *)self->_sandboxExtensions objectForKeyedSubscript:a4])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = a4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Duplicate Sandbox Extension Token for URL:%@", (uint8_t *)&v7, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_sandboxExtensions setObject:[[UARPSandboxExtension alloc] initWithTokenString:a3] forKeyedSubscript:a4];
  }
}

- (int64_t)addAccessory:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5
{
  -[UARPManager consumeSandboxExtensionToken:url:](self, "consumeSandboxExtensionToken:url:", a5, [a4 remoteURL]);
  return [(UARPManager *)self addAccessory:a3 assetID:a4];
}

- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5
{
  -[UARPManager consumeSandboxExtensionToken:url:](self, "consumeSandboxExtensionToken:url:", a5, [a4 remoteURL]);
  return [(UARPManager *)self changeAssetLocation:a3 assetID:a4];
}

- (void)settingsChangedForSerialNumber:(id)a3
{
}

- (UARPAssetManager)assetManager
{
  return (UARPAssetManager *)objc_getProperty(self, a2, 16, 1);
}

@end