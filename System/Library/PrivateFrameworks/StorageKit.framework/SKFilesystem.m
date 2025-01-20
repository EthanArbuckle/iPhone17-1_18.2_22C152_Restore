@interface SKFilesystem
+ (BOOL)_shouldShowFilesystemWithType:(id)a3 key:(id)a4 personality:(id)a5;
+ (NSArray)allFilesystems;
+ (NSArray)extensionFilesystems;
+ (NSArray)installedFilesystems;
+ (NSMutableDictionary)cachedFilesystems;
+ (NSMutableDictionary)extensionFilesystemsMapping;
+ (NSMutableDictionary)installedFilesystemsMapping;
+ (id)_skfilesystemTypeWithPersonality:(id)a3;
+ (id)buildSpecialFilesystems;
+ (id)collectFilesystemsWithPersonalityMapping:(id)a3;
+ (id)fileSystems3rdPartyWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5;
+ (id)fileSystemsAPFSWithPersonalityKey:(id)a3 bundle:(id)a4;
+ (id)fileSystemsHFSWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5;
+ (id)filesystemFor:(id)a3;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5 isExtension:(BOOL)a6;
+ (id)filesystemsFromBundle:(id)a3;
+ (id)filesystemsWithBundle:(id)a3 filesystemPersonality:(id)a4 userVisibleName:(id)a5;
+ (id)getExtensionFilesystems;
+ (void)setCachedFilesystems:(id)a3;
- (BOOL)defaultEffaceable;
- (BOOL)isCaseSensitive;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExtensionInsensitiveEqual:(id)a3;
- (BOOL)isJournaled;
- (BOOL)isValidName:(id)a3 error:(id *)a4;
- (BOOL)shouldShow;
- (NSBundle)bundle;
- (NSString)contentMask;
- (NSString)dmPersonality;
- (NSString)formatArgs;
- (NSString)liveVerificationArgs;
- (NSString)localizedKey;
- (NSString)localizedName;
- (NSString)majorType;
- (NSString)repairArgs;
- (NSString)type;
- (NSString)unlocalizedEncryptedName;
- (NSString)unlocalizedName;
- (NSString)verificationArgs;
- (NSString)xmlOutputArg;
- (NSURL)formatExecutable;
- (NSURL)repairExecutable;
- (NSURL)verificationExecutable;
- (SKFilesystem)initWithDictionaryRepresentation:(id)a3;
- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 caseSensitive:(BOOL)a7 encrypted:(BOOL)a8 personalityKey:(id)a9 sortPriority:(int)a10;
- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 encrypted:(BOOL)a7 personalityKey:(id)a8 sortPriority:(int)a9;
- (SKFilesystem)initWithSpecialFilesystem:(id)a3 majorType:(id)a4 localizedName:(id)a5;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initEncryptedFSWithUnencryptedFS:(id)a3 localizedName:(id)a4 sortPriority:(int)a5;
- (int)sortPriority;
- (unint64_t)minimumSize;
- (void)setContentMask:(id)a3;
- (void)setDefaultEffaceable:(BOOL)a3;
- (void)setDmPersonality:(id)a3;
- (void)setIsCaseSensitive:(BOOL)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setIsJournaled:(BOOL)a3;
- (void)setLocalizedKey:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMajorType:(id)a3;
- (void)setMinimumSize:(unint64_t)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)setSortPriority:(int)a3;
- (void)setType:(id)a3;
- (void)setUnlocalizedEncryptedName:(id)a3;
- (void)setUnlocalizedName:(id)a3;
@end

@implementation SKFilesystem

+ (NSArray)allFilesystems
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SKFilesystem_allFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allFilesystems_onceToken != -1) {
    dispatch_once(&allFilesystems_onceToken, block);
  }
  v2 = (void *)_allFilesystems;

  return (NSArray *)v2;
}

void __30__SKFilesystem_allFilesystems__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) installedFilesystems];
  v3 = [*(id *)(a1 + 32) extensionFilesystems];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];
  v5 = (void *)[v4 mutableCopy];

  [v5 sortWithOptions:16 usingComparator:&__block_literal_global_2];
  v6 = (void *)_allFilesystems;
  _allFilesystems = (uint64_t)v5;
}

uint64_t __30__SKFilesystem_allFilesystems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (NSMutableDictionary)extensionFilesystemsMapping
{
  v2 = [a1 installedFilesystems];
  objc_sync_enter(v2);
  if (_extensionFilesystemsMapping && [(id)_extensionFilesystemsMapping count])
  {
    id v3 = (id)_extensionFilesystemsMapping;
    objc_sync_exit(v2);
  }
  else
  {
    uint64_t v4 = +[SKFilesystem getExtensionFilesystems];
    id v5 = (void *)_extensionFilesystemsMapping;
    _extensionFilesystemsMapping = v4;

    objc_sync_exit(v2);
    id v3 = (id)_extensionFilesystemsMapping;
  }

  return (NSMutableDictionary *)v3;
}

+ (NSArray)extensionFilesystems
{
  id v3 = [a1 installedFilesystems];
  objc_sync_enter(v3);
  if (_extensionFilesystems && [(id)_extensionFilesystems count])
  {
    id v4 = (id)_extensionFilesystems;
    objc_sync_exit(v3);
  }
  else
  {
    id v5 = [a1 extensionFilesystemsMapping];
    uint64_t v6 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:v5];
    uint64_t v7 = (void *)_extensionFilesystems;
    _extensionFilesystems = v6;

    objc_sync_exit(v3);
    id v4 = (id)_extensionFilesystems;
  }

  return (NSArray *)v4;
}

