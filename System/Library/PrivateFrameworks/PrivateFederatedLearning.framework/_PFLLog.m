@interface _PFLLog
+ (id)extension;
+ (id)framework;
+ (id)telemetry;
@end

@implementation _PFLLog

+ (id)framework
{
  if (framework_onceToken != -1) {
    dispatch_once(&framework_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)framework__framework;
  return v2;
}

+ (id)telemetry
{
  if (telemetry_onceToken != -1) {
    dispatch_once(&telemetry_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)telemetry_telemetry;
  return v2;
}

+ (id)extension
{
  if (extension_onceToken != -1) {
    dispatch_once(&extension_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)extension__extension;
  return v2;
}

@end