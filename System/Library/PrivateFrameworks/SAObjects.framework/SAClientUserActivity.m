@interface SAClientUserActivity
+ (id)clientUserActivity;
- (NSArray)keywords;
- (NSArray)requiredUserInfoKeys;
- (NSDictionary)userInfo;
- (NSString)title;
- (NSString)type;
- (NSURL)webpageURL;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKeywords:(id)a3;
- (void)setRequiredUserInfoKeys:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation SAClientUserActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ClientUserActivity";
}

+ (id)clientUserActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)keywords
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"keywords"];
}

- (void)setKeywords:(id)a3
{
}

- (NSArray)requiredUserInfoKeys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"requiredUserInfoKeys"];
}

- (void)setRequiredUserInfoKeys:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"userInfo"];
}

- (void)setUserInfo:(id)a3
{
}

- (NSURL)webpageURL
{
  return (NSURL *)AceObjectURLForProperty(self, @"webpageURL");
}

- (void)setWebpageURL:(id)a3
{
}

@end