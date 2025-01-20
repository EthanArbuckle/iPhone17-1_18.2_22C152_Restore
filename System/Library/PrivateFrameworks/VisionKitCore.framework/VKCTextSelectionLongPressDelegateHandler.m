@interface VKCTextSelectionLongPressDelegateHandler
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (UIGestureRecognizer)gestureRecognizer;
- (VKCTextSelectionLongPressHandlerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizer:(id)a3;
@end

@implementation VKCTextSelectionLongPressDelegateHandler

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(VKCTextSelectionLongPressDelegateHandler *)self delegate];
  LOBYTE(self) = [v8 longPressHandler:self gestureRecognizer:v7 shouldRequireFailureOfGestureRecognizer:v6];

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(VKCTextSelectionLongPressDelegateHandler *)self delegate];
  LOBYTE(self) = [v8 longPressHandler:self gestureRecognizer:v7 shouldRecieveTouch:v6];

  return (char)self;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (VKCTextSelectionLongPressHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCTextSelectionLongPressHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end