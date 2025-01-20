@interface UIClientRotationContext
- (BOOL)_isFooterTranslucent;
- (BOOL)_isHeaderTranslucent;
- (BOOL)skipClientRotationCallbacks;
- (UIClientRotationContext)initWithClient:(id)a3 toOrientation:(int64_t)a4 duration:(double)a5 andWindow:(id)a6;
- (UIView)contentView;
- (double)duration;
- (id)rotatingClient;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5;
- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6;
- (void)dealloc;
- (void)finishFirstHalfRotation;
- (void)finishFullRotateUsingOnePartAnimation:(BOOL)a3;
- (void)rotateSnapshots;
- (void)setSkipClientRotationCallbacks:(BOOL)a3;
- (void)setupRotationOrderingKeyboardInAfterRotation:(BOOL)a3;
- (void)slideHeaderViewAndFooterViewOffScreen:(BOOL)a3 forInterfaceOrientation:(int64_t)a4;
@end

@implementation UIClientRotationContext

- (UIClientRotationContext)initWithClient:(id)a3 toOrientation:(int64_t)a4 duration:(double)a5 andWindow:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)UIClientRotationContext;
  v10 = [(UIClientRotationContext *)&v15 init];
  if (!v10 || (objc_opt_respondsToSelector() & 1) == 0) {
    return v10;
  }
  v10->_rotatingClient = a3;
  v10->_window = (UIWindow *)a6;
  v10->_fromOrientation = 0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [a3 _lastKnownInterfaceOrientation];
    v10->_fromOrientation = v11;
    if (!v11) {
      goto LABEL_7;
    }
  }
  else if (!v10->_fromOrientation)
  {
LABEL_7:
    v10->_fromOrientation = [(UIWindow *)v10->_window interfaceOrientation];
  }
  v10->_toOrientation = a4;
  v10->_duration = a5;
  v10->_contentView = (UIView *)(id)[v10->_rotatingClient rotatingContentViewForWindow:a6];
  if (objc_opt_respondsToSelector()) {
    v10->_snapshotTargetView = (UIView *)(id)[v10->_rotatingClient rotatingSnapshotViewForWindow:a6];
  }
  if (objc_opt_respondsToSelector()) {
    v10->_headerView = (UIView *)(id)[v10->_rotatingClient rotatingHeaderViewForWindow:a6];
  }
  if (objc_opt_respondsToSelector())
  {
    v12 = (UIView *)(id)[v10->_rotatingClient rotatingFooterViewForWindow:a6];
    v10->_footerView = v12;
    v10->_footerWasHidden = [(UIView *)v12 isHidden];
  }
  int v13 = 15;
  if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {
    if ([(UIWindow *)v10->_window _isTextEffectsWindow]) {
      int v13 = 0;
    }
    else {
      int v13 = 15;
    }
  }
  v10->_rotationSettings.edgeClip = v13;
  if (objc_opt_respondsToSelector()) {
    [v10->_rotatingClient getRotationContentSettings:&v10->_rotationSettings forWindow:a6];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIClientRotationContext;
  [(UIClientRotationContext *)&v3 dealloc];
}

- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  BOOL v7 = a5;
  [a3 center];
  double v33 = v10;
  double v34 = v11;
  [a4 center];
  double v13 = v12;
  double v15 = v14;
  [a3 bounds];
  double v17 = v16;
  [a4 bounds];
  double v19 = v18;
  [(id)UIApp statusBarFrame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  if (a3) {
    [a3 transform];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }
  v36.origin.x = v21;
  v36.origin.y = v23;
  v36.size.width = v25;
  v36.size.height = v27;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v35);
  double v28 = v17 + v37.size.height;
  double v29 = v33;
  switch(a6)
  {
    case 1:
      if (v7) {
        double v28 = -v28;
      }
      double v30 = v34 + v28;
      double v31 = -v19;
      if (v7) {
        double v31 = v19;
      }
      goto LABEL_15;
    case 2:
      if (!v7) {
        double v28 = -v28;
      }
      double v30 = v34 + v28;
      double v31 = -v19;
      if (!v7) {
        double v31 = v19;
      }
LABEL_15:
      double v15 = v15 + v31;
      break;
    case 3:
      if (!v7) {
        double v28 = -v28;
      }
      double v29 = v33 + v28;
      double v32 = -v19;
      if (!v7) {
        double v32 = v19;
      }
      goto LABEL_24;
    case 4:
      if (v7) {
        double v28 = -v28;
      }
      double v29 = v33 + v28;
      double v32 = -v19;
      if (v7) {
        double v32 = v19;
      }
LABEL_24:
      double v13 = v13 + v32;
      double v30 = v34;
      break;
    default:
      double v29 = v33;
      double v30 = v34;
      break;
  }
  objc_msgSend(a3, "setCenter:", v29, v30);
  objc_msgSend(a4, "setCenter:", v13, v15);
}

