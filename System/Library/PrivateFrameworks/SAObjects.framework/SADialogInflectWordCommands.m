@interface SADialogInflectWordCommands
+ (id)inflectWordCommands;
- (BOOL)requiresResponse;
- (NSArray)inflectWordCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInflectWordCommands:(id)a3;
@end

@implementation SADialogInflectWordCommands

- (id)groupIdentifier
{
  return @"com.apple.ace.dialog";
}

- (id)encodedClassName
{
  return @"InflectWordCommands";
}

+ (id)inflectWordCommands
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)inflectWordCommands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"inflectWordCommands", v3);
}

- (void)setInflectWordCommands:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end