@interface UIEditMenuConfiguration
+ (UIEditMenuConfiguration)configurationWithIdentifier:(id)identifier sourcePoint:(CGPoint)sourcePoint;
- (BOOL)_ignoresKeyboardAvoidance;
- (BOOL)_ignoresPassthroughInView;
- (BOOL)_prefersMenuPresentationInView;
- (CGPoint)sourcePoint;
- (UIEditMenuArrowDirection)preferredArrowDirection;
- (UIResponder)_firstResponderTarget;
- (UIWindow)_overrideSourceWindow;
- (id)description;
- (id)identifier;
- (unint64_t)_preferredElementDisplayMode;
- (void)setIdentifier:(id)a3;
- (void)setPreferredArrowDirection:(UIEditMenuArrowDirection)preferredArrowDirection;
- (void)setSourcePoint:(CGPoint)a3;
- (void)set_firstResponderTarget:(id)a3;
- (void)set_ignoresKeyboardAvoidance:(BOOL)a3;
- (void)set_ignoresPassthroughInView:(BOOL)a3;
- (void)set_overrideSourceWindow:(id)a3;
- (void)set_preferredElementDisplayMode:(unint64_t)a3;
- (void)set_prefersMenuPresentationInView:(BOOL)a3;
@end

@implementation UIEditMenuConfiguration

+ (UIEditMenuConfiguration)configurationWithIdentifier:(id)identifier sourcePoint:(CGPoint)sourcePoint
{
  double y = sourcePoint.y;
  double x = sourcePoint.x;
  id v7 = identifier;
  id v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v7)
  {
    [v8 setIdentifier:v7];
  }
  else
  {
    v10 = [MEMORY[0x1E4F29128] UUID];
    [v9 setIdentifier:v10];
  }
  objc_msgSend(v9, "setSourcePoint:", x, y);
  objc_msgSend(v9, "set_ignoresPassthroughInView:", 0);
  objc_msgSend(v9, "set_preferredElementDisplayMode:", 0);

  return (UIEditMenuConfiguration *)v9;
}

- (id)description
{
  v3 = [self _ui_descriptionBuilder];
  v4 = [(UIEditMenuConfiguration *)self identifier];
  id v5 = (id)[v3 appendName:@"identifier" object:v4];

  [(UIEditMenuConfiguration *)self sourcePoint];
  v6 = NSStringFromCGPoint(v14);
  id v7 = (id)[v3 appendName:@"sourcePoint" object:v6];

  unint64_t v8 = [(UIEditMenuConfiguration *)self preferredArrowDirection] - 1;
  if (v8 > 3) {
    v9 = @".automatic";
  }
  else {
    v9 = off_1E530F948[v8];
  }
  id v10 = (id)[v3 appendName:@"arrowDirection" object:v9];
  v11 = [v3 string];

  return v11;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGPoint)sourcePoint
{
  double x = self->_sourcePoint.x;
  double y = self->_sourcePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->_sourcePoint = a3;
}

- (UIEditMenuArrowDirection)preferredArrowDirection
{
  return self->_preferredArrowDirection;
}

- (void)setPreferredArrowDirection:(UIEditMenuArrowDirection)preferredArrowDirection
{
  self->_preferredArrowDirection = preferredArrowDirection;
}

- (BOOL)_ignoresPassthroughInView
{
  return self->__ignoresPassthroughInView;
}

- (void)set_ignoresPassthroughInView:(BOOL)a3
{
  self->__ignoresPassthroughInView = a3;
}

- (BOOL)_prefersMenuPresentationInView
{
  return self->__prefersMenuPresentationInView;
}

- (void)set_prefersMenuPresentationInView:(BOOL)a3
{
  self->__prefersMenuPresentationInView = a3;
}

- (UIResponder)_firstResponderTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__firstResponderTarget);
  return (UIResponder *)WeakRetained;
}

- (void)set_firstResponderTarget:(id)a3
{
}

- (UIWindow)_overrideSourceWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__overrideSourceWindow);
  return (UIWindow *)WeakRetained;
}

- (void)set_overrideSourceWindow:(id)a3
{
}

- (BOOL)_ignoresKeyboardAvoidance
{
  return self->__ignoresKeyboardAvoidance;
}

- (void)set_ignoresKeyboardAvoidance:(BOOL)a3
{
  self->__ignoresKeyboardAvoidance = a3;
}

- (unint64_t)_preferredElementDisplayMode
{
  return self->__preferredElementDisplayMode;
}

- (void)set_preferredElementDisplayMode:(unint64_t)a3
{
  self->__preferredElementDisplayMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__overrideSourceWindow);
  objc_destroyWeak((id *)&self->__firstResponderTarget);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end