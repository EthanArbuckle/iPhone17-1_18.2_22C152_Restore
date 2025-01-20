@interface PrivacyProxyServiceStatus
+ (BOOL)supportsSecureCoding;
+ (id)serviceStatusString:(unint64_t)a3;
- (NSArray)networkStatuses;
- (NSDictionary)details;
- (PrivacyProxyServiceStatus)initWithCoder:(id)a3;
- (PrivacyProxyServiceStatus)initWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)serialize;
- (unint64_t)serviceStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setDetails:(id)a3;
- (void)setNetworkStatuses:(id)a3;
- (void)setServiceStatus:(unint64_t)a3;
@end

@implementation PrivacyProxyServiceStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_networkStatuses, 0);
}

- (id)serialize
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(PrivacyProxyServiceStatus *)self encodeWithCoder:v3];
  v4 = [v3 encodedData];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyServiceStatus serviceStatus](self, "serviceStatus"), @"PrivacyProxyServiceStatus");
  v5 = [(PrivacyProxyServiceStatus *)self networkStatuses];
  [v4 encodeObject:v5 forKey:@"PrivacyProxyNetworkStatuses"];

  id v6 = [(PrivacyProxyServiceStatus *)self details];
  [v4 encodeObject:v6 forKey:@"PrivacyProxyDetails"];
}

- (unint64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (NSArray)networkStatuses
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)details
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (PrivacyProxyServiceStatus)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v15 = 0;
  id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v15];

  id v7 = v15;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PrivacyProxyServiceStatus;
    v12 = [(PrivacyProxyServiceStatus *)&v14 init];
    if (v12) {
      v12 = [(PrivacyProxyServiceStatus *)v12 initWithCoder:v6];
    }
    self = v12;
    v11 = self;
  }
  else
  {
    v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the service status %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (PrivacyProxyServiceStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PrivacyProxyServiceStatus;
  id v5 = [(PrivacyProxyServiceStatus *)&v23 init];
  if (v5)
  {
    v5->_serviceStatus = (int)[v4 decodeIntForKey:@"PrivacyProxyServiceStatus"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PrivacyProxyNetworkStatuses"];
    networkStatuses = v5->_networkStatuses;
    v5->_networkStatuses = (NSArray *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"PrivacyProxyDetails"];
    details = v5->_details;
    v5->_details = (NSDictionary *)v18;

    v20 = v5;
  }
  else
  {
    v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v5;
}

+ (id)serviceStatusString:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Invalid";
  }
  else {
    return off_1E5A3B358[a3];
  }
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = +[PrivacyProxyServiceStatus serviceStatusString:[(PrivacyProxyServiceStatus *)self serviceStatus]];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, @"Service Status", a3, a4);

  uint64_t v9 = [(PrivacyProxyServiceStatus *)self networkStatuses];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, @"Network Statuses", a3, a4);

  v10 = [(PrivacyProxyServiceStatus *)self details];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, @"Details", a3, a4);

  return v7;
}

- (id)description
{
  return [(PrivacyProxyServiceStatus *)self descriptionWithIndent:0 options:14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PrivacyProxyServiceStatus allocWithZone:a3] init];
  [(PrivacyProxyServiceStatus *)v4 setServiceStatus:[(PrivacyProxyServiceStatus *)self serviceStatus]];
  id v5 = [(PrivacyProxyServiceStatus *)self networkStatuses];
  [(PrivacyProxyServiceStatus *)v4 setNetworkStatuses:v5];

  id v6 = [(PrivacyProxyServiceStatus *)self details];
  uint64_t v7 = (void *)[v6 copy];
  [(PrivacyProxyServiceStatus *)v4 setDetails:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setServiceStatus:(unint64_t)a3
{
  self->_serviceStatus = a3;
}

- (void)setNetworkStatuses:(id)a3
{
}

- (void)setDetails:(id)a3
{
}

@end