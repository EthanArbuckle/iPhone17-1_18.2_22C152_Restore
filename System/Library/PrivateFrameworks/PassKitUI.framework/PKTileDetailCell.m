@interface PKTileDetailCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)subtitleText;
- (NSString)text;
- (NSString)textSubtitle;
- (NSString)titleText;
- (PKTileDetailCell)initWithFrame:(CGRect)a3;
- (PKTileDetailCell)initWithSize:(CGSize)a3;
- (UIView)customView;
- (unint64_t)accessory;
- (void)_configureView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessory:(unint64_t)a3;
- (void)setCustomView:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextSubtitle:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation PKTileDetailCell

- (PKTileDetailCell)initWithSize:(CGSize)a3
{
  return -[PKTileDetailCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKTileDetailCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)PKTileDetailCell;
  v3 = -[PKTileDetailCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    int v5 = [(PKTileDetailCell *)v3 _shouldReverseLayoutDirection];
    v6 = [(PKTileDetailCell *)v4 contentView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    v9 = v4->_titleLabel;
    v10 = (NSString *)*MEMORY[0x1E4FB2790];
    v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2998], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [(UILabel *)v9 setFont:v11];

    if (v5) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [(UILabel *)v4->_titleLabel setTextAlignment:v12];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v6 addSubview:v4->_titleLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    v15 = v4->_subtitleLabel;
    v16 = (NSString *)*MEMORY[0x1E4FB28D0];
    v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], v10);
    [(UILabel *)v15 setFont:v17];

    v18 = v4->_subtitleLabel;
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v18 setTextColor:v19];

    [(UILabel *)v4->_subtitleLabel setTextAlignment:v12];
    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [v6 addSubview:v4->_subtitleLabel];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v20;

    [(UILabel *)v4->_textLabel setNumberOfLines:0];
    v22 = v4->_textLabel;
    v23 = PKFontForDefaultDesign(v16, v10);
    [(UILabel *)v22 setFont:v23];

    v24 = v4->_textLabel;
    v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v24 setTextColor:v25];

    [(UILabel *)v4->_textLabel setTextAlignment:4];
    [(UILabel *)v4->_textLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85988]];
    [v6 addSubview:v4->_textLabel];
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v26;

    [(UILabel *)v4->_detailLabel setNumberOfLines:0];
    v28 = v4->_detailLabel;
    v29 = PKFontForDefaultDesign(v16, v10);
    [(UILabel *)v28 setFont:v29];

    v30 = v4->_detailLabel;
    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)v4->_detailLabel setTextAlignment:4];
    [(UILabel *)v4->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [v6 addSubview:v4->_detailLabel];
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textSubtitleLabel = v4->_textSubtitleLabel;
    v4->_textSubtitleLabel = v32;

    [(UILabel *)v4->_textSubtitleLabel setNumberOfLines:0];
    v34 = v4->_textSubtitleLabel;
    v35 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], v10);
    [(UILabel *)v34 setFont:v35];

    v36 = v4->_textSubtitleLabel;
    v37 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v36 setTextColor:v37];

    [(UILabel *)v4->_textSubtitleLabel setTextAlignment:4];
    [(UILabel *)v4->_textSubtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85980]];
    [v6 addSubview:v4->_textSubtitleLabel];
    v38 = [v6 layer];
    [v38 setCornerRadius:10.0];
    [v38 setMasksToBounds:1];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(PKTileDetailCell *)self isHighlighted] & 1) == 0 && !self->_backgroundColor)
  {
    int v5 = [(PKTileDetailCell *)self backgroundConfiguration];
    v6 = [v5 backgroundColor];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [(PKTileDetailCell *)self backgroundColor];
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKTileDetailCell;
  [(PKTileDetailCell *)&v15 setHighlighted:v3];
  if (v3)
  {
    v10 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    v10 = self->_backgroundColor;
  }
  v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__PKTileDetailCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E59CA870;
  v13[4] = self;
  v14 = v10;
  uint64_t v12 = v10;
  [v11 _animateUsingDefaultTimingWithOptions:0 animations:v13 completion:0];
}

