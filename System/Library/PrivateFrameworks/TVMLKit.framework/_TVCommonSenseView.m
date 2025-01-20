@interface _TVCommonSenseView
- (NSArray)infoViews;
- (UIView)headerView;
- (_TVCommonSenseFooterView)footerView;
- (_TVCommonSenseView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInfoViews:(id)a3;
@end

@implementation _TVCommonSenseView

- (_TVCommonSenseView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVCommonSenseView;
  v3 = -[_TVCommonSenseView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v5;

    [(UIView *)v3->_containerView setBackgroundColor:0];
    [(_TVCommonSenseView *)v3 addSubview:v3->_containerView];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v65.receiver = self;
  v65.super_class = (Class)_TVCommonSenseView;
  [(_TVCommonSenseView *)&v65 layoutSubviews];
  [(_TVCommonSenseView *)self bounds];
  double v4 = v3;
  [(UIView *)self->_headerView tv_itemWidth];
  if (v5 == 0.0) {
    double v5 = v4;
  }
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  double v7 = v6;
  double v9 = v8;
  [(UIView *)self->_headerView tv_margin];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v12 + v7 + v14;
  CGFloat v17 = v10 + v9 + v16;
  -[UIView setFrame:](self->_headerView, "setFrame:", v12, v10, v15, v17);
  *(CGFloat *)rect = v13;
  v68.origin.x = v13;
  CGFloat v18 = v11;
  v68.origin.y = v11;
  CGFloat v19 = v15;
  v68.size.width = v15;
  CGFloat v61 = v17;
  v68.size.height = v17;
  double MaxY = CGRectGetMaxY(v68);
  memset(&rect[1], 0, 32);
  long long v63 = 0u;
  long long v64 = 0u;
  v21 = [(_TVCommonSenseView *)self infoViews];
  uint64_t v22 = [v21 countByEnumeratingWithState:&rect[1] objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)rect[3];
    double v25 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)rect[3] != v24) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(rect[2] + 8 * i);
        objc_msgSend(v27, "tv_itemWidth");
        if (v28 == 0.0) {
          double v28 = v4;
        }
        if (v28 > v25) {
          double v25 = v28;
        }
        objc_msgSend(v27, "sizeThatFits:");
        double v30 = v29;
        double v32 = v31;
        objc_msgSend(v27, "tv_margin");
        CGFloat v34 = v33;
        CGFloat v36 = MaxY + v35;
        CGFloat v38 = v33 + v30 + v37;
        CGFloat v40 = v35 + v32 + v39;
        objc_msgSend(v27, "setFrame:", v33, v36, v38, v40);
        v69.origin.x = v34;
        v69.origin.y = v36;
        v69.size.width = v38;
        v69.size.height = v40;
        double MaxY = CGRectGetMaxY(v69);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&rect[1] objects:v66 count:16];
    }
    while (v23);
  }
  else
  {
    double v25 = 0.0;
  }

  footerView = self->_footerView;
  if (footerView)
  {
    *(void *)&v70.origin.x = rect[0];
    v70.origin.y = v18;
    v70.size.width = v19;
    v70.size.height = v61;
    double Width = CGRectGetWidth(v70);
    if (v25 >= Width) {
      double Width = v25;
    }
    -[_TVCommonSenseFooterView sizeThatFits:](footerView, "sizeThatFits:", Width, 0.0, *(void *)&v18);
    double v44 = v43;
    double v46 = v45;
    [(UIView *)self->_footerView tv_margin];
    CGFloat v48 = v47;
    CGFloat v50 = MaxY + v49;
    CGFloat v52 = v44 + v47 + v51;
    CGFloat v54 = v46 + v49 + v53;
    -[_TVCommonSenseFooterView setFrame:](self->_footerView, "setFrame:", v47, v50, v52, v54);
    v71.origin.x = v48;
    v71.origin.y = v50;
    v71.size.width = v52;
    v71.size.height = v54;
    CGRectGetMaxY(v71);
    CGFloat v55 = v61;
    CGFloat v56 = v60;
    uint64_t v57 = rect[0];
  }
  else
  {
    CGFloat v56 = v18;
    uint64_t v57 = rect[0];
    CGFloat v55 = v61;
  }
  CGFloat v58 = v19;
  CGRectGetWidth(*(CGRect *)&v57);
  containerView = self->_containerView;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](containerView, "setFrame:");
}

- (void)setHeaderView:(id)a3
{
  double v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    double v9 = v5;
    if (headerView)
    {
      [(UIView *)headerView removeFromSuperview];
      double v8 = *p_headerView;
      *p_headerView = 0;

      double v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_headerView, a3);
      [(UIView *)self->_containerView addSubview:*p_headerView];
    }
    headerView = (UIView *)[(_TVCommonSenseView *)self setNeedsLayout];
    double v5 = v9;
  }
  MEMORY[0x270F9A758](headerView, v5);
}

- (void)setInfoViews:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_infoViews = &self->_infoViews;
  if (([v5 isEqual:self->_infoViews] & 1) == 0)
  {
    if ([(NSArray *)*p_infoViews count])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v7 = *p_infoViews;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * v11++) removeFromSuperview];
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)&self->_infoViews, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v12 = *p_infoViews;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[UIView addSubview:](self->_containerView, "addSubview:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(_TVCommonSenseView *)self setNeedsLayout];
  }
}

- (void)setFooterView:(id)a3
{
  id v5 = (_TVCommonSenseFooterView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    uint64_t v9 = v5;
    if (footerView)
    {
      [(_TVCommonSenseFooterView *)footerView removeFromSuperview];
      uint64_t v8 = *p_footerView;
      *p_footerView = 0;

      id v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_footerView, a3);
      [(UIView *)self->_containerView addSubview:*p_footerView];
    }
    footerView = (_TVCommonSenseFooterView *)[(_TVCommonSenseView *)self setNeedsLayout];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](footerView, v5);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSArray)infoViews
{
  return self->_infoViews;
}

- (_TVCommonSenseFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_infoViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end