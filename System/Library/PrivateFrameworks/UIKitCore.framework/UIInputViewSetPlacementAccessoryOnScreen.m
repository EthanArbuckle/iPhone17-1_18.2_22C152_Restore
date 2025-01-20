@interface UIInputViewSetPlacementAccessoryOnScreen
+ (BOOL)supportsSecureCoding;
- (BOOL)accessoryViewWillAppear;
- (BOOL)showsEditItems;
- (BOOL)showsInputViews;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (id)applicatorInfoForOwner:(id)a3;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
@end

@implementation UIInputViewSetPlacementAccessoryOnScreen

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 _rootInputWindowController];
  v12 = [v11 placement];

  v13 = [v12 subPlacements];
  v14 = [v13 firstObject];

  if (v14 == self)
  {
    id v17 = v9;
    if (!v17) {
      goto LABEL_16;
    }
  }
  else
  {
    v15 = [v8 inputAccessoryView];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      uint64_t v18 = [v8 inputView];
      v19 = (void *)v18;
      if (v18) {
        v20 = (void *)v18;
      }
      else {
        v20 = v9;
      }
      id v17 = v20;
    }
    if (!v17) {
      goto LABEL_16;
    }
  }
  if ([v17 isDescendantOfView:v10])
  {
    v21 = (void *)MEMORY[0x1E4F5B268];
    v22 = [v8 inputAccessoryView];
    if (v22) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = 3;
    }
    v24 = [v21 constraintWithItem:v10 attribute:4 relatedBy:0 toItem:v17 attribute:v23 multiplier:1.0 constant:0.0];

    goto LABEL_17;
  }
LABEL_16:
  v24 = 0;
LABEL_17:

  return v24;
}

- (BOOL)showsInputViews
{
  return 1;
}

- (BOOL)accessoryViewWillAppear
{
  return 1;
}

- (BOOL)showsEditItems
{
  return (_os_feature_enabled_impl() & 1) == 0
      && (_os_feature_enabled_impl() & 1) == 0
      && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v4)
  {
    id v9 = [v5 inputAccessoryView];

    if (v9)
    {
      id v10 = [v6 inputAccessoryView];
      [v10 intrinsicContentSize];
      double v12 = v11;

      if (v12 == -1.0)
      {
        v13 = [v6 inputAccessoryView];
        [v13 frame];
        double v12 = v14;
      }
      double v8 = v8 + v12;
    }
  }
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  double v17 = v15;
  double v18 = v16;
  double v19 = v7;
  double v20 = v8;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)applicatorInfoForOwner:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 inputViewSet];
  if ([v5 isInputViewPlaceholder])
  {
    v6 = [v4 inputViewSet];
    double v7 = [v6 inputAccessoryView];

    if (v7)
    {
      double v8 = [v4 hostView];
      id v9 = [v8 _rootInputWindowController];
      [v9 keyboardSizeFromExternalUpdate];
      double v11 = v10;

      if (v11 > 0.0)
      {
        v21[0] = @"Alpha";
        double v12 = NSNumber;
        [(UIInputViewSetPlacement *)self alpha];
        v13 = objc_msgSend(v12, "numberWithDouble:");
        v22[0] = v13;
        v21[1] = @"Transform";
        double v14 = (void *)MEMORY[0x1E4F29238];
        [(UIInputViewSetPlacement *)self transform];
        double v15 = [v14 valueWithCGAffineTransform:v20];
        v22[1] = v15;
        v21[2] = @"Origin";
        double v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v11);
        v22[2] = v16;
        double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  v19.receiver = self;
  v19.super_class = (Class)UIInputViewSetPlacementAccessoryOnScreen;
  double v17 = [(UIInputViewSetPlacement *)&v19 applicatorInfoForOwner:v4];
LABEL_7:

  return v17;
}

@end