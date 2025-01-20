@interface BCAssetDatabase
+ (void)removeDatabase;
- (BCAssetDatabase)init;
- (BOOL)shouldRetryAddingPersistentStoreAfterError:(id)a3;
- (id)cachedEntities:(id)a3 byPersistentIDs:(id)a4 metrics:(id *)a5;
- (id)cachedInstalledAssetsByPersistentIDs:(id)a3 metrics:(id *)a4;
- (id)cachedOutstandingAssetsByPersistentIDs:(id)a3;
- (id)downloadCompletePathMap;
- (id)entities:(id)a3 byPredicate:(id)a4 fromMOC:(id)a5;
- (id)outstandingAssetDownloadCompletePathsMatchingArray:(id)a3;
- (id)outstandingAssetsByRestoreFlag:(BOOL)a3;
- (void)insertInstalledAssetByPersistentID:(id)a3 withSize:(unint64_t)a4;
- (void)insertOutstandingAssetDictionaries:(id)a3 isRestore:(BOOL)a4;
- (void)removeEntities:(id)a3 byPredicate:(id)a4;
- (void)removeInstalledAssetsExcluding:(id)a3;
- (void)removeOutstandingAssetByPersistentID:(id)a3;
- (void)removeOutstandingAssetMissingFromPersistentIDs:(id)a3;
- (void)removeOutstandingAssetsByPersistentIDs:(id)a3;
- (void)removeOutstandingAssetsByRestoreFlag:(BOOL)a3 keepDownloadedAssetRows:(BOOL)a4;
- (void)setDownloadPath:(id)a3 forOutstandingAssetsByPersistentID:(id)a4;
- (void)updateOutstandingAssetDictionaries:(id)a3 isRestore:(BOOL)a4;
@end

@implementation BCAssetDatabase

- (BCAssetDatabase)init
{
  v3 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v3 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Database/"])
  {
    v6[0] = NSFileOwnerAccountName;
    v6[1] = NSFileGroupOwnerAccountName;
    v7[0] = @"mobile";
    v7[1] = @"mobile";
    [(NSFileManager *)v3 createDirectoryAtPath:@"/var/mobile/Media/Books/Sync/Database/" withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2] error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)BCAssetDatabase;
  result = [(BCDatabase *)&v5 initWithDatabasePath:@"/var/mobile/Media/Books/Sync/Database/OutstandingAssets_4.sqlite"];
  if (result) {
    result->_psErrorRetryCount = 0;
  }
  return result;
}

- (BOOL)shouldRetryAddingPersistentStoreAfterError:(id)a3
{
  p_int psErrorRetryCount = &self->_psErrorRetryCount;
  int psErrorRetryCount = self->_psErrorRetryCount;
  objc_super v5 = BCDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (psErrorRetryCount <= 0)
  {
    if (v6) {
      sub_151A4(v5);
    }
    +[BCAssetDatabase removeDatabase];
  }
  else if (v6)
  {
    sub_151E8(p_psErrorRetryCount, v5);
  }
  int v7 = (*p_psErrorRetryCount)++;
  return v7 < 1;
}

