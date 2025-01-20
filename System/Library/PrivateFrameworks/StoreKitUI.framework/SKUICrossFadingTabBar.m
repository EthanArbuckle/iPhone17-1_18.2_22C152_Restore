@interface SKUICrossFadingTabBar
- (NSArray)tabBarButtons;
- (SKUICrossFadingTabBar)initWithFrame:(CGRect)a3;
- (SKUIScrollingTabBarBackgroundView)backgroundView;
- (void)layoutSubviews;
- (void)setTabBarButtons:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SKUICrossFadingTabBar

- (SKUICrossFadingTabBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICrossFadingTabBar initWithFrame:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICrossFadingTabBar;
  v8 = -[SKUICrossFadingTabBar initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUICrossFadingTabBar *)v8 bounds];
    v14 = -[SKUIScrollingTabBarBackgroundView initWithFrame:]([SKUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v10, v11, v12, v13);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v14;

    [(SKUIScrollingTabBarBackgroundView *)v9->_backgroundView setShowsBackdrop:1];
    [(SKUIScrollingTabBarBackgroundView *)v9->_backgroundView setShowsTopHairline:1];
    [(SKUICrossFadingTabBar *)v9 addSubview:v9->_backgroundView];
  }
  return v9;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SKUICrossFadingTabBar;
  [(SKUICrossFadingTabBar *)&v18 layoutSubviews];
  [(SKUICrossFadingTabBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[SKUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  NSUInteger v11 = [(NSArray *)self->_tabBarButtons count];
  v19.origin.double x = v4;
  v19.origin.double y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  CGRectGetWidth(v19);
  UICeilToViewScale();
  uint64_t v13 = v12;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SKUICrossFadingTabBar semanticContentAttribute](self, "semanticContentAttribute"));
  tabBarButtons = self->_tabBarButtons;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__SKUICrossFadingTabBar_layoutSubviews__block_invoke;
  v16[3] = &__block_descriptor_97_e44_v32__0__SKUICrossFadingTabBarButton_8Q16_B24l;
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

void __39__SKUICrossFadingTabBar_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!*(unsigned char *)(a1 + 96)) {
    a3 = *(void *)(a1 + 32) + ~a3;
  }
  CGFloat v5 = *(double *)(a1 + 64);
  CGFloat v6 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) + *(double *)(a1 + 56)) * (double)a3;
  CGFloat v7 = *(double *)(a1 + 72);
  CGFloat v8 = *(double *)(a1 + 80);
  CGFloat v9 = *(double *)(a1 + 88);
  id v13 = a2;
  v15.origin.double x = v5;
  v15.origin.double y = v7;
  v15.size.double width = v8;
  v15.size.double height = v9;
  CGFloat v10 = CGRectGetMinY(v15) + -1.0;
  double v11 = *(double *)(a1 + 48);
  double MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 64));
  v16.origin.double x = v6;
  v16.origin.double y = v10;
  v16.size.double width = v11;
  v16.size.double height = v4;
  objc_msgSend(v13, "setFrame:", v6, v10, v11, MaxY - CGRectGetMinY(v16));
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKUICrossFadingTabBar;
  id v4 = a3;
  [(SKUICrossFadingTabBar *)&v10 traitCollectionDidChange:v4];
  CGFloat v5 = [(SKUICrossFadingTabBar *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (vabdd_f64(v7, v9) > 0.00000011920929) {
    [(SKUICrossFadingTabBar *)self setNeedsLayout];
  }
}

- (void)setTabBarButtons:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
          v20 = (SKUICrossFadingTabBar *)objc_claimAutoreleasedReturnValue();

          if (v20 != self) {
            [(SKUICrossFadingTabBar *)self addSubview:v19];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [(SKUICrossFadingTabBar *)self setNeedsLayout];
  }
}

- (SKUIScrollingTabBarBackgroundView)backgroundView
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICrossFadingTabBar initWithFrame:]";
}

@end