@interface PersonRoleResolutionResult
+ (id)confirmationRequiredWithPersonRoleToConfirm:(int64_t)a3;
+ (id)successWithResolvedPersonRole:(int64_t)a3;
- (PersonRoleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PersonRoleResolutionResult

+ (id)successWithResolvedPersonRole:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PersonRoleResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithPersonRoleToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PersonRoleResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (PersonRoleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (PersonRoleResolutionResult *)PersonRoleResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end