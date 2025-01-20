@interface PrivacyProxyServiceStatusTime
+ (BOOL)supportsSecureCoding;
- (NSDate)serviceStatusEndTime;
- (NSDate)serviceStatusStartTime;
- (PrivacyProxyServiceStatusTime)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)diagnostics;
- (unint64_t)serviceStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setServiceStatus:(unint64_t)a3;
- (void)setServiceStatusEndTime:(id)a3;
- (void)setServiceStatusStartTime:(id)a3;
@end

@implementation PrivacyProxyServiceStatusTime

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = +[PrivacyProxyServiceStatus serviceStatusString:[(PrivacyProxyServiceStatusTime *)self serviceStatus]];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, @"Service Status", a3, a4);

  v9 = (void *)MEMORY[0x1E4F28C10];
  v10 = [(PrivacyProxyServiceStatusTime *)self serviceStatusStartTime];
  v11 = [v9 localizedStringFromDate:v10 dateStyle:1 timeStyle:2];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v11, @"Service Status Start Time", a3, a4);

  v12 = (void *)MEMORY[0x1E4F28C10];
  v13 = [(PrivacyProxyServiceStatusTime *)self serviceStatusEndTime];
  v14 = [v12 localizedStringFromDate:v13 dateStyle:1 timeStyle:2];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v14, @"Service Status End Time", a3, a4);

  return v7;
}

- (id)description
{
  return [(PrivacyProxyServiceStatusTime *)self descriptionWithIndent:0 options:14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PrivacyProxyServiceStatusTime allocWithZone:a3] init];
  [(PrivacyProxyServiceStatusTime *)v4 setServiceStatus:[(PrivacyProxyServiceStatusTime *)self serviceStatus]];
  v5 = [(PrivacyProxyServiceStatusTime *)self serviceStatusStartTime];
  [(PrivacyProxyServiceStatusTime *)v4 setServiceStatusStartTime:v5];

  v6 = [(PrivacyProxyServiceStatusTime *)self serviceStatusEndTime];
  [(PrivacyProxyServiceStatusTime *)v4 setServiceStatusEndTime:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyServiceStatusTime)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PrivacyProxyServiceStatusTime;
  v5 = [(PrivacyProxyServiceStatusTime *)&v14 init];
  if (v5)
  {
    v5->_serviceStatus = (int)[v4 decodeIntForKey:@"PrivacyProxyServiceStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyServiceStatusStartDate"];
    serviceStatusStartTime = v5->_serviceStatusStartTime;
    v5->_serviceStatusStartTime = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyServiceStatusEndDate"];
    serviceStatusEndTime = v5->_serviceStatusEndTime;
    v5->_serviceStatusEndTime = (NSDate *)v8;

    v10 = v5;
  }
  else
  {
    v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v13, 2u);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyServiceStatusTime serviceStatus](self, "serviceStatus"), @"PrivacyProxyServiceStatus");
  v5 = [(PrivacyProxyServiceStatusTime *)self serviceStatusStartTime];
  [v4 encodeObject:v5 forKey:@"PrivacyProxyServiceStatusStartDate"];

  id v6 = [(PrivacyProxyServiceStatusTime *)self serviceStatusEndTime];
  [v4 encodeObject:v6 forKey:@"PrivacyProxyServiceStatusEndDate"];
}

- (id)diagnostics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = +[PrivacyProxyServiceStatus serviceStatusString:[(PrivacyProxyServiceStatusTime *)self serviceStatus]];
  [v3 setObject:v4 forKeyedSubscript:@"PrivacyProxyServiceStatus"];

  v5 = (void *)MEMORY[0x1E4F28C10];
  id v6 = [(PrivacyProxyServiceStatusTime *)self serviceStatusStartTime];
  v7 = [v5 localizedStringFromDate:v6 dateStyle:1 timeStyle:2];
  [v3 setObject:v7 forKeyedSubscript:@"PrivacyProxyServiceStatusStartDate"];

  uint64_t v8 = (void *)MEMORY[0x1E4F28C10];
  v9 = [(PrivacyProxyServiceStatusTime *)self serviceStatusEndTime];
  v10 = [v8 localizedStringFromDate:v9 dateStyle:1 timeStyle:2];
  [v3 setObject:v10 forKeyedSubscript:@"PrivacyProxyServiceStatusEndDate"];

  return v3;
}

- (unint64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(unint64_t)a3
{
  self->_serviceStatus = a3;
}

- (NSDate)serviceStatusStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceStatusStartTime:(id)a3
{
}

- (NSDate)serviceStatusEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceStatusEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStatusEndTime, 0);
  objc_storeStrong((id *)&self->_serviceStatusStartTime, 0);
}

@end