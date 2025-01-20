@interface DBGViewDebuggerSupport_iOS
+ (BOOL)_isEffectView:(id)a3;
+ (BOOL)_viewHasAmbiguousLayout:(id)a3;
+ (BOOL)ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:(id)a3;
+ (BOOL)ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:(id)a3;
+ (BOOL)isHiddenForWindow:(id)a3;
+ (BOOL)isViewSubclass:(id)a3;
+ (BOOL)isWindowSubclass:(id)a3;
+ (double)firstBaselineOffsetFromTopForView:(id)a3;
+ (double)lastBaselineOffsetFromBottomForView:(id)a3;
+ (double)screenBackingScaleForView:(id)a3;
+ (double)screenBackingScaleForWindow:(id)a3;
+ (id)_messagesUIExtensionViews;
+ (id)_renderEffectViewUsingDrawHierarchyInRect:(id)a3;
+ (id)appWindows;
+ (id)displayNameForView:(id)a3;
+ (id)layerForView:(id)a3;
+ (id)primaryWindowFromWindows:(id)a3;
+ (id)snapshotMethodForView:(id)a3;
+ (id)snapshotView:(id)a3 errorString:(id *)a4;
+ (id)subviewsForView:(id)a3;
+ (id)viewForFirstBaselineLayoutPointerForView:(id)a3;
+ (id)viewForLastBaselineLayoutPointerForView:(id)a3;
+ (id)windowContentViewForWindow:(id)a3;
+ (unint64_t)ambiguityStatusMaskForView:(id)a3;
+ (void)addFrameBasics:(id)a3 toDict:(id)a4;
+ (void)addLayoutInfoForView:(id)a3 toDict:(id)a4;
+ (void)addViewBasics:(id)a3 toDict:(id)a4;
@end

@implementation DBGViewDebuggerSupport_iOS

+ (id)displayNameForView:(id)a3
{
  id v3 = a3;
  v4 = [v3 accessibilityLabel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [v3 accessibilityLabel];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    v8 = [v3 accessibilityLabel];
    v6 = [v8 string];
  }
  if (v6) {
    goto LABEL_18;
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 currentTitle];
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v3 text];
LABEL_13:
    v10 = (void *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v10;
    }
    else {
      v12 = 0;
    }
    id v11 = v12;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v3 date];
    id v11 = [v10 description];
LABEL_17:
    v6 = v11;

    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v3 title];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

+ (id)primaryWindowFromWindows:(id)a3
{
  id v3 = a3;
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 keyWindow];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "isHidden", (void)v15)) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v13 = v12;

      if (v13) {
        goto LABEL_15;
      }
    }
    else
    {
LABEL_11:
    }
    [v7 firstObject:v15];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = v6;
LABEL_15:

  return v13;
}

+ (id)snapshotMethodForView:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Skview.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(&cfstr_Scnview.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_Glkview.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_RealitykitArvi.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = @"snapshot";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)appWindows
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 windows];

  return v3;
}

+ (id)windowContentViewForWindow:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return [a3 isHidden];
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  id v3 = [a3 screen];
  [v3 scale];
  double v5 = v4;

  return v5;
}

+ (double)screenBackingScaleForView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 window];
  if (v5)
  {
    id v6 = [v4 window];
    [a1 screenBackingScaleForWindow:v6];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

+ (id)_messagesUIExtensionViews
{
  Class v2 = NSClassFromString(&cfstr_Msextensionglo.isa);
  if (v2 && (Class v3 = v2, (objc_opt_respondsToSelector() & 1) != 0))
  {
    id v4 = [(objc_class *)v3 sharedInstance];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double v5 = [v4 activeExtensionContext];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v6 = [v5 viewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v7 = [v6 view];
          uint64_t v10 = v7;
          double v8 = +[NSArray arrayWithObjects:&v10 count:1];
        }
        else
        {
          double v8 = 0;
        }
      }
      else
      {
        double v8 = 0;
      }
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)layerForView:(id)a3
{
  return [a3 layer];
}

+ (id)subviewsForView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 contentView];

    if (v4)
    {
      double v7 = v4;
      double v5 = +[NSArray arrayWithObjects:&v7 count:1];
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = [v3 subviews];
  }

  return v5;
}