+ (NSMutableDictionary)installedFilesystemsMapping
{
  if (installedFilesystemsMapping_onceToken != -1) {
    dispatch_once(&installedFilesystemsMapping_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)_installedFilesystemsMapping;

  return (NSMutableDictionary *)v2;
}

void __43__SKFilesystem_installedFilesystemsMapping__block_invoke()
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  id v1 = [MEMORY[0x263EFF980] array];
  CFURLRef v2 = [NSURL fileURLWithPath:@"/System/Library/Filesystems"];
  CFArrayRef BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(0, v2, @"fs");
  if (BundlesFromDirectory)
  {
    CFArrayRef v4 = BundlesFromDirectory;
    if (CFArrayGetCount(BundlesFromDirectory) >= 1)
    {
      CFIndex v5 = 0;
      do
      {
        ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex(v4, v5);
        uint64_t v7 = (void *)MEMORY[0x263F086E0];
        CFURLRef v8 = CFBundleCopyBundleURL(ValueAtIndex);
        v9 = [v7 bundleWithURL:v8];

        v10 = [v9 bundlePath];
        char v11 = [v10 hasSuffix:@"apfs_userfs.fs"];

        if ((v11 & 1) == 0) {
          [v1 addObject:v9];
        }

        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v1;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    uint64_t v16 = *MEMORY[0x263EFFB68];
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(id *)(*((void *)&v23 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "infoDictionary", (void)v23);
        v20 = [v19 objectForKey:v16];

        if (v20)
        {
          v21 = +[SKFilesystem filesystemsFromBundle:v18];
          [v0 setObject:v21 forKeyedSubscript:v20];
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  v22 = (void *)_installedFilesystemsMapping;
  _installedFilesystemsMapping = (uint64_t)v0;
}

+ (NSArray)installedFilesystems
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SKFilesystem_installedFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (installedFilesystems_onceToken != -1) {
    dispatch_once(&installedFilesystems_onceToken, block);
  }
  CFURLRef v2 = (void *)_installedFilesystems;

  return (NSArray *)v2;
}

void __36__SKFilesystem_installedFilesystems__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) installedFilesystemsMapping];
  uint64_t v1 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:v3];
  CFURLRef v2 = (void *)_installedFilesystems;
  _installedFilesystems = v1;
}

+ (id)collectFilesystemsWithPersonalityMapping:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFArrayRef v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFIndex v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = +[SKFilesystem buildSpecialFilesystems];
  [v4 addObjectsFromArray:v10];

  [v4 sortWithOptions:16 usingComparator:&__block_literal_global_26];

  return v4;
}

uint64_t __57__SKFilesystem_collectFilesystemsWithPersonalityMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)getExtensionFilesystems
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v18 = (id)objc_opt_new();
  uint64_t v17 = objc_opt_new();
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = (id)objc_opt_new();
  if (v17)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__SKFilesystem_getExtensionFilesystems__block_invoke;
    v23[3] = &unk_26506BE90;
    long long v25 = &v26;
    id v3 = v2;
    long long v24 = v3;
    [v17 installedExtensionsSync:v23];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)v27[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = (void *)MEMORY[0x263F086E0];
        v9 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "url", v17);
        v10 = [v8 bundleWithURL:v9];

        if (v10)
        {
          char v11 = [v10 infoDictionary];
          long long v12 = [v11 objectForKeyedSubscript:kExtensionAttributesKey];

          if (v12)
          {
            long long v13 = [v12 objectForKeyedSubscript:@"FSShortName"];
            long long v14 = v13;
            if (v13 && ([v13 isEqualToString:@"hfs"] & 1) == 0)
            {
              long long v15 = +[SKFilesystem filesystemsFromBundle:v10];
              [v18 setObject:v15 forKeyedSubscript:v14];
            }
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v26, 8);

  return v18;
}

void __39__SKFilesystem_getExtensionFilesystems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = +[SKBaseManager sharedManager];
    [v8 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_35];

    v9 = SKGetOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_23F40C000, v9, OS_LOG_TYPE_FAULT, "Failed to get extensions %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __39__SKFilesystem_getExtensionFilesystems__block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKFilesystem.m", 221);
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

+ (NSMutableDictionary)cachedFilesystems
{
  dispatch_semaphore_t v2 = (void *)_cachedFilesystems;
  if (!_cachedFilesystems)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)_cachedFilesystems;
    _cachedFilesystems = v3;

    dispatch_semaphore_t v2 = (void *)_cachedFilesystems;
  }

  return (NSMutableDictionary *)v2;
}

+ (void)setCachedFilesystems:(id)a3
{
}

