@interface MIPlaceholderConstructor
+ (id)_infoPlistKeysToLoad;
- (BOOL)_constructPlaceholdersForDirectory:(id)a3 itemsWithPathExtension:(id)a4 appendingToArray:(id)a5 bundleType:(unint64_t)a6 error:(id *)a7;
- (BOOL)_copyInfoPlistLoctableToPlaceholder:(id)a3 error:(id *)a4;
- (BOOL)_copyStringsToPlaceholder:(id)a3 onlyDirectories:(BOOL)a4 error:(id *)a5;
- (BOOL)_introspectWithError:(id *)a3;
- (BOOL)_loadInfoPlistContentWithError:(id *)a3;
- (BOOL)_materializeConstructors:(id)a3 intoBundle:(id)a4 error:(id *)a5;
- (BOOL)_populateAppExtensionPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_populateEmbeddedAppClipPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_populateEmbeddedWatchAppPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_transferAndUpdateInstallSessionIDsToPlaceholder:(id)a3 error:(id *)a4;
- (BOOL)_writeIconToPlaceholder:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5;
- (BOOL)_writeInfoPlistToPlaceholder:(id)a3 substitutingIconContent:(id)a4 withError:(id *)a5;
- (BOOL)basicIOSPlaceholderForWatchOSLessThanSix;
- (BOOL)includeAppClipPlaceholders;
- (BOOL)includeWatchAppPlaceholders;
- (BOOL)isLaunchProhibited;
- (BOOL)materializeIntoBundleDirectory:(id)a3 error:(id *)a4;
- (BOOL)performPlaceholderInstallActions;
- (BOOL)preserveFullInfoPlist;
- (MIPlaceholderConstructor)firstNetworkExtension;
- (MIPlaceholderConstructor)initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 error:(id *)a5;
- (NSArray)appExtensionPlaceholderConstructors;
- (NSArray)embeddedAppClipPlaceholderConstructors;
- (NSArray)embeddedWatchAppPlaceholderConstructors;
- (NSData)installSessionUUID;
- (NSData)installUUID;
- (NSDictionary)entitlements;
- (NSDictionary)infoPlistContent;
- (NSString)bundleID;
- (NSURL)bundleURL;
- (id)_entitlementsForPath:(id)a3 error:(id *)a4;
- (id)_initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 forBundleType:(unint64_t)a5 error:(id *)a6;
- (unint64_t)placeholderType;
- (void)setAppExtensionPlaceholderConstructors:(id)a3;
- (void)setBasicIOSPlaceholderForWatchOSLessThanSix:(BOOL)a3;
- (void)setBundleURL:(id)a3;
- (void)setEmbeddedAppClipPlaceholderConstructors:(id)a3;
- (void)setEmbeddedWatchAppPlaceholderConstructors:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setIncludeAppClipPlaceholders:(BOOL)a3;
- (void)setIncludeWatchAppPlaceholders:(BOOL)a3;
- (void)setInfoPlistContent:(id)a3;
- (void)setInstallSessionUUID:(id)a3;
- (void)setInstallUUID:(id)a3;
- (void)setPerformPlaceholderInstallActions:(BOOL)a3;
- (void)setPlaceholderType:(unint64_t)a3;
- (void)setPreserveFullInfoPlist:(BOOL)a3;
@end

@implementation MIPlaceholderConstructor

- (MIPlaceholderConstructor)initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 error:(id *)a5
{
  return (MIPlaceholderConstructor *)[(MIPlaceholderConstructor *)self _initWithSource:a3 byPreservingFullInfoPlist:a4 forBundleType:0 error:a5];
}

