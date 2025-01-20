@interface PKAccountScheduledPaymentCell
- (BOOL)_useStackedLayoutForUsableWidth:(double)a3;
- (BOOL)onHold;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAccountPayment)payment;
- (PKAccountScheduledPaymentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)titleColor;
- (UIEdgeInsets)_effectiveLayoutMargins;
- (id)_amountAttributedString;
- (id)_amountString;
- (id)_dateString;
- (id)_frequencyAttributedString;
- (id)_frequencyString;
- (id)_statusAttributedString;
- (unint64_t)featureIdentifier;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setOnHold:(BOOL)a3;
- (void)setPayment:(id)a3;
- (void)setPayment:(id)a3 forAccount:(id)a4;
- (void)setTitleColor:(id)a3;
@end

@implementation PKAccountScheduledPaymentCell

- (PKAccountScheduledPaymentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)PKAccountScheduledPaymentCell;
  v5 = [(PKAccountScheduledPaymentCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1D10] layoutManagerForTableViewCellStyle:a3];
    layoutManager = v5->_layoutManager;
    v5->_layoutManager = (UITableViewCellLayoutManager *)v6;

    v5->_featureIdentifier = 2;
    v8 = [(PKAccountScheduledPaymentCell *)v5 contentView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    frequencyLabel = v5->_frequencyLabel;
    v5->_frequencyLabel = v9;

    [(UILabel *)v5->_frequencyLabel setNumberOfLines:0];
    LODWORD(v11) = 1036831949;
    [(UILabel *)v5->_frequencyLabel _setHyphenationFactor:v11];
    [v8 addSubview:v5->_frequencyLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v12;

    [(UILabel *)v5->_statusLabel setNumberOfLines:0];
    LODWORD(v14) = 1036831949;
    [(UILabel *)v5->_statusLabel _setHyphenationFactor:v14];
    [v8 addSubview:v5->_statusLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    amountLabel = v5->_amountLabel;
    v5->_amountLabel = v15;

    [(UILabel *)v5->_amountLabel setNumberOfLines:0];
    LODWORD(v17) = 1036831949;
    [(UILabel *)v5->_amountLabel _setHyphenationFactor:v17];
    [v8 addSubview:v5->_amountLabel];
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_sizing = 1;
  -[PKAccountScheduledPaymentCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 1.79769313e308);
  self->_sizing = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountScheduledPaymentCell;
  [(PKAccountScheduledPaymentCell *)&v3 layoutSubviews];
  [(PKAccountScheduledPaymentCell *)self bounds];
  [(PKAccountScheduledPaymentCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UITableViewCellLayoutManager *)self->_layoutManager contentRectForCell:self forState:0 rowWidth:a3.size.width];
  double v9 = v8;
  memset(&slice, 0, sizeof(slice));
  [(PKAccountScheduledPaymentCell *)self _effectiveLayoutMargins];
  double v11 = x + v10;
  double v12 = y + 14.0;
  double v14 = v9 - (v10 + v13);
  remainder.origin.double x = v11;
  remainder.origin.double y = v12;
  remainder.size.CGFloat width = v14;
  remainder.size.double height = height + -28.0;
  [(PKAccountScheduledPaymentCell *)self _shouldReverseLayoutDirection];
  PKContentAlignmentMake();
  if ([(PKAccountScheduledPaymentCell *)self _useStackedLayoutForUsableWidth:v14])
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_frequencyLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v14, height + -28.0);
    CGFloat v16 = v15;
    if (!self->_sizing)
    {
      frequencyLabel = self->_frequencyLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](frequencyLabel, "setFrame:");
    }
    v44.origin.double x = v11;
    v44.origin.double y = v12;
    v44.size.CGFloat width = v14;
    v44.size.double height = height + -28.0;
    CGRectDivide(v44, &slice, &remainder, v16, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v19 = v18;
    if (!self->_sizing)
    {
      amountLabel = self->_amountLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](amountLabel, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
    double v21 = v16 + 4.0 + 28.0 + v19 + 4.0;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v23 = v22;
    if (!self->_sizing)
    {
      statusLabel = self->_statusLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](statusLabel, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
    double v25 = v21 + v23;
  }
  else
  {
    double v40 = width;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, (v14 + -16.0) * 0.5, height + -28.0);
    double v27 = v26;
    double v29 = v14 - (v28 + 16.0);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_frequencyLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, height + -28.0);
    double v31 = v30 + 2.0;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, height + -28.0 - (v30 + 2.0));
    CGFloat v33 = fmax(v27, v31 + v32);
    v45.origin.double x = v11;
    v45.origin.double y = v12;
    v45.size.CGFloat width = v14;
    v45.size.double height = height + -28.0;
    CGRectDivide(v45, &slice, &remainder, v33, CGRectMinYEdge);
    double v25 = v33 + 28.0;
    if (!self->_sizing)
    {
      v34 = self->_frequencyLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v34, "setFrame:");
      v35 = self->_amountLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v35, "setFrame:");
      v36 = self->_statusLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v36, "setFrame:");
    }
    CGFloat width = v40;
  }
  float v37 = v25;
  double v38 = ceilf(v37);
  double v39 = width;
  result.double height = v38;
  result.CGFloat width = v39;
  return result;
}

