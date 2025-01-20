@interface NDContentArchiveStore
+ (void)_prepareRootContainerAtPath:(id)a3;
- (BOOL)_isContentIDComplete:(id)a3;
- (BOOL)isContentIDComplete:(id)a3;
- (FCCacheCoordinator)cacheCoordinator;
- (NDContentArchiveStore)initWithCacheDirectory:(id)a3;
- (NDContentArchiveStore)initWithParentDirectory:(id)a3 name:(id)a4;
- (NSArray)allCompleteContentIDs;
- (NSString)rootContainerPath;
- (id)_blobPathForName:(id)a3 contentID:(id)a4;
- (id)_containerPathForContentID:(id)a3;
- (id)_manifestPathForContentID:(id)a3;
- (id)_newUniqueArchivePathForContentID:(id)a3;
- (id)_tokenPathForContentID:(id)a3;
- (id)aggregateArchiveForContentID:(id)a3;
- (id)archivesForContentID:(id)a3;
- (id)blobWithName:(id)a3 contentID:(id)a4;
- (id)bookmarkForBlobWithName:(id)a3 contentID:(id)a4;
- (id)interestTokenForContentID:(id)a3;
- (id)interestTokenForContentIDs:(id)a3;
- (id)manifestForContentID:(id)a3;
- (int64_t)storageSize;
- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3;
- (void)_pruneArchivesFromContainer:(id)a3 forContentID:(id)a4;
- (void)addArchive:(id)a3 forContentID:(id)a4;
- (void)addBlob:(id)a3 name:(id)a4 contentID:(id)a5;
- (void)addManifest:(id)a3 forContentID:(id)a4;
- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4;
- (void)didCompleteContentID:(id)a3;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)prepareForContentID:(id)a3;
- (void)pruneArchivesForContentID:(id)a3;
@end

@implementation NDContentArchiveStore

- (NDContentArchiveStore)initWithParentDirectory:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NDContentArchiveStore;
  v8 = [(NDContentArchiveStore *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [v6 stringByAppendingPathComponent:v7];
    rootContainerPath = v8->_rootContainerPath;
    v8->_rootContainerPath = (NSString *)v9;

    v11 = (FCCacheCoordinator *)objc_alloc_init((Class)FCCacheCoordinator);
    cacheCoordinator = v8->_cacheCoordinator;
    v8->_cacheCoordinator = v11;

    [(id)objc_opt_class() _prepareRootContainerAtPath:v8->_rootContainerPath];
    v13 = +[NSFileManager defaultManager];
    v14 = [v13 contentsOfDirectoryAtPath:v8->_rootContainerPath error:0];

    v15 = +[NSMutableArray array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v14;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (-[NDContentArchiveStore isContentIDComplete:](v8, "isContentIDComplete:", v21, (void)v27))
          {
            [v15 addObject:v21];
          }
          else
          {
            v22 = [(NDContentArchiveStore *)v8 _containerPathForContentID:v21];
            [(NDContentArchiveStore *)v8 _pruneArchivesFromContainer:v22 forContentID:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v18);
    }

    v23 = (void *)FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      id v25 = [v15 count];
      *(_DWORD *)buf = 134218242;
      id v33 = v25;
      __int16 v34 = 2114;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "content archive store loaded with %lu content IDs, contentIDs=%{public}@", buf, 0x16u);
    }
    -[FCCacheCoordinator setupWithInitialKeys:](v8->_cacheCoordinator, "setupWithInitialKeys:", v16, (void)v27);
    [(FCCacheCoordinator *)v8->_cacheCoordinator setDelegate:v8];
  }
  return v8;
}

- (NDContentArchiveStore)initWithCacheDirectory:(id)a3
{
  return [(NDContentArchiveStore *)self initWithParentDirectory:a3 name:@"content-archives"];
}

