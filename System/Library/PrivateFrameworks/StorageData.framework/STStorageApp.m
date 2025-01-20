@interface STStorageApp
+ (id)sizeOfPluginKitContainers;
- (BOOL)forceHidden;
- (BOOL)forceVisible;
- (BOOL)isAppClip;
- (BOOL)isApple;
- (BOOL)isDeletable;
- (BOOL)isDeleted;
- (BOOL)isDemotable;
- (BOOL)isDemoted;
- (BOOL)isDocumentApp;
- (BOOL)isInstalled;
- (BOOL)isPseudoApp;
- (BOOL)isSystemApp;
- (BOOL)isUsageApp;
- (BOOL)isUserApp;
- (BOOL)userVisible;
- (FPProviderDomain)fpDomain;
- (LSApplicationRecord)appRecord;
- (NSArray)childApps;
- (NSArray)dataContainers;
- (NSArray)documents;
- (NSArray)mediaTypes;
- (NSArray)sharedContainers;
- (NSDate)lastUsedDate;
- (NSDictionary)infoDict;
- (NSString)appIdentifier;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)parentAppIdentifier;
- (NSString)vendorName;
- (NSString)versionString;
- (PSUsageBundleApp)usageBundle;
- (STContainer)appContainer;
- (STSizeVector)appSize;
- (STSizeVector)appSizesVar;
- (STSizeVector)extSizesVar;
- (STSizeVector)intSizesVar;
- (STSizeVector)internalSizes;
- (STStorageApp)initWithAppRecord:(id)a3;
- (STStorageApp)initWithAppRecord:(id)a3 usageBundle:(id)a4;
- (STStorageApp)initWithBundleIdentifier:(id)a3;
- (STStorageApp)initWithBundleIdentifier:(id)a3 name:(id)a4 vendorName:(id)a5;
- (id)appPath;
- (id)appProxy;
- (id)dataPath;
- (id)externalDataSizeBlock;
- (id)updateAppSizes;
- (int)appKind;
- (int)state;
- (int64_t)appContainerSize;
- (int64_t)assetPurgeableSize;
- (int64_t)coreMLDataSize;
- (int64_t)dataContainerSize;
- (int64_t)dataPurgeableSize;
- (int64_t)docsAndDataSize;
- (int64_t)dynamicSize;
- (int64_t)externalPurgeableSize;
- (int64_t)externalSize;
- (int64_t)sharedContainerSize;
- (int64_t)sharedDataSize;
- (int64_t)sharedPurgeableSize;
- (int64_t)sizeOfMLData;
- (int64_t)staticSize;
- (int64_t)totalSize;
- (void)_postNotify:(id)a3;
- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5;
- (void)notifyAppSizeChanged;
- (void)postNotify:(id)a3;
- (void)refreshAppSizes;
- (void)refreshAppState;
- (void)setAppContainer:(id)a3;
- (void)setAppContainerSize:(int64_t)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppKind:(int)a3;
- (void)setAppRecord:(id)a3;
- (void)setAppSizesVar:(id)a3;
- (void)setAssetPurgeableSize:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setChildApps:(id)a3;
- (void)setCoreMLDataSize:(int64_t)a3;
- (void)setDataContainerSize:(int64_t)a3;
- (void)setDataContainers:(id)a3;
- (void)setDataPurgeableSize:(int64_t)a3;
- (void)setExtSizesVar:(id)a3;
- (void)setExternalDataSizeBlock:(id)a3;
- (void)setExternalPurgeableSize:(int64_t)a3;
- (void)setExternalSize:(int64_t)a3;
- (void)setExternalSizes:(id)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setForceVisible:(BOOL)a3;
- (void)setFpDomain:(id)a3;
- (void)setIntSizesVar:(id)a3;
- (void)setIsPseudoApp:(BOOL)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setMediaTypes:(id)a3;
- (void)setName:(id)a3;
- (void)setParentAppIdentifier:(id)a3;
- (void)setSharedContainerSize:(int64_t)a3;
- (void)setSharedContainers:(id)a3;
- (void)setSharedPurgeableSize:(int64_t)a3;
- (void)setUsageBundle:(id)a3;
- (void)setVendorName:(id)a3;
- (void)setVersionString:(id)a3;
@end

