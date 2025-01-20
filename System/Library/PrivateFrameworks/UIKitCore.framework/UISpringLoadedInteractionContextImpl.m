@interface UISpringLoadedInteractionContextImpl
- (CGPoint)locationInView:(id)a3;
- (UIDropSession)dropSession;
- (UISpringLoadedGestureRecognizer)currentRecognizer;
- (UIView)overrideTargetView;
- (UIView)targetView;
- (id)overrideTargetItem;
- (id)targetItem;
- (int64_t)state;
- (void)setCurrentRecognizer:(id)a3;
- (void)setOverrideTargetItem:(id)a3;
- (void)setOverrideTargetView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetItem:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation UISpringLoadedInteractionContextImpl

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  v5 = [(UISpringLoadedInteractionContextImpl *)self currentRecognizer];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIDropSession)dropSession
{
  v2 = [(UISpringLoadedInteractionContextImpl *)self currentRecognizer];
  v3 = [v2 dropSession];

  return (UIDropSession *)v3;
}

- (id)targetItem
{
  return self->targetItem;
}

- (void)setTargetItem:(id)a3
{
}

- (UIView)targetView
{
  return self->targetView;
}

- (void)setTargetView:(id)a3
{
}

- (UIView)overrideTargetView
{
  return self->overrideTargetView;
}

- (void)setOverrideTargetView:(id)a3
{
}

- (id)overrideTargetItem
{
  return self->overrideTargetItem;
}

- (void)setOverrideTargetItem:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (UISpringLoadedGestureRecognizer)currentRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRecognizer);
  return (UISpringLoadedGestureRecognizer *)WeakRetained;
}

- (void)setCurrentRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentRecognizer);
  objc_storeStrong(&self->overrideTargetItem, 0);
  objc_storeStrong((id *)&self->overrideTargetView, 0);
  objc_storeStrong((id *)&self->targetView, 0);
  objc_storeStrong(&self->targetItem, 0);
}

@end