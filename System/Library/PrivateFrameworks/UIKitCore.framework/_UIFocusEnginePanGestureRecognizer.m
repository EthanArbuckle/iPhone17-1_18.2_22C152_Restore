@interface _UIFocusEnginePanGestureRecognizer
- (_UIFocusEnginePanGestureTouchObserver)touchObserver;
- (void)setTouchObserver:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIFocusEnginePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  id v6 = a4;
  [(UIPanGestureRecognizer *)&v16 touchesBegan:a3 withEvent:v6];
  v7 = [(UIGestureRecognizer *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(UIGestureRecognizer *)self delegate];
    int v10 = [v9 focusEnginePanGestureRecognizerShouldRecognizeImmediately:self];

    if (v10) {
      [(UIGestureRecognizer *)self setState:1];
    }
  }
  v11 = [(_UIFocusEnginePanGestureRecognizer *)self touchObserver];
  [v6 _digitizerLocation];
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v11, "focusEnginePanGesture:touchBeganAtDigitizerLocation:", self, v13, v15);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  id v6 = a4;
  [(UIPanGestureRecognizer *)&v12 touchesMoved:a3 withEvent:v6];
  v7 = [(_UIFocusEnginePanGestureRecognizer *)self touchObserver];
  [v6 _digitizerLocation];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchMovedToDigitizerLocation:", self, v9, v11);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  id v6 = a4;
  [(UIPanGestureRecognizer *)&v12 touchesEnded:a3 withEvent:v6];
  v7 = [(_UIFocusEnginePanGestureRecognizer *)self touchObserver];
  [v6 _digitizerLocation];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchEndedAtDigitizerLocation:", self, v9, v11);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  id v6 = a4;
  [(UIPanGestureRecognizer *)&v12 touchesCancelled:a3 withEvent:v6];
  v7 = [(_UIFocusEnginePanGestureRecognizer *)self touchObserver];
  [v6 _digitizerLocation];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchCancelledAtDigitizerLocation:", self, v9, v11);
}

- (_UIFocusEnginePanGestureTouchObserver)touchObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
  return (_UIFocusEnginePanGestureTouchObserver *)WeakRetained;
}

- (void)setTouchObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end