@implementation STStorageApp

- (STStorageApp)initWithAppRecord:(id)a3 usageBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStorageApp;
  v8 = [(STStorageApp *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[STSizeVector zero];
    extSizesVar = v8->_extSizesVar;
    v8->_extSizesVar = (STSizeVector *)v9;

    [(STStorageApp *)v8 setAppRecord:v6];
    objc_storeStrong((id *)&v8->_usageBundle, a4);
  }

  return v8;
}

- (STStorageApp)initWithAppRecord:(id)a3
{
  return [(STStorageApp *)self initWithAppRecord:a3 usageBundle:0];
}

- (STStorageApp)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v27 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v27];
  id v6 = v27;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [v6 code];
    STLog(2, @"%li loading application record for %@", v9, v10, v11, v12, v13, v14, v8);

    id v26 = 0;
    v15 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifierOfSystemPlaceholder:v4 error:&v26];
    id v16 = v26;

    if (v16)
    {
      uint64_t v17 = [v16 code];
      STLog(2, @"%li loading placeholder application record for %@", v18, v19, v20, v21, v22, v23, v17);

      v24 = 0;
    }
    else
    {
      self = [(STStorageApp *)self initWithAppRecord:v15];
      v24 = self;
    }
  }
  else
  {
    self = [(STStorageApp *)self initWithAppRecord:v5];
    v24 = self;
    v15 = v5;
  }

  return v24;
}

- (STStorageApp)initWithBundleIdentifier:(id)a3 name:(id)a4 vendorName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STStorageApp;
  uint64_t v12 = [(STStorageApp *)&v16 init];
  if (v12)
  {
    uint64_t v13 = +[STSizeVector zero];
    extSizesVar = v12->_extSizesVar;
    v12->_extSizesVar = (STSizeVector *)v13;

    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v12->_appIdentifier, a3);
    v12->_appKind = 2;
    objc_storeStrong((id *)&v12->_name, a4);
    objc_storeStrong((id *)&v12->_vendorName, a5);
  }

  return v12;
}

- (LSApplicationRecord)appRecord
{
  if (self->_lsid
    && (v3 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithPersistentIdentifier:self->_lsid]) != 0)
  {
    id v4 = v3;
    v5 = v4;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F01878]);
    bundleIdentifier = self->_bundleIdentifier;
    id v18 = 0;
    v5 = (void *)[v6 initWithBundleIdentifier:bundleIdentifier allowPlaceholder:1 error:&v18];
    id v8 = v18;
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 code];
      STLog(2, @"%li loading application record for %@", v11, v12, v13, v14, v15, v16, v10);
      id v4 = 0;
    }
    else
    {
      id v4 = v5;
    }
  }

  return (LSApplicationRecord *)v4;
}

- (int)state
{
  if (![(STStorageApp *)self isPseudoApp])
  {
    id v4 = [(STStorageApp *)self appRecord];
    v5 = [v4 applicationState];
    if ([v5 isValid])
    {
      if ([v5 isInstalled])
      {
        int v3 = 0;
LABEL_11:

        return v3;
      }
      if ([v5 isDowngraded])
      {
        int v3 = 3;
        goto LABEL_11;
      }
      unint64_t v6 = [v4 installType];
      if (v6 <= 0xA)
      {
        int v3 = dword_21816D928[v6];
        goto LABEL_11;
      }
    }
    int v3 = 5;
    goto LABEL_11;
  }
  return 0;
}

- (id)appProxy
{
  v2 = [(STStorageApp *)self appRecord];
  int v3 = [v2 compatibilityObject];

  return v3;
}

