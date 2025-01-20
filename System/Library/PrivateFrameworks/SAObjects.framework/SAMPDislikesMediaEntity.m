@interface SAMPDislikesMediaEntity
+ (id)dislikesMediaEntity;
- (BOOL)requiresResponse;
- (NSString)influencedUserSharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInfluencedUserSharedUserId:(id)a3;
@end

@implementation SAMPDislikesMediaEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"DislikesMediaEntity";
}

+ (id)dislikesMediaEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)influencedUserSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"influencedUserSharedUserId"];
}

- (void)setInfluencedUserSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end