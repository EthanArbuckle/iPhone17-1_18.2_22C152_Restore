@interface PKDashboardTitleDetailCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardTitleDetailCell)initWithFrame:(CGRect)a3;
- (void)_updateDefaultValues;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessory:(unint64_t)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setTitleText:(id)a3 detail:(id)a4;
- (void)setTitleTextColor:(id)a3;
@end

@implementation PKDashboardTitleDetailCell

- (PKDashboardTitleDetailCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)PKDashboardTitleDetailCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardTitleDetailCell *)v3 contentView];
    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    defaultTitleTextColor = v4->_defaultTitleTextColor;
    v4->_defaultTitleTextColor = (UIColor *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v13;

    v15 = v4->_titleLabel;
    v16 = (NSString *)*MEMORY[0x1E4FB28C8];
    v17 = (NSString *)*MEMORY[0x1E4FB2790];
    v18 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)v15 setFont:v18];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_titleLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    v21 = v4->_subtitleLabel;
    v22 = PKFontForDefaultDesign(v16, v17);
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [v5 addSubview:v4->_subtitleLabel];
    v23 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v4->_numberFormatter;
    v4->_numberFormatter = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinnerView = v4->_spinnerView;
    v4->_spinnerView = (UIActivityIndicatorView *)v25;

    [(UIActivityIndicatorView *)v4->_spinnerView startAnimating];
    [(UIActivityIndicatorView *)v4->_spinnerView setHidden:1];
    [v5 addSubview:v4->_spinnerView];
    id v27 = objc_alloc(MEMORY[0x1E4FB1838]);
    v28 = PKUIChevronImage();
    uint64_t v29 = [v27 initWithImage:v28];
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v29;

    v31 = v4->_disclosureView;
    v32 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v31 setTintColor:v32];

    [(UIImageView *)v4->_disclosureView setHidden:1];
    [v5 addSubview:v4->_disclosureView];
    [(PKDashboardTitleDetailCell *)v4 _updateDefaultValues];
  }
  return v4;
}

- (void)setTitleText:(id)a3 detail:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  titleText = self->_titleText;
  v16 = (NSString *)v7;
  double v10 = titleText;
  if (v10 == v16)
  {
  }
  else
  {
    if (!v16 || !v10)
    {
      uint64_t v13 = v16;
LABEL_13:

      goto LABEL_14;
    }
    BOOL v11 = [(NSString *)v16 isEqualToString:v10];

    if (!v11) {
      goto LABEL_14;
    }
  }
  detailText = self->_detailText;
  uint64_t v13 = (NSString *)v8;
  v14 = detailText;
  if (v14 == v13)
  {

    goto LABEL_16;
  }
  double v10 = v14;
  if (!v13 || !v14) {
    goto LABEL_13;
  }
  BOOL v15 = [(NSString *)v13 isEqualToString:v14];

  if (!v15)
  {
LABEL_14:
    objc_storeStrong((id *)&self->_titleText, a3);
    objc_storeStrong((id *)&self->_detailText, a4);
    [(UILabel *)self->_titleLabel setText:self->_titleText];
    [(UILabel *)self->_subtitleLabel setText:self->_detailText];
    [(PKDashboardTitleDetailCell *)self setNeedsLayout];
  }
LABEL_16:
}

- (void)setTitleTextColor:(id)a3
{
  id v7 = (UIColor *)a3;
  char v4 = PKEqualObjects();
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    defaultTitleTextColor = v7;
    if (!v7) {
      defaultTitleTextColor = self->_defaultTitleTextColor;
    }
    objc_storeStrong((id *)&self->_titleTextColor, defaultTitleTextColor);
    [(UILabel *)self->_titleLabel setTextColor:self->_titleTextColor];
    v5 = v7;
  }
}

