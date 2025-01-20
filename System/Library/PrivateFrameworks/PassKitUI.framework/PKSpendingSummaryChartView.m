@interface PKSpendingSummaryChartView
- (BOOL)isBlurDisabled;
- (BOOL)isVisible;
- (BOOL)prioritizeLegendPlacement;
- (BOOL)showLegendGraph;
- (BOOL)showLegendLabels;
- (BOOL)showPlaceholders;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKSpendingSummaryChartView)initWithFrame:(CGRect)a3;
- (void)_configureBarView:(id)a3 smallContext:(BOOL)a4;
- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setPrioritizeLegendPlacement:(BOOL)a3;
- (void)setPrioritizeLegendPlacementUI:(BOOL)a3;
- (void)setShowLegendGraph:(BOOL)a3;
- (void)setShowLegendLabels:(BOOL)a3;
- (void)setShowPlaceholders:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation PKSpendingSummaryChartView

- (PKSpendingSummaryChartView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PKSpendingSummaryChartView;
  v3 = -[PKSpendingSummaryChartView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)*MEMORY[0x1E4FB28E0];
    v5 = (NSString *)*MEMORY[0x1E4FB27D0];
    uint64_t v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB27D0]);
    fontForLabels = v3->_fontForLabels;
    v3->_fontForLabels = (UIFont *)v6;

    uint64_t v8 = PKFontForDefaultDesign(v4, v5);
    fontForValues = v3->_fontForValues;
    v3->_fontForValues = (UIFont *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    legendLabels = v3->_legendLabels;
    v3->_legendLabels = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bars = v3->_bars;
    v3->_bars = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    horizontalAxis = v3->_horizontalAxis;
    v3->_horizontalAxis = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    valueLabels = v3->_valueLabels;
    v3->_valueLabels = v16;

    uint64_t v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v18;

    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
  }
  return v3;
}

- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4
{
  id v69 = a3;
  objc_storeStrong((id *)&self->_summary, a3);
  self->_double chartMaxAmount = 0.0;
  self->_double groupsMaxAmount = 0.0;
  self->_presentationStyle = a4;
  v7 = [v69 totalSpending];
  v67 = [v7 currency];

  uint64_t v8 = [v69 summaryType];
  switch(v8)
  {
    case 2:
      id v65 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v65 setLocalizedDateFormatFromTemplate:@"MMM"];
      id v64 = 0;
LABEL_10:
      uint64_t v11 = 4;
LABEL_11:
      objc_msgSend(v69, "spendingsPerCalendarUnit", v11);
      goto LABEL_13;
    case 1:
      id v64 = objc_alloc_init(MEMORY[0x1E4F28C20]);
      [v64 setDateTemplate:@"d"];
      id v65 = 0;
      goto LABEL_10;
    case 0:
      id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      id v65 = v9;
      if (self->_isCompactUI || self->_prioritizeLegendPlacement) {
        v10 = @"EEEEE";
      }
      else {
        v10 = @"EEE";
      }
      [v9 setLocalizedDateFormatFromTemplate:v10];
      id v64 = 0;
      uint64_t v11 = 3;
      goto LABEL_11;
  }
  id v64 = 0;
  id v65 = 0;
  objc_msgSend(v69, "spendingsPerCalendarUnit", 0);
  v12 = LABEL_13:;
  v68 = v12;
  if ([v12 count])
  {
    unint64_t v13 = 0;
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v18 = [v12 objectAtIndex:v13];
      if ([(NSMutableArray *)self->_legendLabels count] <= v13
        || ([(NSMutableArray *)self->_legendLabels objectAtIndex:v13],
            (v19 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
        [v19 setNumberOfLines:1];
        [v19 setAdjustsFontSizeToFitWidth:1];
        v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v19 setTextColor:v20];

        [(NSMutableArray *)self->_legendLabels addObject:v19];
        [(PKSpendingSummaryChartView *)self addSubview:v19];
      }
      [v19 setFont:self->_fontForLabels];
      [v19 setHidden:0];
      objc_super v21 = [v18 startDate];
      uint64_t v22 = [v69 summaryType];
      if (!v22 || v22 == 2)
      {
        v26 = [v65 stringFromDate:v21];
        v27 = objc_msgSend(v26, "pk_uppercaseFirstStringForPreferredLocale");
        [v19 setText:v27];
      }
      else
      {
        if (v22 != 1) {
          goto LABEL_27;
        }
        BOOL isCompactUI = self->_isCompactUI;
        v24 = v21;
        if (!self->_isCompactUI)
        {
          uint64_t v66 = [v18 endDate];
          v24 = (void *)v66;
        }
        v25 = [v64 stringFromDate:v21 toDate:v24];
        [v19 setText:v25];

        v26 = (void *)v66;
        if (isCompactUI) {
          goto LABEL_27;
        }
      }

LABEL_27:
      if ([(NSMutableArray *)self->_bars count] <= v13
        || ([(NSMutableArray *)self->_bars objectAtIndex:v13],
            (v28 = (PKSegmentedBarView *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v28 = -[PKSegmentedBarView initWithFrame:]([PKSegmentedBarView alloc], "initWithFrame:", v14, v15, v16, v17);
        [(PKSpendingSummaryChartView *)self _configureBarView:v28 smallContext:self->_showPlaceholders];
        [(PKSegmentedBarView *)v28 setShowPlaceholder:self->_showPlaceholders];
        [(PKSegmentedBarView *)v28 setBlurDisabled:self->_blurDisabled];
        [(NSMutableArray *)self->_bars addObject:v28];
        [(PKSpendingSummaryChartView *)self addSubview:v28];
      }
      [(PKSegmentedBarView *)v28 setHidden:0];
      v29 = [v18 totalSpending];
      v30 = [v29 amount];
      [v30 floatValue];
      double v32 = v31;

      if (self->_groupsMaxAmount < v32) {
        self->_double groupsMaxAmount = v32;
      }

      ++v13;
      v12 = v68;
    }
    while (v13 < [v68 count]);
  }
  double groupsMaxAmount = self->_groupsMaxAmount;
  if (groupsMaxAmount > 0.0)
  {
    float v34 = groupsMaxAmount;
    self->_double chartMaxAmount = (double)(10 * ((uint64_t)(llroundf(v34) + 10) / 10));
LABEL_37:
    unint64_t v39 = v63;
    goto LABEL_38;
  }
  v35 = [v69 previousMaxAmount];

  if (v35)
  {
    v36 = [v69 previousMaxAmount];
    v37 = [v36 amount];
    [v37 floatValue];
    self->_double chartMaxAmount = (double)(10 * ((uint64_t)(llroundf(v38) + 10) / 10));

    goto LABEL_37;
  }
  char v62 = [v69 isLoading];
  unint64_t v39 = v63;
  if ((v62 & 1) == 0) {
    self->_double chartMaxAmount = 10.0;
  }
LABEL_38:
  unint64_t v40 = 0;
  double chartMaxAmount = self->_chartMaxAmount;
  if (chartMaxAmount <= 50.0) {
    unint64_t v42 = 3;
  }
  else {
    unint64_t v42 = v39;
  }
  self->_axisCount = 2 * v42 - 1;
  double v43 = chartMaxAmount / (double)(v42 - 1);
  double v44 = *MEMORY[0x1E4F1DB28];
  double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v48 = 0.0;
  do
  {
    if ([(NSMutableArray *)self->_horizontalAxis count] <= v40
      || ([(NSMutableArray *)self->_horizontalAxis objectAtIndex:v40],
          (v49 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v44, v45, v46, v47);
      [(NSMutableArray *)self->_horizontalAxis addObject:v49];
      [(PKSpendingSummaryChartView *)self addSubview:v49];
    }
    [v49 setHidden:0];
    if (v40)
    {
      v51 = [MEMORY[0x1E4FB1618] systemGray5Color];
      [v49 setBackgroundColor:v51];
    }
    else
    {
      v50 = [MEMORY[0x1E4FB1618] systemGray3Color];
      [v49 setBackgroundColor:v50];

      if ([(NSMutableArray *)self->_valueLabels count] <= v40 >> 1
        || ([(NSMutableArray *)self->_valueLabels objectAtIndex:v40 >> 1],
            (v51 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v44, v45, v46, v47);
        [v51 setNumberOfLines:1];
        [v51 setAdjustsFontSizeToFitWidth:1];
        [v51 setMinimumScaleFactor:0.5];
        [v51 setBaselineAdjustment:1];
        [v51 setFont:self->_fontForValues];
        v52 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v51 setTextColor:v52];

        [(NSMutableArray *)self->_valueLabels addObject:v51];
        [(PKSpendingSummaryChartView *)self addSubview:v51];
      }
      [v51 setHidden:self->_chartMaxAmount <= 0.0];
      if (v67)
      {
        v53 = (NSDecimalNumber *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithDouble:round(v48)];
        v54 = PKCurrencyAmountCreate(v53, v67);
        v55 = [v54 minimalFormattedStringValue];
        [v51 setText:v55];
      }
      else
      {
        [v51 setText:0];
      }
      if ((v40 >> 1) + 2 == v42) {
        double v48 = self->_chartMaxAmount;
      }
      else {
        double v48 = v43 + v48;
      }
    }

    ++v40;
  }
  while (v40 < self->_axisCount);
  for (unint64_t i = [v68 count]; i < -[NSMutableArray count](self->_legendLabels, "count"); ++i)
  {
    v57 = [(NSMutableArray *)self->_legendLabels objectAtIndex:i];
    [v57 setHidden:1];

    v58 = [(NSMutableArray *)self->_bars objectAtIndex:i];
    [v58 setHidden:1];
  }
  for (unint64_t j = self->_axisCount; j < [(NSMutableArray *)self->_horizontalAxis count]; ++j)
  {
    v60 = [(NSMutableArray *)self->_horizontalAxis objectAtIndex:j];
    [v60 setHidden:1];
  }
  while (v42 < [(NSMutableArray *)self->_valueLabels count])
  {
    v61 = [(NSMutableArray *)self->_valueLabels objectAtIndex:v42];
    [v61 setHidden:1];

    ++v42;
  }
  [(PKSpendingSummaryChartView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v72.receiver = self;
  v72.super_class = (Class)PKSpendingSummaryChartView;
  [(PKSpendingSummaryChartView *)&v72 layoutSubviews];
  [(PKSpendingSummaryChartView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.double x = v7;
  remainder.origin.CGFloat y = v8;
  remainder.size.double width = v3;
  remainder.size.double height = v5;
  uint64_t v9 = MEMORY[0x1E4F1DB28];
  if (self->_showLegendGraph)
  {
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &slice, &remainder, v10, CGRectMaxXEdge);
    double x = slice.origin.x;
    double width = slice.size.width;
    if (self->_isCompactUI) {
      double v11 = 2.0;
    }
    else {
      double v11 = 7.0;
    }
    CGRectDivide(remainder, &slice, &remainder, v11, CGRectMaxXEdge);
    if (self->_showLegendGraph) {
      CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
    }
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB28];
    double width = 0.0;
  }
  if (self->_showLegendLabels)
  {
    v12 = [(NSMutableArray *)self->_legendLabels firstObject];
    objc_msgSend(v12, "sizeThatFits:", v4, v6);
    CGFloat v14 = v13;

    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMaxYEdge);
    double height = slice.size.height;
    double v60 = slice.size.width;
    CGRectDivide(remainder, &slice, &remainder, 7.0, CGRectMaxYEdge);
  }
  else
  {
    double height = *(double *)(v9 + 24);
    double v60 = *(double *)(v9 + 16);
  }
  double v15 = remainder.size.height;
  double v61 = remainder.size.width;
  double v62 = remainder.origin.x;
  CGFloat y = remainder.origin.y;
  CGRectGetMaxY(remainder);
  uint64_t v57 = [(PKSpendingSummary *)self->_summary summaryType];
  id v64 = [(PKSpendingSummary *)self->_summary spendingsPerCalendarUnit];
  double v16 = (char *)[v64 count];
  if (self->_prioritizeLegendPlacement && self->_showLegendLabels)
  {
    double v17 = [(NSMutableArray *)self->_legendLabels firstObject];
    objc_msgSend(v17, "sizeThatFits:", v60, height);

    uint64_t v18 = [(NSMutableArray *)self->_legendLabels lastObject];
    objc_msgSend(v18, "sizeThatFits:", v60, height);
  }
  if (self->_showLegendGraph) {
    double v19 = 5.0;
  }
  else {
    double v19 = 0.0;
  }
  PKFloatRoundToPixel();
  double v21 = v20;
  PKFloatRoundToPixel();
  double v23 = v22;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v69[3] = 0;
  objc_initWeak(&location, self);
  unint64_t presentationStyle = self->_presentationStyle;
  uint64_t v56 = [(PKSpendingSummary *)self->_summary summaryType];
  if (v16)
  {
    v25 = 0;
    double v26 = v21 / (double)(unint64_t)(v16 - 1);
    double v27 = v23 + v19;
    uint64_t v28 = (presentationStyle < 4) & (0xCu >> (presentationStyle & 0xF));
    BOOL v63 = presentationStyle == 1;
    do
    {
      if (self->_showLegendLabels)
      {
        v29 = [(NSMutableArray *)self->_legendLabels objectAtIndex:v25];
        objc_msgSend(v29, "sizeThatFits:", v60, height);
        PKFloatRoundToPixel();
        objc_msgSend(v29, "setFrame:");
        BOOL v30 = v25 & 1;
        if ((v25 & 1) != 0 && v57 != 2) {
          BOOL v30 = self->_prioritizeLegendPlacement && v56 == 1;
        }
        [v29 setHidden:v30];
      }
      double v32 = [v64 objectAtIndex:v25];
      v33 = [[PKSpendingSummaryChartBarConfiguration alloc] initWithSummary:v32];
      float v34 = [(NSMutableArray *)self->_bars objectAtIndex:v25];
      double v35 = 0.0;
      if (self->_chartMaxAmount > 0.0)
      {
        [(PKSpendingSummaryChartBarConfiguration *)v33 totalValue];
        if (v36 > 0.0)
        {
          PKFloatRoundToPixel();
          double v35 = v37;
        }
        [v34 minimumLength];
        double v35 = fmax(fmin(v35, v15), v38);
      }
      PKFloatRoundToPixel();
      objc_msgSend(v34, "setFrame:");
      unint64_t v39 = [v34 layer];
      [v39 setOpacity:0.0];

      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke;
      v65[3] = &unk_1E59DCAC0;
      objc_copyWeak(v66, &location);
      v66[1] = v16;
      BOOL v67 = v63;
      v65[4] = self;
      v65[5] = v69;
      [v34 configureWithBarConfiguration:v33 axis:1 maximumLength:v28 barLength:v65 synchronous:v15 completion:v35];
      [(PKSpendingSummaryChartView *)self bringSubviewToFront:v34];
      double v27 = v26 + v27;
      objc_destroyWeak(v66);

      ++v25;
    }
    while (v16 != v25);
  }
  PKFloatRoundToPixel();
  double v41 = v40;
  double v42 = PKUIPixelLength();
  if (self->_showLegendGraph && self->_axisCount)
  {
    double v43 = v42;
    unint64_t v44 = 0;
    double v45 = v54 + v15;
    do
    {
      double v46 = [(NSMutableArray *)self->_horizontalAxis objectAtIndex:v44];
      objc_msgSend(v46, "setFrame:", v62, v45 - v43, v61, v43);
      if ((v44 & 1) == 0 && self->_chartMaxAmount > 0.0)
      {
        double v47 = [(NSMutableArray *)self->_valueLabels objectAtIndex:v44 >> 1];
        objc_msgSend(v47, "sizeThatFits:", width, 1.79769313e308);
        double v49 = v48;
        double v51 = v50;
        PKFloatRoundToPixel();
        objc_msgSend(v47, "setFrame:", x + 2.0, v52, fmin(width, v49), v51);
      }
      double v45 = v45 - v41;

      ++v44;
    }
    while (v44 < self->_axisCount);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v69, 8);
}

void __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(void *)(a1 + 56))
    {
      if (*(unsigned char *)(a1 + 64) && *(unsigned char *)(*(void *)(a1 + 32) + 510)) {
        CGFloat v3 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
      }
      else {
        CGFloat v3 = 0;
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke_2;
      v11[3] = &unk_1E59D2EB0;
      v11[4] = *(void *)(a1 + 32);
      [v3 setAnimationDelayHandler:v11];
      if (*(void *)(a1 + 56))
      {
        unint64_t v4 = 0;
        do
        {
          CGFloat v5 = [WeakRetained[54] objectAtIndex:v4];
          double v6 = [v5 layer];
          [v6 opacity];
          if (*(float *)&v7 != 1.0)
          {
            float v8 = *(float *)&v7;
            LODWORD(v7) = 1.0;
            [v6 setOpacity:v7];
            if (v3)
            {
              uint64_t v9 = [v3 springAnimationForView:v5 withKeyPath:@"opacity"];
              objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, 1.0);
              id v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);
            }
          }

          ++v4;
        }
        while (v4 < *(void *)(a1 + 56));
      }
    }
  }
}

