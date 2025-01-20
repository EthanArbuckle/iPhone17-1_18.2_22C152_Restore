@interface ICApp
+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5;
- (BOOL)checkedInstallStatus;
- (BOOL)isCurrentlyInstalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (BOOL)isRestricted;
- (ICApp)initWithIdentifier:(id)a3 definition:(id)a4;
- (INAppInfo)appInfo;
- (NSArray)allBundleIdentifiers;
- (NSArray)documentActions;
- (NSArray)documentTypes;
- (NSArray)exportedFileTypes;
- (NSArray)metadata;
- (NSArray)schemes;
- (NSDictionary)definition;
- (NSString)bundleIdentifier;
- (NSString)iTunesIdentifier;
- (NSString)iconName;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (OS_dispatch_queue)stateAccessQueue;
- (WFImage)icon;
- (id)bundleIdentifiersByIdiom;
- (id)description;
- (id)identifierFromDictionaryForCurrentIdiom:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)schemeNamed:(id)a3;
- (unint64_t)hash;
- (void)openFile:(id)a3 completionHandler:(id)a4;
- (void)openFile:(id)a3 withAnnotation:(id)a4 completionHandler:(id)a5;
- (void)resetInstalledStatus;
- (void)setCheckedInstallStatus:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)updateInstalledStatus;
@end

@implementation ICApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_schemes, 0);
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (void)setCheckedInstallStatus:(BOOL)a3
{
  self->_checkedInstallStatus = a3;
}

- (BOOL)checkedInstallStatus
{
  return self->_checkedInstallStatus;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)identifierFromDictionaryForCurrentIdiom:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"Phone"];
  v5 = [v3 objectForKey:@"Pad"];

  v6 = [MEMORY[0x1E4FB46B8] currentDevice];
  uint64_t v7 = [v6 idiom];

  if (v5) {
    v8 = v5;
  }
  else {
    v8 = v4;
  }
  if (v7 == 1) {
    v9 = v8;
  }
  else {
    v9 = v4;
  }
  id v10 = v9;

  return v10;
}

- (void)openFile:(id)a3 withAnnotation:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v10 = +[DCDocument documentWithURL:a3 annotation:a4];
  v9 = [(ICApp *)self bundleIdentifier];
  [v10 openWithAppBundleIdentifier:v9 completionHandler:v8];
}

- (void)openFile:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)isInstalled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICApp *)self stateAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__ICApp_isInstalled__block_invoke;
  v5[3] = &unk_1E6558960;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

unsigned char *__20__ICApp_isInstalled__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[9])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = [result isCurrentlyInstalled];
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
    result = *(unsigned char **)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[8];
  return result;
}

- (void)updateInstalledStatus
{
  id v3 = [(ICApp *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ICApp_updateInstalledStatus__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__ICApp_updateInstalledStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCurrentlyInstalled];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return result;
}

- (void)resetInstalledStatus
{
  id v3 = [(ICApp *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ICApp_resetInstalledStatus__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__ICApp_resetInstalledStatus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

- (BOOL)isCurrentlyInstalled
{
  v2 = (void *)MEMORY[0x1E4F223B8];
  id v3 = [(ICApp *)self bundleIdentifier];
  v4 = [v2 applicationProxyForIdentifier:v3];
  v5 = [v4 appState];
  char v6 = [v5 isInstalled];

  return v6;
}

- (INAppInfo)appInfo
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  appInfo = self->_appInfo;
  if (appInfo) {
    goto LABEL_2;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
  char v6 = [(ICApp *)self bundleIdentifier];
  id v14 = 0;
  uint64_t v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v14];
  id v8 = v14;

  if (!v8)
  {
    v12 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v7];
    v13 = self->_appInfo;
    self->_appInfo = v12;

    appInfo = self->_appInfo;
LABEL_2:
    id v3 = appInfo;
    goto LABEL_7;
  }
  char v9 = getWFInterchangeLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [(ICApp *)self bundleIdentifier];
    *(_DWORD *)buf = 136315650;
    v16 = "-[ICApp appInfo]";
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get app record for %{public}@, %{public}@", buf, 0x20u);
  }
  id v3 = 0;
LABEL_7:
  return v3;
}

- (BOOL)isRestricted
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  v4 = [(ICApp *)self bundleIdentifier];
  id v11 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];
  id v6 = v11;

  if (v6)
  {
    uint64_t v7 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(ICApp *)self bundleIdentifier];
      *(_DWORD *)buf = 136315650;
      v13 = "-[ICApp isRestricted]";
      __int16 v14 = 2114;
      v15 = v8;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get app record for %{public}@, %{public}@", buf, 0x20u);
    }
    char v9 = 0;
  }
  else
  {
    uint64_t v7 = [v5 applicationState];
    char v9 = [v7 isRestricted];
  }

  return v9;
}

