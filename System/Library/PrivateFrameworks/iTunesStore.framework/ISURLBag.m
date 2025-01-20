@interface ISURLBag
+ (BOOL)shouldSendGUIDForURL:(id)a3 inBagContext:(id)a4;
+ (BOOL)urlIsTrusted:(id)a3 inBagContext:(id)a4;
+ (id)_sharedBagBackend;
+ (id)copyExtraHeadersForURL:(id)a3 inBagContext:(id)a4;
+ (id)networkConstraintsForDownloadKind:(id)a3 inBagContext:(id)a4;
+ (id)storeFrontURLBagKeyForItemKind:(id)a3;
+ (id)urlBagForContext:(id)a3;
+ (id)urlForKey:(id)a3 inBagContext:(id)a4;
+ (id)valueForKey:(id)a3 inBagContext:(id)a4;
+ (void)_loadItemKindURLBagKeyMap;
- (BOOL)isValid;
- (BOOL)loadFromDictionary:(id)a3 returningError:(id *)a4;
- (BOOL)loadedFromDiskCache;
- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3;
- (BOOL)shouldSendGUIDForURL:(id)a3;
- (BOOL)urlIsTrusted:(id)a3;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (ISURLBag)init;
- (ISURLBag)initWithContentsOfFile:(id)a3;
- (ISURLBag)initWithRawDictionary:(id)a3;
- (ISURLBag)initWithURLBagContext:(id)a3;
- (NSDictionary)URLBagDictionary;
- (NSSet)availableStorefrontItemKinds;
- (NSString)bagBackendKey;
- (NSString)storeFrontIdentifier;
- (SSURLBagContext)URLBagContext;
- (double)invalidationTime;
- (id)URLForURL:(id)a3 clientIdentifier:(id)a4;
- (id)_copyGUIDPatternsFromBagBackend;
- (id)_copyGUIDSchemesFromBagBackend;
- (id)_copyHeaderPatternsFromBagBackend;
- (id)_networkConstraintsCachePath;
- (id)copyExtraHeadersForURL:(id)a3;
- (id)networkConstraintsForDownloadKind:(id)a3;
- (id)sanitizedURLForURL:(id)a3;
- (id)searchQueryParametersForClientIdentifier:(id)a3 networkType:(int64_t)a4;
- (id)urlForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (int64_t)versionIdentifier;
- (void)_preprocessURLResolutionCacheDictionary:(id)a3;
- (void)_setBagBackendWithDictionary:(id)a3;
- (void)_toggleStopSendingLocalCookies;
- (void)_writeNetworkConstraintsCacheFile;
- (void)_writeURLResolutionCacheFile;
- (void)dealloc;
- (void)setInvalidationTime:(double)a3;
- (void)setInvalidationTimeWithExprationInterval:(double)a3;
- (void)setLoadedFromDiskCache:(BOOL)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setURLBagContext:(id)a3;
@end

@implementation ISURLBag

+ (id)_sharedBagBackend
{
  if (_sharedBagBackend_onceToken != -1) {
    dispatch_once(&_sharedBagBackend_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_sharedBagBackend_sharedBagBackend;

  return v2;
}

uint64_t __29__ISURLBag__sharedBagBackend__block_invoke()
{
  _sharedBagBackend_sharedBagBackend = objc_alloc_init(ISURLBagBackend);

  return MEMORY[0x270F9A758]();
}

- (ISURLBag)init
{
  __ISRecordSPIClassUsage(self);
  v10.receiver = self;
  v10.super_class = (Class)ISURLBag;
  v3 = [(ISURLBag *)&v10 init];
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() _sharedBagBackend];
    bagBackend = v3->_bagBackend;
    v3->_bagBackend = (ISURLBagBackend *)v4;

    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    bagBackendKey = v3->_bagBackendKey;
    v3->_bagBackendKey = (NSString *)v7;

    v3->_invalidationTime = -1.79769313e308;
  }
  return v3;
}

