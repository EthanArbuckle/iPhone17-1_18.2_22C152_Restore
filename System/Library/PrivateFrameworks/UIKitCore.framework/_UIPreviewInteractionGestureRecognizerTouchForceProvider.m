@interface _UIPreviewInteractionGestureRecognizerTouchForceProvider
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isActive;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UITouchForceGestureRecognizer)gestureRecognizer;
- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithGestureRecognizer:(id)a3;
- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithView:(id)a3 configuration:(id)a4;
- (double)touchForce;
- (void)_handleGestureRecognizer:(id)a3;
- (void)cancelInteraction;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setGestureRecognizer:(id)a3;
@end

@implementation _UIPreviewInteractionGestureRecognizerTouchForceProvider

- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithGestureRecognizer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIPreviewInteractionGestureRecognizerTouchForceProvider.m", 33, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewInteractionGestureRecognizerTouchForceProvider;
  v7 = [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)&v11 init];
  if (v7)
  {
    [v6 addTarget:v7 action:sel__handleGestureRecognizer_];
    [v6 setDelegate:v7];
    objc_storeStrong((id *)&v7->_gestureRecognizer, a3);
    if ([(UIGestureRecognizer *)v7->_gestureRecognizer state] == UIGestureRecognizerStateBegan
      || [(UIGestureRecognizer *)v7->_gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
      [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)v7 setActive:1];
    }
    v8 = v7;
  }

  return v7;
}

- (_UIPreviewInteractionGestureRecognizerTouchForceProvider)initWithView:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIPreviewInteractionGestureRecognizerTouchForceProvider.m", 52, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  v9 = objc_alloc_init(UITouchForceGestureRecognizer);
  v10 = [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)self initWithGestureRecognizer:v9];
  if (v10)
  {
    [v7 addGestureRecognizer:v9];
    [(UITouchForceGestureRecognizer *)v9 setConfigurationBlock:v8];
    objc_super v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(UIGestureRecognizer *)self->_gestureRecognizer view];
  [v3 removeGestureRecognizer:self->_gestureRecognizer];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionGestureRecognizerTouchForceProvider;
  [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)&v4 dealloc];
}

- (double)touchForce
{
  [(UITouchForceGestureRecognizer *)self->_gestureRecognizer touchForce];
  return result;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(UIGestureRecognizer *)self->_gestureRecognizer view];
  [(UIGestureRecognizer *)self->_gestureRecognizer locationInView:v5];
  double v8 = v6;
  double v9 = v7;
  if (v4 && v5 != v4)
  {
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v6, v7);
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)cancelInteraction
{
  [(UIGestureRecognizer *)self->_gestureRecognizer setEnabled:0];
  gestureRecognizer = self->_gestureRecognizer;
  [(UIGestureRecognizer *)gestureRecognizer setEnabled:1];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v3 = [a3 view];
  if (_UIPreviewInteractionAllowedToBeginForView(v3))
  {
    id v4 = [v3 _viewControllerForAncestor];
    int v5 = _UIViewControllerIsChildOfTwoColumnSplitViewController(v4) ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)self setActive:1];
  }
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5) {
    [(_UIPreviewInteractionGestureRecognizerTouchForceProvider *)self setActive:0];
  }
}

- (UITouchForceGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end