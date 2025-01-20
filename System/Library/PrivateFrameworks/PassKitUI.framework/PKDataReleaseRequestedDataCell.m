@interface PKDataReleaseRequestedDataCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)intentDisplayOnlyElements;
- (NSArray)intentDoNotRetainElements;
- (NSArray)intentRetainElements;
- (NSString)intentDisplayOnlyTitle;
- (NSString)intentDoNotRetainTitle;
- (NSString)intentRetainTitle;
- (NSString)title;
- (PKDataReleaseRequestedDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIFont)bodyFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (void)_recreateViews:(id)a3 forElements:(id)a4;
- (void)layoutSubviews;
- (void)setBodyFont:(id)a3;
- (void)setIntentDisplayOnlyElements:(id)a3;
- (void)setIntentDisplayOnlyTitle:(id)a3;
- (void)setIntentDoNotRetainElements:(id)a3;
- (void)setIntentDoNotRetainTitle:(id)a3;
- (void)setIntentRetainElements:(id)a3;
- (void)setIntentRetainTitle:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation PKDataReleaseRequestedDataCell

- (PKDataReleaseRequestedDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)PKDataReleaseRequestedDataCell;
  v4 = [(PKDataReleaseRequestedDataCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (NSString *)*MEMORY[0x1E4FB27F0];
    uint64_t v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB27F0]);
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v6;

    uint64_t v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], v5);
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v8;

    uint64_t v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], v5);
    bodyFont = v4->_bodyFont;
    v4->_bodyFont = (UIFont *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    retainElementViews = v4->_retainElementViews;
    v4->_retainElementViews = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    doNotRetainElementViews = v4->_doNotRetainElementViews;
    v4->_doNotRetainElementViews = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    displayOnlyElementViews = v4->_displayOnlyElementViews;
    v4->_displayOnlyElementViews = v16;

    v18 = [(PKDataReleaseRequestedDataCell *)v4 contentView];
    v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    intentRetainElements = v4->_intentRetainElements;
    v4->_intentRetainElements = v19;

    v21 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    intentDoNotRetainElements = v4->_intentDoNotRetainElements;
    v4->_intentDoNotRetainElements = v21;

    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    intentDisplayOnlyElements = v4->_intentDisplayOnlyElements;
    v4->_intentDisplayOnlyElements = v23;

    v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView1 = v4->_separatorView1;
    v4->_separatorView1 = v25;

    v27 = v4->_separatorView1;
    v28 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v27 setBackgroundColor:v28];

    [v18 addSubview:v4->_separatorView1];
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView2 = v4->_separatorView2;
    v4->_separatorView2 = v29;

    v31 = v4->_separatorView2;
    v32 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v31 setBackgroundColor:v32];

    [v18 addSubview:v4->_separatorView2];
    v33 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v33;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setFont:v4->_titleFont];
    [v18 addSubview:v4->_titleLabel];
    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    intentRetainLabel = v4->_intentRetainLabel;
    v4->_intentRetainLabel = v35;

    [(UILabel *)v4->_intentRetainLabel setFont:v4->_subtitleFont];
    v37 = v4->_intentRetainLabel;
    v38 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v37 setTextColor:v38];

    [(UILabel *)v4->_intentRetainLabel setNumberOfLines:0];
    [v18 addSubview:v4->_intentRetainLabel];
    v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    intentDoNotRetainLabel = v4->_intentDoNotRetainLabel;
    v4->_intentDoNotRetainLabel = v39;

    [(UILabel *)v4->_intentDoNotRetainLabel setFont:v4->_subtitleFont];
    v41 = v4->_intentDoNotRetainLabel;
    v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v41 setTextColor:v42];

    [(UILabel *)v4->_intentDoNotRetainLabel setNumberOfLines:0];
    [v18 addSubview:v4->_intentDoNotRetainLabel];
    v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    intentDisplayOnlyLabel = v4->_intentDisplayOnlyLabel;
    v4->_intentDisplayOnlyLabel = v43;

    [(UILabel *)v4->_intentDisplayOnlyLabel setFont:v4->_subtitleFont];
    v45 = v4->_intentDisplayOnlyLabel;
    v46 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v45 setTextColor:v46];

    [(UILabel *)v4->_intentDisplayOnlyLabel setNumberOfLines:0];
    [v18 addSubview:v4->_intentDisplayOnlyLabel];
  }
  return v4;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
}

- (void)setTitleFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_titleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(UILabel *)self->_titleLabel setFont:v5];
    [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
  }
}

