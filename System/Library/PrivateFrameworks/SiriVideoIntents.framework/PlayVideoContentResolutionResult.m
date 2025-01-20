@interface PlayVideoContentResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (PlayVideoContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PlayVideoContentResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlayVideoContentResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (PlayVideoContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (PlayVideoContentResolutionResult *)PlayVideoContentResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end