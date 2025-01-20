@interface AppReferenceResolutionResult
+ (id)confirmationRequiredWithAppReferenceToConfirm:(int64_t)a3;
+ (id)successWithResolvedAppReference:(int64_t)a3;
- (AppReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AppReferenceResolutionResult

+ (id)successWithResolvedAppReference:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static AppReferenceResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithAppReferenceToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static AppReferenceResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (AppReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (AppReferenceResolutionResult *)AppReferenceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end