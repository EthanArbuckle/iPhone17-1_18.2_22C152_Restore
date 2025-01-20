@interface FMFConfig
+ (id)sharedInstance;
- (BOOL)isFMFAllowed;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isLocationServicesEnabledForShareMyLocation;
- (id)initSingleton;
- (void)dealloc;
@end

@implementation FMFConfig

- (void)dealloc
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036CAC(self, v3);
  }

  v4 = (void *)qword_10006D590;
  qword_10006D590 = 0;

  v5.receiver = self;
  v5.super_class = (Class)FMFConfig;
  [(FMFConfig *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10006D598 != -1) {
    dispatch_once(&qword_10006D598, &stru_100059E48);
  }
  v2 = (void *)qword_10006D590;
  if (!qword_10006D590)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The FMFConfig singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D590;
  }

  return v2;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)FMFConfig;
  v2 = [(FMFConfig *)&v5 init];
  if (v2)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100038344(v3);
    }

    objc_storeStrong((id *)&qword_10006D590, v2);
  }
  return v2;
}

- (BOOL)isLocationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled];
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  return +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/PrivateFrameworks/FMF.framework"] == 3;
}

- (BOOL)isFMFAllowed
{
  if ((byte_10006D5A0 & 1) == 0)
  {
    int v6 = 0;
    CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswerWithError();
    CFBooleanRef v3 = v2;
    if (v2)
    {
      byte_10006CD68 = CFBooleanGetValue(v2) != 0;
      byte_10006D5A0 = 1;
LABEL_7:
      CFRelease(v3);
      return byte_10006CD68;
    }
    v4 = sub_10001B6D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100038388(&v6, v4);
    }

    if (v3) {
      goto LABEL_7;
    }
  }
  return byte_10006CD68;
}

@end