- (void)slideHeaderViewAndFooterViewOffScreen:(BOOL)a3 forInterfaceOrientation:(int64_t)a4
{
}

- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5
{
  objc_msgSend((id)objc_msgSend(a3, "superview"), "bounds");
  objc_msgSend((id)objc_msgSend(a4, "superview"), "bounds");
  double v9 = v8;
  double v21 = v10;
  double v12 = v11;
  double v14 = v13;
  [a3 bounds];
  [a4 bounds];
  double v16 = v15 * 0.5;
  switch(a5)
  {
    case 1:
      double v17 = v9 + v12 * 0.5;
      double v18 = v21 + v14;
      goto LABEL_8;
    case 2:
      double v17 = v9 + v12 * 0.5;
      double v19 = v21 - v16;
      break;
    case 3:
      double v20 = 0.5;
      double v17 = v9 - v16;
      goto LABEL_7;
    case 4:
      double v20 = 0.5;
      double v17 = v9 + v12 + v16;
LABEL_7:
      double v16 = v14 * v20;
      double v18 = v21;
LABEL_8:
      double v19 = v18 + v16;
      break;
    default:
      double v17 = *MEMORY[0x1E4F1DAD8];
      double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  objc_msgSend(a3, "setPosition:");
  objc_msgSend(a4, "setPosition:", v17, v19);
}

- (BOOL)_isHeaderTranslucent
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([(UIView *)self->_headerView isTranslucent]) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  headerView = self->_headerView;
  return [(UIView *)headerView isTranslucent];
}

- (BOOL)_isFooterTranslucent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  footerView = self->_footerView;
  return [(UIView *)footerView isTranslucent];
}

