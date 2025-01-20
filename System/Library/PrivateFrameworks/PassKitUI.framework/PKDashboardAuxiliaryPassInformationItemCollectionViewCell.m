@interface PKDashboardAuxiliaryPassInformationItemCollectionViewCell
- (BOOL)hideDisclosure;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)subtitle2;
- (NSString)title;
- (PKDashboardAuxiliaryPassInformationItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)_maxWidthForTransactionCellInWidth:(double)a3;
- (void)_setFonts;
- (void)_setTitle:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHideDisclosure:(BOOL)a3;
- (void)setSubtitle2:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDashboardAuxiliaryPassInformationItemCollectionViewCell

- (PKDashboardAuxiliaryPassInformationItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v13 = v4->_titleLabel;
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v13 setTextColor:v14];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v15;

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setLineBreakMode:0];
    v17 = v4->_subtitleLabel;
    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v17 setTextColor:v18];

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitle2Label = v4->_subtitle2Label;
    v4->_subtitle2Label = (UILabel *)v19;

    [(UILabel *)v4->_subtitle2Label setNumberOfLines:0];
    [(UILabel *)v4->_subtitle2Label setLineBreakMode:0];
    v21 = v4->_subtitle2Label;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)v4 _setFonts];
    [v5 addSubview:v4->_titleLabel];
    [v5 addSubview:v4->_subtitleLabel];
    [v5 addSubview:v4->_subtitle2Label];
    id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
    v24 = PKUIChevronImage();
    uint64_t v25 = [v23 initWithImage:v24];
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v25;

    [(UIImageView *)v4->_disclosureView setContentMode:1];
    v27 = v4->_disclosureView;
    v28 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v27 setTintColor:v28];

    [v5 addSubview:v4->_disclosureView];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v3 prepareForReuse];
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self _setTitle:0];
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setSubtitle:0];
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setSubtitle2:0];
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setHideDisclosure:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self traitCollection];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    double v7 = [v4 preferredContentSizeCategory];
    double v8 = [v6 preferredContentSizeCategory];
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v7, (UIContentSizeCategory)v8))
    {

LABEL_6:
      [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self _setFonts];
      goto LABEL_7;
    }
    uint64_t v9 = [v4 legibilityWeight];
    uint64_t v10 = [v6 legibilityWeight];

    if (v9 != v10) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = a3.width + -32.0;
  double v6 = 0.0;
  if (!self->_hideDisclosure)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v5, 1.79769313e308);
    double v6 = v7 + 16.0;
  }
  double v8 = v5 - v6;
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", v8, 1.79769313e308);
  double v10 = v9;
  -[UILabel pkui_sizeThatFits:](self->_subtitleLabel, "pkui_sizeThatFits:", v8, 1.79769313e308);
  double v12 = v11;
  -[UILabel pkui_sizeThatFits:](self->_subtitle2Label, "pkui_sizeThatFits:", v8, 1.79769313e308);
  if (!self->_subtitle2) {
    double v13 = 0.0;
  }
  double v14 = v10 + 32.0 + v12 + v13;
  [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self _maxWidthForTransactionCellInWidth:width];
  double v16 = v14;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v43 layoutSubviews];
  objc_super v3 = [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  memset(&v41, 0, sizeof(v41));
  double v12 = v5 + 16.0;
  double v13 = v7 + 16.0;
  double v14 = v9 + -32.0;
  remainder.origin.CGFloat x = v12;
  remainder.origin.CGFloat y = v13;
  double v15 = v11 + -32.0;
  remainder.size.CGFloat width = v14;
  remainder.size.CGFloat height = v15;
  if ([(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v16 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v16 = CGRectMaxXEdge;
  if (self->_hideDisclosure)
  {
    double v17 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v14, v15);
    double v17 = v18;
  }
  if (v17 > 0.0)
  {
    v44.origin.CGFloat x = v12;
    v44.origin.CGFloat y = v13;
    v44.size.CGFloat width = v14;
    v44.size.CGFloat height = v15;
    CGRectDivide(v44, &v41, &remainder, v17, v16);
    CGFloat x = remainder.origin.x;
    CGFloat y = remainder.origin.y;
    CGFloat width = remainder.size.width;
    CGFloat height = remainder.size.height;
    CGRect remainder = v41;
    if (self->_hideDisclosure)
    {
      id v23 = (CGRect *)MEMORY[0x1E4F1DB28];
      double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    }
    else
    {
      id v23 = &v41;
      CGRectDivide(remainder, &v41, &remainder, v17, v16);
      double v24 = v41.origin.y;
      double v25 = v41.size.width;
    }
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v23->origin.x, v24, v25, v23->size.height);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    CGRectDivide(v45, &v41, &remainder, 16.0, v16);
  }
  titleLabel = self->_titleLabel;
  if (self->_title)
  {
    -[UILabel pkui_sizeThatFits:](titleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v27 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v28, CGRectMinYEdge);
    titleLabel = self->_titleLabel;
    double v29 = v41.origin.y;
    double v30 = v41.size.width;
  }
  else
  {
    v27 = (CGRect *)MEMORY[0x1E4F1DB28];
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  -[UILabel setFrame:](titleLabel, "setFrame:", v27->origin.x, v29, v30, v27->size.height);
  subtitleLabel = self->_subtitleLabel;
  if (self->_subtitle)
  {
    -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v32 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v33, CGRectMinYEdge);
    subtitleLabel = self->_subtitleLabel;
    double v34 = v41.origin.y;
    double v35 = v41.size.width;
  }
  else
  {
    v32 = (CGRect *)MEMORY[0x1E4F1DB28];
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v32->origin.x, v34, v35, v32->size.height);
  subtitle2Label = self->_subtitle2Label;
  if (self->_subtitle2)
  {
    -[UILabel pkui_sizeThatFits:](subtitle2Label, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v37 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v38, CGRectMinYEdge);
    subtitle2Label = self->_subtitle2Label;
    double v39 = v41.origin.y;
    double v40 = v41.size.width;
  }
  else
  {
    v37 = (CGRect *)MEMORY[0x1E4F1DB28];
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  -[UILabel setFrame:](subtitle2Label, "setFrame:", v37->origin.x, v39, v40, v37->size.height);
}

- (void)_setTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_title;
  double v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_subtitle;
  double v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    [(UILabel *)self->_subtitleLabel setText:self->_subtitle];
    [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitle2:(id)a3
{
  id v4 = a3;
  double v5 = self->_subtitle2;
  double v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    subtitle2 = self->_subtitle2;
    self->_subtitle2 = v8;

    [(UILabel *)self->_subtitle2Label setText:self->_subtitle2];
    [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setHideDisclosure:(BOOL)a3
{
  if (((!self->_hideDisclosure ^ a3) & 1) == 0)
  {
    self->_hideDisclosure = a3;
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:");
    [(PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)self setNeedsLayout];
  }
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (void)_setFonts
{
  titleLabel = self->_titleLabel;
  double v4 = (NSString *)*MEMORY[0x1E4FB2790];
  double v5 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2908], (void *)*MEMORY[0x1E4FB2790], 2, 0);
  [(UILabel *)titleLabel setFont:v5];

  subtitleLabel = self->_subtitleLabel;
  BOOL v7 = (NSString *)*MEMORY[0x1E4FB28D0];
  double v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], v4);
  [(UILabel *)subtitleLabel setFont:v8];

  subtitle2Label = self->_subtitle2Label;
  PKFontForDefaultDesign(v7, v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)subtitle2Label setFont:v10];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end