- (ISURLBag)initWithContentsOfFile:(id)a3
{
  uint64_t v4 = (objc_class *)NSDictionary;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContentsOfFile:v5];

  if (v6)
  {
    uint64_t v7 = [(ISURLBag *)self initWithRawDictionary:v6];
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

- (ISURLBag)initWithRawDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(ISURLBag *)self init];
  v6 = v5;
  if (v5)
  {
    [(ISURLBag *)v5 _setBagBackendWithDictionary:v4];
    uint64_t v7 = [(ISURLBag *)v6 _copyGUIDPatternsFromBagBackend];
    guidPatterns = v6->_guidPatterns;
    v6->_guidPatterns = (NSArray *)v7;

    uint64_t v9 = [(ISURLBag *)v6 _copyGUIDSchemesFromBagBackend];
    guidSchemes = v6->_guidSchemes;
    v6->_guidSchemes = (NSSet *)v9;

    uint64_t v11 = [(ISURLBag *)v6 _copyHeaderPatternsFromBagBackend];
    headerPatterns = v6->_headerPatterns;
    v6->_headerPatterns = (NSDictionary *)v11;

    v6->_invalidationTime = 1.79769313e308;
  }

  return v6;
}

- (ISURLBag)initWithURLBagContext:(id)a3
{
  id v4 = a3;
  if ([v4 bagType] != 2)
  {
    id v5 = 0;
LABEL_6:

    goto LABEL_7;
  }
  id v5 = [(ISURLBag *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (SSURLBagContext *)v6;

    v5->_invalidationTime = 1.79769313e308;
    id v8 = objc_alloc(NSDictionary);
    uint64_t v9 = [(ISURLBag *)v5 _networkConstraintsCachePath];
    self = (ISURLBag *)[v8 initWithContentsOfFile:v9];

    [(ISURLBag *)v5 _setBagBackendWithDictionary:self];
    if (!self)
    {
      objc_super v10 = (SSNetworkConstraints *)objc_alloc_init(MEMORY[0x263F7B298]);
      defaultConstraints = v5->_defaultConstraints;
      v5->_defaultConstraints = v10;

      [(SSNetworkConstraints *)v5->_defaultConstraints disableCellularNetworkTypes];
    }
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)dealloc
{
  [(ISURLBag *)self _setBagBackendWithDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)ISURLBag;
  [(ISURLBag *)&v3 dealloc];
}

- (id)copyExtraHeadersForURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_headerPatterns) {
    return 0;
  }
  objc_super v3 = self;
  id v4 = [a3 absoluteString];
  uint64_t v5 = [v4 length];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3->_headerPatterns;
  uint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v8 = v3;
        uint64_t v9 = [(NSDictionary *)v3->_headerPatterns objectForKey:v7];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5) != 0x7FFFFFFFFFFFFFFFLL)
              {
                [v17 addObject:v7];
                goto LABEL_17;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_17:

        objc_super v3 = v8;
      }
      uint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v17;
}

- (BOOL)loadFromDictionary:(id)a3 returningError:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ISURLBag *)self _setBagBackendWithDictionary:0];
  guidPatterns = self->_guidPatterns;
  self->_guidPatterns = 0;

  guidSchemes = self->_guidSchemes;
  self->_guidSchemes = 0;

  headerPatterns = self->_headerPatterns;
  self->_headerPatterns = 0;

  id v10 = [v6 objectForKey:@"bag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:0];

    id v10 = (void *)v11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [v6 objectForKey:@"urlBag"];

    id v10 = (void *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = v6;

    id v10 = v13;
  }
  [(ISURLBag *)self _setBagBackendWithDictionary:v10];
  v14 = [(ISURLBag *)self URLBagDictionary];

  if (v14)
  {
    if ([(ISURLBag *)self versionIdentifier] > 370303295)
    {
      long long v24 = [(ISURLBag *)self _copyGUIDPatternsFromBagBackend];
      long long v25 = self->_guidPatterns;
      self->_guidPatterns = v24;

      long long v26 = [(ISURLBag *)self _copyGUIDSchemesFromBagBackend];
      long long v27 = self->_guidSchemes;
      self->_guidSchemes = v26;

      v28 = [(ISURLBag *)self _copyHeaderPatternsFromBagBackend];
      v29 = self->_headerPatterns;
      self->_headerPatterns = v28;

      [(ISURLBag *)self _writeNetworkConstraintsCacheFile];
      if (SSIsDaemon())
      {
        [(ISURLBag *)self _writeURLResolutionCacheFile];
        [(ISURLBag *)self _toggleStopSendingLocalCookies];
      }
      BOOL v22 = 1;
      if (a4) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      id v20 = v19;
      int v31 = 138412546;
      v32 = v19;
      __int16 v33 = 2048;
      int64_t v34 = [(ISURLBag *)self versionIdentifier];
      LODWORD(v30) = 22;
      long long v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v31, v30);
      free(v21);
      SSFileLog();
    }

    goto LABEL_20;
  }
