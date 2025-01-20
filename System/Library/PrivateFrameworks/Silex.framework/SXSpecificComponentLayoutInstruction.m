@interface SXSpecificComponentLayoutInstruction
+ (id)instructionWithIdentifier:(id)a3;
- (BOOL)isFulfilledForBlueprint:(id)a3;
- (NSString)componentIdentifier;
- (NSString)description;
@end

@implementation SXSpecificComponentLayoutInstruction

+ (id)instructionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (BOOL)isFulfilledForBlueprint:(id)a3
{
  id v4 = a3;
  v5 = [(SXSpecificComponentLayoutInstruction *)self componentIdentifier];
  v6 = [v4 componentBlueprintForComponentIdentifier:v5 includeChildren:1];

  LOBYTE(v5) = [v6 hasValidLayout];
  return (char)v5;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(SXSpecificComponentLayoutInstruction *)self componentIdentifier];
  id v4 = [v2 stringWithFormat:@"Require valid layout for component with identifier: %@", v3];

  return (NSString *)v4;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void).cxx_destruct
{
}

@end