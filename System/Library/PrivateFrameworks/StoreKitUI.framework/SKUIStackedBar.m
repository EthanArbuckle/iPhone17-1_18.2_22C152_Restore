@interface SKUIStackedBar
- (BOOL)alwaysShowsBackButton;
- (BOOL)hidesStatusBar;
- (BOOL)lastItemExpanded;
- (BOOL)splitViewStyle;
- (BOOL)zeroHeightWhenFirstChildExpanded;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)items;
- (SKUIStackedBar)initWithFrame:(CGRect)a3;
- (SKUIStackedBarDelegate)delegate;
- (double)offset;
- (void)_backAction:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_reload;
- (void)_resetNewOffset;
- (void)_selectItemAtIndex:(int64_t)a3;
- (void)animateToFullSizeIfNecessary;
- (void)layoutSubviews;
- (void)setAlwaysShowsBackButton:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesStatusBar:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setLastItemExpanded:(BOOL)a3;
- (void)setLastItemExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setOffset:(double)a3;
- (void)setSplitViewStyle:(BOOL)a3;
- (void)setZeroHeightWhenFirstChildExpanded:(BOOL)a3;
- (void)sizeToFit;
@end

@implementation SKUIStackedBar

- (SKUIStackedBar)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SKUIStackedBar;
  v3 = -[SKUIStackedBar initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
    backdropView = v3->_backdropView;
    v3->_backdropView = (_UIBackdropView *)v4;

    [(SKUIStackedBar *)v3 addSubview:v3->_backdropView];
    v3->_lastItemExpanded = 1;
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    wrapperView = v3->_wrapperView;
    v3->_wrapperView = v6;

    [(UIView *)v3->_wrapperView setClipsToBounds:1];
    [(SKUIStackedBar *)v3 addSubview:v3->_wrapperView];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    maskView = v3->_maskView;
    v3->_maskView = v8;

    v10 = [(UIView *)v3->_maskView layer];
    v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    [v10 setCompositingFilter:v11];

    v12 = v3->_maskView;
    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(UIView *)v3->_wrapperView addSubview:v3->_maskView];
  }
  return v3;
}

- (void)setItems:(id)a3
{
  v5 = (NSArray *)a3;
  p_items = &self->_items;
  if (self->_items != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_items, a3);
    p_items = (NSArray **)[(SKUIStackedBar *)self _reload];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_items, v5);
}

- (void)setLastItemExpanded:(BOOL)a3
{
}

- (void)setLastItemExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_lastItemExpanded != a3)
  {
    if (a4)
    {
      [(SKUIStackedBar *)self layoutIfNeeded];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke;
      v7[3] = &unk_1E64260E0;
      v7[4] = self;
      BOOL v8 = a3;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke_2;
      v6[3] = &unk_1E64223D0;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.2];
    }
    else
    {
      self->_lastItemExpanded = a3;
      [(SKUIStackedBar *)self _reload];
    }
  }
}

uint64_t __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 440) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _reload];
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, v5, v8, v9);
  v10 = *(void **)(a1 + 32);

  return [v10 layoutIfNeeded];
}

uint64_t __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reload];
}

