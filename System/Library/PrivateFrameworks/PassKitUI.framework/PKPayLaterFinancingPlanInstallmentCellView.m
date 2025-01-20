@interface PKPayLaterFinancingPlanInstallmentCellView
+ (id)_numberFormatter;
- (BOOL)_isInstallmentPaid;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPayLaterFinancingPlanInstallmentCellView)initWithFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7;
- (id)_secondaryLabelText;
- (id)_tertiaryFont;
- (void)_tappedButton;
- (void)_updateTertiaryLabel;
- (void)layoutSubviews;
@end

@implementation PKPayLaterFinancingPlanInstallmentCellView

- (PKPayLaterFinancingPlanInstallmentCellView)initWithFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v115.receiver = self;
  v115.super_class = (Class)PKPayLaterFinancingPlanInstallmentCellView;
  v17 = -[PKPayLaterFinancingPlanInstallmentCellView initWithFrame:](&v115, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v18 = v17;
  if (!v17) {
    goto LABEL_25;
  }
  id v111 = v16;
  v114 = v15;
  id v112 = v14;
  objc_storeStrong((id *)&v17->_financingPlan, a3);
  objc_storeStrong((id *)&v18->_installment, a4);
  v18->_rowIndex = a5;
  objc_storeStrong((id *)&v18->_paymentIntentController, a6);
  objc_storeStrong((id *)&v18->_presentingViewController, a7);
  uint64_t v19 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  calendar = v18->_calendar;
  v18->_calendar = (NSCalendar *)v19;

  v21 = [(PKPayLaterFinancingPlan *)v18->_financingPlan merchant];
  uint64_t v22 = [v21 displayName];

  v23 = [(PKPayLaterFinancingPlan *)v18->_financingPlan scheduleSummary];
  p_installment = (id *)&v18->_installment;
  v24 = [(PKPayLaterInstallment *)v18->_installment installmentIdentifier];
  uint64_t v25 = [v23 installmentNumberForInstallmentIdentifier:v24] + 1;

  v113 = v23;
  v26 = [v23 installments];
  uint64_t v109 = [v26 count];

  v27 = [(id)objc_opt_class() _numberFormatter];
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  primaryLabel = v18->_primaryLabel;
  v18->_primaryLabel = v28;

  v30 = v18->_primaryLabel;
  v31 = NSString;
  v32 = [NSNumber numberWithInteger:v18->_rowIndex];
  v33 = [v31 stringWithFormat:@"PKPayLaterFinancingPlanInstallmentCellView.primaryLabel.%@", v32];
  [(UILabel *)v30 setAccessibilityIdentifier:v33];

  [(UILabel *)v18->_primaryLabel setNumberOfLines:0];
  v34 = v18->_primaryLabel;
  v35 = (NSString *)*MEMORY[0x1E4FB2790];
  v36 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
  [(UILabel *)v34 setFont:v36];

  v37 = v18->_primaryLabel;
  v38 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v37 setTextColor:v38];

  v39 = v18->_primaryLabel;
  v40 = [NSNumber numberWithInteger:v25];
  v41 = [v27 stringFromNumber:v40];
  v42 = [NSNumber numberWithInteger:v109];
  v110 = v27;
  v43 = [v27 stringFromNumber:v42];
  v108 = (void *)v22;
  v44 = PKLocalizedCocoonString(&cfstr_MerchantInstal.isa, &cfstr_123.isa, v22, v41, v43);
  [(UILabel *)v39 setText:v44];

  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 addSubview:v18->_primaryLabel];
  v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  secondaryLabel = v18->_secondaryLabel;
  v18->_secondaryLabel = v45;

  v47 = v18->_secondaryLabel;
  v48 = NSString;
  v49 = [NSNumber numberWithInteger:v18->_rowIndex];
  v50 = [v48 stringWithFormat:@"PKPayLaterFinancingPlanInstallmentCellView.secondaryLabel.%@", v49];
  [(UILabel *)v47 setAccessibilityIdentifier:v50];

  [(UILabel *)v18->_secondaryLabel setNumberOfLines:0];
  v51 = v18->_secondaryLabel;
  v52 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2908], v35);
  [(UILabel *)v51 setFont:v52];

  v53 = v18->_secondaryLabel;
  v54 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v53 setTextColor:v54];

  v55 = v18->_secondaryLabel;
  v56 = [(PKPayLaterFinancingPlanInstallmentCellView *)v18 _secondaryLabelText];
  [(UILabel *)v55 setText:v56];

  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 addSubview:v18->_secondaryLabel];
  uint64_t v57 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinnerView = v18->_spinnerView;
  v18->_spinnerView = (UIActivityIndicatorView *)v57;

  v59 = v18->_spinnerView;
  v60 = NSString;
  v61 = [NSNumber numberWithInteger:v18->_rowIndex];
  v62 = [v60 stringWithFormat:@"PKPayLaterFinancingPlanInstallmentCellView.spinnerView.%@", v61];
  [(UIActivityIndicatorView *)v59 setAccessibilityIdentifier:v62];

  [(UIActivityIndicatorView *)v18->_spinnerView startAnimating];
  [(UIActivityIndicatorView *)v18->_spinnerView setHidden:1];
  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 addSubview:v18->_spinnerView];
  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 _updateTertiaryLabel];
  v63 = [(PKPayLaterFinancingPlan *)v18->_financingPlan fundingSource];
  char v64 = [v63 autoPayment];

  uint64_t v65 = [(PKPayLaterFinancingPlan *)v18->_financingPlan state];
  if (v65 != 1)
  {
    v66 = 0;
    v67 = 0;
    v68 = 0;
    if (v65 != 4) {
      goto LABEL_20;
    }
    uint64_t v69 = [*p_installment status];
    if (v69 != 1 && v69 != 4) {
      goto LABEL_19;
    }
LABEL_16:
    v67 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v68 = [MEMORY[0x1E4FB1618] labelColor];
    v66 = PKLocalizedCocoonString(&cfstr_PayNowButton.isa);
    goto LABEL_20;
  }
  if ((v64 & 1) == 0)
  {
    v70 = [v113 nextDueInstallment];
    v71 = [v70 installmentIdentifier];
    v72 = [*p_installment installmentIdentifier];
    id v73 = v71;
    id v74 = v72;
    if (v73 == v74)
    {

      goto LABEL_14;
    }
    v75 = v74;
    if (v73 && v74)
    {
      char v76 = [v73 isEqualToString:v74];

      if ((v76 & 1) == 0) {
        goto LABEL_19;
      }
LABEL_14:
      uint64_t v77 = [*p_installment dueDate];
      if (!v77) {
        goto LABEL_17;
      }
      v78 = (void *)v77;
      v79 = v18->_calendar;
      v80 = [MEMORY[0x1E4F1C9C8] date];
      v81 = [(NSCalendar *)v79 components:16 fromDate:v80 toDate:v78 options:0];

      uint64_t v82 = [v81 day];
      uint64_t v83 = *MEMORY[0x1E4F87960];

      if (v82 >= v83)
      {
LABEL_17:
        v66 = PKLocalizedCocoonString(&cfstr_PayEarlyButton.isa);
        v67 = [MEMORY[0x1E4FB1618] labelColor];
        v68 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
LABEL_19:
  v66 = 0;
  v67 = 0;
  v68 = 0;
LABEL_20:
  v84 = (void *)MEMORY[0x1E4F84998];
  v85 = [v114 payLaterAccount];
  int v86 = objc_msgSend(v84, "canMakePaymentsWithAccountState:", objc_msgSend(v85, "state"));

  if ([v66 length] && v86)
  {
    v87 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    button = v18->_button;
    v18->_button = v87;

    v89 = [(UIButton *)v18->_button layer];
    [v89 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v90 = (void *)MEMORY[0x1E4FB14D8];
    v91 = [v66 uppercaseString];
    v92 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], 0, 32770, 0);
    v93 = objc_msgSend(v90, "pkui_plainConfigurationWithTitle:font:", v91, v92);

    [v93 setBaseForegroundColor:v67];
    [(UIButton *)v18->_button setConfiguration:v93];
    [(UIButton *)v18->_button setBackgroundColor:v68];
    [(UIButton *)v18->_button addTarget:v18 action:sel__tappedButton forControlEvents:64];
    [(UIButton *)v18->_button setAccessibilityIdentifier:@"PKPayLaterFinancingPlanInstallmentCellView.button"];
    [(PKPayLaterFinancingPlanInstallmentCellView *)v18 addSubview:v18->_button];
  }
  else
  {
    id v94 = objc_alloc(MEMORY[0x1E4FB1838]);
    v95 = PKUIChevronImage();
    uint64_t v96 = [v94 initWithImage:v95];
    disclosureView = v18->_disclosureView;
    v18->_disclosureView = (UIImageView *)v96;

    v98 = v18->_disclosureView;
    v99 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v98 setTintColor:v99];

    [(UIImageView *)v18->_disclosureView setAccessibilityIdentifier:@"PKPayLaterFinancingPlanInstallmentCellView.disclosureView"];
    [(PKPayLaterFinancingPlanInstallmentCellView *)v18 addSubview:v18->_disclosureView];
  }
  id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v101 = [(UILabel *)v18->_primaryLabel text];
  [v100 safelyAddObject:v101];

  v102 = [(UILabel *)v18->_secondaryLabel text];
  [v100 safelyAddObject:v102];

  v103 = [(PKIconTextLabel *)v18->_tertiaryLabel text];
  v104 = [v103 string];
  [v100 safelyAddObject:v104];

  v105 = [v100 componentsJoinedByString:@","];
  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 setAccessibilityLabel:v105];
  [(PKPayLaterFinancingPlanInstallmentCellView *)v18 setIsAccessibilityElement:1];

  id v16 = v111;
  id v14 = v112;
  id v15 = v114;