+ (BOOL)isWindowSubclass:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isViewSubclass:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  [v6 bounds];
  uint64_t v10 = 0;
  if (v8 > 0.0 && v9 > 0.0 && v8 * v9 < 16000000.0)
  {
    NSClassFromString(&cfstr_Glkview.isa);
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(&cfstr_Skview.isa), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(&cfstr_Scnview.isa), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(&cfstr_RealitykitArvi.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v11 = [v6 snapshot];
    }
    else
    {
      if (![a1 _isEffectView:v6])
      {
        v14 = [v6 subviews];
        id v15 = [v14 count];
        long long v16 = (char *)&v30 - ((4 * (void)v15 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (v15)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            long long v18 = [v14 objectAtIndex:i];
            v19 = [v18 layer];
            [v19 opacity];
            *(_DWORD *)&v16[4 * (void)i] = v20;

            v21 = [v18 layer];
            [v21 setOpacity:0.0];
          }
        }
        [v6 bounds];
        v32.width = v22;
        v32.height = v23;
        UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
        CurrentContext = (UIImage *)UIGraphicsGetCurrentContext();
        if (CurrentContext)
        {
          v24 = [v6 layer];
          [v24 renderInContext:CurrentContext];

          UIGraphicsGetImageFromCurrentImageContext();
          CurrentContext = (UIImage *)objc_claimAutoreleasedReturnValue();
        }
        UIGraphicsEndImageContext();
        if (v15)
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            v26 = [v14 objectAtIndex:j];
            int v27 = *(_DWORD *)&v16[4 * (void)j];
            v28 = [v26 layer];
            LODWORD(v29) = v27;
            [v28 setOpacity:v29];
          }
        }

        if (!CurrentContext) {
          goto LABEL_12;
        }
LABEL_10:
        uint64_t v10 = UIImagePNGRepresentation(CurrentContext);
        if (v10)
        {
LABEL_13:

          goto LABEL_14;
        }
        if (!*a4)
        {
          +[NSString stringWithFormat:@"Problem getting view snapshot for %@", v6];
          uint64_t v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_12:
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      uint64_t v11 = [a1 _renderEffectViewUsingDrawHierarchyInRect:v6];
    }
    CurrentContext = (UIImage *)v11;
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_14:

  return v10;
}

+ (BOOL)_isEffectView:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [a1 viewDebuggerEffectViewsToSnapshotAsImage];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        LOBYTE(v9) = [v9 isEqualToString:v11];

        if (v9)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (id)_renderEffectViewUsingDrawHierarchyInRect:(id)a3
{
  id v3 = a3;
  id v4 = [v3 window];
  if (!v4)
  {
    id v5 = v3;
    id v6 = [v5 superview];

    if (v6)
    {
      do
      {
        id v4 = [v5 superview];

        uint64_t v7 = [v4 superview];

        id v5 = v4;
      }
      while (v7);
    }
    else
    {
      id v4 = v5;
    }
  }
  [v3 bounds];
  [v4 convertRect:v3 fromView:];
  double x = v8;
  double y = v10;
  double width = v12;
  double height = v14;
  long long v16 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:0];
  id v17 = v3;
  long long v18 = v17;
  if (v4 == v17)
  {
    v70 = v17;
  }
  else
  {
    v19 = v17;
    do
    {
      id v20 = [v19 superview];
      v21 = [v20 subviews];
      CGFloat v22 = (char *)[v21 indexOfObject:v19];

      CGFloat v23 = [v20 subviews];
      v24 = (char *)[v23 count];
      v25 = v22 + 1;

      if (v24 > v22 + 1)
      {
        while (1)
        {
          v26 = [v20 subviews];
          int v27 = (char *)[v26 count];

          if (v25 >= v27) {
            break;
          }
          v28 = [v20 subviews];
          double v29 = [v28 objectAtIndexedSubscript:v25];

          [v29 alpha];
          uint64_t v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v16 setObject:v30 forKey:v29];

          [v29 setAlpha:0.0];
          ++v25;
        }
      }
      if ([v20 clipsToBounds])
      {
        [v20 bounds];
        [v4 convertRect:v20 fromView:];
        v86.origin.double x = v31;
        v86.origin.double y = v32;
        v86.size.double width = v33;
        v86.size.double height = v34;
        v84.origin.double x = x;
        v84.origin.double y = y;
        v84.size.double width = width;
        v84.size.double height = height;
        CGRect v85 = CGRectIntersection(v84, v86);
        double x = v85.origin.x;
        double y = v85.origin.y;
        double width = v85.size.width;
        double height = v85.size.height;
      }

      v19 = v20;
    }
    while (v20 != v4);
    v70 = v4;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v35 = [v18 subviews];
  id v36 = [v35 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v76;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v76 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        [v40 alpha];
        v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setObject:v41 forKey:v40];

        [v40 setAlpha:0.0];
      }
      id v37 = [v35 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v37);
  }

  [v4 bounds];
  double v43 = v42;
  double v45 = v44;
  v82.double width = width;
  v82.double height = height;
  UIGraphicsBeginImageContextWithOptions(v82, 0, 0.0);
  [v4 drawViewHierarchyInRect:CGRectMake(1, -x, -y, v43, v45)];
  v46 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v18 bounds];
  if (v48 != width || v47 != height)
  {
    [v18 convertRect:v4 fromView:x, y, width, height];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    [v18 bounds];
    v83.double width = v57;
    v83.double height = v58;
    UIGraphicsBeginImageContextWithOptions(v83, 0, 0.0);
    [v46 drawInRect:0 blendMode:v50 alpha:v52];
    uint64_t v59 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v46 = (void *)v59;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v60 = [v16 keyEnumerator];
  id v61 = [v60 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v72;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(void *)v72 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
        v66 = [v16 objectForKey:v65];
        [v66 doubleValue];
        double v68 = v67;

        [v65 setAlpha:v68];
      }
      id v62 = [v60 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v62);
  }

  return v46;
}

