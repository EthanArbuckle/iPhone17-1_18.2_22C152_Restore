@interface _UINavigationBarGestureHandler
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (UINavigationBar)navigationBar;
- (_UINavigationBarGestureHandler)initWithNavigationBar:(id)a3;
- (_UINavigationBarGestureHandlerDelegate)delegate;
- (int64_t)idiom;
- (void)_handlePopSwipe:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdiom:(int64_t)a3;
@end

@implementation _UINavigationBarGestureHandler

- (_UINavigationBarGestureHandler)initWithNavigationBar:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarGestureHandler;
  v5 = [(_UINavigationBarGestureHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navigationBar, v4);
    v7 = [[UISwipeGestureRecognizer alloc] initWithTarget:v6 action:sel__handlePopSwipe_];
    popSwipeGestureRecognizer = v6->_popSwipeGestureRecognizer;
    v6->_popSwipeGestureRecognizer = v7;

    [(UIGestureRecognizer *)v6->_popSwipeGestureRecognizer setDelegate:v6];
    [v4 addGestureRecognizer:v6->_popSwipeGestureRecognizer];
  }

  return v6;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  if (self->_popSwipeGestureRecognizer != a3) {
    return 1;
  }
  id v4 = self;
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = objc_loadWeakRetained((id *)&v4->_navigationBar);
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  LOBYTE(v4) = objc_msgSend(WeakRetained, "shouldGestureHandler:recognizedPopAtLocation:", v4, v10, v12);
  return (char)v4;
}

- (void)_handlePopSwipe:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_navigationBar);
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(WeakRetained, "gestureHandler:recognizedPopAtLocation:", self, v8, v10);
}

- (void)setIdiom:(int64_t)a3
{
  if (self->_idiom != a3)
  {
    self->_idiom = a3;
    popSwipeGestureRecognizer = self->_popSwipeGestureRecognizer;
    if (a3 == 3)
    {
      id v4 = self->_popSwipeGestureRecognizer;
      [(UIGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1ED3EF200];
    }
    else
    {
      -[UIGestureRecognizer _defaultAllowedTouchTypes](self->_popSwipeGestureRecognizer);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(UIGestureRecognizer *)popSwipeGestureRecognizer setAllowedTouchTypes:v5];
    }
  }
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (_UINavigationBarGestureHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationBarGestureHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_storeStrong((id *)&self->_popSwipeGestureRecognizer, 0);
}

@end