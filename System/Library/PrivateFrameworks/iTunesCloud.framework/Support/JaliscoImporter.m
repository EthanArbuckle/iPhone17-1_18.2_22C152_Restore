@interface JaliscoImporter
+ (OS_os_log)logCategory;
+ (OS_os_log)oversizeLogCategory;
- (BOOL)includeFlavors;
- (BOOL)includeHiddenItems;
- (BOOL)includePreorders;
- (BOOL)isCancelled;
- (BOOL)needsUpdateForTokens;
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldRestart;
- (CloudLibraryConnection)connection;
- (ICConnectionConfiguration)configuration;
- (JaliscoImporter)initWithConnection:(id)a3;
- (ML3MusicLibrary)musicLibrary;
- (NSMutableArray)itemsFiles;
- (NSString)currentPaginationToken;
- (NSString)description;
- (NSString)updateBaseDirectory;
- (OS_tcc_identity)clientIdentity;
- (float)progress;
- (id)metadataKeys;
- (id)purchaseTokens;
- (id)queryFilter;
- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (unsigned)currentPageNumber;
- (unsigned)onDiskRevision;
- (unsigned)restartCount;
- (unsigned)updateFromRevision;
- (unsigned)updateToRevision;
- (void)_performNextItemsPageRequestWithCompletion:(id)a3;
- (void)_processItemsPageResponse:(id)a3 withCompletion:(id)a4;
- (void)cancel;
- (void)importTracksUpToRevision:(unsigned int)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)setClientIdentity:(id)a3;
- (void)setCurrentPageNumber:(unsigned int)a3;
- (void)setCurrentPaginationToken:(id)a3;
- (void)setItemsFiles:(id)a3;
- (void)setProgress:(float)a3;
- (void)setRestartCount:(unsigned int)a3;
- (void)setShouldRestart:(BOOL)a3;
- (void)setUpdateBaseDirectory:(id)a3;
- (void)setUpdateFromRevision:(unsigned int)a3;
- (void)setUpdateToRevision:(unsigned int)a3;
@end

@implementation JaliscoImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_itemsFiles, 0);
  objc_storeStrong((id *)&self->_updateBaseDirectory, 0);
  objc_storeStrong((id *)&self->_currentPaginationToken, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (JaliscoImporter)initWithConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"JaliscoImporter.m", 58, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)JaliscoImporter;
  v7 = [(JaliscoImporter *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    uint64_t v9 = [v6 configuration];
    configuration = v8->_configuration;
    v8->_configuration = (ICConnectionConfiguration *)v9;

    v11 = [v6 userIdentity];
    uint64_t v12 = +[ML3MusicLibrary musicLibraryForUserAccount:v11];
    musicLibrary = v8->_musicLibrary;
    v8->_musicLibrary = (ML3MusicLibrary *)v12;
  }
  return v8;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (void)setClientIdentity:(id)a3
{
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setItemsFiles:(id)a3
{
}

- (NSMutableArray)itemsFiles
{
  return self->_itemsFiles;
}

- (void)setUpdateFromRevision:(unsigned int)a3
{
  self->_updateFromRevision = a3;
}

- (unsigned)updateFromRevision
{
  return self->_updateFromRevision;
}

- (void)setUpdateToRevision:(unsigned int)a3
{
  self->_updateToRevision = a3;
}

- (unsigned)updateToRevision
{
  return self->_updateToRevision;
}

- (void)setUpdateBaseDirectory:(id)a3
{
}

- (NSString)updateBaseDirectory
{
  return self->_updateBaseDirectory;
}

- (void)setRestartCount:(unsigned int)a3
{
  self->_restartCount = a3;
}

- (unsigned)restartCount
{
  return self->_restartCount;
}

- (void)setCurrentPageNumber:(unsigned int)a3
{
  self->_currentPageNumber = a3;
}

- (unsigned)currentPageNumber
{
  return self->_currentPageNumber;
}

- (void)setCurrentPaginationToken:(id)a3
{
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (void)setShouldRestart:(BOOL)a3
{
  self->_shouldRestart = a3;
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if (a4 == 1836081511)
  {
    self->_currentPaginationToken = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    _objc_release_x1();
  }
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1836413554) {
    self->_shouldRestart = 1;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1836413554 || a4 == 1633968755;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL v4 = a4 == 1836081511 || a4 == 1836413554;
  BOOL v5 = a4 == 1633968755 || v4;
  return !self->_shouldRestart && v5;
}

- (void)_processItemsPageResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  itemsFiles = self->_itemsFiles;
  uint64_t v9 = [v6 responseDataFileURL];
  [(NSMutableArray *)itemsFiles addObject:v9];

  self->_shouldRestart = 0;
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = 0;

  int v11 = _os_feature_enabled_impl();
  uint64_t v12 = [v6 responseDataFileURL];
  v13 = +[NSInputStream inputStreamWithURL:v12];

  id v14 = [objc_alloc((Class)DKDAAPParser) initWithStream:v13];
  [v14 setDelegate:self];
  [v14 parse];
  if (self->_shouldRestart)
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int restartCount = self->_restartCount;
      int v25 = 138543618;
      v26 = self;
      __int16 v27 = 1024;
      LODWORD(v28) = restartCount;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Server requested restart. restartCount=%u", (uint8_t *)&v25, 0x12u);
    }

    v17 = self->_currentPaginationToken;
    self->_currentPaginationToken = 0;

    [(NSMutableArray *)self->_itemsFiles removeAllObjects];
    unsigned int v18 = self->_restartCount + 1;
    self->_currentPageNumber = 1;
    self->_unsigned int restartCount = v18;
    goto LABEL_9;
  }
  if (self->_currentPaginationToken) {
    int v19 = v11;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
LABEL_9:
    [(JaliscoImporter *)self _performNextItemsPageRequestWithCompletion:v7];
    goto LABEL_10;
  }
  v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetched last batch of items - performing import", (uint8_t *)&v25, 0xCu);
  }

  v21 = [(JaliscoImporter *)self updateLibraryFromRevision:self->_updateFromRevision toRevision:self->_updateToRevision withResponse:v6 clientIdentity:self->_clientIdentity itemsFiles:self->_itemsFiles];
  v22 = os_log_create("com.apple.amp.itunescloudd", "Default");
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(v21, "msv_description");
      int v25 = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ Import completed error=%{public}@", (uint8_t *)&v25, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Import completed", (uint8_t *)&v25, 0xCu);
  }

  v7[2](v7, v21);
