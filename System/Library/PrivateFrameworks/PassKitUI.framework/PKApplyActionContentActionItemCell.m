@interface PKApplyActionContentActionItemCell
+ (id)backgroundColor;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKApplyActionContentActionItem)actionItem;
- (void)_resetState;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActionItem:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PKApplyActionContentActionItemCell

- (void)setActionItem:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  objc_storeStrong((id *)&self->_actionItem, a3);
  [(PKApplyActionContentActionItemCell *)self _resetState];
  v5 = [(PKApplyActionContentActionItemCell *)self contentView];
  v6 = [(PKApplyActionContentActionItem *)self->_actionItem contextPrimaryActionIdentifier];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    v8 = PKUIChevronImage();
    v9 = (UIImageView *)[v7 initWithImage:v8];

    v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v9 setTintColor:v10];

    disclosureView = self->_disclosureView;
    self->_disclosureView = v9;
    v12 = v9;

    [v5 addSubview:self->_disclosureView];
  }
  v33 = self;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  p_actionItem = &self->_actionItem;
  id obj = [(PKApplyActionContentActionItem *)self->_actionItem items];
  uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v39 = *(void *)v43;
    v38 = (void *)*MEMORY[0x1E4FB2950];
    v15 = (void *)*MEMORY[0x1E4FB2790];
    v36 = (void *)*MEMORY[0x1E4FB28C8];
    uint64_t v37 = *MEMORY[0x1E4F85AB8];
    uint64_t v16 = *MEMORY[0x1E4F85A60];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v19 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        v20 = [v18 title];
        [v19 setText:v20];

        [v19 setNumberOfLines:0];
        v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v19 setTextColor:v21];

        v22 = PKFontForDefaultDesign(v38, v15, 0, 0);
        [v19 setFont:v22];

        [v19 setAccessibilityIdentifier:v37];
        [v5 addSubview:v19];
        id v23 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        v24 = [v18 subtitle];
        [v23 setText:v24];

        [v23 setNumberOfLines:0];
        v25 = [MEMORY[0x1E4FB1618] labelColor];
        [v23 setTextColor:v25];

        v26 = PKFontForDefaultDesign(v36, v15, 0, 0);
        [v23 setFont:v26];

        objc_msgSend(v23, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
        [v23 setAccessibilityIdentifier:v16];
        [v5 addSubview:v23];
        [v41 addObject:v19];
        [v40 addObject:v23];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v14);
  }

  uint64_t v27 = [v41 copy];
  titleLabels = v33->_titleLabels;
  v33->_titleLabels = (NSArray *)v27;

  uint64_t v29 = [v40 copy];
  subtitleLabels = v33->_subtitleLabels;
  v33->_subtitleLabels = (NSArray *)v29;

  v31 = [(PKApplyActionContentActionItem *)*p_actionItem contextPrimaryActionIdentifier];
  [(PKApplyActionContentActionItemCell *)v33 setAccessibilityIdentifier:v31];

  [(PKApplyActionContentActionItemCell *)v33 setNeedsLayout];
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
}

- (void)setHighlighted:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKApplyActionContentActionItemCell;
  -[PKApplyActionContentActionItemCell setHighlighted:](&v10, sel_setHighlighted_);
  if (a3) {
    [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else {
  v5 = [(id)objc_opt_class() backgroundColor];
  }
  v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PKApplyActionContentActionItemCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E59CA870;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 _animateUsingDefaultTimingWithOptions:0 animations:v8 completion:0];
}

uint64_t __53__PKApplyActionContentActionItemCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyActionContentActionItemCell;
  [(PKApplyActionContentActionItemCell *)&v4 layoutSubviews];
  v3 = [(PKApplyActionContentActionItemCell *)self contentView];
  [v3 bounds];
  -[PKApplyActionContentActionItemCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKApplyActionContentActionItemCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
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
  double v12 = y + 12.0;
  double v13 = width - (v10 + PKTableViewCellTextInset());
  double v14 = height + -24.0;
  if ([(PKApplyActionContentActionItemCell *)self _shouldReverseLayoutDirection])CGRectEdge v15 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v15 = CGRectMaxXEdge;
  remainder.origin.double x = v11;
  remainder.origin.double y = v12;
  remainder.size.double width = v13;
  remainder.size.double height = height + -24.0;
  disclosureView = self->_disclosureView;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", v13, 3.40282347e38);
    double v18 = v17;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB30];
  }
  memset(&v49, 0, sizeof(v49));
  memset(&v48, 0, sizeof(v48));
  if (v18 <= 0.0) {
    double v19 = v13;
  }
  else {
    double v19 = v13 - v18 + -15.0;
  }
  CGSize v42 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v43 = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v42;
  if (v18 > 0.0)
  {
    v51.origin.double x = v11;
    v51.origin.double y = v12;
    v51.size.double width = v13;
    v51.size.double height = v14;
    CGRectDivide(v51, &slice, &remainder, v18, v15);
    CGRectDivide(remainder, &v49, &remainder, 15.0, v15);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.double x = v20;
    slice.origin.double y = v21;
    slice.size.double width = v22;
    slice.size.double height = v23;
  }
  if (![(NSArray *)self->_titleLabels count])
  {
    double v25 = 0.0;
    if (a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  unint64_t v24 = 0;
  double v25 = 0.0;
  do
  {
    v26 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:v24];
    v45.origin = v43;
    v45.size = v42;
    objc_msgSend(v26, "sizeThatFits:", v19, 3.40282347e38);
    CGFloat v28 = v27;
    uint64_t v29 = [(NSArray *)self->_subtitleLabels objectAtIndexedSubscript:v24];
    v44.origin = v43;
    v44.size = v42;
    objc_msgSend(v29, "sizeThatFits:", v19, 3.40282347e38);
    CGFloat v31 = v30;
    CGRectDivide(remainder, &v45, &remainder, v28, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v45.origin.double x = v32;
    v45.origin.double y = v33;
    v45.size.double width = v34;
    v45.size.double height = v35;
    CGRectDivide(remainder, &v44, &remainder, v31, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v44.origin.double x = v36;
    v44.origin.double y = v37;
    v44.size.double width = v38;
    v44.size.double height = v39;
    if (!a4)
    {
      objc_msgSend(v26, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
      objc_msgSend(v29, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    }
    double v25 = v25 + v28 + v31;
    if (++v24 < [(NSArray *)self->_titleLabels count])
    {
      CGRectDivide(remainder, &v48, &remainder, 8.0, CGRectMinYEdge);
      double v25 = v25 + 8.0;
    }
  }
  while (v24 < [(NSArray *)self->_titleLabels count]);
  if (!a4) {
LABEL_20:
  }
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
LABEL_21:
  double v40 = v25 + 24.0;
  double v41 = width;
  result.double height = v40;
  result.double width = v41;
  return result;
}

- (void)_resetState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v3 = self->_titleLabels;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_subtitleLabels;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12++), "removeFromSuperview", (void)v16);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  [(UIImageView *)self->_disclosureView removeFromSuperview];
  disclosureView = self->_disclosureView;
  self->_disclosureView = 0;

  titleLabels = self->_titleLabels;
  self->_titleLabels = 0;

  subtitleLabels = self->_subtitleLabels;
  self->_subtitleLabels = 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplyActionContentActionItemCell;
  [(PKApplyActionContentActionItemCell *)&v3 prepareForReuse];
  [(PKApplyActionContentActionItemCell *)self _resetState];
}

- (PKApplyActionContentActionItem)actionItem
{
  return self->_actionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionItem, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitleLabels, 0);

  objc_storeStrong((id *)&self->_titleLabels, 0);
}

@end