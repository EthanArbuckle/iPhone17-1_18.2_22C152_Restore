@interface SKUIAppDeviceConfig
- (BOOL)isTimeZoneSet;
- (CGSize)screenSize;
- (id)currentSizeClasses;
- (id)storeFrontCountryCode;
- (id)systemLanguage;
- (id)timeZone;
- (unint64_t)preferredVideoFormat;
- (unint64_t)preferredVideoPreviewFormat;
- (void)currentSizeClasses;
- (void)isTimeZoneSet;
- (void)preferredVideoFormat;
- (void)preferredVideoPreviewFormat;
- (void)screenSize;
- (void)storeFrontCountryCode;
- (void)systemLanguage;
- (void)timeZone;
@end

@implementation SKUIAppDeviceConfig

- (BOOL)isTimeZoneSet
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 isTimeZoneSet];
      }
    }
  }
  return 1;
}

- (unint64_t)preferredVideoFormat
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 preferredVideoFormat];
      }
    }
  }
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 preferredVideoPreviewFormat];
      }
    }
  }
  return 0;
}

- (CGSize)screenSize
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAppDeviceConfig screenSize]();
  }
  BOOL v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)currentSizeClasses
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 currentSizeClasses];
      }
    }
  }
  return 0;
}

- (id)storeFrontCountryCode
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 storeFrontCountryCode];
      }
    }
  }
  return 0;
}

- (id)systemLanguage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 systemLanguage];
      }
    }
  }
  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v11 = [v10 arrayForKey:@"AppleLanguages"];

  v12 = [v11 firstObject];

  return v12;
}

- (id)timeZone
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIAppDeviceConfig *)v2 timeZone];
      }
    }
  }
  v10 = [MEMORY[0x1E4F1CAF0] systemTimeZone];

  return v10;
}

- (void)isTimeZoneSet
{
}

- (void)preferredVideoFormat
{
}

- (void)preferredVideoPreviewFormat
{
}

- (void)screenSize
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAppDeviceConfig screenSize]";
}

- (void)currentSizeClasses
{
}

- (void)storeFrontCountryCode
{
}

- (void)systemLanguage
{
}

- (void)timeZone
{
}

@end