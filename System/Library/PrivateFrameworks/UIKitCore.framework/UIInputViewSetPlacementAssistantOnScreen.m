@interface UIInputViewSetPlacementAssistantOnScreen
+ (BOOL)supportsSecureCoding;
+ (id)infoWithPoint:(CGPoint)a3 isCompact:(BOOL)a4 frame:(CGRect)a5 position:(unint64_t)a6;
+ (id)placementForDraggingAssistant;
- (BOOL)inputViewWillAppear;
- (BOOL)isFloatingAssistantView;
- (BOOL)isInteractive;
- (BOOL)showsEditItems;
- (BOOL)showsInputOrAssistantViews;
- (BOOL)showsInputViews;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (UIEdgeInsets)inputAccessoryViewPadding;
- (double)inputAssistantViewHeightForInputViewSet:(id)a3;
- (double)verticalOffset;
- (id)subPlacements;
- (id)subPlacementsForInputViewSet:(id)a3;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (unint64_t)indexForPurpose:(unint64_t)a3;
@end

@implementation UIInputViewSetPlacementAssistantOnScreen

+ (id)placementForDraggingAssistant
{
  id result = (id)[a1 placement];
  *((unsigned char *)result + 56) = 1;
  return result;
}

- (id)subPlacements
{
  v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v4 = [v3 inputViews];
  v5 = [(UIInputViewSetPlacementAssistantOnScreen *)self subPlacementsForInputViewSet:v4];

  return v5;
}

- (id)subPlacementsForInputViewSet:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v6 = [v5 visualModeManager];
  if (([v6 shouldShowWithinAppWindow] & 1) == 0)
  {

    goto LABEL_7;
  }
  v7 = [v4 inputAccessoryView];

  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  if (!cachedSecondaryPlacement)
  {
    v9 = +[UIInputViewSetPlacement placement];
    v10 = self->_cachedSecondaryPlacement;
    self->_cachedSecondaryPlacement = v9;

    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  }
  v13[0] = cachedSecondaryPlacement;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
LABEL_8:

  return v11;
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  unint64_t v3 = 0;
  if ((uint64_t)a3 > 99)
  {
    if (a3 == 100 || a3 == 102) {
      return v3;
    }
    if (a3 == 101)
    {
LABEL_8:
      id v4 = [(UIInputViewSetPlacementAssistantOnScreen *)self subPlacements];
      unint64_t v3 = v4 != 0;

      return v3;
    }
    return 1;
  }
  if (a3 > 4) {
    return 1;
  }
  if (((1 << a3) & 0xD) == 0) {
    goto LABEL_8;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infoWithPoint:(CGPoint)a3 isCompact:(BOOL)a4 frame:(CGRect)a5 position:(unint64_t)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  BOOL v11 = a4;
  v21[4] = *MEMORY[0x1E4F143B8];
  v20[0] = @"Origin";
  CGPoint v19 = a3;
  v12 = [MEMORY[0x1E4F29238] valueWithBytes:&v19 objCType:"{CGPoint=dd}"];
  v21[0] = v12;
  v20[1] = @"IsCompact";
  v13 = [NSNumber numberWithBool:v11];
  v21[1] = v13;
  v20[2] = 0x1ED149F00;
  *(CGFloat *)v18 = x;
  *(CGFloat *)&v18[1] = y;
  *(CGFloat *)&v18[2] = width;
  *(CGFloat *)&v18[3] = height;
  v14 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v21[2] = v14;
  v20[3] = 0x1ED149F20;
  v15 = [NSNumber numberWithUnsignedInteger:a6];
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v16;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  [(UIInputViewSetPlacementAssistantOnScreen *)self isFloatingAssistantView];
  unint64_t v3 = objc_opt_class();
  return (Class)v3;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isInputViewPlaceholder])
  {
    v20.receiver = self;
    v20.super_class = (Class)UIInputViewSetPlacementAssistantOnScreen;
    BOOL v11 = [(UIInputViewSetPlacement *)&v20 verticalConstraintForInputViewSet:v8 hostView:v9 containerView:v10];
  }
  else
  {
    uint64_t v12 = [v8 inputAssistantView];
    if (v12
      && (v13 = (void *)v12,
          [v8 inputAssistantView],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 isDescendantOfView:v10],
          v14,
          v13,
          v15))
    {
      v16 = [v10 bottomAnchor];
      v17 = [v8 inputAssistantView];
      v18 = [v17 bottomAnchor];
      [(UIInputViewSetPlacementAssistantOnScreen *)self verticalOffset];
      BOOL v11 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (double)verticalOffset
{
  BOOL v2 = [(UIInputViewSetPlacementAssistantOnScreen *)self isFloatingAssistantView];
  double result = *(double *)&UIFloatingAssistantBottomMargin;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)isFloatingAssistantView
{
  if (+[UIKeyboard isMajelEnabled]
    || (_os_feature_enabled_impl() & 1) != 0
    || (int v2 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v2) = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  return v2;
}

- (BOOL)showsInputViews
{
  return 1;
}

- (BOOL)showsInputOrAssistantViews
{
  return 1;
}

- (BOOL)showsEditItems
{
  return ![(UIInputViewSetPlacementAssistantOnScreen *)self isFloatingAssistantView];
}

- (BOOL)inputViewWillAppear
{
  return 1;
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementAssistantOnScreen;
  [(UIInputViewSetPlacement *)&v8 inputAssistantViewHeightForInputViewSet:a3];
  double v4 = v3;
  if (v3 > 0.0 && !+[UIKeyboard isInputSystemUI])
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
      || (BOOL v5 = +[UIDevice _hasHomeButton], v6 = 14.0, v5))
    {
      double v6 = 0.0;
    }
    return v4 + v6;
  }
  return v4;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 inputAssistantView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(UIInputViewSetPlacementAssistantOnScreen *)self inputAssistantViewHeightForInputViewSet:v6];
  double v15 = v14;
  if (v4)
  {
    v16 = [v6 inputAccessoryView];

    if (v16)
    {
      v17 = [v6 inputAccessoryView];
      [v17 intrinsicContentSize];
      double v19 = v18;

      if (v19 == -1.0)
      {
        objc_super v20 = [v6 inputAccessoryView];
        [v20 frame];
        double v19 = v21;
      }
      double v15 = v15 + v19;
    }
  }
  if ([(UIInputViewSetPlacementAssistantOnScreen *)self isFloatingAssistantView])
  {
    if (UIInputAssistantViewIsHidden())
    {
      double v13 = 0.0;
      double v9 = -1.0;
    }
    double v11 = 1.0;
  }

  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (UIEdgeInsets)inputAccessoryViewPadding
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isInteractive
{
  return self->isInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_storeStrong((id *)&self->_cachedSecondaryPlacement, 0);
}

@end