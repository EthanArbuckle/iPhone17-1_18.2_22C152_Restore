@interface DeepLaunchPageNameResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (DeepLaunchPageNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeepLaunchPageNameResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static DeepLaunchPageNameResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (DeepLaunchPageNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (DeepLaunchPageNameResolutionResult *)DeepLaunchPageNameResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end