@interface SAReminderAssistantPayload
+ (id)assistantPayload;
- (NSString)utterance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUtterance:(id)a3;
@end

@implementation SAReminderAssistantPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"AssistantPayload";
}

+ (id)assistantPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

@end