- (void)setOffset:(double)a3
{
  if (!self->_splitViewStyle && self->_offset != a3)
  {
    self->_double offset = a3;
    -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double offset = self->_offset;
    if (offset < self->_newOffset && offset > -v4) {
      self->_newOffset = offset;
    }
    [(SKUIStackedBar *)self frame];
    -[SKUIStackedBar setFrame:](self, "setFrame:");
    [(SKUIStackedBar *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SKUIStackedBar;
  [(SKUIStackedBar *)&v22 layoutSubviews];
  backdropView = self->_backdropView;
  [(SKUIStackedBar *)self bounds];
  -[_UIBackdropView setFrame:](backdropView, "setFrame:");
  [(SKUIStackedBar *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[UIView setFrame:](self->_wrapperView, "setFrame:", v5, v9 - v10, v7, v10);
  [(SKUIStackedBar *)self bounds];
  maskView = self->_maskView;
  -[UIView convertRect:fromView:](self->_wrapperView, "convertRect:fromView:", self);
  -[UIView setFrame:](maskView, "setFrame:");
  [(UIView *)self->_wrapperView frame];
  [(UIView *)self->_maskView setHidden:v12 >= 0.0];
  [(UIView *)self->_wrapperView bounds];
  double v14 = v13;
  if ([(NSArray *)self->_cells count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [(NSArray *)self->_cells objectAtIndex:v15];
      [(SKUIStackedBar *)self bounds];
      objc_msgSend(v16, "sizeThatFits:", CGRectGetWidth(v23), 0.0);
      CGFloat v19 = v17;
      double v20 = v18;
      if (v15)
      {
        double v21 = 0.0;
      }
      else
      {
        double v21 = 0.0;
        if (!self->_hidesStatusBar)
        {
          if (self->_splitViewStyle)
          {
            double v21 = 0.0;
          }
          else
          {
            double v20 = v18 + 20.0;
            double v21 = 20.0;
          }
        }
      }
      objc_msgSend(v16, "setFrame:", 0.0, v14, v17, v20);
      objc_msgSend(v16, "setTitleEdgeInsets:", v21, 50.0, 0.0, 50.0);
      v24.origin.x = 0.0;
      v24.origin.y = v14;
      v24.size.width = v19;
      v24.size.height = v20;
      double v14 = v14 + CGRectGetHeight(v24);

      ++v15;
    }
    while (v15 < [(NSArray *)self->_cells count]);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = [(NSArray *)self->_items count];
  if (!v5)
  {
    double v6 = 44.0;
    goto LABEL_10;
  }
  if (v5 != 1)
  {
    if (self->_lastItemExpanded)
    {
LABEL_8:
      double v6 = (double)(v5 - 1) * 25.0 + 44.0;
      goto LABEL_10;
    }
LABEL_9:
    double v6 = (double)v5 * 25.0;
    goto LABEL_10;
  }
  if (!self->_lastItemExpanded) {
    goto LABEL_9;
  }
  double v6 = 0.0;
  if (!self->_zeroHeightWhenFirstChildExpanded) {
    goto LABEL_8;
  }
LABEL_10:
  if (!self->_hidesStatusBar && !self->_splitViewStyle) {
    double v6 = v6 + 20.0;
  }
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)sizeToFit
{
  [(SKUIStackedBar *)self frame];
  double v4 = v3;
  double v6 = v5;
  -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", v7, v8);

  -[SKUIStackedBar setFrame:](self, "setFrame:", v4, v6, v9, v10);
}

- (void)animateToFullSizeIfNecessary
{
  if (!self->_splitViewStyle)
  {
    [(SKUIStackedBar *)self frame];
    double v4 = v3;
    -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    if (v4 > 64.0 && v4 < v5)
    {
      double v7 = v5;
      [(SKUIStackedBar *)self frame];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      [(SKUIStackedBar *)self bounds];
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      [(SKUIStackedBar *)self bounds];
      double offset = self->_offset;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke;
      v25[3] = &unk_1E6426108;
      v25[4] = self;
      v25[5] = v9;
      v25[6] = v11;
      v25[7] = v13;
      *(double *)&v25[8] = v7;
      v25[9] = v15;
      v25[10] = v17;
      v25[11] = v19;
      *(double *)&v25[12] = v7;
      v25[13] = v21;
      v25[14] = v22;
      v25[15] = v23;
      v25[16] = 0x4034000000000000;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke_2;
      v24[3] = &unk_1E6426130;
      v24[4] = self;
      *(double *)&v24[5] = offset;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v25 animations:v24 completion:0.3];
    }
  }
}

uint64_t __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  double v2 = *(void **)(*(void *)(a1 + 32) + 464);
  double v3 = *(double *)(a1 + 104);
  double v4 = *(double *)(a1 + 112);
  double v5 = *(double *)(a1 + 120);
  double v6 = *(double *)(a1 + 128);

  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

double __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = *(double **)(a1 + 32);
    double result = v3[56];
    if (result == *(double *)(a1 + 40))
    {
      [v3 setNeedsLayout];
      uint64_t v5 = *(void *)(a1 + 32);
      double result = *(double *)(v5 + 448);
      *(double *)(v5 + 472) = result;
    }
  }
  return result;
}

- (void)_buttonAction:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_cells indexOfObject:a3];

  [(SKUIStackedBar *)self _selectItemAtIndex:v4];
}

- (void)_backAction:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_items count] - 2;

  [(SKUIStackedBar *)self _selectItemAtIndex:v4];
}

- (void)_resetNewOffset
{
  self->_newOffset = self->_offset;
}

- (void)_reload
{
  double v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_cells];
  if ([(NSArray *)self->_items count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NSArray *)self->_items objectAtIndex:v4];
      if (v4 >= [(NSArray *)v3 count])
      {
        double v6 = objc_alloc_init(SKUIStackedBarCell);
        [(SKUIStackedBarCell *)v6 addTarget:self action:sel__buttonAction_ forControlEvents:64];
        [(UIView *)self->_wrapperView addSubview:v6];
        [(NSArray *)v3 addObject:v6];
      }
      else
      {
        double v6 = [(NSArray *)v3 objectAtIndex:v4];
      }
      double v7 = [v5 title];
      [(SKUIStackedBarCell *)v6 setTitle:v7 forState:0];

      BOOL v8 = !self->_alwaysShowsBackButton && [(NSArray *)self->_items count] < 2
        || [(SKUIStackedBar *)self splitViewStyle];
      uint64_t v9 = [(SKUIStackedBarCell *)v6 backButton];
      [v9 setHidden:v8];

      uint64_t v10 = [(SKUIStackedBarCell *)v6 backButton];
      [v10 addTarget:self action:sel__backAction_ forControlEvents:64];

      BOOL v11 = self->_lastItemExpanded && v4 == [(NSArray *)self->_items count] - 1;
      [(SKUIStackedBarCell *)v6 setExpanded:v11];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_items count]);
  }
  cells = self->_cells;
  self->_cells = v3;
  uint64_t v13 = v3;

  [(UIView *)self->_wrapperView bringSubviewToFront:self->_maskView];

  [(SKUIStackedBar *)self setNeedsLayout];
}

- (void)_selectItemAtIndex:(int64_t)a3
{
  id v5 = [(SKUIStackedBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 stackedBar:self didSelectItemAtIndex:a3];
  }
}

- (SKUIStackedBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIStackedBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)alwaysShowsBackButton
{
  return self->_alwaysShowsBackButton;
}

- (void)setAlwaysShowsBackButton:(BOOL)a3
{
  self->_alwaysShowsBackButton = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)lastItemExpanded
{
  return self->_lastItemExpanded;
}

- (BOOL)hidesStatusBar
{
  return self->_hidesStatusBar;
}

- (void)setHidesStatusBar:(BOOL)a3
{
  self->_hidesStatusBar = a3;
}

- (BOOL)splitViewStyle
{
  return self->_splitViewStyle;
}

- (void)setSplitViewStyle:(BOOL)a3
{
  self->_splitViewStyle = a3;
}

- (BOOL)zeroHeightWhenFirstChildExpanded
{
  return self->_zeroHeightWhenFirstChildExpanded;
}

- (void)setZeroHeightWhenFirstChildExpanded:(BOOL)a3
{
  self->_zeroHeightWhenFirstChildExpanded = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end