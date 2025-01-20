@interface NTKCompanion3rdPartyApp
+ (BOOL)_isValidApplication:(id)a3;
+ (BOOL)_isValidComplicationsInformation:(id)a3;
+ (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4;
+ (id)_urlsToGalleryBundleInApplicationWithContainerBundleId:(id)a3;
+ (id)companion3rdPartyRemoteApp:(id)a3 device:(id)a4;
- (BOOL)_installStateFromAppConduitInstallState:(int64_t)a3;
- (BOOL)applicationHasBeenUpdated:(id)a3;
- (BOOL)galleryBundlesLoaded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (NRDevice)device;
- (NSArray)supportedFamilies;
- (NSString)complicationClientIdentifier;
- (NSString)uniqueID;
- (NSURL)urlToComplicationBundle;
- (NSURL)urlToWatchKitBundle;
- (id)_initWithDevice:(id)a3 remoteApplication:(id)a4 galleryBundles:(id)a5 watchKitBundle:(id)a6;
- (id)_initWithWatchAppId:(id)a3 containerAppId:(id)a4 complicationClientId:(id)a5;
- (id)appRegistrationDate;
- (id)complication;
- (id)localizedNameForRemoteApp:(id)a3;
- (unint64_t)hash;
- (void)install;
- (void)setComplicationClientIdentifier:(id)a3;
- (void)setDevice:(id)a3;
- (void)setGalleryBundlesLoaded:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setSupportedFamilies:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUrlToComplicationBundle:(id)a3;
- (void)setUrlToWatchKitBundle:(id)a3;
@end

@implementation NTKCompanion3rdPartyApp

+ (id)companion3rdPartyRemoteApp:(id)a3 device:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isValidApplication:v6])
  {
    v8 = [v6 companionAppBundleID];
    id v24 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v24];
    id v10 = v24;
    if (!v9)
    {
      v11 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.4();
      }
    }
    v12 = [v9 applicationState];
    int v13 = [v12 isValid];

    if (v13)
    {
      v14 = [v9 URL];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 URLByAppendingPathComponent:@"Watch" isDirectory:1];
        v17 = [a1 _URLOfFirstItemWithExtension:@"app" inDirectory:v16];
        v18 = v17;
        if (v17)
        {
          v19 = [v17 URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
          v20 = [a1 _URLOfFirstItemWithExtension:@"appex" inDirectory:v19];
          if (!v20)
          {
            log = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v9;
              _os_log_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_INFO, "%@ contains an extensionless watch app", buf, 0xCu);
            }
          }
        }
        else
        {
          v19 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:]();
          }
          v20 = 0;
        }
      }
      else
      {
        v16 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:]();
        }
        v20 = 0;
      }
    }
    else
    {
      v15 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:]();
      }
      v20 = 0;
    }

    id v21 = [[NTKCompanion3rdPartyApp alloc] _initWithDevice:v7 remoteApplication:v6 galleryBundles:0 watchKitBundle:v20];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)_initWithDevice:(id)a3 remoteApplication:(id)a4 galleryBundles:(id)a5 watchKitBundle:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 bundleIdentifier];
  v15 = [v11 companionAppBundleID];
  v16 = [v11 watchKitAppExtensionBundleID];
  id v17 = [(NTKCompanion3rdPartyApp *)self _initWithWatchAppId:v14 containerAppId:v15 complicationClientId:v16];
  if (v17)
  {
    v37 = v15;
    v38 = v14;
    id v40 = v10;
    v18 = [v10 nrDevice];
    [v17 setDevice:v18];

    v19 = NSString;
    v20 = [v11 databaseUUID];
    id v21 = [v20 UUIDString];
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "sequenceNumber"));
    v23 = [v22 stringValue];
    id v24 = [v19 stringWithFormat:@"%@-%@", v21, v23];
    [v17 setUniqueID:v24];

    objc_msgSend(v17, "setInstalled:", objc_msgSend(v17, "_installStateFromAppConduitInstallState:", 2));
    id v39 = v12;
    v25 = [v12 firstObject];
    [v17 setUrlToComplicationBundle:v25];

    [v17 setUrlToWatchKitBundle:v13];
    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v27 = [v11 supportedComplicationFamilies];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          if (CLKComplicationFamilyFromString())
          {
            v32 = [NSNumber numberWithInteger:0];
            [v26 addObject:v32];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v29);
    }

    if ([v26 count]) {
      [v17 setSupportedFamilies:v26];
    }
    v33 = [v17 name];
    uint64_t v34 = [v33 length];

    id v10 = v40;
    if (!v34)
    {
      v35 = [v17 localizedNameForRemoteApp:v11];
      [v17 setName:v35];
    }
    id v12 = v39;
    v15 = v37;
    v14 = v38;
  }

  return v17;
}

