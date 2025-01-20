@interface SetSubtitleStateDeviceResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (SetSubtitleStateDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetSubtitleStateDeviceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A4DDC0(a3);
  return v4;
}

- (SetSubtitleStateDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SetSubtitleStateDeviceResolutionResult *)SetSubtitleStateDeviceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end