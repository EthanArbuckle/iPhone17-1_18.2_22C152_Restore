@interface _UIFeedbackGeneratorGestureRecognizerCompletedTouch
+ (id)completedTouchFromTouch:(id)a3;
- (BOOL)_isPointerTouch;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationInWindow;
- (UIWindow)window;
- (int64_t)type;
- (unint64_t)_pointerSenderID;
- (unint64_t)_senderID;
- (void)setLocationInWindow:(CGPoint)a3;
@end

@implementation _UIFeedbackGeneratorGestureRecognizerCompletedTouch

+ (id)completedTouchFromTouch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  *((void *)v5 + 2) = [v4 type];
  *((unsigned char *)v5 + 8) = [v4 _isPointerTouch];
  *((void *)v5 + 4) = [v4 _pointerSenderID];
  *((void *)v5 + 3) = [v4 _senderID];
  v6 = [v4 window];
  objc_storeWeak((id *)v5 + 5, v6);

  double v7 = -[UITouch _locationInWindow:]((double *)v4, 0);
  uint64_t v9 = v8;

  *((double *)v5 + 6) = v7;
  *((void *)v5 + 7) = v9;
  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  p_window = &self->_window;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_window);
  objc_msgSend(v5, "convertPoint:fromView:", WeakRetained, self->_locationInWindow.x, self->_locationInWindow.y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)_senderID
{
  return self->_senderID;
}

- (BOOL)_isPointerTouch
{
  return self->_pointerTouch;
}

- (unint64_t)_pointerSenderID
{
  return self->_pointerSenderID;
}

- (CGPoint)locationInWindow
{
  double x = self->_locationInWindow.x;
  double y = self->_locationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInWindow:(CGPoint)a3
{
  self->_locationInWindow = a3;
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end