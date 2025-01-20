@interface BKAssetLookup
+ (BKAssetLookup)assetLookupWithID:(id)a3 options:(id)a4 completion:(id)a5;
+ (BKAssetLookup)assetLookupWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)validateAssetAuthorization:(id)a3 completion:(id)a4;
- (BKAssetLookup)initWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (BKAssetLookup)initWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (BKLibraryAssetIdentifier)assetIdentifier;
- (BOOL)_isProperlyInstalledAssetURL:(id)a3;
- (NSDictionary)options;
- (OS_dispatch_queue)sync;
- (id)completion;
- (void)_completeWithAssetViewController:(id)a3 helper:(id)a4 error:(id)a5;
- (void)_load;
- (void)cancel;
- (void)setAssetIdentifier:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSync:(id)a3;
@end

@implementation BKAssetLookup

+ (BKAssetLookup)assetLookupWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithID:v10 options:v9 completion:v8];

  return (BKAssetLookup *)v11;
}

+ (BKAssetLookup)assetLookupWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithIdentifier:v10 options:v9 completion:v8];

  return (BKAssetLookup *)v11;
}

- (BKAssetLookup)initWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[BKAssetID identifierWithAssetID:a3];
  id v11 = [(BKAssetLookup *)self initWithIdentifier:v10 options:v9 completion:v8];

  return v11;
}

- (BKAssetLookup)initWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKAssetLookup;
  id v11 = [(BKAssetLookup *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(BKAssetLookup *)v11 setAssetIdentifier:v8];
    [(BKAssetLookup *)v12 setCompletion:v10];
    [(BKAssetLookup *)v12 setOptions:v9];
    dispatch_queue_t v13 = dispatch_queue_create("BKAssetLookup", 0);
    [(BKAssetLookup *)v12 setSync:v13];

    [(BKAssetLookup *)v12 _load];
  }

  return v12;
}

- (void)_completeWithAssetViewController:(id)a3 helper:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100007014;
  v19 = sub_1000071F4;
  id v20 = 0;
  id v11 = [(BKAssetLookup *)self sync];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013C580;
  v14[3] = &unk_100A44058;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(v11, v14);

  id v12 = objc_retainBlock((id)v16[5]);
  dispatch_queue_t v13 = v12;
  if (v12) {
    (*((void (**)(id, id, id, id))v12 + 2))(v12, v8, v9, v10);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)_load
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10013C6E0;
  v3[3] = &unk_100A43D60;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v2[2])(v2);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

- (BOOL)_isProperlyInstalledAssetURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    v4 = [v3 pathExtension];
    if ([v4 caseInsensitiveCompare:@"epub"]
      && [v4 caseInsensitiveCompare:@"ibooks"])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      id v6 = objc_alloc_init((Class)NSFileManager);
      v7 = [v3 path];
      id v8 = [v6 attributesOfItemAtPath:v7 error:0];

      if (v8)
      {
        id v9 = [v8 objectForKey:NSFileType];
        unsigned __int8 v5 = [v9 isEqualToString:NSFileTypeDirectory];
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)cancel
{
  id v3 = +[NSError errorWithDomain:@"BKAssetLookup" code:0 userInfo:0];
  [(BKAssetLookup *)self _completeWithAssetViewController:0 helper:0 error:v3];
}

+ (void)validateAssetAuthorization:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v8 = +[AEPluginRegistry sharedInstance];
    id v9 = [v8 pluginForURL:v5];

    if (v9)
    {
      id v10 = +[NSFileAccessIntent readingIntentWithURL:v5 options:1];
      id v11 = objc_opt_new();
      v23 = v10;
      id v12 = +[NSArray arrayWithObjects:&v23 count:1];
      dispatch_queue_t v13 = objc_opt_new();
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10013D13C;
      v18[3] = &unk_100A47DF0;
      id v19 = v5;
      id v22 = v7;
      id v20 = v9;
      id v21 = v10;
      id v14 = v10;
      [v11 coordinateAccessWithIntents:v12 queue:v13 byAccessor:v18];
    }
    else
    {
      id v16 = objc_retainBlock(v7);
      uint64_t v17 = v16;
      if (v16) {
        (*((void (**)(id, void))v16 + 2))(v16, 0);
      }
    }
  }
  else
  {
    id v15 = objc_retainBlock(v6);
    id v9 = v15;
    if (v15) {
      (*((void (**)(id, void))v15 + 2))(v15, 0);
    }
  }
}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end