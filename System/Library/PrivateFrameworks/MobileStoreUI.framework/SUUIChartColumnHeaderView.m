@interface SUUIChartColumnHeaderView
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
@end

@implementation SUUIChartColumnHeaderView

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
  v8.super_class = (Class)SUUIChartColumnHeaderView;
  [(SUUIChartColumnHeaderView *)&v8 dealloc];
}

- (void)setSelectedTitleIndex:(int64_t)a3
{
  if (self->_selectedTitleIndex != a3)
  {
    self->_selectedTitleIndex = a3;
    [(SUUIChartColumnHeaderView *)self _reloadSelectedButton];
  }
}

- (void)setTitles:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(SUUIChartColumnHeaderView *)self tintColor];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x263F824E8]);
        [v12 addTarget:self action:sel__buttonAction_ forControlEvents:64];
        v13 = [(SUUIChartColumnHeaderView *)self backgroundColor];
        [v12 setBackgroundColor:v13];

        [v12 setTitle:v11 forState:0];
        [v12 setTitleColor:v6 forState:1];
        [v12 setTitleColor:v6 forState:4];
        uint64_t v14 = [MEMORY[0x263F825C8] labelColor];
        [v12 setTitleColor:v14 forState:0];

        v15 = [v12 titleLabel];
        v16 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
        [v15 setFont:v16];

        [v12 sizeToFit];
        [v5 addObject:v12];
        [(SUUIChartColumnHeaderView *)self addSubview:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v17 = self->_buttons;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        [v22 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
        [v22 removeFromSuperview];
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  v23 = (NSArray *)[v5 copy];
  buttons = self->_buttons;
  self->_buttons = v23;

  [(SUUIChartColumnHeaderView *)self _reloadSelectedButton];
}

- (NSArray)titles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_buttons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "titleForState:", 0, (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)layoutSubviews
{
  [(SUUIChartColumnHeaderView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = [(NSArray *)self->_buttons count];
  uint64_t v12 = v11 - 1;
  if (v11 >= 1)
  {
    uint64_t v13 = v11;
    [(SUUIChartColumnHeaderView *)self edgePadding];
    v19[0] = 0;
    v19[1] = v19;
    double v15 = (v8 + v14 * -2.0 + (float)((float)v12 * -25.0)) / (double)v13;
    v19[2] = 0x2020000000;
    uint64_t v20 = 0;
    [(SUUIChartColumnHeaderView *)self edgePadding];
    uint64_t v20 = v16;
    buttons = self->_buttons;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__SUUIChartColumnHeaderView_layoutSubviews__block_invoke;
    v18[3] = &unk_265406078;
    v18[6] = v4;
    v18[7] = v6;
    *(double *)&v18[8] = v8;
    v18[9] = v10;
    *(double *)&v18[10] = v15;
    v18[11] = v13;
    v18[4] = self;
    v18[5] = v19;
    [(NSArray *)buttons enumerateObjectsUsingBlock:v18];
    _Block_object_dispose(v19, 8);
  }
}

CGFloat __43__SUUIChartColumnHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(*(CGFloat *)(v9 + 24), v13, v14, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), v11));
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
  buttons = self->_buttons;
  id v5 = a3;
  [(NSArray *)buttons makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIChartColumnHeaderView;
  [(SUUIChartColumnHeaderView *)&v6 setBackgroundColor:v5];
}

- (void)sizeToFit
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(SUUIChartColumnHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(SUUIChartColumnHeaderView *)self edgePadding];
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
  -[SUUIChartColumnHeaderView setFrame:](self, "setFrame:", v4, v6, v8 + v17, 44.0, (void)v18);
}

- (void)_buttonAction:(id)a3
{
  int64_t v4 = [(NSArray *)self->_buttons indexOfObjectIdenticalTo:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_selectedTitleIndex = v4;
    [(SUUIChartColumnHeaderView *)self sendActionsForControlEvents:4096];
    [(SUUIChartColumnHeaderView *)self setNeedsLayout];
  }
}

- (double)edgePadding
{
  [(SUUIChartColumnHeaderView *)self size];
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

@end