- (id)_initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 forBundleType:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MIPlaceholderConstructor;
  v11 = [(MIPlaceholderConstructor *)&v24 init];
  v12 = v11;
  if (!v11)
  {
    id v15 = 0;
    if (!a6) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  [(MIPlaceholderConstructor *)v11 setBundleURL:v10];
  v13 = [v10 pathExtension];
  [(MIPlaceholderConstructor *)v12 setPlaceholderType:a5];
  if (a5 > 4) {
    v14 = 0;
  }
  else {
    v14 = off_1E60C55D0[a5];
  }
  if ([(__CFString *)v14 isEqualToString:v13])
  {
    v16 = (void *)MEMORY[0x1BA9969B0]([(MIPlaceholderConstructor *)v12 setPreserveFullInfoPlist:v8]);
    id v23 = 0;
    BOOL v17 = [(MIPlaceholderConstructor *)v12 _introspectWithError:&v23];
    id v15 = v23;
    if (!v17)
    {

      v12 = 0;
    }
  }
  else
  {

    v18 = (void *)*MEMORY[0x1E4F6F548];
    if (a5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown PlaceholderBundleType value %lu", a5);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E60C55F8[a5];
    }
    v22 = [v10 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _initWithSource:byPreservingFullInfoPlist:forBundleType:error:]", 122, v18, 4, 0, 0, @"The provided placeholder type of %@ does not match the path extension for the bundle at %@", v20, (uint64_t)v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }

  if (a6)
  {
LABEL_16:
    if (!v12) {
      *a6 = v15;
    }
  }
LABEL_18:

  return v12;
}

- (NSString)bundleID
{
  v2 = [(MIPlaceholderConstructor *)self infoPlistContent];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (MIPlaceholderConstructor)firstNetworkExtension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(MIPlaceholderConstructor *)self appExtensionPlaceholderConstructors];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "entitlements", (void)v10);
        BOOL v8 = MICopyNetworkExtensionEntitlement(v7);

        if (v8)
        {
          id v3 = v6;

          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (MIPlaceholderConstructor *)v3;
}