+ (void)addFrameBasics:(id)a3 toDict:(id)a4
{
  id v5 = a4;
  [a3 frame];
  __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v6, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v10 forKey:@"frame"];
}

+ (void)addViewBasics:(id)a3 toDict:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if ([a1 isViewSubclass:v23])
  {
    id v7 = v23;
    [v7 frame];
    double v12 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v8, v9, v10, v11);
    [v6 setObject:v12 forKey:@"frame"];

    [v7 bounds];
    id v17 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v13, v14, v15, v16);
    [v6 setObject:v17 forKey:@"bounds"];

    long long v18 = [v7 superview];
    v19 = +[NSString stringWithFormat:@"%p", v18];

    [v6 setObject:v19 forKey:@"superview"];
    id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isHidden]);
    [v6 setObject:v20 forKey:@"hidden"];

    v21 = [a1 displayNameForView:v7];
    if (v21) {
      [v6 setObject:v21 forKey:@"displayName"];
    }
    [v7 contentScaleFactor];
    CGFloat v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setObject:v22 forKey:@"contentsScale"];
  }
}

+ (void)addLayoutInfoForView:(id)a3 toDict:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [v22 constraintsAffectingLayoutForAxis:0];
  double v8 = arrayOfObjectPointers(v7);
  [v6 setObject:v8 forKey:@"horizontalAffectingConstraints"];

  double v9 = [v22 constraintsAffectingLayoutForAxis:1];
  double v10 = arrayOfObjectPointers(v9);
  [v6 setObject:v10 forKey:@"verticalAffectingConstraints"];

  double v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 _viewHasAmbiguousLayout:v22]);
  [v6 setObject:v11 forKey:@"hasAmbiguousLayout"];

  if ([a1 _viewHasAmbiguousLayout:v22])
  {
    double v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1 ambiguityStatusMaskForView:v22]);
    [v6 setObject:v12 forKey:@"ambiguityStatusMask"];
  }
  [a1 firstBaselineOffsetFromTopForView:v22];
  double v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v13 forKey:@"firstBaselineOffsetFromTop"];

  [a1 lastBaselineOffsetFromBottomForView:v22];
  double v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v14 forKey:@"lastBaselineOffsetFromBottom"];

  double v15 = [a1 viewForFirstBaselineLayoutPointerForView:v22];
  if (v15) {
    [v6 setObject:v15 forKey:@"viewForFirstBaselineLayout"];
  }
  double v16 = [a1 viewForLastBaselineLayoutPointerForView:v22];
  if (v16) {
    [v6 setObject:v16 forKey:@"viewForLastBaselineLayout"];
  }
  [v22 layoutMargins];
  v21 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v17, v18, v19, v20);
  [v6 setObject:v21 forKey:@"layoutMargins"];
}

