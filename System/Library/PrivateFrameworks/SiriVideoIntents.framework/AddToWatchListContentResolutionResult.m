@interface AddToWatchListContentResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (AddToWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AddToWatchListContentResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static AddToWatchListContentResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (AddToWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (AddToWatchListContentResolutionResult *)AddToWatchListContentResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end