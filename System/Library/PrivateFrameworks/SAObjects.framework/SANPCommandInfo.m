@interface SANPCommandInfo
+ (id)commandInfo;
- (NSArray)registeredCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRegisteredCommands:(id)a3;
@end

@implementation SANPCommandInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"CommandInfo";
}

+ (id)commandInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)registeredCommands
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"registeredCommands"];
}

- (void)setRegisteredCommands:(id)a3
{
}

@end