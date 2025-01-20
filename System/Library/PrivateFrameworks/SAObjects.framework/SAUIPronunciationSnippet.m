@interface SAUIPronunciationSnippet
+ (id)pronunciationSnippet;
- (NSArray)cancelCommands;
- (NSArray)pronunciations;
- (NSArray)selectNoneCommands;
- (NSString)interactionId;
- (NSString)orthography;
- (NSString)selectNoneText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCancelCommands:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setPronunciations:(id)a3;
- (void)setSelectNoneCommands:(id)a3;
- (void)setSelectNoneText:(id)a3;
@end

@implementation SAUIPronunciationSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PronunciationSnippet";
}

+ (id)pronunciationSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)cancelCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"cancelCommands", &unk_1EFD73568);
}

- (void)setCancelCommands:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)orthography
{
  return (NSString *)[(AceObject *)self propertyForKey:@"orthography"];
}

- (void)setOrthography:(id)a3
{
}

- (NSArray)pronunciations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"pronunciations", v3);
}

- (void)setPronunciations:(id)a3
{
}

- (NSArray)selectNoneCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"selectNoneCommands", &unk_1EFD73568);
}

- (void)setSelectNoneCommands:(id)a3
{
}

- (NSString)selectNoneText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectNoneText"];
}

- (void)setSelectNoneText:(id)a3
{
}

@end