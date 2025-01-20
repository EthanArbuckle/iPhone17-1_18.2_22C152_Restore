@interface PKMultiStackedLabelCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sources;
- (double)paddingBetweenRows;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setPaddingBetweenRows:(double)a3;
- (void)setSources:(id)a3;
@end

@implementation PKMultiStackedLabelCell

- (void)setSources:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v26 = 864;
    v6 = self->_textLabels;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v10++), "removeFromSuperview", v26);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v8);
    }

    v27 = self;
    v11 = [(PKMultiStackedLabelCell *)self contentView];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v5;
    id obj = v5;
    uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
          v18 = [PKIconTextLabel alloc];
          v19 = [v17 text];
          v20 = [v17 icon];
          v21 = [(PKIconTextLabel *)v18 initWithText:v19 icon:v20];

          v22 = [v17 textColor];
          [(PKIconTextLabel *)v21 setTextColor:v22];

          v23 = [v17 font];
          [(PKIconTextLabel *)v21 setTextFont:v23];

          [v11 addSubview:v21];
          [v12 addObject:v21];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v14);
    }

    uint64_t v24 = [v12 copy];
    v25 = *(Class *)((char *)&v27->super.super.super.super.super.super.isa + v26);
    *(Class *)((char *)&v27->super.super.super.super.super.super.isa + v26) = (Class)v24;

    [(PKMultiStackedLabelCell *)v27 setNeedsLayout];
    id v5 = v28;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKMultiStackedLabelCell;
  [(PKMultiStackedLabelCell *)&v4 layoutSubviews];
  v3 = [(PKMultiStackedLabelCell *)self contentView];
  [v3 bounds];
  -[PKMultiStackedLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKMultiStackedLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = PKTableViewCellTextInset();
  double v11 = x + v10;
  CGFloat v12 = width - (v10 + PKTableViewCellTextInset());
  [(PKMultiStackedLabelCell *)self _shouldReverseLayoutDirection];
  v28.size.double width = v12;
  v28.size.double height = height + -30.0;
  if ([(NSArray *)self->_textLabels count])
  {
    unint64_t v13 = 0;
    memset(&slice, 0, sizeof(slice));
    double v14 = 0.0;
    do
    {
      uint64_t v15 = [(NSArray *)self->_textLabels objectAtIndexedSubscript:v13];
      objc_msgSend(v15, "sizeThatFits:", v28.size.width, v28.size.height);
      CGRectDivide(v28, &slice, &v28, v16, CGRectMinYEdge);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      CGRectDivide(v28, &slice, &v28, self->_paddingBetweenRows, CGRectMinYEdge);
      double paddingBetweenRows = self->_paddingBetweenRows;
      if (!a4) {
        objc_msgSend(v15, "setFrame:", v18, v20, v22, v24);
      }
      double v14 = v14 + v24 + paddingBetweenRows;

      ++v13;
    }
    while (v13 < [(NSArray *)self->_textLabels count]);
    double v26 = v14 + 30.0;
  }
  else
  {
    double v26 = 30.0;
  }
  double v27 = width;
  result.double height = v26;
  result.double width = v27;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKMultiStackedLabelCell;
  [(PKMultiStackedLabelCell *)&v4 prepareForReuse];
  textLabels = self->_textLabels;
  self->_textLabels = 0;
}

- (NSArray)sources
{
  return self->_sources;
}

- (double)paddingBetweenRows
{
  return self->_paddingBetweenRows;
}

- (void)setPaddingBetweenRows:(double)a3
{
  self->_double paddingBetweenRows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_textLabels, 0);
}

@end