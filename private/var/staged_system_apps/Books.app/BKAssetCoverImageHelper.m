@interface BKAssetCoverImageHelper
- (AEPluginRegistry)pluginRegistry;
- (BKAssetCoverImageHelper)initWithThumbnailGenerator:(id)a3 pluginRegistry:(id)a4;
- (QLThumbnailGenerator)thumbnailGenerator;
- (void)_helper:(id)a3 coverImageWithCompletion:(id)a4;
- (void)_imageIOCoverImageFromURL:(id)a3 completion:(id)a4;
- (void)_pluginRegistryCoverImageFromURL:(id)a3 completion:(id)a4;
- (void)_thumbnailGeneratorCoverImageFromURL:(id)a3 completion:(id)a4;
- (void)coverImageFromURL:(id)a3 completion:(id)a4;
@end

@implementation BKAssetCoverImageHelper

- (BKAssetCoverImageHelper)initWithThumbnailGenerator:(id)a3 pluginRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKAssetCoverImageHelper;
  v9 = [(BKAssetCoverImageHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginRegistry, a4);
    objc_storeStrong((id *)&v10->_thumbnailGenerator, a3);
  }

  return v10;
}

- (void)coverImageFromURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000E1348;
    v11[3] = &unk_100A46578;
    id v13 = v7;
    id v12 = v6;
    objc_copyWeak(&v14, &location);
    [(BKAssetCoverImageHelper *)self _thumbnailGeneratorCoverImageFromURL:v12 completion:v11];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EA398(v8);
    }

    v9 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v9)
    {
      v10 = +[NSError errorWithDomain:@"BKAssetCoverImageDomain" code:1000 userInfo:0];
      v9[2](v9, 0, v10);
    }
  }
}

- (void)_thumbnailGeneratorCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIScreen mainScreen];
  [v8 scale];
  double v10 = v9;

  v11 = [v7 pathExtension];
  id v12 = [v11 lowercaseString];
  if ([v12 isEqualToString:@"epub"]) {
    double v13 = 2048.0;
  }
  else {
    double v13 = 1024.0;
  }

  id v14 = [objc_alloc((Class)QLThumbnailGenerationRequest) initWithFileAtURL:v7 size:6 scale:v13 representationTypes:v13];
  v15 = [(BKAssetCoverImageHelper *)self thumbnailGenerator];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E18FC;
  v17[3] = &unk_100A465A0;
  id v18 = v6;
  id v16 = v6;
  [v15 generateBestRepresentationForRequest:v14 completionHandler:v17];
}

- (void)_pluginRegistryCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAssetCoverImageHelper *)self pluginRegistry];
  double v9 = [v8 pluginForURL:v7];

  double v10 = [v9 helperForURL:v7 withOptions:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E1A98;
  v12[3] = &unk_100A465C8;
  id v13 = v6;
  id v11 = v6;
  [(BKAssetCoverImageHelper *)self _helper:v10 coverImageWithCompletion:v12];
}

- (void)_helper:(id)a3 coverImageWithCompletion:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      [v10 helperCoverImageWithCompletion:v5];
      goto LABEL_10;
    }
    id v7 = [v10 helperCoverImage];
    id v8 = objc_retainBlock(v5);
    double v9 = v8;
    if (v8) {
      (*((void (**)(id, void *))v8 + 2))(v8, v7);
    }
  }
  else
  {
    id v6 = objc_retainBlock(v5);
    id v7 = v6;
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }

LABEL_10:
}

- (void)_imageIOCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v15 = 0;
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v5 path];
  unsigned int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v15];

  if (v15) {
    unsigned int v9 = 0;
  }
  if (v9 == 1)
  {
    id v10 = +[NSData dataWithContentsOfURL:v5];
    id v11 = +[UIImage imageWithData:v10];

    if (v11)
    {
      id v12 = objc_retainBlock(v6);
      id v13 = v12;
      if (v12) {
        (*((void (**)(id, void, void))v12 + 2))(v12, v11, 0);
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  id v11 = (void (**)(void, void, void))objc_retainBlock(v6);
  if (v11)
  {
    if (v9) {
      uint64_t v14 = 1002;
    }
    else {
      uint64_t v14 = 1003;
    }
    id v13 = +[NSError errorWithDomain:@"BKAssetCoverImageDomain" code:v14 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v13);
    goto LABEL_12;
  }
LABEL_13:
}

- (QLThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (AEPluginRegistry)pluginRegistry
{
  return self->_pluginRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginRegistry, 0);

  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
}

@end