LABEL_21:
  BOOL v22 = 0;
  if (a4) {
LABEL_22:
  }
    *a4 = 0;
LABEL_23:

  return v22;
}

- (void)_toggleStopSendingLocalCookies
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    *(_DWORD *)long long v24 = 138543362;
    *(void *)&v24[4] = objc_opt_class();
    id v7 = *(id *)&v24[4];
    LODWORD(v23) = 12;
    BOOL v22 = v24;
    id v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v24, v23, *(_OWORD *)v24);
    free(v8);
    BOOL v22 = v6;
    SSFileLog();
  }

LABEL_12:
  uint64_t v9 = [(ISURLBag *)self valueForKey:@"stop-including-local-cookies"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = [v9 BOOLValue];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedDaemonConfig", v22);
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    v15 = objc_opt_class();
    int v16 = NSNumber;
    id v17 = v15;
    uint64_t v18 = [v16 numberWithBool:v10];
    *(_DWORD *)long long v24 = 138543874;
    *(void *)&v24[4] = v15;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v18;
    __int16 v25 = 2114;
    long long v26 = v9;
    LODWORD(v23) = 32;
    uint64_t v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19) {
      goto LABEL_26;
    }
    v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v24, v23);
    free(v19);
    SSFileLog();
  }

LABEL_26:
  id v20 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v10) {
    id v20 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFStringRef v21 = (const __CFString *)*MEMORY[0x263F7BDC8];
  CFPreferencesSetAppValue(@"stopIncludingLocalCookies", *v20, (CFStringRef)*MEMORY[0x263F7BDC8]);
  CFPreferencesAppSynchronize(v21);
}

+ (void)_loadItemKindURLBagKeyMap
{
  if (_loadItemKindURLBagKeyMap_sOnce != -1) {
    dispatch_once(&_loadItemKindURLBagKeyMap_sOnce, &__block_literal_global_101);
  }
}

uint64_t __37__ISURLBag__loadItemKindURLBagKeyMap__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x263F7B898], *MEMORY[0x263F7B8A0], *MEMORY[0x263F7B8A8], *MEMORY[0x263F7B8B0], *MEMORY[0x263F7B8C0], *MEMORY[0x263F7B8D0], *MEMORY[0x263F7B8D8], *MEMORY[0x263F7B8E0], *MEMORY[0x263F7B8E8], *MEMORY[0x263F7B8F0], *MEMORY[0x263F7B8F8], *MEMORY[0x263F7B900], *MEMORY[0x263F7B908], *MEMORY[0x263F7B910], *MEMORY[0x263F7B918], *MEMORY[0x263F7B920], *MEMORY[0x263F7B938],
         *MEMORY[0x263F7B928],
         *MEMORY[0x263F7B930],
         *MEMORY[0x263F7B940],
         0);
  v2 = (void *)__ItemKinds;
  __ItemKinds = v1;

  __URLBagKeys = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"viewArtist", @"audiobooks", @"podcasts", @"itunes-u", @"music", @"movies", @"music-videos", @"newsstand", @"podcasts", @"podcasts", @"podcasts", @"ringtones", @"apps", @"apps", @"music", @"ringtones", @"tv-shows",
                   @"tv-shows",
                   @"music",
                   0);

  return MEMORY[0x270F9A758]();
}

