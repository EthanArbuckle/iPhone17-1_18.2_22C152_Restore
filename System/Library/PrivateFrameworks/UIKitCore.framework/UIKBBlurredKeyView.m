@interface UIKBBlurredKeyView
- (UIKBBlurredKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (void)layoutSubviews;
- (void)setRenderConfig:(id)a3;
@end

@implementation UIKBBlurredKeyView

- (UIKBBlurredKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)UIKBBlurredKeyView;
  v5 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v12, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = +[UIKBRenderConfig defaultConfig];
    uint64_t v7 = [v6 keyBackdropStyle];

    v8 = [UIKBBackdropView alloc];
    [(UIView *)v5 bounds];
    uint64_t v9 = -[UIKBBackdropView initWithFrame:style:](v8, "initWithFrame:style:", v7);
    backdropView = v5->_backdropView;
    v5->_backdropView = (UIKBBackdropView *)v9;

    [(UIView *)v5 insertSubview:v5->_backdropView atIndex:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBBlurredKeyView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_backdropView, "setFrame:");
}

- (void)setRenderConfig:(id)a3
{
  id v4 = a3;
  if ([v4 animatedBackground]
    && ([(UIKBContainerKeyView *)self key],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 interactionType],
        v5,
        v6 == 14))
  {
    [(UIView *)self->_backdropView removeFromSuperview];
    v21.receiver = self;
    v21.super_class = (Class)UIKBBlurredKeyView;
    [(UIKBContainerKeyView *)&v21 setRenderConfig:v4];
  }
  else
  {
    if (!self->_backdropView)
    {
      uint64_t v7 = +[UIKBRenderConfig defaultConfig];
      uint64_t v8 = [v7 keyBackdropStyle];

      uint64_t v9 = [UIKBBackdropView alloc];
      [(UIView *)self bounds];
      v10 = -[UIKBBackdropView initWithFrame:style:](v9, "initWithFrame:style:", v8);
      backdropView = self->_backdropView;
      self->_backdropView = v10;

      [(UIView *)self insertSubview:self->_backdropView atIndex:0];
    }
    objc_super v12 = [(UIKBContainerKeyView *)self keyplane];
    if (([v12 visualStyling] & 0xFF00) == 0x7F00)
    {
      BOOL v13 = 1;
    }
    else
    {
      v14 = [(UIKBContainerKeyView *)self keyplane];
      BOOL v13 = [v14 visualStyle] == 5;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__UIKBBlurredKeyView_setRenderConfig___block_invoke;
    v17[3] = &unk_1E52DC3D0;
    BOOL v20 = v13;
    id v15 = v4;
    id v18 = v15;
    v19 = self;
    +[UIView performWithoutAnimation:v17];
    [(UIKBKeyView *)self configureBackdropView:self->_backdropView forRenderConfig:v15];
    v16.receiver = self;
    v16.super_class = (Class)UIKBBlurredKeyView;
    [(UIKBContainerKeyView *)&v16 setRenderConfig:v15];
  }
}

uint64_t __38__UIKBBlurredKeyView_setRenderConfig___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = 3900;
  }
  else {
    uint64_t v2 = [*(id *)(a1 + 32) keyBackdropStyle];
  }
  objc_super v3 = *(void **)(*(void *)(a1 + 40) + 600);
  return [v3 transitionToStyle:v2];
}

- (void).cxx_destruct
{
}

@end