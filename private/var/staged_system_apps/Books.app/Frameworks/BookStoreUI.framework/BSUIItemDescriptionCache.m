@interface BSUIItemDescriptionCache
+ (BSUIItemDescriptionCache)sharedInstance;
+ (id)_persistentStoreDirectoryWithSubfolder:(id)a3;
+ (id)_persistentStoreFileName;
+ (void)_recreatePersistentStoreDirectoryWithSubfolder:(id)a3;
- (BOOL)q_evictCacheEntriesFromDatabase;
- (BSUIItemDescriptionCache)initWithMaxItemCount:(unint64_t)a3 subfolder:(id)a4;
- (BUCoalescingCallBlock)coalescingFetch;
- (NSManagedObjectContext)moc;
- (NSMapTable)futuresByIdentifier;
- (NSMutableArray)identifiersQueuedForCache;
- (NSMutableArray)identifiersQueuedForNetwork;
- (NSString)testSubfolder;
- (id)_managedObjectModel;
- (id)_persistentStoreCoordinator;
- (id)itemDescriptionsFromIdentifiers:(id)a3;
- (id)q_itemDescriptionFromCachedItemDescription:(id)a3 moc:(id)a4;
- (id)q_updateDatabaseWithNewProfiles:(id)a3 expirationDate:(id)a4 moc:(id)a5;
- (id)sq_fetchCachedItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4;
- (id)sq_fetchItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4;
- (id)sq_queueCacheRequestForIdentifier:(id)a3;
- (id)sq_queueNetworkRequestForIdentifier:(id)a3;
- (unint64_t)maxItemCount;
- (void)_fetchItemDescriptionFromCacheForIdentifier:(id)a3 completion:(id)a4;
- (void)_fetchWithCompletion:(id)a3;
- (void)_flush;
- (void)q_populateCachedDescription:(id)a3 productProfile:(id)a4 expirationDate:(id)a5;
- (void)sampleDownloadURLForAssetID:(id)a3 completion:(id)a4;
- (void)setCoalescingFetch:(id)a3;
- (void)setFuturesByIdentifier:(id)a3;
- (void)setIdentifiersQueuedForCache:(id)a3;
- (void)setIdentifiersQueuedForNetwork:(id)a3;
- (void)setMaxItemCount:(unint64_t)a3;
- (void)setMoc:(id)a3;
- (void)setTestSubfolder:(id)a3;
- (void)updateWithProfileDictionaries:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5;
- (void)updateWithProfiles:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5;
@end

@implementation BSUIItemDescriptionCache

+ (BSUIItemDescriptionCache)sharedInstance
{
  if (qword_3D4180 != -1) {
    dispatch_once(&qword_3D4180, &stru_38F358);
  }
  v2 = (void *)qword_3D4178;

  return (BSUIItemDescriptionCache *)v2;
}

- (BSUIItemDescriptionCache)initWithMaxItemCount:(unint64_t)a3 subfolder:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BSUIItemDescriptionCache;
  v8 = [(BSUIItemDescriptionCache *)&v26 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    identifiersQueuedForNetwork = v8->_identifiersQueuedForNetwork;
    v8->_identifiersQueuedForNetwork = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    identifiersQueuedForCache = v8->_identifiersQueuedForCache;
    v8->_identifiersQueuedForCache = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMapTable strongToWeakObjectsMapTable];
    futuresByIdentifier = v8->_futuresByIdentifier;
    v8->_futuresByIdentifier = (NSMapTable *)v13;

    id v15 = objc_alloc((Class)BUCoalescingCallBlock);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_315B4;
    v24[3] = &unk_38F380;
    v16 = v8;
    v25 = v16;
    v17 = (BUCoalescingCallBlock *)[v15 initWithNotifyBlock:v24 blockDescription:@"BSUIItemDescriptionCache"];
    coalescingFetch = v16->_coalescingFetch;
    v16->_coalescingFetch = v17;

    v16->_maxItemCount = a3;
    objc_storeStrong((id *)&v16->_testSubfolder, a4);
    v19 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    moc = v16->_moc;
    v16->_moc = v19;

    v21 = v16->_moc;
    v22 = [(BSUIItemDescriptionCache *)v16 _persistentStoreCoordinator];
    [(NSManagedObjectContext *)v21 setPersistentStoreCoordinator:v22];

    [(NSManagedObjectContext *)v16->_moc setUndoManager:0];
  }

  return v8;
}

