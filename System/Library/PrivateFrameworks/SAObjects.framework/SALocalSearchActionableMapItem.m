@interface SALocalSearchActionableMapItem
+ (id)actionableMapItem;
- (NSArray)commands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
@end

@implementation SALocalSearchActionableMapItem

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ActionableMapItem";
}

+ (id)actionableMapItem
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