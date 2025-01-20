@interface SUCorePolicyExtensionCompanionCompatibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)maxCompatibility;
- (NSNumber)minCompatibility;
- (SUCorePolicyExtensionCompanionCompatibility)init;
- (SUCorePolicyExtensionCompanionCompatibility)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxCompatibility:(id)a3;
- (void)setMinCompatibility:(id)a3;
@end

@implementation SUCorePolicyExtensionCompanionCompatibility

- (SUCorePolicyExtensionCompanionCompatibility)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyExtensionCompanionCompatibility;
  v2 = [(SUCorePolicyExtension *)&v7 init];
  v3 = v2;
  if (v2)
  {
    minCompatibility = v2->_minCompatibility;
    v2->_minCompatibility = 0;

    maxCompatibility = v3->_maxCompatibility;
    v3->_maxCompatibility = 0;
  }
  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
  v6 = v4;
  if (v5)
  {
    objc_super v7 = (void *)v5;
    v8 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];

    v6 = v4;
    if (v8)
    {
      v9 = [MEMORY[0x263F77DE8] sharedLogger];
      v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = [v4 count];
        _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting compatibility version filtering, starting with %lu assets", buf, 0x16u);
      }

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke;
      v20[3] = &unk_2640DC388;
      v20[4] = self;
      v11 = [MEMORY[0x263F08A98] predicateWithBlock:v20];
      v6 = [v4 filteredArrayUsingPredicate:v11];

      v12 = [MEMORY[0x263F77DE8] sharedLogger];
      v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v6 count];
        v15 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
        uint64_t v16 = [v15 unsignedLongValue];
        v17 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
        uint64_t v18 = [v17 unsignedLongValue];
        *(_DWORD *)buf = 138544130;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu assets that meet the compatibility requirement of %lu:%lu", buf, 0x2Au);
      }
    }
  }

  return v6;
}

BOOL __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"CompatibilityVersion"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [*(id *)(a1 + 32) minCompatibility];
    if ([v4 compare:v5] == -1)
    {
      BOOL v7 = 0;
    }
    else
    {
      v6 = [*(id *)(a1 + 32) maxCompatibility];
      BOOL v7 = [v4 compare:v6] != 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v4 unsignedLongValue];
    v12 = @"NO";
    int v14 = 138543874;
    uint64_t v15 = v10;
    if (v7) {
      v12 = @"YES";
    }
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ assetCompatibilityVersion=%lu, compatible=%{public}@", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (SUCorePolicyExtensionCompanionCompatibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCorePolicyExtensionCompanionCompatibility;
  uint64_t v5 = [(SUCorePolicyExtension *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinCompatibility"];
    minCompatibility = v5->_minCompatibility;
    v5->_minCompatibility = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaxCompatibility"];
    maxCompatibility = v5->_maxCompatibility;
    v5->_maxCompatibility = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
  [v4 encodeObject:v5 forKey:@"MinCompatibility"];

  id v6 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
  [v4 encodeObject:v6 forKey:@"MaxCompatibility"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionCompanionCompatibility *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = (void *)MEMORY[0x263F77D78];
      BOOL v7 = [(SUCorePolicyExtensionCompanionCompatibility *)v5 minCompatibility];
      uint64_t v8 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
      if ([v6 numberIsEqual:v7 to:v8])
      {
        v9 = (void *)MEMORY[0x263F77D78];
        uint64_t v10 = [(SUCorePolicyExtensionCompanionCompatibility *)v5 maxCompatibility];
        objc_super v11 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
        char v12 = [v9 numberIsEqual:v10 to:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionCompanionCompatibility";
}

- (id)summary
{
  id v3 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];

  if (v3)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
    id v6 = (void *)[v4 initWithFormat:@"|minCompatibility=%@", v5];
    BOOL v7 = [&stru_26C1810A0 stringByAppendingString:v6];
  }
  else
  {
    BOOL v7 = &stru_26C1810A0;
  }
  uint64_t v8 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];

  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
    objc_super v11 = (void *)[v9 initWithFormat:@"|maxCompatibility=%@", v10];
    uint64_t v12 = [(__CFString *)v7 stringByAppendingString:v11];

    BOOL v7 = (__CFString *)v12;
  }
  if (([(__CFString *)v7 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v13 = [(__CFString *)v7 stringByAppendingString:@"|"];

    BOOL v7 = (__CFString *)v13;
  }

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SUCorePolicyExtensionCompanionCompatibility *)self extensionName];
  uint64_t v5 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
  id v6 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
  BOOL v7 = (void *)[v3 initWithFormat:@"%@(minCompatibility:%@|maxCompatibility:%@)", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SUCorePolicyExtensionCompanionCompatibility);
  uint64_t v5 = [(SUCorePolicyExtensionCompanionCompatibility *)self minCompatibility];
  [(SUCorePolicyExtensionCompanionCompatibility *)v4 setMinCompatibility:v5];

  id v6 = [(SUCorePolicyExtensionCompanionCompatibility *)self maxCompatibility];
  [(SUCorePolicyExtensionCompanionCompatibility *)v4 setMaxCompatibility:v6];

  return v4;
}

- (NSNumber)minCompatibility
{
  return self->_minCompatibility;
}

- (void)setMinCompatibility:(id)a3
{
}

- (NSNumber)maxCompatibility
{
  return self->_maxCompatibility;
}

- (void)setMaxCompatibility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCompatibility, 0);

  objc_storeStrong((id *)&self->_minCompatibility, 0);
}

@end