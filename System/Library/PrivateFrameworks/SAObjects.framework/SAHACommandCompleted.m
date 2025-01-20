@interface SAHACommandCompleted
+ (id)commandCompleted;
- (BOOL)requiresResponse;
- (NSArray)actionResults;
- (NSString)clientValidity;
- (NSString)commandOutcome;
- (NSString)serverValidity;
- (NSURL)homeIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActionResults:(id)a3;
- (void)setClientValidity:(id)a3;
- (void)setCommandOutcome:(id)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setServerValidity:(id)a3;
@end

@implementation SAHACommandCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"CommandCompleted";
}

+ (id)commandCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)actionResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"actionResults", v3);
}

- (void)setActionResults:(id)a3
{
}

- (NSString)clientValidity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"clientValidity"];
}

- (void)setClientValidity:(id)a3
{
}

- (NSString)commandOutcome
{
  return (NSString *)[(AceObject *)self propertyForKey:@"commandOutcome"];
}

- (void)setCommandOutcome:(id)a3
{
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"homeIdentifier");
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)serverValidity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serverValidity"];
}

- (void)setServerValidity:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end