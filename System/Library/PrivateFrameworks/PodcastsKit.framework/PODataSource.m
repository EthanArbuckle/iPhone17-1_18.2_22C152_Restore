@interface PODataSource
+ (id)sharedInstance;
- (BOOL)constructingData;
- (BOOL)isPodcastDataStale;
- (BOOL)isPodcastRevisionDataStale;
- (BOOL)isPodcastsInstalled;
- (NSDate)podcastDataPlistLastModified;
- (NSDate)revisionsDataPlistLastModified;
- (NSMutableArray)podcastRevisions;
- (NSMutableDictionary)podcastCollectionsByUUID;
- (NSMutableDictionary)podcastStationsByUUID;
- (NSString)databaseUUID;
- (NSString)firstRevisionUUID;
- (NSURL)plistBasePath;
- (PODataSource)init;
- (PODataSource)initWithPlistPath:(id)a3;
- (id)arrayFromPlistURL:(id)a3;
- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4;
- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5;
- (id)description;
- (id)domainObjectWithUUID:(id)a3;
- (id)podcastCollectionWithUUID:(id)a3;
- (id)podcastCollections;
- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4;
- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5;
- (id)podcastRevisionsSinceAnchor:(unint64_t)a3;
- (id)podcastStationWithUUID:(id)a3;
- (id)podcastStations;
- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4;
- (id)podcastsIndexPath;
- (id)validity;
- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4;
- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5;
- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4;
- (void)getContainerURL:(id)a3;
- (void)getDatabaseURL:(id)a3;
- (void)getRevisionURL:(id)a3;
- (void)getURLs:(id)a3;
- (void)initializeDataFromDictionary;
- (void)setConstructingData:(BOOL)a3;
- (void)setDatabaseUUID:(id)a3;
- (void)setFirstRevisionUUID:(id)a3;
- (void)setPlistBasePath:(id)a3;
- (void)setPodcastCollectionsByUUID:(id)a3;
- (void)setPodcastDataPlistLastModified:(id)a3;
- (void)setPodcastRevisions:(id)a3;
- (void)setPodcastStationsByUUID:(id)a3;
- (void)setRevisionsDataPlistLastModified:(id)a3;
@end

@implementation PODataSource

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__PODataSource_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__PODataSource_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (PODataSource)init
{
  return [(PODataSource *)self initWithPlistPath:0];
}

- (PODataSource)initWithPlistPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PODataSource;
  v5 = [(PODataSource *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    [(PODataSource *)v5 setPodcastCollectionsByUUID:v6];

    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(PODataSource *)v5 setPodcastStationsByUUID:v7];

    v8 = [MEMORY[0x263EFF980] array];
    [(PODataSource *)v5 setPodcastRevisions:v8];

    [(PODataSource *)v5 setPlistBasePath:v4];
    [(PODataSource *)v5 initializeDataFromDictionary];
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v9 = POLogContextSync;
  }
  else {
    v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_23F08F000, v9, OS_LOG_TYPE_INFO, "Data source is %@", buf, 0xCu);
  }

  return v5;
}

- (id)arrayFromPlistURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v3 path];
  v6 = [v4 contentsAtPath:v5];

  if (v6)
  {
    id v13 = 0;
    v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v13];
    id v8 = v13;
    if (!v8)
    {
      v9 = 0;
      if (v7) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v8 = 0;
    v7 = 0;
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v10 = POLogContextSync;
  }
  else {
    v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[PODataSource arrayFromPlistURL:]();
  }
  objc_super v11 = _MTLogCategorySiri();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[PODataSource arrayFromPlistURL:]();
  }

  v9 = v8;
LABEL_14:

  return v7;
}

- (BOOL)isPodcastsInstalled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.podcasts" allowPlaceholder:0 error:&v6];
  id v3 = v6;
  if (v3)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      id v4 = POLogContextSync;
    }
    else {
      id v4 = &_os_log_internal;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_INFO, "Could not load application record. If the Podcasts app is actually installed, this represents an error: %@.", buf, 0xCu);
    }
  }

  return v2 != 0;
}