- (void)setupRotationOrderingKeyboardInAfterRotation:(BOOL)a3
{
  self->_orderKeyboardInAfterRotating = a3;
  int64_t fromOrientation = self->_fromOrientation;
  switch(fromOrientation)
  {
    case 1:
      double v5 = 0.0;
      break;
    case 3:
      double v5 = 1.57079633;
      break;
    case 4:
      double v5 = -1.57079633;
      break;
    default:
      double v5 = 3.14159265;
      if (fromOrientation != 2) {
        double v5 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v25, v5);
  *(float64x2_t *)&v25.a = vrndaq_f64(*(float64x2_t *)&v25.a);
  *(float64x2_t *)&v25.c = vrndaq_f64(*(float64x2_t *)&v25.c);
  *(float64x2_t *)&v25.tx = vrndaq_f64(*(float64x2_t *)&v25.tx);
  CGAffineTransform v26 = v25;
  char v6 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
  [(UIView *)self->_window bounds];
  double width = v9;
  double height = v10;
  if ((v6 & 1) == 0)
  {
    CGAffineTransform v24 = v26;
    CGRect v27 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v24);
    double width = v27.size.width;
    double height = v27.size.height;
  }
  double v13 = [UIView alloc];
  [(UIView *)self->_window bounds];
  double v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
  self->_rotatingSnapshotView = v14;
  -[UIView setBounds:](v14, "setBounds:", 0.0, 0.0, width, height);
  int v15 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
  rotatingSnapshotView = self->_rotatingSnapshotView;
  if (v15)
  {
    [(UIView *)rotatingSnapshotView setAutoresizingMask:18];
  }
  else
  {
    CGAffineTransform v24 = v26;
    [(UIView *)rotatingSnapshotView setTransform:&v24];
  }
  double v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([(UIView *)self->_contentView window] == self->_window) {
    [v17 addObject:self->_contentView];
  }
  if ([(UIView *)self->_headerView window] == self->_window) {
    [v17 addObject:self->_headerView];
  }
  if ([(UIView *)self->_footerView window] == self->_window) {
    [v17 addObject:self->_footerView];
  }
  id v18 = +[UIView _topMostView:reverse:]((uint64_t)UIView, v17, 0);
  objc_msgSend((id)objc_msgSend(v18, "superview"), "insertSubview:belowSubview:", self->_rotatingSnapshotView, v18);
  if (!self->_rotationSettings.animateContentRotation)
  {
    int edgeClip = self->_rotationSettings.edgeClip;
    if (edgeClip)
    {
      double v21 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", -width, 0.0, width, height);
      [(UIView *)v21 setBackgroundColor:+[UIColor blackColor]];
      [(UIView *)v21 setAutoresizingMask:20];
      [(UIView *)self->_rotatingSnapshotView addSubview:v21];

      int edgeClip = self->_rotationSettings.edgeClip;
      if ((edgeClip & 2) == 0)
      {
LABEL_25:
        if ((edgeClip & 8) == 0) {
          goto LABEL_26;
        }
        goto LABEL_31;
      }
    }
    else if ((edgeClip & 2) == 0)
    {
      goto LABEL_25;
    }
    double v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", width, 0.0, width, height);
    [(UIView *)v22 setBackgroundColor:+[UIColor blackColor]];
    [(UIView *)v22 setAutoresizingMask:17];
    [(UIView *)self->_rotatingSnapshotView addSubview:v22];

    int edgeClip = self->_rotationSettings.edgeClip;
    if ((edgeClip & 8) == 0)
    {
LABEL_26:
      if ((edgeClip & 4) == 0) {
        return;
      }
      goto LABEL_27;
    }
LABEL_31:
    CGFloat v23 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, -height, width, height);
    [(UIView *)v23 setBackgroundColor:+[UIColor blackColor]];
    [(UIView *)v23 setAutoresizingMask:34];
    [(UIView *)self->_rotatingSnapshotView addSubview:v23];

    if ((self->_rotationSettings.edgeClip & 4) == 0) {
      return;
    }
LABEL_27:
    double v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height, width, height);
    [(UIView *)v20 setBackgroundColor:+[UIColor blackColor]];
    [(UIView *)v20 setAutoresizingMask:10];
    [(UIView *)self->_rotatingSnapshotView addSubview:v20];

    return;
  }
  if ([(UIView *)self->_contentView superview]) {
    _CreateRotationSnapshot(self->_snapshotTargetView, self->_rotatingSnapshotView, &self->_contentSnapshotViewStart, 0, (uint64_t)&self->_rotationSettings, 1, 0.0, *MEMORY[0x1E4F1DB28], *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24));
  }
}