- (void)setAppRecord:(id)a3
{
  id v36 = a3;
  id v4 = [v36 persistentIdentifier];
  lsid = self->_lsid;
  self->_lsid = v4;

  unint64_t v6 = [v36 bundleIdentifier];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;

  objc_storeStrong((id *)&self->_appIdentifier, self->_bundleIdentifier);
  id v8 = [v36 applicationState];
  id v9 = [v36 iTunesMetadata];
  if ([v8 isInstalled] & 1) != 0 || (objc_msgSend(v8, "isPlaceholder"))
  {
    uint64_t v10 = [v36 localizedName];
  }
  else
  {
    uint64_t v10 = [v9 itemName];
  }
  uint64_t v11 = v10;
  if ([v10 length])
  {
    uint64_t v12 = v11;
    name = self->_name;
    self->_name = v12;
  }
  else
  {
    name = [v36 compatibilityObject];
    uint64_t v14 = [name localizedName];
    uint64_t v15 = self->_name;
    self->_name = v14;
  }
  uint64_t v16 = [v9 artistName];
  if ([(STStorageApp *)self isApple]
    && (![v16 length] || objc_msgSend(v16, "isEqualToString:", @"Apple")))
  {
    uint64_t v17 = @"Apple Inc.";

    uint64_t v16 = v17;
  }
  objc_storeStrong((id *)&self->_vendorName, v16);
  id v18 = [(STStorageApp *)self appRecord];
  uint64_t v19 = [v18 shortVersionString];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v19 stringValue];
    }
    else
    {
      uint64_t v20 = &stru_26C925718;
    }

    uint64_t v19 = v20;
  }
  versionString = self->_versionString;
  self->_versionString = (NSString *)v19;
  id v22 = v19;

  if ([v36 isDeletable]) {
    int v23 = [v36 isDeletableSystemApplication];
  }
  else {
    int v23 = 1;
  }
  self->_appKind = v23;
  self->_isPseudoApp = 0;
  v24 = [v36 appClipMetadata];
  self->_isAppClip = v24 != 0;

  int v25 = [v36 supportsOpenInPlace];
  char v26 = 0;
  if (v25) {
    char v26 = [v36 isFileSharingEnabled];
  }
  self->_isDocumentApp = v26;
  id v27 = STPersonaCopyPersonaUniqueStrings();
  v28 = [v36 bundleIdentifier];
  v29 = [v36 linkedParentApplication];
  v30 = [v29 bundleIdentifier];
  parentAppIdentifier = self->_parentAppIdentifier;
  self->_parentAppIdentifier = v30;

  v32 = +[STContainer containerWithIdentifier:v28 containerClass:1 personaUniqueString:0];
  appContainer = self->_appContainer;
  self->_appContainer = v32;

  DataContainersFromAppRecordWithPersonas(v36, v27);
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataContainers = self->_dataContainers;
  self->_dataContainers = v34;
}

- (BOOL)isApple
{
  int v3 = [(STStorageApp *)self appRecord];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 developerType] == 1;
  }
  else {
    BOOL v5 = [(NSString *)self->_bundleIdentifier hasPrefix:@"com.apple."];
  }

  return v5;
}

- (BOOL)isSystemApp
{
  return self->_appKind == 1;
}

- (BOOL)isUserApp
{
  return self->_appKind == 0;
}

- (BOOL)userVisible
{
  if (![(STStorageApp *)self forceVisible])
  {
    if ([(STStorageApp *)self forceHidden]) {
      return 0;
    }
    id v4 = [(STStorageApp *)self name];
    uint64_t v5 = [v4 length];

    if (!v5) {
      return 0;
    }
    unint64_t v6 = [(STStorageApp *)self appRecord];
    id v7 = v6;
    if (!v6) {
      goto LABEL_21;
    }
    id v8 = [v6 applicationState];
    char v9 = [v8 isRestricted];

    if (v9)
    {
      BOOL v3 = 0;
LABEL_17:

      return v3;
    }
    if ([v7 developerType] == 1
      && ([v7 isDeletable] & 1) == 0
      && ([v7 isSystemPlaceholder] & 1) == 0)
    {
LABEL_21:
      if (!self->_usageBundle)
      {
        uint64_t v10 = [(STStorageApp *)self mediaTypes];
        uint64_t v11 = [v10 count];

        if (!v11)
        {
          uint64_t v12 = [(STStorageApp *)self externalSizes];
          int v13 = [v12 isZero];

          if (v13)
          {
            BOOL v3 = [(STStorageApp *)self appKind] == 2;
            goto LABEL_17;
          }
        }
      }
    }
    BOOL v3 = 1;
    goto LABEL_17;
  }
  return 1;
}

