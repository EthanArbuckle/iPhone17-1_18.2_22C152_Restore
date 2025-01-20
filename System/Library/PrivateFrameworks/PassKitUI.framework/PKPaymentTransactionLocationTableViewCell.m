@interface PKPaymentTransactionLocationTableViewCell
- (BOOL)_shouldShowDisclosureIndicator;
- (BOOL)usesDarkMapAppearance;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentTransaction)transaction;
- (PKPaymentTransactionLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_disclosureView;
- (void)layoutSubviews;
- (void)setTitleLabelColor:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUsesDarkMapAppearance:(BOOL)a3;
@end

@implementation PKPaymentTransactionLocationTableViewCell

- (PKPaymentTransactionLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionLocationTableViewCell;
  v4 = [(PKPaymentTransactionLocationTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PKPaymentTransactionLocationTableViewCell *)v4 contentView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;

    v9 = objc_alloc_init(PKTransactionMapView);
    mapView = v5->_mapView;
    v5->_mapView = v9;

    [(PKTransactionMapView *)v5->_mapView setShowsMerchantName:1];
    v11 = v5->_titleLabel;
    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v11 setFont:v12];

    v13 = v5->_titleLabel;
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v5->_titleLabel setNumberOfLines:1];
    [(UILabel *)v5->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v6 addSubview:v5->_titleLabel];
    [v6 addSubview:v5->_mapView];
    v15 = [(PKPaymentTransactionLocationTableViewCell *)v5 _disclosureView];
    [v6 addSubview:v15];

    [(PKPaymentTransactionLocationTableViewCell *)v5 setPreservesSuperviewLayoutMargins:1];
    [(PKPaymentTransactionLocationTableViewCell *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85690]];
  }
  return v5;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentTransactionLocationTableViewCell;
  [(PKPaymentTransactionLocationTableViewCell *)&v27 layoutSubviews];
  v3 = [(PKPaymentTransactionLocationTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  if ([(PKPaymentTransactionLocationTableViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v12 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v12 = CGRectMaxXEdge;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  CGRectGetWidth(v28);
  mapView = self->_mapView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKTransactionMapView setFrame:](mapView, "setFrame:");
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  CGRectDivide(v29, &v25, &remainder, 181.0, CGRectMinYEdge);
  __asm
  {
    FMOV            V0.2D, #14.0
    FMOV            V1.2D, #-28.0
  }
  remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, _Q0);
  remainder.size = (CGSize)vaddq_f64((float64x2_t)remainder.size, _Q1);
  v20 = [(PKPaymentTransactionLocationTableViewCell *)self _disclosureView];
  [v20 bounds];
  double v22 = v21;

  disclosureView = self->_disclosureView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](disclosureView, "setFrame:");
  CGRectDivide(remainder, &v25, &remainder, v22 + 14.0, v12);
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  titleLabel = self->_titleLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat v5 = [(UILabel *)self->_titleLabel text];

  if (v5)
  {
    double v6 = [(UILabel *)self->_titleLabel font];
    [v6 lineHeight];
    double v8 = v7 + 14.0 + 14.0 + 181.0;
  }
  else
  {
    double v8 = 181.0;
  }
  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)setTransaction:(id)a3
{
  CGFloat v5 = (PKPaymentTransaction *)a3;
  p_transaction = &self->_transaction;
  if (self->_transaction != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_transaction, a3);
    double v7 = [(PKPaymentTransaction *)v15 merchant];
    double v8 = [v7 displayName];

    if (v8) {
      goto LABEL_17;
    }
    double v8 = [(PKPaymentTransaction *)*p_transaction displayLocation];
    if (v8) {
      goto LABEL_17;
    }
    uint64_t v9 = [(PKPaymentTransaction *)*p_transaction startStation];
    uint64_t v10 = [(PKPaymentTransaction *)*p_transaction endStation];
    CGFloat v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (!(v9 | v10))
      {
        double v8 = 0;
        goto LABEL_16;
      }
      if (v9) {
        v13 = (void *)v9;
      }
      else {
        v13 = (void *)v10;
      }
      id v14 = v13;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TransitTransac.isa, &cfstr_12.isa, v9, v10);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v8 = v14;
LABEL_16:

LABEL_17:
    [(UILabel *)self->_titleLabel setText:v8];
    [(PKTransactionMapView *)self->_mapView setTransaction:v15];
    [(UIImageView *)self->_disclosureView setHidden:[(PKPaymentTransactionLocationTableViewCell *)self _shouldShowDisclosureIndicator] ^ 1];

    CGFloat v5 = v15;
  }
}

- (void)setTitleLabelColor:(id)a3
{
}

- (BOOL)usesDarkMapAppearance
{
  return [(PKTransactionMapView *)self->_mapView usesDarkAppearance];
}

- (void)setUsesDarkMapAppearance:(BOOL)a3
{
}

- (BOOL)_shouldShowDisclosureIndicator
{
  v2 = [(PKPaymentTransaction *)self->_transaction merchant];
  if ([v2 useRawMerchantData])
  {
    BOOL v3 = 0;
  }
  else
  {
    double v4 = [v2 mapsMerchant];
    BOOL v3 = [v4 identifier] != 0;
  }
  return v3;
}

- (id)_disclosureView
{
  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    CGFloat v5 = PKUIChevronImage();
    double v6 = (UIImageView *)[v4 initWithImage:v5];

    double v7 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v6 setTintColor:v7];

    double v8 = self->_disclosureView;
    self->_disclosureView = v6;

    disclosureView = self->_disclosureView;
  }

  return disclosureView;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end