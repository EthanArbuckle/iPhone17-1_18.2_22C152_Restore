@interface MSDGreyMatterAvailabilityChecker
+ (BOOL)waitForGMAvailability;
@end

@implementation MSDGreyMatterAvailabilityChecker

+ (BOOL)waitForGMAvailability
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[MSDGreyMatterAvailabilityChecker waitForGMAvailability]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s - Start checkAvailability", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005A57C;
  v9[3] = &unk_100151AF0;
  v3 = dispatch_semaphore_create(0);
  v10 = v3;
  +[MSDGreyMatter checkAvailabilityWithCompletion:v9];
  dispatch_time_t v4 = dispatch_time(0, 1200000000000);
  intptr_t v5 = dispatch_semaphore_wait(v3, v4);
  v6 = sub_100068600();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000D0214(v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GM is now available.", buf, 2u);
  }

  return v5 == 0;
}

@end