LABEL_10:
}

- (void)_performNextItemsPageRequestWithCompletion:(id)a3
{
  id v29 = a3;
  uint64_t currentPageNumber = self->_currentPageNumber;
  self->_uint64_t currentPageNumber = currentPageNumber + 1;
  uint64_t v5 = +[NSString stringWithFormat:@"items_%u.daap", currentPageNumber];
  v39[0] = self->_updateBaseDirectory;
  v39[1] = v5;
  v30 = (void *)v5;
  id v6 = +[NSArray arrayWithObjects:v39 count:2];
  v7 = +[NSURL fileURLWithPathComponents:v6];

  if (self->_currentPaginationToken)
  {
    v8 = 0;
  }
  else
  {
    v8 = [(JaliscoImporter *)self purchaseTokens];
  }
  uint64_t v9 = [(JaliscoImporter *)self connection];
  id v10 = [v9 databaseID];
  int v11 = [(JaliscoImporter *)self metadataKeys];
  uint64_t v12 = [v11 componentsJoinedByString:@","];
  v13 = [(JaliscoImporter *)self queryFilter];
  id v14 = +[ICItemsRequest requestWithDatabaseID:v10 metadataFilter:v12 queryFilter:v13 purchaseTokens:v8 includeHiddenItems:[(JaliscoImporter *)self includeHiddenItems] includePreorders:[(JaliscoImporter *)self includePreorders] paginationToken:self->_currentPaginationToken];

  [v14 setResponseDataDestinationFileURL:v7];
  if ([(JaliscoImporter *)self includeFlavors]) {
    [v14 setValue:@"1" forArgument:@"includeItemFlavors"];
  }
  unsigned int updateFromRevision = self->_updateFromRevision;
  if (updateFromRevision && self->_updateToRevision > updateFromRevision)
  {
    objc_super v16 = (char *)&v35 + 1;
    uint64_t quot = self->_updateFromRevision;
    do
    {
      uint64_t quot = div(quot, 10).quot;
      unint64_t v18 = HIDWORD(quot);
      if (quot < 0) {
        LODWORD(v18) = -HIDWORD(quot);
      }
      *(v16 - 2) = v18 + 48;
      int v19 = (const UInt8 *)(v16 - 2);
      --v16;
    }
    while (quot);
    if ((updateFromRevision & 0x80000000) != 0)
    {
      *(v16 - 2) = 45;
      int v19 = (const UInt8 *)(v16 - 2);
    }
    v20 = (__CFString *)CFStringCreateWithBytes(0, v19, (char *)&v35 - (char *)v19, 0x8000100u, 0);
    [v14 setValue:v20 forArgument:@"delta"];

    unsigned int updateToRevision = self->_updateToRevision;
    v22 = (char *)&v35 + 1;
    uint64_t v23 = updateToRevision;
    do
    {
      uint64_t v23 = div(v23, 10).quot;
      unint64_t v24 = HIDWORD(v23);
      if (v23 < 0) {
        LODWORD(v24) = -HIDWORD(v23);
      }
      *(v22 - 2) = v24 + 48;
      int v25 = (const UInt8 *)(v22 - 2);
      --v22;
    }
    while (v23);
    if ((updateToRevision & 0x80000000) != 0)
    {
      *(v22 - 2) = 45;
      int v25 = (const UInt8 *)(v22 - 2);
    }
    v26 = (__CFString *)CFStringCreateWithBytes(0, v25, (char *)&v35 - (char *)v25, 0x8000100u, 0);
    [v14 setValue:v26 forArgument:@"revision-id"];
  }
  __int16 v27 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v34 = self;
    __int16 v35 = 2114;
    v36 = v14;
    __int16 v37 = 2114;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending items request %{public}@ on connection %{public}@", buf, 0x20u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100055FF0;
  v31[3] = &unk_1001BAD00;
  v31[4] = self;
  id v32 = v29;
  id v28 = v29;
  [v9 sendRequest:v14 withResponseHandler:v31];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(JaliscoImporter *)self configuration];
  uint64_t v5 = [v4 userIdentity];
  id v6 = +[NSString stringWithFormat:@"<%@ %p [identity=%@, revision %u --> %u]>", v3, self, v5, self->_updateFromRevision, self->_updateToRevision];

  return (NSString *)v6;
}

