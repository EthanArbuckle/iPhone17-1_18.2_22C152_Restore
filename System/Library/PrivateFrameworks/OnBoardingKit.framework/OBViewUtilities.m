@interface OBViewUtilities
+ (BOOL)_navigationBarTitleShouldShowForHeaderView:(id)a3 inScrollView:(id)a4;
+ (BOOL)shouldUpdateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5;
+ (BOOL)shouldUseAccessibilityLayout;
+ (id)pointImageOfColor:(id)a3;
+ (int64_t)activeInterfaceOrientationForView:(id)a3;
+ (void)updateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5 animated:(BOOL)a6;
@end

@implementation OBViewUtilities

+ (void)updateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 headerLabel];
  uint64_t v13 = [v12 text];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v10 headerLabel];
    v16 = [v15 text];
    char v17 = [v16 isEqualToString:&stru_1EEC28768];

    if ((v17 & 1) == 0)
    {
      BOOL v18 = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:v10 inScrollView:v11];
      v19 = [v10 headerLabel];
      v20 = v19;
      if (v18)
      {
        v21 = [v19 text];
        [v9 setTitle:v21];
      }
      else
      {
        [v19 setAlpha:1.0];
      }

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke;
      v37[3] = &unk_1E58AEB80;
      BOOL v40 = v18;
      id v22 = v10;
      id v38 = v22;
      id v23 = v9;
      id v39 = v23;
      v24 = (void (**)(void))MEMORY[0x19F392650](v37);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_2;
      v33[3] = &unk_1E58AEA10;
      id v34 = v22;
      id v25 = v11;
      id v35 = v25;
      id v36 = v23;
      v26 = (void (**)(void))MEMORY[0x19F392650](v33);
      v27 = [v25 panGestureRecognizer];
      [v27 velocityInView:v25];
      double v29 = v28;

      if (v6 && v29 > -300.0)
      {
        v30 = (void *)MEMORY[0x1E4FB1EB0];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_3;
        v31[3] = &unk_1E58AEBA8;
        v32 = v26;
        [v30 animateWithDuration:4 delay:v24 options:v31 animations:0.25 completion:0.0];
      }
      else
      {
        v24[2](v24);
        v26[2](v26);
      }
    }
  }
  else
  {
  }
}

void __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) headerLabel];
  v4 = v3;
  if (v2)
  {
    [v3 setAlpha:0.0];

    v5 = [*(id *)(a1 + 40) titleView];
    double v6 = 1.0;
  }
  else
  {
    [v3 setAlpha:1.0];

    v5 = [*(id *)(a1 + 40) titleView];
    double v6 = 0.0;
  }
  id v7 = v5;
  [v5 setAlpha:v6];
}

uint64_t __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_2(void *a1)
{
  uint64_t result = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:a1[4] inScrollView:a1[5]];
  if ((result & 1) == 0)
  {
    v3 = (void *)a1[6];
    return [v3 setTitle:0];
  }
  return result;
}

uint64_t __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)shouldUpdateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 headerLabel];
  [v10 frame];
  objc_msgSend(v8, "convertRect:fromView:", v9);
  double v12 = v11;

  [v8 safeAreaInsets];
  double v14 = v13;
  [v8 contentOffset];
  int v16 = v14 + v15 > 0.0 && v14 + v15 > v12;
  int v17 = [v7 _backgroundHidden];
  int v18 = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:v9 inScrollView:v8];

  v19 = [v7 title];
  if (v19)
  {
    v20 = [v7 titleView];
    [v20 alpha];
    int v22 = v21 == 0.0;
  }
  else
  {
    int v22 = 0;
  }

  BOOL v23 = v17 == v16 || v22 == v18;
  return v23;
}

+ (BOOL)_navigationBarTitleShouldShowForHeaderView:(id)a3 inScrollView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 headerLabel];
  [v7 frame];
  objc_msgSend(v5, "convertRect:fromView:", v6);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  double MaxY = CGRectGetMaxY(v26);
  int v17 = [v6 headerLabel];

  int v18 = [v17 font];
  [v18 descender];
  double v20 = MaxY + v19;

  [v5 safeAreaInsets];
  double v22 = v21;
  [v5 contentOffset];
  double v24 = v23;

  return v22 + v24 > 0.0 && v22 + v24 >= v20;
}

+ (id)pointImageOfColor:(id)a3
{
  id v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 set];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v4;
}

+ (BOOL)shouldUseAccessibilityLayout
{
  int v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) > NSOrderedSame;
  return (char)v2;
}

+ (int64_t)activeInterfaceOrientationForView:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v4 isFrontBoard])
  {

LABEL_4:
    CGRect v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v9 = [v8 activeInterfaceOrientation];
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.springboard"];

  if (v7) {
    goto LABEL_4;
  }
  double v12 = [v3 window];

  if (!v12)
  {
    CGRect v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    CGFloat v13 = [v8 windows];
    double v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
    CGFloat v15 = [v13 filteredArrayUsingPredicate:v14];
    int v16 = [v15 firstObject];
    int64_t v10 = [v16 interfaceOrientation];

    goto LABEL_6;
  }
  CGRect v8 = [v3 window];
  uint64_t v9 = [v8 interfaceOrientation];
LABEL_5:
  int64_t v10 = v9;
LABEL_6:

  return v10;
}

uint64_t __53__OBViewUtilities_activeInterfaceOrientationForView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isKeyWindow];
}

@end