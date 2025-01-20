@interface CDAuthInfoProvider
+ (id)createWithRequest:(id)a3 client:(id)a4 error:(id *)a5;
@end

@implementation CDAuthInfoProvider

+ (id)createWithRequest:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [a3 overrideBundleIdentifier];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 bundleIdentifier];
  }
  v11 = v10;

  if ([v11 length])
  {
    id v18 = 0;
    id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v11 allowPlaceholder:0 error:&v18];
    id v13 = v18;
    if (v12)
    {
      v14 = [[CDAuthInfoInstalledApplication alloc] initWithApplicationRecord:v12];
      goto LABEL_13;
    }
    v16 = cps_session_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100021ED4((uint64_t)v13, v16);
    }

    id v15 = v13;
    id v13 = v15;
    if (!v15) {
      goto LABEL_12;
    }
LABEL_8:
    id v12 = v15;
    v14 = 0;
    *a5 = v12;
    goto LABEL_13;
  }
  NSErrorF();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = 0;
  if (v15) {
    goto LABEL_8;
  }
LABEL_12:
  id v12 = 0;
  v14 = 0;
LABEL_13:

  return v14;
}

@end