- (BOOL)isLaunchProhibited
{
  id v2 = [(MIPlaceholderConstructor *)self infoPlistContent];
  id v3 = [v2 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"];
  char v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (id)_entitlementsForPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFDictionaryRef information = 0;
  SecStaticCodeRef staticCode = 0;
  if (SecStaticCodeCreateWithPath((CFURLRef)v5, 0, &staticCode))
  {
    v6 = (void *)*MEMORY[0x1E4F6F548];
    v7 = [v5 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]", 180, v6, 13, 0, 0, @"Failed to construct SecStaticCode for %@ : %d", v8, (uint64_t)v7);
    long long v11 = LABEL_5:;
    CFDictionaryRef v12 = 0;
    long long v13 = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (SecCodeCopySigningInformation(staticCode, 4u, &information))
  {
    v9 = (void *)*MEMORY[0x1E4F6F548];
    v7 = [v5 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]", 186, v9, 13, 0, 0, @"SecCodeCopySigningInformation for %@ returned error %d", v10, (uint64_t)v7);
    goto LABEL_5;
  }
  CFDictionaryRef v12 = information;
  CFDictionaryRef information = 0;
  uint64_t v15 = [(__CFDictionary *)v12 objectForKeyedSubscript:*MEMORY[0x1E4F3B9B0]];
  if (v15)
  {
    v7 = v15;
    long long v13 = (void *)[v15 copy];
    long long v11 = 0;
    goto LABEL_6;
  }
  long long v11 = 0;
  long long v13 = (void *)MEMORY[0x1E4F1CC08];
LABEL_7:
  if (information)
  {
    CFRelease(information);
    CFDictionaryRef information = 0;
  }
  if (staticCode)
  {
    CFRelease(staticCode);
    SecStaticCodeRef staticCode = 0;
  }
  if (a4 && !v13) {
    *a4 = v11;
  }

  return v13;
}

+ (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1) {
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)_infoPlistKeysToLoad_keysSet;
  return v2;
}

uint64_t __48__MIPlaceholderConstructor__infoPlistKeysToLoad__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1CFF8], *MEMORY[0x1E4F1CFF0], *MEMORY[0x1E4F1CC70], *MEMORY[0x1E4F1D020], *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CC48], @"MinimumOSVersion", @"LSApplicationLaunchProhibited", @"NSExtension", @"EXAppExtensionAttributes", @"UIRequiredDeviceCapabilities", @"SBAppTags", @"LSCounterpartIdentifiers", @"SBIconMasqueradeIdentifier", @"WKCompanionAppBundleIdentifier", @"WKWatchOnly", @"WKRunsIndependentlyOfCompanionApp",
    @"NSApplicationRequiresArcade",
  uint64_t v0 = 0);
  uint64_t v1 = _infoPlistKeysToLoad_keysSet;
  _infoPlistKeysToLoad_keysSet = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)_loadInfoPlistContentWithError:(id *)a3
{
  id v5 = [(MIPlaceholderConstructor *)self bundleURL];
  if ([(MIPlaceholderConstructor *)self preserveFullInfoPlist]
    || ([(id)objc_opt_class() _infoPlistKeysToLoad], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = MILoadRawInfoPlist();
    id v9 = 0;
    uint64_t v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = MILoadInfoPlistWithError();
    id v9 = 0;
  }

  if (v8)
  {
    if ([v8 count])
    {
      uint64_t v10 = (void *)[v8 copy];
      [(MIPlaceholderConstructor *)self setInfoPlistContent:v10];

      BOOL v11 = 1;
      goto LABEL_13;
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F6F548];
    long long v13 = [v5 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]", 272, v15, 4, 0, 0, @"Found no keys in Info.plist in bundle at %@", v16, (uint64_t)v13);
  }
  else
  {
    CFDictionaryRef v12 = (void *)*MEMORY[0x1E4F6F548];
    long long v13 = [v5 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]", 267, v12, 4, v9, 0, @"Failed to load Info.plist from %@", v14, (uint64_t)v13);
  BOOL v17 = };

  if (a3)
  {
    id v9 = v17;
    BOOL v11 = 0;
    *a3 = v9;
  }
  else
  {
    BOOL v11 = 0;
    id v9 = v17;
  }
LABEL_13:

  return v11;
}

- (BOOL)_constructPlaceholdersForDirectory:(id)a3 itemsWithPathExtension:(id)a4 appendingToArray:(id)a5 bundleType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  uint64_t v15 = [MEMORY[0x1E4F6F5B8] defaultManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke;
  v22[3] = &unk_1E60C5588;
  id v16 = v13;
  id v23 = v16;
  objc_super v24 = self;
  v26 = &v28;
  unint64_t v27 = a6;
  id v17 = v14;
  id v25 = v17;
  v18 = [v15 enumerateURLsForItemsInDirectoryAtURL:v12 ignoreSymlinks:1 withBlock:v22];

  v19 = (void *)v29[5];
  if (v19)
  {
    id v20 = v19;

    v18 = v20;
  }
  if (a7 && v18) {
    *a7 = v18;
  }

  _Block_object_dispose(&v28, 8);
  return v18 == 0;
}

BOOL __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 4
    && ([v5 pathExtension],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*(void *)(a1 + 32)],
        v7,
        v8))
  {
    id v9 = objc_alloc((Class)objc_opt_class());
    uint64_t v10 = [*(id *)(a1 + 40) preserveFullInfoPlist];
    uint64_t v11 = *(void *)(a1 + 64);
    id v17 = 0;
    id v12 = (void *)[v9 _initWithSource:v6 byPreservingFullInfoPlist:v10 forBundleType:v11 error:&v17];
    id v13 = v17;
    id v14 = v17;
    BOOL v15 = v12 != 0;
    if (v12) {
      [*(id *)(a1 + 48) addObject:v12];
    }
    else {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_populateAppExtensionPlaceholderConstructorsWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F6F5B8] defaultManager];
  uint64_t v6 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [&unk_1F0DCF1B8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v22 = a3;
    id v9 = 0;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(&unk_1F0DCF1B8);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "unsignedIntegerValue", v22);
        id v13 = [(MIPlaceholderConstructor *)self bundleURL];
        id v14 = v13;
        if ((unint64_t)(v12 - 1) > 3) {
          BOOL v15 = 0;
        }
        else {
          BOOL v15 = off_1E60C5620[v12 - 1];
        }
        id v16 = [v13 URLByAppendingPathComponent:v15 isDirectory:1];

        if (([v5 itemDoesNotExistOrIsNotDirectoryAtURL:v16] & 1) == 0)
        {
          id v23 = v9;
          BOOL v17 = [(MIPlaceholderConstructor *)self _constructPlaceholdersForDirectory:v16 itemsWithPathExtension:@"appex" appendingToArray:v6 bundleType:v12 error:&v23];
          id v18 = v23;

          if (!v17)
          {

            if (v22)
            {
              id v18 = v18;
              BOOL v19 = 0;
              id *v22 = v18;
            }
            else
            {
              BOOL v19 = 0;
            }
            goto LABEL_20;
          }
          id v9 = v18;
        }
      }
      uint64_t v8 = [&unk_1F0DCF1B8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v20 = (void *)[v6 copy];
  [(MIPlaceholderConstructor *)self setAppExtensionPlaceholderConstructors:v20];

  BOOL v19 = 1;
  id v18 = v9;
LABEL_20:

  return v19;
}

