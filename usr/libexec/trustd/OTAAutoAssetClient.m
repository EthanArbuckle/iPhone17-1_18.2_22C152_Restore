@interface OTAAutoAssetClient
+ (BOOL)retryReadSavedTrustStoreAssetPath:(id)a3;
+ (BOOL)saveTrustStoreAssetPath:(id)a3;
+ (id)savedTrustStoreAssetPath;
+ (id)validTrustStoreAssetPath:(id)a3 mustExist:(BOOL)a4;
- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5;
- (BOOL)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5;
- (BOOL)recheckAssetVersion;
- (MAAutoAssetSelector)currentAssetSelector;
- (NSString)lastAssetPath;
- (OS_dispatch_queue)notifyQueue;
- (OTAAutoAssetClient)initWithError:(id *)a3;
- (id)_createAutoAssetWithType:(id)a3 specifier:(id)a4 error:(id *)a5;
- (id)assetDidChangeHandler;
- (id)startUsingLocalAsset;
- (unint64_t)lastAvailableVersion;
- (unint64_t)lastCurrentVersion;
- (void)_endLocalAssetLocks;
- (void)_handleAssetChangedNotification;
- (void)_lockLocalAsset:(id)a3;
- (void)_recheckAssetVersion;
- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4;
- (void)registerForAssetChangedNotificationsWithBlock:(id)a3;
- (void)setAssetDidChangeHandler:(id)a3;
- (void)setCurrentAssetSelector:(id)a3;
- (void)setLastAssetPath:(id)a3;
- (void)setLastAvailableVersion:(unint64_t)a3;
- (void)setLastCurrentVersion:(unint64_t)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setRecheckAssetVersion:(BOOL)a3;
- (void)stopUsingLocalAsset;
@end

@implementation OTAAutoAssetClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetSelector, 0);
  objc_storeStrong((id *)&self->_lastAssetPath, 0);
  objc_storeStrong(&self->_assetDidChangeHandler, 0);

  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

- (void)setCurrentAssetSelector:(id)a3
{
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setLastAssetPath:(id)a3
{
}

- (NSString)lastAssetPath
{
  return self->_lastAssetPath;
}

- (void)setLastAvailableVersion:(unint64_t)a3
{
  self->_lastAvailableVersion = a3;
}

- (unint64_t)lastAvailableVersion
{
  return self->_lastAvailableVersion;
}

- (void)setLastCurrentVersion:(unint64_t)a3
{
  self->_lastCurrentVersion = a3;
}

- (unint64_t)lastCurrentVersion
{
  return self->_lastCurrentVersion;
}

- (void)setRecheckAssetVersion:(BOOL)a3
{
  self->_recheckAssetVersion = a3;
}

- (BOOL)recheckAssetVersion
{
  return self->_recheckAssetVersion;
}

- (void)setAssetDidChangeHandler:(id)a3
{
}

- (id)assetDidChangeHandler
{
  return self->_assetDidChangeHandler;
}

- (void)setNotifyQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)_endLocalAssetLocks
{
  id v2 = [(OTAAutoAssetClient *)self currentAssetSelector];
  +[MAAutoAsset endAllPreviousLocksOfSelector:v2 completion:&stru_100081CE8];
}

