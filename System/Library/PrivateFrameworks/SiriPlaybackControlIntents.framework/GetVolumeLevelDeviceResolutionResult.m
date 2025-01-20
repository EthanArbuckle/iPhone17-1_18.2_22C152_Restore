@interface GetVolumeLevelDeviceResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (GetVolumeLevelDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GetVolumeLevelDeviceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A4987C(a3);
  return v4;
}

- (GetVolumeLevelDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (GetVolumeLevelDeviceResolutionResult *)GetVolumeLevelDeviceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end