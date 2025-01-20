@interface SAWaitForCommands
+ (id)waitForCommands;
- (BOOL)requiresResponse;
- (NSArray)commandAceIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommandAceIds:(id)a3;
@end

@implementation SAWaitForCommands

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"WaitForCommands";
}

+ (id)waitForCommands
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commandAceIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"commandAceIds"];
}

- (void)setCommandAceIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end