- (void)_lockLocalAsset:(id)a3
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10005ED40;
  v18[4] = sub_10005ED50;
  id v4 = a3;
  id v19 = v4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = sub_100033ED0((uint64_t)v4, 0);
  if (!v5) {
    uint64_t v5 = sub_100034024();
  }
  unint64_t v17 = v5;
  [(OTAAutoAssetClient *)self setLastCurrentVersion:v15[3]];
  id v6 = objc_alloc((Class)MAAutoAsset);
  v7 = [(OTAAutoAssetClient *)self currentAssetSelector];
  id v13 = 0;
  id v8 = [v6 initForClientName:@"trustd" selectingAsset:v7 error:&v13];
  id v9 = v13;

  if (v9)
  {
    v10 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v9 description];
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance: %@", buf, 0xCu);
    }
  }
  else
  {
    [v8 currentStatus:&stru_100081C80];
    v10 = objc_opt_new();
    [v10 setUserInitiated:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005ED58;
    v12[3] = &unk_100081CA8;
    v12[5] = v18;
    v12[6] = &v14;
    v12[4] = self;
    [v8 lockContent:@"system trusted certificates" withUsagePolicy:v10 withTimeout:0 reportingProgress:0 completion:v12];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
}

- (void)stopUsingLocalAsset
{
}

- (id)startUsingLocalAsset
{
  v3 = +[OTAAutoAssetClient savedTrustStoreAssetPath];
  [(OTAAutoAssetClient *)self setLastAssetPath:v3];
  [(OTAAutoAssetClient *)self _lockLocalAsset:v3];
  id v4 = +[OTAAutoAssetClient validTrustStoreAssetPath:v3 mustExist:1];

  return v4;
}

- (BOOL)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  id v6 = a4;
  v7 = [(OTAAutoAssetClient *)self currentAssetSelector];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005F5D8;
  v10[3] = &unk_100081BC8;
  id v11 = v6;
  id v8 = v6;
  +[MAAutoAsset eliminateAllForSelector:v7 completion:v10];

  return 1;
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  id v8 = a4;
  id v16 = 0;
  id v9 = [(OTAAutoAssetClient *)self _createAutoAssetWithType:a3 specifier:v8 error:&v16];
  id v10 = v16;
  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005F880;
    v13[3] = &unk_100081BA0;
    id v14 = v8;
    v15 = self;
    [v9 interestInContent:@"system trusted certificates" completion:v13];
  }
  else
  {
    id v11 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance for %@: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v10;
    }
  }

  return v9 != 0;
}

- (void)_recheckAssetVersion
{
  if ([(OTAAutoAssetClient *)self recheckAssetVersion])
  {
    [(OTAAutoAssetClient *)self setRecheckAssetVersion:0];
    CFErrorRef err = 0;
    v3 = [(OTAAutoAssetClient *)self lastAssetPath];
    [(OTAAutoAssetClient *)self setLastAvailableVersion:sub_100033ED0((uint64_t)v3, (__CFString **)&err)];

    if ([(OTAAutoAssetClient *)self lastAvailableVersion])
    {
      if ([(OTAAutoAssetClient *)self lastCurrentVersion])
      {
        id v4 = sub_10001CB28("OTATrust");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v5 = [(OTAAutoAssetClient *)self lastAvailableVersion];
          unint64_t v6 = [(OTAAutoAssetClient *)self lastCurrentVersion];
          *(_DWORD *)buf = 134218240;
          unint64_t v13 = v5;
          __int16 v14 = 2048;
          unint64_t v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Available version after recheck: %llu, our current version: %llu", buf, 0x16u);
        }

        unint64_t v7 = [(OTAAutoAssetClient *)self lastAvailableVersion];
        if (v7 > [(OTAAutoAssetClient *)self lastCurrentVersion]) {
          sub_10003CCA4((uint64_t)"Will exit when clean to use newer asset version.");
        }
      }
    }
    else
    {
      id v8 = sub_10001CB28("SecError");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to read trust store version from asset path, giving up", buf, 2u);
      }

      if (err) {
        CFIndex Code = CFErrorGetCode(err);
      }
      else {
        CFIndex Code = 0xFFFFFFFFLL;
      }
      sub_100055D50(@"AssetBuiltInEvent", 0, Code);
    }
    CFErrorRef v10 = err;
    if (err)
    {
      CFErrorRef err = 0;
      CFRelease(v10);
    }
  }
}

