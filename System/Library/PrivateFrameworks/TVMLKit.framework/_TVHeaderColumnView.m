@interface _TVHeaderColumnView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)labelViews;
- (double)lineSpacing;
- (void)layoutSubviews;
- (void)setLabelViews:(id)a3;
- (void)setLineSpacing:(double)a3;
@end

@implementation _TVHeaderColumnView

- (void)setLabelViews:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSArray *)self->_labelViews isEqualToArray:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_labelViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v4 containsObject:v10] & 1) == 0) {
            [v10 removeFromSuperview];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (NSArray *)[v4 copy];
    labelViews = self->_labelViews;
    self->_labelViews = v11;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37___TVHeaderColumnView_setLabelViews___block_invoke;
    v13[3] = &unk_264BA69C8;
    v13[4] = self;
    [v4 enumerateObjectsUsingBlock:v13];
  }
  [(_TVHeaderColumnView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(_TVHeaderColumnView *)self labelViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "tv_sizeThatFits:", width, 0.0);
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  [(_TVHeaderColumnView *)self lineSpacing];
  double v13 = v12;
  long long v14 = [(_TVHeaderColumnView *)self labelViews];
  uint64_t v15 = [v14 count];

  double v16 = v9 + v13 * (double)(unint64_t)(v15 - 1);
  double v17 = width;
  result.height = v16;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)_TVHeaderColumnView;
  [(_TVHeaderColumnView *)&v18 layoutSubviews];
  [(_TVHeaderColumnView *)self bounds];
  double Width = CGRectGetWidth(v21);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(_TVHeaderColumnView *)self labelViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "tv_sizeThatFits:", Width, 0.0);
        double v12 = v11;
        objc_msgSend(v10, "setFrame:", 0.0, v8, Width, v11);
        [(_TVHeaderColumnView *)self lineSpacing];
        double v8 = v8 + v12 + v13;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }
}

- (NSArray)labelViews
{
  return self->_labelViews;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (void).cxx_destruct
{
}

@end