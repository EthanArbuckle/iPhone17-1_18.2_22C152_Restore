@interface UINavigationController(VSAdditions)
- (void)vs_popToViewController:()VSAdditions animated:completion:;
@end

@implementation UINavigationController(VSAdditions)

- (void)vs_popToViewController:()VSAdditions animated:completion:
{
  id v8 = a3;
  v9 = a5;
  id v10 = v8;
  id v18 = v10;
  if (v10)
  {
    v11 = v10;
    while (1)
    {
      v12 = [a1 viewControllers];
      char v13 = [v12 containsObject:v11];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 parentViewController];

      v11 = (void *)v14;
      if (!v14) {
        goto LABEL_11;
      }
    }
    v15 = [a1 viewControllers];
    if ([v15 count])
    {
      v16 = [a1 topViewController];

      if (v16 != v11)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setCompletionBlock:v9];
        id v17 = (id)[a1 popToViewController:v11 animated:a4];
        [MEMORY[0x263F158F8] commit];
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_11:
  v9[2](v9);
LABEL_12:
}

@end