- (BOOL)_useStackedLayoutForUsableWidth:(double)a3
{
  double v4 = (a3 + -16.0) * 0.5;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_amountLabel, "pkui_sizeThatFits:forceWordWrap:", 1, 1.79769313e308, 1.79769313e308);
  BOOL result = v5 > v4;
  self->_useStackedLayout = v5 > v4;
  return result;
}

- (UIEdgeInsets)_effectiveLayoutMargins
{
  int v3 = [(PKAccountScheduledPaymentCell *)self _shouldReverseLayoutDirection];
  double v4 = [(PKAccountScheduledPaymentCell *)self contentView];
  [(PKAccountScheduledPaymentCell *)self separatorInset];
  double v6 = v5;
  double v8 = v7;
  [v4 layoutMargins];
  if (v3) {
    double v11 = v8;
  }
  else {
    double v11 = v6;
  }
  double v12 = fmax(v11, v9);
  if (v3) {
    double v13 = v6;
  }
  else {
    double v13 = v8;
  }
  double v14 = fmax(v13, v10);

  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v16;
  result.left = v17;
  result.top = v15;
  return result;
}

- (void)setPayment:(id)a3 forAccount:(id)a4
{
  id obj = a3;
  id v6 = a4;
  objc_storeWeak((id *)&self->_payment, obj);
  int v7 = [obj isOnHoldForAccount:v6];
  if (v7) {
    LOBYTE(v7) = [obj isBeforeNextCycleForAccount:v6];
  }
  self->_onHold = v7;
  double v8 = [v6 creditDetails];
  double v9 = [v8 productTimeZone];
  timeZone = self->_timeZone;
  self->_timeZone = v9;

  double v11 = [v6 creditDetails];
  double v12 = [v11 accountSummary];
  double v13 = [v12 paymentDueDate];
  self->_hasPaymentDueDate = v13 != 0;

  frequencyLabel = self->_frequencyLabel;
  double v15 = [(PKAccountScheduledPaymentCell *)self _frequencyAttributedString];
  [(UILabel *)frequencyLabel setAttributedText:v15];

  amountLabel = self->_amountLabel;
  double v17 = [(PKAccountScheduledPaymentCell *)self _amountAttributedString];
  [(UILabel *)amountLabel setAttributedText:v17];

  statusLabel = self->_statusLabel;
  CGFloat v19 = [(PKAccountScheduledPaymentCell *)self _statusAttributedString];
  [(UILabel *)statusLabel setAttributedText:v19];

  [(PKAccountScheduledPaymentCell *)self setAccessoryType:1];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountScheduledPaymentCell;
  [(PKAccountScheduledPaymentCell *)&v3 prepareForReuse];
  objc_storeWeak((id *)&self->_payment, 0);
}