+ (void)removeDatabase
{
  v2 = BCDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Removing the database.", buf, 2u);
  }
  uint64_t v15 = 0;
  v3 = +[NSFileManager defaultManager];
  if ([(NSFileManager *)v3 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Database/"])
  {
    if ([(NSFileManager *)v3 removeItemAtPath:@"/var/mobile/Media/Books/Sync/Database/" error:&v15])
    {
      v4 = BCDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v19 = @"/var/mobile/Media/Books/Sync/Database/";
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "deleted: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = v15;
      int v7 = BCDefaultLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (v6)
      {
        if (v8) {
          sub_152D0(@"/var/mobile/Media/Books/Sync/Database/");
        }
      }
      else if (v8)
      {
        sub_15264(@"/var/mobile/Media/Books/Sync/Database/", v7, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  else
  {
    objc_super v5 = BCDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_15344(v5);
    }
  }
  if (![(NSFileManager *)v3 fileExistsAtPath:@"/var/mobile/Media/Books/Sync/Database/"])
  {
    v16[0] = NSFileOwnerAccountName;
    v16[1] = NSFileGroupOwnerAccountName;
    v17[0] = @"mobile";
    v17[1] = @"mobile";
    [(NSFileManager *)v3 createDirectoryAtPath:@"/var/mobile/Media/Books/Sync/Database/" withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2] error:0];
  }
}

- (void)removeEntities:(id)a3 byPredicate:(id)a4
{
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = [(BCDatabase *)self newManagedObjectContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10E2C;
  v10[3] = &unk_20640;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = v9;
  v10[8] = a2;
  [v9 performBlockAndWait:v10];
}

- (id)entities:(id)a3 byPredicate:(id)a4 fromMOC:(id)a5
{
  id v8 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v8, "setEntity:", +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", a3, a5));
  [v8 setPredicate:a4];
  uint64_t v13 = 0;
  id v9 = [a5 executeFetchRequest:v8 error:&v13];
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v13 == 0;
  }
  if (!v10)
  {
    uint64_t v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_15400((uint64_t)a3);
    }
  }

  return v9;
}

- (id)cachedEntities:(id)a3 byPersistentIDs:(id)a4 metrics:(id *)a5
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = sub_11280;
  CFStringRef v19 = sub_11290;
  uint64_t v20 = 0;
  if (![a4 count])
  {
    uint64_t v11 = BCDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      sub_15474(v11);
      if (!a5) {
        goto LABEL_6;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
    a5->var0 = 0;
    a5->var1 = 0;
    goto LABEL_6;
  }
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = [(BCDatabase *)self newManagedObjectContext];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1129C;
  v14[3] = &unk_20668;
  v14[4] = a3;
  v14[5] = v10;
  v14[6] = a4;
  v14[7] = &v15;
  v14[8] = a5;
  [v10 performBlockAndWait:v14];

LABEL_6:
  id v12 = [(id)v16[5] allObjects];
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (id)cachedOutstandingAssetsByPersistentIDs:(id)a3
{
  v4 = +[NSSet setWithArray:a3];

  return [(BCAssetDatabase *)self cachedEntities:@"BCOutstandingAsset" byPersistentIDs:v4 metrics:0];
}

- (id)outstandingAssetsByRestoreFlag:(BOOL)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = [(BCDatabase *)self newManagedObjectContext];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_116F8;
  v9[3] = &unk_20690;
  BOOL v10 = a3;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = v5;
  [v7 performBlockAndWait:v9];

  return v5;
}

- (void)insertOutstandingAssetDictionaries:(id)a3 isRestore:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v14 = v4;
    __int16 v15 = 2112;
    id v16 = a3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Inserting outstanding assets with restoreFlag %d, asset dictionary %@.", buf, 0x12u);
  }
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = [(BCDatabase *)self newManagedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_119BC;
  v11[3] = &unk_206B8;
  BOOL v12 = v4;
  v11[4] = a3;
  v11[5] = v10;
  v11[6] = self;
  v11[7] = a2;
  [v10 performBlockAndWait:v11];
}

- (void)updateOutstandingAssetDictionaries:(id)a3 isRestore:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v14 = v4;
    __int16 v15 = 2112;
    id v16 = a3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Updating outstanding assets with restoreFlag %d, asset dictionary %@.", buf, 0x12u);
  }
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = [(BCDatabase *)self newManagedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11F5C;
  v11[3] = &unk_206B8;
  BOOL v12 = v4;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = v10;
  v11[7] = a2;
  [v10 performBlockAndWait:v11];
}

- (void)removeOutstandingAssetMissingFromPersistentIDs:(id)a3
{
  id v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Removing outstanding assets missing from IDs %@.", buf, 0xCu);
  }
  if ([a3 count])
  {
    id v7 = objc_alloc_init((Class)NSAutoreleasePool);
    id v8 = [(BCDatabase *)self newManagedObjectContext];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_12518;
    v9[3] = &unk_206E0;
    v9[4] = a3;
    v9[5] = self;
    v9[6] = v8;
    void v9[7] = a2;
    [v8 performBlockAndWait:v9];
  }
}

