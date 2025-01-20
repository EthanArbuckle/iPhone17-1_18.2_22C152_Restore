@interface APAMSBagManager
+ (BOOL)isSearchLandingAdsEnabled;
+ (BOOL)isSponsoredAdsEnabledForAdTrackingd;
+ (BOOL)shouldUseAMSMescal;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)adprivacydBag;
+ (id)mediaAPICountryCode;
+ (id)mediaAPIHostURL;
+ (void)cacheSizeWithCompletionHandler:(id)a3;
+ (void)httpLookBackWindowWithCompletionHandler:(id)a3;
+ (void)httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:(id)a3;
+ (void)httpMaximumConnectionsPerHostWithCompletionHandler:(id)a3;
+ (void)httpUseFixedHttpSessionManagerWithCompletionHandler:(id)a3;
+ (void)shouldUseAMSMescalWithCompletionHandler:(id)a3;
@end

@implementation APAMSBagManager

+ (NSString)bagSubProfile
{
  if (qword_1002896D0 != -1) {
    dispatch_once(&qword_1002896D0, &stru_100234968);
  }
  v2 = (void *)qword_1002896D8;

  return (NSString *)v2;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1002896E0 != -1) {
    dispatch_once(&qword_1002896E0, &stru_100234988);
  }
  v2 = (void *)qword_1002896E8;

  return (NSString *)v2;
}

+ (id)adprivacydBag
{
  if (qword_1002896F0 != -1) {
    dispatch_once(&qword_1002896F0, &stru_1002349A8);
  }
  v2 = (void *)qword_1002896F8;

  return v2;
}

+ (id)mediaAPICountryCode
{
  v2 = [a1 adprivacydBag];
  v3 = [v2 stringForKey:@"countryCode"];

  return v3;
}

+ (id)mediaAPIHostURL
{
  v2 = [a1 adprivacydBag];
  v3 = [v2 URLForKey:@"apps-media-api-edge-host"];

  return v3;
}

+ (BOOL)isSearchLandingAdsEnabled
{
  v3 = [a1 adprivacydBag];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v5 = [v3 BOOLForKey:@"isSearchLandingAdsEnabled"];
  v6 = [v5 valuePromise];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100081258;
  v15[3] = &unk_1002349D0;
  v17 = &v19;
  id v18 = a1;
  v7 = v4;
  v16 = v7;
  [v6 addFinishBlock:v15];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v24 = v10;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'isSearchLandingAdsEnabled' status from the bag in time.", buf, 0xCu);
    }
    v12 = +[NSString stringWithFormat:@"Failed to get the 'isSearchLandingAdsEnabled' status from the bag in time."];
    CreateDiagnosticReport();
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (BOOL)isSponsoredAdsEnabledForAdTrackingd
{
  v3 = [a1 adprivacydBag];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v5 = [v3 BOOLForKey:@"isSponsoredAdsEnabledForAdTrackingd"];
  v6 = [v5 valuePromise];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008159C;
  v15[3] = &unk_1002349D0;
  v17 = &v19;
  id v18 = a1;
  v7 = v4;
  v16 = v7;
  [v6 addFinishBlock:v15];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v24 = v10;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag in time.", buf, 0xCu);
    }
    v12 = +[NSString stringWithFormat:@"Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag in time."];
    CreateDiagnosticReport();
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (BOOL)shouldUseAMSMescal
{
  v3 = [a1 adprivacydBag];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v5 = [v3 BOOLForKey:@"useAMSMescal"];
  v6 = [v5 valuePromise];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000818DC;
  v15[3] = &unk_1002349D0;
  v17 = &v19;
  id v18 = a1;
  v7 = v4;
  v16 = v7;
  [v6 addFinishBlock:v15];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v24 = v10;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'useAMSMescal' key from the bag in time.", buf, 0xCu);
    }
    v12 = +[NSString stringWithFormat:@"Failed to get the 'useAMSMescal' key from the bag in time."];
    CreateDiagnosticReport();
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (void)shouldUseAMSMescalWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 BOOLForKey:@"useAMSMescal"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081AAC;
  v8[3] = &unk_1002349F8;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

+ (void)httpUseFixedHttpSessionManagerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 BOOLForKey:@"ap-http-use-fixed-session-manager"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081C88;
  v8[3] = &unk_100234A20;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

+ (void)httpMaximumConnectionsPerHostWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 integerForKey:@"ap-http-max-connections-per-host"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081DCC;
  v8[3] = &unk_100234A20;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

+ (void)httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 integerForKey:@"ap-http-max-connections-per-host-temp-session"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081F10;
  v8[3] = &unk_100234A20;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

+ (void)httpLookBackWindowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 doubleForKey:@"ap-http-look-back-window"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100082054;
  v8[3] = &unk_100234A20;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

+ (void)cacheSizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 adprivacydBag];
  v6 = [v5 integerForKey:@"ap-cache-size"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100082194;
  v8[3] = &unk_100234A20;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

@end