- (void)setSubtitleFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_subtitleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    [(UILabel *)self->_intentRetainLabel setFont:v5];
    [(UILabel *)self->_intentDoNotRetainLabel setFont:v5];
    [(UILabel *)self->_intentDisplayOnlyLabel setFont:v5];
    [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
  }
}

- (void)setBodyFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_bodyFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bodyFont, a3);
    [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_retainElementViews forElements:self->_intentRetainElements];
    [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_doNotRetainElementViews forElements:self->_intentDoNotRetainElements];
    [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_displayOnlyElementViews forElements:self->_intentDisplayOnlyElements];
    [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
  }
}

- (NSString)intentRetainTitle
{
  return [(UILabel *)self->_intentRetainLabel text];
}

- (void)setIntentRetainTitle:(id)a3
{
  [(UILabel *)self->_intentRetainLabel setText:a3];

  [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
}

- (NSString)intentDoNotRetainTitle
{
  return [(UILabel *)self->_intentDoNotRetainLabel text];
}

- (void)setIntentDoNotRetainTitle:(id)a3
{
  [(UILabel *)self->_intentDoNotRetainLabel setText:a3];

  [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
}

- (NSString)intentDisplayOnlyTitle
{
  return [(UILabel *)self->_intentDisplayOnlyLabel text];
}

- (void)setIntentDisplayOnlyTitle:(id)a3
{
  [(UILabel *)self->_intentDisplayOnlyLabel setText:a3];

  [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
}

- (void)setIntentRetainElements:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  intentRetainElements = self->_intentRetainElements;
  self->_intentRetainElements = v4;

  [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_retainElementViews forElements:v6];
}

- (void)setIntentDoNotRetainElements:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  intentDoNotRetainElements = self->_intentDoNotRetainElements;
  self->_intentDoNotRetainElements = v4;

  [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_doNotRetainElementViews forElements:v6];
}

- (void)setIntentDisplayOnlyElements:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  intentDisplayOnlyElements = self->_intentDisplayOnlyElements;
  self->_intentDisplayOnlyElements = v4;

  [(PKDataReleaseRequestedDataCell *)self _recreateViews:self->_displayOnlyElementViews forElements:v6];
}

