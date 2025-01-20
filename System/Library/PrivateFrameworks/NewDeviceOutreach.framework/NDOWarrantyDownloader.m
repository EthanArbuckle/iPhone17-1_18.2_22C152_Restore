@interface NDOWarrantyDownloader
- (NDOWarrantyDownloader)initWithCallingProcessBundleID:(id)a3;
- (id)dictionaryFromURL:(id)a3 forSerialNumber:(id)a4;
- (void)_downloadDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6;
- (void)_downloadDeviceListFromServerURL:(id)a3 serialNumber:(id)a4 localDevices:(id)a5 sessionID:(id)a6 params:(id)a7 withRetries:(int)a8 completionBlock:(id)a9;
- (void)_downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 withCompletion:(id)a6;
- (void)_downloadWarrantyFromServerURL:(id)a3 serialNumber:(id)a4 sessionID:(id)a5 params:(id)a6 withRetries:(int)a7 completionBlock:(id)a8;
- (void)_scheduleConversionOutreachIfRequiredForWarranty:(id)a3 serialNumber:(id)a4 andCachedWarranty:(id)a5;
- (void)_scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:(id)a3;
- (void)downloadDeviceForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6;
- (void)downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6;
@end

@implementation NDOWarrantyDownloader

- (NDOWarrantyDownloader)initWithCallingProcessBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOWarrantyDownloader;
  v6 = [(NDOWarrantyDownloader *)&v9 init];
  if (v6)
  {
    if (qword_100025988 != -1) {
      dispatch_once(&qword_100025988, &stru_10001C838);
    }
    v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100011B38();
    }

    objc_storeStrong((id *)&v6->_callingProcessBundleID, a3);
  }

  return v6;
}

- (void)_scheduleConversionOutreachIfRequiredForWarranty:(id)a3 serialNumber:(id)a4 andCachedWarranty:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v9)
  {
    v11 = [v9 acOfferConversionDate];
    if (v11)
    {
      uint64_t v12 = [v7 acOfferConversionDate];
      if (!v12
        || (v13 = (void *)v12,
            [v7 acOfferConversionDate],
            v14 = objc_claimAutoreleasedReturnValue(),
            id v15 = [v11 compare:v14],
            v14,
            v13,
            !v15))
      {
LABEL_12:
        v17 = _NDOLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v10 acOfferConversionDate];
          v21 = [v7 acOfferConversionDate];
          int v22 = 138412546;
          v23 = v20;
          __int16 v24 = 2112;
          id v25 = v21;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not Scheduling conversion outreach %@ (%@)", (uint8_t *)&v22, 0x16u);
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
    v11 = 0;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v16 = [v7 acOfferConversionDate];
  if (!v16) {
    goto LABEL_12;
  }
  v17 = v16;
  v18 = _NDOLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    v23 = v17;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Scheduling conversion outreach %@ (%@)", (uint8_t *)&v22, 0x16u);
  }

  v19 = +[NDOConversionOutreachActivity outreachActivityForSerialNumber:v8];
  +[NDOScheduler scheduleActivityWithDelegate:v19 forDate:v17];

LABEL_14:
}