- (SKFilesystem)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SKFilesystem;
  uint64_t v5 = [(SKFilesystem *)&v51 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"localizedKey"];

    if (v6)
    {
      id v7 = [v4 objectForKey:@"localizedKey"];
      [(SKFilesystem *)v5 setLocalizedKey:v7];

      int v8 = +[SKError frameworkBundle];
      v9 = [(SKFilesystem *)v5 localizedKey];
      int v10 = [v8 localizedStringForKey:v9 value:&stru_26F313B30 table:0];
      [(SKFilesystem *)v5 setLocalizedName:v10];
    }
    else
    {
      int v8 = [v4 objectForKey:@"localizedName"];
      [(SKFilesystem *)v5 setLocalizedName:v8];
    }

    id v11 = [v4 objectForKey:@"type"];
    [(SKFilesystem *)v5 setType:v11];

    uint64_t v12 = [v4 objectForKey:@"majorType"];
    [(SKFilesystem *)v5 setMajorType:v12];

    long long v13 = [v4 objectForKey:@"isEncrypted"];
    -[SKFilesystem setIsEncrypted:](v5, "setIsEncrypted:", [v13 BOOLValue]);

    long long v14 = [v4 objectForKey:@"defaultEffaceable"];
    -[SKFilesystem setDefaultEffaceable:](v5, "setDefaultEffaceable:", [v14 BOOLValue]);

    long long v15 = [v4 objectForKey:@"isCaseSensitive"];
    -[SKFilesystem setIsCaseSensitive:](v5, "setIsCaseSensitive:", [v15 BOOLValue]);

    uint64_t v16 = [v4 objectForKey:@"isJournaled"];
    -[SKFilesystem setIsJournaled:](v5, "setIsJournaled:", [v16 BOOLValue]);

    uint64_t v17 = [v4 objectForKey:@"shouldShow"];
    -[SKFilesystem setShouldShow:](v5, "setShouldShow:", [v17 BOOLValue]);

    id v18 = [v4 objectForKey:@"dmPersonality"];
    [(SKFilesystem *)v5 setDmPersonality:v18];

    long long v19 = [v4 objectForKey:@"sortPriority"];
    -[SKFilesystem setSortPriority:](v5, "setSortPriority:", [v19 intValue]);

    long long v20 = [v4 objectForKey:@"minimumSize"];
    -[SKFilesystem setMinimumSize:](v5, "setMinimumSize:", [v20 unsignedLongLongValue]);

    long long v21 = [v4 objectForKey:@"unlocalizedName"];
    [(SKFilesystem *)v5 setUnlocalizedName:v21];

    long long v22 = [v4 objectForKey:@"unlocalizedEncryptedName"];
    [(SKFilesystem *)v5 setUnlocalizedEncryptedName:v22];

    long long v23 = [v4 objectForKey:@"contentMask"];
    [(SKFilesystem *)v5 setContentMask:v23];

    uint64_t v24 = [v4 objectForKey:@"formatArgs"];
    formatArgs = v5->_formatArgs;
    v5->_formatArgs = (NSString *)v24;

    uint64_t v26 = NSURL;
    v27 = [v4 objectForKey:@"formatExecutable"];
    uint64_t v28 = [v26 URLWithString:v27];
    formatExecutable = v5->_formatExecutable;
    v5->_formatExecutable = (NSURL *)v28;

    uint64_t v30 = [v4 objectForKey:@"repairArgs"];
    repairArgs = v5->_repairArgs;
    v5->_repairArgs = (NSString *)v30;

    v32 = NSURL;
    uint64_t v33 = [v4 objectForKey:@"repairExecutable"];
    uint64_t v34 = [v32 URLWithString:v33];
    repairExecutable = v5->_repairExecutable;
    v5->_repairExecutable = (NSURL *)v34;

    uint64_t v36 = [v4 objectForKey:@"verificationArgs"];
    verificationArgs = v5->_verificationArgs;
    v5->_verificationArgs = (NSString *)v36;

    uint64_t v38 = [v4 objectForKey:@"liveVerificationArgs"];
    liveVerificationArgs = v5->_liveVerificationArgs;
    v5->_liveVerificationArgs = (NSString *)v38;

    v40 = NSURL;
    v41 = [v4 objectForKey:@"verificationExecutable"];
    uint64_t v42 = [v40 URLWithString:v41];
    verificationExecutable = v5->_verificationExecutable;
    v5->_verificationExecutable = (NSURL *)v42;

    uint64_t v44 = [v4 objectForKey:@"xmlOutputArg"];
    xmlOutputArg = v5->_xmlOutputArg;
    v5->_xmlOutputArg = (NSString *)v44;

    v46 = (void *)MEMORY[0x263F086E0];
    v47 = [v4 objectForKey:@"bundle"];
    uint64_t v48 = [v46 bundleWithPath:v47];
    bundle = v5->_bundle;
    v5->_bundle = (NSBundle *)v48;
  }
  return v5;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 encrypted:(BOOL)a7 personalityKey:(id)a8 sortPriority:(int)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  long long v20 = getPersonalityDict(v18, v15);
  LODWORD(v23) = a9;
  long long v21 = [(SKFilesystem *)self initWithSKFilesystem:v19 bundle:v18 localizedName:v17 localizedKey:v16 caseSensitive:getCaseSensitive(v20, v15) encrypted:v9 personalityKey:v15 sortPriority:v23];

  return v21;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 caseSensitive:(BOOL)a7 encrypted:(BOOL)a8 personalityKey:(id)a9 sortPriority:(int)a10
{
  BOOL v10 = a8;
  BOOL v66 = a7;
  id v69 = a3;
  id obj = a4;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v70.receiver = self;
  v70.super_class = (Class)SKFilesystem;
  id v19 = [(SKFilesystem *)&v70 init];
  long long v20 = [v15 infoDictionary];
  v68 = [v20 objectForKey:*MEMORY[0x263EFFB68]];
  long long v21 = [v68 componentsSeparatedByString:@"."];
  long long v22 = [v21 lastObject];

  uint64_t v23 = v15;
  uint64_t v24 = getPersonalityDict(v15, v18);
  if (v19)
  {
    v65 = v20;
    [(SKFilesystem *)v19 setLocalizedName:v16];
    [(SKFilesystem *)v19 setLocalizedKey:v17];
    long long v25 = [v24 objectForKeyedSubscript:@"FSName"];
    uint64_t v26 = NSStringOrEmpty(v25);
    [(SKFilesystem *)v19 setUnlocalizedName:v26];

    v27 = [v24 objectForKeyedSubscript:@"FSEncryptionName"];
    uint64_t v28 = NSStringOrEmpty(v27);
    [(SKFilesystem *)v19 setUnlocalizedEncryptedName:v28];

    [(SKFilesystem *)v19 setType:v69];
    v29 = v22;
    [(SKFilesystem *)v19 setMajorType:v22];
    [(SKFilesystem *)v19 setIsCaseSensitive:v66];
    [(SKFilesystem *)v19 setIsEncrypted:v10];
    [(SKFilesystem *)v19 setDefaultEffaceable:v10 ^ 1];
    uint64_t v30 = [v24 objectForKeyedSubscript:@"FSFormatMinimumSize"];
    [(SKFilesystem *)v19 setMinimumSize:NSNumberToULongLong(v30)];

    [(SKFilesystem *)v19 setSortPriority:a10];
    [(SKFilesystem *)v19 setDmPersonality:v18];
    id v31 = [v24 objectForKeyedSubscript:@"FSFormatContentMask"];
    v32 = NSStringOrEmpty(v31);
    [(SKFilesystem *)v19 setContentMask:v32];

    uint64_t v33 = [v24 objectForKeyedSubscript:@"FSRepairArguments"];
    uint64_t v34 = NSStringOrEmpty(v33);
    repairArgs = v19->_repairArgs;
    v19->_repairArgs = (NSString *)v34;

    uint64_t v36 = [v23 resourceURL];
    v37 = [v24 objectForKeyedSubscript:@"FSRepairExecutable"];
    uint64_t v38 = NSStringOrEmpty(v37);
    uint64_t v39 = [v36 URLByAppendingPathComponent:v38];
    repairExecutable = v19->_repairExecutable;
    v19->_repairExecutable = (NSURL *)v39;

    v41 = [v24 objectForKeyedSubscript:@"FSFormatArguments"];
    uint64_t v42 = NSStringOrEmpty(v41);
    formatArgs = v19->_formatArgs;
    v19->_formatArgs = (NSString *)v42;

    uint64_t v44 = [v23 resourceURL];
    v45 = [v24 objectForKeyedSubscript:@"FSFormatExecutable"];
    v46 = NSStringOrEmpty(v45);
    uint64_t v47 = [v44 URLByAppendingPathComponent:v46];
    formatExecutable = v19->_formatExecutable;
    v19->_formatExecutable = (NSURL *)v47;

    v49 = [v24 objectForKeyedSubscript:@"FSVerificationArguments"];
    uint64_t v50 = NSStringOrEmpty(v49);
    verificationArgs = v19->_verificationArgs;
    v19->_verificationArgs = (NSString *)v50;

    v52 = [v24 objectForKeyedSubscript:@"FSLiveVerificationArguments"];
    uint64_t v53 = NSStringOrEmpty(v52);
    liveVerificationArgs = v19->_liveVerificationArgs;
    v19->_liveVerificationArgs = (NSString *)v53;

    v55 = [v23 resourceURL];
    v56 = [v24 objectForKeyedSubscript:@"FSVerificationExecutable"];
    v57 = NSStringOrEmpty(v56);
    uint64_t v58 = [v55 URLByAppendingPathComponent:v57];
    verificationExecutable = v19->_verificationExecutable;
    v19->_verificationExecutable = (NSURL *)v58;

    v60 = [v24 objectForKeyedSubscript:@"FSXMLOutputArgument"];
    uint64_t v61 = NSStringOrEmpty(v60);
    xmlOutputArg = v19->_xmlOutputArg;
    v19->_xmlOutputArg = (NSString *)v61;

    objc_storeStrong((id *)&v19->_bundle, obj);
    if (+[SKFilesystem _shouldShowFilesystemWithType:v29 key:v18 personality:v24])
    {
      long long v22 = v29;
      uint64_t v63 = 1;
    }
    else
    {
      long long v22 = v29;
      if ([(SKFilesystem *)v19 isExtension]) {
        uint64_t v63 = [v29 isEqualToString:@"apfs"];
      }
      else {
        uint64_t v63 = 0;
      }
    }
    long long v20 = v65;
    [(SKFilesystem *)v19 setShouldShow:v63];
  }

  return v19;
}