- (void)updateWithProfileDictionaries:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5
{
  id v7 = a3;
  id v20 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
        id v16 = objc_alloc((Class)AEUserPublishingProductProfile);
        v17 = [v10 objectForKeyedSubscript:v15];
        id v18 = [v16 initWithProfileDictionary:v17];

        if (v18) {
          [v9 setObject:v18 forKeyedSubscript:v15];
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [(BSUIItemDescriptionCache *)self updateWithProfiles:v9 expirationDate:v20 requestedIdentifiers:v8];
}

- (void)updateWithProfiles:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(BSUIItemDescriptionCache *)self moc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_31870;
  v15[3] = &unk_38F3F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  id v11 = v10;
  id v12 = v18;
  id v13 = v9;
  id v14 = v8;
  [v12 performBlockAndWait:v15];
}

- (void)_flush
{
  id v2 = [(BSUIItemDescriptionCache *)self moc];
  [v2 performBlockAndWait:&stru_38F418];
}

- (void)_fetchItemDescriptionFromCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSUIItemDescriptionCache *)self moc];
  id v9 = [(BSUIItemDescriptionCache *)self moc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_31C64;
  v13[3] = &unk_38F440;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [v9 performBlock:v13];
}

- (id)sq_fetchCachedItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BSUICachedItemDescription"];
  id v9 = +[NSPredicate predicateWithFormat:@"%K in %@ AND %K != NULL", @"storeID", v6, @"fileSize"];
  [v8 setPredicate:v9];

  id v32 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v32];
  id v11 = (char *)v32;
  if (v11)
  {
    id v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[BSUIItemDescriptionCache sq_fetchCachedItemDescriptionsForIdentifiers:moc:]";
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      __int16 v38 = 1024;
      int v39 = 161;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    id v13 = BCIMLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v14;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
    }
  }
  id v15 = +[NSDate date];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) setLastAccessDate:v15];
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v18);
  }

  if ([v16 count])
  {

    id v27 = 0;
    [v7 save:&v27];
    id v11 = (char *)v27;
    if (v11)
    {
      long long v21 = BCIMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[BSUIItemDescriptionCache sq_fetchCachedItemDescriptionsForIdentifiers:moc:]";
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
        __int16 v38 = 1024;
        int v39 = 179;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      long long v22 = BCIMLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        long long v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v23;
        __int16 v36 = 2112;
        v37 = v11;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
      }
    }
    long long v24 = [v16 valueForKey:@"storeID"];
    v25 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)sq_fetchItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSUIItemDescriptionCache *)self sq_fetchCachedItemDescriptionsForIdentifiers:v6 moc:v7];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_322DC;
  id v16 = sub_322EC;
  id v17 = +[NSMutableDictionary dictionary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_322F4;
  v11[3] = &unk_38F468;
  v11[4] = self;
  v11[5] = &v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)sq_queueCacheRequestForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_futuresByIdentifier objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)BCMutableFutureValue);
      [(NSMapTable *)self->_futuresByIdentifier setObject:v5 forKey:v4];
    }
    if (([(NSMutableArray *)self->_identifiersQueuedForCache containsObject:v4] & 1) == 0) {
      [(NSMutableArray *)self->_identifiersQueuedForCache addObject:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)sq_queueNetworkRequestForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_futuresByIdentifier objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)BCMutableFutureValue);
      [(NSMapTable *)self->_futuresByIdentifier setObject:v5 forKey:v4];
    }
    if (([(NSMutableArray *)self->_identifiersQueuedForNetwork containsObject:v4] & 1) == 0) {
      [(NSMutableArray *)self->_identifiersQueuedForNetwork addObject:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_fetchWithCompletion:(id)a3
{
  id v4 = a3;
  [(BSUIItemDescriptionCache *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_325B8;
  v7[3] = &unk_38EC50;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (id)itemDescriptionsFromIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v4 count]];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v6 = [(BSUIItemDescriptionCache *)self moc];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_32CA8;
  id v15 = &unk_38F4D8;
  id v7 = v4;
  id v16 = v7;
  id v17 = self;
  id v8 = v5;
  id v18 = v8;
  uint64_t v19 = &v20;
  [v6 performBlockAndWait:&v12];

  if (*((unsigned char *)v21 + 24)) {
    -[BUCoalescingCallBlock signalWithCompletion:](self->_coalescingFetch, "signalWithCompletion:", &stru_38F4F8, v12, v13, v14, v15, v16, v17);
  }
  id v9 = v18;
  id v10 = v8;

  _Block_object_dispose(&v20, 8);

  return v10;
}

- (void)sampleDownloadURLForAssetID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_322DC;
  uint64_t v19 = sub_322EC;
  id v7 = +[BSUIItemDescriptionCache sharedInstance];
  id v21 = v5;
  id v8 = +[NSArray arrayWithObjects:&v21 count:1];
  id v9 = [v7 itemDescriptionsFromIdentifiers:v8];
  id v20 = [v9 objectForKey:v5];

  id v10 = (void *)v16[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_32FE8;
  v12[3] = &unk_38F520;
  id v11 = v6;
  id v13 = v11;
  uint64_t v14 = &v15;
  [v10 get:v12];

  _Block_object_dispose(&v15, 8);
}

+ (id)_persistentStoreDirectoryWithSubfolder:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v5 = [v4 lastObject];

  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 stringByAppendingPathComponent:v7];

  if ([v3 length])
  {
    uint64_t v9 = [v8 stringByAppendingPathComponent:v3];

    id v8 = (void *)v9;
  }

  return v8;
}

