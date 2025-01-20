@interface SACFRemoveScriptCommand
+ (id)removeScriptCommand;
- (BOOL)requiresResponse;
- (NSArray)scriptIdentifiers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setScriptIdentifiers:(id)a3;
@end

@implementation SACFRemoveScriptCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"RemoveScriptCommand";
}

+ (id)removeScriptCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)scriptIdentifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"scriptIdentifiers"];
}

- (void)setScriptIdentifiers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end