- (id)initEncryptedFSWithUnencryptedFS:(id)a3 localizedName:(id)a4 sortPriority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v8 dictionaryRepresentation];
  id v11 = [(SKFilesystem *)self initWithDictionaryRepresentation:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    [(SKFilesystem *)v11 setIsEncrypted:1];
    [(SKFilesystem *)v12 setDefaultEffaceable:0];
    [(SKFilesystem *)v12 setLocalizedName:v9];
    long long v13 = NSString;
    long long v14 = [v8 localizedKey];
    id v15 = [v13 stringWithFormat:@"%@ Encrypted", v14];
    [(SKFilesystem *)v12 setLocalizedKey:v15];

    [(SKFilesystem *)v12 setSortPriority:v5];
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  id v4 = [(SKFilesystem *)self localizedName];

  if (v4)
  {
    uint64_t v5 = [(SKFilesystem *)self localizedName];
    [v3 setObject:v5 forKey:@"localizedName"];
  }
  id v6 = [(SKFilesystem *)self localizedKey];

  if (v6)
  {
    id v7 = [(SKFilesystem *)self localizedKey];
    [v3 setObject:v7 forKey:@"localizedKey"];
  }
  id v8 = [(SKFilesystem *)self type];
  [v3 setObject:v8 forKey:@"type"];

  id v9 = [(SKFilesystem *)self majorType];

  if (v9)
  {
    BOOL v10 = [(SKFilesystem *)self majorType];
    [v3 setObject:v10 forKey:@"majorType"];
  }
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SKFilesystem isEncrypted](self, "isEncrypted"));
  [v3 setObject:v11 forKey:@"isEncrypted"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SKFilesystem defaultEffaceable](self, "defaultEffaceable"));
  [v3 setObject:v12 forKey:@"defaultEffaceable"];

  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", -[SKFilesystem isCaseSensitive](self, "isCaseSensitive"));
  [v3 setObject:v13 forKey:@"isCaseSensitive"];

  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SKFilesystem shouldShow](self, "shouldShow"));
  [v3 setObject:v14 forKey:@"shouldShow"];

  id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[SKFilesystem isJournaled](self, "isJournaled"));
  [v3 setObject:v15 forKey:@"isJournaled"];

  id v16 = [(SKFilesystem *)self dmPersonality];
  [v3 setObject:v16 forKey:@"dmPersonality"];

  id v17 = objc_msgSend(NSNumber, "numberWithInt:", -[SKFilesystem sortPriority](self, "sortPriority"));
  [v3 setObject:v17 forKey:@"sortPriority"];

  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKFilesystem minimumSize](self, "minimumSize"));
  [v3 setObject:v18 forKey:@"minimumSize"];

  id v19 = [(SKFilesystem *)self unlocalizedName];
  [v3 setValue:v19 forKey:@"unlocalizedName"];

  long long v20 = [(SKFilesystem *)self unlocalizedEncryptedName];
  [v3 setValue:v20 forKey:@"unlocalizedEncryptedName"];

  long long v21 = [(SKFilesystem *)self contentMask];
  [v3 setValue:v21 forKey:@"contentMask"];

  long long v22 = [(SKFilesystem *)self formatArgs];
  [v3 setValue:v22 forKey:@"formatArgs"];

  uint64_t v23 = [(SKFilesystem *)self formatExecutable];
  uint64_t v24 = [v23 absoluteString];
  [v3 setValue:v24 forKey:@"formatExecutable"];

  long long v25 = [(SKFilesystem *)self repairArgs];
  [v3 setValue:v25 forKey:@"repairArgs"];

  uint64_t v26 = [(SKFilesystem *)self repairExecutable];
  v27 = [v26 absoluteString];
  [v3 setValue:v27 forKey:@"repairExecutable"];

  uint64_t v28 = [(SKFilesystem *)self verificationArgs];
  [v3 setValue:v28 forKey:@"verificationArgs"];

  v29 = [(SKFilesystem *)self liveVerificationArgs];
  [v3 setValue:v29 forKey:@"liveVerificationArgs"];

  uint64_t v30 = [(SKFilesystem *)self verificationExecutable];
  id v31 = [v30 absoluteString];
  [v3 setValue:v31 forKey:@"verificationExecutable"];

  v32 = [(SKFilesystem *)self xmlOutputArg];
  [v3 setValue:v32 forKey:@"xmlOutputArg"];

  uint64_t v33 = [(SKFilesystem *)self bundle];
  uint64_t v34 = [v33 bundlePath];
  [v3 setValue:v34 forKey:@"bundle"];

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SKFilesystem *)self localizedName];
  BOOL v5 = [(SKFilesystem *)self shouldShow];
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  id v7 = [v3 stringWithFormat:@"%@ - Show: %@", v4, v6];

  return v7;
}

