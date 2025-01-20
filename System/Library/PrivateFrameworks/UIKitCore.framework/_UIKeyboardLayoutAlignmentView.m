@interface _UIKeyboardLayoutAlignmentView
+ (BOOL)_shouldIgnoreFrameChangeNotification:(id)a3 inView:(id)a4;
+ (CGRect)_endFrameForNotification:(id)a3 inView:(id)a4;
+ (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3 inView:(id)a4;
- (BOOL)_shouldOverrideAnimationForFrameChangeNotification:(id)a3;
- (BOOL)automaticKeyboardFrameTrackingDisabled;
- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3;
- (_UIKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3;
- (void)_createConstraints;
- (void)_matchInitialKeyboardFrame;
- (void)_removeConstraints;
- (void)_startObservingKeyboardNotificationsForScreen:(id)a3;
- (void)_stopObservingKeyboardNotifications;
- (void)_updateConstraintsForKeyboardNotification:(id)a3;
- (void)_updateConstraintsToMatchKeyboardFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setAutomaticKeyboardFrameTrackingDisabled:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIKeyboardLayoutAlignmentView

- (void)setAutomaticKeyboardFrameTrackingDisabled:(BOOL)a3
{
  if (self->_automaticKeyboardFrameTrackingDisabled != a3)
  {
    [(_UIKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
    self->_automaticKeyboardFrameTrackingDisabled = a3;
    if (!a3)
    {
      id v6 = [(UIView *)self window];
      v5 = [v6 screen];
      [(_UIKeyboardLayoutAlignmentView *)self _startObservingKeyboardNotificationsForScreen:v5];
    }
  }
}

+ (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = [v8 superview];
  v10 = [v8 _window];

  v11 = [v10 screen];
  v12 = [v11 coordinateSpace];
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  [v9 bounds];
  v36.origin.double x = v21;
  v36.origin.double y = v22;
  v36.size.double width = v23;
  v36.size.double height = v24;
  v33.origin.double x = v14;
  v33.origin.double y = v16;
  v33.size.double width = v18;
  v33.size.double height = v20;
  CGRect v34 = CGRectIntersection(v33, v36);
  CGFloat v25 = v34.origin.x;
  CGFloat v26 = v34.origin.y;
  CGFloat v27 = v34.size.width;
  CGFloat v28 = v34.size.height;
  if (CGRectIsNull(v34))
  {
    CGFloat v25 = *MEMORY[0x1E4F1DAD8];
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v28 = 0.0;
    CGFloat v27 = v18;
  }

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_opt_class();
  objc_msgSend(v8, "_frameInBoundsForKeyboardFrame:inView:", self, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)_updateConstraintsToMatchKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  v9[2] = *MEMORY[0x1E4F143B8];
  -[NSLayoutConstraint setConstant:](self->widthConstraint, "setConstant:", a3.size.width, a3.origin.y);
  [(NSLayoutConstraint *)self->heightConstraint setConstant:height];
  v5 = [(UIView *)self superview];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F5B268];
    disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
    v9[0] = self->heightConstraint;
    v9[1] = disambiguatingLeftConstraint;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    [v6 activateConstraints:v8];
  }
}

+ (BOOL)_shouldIgnoreFrameChangeNotification:(id)a3 inView:(id)a4
{
  id v5 = a4;
  id v6 = [a3 userInfo];
  v7 = [v6 objectForKey:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    double v9 = [v5 keyboardSceneDelegate];
    int v10 = [v9 isOnScreen] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_shouldOverrideAnimationForFrameChangeNotification:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKey:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (CGRect)_endFrameForNotification:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 userInfo];
  double v9 = [v8 valueForKey:@"UIKeyboardFrameEndUserInfoKey"];
  [v9 CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  LODWORD(v8) = [a1 _shouldIgnoreFrameChangeNotification:v7 inView:v6];
  if (v8)
  {
    CGFloat v18 = [v6 window];
    +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", [v18 interfaceOrientation]);
    double v15 = v19;
    double v17 = v20;

    CGFloat v21 = [v6 _window];
    CGFloat v22 = [v21 screen];
    [v22 bounds];
    double v13 = CGRectGetHeight(v35) - v17;
  }
  objc_msgSend(a1, "_frameInBoundsForKeyboardFrame:inView:", v6, v11, v13, v15, v17);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)_updateConstraintsForKeyboardNotification:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 valueForKey:@"UIKeyboardFrameBeginUserInfoKey"];
    [v7 CGRectValue];
    rect2.origin.double x = v8;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    [(id)objc_opt_class() _endFrameForNotification:v5 inView:self];
    double v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v23 = [v5 userInfo];
    double v24 = [v23 valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"];
    [v24 floatValue];
    double v26 = v25;

    BOOL v27 = [(_UIKeyboardLayoutAlignmentView *)self _shouldOverrideAnimationForFrameChangeNotification:v5];
    double v28 = 0.3;
    if (!v27) {
      double v28 = v26;
    }
    double v47 = v28;
    CGFloat v29 = v16;
    double v30 = [v5 userInfo];
    double v31 = [v30 valueForKey:@"UIKeyboardAnimationCurveUserInfoKey"];
    uint64_t v32 = [v31 integerValue];

    -[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", rect2.origin.x, v10, v12, v14);
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    p_lastKnownKeyboardRect = &self->lastKnownKeyboardRect;
    v56.origin.double x = v29;
    v56.origin.double y = v18;
    v56.size.double width = v20;
    v56.size.double height = v22;
    if (!CGRectEqualToRect(self->lastKnownKeyboardRect, v56))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke;
      aBlock[3] = &unk_1E52DA520;
      aBlock[4] = self;
      *(CGFloat *)&aBlock[5] = v29;
      *(CGFloat *)&aBlock[6] = v18;
      *(CGFloat *)&aBlock[7] = v20;
      *(CGFloat *)&aBlock[8] = v22;
      v42 = _Block_copy(aBlock);
      if ([(_UIKeyboardLayoutAlignmentView *)self _shouldOverrideAnimationForFrameChangeNotification:v5])
      {
        goto LABEL_9;
      }
      v55.origin.double x = v34;
      v55.origin.double y = v36;
      v55.size.double width = v38;
      v55.size.double height = v40;
      v57.origin.double x = v29;
      v57.origin.double y = v18;
      v57.size.double width = v20;
      v57.size.double height = v22;
      if (CGRectEqualToRect(v55, v57)
        || ([(UIView *)self superview],
            v43 = objc_claimAutoreleasedReturnValue(),
            char v44 = objc_msgSend(v43, "_is_needsLayout"),
            v43,
            (v44 & 1) != 0))
      {
        +[UIView performWithoutAnimation:v42];
      }
      else
      {
LABEL_9:
        *(void *)&rect2.origin.double y = MEMORY[0x1E4F143A8];
        *(void *)&rect2.size.double width = 3221225472;
        *(void *)&rect2.size.double height = __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2;
        v49 = &unk_1E52EBE88;
        double v52 = v47;
        uint64_t v53 = v32;
        v50 = self;
        id v51 = v42;
        v45 = (void (**)(void))_Block_copy(&rect2.origin.y);
        if ([(_UIKeyboardLayoutAlignmentView *)self _shouldOverrideAnimationForFrameChangeNotification:v5])
        {
          v46 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
          [v46 performBlock:v45];
        }
        else
        {
          v45[2](v45);
        }
      }
    }
    p_lastKnownKeyboardRect->origin.double x = v29;
    p_lastKnownKeyboardRect->origin.double y = v18;
    p_lastKnownKeyboardRect->size.double width = v20;
    p_lastKnownKeyboardRect->size.double height = v22;
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  [(_UIKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
  id v5 = [v4 screen];

  [(_UIKeyboardLayoutAlignmentView *)self _startObservingKeyboardNotificationsForScreen:v5];
}

- (void)didMoveToWindow
{
  [(_UIKeyboardLayoutAlignmentView *)self _removeConstraints];
  [(_UIKeyboardLayoutAlignmentView *)self _createConstraints];
}

- (void)_createConstraints
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [(UIView *)self superview];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    bottomConstraint = self->bottomConstraint;
    self->bottomConstraint = v4;

    id v6 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:0.0];
    widthConstraint = self->widthConstraint;
    self->widthConstraint = v6;

    CGFloat v8 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:0.0];
    heightConstraint = self->heightConstraint;
    self->heightConstraint = v8;

    double v10 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
    disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
    self->disambiguatingLeftConstraint = v10;

    double v12 = (void *)MEMORY[0x1E4F5B268];
    double v13 = self->widthConstraint;
    v16[0] = self->bottomConstraint;
    v16[1] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v12 activateConstraints:v14];

    double v15 = [(UIView *)self window];
    if (v15) {
      [(_UIKeyboardLayoutAlignmentView *)self _matchInitialKeyboardFrame];
    }
  }
}

