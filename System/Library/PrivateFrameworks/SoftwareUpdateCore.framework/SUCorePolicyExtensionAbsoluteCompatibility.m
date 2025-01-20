@interface SUCorePolicyExtensionAbsoluteCompatibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (SUCorePolicyExtensionAbsoluteCompatibility)init;
- (SUCorePolicyExtensionAbsoluteCompatibility)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)extendSoftwareUpdateMAAssetQuery:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
@end

@implementation SUCorePolicyExtensionAbsoluteCompatibility

- (SUCorePolicyExtensionAbsoluteCompatibility)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyExtensionAbsoluteCompatibility;
  v2 = [(SUCorePolicyExtension *)&v6 init];
  v3 = v2;
  if (v2)
  {
    compatibilityVersion = v2->_compatibilityVersion;
    v2->_compatibilityVersion = 0;
  }
  return v3;
}

- (void)extendSoftwareUpdateMAAssetQuery:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];

  if (v5)
  {
    objc_super v6 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
    v7 = [v6 stringValue];
    [v4 addKeyValuePair:@"_CompatibilityVersion" with:v7];
  }
  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ querying SU metadata: compatibilityVersion=%{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (SUCorePolicyExtensionAbsoluteCompatibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyExtensionAbsoluteCompatibility;
  v5 = [(SUCorePolicyExtension *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
  [v4 encodeObject:v5 forKey:@"_CompatibilityVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionAbsoluteCompatibility *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)MEMORY[0x263F77D78];
      uint64_t v6 = [(SUCorePolicyExtensionAbsoluteCompatibility *)v4 compatibilityVersion];
      v7 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
      char v8 = [v5 numberIsEqual:v6 to:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionAbsoluteCompatibility";
}

- (id)summary
{
  id v3 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];

  if (v3)
  {
    id v4 = [NSString alloc];
    id v5 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
    uint64_t v6 = (void *)[v4 initWithFormat:@"|compatibilityVersion=%@", v5];
    v7 = [&stru_26C1810A0 stringByAppendingString:v6];
  }
  else
  {
    v7 = &stru_26C1810A0;
  }
  if (([(__CFString *)v7 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@"|"];

    v7 = (__CFString *)v8;
  }

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self extensionName];
  id v5 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
  uint64_t v6 = (void *)[v3 initWithFormat:@"%@(compatibilityVersion:%@)", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SUCorePolicyExtensionAbsoluteCompatibility);
  id v5 = [(SUCorePolicyExtensionAbsoluteCompatibility *)self compatibilityVersion];
  [(SUCorePolicyExtensionAbsoluteCompatibility *)v4 setCompatibilityVersion:v5];

  return v4;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end