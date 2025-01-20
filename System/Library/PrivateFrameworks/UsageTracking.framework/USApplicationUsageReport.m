@interface USApplicationUsageReport
+ (BOOL)supportsSecureCoding;
- (BOOL)applicationUsageTrusted;
- (NSDictionary)applicationUsageByBundleIdentifier;
- (NSDictionary)pickupsByBundleIdentifier;
- (NSDictionary)userNotificationsByBundleIdentifier;
- (NSDictionary)webUsageByDomain;
- (NSString)canonicalBundleIdentifier;
- (USApplicationUsageReport)initWithBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageTime:(double)a5 webUsageByDomain:(id)a6;
- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9;
- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageByBundleIdentifier:(id)a5 webUsageByDomain:(id)a6 userNotificationsByBundleIdentifier:(id)a7 pickupsByBundleIdentifier:(id)a8;
- (USApplicationUsageReport)initWithCoder:(id)a3;
- (double)applicationUsageTime;
- (double)totalUsageTime;
- (id)description;
- (unint64_t)totalPickups;
- (unint64_t)totalUserNotifications;
- (void)_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9;
- (void)encodeWithCoder:(id)a3;
- (void)setPickupsByBundleIdentifier:(id)a3;
- (void)setUserNotificationsByBundleIdentifier:(id)a3;
@end

@implementation USApplicationUsageReport

- (USApplicationUsageReport)initWithBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  v10 = NSNumber;
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 numberWithDouble:a5];
  v18[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v15 = [(USApplicationUsageReport *)self initWithCanonicalBundleIdentifier:v12 applicationUsageTrusted:1 totalUsageTime:v14 applicationUsageByBundleIdentifier:v11 webUsageByDomain:MEMORY[0x263EFFA78] userNotificationsByBundleIdentifier:MEMORY[0x263EFFA78] pickupsByBundleIdentifier:a4];

  return v15;
}

- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageByBundleIdentifier:(id)a5 webUsageByDomain:(id)a6 userNotificationsByBundleIdentifier:(id)a7 pickupsByBundleIdentifier:(id)a8
{
  return [(USApplicationUsageReport *)self initWithCanonicalBundleIdentifier:a3 applicationUsageTrusted:1 totalUsageTime:a5 applicationUsageByBundleIdentifier:a6 webUsageByDomain:a7 userNotificationsByBundleIdentifier:a8 pickupsByBundleIdentifier:a4];
}

- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9
{
  BOOL v13 = a4;
  v22.receiver = self;
  v22.super_class = (Class)USApplicationUsageReport;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  v20 = [(USApplicationUsageReport *)&v22 init];
  -[USApplicationUsageReport _usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v20, "_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v19, v13, v18, v17, v16, v15, a5, v22.receiver, v22.super_class);

  return v20;
}

- (void)_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  v20 = (NSString *)[a3 copy];
  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  self->_canonicalBundleIdentifier = v20;

  self->_applicationUsageTrusted = a4;
  self->_totalUsageTime = a5;
  objc_super v22 = (NSDictionary *)[v19 copy];

  applicationUsageByBundleIdentifier = self->_applicationUsageByBundleIdentifier;
  self->_applicationUsageByBundleIdentifier = v22;

  v24 = (NSDictionary *)[v18 copy];
  webUsageByDomain = self->_webUsageByDomain;
  self->_webUsageByDomain = v24;

  v26 = (NSDictionary *)[v17 copy];
  userNotificationsByBundleIdentifier = self->_userNotificationsByBundleIdentifier;
  self->_userNotificationsByBundleIdentifier = v26;

  v28 = (NSDictionary *)[v16 copy];
  pickupsByBundleIdentifier = self->_pickupsByBundleIdentifier;
  self->_pickupsByBundleIdentifier = v28;
}