- (void)_postNotify:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:v5 object:self->_bundleIdentifier];
}

- (void)postNotify:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__STStorageApp_postNotify___block_invoke;
  v6[3] = &unk_2643050C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __27__STStorageApp_postNotify___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__postNotify_ object:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 performSelector:sel__postNotify_ withObject:v3 afterDelay:0.1];
}

- (BOOL)isDeletable
{
  if (![(NSString *)self->_bundleIdentifier isEqualToString:@"com.apple.Health"])
  {
    id v4 = [(STStorageApp *)self appRecord];
    id v5 = v4;
    if (v4)
    {
      if (([v4 isDeletableSystemApplication] & 1) != 0
        || [v5 isSystemPlaceholder])
      {
        id v6 = [MEMORY[0x263F53C50] sharedConnection];
        char v7 = [v6 isSystemAppRemovalAllowed];
LABEL_7:
        BOOL v3 = v7;

LABEL_11:
        return v3;
      }
      if ([v5 isDeletable])
      {
        id v6 = [MEMORY[0x263F53C50] sharedConnection];
        char v7 = [v6 isAppRemovalAllowed];
        goto LABEL_7;
      }
    }
    BOOL v3 = 0;
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)isDemotable
{
  v2 = [(STStorageApp *)self appRecord];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 appClipMetadata];

    if (!v4)
    {
      if (([v3 isDeletableSystemApplication] & 1) != 0
        || [v3 isSystemPlaceholder])
      {
        char v7 = [MEMORY[0x263F53C50] sharedConnection];
        char v5 = [v7 isSystemAppRemovalAllowed];

        goto LABEL_4;
      }
      if ([v3 isDeletable])
      {
        id v8 = [MEMORY[0x263F53C50] sharedConnection];
        int v9 = [v8 isAppRemovalAllowed];

        if (v9)
        {
          char v5 = [v3 isAppStoreVendable];
          goto LABEL_4;
        }
      }
    }
  }
  char v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)isInstalled
{
  return [(STStorageApp *)self state] == 0;
}

- (BOOL)isDeleted
{
  return [(STStorageApp *)self state] == 5 || [(STStorageApp *)self state] == 7;
}

- (BOOL)isDemoted
{
  v2 = [(STStorageApp *)self appRecord];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 applicationState];
    char v5 = [v4 isPlaceholder];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isUsageApp
{
  return self->_usageBundle != 0;
}

- (BOOL)isDocumentApp
{
  return self->_isDocumentApp;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (id)appPath
{
  v2 = [(STStorageApp *)self appRecord];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 bundleContainerURL];
    char v5 = [v4 path];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)dataPath
{
  v2 = [(STStorageApp *)self appRecord];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 dataContainerURL];
    char v5 = [v4 path];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSArray)documents
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  if (self->_isDocumentApp)
  {
    id v4 = [(STStorageApp *)self dataPath];
    char v5 = [v4 stringByAppendingPathComponent:@"Documents"];

    if ([v5 length])
    {
      id v6 = [MEMORY[0x263F08850] defaultManager];
      char v7 = [NSURL fileURLWithPath:v5 isDirectory:1];
      id v8 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:6 errorHandler:0];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        uint64_t v13 = *MEMORY[0x263EFF6A8];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            id v18 = 0;
            [v15 getResourceValue:&v18 forKey:v13 error:0];
            id v16 = v18;
            if ([v16 BOOLValue])
            {
              if ((unint64_t)[v9 level] >= 4) {
                [v9 skipDescendants];
              }
            }
            else
            {
              [v3 addObject:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }
    }
  }

  return (NSArray *)v3;
}

- (void)notifyAppSizeChanged
{
  [(STStorageApp *)self setAppSizesVar:0];

  [(STStorageApp *)self postNotify:@"com.apple.storage.appinfoChanged"];
}

