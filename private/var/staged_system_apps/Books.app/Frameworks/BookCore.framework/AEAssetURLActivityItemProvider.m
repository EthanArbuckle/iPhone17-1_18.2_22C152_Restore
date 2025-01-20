@interface AEAssetURLActivityItemProvider
- (AEAssetURLActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4;
- (BOOL)supportsActivityType:(id)a3;
- (NSURL)temporaryURL;
- (id)_tempBookURL;
- (id)item;
- (id)placeholderItem;
- (void)dealloc;
- (void)setTemporaryURL:(id)a3;
@end

@implementation AEAssetURLActivityItemProvider

- (AEAssetURLActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSURL URLWithString:&stru_2CE418];
  v11.receiver = self;
  v11.super_class = (Class)AEAssetURLActivityItemProvider;
  v9 = [(AEAssetBaseActivityItemProvider *)&v11 initWithDelegate:v7 placeholderItem:v8 propertySource:v6];

  return v9;
}

- (void)dealloc
{
  if (self->_temporaryURL)
  {
    v3 = +[NSFileManager defaultManager];
    [v3 removeItemAtURL:self->_temporaryURL error:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)AEAssetURLActivityItemProvider;
  [(AEAssetURLActivityItemProvider *)&v4 dealloc];
}

- (BOOL)supportsActivityType:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  v3 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  if ([v3 isStoreAsset])
  {
    uint64_t v4 = objc_opt_new();
  }
  else
  {
    uint64_t v4 = [(AEAssetURLActivityItemProvider *)self _tempBookURL];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)item
{
  v3 = [(AEAssetURLActivityItemProvider *)self activityType];
  uint64_t v4 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  [v4 setActivityType:v3];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_84828;
  v32 = sub_84838;
  id v33 = 0;
  v5 = [(AEAssetURLActivityItemProvider *)self activityType];
  LODWORD(v4) = [(AEAssetBaseActivityItemProvider *)self shouldShareActivityType:v5];

  if (v4)
  {
    id v6 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    if ([v6 isStoreAsset])
    {
      id v7 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
      [v7 storeURL];
    }
    else
    {
      id v7 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
      [v7 bookURL];
    v8 = };

    if ([v8 isFileURL])
    {
      v9 = [(AEAssetURLActivityItemProvider *)self _tempBookURL];
      v10 = +[NSFileManager defaultManager];
      objc_super v11 = [v9 path];
      unsigned int v12 = [v10 fileExistsAtPath:v11];

      if (v12
        && ([v9 path],
            v13 = objc_claimAutoreleasedReturnValue(),
            id v27 = 0,
            [v10 removeItemAtPath:v13 error:&v27],
            id v14 = v27,
            v13,
            v14))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1EB440();
        }
      }
      else
      {
        id v17 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
        id v26 = 0;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_84840;
        v21[3] = &unk_2C71A0;
        id v22 = v10;
        v24 = self;
        v25 = &v28;
        id v23 = v9;
        [v17 coordinateReadingItemAtURL:v8 options:1 error:&v26 byAccessor:v21];
        id v18 = v26;
        if (v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1EB3C4();
        }

        id v14 = 0;
      }
    }
    else
    {
      v15 = v29;
      id v16 = v8;
      id v14 = (id)v15[5];
      v15[5] = (uint64_t)v16;
    }
  }
  id v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

- (id)_tempBookURL
{
  v3 = NSTemporaryDirectory();
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"Sharing"];

  v5 = +[NSFileManager defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    id v6 = 0;
  }
  else
  {
    id v14 = 0;
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v6 = v14;
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1EB5C4();
    }
  }
  id v7 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  v8 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  v9 = [v8 bookURL];
  v10 = [v9 lastPathComponent];

  if (v10)
  {
    uint64_t v11 = [v7 URLByAppendingPathComponent:v10];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1EB52C(self);
    }
    uint64_t v11 = objc_opt_new();
  }
  unsigned int v12 = (void *)v11;

  return v12;
}

- (NSURL)temporaryURL
{
  return self->_temporaryURL;
}

- (void)setTemporaryURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end