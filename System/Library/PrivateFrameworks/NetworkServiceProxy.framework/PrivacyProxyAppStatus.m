@interface PrivacyProxyAppStatus
+ (BOOL)supportsSecureCoding;
- (NSDate)activeDate;
- (NSString)bundleIdentifier;
- (NSString)path;
- (PrivacyProxyAppStatus)initWithCoder:(id)a3;
- (PrivacyProxyAppStatus)initWithStatus:(unint64_t)a3 bundleID:(id)a4 path:(id)a5 activeDate:(id)a6;
- (id)appStatusString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)appStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveDate:(id)a3;
- (void)setAppStatus:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation PrivacyProxyAppStatus

- (id)appStatusString
{
  unint64_t v2 = [(PrivacyProxyAppStatus *)self appStatus];
  if (v2 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E5A3B398[v2];
  }
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(PrivacyProxyAppStatus *)self appStatusString];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, @"App Status", a3, a4);

  v9 = [(PrivacyProxyAppStatus *)self bundleIdentifier];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, @"Bundle ID", a3, a4);

  v10 = [(PrivacyProxyAppStatus *)self path];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, @"Path", a3, a4);

  v11 = [(PrivacyProxyAppStatus *)self activeDate];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v11, @"Active Date", a3, a4);

  return v7;
}

- (id)description
{
  return [(PrivacyProxyAppStatus *)self descriptionWithIndent:0 options:14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PrivacyProxyAppStatus allocWithZone:a3] init];
  [(PrivacyProxyAppStatus *)v4 setAppStatus:[(PrivacyProxyAppStatus *)self appStatus]];
  v5 = [(PrivacyProxyAppStatus *)self bundleIdentifier];
  [(PrivacyProxyAppStatus *)v4 setBundleIdentifier:v5];

  v6 = [(PrivacyProxyAppStatus *)self path];
  [(PrivacyProxyAppStatus *)v4 setPath:v6];

  v7 = [(PrivacyProxyAppStatus *)self activeDate];
  [(PrivacyProxyAppStatus *)v4 setActiveDate:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyAppStatus)initWithStatus:(unint64_t)a3 bundleID:(id)a4 path:(id)a5 activeDate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PrivacyProxyAppStatus;
  v14 = [(PrivacyProxyAppStatus *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_appStatus = a3;
    objc_storeStrong((id *)&v14->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v15->_path, a5);
    objc_storeStrong((id *)&v15->_activeDate, a6);
    v16 = v15;
  }
  else
  {
    v18 = nplog_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", v19, 2u);
    }
  }
  return v15;
}

- (PrivacyProxyAppStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PrivacyProxyAppStatus;
  v5 = [(PrivacyProxyAppStatus *)&v16 init];
  if (v5)
  {
    v5->_appStatus = (int)[v4 decodeIntForKey:@"PrivacyProxyAppStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyAppBundleID"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyAppPath"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyAppActiveDate"];
    activeDate = v5->_activeDate;
    v5->_activeDate = (NSDate *)v10;

    id v12 = v5;
  }
  else
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyAppStatus appStatus](self, "appStatus"), @"PrivacyProxyAppStatus");
  v5 = [(PrivacyProxyAppStatus *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"PrivacyProxyAppBundleID"];

  uint64_t v6 = [(PrivacyProxyAppStatus *)self path];
  [v4 encodeObject:v6 forKey:@"PrivacyProxyAppPath"];

  id v7 = [(PrivacyProxyAppStatus *)self activeDate];
  [v4 encodeObject:v7 forKey:@"PrivacyProxyAppActiveDate"];
}

- (unint64_t)appStatus
{
  return self->_appStatus;
}

- (void)setAppStatus:(unint64_t)a3
{
  self->_appStatus = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPath:(id)a3
{
}

- (NSDate)activeDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end