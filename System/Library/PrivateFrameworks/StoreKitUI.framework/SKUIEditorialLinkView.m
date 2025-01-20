@interface SKUIEditorialLinkView
- (CGSize)sizeThatFits:(CGSize)result;
- (SKUIEditorialLinkLayout)linkLayout;
- (SKUIEditorialLinkView)initWithFrame:(CGRect)a3;
- (SKUIEditorialLinkViewDelegate)delegate;
- (id)_newButton;
- (int64_t)horizontalAlignment;
- (void)_linkButtonAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setLinkLayout:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SKUIEditorialLinkView

- (SKUIEditorialLinkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLinkView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLinkView;
  v8 = -[SKUIEditorialLinkView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    buttons = v8->_buttons;
    v8->_buttons = v9;

    id v11 = [(SKUIEditorialLinkView *)v8 _newButton];
    [(SKUIEditorialLinkView *)v8 addSubview:v11];
    [(NSMutableArray *)v8->_buttons addObject:v11];

    id v12 = [(SKUIEditorialLinkView *)v8 _newButton];
    [(SKUIEditorialLinkView *)v8 addSubview:v12];
    [(NSMutableArray *)v8->_buttons addObject:v12];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_buttons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIEditorialLinkView;
  [(SKUIEditorialLinkView *)&v8 dealloc];
}

- (void)setColoringWithColorScheme:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 highlightedTextColor];
  }
  else
  {
    uint64_t v6 = 0;
  }
  p_highlightedTextColor = &self->_highlightedTextColor;
  objc_storeStrong((id *)&self->_highlightedTextColor, v6);
  if (v5)
  {

    objc_super v8 = [v5 secondaryTextColor];
  }
  else
  {
    objc_super v8 = 0;
  }
  p_textColor = &self->_textColor;
  objc_storeStrong((id *)&self->_textColor, v8);
  if (v5) {

  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v10 = self->_buttons;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (*p_textColor)
        {
          [*(id *)(*((void *)&v18 + 1) + 8 * i) setTitleColor:*p_textColor forState:0];
        }
        else
        {
          v16 = [(SKUIEditorialLinkView *)self tintColor];
          [v15 setTitleColor:v16 forState:0];
        }
        if (*p_highlightedTextColor)
        {
          [v15 setTitleColor:*p_highlightedTextColor forState:1];
        }
        else
        {
          v17 = [(SKUIEditorialLinkView *)self tintColor];
          [v15 setTitleColor:v17 forState:1];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  if (self->_horizontalAlignment != a3) {
    self->_horizontalAlignment = a3;
  }
}

- (void)setLinkLayout:(id)a3
{
  uint64_t v5 = (SKUIEditorialLinkLayout *)a3;
  p_layout = &self->_layout;
  if (self->_layout != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_layout, a3);
    p_layout = (SKUIEditorialLinkLayout **)[(SKUIEditorialLinkView *)self setNeedsLayout];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_layout, v5);
}

