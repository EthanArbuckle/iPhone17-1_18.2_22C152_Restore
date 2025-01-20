@interface SAUIAcePronunciationItem
+ (id)acePronunciationItem;
- (NSArray)commands;
- (NSString)title;
- (NSString)tts;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTts:(id)a3;
@end

@implementation SAUIAcePronunciationItem

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AcePronunciationItem";
}

+ (id)acePronunciationItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSString)tts
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tts"];
}

- (void)setTts:(id)a3
{
}

@end