+ (id)_persistentStoreFileName
{
  return +[NSString stringWithFormat:@"%@.sqlite", @"v20160217"];
}

+ (void)_recreatePersistentStoreDirectoryWithSubfolder:(id)a3
{
  id v6 = [a1 _persistentStoreDirectoryWithSubfolder:a3];
  id v3 = +[NSURL fileURLWithPath:v6 isDirectory:1];
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 relativePath];
  [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)_managedObjectModel
{
  model = self->_model;
  if (!model)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v4 pathForResource:v6 ofType:@"momd"];

    id v8 = +[NSURL fileURLWithPath:v7 isDirectory:1];
    uint64_t v9 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v8];
    id v10 = self->_model;
    self->_model = v9;

    model = self->_model;
  }

  return model;
}

- (id)_persistentStoreCoordinator
{
  psc = self->_psc;
  if (!psc)
  {
    id v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    id v5 = [(BSUIItemDescriptionCache *)self _managedObjectModel];
    id v6 = (NSPersistentStoreCoordinator *)[v4 initWithManagedObjectModel:v5];
    id v7 = self->_psc;
    self->_psc = v6;

    v28[0] = NSInferMappingModelAutomaticallyOption;
    v28[1] = NSMigratePersistentStoresAutomaticallyOption;
    v29[0] = &__kCFBooleanTrue;
    v29[1] = &__kCFBooleanTrue;
    id v8 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    uint64_t v9 = objc_opt_class();
    id v10 = [(BSUIItemDescriptionCache *)self testSubfolder];
    id v11 = [v9 _persistentStoreDirectoryWithSubfolder:v10];

    uint64_t v12 = [(id)objc_opt_class() _persistentStoreFileName];
    id v13 = objc_opt_class();
    uint64_t v14 = [(BSUIItemDescriptionCache *)self testSubfolder];
    [v13 _recreatePersistentStoreDirectoryWithSubfolder:v14];

    uint64_t v15 = [v11 stringByAppendingPathComponent:v12];
    id v16 = +[NSURL fileURLWithPath:v15 isDirectory:0];
    uint64_t v17 = self->_psc;
    id v27 = 0;
    id v18 = [(NSPersistentStoreCoordinator *)v17 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v16 options:v8 error:&v27];
    id v19 = v27;
    if (!v18)
    {
      id v20 = +[NSFileManager defaultManager];
      [v20 removeItemAtPath:v11 error:0];

      id v21 = objc_opt_class();
      uint64_t v22 = [(BSUIItemDescriptionCache *)self testSubfolder];
      [v21 _recreatePersistentStoreDirectoryWithSubfolder:v22];

      char v23 = self->_psc;
      id v26 = v19;
      id v18 = [(NSPersistentStoreCoordinator *)v23 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v16 options:v8 error:&v26];
      id v24 = v26;

      id v19 = v24;
    }

    psc = self->_psc;
  }

  return psc;
}

