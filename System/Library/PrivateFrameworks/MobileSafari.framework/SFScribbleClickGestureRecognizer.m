@interface SFScribbleClickGestureRecognizer
- (SFScribbleClickGestureRecognizer)initWithOverlay:(id)a3;
- (void)_cancelClickIfNeeded:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SFScribbleClickGestureRecognizer

- (SFScribbleClickGestureRecognizer)initWithOverlay:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFScribbleClickGestureRecognizer;
  v5 = [(SFScribbleClickGestureRecognizer *)&v9 initWithTarget:0 action:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_overlay, v4);
    v7 = v6;
  }

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SFScribbleClickGestureRecognizer;
  id v6 = a3;
  [(SFScribbleClickGestureRecognizer *)&v12 touchesBegan:v6 withEvent:a4];
  self->_canDispatchClick = 1;
  p_touchStartLocation = &self->_touchStartLocation;
  v8 = objc_msgSend(v6, "anyObject", v12.receiver, v12.super_class);

  objc_super v9 = [(SFScribbleClickGestureRecognizer *)self view];
  [v8 locationInView:v9];
  p_touchStartLocation->x = v10;
  p_touchStartLocation->y = v11;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SFScribbleClickGestureRecognizer;
  id v6 = a3;
  [(SFScribbleClickGestureRecognizer *)&v8 touchesMoved:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  [(SFScribbleClickGestureRecognizer *)self _cancelClickIfNeeded:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SFScribbleClickGestureRecognizer;
  [(SFScribbleClickGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  self->_canDispatchClick = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SFScribbleClickGestureRecognizer;
  id v6 = a3;
  [(SFScribbleClickGestureRecognizer *)&v9 touchesEnded:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);

  [(SFScribbleClickGestureRecognizer *)self _cancelClickIfNeeded:v7];
  if (self->_canDispatchClick)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_overlay);
    [WeakRetained _didReceiveTapOrClick:self];
  }
}

- (void)_cancelClickIfNeeded:(id)a3
{
  id v4 = a3;
  if (self->_canDispatchClick)
  {
    id v10 = v4;
    objc_super v5 = [(SFScribbleClickGestureRecognizer *)self view];
    [v10 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    id v4 = v10;
    if ((v9 - self->_touchStartLocation.y) * (v9 - self->_touchStartLocation.y)
       + (v7 - self->_touchStartLocation.x) * (v7 - self->_touchStartLocation.x) > 200.0)
      self->_canDispatchClick = 0;
  }
}

- (void).cxx_destruct
{
}

@end