@interface LaunchAppApplicationResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (LaunchAppApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation LaunchAppApplicationResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static LaunchAppApplicationResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (LaunchAppApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (LaunchAppApplicationResolutionResult *)LaunchAppApplicationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end