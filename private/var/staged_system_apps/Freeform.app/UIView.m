@interface UIView
+ (BOOL)crlaxView:(id)a3 isDescendantOfView:(id)a4;
+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4;
+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4 completion:(id)a5;
+ (void)crl_animateWithKeyboardNotification:(id)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6;
- (BOOL)crl_isPresetRenderingInvalid;
- (BOOL)crlaxServesAsContainingParentForOrdering;
- (CGPoint)crlaxFramePointFromBoundsPoint:(CGPoint)a3;
- (CGRect)crlaxFrameFromBounds:(CGRect)a3;
- (CRLiOSWindowWrapper)crl_windowWrapper;
- (UIView)crlaxFirstAccessibleSubview;
- (double)crlaxScreenScale;
- (id)crl_constraintsToAllSidesOfItem:(id)a3;
- (id)crlaxParentFindReplaceController;
- (void)crl_activateEqualConstraintsForView:(id)a3;
- (void)crl_prepareForPresetRendering;
- (void)crl_setPresetRenderingInvalid:(BOOL)a3;
- (void)crlaxSetParentFindReplaceController:(id)a3;
- (void)crlaxSetServesAsContainingParentForOrdering:(BOOL)a3;
@end

@implementation UIView

- (BOOL)crl_isPresetRenderingInvalid
{
  v2 = objc_getAssociatedObject(self, "crl_isPresetRenderingInvalid");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)crl_prepareForPresetRendering
{
}

- (void)crl_setPresetRenderingInvalid:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "crl_isPresetRenderingInvalid", v4, (void *)1);
}

- (id)crl_constraintsToAllSidesOfItem:(id)a3
{
  id v4 = a3;
  v5 = +[NSLayoutConstraint constraintWithItem:self attribute:1 relatedBy:0 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
  v6 = +[NSLayoutConstraint constraintWithItem:self attribute:2 relatedBy:0 toItem:v4 attribute:2 multiplier:1.0 constant:0.0];
  v7 = +[NSLayoutConstraint constraintWithItem:self attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
  v8 = +[NSLayoutConstraint constraintWithItem:self attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];

  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v7;
  v11[3] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:4];

  return v9;
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4
{
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4 completion:(id)a5
{
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [a3 userInfo];
  v12 = [v11 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v11 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
  id v16 = [v15 integerValue];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AF438;
  v18[3] = &unk_1014D1F38;
  id v19 = v9;
  id v20 = v16;
  id v17 = v9;
  +[UIView animateWithDuration:a4 delay:v18 options:v10 animations:v14 completion:0.0];
}

- (CRLiOSWindowWrapper)crl_windowWrapper
{
  return (CRLiOSWindowWrapper *)+[CRLiOSWindowWrapper windowWrapperForView:self assert:0];
}

- (BOOL)crlaxServesAsContainingParentForOrdering
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9A30);
}

- (void)crlaxSetServesAsContainingParentForOrdering:(BOOL)a3
{
}

- (id)crlaxParentFindReplaceController
{
  return __CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A9A31);
}

- (void)crlaxSetParentFindReplaceController:(id)a3
{
}

- (CGRect)crlaxFrameFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIView *)self window];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  [v8 convertRect:0 toWindow:];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGPoint)crlaxFramePointFromBoundsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIView *)self window];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  [v6 convertPoint:v6 toWindow:];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)crlaxScreenScale
{
  v2 = [(UIView *)self window];
  unsigned __int8 v3 = [v2 screen];
  [v3 scale];
  double v5 = v4;

  return v5;
}

+ (BOOL)crlaxView:(id)a3 isDescendantOfView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  double v8 = v7;
  BOOL v9 = v7 != 0;
  id v10 = v7;
  if (v7 != v6 && v7)
  {
    id v10 = v7;
    do
    {
      double v11 = v10;
      id v10 = [v10 superview];

      BOOL v9 = v10 != 0;
    }
    while (v10 != v6 && v10);
  }

  return v9;
}

- (UIView)crlaxFirstAccessibleSubview
{
  unsigned __int8 v3 = [(UIView *)self window];

  if (v3)
  {
    char v12 = 0;
    double v4 = [(UIView *)self crlaxValueForKey:@"_accessibleSubviews"];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v12);
    if (v12) {
      abort();
    }
    id v7 = (void *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1003E0D58;
      v10[3] = &unk_1014F6988;
      id v11 = 0;
      double v8 = [v7 crlaxObjectsPassingTest:v10];
      unsigned __int8 v3 = [v8 firstObject];
    }
    else
    {
      unsigned __int8 v3 = 0;
    }
  }

  return (UIView *)v3;
}

- (void)crl_activateEqualConstraintsForView:(id)a3
{
  id v4 = a3;
  double v17 = [v4 leadingAnchor];
  double v16 = [(UIView *)self leadingAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v15;
  id v5 = [v4 trailingAnchor];
  uint64_t v6 = [(UIView *)self trailingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v18[1] = v7;
  double v8 = [v4 topAnchor];
  BOOL v9 = [(UIView *)self topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v18[2] = v10;
  id v11 = [v4 bottomAnchor];

  char v12 = [(UIView *)self bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v18[3] = v13;
  double v14 = +[NSArray arrayWithObjects:v18 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

@end