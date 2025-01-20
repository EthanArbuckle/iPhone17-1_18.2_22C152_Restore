@interface SASTCommandTemplateAction
+ (id)commandTemplateAction;
- (NSArray)commands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
@end

@implementation SASTCommandTemplateAction

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"CommandTemplateAction";
}

+ (id)commandTemplateAction
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

@end