- (NSArray)allCompleteContentIDs
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100011F18;
  v11 = sub_100011F28;
  id v12 = 0;
  v3 = [(NDContentArchiveStore *)self cacheCoordinator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011F30;
  v6[3] = &unk_100061E60;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performCacheRead:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)prepareForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentArchiveStore *)self _containerPathForContentID:v4];
  id v6 = [(NDContentArchiveStore *)self cacheCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000120DC;
  v9[3] = &unk_100061980;
  id v10 = v5;
  v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performCacheWrite:v9];
}

- (void)pruneArchivesForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentArchiveStore *)self _containerPathForContentID:v4];
  id v6 = [(NDContentArchiveStore *)self cacheCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001235C;
  v9[3] = &unk_100061980;
  void v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performCacheWrite:v9];
}

- (void)addArchive:(id)a3 forContentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = 0;
  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v23];
  id v10 = v23;
  if (v9)
  {
    id v11 = v9;
    id v12 = [(NDContentArchiveStore *)self _newUniqueArchivePathForContentID:v7];
    v13 = [(NDContentArchiveStore *)self cacheCoordinator];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100012590;
    v16[3] = &unk_100061980;
    id v17 = v11;
    id v18 = v12;
    id v19 = v7;
    id v14 = v12;
    id v15 = v11;
    [v13 performCacheWrite:v16];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100012544;
    v20[3] = &unk_1000618B8;
    id v21 = v7;
    id v22 = v10;
    ((void (*)(void *))sub_100012544)(v20);

    id v15 = v21;
  }
}

- (void)addManifest:(id)a3 forContentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = 0;
  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v23];
  id v10 = v23;
  if (v9)
  {
    id v11 = v9;
    id v12 = [(NDContentArchiveStore *)self _manifestPathForContentID:v7];
    v13 = [(NDContentArchiveStore *)self cacheCoordinator];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100012968;
    v16[3] = &unk_100061980;
    id v17 = v11;
    id v18 = v12;
    id v19 = v7;
    id v14 = v12;
    id v15 = v11;
    [v13 performCacheWrite:v16];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001291C;
    v20[3] = &unk_1000618B8;
    id v21 = v7;
    id v22 = v10;
    ((void (*)(void *))sub_10001291C)(v20);

    id v15 = v21;
  }
}

- (void)addBlob:(id)a3 name:(id)a4 contentID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [(NDContentArchiveStore *)self _blobPathForName:v9 contentID:v10];
  v13 = [(NDContentArchiveStore *)self cacheCoordinator];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012C60;
  v18[3] = &unk_100061E88;
  id v14 = v8;
  id v19 = v14;
  id v20 = v12;
  id v15 = v9;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  id v17 = v12;
  [v13 performCacheWrite:v18];
}

- (void)didCompleteContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentArchiveStore *)self _tokenPathForContentID:v4];
  id v6 = [(NDContentArchiveStore *)self cacheCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012F0C;
  v9[3] = &unk_1000618B8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performCacheWrite:v9];
}

- (BOOL)isContentIDComplete:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(NDContentArchiveStore *)self _tokenPathForContentID:v4];
  id v6 = [(NDContentArchiveStore *)self cacheCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001315C;
  v9[3] = &unk_100061E60;
  id v11 = &v12;
  id v7 = v5;
  id v10 = v7;
  [v6 performCacheRead:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

- (id)interestTokenForContentIDs:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentArchiveStore *)self cacheCoordinator];
  id v6 = [v5 holdTokenForKeys:v4];

  return v6;
}

- (id)interestTokenForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentArchiveStore *)self cacheCoordinator];
  id v6 = [v5 holdTokenForKey:v4];

  return v6;
}

- (id)manifestForContentID:(id)a3
{
  id v4 = a3;
  id v6 = [(NDContentArchiveStore *)self _manifestPathForContentID:v4];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100011F18;
  id v22 = sub_100011F28;
  id v23 = 0;
  id v7 = [(NDContentArchiveStore *)self cacheCoordinator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013490;
  v15[3] = &unk_100061E60;
  id v17 = &v18;
  id v8 = v6;
  id v16 = v8;
  [v7 performCacheRead:v15];

  if (v19[5])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v19[5];
    id v14 = 0;
    id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v9 fromData:v10 error:&v14];
    id v12 = v14;
    if (!v11 && os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
      sub_100048A80((uint64_t)v4);
    }
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)archivesForContentID:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v7 = [(NDContentArchiveStore *)self _containerPathForContentID:v4];
  id v8 = [(NDContentArchiveStore *)self cacheCoordinator];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013604;
  v12[3] = &unk_1000618B8;
  id v13 = v7;
  id v9 = v5;
  id v14 = v9;
  id v10 = v7;
  [v8 performCacheRead:v12];

  return v9;
}

