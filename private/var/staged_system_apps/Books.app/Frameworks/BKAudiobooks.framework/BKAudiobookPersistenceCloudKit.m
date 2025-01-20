@interface BKAudiobookPersistenceCloudKit
- (BCCloudAssetDetailManager)assetDetailManager;
- (BKAudiobookPersistenceCloudKit)initWithAssetDetailManager:(id)a3;
- (BOOL)isLocal;
- (NSString)shortName;
- (int64_t)eventThreshold;
- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4;
- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5;
- (void)setAssetDetailManager:(id)a3;
@end

@implementation BKAudiobookPersistenceCloudKit

- (BKAudiobookPersistenceCloudKit)initWithAssetDetailManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAudiobookPersistenceCloudKit;
  v6 = [(BKAudiobookPersistenceCloudKit *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetDetailManager, a3);
  }

  return v7;
}

- (int64_t)eventThreshold
{
  return 5;
}

- (NSString)shortName
{
  return (NSString *)@"CloudKit";
}

- (BOOL)isLocal
{
  return 0;
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_0, "Books/audiobook-query-cloud-bookmark", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23068;
  block[3] = &unk_3D220;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BKAudiobookPersistenceCloudKit *)self assetDetailManager];
  v11 = [v8 assetID];
  if ([v11 length])
  {
    if (v10)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_23518;
      v17[3] = &unk_3D270;
      v18 = v11;
      double v22 = a3;
      id v19 = v8;
      id v20 = v10;
      id v21 = v9;
      [v20 assetDetailForAssetID:v18 completion:v17];

      id v12 = v18;
      goto LABEL_13;
    }
    v15 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_26558(v15);
    }

    id v12 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v12)
    {
      uint64_t v14 = 2;
      goto LABEL_12;
    }
  }
  else
  {
    v13 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_26514(v13);
    }

    id v12 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v12)
    {
      uint64_t v14 = 1;
LABEL_12:
      v16 = +[NSError errorWithDomain:@"BKAudiobooksError" code:v14 userInfo:0];
      v12[2](v12, v16);
    }
  }
LABEL_13:
}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

- (void)setAssetDetailManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end