- (void)setDetailTextColor:(id)a3
{
  id v7 = (UIColor *)a3;
  char v4 = PKEqualObjects();
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    defaultTitleTextColor = v7;
    if (!v7) {
      defaultTitleTextColor = self->_defaultTitleTextColor;
    }
    objc_storeStrong((id *)&self->_detailTextColor, defaultTitleTextColor);
    [(UILabel *)self->_subtitleLabel setTextColor:self->_detailTextColor];
    v5 = v7;
  }
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    if (a3 <= 2)
    {
      uint64_t v4 = (3u >> (a3 & 7)) & 1;
      [(UIImageView *)self->_disclosureView setHidden:(a3 & 1) == 0];
      spinnerView = self->_spinnerView;
      [(UIActivityIndicatorView *)spinnerView setHidden:v4];
    }
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardTitleDetailCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKDashboardTitleDetailCell *)self contentView];
  [v3 bounds];
  -[PKDashboardTitleDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardTitleDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
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
  v75.receiver = self;
  v75.super_class = (Class)PKDashboardTitleDetailCell;
  [(PKDashboardCollectionViewCell *)&v75 layoutSubviews];
  double v10 = x + 12.0;
  double v11 = y + 12.0;
  double v69 = width;
  double v12 = width + -24.0;
  memset(&v74, 0, sizeof(v74));
  remainder.origin.double x = v10;
  remainder.origin.double y = y + 12.0;
  double v13 = height + -24.0;
  remainder.size.double width = v12;
  remainder.size.double height = height + -24.0;
  int v14 = [(PKDashboardTitleDetailCell *)self _shouldReverseLayoutDirection];
  if (v14) {
    CGRectEdge v15 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v15 = CGRectMinXEdge;
  }
  if (v14) {
    CGRectEdge v16 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v16 = CGRectMaxXEdge;
  }
  -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v12, 3.40282347e38);
  double v18 = v17;
  double v20 = v19;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v12, 3.40282347e38);
  double v22 = fmax(v18, v21);
  double v24 = fmax(v20, v23);
  uint64_t v25 = MEMORY[0x1E4F1DB28];
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v70 = *MEMORY[0x1E4F1DB28];
  if (v22 <= 0.0)
  {
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v62 = v43;
    double v64 = v45;
    uint64_t v58 = *MEMORY[0x1E4F1DB28];
    uint64_t v60 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    double v31 = v24;
  }
  else
  {
    double v67 = v24;
    CGSize v27 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v27;
    double v28 = v10;
    v27.double width = v11;
    double v29 = v12;
    double v30 = v13;
    CGRectDivide(*(CGRect *)((char *)&v27 - 8), &slice, &remainder, v22, v16);
    CGRectDivide(remainder, &v74, &remainder, 11.0, v16);
    PKContentAlignmentMake();
    double v31 = v67;
    PKSizeAlignedInRect();
    slice.origin.double x = v32;
    slice.origin.double y = v33;
    slice.size.double width = v34;
    slice.size.double height = v35;
    PKRectCenteredIntegralRect();
    uint64_t v58 = v36;
    uint64_t v60 = v37;
    double v62 = v38;
    double v64 = v39;
    PKRectCenteredIntegralRect();
    double v70 = v40;
    double v26 = v41;
    double v43 = v42;
    double v45 = v44;
    double v12 = remainder.size.width;
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12 * 0.5, 3.40282347e38, v58, v60, *(void *)&v62, *(void *)&v64);
  CGSize v66 = *(CGSize *)(v25 + 16);
  CGPoint v68 = *(CGPoint *)v25;
  slice.origin = *(CGPoint *)v25;
  slice.size = v66;
  if (v46 > 0.0)
  {
    CGRectDivide(remainder, &slice, &remainder, v46, v16);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.double x = v47;
    slice.origin.double y = v48;
    slice.size.double width = v49;
    slice.size.double height = v50;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  v71.origin = v68;
  v71.size = v66;
  if (v51 > 0.0)
  {
    CGRectDivide(remainder, &v71, &remainder, v51, v15);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v71.origin.double x = v52;
    v71.origin.double y = v53;
    v71.size.double width = v54;
    v71.size.double height = v55;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v70, v26, v43, v45);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v59, v61, v63, v65);
  }
  double v56 = fmax(v71.size.height, fmax(slice.size.height, v31)) + 24.0;
  double v57 = v69;
  result.double height = v56;
  result.double width = v57;
  return result;
}

- (void)_updateDefaultValues
{
  [(UILabel *)self->_titleLabel setTextColor:self->_defaultTitleTextColor];
  subtitleLabel = self->_subtitleLabel;
  defaultTitleTextColor = self->_defaultTitleTextColor;

  [(UILabel *)subtitleLabel setTextColor:defaultTitleTextColor];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTitleDetailCell;
  [(PKDashboardCollectionViewCell *)&v7 prepareForReuse];
  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  detailTextColor = self->_detailTextColor;
  self->_detailTextColor = 0;

  self->_accessordouble y = 0;
  [(UIImageView *)self->_disclosureView setHidden:1];
  [(UIActivityIndicatorView *)self->_spinnerView setHidden:1];
  [(PKDashboardTitleDetailCell *)self _updateDefaultValues];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_defaultTitleTextColor, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end