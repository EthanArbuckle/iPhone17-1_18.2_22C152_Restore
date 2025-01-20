@interface SASendCommands
+ (id)sendCommands;
- (BOOL)requiresResponse;
- (NSArray)commands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
@end

@implementation SASendCommands

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SendCommands";
}

+ (id)sendCommands
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD72FF0);
}

- (void)setCommands:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end