double __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  PKFloatRoundToPixel();
  double v5 = v4;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setShowLegendLabels:(BOOL)a3
{
  if (((!self->_showLegendLabels ^ a3) & 1) == 0)
  {
    self->_showLegendLabels = a3;
    [(PKSpendingSummaryChartView *)self setNeedsLayout];
  }
}

- (void)setShowLegendGraph:(BOOL)a3
{
  if (((!self->_showLegendGraph ^ a3) & 1) == 0)
  {
    self->_showLegendGraph = a3;
    [(PKSpendingSummaryChartView *)self setNeedsLayout];
  }
}

- (void)setShowPlaceholders:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showPlaceholders ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_showPlaceholders = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = self->_bars;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[PKSpendingSummaryChartView _configureBarView:smallContext:](self, "_configureBarView:smallContext:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(PKSpendingSummaryChartView *)self setNeedsLayout];
  }
}

- (void)setPrioritizeLegendPlacementUI:(BOOL)a3
{
  if (((!self->_prioritizeLegendPlacement ^ a3) & 1) == 0)
  {
    self->_prioritizeLegendPlacement = a3;
    [(PKSpendingSummaryChartView *)self setNeedsLayout];
  }
}

- (void)setBlurDisabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_blurDisabled ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_blurDisabled = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = self->_bars;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setBlurDisabled:", v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(PKSpendingSummaryChartView *)self setNeedsLayout];
  }
}

- (void)_configureBarView:(id)a3 smallContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 setShowPlaceholder:v4];
  [v5 setUseSmallCornerRadius:v4];
  [v5 setRoundBaselineCorners:v4];
}

- (BOOL)showLegendGraph
{
  return self->_showLegendGraph;
}

- (BOOL)showPlaceholders
{
  return self->_showPlaceholders;
}

- (BOOL)showLegendLabels
{
  return self->_showLegendLabels;
}

- (BOOL)prioritizeLegendPlacement
{
  return self->_prioritizeLegendPlacement;
}

- (void)setPrioritizeLegendPlacement:(BOOL)a3
{
  self->_prioritizeLegendPlacement = a3;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_fontForValues, 0);
  objc_storeStrong((id *)&self->_fontForLabels, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_horizontalAxis, 0);
  objc_storeStrong((id *)&self->_legendLabels, 0);

  objc_storeStrong((id *)&self->_valueLabels, 0);
}

@end