- (BOOL)_populateEmbeddedWatchAppPlaceholderConstructorsWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F6F5B8] defaultManager];
  if ([(MIPlaceholderConstructor *)self placeholderType])
  {
    id v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
LABEL_6:
    BOOL v13 = 1;
    goto LABEL_7;
  }
  uint64_t v8 = objc_opt_new();
  id v9 = [(MIPlaceholderConstructor *)self bundleURL];
  uint64_t v7 = [v9 URLByAppendingPathComponent:@"Watch" isDirectory:1];

  id v6 = 0;
  if (![v5 itemIsDirectoryAtURL:v7 error:0]
    || (id v15 = 0,
        BOOL v10 = [(MIPlaceholderConstructor *)self _constructPlaceholdersForDirectory:v7 itemsWithPathExtension:@"app" appendingToArray:v8 bundleType:3 error:&v15], v11 = v15, v6 = v11, v10))
  {
    uint64_t v12 = (void *)[v8 copy];
    [(MIPlaceholderConstructor *)self setEmbeddedWatchAppPlaceholderConstructors:v12];

    goto LABEL_6;
  }
  if (a3)
  {
    id v6 = v11;
    BOOL v13 = 0;
    *a3 = v6;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_7:

  return v13;
}

- (BOOL)_populateEmbeddedAppClipPlaceholderConstructorsWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F6F5B8] defaultManager];
  if ([(MIPlaceholderConstructor *)self placeholderType])
  {
    id v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  uint64_t v8 = objc_opt_new();
  id v9 = [(MIPlaceholderConstructor *)self bundleURL];
  uint64_t v7 = [v9 URLByAppendingPathComponent:@"AppClips" isDirectory:1];

  if (![v5 itemExistsAtURL:v7])
  {
    id v6 = 0;
    goto LABEL_8;
  }
  id v15 = 0;
  BOOL v10 = [(MIPlaceholderConstructor *)self _constructPlaceholdersForDirectory:v7 itemsWithPathExtension:@"app" appendingToArray:v8 bundleType:4 error:&v15];
  id v11 = v15;
  id v6 = v11;
  if (v10)
  {
LABEL_8:
    BOOL v13 = (void *)[v8 copy];
    [(MIPlaceholderConstructor *)self setEmbeddedAppClipPlaceholderConstructors:v13];

    goto LABEL_9;
  }
  if (a3)
  {
    id v6 = v11;
    BOOL v12 = 0;
    *a3 = v6;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_10:

  return v12;
}

- (BOOL)_introspectWithError:(id *)a3
{
  id v18 = 0;
  BOOL v5 = [(MIPlaceholderConstructor *)self _loadInfoPlistContentWithError:&v18];
  id v6 = v18;
  if (v5)
  {
    uint64_t v7 = [(MIPlaceholderConstructor *)self bundleURL];
    id v17 = v6;
    uint64_t v8 = [(MIPlaceholderConstructor *)self _entitlementsForPath:v7 error:&v17];
    id v9 = v17;

    if (!v8) {
      goto LABEL_9;
    }
    [(MIPlaceholderConstructor *)self setEntitlements:v8];
    id v16 = v9;
    BOOL v10 = [(MIPlaceholderConstructor *)self _populateAppExtensionPlaceholderConstructorsWithError:&v16];
    id v6 = v16;

    if (!v10)
    {
      BOOL v12 = 0;
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    id v15 = v6;
    BOOL v11 = [(MIPlaceholderConstructor *)self _populateEmbeddedWatchAppPlaceholderConstructorsWithError:&v15];
    id v9 = v15;

    if (v11)
    {
      id v14 = v9;
      BOOL v12 = [(MIPlaceholderConstructor *)self _populateEmbeddedAppClipPlaceholderConstructorsWithError:&v14];
      id v6 = v14;

      if (!a3) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_9:
      BOOL v12 = 0;
      id v6 = v9;
      if (!a3) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    BOOL v12 = 0;
    uint64_t v8 = 0;
    if (!a3) {
      goto LABEL_14;
    }
  }
LABEL_12:
  if (!v12) {
    *a3 = v6;
  }
LABEL_14:

  return v12;
}

- (void)setPerformPlaceholderInstallActions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_performPlaceholderInstallActions = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v4 = [(MIPlaceholderConstructor *)self appExtensionPlaceholderConstructors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPerformPlaceholderInstallActions:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setInstallUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_installUUID, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(MIPlaceholderConstructor *)self appExtensionPlaceholderConstructors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setInstallUUID:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setInstallSessionUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_installSessionUUID, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(MIPlaceholderConstructor *)self appExtensionPlaceholderConstructors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setInstallSessionUUID:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_writeInfoPlistToPlaceholder:(id)a3 substitutingIconContent:(id)a4 withError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MIPlaceholderConstructor *)self infoPlistContent];
  long long v11 = [v8 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  long long v12 = (void *)[v10 mutableCopy];
  [v12 setObject:@"Executable" forKeyedSubscript:*MEMORY[0x1E4F1CFF0]];
  if (MEMORY[0x1E4F6F1B8])
  {
    long long v26 = a5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v13 = IFTopLevelAppBundlePlistKeys();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    a5 = v26;
    if (v9) {
      [v12 addEntriesFromDictionary:v9];
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
  if ([(MIPlaceholderConstructor *)self performPlaceholderInstallActions])
  {
    id v18 = MICopyCurrentBuildVersion();
    [v12 setObject:v18 forKeyedSubscript:@"CF_MIEmergencyOffloadVersion"];
  }
  id v27 = 0;
  char v19 = objc_msgSend(v12, "MI_writeToURL:format:options:error:", v11, 200, 0x10000000, &v27);
  id v20 = v27;
  if ((v19 & 1) == 0)
  {
    v21 = (void *)*MEMORY[0x1E4F6F548];
    v22 = [v11 path];
    long long v24 = _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _writeInfoPlistToPlaceholder:substitutingIconContent:withError:]", 560, v21, 4, v20, 0, @"Failed to write Info.plist file to %@", v23, (uint64_t)v22);

    if (a5)
    {
      id v20 = v24;
      *a5 = v20;
    }
    else
    {
      id v20 = v24;
    }
  }

  return v19;
}

- (BOOL)_copyStringsToPlaceholder:(id)a3 onlyDirectories:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__1;
  long long v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  id v9 = [(MIPlaceholderConstructor *)self bundleURL];
  uint64_t v10 = [MEMORY[0x1E4F6F5B8] defaultManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke;
  v20[3] = &unk_1E60C55B0;
  id v11 = v8;
  id v21 = v11;
  id v12 = v10;
  id v22 = v12;
  uint64_t v23 = &v25;
  BOOL v24 = a4;
  long long v13 = [v12 enumerateURLsForItemsInDirectoryAtURL:v9 ignoreSymlinks:1 withBlock:v20];
  uint64_t v15 = v13;
  if (!v26[5])
  {
    if (!v13)
    {
      BOOL v16 = 1;
      goto LABEL_8;
    }
    uint64_t v17 = _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]", 621, (void *)*MEMORY[0x1E4F6F548], 4, v13, 0, @"Encountered error while enumerating %@ to copy strings", v14, (uint64_t)v9);
    id v18 = (void *)v26[5];
    v26[5] = v17;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v16 = 0;
  *a5 = (id) v26[5];
LABEL_8:

  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 4)
  {
    uint64_t v7 = [v5 pathExtension];
    int v8 = [v7 isEqualToString:@"lproj"];

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v6 lastPathComponent];
      id v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:1];

      id v12 = *(void **)(a1 + 40);
      id v28 = 0;
      LOBYTE(v10) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:0 mode:493 error:&v28];
      id v14 = v28;
      if (v10)
      {
        if (*(unsigned char *)(a1 + 56))
        {
          uint64_t v15 = 1;
LABEL_10:

          goto LABEL_11;
        }
        id v18 = [v6 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
        if (([*(id *)(a1 + 40) itemDoesNotExistAtURL:v18] & 1) == 0)
        {
          id v21 = [v11 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
          id v22 = *(void **)(a1 + 40);
          id v27 = v14;
          uint64_t v15 = [v22 copyItemAtURL:v18 toURL:v21 error:&v27];
          id v19 = v27;

          if ((v15 & 1) == 0)
          {
            uint64_t v24 = _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke", 609, (void *)*MEMORY[0x1E4F6F548], 4, v19, 0, @"Failed to copy InfoPlist.strings from \"%@\" to \"%@\"", v23, (uint64_t)v18);
            uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
            long long v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;
          }
          goto LABEL_9;
        }
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v16 = _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke", 592, (void *)*MEMORY[0x1E4F6F548], 4, v14, 0, @"Failed to create destination lproj directory at \"%@\"", v13, (uint64_t)v11);
        uint64_t v15 = 0;
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;
      }
      id v19 = v14;
LABEL_9:

      id v14 = v19;
      goto LABEL_10;
    }
  }
  uint64_t v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_copyInfoPlistLoctableToPlaceholder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIPlaceholderConstructor *)self bundleURL];
  int v8 = [v7 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];

  id v9 = [v6 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];

  uint64_t v10 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v15 = 0;
  char v11 = [v10 copyItemAtURL:v8 toURL:v9 error:&v15];
  id v12 = v15;
  uint64_t v13 = v12;
  if (a4 && (v11 & 1) == 0) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_writeIconToPlaceholder:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(MIPlaceholderConstructor *)self bundleURL];
  if (!MEMORY[0x1E4F6F1B0])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v13 = 0;
    id v11 = 0;
