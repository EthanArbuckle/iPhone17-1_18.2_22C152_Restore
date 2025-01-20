@interface RemoveFromWatchListContentResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (RemoveFromWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation RemoveFromWatchListContentResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static RemoveFromWatchListContentResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (RemoveFromWatchListContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (RemoveFromWatchListContentResolutionResult *)RemoveFromWatchListContentResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end