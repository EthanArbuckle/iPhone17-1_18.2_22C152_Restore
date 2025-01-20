@interface UIView(SafariServicesExtras)
+ (BOOL)_sf_usesLeftToRightLayoutOnView:()SafariServicesExtras;
+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:;
+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:;
+ (void)_sf_cancelLinkAnimationsOnSourceWindow:()SafariServicesExtras destinationWindow:;
+ (void)_sf_performLinkAnimation:()SafariServicesExtras onView:;
+ (void)safari_performWithoutRetargetingAnimations:()SafariServicesExtras;
- (BOOL)_sf_hasLandscapeAspectRatio;
- (BOOL)_sf_isFullScreenHeight;
- (BOOL)_sf_isFullScreenWidth;
- (double)_sf_bottomUnsafeAreaFrame;
- (double)_sf_bottomUnsafeAreaFrameForToolbar;
- (double)_sf_convertY:()SafariServicesExtras toCoordinateSpace:;
- (double)_sf_safeAreaBounds;
- (double)_sf_safeAreaInsetsFlippedForLayoutDirectionality;
- (id)_sf_firstAncestorViewOfClass:()SafariServicesExtras;
- (id)_sf_viewAncestrySummaryWithMinDepth:()SafariServicesExtras paddingLevel:;
- (id)safari_snapshotImageFromIOSurfaceInRect:()SafariServicesExtras;
- (id)sf_commonAncestrySummaryWithView:()SafariServicesExtras;
- (id)sf_privacyPreservingDescription;
- (uint64_t)_sf_depth;
- (uint64_t)_sf_setMatchesIntrinsicContentSize;
- (uint64_t)_sf_snapshotImageFromIOSurface;
- (uint64_t)_sf_usesLeftToRightLayout;
- (uint64_t)sf_applyContentSizeCategoryLimitsForToolbarButton;
- (uint64_t)sf_viewAncestrySummary;
- (void)_sf_addEdgeMatchedSubview:()SafariServicesExtras;
- (void)_sf_addInteractionUnlessNil:()SafariServicesExtras;
- (void)_sf_setOrderedSubviews:()SafariServicesExtras count:;
@end

@implementation UIView(SafariServicesExtras)

- (void)_sf_addInteractionUnlessNil:()SafariServicesExtras
{
  if (a3) {
    return objc_msgSend(a1, "addInteraction:");
  }
  return a1;
}

- (double)_sf_safeAreaBounds
{
  [a1 bounds];
  double v3 = v2;
  [a1 safeAreaInsets];
  return v3 + v4;
}

- (uint64_t)_sf_usesLeftToRightLayout
{
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "_sf_usesLeftToRightLayoutOnView:", a1);
}

+ (BOOL)_sf_usesLeftToRightLayoutOnView:()SafariServicesExtras
{
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a3, "semanticContentAttribute")) == 0;
}

- (uint64_t)sf_applyContentSizeCategoryLimitsForToolbarButton
{
  [a1 setMinimumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  uint64_t v2 = *MEMORY[0x1E4FB27B8];

  return [a1 setMaximumContentSizeCategory:v2];
}

- (BOOL)_sf_isFullScreenWidth
{
  uint64_t v2 = [a1 _screen];
  uint64_t v3 = [a1 window];
  double v4 = (void *)v3;
  if (v3) {
    v5 = (void *)v3;
  }
  else {
    v5 = a1;
  }
  id v6 = v5;

  BOOL v7 = 0;
  if (v2 && v6)
  {
    [v2 bounds];
    double Width = CGRectGetWidth(v10);
    [v6 bounds];
    BOOL v7 = Width == CGRectGetWidth(v11);
  }

  return v7;
}

+ (void)safari_performWithoutRetargetingAnimations:()SafariServicesExtras
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__UIView_SafariServicesExtras__safari_performWithoutRetargetingAnimations___block_invoke;
  v6[3] = &unk_1E54EA698;
  id v7 = v4;
  v8 = a1;
  id v5 = v4;
  [a1 performWithoutAnimation:v6];
}

