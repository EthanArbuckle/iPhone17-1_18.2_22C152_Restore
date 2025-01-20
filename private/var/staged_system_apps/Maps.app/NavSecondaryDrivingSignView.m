@interface NavSecondaryDrivingSignView
- (BOOL)isShowingMirroredPrimaryManeuver;
- (UIView)viewToAlignTextLeadingWithPrimarySign;
- (id)_defaultSignLayoutDelegate;
- (void)_setManeuverGuidanceInfo:(id)a3 mirroredPrimary:(BOOL)a4;
- (void)_setupSubviews;
- (void)_updateLabelText;
- (void)mirrorPrimaryManeuver:(id)a3;
@end

@implementation NavSecondaryDrivingSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager secondarySignLayoutDelegateForDriving];
}

- (void)_setupSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)NavSecondaryDrivingSignView;
  [(NavManeuverSignView *)&v11 _setupSubviews];
  v3 = [(NavSignView *)self minorLabel];
  [v3 setLineBreakMode:4];

  v4 = [(NavSignView *)self minorLabel];
  [v4 setShouldRemoveTextStartingAtFirstNewline:1];

  v5 = [(NavSignView *)self minorLabel];
  [v5 setInlineShieldAlpha:0.800000012];

  v6 = [(NavManeuverSignView *)self maneuverView];
  [v6 setAlpha:0.800000012];

  v7 = [(NavManeuverSignView *)self maneuverView];
  LODWORD(v8) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v8];

  v9 = [(NavManeuverSignView *)self maneuverView];
  LODWORD(v10) = 1144750080;
  [v9 setContentHuggingPriority:0 forAxis:v10];
}

- (void)_updateLabelText
{
  v3 = [(NavSignView *)self majorLabel];
  [v3 setTextAlternatives:0];

  id v6 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  v4 = [v6 minorTextAlternatives];
  v5 = [(NavSignView *)self minorLabel];
  [v5 setTextAlternatives:v4];
}

- (void)_setManeuverGuidanceInfo:(id)a3 mirroredPrimary:(BOOL)a4
{
  self->_showMirroredPrimaryManeuver = a4;
  v4.receiver = self;
  v4.super_class = (Class)NavSecondaryDrivingSignView;
  [(NavManeuverSignView *)&v4 setManeuverGuidanceInfo:a3];
}

- (UIView)viewToAlignTextLeadingWithPrimarySign
{
  if ([(NavSignView *)self hasMajorText]) {
    [(NavSignView *)self majorLabel];
  }
  else {
  v3 = [(NavSignView *)self minorLabel];
  }

  return (UIView *)v3;
}

- (void)mirrorPrimaryManeuver:(id)a3
{
  if (a3) {
    -[NavSecondaryDrivingSignView _setManeuverGuidanceInfo:mirroredPrimary:](self, "_setManeuverGuidanceInfo:mirroredPrimary:");
  }
}

- (BOOL)isShowingMirroredPrimaryManeuver
{
  return self->_showMirroredPrimaryManeuver;
}

@end