uint64_t __35__PKTileDetailCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTileDetailCell;
  [(PKTileDetailCell *)&v4 layoutSubviews];
  BOOL v3 = [(PKTileDetailCell *)self contentView];
  [v3 bounds];
  -[PKTileDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKTileDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
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
  double v12 = y + 15.0;
  double v81 = PKTableViewCellTextInset();
  double v82 = v10;
  double v83 = width;
  double v13 = width - (v10 + v81);
  int v14 = [(PKTileDetailCell *)self _shouldReverseLayoutDirection];
  int v15 = v14;
  if (v14) {
    CGRectEdge v16 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v16 = CGRectMinXEdge;
  }
  if (v14) {
    CGRectEdge v17 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v17 = CGRectMaxXEdge;
  }
  memset(&v98, 0, sizeof(v98));
  remainder.origin.double x = v11;
  remainder.origin.double y = y + 15.0;
  remainder.size.double width = v13;
  remainder.size.double height = height + -30.0;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v13, height);
  CGFloat v79 = v18;
  -[UILabel sizeThatFits:](self->_textSubtitleLabel, "sizeThatFits:", v13, height);
  CGFloat v80 = v19;
  -[UIImageView sizeThatFits:](self->_accessoryView, "sizeThatFits:", v13, height);
  CGFloat v21 = v20;
  double v23 = v22;
  double v24 = v20 + 5.0;
  if (!self->_accessoryView) {
    double v24 = 0.0;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v13 - v24, height + -30.0);
  CGFloat v26 = fmax(v25, v23);
  CGSize v84 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGPoint origin = slice.origin;
  slice.size = v84;
  v100.origin.double x = v11;
  v100.origin.double y = v12;
  v100.size.double width = v13;
  v100.size.double height = height + -30.0;
  CGRectDivide(v100, &slice, &remainder, v26, CGRectMinYEdge);
  PKSizeAlignedInRect();
  CGRect slice = v101;
  double v27 = v26 + 0.0;
  memset(&v95, 0, sizeof(v95));
  CGRectDivide(v101, &v95, &slice, v21, v17);
  CGRectDivide(slice, &v98, &slice, 5.0, v17);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v95.origin.double x = v28;
  v95.origin.double y = v29;
  v95.size.double width = v30;
  v95.size.double height = v31;
  v32 = [(UILabel *)self->_titleLabel font];
  [v32 descender];
  v95.origin.double y = v95.origin.y + v33 * -0.5;

  v94.CGPoint origin = origin;
  v94.size = v84;
  if (self->_subtitleText)
  {
    CGRectDivide(remainder, &v98, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v94, &remainder, v79, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v94.origin.double x = v34;
    v94.origin.double y = v35;
    v94.size.double width = v36;
    v94.size.double height = v37;
    double v27 = v79 + 5.0 + v27;
  }
  v93.CGPoint origin = origin;
  v93.size = v84;
  if (self->_seperatorForCustomView)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    double v38 = PKUIPixelLength();
    CGRectDivide(remainder, &v93, &remainder, v38, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v93.origin.double x = v40;
    v93.origin.double y = v41;
    if (v15) {
      double v42 = v81;
    }
    else {
      double v42 = v82;
    }
    v93.size.double width = v83 - v42;
    v93.size.double height = v39;
    double v27 = v27 + v38 + 15.0;
  }
  v92.CGPoint origin = origin;
  v92.size = v84;
  customView = self->_customView;
  if (customView)
  {
    if (self->_seperatorForCustomView
      && (CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge),
          double v27 = v27 + 15.0,
          (customView = self->_customView) == 0))
    {
      double v45 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      -[UIView sizeThatFits:](customView, "sizeThatFits:", v13, height);
      double v45 = v44;
    }
    CGRectDivide(remainder, &v92, &remainder, v45, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v92.origin.double x = v46;
    v92.origin.double y = v47;
    v92.size.double width = v48;
    v92.size.double height = v49;
    double v27 = v27 + v45;
  }
  v91.CGPoint origin = origin;
  v91.size = v84;
  if (self->_seperatorForText)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    double v50 = PKUIPixelLength();
    CGRectDivide(remainder, &v91, &remainder, v50, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v91.origin.double x = v52;
    v91.origin.double y = v53;
    if (v15) {
      double v54 = v81;
    }
    else {
      double v54 = v82;
    }
    v91.size.double width = v83 - v54;
    v91.size.double height = v51;
    double v27 = v27 + v50 + 15.0;
  }
  v90.CGPoint origin = origin;
  v90.size = v84;
  v89.CGPoint origin = origin;
  v89.size = v84;
  v88.CGPoint origin = origin;
  v88.size = v84;
  if (self->_text || self->_detailText || self->_textSubtitle)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v13, height);
    double v56 = v55;
    double v58 = v57;
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v13, height);
    double v61 = v60;
    if (v56 + v60 + 5.0 > v13)
    {
      double v61 = v13 * 0.5 + -2.5;
      -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v61, height);
      double v58 = v62;
      -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v61, height);
      double v56 = v61;
    }
    memset(&v87, 0, sizeof(v87));
    CGFloat v63 = fmax(v58, v59);
    CGRectDivide(remainder, &v87, &remainder, v63, CGRectMinYEdge);
    double v64 = v27 + v63 + 15.0;
    CGRectDivide(v87, &v90, &v87, v56, v16);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v90.origin.double x = v65;
    v90.origin.double y = v66;
    v90.size.double width = v67;
    v90.size.double height = v68;
    memset(&v86, 0, sizeof(v86));
    CGRectDivide(v87, &v86, &v87, 5.0, v16);
    CGRectDivide(v87, &v89, &v87, v61, v17);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v89.origin.double x = v69;
    v89.origin.double y = v70;
    v89.size.double width = v71;
    v89.size.double height = v72;
    if (self->_text || self->_detailText)
    {
      CGRectDivide(remainder, &v98, &remainder, 5.0, CGRectMinYEdge);
      double v64 = v64 + 5.0;
    }
    CGRectDivide(remainder, &v88, &remainder, v80, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v88.origin.double x = v73;
    v88.origin.double y = v74;
    v88.size.double width = v75;
    v88.size.double height = v76;
    double v27 = v64 + v76;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
    -[UIView setFrame:](self->_seperatorForCustomView, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    -[UIView setFrame:](self->_customView, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
    -[UIView setFrame:](self->_seperatorForText, "setFrame:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
    -[UILabel setFrame:](self->_textSubtitleLabel, "setFrame:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
    -[UIImageView setFrame:](self->_accessoryView, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
  }
  double v77 = v27 + 30.0;
  double v78 = v83;
  result.double height = v77;
  result.double width = v78;
  return result;
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  titleText = self->_titleText;
  v9 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKTileDetailCell *)self _configureView];
  }
LABEL_9:
}

- (void)setSubtitleText:(id)a3
{
  id v5 = a3;
  subtitleText = self->_subtitleText;
  v9 = (NSString *)v5;
  v7 = subtitleText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_subtitleText, a3);
    [(PKTileDetailCell *)self _configureView];
  }
