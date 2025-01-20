@interface UIActivityItemProvider(SKUIExtensions)
+ (uint64_t)activityTypeShouldProvideImage:()SKUIExtensions;
@end

@implementation UIActivityItemProvider(SKUIExtensions)

+ (uint64_t)activityTypeShouldProvideImage:()SKUIExtensions
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[UIActivityItemProvider(SKUIExtensions) activityTypeShouldProvideImage:]();
  }
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F43590]];
  int v5 = v4 | [v3 isEqualToString:*MEMORY[0x1E4F435A0]];
  int v6 = [v3 isEqualToString:*MEMORY[0x1E4F435C0]];
  int v7 = v5 | v6 | [v3 isEqualToString:*MEMORY[0x1E4F435D0]];
  int v8 = [v3 isEqualToString:*MEMORY[0x1E4F435F8]];

  return (v7 | v8) ^ 1u;
}

+ (void)activityTypeShouldProvideImage:()SKUIExtensions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[UIActivityItemProvider(SKUIExtensions) activityTypeShouldProvideImage:]";
}

@end