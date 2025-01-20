@interface PKAdjustableSingleCellView
- (BOOL)_needsThirdLine;
- (BOOL)enableDisclosure;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detail;
- (NSString)subDetail;
- (NSString)title;
- (PKAdjustableSingleCellView)init;
- (PKAdjustableSingleCellView)initWithFrame:(CGRect)a3;
- (PKPaymentPass)pass;
- (PKPaymentPassAction)action;
- (UIColor)detailColor;
- (UIColor)subDetailColor;
- (UIColor)titleColor;
- (id)_detailFont;
- (id)_smallerDetailFont;
- (id)_subDetailFont;
- (id)_titleFont;
- (id)actionHandler;
- (int64_t)detailLineBreakMode;
- (int64_t)subDetailLineBreakMode;
- (int64_t)titleLineBreakMode;
- (int64_t)viewType;
- (void)_actionButtonTapped:(id)a3;
- (void)_applyStyles;
- (void)_performInit;
- (void)_setupViews;
- (void)_updateContent:(BOOL)a3;
- (void)beginUpdates;
- (void)endUpdates:(BOOL)a3;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAction:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setDetail:(id)a3;
- (void)setDetailColor:(id)a3;
- (void)setDetailLineBreakMode:(int64_t)a3;
- (void)setEnableDisclosure:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setSubDetail:(id)a3;
- (void)setSubDetailColor:(id)a3;
- (void)setSubDetailLineBreakMode:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleLineBreakMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKAdjustableSingleCellView

- (PKAdjustableSingleCellView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKAdjustableSingleCellView;
  v2 = [(PKAdjustableSingleCellView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKAdjustableSingleCellView *)v2 _performInit];
  }
  return v3;
}

- (PKAdjustableSingleCellView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAdjustableSingleCellView;
  v3 = -[PKAdjustableSingleCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKAdjustableSingleCellView *)v3 _performInit];
  }
  return v4;
}

- (int64_t)viewType
{
  return 0;
}

- (void)prepareForReuse
{
  [(UILabel *)self->_titleView setText:0];
  [(UILabel *)self->_detailView setText:0];
  [(UILabel *)self->_subDetailView setText:0];
  [(PKContinuousButton *)self->_actionButton setAlpha:0.0];
  disclosureView = self->_disclosureView;

  [(UIImageView *)disclosureView setAlpha:0.0];
}

- (void)_performInit
{
  self->_topPadding = 0.0;
  self->_isTemplateLayout = 0;
  self->_deferUpdateCounter = 0;
  self->_animated = 0;
  [(PKAdjustableSingleCellView *)self _setupViews];
  [(PKAdjustableSingleCellView *)self _applyStyles];
  uint64_t v3 = *MEMORY[0x1E4F85210];

  [(PKAdjustableSingleCellView *)self setAccessibilityIdentifier:v3];
}

