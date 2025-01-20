@interface SAIntentGroupChoiceSettingSnippetTemplate
+ (id)choiceSettingSnippetTemplate;
- (BOOL)selected;
- (SAServerBoundCommand)updateSlotCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSelected:(BOOL)a3;
- (void)setUpdateSlotCommand:(id)a3;
@end

@implementation SAIntentGroupChoiceSettingSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ChoiceSettingSnippetTemplate";
}

+ (id)choiceSettingSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)selected
{
  return AceObjectBoolForProperty(self, @"selected");
}

- (void)setSelected:(BOOL)a3
{
}

- (SAServerBoundCommand)updateSlotCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, @"updateSlotCommand");
}

- (void)setUpdateSlotCommand:(id)a3
{
}

@end