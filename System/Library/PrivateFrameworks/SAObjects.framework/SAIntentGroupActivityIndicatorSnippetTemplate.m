@interface SAIntentGroupActivityIndicatorSnippetTemplate
+ (id)activityIndicatorSnippetTemplate;
- (NSString)detailText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDetailText:(id)a3;
@end

@implementation SAIntentGroupActivityIndicatorSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ActivityIndicatorSnippetTemplate";
}

+ (id)activityIndicatorSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)detailText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"detailText"];
}

- (void)setDetailText:(id)a3
{
}

@end