- (id)_createAutoAssetWithType:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)MAAutoAssetSelector) initForAssetType:v9 withAssetSpecifier:v8];

  [(OTAAutoAssetClient *)self setCurrentAssetSelector:v10];
  id v11 = objc_alloc((Class)MAAutoAsset);
  v12 = [(OTAAutoAssetClient *)self currentAssetSelector];
  id v18 = 0;
  id v13 = [v11 initForClientName:@"trustd" selectingAsset:v12 error:&v18];
  __int16 v14 = (__CFError *)v18;

  if (v14)
  {
    unint64_t v15 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance: %@", buf, 0xCu);
    }

    CFIndex Code = CFErrorGetCode(v14);
    sub_100055D50(@"AssetBuiltInEvent", 0, Code);
    if (a5) {
      *a5 = v14;
    }

    id v13 = 0;
  }

  return v13;
}

- (void)registerForAssetChangedNotificationsWithBlock:(id)a3
{
  if (a3) {
    -[OTAAutoAssetClient setAssetDidChangeHandler:](self, "setAssetDidChangeHandler:");
  }

  [(OTAAutoAssetClient *)self _registerForNotificationsForAssetType:@"com.apple.MobileAsset.PKITrustStore" andAssetSpecifier:@"PKITrustStore"];
}

- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (const char *)[@"com.apple.trustd.notifyQueue" UTF8String];
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
  [(OTAAutoAssetClient *)self setNotifyQueue:v10];

  id v11 = +[MAAutoAssetNotifications notifyRegistrationName:@"ASSET_VERSION_DOWNLOADED" forAssetType:v7 forAssetSpecifier:v6];

  int out_token = -1;
  id v12 = v11;
  id v13 = (const char *)[v12 UTF8String];
  __int16 v14 = [(OTAAutoAssetClient *)self notifyQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005FEE4;
  v15[3] = &unk_100081B78;
  v15[4] = self;
  notify_register_dispatch(v13, &out_token, v14, v15);
}

- (void)_handleAssetChangedNotification
{
  v3 = [(OTAAutoAssetClient *)self assetDidChangeHandler];

  if (v3)
  {
    id v4 = [(OTAAutoAssetClient *)self assetDidChangeHandler];
    v4[2]();
  }
}

- (OTAAutoAssetClient)initWithError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)OTAAutoAssetClient;
  id v4 = [(OTAAutoAssetClient *)&v12 init];
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  id v11 = 0;
  unsigned __int8 v6 = [(OTAAutoAssetClient *)v4 _createInterestInAssetType:@"com.apple.MobileAsset.PKITrustStore" withAssetSpecifier:@"PKITrustStore" withError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {

LABEL_4:
    id v9 = v5;
    goto LABEL_8;
  }
  if (a3) {
    *a3 = v7;
  }

  id v9 = 0;
LABEL_8:

  return v9;
}

+ (id)savedTrustStoreAssetPath
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10005ED40;
  unint64_t v17 = sub_10005ED50;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000602F0;
  v12[3] = &unk_100081C40;
  v12[4] = &v13;
  sub_100034A38(@"AutoAsset.plist", v12);
  if (v14[5])
  {
    id v2 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:");
    v3 = v2;
    if (v2)
    {
      id v4 = [v2 objectForKey:@"AssetPath"];
      unint64_t v5 = v4;
      if (v4)
      {
        CFTypeID v6 = CFGetTypeID(v4);
        if (v6 == CFStringGetTypeID())
        {
          unint64_t v5 = v5;
          id v7 = v5;
LABEL_15:

          goto LABEL_16;
        }
      }
      id v8 = sub_10001CB28("OTATrust");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v9 = (const __CFString *)v14[5];
        *(_DWORD *)buf = 138543362;
        CFStringRef v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "could not read OTAAutoAssetPathKey from %{public}@", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v5 = sub_10001CB28("OTATrust");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = (const __CFString *)v14[5];
        *(_DWORD *)buf = 138543362;
        CFStringRef v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unable to read from %{public}@", buf, 0xCu);
      }
    }
    id v7 = 0;
    goto LABEL_15;
  }
  v3 = sub_10001CB28("OTATrust");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v20 = @"AutoAsset.plist";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unable to resolve location of %{public}@", buf, 0xCu);
  }
  id v7 = 0;
