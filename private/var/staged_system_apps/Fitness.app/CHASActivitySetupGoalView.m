@interface CHASActivitySetupGoalView
- (CGSize)intrinsicContentSize;
- (CHASActivitySetupGoalView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (CHASActivitySetupGoalViewConfiguration)configuration;
- (CHASActivitySetupGoalViewDelegate)delegate;
- (FIUIValueAdjustmentButtonController)buttonController;
- (HKQuantity)dailyGoal;
- (void)_fitGoalLabel;
- (void)_formatGoalLabel;
- (void)_updateGoalLabelWithGoal:(id)a3;
- (void)buttonControllerDidUpdate;
- (void)layoutSubviews;
- (void)setButtonController:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDailyGoal:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGoal:(id)a3;
@end

@implementation CHASActivitySetupGoalView

- (CHASActivitySetupGoalView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CHASActivitySetupGoalView;
  v11 = -[CHASActivitySetupGoalView initWithFrame:](&v44, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    v13 = (UILabel *)objc_alloc_init((Class)UILabel);
    goalLabel = v12->_goalLabel;
    v12->_goalLabel = v13;

    [(UILabel *)v12->_goalLabel setTextAlignment:1];
    v15 = +[UIColor whiteColor];
    [(UILabel *)v12->_goalLabel setTextColor:v15];

    v16 = v12->_goalLabel;
    v17 = +[UIFont systemFontOfSize:UIFontSystemFontDesignRounded weight:72.0 design:UIFontWeightSemibold];
    v18 = [v17 fu_monospacedFont];
    [(UILabel *)v16 setFont:v18];

    [(UILabel *)v12->_goalLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v12->_goalLabel setText:@"300"];
    v19 = (UILabel *)objc_alloc_init((Class)UILabel);
    unitLabel = v12->_unitLabel;
    v12->_unitLabel = v19;

    v21 = [v10 goalColor];
    [(UILabel *)v12->_unitLabel setTextColor:v21];

    [(UILabel *)v12->_unitLabel setTextAlignment:1];
    v40 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:2 options:1];
    v39 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", 0.0);
    -[UILabel setFont:](v12->_unitLabel, "setFont:");
    uint64_t v22 = +[UIImageSymbolConfiguration configurationWithPointSize:48.0];
    v23 = +[UIImage _systemImageNamed:@"minus.circle.fill" withConfiguration:v22];
    v24 = [v10 goalColor];
    v25 = [v23 imageWithTintColor:v24 renderingMode:1];

    uint64_t v26 = +[UIButton buttonWithType:0];
    minusButton = v12->_minusButton;
    v12->_minusButton = (UIButton *)v26;

    [(UIButton *)v12->_minusButton setImage:v25 forState:0];
    v38 = (void *)v22;
    v28 = +[UIImage _systemImageNamed:@"plus.circle.fill" withConfiguration:v22];
    v29 = [v10 goalColor];
    v30 = [v28 imageWithTintColor:v29 renderingMode:1];

    uint64_t v31 = +[UIButton buttonWithType:0];
    plusButton = v12->_plusButton;
    v12->_plusButton = (UIButton *)v31;

    [(UIButton *)v12->_plusButton setImage:v30 forState:0];
    [(CHASActivitySetupGoalView *)v12 addSubview:v12->_minusButton];
    [(CHASActivitySetupGoalView *)v12 addSubview:v12->_goalLabel];
    v33 = v12->_unitLabel;
    v34 = +[UIColor whiteColor];
    [(UILabel *)v33 setTextColor:v34];

    [(CHASActivitySetupGoalView *)v12 addSubview:v12->_unitLabel];
    [(CHASActivitySetupGoalView *)v12 addSubview:v12->_plusButton];
    v35 = (FIUIValueAdjustmentButtonController *)objc_alloc_init((Class)FIUIValueAdjustmentButtonController);
    buttonController = v12->_buttonController;
    v12->_buttonController = v35;

    [(FIUIValueAdjustmentButtonController *)v12->_buttonController setIncrementButton:v12->_plusButton decrementButton:v12->_minusButton];
    [v10 minimumValue];
    -[FIUIValueAdjustmentButtonController setMinValue:](v12->_buttonController, "setMinValue:");
    [v10 maximumValue];
    -[FIUIValueAdjustmentButtonController setMaxValue:](v12->_buttonController, "setMaxValue:");
    [v10 valueIncrement];
    -[FIUIValueAdjustmentButtonController setMinumumStepValueIncrement:](v12->_buttonController, "setMinumumStepValueIncrement:");
    [v10 valueIncrement];
    -[FIUIValueAdjustmentButtonController setValueStepIncremement:](v12->_buttonController, "setValueStepIncremement:");
    objc_initWeak(&location, v12);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10012C510;
    v41[3] = &unk_1008AB8D8;
    objc_copyWeak(&v42, &location);
    [(FIUIValueAdjustmentButtonController *)v12->_buttonController setValueUpdateHandler:v41];
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CHASActivitySetupGoalView;
  [(CHASActivitySetupGoalView *)&v14 layoutSubviews];
  [(CHASActivitySetupGoalView *)self bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  if (!CGRectIsEmpty(v15))
  {
    [(CHASActivitySetupGoalViewConfiguration *)self->_configuration unitTextYOffset];
    double v8 = v7;
    [(UIButton *)self->_minusButton sizeToFit];
    [(UIButton *)self->_plusButton sizeToFit];
    [(CHASActivitySetupGoalView *)self _fitGoalLabel];
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGFloat v9 = CGRectGetMaxX(v16) + -32.0;
    [(UIButton *)self->_plusButton frame];
    CGFloat v10 = v9 - CGRectGetWidth(v17) * 0.5;
    [(UILabel *)self->_goalLabel center];
    [(UIButton *)self->_plusButton setCenter:v10];
    [(UIButton *)self->_minusButton frame];
    CGFloat v11 = CGRectGetWidth(v18) * 0.5 + 32.0;
    [(UILabel *)self->_goalLabel center];
    [(UIButton *)self->_minusButton setCenter:v11];
    [(UIButton *)self->_plusButton frame];
    FIUIDeviceScale();
    UIRectIntegralWithScale();
    -[UIButton setFrame:](self->_plusButton, "setFrame:");
    [(UIButton *)self->_minusButton frame];
    FIUIDeviceScale();
    UIRectIntegralWithScale();
    -[UIButton setFrame:](self->_minusButton, "setFrame:");
    [(UILabel *)self->_unitLabel sizeToFit];
    [(UILabel *)self->_unitLabel frame];
    [(CHASActivitySetupGoalView *)self frame];
    FIUIDeviceScale();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_unitLabel, "setFrame:");
    unitLabel = self->_unitLabel;
    [(UILabel *)self->_goalLabel frame];
    double MidX = CGRectGetMidX(v19);
    [(UILabel *)self->_goalLabel frame];
    -[UILabel setCenter:](unitLabel, "setCenter:", MidX, v8 + CGRectGetMaxY(v20));
  }
}

- (void)_fitGoalLabel
{
  [(CHASActivitySetupGoalView *)self _formatGoalLabel];
  if (self->_shouldUpdateValueLabel)
  {
    [(UIButton *)self->_minusButton frame];
    double MaxX = CGRectGetMaxX(v9);
    [(UILabel *)self->_goalLabel frame];
    if (MaxX <= CGRectGetMinX(v10)
      && ([(UILabel *)self->_goalLabel frame],
          double v4 = CGRectGetMaxX(v11),
          [(UIButton *)self->_plusButton frame],
          v4 <= CGRectGetMinX(v12)))
    {
      double v5 = 72.0;
    }
    else
    {
      double v5 = 54.0;
    }
    goalLabel = self->_goalLabel;
    double v7 = +[UIFont systemFontOfSize:UIFontSystemFontDesignRounded weight:v5 design:UIFontWeightSemibold];
    [(UILabel *)goalLabel setFont:v7];

    [(CHASActivitySetupGoalView *)self _formatGoalLabel];
  }
}

- (void)_formatGoalLabel
{
  [(UILabel *)self->_goalLabel sizeToFit];
  goalLabel = self->_goalLabel;
  [(CHASActivitySetupGoalView *)self bounds];
  double MidX = CGRectGetMidX(v7);
  [(CHASActivitySetupGoalView *)self bounds];
  -[UILabel setCenter:](goalLabel, "setCenter:", MidX, CGRectGetMidY(v8));
  [(UILabel *)self->_goalLabel frame];
  CGRectGetMinX(v9);
  [(UILabel *)self->_goalLabel frame];
  CGRectGetWidth(v10);
  [(UILabel *)self->_goalLabel frame];
  CGRectGetHeight(v11);
  FIUIDeviceScale();
  UIRectIntegralWithScale();
  double v5 = self->_goalLabel;

  -[UILabel setFrame:](v5, "setFrame:");
}

- (void)buttonControllerDidUpdate
{
  v3 = [(CHASActivitySetupGoalViewConfiguration *)self->_configuration unit];
  [(FIUIValueAdjustmentButtonController *)self->_buttonController value];
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3);
  double v4 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  dailyGoal = self->_dailyGoal;
  self->_dailyGoal = v4;

  [(CHASActivitySetupGoalView *)self _updateGoalLabelWithGoal:self->_dailyGoal];
  id v6 = [(CHASActivitySetupGoalView *)self delegate];
  [v6 setupGoalViewValueChanged:self value:self->_dailyGoal];
}

