@interface UIKBViewBackedKeyView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5;
- (UIKBBackdropView)backdropView;
- (UIKBKeyViewContentView)contentView;
- (UIKBViewBackedKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIView)touchForwardingView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)renderFlagsForTraits:(id)a3;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDrawFrame:(CGRect)a3;
- (void)setRenderConfig:(id)a3;
- (void)setTouchForwardingView:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
@end

@implementation UIKBViewBackedKeyView

- (UIKBViewBackedKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBViewBackedKeyView;
  v5 = -[UIKBKeyView initWithFrame:keyplane:key:](&v8, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5) {
    [(UIView *)v5 setUserInteractionEnabled:1];
  }
  return v6;
}

- (id)renderFlagsForTraits:(id)a3
{
  id v4 = a3;
  v5 = [v4 geometry];
  int v6 = [v5 detachedVariants];

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKBViewBackedKeyView;
    v7 = [(UIKBKeyView *)&v9 renderFlagsForTraits:v4];
  }
  else
  {
    v7 = &unk_1ED3F1780;
  }

  return v7;
}

- (void)setRenderConfig:(id)a3
{
  id v4 = a3;
  v5 = [(UIKBKeyView *)self factory];
  int v6 = [(UIKBKeyView *)self key];
  v7 = [(UIKBKeyView *)self keyplane];
  objc_super v8 = [v5 traitsForKey:v6 onKeyplane:v7];

  if (([v8 blurBlending] & 1) != 0
    || ([v8 variantTraits],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 blurBlending],
        v9,
        v10))
  {
    if (!self->_backdropView)
    {
      v11 = +[UIKBRenderConfig defaultConfig];
      uint64_t v12 = [v11 keyBackdropStyle];

      v13 = [UIKBBackdropView alloc];
      [(UIView *)self bounds];
      v14 = -[UIKBBackdropView initWithFrame:style:](v13, "initWithFrame:style:", v12);
      [(UIKBViewBackedKeyView *)self setBackdropView:v14];

      v15 = [(UIKBViewBackedKeyView *)self backdropView];
      [(UIView *)self addSubview:v15];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__UIKBViewBackedKeyView_setRenderConfig___block_invoke;
    v19[3] = &unk_1E52D9F98;
    v19[4] = self;
    id v16 = v4;
    id v20 = v16;
    +[UIView performWithoutAnimation:v19];
    v17 = [(UIKBViewBackedKeyView *)self backdropView];
    [(UIKBKeyView *)self configureBackdropView:v17 forRenderConfig:v16];
  }
  [(UIKBKeyViewContentView *)self->_contentView updateRenderConfig:v4];
  v18.receiver = self;
  v18.super_class = (Class)UIKBViewBackedKeyView;
  [(UIKBKeyView *)&v18 setRenderConfig:v4];
}

void __41__UIKBViewBackedKeyView_setRenderConfig___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v2, "transitionToStyle:", objc_msgSend(*(id *)(a1 + 40), "keyBackdropStyle"));
}

- (void)setDrawFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBViewBackedKeyView;
  -[UIKBKeyView setDrawFrame:](&v4, sel_setDrawFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self setNeedsLayout];
}

- (void)setContentView:(id)a3
{
  v5 = (UIKBKeyViewContentView *)a3;
  contentView = self->_contentView;
  v7 = v5;
  if (contentView != v5)
  {
    [(UIKBKeyViewContentView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)self addSubview:v7];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBViewBackedKeyView;
  id v6 = a4;
  id v7 = a3;
  [(UIKBKeyView *)&v8 updateForKeyplane:v7 key:v6];
  -[UIKBKeyViewContentView updateForKeyplane:key:](self->_contentView, "updateForKeyplane:key:", v7, v6, v8.receiver, v8.super_class);
}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  contentView = self->_contentView;
  id v10 = a3;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", contentView, x, y);
  LOBYTE(a5) = -[UIKBKeyViewContentView retestSelectedVariantIndexForKey:atPoint:phase:](self->_contentView, "retestSelectedVariantIndexForKey:atPoint:phase:", v10, a5);

  return a5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(UIKBViewBackedKeyView *)self touchForwardingView];
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    unsigned __int8 v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBViewBackedKeyView;
    unsigned __int8 v9 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v10 = v9;

  return v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(UIKBViewBackedKeyView *)self touchForwardingView];
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    uint64_t v9 = objc_msgSend(v8, "hitTest:withEvent:", v7);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBViewBackedKeyView;
    uint64_t v9 = -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  }
  BOOL v10 = (void *)v9;

  return v10;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)UIKBViewBackedKeyView;
  [(UIView *)&v20 layoutSubviews];
  v3 = [(UIKBKeyView *)self factory];
  objc_super v4 = [(UIKBKeyView *)self key];
  v5 = [(UIKBKeyView *)self keyplane];
  id v6 = [v3 traitsForKey:v4 onKeyplane:v5];

  id v7 = [v6 variantTraits];
  objc_super v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 geometry];
    [v9 symbolFrame];
    -[UIKBKeyViewContentView setFrame:](self->_contentView, "setFrame:");
  }
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  objc_super v18 = [(UIKBViewBackedKeyView *)self backdropView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(UIKBViewBackedKeyView *)self backdropView];
  [(UIView *)self sendSubviewToBack:v19];
}

- (UIKBKeyViewContentView)contentView
{
  return self->_contentView;
}

- (UIView)touchForwardingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchForwardingView);
  return (UIView *)WeakRetained;
}

- (void)setTouchForwardingView:(id)a3
{
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_destroyWeak((id *)&self->_touchForwardingView);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end