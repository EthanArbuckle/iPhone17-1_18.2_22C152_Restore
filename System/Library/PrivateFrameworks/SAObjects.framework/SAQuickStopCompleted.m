@interface SAQuickStopCompleted
- (BOOL)requiresResponse;
- (NSNumber)confirmationRequired;
- (NSString)categoryStopped;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCategoryStopped:(id)a3;
- (void)setConfirmationRequired:(id)a3;
@end

@implementation SAQuickStopCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"QuickStopCompleted";
}

- (NSString)categoryStopped
{
  return (NSString *)[(AceObject *)self propertyForKey:@"categoryStopped"];
}

- (void)setCategoryStopped:(id)a3
{
}

- (NSNumber)confirmationRequired
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"confirmationRequired"];
}

- (void)setConfirmationRequired:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end