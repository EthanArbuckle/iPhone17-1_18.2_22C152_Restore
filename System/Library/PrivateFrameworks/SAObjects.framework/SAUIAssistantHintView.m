@interface SAUIAssistantHintView
+ (id)assistantHintView;
- (NSArray)commands;
- (NSArray)regions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setRegions:(id)a3;
@end

@implementation SAUIAssistantHintView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AssistantHintView";
}

+ (id)assistantHintView
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

- (NSArray)regions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"regions", v3);
}

- (void)setRegions:(id)a3
{
}

@end