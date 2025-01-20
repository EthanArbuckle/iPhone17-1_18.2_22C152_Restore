@interface SACFFlowCompleted
+ (id)flowCompleted;
- (BOOL)requiresResponse;
- (NSString)domain;
- (SACFProvideContext)updateContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomain:(id)a3;
- (void)setUpdateContext:(id)a3;
@end

@implementation SACFFlowCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"FlowCompleted";
}

+ (id)flowCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (SACFProvideContext)updateContext
{
  return (SACFProvideContext *)AceObjectAceObjectForProperty(self, @"updateContext");
}

- (void)setUpdateContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end