- (BOOL)isExtensionInsensitiveEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [(SKFilesystem *)self type];
    id v7 = [v5 type];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(SKFilesystem *)self dmPersonality];
      id v9 = [v5 dmPersonality];
      if ([v8 isEqualToString:v9]
        && (int v10 = -[SKFilesystem isEncrypted](self, "isEncrypted"), v10 == [v5 isEncrypted])
        && (int v11 = [(SKFilesystem *)self defaultEffaceable],
            v11 == [v5 defaultEffaceable])
        && (int v12 = -[SKFilesystem isJournaled](self, "isJournaled"), v12 == [v5 isJournaled]))
      {
        BOOL v15 = [(SKFilesystem *)self isCaseSensitive];
        int v13 = v15 ^ [v5 isCaseSensitive] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([(SKFilesystem *)self isExtensionInsensitiveEqual:v4])
  {
    BOOL v5 = [(SKFilesystem *)self isExtension];
    int v6 = v5 ^ [v4 isExtension] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5 isExtension:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  int v11 = [NSString stringWithFormat:@"%@_%d_%d_%d", v10, v8, v7, v6];
  int v12 = [a1 cachedFilesystems];
  int v13 = [v12 objectForKey:v11];

  if (v13)
  {
    long long v14 = [[SKFilesystem alloc] initWithDictionaryRepresentation:v13];
    goto LABEL_26;
  }
  id v39 = a1;
  if ([v10 isEqualToString:@"apfs"])
  {
    BOOL v15 = @"apfs.fs";
LABEL_13:
    id v16 = +[SKFilesystem getExtensionFilesystems];
    id v17 = v16;
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v18 = [v16 objectForKeyedSubscript:v10];
    if (!v18) {
      goto LABEL_18;
    }
    v37 = (void *)v18;
    id v19 = [v17 objectForKeyedSubscript:v10];
    long long v20 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_194];
    [v19 filteredArrayUsingPredicate:v20];
    uint64_t v38 = v15;
    v22 = long long v21 = v17;
    uint64_t v36 = [v22 count];

    id v17 = v21;
    BOOL v15 = v38;

    if (v36)
    {
      uint64_t v23 = [v17 objectForKeyedSubscript:v10];
      if (!v23) {
        goto LABEL_20;
      }
    }
    else
    {
LABEL_18:
      uint64_t v24 = [NSString stringWithFormat:@"%@/%@", @"/System/Library/Filesystems", v15];
      [MEMORY[0x263F086E0] bundleWithPath:v24];
      v26 = long long v25 = v17;
      uint64_t v23 = +[SKFilesystem filesystemsFromBundle:v26];

      id v17 = v25;
      if (!v23) {
        goto LABEL_20;
      }
    }
    if ([v23 count])
    {
LABEL_22:
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2;
      v40[3] = &__block_descriptor_35_e39_B24__0__SKFilesystem_8__NSDictionary_16l;
      BOOL v41 = v7;
      BOOL v42 = v8;
      BOOL v43 = v6;
      v29 = [MEMORY[0x263F08A98] predicateWithBlock:v40];
      uint64_t v30 = [v23 filteredArrayUsingPredicate:v29];

      if ([v30 count])
      {
        id v31 = [v30 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_200];
        v32 = [v39 cachedFilesystems];
        uint64_t v33 = [v31 objectAtIndexedSubscript:0];
        uint64_t v34 = [v33 dictionaryRepresentation];
        [v32 setValue:v34 forKey:v11];

        long long v14 = [v31 objectAtIndexedSubscript:0];
      }
      else
      {
        long long v14 = 0;
      }

      goto LABEL_26;
    }
LABEL_20:
    v27 = [v17 objectForKeyedSubscript:v10];

    if (v27)
    {
      uint64_t v28 = [v17 objectForKeyedSubscript:v10];

      uint64_t v23 = (void *)v28;
    }
    goto LABEL_22;
  }
  if ([v10 isEqualToString:@"hfs"])
  {
    BOOL v15 = @"hfs.fs";
    goto LABEL_13;
  }
  if ([v10 isEqualToString:@"msdos"])
  {
    BOOL v15 = @"msdos.fs";
    goto LABEL_13;
  }
  if ([v10 isEqualToString:@"exfat"])
  {
    BOOL v15 = @"exfat.fs";
    goto LABEL_13;
  }
  if ([v10 isEqualToString:@"free"])
  {
    BOOL v15 = &stru_26F313B30;
    goto LABEL_13;
  }
  long long v14 = 0;
LABEL_26:

  return v14;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldShow];
}

BOOL __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2(unsigned __int8 *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = a1[32] == [v3 isEncrypted]
    && a1[33] == [v3 isCaseSensitive]
    && a1[34] == [v3 isExtension];

  return v4;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 isEqualToString:@"msdos"]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v7 isEqualToString:@"exfat"];
  }
  id v9 = +[SKFilesystem filesystemFor:v7 caseSensitive:v6 encrypted:v5 isExtension:v8];

  return v9;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4
{
  return +[SKFilesystem filesystemFor:a3 caseSensitive:a4 encrypted:0];
}

