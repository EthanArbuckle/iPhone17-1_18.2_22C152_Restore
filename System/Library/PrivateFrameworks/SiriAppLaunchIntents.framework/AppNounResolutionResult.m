@interface AppNounResolutionResult
+ (id)confirmationRequiredWithAppNounToConfirm:(int64_t)a3;
+ (id)successWithResolvedAppNoun:(int64_t)a3;
- (AppNounResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AppNounResolutionResult

+ (id)successWithResolvedAppNoun:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static AppNounResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithAppNounToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static AppNounResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (AppNounResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (AppNounResolutionResult *)AppNounResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end