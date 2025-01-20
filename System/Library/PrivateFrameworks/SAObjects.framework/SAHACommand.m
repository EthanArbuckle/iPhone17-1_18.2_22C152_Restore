@interface SAHACommand
+ (id)command;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)actionRequests;
- (NSArray)actions;
- (NSNumber)commandTimeout;
- (NSString)serverValidity;
- (SAHAFilter)filter;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActionRequests:(id)a3;
- (void)setActions:(id)a3;
- (void)setCommandTimeout:(id)a3;
- (void)setFilter:(id)a3;
- (void)setMutatingCommand:(BOOL)a3;
- (void)setServerValidity:(id)a3;
@end

@implementation SAHACommand

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"Command";
}

+ (id)command
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)actionRequests
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"actionRequests", v3);
}

- (void)setActionRequests:(id)a3
{
}

- (NSArray)actions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"actions", v3);
}

- (void)setActions:(id)a3
{
}

- (NSNumber)commandTimeout
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"commandTimeout"];
}

- (void)setCommandTimeout:(id)a3
{
}

- (SAHAFilter)filter
{
  return (SAHAFilter *)AceObjectAceObjectForProperty(self, @"filter");
}

- (void)setFilter:(id)a3
{
}

- (BOOL)mutatingCommand
{
  return AceObjectBoolForProperty(self, @"mutatingCommand");
}

- (void)setMutatingCommand:(BOOL)a3
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