LABEL_16:

  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (BOOL)saveTrustStoreAssetPath:(id)a3
{
  id v3 = a3;
  if (sub_1000145D4())
  {
    uint64_t v16 = 0;
    unint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    __int16 v19 = sub_10005ED40;
    CFStringRef v20 = sub_10005ED50;
    id v21 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100060658;
    v15[3] = &unk_100081C40;
    v15[4] = &v16;
    sub_100034A38(@"AutoAsset.plist", v15);
    if (v17[5])
    {
      id v4 = +[OTAAutoAssetClient savedTrustStoreAssetPath];
      if (v4 && ([v3 isEqualToString:v4] & 1) != 0)
      {
        BOOL v5 = 1;
      }
      else
      {
        CFTypeID v6 = +[NSURL fileURLWithPath:v17[5] isDirectory:0];
        id v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
        [v7 setObject:v3 forKeyedSubscript:@"AssetPath"];
        id v8 = sub_10001CB28("OTATrust");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v3;
          __int16 v24 = 2112;
          id v25 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "writing asset path \"%@\" (was \"%@\")", buf, 0x16u);
        }

        id v14 = 0;
        unsigned __int8 v9 = [v7 writeToClassDURL:v6 permissions:438 error:&v14];
        id v10 = v14;
        if ((v9 & 1) != 0
          || +[OTAAutoAssetClient retryReadSavedTrustStoreAssetPath:v3])
        {
          BOOL v5 = 1;
        }
        else
        {
          id v11 = sub_10001CB28("SecError");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v12 = (void *)v17[5];
            *(_DWORD *)buf = 138543618;
            id v23 = v12;
            __int16 v24 = 2112;
            id v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed to write %{public}@: %@", buf, 0x16u);
          }

          BOOL v5 = 0;
        }
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)retryReadSavedTrustStoreAssetPath:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_time_t v6 = dispatch_time(0, 250000000);
  id v7 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006084C;
  block[3] = &unk_100081C18;
  id v8 = v3;
  id v15 = v8;
  unint64_t v17 = &v18;
  unsigned __int8 v9 = v4;
  uint64_t v16 = v9;
  dispatch_after(v6, v7, block);

  if (dispatch_semaphore_wait(v9, v5))
  {
    id v10 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "timed out attempting to read saved asset path", v13, 2u);
    }
  }
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)validTrustStoreAssetPath:(id)a3 mustExist:(BOOL)a4
{
  CFStringRef v5 = (const __CFString *)a3;
  dispatch_time_t v6 = (__CFString *)v5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = sub_10005ED40;
  uint64_t v20 = sub_10005ED50;
  id v21 = 0;
  if (!v5)
  {
    char v11 = sub_10001CB28("OTATrust");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "invalid asset path: NULL", buf, 2u);
    }

    goto LABEL_10;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100060C44;
  v14[3] = &unk_100081BF0;
  v14[4] = &v16;
  v14[5] = &v22;
  BOOL v15 = a4;
  *(void *)buf = _NSConcreteStackBlock;
  uint64_t v27 = 0x40000000;
  v28 = sub_10002563C;
  v29 = &unk_10007DE00;
  v30 = v14;
  sub_10001247C(v5, (uint64_t)buf);
  if (!*((unsigned char *)v23 + 24))
  {
LABEL_10:
    id v10 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    id v7 = +[NSString stringWithFormat:@"%@/%@", v17[5], @"AssetVersion.plist"];
    id v8 = (const char *)[v7 UTF8String];
    if (!v8 || (int v9 = openat_authenticated_np(-2, v8, 0, -1), v9 == -1))
    {
      objc_super v12 = sub_10001CB28("OTATrust");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ignoring asset path (not on an AuthAPFS volume)", buf, 2u);
      }

      sub_100055D50(@"AssetBuiltInEvent", 0, 13);
      id v10 = 0;
    }
    else
    {
      close(v9);
      id v10 = (id)v17[5];
    }
  }
  else
  {
    id v10 = (id)v17[5];
  }
LABEL_16:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v10;
}

@end