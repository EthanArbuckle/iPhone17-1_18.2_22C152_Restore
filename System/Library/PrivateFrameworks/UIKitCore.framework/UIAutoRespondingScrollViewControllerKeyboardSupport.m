@interface UIAutoRespondingScrollViewControllerKeyboardSupport
- (BOOL)registeredForNotifications;
- (BOOL)viewIsDisappearing;
- (UIAutoRespondingScrollViewControllerKeyboardSupport)initWithViewController:(id)a3;
- (double)adjustmentForKeyboard;
- (void)_adjustScrollViewForKeyboardInfo:(id)a3;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)setAdjustmentForKeyboard:(double)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setViewIsDisappearing:(BOOL)a3;
@end

@implementation UIAutoRespondingScrollViewControllerKeyboardSupport

- (void)setViewIsDisappearing:(BOOL)a3
{
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFE | a3;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFD | v3;
}

- (void)setAdjustmentForKeyboard:(double)a3
{
  self->_adjustmentForKeyboard = a3;
}

- (BOOL)registeredForNotifications
{
  return (*((unsigned __int8 *)self + 24) >> 1) & 1;
}

- (UIAutoRespondingScrollViewControllerKeyboardSupport)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAutoRespondingScrollViewControllerKeyboardSupport;
  v5 = [(UIAutoRespondingScrollViewControllerKeyboardSupport *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewController, v4);
  }

  return v6;
}

- (double)adjustmentForKeyboard
{
  return self->_adjustmentForKeyboard;
}

- (BOOL)viewIsDisappearing
{
  return *((unsigned char *)self + 24) & 1;
}

- (void)_adjustScrollViewForKeyboardInfo:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 24) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v6 = [WeakRetained viewIfLoaded];
    v7 = [v6 window];

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_viewController);
      char v9 = [v8 _isInViewControllerThatHandlesKeyboardAvoidance];

      if ((v9 & 1) == 0)
      {
        double adjustmentForKeyboard = self->_adjustmentForKeyboard;
        id v10 = objc_loadWeakRetained((id *)&self->_viewController);
        v11 = [v10 _scrollView];
        [v11 _adjustForAutomaticKeyboardInfo:v4 animated:1 lastAdjustment:&adjustmentForKeyboard];

        self->_double adjustmentForKeyboard = adjustmentForKeyboard;
      }
    }
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self _adjustScrollViewForKeyboardInfo:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  int v6 = [WeakRetained _isInViewControllerThatHandlesKeyboardAvoidance];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_viewController);
    id v8 = [v7 _scrollView];
    [v8 _setKeepsFirstResponderVisibleOnBoundsChange:1];
  }
  char v9 = objc_opt_class();
  [v9 cancelPreviousPerformRequestsWithTarget:self selector:sel__adjustScrollViewForKeyboardInfo_ object:0];
}

- (void)_keyboardDidShow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  char v3 = [WeakRetained _scrollView];
  [v3 _setKeepsFirstResponderVisibleOnBoundsChange:0];
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
  [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self performSelector:sel__adjustScrollViewForKeyboardInfo_ withObject:0 afterDelay:v4 inModes:0.0];

  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  LODWORD(v4) = [WeakRetained _isInViewControllerThatHandlesKeyboardAvoidance];

  if (v4)
  {
    id v8 = objc_loadWeakRetained((id *)p_viewController);
    id v7 = [v8 _scrollView];
    [v7 _setKeepsFirstResponderVisibleOnBoundsChange:1];
  }
}

- (void)_keyboardDidHide:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  char v3 = [WeakRetained _scrollView];
  [v3 _setKeepsFirstResponderVisibleOnBoundsChange:0];
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self _adjustScrollViewForKeyboardInfo:v4];

  v5 = objc_opt_class();
  [v5 cancelPreviousPerformRequestsWithTarget:self selector:sel__adjustScrollViewForKeyboardInfo_ object:0];
}

- (void).cxx_destruct
{
}

@end