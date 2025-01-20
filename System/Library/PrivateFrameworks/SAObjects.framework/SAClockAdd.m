@interface SAClockAdd
+ (id)add;
- (BOOL)requiresResponse;
- (SAClockObject)clockToAdd;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClockToAdd:(id)a3;
@end

@implementation SAClockAdd

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"Add";
}

+ (id)add
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAClockObject)clockToAdd
{
  return (SAClockObject *)AceObjectAceObjectForProperty(self, @"clockToAdd");
}

- (void)setClockToAdd:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end