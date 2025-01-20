@interface SASTViewTemplateAction
+ (id)viewTemplateAction;
- (NSArray)commands;
- (NSString)viewTitle;
- (SASTItemGroup)itemGroupView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setItemGroupView:(id)a3;
- (void)setViewTitle:(id)a3;
@end

@implementation SASTViewTemplateAction

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ViewTemplateAction";
}

+ (id)viewTemplateAction
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

- (SASTItemGroup)itemGroupView
{
  return (SASTItemGroup *)AceObjectAceObjectForProperty(self, @"itemGroupView");
}

- (void)setItemGroupView:(id)a3
{
}

- (NSString)viewTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"viewTitle"];
}

- (void)setViewTitle:(id)a3
{
}

@end