@interface RepeatStateResolutionResult
+ (id)confirmationRequiredWithRepeatStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedRepeatState:(int64_t)a3;
- (RepeatStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation RepeatStateResolutionResult

+ (id)successWithResolvedRepeatState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithRepeatStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (RepeatStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (RepeatStateResolutionResult *)RepeatStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end