- (void)_scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:(id)a3
{
  id v3 = a3;
  if (+[NDOIntervalCallActivity isDeviceCountryEligibleForIntervalEvent])
  {
    v4 = objc_opt_new();
    id v5 = +[NDOScheduler newSchedulerWithActivityDelegate:v4];

    v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v6 objectForKey:@"OneDayInterval"];
    [v7 doubleValue];
    double v9 = v8;

    if (v3)
    {
      v10 = +[NSUserDefaults standardUserDefaults];
      objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v3, "scIntervalPairedDeviceAllowed"), @"lastStoredPairedDeviceCallAllowedValue");

      v11 = [v3 scIntervalInDays];
      [v11 doubleValue];
      double v13 = v12;

      v14 = +[NSUserDefaults standardUserDefaults];
      id v15 = [v14 objectForKey:@"scIntervalInDays"];
      [v15 doubleValue];
      double v17 = v16;

      if (v17 != 0.0)
      {
        v18 = +[NSUserDefaults standardUserDefaults];
        v19 = [v18 objectForKey:@"scIntervalInDays"];
        [v19 doubleValue];
        double v13 = v20;

        v21 = _NDOLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v59 = 136446466;
          v60 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
          __int16 v61 = 2048;
          double v62 = v13;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s: Overriden recurring event interval in days: %f", (uint8_t *)&v59, 0x16u);
        }
      }
      if (v13 == -1.0 || v13 == 0.0)
      {
        v47 = _NDOLogSystem();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          sub_100011BB8(v47);
        }
        goto LABEL_40;
      }
      int v22 = +[NSUserDefaults standardUserDefaults];
      [v22 doubleForKey:@"lastStoredIntervalDaysValue"];
      double v24 = v23;

      uint64_t v25 = [v5 scheduledActivityDate];
      if (!v25) {
        goto LABEL_28;
      }
      v26 = (void *)v25;
      v27 = [v5 scheduledActivityDate];
      v28 = v27;
      if (v27 && v24 != v13)
      {

LABEL_28:
        v56 = +[NSDate date];
        v47 = [v56 dateByAddingTimeInterval:v9 * v13];

        v57 = _NDOLogSystem();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          int v59 = 136446466;
          v60 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
          __int16 v61 = 2112;
          double v62 = *(double *)&v47;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}s: Scheduling interval call for: %@", (uint8_t *)&v59, 0x16u);
        }

        [v5 scheduleActivityForDate:v47];
        v52 = +[NSUserDefaults standardUserDefaults];
        [v52 setDouble:@"lastStoredIntervalDaysValue" forKey:v13];
        goto LABEL_35;
      }
      v48 = [v5 scheduledActivityDate];
      v49 = +[NSDate date];
      id v50 = [v48 compare:v49];

      if (v50 == (id)-1) {
        goto LABEL_28;
      }
      v51 = [v5 scheduledActivityDate];
      if (v51)
      {

        if (v24 == 0.0 || v24 == v13)
        {
          v47 = _NDOLogSystem();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            sub_100011C3C(v5, v47, v24);
          }
          goto LABEL_40;
        }
      }
      v47 = _NDOLogSystem();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [v5 scheduledActivityDate];
        int v59 = 136446722;
        v60 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
        __int16 v61 = 2112;
        double v62 = *(double *)&v52;
        __int16 v63 = 2048;
        uint64_t v64 = (uint64_t)v24;
        v53 = "%{public}s: Didn't schedule interval call with already scheduled activity: %@ and last interval value: %ld";
        v54 = v47;
        uint32_t v55 = 32;
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v53, (uint8_t *)&v59, v55);
LABEL_35:

        goto LABEL_40;
      }
      goto LABEL_40;
    }
    uint64_t v29 = [v5 scheduledActivityDate];
    if (v29)
    {
      v30 = (void *)v29;
      uint64_t v31 = [v5 scheduledActivityDate];
      if (v31)
      {
        v32 = (void *)v31;
        v33 = +[NSDate date];
        v34 = [v5 scheduledActivityDate];
        id v35 = [v33 compare:v34];

        if (v35 == (id)1) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      v47 = _NDOLogSystem();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [v5 scheduledActivityDate];
        int v59 = 136446466;
        v60 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
        __int16 v61 = 2112;
        double v62 = *(double *)&v52;
        v53 = "%{public}s: No warranty present. Found interval call already scheduled for: %@";
        v54 = v47;
        uint32_t v55 = 22;
        goto LABEL_34;
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_18:
    v36 = +[NSUserDefaults standardUserDefaults];
    v37 = [v36 objectForKey:@"scIntervalInDays"];
    [v37 doubleValue];
    double v39 = v38;

    if (v39 == 0.0)
    {
      v44 = +[NSDate date];
      v45 = v44;
      double v46 = v9;
    }
    else
    {
      v40 = +[NSUserDefaults standardUserDefaults];
      v41 = [v40 objectForKey:@"scIntervalInDays"];
      [v41 doubleValue];
      double v43 = v42;

      v44 = +[NSDate date];
      v45 = v44;
      double v46 = v9 * v43;
    }
    v47 = [v44 dateByAddingTimeInterval:v46];

    v58 = _NDOLogSystem();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = 136446466;
      v60 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
      __int16 v61 = 2112;
      double v62 = *(double *)&v47;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty present. Scheduling interval call for: %@", (uint8_t *)&v59, 0x16u);
    }

    [v5 scheduleActivityForDate:v47];
    goto LABEL_40;
  }
  id v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100011D04(v5);
  }
