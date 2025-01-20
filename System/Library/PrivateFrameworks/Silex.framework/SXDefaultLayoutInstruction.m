@interface SXDefaultLayoutInstruction
+ (id)instruction;
- (BOOL)isFulfilledForBlueprint:(id)a3;
- (NSString)description;
@end

@implementation SXDefaultLayoutInstruction

+ (id)instruction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)isFulfilledForBlueprint:(id)a3
{
  v3 = [a3 rootLayoutBlueprint];
  char v4 = [v3 isComplete];

  return v4;
}

- (NSString)description
{
  return (NSString *)@"Require entire layout to be valid";
}

@end