- (int64_t)coreMLDataSize
{
  return self->_coreMLDataSize;
}

- (void)setCoreMLDataSize:(int64_t)a3
{
}

- (int64_t)assetPurgeableSize
{
  return self->_assetPurgeableSize;
}

- (void)setAssetPurgeableSize:(int64_t)a3
{
}

- (void)setExternalSizes:(id)a3
{
  id v5 = a3;
  id v4 = [(STStorageApp *)self extSizesVar];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    [(STStorageApp *)self setExtSizesVar:v5];
    self->_externalSize = [v5 userTotal];
    self->_externalPurgeableSize = [v5 purgeable];
    [(STStorageApp *)self notifyAppSizeChanged];
  }
}

- (STSizeVector)internalSizes
{
  BOOL v3 = [(STStorageApp *)self intSizesVar];
  if (!v3)
  {
    id v4 = [(STStorageApp *)self updateAppSizes];
    BOOL v3 = [(STStorageApp *)self intSizesVar];
  }

  return (STSizeVector *)v3;
}

- (STSizeVector)appSize
{
  BOOL v3 = [(STStorageApp *)self appSizesVar];
  if (!v3)
  {
    BOOL v3 = [(STStorageApp *)self updateAppSizes];
  }

  return (STSizeVector *)v3;
}

- (int64_t)sizeOfMLData
{
  v2 = [(STStorageApp *)self bundleIdentifier];
  BOOL v3 = +[STStorageCacheDelete sharedMonitor];
  id v4 = [v3 cacheDeleteDict];

  id v5 = [v4 objectForKey:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  id v6 = [v5 objectForKey:@"com.apple.aned.CacheDelete"];
  char v7 = [v6 objectForKey:@"COREML_NON_PURGEABLE_BY_APP"];
  id v8 = [v7 objectForKey:v2];
  int64_t v9 = [v8 longLongValue];

  return v9;
}

- (id)updateAppSizes
{
  v34[1] = *MEMORY[0x263EF8340];
  BOOL v3 = +[STSizeVector zero];
  id v4 = +[STSizeVector zero];
  uint64_t v5 = [(STStorageApp *)self appRecord];
  if (v5)
  {
    id v6 = (void *)v5;
LABEL_3:
    id v7 = 0;
    goto LABEL_6;
  }
  if (![(NSString *)self->_bundleIdentifier length])
  {
    id v6 = 0;
    goto LABEL_3;
  }
  id v8 = objc_alloc(MEMORY[0x263F01878]);
  bundleIdentifier = self->_bundleIdentifier;
  id v33 = 0;
  id v6 = (void *)[v8 initWithBundleIdentifier:bundleIdentifier allowPlaceholder:1 error:&v33];
  id v7 = v33;
LABEL_6:
  uint64_t v10 = [v6 bundleContainerURL];
  v30 = v10;
  if (v10)
  {
    v32 = 0;
    uint64_t v11 = *MEMORY[0x263EFF888];
    id v31 = 0;
    [v10 getResourceValue:&v32 forKey:v11 error:&v31];
    uint64_t v12 = v32;
    id v13 = v31;
    id v14 = v12;

    [v14 BOOLValue];
    id v7 = v13;
  }
  if ([(STStorageApp *)self userVisible])
  {
    if (self->_appContainer)
    {
      v34[0] = self->_appContainer;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
      id v16 = SizesOfContainers(v15);

      BOOL v3 = v15;
    }
    else
    {
      id v16 = +[STSizeVector zero];
    }

    uint64_t v17 = SizesOfContainers(self->_dataContainers);
    BOOL v3 = [v16 plus:v17];

    uint64_t v18 = SizesOfContainers(self->_sharedContainers);

    id v4 = (void *)v18;
  }
  self->_appContainerSize = [v3 fixed];
  self->_dataContainerSize = [v3 dynamic];
  self->_dataPurgeableSize = [v3 purgeable];
  self->_sharedContainerSize = [v4 dynamic];
  self->_sharedPurgeableSize = [v4 purgeable];
  long long v19 = [(STStorageApp *)self extSizesVar];
  self->_externalSize = [v19 dynamic];
  self->_externalPurgeableSize = [v19 purgeable];
  long long v20 = +[STSizeVector fixed:self->_appContainerSize dynamic:self->_sharedContainerSize + self->_dataContainerSize + self->_coreMLDataSize purgeable:self->_sharedPurgeableSize + self->_dataPurgeableSize + self->_assetPurgeableSize];
  long long v21 = [v20 plus:v19];
  [(STStorageApp *)self setIntSizesVar:v20];
  [(STStorageApp *)self setAppSizesVar:v21];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    +[STLaunchDates sharedDates];
    v29 = v3;
    long long v22 = v4;
    int v23 = v6;
    int v25 = v24 = v7;
    char v26 = [(STStorageApp *)self bundleIdentifier];
    id v27 = [v25 launchDateForApp:v26];
    [(STStorageApp *)self setLastUsedDate:v27];

    id v7 = v24;
    id v6 = v23;
    id v4 = v22;
    BOOL v3 = v29;
  }

  return v21;
}