LABEL_41:
}

- (void)_downloadDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _NDOLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[NDOWarrantyDownloader _downloadDeviceListForLocalDevices:sessionID:params:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  id v15 = +[NSUserDefaults standardUserDefaults];
  double v16 = [v15 objectForKey:@"DeviceListURL"];
  double v17 = +[NSURL URLWithString:v16];

  v18 = +[NDODeviceProvider sharedProvider];
  v19 = [v18 defaultDevice];
  double v20 = [v19 serialNumber];

  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100007D28;
  v34 = sub_100007D38;
  id v35 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100007D40;
  v28[3] = &unk_10001C860;
  p_long long buf = &buf;
  int v22 = v21;
  uint64_t v29 = v22;
  [(NDOWarrantyDownloader *)self _downloadDeviceListFromServerURL:v17 serialNumber:v20 localDevices:v10 sessionID:v11 params:v12 withRetries:2 completionBlock:v28];
  double v23 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E24;
  block[3] = &unk_10001C8D8;
  id v26 = v13;
  v27 = &buf;
  id v24 = v13;
  dispatch_group_notify(v22, v23, block);

  _Block_object_dispose(&buf, 8);
}

- (void)_downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v26 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  double v38 = sub_100007D28;
  double v39 = sub_100007D38;
  id v40 = 0;
  id v13 = +[NDODeviceProvider sharedProvider];
  v14 = [v13 defaultDevice];
  id v15 = [v14 serialNumber];

  if (v10 && v15 && [v15 isEqualToString:v10])
  {
    double v16 = +[NSUserDefaults standardUserDefaults];
    double v17 = [v16 objectForKey:@"WarrantyURL"];
    v18 = +[NSURL URLWithString:v17];
    char v19 = 1;
  }
  else
  {
    double v16 = +[NSUserDefaults standardUserDefaults];
    double v17 = [v16 objectForKey:@"WearablesWarrantyURL"];
    v18 = +[NSURL URLWithString:v17];
    char v19 = 0;
  }

  double v20 = dispatch_group_create();
  if ([v18 isFileURL])
  {
    uint64_t v21 = [(NDOWarrantyDownloader *)self dictionaryFromURL:v18 forSerialNumber:v10];
    int v22 = v36[5];
    v36[5] = v21;
  }
  else
  {
    dispatch_group_enter(v20);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100008668;
    v32[3] = &unk_10001C860;
    v34 = &v35;
    v33 = v20;
    [(NDOWarrantyDownloader *)self _downloadWarrantyFromServerURL:v18 serialNumber:v10 sessionID:v26 params:v11 withRetries:2 completionBlock:v32];
    int v22 = v33;
  }

  double v23 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000086C8;
  block[3] = &unk_10001C928;
  char v31 = v19;
  id v29 = v12;
  v30 = &v35;
  void block[4] = self;
  id v28 = v10;
  id v24 = v10;
  id v25 = v12;
  dispatch_group_notify(v20, v23, block);

  _Block_object_dispose(&v35, 8);
}

- (void)downloadDeviceForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _NDOLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    id v25 = "-[NDOWarrantyDownloader downloadDeviceForLocalDevices:sessionID:params:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100008E1C;
  v19[3] = &unk_10001C950;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  +[NDOServerVersionUtilities serverVersionSupported:v19];
}

