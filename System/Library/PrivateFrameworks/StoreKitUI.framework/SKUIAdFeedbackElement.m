@interface SKUIAdFeedbackElement
+ (BOOL)isEnabled;
+ (void)isEnabled;
@end

@implementation SKUIAdFeedbackElement

+ (BOOL)isEnabled
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIAdFeedbackElement isEnabled]();
  }
  return 0;
}

+ (void)isEnabled
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIAdFeedbackElement isEnabled]";
}

@end