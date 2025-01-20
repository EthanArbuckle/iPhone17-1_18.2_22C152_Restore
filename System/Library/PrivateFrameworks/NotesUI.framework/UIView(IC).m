@interface UIView(IC)
+ (BOOL)ic_isRTL;
+ (uint64_t)ic_animateUsingSpringWithDampingRatio:()IC response:animations:completion:;
+ (uint64_t)ic_animateWithDuration:()IC timingFunction:animations:;
+ (void)ic_animateWithDuration:()IC timingFunction:animations:completion:;
- (BOOL)ic_inSidebar;
- (BOOL)ic_isRTL;
- (id)ic_appearanceInfo;
- (id)ic_enclosingScrollView;
- (id)ic_imageRenderedFromLayer;
- (id)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC fallback:;
- (id)ic_imageViewRenderedFromLayer;
- (id)ic_imageViewRenderedFromViewHierarchy;
- (id)ic_preferredContentSizeCategory;
- (id)ic_renderImage;
- (id)ic_renderImageView;
- (id)ic_viewControllerManager;
- (id)ic_window;
- (id)ic_windowScene;
- (uint64_t)ic_addAnchorsToFillSuperview;
- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC;
- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuide:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithPadding:()IC;
- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC;
- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuide:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:;
- (uint64_t)ic_addAnchorsToFillSuperviewWithVerticalPadding:()IC;
- (uint64_t)ic_applyRoundedCorners;
- (uint64_t)ic_applyRoundedCorners:()IC;
- (uint64_t)ic_applyRoundedCornersWithRadius:()IC;
- (uint64_t)ic_applyShadow;
- (uint64_t)ic_applyShadowWithRadius:()IC opacity:offset:;
- (uint64_t)ic_behavior;
- (uint64_t)ic_crashIfWindowIsSecure;
- (uint64_t)ic_directionalSafeAreaInsets;
- (uint64_t)ic_hasCompactHeight;
- (uint64_t)ic_hasCompactSize;
- (uint64_t)ic_hasCompactWidth;
- (uint64_t)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC;
- (uint64_t)ic_isInSecureWindow;
- (uint64_t)ic_removeRoundedCorners;
- (void)ic_addAnchorsToFillSuperviewLayoutMargins;
- (void)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:;
- (void)ic_addConstraintsToFillSuperview;
- (void)ic_applyRoundedCorners:()IC radius:;
- (void)ic_applyRoundedCornersFromView:()IC;
- (void)ic_applyRoundedCornersWithTopLeadingRadius:()IC topTrailingRadius:bottomLeadingRadius:bottomTrailingRadius:;
- (void)ic_applyShadowWithRadius:()IC opacity:offset:shadowPathIsBounds:;
- (void)ic_crashIfWindowIsSecure;
- (void)ic_isInSecureWindow;
- (void)ic_removeAllConstraintsForSubview:()IC;
- (void)ic_removeShadow;
- (void)setIc_preferredContentSizeCategory:()IC;
@end

@implementation UIView(IC)

- (uint64_t)ic_behavior
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_behavior");

  return v2;
}

- (uint64_t)ic_hasCompactWidth
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_hasCompactWidth");

  return v2;
}

- (uint64_t)ic_hasCompactHeight
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_hasCompactHeight");

  return v2;
}

- (void)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  v37[4] = *MEMORY[0x1E4F143B8];
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [a1 superview];
  uint64_t v16 = [v15 safeAreaLayoutGuide];
  if (a8) {
    v17 = (void *)v16;
  }
  else {
    v17 = v15;
  }
  v18 = (void *)v16;
  v36 = (void *)v16;
  uint64_t v19 = [v17 topAnchor];
  v35 = (void *)v19;
  uint64_t v20 = [v17 bottomAnchor];
  v33 = (void *)v20;
  if (a7) {
    v21 = v18;
  }
  else {
    v21 = v15;
  }
  v32 = [v21 leadingAnchor];
  v22 = [v21 trailingAnchor];
  v31 = (void *)MEMORY[0x1E4F28DC8];
  v34 = [a1 topAnchor];
  v23 = [v34 constraintEqualToAnchor:v19 constant:a4];
  v37[0] = v23;
  v24 = [a1 bottomAnchor];
  v25 = [v24 constraintEqualToAnchor:v20 constant:-a5];
  v37[1] = v25;
  v26 = [a1 leadingAnchor];
  v27 = [v26 constraintEqualToAnchor:v32 constant:a2];
  v37[2] = v27;
  v28 = [a1 trailingAnchor];
  v29 = [v28 constraintEqualToAnchor:v22 constant:-a3];
  v37[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v31 activateConstraints:v30];
}