- (void)downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _NDOLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446467;
    id v26 = "-[NDOWarrantyDownloader downloadWarrantyForSerialNumber:sessionID:params:completionHandler:]";
    __int16 v27 = 2113;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: %{private}@", buf, 0x16u);
  }

  id v15 = +[NSUserDefaults standardUserDefaults];
  [v15 removeObjectForKey:@"ServerVersionCache"];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000090A0;
  v20[3] = &unk_10001C950;
  id v23 = v12;
  id v24 = v13;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  +[NDOServerVersionUtilities serverVersionSupported:v20];
}

- (void)_downloadDeviceListFromServerURL:(id)a3 serialNumber:(id)a4 localDevices:(id)a5 sessionID:(id)a6 params:(id)a7 withRetries:(int)a8 completionBlock:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  id v19 = a6;
  id v20 = a3;
  id v21 = _NDOLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    int v34 = 2 - v9;
    __int16 v35 = 1024;
    int v36 = 2;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "_downloadDeviceListFromServerURL attempt (%d/%d)", buf, 0xEu);
  }

  id v22 = [[NDODownloader alloc] initWithURL:v20 callingProcessBundleID:self->_callingProcessBundleID sessionID:v19];
  id v23 = objc_opt_new();
  id v24 = objc_msgSend(v23, "aida_accountForPrimaryiCloudAccount");
  if (v24)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100009420;
    v28[3] = &unk_10001C978;
    id v29 = v17;
    id v30 = v15;
    id v31 = v16;
    id v32 = v24;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000094AC;
    v26[3] = &unk_10001C9A0;
    id v27 = v18;
    [(NDODownloader *)v22 downloadWithRetryCount:v9 prepareBlock:v28 completion:v26];
  }
  else
  {
    id v25 = _NDOLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "DeviceListRequestBody error - No primary iCloud account, can't sign this request", buf, 2u);
    }

    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

- (void)_downloadWarrantyFromServerURL:(id)a3 serialNumber:(id)a4 sessionID:(id)a5 params:(id)a6 withRetries:(int)a7 completionBlock:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a5;
  id v18 = a3;
  id v19 = _NDOLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138478339;
    id v30 = v14;
    __int16 v31 = 1024;
    int v32 = 2 - v9;
    __int16 v33 = 1024;
    int v34 = 2;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{private}@ : warranty download attempt (%d/%d)", buf, 0x18u);
  }

  id v20 = [[NDODownloader alloc] initWithURL:v18 callingProcessBundleID:self->_callingProcessBundleID sessionID:v17];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000096D4;
  v26[3] = &unk_10001C9F0;
  id v27 = v15;
  id v28 = v14;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009994;
  v24[3] = &unk_10001C9A0;
  id v25 = v16;
  id v21 = v16;
  id v22 = v14;
  id v23 = v15;
  [(NDODownloader *)v20 downloadWithRetryCount:v9 prepareBlock:v26 completion:v24];
}

- (id)dictionaryFromURL:(id)a3 forSerialNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 pathExtension];
  double v8 = [v5 URLByDeletingPathExtension];
  uint64_t v9 = +[NSString stringWithFormat:@"%@.%@", v6, v7];

  id v10 = [v8 URLByAppendingPathExtension:v9];

  id v11 = +[NSData dataWithContentsOfURL:v10];
  id v12 = _NDOLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "loading warranty from: %@", buf, 0xCu);
    }

LABEL_8:
    id v18 = 0;
    id v14 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v18];
    id v15 = v18;
    if (v15)
    {
      id v16 = _NDOLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100011E44();
      }
    }
    goto LABEL_15;
  }
  if (v13)
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "loading warranty from: %@", buf, 0xCu);
  }

  id v11 = +[NSData dataWithContentsOfURL:v5];
  if (v11) {
    goto LABEL_8;
  }
  id v15 = _NDOLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100011DCC((uint64_t)v5, v15);
  }
  id v11 = 0;
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
}

@end