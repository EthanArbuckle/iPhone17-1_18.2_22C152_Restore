@interface SUUIAppDeviceConfig
- (BOOL)isTimeZoneSet;
- (CGSize)screenSize;
- (id)currentSizeClasses;
- (id)storeFrontCountryCode;
- (id)systemLanguage;
- (id)timeZone;
- (unint64_t)preferredVideoFormat;
- (unint64_t)preferredVideoPreviewFormat;
@end

@implementation SUUIAppDeviceConfig

- (BOOL)isTimeZoneSet
{
  return 1;
}

- (unint64_t)preferredVideoFormat
{
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
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
  return 0;
}

- (id)storeFrontCountryCode
{
  return 0;
}

- (id)systemLanguage
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v3 = [v2 arrayForKey:@"AppleLanguages"];

  double v4 = [v3 firstObject];

  return v4;
}

- (id)timeZone
{
  return (id)[MEMORY[0x263EFFA18] systemTimeZone];
}

@end