+ (BOOL)_viewHasAmbiguousLayout:(id)a3
{
  id v3 = a3;
  if (viewWantsAutoLayout(v3))
  {
    id v4 = [v3 _layoutVariablesWithAmbiguousValue];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (unint64_t)ambiguityStatusMaskForView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _layoutVariablesWithAmbiguousValue];
  id v6 = +[NSSet setWithArray:v5];

  id v7 = [v4 superview];
  if (!v7) {
    goto LABEL_7;
  }
  while ((objc_msgSend(v7, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    uint64_t v8 = [v7 superview];

    id v7 = (void *)v8;
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v7, "_uiib_hostsLayoutEngine"))
  {
    double v9 = [v7 _uiib_layoutEngineCreatingIfNecessary];
  }
  else
  {
LABEL_7:
    double v9 = 0;
  }
  uint64_t v10 = [v4 _minXVariable];
  if (v10)
  {
    if ([v6 containsObject:v10]) {
      unint64_t v11 = 2;
    }
    else {
      unint64_t v11 = 0;
    }
    if (v9 && ![v9 hasValue:0 forVariable:v10]) {
      v11 |= 0x400uLL;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  uint64_t v12 = [v4 _minYVariable];
  if (v12)
  {
    if ([v6 containsObject:v12]) {
      v11 |= 4uLL;
    }
    if (v9 && ![v9 hasValue:0 forVariable:v12]) {
      v11 |= 0x800uLL;
    }
  }
  double v13 = [v4 _boundsWidthVariable];
  if (v13)
  {
    if ([v6 containsObject:v13]) {
      v11 |= 8uLL;
    }
    if (v9 && ![v9 hasValue:0 forVariable:v13]) {
      v11 |= 0x1000uLL;
    }
  }
  double v14 = [v4 _boundsHeightVariable];
  uint64_t v20 = v12;
  if (v14)
  {
    if (objc_msgSend(v6, "containsObject:", v14, v12)) {
      v11 |= 0x10uLL;
    }
    if (v9 && ![v9 hasValue:0 forVariable:v14]) {
      v11 |= 0x2000uLL;
    }
  }
  double v15 = [v4 _contentWidthVariable:v20];
  id v22 = (void *)v10;
  if (!v15) {
    goto LABEL_41;
  }
  if (([a1 ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:v4] & 1) == 0
    && [v6 containsObject:v15])
  {
    v11 |= 0x20uLL;
  }
  if (v9
    && ([a1 ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:v4] & 1) == 0)
  {
    double v16 = v6;
    id v17 = a1;
    if (![v9 hasValue:0 forVariable:v15]) {
      v11 |= 0x4000uLL;
    }
  }
  else
  {
LABEL_41:
    double v16 = v6;
    id v17 = a1;
  }
  double v18 = [v4 _contentHeightVariable];
  if (v18)
  {
    if (([v17 ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:v4] & 1) == 0
      && [v16 containsObject:v18])
    {
      v11 |= 0x40uLL;
    }
    if (v9
      && ([v17 ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:v4] & 1) == 0
      && ![v9 hasValue:0 forVariable:v18])
    {
      v11 |= 0x8000uLL;
    }
  }

  return v11;
}

+ (BOOL)ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 subviews];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 subviews];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 viewForFirstBaselineLayout];
    }
  }
  double v5 = 0.0;
  if viewWantsAutoLayout(v4) && (objc_opt_respondsToSelector())
  {
    [v4 _firstBaselineOffsetFromTop];
    double v5 = v6;
  }
  [v4 bounds];
  [v4 alignmentRectForFrame:];
  [v4 convertRect:v3 toView:];
  double v8 = v7;
  [v3 bounds];
  [v3 alignmentRectForFrame:x0];
  double v10 = v5 + v8 + v9;

  return v10;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 viewForLastBaselineLayout];
    }
  }
  double v5 = 0.0;
  if viewWantsAutoLayout(v4) && (objc_opt_respondsToSelector())
  {
    [v4 _baselineOffsetFromBottom];
    double v5 = v6;
  }
  [v4 bounds];
  [v4 alignmentRectForFrame:];
  [v4 convertRect:v3 toView:];
  double v8 = v7;
  double v10 = v9;
  [v3 bounds];
  [v3 alignmentRectForFrame:x0];
  double v13 = v5 + v11 + v12 - (v8 + v10);

  return v13;
}

+ (id)viewForFirstBaselineLayoutPointerForView:(id)a3
{
  id v3 = a3;
  if viewWantsAutoLayout(v3) && (objc_opt_respondsToSelector())
  {
    id v4 = [v3 viewForFirstBaselineLayout];
    if (v4)
    {
      double v5 = +[NSString stringWithFormat:@"%p", v4];
      goto LABEL_7;
    }
  }
  else
  {
    id v4 = 0;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

+ (id)viewForLastBaselineLayoutPointerForView:(id)a3
{
  id v3 = a3;
  if viewWantsAutoLayout(v3) && (objc_opt_respondsToSelector())
  {
    id v4 = [v3 viewForLastBaselineLayout];
    if (v4)
    {
      double v5 = +[NSString stringWithFormat:@"%p", v4];
      goto LABEL_7;
    }
  }
  else
  {
    id v4 = 0;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

@end