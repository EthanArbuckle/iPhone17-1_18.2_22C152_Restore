@interface SAMPLikesMediaEntity
+ (id)likesMediaEntity;
- (BOOL)requiresResponse;
- (NSString)influencedSharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInfluencedSharedUserId:(id)a3;
@end

@implementation SAMPLikesMediaEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"LikesMediaEntity";
}

+ (id)likesMediaEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)influencedSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"influencedSharedUserId"];
}

- (void)setInfluencedSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end