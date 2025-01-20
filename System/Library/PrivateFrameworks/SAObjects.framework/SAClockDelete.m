@interface SAClockDelete
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)clockIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClockIds:(id)a3;
@end

@implementation SAClockDelete

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"Delete";
}

- (NSArray)clockIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"clockIds");
}

- (void)setClockIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end