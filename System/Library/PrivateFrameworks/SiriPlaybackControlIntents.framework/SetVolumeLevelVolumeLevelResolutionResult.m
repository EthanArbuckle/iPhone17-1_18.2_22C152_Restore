@interface SetVolumeLevelVolumeLevelResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (SetVolumeLevelVolumeLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetVolumeLevelVolumeLevelResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A4DDC0(a3);
  return v4;
}

- (SetVolumeLevelVolumeLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SetVolumeLevelVolumeLevelResolutionResult *)SetVolumeLevelVolumeLevelResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end