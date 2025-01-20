@interface TUIKeyboardAvoidingSupport
- (BOOL)registeredForNotifications;
- (BOOL)viewIsDisappearing;
- (TUIKeyboardAvoidingSupport)initWithViewController:(id)a3;
- (TUIKeyboardAvoidingSupportViewController)viewController;
- (double)_keyboardOverlapInView:(id)a3 usingKeyboardInfo:(id)a4;
- (double)adjustmentForKeyboard;
- (void)_adjustScrollViewForKeyboardInfo:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)dealloc;
- (void)registerForNotifications;
- (void)setAdjustmentForKeyboard:(double)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setViewIsDisappearing:(BOOL)a3;
- (void)unregisterForNotifications;
@end

@implementation TUIKeyboardAvoidingSupport

- (TUIKeyboardAvoidingSupport)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIKeyboardAvoidingSupport;
  v5 = [(TUIKeyboardAvoidingSupport *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewController, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUIKeyboardAvoidingSupport;
  [(TUIKeyboardAvoidingSupport *)&v4 dealloc];
}

- (void)registerForNotifications
{
  if (!self->_registeredForNotifications)
  {
    id v7 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_super v4 = [WeakRetained tui_keyboardAvoidingScrollView];
    v5 = [v4 window];
    v6 = [v5 screen];

    [v7 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:v6];
    [v7 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:v6];
    [v7 addObserver:self selector:"_keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:v6];
    self->_registeredForNotifications = 1;
  }
}

- (void)unregisterForNotifications
{
  if (self->_registeredForNotifications)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self];

    self->_registeredForNotifications = 0;
  }
}

- (void)_keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  [(TUIKeyboardAvoidingSupport *)self _adjustScrollViewForKeyboardInfo:v4];

  v5 = objc_opt_class();

  _[v5 cancelPreviousPerformRequestsWithTarget:self selector:"_adjustScrollViewForKeyboardInfo:" object:0];
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = +[NSArray arrayWithObject:NSRunLoopCommonModes];
  [(TUIKeyboardAvoidingSupport *)self performSelector:"_adjustScrollViewForKeyboardInfo:" withObject:0 afterDelay:v4 inModes:0.0];
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  [(TUIKeyboardAvoidingSupport *)self _adjustScrollViewForKeyboardInfo:v4];

  v5 = objc_opt_class();

  _[v5 cancelPreviousPerformRequestsWithTarget:self selector:"_adjustScrollViewForKeyboardInfo:" object:0];
}

- (void)_adjustScrollViewForKeyboardInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v6 = [WeakRetained tui_keyboardAvoidingScrollView];

    if (!self->_viewIsDisappearing)
    {
      id v7 = [v6 window];

      if (v7)
      {
        double adjustmentForKeyboard = self->_adjustmentForKeyboard;
        [(TUIKeyboardAvoidingSupport *)self _keyboardOverlapInView:v6 usingKeyboardInfo:v4];
        if (adjustmentForKeyboard != v9)
        {
          double v10 = v9;
          [v6 contentInset];
          uint64_t v32 = v12;
          uint64_t v33 = v11;
          double v14 = v13;
          uint64_t v16 = v15;
          [v6 verticalScrollIndicatorInsets];
          uint64_t v18 = v17;
          uint64_t v20 = v19;
          uint64_t v22 = v21;
          double v23 = v10 - adjustmentForKeyboard;
          double v24 = v10 - adjustmentForKeyboard + v14;
          double v26 = v23 + v25;
          v27 = [v4 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
          [v27 doubleValue];
          double v29 = v28;
          v30 = [v4 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
          unint64_t v31 = (unint64_t)[v30 integerValue] | 4;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1286BC;
          v34[3] = &unk_254290;
          id v35 = v6;
          uint64_t v36 = v33;
          uint64_t v37 = v32;
          double v38 = v24;
          uint64_t v39 = v16;
          uint64_t v40 = v18;
          uint64_t v41 = v20;
          double v42 = v26;
          uint64_t v43 = v22;
          +[UIView animateWithDuration:v31 delay:v34 options:0 animations:v29 completion:0.0];

          double adjustmentForKeyboard = v10;
        }
        self->_double adjustmentForKeyboard = adjustmentForKeyboard;
      }
    }
  }
}

- (double)_keyboardOverlapInView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v5 = a3;
  v6 = [a4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  if (v6)
  {
    id v7 = [v5 window];
    [v6 CGRectValue];
    [v7 convertRect:0 fromWindow:];
    [v5 convertRect:0 fromView:0];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    [v5 bounds];
    double MaxY = CGRectGetMaxY(v21);
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    double v17 = MaxY - CGRectGetMinY(v22);
    [v5 safeAreaInsets];
    double v19 = fmax(v17 - v18, 0.0);
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)viewIsDisappearing
{
  return self->_viewIsDisappearing;
}

- (void)setViewIsDisappearing:(BOOL)a3
{
  self->_viewIsDisappearing = a3;
}

- (TUIKeyboardAvoidingSupportViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (TUIKeyboardAvoidingSupportViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (double)adjustmentForKeyboard
{
  return self->_adjustmentForKeyboard;
}

- (void)setAdjustmentForKeyboard:(double)a3
{
  self->_double adjustmentForKeyboard = a3;
}

- (void).cxx_destruct
{
}

@end