- (void)getURLs:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void))a3;
  v5 = [(PODataSource *)self plistBasePath];

  if (v5)
  {
    id v6 = [(PODataSource *)self plistBasePath];
    v7 = [v6 URLByAppendingPathComponent:@"PodcastsDB.plist"];

    id v8 = [(PODataSource *)self plistBasePath];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"PodcastsDiff.plist"];

    v4[2](v4, v7, v9, 0);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __24__PODataSource_getURLs___block_invoke;
    v10[3] = &unk_265055AA0;
    objc_super v11 = v4;
    [(PODataSource *)self getContainerURL:v10];
  }
}

void __24__PODataSource_getURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 URLByAppendingPathComponent:@"Documents/PodcastsDB.plist"];
  v7 = [v6 URLByAppendingPathComponent:@"Documents/PodcastsDiff.plist"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDatabaseURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__PODataSource_getDatabaseURL___block_invoke;
  v6[3] = &unk_265055AC8;
  id v7 = v4;
  id v5 = v4;
  [(PODataSource *)self getURLs:v6];
}

uint64_t __31__PODataSource_getDatabaseURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRevisionURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__PODataSource_getRevisionURL___block_invoke;
  v6[3] = &unk_265055AC8;
  id v7 = v4;
  id v5 = v4;
  [(PODataSource *)self getURLs:v6];
}

uint64_t __31__PODataSource_getRevisionURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getContainerURL:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void, void *))a3;
  if (v3)
  {
    uint64_t v4 = container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    xpc_object_t v5 = xpc_string_create("com.apple.podcasts");
    container_query_set_identifiers();
    if (!container_query_get_single_result())
    {
      if (container_query_get_last_error() && (uint64_t v17 = container_error_copy_unlocalized_description()) != 0)
      {
        v18 = (void *)v17;
        uint64_t v19 = [NSString stringWithUTF8String:v17];
        v20 = (void *)v19;
        if (v19)
        {
          uint64_t v29 = *MEMORY[0x263F07F80];
          v30[0] = v19;
          v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
        }
        else
        {
          v21 = 0;
        }
        free(v18);
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      v25 = _MTLogCategorySiri();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        uint64_t v28 = (uint64_t)v20;
        _os_log_impl(&dword_23F08F000, v25, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed. Description: '%@'", (uint8_t *)&v27, 0xCu);
      }

      v26 = [MEMORY[0x263F087E8] errorWithDomain:@"PODataSourceErrorDomain" code:1 userInfo:v21];
      v3[2](v3, 0, v26);

      goto LABEL_39;
    }
    uint64_t v6 = container_copy_sandbox_token();
    if (!v6) {
      goto LABEL_9;
    }
    id v7 = (void *)v6;
    uint64_t v8 = sandbox_extension_consume();
    uint64_t v9 = _MTLogCategorySiri();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v27 = 134217984;
      uint64_t v28 = v8;
      _os_log_impl(&dword_23F08F000, v9, OS_LOG_TYPE_INFO, "Consumed sandbox token and received handle %lli", (uint8_t *)&v27, 0xCu);
    }

    free(v7);
    if (v8)
    {
      uint64_t path = container_get_path();
      if (v8 == -1)
      {
        v23 = _MTLogCategorySiri();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_23F08F000, v23, OS_LOG_TYPE_ERROR, "Something went wrong with getting the sandbox extension.", (uint8_t *)&v27, 2u);
        }

        v24 = [MEMORY[0x263F087E8] errorWithDomain:@"PODataSourceErrorDomain" code:2 userInfo:0];
        v3[2](v3, 0, v24);

        if (!v4) {
          goto LABEL_39;
        }
LABEL_29:
        container_query_free();
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v11 = path;
    }
    else
    {
LABEL_9:
      v12 = _MTLogCategorySiri();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_23F08F000, v12, OS_LOG_TYPE_INFO, "Handle is 0. Maybe we were not issued a token, the app is not sandboxed, or this extension is not needed to access the container.", (uint8_t *)&v27, 2u);
      }

      uint64_t v11 = container_get_path();
      uint64_t v8 = 0;
    }
    id v13 = _MTLogCategorySiri();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        int v27 = 136315138;
        uint64_t v28 = v11;
        _os_log_impl(&dword_23F08F000, v13, OS_LOG_TYPE_INFO, "Found container path %s", (uint8_t *)&v27, 0xCu);
      }

      v15 = [NSString stringWithUTF8String:v11];
      v16 = [NSURL fileURLWithPath:v15 isDirectory:1];
      ((void (**)(id, void *, void *))v3)[2](v3, v16, 0);
    }
    else
    {
      if (v14)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_23F08F000, v13, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed.", (uint8_t *)&v27, 2u);
      }

      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"PODataSourceErrorDomain" code:1 userInfo:0];
      v3[2](v3, 0, v15);
    }

    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v22 = _MTLogCategorySiri();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v27 = 134217984;
        uint64_t v28 = v8;
        _os_log_impl(&dword_23F08F000, v22, OS_LOG_TYPE_INFO, "Releasing sandbox extension %lli", (uint8_t *)&v27, 0xCu);
      }

      sandbox_extension_release();
    }
    if (!v4) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