- (id)aggregateArchiveForContentID:(id)a3
{
  v3 = [(NDContentArchiveStore *)self archivesForContentID:a3];
  id v4 = +[FCContentArchive archiveWithChildArchives:v3];

  return v4;
}

- (id)blobWithName:(id)a3 contentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100011F18;
  id v21 = sub_100011F28;
  id v22 = 0;
  id v9 = [(NDContentArchiveStore *)self _blobPathForName:v6 contentID:v7];
  id v10 = [(NDContentArchiveStore *)self cacheCoordinator];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001397C;
  v14[3] = &unk_100061E60;
  id v16 = &v17;
  id v11 = v9;
  id v15 = v11;
  [v10 performCacheRead:v14];

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)bookmarkForBlobWithName:(id)a3 contentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100011F18;
  v26 = sub_100011F28;
  id v27 = 0;
  id v9 = [(NDContentArchiveStore *)self _blobPathForName:v6 contentID:v7];
  id v10 = +[NSURL fileURLWithPath:v9];
  id v11 = [(NDContentArchiveStore *)self cacheCoordinator];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013BA8;
  v17[3] = &unk_100061EB0;
  id v21 = &v22;
  id v12 = v10;
  id v18 = v12;
  id v13 = v6;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  [v11 performCacheRead:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (int64_t)storageSize
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(NDContentArchiveStore *)self rootContainerPath];
  v5 = +[NSURL fileURLWithPath:v4];
  id v6 = objc_msgSend(v3, "fc_sizeOfItemAtURL:error:", v5, 0);

  return (int64_t)v6;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  id v5 = [objc_alloc((Class)FCCacheCoordinatorFlushPolicy) initWithLowWaterMark:0 highWaterMark:0 alwaysFlushKeysWithZeroInterest:1];
  id v4 = [(NDContentArchiveStore *)self cacheCoordinator];
  [v4 enableFlushingWithPolicy:v5];
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  return 0;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138543618;
    long long v16 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v11 = -[NDContentArchiveStore _containerPathForContentID:](self, "_containerPathForContentID:", v10, v16);
        id v12 = +[NSFileManager defaultManager];
        id v18 = 0;
        unsigned int v13 = [v12 removeItemAtPath:v11 error:&v18];
        id v14 = v18;

        id v15 = FCOfflineDownloadsLog;
        if (v13)
        {
          if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v10;
            __int16 v25 = 2114;
            id v26 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "content archive store flushed container for contentID=%{public}@, containerPath=%{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          uint64_t v24 = v10;
          __int16 v25 = 2114;
          id v26 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "content archive store failed to flush container for contentID=%{public}@, error=%{public}@", buf, 0x16u);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
}

- (id)_containerPathForContentID:(id)a3
{
  id v4 = a3;
  id v5 = [(NDContentArchiveStore *)self rootContainerPath];
  long long v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)_manifestPathForContentID:(id)a3
{
  v3 = [(NDContentArchiveStore *)self _containerPathForContentID:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"manifest"];

  return v4;
}

- (id)_newUniqueArchivePathForContentID:(id)a3
{
  v3 = [(NDContentArchiveStore *)self _containerPathForContentID:a3];
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];
  long long v6 = [v3 stringByAppendingPathComponent:v5];
  id v7 = [v6 stringByAppendingPathExtension:@"contentArchive"];

  return v7;
}

