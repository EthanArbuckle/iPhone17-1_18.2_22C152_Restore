@interface _UIKBCompatInputView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_hasAutolayoutHeightConstraint;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_compatibleBounds;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)snapshotView;
- (UIView)touchableView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)addSubview:(id)a3;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTouchableView:(id)a3;
@end

@implementation _UIKBCompatInputView

- (void)dealloc
{
  snapshotView = self->_snapshotView;
  self->_snapshotView = 0;

  touchableView = self->_touchableView;
  self->_touchableView = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIKBCompatInputView;
  [(UIView *)&v5 dealloc];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKBCompatInputView;
  [(UIView *)&v4 addSubview:a3];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (UIView)touchableView
{
  touchableView = self->_touchableView;
  if (touchableView)
  {
    v3 = touchableView;
  }
  else
  {
    objc_super v4 = [(UIView *)self subviews];
    v3 = [v4 firstObject];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIKBCompatInputView;
  -[UIView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_UIKBCompatInputView *)self touchableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIKBCompatInputView;
  -[UIView setBounds:](&v9, sel_setBounds_);
  double v8 = [(_UIKBCompatInputView *)self touchableView];
  objc_msgSend(v8, "setFrame:", x, y, width, height);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIKBCompatInputView *)self touchableView];
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    char v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIKBCompatInputView *)self touchableView];
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    char v9 = objc_msgSend(v8, "hitTest:withEvent:", v7);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (CGRect)_compatibleBounds
{
  v3 = [(_UIKBCompatInputView *)self touchableView];
  double v4 = v3;
  if (v3)
  {
    [v3 _compatibleBounds];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIKBCompatInputView;
    [(UIView *)&v17 _compatibleBounds];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(UIView *)self _rootInputWindowController];
  if (![v3 isRotating]) {
    goto LABEL_13;
  }
  double v4 = +[UIKeyboardInputModeController sharedInputModeController];
  double v5 = [v4 currentInputMode];
  int v6 = [v5 isExtensionInputMode];

  if (v6)
  {
    int64_t v7 = +[UIKeyboardSceneDelegate interfaceOrientation];
    double v8 = +[UIKeyboardInputModeController sharedInputModeController];
    double v9 = [v8 currentInputMode];
    v3 = +[UICompatibilityInputViewController inputSnapshotViewForInputMode:v9 orientation:1];

    double v10 = +[UIKeyboardInputModeController sharedInputModeController];
    double v11 = [v10 currentInputMode];
    double v12 = +[UICompatibilityInputViewController inputSnapshotViewForInputMode:v11 orientation:4];

    if (!v3 || !v12) {
      goto LABEL_12;
    }
    unint64_t v13 = v7 - 3;
    double v14 = [(_UIKBCompatInputView *)self touchableView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    if (v13 > 1)
    {
      [v12 bounds];
      double v25 = v24;
      double v27 = v26;

      if (v16 != v25) {
        goto LABEL_12;
      }
      v23 = v3;
      if (v18 != v27) {
        goto LABEL_12;
      }
    }
    else
    {
      [v3 bounds];
      double v20 = v19;
      double v22 = v21;

      if (v16 != v20 || (v23 = v12, v18 != v22))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    [v23 bounds];
    double v29 = v28;
    double v31 = v30;

    goto LABEL_19;
  }
LABEL_14:
  v32 = [(_UIKBCompatInputView *)self snapshotView];

  if (v32)
  {
    v33 = [(_UIKBCompatInputView *)self snapshotView];
    [v33 bounds];
    double v29 = v34;
    double v31 = v35;
  }
  else
  {
    v36 = [(_UIKBCompatInputView *)self touchableView];

    if (!v36)
    {
      v43.receiver = self;
      v43.super_class = (Class)_UIKBCompatInputView;
      [(UIView *)&v43 intrinsicContentSize];
      double v29 = v41;
      double v31 = v42;
      goto LABEL_19;
    }
    v33 = [(_UIKBCompatInputView *)self touchableView];
    [v33 intrinsicContentSize];
    double v29 = v37;
    double v31 = v38;
  }

LABEL_19:
  double v39 = v29;
  double v40 = v31;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(_UIKBCompatInputView *)self touchableView];
  int64_t v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIKBCompatInputView;
    -[UIView sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 sizeDidChange]) {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIKBCompatInputView;
  [(UIView *)&v5 _didChangeKeyplaneWithContext:v4];
}

- (BOOL)_hasAutolayoutHeightConstraint
{
  v3 = [(_UIKBCompatInputView *)self touchableView];

  if (!v3) {
    return 1;
  }
  id v4 = [(_UIKBCompatInputView *)self touchableView];
  char v5 = [v4 _hasAutolayoutHeightConstraint];

  return v5;
}

- (void)setTouchableView:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_touchableView, 0);
}

@end