@interface UserIdentifyIdentityResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (UserIdentifyIdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation UserIdentifyIdentityResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (UserIdentifyIdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (UserIdentifyIdentityResolutionResult *)UserIdentifyIdentityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end