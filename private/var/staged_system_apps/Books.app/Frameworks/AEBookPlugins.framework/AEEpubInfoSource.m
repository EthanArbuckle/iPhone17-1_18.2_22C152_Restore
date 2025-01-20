@interface AEEpubInfoSource
+ (id)sharedInstance;
- (AEEpubInfoSource)initWithIdentifier:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (id)bookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)bookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7;
- (id)databaseKeyFromLibraryManagerInfo:(id)a3 forAssetAtURL:(id)a4;
- (id)existingBookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4;
- (id)existingBookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4;
- (id)existingBookInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4;
- (id)metadataForKey:(id)a3 forURL:(id)a4 needsCoordination:(BOOL)a5;
- (id)newManagedObjectContextWithPrivateQueueConcurrency;
- (id)persistentStoreDirectory;
- (id)persistentStoreFileName;
- (int)parseBook:(id)a3;
- (void)_mocDidSaveNotification:(id)a3;
- (void)_resetBookInfo:(id)a3;
- (void)dealloc;
- (void)performBackgroundTaskAndWait:(id)a3;
- (void)performMainQueueTaskWithNewContext:(id)a3;
- (void)performMainQueueTaskWithNewContextAndWait:(id)a3;
- (void)readableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4;
- (void)recreatePersistentStoreDirectory;
- (void)resetBookForDatabaseKey:(id)a3;
- (void)resetBookForURL:(id)a3;
- (void)setMetadata:(id)a3 forKey:(id)a4 forURL:(id)a5;
- (void)setPropertiesOfBook:(id)a3 withPlistEntry:(id)a4;
- (void)updateCachedURLFrom:(id)a3 to:(id)a4;
- (void)writableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4;
@end

@implementation AEEpubInfoSource

+ (id)sharedInstance
{
  pthread_once(&stru_22A508, (void (*)(void))sub_DE548);
  v2 = (void *)qword_22B648;

  return v2;
}

- (AEEpubInfoSource)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AEEpubInfoSource *)self init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iBooks.AEEpubInfoSource.metadata", v9);
    metadataQueue = v5->_metadataQueue;
    v5->_metadataQueue = (OS_dispatch_queue *)v10;

    v12 = [(AEEpubInfoSource *)v5 persistentContainer];
    id v13 = [v12 newBackgroundContext];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_DB0D8;
    v19[3] = &unk_1DAB88;
    v14 = (AEBookManagedObjectContext *)v13;
    v20 = v14;
    [(AEBookManagedObjectContext *)v14 performBlockAndWait:v19];
    privateMoc = v5->_privateMoc;
    v5->_privateMoc = v14;
    v16 = v14;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v5 selector:"_mocDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  privateMoc = self->_privateMoc;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_DB1BC;
  v5[3] = &unk_1DAB88;
  v5[4] = self;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v5];
  v4.receiver = self;
  v4.super_class = (Class)AEEpubInfoSource;
  [(AEEpubInfoSource *)&v4 dealloc];
}

- (void)_mocDidSaveNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  privateMoc = self->_privateMoc;
  if (privateMoc != v5)
  {
    v7 = [(AEBookManagedObjectContext *)privateMoc persistentStoreCoordinator];
    v8 = [(AEBookManagedObjectContext *)v5 persistentStoreCoordinator];

    if (v7 == v8)
    {
      v9 = self->_privateMoc;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DB2BC;
      v10[3] = &unk_1DBF08;
      v10[4] = self;
      id v11 = v4;
      [(AEBookManagedObjectContext *)v9 performBlockAndWait:v10];
    }
  }
}

- (id)persistentStoreDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"AEEpubInfoSource"];

  return v4;
}

- (void)recreatePersistentStoreDirectory
{
  id v5 = [(AEEpubInfoSource *)self persistentStoreDirectory];
  v2 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 relativePath];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)persistentStoreFileName
{
  persistentStoreFileName = self->_persistentStoreFileName;
  if (!persistentStoreFileName)
  {
    identifier = self->_identifier;
    id v5 = +[UIDevice currentDevice];
    v6 = [v5 systemVersion];
    v7 = +[NSString stringWithFormat:@"%@-%@-%@.sqlite", identifier, @"v20240926", v6];
    v8 = self->_persistentStoreFileName;
    self->_persistentStoreFileName = v7;

    persistentStoreFileName = self->_persistentStoreFileName;
  }

  return persistentStoreFileName;
}

