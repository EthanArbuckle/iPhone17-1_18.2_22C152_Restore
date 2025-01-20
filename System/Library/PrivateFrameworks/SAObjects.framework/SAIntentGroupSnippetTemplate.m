@interface SAIntentGroupSnippetTemplate
+ (id)snippetTemplate;
- (NSArray)intentSlotKeyPaths;
- (NSString)key;
- (SAUISnippet)detailSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDetailSnippet:(id)a3;
- (void)setIntentSlotKeyPaths:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation SAIntentGroupSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SnippetTemplate";
}

+ (id)snippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUISnippet)detailSnippet
{
  return (SAUISnippet *)AceObjectAceObjectForProperty(self, @"detailSnippet");
}

- (void)setDetailSnippet:(id)a3
{
}

- (NSArray)intentSlotKeyPaths
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"intentSlotKeyPaths"];
}

- (void)setIntentSlotKeyPaths:(id)a3
{
}

- (NSString)key
{
  return (NSString *)[(AceObject *)self propertyForKey:@"key"];
}

- (void)setKey:(id)a3
{
}

@end