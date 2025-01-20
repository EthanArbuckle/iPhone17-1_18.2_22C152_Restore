@interface CloseAppApplicationResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (CloseAppApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation CloseAppApplicationResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static CloseAppApplicationResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (CloseAppApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (CloseAppApplicationResolutionResult *)CloseAppApplicationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end