- (void)importTracksUpToRevision:(unsigned int)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  v8 = (OS_tcc_identity *)a4;
  id v9 = a5;
  self->_shouldRestart = 0;
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = 0;

  *(void *)&self->_uint64_t currentPageNumber = 1;
  int v11 = NSTemporaryDirectory();
  v35[0] = v11;
  v35[1] = @"com.apple.MediaServices";
  uint64_t v12 = +[NSUUID UUID];
  v13 = [v12 UUIDString];
  v35[2] = v13;
  id v14 = +[NSArray arrayWithObjects:v35 count:3];
  v15 = +[NSString pathWithComponents:v14];
  updateBaseDirectory = self->_updateBaseDirectory;
  self->_updateBaseDirectory = v15;

  self->_unsigned int updateToRevision = a3;
  self->_unsigned int updateFromRevision = [(JaliscoImporter *)self onDiskRevision];
  v17 = +[NSMutableArray arrayWithCapacity:3];
  itemsFiles = self->_itemsFiles;
  self->_itemsFiles = v17;

  clientIdentity = self->_clientIdentity;
  self->_clientIdentity = v8;
  v20 = v8;

  int v21 = _os_feature_enabled_impl();
  v22 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int updateFromRevision = self->_updateFromRevision;
    *(_DWORD *)buf = 138544130;
    id v28 = self;
    __int16 v29 = 1024;
    unsigned int v30 = a3;
    __int16 v31 = 1024;
    unsigned int v32 = updateFromRevision;
    __int16 v33 = 1024;
    int v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Importing tracks up to revision %u. onDiskRevision=%u, supportsPagination=%{BOOL}u", buf, 0x1Eu);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100056544;
  v25[3] = &unk_1001BD0D8;
  id v26 = v9;
  id v24 = v9;
  [(JaliscoImporter *)self _performNextItemsPageRequestWithCompletion:v25];
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (BOOL)needsUpdateForTokens
{
  return 0;
}

- (BOOL)includePreorders
{
  return 0;
}

- (BOOL)includeHiddenItems
{
  return 0;
}

- (BOOL)includeFlavors
{
  return 1;
}

- (unsigned)onDiskRevision
{
  return 0;
}

- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  return 0;
}

- (id)purchaseTokens
{
  return 0;
}

- (id)metadataKeys
{
  return 0;
}

- (id)queryFilter
{
  return 0;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

+ (OS_os_log)oversizeLogCategory
{
  id v4 = +[JaliscoImporter instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"JaliscoImporter.m", 51, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"JaliscoImporter" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

+ (OS_os_log)logCategory
{
  id v4 = +[JaliscoImporter instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"JaliscoImporter.m", 46, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"JaliscoImporter" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

@end