LABEL_40:
}

- (BOOL)isPodcastRevisionDataStale
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__PODataSource_isPodcastRevisionDataStale__block_invoke;
  v4[3] = &unk_265055AF0;
  v4[4] = self;
  v4[5] = &v5;
  [(PODataSource *)self getRevisionURL:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__PODataSource_isPodcastRevisionDataStale__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    char v8 = [v5 path];
    uint64_t v9 = [v7 attributesOfItemAtPath:v8 error:0];
    v10 = [v9 fileModificationDate];
    uint64_t v11 = [*(id *)(a1 + 32) revisionsDataPlistLastModified];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 isEqual:v11] ^ 1;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v12 = POLogContextSync;
    }
    else {
      v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __42__PODataSource_isPodcastRevisionDataStale__block_invoke_cold_1();
    }
  }
}

- (BOOL)isPodcastDataStale
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__PODataSource_isPodcastDataStale__block_invoke;
  v4[3] = &unk_265055AF0;
  v4[4] = self;
  v4[5] = &v5;
  [(PODataSource *)self getDatabaseURL:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__PODataSource_isPodcastDataStale__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    char v8 = [v5 path];
    uint64_t v9 = [v7 attributesOfItemAtPath:v8 error:0];
    v10 = [v9 fileModificationDate];
    uint64_t v11 = [*(id *)(a1 + 32) podcastDataPlistLastModified];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 isEqual:v11] ^ 1;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v12 = POLogContextSync;
    }
    else {
      v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __34__PODataSource_isPodcastDataStale__block_invoke_cold_1();
    }
  }
}

- (NSMutableDictionary)podcastCollectionsByUUID
{
  id v3 = self->_podcastCollectionsByUUID;
  objc_sync_enter(v3);
  if ([(PODataSource *)self isPodcastDataStale]
    && ![(PODataSource *)self constructingData])
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v4 = POLogContextSync;
    }
    else {
      uint64_t v4 = &_os_log_internal;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v7, 2u);
    }
    [(PODataSource *)self initializeDataFromDictionary];
  }
  objc_sync_exit(v3);

  podcastCollectionsByUUID = self->_podcastCollectionsByUUID;
  return podcastCollectionsByUUID;
}

- (NSMutableDictionary)podcastStationsByUUID
{
  id v3 = self->_podcastStationsByUUID;
  objc_sync_enter(v3);
  if ([(PODataSource *)self isPodcastDataStale]
    && ![(PODataSource *)self constructingData])
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v4 = POLogContextSync;
    }
    else {
      uint64_t v4 = &_os_log_internal;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v7, 2u);
    }
    [(PODataSource *)self initializeDataFromDictionary];
  }
  objc_sync_exit(v3);

  podcastStationsByUUID = self->_podcastStationsByUUID;
  return podcastStationsByUUID;
}

- (id)validity
{
  id v3 = NSString;
  uint64_t v4 = [(PODataSource *)self databaseUUID];
  id v5 = [(PODataSource *)self firstRevisionUUID];
  id v6 = [v3 stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (NSMutableArray)podcastRevisions
{
  id v3 = self->_podcastRevisions;
  objc_sync_enter(v3);
  if ([(PODataSource *)self isPodcastRevisionDataStale]
    && ![(PODataSource *)self constructingData])
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v4 = POLogContextSync;
    }
    else {
      uint64_t v4 = &_os_log_internal;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_INFO, "Podcast revision data is stale, going to reinitialize from plist.", v7, 2u);
    }
    [(PODataSource *)self initializeDataFromDictionary];
  }
  objc_sync_exit(v3);

  podcastRevisions = self->_podcastRevisions;
  return podcastRevisions;
}