- (void)_recreateViews:(id)a3 forElements:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v10++) removeFromSuperview];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  [v5 removeAllObjects];
  v11 = [(PKDataReleaseRequestedDataCell *)self contentView];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
        v21 = -[PKDataReleaseSingleElementView initWithFrame:]([PKDataReleaseSingleElementView alloc], "initWithFrame:", v15, v16, v17, v18);
        v22 = [v20 localizedTitle];
        bodyFont = self->_bodyFont;
        v24 = [v20 icon];
        [(PKDataReleaseSingleElementView *)v21 setTitle:v22 titleFont:bodyFont image:v24];

        [v5 addObject:v21];
        [v11 addSubview:v21];

        ++v19;
      }
      while (v13 != v19);
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v13);
  }

  [(PKDataReleaseRequestedDataCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseRequestedDataCell;
  [(PKDataReleaseRequestedDataCell *)&v3 layoutSubviews];
  [(PKDataReleaseRequestedDataCell *)self bounds];
  [(PKDataReleaseRequestedDataCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKDataReleaseRequestedDataCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  uint64_t v39 = 0;
  v40 = (CGRect *)&v39;
  uint64_t v41 = 0x4010000000;
  v42 = "";
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v31 = 0;
  long long v32 = (CGRect *)&v31;
  uint64_t v33 = 0x4010000000;
  long long v34 = "";
  memset(&slice, 0, sizeof(slice));
  double v35 = a3.origin.x + 0.0;
  double v36 = a3.origin.y + 16.0;
  CGFloat v37 = a3.size.width;
  double v38 = a3.size.height + -32.0;
  double v5 = [(PKDataReleaseRequestedDataCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  int v8 = [(PKDataReleaseRequestedDataCell *)self _shouldReverseLayoutDirection];
  if (v8) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  if (v8) {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  v10.n128_u64[0] = 0.5;
  v9.n128_f64[0] = (v32[1].size.width + -12.0 + -32.0) * 0.5;
  PKFloatFloorToPixel(v9, v10);
  uint64_t v14 = v13;
  [(UIFont *)self->_bodyFont lineHeight];
  uint64_t v16 = v15;
  CGRectDivide(v32[1], v40 + 1, v32 + 1, 16.0, v11);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v32[1].size.width, v32[1].size.height);
  CGRectDivide(v32[1], v40 + 1, v32 + 1, v17, CGRectMinYEdge);
  CGRectDivide(v40[1], &slice, v40 + 1, 16.0, v12);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v40[1].origin.x, v40[1].origin.y, v40[1].size.width, v40[1].size.height);
  }
  CGRectDivide(v32[1], v40 + 1, v32 + 1, 4.0, CGRectMinYEdge);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke;
  aBlock[3] = &unk_1E59CBC40;
  aBlock[5] = &v31;
  aBlock[6] = &v39;
  aBlock[4] = self;
  BOOL v29 = IsAccessibilityCategory;
  CGRectEdge v27 = v12;
  CGRectEdge v28 = v11;
  aBlock[7] = v16;
  aBlock[8] = v14;
  double v18 = (void (**)(void *, NSMutableArray *, UILabel *))_Block_copy(aBlock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke_2;
  v25[3] = &unk_1E59CBC68;
  v25[5] = &v31;
  v25[6] = &v39;
  v25[4] = self;
  uint64_t v19 = (void (**)(void *, BOOL, UIView *))_Block_copy(v25);
  v18[2](v18, self->_retainElementViews, self->_intentRetainLabel);
  if ([(NSMutableArray *)self->_retainElementViews count]) {
    BOOL v20 = [(NSMutableArray *)self->_doNotRetainElementViews count] != 0;
  }
  else {
    BOOL v20 = 0;
  }
  v19[2](v19, v20, self->_separatorView1);
  v18[2](v18, self->_doNotRetainElementViews, self->_intentDoNotRetainLabel);
  if ([(NSMutableArray *)self->_doNotRetainElementViews count]) {
    BOOL v21 = [(NSMutableArray *)self->_displayOnlyElementViews count] != 0;
  }
  else {
    BOOL v21 = 0;
  }
  v19[2](v19, v21, self->_separatorView2);
  v18[2](v18, self->_displayOnlyElementViews, self->_intentDisplayOnlyLabel);
  double v22 = v32[1].origin.y + 16.0;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v39, 8);
  double v23 = width;
  double v24 = v22;
  result.height = v24;
  result.CGFloat width = v23;
  return result;
}

void __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = [v6 text];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      memset(&remainder, 0, sizeof(remainder));
      CGRectDivide(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), &remainder, 16.0, *(CGRectEdge *)(a1 + 72));
      objc_msgSend(v6, "sizeThatFits:", remainder.size.width, remainder.size.height);
      CGFloat width = remainder.size.width;
      if (v11 <= remainder.size.width)
      {
        CGFloat v13 = v9;
      }
      else
      {
        PKFloatCeilToPixel();
        CGFloat v13 = v12;
        CGFloat width = remainder.size.width;
      }
      CGFloat x = remainder.origin.x;
      CGFloat y = remainder.origin.y;
      CGFloat height = remainder.size.height;
      CGRectDivide(*(CGRect *)(&width - 2), &remainder, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v13, CGRectMinYEdge);
      CGFloat v17 = *(CGRect **)(*(void *)(a1 + 40) + 8);
      v30.origin.CGFloat x = v17[1].origin.x;
      v30.origin.CGFloat y = v17[1].origin.y;
      ++v17;
      v30.size.CGFloat width = v17->size.width;
      v30.size.CGFloat height = v17->size.height;
      CGRectDivide(v30, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v17, v13, CGRectMinYEdge);
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 1088)) {
        objc_msgSend(v6, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      }
    }
    memset(&remainder, 0, sizeof(remainder));
    v28.size = 0u;
    if (objc_msgSend(v5, "count", 0, 0))
    {
      unint64_t v18 = 0;
      char v19 = 1;
      do
      {
        unint64_t v20 = v18;
        if (!*(unsigned char *)(a1 + 80))
        {
          if (v18) {
            unint64_t v20 = (objc_msgSend(v5, "count", v18) + v18) >> 1;
          }
          else {
            unint64_t v20 = v18 >> 1;
          }
        }
        BOOL v21 = [v5 objectAtIndex:v20];
        if (v19)
        {
          double v22 = *(CGRect **)(*(void *)(a1 + 40) + 8);
          v31.origin.CGFloat x = v22[1].origin.x;
          v31.origin.CGFloat y = v22[1].origin.y;
          ++v22;
          v31.size.CGFloat width = v22->size.width;
          v31.size.CGFloat height = v22->size.height;
          CGRectDivide(v31, &v28, v22, 8.0, CGRectMinYEdge);
          double v23 = *(CGRect **)(*(void *)(a1 + 40) + 8);
          v32.origin.CGFloat x = v23[1].origin.x;
          v32.origin.CGFloat y = v23[1].origin.y;
          ++v23;
          v32.size.CGFloat width = v23->size.width;
          v32.size.CGFloat height = v23->size.height;
          CGRectDivide(v32, &v28, v23, *(CGFloat *)(a1 + 56), CGRectMinYEdge);
          if (!*(unsigned char *)(a1 + 80))
          {
            char v19 = 0;
LABEL_21:
            CGFloat v25 = *(double *)(a1 + 64);
            CGFloat v24 = v28.size.width;
            goto LABEL_22;
          }
        }
        else
        {
          CGRectDivide(v28, &remainder, &v28, 12.0, *(CGRectEdge *)(a1 + 76));
        }
        CGRectDivide(v28, &remainder, &v28, 16.0, *(CGRectEdge *)(a1 + 72));
        if (!*(unsigned char *)(a1 + 80))
        {
          char v19 = 1;
          goto LABEL_21;
        }
        char v19 = 1;
        CGFloat v24 = v28.size.width;
        CGFloat v25 = v28.size.width;
LABEL_22:
        CGPoint origin = v28.origin;
        CGFloat v27 = v28.size.height;
        CGRectDivide(*(CGRect *)(&v24 - 2), &remainder, &v28, v25, *(CGRectEdge *)(a1 + 76));
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 1088)) {
          objc_msgSend(v21, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
        }

        ++v18;
      }
      while (v18 < [v5 count]);
    }
  }
}

