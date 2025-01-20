@interface SharedLocationVisibilityResolutionResult
+ (id)confirmationRequiredWithSharedLocationVisibilityToConfirm:(int64_t)a3;
+ (id)successWithResolvedSharedLocationVisibility:(int64_t)a3;
- (SharedLocationVisibilityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SharedLocationVisibilityResolutionResult

+ (id)successWithResolvedSharedLocationVisibility:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static SharedLocationVisibilityResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithSharedLocationVisibilityToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static SharedLocationVisibilityResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (SharedLocationVisibilityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (SharedLocationVisibilityResolutionResult *)SharedLocationVisibilityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end