@interface NSDictionary(SKUIExtensions)
+ (id)sk_dictionaryWithSize:()SKUIExtensions;
@end

@implementation NSDictionary(SKUIExtensions)

+ (id)sk_dictionaryWithSize:()SKUIExtensions
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[NSDictionary(SKUIExtensions) sk_dictionaryWithSize:]();
  }
  v8[0] = @"width";
  v4 = [NSNumber numberWithDouble:a1];
  v8[1] = @"height";
  v9[0] = v4;
  v5 = [NSNumber numberWithDouble:a2];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (void)sk_dictionaryWithSize:()SKUIExtensions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[NSDictionary(SKUIExtensions) sk_dictionaryWithSize:]";
}

@end