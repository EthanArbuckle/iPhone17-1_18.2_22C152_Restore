@interface NavTrayEndCell
- (BOOL)hasWalkingETAInfo;
- (NavTrayButtonStylingDelegate)buttonStylingDelegate;
- (NavTrayEndCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NavTrayMetrics)metrics;
- (void)_updateButtonStyling;
- (void)setButtonStylingDelegate:(id)a3;
- (void)setHasWalkingETAInfo:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAlternateWalkingRouteDuration;
@end

@implementation NavTrayEndCell

- (NavTrayEndCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v36.receiver = self;
  v36.super_class = (Class)NavTrayEndCell;
  v4 = [(NavTrayEndCell *)&v36 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NavTrayEndCell *)v4 setAccessibilityIdentifier:v6];

    v7 = +[UIColor clearColor];
    [(NavTrayEndCell *)v4 setBackgroundColor:v7];

    buttonHeightConstraints = v4->_buttonHeightConstraints;
    v4->_buttonHeightConstraints = (NSArray *)&__NSArray0__struct;

    v9 = -[AxisAdjustingStackView initWithFrame:]([AxisAdjustingStackView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    buttonStackView = v4->_buttonStackView;
    v4->_buttonStackView = v9;

    [(AxisAdjustingStackView *)v4->_buttonStackView setDelegate:v4];
    [(AxisAdjustingStackView *)v4->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AxisAdjustingStackView *)v4->_buttonStackView setDistribution:1];
    [(AxisAdjustingStackView *)v4->_buttonStackView setAlignment:0];
    v11 = [(NavTrayEndCell *)v4 contentView];
    [v11 addSubview:v4->_buttonStackView];

    uint64_t v12 = objc_opt_new();
    endRouteButton = v4->_endRouteButton;
    v4->_endRouteButton = (UIButton *)v12;

    [(UIButton *)v4->_endRouteButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_endRouteButton setAccessibilityIdentifier:@"EndRouteButton"];
    LODWORD(v14) = 1148846080;
    [(UIButton *)v4->_endRouteButton setContentCompressionResistancePriority:1 forAxis:v14];
    [(AxisAdjustingStackView *)v4->_buttonStackView addArrangedTruncatableSubview:v4->_endRouteButton];
    uint64_t v15 = objc_opt_new();
    walkingRouteButton = v4->_walkingRouteButton;
    v4->_walkingRouteButton = (UIButton *)v15;

    [(UIButton *)v4->_walkingRouteButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_walkingRouteButton setAccessibilityIdentifier:@"WalkingRouteButton"];
    LODWORD(v17) = 1148846080;
    [(UIButton *)v4->_walkingRouteButton setContentCompressionResistancePriority:1 forAxis:v17];
    v34 = [(AxisAdjustingStackView *)v4->_buttonStackView topAnchor];
    v35 = [(NavTrayEndCell *)v4 contentView];
    v33 = [v35 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v37[0] = v32;
    v30 = [(AxisAdjustingStackView *)v4->_buttonStackView bottomAnchor];
    v31 = [(NavTrayEndCell *)v4 contentView];
    v29 = [v31 bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v37[1] = v28;
    v18 = [(AxisAdjustingStackView *)v4->_buttonStackView leadingAnchor];
    v19 = [(NavTrayEndCell *)v4 contentView];
    v20 = [v19 leadingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v37[2] = v21;
    v22 = [(AxisAdjustingStackView *)v4->_buttonStackView trailingAnchor];
    v23 = [(NavTrayEndCell *)v4 contentView];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v37[3] = v25;
    v26 = +[NSArray arrayWithObjects:v37 count:4];
    +[NSLayoutConstraint activateConstraints:v26];
  }
  return v4;
}

- (void)setMetrics:(id)a3
{
  p_metrics = &self->_metrics;
  objc_storeStrong((id *)&self->_metrics, a3);
  id v6 = a3;
  +[NSLayoutConstraint deactivateConstraints:self->_buttonHeightConstraints];
  v7 = [(UIButton *)self->_endRouteButton heightAnchor];
  [(NavTrayMetrics *)*p_metrics endButtonHeight];
  v8 = [v7 constraintEqualToConstant:];
  v13[0] = v8;
  v9 = [(UIButton *)self->_walkingRouteButton heightAnchor];
  [(NavTrayMetrics *)*p_metrics endButtonHeight];
  v10 = [v9 constraintEqualToConstant:];
  v13[1] = v10;
  v11 = +[NSArray arrayWithObjects:v13 count:2];
  buttonHeightConstraints = self->_buttonHeightConstraints;
  self->_buttonHeightConstraints = v11;

  +[NSLayoutConstraint activateConstraints:self->_buttonHeightConstraints];
  [(NavTrayMetrics *)*p_metrics actionButtonInterButtonPadding];
  -[AxisAdjustingStackView setSpacing:](self->_buttonStackView, "setSpacing:");
  [(AxisAdjustingStackView *)self->_buttonStackView setNeedsLayout];

  [(NavTrayEndCell *)self _updateButtonStyling];
}

- (void)setButtonStylingDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonStylingDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_buttonStylingDelegate, obj);
    [(NavTrayEndCell *)self _updateButtonStyling];
    v5 = obj;
  }
}

- (void)setHasWalkingETAInfo:(BOOL)a3
{
  if (self->_hasWalkingETAInfo != a3)
  {
    self->_hasWalkingETAInfo = a3;
    buttonStackView = self->_buttonStackView;
    if (a3)
    {
      [(AxisAdjustingStackView *)buttonStackView insertArrangedTruncatableSubview:self->_walkingRouteButton atIndex:0];
    }
    else
    {
      [(AxisAdjustingStackView *)buttonStackView removeArrangedTruncatableSubview:self->_walkingRouteButton];
      [(UIButton *)self->_walkingRouteButton removeFromSuperview];
    }
    [(AxisAdjustingStackView *)self->_buttonStackView setNeedsLayout];
    [(NavTrayEndCell *)self _updateButtonStyling];
  }
}

- (void)updateAlternateWalkingRouteDuration
{
  if (self->_hasWalkingETAInfo)
  {
    v3 = [(NavTrayEndCell *)self buttonStylingDelegate];
    [v3 styleButton:self->_walkingRouteButton ofType:6];

    buttonStackView = self->_buttonStackView;
    [(AxisAdjustingStackView *)buttonStackView invalidateStackViewAxis];
  }
}

- (void)_updateButtonStyling
{
  v3 = [(NavTrayEndCell *)self buttonStylingDelegate];
  [v3 styleButton:self->_endRouteButton ofType:1];

  if (self->_hasWalkingETAInfo)
  {
    v4 = [(NavTrayEndCell *)self buttonStylingDelegate];
    [v4 styleButton:self->_walkingRouteButton ofType:6];
  }
  buttonStackView = self->_buttonStackView;

  [(AxisAdjustingStackView *)buttonStackView invalidateStackViewAxis];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavTrayEndCell;
  id v4 = a3;
  [(NavTrayEndCell *)&v9 traitCollectionDidChange:v4];
  v5 = [(NavTrayEndCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(NavTrayEndCell *)self _updateButtonStyling];
  }
}

- (NavTrayMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)hasWalkingETAInfo
{
  return self->_hasWalkingETAInfo;
}

- (NavTrayButtonStylingDelegate)buttonStylingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonStylingDelegate);

  return (NavTrayButtonStylingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonStylingDelegate);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttonHeightConstraints, 0);
  objc_storeStrong((id *)&self->_walkingRouteButton, 0);

  objc_storeStrong((id *)&self->_endRouteButton, 0);
}

@end