+ (id)storeFrontURLBagKeyForItemKind:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _loadItemKindURLBagKeyMap];
  uint64_t v4 = [(id)__ItemKinds count];
  if (v4 < 1)
  {
LABEL_5:
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(id)__ItemKinds objectAtIndex:v6];
      int v8 = [v3 isEqualToString:v7];

      if (v8) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
    uint64_t v9 = [(id)__URLBagKeys objectAtIndex:v6];
  }

  return v9;
}

- (NSSet)availableStorefrontItemKinds
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  [(id)objc_opt_class() _loadItemKindURLBagKeyMap];
  uint64_t v4 = [(id)__URLBagKeys count];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(id)__URLBagKeys objectAtIndex:i];
      int v8 = [(ISURLBag *)self urlForKey:v7];

      if (v8)
      {
        uint64_t v9 = [(id)__ItemKinds objectAtIndex:i];
        [v3 addObject:v9];
      }
    }
  }
  uint64_t v10 = [(ISURLBag *)self networkConstraintsForDownloadKind:*MEMORY[0x263F7B570]];
  if ([v10 isAnyNetworkTypeEnabled]) {
    [v3 addObject:*MEMORY[0x263F7B8B8]];
  }

  return (NSSet *)v3;
}

- (BOOL)isValid
{
  [(ISURLBag *)self invalidationTime];
  double v4 = v3;
  int64_t v5 = [(ISURLBag *)self versionIdentifier];
  if (v4 <= -1.79769313e308) {
    return 0;
  }
  uint64_t v6 = v5;
  return CFAbsoluteTimeGetCurrent() < v4 && v6 > 370303295;
}

- (id)networkConstraintsForDownloadKind:(id)a3
{
  double v4 = (void *)MEMORY[0x263F7B298];
  bagBackend = self->_bagBackend;
  bagBackendKey = self->_bagBackendKey;
  id v7 = a3;
  int v8 = [(ISURLBagBackend *)bagBackend dictionaryRepresentationForBagWithKey:bagBackendKey];
  uint64_t v9 = (void *)[v4 newNetworkConstraintsByDownloadKindFromURLBag:v8];

  uint64_t v10 = [v9 objectForKey:v7];

  if (!v10)
  {
    defaultConstraints = self->_defaultConstraints;
    if (defaultConstraints) {
      id v12 = (id)[(SSNetworkConstraints *)defaultConstraints copy];
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x263F7B298]);
    }
    uint64_t v10 = v12;
  }

  return v10;
}

- (id)searchQueryParametersForClientIdentifier:(id)a3 networkType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ISURLBagBackend *)self->_bagBackend valueForKey:@"p2-search-parameters" forBagWithKey:self->_bagBackendKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v7 objectForKey:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = __GetDictionaryValueForNetworkType(v8, a4);
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v7;
    goto LABEL_19;
  }
  uint64_t v10 = [(ISURLBag *)self valueForKey:@"mobile-connection-type-allows"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = 0;
    goto LABEL_20;
  }
  int v8 = __GetDictionaryValueForNetworkType(v10, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  if (([v6 isEqualToString:@"eBooks"] & 1) != 0
    || [v6 isEqualToString:@"Books"])
  {
    uint64_t v11 = @"eBook-search-parameters";
    goto LABEL_9;
  }
  if (![v6 isEqualToString:@"WiFi-Music"])
  {
LABEL_18:
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = [v8 objectForKey:@"p2-store-ns-search-parameters"];
  if (v12) {
    goto LABEL_10;
  }
  uint64_t v12 = [v8 objectForKey:@"p2-store-search-parameters"];
  if (v12) {
    goto LABEL_10;
  }
  uint64_t v11 = @"p2-music-search-parameters";
LABEL_9:
  uint64_t v12 = [v8 objectForKey:v11];
LABEL_10:
  uint64_t v9 = (void *)v12;
LABEL_19:

LABEL_20:

  return v9;
}

- (void)setInvalidationTime:(double)a3
{
  if (self->_invalidationTime != a3) {
    self->_invalidationTime = a3;
  }
}

- (void)setInvalidationTimeWithExprationInterval:(double)a3
{
  double v4 = fmax(a3, 60.0) + CFAbsoluteTimeGetCurrent();

  [(ISURLBag *)self setInvalidationTime:v4];
}

- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ISURLBag *)self valueForKey:*MEMORY[0x263F7BD28]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char ShouldSendAMDForURL = SSVURLBagShouldSendAMDForURL();
  }
  else {
    char ShouldSendAMDForURL = 0;
  }

  return ShouldSendAMDForURL;
}

