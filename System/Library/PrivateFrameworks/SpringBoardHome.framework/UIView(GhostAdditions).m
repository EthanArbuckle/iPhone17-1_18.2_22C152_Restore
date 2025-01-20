@interface UIView(GhostAdditions)
- (void)setFilterForUserInterface:()GhostAdditions;
@end

@implementation UIView(GhostAdditions)

- (void)setFilterForUserInterface:()GhostAdditions
{
  if (a3 == 1)
  {
    id v6 = [a1 layer];
    v3 = (void *)MEMORY[0x1E4F39BC0];
    v4 = (void *)MEMORY[0x1E4F3A2E0];
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    id v6 = [a1 layer];
    v3 = (void *)MEMORY[0x1E4F39BC0];
    v4 = (void *)MEMORY[0x1E4F3A2E8];
  }
  v5 = [v3 filterWithType:*v4];
  [v6 setCompositingFilter:v5];
}

@end