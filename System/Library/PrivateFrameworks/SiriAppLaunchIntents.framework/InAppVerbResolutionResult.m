@interface InAppVerbResolutionResult
+ (id)confirmationRequiredWithInAppVerbToConfirm:(int64_t)a3;
+ (id)successWithResolvedInAppVerb:(int64_t)a3;
- (InAppVerbResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation InAppVerbResolutionResult

+ (id)successWithResolvedInAppVerb:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static InAppVerbResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithInAppVerbToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static InAppVerbResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (InAppVerbResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (InAppVerbResolutionResult *)InAppVerbResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end