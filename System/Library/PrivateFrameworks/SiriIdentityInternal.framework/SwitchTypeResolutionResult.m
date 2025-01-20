@interface SwitchTypeResolutionResult
+ (id)confirmationRequiredWithSwitchTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedSwitchType:(int64_t)a3;
- (SwitchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SwitchTypeResolutionResult

+ (id)successWithResolvedSwitchType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static SwitchTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithSwitchTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static SwitchTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (SwitchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (SwitchTypeResolutionResult *)SwitchTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end