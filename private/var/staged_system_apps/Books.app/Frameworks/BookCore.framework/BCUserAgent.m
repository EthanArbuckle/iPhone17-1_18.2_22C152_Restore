@interface BCUserAgent
+ (id)_macOSXBuildString;
+ (id)_macOSXVersionString;
+ (id)_userVisibleWebKitVersionString;
+ (id)audibleUserAgent;
+ (id)clientUserAgentWithOverrideVersion:(id)a3;
+ (void)_getSystemVersionMajor:(int *)a3 minor:(int *)a4 bugfix:(int *)a5;
@end

@implementation BCUserAgent

+ (id)clientUserAgentWithOverrideVersion:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[NSBundle mainBundle];
    id v5 = [v6 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  }
  id v7 = objc_alloc((Class)AMSUserAgent);
  v8 = +[AMSProcessInfo currentProcess];
  id v9 = [v7 initWithProcessInfo:v8];

  [v9 setClientName:@"iBooks"];
  [v9 setClientVersion:v5];
  v10 = [v9 compile];

  return v10;
}

+ (void)_getSystemVersionMajor:(int *)a3 minor:(int *)a4 bugfix:(int *)a5
{
  if (qword_349308 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_349308, &stru_2C9C08);
  if (a3) {
LABEL_3:
  }
    *a3 = dword_342198;
LABEL_4:
  if (a4) {
    *a4 = dword_34219C;
  }
  if (a5) {
    *a5 = dword_349300;
  }
}

+ (id)_macOSXVersionString
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_138218;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_349318 != -1) {
    dispatch_once(&qword_349318, block);
  }
  v2 = (void *)qword_349310;

  return v2;
}

+ (id)_userVisibleWebKitVersionString
{
  if (qword_349328 != -1) {
    dispatch_once(&qword_349328, &stru_2C9C28);
  }
  v2 = (void *)qword_349320;

  return v2;
}

+ (id)_macOSXBuildString
{
  if (qword_349338 != -1) {
    dispatch_once(&qword_349338, &stru_2C9C48);
  }
  v2 = (void *)qword_349330;

  return v2;
}

+ (id)audibleUserAgent
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  v4 = [(id)objc_opt_class() _macOSXVersionString];
  id v5 = [(id)objc_opt_class() _userVisibleWebKitVersionString];
  v6 = [(id)objc_opt_class() _macOSXBuildString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Books/%@ (Macintosh; OS X %@; %@) AppleWebKit/%@",
    v3,
    v4,
    v6,
  id v7 = v5);

  return v7;
}

@end