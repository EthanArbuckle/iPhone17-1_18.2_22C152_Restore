@interface UITextEffectsWindow
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UITextEffectsWindow

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (_AXSAutomationEnabled())
  {
    v13.receiver = self;
    v13.super_class = (Class)UITextEffectsWindow;
    -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v13, "_accessibilityHitTest:withEvent:", v7, x, y);
    v9 = LABEL_8:;
    goto LABEL_9;
  }
  NSClassFromString(@"UIRemoteKeyboardWindow");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)UITextEffectsWindow;
    -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v12, "_accessibilityHitTest:withEvent:", v7, x, y);
    goto LABEL_8;
  }
  v8 = [(UITextEffectsWindow *)self _icaxKeyboardImpl];
  -[UITextEffectsWindow convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v9 = [v8 _accessibilityHitTest:v7];
  if (!v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)UITextEffectsWindow;
    v9 = -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v11, "_accessibilityHitTest:withEvent:", v7, x, y);
  }

LABEL_9:

  return v9;
}

@end