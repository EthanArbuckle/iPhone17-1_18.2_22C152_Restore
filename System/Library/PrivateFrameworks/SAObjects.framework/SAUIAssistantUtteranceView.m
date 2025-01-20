@interface SAUIAssistantUtteranceView
+ (id)assistantUtteranceView;
- (NSNumber)postDialogDelayInMilliseconds;
- (NSString)dialogCategory;
- (NSString)dialogIdentifier;
- (NSString)redactedText;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDialogCategory:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setPostDialogDelayInMilliseconds:(id)a3;
- (void)setRedactedText:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAUIAssistantUtteranceView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AssistantUtteranceView";
}

+ (id)assistantUtteranceView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)dialogCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogCategory"];
}

- (void)setDialogCategory:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogIdentifier"];
}

- (void)setDialogIdentifier:(id)a3
{
}

- (NSNumber)postDialogDelayInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"postDialogDelayInMilliseconds"];
}

- (void)setPostDialogDelayInMilliseconds:(id)a3
{
}

- (NSString)redactedText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"redactedText"];
}

- (void)setRedactedText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end