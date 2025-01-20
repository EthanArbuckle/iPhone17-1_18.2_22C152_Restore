@interface PlayLiveServiceLiveServiceResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (PlayLiveServiceLiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PlayLiveServiceLiveServiceResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlayLiveServiceLiveServiceResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (PlayLiveServiceLiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (PlayLiveServiceLiveServiceResolutionResult *)PlayLiveServiceLiveServiceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end