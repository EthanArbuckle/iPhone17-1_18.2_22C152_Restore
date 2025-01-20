@interface UINavigationController(PKAppearanceObject)
- (id)pk_childrenForAppearance;
@end

@implementation UINavigationController(PKAppearanceObject)

- (id)pk_childrenForAppearance
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 navigationBar];
  v10[0] = v2;
  v3 = [a1 view];
  v10[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v5 = [a1 childViewControllers];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  v8 = [v4 arrayByAddingObjectsFromArray:v7];

  return v8;
}

@end