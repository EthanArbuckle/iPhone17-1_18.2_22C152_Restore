@interface _TVInfoTableView
+ (id)infoTableViewWithElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)infoViews;
- (UIView)footerView;
- (UIView)headerView;
- (double)_normalizedInfoHeaderWidth;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (void)layoutSubviews;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInfoViews:(id)a3;
@end

@implementation _TVInfoTableView

+ (id)infoTableViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVInfoTableView *)v6;
  }
  else
  {
    v8 = [_TVInfoTableView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = v5;
  v11 = [v5 children];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "tv_elementType");
        switch(v17)
        {
          case 13:
            v21 = +[TVInterfaceFactory sharedInterfaceFactory];
            v19 = [v21 _viewFromElement:v16 existingView:v6];

            [(_TVInfoTableView *)v9 setFooterView:v19];
            break;
          case 18:
            v20 = +[TVInterfaceFactory sharedInterfaceFactory];
            v19 = [v20 _viewFromElement:v16 existingView:v6];

            if (!v19) {
              continue;
            }
            [v10 addObject:v19];
            break;
          case 15:
            v18 = +[TVInterfaceFactory sharedInterfaceFactory];
            v19 = [v18 _viewFromElement:v16 existingView:v6];

            [(_TVInfoTableView *)v9 setHeaderView:v19];
            break;
          default:
            continue;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  [(_TVInfoTableView *)v9 setInfoViews:v10];
  return v9;
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView) {
      -[_TVInfoTableView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoTableView *)self setNeedsLayout];
}

- (void)setInfoViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_infoViews = &self->_infoViews;
  if (![(NSArray *)self->_infoViews isEqualToArray:v5])
  {
    [(NSArray *)*p_infoViews makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&self->_infoViews, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = *p_infoViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_TVInfoTableView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(_TVInfoTableView *)self setNeedsLayout];
}

- (void)setFooterView:(id)a3
{
  id v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView) {
      -[_TVInfoTableView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoTableView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self tv_lineSpacing];
  uint64_t v7 = v6;
  uint64_t v24 = 0;
  long long v25 = (double *)&v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  [(_TVInfoTableView *)self _normalizedInfoHeaderWidth];
  double v9 = v8;
  uint64_t v10 = [(NSArray *)self->_infoViews firstObject];
  objc_opt_class();
  double v11 = width;
  if (objc_opt_isKindOfClass())
  {
    double v11 = width;
    if ([v10 headerOnLeading])
    {
      if ([(_TVInfoTableView *)self effectiveUserInterfaceLayoutDirection] == 1)
      {
        [v10 headerMargin];
      }
      else
      {
        [v10 headerMargin];
        double v12 = v13;
      }
      double v11 = width - (v9 + v12);
    }
  }
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v11, 0.0);
  *((void *)v25 + 3) = v14;
  [(UIView *)self->_headerView tv_margin];
  v25[3] = v15 + v25[3];
  -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v11, 0.0);
  v25[3] = v16 + v25[3];
  [(UIView *)self->_footerView tv_margin];
  v25[3] = v17 + v25[3];
  infoViews = self->_infoViews;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __33___TVInfoTableView_sizeThatFits___block_invoke;
  v23[3] = &unk_264BA7CE8;
  *(double *)&v23[6] = width;
  *(double *)&v23[7] = height;
  v23[4] = self;
  v23[5] = &v24;
  *(double *)&v23[8] = v9;
  v23[9] = v7;
  [(NSArray *)infoViews enumerateObjectsUsingBlock:v23];
  double v19 = fmin(v25[3], height);
  if (height == 0.0) {
    double v20 = v25[3];
  }
  else {
    double v20 = v19;
  }

  _Block_object_dispose(&v24, 8);
  double v21 = width;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)_TVInfoTableView;
  [(_TVFocusRedirectView *)&v41 layoutSubviews];
  [(_TVInfoTableView *)self bounds];
  double v4 = v3;
  [(UIView *)self tv_lineSpacing];
  double v6 = v5;
  [(_TVInfoTableView *)self bounds];
  double Width = CGRectGetWidth(v44);
  double v8 = 0.0;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", Width, 0.0);
  double v10 = v9;
  [(_TVInfoTableView *)self _normalizedInfoHeaderWidth];
  double v12 = v11;
  double v13 = [(NSArray *)self->_infoViews firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = Width;
    if ([v13 headerOnLeading])
    {
      uint64_t v15 = [(_TVInfoTableView *)self effectiveUserInterfaceLayoutDirection];
      [v13 headerMargin];
      if (v15 == 1) {
        double v18 = v16;
      }
      else {
        double v18 = v17;
      }
      double v8 = v12 + v18;
      double v14 = Width - (v12 + v18);
    }
  }
  else
  {
    double v14 = Width;
  }
  headerView = self->_headerView;
  v45.origin.y = 0.0;
  v45.origin.x = v8;
  v45.size.double width = v14;
  v45.size.double height = v10;
  CGRect v46 = CGRectIntegral(v45);
  -[UIView setFrame:](headerView, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  [(UIView *)self->_headerView tv_margin];
  double v21 = v10 + v20;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v22 = self->_infoViews;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v37 + 1) + 8 * v26);
        if (v21 >= v4)
        {
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v26), "setHidden:", 1, (void)v37);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v27 setNormalizedHeaderWidth:v12];
          }
          objc_msgSend(v27, "sizeThatFits:", Width, v4 - v21, (void)v37);
          double v29 = v28;
          v47.origin.x = 0.0;
          v47.origin.y = v21;
          v47.size.double width = Width;
          v47.size.double height = v29;
          CGRect v48 = CGRectIntegral(v47);
          objc_msgSend(v27, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
          double v21 = v21 + v6 + v29;
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }

  NSUInteger v30 = [(NSArray *)self->_infoViews count];
  double v31 = 0.0;
  if (v30) {
    double v31 = v6;
  }
  double v32 = v21 - v31;
  [(UIView *)self->_footerView tv_margin];
  CGFloat v34 = v32 + v33;
  -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v14, 0.0);
  v49.size.double height = v35;
  footerView = self->_footerView;
  v49.origin.x = v8;
  v49.origin.y = v34;
  v49.size.double width = v14;
  CGRect v50 = CGRectIntegral(v49);
  -[UIView setFrame:](footerView, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [self tv_associatedIKViewElement];
  double v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v9 = [(_TVInfoTableView *)self infoViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(_TVInfoTableView *)self headerView];
    double v16 = objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
    [v8 addObjectsFromArray:v16];

    double v17 = [(_TVInfoTableView *)self footerView];
    double v18 = objc_msgSend(v17, "tv_impressionableElementsForDocument:", v4);
    [v8 addObjectsFromArray:v18];

    if ([v8 count])
    {
      double v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      double v19 = 0;
    }
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (double)_normalizedInfoHeaderWidth
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_infoViews;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v8, "minimumHeaderWidth", (void)v11);
          double v6 = fmax(v6, v9);
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSArray)infoViews
{
  return self->_infoViews;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_infoViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end