- (void)rotateSnapshots
{
  int64_t toOrientation = self->_toOrientation;
  switch(toOrientation)
  {
    case 1:
      double v4 = 0.0;
      break;
    case 3:
      double v4 = 1.57079633;
      break;
    case 4:
      double v4 = -1.57079633;
      break;
    default:
      double v4 = 3.14159265;
      if (toOrientation != 2) {
        double v4 = 0.0;
      }
      break;
  }
  double duration = self->_duration;
  CGAffineTransformMakeRotation(&v41, v4);
  *(float64x2_t *)&v41.CGFloat a = vrndaq_f64(*(float64x2_t *)&v41.a);
  *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
  *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
  CGAffineTransform v42 = v41;
  BOOL v6 = _UIAppUseModernRotationAndPresentationBehaviors();
  [(UIView *)self->_window bounds];
  double width = v9;
  double height = v10;
  if (!v6)
  {
    CGAffineTransform v40 = v42;
    CGRect v43 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v40);
    double width = v43.size.width;
    double height = v43.size.height;
  }
  self->_headerWasHidden = [(UIView *)self->_headerView isHidden];
  self->_footerWasHidden = [(UIView *)self->_footerView isHidden];
  self->_contentWasHidden = [(UIView *)self->_contentView isHidden];
  self->_snapshotTargetWasHidden = [(UIView *)self->_snapshotTargetView isHidden];
  if (duration > 0.0)
  {
    if (!_UIAppUseModernRotationAndPresentationBehaviors())
    {
      rotatingSnapshotView = self->_rotatingSnapshotView;
      CGAffineTransform v40 = v42;
      [(UIView *)rotatingSnapshotView setTransform:&v40];
      -[UIView setBounds:](self->_rotatingSnapshotView, "setBounds:", 0.0, 0.0, width, height);
    }
    if (self->_orderKeyboardInAfterRotating) {
      [(UIView *)self->_footerView setHidden:1];
    }
    if (self->_rotationSettings.animateContentRotation)
    {
      v40.CGFloat a = 0.0;
      snapshotTargetView = self->_snapshotTargetView;
      if (snapshotTargetView)
      {
        int v15 = self->_rotatingSnapshotView;
        contentSnapshotViewStart = self->_contentSnapshotViewStart;
        double contentBottomInset = self->contentBottomInset;
        BOOL skipSnapshotOfEndState = self->_rotationSettings.skipSnapshotOfEndState;
        [(UIView *)self->_snapshotTargetView alpha];
        double v20 = v19;
        BOOL v21 = +[UIView areAnimationsEnabled];
        +[UIView setAnimationsEnabled:0];
        if (!skipSnapshotOfEndState)
        {
          [(UIView *)contentSnapshotViewStart frame];
          _CreateRotationSnapshot(snapshotTargetView, v15, (UISnapshotView **)&v40, contentSnapshotViewStart, (uint64_t)&self->_rotationSettings, 0, contentBottomInset, v25, v26, v27, v28);
          [(UIView *)snapshotTargetView setHidden:1];
          if (self->_rotationSettings.avoidFadingBottomOfContent && self->_rotationSettings.preserveHeight)
          {
            CGFloat a = v40.a;
            [*(id *)&v40.a _contentSize];
            double v30 = v29;
            [(UISnapshotView *)contentSnapshotViewStart _contentSize];
            if (v30 <= v31)
            {
              [(UIView *)v15 insertSubview:contentSnapshotViewStart below:*(void *)&a];
              objc_msgSend(*(id *)&a, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
              [*(id *)&a setAlpha:0.0];
              double v22 = 1.0;
              goto LABEL_20;
            }
            [(UIView *)contentSnapshotViewStart setBackgroundColor:+[UIColor clearColor]];
          }
        }
        -[UISnapshotView setShadowView:](contentSnapshotViewStart, "setShadowView:", 0, *(void *)&v40.a);
        double v22 = 0.0;
        CGFloat a = *(double *)&contentSnapshotViewStart;
LABEL_20:
        +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v21, *(void *)&v40.a);
        if (self->_rotationSettings.preserveHeight)
        {
          +[UIView setAnimationsEnabled:0];
          CGFloat v24 = v40.a;
          objc_msgSend(*(id *)&v40.a, "_setContentOffset:", 0.0, 0.0);
          [*(id *)&v24 layoutBelowIfNeeded];
          +[UIView setAnimationsEnabled:v21];
          -[UISnapshotView _setContentOffset:](contentSnapshotViewStart, "_setContentOffset:", 0.0, -0.0);
          objc_msgSend(*(id *)&v24, "_setContentOffset:", 0.0, 0.0);
        }
        else
        {
          CGFloat v24 = v40.a;
        }
        [*(id *)&a setAlpha:v22];
        [0 setAlpha:v20];
        [(UIView *)snapshotTargetView bounds];
        -[UIView convertRect:fromView:](v15, "convertRect:fromView:", snapshotTargetView);
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        -[UISnapshotView setFrame:](contentSnapshotViewStart, "setFrame:");
        objc_msgSend(*(id *)&v24, "setFrame:", v33, v35, v37, v39);
      }
    }
  }
}

