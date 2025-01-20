@interface SAWebWebResult
+ (id)webResult;
- (NSString)descriptionText;
- (NSString)title;
- (NSURL)url;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDescriptionText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAWebWebResult

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"WebResult";
}

+ (id)webResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

@end