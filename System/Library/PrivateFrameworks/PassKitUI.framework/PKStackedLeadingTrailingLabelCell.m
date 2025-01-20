@interface PKStackedLeadingTrailingLabelCell
- (BOOL)showProgressBar;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)leadingPrimaryText;
- (NSString)leadingSecondaryText;
- (NSString)trailingPrimaryText;
- (NSString)trailingSecondaryText;
- (UIColor)progressBarEndColor;
- (UIColor)progressBarStartColor;
- (double)_layoutLabelsSideBySide:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6;
- (double)_layoutLabelsStacked:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6;
- (double)progress;
- (void)_updateProgressBar;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDetailText:(id)a3;
- (void)setLeadingPrimaryText:(id)a3;
- (void)setLeadingSecondaryText:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarEndColor:(id)a3;
- (void)setProgressBarStartColor:(id)a3;
- (void)setShowProgressBar:(BOOL)a3;
- (void)setTrailingPrimaryText:(id)a3;
- (void)setTrailingSecondaryText:(id)a3;
@end

@implementation PKStackedLeadingTrailingLabelCell

- (void)setLeadingPrimaryText:(id)a3
{
  id v5 = a3;
  p_leadingPrimaryText = &self->_leadingPrimaryText;
  leadingPrimaryText = self->_leadingPrimaryText;
  v21 = (NSString *)v5;
  v8 = leadingPrimaryText;
  if (v8 == v21)
  {

LABEL_16:
    v10 = v21;
    goto LABEL_17;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_leadingPrimaryText, a3);
    uint64_t v11 = [(NSString *)*p_leadingPrimaryText length];
    leadingPrimaryLabel = self->_leadingPrimaryLabel;
    if (v11)
    {
      if (!leadingPrimaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v15 = self->_leadingPrimaryLabel;
        self->_leadingPrimaryLabel = v14;

        v16 = self->_leadingPrimaryLabel;
        v17 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_leadingPrimaryLabel setNumberOfLines:0];
        v18 = self->_leadingPrimaryLabel;
        if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])uint64_t v19 = 2; {
        else
        }
          uint64_t v19 = 0;
        [(UILabel *)v18 setTextAlignment:v19];
        [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_leadingPrimaryLabel];
      }
    }
    else
    {
      [(UILabel *)leadingPrimaryLabel removeFromSuperview];
      v20 = self->_leadingPrimaryLabel;
      self->_leadingPrimaryLabel = 0;
    }
    [(UILabel *)self->_leadingPrimaryLabel setText:*p_leadingPrimaryText];
    [(UILabel *)self->_leadingPrimaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setLeadingSecondaryText:(id)a3
{
  id v5 = a3;
  p_leadingSecondaryText = &self->_leadingSecondaryText;
  leadingSecondaryText = self->_leadingSecondaryText;
  v21 = (NSString *)v5;
  v8 = leadingSecondaryText;
  if (v8 == v21)
  {

LABEL_16:
    v10 = v21;
    goto LABEL_17;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_leadingSecondaryText, a3);
    uint64_t v11 = [(NSString *)*p_leadingSecondaryText length];
    leadingSecondaryLabel = self->_leadingSecondaryLabel;
    if (v11)
    {
      if (!leadingSecondaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v15 = self->_leadingSecondaryLabel;
        self->_leadingSecondaryLabel = v14;

        v16 = self->_leadingSecondaryLabel;
        v17 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2790], 32770, 0, *MEMORY[0x1E4FB09B8]);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_leadingSecondaryLabel setNumberOfLines:0];
        v18 = self->_leadingSecondaryLabel;
        if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])uint64_t v19 = 2; {
        else
        }
          uint64_t v19 = 0;
        [(UILabel *)v18 setTextAlignment:v19];
        [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_leadingSecondaryLabel];
      }
    }
    else
    {
      [(UILabel *)leadingSecondaryLabel removeFromSuperview];
      v20 = self->_leadingSecondaryLabel;
      self->_leadingSecondaryLabel = 0;
    }
    [(UILabel *)self->_leadingSecondaryLabel setText:*p_leadingSecondaryText];
    [(UILabel *)self->_leadingSecondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setTrailingPrimaryText:(id)a3
{
  id v5 = a3;
  p_trailingPrimaryText = &self->_trailingPrimaryText;
  trailingPrimaryText = self->_trailingPrimaryText;
  v21 = (NSString *)v5;
  v8 = trailingPrimaryText;
  if (v8 == v21)
  {

LABEL_16:
    v10 = v21;
    goto LABEL_17;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_trailingPrimaryText, a3);
    uint64_t v11 = [(NSString *)*p_trailingPrimaryText length];
    trailingPrimaryLabel = self->_trailingPrimaryLabel;
    if (v11)
    {
      if (!trailingPrimaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v15 = self->_trailingPrimaryLabel;
        self->_trailingPrimaryLabel = v14;

        v16 = self->_trailingPrimaryLabel;
        v17 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_trailingPrimaryLabel setNumberOfLines:0];
        v18 = self->_trailingPrimaryLabel;
        if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])uint64_t v19 = 0; {
        else
        }
          uint64_t v19 = 2;
        [(UILabel *)v18 setTextAlignment:v19];
        [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_trailingPrimaryLabel];
      }
    }
    else
    {
      [(UILabel *)trailingPrimaryLabel removeFromSuperview];
      v20 = self->_trailingPrimaryLabel;
      self->_trailingPrimaryLabel = 0;
    }
    [(UILabel *)self->_trailingPrimaryLabel setText:*p_trailingPrimaryText];
    [(UILabel *)self->_trailingPrimaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85988]];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setTrailingSecondaryText:(id)a3
{
  id v5 = a3;
  p_trailingSecondaryText = &self->_trailingSecondaryText;
  trailingSecondaryText = self->_trailingSecondaryText;
  v21 = (NSString *)v5;
  v8 = trailingSecondaryText;
  if (v8 == v21)
  {

LABEL_16:
    v10 = v21;
    goto LABEL_17;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_trailingSecondaryText, a3);
    uint64_t v11 = [(NSString *)*p_trailingSecondaryText length];
    trailingSecondaryLabel = self->_trailingSecondaryLabel;
    if (v11)
    {
      if (!trailingSecondaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v15 = self->_trailingSecondaryLabel;
        self->_trailingSecondaryLabel = v14;

        v16 = self->_trailingSecondaryLabel;
        v17 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2790], 32770, 0, *MEMORY[0x1E4FB09B8]);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_trailingSecondaryLabel setNumberOfLines:0];
        v18 = self->_trailingSecondaryLabel;
        if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])uint64_t v19 = 0; {
        else
        }
          uint64_t v19 = 2;
        [(UILabel *)v18 setTextAlignment:v19];
        [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_trailingSecondaryLabel];
      }
    }
    else
    {
      [(UILabel *)trailingSecondaryLabel removeFromSuperview];
      v20 = self->_trailingSecondaryLabel;
      self->_trailingSecondaryLabel = 0;
    }
    [(UILabel *)self->_trailingSecondaryLabel setText:*p_trailingSecondaryText];
    [(UILabel *)self->_trailingSecondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85980]];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setDetailText:(id)a3
{
  id v5 = a3;
  p_detailText = &self->_detailText;
  detailText = self->_detailText;
  v23 = (NSString *)v5;
  v8 = detailText;
  if (v8 == v23)
  {

LABEL_16:
    v10 = v23;
    goto LABEL_17;
  }
  if (!v23 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v23 isEqualToString:v8];

  v10 = v23;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_detailText, a3);
    uint64_t v11 = [(NSString *)*p_detailText length];
    detailLabel = self->_detailLabel;
    if (v11)
    {
      if (!detailLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v15 = self->_detailLabel;
        self->_detailLabel = v14;

        v16 = self->_detailLabel;
        v17 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
        [(UILabel *)v16 setFont:v17];

        v18 = self->_detailLabel;
        uint64_t v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(UILabel *)v18 setTextColor:v19];

        [(UILabel *)self->_detailLabel setNumberOfLines:0];
        v20 = self->_detailLabel;
        if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])uint64_t v21 = 2; {
        else
        }
          uint64_t v21 = 0;
        [(UILabel *)v20 setTextAlignment:v21];
        [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_detailLabel];
      }
    }
    else
    {
      [(UILabel *)detailLabel removeFromSuperview];
      v22 = self->_detailLabel;
      self->_detailLabel = 0;
    }
    [(UILabel *)self->_detailLabel setText:*p_detailText];
    [(UILabel *)self->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setShowProgressBar:(BOOL)a3
{
  if (self->_showProgressBar != a3)
  {
    self->_showProgressBar = a3;
    [(PKStackedLeadingTrailingLabelCell *)self _updateProgressBar];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
  }
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(PKStackedLeadingTrailingLabelCell *)self _updateProgressBar];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
  }
}

