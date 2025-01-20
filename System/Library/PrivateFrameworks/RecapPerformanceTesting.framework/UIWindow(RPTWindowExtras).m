@interface UIWindow(RPTWindowExtras)
- (double)_draggableFrame;
- (double)_rpt_safeVisibleFrameOfScreen;
- (double)rpt_accessibilityActivationPointAttribute;
- (void)_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:()RPTWindowExtras;
@end

@implementation UIWindow(RPTWindowExtras)

- (double)_draggableFrame
{
  v1 = [a1 valueForKeyPath:@"nsWindowProxy.attachedWindow._draggableFrame"];
  [v1 CGRectValue];
  double v3 = v2;

  return v3;
}

- (double)_rpt_safeVisibleFrameOfScreen
{
  v1 = [a1 nsScreen];
  [v1 visibleFrame];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  uint64_t v10 = v3;
  uint64_t v11 = v5;
  uint64_t v12 = v7;
  uint64_t v13 = v9;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v10, 20.0, 20.0);
  return result;
}

- (double)rpt_accessibilityActivationPointAttribute
{
  uint64_t v2 = [a1 valueForKeyPath:@"nsWindowProxy.attachedWindow.accessibilityActivationPoint"];
  [v2 CGPointValue];
  double v4 = v3;

  uint64_t v5 = [a1 nsScreen];
  [v5 frame];
  CGRectGetHeight(v7);

  return v4;
}

- (void)_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:()RPTWindowExtras
{
  objc_msgSend(a1, "_rpt_safeVisibleFrameOfScreen");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [a1 nsWindowFrame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  if (a2 == *MEMORY[0x1E4F1DB30] && a3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    a2 = v14;
    a3 = v15;
  }
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  double MinX = CGRectGetMinX(v28);
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double MinY = CGRectGetMinY(v29);
  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  double Height = CGRectGetHeight(v30);
  v31.origin.x = v17;
  v31.origin.y = v19;
  v31.size.width = a2;
  v31.size.height = a3;
  double v21 = MinY + Height - CGRectGetHeight(v31);
  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = a2;
  v32.size.height = a3;
  double Width = CGRectGetWidth(v32);
  v33.origin.x = v17;
  v33.origin.y = v19;
  v33.size.width = a2;
  v33.size.height = a3;
  double v23 = CGRectGetHeight(v33);
  id v25 = [a1 valueForKeyPath:@"nsWindowProxy.attachedWindow"];
  objc_msgSend(v25, "setFrame:display:", 1, MinX, v21, Width, v23);
}

@end