- (id)localizedNameForRemoteApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F1CC48];
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F1CC48]];
  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v7 = [v3 localizedInfoPlistStringsForKeys:v5 fetchingFirstMatchingLocalizationInList:v6];

  if (v7)
  {
    v8 = [v7 objectForKey:v4];
  }
  else
  {
    v8 = 0;
  }
  if (![v8 length])
  {
    uint64_t v9 = [v3 applicationName];

    v8 = (void *)v9;
  }

  return v8;
}

- (id)_initWithWatchAppId:(id)a3 containerAppId:(id)a4 complicationClientId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKCompanion3rdPartyApp;
  id v11 = [(NTKCompanion3rdPartyApp *)&v24 init];
  id v12 = v11;
  if (v11)
  {
    [(NTKCompanionApp *)v11 setWatchApplicationIdentifier:v8];
    [(NTKCompanionApp *)v12 setContainerApplicationIdentifier:v9];
    [(NTKCompanion3rdPartyApp *)v12 setComplicationClientIdentifier:v10];
    id v13 = [(NTKCompanionApp *)v12 containerApplicationIdentifier];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F223C8]);
      v15 = [(NTKCompanionApp *)v12 containerApplicationIdentifier];
      id v23 = 0;
      v16 = (void *)[v14 initWithBundleIdentifier:v15 allowPlaceholder:1 error:&v23];
      id v17 = v23;

      if (v16)
      {
        v18 = [v16 localizedName];
        [(NTKCompanionApp *)v12 setName:v18];

        v19 = [(NTKCompanionApp *)v12 name];
        uint64_t v20 = [v19 length];

        if (v20)
        {
LABEL_9:

          goto LABEL_10;
        }
        id v21 = [v16 localizedShortName];
        [(NTKCompanionApp *)v12 setName:v21];
      }
      else
      {
        id v21 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:](v12);
        }
      }

      goto LABEL_9;
    }
  }
LABEL_10:

  return v12;
}

- (NSURL)urlToComplicationBundle
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_galleryBundlesLoaded && !v2->_urlToComplicationBundle)
  {
    id v3 = [(NTKCompanionApp *)v2 containerApplicationIdentifier];
    uint64_t v4 = +[NTKCompanion3rdPartyApp _urlsToGalleryBundleInApplicationWithContainerBundleId:v3];

    uint64_t v5 = [v4 firstObject];
    urlToComplicationBundle = v2->_urlToComplicationBundle;
    v2->_urlToComplicationBundle = (NSURL *)v5;

    v2->_galleryBundlesLoaded = 1;
  }
  objc_sync_exit(v2);

  id v7 = v2->_urlToComplicationBundle;

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(NTKCompanionApp *)self watchApplicationIdentifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NTKCompanionApp *)self containerApplicationIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(NTKCompanionApp *)self watchApplicationIdentifier];
    id v7 = [v5 watchApplicationIdentifier];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(NTKCompanionApp *)self containerApplicationIdentifier];
      id v9 = [v5 containerApplicationIdentifier];
      char v10 = [v8 isEqualToString:v9];
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

  return v10;
}

- (id)appRegistrationDate
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(NTKCompanionApp *)self containerApplicationIdentifier];
  id v10 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v10];
  id v6 = v10;

  if (v5)
  {
    id v7 = [v5 registrationDate];
  }
  else
  {
    id v8 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:](self);
    }

    id v7 = 0;
  }

  return v7;
}

- (BOOL)applicationHasBeenUpdated:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanion3rdPartyApp *)self isEqual:v4])
  {
    id v5 = [(NTKCompanion3rdPartyApp *)self uniqueID];
    id v6 = [v4 uniqueID];
    char v7 = [v5 isEqualToString:v6];

    char v8 = v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)complication
{
  return +[NTKCompanionRemoteComplication complicationWithApp:self];
}

- (NSArray)supportedFamilies
{
  id v3 = self->_supportedFamilies;
  if (!v3)
  {
    id v4 = [(NTKCompanion3rdPartyApp *)self urlToComplicationBundle];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x1E4F28B50];
      id v6 = [(NTKCompanion3rdPartyApp *)self urlToComplicationBundle];
      char v7 = [v5 bundleWithURL:v6];

      char v8 = +[NTKComplicationBundleHelper supportedComplicationFamiliesForBundle:v7];
      [(NTKCompanion3rdPartyApp *)self setSupportedFamilies:v8];
    }
  }

  return v3;
}

