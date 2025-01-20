@interface SAUIMenuItem
+ (id)menuItem;
- (NSArray)commands;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)icon;
- (NSURL)ref;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setIcon:(id)a3;
- (void)setRef:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUIMenuItem

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"MenuItem";
}

+ (id)menuItem
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

- (NSURL)icon
{
  return (NSURL *)AceObjectURLForProperty(self, @"icon");
}

- (void)setIcon:(id)a3
{
}

- (NSURL)ref
{
  return (NSURL *)AceObjectURLForProperty(self, @"ref");
}

- (void)setRef:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end