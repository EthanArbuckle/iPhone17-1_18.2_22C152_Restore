@interface NSExtension(_QLUtilities)
- (id)QL_parentBundleID;
- (uint64_t)QL_isAppleExtension;
- (uint64_t)isGenerationPreview;
- (void)QL_parentBundleID;
@end

@implementation NSExtension(_QLUtilities)

- (uint64_t)QL_isAppleExtension
{
  v1 = [a1 identifier];
  uint64_t v2 = [v1 hasPrefix:@"com.apple."];

  return v2;
}

- (id)QL_parentBundleID
{
  v1 = [a1 _extensionBundle];
  uint64_t v2 = [v1 bundleIdentifier];

  id v10 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v2 error:&v10];
  id v4 = v10;
  if (!v3)
  {
    uint64_t v5 = MEMORY[0x263F16100];
    v6 = *(NSObject **)(MEMORY[0x263F16100] + 128);
    if (!v6)
    {
      QLTInitLogging();
      v6 = *(NSObject **)(v5 + 128);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(NSExtension(_QLUtilities) *)(uint64_t)v2 QL_parentBundleID];
    }
  }
  v7 = [v3 containingBundleRecord];
  v8 = [v7 bundleIdentifier];

  return v8;
}

- (uint64_t)isGenerationPreview
{
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"QLIsDataBasedPreview"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)QL_parentBundleID
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_217F31000, log, OS_LOG_TYPE_ERROR, "Could not find application extension record %@: %@", (uint8_t *)&v3, 0x16u);
}

@end