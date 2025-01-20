@interface BFFPasscodeView
- (BFFPasscodeView)initWithFrame:(CGRect)a3;
- (BOOL)alwaysBounceVertical;
- (CGRect)currentKeyboardFrame;
- (UIViewController)passcodeViewController;
- (id)passcodeInputView;
- (void)animateTransitionToPasscodeInput:(id)a3 animation:(unint64_t)a4;
- (void)dealloc;
- (void)keyboardWillShow:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentKeyboardFrame:(CGRect)a3;
- (void)setPasscodeViewController:(id)a3;
- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4;
@end

@implementation BFFPasscodeView

- (BFFPasscodeView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BFFPasscodeView;
  v3 = -[BFFTitleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

    v5 = +[BFFStyle sharedStyle];
    v6 = [v5 backgroundColor];
    [(BFFPasscodeView *)v3 setBackgroundColor:v6];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BFFPasscodeView;
  [(BFFPasscodeView *)&v4 dealloc];
}

- (id)passcodeInputView
{
  return self->_passcodeInputView;
}

- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  objc_super v8 = [(BFFPasscodeView *)self passcodeInputView];
  [v8 setEnabled:0];

  v9 = [(BFFPasscodeView *)self passcodeInputView];
  [v9 setDelegate:0];

  [(BFFPasscodeInputView *)self->_passcodeInputView removeFromSuperview];
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  if (self->_passcodeInputView)
  {
    -[BFFPasscodeView addSubview:](self, "addSubview:");
    v10 = [(BFFPasscodeView *)self passcodeInputView];
    [v10 setDelegate:v7];
  }
  [(BFFPasscodeView *)self setNeedsLayout];
}

- (void)animateTransitionToPasscodeInput:(id)a3 animation:(unint64_t)a4
{
  id v7 = a3;
  unsigned __int8 v8 = [(BFFPasscodeView *)self _shouldReverseLayoutDirection];
  if (((a4 == 2) & v8) != 0) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = a4;
  }
  if (((a4 == 1) & v8) != 0) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = [(BFFPasscodeView *)self passcodeInputView];
  v12 = [v11 delegate];
  [v11 setEnabled:0];
  [v11 setDelegate:0];
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  [v7 becomeFirstResponder];
  v13 = [(BFFPasscodeView *)self passcodeInputView];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [(BFFPasscodeView *)self bounds];
  double v23 = v22;
  [v11 center];
  double v25 = v24;
  double v27 = v26;
  double v28 = v24 + v23;
  double v29 = v24 - v23;
  objc_msgSend(v7, "setFrame:", v15, v17, v19, v21);
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 == 3) {
      [v7 setAlpha:0.0];
    }
  }
  else
  {
    if (v10 == 2) {
      double v30 = v28;
    }
    else {
      double v30 = v29;
    }
    objc_msgSend(v7, "setCenter:", v30, v27);
  }
  [(BFFPasscodeView *)self addSubview:v7];
  if (v10 == 1) {
    unsigned int v31 = 1;
  }
  else {
    unsigned int v31 = 2;
  }
  if (v10 == 3) {
    unsigned int v32 = 6;
  }
  else {
    unsigned int v32 = 0;
  }
  if ((unint64_t)(v10 - 1) >= 2) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = v31;
  }
  v34 = (void *)MEMORY[0x263F82E00];
  [MEMORY[0x263F82DE0] defaultDurationForTransition:v33];
  double v36 = v35;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke;
  v44[3] = &unk_26454AF48;
  uint64_t v47 = v10;
  id v45 = v11;
  double v48 = v29;
  double v49 = v27;
  double v50 = v28;
  double v51 = v27;
  id v46 = v7;
  double v52 = v25;
  double v53 = v27;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke_2;
  v40[3] = &unk_26454AF70;
  id v41 = v45;
  id v42 = v46;
  id v43 = v12;
  id v37 = v12;
  id v38 = v46;
  id v39 = v45;
  [v34 animateWithDuration:v44 animations:v40 completion:v36];
}

uint64_t __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke(uint64_t result)
{
  v1 = (double *)result;
  uint64_t v2 = *(void *)(result + 48);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 == 3)
    {
      [*(id *)(result + 32) setAlpha:0.0];
      uint64_t v10 = (void *)*((void *)v1 + 5);
      return [v10 setAlpha:1.0];
    }
  }
  else
  {
    v3 = *(void **)(result + 32);
    BOOL v4 = v2 == 2;
    uint64_t v5 = 10;
    if (v4) {
      uint64_t v5 = 8;
    }
    uint64_t v6 = 9;
    if (v4) {
      uint64_t v6 = 7;
    }
    objc_msgSend(v3, "setCenter:", v1[v6], v1[v5]);
    id v7 = (void *)*((void *)v1 + 5);
    double v8 = v1[11];
    double v9 = v1[12];
    return objc_msgSend(v7, "setCenter:", v8, v9);
  }
  return result;
}

uint64_t __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setDelegate:v3];
}

