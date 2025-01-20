@interface SFKeyboardLayoutAlignmentView
- (BOOL)automaticKeyboardFrameTrackingDisabled;
- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3;
- (SFKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3;
- (void)_addConstraints;
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

@implementation SFKeyboardLayoutAlignmentView

- (void)setAutomaticKeyboardFrameTrackingDisabled:(BOOL)a3
{
  if (self->_automaticKeyboardFrameTrackingDisabled != a3)
  {
    [(SFKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
    self->_automaticKeyboardFrameTrackingDisabled = a3;
    if (!a3)
    {
      id v6 = [(SFKeyboardLayoutAlignmentView *)self window];
      v5 = [v6 screen];
      [(SFKeyboardLayoutAlignmentView *)self _startObservingKeyboardNotificationsForScreen:v5];
    }
  }
}

- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(SFKeyboardLayoutAlignmentView *)self superview];
  v9 = [(SFKeyboardLayoutAlignmentView *)self _window];
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  objc_msgSend(v9, "convertRect:toView:", v8);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v8 bounds];
  v33.origin.double x = v18;
  v33.origin.double y = v19;
  v33.size.double width = v20;
  v33.size.double height = v21;
  v30.origin.double x = v11;
  v30.origin.double y = v13;
  v30.size.double width = v15;
  v30.size.double height = v17;
  CGRect v31 = CGRectIntersection(v30, v33);
  CGFloat v22 = v31.origin.x;
  CGFloat v23 = v31.origin.y;
  CGFloat v24 = v31.size.width;
  CGFloat v25 = v31.size.height;
  if (CGRectIsNull(v31))
  {
    CGFloat v22 = *MEMORY[0x1E4F1DAD8];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v25 = 0.0;
    CGFloat v24 = v15;
  }

  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)_updateConstraintsToMatchKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  v8[2] = *MEMORY[0x1E4F143B8];
  -[NSLayoutConstraint setConstant:](self->widthConstraint, "setConstant:", a3.size.width, a3.origin.y);
  [(NSLayoutConstraint *)self->heightConstraint setConstant:height];
  v5 = (void *)MEMORY[0x1E4F28DC8];
  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  v8[0] = self->heightConstraint;
  v8[1] = disambiguatingLeftConstraint;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v5 activateConstraints:v7];
}

- (void)_updateConstraintsForKeyboardNotification:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    v7 = [v6 valueForKey:*MEMORY[0x1E4FB2BD0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [v5 userInfo];
    CGFloat v17 = [v16 valueForKey:*MEMORY[0x1E4FB2BD8]];
    [v17 CGRectValue];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double v26 = [v5 userInfo];
    double v27 = [v26 valueForKey:*MEMORY[0x1E4FB2BA8]];
    [v27 floatValue];
    float v50 = v28;

    double v29 = [v5 userInfo];
    CGRect v30 = [v29 valueForKey:*MEMORY[0x1E4FB2BA0]];
    uint64_t v31 = [v30 integerValue];

    -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v9, v11, v13, v15);
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v19, v21, v23, v25);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    v56.origin.double x = v40;
    v56.origin.double y = v42;
    v56.size.double width = v44;
    v56.size.double height = v46;
    if (!CGRectEqualToRect(self->lastKnownKeyboardRect, v56))
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke;
      v54[3] = &unk_1E54EA190;
      v54[4] = self;
      *(CGFloat *)&v54[5] = v33;
      *(CGFloat *)&v54[6] = v35;
      *(CGFloat *)&v54[7] = v37;
      *(CGFloat *)&v54[8] = v39;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v54];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2;
      aBlock[3] = &unk_1E54EA190;
      aBlock[4] = self;
      *(CGFloat *)&aBlock[5] = v41;
      *(CGFloat *)&aBlock[6] = v43;
      *(CGFloat *)&aBlock[7] = v45;
      *(CGFloat *)&aBlock[8] = v47;
      v48 = (void (**)(void))_Block_copy(aBlock);
      v55.origin.double x = v33;
      v55.origin.double y = v35;
      v55.size.double width = v37;
      v55.size.double height = v39;
      v57.origin.double x = v41;
      v57.origin.double y = v43;
      v57.size.double width = v45;
      v57.size.double height = v47;
      if (CGRectEqualToRect(v55, v57))
      {
        v48[2](v48);
      }
      else
      {
        v49 = (void *)MEMORY[0x1E4FB1EB0];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3;
        v51[3] = &unk_1E54EA478;
        v51[4] = self;
        v52 = v48;
        [v49 animateWithDuration:v31 delay:v51 options:0 animations:v50 completion:0.0];
      }
    }
  }
}

uint64_t __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToMatchKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToMatchKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) superview];
  [v2 layoutIfNeeded];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  [(SFKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
  id v5 = [v4 screen];

  [(SFKeyboardLayoutAlignmentView *)self _startObservingKeyboardNotificationsForScreen:v5];
}

- (void)didMoveToWindow
{
  id v12 = [(SFKeyboardLayoutAlignmentView *)self superview];
  [(SFKeyboardLayoutAlignmentView *)self _removeConstraints];
  v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:4 relatedBy:0 toItem:v12 attribute:4 multiplier:1.0 constant:0.0];
  bottomConstraint = self->bottomConstraint;
  self->bottomConstraint = v3;

  id v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:0.0];
  widthConstraint = self->widthConstraint;
  self->widthConstraint = v5;

  v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:0.0];
  heightConstraint = self->heightConstraint;
  self->heightConstraint = v7;

  double v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:1 relatedBy:0 toItem:v12 attribute:1 multiplier:1.0 constant:0.0];
  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  self->disambiguatingLeftConstraint = v9;

  [(SFKeyboardLayoutAlignmentView *)self _addConstraints];
  double v11 = [(SFKeyboardLayoutAlignmentView *)self window];
  if (v11) {
    [(SFKeyboardLayoutAlignmentView *)self _matchInitialKeyboardFrame];
  }
}

- (void)_matchInitialKeyboardFrame
{
  [MEMORY[0x1E4FB1A90] visiblePeripheralFrame];
  -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:");

  -[SFKeyboardLayoutAlignmentView _updateConstraintsToMatchKeyboardFrame:](self, "_updateConstraintsToMatchKeyboardFrame:");
}

- (void)_addConstraints
{
  v5[2] = *MEMORY[0x1E4F143B8];
  widthConstraint = self->widthConstraint;
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v5[0] = self->bottomConstraint;
  v5[1] = widthConstraint;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v3 activateConstraints:v4];
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

- (SFKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFKeyboardLayoutAlignmentView;
  v3 = -[SFKeyboardLayoutAlignmentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(SFKeyboardLayoutAlignmentView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFKeyboardLayoutAlignmentView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  [(SFKeyboardLayoutAlignmentView *)self _stopObservingKeyboardNotifications];
  v3.receiver = self;
  v3.super_class = (Class)SFKeyboardLayoutAlignmentView;
  [(SFKeyboardLayoutAlignmentView *)&v3 dealloc];
}

- (void)_stopObservingKeyboardNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C28] object:0];
}

- (void)_startObservingKeyboardNotificationsForScreen:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__keyboardChanged_ name:*MEMORY[0x1E4FB2C28] object:v5];
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

  objc_storeStrong((id *)&self->_keyboardChangeNotificationForUpdateConstraints, 0);
}

@end