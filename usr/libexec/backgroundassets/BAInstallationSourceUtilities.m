@interface BAInstallationSourceUtilities
+ (int64_t)installationSourceFromAuditToken:(id *)a3 applicationIdentifier:(id)a4;
@end

@implementation BAInstallationSourceUtilities

+ (int64_t)installationSourceFromAuditToken:(id *)a3 applicationIdentifier:(id)a4
{
  id v4 = a4;
  v5 = sub_100013ABC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100038E20((uint64_t)v4, v5);
  }

  v6 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  v7 = v6;
  if (v6)
  {
    if ([v6 profileValidated]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    v9 = sub_100013ABC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100038DA8((uint64_t)v4, v9);
    }

    int64_t v8 = 3;
  }

  return v8;
}

@end