@interface ICSTimeZoneTranslator
+ (id)timeZoneNameForNonstandardTimeZone:(id)a3;
@end

@implementation ICSTimeZoneTranslator

+ (id)timeZoneNameForNonstandardTimeZone:(id)a3
{
  uint64_t v3 = timeZoneNameForNonstandardTimeZone__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&timeZoneNameForNonstandardTimeZone__onceToken, &__block_literal_global_9);
  }
  v5 = [(id)timeZoneNameForNonstandardTimeZone__nonstandardTimeZones objectForKeyedSubscript:v4];

  return v5;
}

void __60__ICSTimeZoneTranslator_timeZoneNameForNonstandardTimeZone___block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v0 = [v3 pathForResource:@"nonstandardTimeZones" ofType:@"plist"];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v0];
  v2 = (void *)timeZoneNameForNonstandardTimeZone__nonstandardTimeZones;
  timeZoneNameForNonstandardTimeZone__nonstandardTimeZones = v1;
}

@end