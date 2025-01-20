@interface SSUAssetManager
+ (id)sharedInstance;
- (NSDictionary)assetNameForMediaName;
- (SSUAssetManager)init;
- (id)_getAssetURLFuture:(id)a3;
- (id)combineAllFutures:(id)a3;
- (unint64_t)getAssetVersion:(id)a3 forKey:(id)a4;
- (void)_downloadAssetForCompabilityVersions:(id)a3 withCompleteHandler:(id)a4;
- (void)_fetchAssetCatalog:(id)a3;
- (void)_getSystemVersionsMappingWithCompleteHandler:(id)a3;
- (void)downloadAssetForCompabilityVersions:(id)a3 withCompleteHandler:(id)a4;
- (void)downloadCatalogWithCompleteHandler:(id)a3;
- (void)getSystemVersionsMappingWithCompleteHandler:(id)a3;
- (void)setAssetNameForMediaName:(id)a3;
@end

@implementation SSUAssetManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004048;
  block[3] = &unk_100031160;
  block[4] = a1;
  if (qword_100036518[0] != -1) {
    dispatch_once(qword_100036518, block);
  }
  v2 = (void *)qword_100036510;

  return v2;
}

- (SSUAssetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSUAssetManager;
  v2 = [(SSUAssetManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_catalogFailCount = 0;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.soundscapes.catalogDownload", v4);
    catalogDownloadQueue = v3->_catalogDownloadQueue;
    v3->_catalogDownloadQueue = (OS_dispatch_queue *)v5;

    v3->_isCatalogDownloaded = 0;
  }
  return v3;
}

- (void)downloadCatalogWithCompleteHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MADownloadOptions);
  [v5 setTimeoutIntervalForResource:5];
  [v5 setDiscretionary:0];
  v6 = sub_100003F10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100028B24();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004274;
  v8[3] = &unk_1000311B0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.SoundScapesPickerAssets" options:v5 completionWithError:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_fetchAssetCatalog:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = sub_100003F10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100028C9C();
  }

  objc_initWeak(&location, self);
  if (self->_isCatalogDownloaded)
  {
    v6 = sub_100003F10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100028C68();
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    id v7 = sub_100003F10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100028C34();
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000046D0;
    v8[3] = &unk_1000311D8;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [(SSUAssetManager *)self downloadCatalogWithCompleteHandler:v8];

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)_getSystemVersionsMappingWithCompleteHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003F10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100028DC4();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004894;
  v8[3] = &unk_100031228;
  id v10 = self;
  id v11 = v4;
  id v9 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SoundScapesPickerAssets"];
  id v6 = v9;
  id v7 = v4;
  [v6 queryMetaDataWithError:v8];
}

- (void)getSystemVersionsMappingWithCompleteHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003F10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100028F70();
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004D50;
  v7[3] = &unk_100031250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSUAssetManager *)self _fetchAssetCatalog:v7];
}

- (id)_getAssetURLFuture:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004E74;
  v6[3] = &unk_1000312A0;
  id v7 = a3;
  id v3 = v7;
  id v4 = +[NAFuture futureWithBlock:v6];

  return v4;
}

- (void)downloadAssetForCompabilityVersions:(id)a3 withCompleteHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003F10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100029154();
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005210;
  v11[3] = &unk_1000312C8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SSUAssetManager *)self _fetchAssetCatalog:v11];
}

- (void)_downloadAssetForCompabilityVersions:(id)a3 withCompleteHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003F10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100029250();
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000053A8;
  v12[3] = &unk_100031368;
  id v13 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SoundScapesPickerAssets"];
  v14 = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v6;
  id v10 = v13;
  id v11 = v7;
  [v10 queryMetaDataWithError:v12];
}

- (id)combineAllFutures:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NAFuture);
    id v5 = [v3 count];
    id v6 = +[NAScheduler mainThreadScheduler];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = v5;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = v5;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v30 = malloc_type_calloc(8uLL, (size_t)v5, 0xA323DE24uLL);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_1000059E0;
    v27[4] = sub_1000059F0;
    id v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000059F8;
    v24[3] = &unk_100031390;
    v24[4] = v29;
    v24[5] = v5;
    id v7 = objc_retainBlock(v24);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005A68;
    v14[3] = &unk_100031430;
    v18 = v29;
    v19 = v27;
    id v8 = v4;
    id v15 = v8;
    v20 = v32;
    v21 = v31;
    v22 = v25;
    id v23 = v5;
    id v9 = v6;
    id v16 = v9;
    id v10 = v7;
    id v17 = v10;
    [v3 enumerateObjectsUsingBlock:v14];
    id v11 = v17;
    id v12 = v8;

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    id v12 = +[NAFuture futureWithResult:&__NSArray0__struct];
  }

  return v12;
}

- (unint64_t)getAssetVersion:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 attributes];
    id v8 = [v7 objectForKey:v6];

    if (v8)
    {
      id v9 = [v5 attributes];
      id v10 = [v9 objectForKey:v6];
      unint64_t v11 = (unint64_t)[v10 integerValue];
    }
    else
    {
      id v12 = sub_100003F10();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000293B8();
      }

      unint64_t v11 = -1;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (NSDictionary)assetNameForMediaName
{
  return self->_assetNameForMediaName;
}

- (void)setAssetNameForMediaName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetNameForMediaName, 0);

  objc_storeStrong((id *)&self->_catalogDownloadQueue, 0);
}

@end