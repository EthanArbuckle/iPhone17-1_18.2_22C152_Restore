@interface SASVPolicyAction
+ (id)policyAction;
- (NSString)name;
- (SASVPolicyActionNode)policyActionRoot;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setName:(id)a3;
- (void)setPolicyActionRoot:(id)a3;
@end

@implementation SASVPolicyAction

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"PolicyAction";
}

+ (id)policyAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SASVPolicyActionNode)policyActionRoot
{
  return (SASVPolicyActionNode *)AceObjectAceObjectForProperty(self, @"policyActionRoot");
}

- (void)setPolicyActionRoot:(id)a3
{
}

@end