- (NSString)iconName
{
  v2 = [(ICApp *)self definition];
  id v3 = [v2 objectForKey:@"Icon"];

  return (NSString *)v3;
}

- (NSArray)metadata
{
  v2 = [(ICApp *)self definition];
  id v3 = [v2 objectForKey:@"Metadata"];
  v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (NSArray)documentActions
{
  id v3 = [(ICApp *)self definition];
  v4 = [v3 objectForKey:@"DocumentActions"];

  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__ICApp_documentActions__block_invoke;
    v7[3] = &unk_1E65528A8;
    v7[4] = self;
    id v5 = objc_msgSend(v4, "if_compactMap:", v7);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

id __24__ICApp_documentActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKey:@"ActionClass"];
  id v5 = NSClassFromString(v4);
  if (!v5) {
    id v5 = (objc_class *)objc_opt_class();
  }
  id v6 = (void *)[[v5 alloc] initWithDefinition:v3 app:*(void *)(a1 + 32)];

  return v6;
}

- (NSArray)documentTypes
{
  v2 = [(ICApp *)self definition];
  id v3 = [v2 objectForKey:@"DocumentTypes"];

  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.maps.directionsrequest", @"com.appcubby.launchpro.lcpbackup", 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __22__ICApp_documentTypes__block_invoke;
    v8[3] = &unk_1E65503E0;
    id v9 = v4;
    id v5 = v4;
    id v6 = objc_msgSend(v3, "if_compactMap:", v8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

id __22__ICApp_documentTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4FB4718] typeWithString:v3];
  }

  return v4;
}

- (NSArray)exportedFileTypes
{
  v2 = (void *)MEMORY[0x1E4FB4718];
  id v3 = [(ICApp *)self definition];
  v4 = [v3 objectForKey:@"ExportedTypes"];
  id v5 = [v2 typesFromStrings:v4];

  return (NSArray *)v5;
}

- (id)schemeNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(ICApp *)self schemes];
  id v6 = [v5 objectMatchingKey:@"scheme" value:v4];

  return v6;
}

- (NSArray)schemes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10444;
  id v11 = __Block_byref_object_dispose__10445;
  id v12 = 0;
  id v3 = [(ICApp *)self stateAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __16__ICApp_schemes__block_invoke;
  v6[3] = &unk_1E6558960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __16__ICApp_schemes__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
    return;
  }
  id v3 = objc_opt_new();
  id v4 = [*(id *)(a1 + 32) definition];
  id v5 = [v4 objectForKey:@"URLSchemes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [(ICScheme *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [ICScheme alloc];
          v13 = -[ICScheme initWithDefinition:app:](v12, "initWithDefinition:app:", v11, *(void *)(a1 + 32), (void)v17);
          [v3 addObject:v13];
        }
        uint64_t v8 = [(ICScheme *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[ICScheme alloc] initWithDefinition:v5 app:*(void *)(a1 + 32)];
    [v3 addObject:v6];
LABEL_14:
  }
  __int16 v14 = objc_msgSend(v3, "copy", (void)v17);
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v14);
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(ICApp *)self stateAccessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __17__ICApp_setIcon___block_invoke;
  v7[3] = &unk_1E6558938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __17__ICApp_setIcon___block_invoke(uint64_t a1)
{
}

- (WFImage)icon
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10444;
  uint64_t v11 = __Block_byref_object_dispose__10445;
  id v12 = 0;
  id v3 = [(ICApp *)self stateAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __13__ICApp_icon__block_invoke;
  v6[3] = &unk_1E6558960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (WFImage *)v4;
}

