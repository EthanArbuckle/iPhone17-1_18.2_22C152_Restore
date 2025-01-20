@interface ICCloudContentTasteResponseCacheManager
+ (id)sharedCloudContentTasteResponseCacheManager;
- (BOOL)setCachedContentTasteUpdateResponse:(id)a3 forConnectionConfiguration:(id)a4;
- (ICCloudContentTasteResponseCacheManager)init;
- (id)_init;
- (id)_mediaContentTasteCacheFilePathForAccount:(id)a3;
- (id)_prepareArchiveWithContentTasteReponse:(id)a3;
- (id)_prepareCachedResponseFromArchiveAtPath:(id)a3;
- (id)getCachedContentTasteResponseForConnectionConfiguration:(id)a3;
- (void)removeAllCachedContentTasteResponses;
- (void)removeCachedContentTasteResponseForConnectionConfiguration:(id)a3;
@end

@implementation ICCloudContentTasteResponseCacheManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContentTasteCacheDirectoryPath, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_prepareCachedResponseFromArchiveAtPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      v6 = +[NSData dataWithContentsOfFile:v3];
      if ([v6 length])
      {
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = objc_opt_class();
        v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
        v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v6 error:0];

        if (!v11) {
          goto LABEL_8;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_8;
        }
      }
      v11 = 0;
LABEL_8:

      goto LABEL_10;
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)_prepareArchiveWithContentTasteReponse:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_mediaContentTasteCacheFilePathForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userIdentityStore];
  v6 = [v4 userIdentity];
  id v13 = 0;
  uint64_t v7 = [v5 DSIDForUserIdentity:v6 outError:&v13];
  id v8 = v13;

  if (v8 || !v7)
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      __int16 v16 = 2048;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID for configuration=%p. error=%{public}@", buf, 0x20u);
    }
    v11 = 0;
  }
  else
  {
    mediaContentTasteCacheDirectoryPath = self->_mediaContentTasteCacheDirectoryPath;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SyncResponse-%llu", [v7 unsignedLongLongValue]);
    v11 = [(NSString *)mediaContentTasteCacheDirectoryPath stringByAppendingPathComponent:v10];
  }

  return v11;
}

- (void)removeCachedContentTasteResponseForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B9AF0;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)removeAllCachedContentTasteResponses
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9CA0;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (BOOL)setCachedContentTasteUpdateResponse:(id)a3 forConnectionConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  accessQueue = self->_accessQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BA03C;
  v12[3] = &unk_1001BC828;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (id)getCachedContentTasteResponseForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000BA3A8;
  uint64_t v16 = sub_1000BA3B8;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA3C0;
  block[3] = &unk_1001BC800;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ICCloudContentTasteResponseCacheManager;
  v2 = [(ICCloudContentTasteResponseCacheManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICCloudContentTasteResponseCacheManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Caches/com.apple.itunescloud/MediaContentTaste"];
    mediaContentTasteCacheDirectoryPath = v2->_mediaContentTasteCacheDirectoryPath;
    v2->_mediaContentTasteCacheDirectoryPath = (NSString *)v5;
  }
  return v2;
}

- (ICCloudContentTasteResponseCacheManager)init
{
  return 0;
}

+ (id)sharedCloudContentTasteResponseCacheManager
{
  if (qword_1001F38F0 != -1) {
    dispatch_once(&qword_1001F38F0, &stru_1001BC7D8);
  }
  v2 = (void *)qword_1001F38E8;

  return v2;
}

@end