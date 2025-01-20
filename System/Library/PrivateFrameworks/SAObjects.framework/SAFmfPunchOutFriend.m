@interface SAFmfPunchOutFriend
+ (id)punchOutFriend;
- (BOOL)requiresResponse;
- (NSArray)friends;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFriends:(id)a3;
@end

@implementation SAFmfPunchOutFriend

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"PunchOutFriend";
}

+ (id)punchOutFriend
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)friends
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"friends", v3);
}

- (void)setFriends:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end