LABEL_9:
}

- (void)setText:(id)a3
{
  id v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  v7 = text;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_text, a3);
    [(PKTileDetailCell *)self _configureView];
  }
LABEL_9:
}

- (void)setDetailText:(id)a3
{
  id v5 = a3;
  detailText = self->_detailText;
  v9 = (NSString *)v5;
  v7 = detailText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_detailText, a3);
    [(PKTileDetailCell *)self _configureView];
  }
LABEL_9:
}

- (void)setCustomView:(id)a3
{
  id v5 = (UIView *)a3;
  customView = self->_customView;
  if (customView != v5)
  {
    v7 = v5;
    [(UIView *)customView removeFromSuperview];
    objc_storeStrong((id *)&self->_customView, a3);
    [(PKTileDetailCell *)self addSubview:self->_customView];
    [(PKTileDetailCell *)self _configureView];
    id v5 = v7;
  }
}

- (void)setTextSubtitle:(id)a3
{
  id v5 = a3;
  textSubtitle = self->_textSubtitle;
  v9 = (NSString *)v5;
  v7 = textSubtitle;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_textSubtitle, a3);
    [(PKTileDetailCell *)self _configureView];
  }
LABEL_9:
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessordouble y = a3;
    [(PKTileDetailCell *)self _configureView];
  }
}

- (void)_configureView
{
  [(UILabel *)self->_titleLabel setText:self->_titleText];
  [(UILabel *)self->_subtitleLabel setText:self->_subtitleText];
  [(UILabel *)self->_textLabel setText:self->_text];
  [(UILabel *)self->_detailLabel setText:self->_detailText];
  [(UILabel *)self->_textSubtitleLabel setText:self->_textSubtitle];
  if (*(_OWORD *)&self->_titleText == 0 || !self->_customView)
  {
    [(UIView *)self->_seperatorForCustomView removeFromSuperview];
    seperatorForCustomView = self->_seperatorForCustomView;
    self->_seperatorForCustomView = 0;
  }
  else
  {
    if (self->_seperatorForCustomView) {
      goto LABEL_7;
    }
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v4 = self->_seperatorForCustomView;
    self->_seperatorForCustomView = v3;

    id v5 = self->_seperatorForCustomView;
    v6 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v5 setBackgroundColor:v6];

    v7 = [(UIView *)self->_seperatorForCustomView layer];
    [v7 setMasksToBounds:1];

    seperatorForCustomView = [(PKTileDetailCell *)self contentView];
    [seperatorForCustomView addSubview:self->_seperatorForCustomView];
  }

