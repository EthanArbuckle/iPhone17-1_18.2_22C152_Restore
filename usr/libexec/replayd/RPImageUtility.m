@interface RPImageUtility
+ (id)getImageDataFromExtensionContainingAppBundleUrl:(id)a3;
@end

@implementation RPImageUtility

+ (id)getImageDataFromExtensionContainingAppBundleUrl:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ISIcon) initWithURL:v3];

  v5 = objc_opt_new();
  v6 = [v4 imageForImageDescriptor:v5];
  v7 = (CGImage *)[v6 CGImage];
  if (v7)
  {
    BOOL v12 = 0;
    v8 = sub_100041028(v7, 0, @"public.png", &v12);
    v9 = v8;
    if (v12)
    {
      id v10 = v8;
    }
    else
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100054C24();
      }
      id v10 = 0;
    }
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054BA4();
    }
    id v10 = 0;
  }

  return v10;
}

@end