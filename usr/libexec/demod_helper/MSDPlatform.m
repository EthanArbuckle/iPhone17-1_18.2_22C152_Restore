@interface MSDPlatform
+ (BOOL)iOSHub;
+ (id)sharedInstance;
- (BOOL)iOS;
- (BOOL)isValidProductList:(id)a3;
- (BOOL)macOS;
- (BOOL)rOS;
- (BOOL)tvOS;
- (BOOL)watchOS;
- (MSDPlatform)init;
- (NSString)platformType;
- (void)raiseInvalidProductListExceptionWithReason:(id)a3;
- (void)setIOS:(BOOL)a3;
- (void)setMacOS:(BOOL)a3;
- (void)setPlatformType:(id)a3;
- (void)setPlatformWithManifestProductList:(id)a3;
- (void)setROS:(BOOL)a3;
- (void)setTvOS:(BOOL)a3;
- (void)setWatchOS:(BOOL)a3;
@end

@implementation MSDPlatform

+ (id)sharedInstance
{
  if (qword_100057DA8 != -1) {
    dispatch_once(&qword_100057DA8, &stru_10004CC78);
  }
  v2 = (void *)qword_100057DA0;

  return v2;
}

+ (BOOL)iOSHub
{
  if (qword_100057DB8 != -1) {
    dispatch_once(&qword_100057DB8, &stru_10004CC98);
  }
  return byte_100057DB0;
}

- (MSDPlatform)init
{
  v9.receiver = self;
  v9.super_class = (Class)MSDPlatform;
  v2 = [(MSDPlatform *)&v9 init];
  if (!v2) {
    return v2;
  }
  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"Watch OS"])
    {
      [(MSDPlatform *)v2 setWatchOS:1];
      CFStringRef v5 = @"watchOS";
    }
    else if ([v4 isEqualToString:@"Apple TVOS"])
    {
      [(MSDPlatform *)v2 setTvOS:1];
      CFStringRef v5 = @"tvOS";
    }
    else if ([v4 isEqualToString:@"iPhone OS"])
    {
      [(MSDPlatform *)v2 setIOS:1];
      CFStringRef v5 = @"iOS";
    }
    else if (([v4 isEqualToString:@"macOS"] & 1) != 0 {
           || [v4 isEqualToString:@"Mac OS X"])
    }
    {
      [(MSDPlatform *)v2 setMacOS:1];
      CFStringRef v5 = @"macOS";
    }
    else
    {
      if (![v4 isEqualToString:@"xrOS"]) {
        goto LABEL_13;
      }
      [(MSDPlatform *)v2 setIOS:1];
      [(MSDPlatform *)v2 setROS:1];
      CFStringRef v5 = @"xrOS";
    }
    [(MSDPlatform *)v2 setPlatformType:v5];
  }
LABEL_13:
  v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(MSDPlatform *)v2 platformType];
    *(_DWORD *)buf = 136315394;
    v11 = "-[MSDPlatform init]";
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: PlatformType '%{public}@'.", buf, 0x16u);
  }
  return v2;
}

- (void)setPlatformWithManifestProductList:(id)a3
{
  id v9 = a3;
  if ([(MSDPlatform *)self tvOS] || [(MSDPlatform *)self watchOS]) {
    goto LABEL_15;
  }
  [(MSDPlatform *)self setWatchOS:0];
  [(MSDPlatform *)self setTvOS:0];
  [(MSDPlatform *)self setIOS:0];
  [(MSDPlatform *)self setMacOS:0];
  [(MSDPlatform *)self setROS:0];
  if (![v9 count]) {
    [(MSDPlatform *)self raiseInvalidProductListExceptionWithReason:@"Empty product list."];
  }
  v4 = [v9 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [(MSDPlatform *)self raiseInvalidProductListExceptionWithReason:@"Product list entry must be of type String."];
  }
  v6 = [v9 objectAtIndexedSubscript:0];
  v7 = [v6 lowercaseString];

  if (([v7 containsString:@"iphone"] & 1) != 0
    || ([v7 containsString:@"ipad"] & 1) != 0
    || [v7 containsString:@"ipod"])
  {
    [(MSDPlatform *)self setIOS:1];
    CFStringRef v8 = @"iOS";
  }
  else if ([v7 containsString:@"watch"])
  {
    [(MSDPlatform *)self setWatchOS:1];
    CFStringRef v8 = @"watchOS";
  }
  else if ([v7 containsString:@"appletv"])
  {
    [(MSDPlatform *)self setTvOS:1];
    CFStringRef v8 = @"tvOS";
  }
  else if (([v7 containsString:@"mac"] & 1) != 0 {
         || [v7 containsString:@"adp"])
  }
  {
    [(MSDPlatform *)self setMacOS:1];
    CFStringRef v8 = @"macOS";
  }
  else
  {
    if (![v7 containsString:@"realitydevice"]) {
      goto LABEL_12;
    }
    [(MSDPlatform *)self setROS:1];
    CFStringRef v8 = @"xrOS";
  }
  [(MSDPlatform *)self setPlatformType:v8];
LABEL_12:
  if (![(MSDPlatform *)self isValidProductList:v9]) {
    [(MSDPlatform *)self raiseInvalidProductListExceptionWithReason:@"Product list should contain only one product category."];
  }

LABEL_15:
}

- (BOOL)isValidProductList:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_24;
        }
        v10 = [v9 lowercaseString];
        if ([(MSDPlatform *)self watchOS]
          && ![v10 containsString:@"watch"]
          || -[MSDPlatform tvOS](self, "tvOS") && ![v10 containsString:@"appletv"]
          || [(MSDPlatform *)self iOS]
          && ([v10 containsString:@"iphone"] & 1) == 0
          && ([v10 containsString:@"ipad"] & 1) == 0
          && ![v10 containsString:@"ipod"]
          || [(MSDPlatform *)self macOS]
          && ([v10 containsString:@"mac"] & 1) == 0
          && ![v10 containsString:@"adp"]
          || [(MSDPlatform *)self rOS]
          && ![v10 containsString:@"realitydevice"])
        {

LABEL_24:
          BOOL v11 = 0;
          goto LABEL_26;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_26:

  return v11;
}

- (void)raiseInvalidProductListExceptionWithReason:(id)a3
{
  v3 = +[NSException exceptionWithName:@"InvalidManifestProductList" reason:a3 userInfo:0];
  id v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[MSDPlatform raiseInvalidProductListExceptionWithReason:]";
    __int16 v7 = 2114;
    CFStringRef v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - Exception:  %{public}@", (uint8_t *)&v5, 0x16u);
  }

  [v3 raise];
}

- (BOOL)watchOS
{
  return self->_watchOS;
}

- (void)setWatchOS:(BOOL)a3
{
  self->_watchOS = a3;
}

- (BOOL)tvOS
{
  return self->_tvOS;
}

- (void)setTvOS:(BOOL)a3
{
  self->_tvOS = a3;
}

- (BOOL)iOS
{
  return self->_iOS;
}

- (void)setIOS:(BOOL)a3
{
  self->_iOS = a3;
}

- (BOOL)macOS
{
  return self->_macOS;
}

- (void)setMacOS:(BOOL)a3
{
  self->_macOS = a3;
}

- (BOOL)rOS
{
  return self->_rOS;
}

- (void)setROS:(BOOL)a3
{
  self->_rOS = a3;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end