LABEL_7:
  if ((self->_text || self->_detailText || self->_textSubtitle)
    && (self->_customView || self->_titleText || self->_subtitleText))
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    seperatorForText = self->_seperatorForText;
    self->_seperatorForText = v9;

    double v11 = self->_seperatorForText;
    unint64_t v12 = 0x1E4FB1000uLL;
    double v13 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v11 setBackgroundColor:v13];

    int v14 = [(UIView *)self->_seperatorForText layer];
    [v14 setMasksToBounds:1];

    int v15 = [(PKTileDetailCell *)self contentView];
    [v15 addSubview:self->_seperatorForText];
  }
  else
  {
    [(UIView *)self->_seperatorForText removeFromSuperview];
    int v15 = self->_seperatorForText;
    self->_seperatorForText = 0;
    unint64_t v12 = 0x1E4FB1000;
  }

  accessordouble y = self->_accessory;
  if (accessory == 2)
  {
    accessoryView = self->_accessoryView;
    if (!accessoryView)
    {
      double v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v20 = self->_accessoryView;
      self->_accessoryView = v19;

      CGFloat v21 = [(PKTileDetailCell *)self contentView];
      [v21 addSubview:self->_accessoryView];

      accessoryView = self->_accessoryView;
    }
    double v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    [(UIImageView *)accessoryView setImage:v22];

    double v23 = self->_accessoryView;
    uint64_t v24 = [*(id *)(v12 + 1560) systemGreenColor];
    goto LABEL_24;
  }
  if (accessory == 1)
  {
    double v25 = self->_accessoryView;
    if (!v25)
    {
      CGFloat v26 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v27 = self->_accessoryView;
      self->_accessoryView = v26;

      CGFloat v28 = [(PKTileDetailCell *)self contentView];
      [v28 addSubview:self->_accessoryView];

      double v25 = self->_accessoryView;
    }
    CGFloat v29 = PKUIChevronImage();
    [(UIImageView *)v25 setImage:v29];

    double v23 = self->_accessoryView;
    uint64_t v24 = [*(id *)(v12 + 1560) secondaryLabelColor];
LABEL_24:
    CGRectEdge v17 = (UIImageView *)v24;
    [(UIImageView *)v23 setTintColor:v24];
    goto LABEL_25;
  }
  if (accessory) {
    goto LABEL_26;
  }
  [(UIImageView *)self->_accessoryView removeFromSuperview];
  CGRectEdge v17 = self->_accessoryView;
  self->_accessoryView = 0;
LABEL_25:

LABEL_26:

  [(PKTileDetailCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v13.receiver = self;
  v13.super_class = (Class)PKTileDetailCell;
  [(PKTileDetailCell *)&v13 prepareForReuse];
  titleText = self->_titleText;
  self->_titleText = 0;

  subtitleText = self->_subtitleText;
  self->_subtitleText = 0;

  text = self->_text;
  self->_text = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  textSubtitle = self->_textSubtitle;
  self->_textSubtitle = 0;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  self->_accessordouble y = 0;
  [(UIView *)self->_seperatorForText removeFromSuperview];
  seperatorForText = self->_seperatorForText;
  self->_seperatorForText = 0;

  [(UIView *)self->_seperatorForCustomView removeFromSuperview];
  seperatorForCustomView = self->_seperatorForCustomView;
  self->_seperatorForCustomView = 0;

  [(UIImageView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  [(UIView *)self->_customView removeFromSuperview];
  customView = self->_customView;
  self->_customView = 0;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)textSubtitle
{
  return self->_textSubtitle;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIView)customView
{
  return self->_customView;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_textSubtitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_seperatorForText, 0);
  objc_storeStrong((id *)&self->_seperatorForCustomView, 0);
  objc_storeStrong((id *)&self->_textSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end