+ (id)filesystemFor:(id)a3
{
  return +[SKFilesystem filesystemFor:a3 caseSensitive:0];
}

+ (id)fileSystemsHFSWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = getPersonalityDict(v8, v7);
  int v11 = [v8 infoDictionary];
  v65 = [v11 objectForKey:*MEMORY[0x263EFFB68]];
  int v12 = [v65 componentsSeparatedByString:@"."];
  uint64_t v13 = [v12 lastObject];

  BOOL v66 = v10;
  uint64_t CaseSensitive = getCaseSensitive(v10, v7);
  v64 = (void *)v13;
  if ([v7 isEqualToString:@"Journaled HFS+"])
  {
    BOOL v15 = [SKFilesystem alloc];
    id v16 = v8;
    id v17 = kSKDiskFileSystemHFS[0];
    uint64_t v18 = +[SKError frameworkBundle];
    id v61 = v9;
    id v19 = [v18 localizedStringForKey:@"HFS Generic" value:&stru_26F313B30 table:0];
    LODWORD(v60) = 2;
    long long v20 = v17;
    id v8 = v16;
    long long v21 = [(SKFilesystem *)v15 initWithSKFilesystem:v20 bundle:v16 localizedName:v19 localizedKey:@"HFS Generic" caseSensitive:CaseSensitive encrypted:0 personalityKey:v7 sortPriority:v60];

    [(SKFilesystem *)v21 setIsJournaled:1];
    long long v22 = [SKFilesystem alloc];
    uint64_t v23 = +[SKError frameworkBundle];
    uint64_t v24 = [v23 localizedStringForKey:@"HFS Generic Encrypted" value:&stru_26F313B30 table:0];
    id v25 = [(SKFilesystem *)v22 initEncryptedFSWithUnencryptedFS:v21 localizedName:v24 sortPriority:3];

    id v9 = v61;
    v71[0] = v21;
    v71[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x263EFF8C0];
    v27 = v71;
  }
  else if ([v7 isEqualToString:@"Case-sensitive Journaled HFS+"])
  {
    uint64_t v28 = [SKFilesystem alloc];
    v29 = kSKDiskFileSystemHFS[0];
    +[SKError frameworkBundle];
    id v31 = v30 = v9;
    [v31 localizedStringForKey:@"HFS Case-sensitive" value:&stru_26F313B30 table:0];
    uint64_t v33 = v32 = v8;
    LODWORD(v60) = 4;
    long long v21 = [(SKFilesystem *)v28 initWithSKFilesystem:v29 bundle:v32 localizedName:v33 localizedKey:@"HFS Case-sensitive" caseSensitive:CaseSensitive encrypted:0 personalityKey:v7 sortPriority:v60];

    id v8 = v32;
    [(SKFilesystem *)v21 setIsJournaled:1];
    uint64_t v34 = [SKFilesystem alloc];
    v35 = +[SKError frameworkBundle];
    uint64_t v36 = [v35 localizedStringForKey:@"HFS Case-sensitive Encrypted" value:&stru_26F313B30 table:0];
    id v25 = [(SKFilesystem *)v34 initEncryptedFSWithUnencryptedFS:v21 localizedName:v36 sortPriority:5];

    id v9 = v30;
    v70[0] = v21;
    v70[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x263EFF8C0];
    v27 = v70;
  }
  else if ([v7 isEqualToString:@"HFS+"])
  {
    uint64_t v37 = CaseSensitive;
    uint64_t v38 = [SKFilesystem alloc];
    id v39 = +[SKFilesystem _skfilesystemTypeWithPersonality:v7];
    +[SKError frameworkBundle];
    v40 = id v62 = v9;
    [v40 localizedStringForKey:@"HFS Not Journaled" value:&stru_26F313B30 table:0];
    BOOL v42 = v41 = v8;
    LODWORD(v60) = 8;
    long long v21 = [(SKFilesystem *)v38 initWithSKFilesystem:v39 bundle:v41 localizedName:v42 localizedKey:@"HFS Not Journaled" caseSensitive:v37 encrypted:0 personalityKey:v7 sortPriority:v60];

    id v8 = v41;
    BOOL v43 = [SKFilesystem alloc];
    uint64_t v44 = +[SKError frameworkBundle];
    v45 = [v44 localizedStringForKey:@"HFS Not Journaled Encrypted" value:&stru_26F313B30 table:0];
    id v25 = [(SKFilesystem *)v43 initEncryptedFSWithUnencryptedFS:v21 localizedName:v45 sortPriority:8];

    id v9 = v62;
    v69[0] = v21;
    v69[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x263EFF8C0];
    v27 = v69;
  }
  else
  {
    if (![v7 isEqualToString:@"Case-sensitive HFS+"])
    {
      if (+[SKFilesystem _shouldShowFilesystemWithType:v13 key:v7 personality:v10])
      {
        int v57 = 6;
      }
      else
      {
        int v57 = 8;
      }
      uint64_t v58 = [SKFilesystem alloc];
      v59 = +[SKFilesystem _skfilesystemTypeWithPersonality:v7];
      LODWORD(v60) = v57;
      long long v21 = [(SKFilesystem *)v58 initWithSKFilesystem:v59 bundle:v8 localizedName:v9 localizedKey:0 caseSensitive:0 encrypted:0 personalityKey:v7 sortPriority:v60];

      v67 = v21;
      v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
      goto LABEL_10;
    }
    uint64_t v46 = CaseSensitive;
    uint64_t v47 = [SKFilesystem alloc];
    uint64_t v48 = +[SKFilesystem _skfilesystemTypeWithPersonality:v7];
    +[SKError frameworkBundle];
    v49 = id v63 = v9;
    [v49 localizedStringForKey:@"HFS Case-sensitive Not Journaled" value:&stru_26F313B30 table:0];
    objc_super v51 = v50 = v8;
    LODWORD(v60) = 8;
    long long v21 = [(SKFilesystem *)v47 initWithSKFilesystem:v48 bundle:v50 localizedName:v51 localizedKey:@"HFS Case-sensitive Not Journaled" caseSensitive:v46 encrypted:0 personalityKey:v7 sortPriority:v60];

    id v8 = v50;
    v52 = [SKFilesystem alloc];
    uint64_t v53 = +[SKError frameworkBundle];
    v54 = [v53 localizedStringForKey:@"HFS Case-sensitive Not Journaled Encrypted" value:&stru_26F313B30 table:0];
    id v25 = [(SKFilesystem *)v52 initEncryptedFSWithUnencryptedFS:v21 localizedName:v54 sortPriority:8];

    id v9 = v63;
    v68[0] = v21;
    v68[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x263EFF8C0];
    v27 = v68;
  }
  v55 = [v26 arrayWithObjects:v27 count:2];

