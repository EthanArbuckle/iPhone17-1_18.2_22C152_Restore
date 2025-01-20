@interface UIKBResizingKeyplanePanGestureRecognizer
- (BOOL)_willScrollY;
- (UIKBResizingKeyplanePanGestureRecognizerDelegate)resizingDelegate;
- (void)setResizingDelegate:(id)a3;
@end

@implementation UIKBResizingKeyplanePanGestureRecognizer

- (BOOL)_willScrollY
{
  v3 = [(UIKBResizingKeyplanePanGestureRecognizer *)self resizingDelegate];
  v4 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self translationInView:v4];
  if ([v3 shouldStartResizeForTranslationY:v5])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKBResizingKeyplanePanGestureRecognizer;
    BOOL v6 = [(UIPanGestureRecognizer *)&v8 _willScrollY];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (UIKBResizingKeyplanePanGestureRecognizerDelegate)resizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resizingDelegate);
  return (UIKBResizingKeyplanePanGestureRecognizerDelegate *)WeakRetained;
}

- (void)setResizingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end