@interface SAMicroblogMicroblogSearchResultNews
+ (id)microblogSearchResultNews;
- (NSString)descriptionText;
- (NSString)title;
- (NSURL)articleURL;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setArticleURL:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAMicroblogMicroblogSearchResultNews

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"MicroblogSearchResultNews";
}

+ (id)microblogSearchResultNews
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)articleURL
{
  return (NSURL *)AceObjectURLForProperty(self, @"articleURL");
}

- (void)setArticleURL:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
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