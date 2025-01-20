@interface SKUIChartColumnHeaderView
- (NSArray)titles;
- (double)edgePadding;
- (int64_t)selectedTitleIndex;
- (void)_buttonAction:(id)a3;
- (void)_reloadSelectedButton;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setSelectedTitleIndex:(int64_t)a3;
- (void)setTitles:(id)a3;
- (void)sizeToFit;
- (void)titles;
@end

@implementation SKUIChartColumnHeaderView

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_buttons;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIChartColumnHeaderView;
  [(SKUIChartColumnHeaderView *)&v8 dealloc];
}

- (void)setSelectedTitleIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIChartColumnHeaderView setSelectedTitleIndex:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_selectedTitleIndex != a3)
  {
    self->_selectedTitleIndex = a3;
    [(SKUIChartColumnHeaderView *)self _reloadSelectedButton];
  }
}

- (void)setTitles:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIChartColumnHeaderView setTitles:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [(SKUIChartColumnHeaderView *)self tintColor];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v4;
  uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v20 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
        [v20 addTarget:self action:sel__buttonAction_ forControlEvents:64];
        v21 = [(SKUIChartColumnHeaderView *)self backgroundColor];
        [v20 setBackgroundColor:v21];

        [v20 setTitle:v19 forState:0];
        [v20 setTitleColor:v14 forState:1];
        [v20 setTitleColor:v14 forState:4];
        v22 = [MEMORY[0x1E4FB1618] labelColor];
        [v20 setTitleColor:v22 forState:0];

        v23 = [v20 titleLabel];
        v24 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
        [v23 setFont:v24];

        [v20 sizeToFit];
        [v13 addObject:v20];
        [(SKUIChartColumnHeaderView *)self addSubview:v20];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v16);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v25 = self->_buttons;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        [v30 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
        [v30 removeFromSuperview];
      }
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v27);
  }

  v31 = (NSArray *)[v13 copy];
  buttons = self->_buttons;
  self->_buttons = v31;

  [(SKUIChartColumnHeaderView *)self _reloadSelectedButton];
}

- (NSArray)titles
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIChartColumnHeaderView *)v3 titles];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = self->_buttons;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "titleForState:", 0, (void)v19);
        [v11 addObject:v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (NSArray *)v11;
}

- (void)layoutSubviews
{
}

CGFloat __43__SKUIChartColumnHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 frame];
  CGFloat v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  CGFloat v10 = *(double *)(v9 + 24);
  double v11 = *(double *)(a1 + 72);
  float v12 = (v11 - v7) * 0.5;
  double v13 = floorf(v12);
  if (v6 >= *(double *)(a1 + 80)) {
    double v14 = *(double *)(a1 + 80);
  }
  else {
    double v14 = v6;
  }
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(*(CGFloat *)(v9 + 24), v13, v14, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), v11);
  objc_msgSend(v5, "setFrame:");
  BOOL v15 = *(uint64_t *)(a1 + 88) >= 2 && *(void *)(*(void *)(a1 + 32) + 464) == a3;
  [v5 setSelected:v15];

  v17.origin.x = v10;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v8;
  CGFloat result = CGRectGetMaxX(v17) + 25.0;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIChartColumnHeaderView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(NSArray *)self->_buttons makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIChartColumnHeaderView;
  [(SKUIChartColumnHeaderView *)&v13 setBackgroundColor:v4];
}

- (void)sizeToFit
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(SKUIChartColumnHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(SKUIChartColumnHeaderView *)self edgePadding];
  double v8 = v7 + v7;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = self->_buttons;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "sizeToFit", (void)v18);
        [v14 frame];
        double v8 = v8 + v15;
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [(NSArray *)self->_buttons count];
  double v17 = (float)((float)v16 * 25.0);
  if (v16 <= 1) {
    double v17 = -0.0;
  }
  -[SKUIChartColumnHeaderView setFrame:](self, "setFrame:", v4, v6, v8 + v17, 44.0, (void)v18);
}

- (void)_buttonAction:(id)a3
{
  int64_t v4 = [(NSArray *)self->_buttons indexOfObjectIdenticalTo:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_selectedTitleIndex = v4;
    [(SKUIChartColumnHeaderView *)self sendActionsForControlEvents:4096];
    [(SKUIChartColumnHeaderView *)self setNeedsLayout];
  }
}

- (double)edgePadding
{
  [(SKUIChartColumnHeaderView *)self size];
  BOOL v3 = v2 <= 341.0;
  double result = 15.0;
  if (!v3) {
    return 20.0;
  }
  return result;
}

- (void)_reloadSelectedButton
{
  uint64_t v3 = [(NSArray *)self->_buttons count];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = [(NSArray *)self->_buttons objectAtIndex:i];
      double v7 = v6;
      BOOL v8 = v4 != 1 && i == self->_selectedTitleIndex;
      [v6 setSelected:v8];
    }
  }
}

- (int64_t)selectedTitleIndex
{
  return self->_selectedTitleIndex;
}

- (void).cxx_destruct
{
}

- (void)setSelectedTitleIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitles:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)titles
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end