- (void)keyboardWillShow:(id)a3
{
  BOOL v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[BFFPasscodeView setCurrentKeyboardFrame:](self, "setCurrentKeyboardFrame:", v7, v9, v11, v13);
  [(BFFPasscodeView *)self setNeedsLayout];
}

- (void)setCurrentKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_currentKeyboardFrame = &self->_currentKeyboardFrame;
  if (!CGRectEqualToRect(a3, self->_currentKeyboardFrame))
  {
    p_currentKeyboardFrame->origin.CGFloat x = x;
    p_currentKeyboardFrame->origin.CGFloat y = y;
    p_currentKeyboardFrame->size.CGFloat width = width;
    p_currentKeyboardFrame->size.CGFloat height = height;
    [(BFFPasscodeView *)self contentInset];
    -[BFFPasscodeView setContentInset:](self, "setContentInset:");
  }
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)BFFPasscodeView;
  [(BFFTitleView *)&v50 layoutSubviews];
  uint64_t v3 = [(BFFPasscodeView *)self passcodeInputView];

  if (v3)
  {
    if (BFFIsiPhone())
    {
      BOOL v4 = [MEMORY[0x263F82B60] mainScreen];
      [v4 bounds];
      double v6 = v5;

      if (v6 <= 480.01)
      {
        double v7 = [(BFFTitleView *)self titleLabel];
        [v7 _firstLineBaselineFrameOriginY];
        double v9 = v8;

        double v10 = [(BFFTitleView *)self titleLabel];
        [v10 _setFirstLineBaselineFrameOriginY:v9 + -25.0];

        double v11 = [(BFFTitleView *)self titleLabel];
        [v11 frame];
        double v13 = v12;
        CGFloat v15 = v14;
        double v17 = v16;
        double v19 = v18;

        double v20 = [(BFFPasscodeView *)self passcodeViewController];
        double v21 = [v20 navigationController];
        double v22 = [v21 navigationBar];

        if (v22)
        {
          [v22 frame];
          double MaxY = CGRectGetMaxY(v51);
          v52.origin.CGFloat x = v13;
          v52.origin.CGFloat y = v15;
          v52.size.CGFloat width = v17;
          v52.size.CGFloat height = v19;
          if (CGRectGetMinY(v52) < MaxY)
          {
            double v24 = [(BFFTitleView *)self titleLabel];
            objc_msgSend(v24, "setFrame:", v13, MaxY, v17, v19);
          }
        }
      }
    }
    [(BFFTitleView *)self contentBounds];
    double v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    uint64_t v33 = [(BFFTitleView *)self titleLabel];
    [v33 frame];
    double v34 = CGRectGetMaxY(v53);

    v54.origin.CGFloat x = v26;
    v54.origin.CGFloat y = v28;
    v54.size.CGFloat width = v30;
    v54.size.CGFloat height = v32;
    double v35 = CGRectGetMaxY(v54);
    [(BFFPasscodeView *)self currentKeyboardFrame];
    double v36 = v34;
    if (v37 > 0.0)
    {
      -[BFFPasscodeView convertPoint:toView:](self, "convertPoint:toView:", 0, 0.0, v35);
      double v39 = v38;
      [(BFFPasscodeView *)self currentKeyboardFrame];
      double MinY = CGRectGetMinY(v55);
      if (v39 <= MinY) {
        double v36 = 0.0;
      }
      else {
        double v36 = v39 - MinY;
      }
    }
    double v41 = v35 - v36;
    id v42 = [(BFFPasscodeView *)self passcodeInputView];
    v56.origin.CGFloat x = v26;
    v56.origin.CGFloat y = v28;
    v56.size.CGFloat width = v30;
    v56.size.CGFloat height = v32;
    objc_msgSend(v42, "sizeThatFits:", CGRectGetWidth(v56), v41 - v34);
    double v44 = v43;
    double v46 = v45;

    uint64_t v47 = [(BFFPasscodeView *)self passcodeInputView];
    objc_msgSend(v47, "setFrame:", v26, v34, v44, v46);

    double v48 = [(BFFPasscodeView *)self passcodeInputView];
    [v48 layoutSubviews];

    [(BFFPasscodeView *)self bounds];
    -[BFFPasscodeView setContentSize:](self, "setContentSize:", v49, v34 + v46);
  }
}

- (BOOL)alwaysBounceVertical
{
  uint64_t v3 = [(BFFTitleView *)self titleLabel];
  [v3 frame];
  double MaxY = CGRectGetMaxY(v10);
  double v5 = [(BFFPasscodeView *)self passcodeInputView];
  [v5 intrinsicContentSize];
  double v7 = MaxY + v6;

  [(BFFPasscodeView *)self contentSize];
  return v7 > v8;
}

- (UIViewController)passcodeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPasscodeViewController:(id)a3
{
}

- (CGRect)currentKeyboardFrame
{
  double x = self->_currentKeyboardFrame.origin.x;
  double y = self->_currentKeyboardFrame.origin.y;
  double width = self->_currentKeyboardFrame.size.width;
  double height = self->_currentKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passcodeViewController);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);
}

@end