@interface PKMultiKeyValueCell
- (BOOL)_shouldStackLabelsWithBounds:(CGRect)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sources;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setSources:(id)a3;
@end

@implementation PKMultiKeyValueCell

- (void)setSources:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v6 = self->_titleLabels;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v8);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v34 = 872;
    v11 = self->_subtitleLabels;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "removeFromSuperview", v34);
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v13);
    }

    v35 = self;
    v44 = [(PKMultiKeyValueCell *)self contentView];
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v36 = v5;
    obuint64_t j = v5;
    uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v43)
    {
      uint64_t v40 = *(void *)v46;
      v16 = (void *)*MEMORY[0x1E4FB28C8];
      v17 = (void *)*MEMORY[0x1E4FB2790];
      uint64_t v39 = *MEMORY[0x1E4F85AB8];
      uint64_t v38 = *MEMORY[0x1E4F85478];
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          if (objc_msgSend(v19, "isBold", v34)) {
            uint64_t v20 = 2;
          }
          else {
            uint64_t v20 = 0;
          }
          id v21 = objc_alloc_init(MEMORY[0x1E4FB1930]);
          v22 = [v19 title];
          [v21 setText:v22];

          [v21 setNumberOfLines:0];
          v23 = [MEMORY[0x1E4FB1618] labelColor];
          [v21 setTextColor:v23];

          v24 = PKFontForDefaultDesign(v16, v17, v20, 0);
          [v21 setFont:v24];

          [v21 setAccessibilityIdentifier:v39];
          [v44 addSubview:v21];
          id v25 = objc_alloc_init(MEMORY[0x1E4FB1930]);
          v26 = [v19 subtitle];
          [v25 setText:v26];

          [v25 setNumberOfLines:0];
          v27 = [v19 subtitleTextColor];
          if (v27)
          {
            [v25 setTextColor:v27];
          }
          else
          {
            v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
            [v25 setTextColor:v28];
          }
          v29 = PKFontForDefaultDesign(v16, v17, v20, 0);
          [v25 setFont:v29];

          [v25 setAccessibilityIdentifier:v38];
          [v44 addSubview:v25];
          [v42 addObject:v21];
          [v41 addObject:v25];
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v43);
    }

    uint64_t v30 = [v42 copy];
    titleLabels = v35->_titleLabels;
    v35->_titleLabels = (NSArray *)v30;

    uint64_t v32 = [v41 copy];
    v33 = *(Class *)((char *)&v35->super.super.super.super.super.super.isa + v34);
    *(Class *)((char *)&v35->super.super.super.super.super.super.isa + v34) = (Class)v32;

    [(PKMultiKeyValueCell *)v35 setNeedsLayout];
    id v5 = v36;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKMultiKeyValueCell;
  [(PKMultiKeyValueCell *)&v4 layoutSubviews];
  v3 = [(PKMultiKeyValueCell *)self contentView];
  [v3 bounds];
  -[PKMultiKeyValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKMultiKeyValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  double v7 = a3.origin.x + 16.0;
  double v8 = a3.origin.y + 16.0;
  double v9 = a3.size.height + -32.0;
  int v10 = [(PKMultiKeyValueCell *)self _shouldReverseLayoutDirection];
  BOOL v11 = -[PKMultiKeyValueCell _shouldStackLabelsWithBounds:](self, "_shouldStackLabelsWithBounds:", v7, v8, width + -32.0, v9);
  BOOL v12 = v10 == 0;
  if (v10) {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  if (v12) {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.double width = width + -32.0;
  remainder.size.height = v9;
  if ([(NSArray *)self->_titleLabels count])
  {
    double v52 = width;
    unint64_t v15 = 0;
    memset(&slice, 0, sizeof(slice));
    double v16 = 0.0;
    do
    {
      double v54 = v16;
      v17 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:v15];
      objc_msgSend(v17, "sizeThatFits:", remainder.size.width, remainder.size.height);
      double v19 = v18;
      CGFloat v21 = v20;
      v22 = [(NSArray *)self->_subtitleLabels objectAtIndexedSubscript:v15];
      objc_msgSend(v22, "sizeThatFits:", remainder.size.width, remainder.size.height);
      double v24 = v23;
      CGFloat v26 = v25;
      if (v11)
      {
        CGRectDivide(remainder, &slice, &remainder, v21, CGRectMinYEdge);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        double v53 = v27;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
        CGFloat v21 = v33 + v41;
      }
      else
      {
        memset(&v56, 0, sizeof(v56));
        CGRectDivide(remainder, &v56, &remainder, v21, CGRectMinYEdge);
        memset(&v55, 0, sizeof(v55));
        CGRectDivide(v56, &v55, &v56, fmin(v56.size.width, v19), v13);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        double v53 = v42;
        double v29 = v43;
        double v31 = v44;
        double v33 = v45;
        CGRectDivide(v56, &v55, &v56, fmin(v56.size.width, v24), v14);
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        double v35 = v46;
        double v37 = v47;
        double v39 = v48;
        double v41 = v49;
        CGRectDivide(remainder, &v56, &remainder, 5.0, CGRectMinYEdge);
      }
      double v16 = v54 + v21;
      if (++v15 < [(NSArray *)self->_titleLabels count]) {
        double v16 = v16 + 5.0;
      }
      if (!a4)
      {
        objc_msgSend(v17, "setFrame:", v53, v29, v31, v33);
        objc_msgSend(v22, "setFrame:", v35, v37, v39, v41);
      }
    }
    while (v15 < [(NSArray *)self->_titleLabels count]);
    double v50 = v16 + 32.0;
    double width = v52;
  }
  else
  {
    double v50 = 32.0;
  }
  double v51 = width;
  result.height = v50;
  result.double width = v51;
  return result;
}

- (BOOL)_shouldStackLabelsWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  if (![(NSArray *)self->_titleLabels count]) {
    return 0;
  }
  unint64_t v5 = 0;
  do
  {
    v6 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:v5];
    double v7 = [(NSArray *)self->_subtitleLabels objectAtIndexedSubscript:v5];
    objc_msgSend(v6, "sizeThatFits:", width, 1.79769313e308);
    double v9 = v8;
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    double v11 = v9 + v10 + 8.0;

    BOOL v12 = width < v11;
    if (width < v11) {
      break;
    }
    ++v5;
  }
  while (v5 < [(NSArray *)self->_titleLabels count]);
  return v12;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PKMultiKeyValueCell;
  [(PKMultiKeyValueCell *)&v5 prepareForReuse];
  titleLabels = self->_titleLabels;
  self->_titleLabels = 0;

  subtitleLabels = self->_subtitleLabels;
  self->_subtitleLabels = 0;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_subtitleLabels, 0);

  objc_storeStrong((id *)&self->_titleLabels, 0);
}

@end