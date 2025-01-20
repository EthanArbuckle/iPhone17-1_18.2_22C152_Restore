@interface NSBundle
+ (BOOL)_sr_validateRequiredFieldsForBundleIdentifier:(id)a3 sensors:(id)a4 error:(id *)a5;
+ (id)sk_bundleWithIdentifier:(id)a3;
- (BOOL)_sr_validateRequiredFieldsForSensors:(id)a3 error:(id *)a4;
- (id)sk_appName;
- (id)sk_perCategoryDetailDescription;
- (id)sk_privacyURL;
- (id)sk_requiredCategories;
- (id)sk_studyName;
- (id)sk_usageDescription;
- (id)sr_normalizedBundleIdentifier;
- (int64_t)sr_bundleType;
@end

@implementation NSBundle

+ (BOOL)_sr_validateRequiredFieldsForBundleIdentifier:(id)a3 sensors:(id)a4 error:(id *)a5
{
  v8 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];
  self;
  v9 = sub_100007668((uint64_t)NSBundle, (NSURL *)a3, v8);
  if (v9)
  {
    return [(NSBundle *)v9 _sr_validateRequiredFieldsForSensors:a4 error:a5];
  }
  else
  {
    if (a5)
    {
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Bundle couldn't be found";
      *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SRErrorDomain, 20480, +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
    }
    return 0;
  }
}

- (BOOL)_sr_validateRequiredFieldsForSensors:(id)a3 error:(id *)a4
{
  if (![(NSBundle *)self sk_usageDescription])
  {
    if (a4)
    {
      CFStringRef v16 = @"NSSensorKitUsageDescription";
      uint64_t v17 = 20481;
LABEL_21:
      id v18 = +[SRError invalidInfoPlistErrorWithMissingKey:v16 code:v17];
      BOOL result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  if (![(NSBundle *)self sk_privacyURL])
  {
    if (a4)
    {
      CFStringRef v16 = @"NSSensorKitPrivacyPolicyURL";
      uint64_t v17 = 20482;
      goto LABEL_21;
    }
    return 0;
  }
  if (![(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      CFStringRef v16 = @"NSSensorKitUsageDetail";
      uint64_t v17 = 20483;
      goto LABEL_21;
    }
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (!v7) {
    return 1;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v22;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      id v13 = [[+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v11) infoPlistAuthorizationCategory];
      if (!v13)
      {
        if (qword_10006EAD0 == -1)
        {
          v19 = qword_10006EAD8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
        }
        else
        {
          dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
          v19 = qword_10006EAD8;
          if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_ERROR))
          {
LABEL_25:
            if (!a4) {
              goto LABEL_30;
            }
LABEL_26:
            v20 = +[SRError errorWithCode:8194];
LABEL_29:
            *a4 = v20;
            goto LABEL_30;
          }
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to find Info.plist authorization category key for %{public}@", buf, 0xCu);
        if (!a4) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      id v14 = v13;
      if (!objc_msgSend(-[NSBundle sk_perCategoryDetailDescription](self, "sk_perCategoryDetailDescription"), "objectForKeyedSubscript:", v13))
      {
        if (a4)
        {
          v20 = +[SRError invalidInfoPlistErrorWithMissingKey:v14 code:20484];
          goto LABEL_29;
        }
LABEL_30:
        return 0;
      }
    }
    id v8 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    BOOL result = 1;
    if (v8) {
      continue;
    }
    return result;
  }
}

+ (id)sk_bundleWithIdentifier:(id)a3
{
  v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];

  return sub_100007668((uint64_t)NSBundle, (NSURL *)a3, v4);
}

- (id)sk_appName
{
  id v3 = [(NSBundle *)self objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length"))
  {
    return v3;
  }
  id v3 = [(NSBundle *)self objectForInfoDictionaryKey:@"CFBundleName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length"))
    {
      return v3;
    }
  }

  return [(NSBundle *)self bundleIdentifier];
}

- (id)sk_studyName
{
  id v3 = [(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitStudyName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length"))
  {
    return v3;
  }

  return [(NSBundle *)self sk_appName];
}

- (id)sk_privacyURL
{
  v2 = [(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitPrivacyPolicyURL"];
  if (!v2) {
    return v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = +[NSURL URLWithString:v2];
    if (![(NSString *)[(NSURL *)v2 scheme] isEqualToString:@"http"]
      && ![(NSString *)[(NSURL *)v2 scheme] isEqualToString:@"https"])
    {
      return 0;
    }
    return v2;
  }
  return 0;
}

- (id)sk_usageDescription
{
  id v2 = [(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitUsageDescription"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (objc_msgSend(objc_msgSend(v2, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length"))
  {
    return v2;
  }
  return 0;
}

- (id)sk_requiredCategories
{
  id v3 = +[NSMutableSet set];
  id v4 = [(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000081CC;
    v6[3] = &unk_10005CC60;
    v6[4] = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
    return +[NSSet setWithSet:v3];
  }
  else
  {
    return +[NSSet set];
  }
}

- (id)sk_perCategoryDetailDescription
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(NSBundle *)self objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100008388;
    v6[3] = &unk_10005CC88;
    v6[4] = self;
    void v6[5] = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return +[NSDictionary dictionaryWithDictionary:v3];
}

- (int64_t)sr_bundleType
{
  int64_t v4 = sub_100008504(self, (uint64_t)+[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0]);
  return v4;
}

- (id)sr_normalizedBundleIdentifier
{
  id v3 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];
  if (!self) {
    return 0;
  }
  uint64_t v4 = sub_100008504(self, (uint64_t)v3);
  if (v4 == 1)
  {
    CFStringRef v6 = @"com.apple.Research";
    if (![(NSString *)[(NSBundle *)self bundleIdentifier] hasPrefix:@"com.apple.Research"])
    {
      CFStringRef v6 = @"com.appleinternal.health.Lime";
      if (![(NSString *)[(NSBundle *)self bundleIdentifier] hasPrefix:@"com.appleinternal.health.Lime"])CFStringRef v6 = [(NSBundle *)self objectForInfoDictionaryKey:@"SRStudyApplicationGroupIdentifier"]; {
    }
      }
    if (qword_10006EAD0 == -1)
    {
      id v7 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
        return (id)v6;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAD0, &stru_10005CCA8);
      id v7 = qword_10006EAD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EAD8, OS_LOG_TYPE_INFO)) {
        return (id)v6;
      }
    }
    int v8 = 138543618;
    CFStringRef v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = [(NSBundle *)self bundleIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found parent app %{public}@ for study %{public}@", (uint8_t *)&v8, 0x16u);
    return (id)v6;
  }
  if (v4 != 2) {
    return 0;
  }

  return [(NSBundle *)self bundleIdentifier];
}

@end