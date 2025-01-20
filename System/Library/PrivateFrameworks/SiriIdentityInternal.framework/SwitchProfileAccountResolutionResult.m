@interface SwitchProfileAccountResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (SwitchProfileAccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SwitchProfileAccountResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static SwitchProfileAccountResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (SwitchProfileAccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (SwitchProfileAccountResolutionResult *)SwitchProfileAccountResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end