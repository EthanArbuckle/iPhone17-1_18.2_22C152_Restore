@interface PKSpendingSummaryView
- (BOOL)_needsLayoutWithSummary:(id)a3;
- (BOOL)isVisible;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKSpendingSummaryView)initWithFrame:(CGRect)a3;
- (id)_trendDescriptionForSummary:(id)a3;
- (void)_createSubviews;
- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setVisible:(BOOL)a3;
@end

@implementation PKSpendingSummaryView

- (PKSpendingSummaryView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSpendingSummaryView;
  v3 = -[PKSpendingSummaryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKSpendingSummaryView *)v3 _createSubviews];
    v5 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKSpendingSummaryView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)_createSubviews
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  totalAmount = self->_totalAmount;
  self->_totalAmount = v9;

  [(UILabel *)self->_totalAmount setNumberOfLines:1];
  [(UILabel *)self->_totalAmount setTextColor:v3];
  v11 = self->_totalAmount;
  v12 = (void *)*MEMORY[0x1E4FB27D0];
  v13 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27D0], 2, 0, *MEMORY[0x1E4FB09B8]);
  [(UILabel *)v11 setFont:v13];

  [(UILabel *)self->_totalAmount setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [(PKSpendingSummaryView *)self addSubview:self->_totalAmount];
  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  spendingLabel = self->_spendingLabel;
  self->_spendingLabel = v14;

  [(UILabel *)self->_spendingLabel setNumberOfLines:1];
  v16 = self->_spendingLabel;
  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v16 setTextColor:v17];

  v18 = self->_spendingLabel;
  v19 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], v12, 0x8000, 0);
  [(UILabel *)v18 setFont:v19];

  v20 = self->_spendingLabel;
  v21 = PKLocalizedFeatureString();
  [(UILabel *)v20 setText:v21];

  [(UILabel *)self->_spendingLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  [(PKSpendingSummaryView *)self addSubview:self->_spendingLabel];
  v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
  arrowImageView = self->_arrowImageView;
  self->_arrowImageView = v22;

  [(UIImageView *)self->_arrowImageView setContentMode:4];
  [(PKSpendingSummaryView *)self addSubview:self->_arrowImageView];
  v24 = (void *)MEMORY[0x1E4FB1830];
  v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)v12, *MEMORY[0x1E4FB09D8]);
  v26 = [v24 configurationWithFont:v25];

  v27 = (void *)MEMORY[0x1E4FB1830];
  v28 = [MEMORY[0x1E4FB1618] labelColor];
  v40[0] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v30 = [v27 configurationWithPaletteColors:v29];
  v31 = [v26 configurationByApplyingConfiguration:v30];

  v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.fill" withConfiguration:v31];
  upArrow = self->_upArrow;
  self->_upArrow = v32;

  v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle.fill" withConfiguration:v31];
  downArrow = self->_downArrow;
  self->_downArrow = v34;

  v36 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  trendDescriptionLabel = self->_trendDescriptionLabel;
  self->_trendDescriptionLabel = v36;

  [(UILabel *)self->_trendDescriptionLabel setNumberOfLines:0];
  [(PKSpendingSummaryView *)self addSubview:self->_trendDescriptionLabel];
  v38 = -[PKSpendingSummaryChartView initWithFrame:]([PKSpendingSummaryChartView alloc], "initWithFrame:", v5, v6, v7, v8);
  chartView = self->_chartView;
  self->_chartView = v38;

  [(PKSpendingSummaryChartView *)self->_chartView setShowLegendGraph:1];
  [(PKSpendingSummaryChartView *)self->_chartView setShowPlaceholders:0];
  [(PKSpendingSummaryChartView *)self->_chartView setShowLegendLabels:1];
  [(PKSpendingSummaryView *)self addSubview:self->_chartView];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryView;
  [(PKSpendingSummaryView *)&v3 layoutSubviews];
  [(PKSpendingSummaryView *)self bounds];
  [(PKSpendingSummaryView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKSpendingSummaryView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  double v5 = a3.origin.x + 12.0;
  double v6 = a3.origin.y + 13.0;
  double v7 = a3.size.height + -20.0;
  if ([(PKSpendingSummaryView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v8 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v8 = CGRectMinXEdge;
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v6;
  remainder.size.double width = width + -24.0;
  remainder.size.height = v7;
  -[UILabel sizeThatFits:](self->_spendingLabel, "sizeThatFits:", width + -24.0, v7);
  CGFloat v10 = v9;
  v32.origin.x = v5;
  v32.origin.y = v6;
  v32.size.double width = width + -24.0;
  v32.size.height = v7;
  CGRectDivide(v32, &slice, &remainder, v10, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    spendingLabel = self->_spendingLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](spendingLabel, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 0.0, CGRectMinYEdge);
  double v12 = v10 + 0.0;
  -[UILabel sizeThatFits:](self->_totalAmount, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v14 = v13;
  double v16 = v15;
  CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    totalAmount = self->_totalAmount;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](totalAmount, "setFrame:");
    if (([(UIImageView *)self->_arrowImageView isHidden] & 1) == 0)
    {
      memset(&v28, 0, sizeof(v28));
      memset(&v27, 0, sizeof(v27));
      CGRectDivide(slice, &v28, &v27, v14 + 8.0, v8);
      arrowImageView = self->_arrowImageView;
      [(UIImageView *)arrowImageView intrinsicContentSize];
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](arrowImageView, "setFrame:");
    }
  }
  double v19 = v12 + 13.0;
  if (([(UILabel *)self->_trendDescriptionLabel isHidden] & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
    -[UILabel sizeThatFits:](self->_trendDescriptionLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
    double v21 = v20;
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
    double v19 = v19 + v16 + 8.0 + v21;
    if (!self->_isTemplateLayout)
    {
      trendDescriptionLabel = self->_trendDescriptionLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trendDescriptionLabel, "setFrame:");
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
  -[PKSpendingSummaryChartView sizeThatFits:](self->_chartView, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  double v24 = v23;
  CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    -[PKSpendingSummaryChartView setFrame:](self->_chartView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKSpendingSummaryChartView setFrame:](self->_chartViewToFadeOut, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v25 = v19 + 8.0 + v24 + 7.0;
  double v26 = width;
  result.height = v25;
  result.double width = v26;
  return result;
}

- (BOOL)_needsLayoutWithSummary:(id)a3
{
  id v4 = a3;
  double v5 = [v4 startDate];
  double v6 = [(PKSpendingSummary *)self->_summary startDate];
  if (!PKEqualObjects()) {
    goto LABEL_6;
  }
  double v7 = [v4 totalSpending];
  CGRectEdge v8 = [(PKSpendingSummary *)self->_summary totalSpending];
  if (!PKEqualObjects()
    || (uint64_t v9 = [v4 summaryType], v9 != -[PKSpendingSummary summaryType](self->_summary, "summaryType"))
    || ([v4 isLoading] & 1) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v12 = [(PKSpendingSummary *)self->_summary isLoading];

  if (v12)
  {
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
LABEL_7:
  int v10 = PKEqualObjects() ^ 1;
LABEL_8:

  return v10;
}

- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4
{
  id v7 = a3;
  if ([(PKSpendingSummaryView *)self _needsLayoutWithSummary:v7])
  {
    if (a4 == 2)
    {
      objc_storeStrong((id *)&self->_chartViewToFadeOut, self->_chartView);
      CGRectEdge v8 = [PKSpendingSummaryChartView alloc];
      uint64_t v9 = -[PKSpendingSummaryChartView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      chartView = self->_chartView;
      self->_chartView = v9;

      [(PKSpendingSummaryChartView *)self->_chartView setShowLegendGraph:1];
      [(PKSpendingSummaryChartView *)self->_chartView setShowPlaceholders:0];
      [(PKSpendingSummaryChartView *)self->_chartView setShowLegendLabels:1];
      v11 = self->_chartView;
      [(PKSpendingSummaryChartView *)self->_chartViewToFadeOut frame];
      -[PKSpendingSummaryChartView setFrame:](v11, "setFrame:");
      [(PKSpendingSummaryView *)self insertSubview:self->_chartView belowSubview:self->_chartViewToFadeOut];
      char v12 = [(PKSpendingSummaryChartView *)self->_chartView layer];
      double v13 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 1.0);
      id v14 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v13);
      LODWORD(v15) = 1.0;
      [v12 setOpacity:v15];
      double v16 = [(PKSpendingSummaryChartView *)self->_chartViewToFadeOut layer];
      v17 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 1.0, 0.0);
      id v18 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v17);
      [v16 setOpacity:0.0];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __64__PKSpendingSummaryView_configureWithSummary_presentationStyle___block_invoke;
      v44[3] = &unk_1E59CB6D8;
      v44[4] = self;
      objc_msgSend(v17, "pkui_setCompletionHandler:", v44);
    }
    objc_storeStrong((id *)&self->_summary, a3);
    double v19 = [v7 totalSpending];

    if (!v19)
    {
      [(UILabel *)self->_totalAmount setText:@"-"];
      [(UIImageView *)self->_arrowImageView setHidden:1];
      [(UILabel *)self->_trendDescriptionLabel setHidden:1];
LABEL_21:
      [(PKSpendingSummaryChartView *)self->_chartView configureWithSummary:v7 presentationStyle:a4];
      [(PKSpendingSummaryView *)self setNeedsLayout];
      goto LABEL_22;
    }
    CGFloat v20 = [v7 totalSpending];
    totalAmount = self->_totalAmount;
    v22 = [v20 formattedStringValue];
    [(UILabel *)totalAmount setText:v22];

    CGFloat v23 = [v7 insights];
    [(UIImageView *)self->_arrowImageView setHidden:1];
    [(UILabel *)self->_trendDescriptionLabel setHidden:1];
    if (v23)
    {
      double v24 = [v23 overallSpendingTrend];
      double v25 = [v20 amount];
      char v26 = objc_msgSend(v25, "pk_isZeroNumber");

      if (v26)
      {
        trendDescriptionLabel = self->_trendDescriptionLabel;
        CGRect v28 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27D0], 0.0);
        [(UILabel *)trendDescriptionLabel setFont:v28];

        v29 = self->_trendDescriptionLabel;
        uint64_t v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else
      {
        unint64_t v37 = [v24 direction] - 2;
        if (v37 <= 3)
        {
          v38 = off_1E59CFD28[v37];
          [(UIImageView *)self->_arrowImageView setHidden:0];
          [(UIImageView *)self->_arrowImageView setImage:*(Class *)((char *)&self->super.super.super.isa + *v38)];
        }
        v39 = self->_trendDescriptionLabel;
        v40 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
        [(UILabel *)v39 setFont:v40];

        v29 = self->_trendDescriptionLabel;
        uint64_t v30 = [MEMORY[0x1E4FB1618] labelColor];
      }
      v41 = (void *)v30;
      [(UILabel *)v29 setTextColor:v30];

      [(UILabel *)self->_trendDescriptionLabel setHidden:0];
      v42 = self->_trendDescriptionLabel;
      CGRect v32 = [(PKSpendingSummaryView *)self _trendDescriptionForSummary:v7];
      [(UILabel *)v42 setText:v32];
      goto LABEL_20;
    }
    double v24 = [v20 amount];
    v31 = [v7 previousTotalSpending];
    CGRect v32 = [v31 amount];

    if (v32)
    {
      if (([v7 isCurrentPeriod] & 1) == 0)
      {
        v33 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v34 = [v24 compare:v33];

        if (v34 == 1)
        {
          uint64_t v35 = [v32 compare:v24];
          switch(v35)
          {
            case -1:
              v36 = &OBJC_IVAR___PKSpendingSummaryView__upArrow;
              goto LABEL_24;
            case 0:
              uint64_t v43 = 1;
              goto LABEL_26;
            case 1:
              v36 = &OBJC_IVAR___PKSpendingSummaryView__downArrow;
LABEL_24:
              [(UIImageView *)self->_arrowImageView setImage:*(Class *)((char *)&self->super.super.super.isa + *v36)];
              uint64_t v43 = 0;
LABEL_26:
              [(UIImageView *)self->_arrowImageView setHidden:v43];
              break;
          }
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:
}

void __64__PKSpendingSummaryView_configureWithSummary_presentationStyle___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 464);
  *(void *)(v2 + 464) = 0;
}

- (void)setVisible:(BOOL)a3
{
  if (((!self->_visible ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_visible = a3;
    -[PKSpendingSummaryChartView setVisible:](self->_chartView, "setVisible:");
    chartViewToFadeOut = self->_chartViewToFadeOut;
    [(PKSpendingSummaryChartView *)chartViewToFadeOut setVisible:v3];
  }
}

- (id)_trendDescriptionForSummary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 insights];
  double v5 = [v4 overallSpendingTrend];

  if (v5)
  {
    unint64_t v6 = [v3 summaryType];
    if (v6 > 2) {
      id v7 = 0;
    }
    else {
      id v7 = off_1E59CFD48[v6];
    }
    int v9 = [v3 isCurrentPeriod];
    switch([v5 direction])
    {
      case 0:
        id v7 = [(__CFString *)v7 stringByAppendingString:@"_THIS"];
        PKLocalizedFeatureString();
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CGRectEdge v8 = PKLocalizedFeatureString();
        goto LABEL_33;
      case 1:
      case 2:
      case 3:
        if (v9) {
          int v10 = @"_LAST";
        }
        else {
          int v10 = @"_PREVIOUS";
        }
        if (v9) {
          v11 = @"ACCOUNT_INSIGHT_TREND_STEADY_CURRENT_PERIOD";
        }
        else {
          v11 = @"ACCOUNT_INSIGHT_TREND_STEADY_PREVIOUS_PERIOD";
        }
        id v7 = [(__CFString *)v7 stringByAppendingString:v10];
        if ([v3 isFamilySummary])
        {
          v11 = [(__CFString *)v11 stringByAppendingString:@"_FAMILY"];
        }
        char v12 = PKLocalizedFeatureString();
        CGRectEdge v8 = PKLocalizedFeatureString();
        goto LABEL_32;
      case 4:
        BOOL v13 = v9 == 0;
        if (v9) {
          id v14 = @"_LAST";
        }
        else {
          id v14 = @"_PREVIOUS";
        }
        double v15 = @"ACCOUNT_INSIGHT_TREND_INCREASING_PREVIOUS_PERIOD";
        double v16 = @"ACCOUNT_INSIGHT_TREND_INCREASING_CURRENT_PERIOD";
        goto LABEL_26;
      case 5:
        BOOL v13 = v9 == 0;
        if (v9) {
          id v14 = @"_LAST";
        }
        else {
          id v14 = @"_PREVIOUS";
        }
        double v15 = @"ACCOUNT_INSIGHT_TREND_DECREASING_PREVIOUS_PERIOD";
        double v16 = @"ACCOUNT_INSIGHT_TREND_DECREASING_CURRENT_PERIOD";
LABEL_26:
        if (v13) {
          v11 = v15;
        }
        else {
          v11 = v16;
        }
        id v7 = [(__CFString *)v7 stringByAppendingString:v14];
        if ([v3 isFamilySummary])
        {
          v11 = [(__CFString *)v11 stringByAppendingString:@"_FAMILY"];
        }
        char v12 = PKLocalizedFeatureString();
        v17 = [v5 change];
        double v19 = [v17 formattedStringValue];
        CGRectEdge v8 = PKLocalizedFeatureString();

LABEL_32:
LABEL_33:

        break;
      default:
        CGRectEdge v8 = 0;
        break;
    }
  }
  else
  {
    CGRectEdge v8 = 0;
  }

  return v8;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_chartViewToFadeOut, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_trendDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_downArrow, 0);
  objc_storeStrong((id *)&self->_upArrow, 0);
  objc_storeStrong((id *)&self->_spendingLabel, 0);

  objc_storeStrong((id *)&self->_totalAmount, 0);
}

@end