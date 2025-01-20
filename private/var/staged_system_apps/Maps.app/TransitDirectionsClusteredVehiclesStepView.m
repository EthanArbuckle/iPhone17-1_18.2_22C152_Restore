@interface TransitDirectionsClusteredVehiclesStepView
- (MKTransitInfoLabelView)alternateRoutesLabel;
- (TransitDirectionsClusteredVehiclesStepViewDelegate)delegate;
- (TransitDirectionsListClusteredVehicleItem)clusteredVehicleItem;
- (double)bottomSpacerHeight;
- (id)_initialConstraints;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_tapped;
- (void)_updateConstraintsValue;
- (void)_updateFonts;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)_updateShieldSize;
- (void)configureWithItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TransitDirectionsClusteredVehiclesStepView

- (void)_createSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  [(TransitDirectionsIconStepView *)&v20 _createSubviews];
  v3 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
  alternateRoutesLabel = self->_alternateRoutesLabel;
  self->_alternateRoutesLabel = v3;

  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TransitDirectionsClusteredVehiclesStepView *)self _updateShieldSize];
  LODWORD(v5) = 1148846080;
  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v5];
  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setNumberOfLines:0];
  v6 = +[UIColor systemGrayColor];
  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setTextColor:v6];

  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setTextAlignment:4];
  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setLineBreakMode:0];
  [(TransitDirectionsClusteredVehiclesStepView *)self addSubview:self->_alternateRoutesLabel];
  if (sub_1000BBB44(self) != 5)
  {
    v7 = +[UIImage systemImageNamed:@"chevron.right"];
    v8 = [(TransitDirectionsClusteredVehiclesStepView *)self traitCollection];
    id v9 = [v8 layoutDirection];

    if (v9 == (id)1)
    {
      uint64_t v10 = [v7 imageFlippedForRightToLeftLayoutDirection];

      v7 = (void *)v10;
    }
    v11 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    chevronImageView = self->_chevronImageView;
    self->_chevronImageView = v11;

    [(UIImageView *)self->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCallout];
    [(UIImageView *)self->_chevronImageView setPreferredSymbolConfiguration:v13];

    v14 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel textColor];
    [(UIImageView *)self->_chevronImageView setTintColor:v14];

    LODWORD(v15) = 1148846080;
    [(UIImageView *)self->_chevronImageView setContentCompressionResistancePriority:1 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UIImageView *)self->_chevronImageView setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UIImageView *)self->_chevronImageView setContentHuggingPriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UIImageView *)self->_chevronImageView setContentHuggingPriority:0 forAxis:v18];
    [(TransitDirectionsClusteredVehiclesStepView *)self addSubview:self->_chevronImageView];
  }
  id v19 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tapped"];
  [(TransitDirectionsClusteredVehiclesStepView *)self addGestureRecognizer:v19];
  [(TransitDirectionsClusteredVehiclesStepView *)self _updateFonts];
}

- (id)_initialConstraints
{
  v32.receiver = self;
  v32.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  v3 = [(TransitDirectionsIconStepView *)&v32 _initialConstraints];
  v4 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel firstBaselineAnchor];
  double v5 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v6 = [v5 topAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  messageLabelBaselineConstraint = self->_messageLabelBaselineConstraint;
  self->_messageLabelBaselineConstraint = v7;

  [v3 addObject:self->_messageLabelBaselineConstraint];
  id v9 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel centerYAnchor];
  uint64_t v10 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v11 = [v10 centerYAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  v13 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v14 = [v13 bottomAnchor];
  double v15 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel lastBaselineAnchor];
  double v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  [v3 addObject:v16];

  double v17 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  double v18 = [v17 leadingAnchor];
  id v19 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel leadingAnchor];
  objc_super v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  if (sub_1000BBB44(self) == 5)
  {
    v21 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    v22 = [v21 trailingAnchor];
    v23 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel trailingAnchor];
    [v22 constraintEqualToAnchor:v23];
  }
  else
  {
    v24 = [(UIImageView *)self->_chevronImageView firstBaselineAnchor];
    v25 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel firstBaselineAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v3 addObject:v26];

    v27 = [(UIImageView *)self->_chevronImageView leadingAnchor];
    v28 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:5.0];
    [v3 addObject:v29];

    v21 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    v22 = [v21 trailingAnchor];
    v23 = [(UIImageView *)self->_chevronImageView trailingAnchor];
    [v22 constraintGreaterThanOrEqualToAnchor:v23];
  v30 = };
  [v3 addObject:v30];

  [(TransitDirectionsClusteredVehiclesStepView *)self _updateConstraintsValue];

  return v3;
}

- (void)_contentSizeCategoryDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  [(TransitDirectionsStepView *)&v3 _contentSizeCategoryDidChange];
  [(TransitDirectionsClusteredVehiclesStepView *)self _updateFonts];
  [(TransitDirectionsClusteredVehiclesStepView *)self _updateShieldSize];
  [(TransitDirectionsClusteredVehiclesStepView *)self _updateConstraintsValue];
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17];
  }
  else {
  objc_super v3 = +[UIFont system15];
  }
  [v3 _mapkit_fontByAddingFeaturesForTimeDisplay];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setFont:v4];
}

- (void)_updateShieldSize
{
  objc_super v3 = +[UIApplication sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];

  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setShieldSize:+[MKTransitInfoLabelView clusteredShieldSizeForContentSizeCategory:v4]];
}

- (void)_updateConstraintsValue
{
  id v3 = [(MKTransitInfoLabelView *)self->_alternateRoutesLabel font];
  [v3 _scaledValueForValue:22.0];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_messageLabelBaselineConstraint, "setConstant:");
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  [(TransitDirectionsIconStepView *)&v8 configureWithItem:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 clusteredSegment];
    v6 = [v5 alternateRouteItemsForTransitInfoLabel];
    if ([v6 count]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setLabelItems:v7];
  }
}

- (TransitDirectionsListClusteredVehicleItem)clusteredVehicleItem
{
  id v3 = [(TransitDirectionsStepView *)self transitListItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(TransitDirectionsStepView *)self transitListItem];
  }
  else
  {
    double v5 = 0;
  }

  return (TransitDirectionsListClusteredVehicleItem *)v5;
}

- (void)_tapped
{
  id v3 = [(TransitDirectionsClusteredVehiclesStepView *)self delegate];
  [v3 transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:self];
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsClusteredVehiclesStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  [(MKTransitInfoLabelView *)self->_alternateRoutesLabel setAlpha:a3];
}

- (double)bottomSpacerHeight
{
  v2 = [(TransitDirectionsClusteredVehiclesStepView *)self traitCollection];
  [v2 userInterfaceIdiom];

  return 7.0;
}

- (TransitDirectionsClusteredVehiclesStepViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitDirectionsClusteredVehiclesStepViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKTransitInfoLabelView)alternateRoutesLabel
{
  return self->_alternateRoutesLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateRoutesLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageLabelBaselineConstraint, 0);

  objc_storeStrong((id *)&self->_chevronImageView, 0);
}

@end