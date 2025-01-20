@interface UIViewController(PKAppearanceObject)
- (id)pk_childrenForAppearance;
@end

@implementation UIViewController(PKAppearanceObject)

- (id)pk_childrenForAppearance
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 view];
  v9[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v4 = [a1 childViewControllers];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = [v3 arrayByAddingObjectsFromArray:v6];

  return v7;
}

@end