@interface RPPhotosUtility
+ (BOOL)showAlertFailedSaveToPhotosWithError:(id)a3;
+ (id)fetchLastSavedVideoAssetInPhotos;
+ (void)exportVideoToPhotosAsynchronously:(id)a3 mixAudioTracks:(BOOL)a4 completionHandler:(id)a5;
+ (void)exportVideoToPhotosLibrary:(id)a3 completionHandler:(id)a4;
@end

@implementation RPPhotosUtility

+ (void)exportVideoToPhotosLibrary:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 31;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v19 = 0;
  id v7 = [objc_alloc((Class)AVURLAsset) initWithURL:v5 options:0];
  v8 = v7;
  if (v7)
  {
    [v7 duration];
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(Float64 *)(*(void *)&buf[8] + 24) = Seconds;
  }
  v10 = dispatch_get_global_queue(25, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000446A4;
  v13[3] = &unk_1000860A8;
  id v15 = v6;
  v16 = buf;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, v13);

  _Block_object_dispose(buf, 8);
}

+ (void)exportVideoToPhotosAsynchronously:(id)a3 mixAudioTracks:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100044C40;
    v9[3] = &unk_1000853E0;
    id v10 = v7;
    id v11 = v8;
    +[RPAudioMixUtility mixAudioForMovie:v10 withCompletionHandler:v9];
  }
  else
  {
    +[RPPhotosUtility exportVideoToPhotosLibrary:v7 completionHandler:v8];
  }
}

+ (BOOL)showAlertFailedSaveToPhotosWithError:(id)a3
{
  id v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "+[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]";
    __int16 v18 = 1024;
    int v19 = 115;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_FAILED_TO_SAVE_ALERT_MESSAGE_FORMAT"];
  id v5 = [v3 localizedDescription];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  id v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_TITLE"];
  id v8 = v6;
  v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_OK_BUTTON"];
  v14[0] = kCFUserNotificationAlertHeaderKey;
  v14[1] = kCFUserNotificationAlertMessageKey;
  v15[0] = v7;
  v15[1] = v8;
  v14[2] = kCFUserNotificationDefaultButtonTitleKey;
  v15[2] = v9;
  id v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3]);
  if (v10)
  {
    id v11 = v10;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
    if (!responseFlags
      && dword_100099BB8 <= 1
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]";
      __int16 v18 = 1024;
      int v19 = 145;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user has hit okay, alert will be dismissed", buf, 0x12u);
    }
    CFRelease(v11);
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100055224();
  }

  return 0;
}

+ (id)fetchLastSavedVideoAssetInPhotos
{
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  id v3 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];
  [v2 setSortDescriptors:v4];

  id v5 = +[PHAsset fetchAssetsWithMediaType:2 options:v2];
  id v6 = [v5 lastObject];

  return v6;
}

@end