@interface MSDArtworkManager
- (BOOL)removeCachedIconImage;
- (MSDArtworkManager)initWithServiceID:(id)a3 remoteImageURL:(id)a4;
- (NSString)serviceID;
- (NSURL)remoteImageURL;
- (id)_fetchImageFromInternetURL;
- (id)_returnGenericAppIcon;
- (id)_saveDataInLocalCacheDir:(id)a3 withName:(id)a4;
- (id)_saveISIconInLocalCacheDir:(id)a3 withName:(id)a4;
- (id)getLocalCachedImageURL;
- (void)getDataFromURL:(id)a3 completionHandler:(id)a4;
@end

@implementation MSDArtworkManager

- (MSDArtworkManager)initWithServiceID:(id)a3 remoteImageURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MSDArtworkManager;
  v9 = [(MSDArtworkManager *)&v36 init];
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v22 = v10;
    goto LABEL_12;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v9->_serviceID, a3);
    objc_storeStrong((id *)&v10->_remoteImageURL, a4);
    uint64_t v11 = +[NSString stringWithFormat:@"%@", v10->_serviceID];
    serviceIconImageName = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v11;

    uint64_t v13 = [(NSString *)v10->_serviceIconImageName stringByAppendingPathExtension:@"png"];
    v14 = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v13;

    *(_OWORD *)&v10->_iconImageScale = xmmword_100042230;
    v10->_iconImageSize.height = 256.0;
    v15 = +[NSFileManager defaultManager];
    id v35 = 0;
    uint64_t v16 = [v15 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v35];
    id v17 = v35;
    localCacheDirURL = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v16;

    uint64_t v19 = [(NSURL *)v10->_localCacheDirURL URLByAppendingPathComponent:@"com.apple.mediasetupd"];
    v20 = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v19;

    if (v17)
    {
      v21 = sub_100031A80();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000052C4();
      }
    }
    objc_initWeak(&location, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004558;
    block[3] = &unk_10004C9C0;
    objc_copyWeak(&v33, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

    goto LABEL_8;
  }
  v23 = sub_100031A80();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10000528C(v23, v24, v25, v26, v27, v28, v29, v30);
  }

  v22 = 0;
LABEL_12:

  return v22;
}

- (id)getLocalCachedImageURL
{
  v3 = [(NSURL *)self->_localCacheDirURL URLByAppendingPathComponent:self->_serviceIconImageName];
  if ([(NSString *)self->_serviceID isEqualToString:kAppleMusicServiceIdentifier])
  {
    id v4 = objc_alloc((Class)ISIcon);
    id v5 = [v4 initWithBundleIdentifier:kAppleMusicBundleIdentifier];
    uint64_t v6 = [(MSDArtworkManager *)self _saveISIconInLocalCacheDir:v5 withName:self->_serviceIconImageName];
  }
  else
  {
    id v7 = +[NSFileManager defaultManager];
    id v8 = [v3 path];
    unsigned int v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      id v10 = v3;
      goto LABEL_10;
    }
    id v5 = [(MSDArtworkManager *)self _fetchImageFromInternetURL];
    if (v5) {
      [(MSDArtworkManager *)self _saveDataInLocalCacheDir:v5 withName:self->_serviceIconImageName];
    }
    else {
    uint64_t v6 = [(MSDArtworkManager *)self _returnGenericAppIcon];
    }
  }
  id v10 = (id)v6;

LABEL_10:

  return v10;
}

- (id)_returnGenericAppIcon
{
  v3 = +[ISIcon genericApplicationIcon];
  id v4 = [(MSDArtworkManager *)self _saveISIconInLocalCacheDir:v3 withName:@"genericIcon.png"];

  return v4;
}

