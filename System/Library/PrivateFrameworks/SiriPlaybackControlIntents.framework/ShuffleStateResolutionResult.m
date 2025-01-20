@interface ShuffleStateResolutionResult
+ (id)confirmationRequiredWithShuffleStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedShuffleState:(int64_t)a3;
- (ShuffleStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ShuffleStateResolutionResult

+ (id)successWithResolvedShuffleState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithShuffleStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (ShuffleStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (ShuffleStateResolutionResult *)ShuffleStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end