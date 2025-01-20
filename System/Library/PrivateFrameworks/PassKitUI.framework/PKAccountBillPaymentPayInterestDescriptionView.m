@interface PKAccountBillPaymentPayInterestDescriptionView
- (BOOL)_showInterest;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)interestChargeDate;
- (NSDate)selectedPaymentDate;
- (NSDecimalNumber)interest;
- (PKAccountBillPaymentPayInterestDescriptionView)initWithAccount:(id)a3;
- (PKAccountBillPaymentPayInterestDescriptionViewDelegate)delegate;
- (id)_learnMoreAttributedStringWithText:(id)a3;
- (void)_updateLabels;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setInterest:(id)a3;
- (void)setInterestChargeDate:(id)a3;
- (void)setSelectedPaymentDate:(id)a3;
@end

@implementation PKAccountBillPaymentPayInterestDescriptionView

- (PKAccountBillPaymentPayInterestDescriptionView)initWithAccount:(id)a3
{
  id v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKAccountBillPaymentPayInterestDescriptionView;
  v6 = [(PKAccountBillPaymentPayInterestDescriptionView *)&v44 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = [v5 creditDetails];
    v9 = [v8 currencyCode];
    uint64_t v10 = PKMutableNumberFormatterForCurrencyCode();
    amountFormatter = v7->_amountFormatter;
    v7->_amountFormatter = (NSNumberFormatter *)v10;

    [v5 feature];
    uint64_t v12 = PKLocalizedFeatureString();
    learnMoreString = v7->_learnMoreString;
    v7->_learnMoreString = (NSString *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    cancellationView = v7->_cancellationView;
    v7->_cancellationView = (UITextView *)v14;

    [(UITextView *)v7->_cancellationView setDelegate:v7];
    [(UITextView *)v7->_cancellationView setSelectable:1];
    [(UITextView *)v7->_cancellationView setUserInteractionEnabled:1];
    [(UITextView *)v7->_cancellationView _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v7->_cancellationView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)v7->_cancellationView setAccessibilityIdentifier:*MEMORY[0x1E4F85348]];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    estimatedChargeLabel = v7->_estimatedChargeLabel;
    v7->_estimatedChargeLabel = v16;

    [(UILabel *)v7->_estimatedChargeLabel setTextAlignment:1];
    v18 = v7->_estimatedChargeLabel;
    v19 = (void *)*MEMORY[0x1E4FB2790];
    v20 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
    [(UILabel *)v18 setFont:v20];

    v21 = v7->_estimatedChargeLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v7->_estimatedChargeLabel setNumberOfLines:0];
    [(UILabel *)v7->_estimatedChargeLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85508]];
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    interestLabel = v7->_interestLabel;
    v7->_interestLabel = v23;

    v43 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2990], v19, 0x8000, 32);
    [(UILabel *)v7->_interestLabel setFont:v43];
    [(UILabel *)v7->_interestLabel setBaselineAdjustment:1];
    [(UILabel *)v7->_interestLabel setTextAlignment:1];
    [(UILabel *)v7->_interestLabel setNumberOfLines:1];
    v25 = v7->_interestLabel;
    v26 = [MEMORY[0x1E4FB1618] colorWithRed:0.992 green:0.71 blue:0.227 alpha:1.0];
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v7->_interestLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85630]];
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    productDateFormatter = v7->_productDateFormatter;
    v7->_productDateFormatter = v27;

    v29 = v7->_productDateFormatter;
    v30 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v29 setLocale:v30];

    v31 = v7->_productDateFormatter;
    v32 = [(PKAccount *)v7->_account creditDetails];
    v33 = [v32 productTimeZone];
    [(NSDateFormatter *)v31 setTimeZone:v33];

    [(NSDateFormatter *)v7->_productDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v34 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    localDateFormatter = v7->_localDateFormatter;
    v7->_localDateFormatter = v34;

    v36 = v7->_localDateFormatter;
    v37 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v36 setLocale:v37];

    [(NSDateFormatter *)v7->_localDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v38 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    localTimeFormatter = v7->_localTimeFormatter;
    v7->_localTimeFormatter = v38;

    v40 = v7->_localTimeFormatter;
    v41 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v40 setLocale:v41];

    [(NSDateFormatter *)v7->_localTimeFormatter setLocalizedDateFormatFromTemplate:@"j:mm a z"];
    [(PKAccountBillPaymentPayInterestDescriptionView *)v7 addSubview:v7->_cancellationView];
    [(PKAccountBillPaymentPayInterestDescriptionView *)v7 addSubview:v7->_estimatedChargeLabel];
    [(PKAccountBillPaymentPayInterestDescriptionView *)v7 addSubview:v7->_interestLabel];
    [(PKAccountBillPaymentPayInterestDescriptionView *)v7 _updateLabels];
  }
  return v7;
}