- (id)ic_windowScene
{
  v1 = [a1 window];
  uint64_t v2 = [v1 windowScene];

  return v2;
}

- (uint64_t)ic_directionalSafeAreaInsets
{
  return [a1 safeAreaInsets];
}

- (BOOL)ic_isRTL
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

+ (BOOL)ic_isRTL
{
  return [MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1;
}

- (uint64_t)ic_addAnchorsToFillSuperview
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:", 0.0);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a4, a5, a5);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuide:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3, a4);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, a3, 0.0);
}

- (id)ic_viewControllerManager
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  id v10 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  performBlockOnMainThreadAndWait();
  v1 = objc_msgSend((id)v6[5], "ic_viewControllerManager", v3, 3221225472, __38__UIView_IC__ic_viewControllerManager__block_invoke, &unk_1E5FD91F8, a1, &v5);
  _Block_object_dispose(&v5, 8);

  return v1;
}

- (uint64_t)ic_isInSecureWindow
{
  uint64_t v2 = [a1 window];

  if (v2)
  {
    uint64_t v3 = [a1 window];
    v4 = [v3 screen];
    uint64_t v5 = objc_msgSend(v4, "ic_isSecure");

    return v5;
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UIView(IC) ic_isInSecureWindow](v7);
    }

    return 1;
  }
}

- (uint64_t)ic_crashIfWindowIsSecure
{
  uint64_t result = objc_msgSend(a1, "ic_isInSecureWindow");
  if (result)
  {
    uint64_t v2 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[UIView(IC) ic_crashIfWindowIsSecure](v2);
    }

    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Attempted to show notes during unsecure session."];
  }
  return result;
}

- (id)ic_appearanceInfo
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_appearanceInfo");

  return v2;
}

- (id)ic_window
{
  objc_opt_class();
  uint64_t v2 = [a1 window];
  uint64_t v3 = ICDynamicCast();
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = objc_msgSend(a1, "ic_windowScene");
    uint64_t v7 = [v6 windows];
    objc_msgSend(v7, "ic_firstObjectOfClass:", objc_opt_class());
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ic_enclosingScrollView
{
  id v1 = [a1 superview];
  if (v1)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 superview];

      id v1 = (id)v2;
      if (!v2) {
        goto LABEL_6;
      }
    }
    id v1 = v1;
  }
LABEL_6:

  return v1;
}

- (uint64_t)ic_applyRoundedCorners
{
  return objc_msgSend(a1, "ic_applyRoundedCornersWithRadius:", 12.0);
}

- (uint64_t)ic_applyRoundedCornersWithRadius:()IC
{
  return objc_msgSend(a1, "ic_applyRoundedCorners:radius:", -1);
}

- (uint64_t)ic_applyRoundedCorners:()IC
{
  return objc_msgSend(a1, "ic_applyRoundedCorners:radius:", 12.0);
}

- (void)ic_applyRoundedCorners:()IC radius:
{
  uint64_t v7 = [a1 layer];
  v8 = v7;
  if (a4 == -1)
  {
    [v7 setCornerRadius:a2];
  }
  else
  {
    [v7 setCornerRadius:0.0];

    v8 = [MEMORY[0x1E4F39C88] layer];
    v9 = (void *)MEMORY[0x1E4FB14C0];
    [a1 bounds];
    objc_msgSend(v9, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a4);
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPath:", objc_msgSend(v10, "CGPath"));
    v11 = [a1 layer];
    [v11 setMask:v8];
  }
  uint64_t v12 = *MEMORY[0x1E4F39EA8];
  v13 = [a1 layer];
  [v13 setCornerCurve:v12];

  id v14 = [a1 layer];
  [v14 setMasksToBounds:1];
}

- (void)ic_applyRoundedCornersWithTopLeadingRadius:()IC topTrailingRadius:bottomLeadingRadius:bottomTrailingRadius:
{
  uint64_t v10 = *MEMORY[0x1E4F39EA8];
  v11 = [a1 layer];
  [v11 setCornerCurve:v10];

  uint64_t v12 = [a1 effectiveUserInterfaceLayoutDirection];
  if (v12 == 1) {
    double v13 = a3;
  }
  else {
    double v13 = a2;
  }
  if (v12 == 1)
  {
    a3 = a2;
    double v14 = a4;
  }
  else
  {
    double v14 = a5;
  }
  if (v12 != 1) {
    a5 = a4;
  }
  v15 = [a1 layer];
  *(double *)uint64_t v16 = a5;
  *(double *)&v16[1] = a5;
  *(double *)&v16[2] = v14;
  *(double *)&v16[3] = v14;
  *(double *)&v16[4] = a3;
  *(double *)&v16[5] = a3;
  *(double *)&v16[6] = v13;
  *(double *)&v16[7] = v13;
  [v15 setCornerRadii:v16];
}

