@interface PKPayLaterFinancingPlanCellView
- (BOOL)showSpinner;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPayLaterFinancingPlanCellView)initWithFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5;
- (void)layoutSubviews;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPayLaterFinancingPlanCellView

- (PKPayLaterFinancingPlanCellView)initWithFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5
{
  id v9 = a3;
  v106.receiver = self;
  v106.super_class = (Class)PKPayLaterFinancingPlanCellView;
  v10 = -[PKPayLaterFinancingPlanCellView initWithFrame:](&v106, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    p_financingPlan = (id *)&v10->_financingPlan;
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    v11->_context = a4;
    v11->_rowIndex = a5;
    v13 = [*p_financingPlan planSummary];
    v14 = [v13 currentBalance];
    v15 = [*p_financingPlan merchant];
    uint64_t v16 = [v15 displayName];

    [v13 progress];
    double v18 = v17;
    if (qword_1E94F5C28 != -1) {
      dispatch_once(&qword_1E94F5C28, &__block_literal_global_252);
    }
    v105 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v102 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v19 = [v9 planSummary];
    v20 = [v19 totalAmount];

    v100 = v13;
    v104 = (void *)v16;
    unint64_t v98 = a4;
    if (a4)
    {
      v21 = 0;
      v22 = 0;
    }
    else
    {
      uint64_t v23 = [*p_financingPlan state];
      v21 = 0;
      v22 = 0;
      switch(v23)
      {
        case 1:
          v24 = [v14 formattedStringValue];
          uint64_t v25 = PKLocalizedCocoonString(&cfstr_FinancingPlanT.isa, &stru_1EF1B4C70.isa, v24);
          goto LABEL_17;
        case 2:
        case 3:
          v22 = PKLocalizedCocoonString(&cfstr_InstallmentPen.isa);
          if (v20)
          {
            v24 = [v20 formattedStringValue];
            uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentTot_0.isa, &stru_1EF1B4C70.isa, v24);
LABEL_28:

            v21 = v22;
            v22 = (void *)v25;
          }
          else
          {
            v21 = 0;
          }
          break;
        case 4:
          uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentPay_46.isa);
          [MEMORY[0x1E4FB1618] redColor];
          v22 = 0;
          v105 = v24 = v105;
          goto LABEL_28;
        case 5:
          if (v20)
          {
            v26 = [v20 formattedStringValue];
            uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentTot_0.isa, &stru_1EF1B4C70.isa, v26);
          }
          else
          {
            uint64_t v25 = 0;
          }
          v33 = [*p_financingPlan planSummary];
          v24 = [v33 cancellationDate];

          if (v24)
          {
            v34 = [(id)_MergedGlobals_5_8 stringFromDate:v24];
            v22 = PKLocalizedCocoonString(&cfstr_InstallmentCan.isa, &stru_1EF1B4C70.isa, v34);
          }
          else
          {
            v22 = PKLocalizedCocoonString(&cfstr_InstallmentCan_0.isa);
          }
          goto LABEL_28;
        case 6:
          v27 = [*p_financingPlan scheduleSummary];
          v24 = [v27 lastPayment];

          v28 = [v24 postedDate];
          if (v28)
          {
            v29 = [(id)_MergedGlobals_5_8 stringFromDate:v28];
            uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentPai.isa, &stru_1EF1B4C70.isa, v29);
          }
          else
          {
            uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentPai_0.isa);
          }
          if (v20)
          {
            v35 = [v20 formattedStringValue];
            v22 = PKLocalizedCocoonString(&cfstr_InstallmentTot_0.isa, &stru_1EF1B4C70.isa, v35);
          }
          else
          {
            v22 = 0;
          }

          goto LABEL_28;
        case 8:
          v30 = [v9 planSummary];
          v24 = [v30 totalAmount];

          uint64_t v25 = PKLocalizedCocoonString(&cfstr_InstallmentPen_0.isa);
          if (v24)
          {
            v31 = [v24 formattedStringValue];
            uint64_t v32 = PKLocalizedCocoonString(&cfstr_InstallmentTot_0.isa, &stru_1EF1B4C70.isa, v31);

            v22 = (void *)v25;
            uint64_t v25 = v32;
          }
          else
          {
LABEL_17:
            v22 = 0;
          }
          goto LABEL_28;
        default:
          break;
      }
    }
    v103 = v21;
    v99 = v14;
    id v101 = v9;
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v11->_primaryLabel;
    v11->_primaryLabel = v36;

    v38 = v11->_primaryLabel;
    v39 = NSString;
    v40 = [NSNumber numberWithInteger:v11->_rowIndex];
    v41 = [v39 stringWithFormat:@"PKPayLaterFinancingPlanCellView.primaryLabel.%@", v40];
    [(UILabel *)v38 setAccessibilityIdentifier:v41];

    [(UILabel *)v11->_primaryLabel setNumberOfLines:0];
    v42 = v11->_primaryLabel;
    v43 = (NSString *)*MEMORY[0x1E4FB2790];
    v44 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 32770, 0);
    [(UILabel *)v42 setFont:v44];

    v45 = v11->_primaryLabel;
    v46 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v45 setTextColor:v46];

    [(UILabel *)v11->_primaryLabel setText:v104];
    [(PKPayLaterFinancingPlanCellView *)v11 addSubview:v11->_primaryLabel];
    v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v11->_secondaryLabel;
    v11->_secondaryLabel = v47;

    v49 = v11->_secondaryLabel;
    v50 = NSString;
    v51 = [NSNumber numberWithInteger:v11->_rowIndex];
    v52 = [v50 stringWithFormat:@"PKPayLaterFinancingPlanCellView.secondaryLabel.%@", v51];
    [(UILabel *)v49 setAccessibilityIdentifier:v52];

    [(UILabel *)v11->_secondaryLabel setNumberOfLines:0];
    v53 = v11->_secondaryLabel;
    v97 = (NSString *)*MEMORY[0x1E4FB28F0];
    v54 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], v43);
    [(UILabel *)v53 setFont:v54];

    [(UILabel *)v11->_secondaryLabel setTextColor:v105];
    [(UILabel *)v11->_secondaryLabel setText:v22];
    [(PKPayLaterFinancingPlanCellView *)v11 addSubview:v11->_secondaryLabel];
    id v55 = objc_alloc(MEMORY[0x1E4FB1838]);
    v56 = PKUIChevronImage();
    uint64_t v57 = [v55 initWithImage:v56];
    disclosureView = v11->_disclosureView;
    v11->_disclosureView = (UIImageView *)v57;

    v59 = v11->_disclosureView;
    v60 = NSString;
    v61 = [NSNumber numberWithInteger:v11->_rowIndex];
    v62 = [v60 stringWithFormat:@"PKPayLaterFinancingPlanCellView.disclosureView.%@", v61];
    [(UIImageView *)v59 setAccessibilityIdentifier:v62];

    v63 = v11->_disclosureView;
    v64 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v63 setTintColor:v64];

    [(PKPayLaterFinancingPlanCellView *)v11 addSubview:v11->_disclosureView];
    [(UIImageView *)v11->_disclosureView setHidden:0];
    uint64_t v65 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v11->_spinner;
    v11->_spinner = (UIActivityIndicatorView *)v65;

    v67 = v11->_spinner;
    v68 = NSString;
    v69 = [NSNumber numberWithInteger:v11->_rowIndex];
    v70 = [v68 stringWithFormat:@"PKPayLaterFinancingPlanCellView.spinner.%@", v69];
    [(UIActivityIndicatorView *)v67 setAccessibilityIdentifier:v70];

    [(UIActivityIndicatorView *)v11->_spinner startAnimating];
    [(PKPayLaterFinancingPlanCellView *)v11 addSubview:v11->_spinner];
    [(UIActivityIndicatorView *)v11->_spinner setHidden:1];
    if (v98) {
      goto LABEL_36;
    }
    unint64_t v71 = [(PKPayLaterFinancingPlan *)v11->_financingPlan state];
    if (v71 > 8) {
      goto LABEL_36;
    }
    if (((1 << v71) & 0x1ED) != 0)
    {
      if (![v103 length])
      {
LABEL_36:
        id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v92 = [(UILabel *)v11->_primaryLabel text];
        [v91 safelyAddObject:v92];

        v93 = [(UILabel *)v11->_secondaryLabel text];
        [v91 safelyAddObject:v93];

        v94 = [(UILabel *)v11->_tertiaryLabel text];
        [v91 safelyAddObject:v94];

        v95 = [v91 componentsJoinedByString:@","];
        [(PKPayLaterFinancingPlanCellView *)v11 setAccessibilityLabel:v95];
        [(PKPayLaterFinancingPlanCellView *)v11 setIsAccessibilityElement:1];

        id v9 = v101;
        goto LABEL_37;
      }
      v72 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      p_tertiaryLabel = &v11->_tertiaryLabel;
      tertiaryLabel = v11->_tertiaryLabel;
      v11->_tertiaryLabel = v72;

      v75 = v11->_tertiaryLabel;
      v76 = NSString;
      v77 = [NSNumber numberWithInteger:v11->_rowIndex];
      v78 = [v76 stringWithFormat:@"PKPayLaterFinancingPlanCellView.tertiaryLabel.%@", v77];
      [(UILabel *)v75 setAccessibilityIdentifier:v78];

      [(UILabel *)v11->_tertiaryLabel setNumberOfLines:0];
      v79 = v11->_tertiaryLabel;
      v80 = PKFontForDefaultDesign(v97, v43);
      [(UILabel *)v79 setFont:v80];

      [(UILabel *)v11->_tertiaryLabel setTextColor:v102];
      [(UILabel *)v11->_tertiaryLabel setText:v103];
    }
    else
    {
      v81 = objc_alloc_init(PKProgressBar);
      p_tertiaryLabel = &v11->_progressBar;
      progressBar = v11->_progressBar;
      v11->_progressBar = v81;

      v83 = v11->_progressBar;
      v84 = NSString;
      v85 = [NSNumber numberWithInteger:v11->_rowIndex];
      v86 = [v84 stringWithFormat:@"PKPayLaterFinancingPlanCellView.progressBar.%@", v85, v97, v43];
      [(PKProgressBar *)v83 setAccessibilityIdentifier:v86];

      v87 = v11->_progressBar;
      v88 = PKPayLaterUIProgressBarStartColor();
      [(PKProgressBar *)v87 setGradientStartColor:v88];

      v89 = v11->_progressBar;
      v90 = PKPayLaterUIProgressBarEndColor();
      [(PKProgressBar *)v89 setGradientEndColor:v90];

      [(PKProgressBar *)v11->_progressBar setProgress:v18];
    }
    [(PKPayLaterFinancingPlanCellView *)v11 addSubview:*p_tertiaryLabel];
    goto LABEL_36;
  }