- (BOOL)shouldSendGUIDForURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (SSDebugAlwaysSendGUID()) {
    goto LABEL_2;
  }
  guidSchemes = self->_guidSchemes;
  id v7 = [v4 scheme];
  LODWORD(guidSchemes) = [(NSSet *)guidSchemes containsObject:v7];

  if (!guidSchemes)
  {
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (![(NSArray *)self->_guidPatterns count])
  {
LABEL_2:
    BOOL v5 = 1;
  }
  else
  {
    int v8 = [v4 absoluteString];
    uint64_t v9 = [v8 length];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = self->_guidPatterns;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, v9, (void)v16) != 0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v5 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_16:
  }
LABEL_17:

  return v5;
}

- (id)urlForKey:(id)a3
{
  double v3 = [(ISURLBag *)self valueForKey:a3];
  if (v3)
  {
    id v4 = [NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)urlIsTrusted:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  id v6 = [v4 scheme];
  char v7 = [v6 isEqualToString:@"data"];

  if (v7)
  {
    BOOL v8 = 1;
    goto LABEL_22;
  }
  uint64_t v9 = [v5 host];
  if (!v9)
  {
LABEL_19:
    BOOL v8 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = (void *)v9;
  [(ISURLBag *)self valueForKey:@"trustedDomains"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "length", (void)v18))
        {
          if ([v16 hasPrefix:@"."])
          {
            if ([v10 hasSuffix:v16]) {
              goto LABEL_20;
            }
          }
          else if (![v10 caseInsensitiveCompare:v16])
          {
LABEL_20:
            BOOL v8 = 1;
            goto LABEL_21;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_21:

LABEL_22:
  return v8;
}

- (id)URLForURL:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ISURLBag *)self valueForKey:@"p2-client-url-schemes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [v6 scheme];
    int v13 = [v12 isEqualToString:@"https"];

    if ([v7 isEqualToString:@"Software"])
    {
      uint64_t v14 = @"itms-apps";
      v15 = @"itms-appss";
    }
    else if ([v7 isEqualToString:@"MusicPlayer"])
    {
      uint64_t v14 = @"its-music";
      v15 = @"its-musics";
    }
    else if ([v7 isEqualToString:@"VideoPlayer"])
    {
      uint64_t v14 = @"its-videos";
      v15 = @"its-videoss";
    }
    else if (([v7 isEqualToString:@"eBooks"] & 1) != 0 {
           || [v7 isEqualToString:@"Books"])
    }
    {
      uint64_t v14 = @"itms-books";
      v15 = @"itms-bookss";
    }
    else if ([v7 isEqualToString:@"GameCenter"])
    {
      uint64_t v14 = @"itms-gc";
      v15 = @"itms-gcs";
    }
    else if ([v7 isEqualToString:@"iTunesU"])
    {
      uint64_t v14 = @"itms-itunesu";
      v15 = @"itms-itunesus";
    }
    else
    {
      if (![v7 isEqualToString:@"Podcasts"])
      {
        int v18 = [v7 isEqualToString:@"Newsstand"];
        uint64_t v14 = @"itms";
        if (v13) {
          uint64_t v14 = @"itmss";
        }
        long long v19 = @"itms-newss";
        if (!v13) {
          long long v19 = @"itms-news";
        }
        if (v18) {
          uint64_t v14 = v19;
        }
        goto LABEL_16;
      }
      uint64_t v14 = @"itms-podcasts";
      v15 = @"itms-podcastss";
    }
    if (v13) {
      uint64_t v14 = v15;
    }
LABEL_16:
    id v11 = v14;
    goto LABEL_17;
  }
  uint64_t v9 = [v8 objectForKey:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v10 = [v6 scheme];
  id v11 = [v9 objectForKey:v10];

  if (v11)
  {
LABEL_17:
    uint64_t v16 = [v6 urlByReplacingSchemeWithScheme:v11];

    uint64_t v9 = v11;
    id v6 = (id)v16;
    goto LABEL_18;
  }
LABEL_19:

  return v6;
}

- (id)valueForKey:(id)a3
{
  return [(ISURLBagBackend *)self->_bagBackend valueForKey:a3 forBagWithKey:self->_bagBackendKey];
}

- (id)sanitizedURLForURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ISURLBag *)self valueForKey:@"externalURLReplaceKey"];
  uint64_t v6 = [(ISURLBag *)self valueForKey:@"externalURLSearchKey"];
  id v7 = (void *)v6;
  BOOL v8 = v4;
  if (v4)
  {
    BOOL v8 = v4;
    if (v5)
    {
      BOOL v8 = v4;
      if (v6)
      {
        id v9 = objc_alloc(MEMORY[0x263F089D8]);
        uint64_t v10 = [v4 absoluteString];
        id v11 = (void *)[v9 initWithString:v10];

        uint64_t v13 = [v11 rangeOfString:v7];
        BOOL v8 = v4;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v12, v5);
          BOOL v8 = [NSURL URLWithString:v11];
        }
      }
    }
  }

  return v8;
}