- (void)setInterest:(id)a3
{
  p_interest = &self->_interest;
  id v10 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_interest, a3);
    v6 = *p_interest;
    v7 = [MEMORY[0x1E4F84578] roundingHandler];
    uint64_t v8 = [(NSDecimalNumber *)v6 decimalNumberByRoundingAccordingToBehavior:v7];
    v9 = *p_interest;
    *p_interest = (NSDecimalNumber *)v8;

    [(PKAccountBillPaymentPayInterestDescriptionView *)self setNeedsLayout];
  }
}

- (void)setSelectedPaymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPaymentDate, a3);

  [(PKAccountBillPaymentPayInterestDescriptionView *)self setNeedsLayout];
}

- (void)setInterestChargeDate:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_interestChargeDate, a3);
    [(PKAccountBillPaymentPayInterestDescriptionView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKAccountBillPaymentPayInterestDescriptionView;
  [(PKAccountBillPaymentPayInterestDescriptionView *)&v28 layoutSubviews];
  [(PKAccountBillPaymentPayInterestDescriptionView *)self _updateLabels];
  BOOL v3 = [(PKAccountBillPaymentPayInterestDescriptionView *)self _showInterest];
  [(PKAccountBillPaymentPayInterestDescriptionView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [(UITextView *)self->_cancellationView frame];
  [(UITextView *)self->_cancellationView sizeThatFits:v9];
  PKRectCenteredXInRect();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  CGFloat MaxY = CGRectGetMaxY(v29);
  double v19 = MaxY - v17;
  -[UITextView setFrame:](self->_cancellationView, "setFrame:", v13, MaxY - v17, v15, v17);
  if (v3)
  {
    [(UILabel *)self->_estimatedChargeLabel frame];
    -[UILabel sizeThatFits:](self->_estimatedChargeLabel, "sizeThatFits:", v9, 3.40282347e38);
    v30.origin.x = v13;
    v30.origin.y = v19;
    v30.size.width = v15;
    v30.size.height = v17;
    CGRectGetMinY(v30);
    PKRectCenteredXInRect();
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    -[UILabel setFrame:](self->_estimatedChargeLabel, "setFrame:");
    [(UILabel *)self->_interestLabel frame];
    -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", v9, 3.40282347e38);
    v31.origin.x = v21;
    v31.origin.y = v23;
    v31.size.width = v25;
    v31.size.height = v27;
    CGRectGetMinY(v31);
    PKRectCenteredXInRect();
    -[UILabel setFrame:](self->_interestLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 0.0;
  if ([(PKAccountBillPaymentPayInterestDescriptionView *)self _showInterest])
  {
    -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", width, height);
    double v8 = v7 + 0.0 + 6.0;
    -[UILabel sizeThatFits:](self->_estimatedChargeLabel, "sizeThatFits:", width, height);
    double v6 = v8 + v9 + 20.0;
  }
  -[UITextView sizeThatFits:](self->_cancellationView, "sizeThatFits:", width, height);
  double v11 = v6 + v10;
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained billPaymentPayInterestDescriptionViewHasTappedLearnMore:self];

  return 0;
}

- (BOOL)_showInterest
{
  interest = self->_interest;
  if (interest)
  {
    BOOL v3 = [MEMORY[0x1E4F28C28] zero];
    LOBYTE(interest) = [(NSDecimalNumber *)interest compare:v3] == NSOrderedDescending;
  }
  return (char)interest;
}

- (void)_updateLabels
{
  [(PKAccount *)self->_account feature];
  interest = self->_interest;
  if (!interest) {
    goto LABEL_6;
  }
  double v4 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v5 = [interest compare:v4];

  if (v5 != 1)
  {
    interest = 0;
LABEL_6:
    id v26 = 0;
    goto LABEL_9;
  }
  double v6 = [(NSDateFormatter *)self->_productDateFormatter stringFromDate:self->_interestChargeDate];
  if (v6)
  {
    CGFloat v25 = v6;
    PKLocalizedFeatureString();
  }
  else
  {
    PKLocalizedFeatureString();
  double v7 = };
  objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale", v25);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  interest = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:self->_interest];

LABEL_9:
  double v8 = [(PKAccount *)self->_account creditDetails];
  double v9 = [v8 productTimeZone];

  if (self->_selectedPaymentDate) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    double v12 = (void *)[v11 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    [v12 setTimeZone:v9];
    double v13 = [v12 components:28 fromDate:self->_selectedPaymentDate];
    double v14 = [v12 dateFromComponents:v13];
    cancellationDate = self->_cancellationDate;
    self->_cancellationDate = v14;

    double v16 = [(NSDate *)self->_cancellationDate dateByAddingTimeInterval:-60.0];
    double v17 = self->_cancellationDate;
    self->_cancellationDate = v16;
  }
  if (self->_cancellationDate)
  {
    v18 = -[NSDateFormatter stringFromDate:](self->_localTimeFormatter, "stringFromDate:");
    double v19 = [(NSDateFormatter *)self->_localDateFormatter stringFromDate:self->_cancellationDate];
    double v20 = PKLocalizedFeatureString();

    CGFloat v21 = [NSString stringWithFormat:@"%@ %@", v20, self->_learnMoreString];
    cancellationView = self->_cancellationView;
    CGFloat v23 = [(PKAccountBillPaymentPayInterestDescriptionView *)self _learnMoreAttributedStringWithText:v21];
    [(UITextView *)cancellationView setAttributedText:v23];
  }
  [(UILabel *)self->_estimatedChargeLabel setText:v26];
  [(UILabel *)self->_estimatedChargeLabel sizeToFit];
  [(UILabel *)self->_interestLabel setText:interest];
  [(UILabel *)self->_interestLabel sizeToFit];
  uint64_t v24 = [(PKAccountBillPaymentPayInterestDescriptionView *)self _showInterest] ^ 1;
  [(UILabel *)self->_interestLabel setHidden:v24];
  [(UILabel *)self->_estimatedChargeLabel setHidden:v24];
}

- (id)_learnMoreAttributedStringWithText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [v4 length];
    double v6 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF1B5B50];
    uint64_t v7 = [v4 rangeOfString:self->_learnMoreString];
    uint64_t v9 = v8;
    BOOL v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2948], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
    id v11 = objc_msgSend(v10, "pk_fixedWidthFont");

    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    double v13 = [MEMORY[0x1E4FB1618] linkColor];
    objc_msgSend(v12, "pk_addLinkURL:toRange:withColor:isUnderlined:", v6, v7, v9, v13, 0);

    double v14 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v15 = (void *)[v14 mutableCopy];

    [v15 setLineBreakMode:0];
    [v15 setAlignment:1];
    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v15, 0, v5);
    uint64_t v16 = *MEMORY[0x1E4FB0700];
    double v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_msgSend(v12, "addAttribute:value:range:", v16, v17, 0, v5);

    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v11, 0, v5);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (NSDecimalNumber)interest
{
  return self->_interest;
}

- (NSDate)interestChargeDate
{
  return self->_interestChargeDate;
}

- (NSDate)selectedPaymentDate
{
  return self->_selectedPaymentDate;
}

- (PKAccountBillPaymentPayInterestDescriptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccountBillPaymentPayInterestDescriptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPaymentDate, 0);
  objc_storeStrong((id *)&self->_interestChargeDate, 0);
  objc_storeStrong((id *)&self->_interest, 0);
  objc_storeStrong((id *)&self->_cancellationDate, 0);
  objc_storeStrong((id *)&self->_learnMoreString, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_localTimeFormatter, 0);
  objc_storeStrong((id *)&self->_localDateFormatter, 0);
  objc_storeStrong((id *)&self->_productDateFormatter, 0);
  objc_storeStrong((id *)&self->_interestLabel, 0);
  objc_storeStrong((id *)&self->_cancellationView, 0);

  objc_storeStrong((id *)&self->_estimatedChargeLabel, 0);
}

@end