- (USApplicationUsageReport)initWithCoder:(id)a3
{
  v44[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CanonicalBundleIdentifier"];
  if ([v4 containsValueForKey:@"ApplicationUsageTrusted"]) {
    uint64_t v6 = [v4 decodeBoolForKey:@"ApplicationUsageTrusted"];
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  if (v5)
  {
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"ApplicationUsageByBundleIdentifier"];
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    if ([v4 containsValueForKey:@"ApplicationUsage"])
    {
      v43 = v5;
      id v12 = NSNumber;
      [v4 decodeDoubleForKey:@"ApplicationUsage"];
      BOOL v13 = objc_msgSend(v12, "numberWithDouble:");
      v44[0] = v13;
      id v11 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    }
    else
    {
      id v11 = 0;
    }
  }
  v14 = [v4 decodeObjectOfClasses:v10 forKey:@"WebUsageByDomain"];
  int v15 = [v4 containsValueForKey:@"TotalUsageTime"];
  int v16 = v15;
  if (v5 && v11 && v14 && v15)
  {
    v32.receiver = self;
    v32.super_class = (Class)USApplicationUsageReport;
    id v17 = [(USApplicationUsageReport *)&v32 init];
    [v4 decodeDoubleForKey:@"TotalUsageTime"];
    double v19 = v18;
    uint64_t v20 = [v4 decodeObjectOfClasses:v10 forKey:@"UserNotificationsByBundleIdentifier"];
    v21 = (void *)v20;
    objc_super v22 = (void *)MEMORY[0x263EFFA78];
    if (v20) {
      v23 = (void *)v20;
    }
    else {
      v23 = (void *)MEMORY[0x263EFFA78];
    }
    id v24 = v23;

    uint64_t v25 = [v4 decodeObjectOfClasses:v10 forKey:@"PickupsByBundleIdentifier"];
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = v22;
    }
    id v28 = v27;

    [(USApplicationUsageReport *)v17 _usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:v5 applicationUsageTrusted:v6 totalUsageTime:v11 applicationUsageByBundleIdentifier:v14 webUsageByDomain:v24 userNotificationsByBundleIdentifier:v28 pickupsByBundleIdentifier:v19];
    self = v17;
    v29 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v34 = v5;
      __int16 v35 = 1026;
      int v36 = v6;
      __int16 v37 = 2114;
      v38 = v11;
      __int16 v39 = 2114;
      v40 = v14;
      __int16 v41 = 1026;
      int v42 = v16;
      _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to decode USApplicationUsageReport with canonicalBundleIdentifier: %{public}@, applicationUsageTrusted: %{public}d, applicationUsageByBundleIdentifier: %{public}@, webUsageByDomain: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x2Cu);
    }
    v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4865 userInfo:0];
    [v4 failWithError:v30];

    v29 = 0;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  id v6 = a3;
  [v6 encodeObject:canonicalBundleIdentifier forKey:@"CanonicalBundleIdentifier"];
  [v6 encodeBool:self->_applicationUsageTrusted forKey:@"ApplicationUsageTrusted"];
  [v6 encodeDouble:@"TotalUsageTime" forKey:self->_totalUsageTime];
  [v6 encodeObject:self->_applicationUsageByBundleIdentifier forKey:@"ApplicationUsageByBundleIdentifier"];
  [v6 encodeObject:self->_webUsageByDomain forKey:@"WebUsageByDomain"];
  [v6 encodeObject:self->_userNotificationsByBundleIdentifier forKey:@"UserNotificationsByBundleIdentifier"];
  [v6 encodeObject:self->_pickupsByBundleIdentifier forKey:@"PickupsByBundleIdentifier"];
  v5 = [(USApplicationUsageReport *)self bundleIdentifier];
  [v6 encodeObject:v5 forKey:@"BundleIdentifier"];

  [(USApplicationUsageReport *)self applicationUsageTime];
  objc_msgSend(v6, "encodeDouble:forKey:", @"ApplicationUsage");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)totalUserNotifications
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(USApplicationUsageReport *)self userNotificationsByBundleIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__USApplicationUsageReport_totalUserNotifications__block_invoke;
  v5[3] = &unk_26431E680;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__USApplicationUsageReport_totalUserNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)totalPickups
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(USApplicationUsageReport *)self pickupsByBundleIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__USApplicationUsageReport_totalPickups__block_invoke;
  v5[3] = &unk_26431E680;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__USApplicationUsageReport_totalPickups__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (double)applicationUsageTime
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(USApplicationUsageReport *)self applicationUsageByBundleIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__USApplicationUsageReport_applicationUsageTime__block_invoke;
  v5[3] = &unk_26431E680;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__USApplicationUsageReport_applicationUsageTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x263F089D8];
  v36.receiver = self;
  v36.super_class = (Class)USApplicationUsageReport;
  uint64_t v4 = [(USApplicationUsageReport *)&v36 description];
  double v5 = [(USApplicationUsageReport *)self canonicalBundleIdentifier];
  BOOL v6 = [(USApplicationUsageReport *)self applicationUsageTrusted];
  [(USApplicationUsageReport *)self totalUsageTime];
  uint64_t v8 = [v3 stringWithFormat:@"%@, CanonicalBundleIdentifier: %@, ApplicationUsageTrusted: %d, TotalUsageTime: %f, ApplicationUsageByBundleIdentifier: {", v4, v5, v6, v7];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v9 = [(USApplicationUsageReport *)self applicationUsageByBundleIdentifier];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __39__USApplicationUsageReport_description__block_invoke;
  v29[3] = &unk_26431E6A8;
  v31 = &v32;
  id v10 = v8;
  id v30 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v29];

  [v10 appendString:@"}, AssociatedWebUsage: {"];
  *((unsigned char *)v33 + 24) = 1;
  id v11 = [(USApplicationUsageReport *)self webUsageByDomain];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __39__USApplicationUsageReport_description__block_invoke_2;
  v26[3] = &unk_26431E6A8;
  id v28 = &v32;
  id v12 = v10;
  id v27 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v26];

  [v12 appendString:@"}, UserNotificationsByBundleIdentifier: {"];
  *((unsigned char *)v33 + 24) = 1;
  BOOL v13 = [(USApplicationUsageReport *)self userNotificationsByBundleIdentifier];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __39__USApplicationUsageReport_description__block_invoke_3;
  v23[3] = &unk_26431E6A8;
  uint64_t v25 = &v32;
  id v14 = v12;
  id v24 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];

  [v14 appendString:@"}, PickupsByBundleIdentifier: {"];
  *((unsigned char *)v33 + 24) = 1;
  int v15 = [(USApplicationUsageReport *)self pickupsByBundleIdentifier];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __39__USApplicationUsageReport_description__block_invoke_4;
  v20[3] = &unk_26431E6A8;
  objc_super v22 = &v32;
  id v16 = v14;
  id v21 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v20];

  [v16 appendString:@"}"];
  id v17 = v21;
  id v18 = v16;

  _Block_object_dispose(&v32, 8);
  return v18;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSString)canonicalBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)applicationUsageTrusted
{
  return self->_applicationUsageTrusted;
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSDictionary)applicationUsageByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)webUsageByDomain
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userNotificationsByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserNotificationsByBundleIdentifier:(id)a3
{
}

- (NSDictionary)pickupsByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPickupsByBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickupsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userNotificationsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_webUsageByDomain, 0);
  objc_storeStrong((id *)&self->_applicationUsageByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIdentifier, 0);
}

@end