LABEL_12:
    if (!a4)
    {
LABEL_14:
      BOOL v14 = 1;
      goto LABEL_15;
    }
LABEL_13:
    id v11 = v11;
    *a4 = v11;
    goto LABEL_14;
  }
  char v10 = IFCaptureIconContent();
  id v11 = 0;
  id v12 = 0;
  id v13 = v12;
  if (v10)
  {
    if (![v11 count] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
    {
      uint64_t v16 = [v9 path];
      MOLogWrite();

      if (!a4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v18 = [v9 path];
      MOLogWrite();
    }
    id v13 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v17 = [v9 path];
    MOLogWrite();
  }
  if (a5)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a5 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)_transferAndUpdateInstallSessionIDsToPlaceholder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v8 = [(MIPlaceholderConstructor *)self installSessionUUID];
  uint64_t v9 = [(MIPlaceholderConstructor *)self installUUID];
  char v10 = (void *)v9;
  if (v8)
  {
    id v11 = 0;
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v14 = [(MIPlaceholderConstructor *)self infoPlistContent];
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF0]];

  if (!v15)
  {
    id v18 = (void *)*MEMORY[0x1E4F6F548];
    id v19 = [(MIPlaceholderConstructor *)self bundleURL];
    id v20 = [v19 path];
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _transferAndUpdateInstallSessionIDsToPlaceholder:error:]", 720, v18, 4, 0, 0, @"Failed to get CFBundleExecutable key from Info.plist of %@", v21, (uint64_t)v20);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = 0;
    goto LABEL_15;
  }
  uint64_t v16 = [(MIPlaceholderConstructor *)self bundleURL];
  id v13 = [v16 URLByAppendingPathComponent:v15 isDirectory:0];

  id v27 = 0;
  id v8 = [v7 dataForExtendedAttributeNamed:@"com.apple.install_session_uuid" length:16 fromURL:v13 error:&v27];
  id v17 = v27;
  id v11 = v17;
  if (v8) {
    goto LABEL_8;
  }
  id v22 = [v17 domain];
  if (![v22 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_15;
  }
  uint64_t v23 = [v11 code];

  if (v23 != 93)
  {
LABEL_15:

    LOBYTE(v12) = 0;
    id v8 = 0;
    goto LABEL_16;
  }
  id v8 = _UUIDData();

  id v11 = 0;
LABEL_8:
  [(MIPlaceholderConstructor *)self setInstallSessionUUID:v8];

  if (!v10)
  {
LABEL_3:
    char v10 = _UUIDData();
    [(MIPlaceholderConstructor *)self setInstallUUID:v10];
  }
LABEL_4:
  id v26 = v11;
  int v12 = [v7 setData:v8 forExtendedAttributeNamed:@"com.apple.install_session_uuid" onURL:v6 error:&v26];
  id v13 = v26;

  if (v12)
  {
    id v25 = v13;
    LOBYTE(v12) = [v7 setData:v10 forExtendedAttributeNamed:@"com.apple.install_uuid" onURL:v6 error:&v25];
    id v11 = v25;
LABEL_16:

    id v13 = v11;
  }
  if (a4 && (v12 & 1) == 0) {
    *a4 = v13;
  }

  return v12;
}