- (void)_setupViews
{
  uint64_t v3 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(UIView *)self pkui_setMaskType:3];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  titleView = self->_titleView;
  self->_titleView = v9;

  [(UILabel *)self->_titleView setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  detailView = self->_detailView;
  self->_detailView = v11;

  [(UILabel *)self->_detailView setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  subDetailView = self->_subDetailView;
  self->_subDetailView = v13;

  [(UILabel *)self->_subDetailView setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  uint64_t v23 = 0;
  int64x2_t v24 = vdupq_n_s64(2uLL);
  int64x2_t v25 = v24;
  v15 = [[PKContinuousButton alloc] initWithConfiguration:&v23];
  actionButton = self->_actionButton;
  self->_actionButton = v15;

  [(PKContinuousButton *)self->_actionButton addTarget:self action:sel__actionButtonTapped_ forControlEvents:64];
  [(PKContinuousButton *)self->_actionButton setAlpha:0.0];
  [(PKContinuousButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  id v17 = objc_alloc(MEMORY[0x1E4FB1838]);
  v18 = PKUIChevronImage();
  v19 = (UIImageView *)[v17 initWithImage:v18];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v19;

  v21 = self->_disclosureView;
  v22 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v21 setTintColor:v22];

  [(UIImageView *)self->_disclosureView setAlpha:0.0];
  [(PKAdjustableSingleCellView *)self addSubview:self->_titleView];
  [(PKAdjustableSingleCellView *)self addSubview:self->_detailView];
  [(PKAdjustableSingleCellView *)self addSubview:self->_subDetailView];
  [(PKAdjustableSingleCellView *)self addSubview:self->_actionButton];
  [(PKAdjustableSingleCellView *)self addSubview:self->_disclosureView];
  [(PKAdjustableSingleCellView *)self setBackgroundColor:v3];
}

- (id)_titleFont
{
  uint64_t v3 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [v3 lineHeight];
  PKFloatRoundToPixel();
  self->_topPadding = v4;

  return v3;
}

- (id)_detailFont
{
  detailView = self->_detailView;
  uint64_t v3 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)detailView setTextColor:v3];

  double v4 = (void *)*MEMORY[0x1E4FB0938];
  double v5 = (void *)*MEMORY[0x1E4FB2988];
  double v6 = (void *)*MEMORY[0x1E4FB2780];
  double v7 = *MEMORY[0x1E4FB09B8];

  return PKFontForDesign(v4, v5, v6, 2, 0, v7);
}

- (id)_smallerDetailFont
{
  detailView = self->_detailView;
  uint64_t v3 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)detailView setTextColor:v3];

  double v4 = (void *)*MEMORY[0x1E4FB0938];
  double v5 = (void *)*MEMORY[0x1E4FB2990];
  double v6 = (void *)*MEMORY[0x1E4FB2780];
  double v7 = *MEMORY[0x1E4FB09B8];

  return PKFontForDesign(v4, v5, v6, 2, 0, v7);
}

- (id)_subDetailFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
}