void __13__ICApp_icon__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[3];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4FB4770];
    id v8 = [v2 bundleIdentifier];
    uint64_t v9 = [v7 applicationIconImageForBundleIdentifier:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v12 = [*(id *)(a1 + 32) iconName];

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4FB4770];
        __int16 v14 = [*(id *)(a1 + 32) iconName];
        uint64_t v15 = [v13 workflowKitImageNamed:v14];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        long long v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    uint64_t v19 = *(void *)(a1 + 32);
    id v6 = *(void **)(v19 + 24);
    *(void *)(v19 + 24) = v18;
  }
}

- (NSString)iTunesIdentifier
{
  id v3 = [(ICApp *)self definition];
  uint64_t v4 = [v3 objectForKey:@"iTunesIdentifiers"];

  if (v4)
  {
    id v5 = [(ICApp *)self identifierFromDictionaryForCurrentIdiom:v4];
  }
  else
  {
    id v6 = [(ICApp *)self definition];
    id v5 = [v6 objectForKey:@"iTunesIdentifier"];
  }
  return (NSString *)v5;
}

- (NSString)localizedShortName
{
  id v3 = [(ICApp *)self definition];
  uint64_t v4 = [v3 objectForKey:@"ShortName"];

  if (v4) {
    [v4 localize];
  }
  else {
  id v5 = [(ICApp *)self localizedName];
  }

  return (NSString *)v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICApp *)self definition];
  id v6 = [v5 objectForKey:@"Name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_5:
    id v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 localize:v6];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (NSString)localizedName
{
  id v3 = [MEMORY[0x1E4FB47E8] defaultContext];
  id v4 = [(ICApp *)self localizedNameWithContext:v3];

  return (NSString *)v4;
}

- (NSString)bundleIdentifier
{
  id v3 = [(ICApp *)self bundleIdentifiersByIdiom];
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(ICApp *)self bundleIdentifiersByIdiom];
    id v7 = [(ICApp *)self identifierFromDictionaryForCurrentIdiom:v6];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(ICApp *)self identifier];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = [(ICApp *)self identifier];
  }
  return (NSString *)v10;
}

- (NSArray)allBundleIdentifiers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICApp *)self bundleIdentifiersByIdiom];
  id v4 = [v3 allValues];
  if ([v4 count])
  {
    uint64_t v5 = [(ICApp *)self bundleIdentifiersByIdiom];
    uint64_t v6 = [v5 allValues];
  }
  else
  {
    uint64_t v5 = [(ICApp *)self identifier];
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  id v7 = (void *)v6;

  return (NSArray *)v7;
}

- (id)bundleIdentifiersByIdiom
{
  v2 = [(ICApp *)self definition];
  id v3 = [v2 objectForKey:@"BundleIdentifiers"];

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ICApp;
  id v4 = [(ICApp *)&v11 description];
  uint64_t v5 = [(ICApp *)self localizedName];
  uint64_t v6 = [(ICApp *)self identifier];
  id v7 = (void *)v6;
  if (self->_checkedInstallStatus)
  {
    if (self->_installed) {
      id v8 = @"Installed";
    }
    else {
      id v8 = @"Not Installed";
    }
  }
  else
  {
    id v8 = @"Undetermined Install Status";
  }
  id v9 = [v3 stringWithFormat:@"%@: %@ [%@] (%@)", v4, v5, v6, v8];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(ICApp *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(ICApp *)self definition];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICApp *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ICApp *)self identifier];
      unint64_t v6 = [(ICApp *)v4 identifier];
      if ([v5 isEqualToString:v6])
      {
        id v7 = [(ICApp *)self definition];
        id v8 = [(ICApp *)v4 definition];
        id v9 = v7;
        id v10 = v8;
        objc_super v11 = v10;
        if (v9 == v10)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v10) {
            char v12 = [v9 isEqualToDictionary:v10];
          }
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (ICApp)initWithIdentifier:(id)a3 definition:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ICApp.m", 58, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v9 = [(ICApp *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    definition = v9->_definition;
    v9->_definition = (NSDictionary *)v12;

    __int16 v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.WorkflowKit.ICApp.stateAccessQueue", v14);
    stateAccessQueue = v9->_stateAccessQueue;
    v9->_stateAccessQueue = (OS_dispatch_queue *)v15;

    long long v17 = v9;
  }

  return v9;
}

+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
}

@end