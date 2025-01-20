@interface SUUICrossFadingTabBar
- (NSArray)tabBarButtons;
- (SUUICrossFadingTabBar)initWithFrame:(CGRect)a3;
- (SUUIScrollingTabBarBackgroundView)backgroundView;
- (void)layoutSubviews;
- (void)setTabBarButtons:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUUICrossFadingTabBar

- (SUUICrossFadingTabBar)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUUICrossFadingTabBar;
  v3 = -[SUUICrossFadingTabBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUICrossFadingTabBar *)v3 bounds];
    v9 = -[SUUIScrollingTabBarBackgroundView initWithFrame:]([SUUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v5, v6, v7, v8);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v9;

    [(SUUIScrollingTabBarBackgroundView *)v4->_backgroundView setShowsBackdrop:1];
    [(SUUIScrollingTabBarBackgroundView *)v4->_backgroundView setShowsTopHairline:1];
    [(SUUICrossFadingTabBar *)v4 addSubview:v4->_backgroundView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SUUICrossFadingTabBar;
  [(SUUICrossFadingTabBar *)&v18 layoutSubviews];
  [(SUUICrossFadingTabBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[SUUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  NSUInteger v11 = [(NSArray *)self->_tabBarButtons count];
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGRectGetWidth(v19);
  UICeilToViewScale();
  uint64_t v13 = v12;
  uint64_t v14 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUUICrossFadingTabBar semanticContentAttribute](self, "semanticContentAttribute"));
  tabBarButtons = self->_tabBarButtons;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__SUUICrossFadingTabBar_layoutSubviews__block_invoke;
  v16[3] = &__block_descriptor_97_e44_v32__0__SUUICrossFadingTabBarButton_8Q16_B24l;
  BOOL v17 = v14 == 0;
  v16[4] = v11;
  v16[5] = 0x4000000000000000;
  v16[6] = v13;
  v16[7] = 0x4010000000000000;
  *(CGFloat *)&v16[8] = v4;
  *(CGFloat *)&v16[9] = v6;
  *(CGFloat *)&v16[10] = v8;
  *(CGFloat *)&v16[11] = v10;
  [(NSArray *)tabBarButtons enumerateObjectsUsingBlock:v16];
}

void __39__SUUICrossFadingTabBar_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (!*(unsigned char *)(a1 + 96)) {
    a3 = *(void *)(a1 + 32) + ~a3;
  }
  CGFloat v5 = *(double *)(a1 + 64);
  CGFloat v6 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) + *(double *)(a1 + 56)) * (double)a3;
  CGFloat v7 = *(double *)(a1 + 72);
  CGFloat v8 = *(double *)(a1 + 80);
  CGFloat v9 = *(double *)(a1 + 88);
  id v13 = a2;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v8;
  v15.size.height = v9;
  CGFloat v10 = CGRectGetMinY(v15) + -1.0;
  double v11 = *(double *)(a1 + 48);
  double MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 64));
  v16.origin.x = v6;
  v16.origin.y = v10;
  v16.size.width = v11;
  v16.size.height = v4;
  objc_msgSend(v13, "setFrame:", v6, v10, v11, MaxY - CGRectGetMinY(v16));
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUICrossFadingTabBar;
  id v4 = a3;
  [(SUUICrossFadingTabBar *)&v10 traitCollectionDidChange:v4];
  CGFloat v5 = [(SUUICrossFadingTabBar *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (vabdd_f64(v7, v9) > 0.00000011920929) {
    [(SUUICrossFadingTabBar *)self setNeedsLayout];
  }
}

- (void)setTabBarButtons:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  tabBarButtons = self->_tabBarButtons;
  if (tabBarButtons != v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v6 = tabBarButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (![(NSArray *)v4 containsObject:v11]) {
            [v11 removeFromSuperview];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (NSArray *)[(NSArray *)v4 copy];
    id v13 = self->_tabBarButtons;
    self->_tabBarButtons = v12;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = self->_tabBarButtons;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          CGRect v19 = *(void **)(*((void *)&v21 + 1) + 8 * j);
          objc_msgSend(v19, "superview", (void)v21);
          v20 = (SUUICrossFadingTabBar *)objc_claimAutoreleasedReturnValue();

          if (v20 != self) {
            [(SUUICrossFadingTabBar *)self addSubview:v19];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [(SUUICrossFadingTabBar *)self setNeedsLayout];
  }
}

- (SUUIScrollingTabBarBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (NSArray)tabBarButtons
{
  return self->_tabBarButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarButtons, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end