- (id)_frequencyAttributedString
{
  v11[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PKAccountScheduledPaymentCell *)self _frequencyString];
  v10[0] = *MEMORY[0x1E4FB06F8];
  double v4 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2780], 0x8000, 0);
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E4FB0700];
  double v5 = [(PKAccountScheduledPaymentCell *)self titleColor];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v11[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v5) {

  }
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3 attributes:v7];

  return v8;
}

- (id)_statusAttributedString
{
  v15[2] = *MEMORY[0x1E4F143B8];
  p_payment = &self->_payment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  if ([WeakRetained isRecurring])
  {
    id v5 = objc_loadWeakRetained((id *)p_payment);
    uint64_t v6 = [v5 state];

    if (v6 == 4)
    {
      int v7 = PKLocalizedFeatureString();
      int v8 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v7 = [(PKAccountScheduledPaymentCell *)self _dateString];
  int v8 = 0;
LABEL_6:
  if ([v7 length])
  {
    v14[0] = *MEMORY[0x1E4FB06F8];
    double v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
    v15[0] = v9;
    v14[1] = *MEMORY[0x1E4FB0700];
    if (v8) {
      [MEMORY[0x1E4FB1618] redColor];
    }
    else {
    double v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    v15[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)_frequencyString
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  objc_super v3 = [WeakRetained scheduleDetails];
  uint64_t v4 = [v3 frequency];

  if ((unint64_t)(v4 - 1) > 6)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = PKLocalizedFeatureString();
  }

  return v5;
}

- (id)_amountString
{
  p_payment = &self->_payment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  uint64_t v4 = [WeakRetained scheduleDetails];
  uint64_t v5 = [v4 preset];

  if (v5 == 3 || v5 == 2)
  {
    double v12 = PKLocalizedFeatureString();
  }
  else if (v5 == 1)
  {
    id v6 = objc_loadWeakRetained((id *)p_payment);
    int v7 = [v6 currencyAmount];
    int v8 = [v7 amount];
    id v9 = objc_loadWeakRetained((id *)p_payment);
    double v10 = [v9 currencyAmount];
    double v11 = [v10 currency];
    double v12 = PKFormattedCurrencyStringFromNumber();
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)_amountAttributedString
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PKAccountScheduledPaymentCell *)self _amountString];
  if ([v2 length])
  {
    v8[0] = *MEMORY[0x1E4FB06F8];
    objc_super v3 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2780], 0x8000, 0);
    v9[0] = v3;
    v8[1] = *MEMORY[0x1E4FB0700];
    uint64_t v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v9[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v2 attributes:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_dateString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setLocalizedDateFormatFromTemplate:@"MMM d"];
  [v3 setTimeZone:self->_timeZone];
  p_payment = &self->_payment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payment);
  id v6 = [WeakRetained paymentDate];

  if (self->_onHold)
  {
    uint64_t v7 = PKLocalizedFeatureString();
LABEL_3:
    int v8 = (void *)v7;
    goto LABEL_4;
  }
  if (v6)
  {
    id v10 = objc_loadWeakRetained((id *)p_payment);
    int v11 = [v10 isRecurring];

    if (!v11)
    {
      uint64_t v7 = [v3 stringFromDate:v6];
      goto LABEL_3;
    }
    double v12 = PKLocalizedFeatureString();
    double v15 = [v3 stringFromDate:v6];
    int v8 = PKStringWithValidatedFormat();
  }
  else
  {
    double v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_loadWeakRetained((id *)p_payment);
      *(_DWORD *)buf = 138412290;
      id v17 = v14;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Payment is missing payment date: %@", buf, 0xCu);
    }
    int v8 = 0;
  }
LABEL_4:

  return v8;
}

- (PKAccountPayment)payment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payment);

  return (PKAccountPayment *)WeakRetained;
}

- (void)setPayment:(id)a3
{
}

- (BOOL)onHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_payment);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);

  objc_storeStrong((id *)&self->_frequencyLabel, 0);
}

@end