- (void)setProgressBarStartColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressBarStartColor, a3);
    [(PKStackedLeadingTrailingLabelCell *)self _updateProgressBar];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
  }
}

- (void)setProgressBarEndColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressBarEndColor, a3);
    [(PKStackedLeadingTrailingLabelCell *)self _updateProgressBar];
    [(PKStackedLeadingTrailingLabelCell *)self setNeedsLayout];
  }
}

- (void)_updateProgressBar
{
  BOOL showProgressBar = self->_showProgressBar;
  progressBar = self->_progressBar;
  if (showProgressBar)
  {
    if (!progressBar)
    {
      id v5 = objc_alloc_init(PKProgressBar);
      v6 = self->_progressBar;
      self->_progressBar = v5;

      [(PKStackedLeadingTrailingLabelCell *)self addSubview:self->_progressBar];
      progressBar = self->_progressBar;
    }
    [(PKProgressBar *)progressBar setProgress:self->_progress];
    [(PKProgressBar *)self->_progressBar setCornerRadius:4.0];
    [(PKProgressBar *)self->_progressBar setGradientStartColor:self->_progressBarStartColor];
    v7 = self->_progressBar;
    progressBarEndColor = self->_progressBarEndColor;
    [(PKProgressBar *)v7 setGradientEndColor:progressBarEndColor];
  }
  else
  {
    [(PKProgressBar *)progressBar removeFromSuperview];
    BOOL v9 = self->_progressBar;
    self->_progressBar = 0;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKStackedLeadingTrailingLabelCell;
  [(PKStackedLeadingTrailingLabelCell *)&v4 layoutSubviews];
  v3 = [(PKStackedLeadingTrailingLabelCell *)self contentView];
  [v3 bounds];
  -[PKStackedLeadingTrailingLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKStackedLeadingTrailingLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = PKTableViewCellTextInset();
  double v11 = x + v10;
  double v12 = y + 15.0;
  double v49 = width;
  double v13 = width - (v10 + PKTableViewCellTextInset());
  double v14 = height + -30.0;
  [(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection];
  v15 = (double *)MEMORY[0x1E4F1DB28];
  CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v16;
  remainder.origin.double x = v11;
  remainder.origin.double y = v12;
  remainder.size.double width = v13;
  remainder.size.double height = height + -30.0;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  double v18 = v17;
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  double v20 = v19;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  double v22 = v21;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  double v24 = v22 + v23;
  if (v18 + v20 <= v13 && v24 <= v13) {
    -[PKStackedLeadingTrailingLabelCell _layoutLabelsSideBySide:allocated:unallocated:isTemplateLayout:](self, "_layoutLabelsSideBySide:allocated:unallocated:isTemplateLayout:", &slice, &remainder, v4, v11, v12, v13, v14);
  }
  else {
    -[PKStackedLeadingTrailingLabelCell _layoutLabelsStacked:allocated:unallocated:isTemplateLayout:](self, "_layoutLabelsStacked:allocated:unallocated:isTemplateLayout:", &slice, &remainder, v4, v11, v12, v13, v14);
  }
  double v27 = v26 + 0.0;
  if (self->_showProgressBar)
  {
    if (self->_leadingPrimaryText
      || self->_leadingSecondaryText
      || self->_trailingPrimaryText
      || self->_trailingSecondaryText)
    {
      CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
      double v27 = v27 + 12.0;
    }
    double v27 = v27 + 20.0;
    CGRectDivide(remainder, &slice, &remainder, 20.0, CGRectMinYEdge);
    PKSizeAlignedInRect();
    double v47 = v29;
    double v48 = v28;
    double v31 = v30;
    double v33 = v32;
  }
  else
  {
    double v31 = v15[2];
    double v47 = v15[1];
    double v48 = *v15;
    double v33 = v15[3];
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v13, 3.40282347e38);
  CGFloat v35 = v34;
  if (v36 > 0.0 && self->_showProgressBar)
  {
    CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
    double v27 = v27 + 12.0;
  }
  CGRectDivide(remainder, &slice, &remainder, v35, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!v4)
  {
    double v41 = v37;
    double v42 = v38;
    double v43 = v39;
    double v44 = v40;
    -[PKProgressBar setFrame:](self->_progressBar, "setFrame:", v48, v47, v31, v33);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v41, v42, v43, v44);
  }
  double v45 = v35 + v27 + 15.0 + 15.0;
  double v46 = v49;
  result.double height = v45;
  result.double width = v46;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection])CGRectEdge v15 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v15 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  double v17 = v16;
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v19 = v18;
  double v21 = fmax(v17, v20);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = width;
  v59.size.CGFloat height = height;
  CGRectDivide(v59, &slice, &remainder, v21, CGRectMinYEdge);
  memset(&v56, 0, sizeof(v56));
  CGRectDivide(slice, &v56, &slice, v19, v15);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v56.origin.CGFloat x = v22;
  v56.origin.CGFloat y = v23;
  v56.size.double width = v24;
  v56.size.CGFloat height = v25;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v53 = v27;
  double v54 = v26;
  double v29 = v28;
  double v31 = v30;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  double v33 = v32;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v35 = v34;
  double v37 = fmax(v33, v36);
  CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
  memset(&v55, 0, sizeof(v55));
  CGRectDivide(slice, &v55, &slice, v35, v15);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v55.origin.CGFloat x = v38;
  v55.origin.CGFloat y = v39;
  v55.size.double width = v40;
  v55.size.CGFloat height = v41;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a6)
  {
    double v46 = v42;
    double v47 = v43;
    double v48 = v44;
    double v49 = v45;
    -[UILabel setFrame:](self->_leadingPrimaryLabel, "setFrame:", v54, v53, v29, v31);
    -[UILabel setFrame:](self->_trailingPrimaryLabel, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    -[UILabel setFrame:](self->_leadingSecondaryLabel, "setFrame:", v46, v47, v48, v49);
    -[UILabel setFrame:](self->_trailingSecondaryLabel, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  }
  if (a4)
  {
    CGSize size = slice.size;
    a4->origin = slice.origin;
    a4->CGSize size = size;
  }
  if (a5)
  {
    CGSize v51 = remainder.size;
    a5->origin = remainder.origin;
    a5->CGSize size = v51;
  }
  return v21 + 0.0 + v37;
}

- (double)_layoutLabelsStacked:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PKStackedLeadingTrailingLabelCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v15 = v14;
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.double width = width;
  v56.size.CGFloat height = height;
  CGRectDivide(v56, &slice, &remainder, v15, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v51 = v17;
  double v52 = v16;
  double v50 = v18;
  double v53 = v19;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v48 = v22;
  double v49 = v21;
  double v47 = v23;
  double v25 = v24;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v46 = v27;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v34, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a6)
  {
    double v39 = v35;
    double v40 = v36;
    double v41 = v37;
    double v42 = v38;
    -[UILabel setFrame:](self->_leadingPrimaryLabel, "setFrame:", v52, v51, v50, v53);
    -[UILabel setFrame:](self->_trailingPrimaryLabel, "setFrame:", v46, v29, v31, v33);
    -[UILabel setFrame:](self->_leadingSecondaryLabel, "setFrame:", v49, v48, v47, v25);
    -[UILabel setFrame:](self->_trailingSecondaryLabel, "setFrame:", v39, v40, v41, v42);
  }
  if (a4)
  {
    CGSize size = slice.size;
    a4->origin = slice.origin;
    a4->CGSize size = size;
  }
  if (a5)
  {
    CGSize v44 = remainder.size;
    a5->origin = remainder.origin;
    a5->CGSize size = v44;
  }
  return v25 + v53 + 0.0 + v25 + 10.0 + v33;
}