- (void)initializeDataFromDictionary
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F08F000, log, OS_LOG_TYPE_ERROR, "Recursive call to initializeData while constructing. This is a programming error.  Please fix.", v1, 2u);
}

void __44__PODataSource_initializeDataFromDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      char v8 = POLogContextSync;
    }
    else {
      char v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__PODataSource_initializeDataFromDictionary__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _withExtensionParseDataDictionary:a2 revisionDictionary:a3];
  }
}

- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = (NSMutableArray *)a3;
  id v7 = a4;
  char v8 = [(PODataSource *)self arrayFromPlistURL:v6];
  uint64_t v9 = [(PODataSource *)self arrayFromPlistURL:v7];
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v10 = POLogContextSync;
  }
  else {
    v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v76 = v6;
    _os_log_impl(&dword_23F08F000, v10, OS_LOG_TYPE_INFO, "Constructing data source from %@", buf, 0xCu);
  }
  v67 = self;
  if (!v8) {
    goto LABEL_38;
  }
  uint64_t v11 = [v8 objectAtIndexedSubscript:0];
  v12 = [v11 objectForKeyedSubscript:@"children"];
  id v13 = v12;
  if (!v12)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v31 = POLogContextSync;
    }
    else {
      v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:]();
    }
    goto LABEL_20;
  }
  if ([v12 count] == 2)
  {
    v60 = v9;
    v62 = v8;
    id v64 = v7;
    BOOL v14 = [v13 objectAtIndexedSubscript:0];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"children"];

    v16 = [v13 objectAtIndexedSubscript:1];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"children"];

    v18 = [MEMORY[0x263F088C8] indexPathWithIndex:0];
    v66 = (void *)v15;
    uint64_t v19 = [(PODataSource *)self constructModelObjectsFromDictionaries:v15 withIndexPath:v18 modelObjectClass:objc_opt_class()];

    [(NSMutableDictionary *)self->_podcastCollectionsByUUID removeAllObjects];
    [(NSMutableDictionary *)self->_podcastCollectionsByUUID addEntriesFromDictionary:v19];
    v20 = [MEMORY[0x263F088C8] indexPathWithIndex:1];
    v21 = (void *)v17;
    v22 = [(PODataSource *)self constructModelObjectsFromDictionaries:v17 withIndexPath:v20 modelObjectClass:objc_opt_class()];

    [(NSMutableDictionary *)self->_podcastStationsByUUID removeAllObjects];
    [(NSMutableDictionary *)self->_podcastStationsByUUID addEntriesFromDictionary:v22];
    v23 = [MEMORY[0x263F08850] defaultManager];
    v24 = v6;
    v25 = [(NSMutableArray *)v6 path];
    v26 = [v23 attributesOfItemAtPath:v25 error:0];
    int v27 = [v26 fileModificationDate];
    [(PODataSource *)v67 setPodcastDataPlistLastModified:v27];

    self = v67;
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v28 = POLogContextSync;
    }
    else {
      uint64_t v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = v28;
      v30 = [(PODataSource *)v67 podcastDataPlistLastModified];
      *(_DWORD *)buf = 138412290;
      v76 = v30;
      _os_log_impl(&dword_23F08F000, v29, OS_LOG_TYPE_INFO, "Podcast data last modified is %@", buf, 0xCu);
    }
    id v6 = v24;
    char v8 = v62;
    id v7 = v64;
    uint64_t v9 = v60;
LABEL_20:
    v32 = [v11 objectForKeyedSubscript:@"uuid"];
    if (v32)
    {
      [(PODataSource *)self setDatabaseUUID:v32];
      POLogInitIfNeeded();
      if (POLogContextSync) {
        v33 = POLogContextSync;
      }
      else {
        v33 = &_os_log_internal;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        [(PODataSource *)self databaseUUID];
        v35 = v9;
        v36 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v76 = v36;
        _os_log_impl(&dword_23F08F000, v34, OS_LOG_TYPE_INFO, "Database UUID is %@", buf, 0xCu);

        uint64_t v9 = v35;
        self = v67;
      }
    }
    else
    {
      POLogInitIfNeeded();
      if (POLogContextSync) {
        v38 = POLogContextSync;
      }
      else {
        v38 = &_os_log_internal;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:]();
      }
    }