- (void)ic_applyRoundedCornersFromView:()IC
{
  id v4 = a3;
  id v5 = [v4 layer];
  v6 = [v5 cornerCurve];
  uint64_t v7 = [a1 layer];
  [v7 setCornerCurve:v6];

  v8 = [v4 layer];
  v9 = v8;
  if (v8)
  {
    [v8 cornerRadii];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  uint64_t v10 = [a1 layer];
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  v14[3] = v18;
  [v10 setCornerRadii:v14];

  v11 = [v4 layer];
  uint64_t v12 = [v11 masksToBounds];
  double v13 = [a1 layer];
  [v13 setMasksToBounds:v12];
}

- (uint64_t)ic_removeRoundedCorners
{
  return objc_msgSend(a1, "ic_applyRoundedCornersWithRadius:", 0.0);
}

- (uint64_t)ic_applyShadow
{
  return objc_msgSend(a1, "ic_applyShadowWithRadius:opacity:offset:", 12.0, 0.04, 0.0, 4.0);
}

- (uint64_t)ic_applyShadowWithRadius:()IC opacity:offset:
{
  return objc_msgSend(a1, "ic_applyShadowWithRadius:opacity:offset:shadowPathIsBounds:", 1);
}

- (void)ic_applyShadowWithRadius:()IC opacity:offset:shadowPathIsBounds:
{
  id v13 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v14 = [v13 CGColor];
  long long v15 = [a1 layer];
  [v15 setShadowColor:v14];

  long long v16 = [a1 layer];
  [v16 setShadowRadius:a2];

  long long v17 = [a1 layer];
  *(float *)&a3 = a3;
  LODWORD(v18) = LODWORD(a3);
  [v17 setShadowOpacity:v18];

  uint64_t v19 = [a1 layer];
  objc_msgSend(v19, "setShadowOffset:", a4, a5);

  id v20 = [a1 layer];
  [v20 setShadowPathIsBounds:a7];
}

- (void)ic_removeShadow
{
  uint64_t v2 = [a1 layer];
  [v2 setShadowColor:0];

  id v3 = [a1 layer];
  [v3 setShadowOpacity:0.0];
}

- (BOOL)ic_inSidebar
{
  uint64_t v2 = [a1 traitCollection];
  if ([v2 _splitViewControllerContext] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [a1 traitCollection];
    BOOL v3 = [v4 _splitViewControllerContext] == 2;
  }
  return v3;
}

- (uint64_t)ic_hasCompactSize
{
  id v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_hasCompactSize");

  return v2;
}

- (id)ic_preferredContentSizeCategory
{
  uint64_t v2 = [a1 minimumContentSizeCategory];
  BOOL v3 = [a1 maximumContentSizeCategory];
  if (UIContentSizeCategoryCompareToCategory(v2, v3))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [a1 minimumContentSizeCategory];
  }

  return v4;
}

- (void)setIc_preferredContentSizeCategory:()IC
{
  id v4 = a3;
  [a1 setMinimumContentSizeCategory:v4];
  [a1 setMaximumContentSizeCategory:v4];
}

- (id)ic_imageRenderedFromLayer
{
  uint64_t v2 = [a1 layer];
  [v2 layoutIfNeeded];

  BOOL v3 = [MEMORY[0x1E4FB17E0] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 bounds];
  uint64_t v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__UIView_IC__ic_imageRenderedFromLayer__block_invoke;
  v10[3] = &unk_1E5FD8F70;
  v10[4] = a1;
  v8 = [v7 imageWithActions:v10];

  return v8;
}