- (NSPersistentContainer)persistentContainer
{
  v3 = [(AEEpubInfoSource *)self persistentStoreDirectory];
  id v4 = [(AEEpubInfoSource *)self persistentStoreFileName];
  [(AEEpubInfoSource *)self recreatePersistentStoreDirectory];
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_persistentContainer)
  {
    v6 = AEBundle();
    v7 = [v6 URLForResource:@"AEBookInfo" withExtension:@"momd"];
    id v8 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
    uint64_t v9 = +[NSPersistentContainer persistentContainerWithName:@"AEBookInfo" managedObjectModel:v8];
    v22 = v8;
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = (NSPersistentContainer *)v9;

    id v11 = [v3 stringByAppendingPathComponent:v4];
    v12 = +[NSURL fileURLWithPath:v11 isDirectory:0];
    id v13 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v12];
    [v13 setOption:NSFileProtectionNone forKey:NSPersistentStoreFileProtectionKey];
    v31 = v13;
    v14 = +[NSArray arrayWithObjects:&v31 count:1];
    [(NSPersistentContainer *)v5->_persistentContainer setPersistentStoreDescriptions:v14];
    v21 = v6;

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    v15 = [(NSPersistentContainer *)v5->_persistentContainer persistentStoreCoordinator];
    v16 = v5->_persistentContainer;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_DB7E4;
    v24[3] = &unk_1DD4A0;
    id v17 = v15;
    id v25 = v17;
    v26 = &v27;
    [(NSPersistentContainer *)v16 loadPersistentStoresWithCompletionHandler:v24];
    if (*((unsigned char *)v28 + 24))
    {
      v18 = v5->_persistentContainer;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_DBA68;
      v23[3] = &unk_1DD4C8;
      v23[4] = &v27;
      -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v18, "loadPersistentStoresWithCompletionHandler:", v23, v21, v8);
    }

    _Block_object_dispose(&v27, 8);
  }
  objc_sync_exit(v5);

  v19 = v5->_persistentContainer;
  return v19;
}

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  v2 = [(AEEpubInfoSource *)self persistentContainer];
  id v3 = [v2 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_DBC80;
  v6[3] = &unk_1DAB88;
  id v4 = v3;
  id v7 = v4;
  [v4 performBlockAndWait:v6];

  return v4;
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_DBD80;
    v6[3] = &unk_1DB210;
    id v7 = [(AEEpubInfoSource *)self newManagedObjectContextWithPrivateQueueConcurrency];
    id v8 = v4;
    id v5 = v7;
    [v5 performBlockAndWait:v6];
  }
}

- (void)performMainQueueTaskWithNewContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AEEpubInfoSource *)self persistentContainer];
    v6 = [v5 persistentStoreCoordinator];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_DBE94;
    v9[3] = &unk_1DD4F0;
    id v10 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
    id v11 = v6;
    id v12 = v4;
    id v7 = v6;
    id v8 = v10;
    [v8 performBlock:v9];
  }
}

- (void)performMainQueueTaskWithNewContextAndWait:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AEEpubInfoSource *)self persistentContainer];
    v6 = [v5 persistentStoreCoordinator];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_DBFFC;
    v9[3] = &unk_1DD4F0;
    id v10 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
    id v11 = v6;
    id v12 = v4;
    id v7 = v6;
    id v8 = v10;
    [v8 performBlockAndWait:v9];
  }
}

- (id)databaseKeyFromLibraryManagerInfo:(id)a3 forAssetAtURL:(id)a4
{
  id v5 = a3;
  v6 = [a4 path];
  id v7 = +[IMLibraryPlist assetIDFromPlistEntry:v5 forAssetAtPath:v6];

  return v7;
}

- (id)existingBookInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_DC244;
  v19 = sub_DC254;
  id v20 = 0;
  if (!v6) {
    goto LABEL_4;
  }
  privateMoc = self->_privateMoc;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_DC25C;
  v12[3] = &unk_1DD518;
  v12[4] = self;
  id v13 = v6;
  v14 = &v15;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v12];

  uint64_t v9 = v16[5];
  if (v9)
  {
    id v10 = [v7 existingObjectWithID:v9 error:0];
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)existingBookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [a3 path];
  id v8 = +[NSPredicate predicateWithFormat:@"bookBundlePath ==[n] %@", v7];

  uint64_t v9 = [(AEEpubInfoSource *)self existingBookInfoWithPredicate:v8 fromManagedObjectContext:v6];

  return v9;
}

