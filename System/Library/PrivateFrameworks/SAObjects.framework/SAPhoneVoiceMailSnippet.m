@interface SAPhoneVoiceMailSnippet
+ (id)voiceMailSnippet;
- (NSArray)calls;
- (NSArray)playVoiceMailCommands;
- (NSNumber)autoPlay;
- (SAClientBoundCommand)postPlayCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAutoPlay:(id)a3;
- (void)setCalls:(id)a3;
- (void)setPlayVoiceMailCommands:(id)a3;
- (void)setPostPlayCommand:(id)a3;
@end

@implementation SAPhoneVoiceMailSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"VoiceMailSnippet";
}

+ (id)voiceMailSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)autoPlay
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"autoPlay"];
}

- (void)setAutoPlay:(id)a3
{
}

- (NSArray)calls
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"calls", v3);
}

- (void)setCalls:(id)a3
{
}

- (NSArray)playVoiceMailCommands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"playVoiceMailCommands", v3);
}

- (void)setPlayVoiceMailCommands:(id)a3
{
}

- (SAClientBoundCommand)postPlayCommand
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, @"postPlayCommand");
}

- (void)setPostPlayCommand:(id)a3
{
}

@end