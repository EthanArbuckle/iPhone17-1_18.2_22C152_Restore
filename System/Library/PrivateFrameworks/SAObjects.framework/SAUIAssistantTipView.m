@interface SAUIAssistantTipView
+ (id)assistantTipView;
- (NSString)flowIdentifier;
- (NSString)tipPrefix;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFlowIdentifier:(id)a3;
- (void)setTipPrefix:(id)a3;
@end

@implementation SAUIAssistantTipView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AssistantTipView";
}

+ (id)assistantTipView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)flowIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"flowIdentifier"];
}

- (void)setFlowIdentifier:(id)a3
{
}

- (NSString)tipPrefix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tipPrefix"];
}

- (void)setTipPrefix:(id)a3
{
}

@end