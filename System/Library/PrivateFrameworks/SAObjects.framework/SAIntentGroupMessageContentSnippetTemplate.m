@interface SAIntentGroupMessageContentSnippetTemplate
+ (id)messageContentSnippetTemplate;
- (BOOL)sentStatus;
- (NSString)content;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContent:(id)a3;
- (void)setSentStatus:(BOOL)a3;
@end

@implementation SAIntentGroupMessageContentSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"MessageContentSnippetTemplate";
}

+ (id)messageContentSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)content
{
  return (NSString *)[(AceObject *)self propertyForKey:@"content"];
}

- (void)setContent:(id)a3
{
}

- (BOOL)sentStatus
{
  return AceObjectBoolForProperty(self, @"sentStatus");
}

- (void)setSentStatus:(BOOL)a3
{
}

@end