- (void)layoutSubviews
{
  if (self->_layout)
  {
    [(SKUIEditorialLinkView *)self bounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v11 = [(SKUIEditorialLinkLayout *)self->_layout links];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    layout = self->_layout;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__SKUIEditorialLinkView_layoutSubviews__block_invoke;
    v17[3] = &unk_1E6425EE8;
    uint64_t v20 = v4;
    uint64_t v21 = v6;
    uint64_t v22 = v8;
    uint64_t v23 = v10;
    v17[4] = self;
    long long v19 = v24;
    id v13 = v11;
    id v18 = v13;
    [(SKUIEditorialLinkLayout *)layout enumerateLinesUsingBlock:v17];
    uint64_t v14 = [(NSMutableArray *)self->_buttons count];
    uint64_t v15 = [v13 count];
    if (v15 < v14)
    {
      do
      {
        v16 = [(NSMutableArray *)self->_buttons objectAtIndex:v15];
        [v16 setHidden:1];

        ++v15;
      }
      while (v14 != v15);
    }

    _Block_object_dispose(v24, 8);
  }
}

double __39__SKUIEditorialLinkView_layoutSubviews__block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unint64_t v6 = a2 + a3;
  double v7 = 0.0;
  if (a2 < a2 + a3)
  {
    unint64_t v8 = a3;
    unint64_t v9 = a2;
    do
    {
      [*(id *)(*(void *)(a1 + 32) + 440) sizeForLinkAtIndex:v9];
      double v7 = v7 + v10;
      ++v9;
      --v8;
    }
    while (v8);
  }
  if (v3 > 1) {
    double v7 = v7 + (float)((float)(v3 - 1) * 15.0);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 432);
  if (v12 == 3)
  {
    double v13 = *(double *)(a1 + 72) - v7;
  }
  else
  {
    double v13 = 0.0;
    if (v12 == 2)
    {
      float v14 = (*(double *)(a1 + 72) - v7) * 0.5;
      double v13 = floorf(v14);
    }
  }
  if (a2 < v6)
  {
    unint64_t v15 = a2;
    do
    {
      unint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 408) count];
      v17 = *(id **)(a1 + 32);
      if (v15 >= v16)
      {
        id v18 = (void *)[v17 _newButton];
        [*(id *)(a1 + 32) addSubview:v18];
        [*(id *)(*(void *)(a1 + 32) + 408) addObject:v18];
      }
      else
      {
        id v18 = [v17[51] objectAtIndex:v15];
      }
      [v18 frame];
      double v19 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(*(void *)(a1 + 32) + 440) sizeForLinkAtIndex:v15];
      CGFloat v22 = v21;
      if (v20 >= *(double *)(a1 + 72)) {
        double v23 = *(double *)(a1 + 72);
      }
      else {
        double v23 = v20;
      }
      objc_msgSend(v18, "setFrame:", v13, v19, v23, v21);
      v24 = [*(id *)(a1 + 40) objectAtIndex:v15];
      v25 = [v24 title];
      [v18 setTitle:v25 forState:0];

      [v18 setHidden:0];
      v29.origin.double x = v13;
      v29.origin.double y = v19;
      v29.size.double width = v23;
      v29.size.double height = v22;
      double v13 = CGRectGetMaxX(v29) + 15.0;

      ++v15;
      --v3;
    }
    while (v3);
    uint64_t v11 = *(void *)(a1 + 32);
  }
  [*(id *)(v11 + 440) sizeForLinkAtIndex:a2];
  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v26 + 8.0 + *(double *)(v27 + 24);
  *(double *)(v27 + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  buttons = self->_buttons;
  id v5 = a3;
  [(NSMutableArray *)buttons makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialLinkView;
  [(SKUIEditorialLinkView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  layout = self->_layout;
  if (layout) {
    [(SKUIEditorialLinkLayout *)layout totalSize];
  }
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SKUIEditorialLinkView;
  [(SKUIEditorialLinkView *)&v17 tintColorDidChange];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = self->_buttons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        textColor = self->_textColor;
        if (textColor)
        {
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setTitleColor:textColor forState:0];
        }
        else
        {
          double v10 = [(SKUIEditorialLinkView *)self tintColor];
          [v8 setTitleColor:v10 forState:0];
        }
        highlightedTextColor = self->_highlightedTextColor;
        if (highlightedTextColor)
        {
          [v8 setTitleColor:highlightedTextColor forState:1];
        }
        else
        {
          uint64_t v12 = [(SKUIEditorialLinkView *)self tintColor];
          [v8 setTitleColor:v12 forState:1];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_linkButtonAction:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(NSMutableArray *)self->_buttons indexOfObjectIdenticalTo:v11];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      unint64_t v8 = [(SKUIEditorialLinkLayout *)self->_layout links];
      unint64_t v9 = [v8 objectAtIndex:v7];

      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 editorialLinkView:self didSelectLink:v9];
    }
  }
}

- (id)_newButton
{
  unint64_t v3 = [[SKUILinkButton alloc] initWithArrowStyle:1];
  [(SKUILinkButton *)v3 addTarget:self action:sel__linkButtonAction_ forControlEvents:64];
  LODWORD(v4) = -1.0;
  [(SKUILinkButton *)v3 setCharge:v4];
  textColor = self->_textColor;
  if (textColor)
  {
    [(SKUILinkButton *)v3 setTitleColor:textColor forState:0];
  }
  else
  {
    uint64_t v6 = [(SKUIEditorialLinkView *)self tintColor];
    [(SKUILinkButton *)v3 setTitleColor:v6 forState:0];
  }
  highlightedTextColor = self->_highlightedTextColor;
  if (highlightedTextColor)
  {
    [(SKUILinkButton *)v3 setTitleColor:highlightedTextColor forState:1];
  }
  else
  {
    unint64_t v8 = [(SKUIEditorialLinkView *)self tintColor];
    [(SKUILinkButton *)v3 setTitleColor:v8 forState:1];
  }
  unint64_t v9 = [(SKUILinkButton *)v3 titleLabel];
  id v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v9 setFont:v10];

  return v3;
}

- (SKUIEditorialLinkViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIEditorialLinkViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (SKUIEditorialLinkLayout)linkLayout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialLinkView initWithFrame:]";
}

@end