- (void)refreshAppSizes
{
  id v2 = [(STStorageApp *)self updateAppSizes];
}

- (void)refreshAppState
{
  BOOL v3 = self->_lsid;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    bundleIdentifier = self->_bundleIdentifier;
    id v12 = 0;
    id v6 = (void *)[v4 initWithBundleIdentifier:bundleIdentifier allowPlaceholder:1 error:&v12];
    id v7 = v12;
    if (v6)
    {
      id v8 = [v6 persistentIdentifier];
      char v9 = [v8 isEqualToData:v3];

      if ((v9 & 1) == 0)
      {
        [(STStorageApp *)self setAppRecord:v6];
        uint64_t v10 = +[STMSizer sharedAppSizer];
        [v10 reloadAppContainer:self];

        uint64_t v11 = +[STStorageAppsMonitor sharedMonitor];
        [v11 setSortNeeded];
      }
    }
  }
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(STStorageApp *)self refreshAppSizes];
  }
}

- (int64_t)staticSize
{
  id v2 = [(STStorageApp *)self appSize];
  int64_t v3 = [v2 fixed];

  return v3;
}

- (int64_t)docsAndDataSize
{
  id v2 = [(STStorageApp *)self appSize];
  int64_t v3 = [v2 docsAndData];

  return v3;
}

- (int64_t)dynamicSize
{
  id v2 = [(STStorageApp *)self appSize];
  int64_t v3 = [v2 dynamic];

  return v3;
}

- (int64_t)totalSize
{
  id v2 = [(STStorageApp *)self appSize];
  int64_t v3 = [v2 userTotal];

  return v3;
}

- (int64_t)sharedDataSize
{
  return self->_sharedContainerSize;
}

+ (id)sizeOfPluginKitContainers
{
  id v2 = +[STContainer containersWithClass:4 personaUniqueString:0];
  int64_t v3 = SizesOfContainers(v2);

  return v3;
}

- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5
{
  if (a3)
  {
    id v7 = NSNumber;
    id v8 = a5;
    id v9 = a4;
    id v10 = [v7 numberWithLongLong:a3];
    [v9 setObject:v10 forKey:v8];
  }
}