- (void)q_populateCachedDescription:(id)a3 productProfile:(id)a4 expirationDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 adamId];
  [v7 setStoreID:v10];

  double v29 = 1.5;
  id v11 = [v8 artworkURLTemplateAspect:&v29];
  [v7 setArtworkURLTemplate:v11];

  uint64_t v12 = +[NSNumber numberWithDouble:v29];
  [v7 setArtworkAspect:v12];

  id v13 = [v8 standardNotes];
  if (v13)
  {
    [v7 setRawNotes:v13];
  }
  else
  {
    uint64_t v14 = [v8 standardDescription];
    [v7 setRawNotes:v14];
  }
  uint64_t v15 = [v8 title];
  [v7 setTitle:v15];

  id v16 = [v8 author];
  [v7 setAuthor:v16];

  [v8 averageRating];
  uint64_t v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 setAverageRating:v17];

  id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 ratingCount]);
  [v7 setRatingCount:v18];

  [v7 setExpirationDate:v9];
  id v19 = +[NSDate date];
  [v7 setLastAccessDate:v19];

  id v20 = [v8 productURL];
  id v21 = [v20 absoluteString];
  [v7 setProductURL:v21];

  uint64_t v22 = [v8 priceString];
  [v7 setPriceString:v22];

  char v23 = [v8 actionTextWithType:1];
  [v7 setActionString:v23];

  id v24 = [v8 buyParameters];
  [v7 setBuyParameters:v24];

  v25 = [v8 bookSampleDownloadURL];
  id v26 = [v25 absoluteString];
  [v7 setSampleDownloadURL:v26];

  id v27 = [v8 kind];
  [v7 setKind:v27];

  long long v28 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 fileSize]);
  [v7 setFileSize:v28];
}

- (id)q_updateDatabaseWithNewProfiles:(id)a3 expirationDate:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v36 = (id)objc_opt_new();
  id v10 = +[NSDate date];
  id v11 = v8;
  [v10 timeIntervalSinceDate:v11];
  id v13 = v11;
  if (fabs(v12) < 30.0)
  {
    id v13 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
  }
  if (!v13 || [v13 compare:v10] == (char *)&dword_0 + 1)
  {
    uint64_t v14 = v13;
    id v32 = v10;
    id v33 = v11;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v7;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          objc_opt_class();
          id v21 = [v15 objectForKeyedSubscript:v20];
          uint64_t v22 = BUDynamicCast();

          char v23 = [BSUICachedItemDescription alloc];
          id v24 = +[NSEntityDescription entityForName:@"BSUICachedItemDescription" inManagedObjectContext:v9];
          v25 = [(BSUICachedItemDescription *)v23 initWithEntity:v24 insertIntoManagedObjectContext:v9];

          [(BSUIItemDescriptionCache *)self q_populateCachedDescription:v25 productProfile:v22 expirationDate:v14];
          [v36 setObject:v25 forKeyedSubscript:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v17);
    }

    id v11 = v33;
    id v7 = v34;
    id v10 = v32;
    id v13 = v14;
  }
  if ([v36 count])
  {
    id v37 = 0;
    [v9 save:&v37];
    id v26 = (char *)v37;
    if (v26)
    {
      id v27 = BCIMLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v43 = "-[BSUIItemDescriptionCache q_updateDatabaseWithNewProfiles:expirationDate:moc:]";
        __int16 v44 = 2080;
        v45 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
        __int16 v46 = 1024;
        int v47 = 481;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      long long v28 = BCIMLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        double v29 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v29;
        __int16 v44 = 2112;
        v45 = v26;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
      }
    }
  }
  [(BSUIItemDescriptionCache *)self q_evictCacheEntriesFromDatabase];

  return v36;
}