- (void)setURLBagContext:(id)a3
{
  if (self->_context != a3)
  {
    self->_context = (SSURLBagContext *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (SSURLBagContext)URLBagContext
{
  v2 = (void *)[(SSURLBagContext *)self->_context copy];

  return (SSURLBagContext *)v2;
}

- (NSDictionary)URLBagDictionary
{
  return (NSDictionary *)[(ISURLBagBackend *)self->_bagBackend dictionaryRepresentationForBagWithKey:self->_bagBackendKey];
}

- (int64_t)versionIdentifier
{
  v2 = [(ISURLBag *)self valueForKey:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 timeIntervalSinceReferenceDate];
    int64_t v4 = (uint64_t)v3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263F08AC0];
  uint64_t v10 = [(ISURLBag *)self URLBagDictionary];
  id v17 = 0;
  id v11 = [v9 dataWithPropertyList:v10 format:200 options:0 error:&v17];
  id v12 = v17;

  if (v11)
  {
    id v16 = v12;
    char v13 = [v11 writeToFile:v8 options:a4 error:&v16];
    id v14 = v16;

    id v12 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    char v13 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if ((v13 & 1) == 0) {
    *a5 = v12;
  }
LABEL_7:

  return v13;
}

+ (id)copyExtraHeadersForURL:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  id v9 = (void *)[v8 copyExtraHeadersForURL:v6];
  return v9;
}

+ (id)networkConstraintsForDownloadKind:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  id v9 = [v8 networkConstraintsForDownloadKind:v6];

  return v9;
}

+ (BOOL)shouldSendGUIDForURL:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  LOBYTE(v7) = [v8 shouldSendGUIDForURL:v6];
  return (char)v7;
}

+ (id)urlBagForContext:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[ISURLBagCache sharedCache];
  id v5 = [v4 URLBagForContext:v3];

  return v5;
}

+ (id)urlForKey:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  id v9 = [v8 urlForKey:v6];

  return v9;
}

+ (BOOL)urlIsTrusted:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  LOBYTE(v7) = [v8 urlIsTrusted:v6];
  return (char)v7;
}