LABEL_38:
    if (v9)
    {
      v63 = v8;
      v65 = v7;
      v59 = v6;
      [(NSMutableArray *)self->_podcastRevisions removeAllObjects];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v61 = v9;
      id v39 = v9;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v70 objects:v74 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v71;
        char v43 = 1;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v71 != v42) {
              objc_enumerationMutation(v39);
            }
            v45 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            if (v43)
            {
              v46 = [*(id *)(*((void *)&v70 + 1) + 8 * i) objectForKeyedSubscript:@"uuid"];
              if (v46)
              {
                [(PODataSource *)self setFirstRevisionUUID:v46];
                POLogInitIfNeeded();
                if (POLogContextSync) {
                  v47 = POLogContextSync;
                }
                else {
                  v47 = &_os_log_internal;
                }
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  v48 = v47;
                  v49 = [(PODataSource *)v67 firstRevisionUUID];
                  *(_DWORD *)buf = 138412290;
                  v76 = v49;
                  _os_log_impl(&dword_23F08F000, v48, OS_LOG_TYPE_INFO, "First Revision UUID is %@", buf, 0xCu);
                }
              }
              else
              {
                POLogInitIfNeeded();
                if (POLogContextSync) {
                  v50 = POLogContextSync;
                }
                else {
                  v50 = &_os_log_internal;
                }
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                  -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:](&v68, v69, v50);
                }
              }

              self = v67;
            }
            v51 = [v45 objectForKeyedSubscript:@"podcasts"];
            if (v51) {
              [(PODataSource *)self constructRevisionsFromDictionary:v51 isPodcastCollections:1];
            }
            v52 = [v45 objectForKeyedSubscript:@"stations"];
            if (v52) {
              [(PODataSource *)self constructRevisionsFromDictionary:v52 isPodcastCollections:0];
            }

            char v43 = 0;
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v70 objects:v74 count:16];
          char v43 = 0;
        }
        while (v41);
      }

      v53 = [MEMORY[0x263F08850] defaultManager];
      id v7 = v65;
      v54 = [v65 path];
      v55 = [v53 attributesOfItemAtPath:v54 error:0];
      v56 = [v55 fileModificationDate];
      [(PODataSource *)self setRevisionsDataPlistLastModified:v56];

      POLogInitIfNeeded();
      if (POLogContextSync) {
        v57 = POLogContextSync;
      }
      else {
        v57 = &_os_log_internal;
      }
      id v6 = v59;
      uint64_t v9 = v61;
      char v8 = v63;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        podcastRevisions = self->_podcastRevisions;
        *(_DWORD *)buf = 138412290;
        v76 = podcastRevisions;
        _os_log_impl(&dword_23F08F000, v57, OS_LOG_TYPE_INFO, "Podcast revisions are %@", buf, 0xCu);
      }
    }
    goto LABEL_68;
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v37 = POLogContextSync;
  }
  else {
    v37 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:].cold.4();
  }

LABEL_68:
}

- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v6 objectForKeyedSubscript:@"inserted"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PODataSource *)self constructRevisionFromDictionary:*(void *)(*((void *)&v23 + 1) + 8 * v11++) isPodcastCollections:v4 isDelete:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = objc_msgSend(v6, "objectForKeyedSubscript:", @"deleted", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
        int v27 = @"uuid";
        uint64_t v28 = v17;
        v18 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        [(PODataSource *)self constructRevisionFromDictionary:v18 isPodcastCollections:v4 isDelete:1];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setRevisionID:", -[NSMutableArray count](self->_podcastRevisions, "count"));
  if (v5) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v11 setRevisionType:v9];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"uuid"];

  [v11 setObjectID:v10];
  [v11 setIsPodcastCollection:v6];
  [(NSMutableArray *)self->_podcastRevisions addObject:v11];
}

- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(a3);
  id v7 = [v5 objectForKey:@"uuid"];
  [v6 setUuid:v7];

  id v8 = [v5 objectForKey:@"title"];
  [v6 setTitle:v8];

  uint64_t v9 = [v5 objectForKey:@"feedUrl"];
  [v6 setFeedUrl:v9];

  uint64_t v10 = [v5 objectForKey:@"storeId"];

  [v6 setStoreId:v10];
  return v6;
}

- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = [(PODataSource *)self constructModelObjectOfClass:a5 fromDictionary:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        uint64_t v17 = [v9 indexPathByAddingIndex:v13 + i];
        [v16 setIndexPath:v17];

        v18 = [v16 uuid];
        [v10 setObject:v16 forKeyedSubscript:v18];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      v13 += i;
    }
    while (v12);
  }

  return v10;
}

- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend(v15, "title", (void)v19);
      uint64_t v17 = [v16 rangeOfString:v8 options:1];

      if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
        [v9 addObject:v15];
      }
      if (a5 >= 1 && [v9 count] == a5) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v9;
}

- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PODataSource *)self podcastCollections];
  id v8 = [(PODataSource *)self podcastModelObjectsInArray:v7 matchingString:v6 maxResults:a4];

  return v8;
}

- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PODataSource *)self podcastStations];
  id v8 = [(PODataSource *)self podcastModelObjectsInArray:v7 matchingString:v6 maxResults:a4];

  return v8;
}

- (id)podcastCollectionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PODataSource *)self podcastCollectionsByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)podcastCollections
{
  char v2 = [(PODataSource *)self podcastCollectionsByUUID];
  id v3 = [v2 allValues];

  return v3;
}

- (id)podcastStationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PODataSource *)self podcastStationsByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)podcastStations
{
  char v2 = [(PODataSource *)self podcastStationsByUUID];
  id v3 = [v2 allValues];

  return v3;
}

- (id)podcastRevisionsSinceAnchor:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(PODataSource *)self podcastRevisions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 revisionID] >= a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)domainObjectWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PODataSource *)self podcastCollectionsByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = [(PODataSource *)self podcastStationsByUUID];
    id v6 = [v7 objectForKeyedSubscript:v4];
  }
  uint64_t v8 = [v6 SAMPCollection];

  return v8;
}

- (id)podcastsIndexPath
{
  return (id)[MEMORY[0x263F088C8] indexPathWithIndex:0];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PODataSource *)self podcastCollectionsByUUID];
  uint64_t v7 = [(PODataSource *)self podcastStationsByUUID];
  uint64_t v8 = [v3 stringWithFormat:@"%@ (%p) podcast collections: %@, podcast stations: %@", v5, self, v6, v7];

  return v8;
}

- (void)setPodcastCollectionsByUUID:(id)a3
{
}

- (void)setPodcastStationsByUUID:(id)a3
{
}

- (void)setPodcastRevisions:(id)a3
{
}

- (NSString)databaseUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabaseUUID:(id)a3
{
}

- (NSString)firstRevisionUUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstRevisionUUID:(id)a3
{
}

- (NSDate)podcastDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPodcastDataPlistLastModified:(id)a3
{
}

- (NSDate)revisionsDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRevisionsDataPlistLastModified:(id)a3
{
}

- (BOOL)constructingData
{
  return self->_constructingData;
}

- (void)setConstructingData:(BOOL)a3
{
  self->_constructingData = a3;
}

- (NSURL)plistBasePath
{
  return self->_plistBasePath;
}

- (void)setPlistBasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBasePath, 0);
  objc_storeStrong((id *)&self->_revisionsDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_podcastDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_firstRevisionUUID, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_podcastRevisions, 0);
  objc_storeStrong((id *)&self->_podcastStationsByUUID, 0);
  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, 0);
}

- (void)arrayFromPlistURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_23F08F000, v0, OS_LOG_TYPE_FAULT, "Error reading plist from path: %@ - with error: %@", v1, 0x16u);
}

- (void)arrayFromPlistURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_23F08F000, v0, OS_LOG_TYPE_ERROR, "Error reading plist at %@: %@", v1, 0x16u);
}

void __42__PODataSource_isPodcastRevisionDataStale__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "Failed to get revision URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

void __34__PODataSource_isPodcastDataStale__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "Failed to get database URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

void __44__PODataSource_initializeDataFromDictionary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "Failed to get plist URLs for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

- (void)_withExtensionParseDataDictionary:(os_log_t)log revisionDictionary:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23F08F000, log, OS_LOG_TYPE_ERROR, "Unable to get UUID for first revision.", buf, 2u);
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "Unable to get UUID for root object, sync data will not have proper validity.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "Unable to locate root child array.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23F08F000, v0, v1, "First child's children isn't of length 2.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

@end