- (BOOL)_materializeConstructors:(id)a3 intoBundle:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  long long v29 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v8 = objc_opt_new();
  if (v7 && [v7 count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v25 = a5;
      id v11 = 0;
      uint64_t v28 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v14 = [v13 placeholderType];
          if ((unint64_t)(v14 - 1) >= 4)
          {
            _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]", 785, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"Unknown placeholder type %lu", v15, v14);
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            id v17 = v11;
            goto LABEL_23;
          }
          uint64_t v16 = off_1E60C5620[v14 - 1];
          id v17 = [v30 URLByAppendingPathComponent:v16 isDirectory:1];
          if ([v8 containsObject:v16])
          {
            id v18 = v11;
          }
          else
          {
            id v32 = v11;
            int v19 = [v29 createDirectoryAtURL:v17 withIntermediateDirectories:0 mode:493 error:&v32];
            id v18 = v32;

            if (!v19) {
              goto LABEL_23;
            }
            [v8 addObject:v16];
          }
          id v20 = [v13 bundleURL];
          uint64_t v21 = [v20 lastPathComponent];
          id v22 = [v17 URLByAppendingPathComponent:v21 isDirectory:1];

          id v31 = v18;
          LODWORD(v20) = [v13 materializeIntoBundleDirectory:v22 error:&v31];
          id v11 = v31;

          if (!v20)
          {
            id v18 = v11;
LABEL_23:

            id v7 = v26;
            if (v25)
            {
              id v18 = v18;
              BOOL v23 = 0;
              *id v25 = v18;
            }
            else
            {
              BOOL v23 = 0;
            }
            goto LABEL_18;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }

    BOOL v23 = 1;
    id v18 = v11;
    id v7 = v26;
  }
  else
  {
    id v18 = 0;
    BOOL v23 = 1;
  }