+ (id)valueForKey:(id)a3 inBagContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ISURLBagCache sharedCache];
  id v8 = [v7 URLBagForContext:v5];

  id v9 = [v8 valueForKey:v6];

  return v9;
}

- (id)_copyGUIDPatternsFromBagBackend
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  int64_t v4 = [(ISURLBag *)self valueForKey:@"guid-urls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKey:@"regex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
            id v12 = objc_alloc(MEMORY[0x263F08AE8]);
            char v13 = objc_msgSend(v12, "initWithPattern:options:error:", v11, 1, 0, (void)v15);
            if (v13) {
              [v3 addObject:v13];
            }

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"/WebObjects/MZ(Buy|Finance|FastFinance)[.]woa/" options:1 error:0];
    if (v5) {
      [v3 addObject:v5];
    }
  }

  return v3;
}

- (id)_copyGUIDSchemesFromBagBackend
{
  v2 = [(ISURLBag *)self valueForKey:@"guid-urls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"schemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    }
    id v5 = v4;

    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"https", 0);
    if (!v5)
    {
LABEL_8:
      id v6 = 0;
      goto LABEL_9;
    }
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
LABEL_9:

  return v6;
}

- (id)_copyHeaderPatternsFromBagBackend
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(ISURLBag *)self valueForKey:@"send-content-restrictions-header"];
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          id v12 = objc_alloc(MEMORY[0x263F08AE8]);
          char v13 = objc_msgSend(v12, "initWithPattern:options:error:", v11, 1, 0, (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      [v3 setObject:v5 forKey:@"X-Apple-Restrictions"];
    }
  }
  if (![v3 count])
  {

    return 0;
  }
  return v3;
}

- (id)_networkConstraintsCachePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, @"com.apple.iTunesStore", @"network-constraints.plist", 0);
  id v5 = [NSString pathWithComponents:v4];

  return v5;
}

- (void)_preprocessURLResolutionCacheDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 objectForKey:@"p2-url-resolution"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  __int16 v25 = v3;
  obuint64_t j = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 objectForKey:@"p2-url-section-name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (([v10 isEqualToString:@"AppleMusicSubscriber"] & 1) != 0
             || ([v10 isEqualToString:@"AppleMusicUndecided"] & 1) != 0
             || ([v10 isEqualToString:@"AppleMusicDisabled"] & 1) != 0))
          {

            id v12 = @"AppleMusicSubscriber";
            uint64_t v11 = @"AppleMusicUndecided";
            char v13 = @"AppleMusicDisabled";
            id v4 = obj;
            goto LABEL_17;
          }
        }
      }
      id v4 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v11 = @"Music";
    id v12 = @"Music";
    char v13 = @"MusicNS";
  }
  else
  {
    uint64_t v11 = @"Music";
    char v13 = @"MusicNS";
    id v12 = @"Music";
  }
LABEL_17:

  id v14 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", v12, v11, v13, 0);
  if (CFPreferencesGetAppBooleanValue(@"UserRequestedSubscriptionHidden", @"com.apple.mobileipod", 0))
  {
    [v14 removeObject:v13];
  }
  else
  {
    long long v15 = [MEMORY[0x263F7B3E8] sharedCoordinator];
    long long v16 = [v15 lastKnownStatus];

    if ([v16 accountStatus] != 3 && objc_msgSend(v16, "accountStatus") != 4) {
      id v12 = v11;
    }
    [v14 removeObject:v12];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = (void *)[v4 mutableCopy];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v4;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          BOOL v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [v22 objectForKey:@"p2-url-section-name"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 containsObject:v23]) {
              [v27 removeObject:v22];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    uint64_t v24 = [v27 count];
    id v3 = v25;
    if (v24 != [v17 count]) {
      [v25 setObject:v27 forKey:@"p2-url-resolution"];
    }

    id v4 = obj;
  }
}

- (void)_setBagBackendWithDictionary:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:v7];
    bagBackend = self->_bagBackend;
    uint64_t v6 = [v4 dictionaryByEvaluatingConditions];
    [(ISURLBagBackend *)bagBackend addBagValues:v6 forBagWithKey:self->_bagBackendKey];
  }
  else
  {
    [(ISURLBagBackend *)self->_bagBackend removeBagValuesForBagWithKey:self->_bagBackendKey];
  }
}

