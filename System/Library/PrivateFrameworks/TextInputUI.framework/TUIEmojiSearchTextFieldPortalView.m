@interface TUIEmojiSearchTextFieldPortalView
- (UIView)hitTestView;
- (void)didMoveToWindow;
- (void)removeFromSuperview;
- (void)setHitTestView:(id)a3;
@end

@implementation TUIEmojiSearchTextFieldPortalView

- (void).cxx_destruct
{
}

- (void)setHitTestView:(id)a3
{
}

- (UIView)hitTestView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestView);
  return (UIView *)WeakRetained;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiSearchTextFieldPortalView;
  [(TUIEmojiSearchTextFieldPortalView *)&v6 didMoveToWindow];
  v3 = [(TUIEmojiSearchTextFieldPortalView *)self window];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestView);
  v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained setHidden:0];

    v5 = [(_UIPortalView *)self sourceView];
    [(_UIPortalView *)self setSourceView:0];
    [(_UIPortalView *)self setSourceView:v5];
  }
  else
  {
    [WeakRetained setHidden:1];
  }
}

- (void)removeFromSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestView);
  [WeakRetained removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchTextFieldPortalView;
  [(TUIEmojiSearchTextFieldPortalView *)&v4 removeFromSuperview];
}

@end