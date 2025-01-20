@interface DirectionResolutionResult
+ (id)confirmationRequiredWithDirectionToConfirm:(int64_t)a3;
+ (id)successWithResolvedDirection:(int64_t)a3;
- (DirectionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DirectionResolutionResult

+ (id)successWithResolvedDirection:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithDirectionToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (DirectionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (DirectionResolutionResult *)DirectionResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end