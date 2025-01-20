@interface NSObject(UIAccessibilityMathExpression)
- (uint64_t)accessibilityExpandMathEquation:()UIAccessibilityMathExpression;
@end

@implementation NSObject(UIAccessibilityMathExpression)

- (uint64_t)accessibilityExpandMathEquation:()UIAccessibilityMathExpression
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v5 = [[UIAccessibilityMathViewController alloc] initWithMathDictionary:v3];
    v6 = [MEMORY[0x1E4F42738] sharedApplication];
    v7 = [v6 accessibilityPresentingViewController];

    v8 = [v7 presentedViewController];
    if (v8)
    {
      v9 = v8;
      v20 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = [v8 viewControllers];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) mathDictionary];
            char v16 = [v15 isEqualToDictionary:v3];

            if (v16)
            {

              _AXLogWithFacility();
              v5 = v20;
              goto LABEL_14;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v5 = v20;
      [v9 pushViewController:v20 animated:1];
    }
    else
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
      [v9 pushViewController:v5 animated:0];
      v17 = [MEMORY[0x1E4F42738] sharedApplication];
      v18 = [v17 accessibilityPresentingViewController];

      [v18 presentViewController:v9 animated:1 completion:0];
    }
LABEL_14:
  }
  return isKindOfClass & 1;
}

@end