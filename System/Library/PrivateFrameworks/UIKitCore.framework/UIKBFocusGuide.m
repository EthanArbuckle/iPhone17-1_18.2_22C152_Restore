@interface UIKBFocusGuide
- (BOOL)_ignoresSpeedBumpEdges;
- (BOOL)_isUnclippable;
- (BOOL)_isUnoccludable;
- (UIKBFocusGuideDelegate)keyboardDelegate;
- (float)_focusPriority;
- (id)description;
- (id)focusGuideRegion:(id)a3 preferredFocusEnvironmentsForMovementRequest:(id)a4;
- (unint64_t)focusHeading;
- (void)_didUpdateFocusToPreferredFocusedView;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setKeyboardDelegate:(id)a3;
@end

@implementation UIKBFocusGuide

- (void)_didUpdateFocusToPreferredFocusedView
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBFocusGuide;
  [(UIFocusGuide *)&v4 _didUpdateFocusToPreferredFocusedView];
  v3 = [(UIKBFocusGuide *)self keyboardDelegate];
  objc_msgSend(v3, "didFocusGuideWithHeading:", -[UIKBFocusGuide focusHeading](self, "focusHeading"));
}

- (BOOL)_isUnoccludable
{
  return 1;
}

- (BOOL)_isUnclippable
{
  return 1;
}

- (float)_focusPriority
{
  return 1000.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 1;
}

- (id)focusGuideRegion:(id)a3 preferredFocusEnvironmentsForMovementRequest:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBFocusGuide;
  objc_super v4 = [(UIFocusGuide *)&v6 focusGuideRegion:a3 preferredFocusEnvironmentsForMovementRequest:a4];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)UIKBFocusGuide;
  objc_super v4 = [(UIFocusGuide *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, focusHeading = %u", v4, -[UIKBFocusGuide focusHeading](self, "focusHeading")];

  return v5;
}

- (unint64_t)focusHeading
{
  return self->focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->focusHeading = a3;
}

- (UIKBFocusGuideDelegate)keyboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardDelegate);
  return (UIKBFocusGuideDelegate *)WeakRetained;
}

- (void)setKeyboardDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end