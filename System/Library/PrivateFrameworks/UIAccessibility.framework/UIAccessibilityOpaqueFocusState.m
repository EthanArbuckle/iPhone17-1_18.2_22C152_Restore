@interface UIAccessibilityOpaqueFocusState
- (BOOL)hasBeenReused;
- (BOOL)hasFocus;
- (CGRect)sceneRelativeFrame;
- (UIView)reusableView;
- (id)description;
- (id)element;
- (void)setElement:(id)a3;
- (void)setHasBeenReused:(BOOL)a3;
- (void)setHasFocus:(BOOL)a3;
- (void)setReusableView:(id)a3;
- (void)setSceneRelativeFrame:(CGRect)a3;
@end

@implementation UIAccessibilityOpaqueFocusState

- (id)description
{
  v3 = [(UIAccessibilityOpaqueFocusState *)self element];

  if (v3)
  {
    v4 = NSString;
    BOOL v5 = [(UIAccessibilityOpaqueFocusState *)self hasFocus];
    v6 = [(UIAccessibilityOpaqueFocusState *)self element];
    v7 = [(UIAccessibilityOpaqueFocusState *)self element];
    v8 = [v7 accessibilityLabel];
    [(UIAccessibilityOpaqueFocusState *)self sceneRelativeFrame];
    v9 = NSStringFromCGRect(v14);
    v10 = [(UIAccessibilityOpaqueFocusState *)self reusableView];
    v11 = [v4 stringWithFormat:@"Has focus: %i\nElement: %@ (%@)\nScene relative frame: %@\nReusable view: %@\nHas been reused: %i", v5, v6, v8, v9, v10, -[UIAccessibilityOpaqueFocusState hasBeenReused](self, "hasBeenReused")];
  }
  else
  {
    v11 = @"No focused element";
  }

  return v11;
}

- (void)setElement:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_element);

  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_element, obj);
    [(UIAccessibilityOpaqueFocusState *)self setHasFocus:obj != 0];
    if (obj)
    {
      if (([obj isAccessibilityElement] & 1) == 0
        && ([obj isAccessibilityOpaqueElementProvider] & 1) == 0
        && ([obj _accessibilityIsRemoteElement] & 1) == 0
        && ([obj _accessibilityIsGroupedParent] & 1) == 0)
      {
        id v5 = [obj description];
        [v5 UTF8String];
        _AXAssert();
      }
    }
  }
}

- (id)element
{
  id WeakRetained = objc_loadWeakRetained(&self->_element);

  return WeakRetained;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (CGRect)sceneRelativeFrame
{
  double x = self->_sceneRelativeFrame.origin.x;
  double y = self->_sceneRelativeFrame.origin.y;
  double width = self->_sceneRelativeFrame.size.width;
  double height = self->_sceneRelativeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSceneRelativeFrame:(CGRect)a3
{
  self->_sceneRelativeFrame = a3;
}

- (UIView)reusableView
{
  return self->_reusableView;
}

- (void)setReusableView:(id)a3
{
}

- (BOOL)hasBeenReused
{
  return self->_hasBeenReused;
}

- (void)setHasBeenReused:(BOOL)a3
{
  self->_hasBeenReused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableView, 0);

  objc_destroyWeak(&self->_element);
}

@end