@interface SBHFocusProxyView
- (BOOL)canBecomeFocused;
- (SBHFocusProxyView)initWithProxyableView:(id)a3;
- (SBHFocusProxyable)proxyableView;
- (double)padding;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFrame:(CGRect)a3;
@end

@implementation SBHFocusProxyView

- (SBHFocusProxyView)initWithProxyableView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v8.receiver = self;
  v8.super_class = (Class)SBHFocusProxyView;
  v5 = -[SBHFocusProxyView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_proxyableView, v4);
    v6->_padding = 1.0;
    [(SBHFocusProxyView *)v6 setFocusEffect:0];
  }

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  CGRect v5 = CGRectInset(a3, -self->_padding, -self->_padding);
  v4.receiver = self;
  v4.super_class = (Class)SBHFocusProxyView;
  -[SBHFocusProxyView setFrame:](&v4, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (BOOL)canBecomeFocused
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyableView);
  char v3 = [WeakRetained focusProxyCanBecomeFocused];

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  p_proxyableView = &self->_proxyableView;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxyableView);
  [WeakRetained didUpdateFocusInContext:v7 withAnimationCoordinator:v6];
}

- (SBHFocusProxyable)proxyableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyableView);
  return (SBHFocusProxyable *)WeakRetained;
}

- (double)padding
{
  return self->_padding;
}

- (void).cxx_destruct
{
}

@end