@interface LNFullyQualifiedActionIdentifier(Workflow)
- (id)compositeIdentifier;
@end

@implementation LNFullyQualifiedActionIdentifier(Workflow)

- (id)compositeIdentifier
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 bundleIdentifier];
  v7[0] = v2;
  v3 = [a1 actionIdentifier];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v5 = [v4 componentsJoinedByString:@"."];

  return v5;
}

@end