- (void)install
{
  id v3 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  id v4 = [(NTKCompanionApp *)self watchApplicationIdentifier];
  id v5 = [(NTKCompanion3rdPartyApp *)self device];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NTKCompanion3rdPartyApp_install__block_invoke;
  v7[3] = &unk_1E62C35D0;
  v7[4] = self;
  [v3 installApplication:v4 onPairedDevice:v5 completion:v7];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"NTKCompanion3rdPartyAppInstallStartedNotification" object:self];
}

void __34__NTKCompanion3rdPartyApp_install__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __34__NTKCompanion3rdPartyApp_install__block_invoke_cold_1(a1);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setInstalled:", objc_msgSend(*(id *)(a1 + 32), "_installStateFromAppConduitInstallState:", a2));
}

+ (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v23 = 0;
  char v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:5 error:&v23];
  id v9 = v23;

  if (v8)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      id v18 = v9;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 pathExtension];
          char v16 = [v15 isEqualToString:v5];

          if (v16)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_12:
      id v9 = v18;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)_isValidApplication:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 length];
  if (!v5)
  {
    id v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[NTKCompanion3rdPartyApp _isValidApplication:]();
    }
  }
  return v5 != 0;
}

+ (BOOL)_isValidComplicationsInformation:(id)a3
{
  uint64_t v3 = [a3 count];
  if (!v3)
  {
    id v4 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[NTKCompanion3rdPartyApp _isValidComplicationsInformation:](v4);
    }
  }
  return v3 != 0;
}

- (BOOL)_installStateFromAppConduitInstallState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)_urlsToGalleryBundleInApplicationWithContainerBundleId:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v31 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v31];
  id v6 = v31;
  if (!v5)
  {
    char v7 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.4();
    }
  }
  char v8 = [v5 applicationState];
  int v9 = [v8 isInstalled];

  if (v9)
  {
    id v24 = v6;
    id v25 = v3;
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 URL];
    v22 = id v30 = 0;
    id v23 = v10;
    id v11 = objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
    id v21 = v30;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v18 = [v17 path];
          int v19 = [v18 hasSuffix:@".ckcomplication"];

          if (v19) {
            [v4 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v14);
    }

    id v6 = v24;
    id v3 = v25;
  }

  return v4;
}

- (NSString)complicationClientIdentifier
{
  return self->_complicationClientIdentifier;
}

- (void)setComplicationClientIdentifier:(id)a3
{
}

- (void)setUrlToComplicationBundle:(id)a3
{
}

- (NSURL)urlToWatchKitBundle
{
  return self->_urlToWatchKitBundle;
}

- (void)setUrlToWatchKitBundle:(id)a3
{
}

- (void)setSupportedFamilies:(id)a3
{
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)galleryBundlesLoaded
{
  return self->_galleryBundlesLoaded;
}

- (void)setGalleryBundlesLoaded:(BOOL)a3
{
  self->_galleryBundlesLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_urlToWatchKitBundle, 0);
  objc_storeStrong((id *)&self->_urlToComplicationBundle, 0);

  objc_storeStrong((id *)&self->_complicationClientIdentifier, 0);
}

+ (void)companion3rdPartyRemoteApp:device:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error. Missing bundleURL from application proxy: %@", v2, v3, v4, v5, v6);
}

+ (void)companion3rdPartyRemoteApp:device:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error. Missing .app from directory: %@", v2, v3, v4, v5, v6);
}

+ (void)companion3rdPartyRemoteApp:device:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error. Missing application proxy for identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)companion3rdPartyRemoteApp:device:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "App record missing for ID %@ - %@");
}

- (void)_initWithWatchAppId:(void *)a1 containerAppId:complicationClientId:.cold.1(void *a1)
{
  os_log_t v1 = [a1 containerApplicationIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "App record missing for ID %@ - %@", v4, v5, v6, v7, v8);
}

void __34__NTKCompanion3rdPartyApp_install__block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) watchApplicationIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Installation failed for %@. Error: %@", v4, v5, v6, v7, v8);
}

+ (void)_isValidApplication:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error. Missing watch application identifier in application description: %@", v2, v3, v4, v5, v6);
}

+ (void)_isValidComplicationsInformation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Error. The watch application is missing the list of complication families it supports", v1, 2u);
}

@end