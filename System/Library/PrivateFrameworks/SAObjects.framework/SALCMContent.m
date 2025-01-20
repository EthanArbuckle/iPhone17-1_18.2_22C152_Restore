@interface SALCMContent
+ (id)content;
- (NSString)canonicalId;
- (NSString)channelId;
- (NSString)title;
- (NSURL)externalId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setExternalId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SALCMContent

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"Content";
}

+ (id)content
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)canonicalId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"canonicalId"];
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)channelId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"channelId"];
}

- (void)setChannelId:(id)a3
{
}

- (NSURL)externalId
{
  return (NSURL *)AceObjectURLForProperty(self, @"externalId");
}

- (void)setExternalId:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end