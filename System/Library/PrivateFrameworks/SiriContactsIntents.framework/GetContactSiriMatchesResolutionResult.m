@interface GetContactSiriMatchesResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (GetContactSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GetContactSiriMatchesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static GetContactSiriMatchesResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (GetContactSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (GetContactSiriMatchesResolutionResult *)GetContactSiriMatchesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end