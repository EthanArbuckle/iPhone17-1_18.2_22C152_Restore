@interface SkipContentDevicesResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (SkipContentDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SkipContentDevicesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A4987C(a3);
  return v4;
}

- (SkipContentDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SkipContentDevicesResolutionResult *)SkipContentDevicesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end