@interface PKAnimatedNavigationBarTitleView
- (PKAnimatedNavigationBarTitleView)init;
- (PKAnimatedNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitleView:(id)a3 alpha:(double)a4;
- (void)setTitleView:(id)a3 animated:(BOOL)a4;
@end

@implementation PKAnimatedNavigationBarTitleView

- (PKAnimatedNavigationBarTitleView)init
{
  return -[PKAnimatedNavigationBarTitleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKAnimatedNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAnimatedNavigationBarTitleView;
  v3 = -[PKAnimatedNavigationBarTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKAnimatedNavigationBarTitleView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIView *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  if (titleView != v7)
  {
    v10 = titleView;
    v11 = v10;
    if (v10) {
      BOOL v12 = !v4;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      [(UIView *)v10 removeFromSuperview];
    }
    else
    {
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x1E4FB1EB0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke;
      v21[3] = &unk_1E59CA870;
      v14 = v11;
      v22 = v14;
      v23 = self;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_2;
      v18[3] = &unk_1E59CB268;
      objc_copyWeak(&v20, &location);
      v19 = v14;
      objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v21, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      v15 = [(UIView *)*p_titleView superview];

      if (v15 != self) {
        [(PKAnimatedNavigationBarTitleView *)self addSubview:*p_titleView];
      }
      [(PKAnimatedNavigationBarTitleView *)self setNeedsLayout];
      self->_viewState = !v4;
      [(PKAnimatedNavigationBarTitleView *)self layoutIfNeeded];
      v16 = *p_titleView;
      if (v4)
      {
        [(UIView *)v16 setAlpha:0.0];
        self->_viewState = 1;
        [(PKAnimatedNavigationBarTitleView *)self setNeedsLayout];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_3;
        v17[3] = &unk_1E59CA7D0;
        v17[4] = self;
        objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v17, 0);
      }
      else
      {
        [(UIView *)v16 setAlpha:1.0];
      }
    }
  }
}

uint64_t __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) bounds];
  [*(id *)(a1 + 32) frame];
  PKSizeAlignedInRect();
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setFrame:");
}

void __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 != (void *)WeakRetained[51])
    {
      BOOL v4 = WeakRetained;
      [v3 removeFromSuperview];
      WeakRetained = v4;
    }
  }
}

uint64_t __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v2 setAlpha:1.0];
}

- (void)setTitleView:(id)a3 alpha:(double)a4
{
  v7 = (UIView *)a3;
  p_titleView = (id *)&self->_titleView;
  titleView = self->_titleView;
  id v10 = v7;
  v13 = v7;
  if (titleView != v7)
  {
    [(UIView *)titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    if (!*p_titleView) {
      goto LABEL_7;
    }
    v11 = [*p_titleView superview];

    id v10 = *p_titleView;
    if (v11 != self)
    {
      [(PKAnimatedNavigationBarTitleView *)self addSubview:v10];
      [(PKAnimatedNavigationBarTitleView *)self setNeedsLayout];
      [(PKAnimatedNavigationBarTitleView *)self layoutIfNeeded];
      id v10 = *p_titleView;
    }
  }
  [v10 alpha];
  if (v12 != a4) {
    [*p_titleView setAlpha:a4];
  }
LABEL_7:
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAnimatedNavigationBarTitleView;
  [(PKAnimatedNavigationBarTitleView *)&v5 layoutSubviews];
  [(PKAnimatedNavigationBarTitleView *)self bounds];
  -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v4, v3 + -10.0);
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  -[UIView setFrame:](self->_titleView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end