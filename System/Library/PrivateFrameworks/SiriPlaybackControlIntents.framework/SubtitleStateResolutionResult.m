@interface SubtitleStateResolutionResult
+ (id)confirmationRequiredWithSubtitleStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedSubtitleState:(int64_t)a3;
- (SubtitleStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SubtitleStateResolutionResult

+ (id)successWithResolvedSubtitleState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithSubtitleStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (SubtitleStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SubtitleStateResolutionResult *)SubtitleStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end