@interface _UITouchFallbackView
- (_UITouchFallbackView)initWithFrame:(CGRect)a3;
- (_UITouchFallbackViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (void)setDelegate:(id)a3;
@end

@implementation _UITouchFallbackView

- (_UITouchFallbackView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITouchFallbackView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];

    [(UIView *)v4 _setDisableDictationTouchCancellation:1];
  }
  return v4;
}

- (int)textEffectsVisibilityLevel
{
  return 6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITouchFallbackView;
  v8 = -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  uint64_t v9 = [(_UITouchFallbackView *)self delegate];
  if (v9
    && (v10 = (void *)v9,
        [(_UITouchFallbackView *)self delegate],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend(v11, "touchFallbackView:shouldHitTestAtLocation:withEvent:", self, v7, x, y),
        v11,
        v10,
        !v12))
  {
    id v13 = 0;
  }
  else
  {
    id v13 = v8;
  }

  return v13;
}

- (_UITouchFallbackViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UITouchFallbackViewDelegate *)a3;
}

@end