- (void)finishFirstHalfRotation
{
  int64_t toOrientation = self->_toOrientation;
  switch(toOrientation)
  {
    case 1:
      double v4 = 0.0;
      break;
    case 3:
      double v4 = 1.57079633;
      break;
    case 4:
      double v4 = -1.57079633;
      break;
    default:
      double v4 = 3.14159265;
      if (toOrientation != 2) {
        double v4 = 0.0;
      }
      break;
  }
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeRotation(&v15, v4);
  *(float64x2_t *)&v15.CGFloat a = vrndaq_f64(*(float64x2_t *)&v15.a);
  *(float64x2_t *)&v15.c = vrndaq_f64(*(float64x2_t *)&v15.c);
  *(float64x2_t *)&v15.tx = vrndaq_f64(*(float64x2_t *)&v15.tx);
  headerView = self->_headerView;
  if (headerView)
  {
    [[(UIView *)headerView superview] bounds];
    [(UIView *)self->_headerView bounds];
    -[UIView setBounds:](self->_headerView, "setBounds:");
    [(UIView *)self->_headerView layoutIfNeeded];
  }
  if (self->_footerView)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIView *)self->_footerView bounds];
      double v7 = v6;
      double v9 = v8;
      +[UIKeyboard sizeForInterfaceOrientation:self->_toOrientation];
      -[UIView setBounds:](self->_footerView, "setBounds:", v7, v9, v10, v11);
      [(UIView *)self->_footerView activate];
    }
    else
    {
      [[(UIView *)self->_footerView superview] bounds];
      [(UIView *)self->_footerView bounds];
      -[UIView setBounds:](self->_footerView, "setBounds:");
    }
    [(UIView *)self->_footerView layoutIfNeeded];
  }
  double v12 = self->_headerView;
  CGAffineTransform v14 = v15;
  [(UIView *)v12 setTransform:&v14];
  footerView = self->_footerView;
  CGAffineTransform v14 = v15;
  [(UIView *)footerView setTransform:&v14];
  [(UIView *)self->_headerView layoutIfNeeded];
  [(UIView *)self->_footerView layoutIfNeeded];
  [(UIClientRotationContext *)self _positionHeaderView:self->_headerView andFooterView:self->_footerView outsideContentViewForInterfaceOrientation:self->_toOrientation];
}

- (void)finishFullRotateUsingOnePartAnimation:(BOOL)a3
{
  if (self->_headerSnapshotViewStart) {
    [(UIView *)self->_headerView setHidden:self->_headerWasHidden];
  }
  if (self->_footerSnapshotViewStart || self->_orderKeyboardInAfterRotating) {
    [(UIView *)self->_footerView setHidden:self->_footerWasHidden];
  }
  if (self->_contentSnapshotViewStart) {
    [(UIView *)self->_contentView setHidden:self->_contentWasHidden];
  }
  snapshotTargetView = self->_snapshotTargetView;
  if (snapshotTargetView) {
    [(UIView *)snapshotTargetView setHidden:self->_snapshotTargetWasHidden];
  }
  [(UIView *)self->_rotatingSnapshotView removeFromSuperview];

  [(UIView *)self->_footerEndSnapshotView removeFromSuperview];
  footerStartSnapshotView = self->_footerStartSnapshotView;
  [(UIView *)footerStartSnapshotView removeFromSuperview];
}

- (id)rotatingClient
{
  return self->_rotatingClient;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (BOOL)skipClientRotationCallbacks
{
  return self->_skipClientRotationCallbacks;
}

- (void)setSkipClientRotationCallbacks:(BOOL)a3
{
  self->_skipClientRotationCallbacks = a3;
}

@end