@interface SAMLAuthZDecision
+ (id)createElement:(id *)a3;
- (NSArray)actions;
- (NSString)decision;
- (NSString)resource;
- (SAMLEvidence)evidence;
@end

@implementation SAMLAuthZDecision

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLAuthZDecision alloc] initWithTagName:@"AuthzDecisiontStatement" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)decision
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Decision"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)resource
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Resource"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSArray)actions
{
  return (NSArray *)[(XMLWrapperElement *)self getElementsByTagName:@"Action"];
}

- (SAMLEvidence)evidence
{
  return (SAMLEvidence *)[(XMLWrapperElement *)self firstElementByTagName:@"Element"];
}

@end