- (BOOL)q_evictCacheEntriesFromDatabase
{
  id v3 = [(BSUIItemDescriptionCache *)self moc];
  id v4 = +[NSDate date];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BSUICachedItemDescription"];
  id v6 = +[NSPredicate predicateWithFormat:@"%K < %@", @"expirationDate", v4];
  [v5 setPredicate:v6];

  [v5 setReturnsObjectsAsFaults:1];
  id v39 = 0;
  id v7 = [v3 executeFetchRequest:v5 error:&v39];
  id v8 = (char *)v39;
  id v32 = v7;
  if (v8)
  {
    id v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      __int16 v46 = 1024;
      int v47 = 509;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    id v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v11;
      __int16 v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
    }
    int v12 = 0;
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v7;
    id v13 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
    int v12 = v13 != 0;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v10);
          }
          [v3 deleteObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        id v14 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v14);
      int v12 = 1;
    }
  }

  id v17 = +[NSFetchRequest fetchRequestWithEntityName:@"BSUICachedItemDescription"];
  uint64_t v18 = +[NSSortDescriptor sortDescriptorWithKey:@"lastAccessDate" ascending:0];
  long long v40 = v18;
  id v19 = +[NSArray arrayWithObjects:&v40 count:1];
  [v17 setSortDescriptors:v19];

  [v17 setReturnsObjectsAsFaults:1];
  id v34 = 0;
  uint64_t v20 = [v3 executeFetchRequest:v17 error:&v34];
  id v21 = (char *)v34;
  if (v21)
  {
    uint64_t v22 = BCIMLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      __int16 v46 = 1024;
      int v47 = 529;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    char v23 = BCIMLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v24;
      __int16 v44 = 2112;
      v45 = v21;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
    }
    if ((v12 & 1) == 0)
    {
      LOBYTE(v12) = 0;
      goto LABEL_33;
    }
  }
  else
  {
    unint64_t v25 = [(BSUIItemDescriptionCache *)self maxItemCount];
    if (v25 >= (unint64_t)[v20 count])
    {
      if (!v12)
      {
        id v21 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      do
      {
        id v26 = [v20 objectAtIndexedSubscript:v25];
        [v3 deleteObject:v26];

        ++v25;
      }
      while (v25 < (unint64_t)[v20 count]);
    }
  }

  id v33 = 0;
  [v3 save:&v33];
  id v21 = (char *)v33;
  if (v21)
  {
    id v27 = BCIMLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      __int16 v46 = 1024;
      int v47 = 549;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    long long v28 = BCIMLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      double v29 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v29;
      __int16 v44 = 2112;
      v45 = v21;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "@\"%@: %@\"", buf, 0x16u);
    }
  }
  LOBYTE(v12) = 1;
LABEL_33:

  return v12;
}

- (id)q_itemDescriptionFromCachedItemDescription:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BSUIItemDescription alloc];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3438C;
  v14[3] = &unk_38F570;
  id v15 = v7;
  id v16 = v6;
  SEL v17 = a2;
  id v9 = v6;
  id v10 = v7;
  id v11 = +[BCLazyValue objectAsyncProducer:v14];
  int v12 = [(BSUIItemDescription *)v8 initWithCachedItemDescription:v9 lazyNotes:v11];

  return v12;
}

- (BUCoalescingCallBlock)coalescingFetch
{
  return self->_coalescingFetch;
}

- (void)setCoalescingFetch:(id)a3
{
}

- (NSMutableArray)identifiersQueuedForCache
{
  return self->_identifiersQueuedForCache;
}

- (void)setIdentifiersQueuedForCache:(id)a3
{
}

- (NSMutableArray)identifiersQueuedForNetwork
{
  return self->_identifiersQueuedForNetwork;
}

- (void)setIdentifiersQueuedForNetwork:(id)a3
{
}

- (NSMapTable)futuresByIdentifier
{
  return self->_futuresByIdentifier;
}

- (void)setFuturesByIdentifier:(id)a3
{
}

- (unint64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(unint64_t)a3
{
  self->_maxItemCount = a3;
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (NSString)testSubfolder
{
  return self->_testSubfolder;
}

- (void)setTestSubfolder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSubfolder, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_futuresByIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersQueuedForNetwork, 0);
  objc_storeStrong((id *)&self->_identifiersQueuedForCache, 0);
  objc_storeStrong((id *)&self->_coalescingFetch, 0);
  objc_storeStrong((id *)&self->_psc, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end