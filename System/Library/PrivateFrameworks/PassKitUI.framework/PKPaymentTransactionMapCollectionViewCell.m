@interface PKPaymentTransactionMapCollectionViewCell
- (BOOL)showDisclosureIndicator;
- (BOOL)showSpinner;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardTransactionMapItem)item;
- (PKPaymentTransactionMapCollectionViewCell)initWithFrame:(CGRect)a3;
- (PKTransactionMapView)mapView;
- (UILabel)titleLabel;
- (double)maxWidthForTransactionCellInWidth:(double)a3;
- (void)_updateSpinnerAndDisclosureIndicator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setItem:(id)a3;
- (void)setShowDisclosureIndicator:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPaymentTransactionMapCollectionViewCell

- (PKPaymentTransactionMapCollectionViewCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKTransactionMapView);
    mapView = v3->_mapView;
    v3->_mapView = v4;

    [(PKTransactionMapView *)v3->_mapView setShowsMerchantName:1];
    v6 = [(PKPaymentTransactionMapCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_mapView];

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    v9 = v3->_titleLabel;
    v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
    [(UILabel *)v9 setFont:v10];

    v11 = [(PKPaymentTransactionMapCollectionViewCell *)v3 contentView];
    [v11 addSubview:v3->_titleLabel];

    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = PKUIChevronImage();
    v14 = (UIImageView *)[v12 initWithImage:v13];

    v15 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v14 setTintColor:v15];

    disclosureView = v3->_disclosureView;
    v3->_disclosureView = v14;
    v17 = v14;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v18;

    [(UIActivityIndicatorView *)v3->_spinner sizeToFit];
    [(PKPaymentTransactionMapCollectionViewCell *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85AD0]];
  }
  return v3;
}

- (void)setShowDisclosureIndicator:(BOOL)a3
{
  if (self->_showDisclosureIndicator != a3)
  {
    self->_showDisclosureIndicator = a3;
    [(PKPaymentTransactionMapCollectionViewCell *)self _updateSpinnerAndDisclosureIndicator];
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3) {
      [(UIActivityIndicatorView *)spinner startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)spinner stopAnimating];
    }
    [(PKPaymentTransactionMapCollectionViewCell *)self _updateSpinnerAndDisclosureIndicator];
  }
}

- (void)_updateSpinnerAndDisclosureIndicator
{
  if (self->_showSpinner)
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__disclosureView;
    v4 = [(UIActivityIndicatorView *)self->_spinner superview];

    if (!v4)
    {
      v5 = [(PKPaymentTransactionMapCollectionViewCell *)self contentView];
      [v5 addSubview:self->_spinner];
    }
  }
  else if (self->_showDisclosureIndicator)
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__spinner;
    v6 = [(UIImageView *)self->_disclosureView superview];

    if (!v6)
    {
      v7 = [(PKPaymentTransactionMapCollectionViewCell *)self contentView];
      [v7 addSubview:self->_disclosureView];

      v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__spinner;
    }
  }
  else
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__disclosureView;
    [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  }
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v3) removeFromSuperview];

  [(PKPaymentTransactionMapCollectionViewCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v4 prepareForReuse];
  item = self->_item;
  self->_item = 0;

  [(UILabel *)self->_titleLabel setText:0];
  [(PKPaymentTransactionMapCollectionViewCell *)self setShowSpinner:0];
  [(PKPaymentTransactionMapCollectionViewCell *)self setShowDisclosureIndicator:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(UILabel *)self->_titleLabel text];

  if (v5)
  {
    v6 = [(UILabel *)self->_titleLabel font];
    [v6 lineHeight];
    double v8 = v7 + 28.0 + 200.0;
  }
  else
  {
    double v8 = 200.0;
  }
  [(PKPaymentTransactionMapCollectionViewCell *)self maxWidthForTransactionCellInWidth:width];
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v23 layoutSubviews];
  v3 = [(PKPaymentTransactionMapCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.double width = v8;
  remainder.size.height = v10;

  memset(&v21, 0, sizeof(v21));
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.double width = v9;
  v24.size.height = v11;
  CGRectDivide(v24, &v21, &remainder, 200.0, CGRectMinYEdge);
  -[PKTransactionMapView setFrame:](self->_mapView, "setFrame:", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMinXEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMaxXEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMaxYEdge);
  id v12 = [(UIActivityIndicatorView *)self->_spinner superview];

  if (v12)
  {
    [(UIActivityIndicatorView *)self->_spinner frame];
    PKSizeAspectFit();
    double v14 = v13;
    spinner = self->_spinner;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
    double v16 = v14 + 14.0;
LABEL_5:
    CGRectDivide(remainder, &v21, &remainder, v16, CGRectMaxXEdge);
    goto LABEL_6;
  }
  v17 = [(UIImageView *)self->_disclosureView superview];

  if (v17)
  {
    [(UIImageView *)self->_disclosureView frame];
    CGRectDivide(remainder, &v21, &remainder, v18, CGRectMaxXEdge);
    disclosureView = self->_disclosureView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](disclosureView, "setFrame:");
    double v16 = 14.0;
    goto LABEL_5;
  }
LABEL_6:
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  titleLabel = self->_titleLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (double)maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (PKDashboardTransactionMapItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (PKTransactionMapView)mapView
{
  return self->_mapView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BOOL)showDisclosureIndicator
{
  return self->_showDisclosureIndicator;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_disclosureView, 0);
}

@end