LABEL_10:

  return v55;
}

+ (id)fileSystemsAPFSWithPersonalityKey:(id)a3 bundle:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v24 = getPersonalityDict(v5, v6);
  char CaseSensitive = getCaseSensitive(v24, v6);
  id v7 = [SKFilesystem alloc];
  id v8 = kSKDiskFileSystemAPFS[0];
  id v9 = +[SKError frameworkBundle];
  id v10 = [v9 localizedStringForKey:@"APFS" value:&stru_26F313B30 table:0];
  LODWORD(v22) = 1;
  int v11 = [(SKFilesystem *)v7 initWithSKFilesystem:v8 bundle:v5 localizedName:v10 localizedKey:@"APFS" encrypted:0 personalityKey:v6 sortPriority:v22];

  int v12 = [SKFilesystem alloc];
  uint64_t v13 = +[SKError frameworkBundle];
  long long v14 = [v13 localizedStringForKey:@"APFS Encrypted" value:&stru_26F313B30 table:0];
  id v15 = [(SKFilesystem *)v12 initEncryptedFSWithUnencryptedFS:v11 localizedName:v14 sortPriority:1];

  [v15 setLocalizedKey:@"APFS Encrypted"];
  if ((CaseSensitive & 1) == 0)
  {
    id v16 = +[SKError frameworkBundle];
    id v17 = [v16 localizedStringForKey:@"Case-insensitive APFS" value:&stru_26F313B30 table:0];
    [(SKFilesystem *)v11 setLocalizedName:v17];

    [(SKFilesystem *)v11 setLocalizedKey:@"Case-insensitive APFS"];
    [(SKFilesystem *)v11 setSortPriority:0];
    uint64_t v18 = +[SKError frameworkBundle];
    id v19 = [v18 localizedStringForKey:@"Case-insensitive APFS Encrypted" value:&stru_26F313B30 table:0];
    [v15 setLocalizedName:v19];

    [v15 setLocalizedKey:@"Case-insensitive APFS Encrypted"];
    [v15 setSortPriority:0];
  }
  v25[0] = v11;
  v25[1] = v15;
  long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

  return v20;
}

+ (id)fileSystems3rdPartyWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = getPersonalityDict(v8, v9);
  int v11 = [v8 infoDictionary];
  int v12 = [v11 objectForKey:*MEMORY[0x263EFFB68]];
  uint64_t v13 = [v12 componentsSeparatedByString:@"."];
  long long v14 = [v13 lastObject];

  if (+[SKFilesystem _shouldShowFilesystemWithType:v14 key:v9 personality:v10])
  {
    int v15 = 7;
  }
  else
  {
    int v15 = 9;
  }
  id v16 = [SKFilesystem alloc];
  id v17 = +[SKFilesystem _skfilesystemTypeWithPersonality:v9];
  LODWORD(v21) = v15;
  uint64_t v18 = [(SKFilesystem *)v16 initWithSKFilesystem:v17 bundle:v8 localizedName:v7 localizedKey:0 encrypted:0 personalityKey:v9 sortPriority:v21];

  v22[0] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];

  return v19;
}

+ (id)filesystemsWithBundle:(id)a3 filesystemPersonality:(id)a4 userVisibleName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 infoDictionary];
  int v12 = [v11 objectForKey:*MEMORY[0x263EFFB68]];
  uint64_t v13 = [v12 componentsSeparatedByString:@"."];
  long long v14 = [v13 lastObject];

  if ([v14 isEqualToString:@"hfs"])
  {
    uint64_t v15 = [a1 fileSystemsHFSWithPersonalityKey:v9 bundle:v8 userVisibleName:v10];
  }
  else
  {
    if ([v14 isEqualToString:@"apfs"]) {
      [a1 fileSystemsAPFSWithPersonalityKey:v9 bundle:v8];
    }
    else {
    uint64_t v15 = [a1 fileSystems3rdPartyWithPersonalityKey:v9 bundle:v8 userVisibleName:v10];
    }
  }
  id v16 = (void *)v15;

  return v16;
}

- (SKFilesystem)initWithSpecialFilesystem:(id)a3 majorType:(id)a4 localizedName:(id)a5
{
  v17[8] = *MEMORY[0x263EF8340];
  v16[0] = @"type";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = +[SKFilesystem _skfilesystemTypeWithPersonality:v10];
  v17[0] = v11;
  v17[1] = v9;
  v16[1] = @"majorType";
  v16[2] = @"localizedName";
  v17[2] = v8;
  v17[3] = MEMORY[0x263EFFA80];
  v16[3] = @"isCaseSensitive";
  v16[4] = @"isEncrypted";
  v17[4] = MEMORY[0x263EFFA80];
  v17[5] = MEMORY[0x263EFFA80];
  v16[5] = @"shouldShow";
  v16[6] = @"dmPersonality";
  v17[6] = v10;
  v16[7] = @"sortPriority";
  int v12 = [NSNumber numberWithInt:9];
  v17[7] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:8];

  long long v14 = [(SKFilesystem *)self initWithDictionaryRepresentation:v13];
  return v14;
}

