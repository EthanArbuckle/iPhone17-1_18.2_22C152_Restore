@interface PrivacyProxyNetworkStatus
+ (BOOL)supportsSecureCoding;
- (NSString)networkName;
- (PrivacyProxyNetworkStatus)initWithCoder:(id)a3;
- (PrivacyProxyNetworkStatus)initWithData:(id)a3;
- (PrivacyProxyNetworkStatus)initWithStatus:(unint64_t)a3 type:(int)a4 name:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)networkStatusString;
- (id)networkTypeString;
- (id)serialize;
- (int)networkType;
- (unint64_t)networkStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkStatus:(unint64_t)a3;
- (void)setNetworkType:(int)a3;
@end

@implementation PrivacyProxyNetworkStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyNetworkStatus networkStatus](self, "networkStatus"), @"PrivacyProxyNetworkStatus");
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyNetworkStatus networkType](self, "networkType"), @"PrivacyProxyNetworkType");
  id v5 = [(PrivacyProxyNetworkStatus *)self networkName];
  [v4 encodeObject:v5 forKey:@"PrivacyProxyNetworkName"];
}

- (int)networkType
{
  return self->_networkType;
}

- (unint64_t)networkStatus
{
  return self->_networkStatus;
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (PrivacyProxyNetworkStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PrivacyProxyNetworkStatus;
  id v5 = [(PrivacyProxyNetworkStatus *)&v12 init];
  if (v5)
  {
    v5->_networkStatus = (int)[v4 decodeIntForKey:@"PrivacyProxyNetworkStatus"];
    v5->_networkType = [v4 decodeIntForKey:@"PrivacyProxyNetworkType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyNetworkName"];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v6;

    v8 = v5;
  }
  else
  {
    v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (id)networkStatusString
{
  unint64_t v2 = [(PrivacyProxyNetworkStatus *)self networkStatus];
  if (v2 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E5A3B318[v2];
  }
}

- (id)networkTypeString
{
  unsigned int v2 = [(PrivacyProxyNetworkStatus *)self networkType];
  if (v2 > 4) {
    return @"Invalid";
  }
  else {
    return off_1E5A3B330[v2];
  }
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(PrivacyProxyNetworkStatus *)self networkStatusString];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, @"Network Status", a3, a4);

  v9 = [(PrivacyProxyNetworkStatus *)self networkTypeString];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, @"Network Type", a3, a4);

  v10 = [(PrivacyProxyNetworkStatus *)self networkName];
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, @"Network Name", a3, a4);

  return v7;
}

- (id)description
{
  return [(PrivacyProxyNetworkStatus *)self descriptionWithIndent:0 options:14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PrivacyProxyNetworkStatus allocWithZone:a3] init];
  [(PrivacyProxyNetworkStatus *)v4 setNetworkStatus:[(PrivacyProxyNetworkStatus *)self networkStatus]];
  [(PrivacyProxyNetworkStatus *)v4 setNetworkType:[(PrivacyProxyNetworkStatus *)self networkType]];
  id v5 = [(PrivacyProxyNetworkStatus *)self networkName];
  [(PrivacyProxyNetworkStatus *)v4 setNetworkName:v5];

  return v4;
}

- (PrivacyProxyNetworkStatus)initWithStatus:(unint64_t)a3 type:(int)a4 name:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PrivacyProxyNetworkStatus;
  v10 = [(PrivacyProxyNetworkStatus *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_networkStatus = a3;
    v10->_networkType = a4;
    objc_storeStrong((id *)&v10->_networkName, a5);
    objc_super v12 = v11;
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
  return v11;
}

- (id)serialize
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(PrivacyProxyNetworkStatus *)self encodeWithCoder:v3];
  id v4 = [v3 encodedData];

  return v4;
}

- (PrivacyProxyNetworkStatus)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v15 = 0;
  uint64_t v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v15];

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
    v14.super_class = (Class)PrivacyProxyNetworkStatus;
    objc_super v12 = [(PrivacyProxyNetworkStatus *)&v14 init];
    if (v12) {
      objc_super v12 = [(PrivacyProxyNetworkStatus *)v12 initWithCoder:v6];
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
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the network status %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setNetworkStatus:(unint64_t)a3
{
  self->_networkStatus = a3;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (void)setNetworkName:(id)a3
{
}

@end