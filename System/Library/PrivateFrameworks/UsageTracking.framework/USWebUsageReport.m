@interface USWebUsageReport
+ (BOOL)supportsSecureCoding;
- (BOOL)webUsageTrusted;
- (NSDictionary)webUsageByDomain;
- (NSString)domainIdentifier;
- (USWebUsageReport)initWithCoder:(id)a3;
- (USWebUsageReport)initWithDomainIdentifier:(id)a3 totalUsageTime:(double)a4 webUsageByDomain:(id)a5;
- (USWebUsageReport)initWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6;
- (double)totalUsageTime;
- (id)description;
- (void)_usWebUsageReportCommonInitWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USWebUsageReport

- (USWebUsageReport)initWithDomainIdentifier:(id)a3 totalUsageTime:(double)a4 webUsageByDomain:(id)a5
{
  return [(USWebUsageReport *)self initWithDomainIdentifier:a3 webUsageTrusted:1 totalUsageTime:a5 webUsageByDomain:a4];
}

- (USWebUsageReport)initWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  BOOL v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)USWebUsageReport;
  id v9 = a6;
  id v10 = a3;
  v11 = [(USWebUsageReport *)&v13 init];
  -[USWebUsageReport _usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v11, "_usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v10, v7, v9, a5, v13.receiver, v13.super_class);

  return v11;
}

- (void)_usWebUsageReportCommonInitWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  id v10 = a6;
  v11 = (NSString *)[a3 copy];
  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v11;

  self->_webUsageTrusted = a4;
  self->_totalUsageTime = a5;
  objc_super v13 = (NSDictionary *)[v10 copy];

  webUsageByDomain = self->_webUsageByDomain;
  self->_webUsageByDomain = v13;
}

- (USWebUsageReport)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DomainIdentifier"];
  if ([v4 containsValueForKey:@"WebUsageTrusted"]) {
    uint64_t v6 = [v4 decodeBoolForKey:@"WebUsageTrusted"];
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"WebUsageByDomain"];
  int v12 = [v4 containsValueForKey:@"TotalUsageTime"];
  int v13 = v12;
  if (v5 && v11 && v12)
  {
    v18.receiver = self;
    v18.super_class = (Class)USWebUsageReport;
    v14 = [(USWebUsageReport *)&v18 init];
    [v4 decodeDoubleForKey:@"TotalUsageTime"];
    -[USWebUsageReport _usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v14, "_usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v5, v6, v11);
    self = v14;
    v15 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v20 = v5;
      __int16 v21 = 1026;
      int v22 = v6;
      __int16 v23 = 2114;
      v24 = v11;
      __int16 v25 = 1026;
      int v26 = v13;
      _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to decode USWebUsageReport with domainIdentifier: %{public}@, webUsageTrusted: %{public}d, webUsageByDomain: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x22u);
    }
    v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4865 userInfo:0];
    [v4 failWithError:v16];

    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  domainIdentifier = self->_domainIdentifier;
  id v5 = a3;
  [v5 encodeObject:domainIdentifier forKey:@"DomainIdentifier"];
  [v5 encodeBool:self->_webUsageTrusted forKey:@"WebUsageTrusted"];
  [v5 encodeDouble:@"TotalUsageTime" forKey:self->_totalUsageTime];
  [v5 encodeObject:self->_webUsageByDomain forKey:@"WebUsageByDomain"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v17.receiver = self;
  v17.super_class = (Class)USWebUsageReport;
  id v4 = [(USWebUsageReport *)&v17 description];
  id v5 = [(USWebUsageReport *)self domainIdentifier];
  BOOL v6 = [(USWebUsageReport *)self webUsageTrusted];
  [(USWebUsageReport *)self totalUsageTime];
  uint64_t v8 = [v3 stringWithFormat:@"%@, DomainIdentifier: %@, WebUsageTrusted: %d, TotalUsageTime: %f, WebUsage: {", v4, v5, v6, v7];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 1;
  uint64_t v9 = [(USWebUsageReport *)self webUsageByDomain];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__USWebUsageReport_description__block_invoke;
  v12[3] = &unk_26431E6A8;
  v14 = v15;
  id v10 = v8;
  id v13 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  [v10 appendString:@"}"];
  _Block_object_dispose(v15, 8);
  return v10;
}

uint64_t __31__USWebUsageReport_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)webUsageTrusted
{
  return self->_webUsageTrusted;
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSDictionary)webUsageByDomain
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsageByDomain, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end