- (void)prepareForReuse
{
  v14.receiver = self;
  v14.super_class = (Class)PKStackedLeadingTrailingLabelCell;
  [(PKStackedLeadingTrailingLabelCell *)&v14 prepareForReuse];
  [(UILabel *)self->_leadingPrimaryLabel removeFromSuperview];
  leadingPrimaryLabel = self->_leadingPrimaryLabel;
  self->_leadingPrimaryLabel = 0;

  leadingPrimaryText = self->_leadingPrimaryText;
  self->_leadingPrimaryText = 0;

  [(UILabel *)self->_trailingPrimaryLabel removeFromSuperview];
  trailingPrimaryLabel = self->_trailingPrimaryLabel;
  self->_trailingPrimaryLabel = 0;

  trailingPrimaryText = self->_trailingPrimaryText;
  self->_trailingPrimaryText = 0;

  [(UILabel *)self->_leadingSecondaryLabel removeFromSuperview];
  leadingSecondaryLabel = self->_leadingSecondaryLabel;
  self->_leadingSecondaryLabel = 0;

  leadingSecondaryText = self->_leadingSecondaryText;
  self->_leadingSecondaryText = 0;

  [(UILabel *)self->_trailingSecondaryLabel removeFromSuperview];
  trailingSecondaryLabel = self->_trailingSecondaryLabel;
  self->_trailingSecondaryLabel = 0;

  trailingSecondaryText = self->_trailingSecondaryText;
  self->_trailingSecondaryText = 0;

  [(UILabel *)self->_detailLabel removeFromSuperview];
  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  [(PKProgressBar *)self->_progressBar removeFromSuperview];
  progressBar = self->_progressBar;
  self->_progressBar = 0;

  self->_progress = 0.0;
  self->_BOOL showProgressBar = 0;
}

- (NSString)leadingPrimaryText
{
  return self->_leadingPrimaryText;
}

- (NSString)leadingSecondaryText
{
  return self->_leadingSecondaryText;
}

- (NSString)trailingPrimaryText
{
  return self->_trailingPrimaryText;
}

- (NSString)trailingSecondaryText
{
  return self->_trailingSecondaryText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showProgressBar
{
  return self->_showProgressBar;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressBarStartColor
{
  return self->_progressBarStartColor;
}

- (UIColor)progressBarEndColor
{
  return self->_progressBarEndColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarEndColor, 0);
  objc_storeStrong((id *)&self->_progressBarStartColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryText, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryText, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryText, 0);
  objc_storeStrong((id *)&self->_leadingPrimaryText, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryLabel, 0);

  objc_storeStrong((id *)&self->_leadingPrimaryLabel, 0);
}

@end