- (void)_updateGoalLabelWithGoal:(id)a3
{
  id v13 = a3;
  double v4 = [(CHASActivitySetupGoalViewConfiguration *)self->_configuration goalValueStringFormatter];
  double v5 = ((void (**)(void, id))v4)[2](v4, v13);

  [(UILabel *)self->_goalLabel setText:v5];
  id v6 = [(CHASActivitySetupGoalViewConfiguration *)self->_configuration unit];
  [v13 doubleValueForUnit:v6];
  unint64_t v8 = (unint64_t)v7;

  CGRect v9 = +[NSString stringWithFormat:@"%ld", v8];
  id v10 = [v9 length];

  if (v10 == self->_valueLabelSizeLength)
  {
    self->_shouldUpdateValueLabel = 0;
  }
  else
  {
    self->_valueLabelSizeLength = (unint64_t)v10;
    self->_shouldUpdateValueLabel = 1;
    [(CHASActivitySetupGoalView *)self setNeedsLayout];
  }
  CGRect v11 = [(CHASActivitySetupGoalViewConfiguration *)self->_configuration goalUnitStringFormatter];
  CGRect v12 = ((void (**)(void, id))v11)[2](v11, v13);
  [(UILabel *)self->_unitLabel setText:v12];
}

- (void)setGoal:(id)a3
{
  objc_storeStrong((id *)&self->_dailyGoal, a3);
  id v8 = a3;
  buttonController = self->_buttonController;
  id v6 = [(CHASActivitySetupGoalViewConfiguration *)self->_configuration unit];
  [v8 doubleValueForUnit:v6];
  [(FIUIValueAdjustmentButtonController *)buttonController setValue:round(v7)];

  [(CHASActivitySetupGoalView *)self _updateGoalLabelWithGoal:v8];
}

- (CGSize)intrinsicContentSize
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[UILabel _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_goalLabel, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 1.79769313e308, v6, v7);
  double v9 = v8 + 0.0;
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  -[UILabel _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_unitLabel, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 1.79769313e308, v10, v11);
  double v13 = v9 + v12;
  [(CHASActivitySetupGoalViewConfiguration *)self->_configuration unitTextYOffset];
  double v15 = v13 + v14;
  double v16 = UIViewNoIntrinsicMetric;
  result.CGFloat height = v15;
  result.CGFloat width = v16;
  return result;
}

- (CHASActivitySetupGoalViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHASActivitySetupGoalViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKQuantity)dailyGoal
{
  return self->_dailyGoal;
}

- (void)setDailyGoal:(id)a3
{
}

- (CHASActivitySetupGoalViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FIUIValueAdjustmentButtonController)buttonController
{
  return self->_buttonController;
}

- (void)setButtonController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dailyGoal, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_unitLabel, 0);

  objc_storeStrong((id *)&self->_goalLabel, 0);
}

@end