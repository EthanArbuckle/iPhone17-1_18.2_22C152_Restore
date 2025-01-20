@interface SASportsNewsItem
+ (id)newsItem;
- (NSString)summary;
- (NSString)title;
- (NSURL)link;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLink:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASportsNewsItem

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"NewsItem";
}

+ (id)newsItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, @"link");
}

- (void)setLink:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"summary"];
}

- (void)setSummary:(id)a3
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