+ (id)buildSpecialFilesystems
{
  v16[3] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v2 = [SKFilesystem alloc];
  id v3 = +[SKError frameworkBundle];
  id v4 = [v3 localizedStringForKey:@"Free Space" value:&stru_26F313B30 table:0];
  id v5 = [(SKFilesystem *)v2 initWithSpecialFilesystem:@"Free Space" majorType:@"FREE_SPACE" localizedName:v4];

  id v6 = [SKFilesystem alloc];
  id v7 = +[SKError frameworkBundle];
  id v8 = [v7 localizedStringForKey:@"Linux Swap" value:&stru_26F313B30 table:0];
  id v9 = [(SKFilesystem *)v6 initWithSpecialFilesystem:@"Linux Swap" majorType:@"Linux Swap" localizedName:v8];

  id v10 = [SKFilesystem alloc];
  int v11 = +[SKError frameworkBundle];
  int v12 = [v11 localizedStringForKey:@"Linux Native" value:&stru_26F313B30 table:0];
  uint64_t v13 = [(SKFilesystem *)v10 initWithSpecialFilesystem:@"Linux Native" majorType:@"Linux Native" localizedName:v12];

  v16[0] = v5;
  v16[1] = v9;
  v16[2] = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

+ (id)filesystemsFromBundle:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v22 = [MEMORY[0x263EFF980] array];
  uint64_t v23 = v3;
  id v4 = [v3 infoDictionary];
  id v5 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

    id v4 = (void *)v6;
  }
  uint64_t v21 = v4;
  id v7 = [v4 objectForKeyedSubscript:@"FSPersonalities"];
  id v8 = [v3 objectForInfoDictionaryKey:@"FSPersonalities"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = [v9 objectForKeyedSubscript:v14];
        id v16 = [v8 objectForKeyedSubscript:v14];
        id v17 = [v16 objectForKeyedSubscript:@"FSName"];
        if (!v17)
        {
          uint64_t v18 = [v15 objectForKeyedSubscript:@"FSName"];
          if (v18) {
            id v17 = (__CFString *)v18;
          }
          else {
            id v17 = &stru_26F313B30;
          }
        }
        id v19 = +[SKFilesystem filesystemsWithBundle:v23 filesystemPersonality:v14 userVisibleName:v17];
        [v22 addObjectsFromArray:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  return v22;
}

+ (id)_skfilesystemTypeWithPersonality:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  id v4 = [NSString stringWithFormat:@"kSKDiskFileSystem_%@", v3];

  return v4;
}

+ (BOOL)_shouldShowFilesystemWithType:(id)a3 key:(id)a4 personality:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKeyedSubscript:@"FSServerOnly"];
  int v11 = NSNumberToBool(v10);

  if (v11 && (uint64_t v12 = (void *)_CFCopyServerVersionDictionary(), v12, !v12))
  {
  }
  else
  {
    uint64_t v13 = [v9 objectForKeyedSubscript:@"FSFormatExecutable"];

    if (v13) {
      goto LABEL_4;
    }
  }
  uint64_t v15 = [v9 objectForKeyedSubscript:@"FSFormatInteractive"];
  if ((isValidNSNumber(v15) & 1) == 0)
  {

LABEL_14:
    LOBYTE(v14) = 0;
    goto LABEL_15;
  }
  char v16 = [v15 BOOLValue];

  if (v16) {
    goto LABEL_14;
  }
LABEL_4:
  if ([v7 isEqualToString:@"hfs"]
    && ![v8 containsString:@"Journaled"]
    || [v7 isEqualToString:@"msdos"]
    && ![v8 isEqualToString:@"MS-DOS"])
  {
    goto LABEL_14;
  }
  int v14 = [v7 isEqualToString:@"udf"] ^ 1;
LABEL_15:

  return v14;
}

- (BOOL)isExtension
{
  dispatch_semaphore_t v2 = [(SKFilesystem *)self bundle];
  id v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKeyedSubscript:kExtensionAttributesKey];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isValidName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  if (v6 && [v6 length])
  {
    if ([(SKFilesystem *)self isExtension])
    {
      id v8 = objc_opt_new();
      if (v8)
      {
        id v9 = [(SKFilesystem *)self bundle];
        uint64_t v10 = [v9 bundleIdentifier];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __34__SKFilesystem_isValidName_error___block_invoke;
        v14[3] = &unk_26506BEF8;
        char v16 = &v17;
        int v11 = v7;
        uint64_t v15 = v11;
        [v8 validateVolumeName:v6 usingBundle:v10 volumeID:0 replyHandler:v14];

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        if (a4) {
          *a4 = (id) v18[5];
        }
        BOOL v12 = v18[5] == 0;
      }
      else if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __34__SKFilesystem_isValidName_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)majorType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMajorType:(id)a3
{
}

- (NSString)dmPersonality
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDmPersonality:(id)a3
{
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_ischar CaseSensitive = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (unint64_t)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(unint64_t)a3
{
  self->_minimumSize = a3;
}

- (NSString)contentMask
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentMask:(id)a3
{
}

- (NSString)localizedKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalizedKey:(id)a3
{
}

- (int)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(int)a3
{
  self->_sortPriority = a3;
}

- (NSString)unlocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUnlocalizedName:(id)a3
{
}

- (NSString)unlocalizedEncryptedName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnlocalizedEncryptedName:(id)a3
{
}

- (NSString)formatArgs
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSURL)formatExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)repairArgs
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSURL)repairExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)verificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)liveVerificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSURL)verificationExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)xmlOutputArg
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_xmlOutputArg, 0);
  objc_storeStrong((id *)&self->_verificationExecutable, 0);
  objc_storeStrong((id *)&self->_liveVerificationArgs, 0);
  objc_storeStrong((id *)&self->_verificationArgs, 0);
  objc_storeStrong((id *)&self->_repairExecutable, 0);
  objc_storeStrong((id *)&self->_repairArgs, 0);
  objc_storeStrong((id *)&self->_formatExecutable, 0);
  objc_storeStrong((id *)&self->_formatArgs, 0);
  objc_storeStrong((id *)&self->_unlocalizedEncryptedName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
  objc_storeStrong((id *)&self->_contentMask, 0);
  objc_storeStrong((id *)&self->_dmPersonality, 0);
  objc_storeStrong((id *)&self->_majorType, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end