LABEL_25:

  return v18;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanInstallmentCellView;
  [(PKPayLaterFinancingPlanInstallmentCellView *)&v3 layoutSubviews];
  [(PKPayLaterFinancingPlanInstallmentCellView *)self bounds];
  -[PKPayLaterFinancingPlanInstallmentCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterFinancingPlanInstallmentCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect remainder = a3;
  if ([(PKPayLaterFinancingPlanInstallmentCellView *)self _shouldReverseLayoutDirection])CGRectEdge v9 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v9 = CGRectMaxXEdge;
  disclosureView = self->_disclosureView;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", width, 3.40282347e38);
    double v12 = v11;
    double v75 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v75 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", width, 3.40282347e38);
  button = self->_button;
  if (button)
  {
    -[UIButton sizeThatFits:](button, "sizeThatFits:", width - v12, 3.40282347e38);
    double v16 = v15;
    double v73 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v73 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v18 = width - v12 - v16;
  primaryLabel = self->_primaryLabel;
  if (primaryLabel)
  {
    -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    double v68 = v21;
    double v69 = v20;
  }
  else
  {
    double v68 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v69 = *MEMORY[0x1E4F1DB30];
  }
  secondaryLabel = self->_secondaryLabel;
  if (secondaryLabel)
  {
    -[UILabel sizeThatFits:](secondaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    double v70 = v23;
    double v72 = v24;
  }
  else
  {
    double v70 = *MEMORY[0x1E4F1DB30];
    double v72 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryLabel)
  {
    -[PKIconTextLabel sizeThatFits:](tertiaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    double v27 = v26;
    double v71 = v28;
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB30];
    double v71 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v29 = (double *)MEMORY[0x1E4F1DB28];
  memset(&v84, 0, sizeof(v84));
  CGPoint v30 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v31 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = v30;
  slice.size = v31;
  CGSize v76 = v31;
  CGPoint v77 = v30;
  if (v12 > 0.0)
  {
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.double width = width;
    v86.size.CGFloat height = height;
    CGRectDivide(v86, &slice, &remainder, v12, v9);
    CGRectDivide(remainder, &v84, &remainder, 11.0, v9);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.CGFloat x = v32;
    slice.origin.CGFloat y = v33;
    slice.size.double width = v34;
    slice.size.CGFloat height = v35;
    CGSize v31 = v76;
    CGPoint v30 = v77;
  }
  v81.origin = v30;
  v81.size = v31;
  if (v16 <= 0.0)
  {
    double v67 = *v29;
    double v39 = v29[1];
    double v42 = v29[2];
    double v66 = v29[3];
    double v43 = v73;
  }
  else
  {
    PKRectCenteredYInRect();
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v66 = v37;
    double v67 = v36;
    double v39 = v38;
    double v41 = v40;
    CGRectDivide(remainder, &v81, &remainder, v16, v9);
    PKContentAlignmentMake();
    double v42 = v41;
    double v43 = v73;
    PKSizeAlignedInRect();
    v81.origin.CGFloat x = v44;
    v81.origin.CGFloat y = v45;
    v81.size.double width = v46;
    v81.size.CGFloat height = v47;
    CGRectDivide(remainder, &v84, &remainder, 10.0, v9);
    v48 = [(UIButton *)self->_button layer];
    [v48 setCornerRadius:v81.size.height * 0.5];

    CGSize v31 = v76;
    CGPoint v30 = v77;
  }
  double v49 = fmax(v68, v75);
  v80.origin = v30;
  v80.size = v31;
  if (v69 > 0.0)
  {
    CGRectDivide(remainder, &v80, &remainder, v49, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v80.origin.CGFloat x = v50;
    v80.origin.CGFloat y = v51;
    v80.size.double width = v52;
    v80.size.CGFloat height = v53;
    CGSize v31 = v76;
    CGPoint v30 = v77;
    if (v12 > 0.0)
    {
      v54 = [(UILabel *)self->_primaryLabel font];
      [v54 ascender];
      [v54 capHeight];
      PKFloatRoundToPixel();
      slice.origin.CGFloat y = v55 + slice.origin.y;

      CGSize v31 = v76;
      CGPoint v30 = v77;
    }
  }
  v79.origin = v30;
  v79.size = v31;
  if (v70 > 0.0)
  {
    CGRectDivide(remainder, &v79, &remainder, v72, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v79.origin.CGFloat x = v56;
    v79.origin.CGFloat y = v57;
    v79.size.double width = v58;
    v79.size.CGFloat height = v59;
    CGSize v31 = v76;
    CGPoint v30 = v77;
  }
  v78.origin = v30;
  v78.size = v31;
  if (v27 > 0.0)
  {
    CGRectDivide(remainder, &v78, &remainder, v71, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v78.origin.CGFloat x = v60;
    v78.origin.CGFloat y = v61;
    v78.size.double width = v62;
    v78.size.CGFloat height = v63;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v79.origin.x, v79.origin.y, v79.size.width, v79.size.height);
    -[PKIconTextLabel setFrame:](self->_tertiaryLabel, "setFrame:", v78.origin.x, v78.origin.y, v78.size.width, v78.size.height);
    -[UIButton setFrame:](self->_button, "setFrame:", v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v67, v39, v42, v66);
  }
  double v64 = fmax(v49 + v72 + v71, v43);
  double v65 = width;
  result.CGFloat height = v64;
  result.double width = v65;
  return result;
}

- (void)_tappedButton
{
  double v3 = [[PKPayLaterMakePaymentViewController alloc] initWithFinancingPlan:self->_financingPlan paymentIntentController:self->_paymentIntentController];
  double v4 = [[PKNavigationController alloc] initWithRootViewController:v3];
  [(UIActivityIndicatorView *)self->_spinnerView setHidden:0];
  [(UIButton *)self->_button setHidden:1];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke;
  v6[3] = &unk_1E59CC710;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  [(PKPayLaterMakePaymentViewController *)v3 preflightWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke_2;
    double v12 = &unk_1E59CA7F8;
    objc_copyWeak(&v13, &location);
    v6 = (void (**)(void))_Block_copy(&v9);
    if (v4)
    {
      v7 = PKAccountDisplayableError();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8) {
        objc_msgSend(WeakRetained[54], "presentViewController:animated:completion:", v8, 1, v6, v9, v10, v11, v12);
      }
      else {
        v6[2](v6);
      }
    }
    else
    {
      objc_msgSend(WeakRetained[54], "presentViewController:animated:completion:", *(void *)(a1 + 40), 1, v6, v9, v10, v11, v12);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[61] setHidden:1];
    [v2[62] setHidden:0];
    WeakRetained = v2;
  }
}

- (id)_secondaryLabelText
{
  BOOL v3 = [(PKPayLaterFinancingPlanInstallmentCellView *)self _isInstallmentPaid];
  installment = self->_installment;
  if (v3) {
    [(PKPayLaterInstallment *)installment totalAmount];
  }
  else {
  v5 = [(PKPayLaterInstallment *)installment currentBalance];
  }
  v6 = [v5 formattedStringValue];

  return v6;
}

- (void)_updateTertiaryLabel
{
  id v33 = [(PKPayLaterInstallment *)self->_installment dueDate];
  calendar = self->_calendar;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  v5 = PKDateIgnoringTime();
  v6 = PKDateIgnoringTime();
  v7 = [(NSCalendar *)calendar components:16 fromDate:v5 toDate:v6 options:0];

  unint64_t v8 = [v7 day];
  uint64_t v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  int v11 = [v10 autoPayment];

  if ([(PKPayLaterInstallment *)self->_installment status] == 4)
  {
    double v12 = PKLocalizedCocoonString(&cfstr_InstallmentPay_46.isa);
    uint64_t v13 = [MEMORY[0x1E4FB1618] redColor];

    uint64_t v9 = (void *)v13;
    if (!v12) {
      goto LABEL_20;
    }
LABEL_19:
    double v23 = objc_alloc_init(PKIconTextLabel);
    tertiaryLabel = self->_tertiaryLabel;
    self->_tertiaryLabel = v23;

    uint64_t v25 = self->_tertiaryLabel;
    double v26 = NSString;
    double v27 = [NSNumber numberWithInteger:self->_rowIndex];
    double v28 = [v26 stringWithFormat:@"PKPayLaterFinancingPlanInstallmentCellView.tertiaryLabel.%@", v27];
    [(PKIconTextLabel *)v25 setAccessibilityIdentifier:v28];

    v29 = self->_tertiaryLabel;
    CGPoint v30 = objc_msgSend(v12, "pk_attributedString");
    [(PKIconTextLabel *)v29 setText:v30];

    [(PKIconTextLabel *)self->_tertiaryLabel setIcon:0];
    CGSize v31 = self->_tertiaryLabel;
    CGFloat v32 = [(PKPayLaterFinancingPlanInstallmentCellView *)self _tertiaryFont];
    [(PKIconTextLabel *)v31 setTextFont:v32];

    [(PKIconTextLabel *)self->_tertiaryLabel setTextColor:v9];
    [(PKPayLaterFinancingPlanInstallmentCellView *)self addSubview:self->_tertiaryLabel];

    goto LABEL_20;
  }
  if ([(PKPayLaterFinancingPlanInstallmentCellView *)self _isInstallmentPaid])
  {
    id v14 = [(PKPayLaterInstallment *)self->_installment payoffDate];
    if (!v14) {
      goto LABEL_11;
    }
    double v15 = [(PKPayLaterInstallment *)self->_installment dueDate];
    double v16 = PKDateIgnoringTime();
    double v17 = PKDateIgnoringTime();
    uint64_t v18 = [v16 compare:v17];

    if (v18)
    {
      uint64_t v19 = +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter];
      double v20 = [v19 stringFromDate:v14];
      double v12 = PKLocalizedCocoonString(&cfstr_InstallmentPai.isa, &stru_1EF1B4C70.isa, v20);
    }
    else
    {
LABEL_11:
      double v12 = PKLocalizedCocoonString(&cfstr_InstallmentPai_0.isa);
    }
    uint64_t v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];

    uint64_t v9 = (void *)v21;
    if (v12) {
      goto LABEL_19;
    }
  }
  else
  {
    if (v8 > 0x1E)
    {
      if (!v11) {
        goto LABEL_20;
      }
      uint64_t v22 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
    }
    else
    {
      if (v11) {
        PKLocalizedCocoonString(&cfstr_InstallmentDue_0.isa, &cfstr_Lu.isa, v8);
      }
      else {
      uint64_t v22 = PKLocalizedCocoonString(&cfstr_InstallmentDue_1.isa, &cfstr_Lu.isa, v8);
      }
    }
    double v12 = (void *)v22;
    if (v22) {
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (id)_tertiaryFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
}

- (BOOL)_isInstallmentPaid
{
  return [(PKPayLaterInstallment *)self->_installment status] == 3;
}

+ (id)_numberFormatter
{
  if (qword_1E94F5750 != -1) {
    dispatch_once(&qword_1E94F5750, &__block_literal_global_73);
  }
  v2 = (void *)_MergedGlobals_5_2;

  return v2;
}

uint64_t __62__PKPayLaterFinancingPlanInstallmentCellView__numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_5_2;
  _MergedGlobals_5_2 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_5_2;

  return [v2 setNumberStyle:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_installment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end