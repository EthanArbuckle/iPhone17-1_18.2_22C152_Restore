@interface FindFriendFriendResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (FindFriendFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation FindFriendFriendResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static FindFriendFriendResolutionResult.unsupported(forReason:)(a3);

  return v4;
}

- (FindFriendFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (FindFriendFriendResolutionResult *)FindFriendFriendResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end