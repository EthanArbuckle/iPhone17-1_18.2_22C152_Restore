@interface RMHeadphoneActivityManager
+ (id)sharedInstance;
- (BOOL)mslLoggingEnabled;
- (CMHeadphoneActivityManager)activityManager;
- (RMHeadphoneActivityManager)init;
- (void)setActivityManager:(id)a3;
- (void)startMslLogging;
- (void)stopMslLogging;
@end

@implementation RMHeadphoneActivityManager

+ (id)sharedInstance
{
  if (qword_10002C9D0 != -1) {
    dispatch_once(&qword_10002C9D0, &stru_100024E90);
  }
  v2 = (void *)qword_10002C9C8;

  return v2;
}

- (RMHeadphoneActivityManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)RMHeadphoneActivityManager;
  v2 = [(RMHeadphoneActivityManager *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(RMHeadphoneActivityManager *)v2 setActivityManager:v3];
  }
  return v2;
}

- (BOOL)mslLoggingEnabled
{
  v2 = [(RMHeadphoneActivityManager *)self activityManager];
  unsigned __int8 v3 = [v2 mslLoggingEnabled];

  return v3;
}

- (void)startMslLogging
{
  unsigned __int8 v3 = sub_100013ED8();
  id v5 = +[NSString stringWithFormat:@"%@/HeadphoneActivity/MSL/", v3];

  v4 = [(RMHeadphoneActivityManager *)self activityManager];
  [v4 startMslLoggingWithFilenamePrefix:@"headphoneactivity" filePath:v5];
}

- (void)stopMslLogging
{
  id v2 = [(RMHeadphoneActivityManager *)self activityManager];
  [v2 stopMslLogging];
}

- (CMHeadphoneActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end