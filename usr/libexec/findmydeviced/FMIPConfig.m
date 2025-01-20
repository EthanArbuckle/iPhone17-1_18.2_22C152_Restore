@interface FMIPConfig
+ (id)sharedInstance;
- (id)initSingleton;
- (void)dealloc;
- (void)enableFMIPLocationServices;
@end

@implementation FMIPConfig

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023AFC4(self, v3);
  }

  v4 = (void *)qword_10031E7C0;
  qword_10031E7C0 = 0;

  v5.receiver = self;
  v5.super_class = (Class)FMIPConfig;
  [(FMIPConfig *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10031E7C8 != -1) {
    dispatch_once(&qword_10031E7C8, &stru_1002D9F18);
  }
  v2 = (void *)qword_10031E7C0;
  if (!qword_10031E7C0)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The FMIPConfig singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10031E7C0;
  }

  return v2;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)FMIPConfig;
  v2 = [(FMIPConfig *)&v5 init];
  if (v2)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10023C4AC(v3);
    }

    objc_storeStrong((id *)&qword_10031E7C0, v2);
  }
  return v2;
}

- (void)enableFMIPLocationServices
{
  id v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  +[CLLocationManager setAuthorizationStatusByType:3 forBundle:v2];
}

@end