- (NSDictionary)infoDict
{
  int64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  id v4 = [(STStorageApp *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  uint64_t v5 = [(STStorageApp *)self vendorName];
  [v3 setObject:v5 forKeyedSubscript:@"vendor"];

  id v6 = [(STStorageApp *)self bundleIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"id"];

  if (self->_isAppClip) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"is-app-clip"];
  }
  if ([(STStorageApp *)self isDemoted]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"is-placeholder"];
  }
  id v7 = [(STStorageApp *)self lastUsedDate];

  if (v7)
  {
    id v8 = [(STStorageApp *)self lastUsedDate];
    [v3 setObject:v8 forKeyedSubscript:@"last-used"];
  }
  id v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  id v10 = [(STStorageApp *)self internalSizes];
  uint64_t v11 = [(STStorageApp *)self externalSizes];
  id v12 = [v10 plus:v11];
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v12 userTotal], v9, @"total");
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v10 fixed], v9, @"fixed");
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v10 dynamic], v9, @"dynamic");
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v10 purgeable], v9, @"purgeable");
  if (([v11 isZero] & 1) == 0)
  {
    -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v11 dynamic] + objc_msgSend(v11, "fixed"), v9, @"external");
    -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v11 purgeable], v9, @"ext-purgeable");
  }
  [v3 setObject:v9 forKeyedSubscript:@"sizes"];

  return (NSDictionary *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setVendorName:(id)a3
{
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setVersionString:(id)a3
{
}

- (int)appKind
{
  return self->_appKind;
}

- (void)setAppKind:(int)a3
{
  self->_appKind = a3;
}

- (NSDate)lastUsedDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastUsedDate:(id)a3
{
}

- (PSUsageBundleApp)usageBundle
{
  return (PSUsageBundleApp *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUsageBundle:(id)a3
{
}

- (NSArray)mediaTypes
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMediaTypes:(id)a3
{
}

- (FPProviderDomain)fpDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFpDomain:(id)a3
{
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (void)setForceVisible:(BOOL)a3
{
  self->_forceVisible = a3;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (STContainer)appContainer
{
  return (STContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppContainer:(id)a3
{
}

- (NSArray)dataContainers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataContainers:(id)a3
{
}

- (NSArray)sharedContainers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedContainers:(id)a3
{
}

- (NSString)parentAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setParentAppIdentifier:(id)a3
{
}

- (NSArray)childApps
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setChildApps:(id)a3
{
}

- (id)externalDataSizeBlock
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setExternalDataSizeBlock:(id)a3
{
}

- (int64_t)appContainerSize
{
  return self->_appContainerSize;
}

- (void)setAppContainerSize:(int64_t)a3
{
  self->_appContainerSize = a3;
}

- (int64_t)dataContainerSize
{
  return self->_dataContainerSize;
}

- (void)setDataContainerSize:(int64_t)a3
{
  self->_dataContainerSize = a3;
}

- (int64_t)dataPurgeableSize
{
  return self->_dataPurgeableSize;
}

- (void)setDataPurgeableSize:(int64_t)a3
{
  self->_dataPurgeableSize = a3;
}

- (int64_t)sharedContainerSize
{
  return self->_sharedContainerSize;
}

- (void)setSharedContainerSize:(int64_t)a3
{
  self->_sharedContainerSize = a3;
}

- (int64_t)sharedPurgeableSize
{
  return self->_sharedPurgeableSize;
}

- (void)setSharedPurgeableSize:(int64_t)a3
{
  self->_sharedPurgeableSize = a3;
}

- (int64_t)externalSize
{
  return self->_externalSize;
}

- (void)setExternalSize:(int64_t)a3
{
  self->_externalSize = a3;
}

- (int64_t)externalPurgeableSize
{
  return self->_externalPurgeableSize;
}

- (void)setExternalPurgeableSize:(int64_t)a3
{
  self->_externalPurgeableSize = a3;
}

- (BOOL)isPseudoApp
{
  return self->_isPseudoApp;
}

- (void)setIsPseudoApp:(BOOL)a3
{
  self->_isPseudoApp = a3;
}

- (STSizeVector)intSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 224, 1);
}

- (void)setIntSizesVar:(id)a3
{
}

- (STSizeVector)extSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 232, 1);
}

- (void)setExtSizesVar:(id)a3
{
}

- (STSizeVector)appSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppSizesVar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSizesVar, 0);
  objc_storeStrong((id *)&self->_extSizesVar, 0);
  objc_storeStrong((id *)&self->_intSizesVar, 0);
  objc_storeStrong(&self->_externalDataSizeBlock, 0);
  objc_storeStrong((id *)&self->_childApps, 0);
  objc_storeStrong((id *)&self->_parentAppIdentifier, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong((id *)&self->_usageBundle, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_dataContainers, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);

  objc_storeStrong((id *)&self->_lsid, 0);
}

@end