- (void)_sf_setOrderedSubviews:()SafariServicesExtras count:
{
  id v7 = [a1 subviews];
  v8 = [MEMORY[0x1E4F28E60] indexSet];
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      if (a3[v9]) {
        [v8 addIndex:v9];
      }
      ++v9;
    }
    while (a4 != v9);
  }
  uint64_t v10 = [v8 count];
  if (v10 != [v7 count]) {
    goto LABEL_8;
  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__UIView_SafariServicesExtras___sf_setOrderedSubviews_count___block_invoke;
  v13[3] = &unk_1E54EA638;
  v17 = a3;
  id v14 = v7;
  v15 = v22;
  v16 = &v18;
  [v8 enumerateIndexesUsingBlock:v13];
  int v11 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
  if (!v11)
  {
LABEL_8:
    if (a4)
    {
      uint64_t v12 = 0;
      do
      {
        if (*a3) {
          [a1 insertSubview:*a3 atIndex:v12++];
        }
        ++a3;
        --a4;
      }
      while (a4);
    }
  }
}

- (id)_sf_firstAncestorViewOfClass:()SafariServicesExtras
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 superview];

      id v1 = (id)v2;
    }
    while (v2);
  }

  return v1;
}

- (BOOL)_sf_hasLandscapeAspectRatio
{
  [a1 frame];
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  double v5 = CGRectGetWidth(v7);
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return v5 > CGRectGetHeight(v8);
}

+ (void)_sf_cancelLinkAnimationsOnSourceWindow:()SafariServicesExtras destinationWindow:
{
  id v5 = a4;
  id v6 = a3;
  objc_getAssociatedObject(v6, &linkAnimationContainerLayerAssociatedObjectKey);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, &linkAnimationContainerLayerAssociatedObjectKey, 0, (void *)1);

  [v8 removeFromSuperlayer];
  CGRect v7 = objc_getAssociatedObject(v5, &linkAnimationDestinationLayerAssociatedObjectKey);
  objc_setAssociatedObject(v5, &linkAnimationDestinationLayerAssociatedObjectKey, 0, (void *)1);

  [v7 removeAnimationForKey:@"SafariLinkAnimation"];
}

- (BOOL)_sf_isFullScreenHeight
{
  uint64_t v2 = [a1 _screen];
  uint64_t v3 = [a1 window];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (void *)v3;
  }
  else {
    id v5 = a1;
  }
  id v6 = v5;

  BOOL v7 = 0;
  if (v2 && v6)
  {
    [v2 bounds];
    double Height = CGRectGetHeight(v10);
    [v6 bounds];
    BOOL v7 = Height == CGRectGetHeight(v11);
  }

  return v7;
}

- (double)_sf_safeAreaInsetsFlippedForLayoutDirectionality
{
  [a1 safeAreaInsets];
  double v3 = v2;
  objc_msgSend(a1, "_sf_usesLeftToRightLayout");
  return v3;
}

- (double)_sf_bottomUnsafeAreaFrame
{
  [a1 bounds];
  double v3 = v2;
  CGFloat rect = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [a1 safeAreaInsets];
  CGFloat v11 = v3 + v10;
  CGFloat v13 = v5 + v12;
  CGFloat v15 = v7 - (v10 + v14);
  CGFloat v17 = v9 - (v12 + v16);
  v21.origin.CGFloat x = v3 + v10;
  v21.origin.CGFloat y = v13;
  v21.size.CGFloat width = v15;
  v21.size.CGFloat height = v17;
  double rect_8 = CGRectGetMinX(v21);
  v22.origin.CGFloat x = v11;
  v22.origin.CGFloat y = v13;
  v22.size.CGFloat width = v15;
  v22.size.CGFloat height = v17;
  CGRectGetMaxY(v22);
  v23.origin.CGFloat x = v11;
  v23.origin.CGFloat y = v13;
  v23.size.CGFloat width = v15;
  v23.size.CGFloat height = v17;
  CGRectGetWidth(v23);
  v24.origin.CGFloat x = rect;
  v24.origin.CGFloat y = v5;
  v24.size.CGFloat width = v7;
  v24.size.CGFloat height = v9;
  CGRectGetHeight(v24);
  v25.origin.CGFloat x = v11;
  v25.origin.CGFloat y = v13;
  v25.size.CGFloat width = v15;
  v25.size.CGFloat height = v17;
  CGRectGetMaxY(v25);
  return rect_8;
}

