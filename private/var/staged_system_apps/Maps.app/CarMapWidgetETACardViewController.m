@interface CarMapWidgetETACardViewController
- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3;
- (BOOL)shouldUseWideLayout;
- (CarMapWidgetETACardViewController)initWithDestination:(unint64_t)a3;
- (GuidanceETA)latestETA;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (id)_cardBackgroundView;
- (id)_effectForInterfaceStyle:(int64_t)a3;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (void)_applyDynamicScaling;
- (void)_scaleConstraints;
- (void)_scaleFonts;
- (void)_setupConstraints;
- (void)_updateArrangedSubviewsIfNeeded;
- (void)_updateContents;
- (void)setLatestETA:(id)a3;
- (void)setShouldUseWideLayout:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarMapWidgetETACardViewController

- (CarMapWidgetETACardViewController)initWithDestination:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarMapWidgetETACardViewController;
  result = [(CarMapWidgetETACardViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_destination = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)CarMapWidgetETACardViewController;
  [(CarMapWidgetETACardViewController *)&v33 viewDidLoad];
  v3 = [(CarMapWidgetETACardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarMapWidgetETACardView"];

  id v4 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  etaLabel = self->_etaLabel;
  self->_etaLabel = v8;

  [(UILabel *)self->_etaLabel setAccessibilityIdentifier:@"ETALabel"];
  [(UILabel *)self->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  [(UILabel *)self->_etaLabel setFont:v10];

  [(UILabel *)self->_etaLabel setTextAlignment:1];
  LODWORD(v11) = 1148846080;
  [(UILabel *)self->_etaLabel setContentCompressionResistancePriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(UILabel *)self->_etaLabel setContentCompressionResistancePriority:0 forAxis:v12];
  LODWORD(v13) = 1144750080;
  [(UILabel *)self->_etaLabel setContentHuggingPriority:0 forAxis:v13];
  v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  timeLabel = self->_timeLabel;
  self->_timeLabel = v14;

  [(UILabel *)self->_timeLabel setAccessibilityIdentifier:@"TimeLabel"];
  [(UILabel *)self->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  [(UILabel *)self->_timeLabel setFont:v16];

  LODWORD(v17) = 1148846080;
  [(UILabel *)self->_timeLabel setContentCompressionResistancePriority:1 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [(UILabel *)self->_timeLabel setContentCompressionResistancePriority:0 forAxis:v18];
  LODWORD(v19) = 1144750080;
  [(UILabel *)self->_timeLabel setContentHuggingPriority:0 forAxis:v19];
  v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v20;

  [(UILabel *)self->_distanceLabel setAccessibilityIdentifier:@"DistanceLabel"];
  [(UILabel *)self->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  [(UILabel *)self->_distanceLabel setFont:v22];

  LODWORD(v23) = 1148846080;
  [(UILabel *)self->_distanceLabel setContentCompressionResistancePriority:1 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [(UILabel *)self->_distanceLabel setContentCompressionResistancePriority:0 forAxis:v24];
  LODWORD(v25) = 1144750080;
  [(UILabel *)self->_distanceLabel setContentHuggingPriority:0 forAxis:v25];
  v34 = self->_etaLabel;
  v26 = +[NSArray arrayWithObjects:&v34 count:1];
  currentArrangedSubviews = self->_currentArrangedSubviews;
  self->_currentArrangedSubviews = v26;

  v28 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:self->_currentArrangedSubviews];
  labelStackView = self->_labelStackView;
  self->_labelStackView = v28;

  [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v30) = 1148846080;
  [(UIStackView *)self->_labelStackView setContentCompressionResistancePriority:0 forAxis:v30];
  LODWORD(v31) = 1148846080;
  [(UIStackView *)self->_labelStackView setContentHuggingPriority:0 forAxis:v31];
  [(UIStackView *)self->_labelStackView setSpacing:12.0];
  [(UIStackView *)self->_labelStackView setAxis:0];
  v32 = [(CarMapWidgetETACardViewController *)self view];
  [v32 addSubview:self->_labelStackView];

  [(CarMapWidgetETACardViewController *)self _setupConstraints];
  [(CarMapWidgetETACardViewController *)self _updateArrangedSubviewsIfNeeded];
  [(CarMapWidgetETACardViewController *)self _updateContents];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CarMapWidgetETACardViewController;
  [(CarMapWidgetETACardViewController *)&v9 viewDidLayoutSubviews];
  unint64_t destination = self->_destination;
  if (destination == 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    if (destination) {
      return;
    }
    id v4 = [(CarMapWidgetETACardViewController *)self view];
    objc_super v5 = [v4 window];
    v6 = [v5 safeAreaLayoutGuide];
    [v6 layoutFrame];
    double Width = CGRectGetWidth(v10);

    BOOL v8 = Width > 298.0;
  }
  [(CarMapWidgetETACardViewController *)self setShouldUseWideLayout:v8];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarMapWidgetETACardViewController;
  [(CarMapWidgetETACardViewController *)&v4 viewDidAppear:a3];
  [(CarMapWidgetETACardViewController *)self _updateContents];
  [(CarMapWidgetETACardViewController *)self _applyDynamicScaling];
}

- (void)_setupConstraints
{
  v3 = [(UIStackView *)self->_labelStackView firstBaselineAnchor];
  objc_super v4 = [(CarMapWidgetETACardViewController *)self view];
  objc_super v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:19.0];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v6;

  BOOL v8 = [(CarMapWidgetETACardViewController *)self view];
  objc_super v9 = [v8 bottomAnchor];
  CGRect v10 = [(UIStackView *)self->_labelStackView lastBaselineAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10 constant:11.0];
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v11;

  v35 = [(UIStackView *)self->_labelStackView centerXAnchor];
  v36 = [(CarMapWidgetETACardViewController *)self view];
  v34 = [v36 centerXAnchor];
  objc_super v33 = [v35 constraintEqualToAnchor:v34];
  v37[0] = v33;
  double v31 = [(UIStackView *)self->_labelStackView leadingAnchor];
  v32 = [(CarMapWidgetETACardViewController *)self view];
  double v30 = [v32 leadingAnchor];
  LODWORD(v13) = 1132068864;
  v29 = [v31 constraintEqualToAnchor:v30 constant:24.0 priority:v13];
  v37[1] = v29;
  v27 = [(UIStackView *)self->_labelStackView leadingAnchor];
  v28 = [(CarMapWidgetETACardViewController *)self view];
  v26 = [v28 leadingAnchor];
  double v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26 constant:12.0];
  v37[2] = v25;
  v14 = [(CarMapWidgetETACardViewController *)self view];
  v15 = [v14 trailingAnchor];
  v16 = [(UIStackView *)self->_labelStackView trailingAnchor];
  LODWORD(v17) = 1132068864;
  double v18 = [v15 constraintEqualToAnchor:v16 constant:24.0 priority:v17];
  v37[3] = v18;
  double v19 = [(CarMapWidgetETACardViewController *)self view];
  v20 = [v19 trailingAnchor];
  v21 = [(UIStackView *)self->_labelStackView trailingAnchor];
  v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21 constant:12.0];
  double v23 = self->_topConstraint;
  v37[4] = v22;
  v37[5] = v23;
  v37[6] = self->_bottomConstraint;
  double v24 = +[NSArray arrayWithObjects:v37 count:7];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)setShouldUseWideLayout:(BOOL)a3
{
  if (self->_shouldUseWideLayout != a3)
  {
    self->_shouldUseWideLayout = a3;
    [(CarMapWidgetETACardViewController *)self _updateArrangedSubviewsIfNeeded];
    [(CarMapWidgetETACardViewController *)self _updateContents];
  }
}

- (void)_updateArrangedSubviewsIfNeeded
{
  unsigned int v4 = [(CarMapWidgetETACardViewController *)self shouldUseWideLayout];
  if (v4)
  {
    v2 = [(GuidanceETA *)self->_latestETA arrivalBatteryCharge];
    if (!v2)
    {
      timeLabel = self->_timeLabel;
      v8[0] = self->_etaLabel;
      v8[1] = timeLabel;
      v8[2] = self->_distanceLabel;
      objc_super v5 = +[NSArray arrayWithObjects:v8 count:3];
      goto LABEL_6;
    }
  }
  etaLabel = self->_etaLabel;
  objc_super v5 = +[NSArray arrayWithObjects:&etaLabel count:1];
  if (v4) {
LABEL_6:
  }

  if (([v5 isEqualToArray:self->_currentArrangedSubviews] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentArrangedSubviews, v5);
    [(UIStackView *)self->_labelStackView _maps_setArrangedSubviews:v5];
    [(UIStackView *)self->_labelStackView setNeedsLayout];
    [(UIStackView *)self->_labelStackView layoutIfNeeded];
  }
}

- (void)_updateContents
{
  if (self->_latestETA)
  {
    if ([(CarMapWidgetETACardViewController *)self shouldUseWideLayout]
      && ([(GuidanceETA *)self->_latestETA arrivalBatteryCharge],
          v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      unsigned int v4 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
      objc_super v5 = [(GuidanceETA *)self->_latestETA arrivalWithBatteryChargeStringWithFont:v4 includingAMPMSymbols:0];
      [(UILabel *)self->_etaLabel setAttributedText:v5];
    }
    else
    {
      unsigned int v4 = [(GuidanceETA *)self->_latestETA arrivalTimeExpandedStringIncludingAMPMSymbols:0];
      [(UILabel *)self->_etaLabel setText:v4];
    }

    [(GuidanceETA *)self->_latestETA remainingDistance];
    if (v6 >= 0.0)
    {
      v7 = [(GuidanceETA *)self->_latestETA distanceValue];
      BOOL v8 = [(GuidanceETA *)self->_latestETA distanceUnit];
      objc_super v9 = +[NSString stringWithFormat:@"%@ %@", v7, v8];
      [(UILabel *)self->_distanceLabel setText:v9];

      CGRect v10 = [(GuidanceETA *)self->_latestETA distanceValue];
      double v11 = [(GuidanceETA *)self->_latestETA distanceUnitAccessibility];
      double v12 = +[NSString stringWithFormat:@"%@ %@", v10, v11];
      [(UILabel *)self->_distanceLabel setAccessibilityLabel:v12];
    }
    double v13 = [(GuidanceETA *)self->_latestETA timeValue];
    v14 = [(GuidanceETA *)self->_latestETA timeUnit];
    v15 = +[NSString stringWithFormat:@"%@ %@", v13, v14];
    [(UILabel *)self->_timeLabel setText:v15];

    v16 = [(GuidanceETA *)self->_latestETA timeValue];
    double v17 = [(GuidanceETA *)self->_latestETA timeUnitAccessibility];
    double v18 = +[NSString stringWithFormat:@"%@ %@", v16, v17];
    [(UILabel *)self->_timeLabel setAccessibilityLabel:v18];

    [(UIStackView *)self->_labelStackView setNeedsLayout];
    [(UIStackView *)self->_labelStackView layoutIfNeeded];
    if ([(UILabel *)self->_etaLabel isTextTruncated])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A9ABE4;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      if (qword_101610678 != -1) {
        dispatch_once(&qword_101610678, block);
      }
    }
  }
}

- (void)_applyDynamicScaling
{
  if (self->_destination == 1)
  {
    [(CarMapWidgetETACardViewController *)self _scaleFonts];
    [(CarMapWidgetETACardViewController *)self _scaleConstraints];
  }
}

- (void)_scaleFonts
{
  v3 = [(CarMapWidgetETACardViewController *)self view];
  [v3 _car_dynamicPointScaleValue];
  double v5 = v4;

  double v6 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  v7 = [v6 _maps_scaledFontForScaleFactor:v5];
  [(UILabel *)self->_etaLabel setFont:v7];

  BOOL v8 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  objc_super v9 = [v8 _maps_scaledFontForScaleFactor:v5];
  [(UILabel *)self->_timeLabel setFont:v9];

  id v11 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
  CGRect v10 = [v11 _maps_scaledFontForScaleFactor:v5];
  [(UILabel *)self->_distanceLabel setFont:v10];
}

- (void)_scaleConstraints
{
  v3 = [(CarMapWidgetETACardViewController *)self view];
  [v3 _car_dynamicPointScaleValue];
  double v5 = v4;

  [(NSLayoutConstraint *)self->_topConstraint setConstant:v5 * 19.0];
  bottomConstraint = self->_bottomConstraint;

  [(NSLayoutConstraint *)bottomConstraint setConstant:v5 * 11.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CarMapWidgetETACardViewController;
  id v4 = a3;
  [(CarMapWidgetETACardViewController *)&v10 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  double v6 = [(CarMapWidgetETACardViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    BOOL v8 = [(CarMapWidgetETACardViewController *)self traitCollection];
    objc_super v9 = -[CarMapWidgetETACardViewController _effectForInterfaceStyle:](self, "_effectForInterfaceStyle:", [v8 userInterfaceStyle]);
    [(CarVisualEffectView *)self->_dashboardBackgroundView setEffect:v9];
  }
}

- (void)setLatestETA:(id)a3
{
  double v6 = (GuidanceETA *)a3;
  latestETA = self->_latestETA;
  if (latestETA == v6) {
    goto LABEL_14;
  }
  double v12 = v6;
  BOOL v8 = [(GuidanceETA *)latestETA arrivalBatteryCharge];
  if (!v8
    || ([(GuidanceETA *)v12 arrivalBatteryCharge],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v10 = [(GuidanceETA *)self->_latestETA arrivalBatteryCharge];
    if (v10)
    {
      BOOL v9 = 0;
    }
    else
    {
      id v11 = [(GuidanceETA *)v12 arrivalBatteryCharge];
      BOOL v9 = v11 != 0;
    }
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

LABEL_10:
  objc_storeStrong((id *)&self->_latestETA, a3);
  if (v9 && [(CarMapWidgetETACardViewController *)self isViewLoaded]) {
    [(CarMapWidgetETACardViewController *)self _updateArrangedSubviewsIfNeeded];
  }
  [(CarMapWidgetETACardViewController *)self _updateContents];
  double v6 = v12;
LABEL_14:
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  double v6 = [(CarMapWidgetETACardViewController *)self _cardBackgroundView];

  return v6;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  retstr->var0 = 15;
  retstr->var1 = 5.0;
  retstr->var2 = kCACornerCurveContinuous;

  id var9 = a4->var9;

  return result;
}

- (id)_effectForInterfaceStyle:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 14;
  }
  else {
    uint64_t v3 = 18;
  }
  return +[UIBlurEffect effectWithStyle:v3];
}

- (id)_cardBackgroundView
{
  v2 = self;
  unint64_t destination = self->_destination;
  if (destination == 1)
  {
    p_id hybridICBackgroundView = (id *)&self->_hybridICBackgroundView;
    id hybridICBackgroundView = self->_hybridICBackgroundView;
    if (!hybridICBackgroundView)
    {
      objc_super v10 = [[CarDynamicBlurView alloc] initWithBlurViewContext:0 delegate:0];
      id v11 = *p_hybridICBackgroundView;
      id *p_hybridICBackgroundView = v10;

      [*p_hybridICBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
      [*p_hybridICBackgroundView setUserInteractionEnabled:0];
      goto LABEL_7;
    }
  }
  else
  {
    if (destination) {
      goto LABEL_9;
    }
    p_id hybridICBackgroundView = (id *)&self->_dashboardBackgroundView;
    id hybridICBackgroundView = self->_dashboardBackgroundView;
    if (!hybridICBackgroundView)
    {
      double v6 = -[CarVisualEffectView initWithFrame:]([CarVisualEffectView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      id v7 = *p_hybridICBackgroundView;
      id *p_hybridICBackgroundView = v6;

      [*p_hybridICBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
      [*p_hybridICBackgroundView setUserInteractionEnabled:0];
      BOOL v8 = [(CarMapWidgetETACardViewController *)v2 traitCollection];
      BOOL v9 = -[CarMapWidgetETACardViewController _effectForInterfaceStyle:](v2, "_effectForInterfaceStyle:", [v8 userInterfaceStyle]);
      [*p_hybridICBackgroundView setEffect:v9];

      [*p_hybridICBackgroundView setAllowsBlurring:1];
LABEL_7:
      id hybridICBackgroundView = *p_hybridICBackgroundView;
    }
  }
  self = (CarMapWidgetETACardViewController *)hybridICBackgroundView;
LABEL_9:

  return self;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (BOOL)shouldUseWideLayout
{
  return self->_shouldUseWideLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_hybridICBackgroundView, 0);
  objc_storeStrong((id *)&self->_dashboardBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_currentArrangedSubviews, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end