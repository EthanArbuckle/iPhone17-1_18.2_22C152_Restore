@interface GroupTypeResolutionResult
+ (id)confirmationRequiredWithGroupTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedGroupType:(int64_t)a3;
- (GroupTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GroupTypeResolutionResult

+ (id)successWithResolvedGroupType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithGroupTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (GroupTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (GroupTypeResolutionResult *)GroupTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end