- (void)readableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_DC44C;
  v8[3] = &unk_1DD540;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(AEEpubInfoSource *)self performBackgroundTaskAndWait:v8];
}

- (void)writableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_DC5D8;
  v8[3] = &unk_1DD540;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(AEEpubInfoSource *)self performBackgroundTaskAndWait:v8];
}

- (id)existingBookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSPredicate predicateWithFormat:@"databaseKey ==[n] %@", a3];
  id v8 = [(AEEpubInfoSource *)self existingBookInfoWithPredicate:v7 fromManagedObjectContext:v6];

  return v8;
}

- (void)setPropertiesOfBook:(id)a3 withPlistEntry:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v15 = +[IMLibraryPlist titleFromPlistEntry:v5];
    id v7 = +[IMLibraryPlist storeIdFromPlistEntry:v5];
    [v6 setStoreId:v7];

    id v8 = +[IMLibraryPlist uniqueIdFromPlistEntry:v5];
    [v6 setBookUniqueId:v8];

    id v9 = +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:v5];
    [v6 setTemporaryItemIdentifier:v9];

    id v10 = +[IMLibraryPlist authorFromPlistEntry:v5];
    [v6 setBookAuthor:v10];

    id v11 = +[IMLibraryPlist sortAuthorFromPlistEntry:v5];
    [v6 setSortAuthor:v11];

    [v6 setBookTitle:v15];
    [v6 setSortTitle:v15];
    id v12 = +[IMLibraryPlist genreFromPlistEntry:v5];
    [v6 setGenre:v12];

    id v13 = +[IMLibraryPlist isSampleFromPlistEntry:v5];
    [v6 setSampleContent:v13];

    v14 = +[IMLibraryPlist bookEpubIdFromPlistEntry:v5];

    [v6 setBookEpubId:v14];
  }
}

- (id)bookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (AEBookManagedObjectContext *)a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_DC244;
  v26 = sub_DC254;
  id v27 = 0;
  privateMoc = self->_privateMoc;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_DCAA8;
  uint64_t v17 = &unk_1DD568;
  v18 = self;
  id v10 = v7;
  id v19 = v10;
  id v20 = &v22;
  BOOL v21 = privateMoc == v8;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:&v14];
  uint64_t v11 = v23[5];
  if (v11)
  {
    id v12 = -[AEBookManagedObjectContext existingObjectWithID:error:](v8, "existingObjectWithID:error:", v11, 0, v14, v15, v16, v17, v18);
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v22, 8);

  return v12;
}

- (id)bookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7
{
  id v10 = a3;
  uint64_t v11 = (AEBookManagedObjectContext *)a4;
  id v12 = a7;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_DC244;
  v51 = sub_DC254;
  id v52 = 0;
  privateMoc = self->_privateMoc;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_DC244;
  v45 = sub_DC254;
  id v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  v14 = v11;
  if (privateMoc != v11)
  {
    dispatch_suspend((dispatch_object_t)self->_metadataQueue);
    v14 = self->_privateMoc;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_DCEC8;
  v28[3] = &unk_1DD590;
  v28[4] = self;
  id v15 = v10;
  BOOL v35 = a6;
  id v29 = v15;
  v31 = &v41;
  v32 = &v37;
  v34 = a5;
  id v16 = v12;
  id v30 = v16;
  v33 = &v47;
  BOOL v36 = privateMoc == v11;
  [(AEBookManagedObjectContext *)v14 performBlockAndWait:v28];
  if (privateMoc != v11) {
    dispatch_resume((dispatch_object_t)self->_metadataQueue);
  }
  uint64_t v17 = v48[5];
  if (v17)
  {
    v18 = [(AEBookManagedObjectContext *)v11 existingObjectWithID:v17 error:0];
  }
  else
  {
    v18 = 0;
  }
  if (!*((unsigned char *)v38 + 24) && [v18 hasDuplicatedDocument])
  {
    metadataQueue = self->_metadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DD3E0;
    block[3] = &unk_1DAB88;
    id v27 = v18;
    dispatch_async(metadataQueue, block);
  }
  if (a5)
  {
    id v20 = (void *)v42[5];
    if (v20) {
      objc_storeStrong(a5, v20);
    }
  }
  BOOL v21 = v30;
  id v22 = v18;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);

  return v22;
}