- (double)_sf_bottomUnsafeAreaFrameForToolbar
{
  objc_msgSend(a1, "_sf_bottomUnsafeAreaFrame");
  double v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if ((_SFDeviceHasHomeButton() & 1) == 0 && _SFDeviceIsPad())
  {
    v10.origin.CGFloat x = v2;
    v10.origin.CGFloat y = v4;
    v10.size.CGFloat width = v6;
    v10.size.CGFloat height = v8;
    CGRectGetHeight(v10);
  }
  return v2;
}

- (id)sf_privacyPreservingDescription
{
  double v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = objc_opt_class();
  [a1 bounds];
  CGFloat v4 = NSStringFromCGRect(v13);
  [a1 center];
  double v5 = NSStringFromCGPoint(v12);
  CGFloat v6 = [v2 stringWithFormat:@"<%@: %p bounds = %@; center = %@", v3, a1, v4, v5];;

  memset(&v10, 0, sizeof(v10));
  [a1 transform];
  CGAffineTransform transform = v10;
  if (!CGAffineTransformIsIdentity(&transform))
  {
    CGAffineTransform transform = v10;
    double v7 = NSStringFromCGAffineTransform(&transform);
    [v6 appendFormat:@"; CGAffineTransform transform = %@", v7];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)_sf_viewAncestrySummaryWithMinDepth:()SafariServicesExtras paddingLevel:
{
  double v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = objc_msgSend(a1, "_sf_depth");
  id v9 = a1;
  if (v9)
  {
    CGAffineTransform v10 = v9;
    if (v8 >= a3) {
      uint64_t v11 = a3;
    }
    else {
      uint64_t v11 = v8;
    }
    uint64_t v12 = ~v8 + v11;
    do
    {
      CGRect v13 = objc_msgSend(v10, "sf_privacyPreservingDescription");
      [v7 insertObject:v13 atIndex:0];

      if (__CFADD__(v12++, 1)) {
        break;
      }
      uint64_t v15 = [v10 superview];

      CGAffineTransform v10 = (void *)v15;
    }
    while (v15);
  }
  double v16 = [MEMORY[0x1E4F28E78] string];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__UIView_SafariServicesExtras___sf_viewAncestrySummaryWithMinDepth_paddingLevel___block_invoke;
  v22[3] = &unk_1E54EA610;
  uint64_t v25 = a4;
  id v17 = v16;
  id v23 = v17;
  CGRect v24 = v7;
  id v18 = v7;
  [v18 enumerateObjectsUsingBlock:v22];
  v19 = v24;
  id v20 = v17;

  return v20;
}

- (uint64_t)sf_viewAncestrySummary
{
  return objc_msgSend(a1, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", 0, 0);
}

- (uint64_t)_sf_depth
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  double v2 = v1;
  uint64_t v3 = 0;
  do
  {
    ++v3;
    uint64_t v4 = [v2 superview];

    double v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)sf_commonAncestrySummaryWithView:()SafariServicesExtras
{
  id v4 = a3;
  double v5 = v4;
  if (!v4 || v4 == a1)
  {
    CGRect v22 = objc_msgSend(a1, "sf_viewAncestrySummary");
  }
  else
  {
    uint64_t v6 = objc_msgSend(a1, "_sf_depth");
    uint64_t v7 = objc_msgSend(v5, "_sf_depth");
    if (v6 <= v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v6;
    }
    if (v6 <= v7) {
      id v9 = a1;
    }
    else {
      id v9 = v5;
    }
    if (v6 <= v7) {
      CGAffineTransform v10 = v5;
    }
    else {
      CGAffineTransform v10 = a1;
    }
    if (v6 >= v7) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = v6;
    }
    id v12 = v9;
    id v13 = v10;
    id v14 = v13;
    if (v8 > v11)
    {
      do
      {
        uint64_t v15 = v14;
        --v8;
        id v14 = [v14 superview];
      }
      while (v8 > v11);
      uint64_t v8 = v11;
    }
    if (v12) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    char v17 = v16;
    if (v16 || v12 == v14)
    {
      id v18 = v12;
    }
    else
    {
      id v18 = v12;
      do
      {
        v19 = v18;
        id v20 = v14;
        --v8;
        id v18 = [v18 superview];

        id v14 = [v14 superview];

        if (v18) {
          BOOL v21 = v14 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        char v17 = v21;
      }
      while (!v21 && v18 != v14);
    }
    id v23 = NSString;
    if (v17)
    {
      CGRect v24 = objc_msgSend(a1, "sf_viewAncestrySummary");
      objc_msgSend(v5, "sf_viewAncestrySummary");
    }
    else
    {
      CGRect v24 = objc_msgSend(v12, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", v8, 0);
      objc_msgSend(v13, "_sf_viewAncestrySummaryWithMinDepth:paddingLevel:", v8 + 1, 1);
    uint64_t v25 = };
    CGRect v22 = [v23 stringWithFormat:@"%@\n%@", v24, v25];
  }

  return v22;
}

- (double)_sf_convertY:()SafariServicesExtras toCoordinateSpace:
{
  [a1 convertPoint:0.0 toCoordinateSpace:a2];
  return v2;
}

- (uint64_t)_sf_snapshotImageFromIOSurface
{
  [a1 bounds];

  return objc_msgSend(a1, "safari_snapshotImageFromIOSurfaceInRect:");
}

- (id)safari_snapshotImageFromIOSurfaceInRect:()SafariServicesExtras
{
  id v1 = objc_msgSend(a1, "_imageFromRect:");
  if ([v1 ioSurface])
  {
    double v2 = (const void *)UICreateCGImageFromIOSurface();
    uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
    [v1 scale];
    uint64_t v5 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);

    CFRelease(v2);
    id v1 = (void *)v5;
  }

  return v1;
}

- (uint64_t)_sf_setMatchesIntrinsicContentSize
{
  LODWORD(a2) = 1148846080;
  [a1 setContentCompressionResistancePriority:0 forAxis:a2];
  LODWORD(v3) = 1148846080;
  [a1 setContentHuggingPriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [a1 setContentCompressionResistancePriority:1 forAxis:v4];
  LODWORD(v5) = 1148846080;

  return [a1 setContentHuggingPriority:1 forAxis:v5];
}

- (void)_sf_addEdgeMatchedSubview:()SafariServicesExtras
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v4];
  uint64_t v15 = (void *)MEMORY[0x1E4F28DC8];
  id v18 = [v4 leadingAnchor];
  char v17 = [a1 leadingAnchor];
  BOOL v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  double v5 = [v4 trailingAnchor];
  uint64_t v6 = [a1 trailingAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  uint64_t v8 = [v4 topAnchor];
  id v9 = [a1 topAnchor];
  CGAffineTransform v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  uint64_t v11 = [v4 bottomAnchor];

  id v12 = [a1 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v15 activateConstraints:v14];
}

+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:
{
  id v26 = a14;
  id v27 = a13;
  id v28 = a12;
  id v38 = a11;
  id v29 = a9;
  [v29 size];
  double v31 = v30;
  double v33 = v32;
  double v34 = floor(a2 - v30 * 0.5);
  double v35 = floor(a3 - v32 * 0.5);
  id v36 = v29;
  uint64_t v37 = [v36 CGImage];

  objc_msgSend(a1, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v37, a10, v38, v28, v27, v26, v34, v35, v31, v33, a4, a5, a6, a7);
}

+ (void)_sf_animateLinkImage:()SafariServicesExtras withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v107 = a14;
  id aBlock = a16;
  id v25 = a15;
  id v26 = a13;
  id v27 = [v26 window];
  id v28 = [v107 window];
  v102 = a1;
  objc_msgSend(a1, "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", v27, v28);
  id v29 = [v27 layer];
  v106 = [v28 layer];
  id v30 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  v118 = @"sublayers";
  double v31 = [MEMORY[0x1E4F1CA98] null];
  v119[0] = v31;
  double v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:&v118 count:1];
  [v30 setActions:v32];

  [v29 addSublayer:v30];
  id v33 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  double v34 = [v26 layer];

  objc_msgSend(v34, "convertRect:toLayer:", v30, a2, a3, a4, a5);
  objc_msgSend(v33, "setFrame:");

  [v33 setContents:a11];
  [v30 addSublayer:v33];
  double v35 = [MEMORY[0x1E4F39B38] animation];
  id v36 = v25;
  uint64_t v37 = _Block_copy(v25);

  [v35 setValue:v37 forKey:@"afterImageDisappearsKey"];
  [v35 setValue:v33 forKey:@"layer"];
  objc_msgSend(v35, "setDuration:");
  UIAnimationDragCoefficient();
  *(float *)&double v39 = 1.0 / v38;
  [v35 setSpeed:v39];
  CAFrameRateRange v120 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v35, "setPreferredFrameRateRange:", *(double *)&v120.minimum, *(double *)&v120.maximum, *(double *)&v120.preferred);
  [v35 setHighFrameRateReason:1638403];
  v40 = [v107 layer];
  [v29 bounds];
  objc_msgSend(v29, "convertRect:toLayer:", v30);
  double v95 = v41;
  [v106 bounds];
  objc_msgSend(v27, "convertRect:fromWindow:", v28);
  v104 = v29;
  objc_msgSend(v29, "convertRect:toLayer:", v30);
  CGFloat v92 = v43;
  CGFloat v93 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  [v33 position];
  double v49 = v48;
  CGFloat y = v50;
  v124.origin.CGFloat x = a6;
  v124.origin.CGFloat y = a7;
  v124.size.CGFloat width = a8;
  v124.size.CGFloat height = a9;
  double MidX = CGRectGetMidX(v124);
  v125.origin.CGFloat x = a6;
  v125.origin.CGFloat y = a7;
  v125.size.CGFloat width = a8;
  v125.size.CGFloat height = a9;
  v99 = v28;
  v101 = v27;
  objc_msgSend(v27, "convertPoint:fromWindow:", v28, MidX, CGRectGetMidY(v125));
  objc_msgSend(v40, "convertPoint:toLayer:", v30);
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  double v56 = (v49 + v52) * 0.5;
  if (a12 == 1) {
    CGFloat v57 = v56;
  }
  else {
    CGFloat v57 = v53;
  }
  v126.origin.CGFloat y = v92;
  v126.origin.CGFloat x = v93;
  v126.size.CGFloat width = v45;
  v126.size.CGFloat height = v47;
  CGFloat MinY = CGRectGetMinY(v126);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v49, y);
  CGPathAddQuadCurveToPoint(Mutable, 0, v57, MinY, v53, v55);
  CGPathAddLineToPoint(Mutable, 0, v53, v55 + 8.0);
  CGPathAddLineToPoint(Mutable, 0, v53, v55 + -2.66666667);
  CGPathAddLineToPoint(Mutable, 0, v53, v55);
  v60 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
  [v60 setKeyTimes:&unk_1EDA42730];
  v61 = linkImageAnimationTimingFunctions();
  [v60 setTimingFunctions:v61];

  [v60 setPath:Mutable];
  [v60 setDuration:0.9];
  CAFrameRateRange v121 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v60, "setPreferredFrameRateRange:", *(double *)&v121.minimum, *(double *)&v121.maximum, *(double *)&v121.preferred);
  [v60 setHighFrameRateReason:1638403];
  CGPathRelease(Mutable);
  v117[0] = v60;
  if (v33) {
    [v33 transform];
  }
  else {
    memset(&v113, 0, sizeof(v113));
  }
  v62 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  CATransform3D v116 = v113;
  v63 = [MEMORY[0x1E4F29238] valueWithBytes:&v116 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v62 setFromValue:v63];

  v64 = (void *)MEMORY[0x1E4F29238];
  CATransform3D v114 = v113;
  CATransform3DRotate(&v115, &v114, (v53 - v49) / v95 * 0.167 * 3.14159265, 0.0, 0.0, 1.0);
  v65 = [v64 valueWithBytes:&v115 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v62 setToValue:v65];

  [v62 setDuration:0.9];
  [v62 setAdditive:1];
  CAFrameRateRange v122 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v62, "setPreferredFrameRateRange:", *(double *)&v122.minimum, *(double *)&v122.maximum, *(double *)&v122.preferred);
  [v62 setHighFrameRateReason:1638403];
  v117[1] = v62;
  [v33 bounds];
  double v67 = v66;
  double v69 = v68;
  [v107 bounds];
  double v71 = v70;
  double v73 = v72;
  if (v33) {
    [v33 transform];
  }
  else {
    memset(&v112[8], 0, 128);
  }
  double v74 = v71 / v67;
  if (v71 / v67 <= v73 / v69) {
    double v75 = v73 / v69;
  }
  else {
    double v75 = v71 / v67;
  }
  if (v71 / v67 >= v73 / v69) {
    double v74 = v73 / v69;
  }
  double v76 = v74 * 1.5;
  if (v75 < v76) {
    double v76 = v75;
  }
  CGFloat v77 = fmin(v76, 0.75);
  v78 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  CATransform3D v116 = *(CATransform3D *)&v112[8];
  v79 = [MEMORY[0x1E4F29238] valueWithBytes:&v116 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v78 setFromValue:v79];

  v80 = (void *)MEMORY[0x1E4F29238];
  CATransform3D v114 = *(CATransform3D *)&v112[8];
  CATransform3DScale(&v115, &v114, v77, v77, 1.0);
  v81 = [v80 valueWithBytes:&v115 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v78 setToValue:v81];

  [v78 setDuration:0.6462];
  uint64_t v82 = *MEMORY[0x1E4F3A488];
  v83 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  [v78 setTimingFunction:v83];

  [v78 setAdditive:1];
  CAFrameRateRange v123 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v78, "setPreferredFrameRateRange:", *(double *)&v123.minimum, *(double *)&v123.maximum, *(double *)&v123.preferred);
  [v78 setHighFrameRateReason:1638403];
  v117[2] = v78;
  v84 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v84 setFromValue:&unk_1EDA42198];
  [v84 setToValue:&unk_1EDA42630];
  [v84 setDuration:0.1422];
  [v84 setBeginTime:0.504];
  v85 = [MEMORY[0x1E4F39C10] functionWithName:v82];
  [v84 setTimingFunction:v85];

  [v84 setFillMode:*MEMORY[0x1E4F39F98]];
  v117[3] = v84;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:4];
  [v35 setAnimations:v86];

  if (v40) {
    [v40 transform];
  }
  else {
    memset(v112, 0, 128);
  }
  v87 = getLinkAnimation(a12, v112, 0);
  v88 = _Block_copy(aBlock);

  [v87 setValue:v88 forKey:@"afterDestinationLayerBounces"];
  [v87 setValue:MEMORY[0x1E4F1CC38] forKey:@"isDestinationLayerAnimation"];
  v89 = objc_alloc_init(SFBlockBasedCAAnimationDelegate);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __157__UIView_SafariServicesExtras___sf_animateLinkImage_withAnimation_fromRect_inView_toRect_inView_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
  v108[3] = &unk_1E54EA660;
  id v109 = v101;
  id v110 = v99;
  v111 = v102;
  id v90 = v99;
  id v91 = v101;
  [(SFBlockBasedCAAnimationDelegate *)v89 setAnimationDidStopBlock:v108];
  [v35 setDelegate:v89];
  [(SFBlockBasedCAAnimationDelegate *)v89 associateLifetimeWithAnimation:v35];
  [v87 setDelegate:v89];
  [(SFBlockBasedCAAnimationDelegate *)v89 associateLifetimeWithAnimation:v87];
  [v33 addAnimation:v35 forKey:0];
  [v33 setOpacity:0.0];
  [v40 addAnimation:v87 forKey:@"SafariLinkAnimation"];
}

+ (void)_sf_performLinkAnimation:()SafariServicesExtras onView:
{
  double v5 = [a4 layer];
  uint64_t v6 = [v5 animationForKey:@"SafariLinkAnimation"];

  if (!v6)
  {
    if (v5) {
      [v5 transform];
    }
    else {
      memset(v8, 0, sizeof(v8));
    }
    uint64_t v7 = getLinkAnimation(a3, v8, 1);
    [v5 addAnimation:v7 forKey:@"SafariLinkAnimation"];
  }
}

@end