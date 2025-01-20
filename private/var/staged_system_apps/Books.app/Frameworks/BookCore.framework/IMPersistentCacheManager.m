@interface IMPersistentCacheManager
+ (id)sharedInstance;
- (IMPersistentCacheManager)init;
- (id)cacheForPath:(id)a3 maxSize:(unint64_t)a4;
- (void)_cleanCachesInPath:(id)a3;
- (void)addCleanupExclusionPath:(id)a3;
- (void)cleanUpCacheFilesInPath:(id)a3 withExtension:(id)a4;
- (void)purgeFromCache:(id)a3;
@end

@implementation IMPersistentCacheManager

- (IMPersistentCacheManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMPersistentCacheManager;
  v2 = [(IMPersistentCacheManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    caches = v2->_caches;
    v2->_caches = (NSMutableDictionary *)v3;

    v5 = (NSCountedSet *)[objc_alloc((Class)NSCountedSet) initWithCapacity:6];
    pathRequestCount = v2->_pathRequestCount;
    v2->_pathRequestCount = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesmobile.impersistentcachemanager", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CBCAC;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_345CB0 != -1) {
    dispatch_once(&qword_345CB0, block);
  }
  v2 = (void *)qword_345CA8;

  return v2;
}

- (void)_cleanCachesInPath:(id)a3
{
  id v4 = a3;
  id v6 = [v4 stringByDeletingLastPathComponent];
  v5 = [v4 pathExtension];

  [(IMPersistentCacheManager *)self cleanUpCacheFilesInPath:v6 withExtension:v5];
}

- (id)cacheForPath:(id)a3 maxSize:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_CBE80;
  v19 = sub_CBE90;
  id v20 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CBE98;
  v11[3] = &unk_2C8998;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(accessQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)purgeFromCache:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CBFE4;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)addCleanupExclusionPath:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CC0DC;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)cleanUpCacheFilesInPath:(id)a3 withExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CC204;
  block[3] = &unk_2C48E0;
  id v12 = v6;
  id v13 = v7;
  unint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_excludedCachesForCleanup, 0);
  objc_storeStrong((id *)&self->_pathRequestCount, 0);

  objc_storeStrong((id *)&self->_caches, 0);
}

@end