LABEL_37:

  return v11;
}

uint64_t __74__PKPayLaterFinancingPlanCellView_initWithFinancingPlan_context_rowIndex___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_5_8;
  _MergedGlobals_5_8 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_5_8;
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  v4 = (void *)_MergedGlobals_5_8;

  return [v4 setLocalizedDateFormatFromTemplate:@"MMM d, yyyy"];
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    [(UIActivityIndicatorView *)self->_spinner setHidden:!a3];
    [(UIImageView *)self->_disclosureView setHidden:self->_showSpinner];
    [(PKPayLaterFinancingPlanCellView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanCellView;
  [(PKPayLaterFinancingPlanCellView *)&v3 layoutSubviews];
  [(PKPayLaterFinancingPlanCellView *)self bounds];
  -[PKPayLaterFinancingPlanCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterFinancingPlanCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
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
  if ([(PKPayLaterFinancingPlanCellView *)self _shouldReverseLayoutDirection])CGRectEdge v10 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v10 = CGRectMaxXEdge;
  primaryLabel = self->_primaryLabel;
  if (primaryLabel)
  {
    -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", width, 1.79769313e308);
    double v67 = v12;
    double v14 = v13;
  }
  else
  {
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v67 = *MEMORY[0x1E4F1DB30];
  }
  secondaryLabel = self->_secondaryLabel;
  if (secondaryLabel)
  {
    -[UILabel sizeThatFits:](secondaryLabel, "sizeThatFits:", width, 1.79769313e308);
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  tertiaryLabel = self->_tertiaryLabel;
  double v21 = width;
  if (tertiaryLabel)
  {
    -[UILabel sizeThatFits:](tertiaryLabel, "sizeThatFits:", width, 1.79769313e308);
    double v64 = v22;
  }
  else
  {
    double v64 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  disclosureView = self->_disclosureView;
  double v24 = v19;
  double v66 = v17;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", v21, 1.79769313e308);
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v26 = *MEMORY[0x1E4F1DB30];
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v29 = fmax(v14, v28);
  double v30 = v24 + v29;
  if (self->_progressBar)
  {
    if (v29 > 0.0) {
      double v30 = v30 + 5.0;
    }
    double v31 = v30 + 10.0;
    if (v24 > 0.0) {
      double v31 = v31 + 5.0;
    }
  }
  else
  {
    double v32 = -0.0;
    if (self->_tertiaryLabel) {
      double v32 = v64;
    }
    double v31 = v30 + v32;
  }
  double v65 = v31;
  memset(&v76, 0, sizeof(v76));
  CGSize v68 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v69 = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v68;
  if (v26 > 0.0)
  {
    v78.origin.CGFloat x = x;
    v78.origin.CGFloat y = y;
    v78.size.double width = v21;
    v78.size.CGFloat height = height;
    CGRectDivide(v78, &slice, &remainder, v26, v10);
    CGRectDivide(remainder, &v76, &remainder, 11.0, v10);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.CGFloat x = v33;
    slice.origin.CGFloat y = v34;
    slice.size.double width = v35;
    slice.size.CGFloat height = v36;
  }
  v73.origin = v69;
  v73.size = v68;
  if (v67 > 0.0)
  {
    CGRectDivide(remainder, &v73, &remainder, v29, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v73.origin.CGFloat x = v37;
    v73.origin.CGFloat y = v38;
    v73.size.double width = v39;
    v73.size.CGFloat height = v40;
    if (v26 > 0.0)
    {
      v41 = [(UILabel *)self->_primaryLabel font];
      [v41 ascender];
      [v41 capHeight];
      PKFloatRoundToPixel();
      slice.origin.CGFloat y = v42 + slice.origin.y;
    }
  }
  v72.origin = v69;
  v72.size = v68;
  v71.origin = v69;
  v71.size = v68;
  if (self->_progressBar)
  {
    CGFloat v43 = remainder.origin.x;
    CGFloat v44 = remainder.origin.y;
    CGFloat v45 = remainder.size.width;
    CGFloat v46 = remainder.size.height;
    if (v29 > 0.0)
    {
      CGRectDivide(*(CGRect *)&v43, &v76, &remainder, 5.0, CGRectMinYEdge);
      CGFloat v43 = remainder.origin.x;
      CGFloat v44 = remainder.origin.y;
      CGFloat v45 = remainder.size.width;
      CGFloat v46 = remainder.size.height;
    }
    double v47 = v65;
    double v48 = v66;
    CGFloat v49 = v24;
    CGRectDivide(*(CGRect *)&v43, &v72, &remainder, 10.0, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v72.origin.CGFloat x = v50;
    v72.origin.CGFloat y = v51;
    v72.size.double width = v52;
    v72.size.CGFloat height = v53;
    if (v24 > 0.0) {
      CGRectDivide(remainder, &v76, &remainder, 5.0, CGRectMinYEdge);
    }
  }
  else
  {
    double v47 = v65;
    double v48 = v66;
    CGFloat v49 = v24;
    if (self->_tertiaryLabel)
    {
      CGRectDivide(remainder, &v71, &remainder, v64, CGRectMinYEdge);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v71.origin.CGFloat x = v54;
      v71.origin.CGFloat y = v55;
      v71.size.double width = v56;
      v71.size.CGFloat height = v57;
    }
  }
  v70.origin = v69;
  v70.size = v68;
  if (v48 > 0.0)
  {
    CGRectDivide(remainder, &v70, &remainder, v49, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v70.origin.CGFloat x = v58;
    v70.origin.CGFloat y = v59;
    v70.size.double width = v60;
    v70.size.CGFloat height = v61;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v73.origin.x, v73.origin.y, v73.size.width, v73.size.height);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
    -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[PKProgressBar setFrame:](self->_progressBar, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v62 = v21;
  double v63 = v47;
  result.CGFloat height = v63;
  result.double width = v62;
  return result;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end