- (void)removeOutstandingAssetsByRestoreFlag:(BOOL)a3 keepDownloadedAssetRows:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = BCDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removing outstanding assets by restoreFlag %d, keepDownloadedAssetRows %d.", buf, 0xEu);
  }
  id v8 = +[NSPredicate predicateWithFormat:@"restoreRelated == %d", v5];
  if (v4) {
    id v8 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(restoreRelated == %d) AND (downloadCompletePath == %@)", v5, +[NSNull null]);
  }
  [(BCAssetDatabase *)self removeEntities:@"BCOutstandingAsset" byPredicate:v8];
}

- (void)removeOutstandingAssetByPersistentID:(id)a3
{
  BOOL v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing outstanding by ID %@.", buf, 0xCu);
  }
  [(BCAssetDatabase *)self removeEntities:@"BCOutstandingAsset" byPredicate:+[NSPredicate predicateWithFormat:@"persistentID == %@", a3]];
}

- (void)removeOutstandingAssetsByPersistentIDs:(id)a3
{
  BOOL v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing outstanding by IDs %@.", buf, 0xCu);
  }
  if ([a3 count]) {
    [(BCAssetDatabase *)self removeEntities:@"BCOutstandingAsset" byPredicate:+[NSPredicate predicateWithFormat:@"persistentID IN %@", a3]];
  }
}

- (void)setDownloadPath:(id)a3 forOutstandingAssetsByPersistentID:(id)a4
{
  id v8 = BCDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Setting download path %@ for ID %@.", buf, 0x16u);
  }
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = [(BCDatabase *)self newManagedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12CD4;
  v11[3] = &unk_20640;
  v11[4] = a4;
  v11[5] = self;
  v11[6] = v10;
  v11[7] = a3;
  void v11[8] = a2;
  [v10 performBlockAndWait:v11];
}

- (id)outstandingAssetDownloadCompletePathsMatchingArray:(id)a3
{
  BOOL v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Outstanding asset downloads complete with paths %@.", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  id v13 = sub_11280;
  __int16 v14 = sub_11290;
  uint64_t v15 = 0;
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = [(BCDatabase *)self newManagedObjectContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_130C8;
  v10[3] = &unk_20708;
  v10[4] = v7;
  v10[5] = a3;
  v10[6] = &buf;
  [v7 performBlockAndWait:v10];

  id v8 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

- (id)downloadCompletePathMap
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  __int16 v11 = sub_11280;
  uint64_t v12 = sub_11290;
  uint64_t v13 = 0;
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = [(BCDatabase *)self newManagedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_133A0;
  v7[3] = &unk_20730;
  v7[4] = v4;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)removeInstalledAssetsExcluding:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[NSPredicate predicateWithFormat:@"NOT (persistentID IN %@)", a3];
    [(BCAssetDatabase *)self removeEntities:@"BCInstalledAsset" byPredicate:v5];
  }
}

- (id)cachedInstalledAssetsByPersistentIDs:(id)a3 metrics:(id *)a4
{
  return [(BCAssetDatabase *)self cachedEntities:@"BCInstalledAsset" byPersistentIDs:a3 metrics:a4];
}

- (void)insertInstalledAssetByPersistentID:(id)a3 withSize:(unint64_t)a4
{
  if ([a3 length])
  {
    id v8 = objc_alloc_init((Class)NSAutoreleasePool);
    id v9 = [(BCDatabase *)self newManagedObjectContext];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_136A0;
    v17[3] = &unk_20758;
    v17[4] = a3;
    v17[5] = self;
    v17[6] = v9;
    v17[7] = a4;
    v17[8] = a2;
    [v9 performBlockAndWait:v17];
  }
  else
  {
    uint64_t v10 = BCDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_15684(a4, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

@end