- (void)_writeNetworkConstraintsCacheFile
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(ISURLBag *)self _networkConstraintsCachePath];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08850]);
    uint64_t v5 = [(ISURLBag *)self valueForKey:@"mobile-connection-type-allows"];
    if (![v5 count])
    {
      [v4 removeItemAtPath:v3 error:0];
      goto LABEL_19;
    }
    uint64_t v6 = [v4 attributesOfItemAtPath:v3 error:0];
    id v7 = [v6 objectForKey:*MEMORY[0x263F08048]];

    if (v7)
    {
      [v7 timeIntervalSinceNow];
      if (v8 >= -86400.0)
      {
LABEL_17:

LABEL_19:
        goto LABEL_20;
      }
    }
    uint64_t v9 = [MEMORY[0x263F08AC0] dataWithPropertyList:v5 format:200 options:0 error:0];
    uint64_t v10 = [v3 stringByDeletingLastPathComponent];
    [v4 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];

    [v9 writeToFile:v3 options:0 error:0];
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v13 &= 2u;
    }
    if (v13)
    {
      *(_DWORD *)uint64_t v18 = 138412546;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v3;
      id v15 = *(id *)&v18[4];
      LODWORD(v17) = 22;
      long long v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16]);
      free(v16);
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_20:
}

- (void)_writeURLResolutionCacheFile
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (uint64_t i = 0; i != 11; ++i)
  {
    uint64_t v5 = kURLResolutionKeys[i];
    uint64_t v6 = [(ISURLBag *)self valueForKey:v5];
    if (v6) {
      [v3 setObject:v6 forKey:v5];
    }
  }
  [(ISURLBag *)self _preprocessURLResolutionCacheDictionary:v3];
  id v7 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Caches/com.apple.itunesstored/url-resolution.plist"];
  double v8 = [MEMORY[0x263F08850] defaultManager];
  if (![v3 count])
  {
    if (([v8 removeItemAtPath:v7 error:0] & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v9 = [v8 attributesOfItemAtPath:v7 error:0];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F08048]];

  if (v10 && ([v10 timeIntervalSinceNow], v11 >= -60.0)
    || (int v12 = (void *)MEMORY[0x263F08850],
        [v7 stringByDeletingLastPathComponent],
        int v13 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v12) = [v12 ensureDirectoryExists:v13],
        v13,
        !v12))
  {

    goto LABEL_23;
  }
  id v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];
  HIDWORD(v24) = [v14 writeToFile:v7 options:0 error:0];
  id v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v15)
  {
    id v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  uint64_t v18 = [v15 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    int v19 = v17;
  }
  else {
    int v19 = v17 & 2;
  }
  if (v19)
  {
    LODWORD(v25) = 138412290;
    *(void *)((char *)&v25 + 4) = objc_opt_class();
    id v20 = *(id *)((char *)&v25 + 4);
    LODWORD(v24) = 12;
    long long v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v25, v24, v25);
      free(v21);
      SSFileLog();
    }
  }
  else
  {
  }
  if (HIDWORD(v24))
  {
LABEL_22:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.changed-url-resolution", 0, 0, 1u);
  }
LABEL_23:
}

- (double)invalidationTime
{
  return self->_invalidationTime;
}

- (BOOL)loadedFromDiskCache
{
  return self->_loadedFromDiskCache;
}

- (void)setLoadedFromDiskCache:(BOOL)a3
{
  self->_loadedFromDiskCache = a3;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)bagBackendKey
{
  return self->_bagBackendKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_headerPatterns, 0);
  objc_storeStrong((id *)&self->_guidSchemes, 0);
  objc_storeStrong((id *)&self->_guidPatterns, 0);
  objc_storeStrong((id *)&self->_bagBackendKey, 0);
  objc_storeStrong((id *)&self->_bagBackend, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end