- (void)_matchInitialKeyboardFrame
{
  v3 = [(UIView *)self keyboardSceneDelegate];
  int v4 = [v3 isOnScreen];

  if (v4)
  {
    id v5 = [(UIView *)self keyboardSceneDelegate];
    [v5 visibleFrameInView:0];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    -[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v7, v9, v11, v13);
    -[_UIKeyboardLayoutAlignmentView _updateConstraintsToMatchKeyboardFrame:](self, "_updateConstraintsToMatchKeyboardFrame:");
  }
}

- (void)_removeConstraints
{
  [(NSLayoutConstraint *)self->bottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->widthConstraint setActive:0];
  [(NSLayoutConstraint *)self->heightConstraint setActive:0];
  [(NSLayoutConstraint *)self->disambiguatingLeftConstraint setActive:0];
  bottomConstraint = self->bottomConstraint;
  self->bottomConstraint = 0;

  widthConstraint = self->widthConstraint;
  self->widthConstraint = 0;

  heightConstraint = self->heightConstraint;
  self->heightConstraint = 0;

  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  self->disambiguatingLeftConstraint = 0;
}

- (_UIKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardLayoutAlignmentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  [(_UIKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardLayoutAlignmentView;
  [(UIView *)&v3 dealloc];
}

- (void)_stopObservingKeyboardNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];
}

- (void)_startObservingKeyboardNotificationsForScreen:(id)a3
{
  if (a3)
  {
    int v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__keyboardChanged_ name:@"UIKeyboardPrivateWillChangeFrameNotification" object:v5];
  }
}

- (BOOL)automaticKeyboardFrameTrackingDisabled
{
  return self->_automaticKeyboardFrameTrackingDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disambiguatingLeftConstraint, 0);
  objc_storeStrong((id *)&self->heightConstraint, 0);
  objc_storeStrong((id *)&self->widthConstraint, 0);
  objc_storeStrong((id *)&self->bottomConstraint, 0);
}

@end