@interface SAIntentGroupProfileSnippetTemplate
+ (id)profileSnippetTemplate;
- (NSArray)labelComponents;
- (NSString)alignment;
- (NSString)imageStyle;
- (NSString)imageURI;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setImageStyle:(id)a3;
- (void)setImageURI:(id)a3;
- (void)setLabelComponents:(id)a3;
@end

@implementation SAIntentGroupProfileSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ProfileSnippetTemplate";
}

+ (id)profileSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSString)imageStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageStyle"];
}

- (void)setImageStyle:(id)a3
{
}

- (NSString)imageURI
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageURI"];
}

- (void)setImageURI:(id)a3
{
}

- (NSArray)labelComponents
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"labelComponents", v3);
}

- (void)setLabelComponents:(id)a3
{
}

@end