- (int)parseBook:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  unsigned int v6 = [v5 isTemporaryID];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = [v4 managedObjectContext];
  if (v7 != self->_privateMoc)
  {
    id v8 = [v4 managedObjectContext];
    unsigned int v9 = [v8 hasChanges];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = [v4 managedObjectContext];
    [(AEBookManagedObjectContext *)v7 save:0];
  }

LABEL_6:
  privateMoc = self->_privateMoc;
  uint64_t v11 = [v4 managedObjectContext];

  id v12 = [v4 managedObjectContext];
  id v13 = self->_privateMoc;

  v14 = [v4 objectID];
  id v15 = v14;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  if (v14)
  {
    BOOL v16 = privateMoc == v11;
    uint64_t v17 = self->_privateMoc;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_DD648;
    v20[3] = &unk_1DD5B8;
    v20[4] = self;
    id v21 = v14;
    id v22 = &v25;
    BOOL v23 = v12 != v13;
    BOOL v24 = v16;
    [(AEBookManagedObjectContext *)v17 performBlockAndWait:v20];

    int v18 = *((_DWORD *)v26 + 6);
  }
  else
  {
    int v18 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (void)updateCachedURLFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  privateMoc = self->_privateMoc;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_DD804;
  v11[3] = &unk_1DC1F8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v11];
}

- (void)resetBookForURL:(id)a3
{
  id v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_DD96C;
  v7[3] = &unk_1DBF08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v7];
}

- (void)resetBookForDatabaseKey:(id)a3
{
  id v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_DDA6C;
  v7[3] = &unk_1DBF08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v7];
}

- (void)_resetBookInfo:(id)a3
{
  id v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_DDB6C;
  v7[3] = &unk_1DBF08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(AEBookManagedObjectContext *)privateMoc performBlockAndWait:v7];
}

- (id)metadataForKey:(id)a3 forURL:(id)a4 needsCoordination:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_DC244;
  char v40 = sub_DC254;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  if (![v8 isEqualToString:AEHelperStringMetadataAssetIDKey])
  {
    if (![v8 isEqualToString:AEHelperStringMetadataPageProgressionKey]) {
      goto LABEL_9;
    }
    id v12 = +[AEAssetEngine libraryMgr];
    id v11 = [v12 pageProgressionDirectionForAssetAtURLOnMainThread:v9];

    if ([v11 length]) {
      goto LABEL_6;
    }
LABEL_7:

    id v15 = +[AEAssetEngine libraryMgr];
    BOOL v16 = [v15 metadataForAssetAtURL:v9 needsCoordination:v5];

    metadataQueue = self->_metadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DDF30;
    block[3] = &unk_1DD5E0;
    void block[4] = self;
    id v27 = v8;
    id v28 = v16;
    id v29 = v9;
    id v30 = &v36;
    v31 = &v32;
    id v11 = v16;
    dispatch_sync(metadataQueue, block);

    goto LABEL_8;
  }
  id v10 = +[AEAssetEngine libraryMgr];
  id v11 = [v10 assetIDForAssetAtURLOnMainThread:v9];

  if (![v11 length]) {
    goto LABEL_7;
  }
LABEL_6:
  id v13 = [v11 copy];
  v14 = (void *)v37[5];
  v37[5] = (uint64_t)v13;

  *((unsigned char *)v33 + 24) = 0;
LABEL_8:

LABEL_9:
  if (*((unsigned char *)v33 + 24))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_DE0D0;
    v21[3] = &unk_1DD608;
    v21[4] = self;
    id v22 = v9;
    BOOL v25 = v5;
    id v23 = v8;
    BOOL v24 = &v36;
    [(AEEpubInfoSource *)self performBackgroundTaskAndWait:v21];
  }
  id v19 = (id)v37[5];
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (void)setMetadata:(id)a3 forKey:(id)a4 forURL:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 isEqualToString:AEHelperStringMetadataTitleKey])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_DE450;
    v10[3] = &unk_1DD630;
    v10[4] = self;
    id v11 = v9;
    id v12 = v8;
    [(AEEpubInfoSource *)self performBackgroundTaskAndWait:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_persistentStoreFileName, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_privateMoc, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end