LABEL_18:

  return v23;
}

- (BOOL)materializeIntoBundleDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v50 = 0;
  int v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 class:4 error:&v50];
  id v9 = v50;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v16 = 0;
    id v13 = v9;
LABEL_14:
    id v20 = 0;
    goto LABEL_15;
  }
  id v11 = [(MIPlaceholderConstructor *)self entitlements];
  id v49 = v10;
  int v12 = MIWritePlaceholderEntitlements(v6, v11, (uint64_t)&v49);
  id v13 = v49;

  if (!v12)
  {
    id v16 = 0;
    goto LABEL_14;
  }
  id v48 = 0;
  BOOL v14 = [(MIPlaceholderConstructor *)self _copyInfoPlistLoctableToPlaceholder:v6 error:&v48];
  id v15 = v48;
  id v16 = v15;
  if (v14) {
    goto LABEL_4;
  }
  long long v29 = [v15 domain];
  if (([v29 isEqualToString:*MEMORY[0x1E4F28798]] & 1) == 0)
  {

LABEL_29:
    id v16 = v16;

    id v20 = 0;
    id v13 = v16;
    goto LABEL_15;
  }
  uint64_t v30 = [v16 code];

  if (v30 != 2) {
    goto LABEL_29;
  }
LABEL_4:
  id v47 = v13;
  BOOL v17 = [(MIPlaceholderConstructor *)self _copyStringsToPlaceholder:v6 onlyDirectories:v14 error:&v47];
  id v18 = v47;

  if (!v17)
  {
    id v20 = 0;
    goto LABEL_27;
  }
  id v45 = v18;
  id v46 = 0;
  BOOL v19 = [(MIPlaceholderConstructor *)self _writeIconToPlaceholder:v6 infoPlistIconContent:&v46 error:&v45];
  id v20 = v46;
  id v21 = v45;

  if (!v19)
  {
    id v13 = v21;
    goto LABEL_15;
  }
  id v44 = v21;
  BOOL v22 = [(MIPlaceholderConstructor *)self _writeInfoPlistToPlaceholder:v6 substitutingIconContent:v20 withError:&v44];
  id v13 = v44;

  if (!v22) {
    goto LABEL_15;
  }
  if ([(MIPlaceholderConstructor *)self performPlaceholderInstallActions])
  {
    id v43 = v13;
    BOOL v23 = [(MIPlaceholderConstructor *)self _transferAndUpdateInstallSessionIDsToPlaceholder:v6 error:&v43];
    id v18 = v43;

    if (v23)
    {
      id v42 = v18;
      int v24 = [v7 markBundleAsPlaceholder:v6 withError:&v42];
      id v13 = v42;

      if (!v24) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }
LABEL_27:
    id v13 = v18;
    goto LABEL_15;
  }