- (void)_applyStyles
{
  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
  id v4 = [(PKContinuousButton *)self->_actionButton titleLabel];
  [v4 setTextAlignment:1];
  uint64_t v3 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], 2, 0);
  [v4 setFont:v3];

  [v4 setAdjustsFontSizeToFitWidth:1];
  [(PKAdjustableSingleCellView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKAdjustableSingleCellView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAdjustableSingleCellView;
  [(PKAdjustableSingleCellView *)&v3 layoutSubviews];
  [(PKAdjustableSingleCellView *)self bounds];
  [(PKAdjustableSingleCellView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v61[1] = *MEMORY[0x1E4F143B8];
  double v8 = [(PKAdjustableSingleCellView *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v9);

  double v11 = x + 10.0;
  double v12 = y + 0.0;
  if ([(PKAdjustableSingleCellView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  remainder.origin.double x = v11;
  remainder.origin.double y = v12;
  remainder.size.double width = width + -20.0;
  remainder.size.double height = height;
  titleView = self->_titleView;
  v15 = [(PKAdjustableSingleCellView *)self _titleFont];
  [(UILabel *)titleView setFont:v15];

  detailView = self->_detailView;
  id v17 = [(PKAdjustableSingleCellView *)self _detailFont];
  [(UILabel *)detailView setFont:v17];

  subDetailView = self->_subDetailView;
  v19 = [(PKAdjustableSingleCellView *)self _subDetailFont];
  [(UILabel *)subDetailView setFont:v19];

  if (IsAccessibilityCategory) {
    int64_t v20 = 0;
  }
  else {
    int64_t v20 = 4;
  }
  self->_titleLineBreakMode = v20;
  [(UILabel *)self->_titleView setNumberOfLines:!IsAccessibilityCategory];
  self->_detailLineBreakMode = v20;
  [(UILabel *)self->_detailView setNumberOfLines:!IsAccessibilityCategory];
  self->_subDetailLineBreakMode = v20;
  [(UILabel *)self->_subDetailView setNumberOfLines:!IsAccessibilityCategory];
  memset(&slice, 0, sizeof(slice));
  [(UIImageView *)self->_disclosureView alpha];
  if (v21 > 0.0)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", width + -20.0, height);
    CGFloat v23 = v22;
    v63.origin.double x = v11;
    v63.origin.double y = v12;
    v63.size.double width = width + -20.0;
    v63.size.double height = height;
    CGRectDivide(v63, &slice, &remainder, v23, v13);
    if (!self->_isTemplateLayout)
    {
      disclosureView = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 10.0, v13);
  }
  [(PKContinuousButton *)self->_actionButton alpha];
  if (v25 > 0.0)
  {
    -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v29 = v26.n128_f64[0];
    CGFloat v30 = v27.n128_f64[0];
    if (IsAccessibilityCategory)
    {
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMaxYEdge);
      CGRectDivide(remainder, &slice, &remainder, v30, CGRectMaxYEdge);
      if (!self->_isTemplateLayout)
      {
        actionButton = self->_actionButton;
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](actionButton, "setFrame:");
      }
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMaxYEdge);
      PKFloatRoundToPixel();
    }
    else
    {
      v26.n128_f64[0] = remainder.size.width * 0.5;
      if (remainder.size.width * 0.5 >= v29) {
        v26.n128_f64[0] = v29;
      }
      PKSizeRoundToPixel(v26, v27, v28);
      CGRectDivide(remainder, &slice, &remainder, v32 + 16.0, v13);
      if (!self->_isTemplateLayout)
      {
        v33 = self->_actionButton;
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](v33, "setFrame:");
      }
    }
  }
  -[UILabel sizeThatFits:](self->_titleView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  CGFloat v35 = v34;
  CGRectDivide(remainder, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v35, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_titleView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  if (!IsAccessibilityCategory)
  {
    detail = self->_detail;
    v37 = [(PKAdjustableSingleCellView *)self _detailFont];
    double v38 = remainder.size.width;
    v39 = detail;
    id v40 = v37;
    v41 = v39;
    v42 = v41;
    if (v41 && (uint64_t v43 = [(NSString *)v41 length], v42, v43))
    {
      id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v60 = *MEMORY[0x1E4FB06F8];
      v61[0] = v40;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
      v46 = (void *)[v44 initWithString:v42 attributes:v45];

      objc_msgSend(v46, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", 1, 0, v38, 1.79769313e308);
      double v48 = v47;
      objc_msgSend(v46, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", 2, 1);
      double v50 = v49;

      if (v50 > v48)
      {
        v51 = self->_detailView;
        v52 = [(PKAdjustableSingleCellView *)self _smallerDetailFont];
        [(UILabel *)v51 setFont:v52];

        if (![(NSString *)self->_title length])
        {
          [(UILabel *)self->_detailView setNumberOfLines:2];
          self->_detailLineBreakMode = 0;
        }
      }
    }
    else
    {
    }
  }
  -[UILabel sizeThatFits:](self->_detailView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  CGRectDivide(remainder, &slice, &remainder, v53, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_detailView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  if ([(PKAdjustableSingleCellView *)self _needsThirdLine])
  {
    -[UILabel sizeThatFits:](self->_subDetailView, "sizeThatFits:", remainder.size.width, 1.79769313e308);
    CGRectDivide(remainder, &slice, &remainder, v54, CGRectMinYEdge);
    if (!self->_isTemplateLayout) {
      -[UILabel setFrame:](self->_subDetailView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
    CGRectDivide(remainder, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  }
  PKFloatRoundToPixel();
  double v56 = v55;
  double v57 = width;
  result.double height = v56;
  result.double width = v57;
  return result;
}

- (void)_actionButtonTapped:(id)a3
{
  actionHandler = (void (**)(id, PKAdjustableSingleCellView *, PKPaymentPassAction *))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2](actionHandler, self, self->_action);
  }
}

- (void)setEnableDisclosure:(BOOL)a3
{
  if (self->_enableDisclosure != a3) {
    self->_enableDisclosure = a3;
  }
}

- (void)setAction:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [(PKContinuousButton *)self->_actionButton setAlpha:0.0];
  }
  p_action = &self->_action;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_action, a3);
  }
}

- (void)setActionHandler:(id)a3
{
  id aBlock = a3;
  if (!aBlock) {
    [(PKContinuousButton *)self->_actionButton setAlpha:0.0];
  }
  double v4 = _Block_copy(self->_actionHandler);
  double v5 = _Block_copy(aBlock);
  char v6 = PKEqualObjects();

  if ((v6 & 1) == 0)
  {
    double v7 = (void *)[aBlock copy];
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = v7;
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_title;
  char v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    title = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    v10 = v8;
    title = self->_title;
    self->_title = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setDetail:(id)a3
{
  id v4 = a3;
  double v5 = self->_detail;
  char v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    detail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    v10 = v8;
    detail = self->_detail;
    self->_detail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setSubDetail:(id)a3
{
  id v4 = a3;
  double v5 = self->_subDetail;
  char v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    subDetail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    v10 = v8;
    subDetail = self->_subDetail;
    self->_subDetail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setPass:(id)a3
{
  p_pass = &self->_pass;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_pass, a3);
  }
}

- (void)setTitleColor:(id)a3
{
  p_titleColor = &self->_titleColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_titleColor, a3);
  }
}

- (void)setDetailColor:(id)a3
{
  p_detailColor = &self->_detailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_detailColor, a3);
  }
}

- (void)setSubDetailColor:(id)a3
{
  p_subDetailColor = &self->_subDetailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_subDetailColor, a3);
  }
}

- (void)setTitleLineBreakMode:(int64_t)a3
{
  if (self->_titleLineBreakMode != a3) {
    self->_titleLineBreakMode = a3;
  }
}

- (void)setDetailLineBreakMode:(int64_t)a3
{
  if (self->_detailLineBreakMode != a3) {
    self->_detailLineBreakMode = a3;
  }
}

- (void)setSubDetailLineBreakMode:(int64_t)a3
{
  if (self->_subDetailLineBreakMode != a3) {
    self->_subDetailLineBreakMode = a3;
  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKAdjustableSingleCellView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (BOOL)_needsThirdLine
{
  return self->_subDetail != 0;
}

- (void)beginUpdates
{
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3) {
    [(PKAdjustableSingleCellView *)self _updateContent:a3];
  }
}

- (void)_updateContent:(BOOL)a3
{
  if (!self->_deferUpdateCounter)
  {
    BOOL v3 = a3;
    [(PKAdjustableSingleCellView *)self _applyStyles];
    actionButton = self->_actionButton;
    char v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(PKContinuousButton *)actionButton setTintColor:v6];

    BOOL v7 = self->_actionButton;
    double v8 = [(PKAdjustableSingleCellView *)self backgroundColor];
    [(PKContinuousButton *)v7 updateTitleColorWithColor:v8];

    v9 = [(PKAdjustableSingleCellView *)self pass];
    uint64_t v10 = [v9 activationState];

    if (self->_action) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      [(PKAdjustableSingleCellView *)self bringSubviewToFront:self->_actionButton];
      [(PKContinuousButton *)self->_actionButton setEnabled:1];
      v14 = self->_actionButton;
      v15 = [(PKPaymentPassAction *)self->_action title];
      [(PKContinuousButton *)v14 setTitle:v15 forState:0];

      disclosureView = self->_actionButton;
      unsigned int enableDisclosure = 1;
    }
    else
    {
      __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_actionButton, 0, v3);
      disclosureView = self->_disclosureView;
      unsigned int enableDisclosure = self->_enableDisclosure;
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(disclosureView, enableDisclosure, v3);
    titleView = self->_titleView;
    title = self->_title;
    titleColor = self->_titleColor;
    v19 = titleColor;
    if (!titleColor)
    {
      v19 = [MEMORY[0x1E4FB1618] labelColor];
    }
    if (self->_titleLineBreakMode) {
      int64_t titleLineBreakMode = self->_titleLineBreakMode;
    }
    else {
      int64_t titleLineBreakMode = 4;
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(titleView, (uint64_t)title, v19, titleLineBreakMode, v3);
    if (!titleColor) {

    }
    detailView = self->_detailView;
    detail = self->_detail;
    detailColor = self->_detailColor;
    int64x2_t v24 = detailColor;
    if (!detailColor)
    {
      int64x2_t v24 = [MEMORY[0x1E4FB1618] labelColor];
    }
    if (self->_detailLineBreakMode) {
      int64_t detailLineBreakMode = self->_detailLineBreakMode;
    }
    else {
      int64_t detailLineBreakMode = 4;
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(detailView, (uint64_t)detail, v24, detailLineBreakMode, v3);
    if (!detailColor) {

    }
    subDetailView = self->_subDetailView;
    subDetail = self->_subDetail;
    subDetailColor = self->_subDetailColor;
    double v29 = subDetailColor;
    if (!subDetailColor)
    {
      double v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    if (self->_subDetailLineBreakMode) {
      int64_t subDetailLineBreakMode = self->_subDetailLineBreakMode;
    }
    else {
      int64_t subDetailLineBreakMode = 4;
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(subDetailView, (uint64_t)subDetail, v29, subDetailLineBreakMode, v3);
    if (!subDetailColor) {

    }
    [(PKAdjustableSingleCellView *)self setNeedsLayout];
    if (v3)
    {
      [(PKAdjustableSingleCellView *)self layoutIfNeededAnimated:1];
    }
  }
}

void __45__PKAdjustableSingleCellView__updateContent___block_invoke(void *a1, unsigned int a2, int a3)
{
  id v10 = a1;
  [v10 alpha];
  if (v5 != (double)a2)
  {
    double v6 = v5;
    [v10 setAlpha:(double)a2];
    if (a3)
    {
      BOOL v7 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v7, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v6, (double)a2);
      double v8 = [v10 layer];
      id v9 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v7);
    }
  }
}

void __45__PKAdjustableSingleCellView__updateContent___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  id v9 = a1;
  if (v9)
  {
    if (a3)
    {
      id v19 = v9;
      id v10 = a3;
      [v19 setText:a2];
      [v19 setTextColor:v10];

      [v19 setLineBreakMode:a4];
      id v9 = v19;
      if (a5)
      {
        BOOL v11 = [v19 layer];
        double v12 = v11;
        if (a2) {
          double v13 = 1.0;
        }
        else {
          double v13 = 0.0;
        }
        [v11 opacity];
        double v15 = v14;
        if (v13 != v14)
        {
          v16 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
          objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, v13);
          id v17 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v16);

          double v18 = 0.0;
          if (a2) {
            *(float *)&double v18 = 1.0;
          }
          [v12 setOpacity:v18];
        }

        id v9 = v19;
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAdjustableSingleCellView;
  [(PKAdjustableSingleCellView *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKAdjustableSingleCellView *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      BOOL v7 = [v4 preferredContentSizeCategory];
      double v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        id v10 = [v4 preferredContentSizeCategory];
        BOOL v11 = (void *)*MEMORY[0x1E4FB27F0];

        if (v10 != v11) {
          [(PKAdjustableSingleCellView *)self _updateContent:0];
        }
      }
    }
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (BOOL)enableDisclosure
{
  return self->_enableDisclosure;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (UIColor)subDetailColor
{
  return self->_subDetailColor;
}

- (int64_t)titleLineBreakMode
{
  return self->_titleLineBreakMode;
}

- (int64_t)detailLineBreakMode
{
  return self->_detailLineBreakMode;
}

- (int64_t)subDetailLineBreakMode
{
  return self->_subDetailLineBreakMode;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSString)subDetail
{
  return self->_subDetail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subDetail, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subDetailColor, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_subDetailView, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_disclosureView, 0);
}

@end