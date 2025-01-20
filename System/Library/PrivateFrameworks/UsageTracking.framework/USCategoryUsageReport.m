@interface USCategoryUsageReport
+ (BOOL)supportsSecureCoding;
- (NSArray)applicationUsage;
- (NSArray)webUsage;
- (NSString)categoryIdentifier;
- (USCategoryUsageReport)initWithCategoryIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsage:(id)a5 webUsage:(id)a6;
- (USCategoryUsageReport)initWithCoder:(id)a3;
- (double)totalUsageTime;
- (id)description;
- (void)_usCategoryUsageReportCommonInitWithTotalUsageTime:(double)a3 applicationUsage:(id)a4 webUsage:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationUsage:(id)a3;
@end

@implementation USCategoryUsageReport

- (USCategoryUsageReport)initWithCategoryIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsage:(id)a5 webUsage:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)USCategoryUsageReport;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [(USCategoryUsageReport *)&v16 init];
  uint64_t v13 = objc_msgSend(v11, "copy", v16.receiver, v16.super_class);

  categoryIdentifier = v12->_categoryIdentifier;
  v12->_categoryIdentifier = (NSString *)v13;

  [(USCategoryUsageReport *)v12 _usCategoryUsageReportCommonInitWithTotalUsageTime:v10 applicationUsage:v9 webUsage:a4];
  return v12;
}

- (void)_usCategoryUsageReportCommonInitWithTotalUsageTime:(double)a3 applicationUsage:(id)a4 webUsage:(id)a5
{
  self->_totalUsageTime = a3;
  id v7 = a5;
  v8 = (NSArray *)[a4 copy];
  applicationUsage = self->_applicationUsage;
  self->_applicationUsage = v8;

  id v10 = (NSArray *)[v7 copy];
  webUsage = self->_webUsage;
  self->_webUsage = v10;
}

- (USCategoryUsageReport)initWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CategoryIdentifier"];
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ApplicationUsageWithPickupsAndNotifications"];
  if (!v9)
  {
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ApplicationUsage"];
  }
  id v10 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"WebUsage"];
  int v14 = [v4 containsValueForKey:@"TotalUsageTime"];
  int v15 = v14;
  if (v5 && v9 && v13 && v14)
  {
    v24.receiver = self;
    v24.super_class = (Class)USCategoryUsageReport;
    objc_super v16 = [(USCategoryUsageReport *)&v24 init];
    [v4 decodeDoubleForKey:@"TotalUsageTime"];
    double v18 = v17;
    uint64_t v19 = [v5 copy];
    categoryIdentifier = v16->_categoryIdentifier;
    v16->_categoryIdentifier = (NSString *)v19;

    [(USCategoryUsageReport *)v16 _usCategoryUsageReportCommonInitWithTotalUsageTime:v9 applicationUsage:v13 webUsage:v18];
    self = v16;
    v21 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v26 = v5;
      __int16 v27 = 2114;
      v28 = v9;
      __int16 v29 = 2114;
      v30 = v13;
      __int16 v31 = 1026;
      int v32 = v15;
      _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to decode USCategoryUsageReport with categoryIdentifier: %{public}@, applicationUsage: %{public}@, webUsage: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x26u);
    }
    v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4865 userInfo:0];
    [v4 failWithError:v22];

    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  categoryIdentifier = self->_categoryIdentifier;
  id v5 = a3;
  [v5 encodeObject:categoryIdentifier forKey:@"CategoryIdentifier"];
  [v5 encodeDouble:@"TotalUsageTime" forKey:self->_totalUsageTime];
  [v5 encodeObject:self->_applicationUsage forKey:@"ApplicationUsageWithPickupsAndNotifications"];
  [v5 encodeObject:self->_webUsage forKey:@"WebUsage"];
  objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K > 0.0", @"totalUsageTime");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(NSArray *)self->_applicationUsage filteredArrayUsingPredicate:v7];
  [v5 encodeObject:v6 forKey:@"ApplicationUsage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)USCategoryUsageReport;
  id v4 = [(USCategoryUsageReport *)&v12 description];
  id v5 = [(USCategoryUsageReport *)self categoryIdentifier];
  [(USCategoryUsageReport *)self totalUsageTime];
  uint64_t v7 = v6;
  v8 = [(USCategoryUsageReport *)self applicationUsage];
  id v9 = [(USCategoryUsageReport *)self webUsage];
  id v10 = [v3 stringWithFormat:@"%@, CategoryIdentifier: %@, TotalUsageTime: %f, ApplicationUsage: %@\nIndependentWebUsage: %@", v4, v5, v7, v8, v9];

  return v10;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSArray)applicationUsage
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationUsage:(id)a3
{
}

- (NSArray)webUsage
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsage, 0);
  objc_storeStrong((id *)&self->_applicationUsage, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end