LABEL_10:
  if ([(MIPlaceholderConstructor *)self basicIOSPlaceholderForWatchOSLessThanSix])
  {
LABEL_11:
    BOOL v25 = 1;
    goto LABEL_22;
  }
  id v31 = [(MIPlaceholderConstructor *)self appExtensionPlaceholderConstructors];
  id v41 = v13;
  BOOL v32 = [(MIPlaceholderConstructor *)self _materializeConstructors:v31 intoBundle:v6 error:&v41];
  id v18 = v41;

  if (!v32) {
    goto LABEL_27;
  }
  if (![(MIPlaceholderConstructor *)self includeWatchAppPlaceholders])
  {
    id v13 = v18;
LABEL_36:
    if (![(MIPlaceholderConstructor *)self includeAppClipPlaceholders]) {
      goto LABEL_11;
    }
    long long v35 = [(MIPlaceholderConstructor *)self embeddedAppClipPlaceholderConstructors];
    id v39 = v13;
    BOOL v36 = [(MIPlaceholderConstructor *)self _materializeConstructors:v35 intoBundle:v6 error:&v39];
    id v18 = v39;

    if (v36)
    {
      BOOL v25 = 1;
      id v13 = v18;
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  long long v33 = [(MIPlaceholderConstructor *)self embeddedWatchAppPlaceholderConstructors];
  id v40 = v18;
  BOOL v34 = [(MIPlaceholderConstructor *)self _materializeConstructors:v33 intoBundle:v6 error:&v40];
  id v13 = v40;

  if (v34) {
    goto LABEL_36;
  }
LABEL_15:
  id v38 = 0;
  char v26 = [v7 removeItemAtURL:v6 error:&v38];
  id v27 = v38;
  if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v37 = [v6 path];
    MOLogWrite();
  }
  if (a4)
  {
    id v13 = v13;
    BOOL v25 = 0;
    *a4 = v13;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_22:

  return v25;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (BOOL)performPlaceholderInstallActions
{
  return self->_performPlaceholderInstallActions;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (BOOL)includeWatchAppPlaceholders
{
  return self->_includeWatchAppPlaceholders;
}

- (void)setIncludeWatchAppPlaceholders:(BOOL)a3
{
  self->_includeWatchAppPlaceholders = a3;
}

- (BOOL)includeAppClipPlaceholders
{
  return self->_includeAppClipPlaceholders;
}

- (void)setIncludeAppClipPlaceholders:(BOOL)a3
{
  self->_includeAppClipPlaceholders = a3;
}

- (BOOL)basicIOSPlaceholderForWatchOSLessThanSix
{
  return self->_basicIOSPlaceholderForWatchOSLessThanSix;
}

- (void)setBasicIOSPlaceholderForWatchOSLessThanSix:(BOOL)a3
{
  self->_basicIOSPlaceholderForWatchOSLessThanSix = a3;
}

- (NSArray)appExtensionPlaceholderConstructors
{
  return self->_appExtensionPlaceholderConstructors;
}

- (void)setAppExtensionPlaceholderConstructors:(id)a3
{
}

- (NSArray)embeddedWatchAppPlaceholderConstructors
{
  return self->_embeddedWatchAppPlaceholderConstructors;
}

- (void)setEmbeddedWatchAppPlaceholderConstructors:(id)a3
{
}

- (NSArray)embeddedAppClipPlaceholderConstructors
{
  return self->_embeddedAppClipPlaceholderConstructors;
}

- (void)setEmbeddedAppClipPlaceholderConstructors:(id)a3
{
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (NSDictionary)infoPlistContent
{
  return self->_infoPlistContent;
}

- (void)setInfoPlistContent:(id)a3
{
}

- (NSData)installUUID
{
  return self->_installUUID;
}

- (NSData)installSessionUUID
{
  return self->_installSessionUUID;
}

- (BOOL)preserveFullInfoPlist
{
  return self->_preserveFullInfoPlist;
}

- (void)setPreserveFullInfoPlist:(BOOL)a3
{
  self->_preserveFullInfoPlist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installSessionUUID, 0);
  objc_storeStrong((id *)&self->_installUUID, 0);
  objc_storeStrong((id *)&self->_infoPlistContent, 0);
  objc_storeStrong((id *)&self->_embeddedAppClipPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_embeddedWatchAppPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_appExtensionPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end