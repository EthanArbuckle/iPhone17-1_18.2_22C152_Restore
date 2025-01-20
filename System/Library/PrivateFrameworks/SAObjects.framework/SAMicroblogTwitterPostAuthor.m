@interface SAMicroblogTwitterPostAuthor
+ (id)twitterPostAuthor;
- (BOOL)verified;
- (NSNumber)userId;
- (NSString)fullName;
- (NSString)screenName;
- (NSURL)profileImageUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)followersCount;
- (void)setFollowersCount:(int64_t)a3;
- (void)setFullName:(id)a3;
- (void)setProfileImageUrl:(id)a3;
- (void)setScreenName:(id)a3;
- (void)setUserId:(id)a3;
- (void)setVerified:(BOOL)a3;
@end

@implementation SAMicroblogTwitterPostAuthor

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"TwitterPostAuthor";
}

+ (id)twitterPostAuthor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)followersCount
{
  return AceObjectIntegerForProperty(self, @"followersCount");
}

- (void)setFollowersCount:(int64_t)a3
{
}

- (NSString)fullName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullName"];
}

- (void)setFullName:(id)a3
{
}

- (NSURL)profileImageUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"profileImageUrl");
}

- (void)setProfileImageUrl:(id)a3
{
}

- (NSString)screenName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"screenName"];
}

- (void)setScreenName:(id)a3
{
}

- (NSNumber)userId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"userId"];
}

- (void)setUserId:(id)a3
{
}

- (BOOL)verified
{
  return AceObjectBoolForProperty(self, @"verified");
}

- (void)setVerified:(BOOL)a3
{
}

@end