void __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke_2(void *a1, int a2, void *a3)
{
  id v10 = a3;
  if (a2)
  {
    id v5 = *(CGRect **)(a1[5] + 8);
    v12.origin.CGFloat x = v5[1].origin.x;
    v12.origin.CGFloat y = v5[1].origin.y;
    ++v5;
    v12.size.CGFloat width = v5->size.width;
    v12.size.CGFloat height = v5->size.height;
    CGRectDivide(v12, (CGRect *)(*(void *)(a1[6] + 8) + 32), v5, 16.0, CGRectMinYEdge);
    id v6 = *(CGRect **)(a1[5] + 8);
    uint64_t v7 = (CGRect *)(*(void *)(a1[6] + 8) + 32);
    double v8 = PKUIPixelLength();
    v13.origin.CGFloat x = v6[1].origin.x;
    v13.origin.CGFloat y = v6[1].origin.y;
    ++v6;
    v13.size.CGFloat width = v6->size.width;
    v13.size.CGFloat height = v6->size.height;
    CGRectDivide(v13, v7, v6, v8, CGRectMinYEdge);
    if (!*(unsigned char *)(a1[4] + 1088)) {
      objc_msgSend(v10, "setFrame:", *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40), *(double *)(*(void *)(a1[6] + 8) + 48), *(double *)(*(void *)(a1[6] + 8) + 56));
    }
    double v9 = *(CGRect **)(a1[5] + 8);
    v14.origin.CGFloat x = v9[1].origin.x;
    v14.origin.CGFloat y = v9[1].origin.y;
    ++v9;
    v14.size.CGFloat width = v9->size.width;
    v14.size.CGFloat height = v9->size.height;
    CGRectDivide(v14, (CGRect *)(*(void *)(a1[6] + 8) + 32), v9, 16.0, CGRectMinYEdge);
  }
  [v10 setHidden:a2 ^ 1u];
}

- (NSArray)intentRetainElements
{
  return self->_intentRetainElements;
}

- (NSArray)intentDoNotRetainElements
{
  return self->_intentDoNotRetainElements;
}

- (NSArray)intentDisplayOnlyElements
{
  return self->_intentDisplayOnlyElements;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyElements, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainElements, 0);
  objc_storeStrong((id *)&self->_intentRetainElements, 0);
  objc_storeStrong((id *)&self->_displayOnlyElementViews, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyLabel, 0);
  objc_storeStrong((id *)&self->_separatorView2, 0);
  objc_storeStrong((id *)&self->_doNotRetainElementViews, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainLabel, 0);
  objc_storeStrong((id *)&self->_separatorView1, 0);
  objc_storeStrong((id *)&self->_retainElementViews, 0);
  objc_storeStrong((id *)&self->_intentRetainLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end