- (uint64_t)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC
{
  return objc_msgSend(a1, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:fallback:", a3, 0);
}

- (id)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC fallback:
{
  id v6 = a4;
  uint64_t v7 = [a1 layer];
  [v7 layoutIfNeeded];

  v8 = [MEMORY[0x1E4FB17E0] defaultFormat];
  id v9 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 bounds];
  uint64_t v12 = objc_msgSend(v9, "initWithSize:format:", v8, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__UIView_IC__ic_imageRenderedFromViewHierarchyAfterScreenUpdates_fallback___block_invoke;
  v16[3] = &unk_1E5FDBA50;
  char v18 = a3;
  v16[4] = a1;
  id v17 = v6;
  id v13 = v6;
  uint64_t v14 = [v12 imageWithActions:v16];

  return v14;
}

- (id)ic_imageViewRenderedFromLayer
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  [a1 bounds];
  BOOL v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "ic_imageRenderedFromLayer");
  [v3 setImage:v4];

  return v3;
}

- (id)ic_imageViewRenderedFromViewHierarchy
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  [a1 bounds];
  BOOL v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:", 0);
  [v3 setImage:v4];

  return v3;
}

- (void)ic_removeAllConstraintsForSubview:()IC
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(a1, "constraints", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 firstItem];
        if ((id)v12 == v4)
        {
        }
        else
        {
          id v13 = (void *)v12;
          id v14 = [v11 secondItem];

          if (v14 != v4) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [a1 removeConstraints:v5];
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 0, 0, a3, a4, 0.0);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithVerticalPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, 0.0, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 1, 1);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuide:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a4, a6, a3, a5);
}

- (void)ic_addAnchorsToFillSuperviewLayoutMargins
{
  v18[4] = *MEMORY[0x1E4F143B8];
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v17 = [a1 superview];
  id v2 = [v17 layoutMarginsGuide];
  uint64_t v12 = (void *)MEMORY[0x1E4F28DC8];
  long long v16 = [a1 topAnchor];
  long long v15 = [v2 topAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v18[0] = v14;
  id v13 = [a1 bottomAnchor];
  BOOL v3 = [v2 bottomAnchor];
  id v4 = [v13 constraintEqualToAnchor:v3];
  v18[1] = v4;
  double v5 = [a1 leadingAnchor];
  id v6 = [v2 leadingAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  v18[2] = v7;
  uint64_t v8 = [a1 trailingAnchor];
  uint64_t v9 = [v2 trailingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  v18[3] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  [v12 activateConstraints:v11];
}

- (void)ic_addConstraintsToFillSuperview
{
  id v1 = a1;
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  _NSDictionaryOfVariableBindings(&cfstr_View_0.isa, v1, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v2 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v3 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v6];
  [v2 activateConstraints:v3];

  id v4 = (void *)MEMORY[0x1E4F28DC8];
  double v5 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v6];
  [v4 activateConstraints:v5];
}

- (id)ic_renderImage
{
  id v2 = [a1 layer];
  [v2 layoutIfNeeded];

  BOOL v3 = [MEMORY[0x1E4FB17E0] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 bounds];
  uint64_t v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__UIView_IC__ic_renderImage__block_invoke;
  v10[3] = &unk_1E5FD8F70;
  v10[4] = a1;
  uint64_t v8 = [v7 imageWithActions:v10];

  return v8;
}

- (id)ic_renderImageView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  [a1 bounds];
  BOOL v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "ic_renderImage");
  [v3 setImage:v4];

  return v3;
}

+ (uint64_t)ic_animateWithDuration:()IC timingFunction:animations:
{
  return objc_msgSend(a1, "ic_animateWithDuration:timingFunction:animations:completion:", a3, a4, 0);
}

+ (void)ic_animateWithDuration:()IC timingFunction:animations:completion:
{
  id v9 = a6;
  if (a5)
  {
    double v10 = (void *)MEMORY[0x1E4F39CF8];
    id v11 = a5;
    id v12 = a4;
    [v10 begin];
    [MEMORY[0x1E4F39CF8] setAnimationTimingFunction:v12];

    id v13 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__UIView_IC__ic_animateWithDuration_timingFunction_animations_completion___block_invoke;
    v14[3] = &unk_1E5FD9DF0;
    id v15 = v9;
    [v13 animateWithDuration:v11 animations:v14 completion:a1];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

+ (uint64_t)ic_animateUsingSpringWithDampingRatio:()IC response:animations:completion:
{
  return [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:0 response:a5 tracking:a6 dampingRatioSmoothing:a1 responseSmoothing:a2 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

- (void)ic_isInSecureWindow
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "It is invalid to call ic_isInSecureWindow for views that don't have a window.", v1, 2u);
}

- (void)ic_crashIfWindowIsSecure
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Attempted to show notes during unsecure session.", v1, 2u);
}

@end