- (id)_blobPathForName:(id)a3 contentID:(id)a4
{
  id v6 = a3;
  id v7 = [(NDContentArchiveStore *)self _containerPathForContentID:a4];
  uint64_t v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

- (id)_tokenPathForContentID:(id)a3
{
  v3 = [(NDContentArchiveStore *)self _containerPathForContentID:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"complete"];

  return v4;
}

- (BOOL)_isContentIDComplete:(id)a3
{
  v3 = [(NDContentArchiveStore *)self _tokenPathForContentID:a3];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (void)_pruneArchivesFromContainer:(id)a3 forContentID:(id)a4
{
  id v37 = a3;
  id v35 = a4;
  id v6 = -[NDContentArchiveStore _tokenPathForContentID:](self, "_tokenPathForContentID:");
  id v7 = FCContextConfiguration_ptr;
  uint64_t v8 = +[NSFileManager defaultManager];
  if ([v8 fileExistsAtPath:v6])
  {
    id v9 = +[NSFileManager defaultManager];
    id v44 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v6 error:&v44];
    id v11 = v44;

    if ((v10 & 1) == 0 && os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
      sub_100048B70((uint64_t)v35);
    }
  }
  else
  {

    id v11 = 0;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 subpathsOfDirectoryAtPath:v37 error:0];

  id v14 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v14)
  {
    id v15 = v14;
    id v33 = v11;
    __int16 v34 = v6;
    v36 = 0;
    uint64_t v16 = *(void *)v41;
    CFStringRef v17 = @"contentArchive";
    do
    {
      id v18 = 0;
      id v38 = v15;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v18);
        long long v21 = [v19 pathExtension];
        unsigned int v22 = [v21 isEqualToString:v17];

        if (v22)
        {
          uint64_t v23 = v16;
          CFStringRef v24 = v17;
          __int16 v25 = v13;
          id v26 = [v37 stringByAppendingPathComponent:v19];
          id v27 = v7;
          long long v28 = [v7[34] defaultManager];
          id v39 = 0;
          unsigned int v29 = [v28 removeItemAtPath:v26 error:&v39];
          id v30 = v39;

          if (v29)
          {
            ++v36;
          }
          else
          {
            objc_super v31 = FCOfflineDownloadsLog;
            if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v46 = v35;
              __int16 v47 = 2114;
              id v48 = v30;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "content archive store failed to remove archive for incomplete container, contentID=%{public}@, error=%{public}@", buf, 0x16u);
            }
          }
          id v7 = v27;

          unsigned int v13 = v25;
          CFStringRef v17 = v24;
          uint64_t v16 = v23;
          id v15 = v38;
        }
        id v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      id v15 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v15);

    id v11 = v33;
    id v6 = v34;
    if (v36)
    {
      v32 = FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v46 = v36;
        __int16 v47 = 2114;
        id v48 = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "content archive store removed %lu archives from container, contentID=%{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
  }
}

+ (void)_prepareRootContainerAtPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    unsigned __int16 value = 0;
    id v6 = v3;
    getxattr((const char *)[v6 fileSystemRepresentation], "com.apple.newsd.storeVersion", &value, 2uLL, 0, 0);
    if (value != 1)
    {
      id v7 = FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v14 = value;
        __int16 v15 = 2048;
        uint64_t v16 = 1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "wiping content archive store because persisted version %lu does not match current version %lu", buf, 0x16u);
      }
      uint64_t v8 = +[NSFileManager defaultManager];
      [v8 removeItemAtPath:v6 error:0];
    }
  }
  id v9 = +[NSFileManager defaultManager];
  unsigned __int8 v10 = [v9 fileExistsAtPath:v3];

  if ((v10 & 1) == 0)
  {
    id v11 = +[NSFileManager defaultManager];
    [v11 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

    setxattr((const char *)[v3 fileSystemRepresentation], "com.apple.newsd.storeVersion", &NDContentArchiveStoreVersion, 2uLL, 0, 0);
  }
}

- (NSString)rootContainerPath
{
  return self->_rootContainerPath;
}

- (FCCacheCoordinator)cacheCoordinator
{
  return self->_cacheCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);

  objc_storeStrong((id *)&self->_rootContainerPath, 0);
}

@end