- (id)_saveDataInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    v20 = sub_100031A80();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000532C(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_17;
  }
  if (!v7)
  {
    v20 = sub_100031A80();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100005364(v20, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_17:

LABEL_18:
    uint64_t v28 = 0;
    goto LABEL_19;
  }
  unsigned int v9 = +[NSFileManager defaultManager];
  localCacheDirURL = self->_localCacheDirURL;
  p_localCacheDirURL = &self->_localCacheDirURL;
  v12 = [(NSURL *)localCacheDirURL path];
  unsigned __int8 v13 = [v9 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(NSURL *)*p_localCacheDirURL path];
      *(_DWORD *)buf = 138477827;
      id v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Directory for icon file path (%{private}@) does not exist, will try to create now", buf, 0xCu);
    }
    uint64_t v16 = +[NSFileManager defaultManager];
    id v17 = *p_localCacheDirURL;
    id v39 = 0;
    [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v18 = v39;

    if (v18)
    {
      uint64_t v19 = sub_100031A80();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000539C((id *)p_localCacheDirURL, (uint64_t)v18, v19);
      }

      goto LABEL_18;
    }
  }
  uint64_t v28 = [(NSURL *)*p_localCacheDirURL URLByAppendingPathComponent:v8];
  uint64_t v29 = sub_100031A80();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v28 path];
    *(_DWORD *)buf = 138478083;
    id v41 = v6;
    __int16 v42 = 2113;
    v43 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Saving image %{private}@ to path %{private}@", buf, 0x16u);
  }
  [v6 writeToURL:v28 atomically:1];
LABEL_19:

  return v28;
}

- (id)_saveISIconInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)ISImageDescriptor) initWithSize:self->_iconImageSize.width scale:self->_iconImageSize.height];
  [v8 setShouldApplyMask:0];
  unsigned int v9 = [v7 prepareImageForDescriptor:v8];

  +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v9 CGImage]);
  id v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = UIImagePNGRepresentation(v10);
  v12 = [(MSDArtworkManager *)self _saveDataInLocalCacheDir:v11 withName:v6];

  return v12;
}

- (id)_fetchImageFromInternetURL
{
  if (self->_remoteImageURL)
  {
    v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = sub_100004C98;
    uint64_t v23 = sub_100004CA8;
    id v24 = 0;
    remoteImageURL = self->_remoteImageURL;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004CB0;
    v16[3] = &unk_10004C9E8;
    id v18 = &v19;
    id v5 = v3;
    id v17 = v5;
    [(MSDArtworkManager *)self getDataFromURL:remoteImageURL completionHandler:v16];
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * MSMaxWaitTimeForServiceIconDownload);
    dispatch_group_wait(v5, v6);
    id v7 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000544C(v5, v8, v9, v10, v11, v12, v13, v14);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)getDataFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  uint64_t v8 = +[NSURLSession sessionWithConfiguration:v7];

  id v9 = [objc_alloc((Class)NSURLRequest) initWithURL:v6];
  uint64_t v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 URL];
    *(_DWORD *)buf = 138412546;
    id v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Executing fetch %@ withSession %@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004F24;
  v14[3] = &unk_10004CA10;
  id v15 = v5;
  id v12 = v5;
  uint64_t v13 = [v8 dataTaskWithRequest:v9 completionHandler:v14];
  [v13 resume];
  [v8 finishTasksAndInvalidate];
}

- (BOOL)removeCachedIconImage
{
  v2 = [(NSURL *)self->_localCacheDirURL URLByAppendingPathComponent:self->_serviceIconImageName];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  id v6 = sub_100031A80();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v2 path];
      *(_DWORD *)buf = 138477827;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Going to remove item at URL %{private}@", buf, 0xCu);
    }
    id v9 = +[NSFileManager defaultManager];
    id v13 = 0;
    [v9 removeItemAtURL:v2 error:&v13];
    id v7 = v13;

    if (!v7)
    {
      BOOL v11 = 1;
      goto LABEL_11;
    }
    uint64_t v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000055B0();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100005618();
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSURL)remoteImageURL
{
  return self->_remoteImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteImageURL, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_localCacheDirURL, 0);

  objc_storeStrong((id *)&self->_serviceIconImageName, 0);
}

@end