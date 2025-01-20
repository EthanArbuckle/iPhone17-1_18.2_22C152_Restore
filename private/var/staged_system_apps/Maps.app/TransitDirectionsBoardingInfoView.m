@interface TransitDirectionsBoardingInfoView
- (BOOL)forceVerticalAxis;
- (BOOL)separatorHidden;
- (BOOL)useAlternativeInstruction;
- (GEOTransitBoardingInfoEntry)entry;
- (GEOTransitExitPlanInfo)exitPlanInfo;
- (NSArray)preboardingStrings;
- (NSLayoutConstraint)fixedWidthConstraint;
- (TransitDirectionsBoardingInfoView)initWithFrame:(CGRect)a3;
- (unint64_t)entryType;
- (unint64_t)preferredLayout;
- (unint64_t)resolvedLayout;
- (void)_refreshContent;
- (void)_updateLayout;
- (void)setBoardingInfoEntry:(id)a3 exitPlan:(id)a4;
- (void)setButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setEntryType:(unint64_t)a3;
- (void)setFixedWidthConstraint:(id)a3;
- (void)setForceVerticalAxis:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreboardingStrings:(id)a3;
- (void)setPreferredLayout:(unint64_t)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setUseAlternativeInstruction:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TransitDirectionsBoardingInfoView

- (TransitDirectionsBoardingInfoView)initWithFrame:(CGRect)a3
{
  v86.receiver = self;
  v86.super_class = (Class)TransitDirectionsBoardingInfoView;
  v3 = -[TransitDirectionsBoardingInfoView initWithFrame:](&v86, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(TransitDirectionsBoardingInfoView *)v3 setAccessibilityIdentifier:v5];

    LODWORD(v6) = 1132068864;
    [(TransitDirectionsBoardingInfoView *)v3 setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(TransitDirectionsBoardingInfoView *)v3 setContentHuggingPriority:1 forAxis:v7];
    LODWORD(v8) = 1132068864;
    [(TransitDirectionsBoardingInfoView *)v3 setContentCompressionResistancePriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(TransitDirectionsBoardingInfoView *)v3 setContentCompressionResistancePriority:1 forAxis:v9];
    id v10 = objc_alloc((Class)MKMultiPartLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v14 = [v10 initWithFrame:];
    label = v3->_label;
    v3->_label = v14;

    [(MKMultiPartLabel *)v3->_label setAccessibilityIdentifier:@"Label"];
    [(MKMultiPartLabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = v3;
    sub_1000BBB44(v16);
    v17 = +[UIFont system17];

    [(MKMultiPartLabel *)v3->_label setFont:v17];
    if (sub_1000BBB44(v16) == 5) {
      +[UIColor systemWhiteColor];
    }
    else {
    v18 = +[UIColor labelColor];
    }
    [(MKMultiPartLabel *)v3->_label setHighlightedTextColor:v18];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    -[MKMultiPartLabel setTextInset:](v3->_label, "setTextInset:", UIEdgeInsetsZero.top, left, bottom, right);
    [(MKMultiPartLabel *)v3->_label setUserInteractionEnabled:0];
    LODWORD(v22) = 1132068864;
    [(MKMultiPartLabel *)v3->_label setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(MKMultiPartLabel *)v3->_label setContentHuggingPriority:1 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(MKMultiPartLabel *)v3->_label setContentCompressionResistancePriority:1 forAxis:v24];
    if (sub_1000BBB44(v16) == 5)
    {
      uint64_t v25 = +[MapsLargerHitTargetButton buttonWithType:0];
      button = v16->_button;
      v16->_button = (MapsLargerHitTargetButton *)v25;

      [(TransitDirectionsBoardingInfoView *)v16 setHighlighted:0];
    }
    else
    {
      uint64_t v27 = +[MapsLargerHitTargetButton buttonWithType:1];
      v28 = v16->_button;
      v16->_button = (MapsLargerHitTargetButton *)v27;
    }
    [(MapsLargerHitTargetButton *)v16->_button setAccessibilityIdentifier:@"Button"];
    [(MapsLargerHitTargetButton *)v16->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    -[MapsLargerHitTargetButton setContentEdgeInsets:](v16->_button, "setContentEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    -[MapsLargerHitTargetButton setTitleEdgeInsets:](v16->_button, "setTitleEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    -[MapsLargerHitTargetButton setTouchInsets:](v16->_button, "setTouchInsets:", -2.0, -4.0, -2.0, -4.0);
    v29 = [(MKMultiPartLabel *)v3->_label font];
    v30 = [(MapsLargerHitTargetButton *)v16->_button titleLabel];
    [v30 setFont:v29];

    v31 = [(MapsLargerHitTargetButton *)v16->_button titleLabel];
    [v31 setAdjustsFontForContentSizeCategory:1];

    v32 = v16->_button;
    v33 = +[UIColor systemGrayColor];
    [(MapsLargerHitTargetButton *)v32 setTitleColor:v33 forState:2];

    LODWORD(v34) = 1148846080;
    [(MapsLargerHitTargetButton *)v16->_button setContentHuggingPriority:0 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(MapsLargerHitTargetButton *)v16->_button setContentHuggingPriority:1 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(MapsLargerHitTargetButton *)v16->_button setContentCompressionResistancePriority:1 forAxis:v36];
    v37 = -[TransitDirectionsOccupancyStatusView initWithFrame:]([TransitDirectionsOccupancyStatusView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    occupancyStatusView = v16->_occupancyStatusView;
    v16->_occupancyStatusView = v37;

    [(TransitDirectionsOccupancyStatusView *)v16->_occupancyStatusView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v39) = 1148846080;
    [(TransitDirectionsOccupancyStatusView *)v16->_occupancyStatusView setContentCompressionResistancePriority:1 forAxis:v39];
    LODWORD(v40) = 1148846080;
    [(TransitDirectionsOccupancyStatusView *)v16->_occupancyStatusView setContentHuggingPriority:1 forAxis:v40];
    v41 = -[TransitDirectionsExitPlanView initWithFrame:]([TransitDirectionsExitPlanView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    exitPlanView = v16->_exitPlanView;
    v16->_exitPlanView = v41;

    [(TransitDirectionsExitPlanView *)v16->_exitPlanView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v43) = 1148846080;
    [(TransitDirectionsExitPlanView *)v16->_exitPlanView setContentCompressionResistancePriority:1 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(TransitDirectionsExitPlanView *)v16->_exitPlanView setContentHuggingPriority:1 forAxis:v44];
    id v45 = objc_alloc((Class)UIStackView);
    v89[0] = v3->_label;
    v89[1] = v16->_button;
    v46 = +[NSArray arrayWithObjects:v89 count:2];
    v47 = (UIStackView *)[v45 initWithArrangedSubviews:v46];
    labelAndButtonStackView = v16->_labelAndButtonStackView;
    v16->_labelAndButtonStackView = v47;

    [(UIStackView *)v16->_labelAndButtonStackView setAccessibilityIdentifier:@"LabelAndButtonStackView"];
    [(UIStackView *)v16->_labelAndButtonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v49 = sub_1000BBB44(v16);
    v50 = v16->_labelAndButtonStackView;
    if (v49 == 5)
    {
      [(UIStackView *)v50 setAxis:1];
      [(UIStackView *)v16->_labelAndButtonStackView setAlignment:1];
      v51 = [(MKMultiPartLabel *)v3->_label font];
      [v51 descender];
      double v53 = v52;
      v54 = [(MKMultiPartLabel *)v3->_label font];
      [v54 descender];
      if (v53 < 0.0) {
        double v56 = -v55;
      }
      else {
        double v56 = v55;
      }
      v57 = [(MapsLargerHitTargetButton *)v16->_button titleLabel];
      v58 = [v57 font];
      [v58 ascender];
      [(UIStackView *)v16->_labelAndButtonStackView setSpacing:v56 + v59 + 4.0];
    }
    else
    {
      [(UIStackView *)v50 setAxis:0];
      [(UIStackView *)v16->_labelAndButtonStackView setAlignment:2];
      [(UIStackView *)v16->_labelAndButtonStackView setSpacing:24.0];
    }
    [(UIStackView *)v16->_labelAndButtonStackView setBaselineRelativeArrangement:v49 == 5];
    [(UIStackView *)v16->_labelAndButtonStackView setDistribution:3];
    LODWORD(v60) = 1132068864;
    [(UIStackView *)v16->_labelAndButtonStackView setContentHuggingPriority:0 forAxis:v60];
    LODWORD(v61) = 1148846080;
    [(UIStackView *)v16->_labelAndButtonStackView setContentHuggingPriority:1 forAxis:v61];
    LODWORD(v62) = 1148846080;
    [(UIStackView *)v16->_labelAndButtonStackView setContentCompressionResistancePriority:1 forAxis:v62];
    id v63 = objc_alloc((Class)UIStackView);
    v88[0] = v16->_occupancyStatusView;
    v88[1] = v16->_exitPlanView;
    v64 = +[NSArray arrayWithObjects:v88 count:2];
    v65 = (UIStackView *)[v63 initWithArrangedSubviews:v64];
    occupancyAndExitStackView = v16->_occupancyAndExitStackView;
    v16->_occupancyAndExitStackView = v65;

    [(UIStackView *)v16->_occupancyAndExitStackView setAccessibilityIdentifier:@"OccupancyAndExitStackView"];
    [(UIStackView *)v16->_occupancyAndExitStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v16->_occupancyAndExitStackView setAxis:0];
    [(UIStackView *)v16->_occupancyAndExitStackView setDistribution:1];
    [(UIStackView *)v16->_occupancyAndExitStackView setAlignment:0];
    [(UIStackView *)v16->_occupancyAndExitStackView setSpacing:20.0];
    LODWORD(v67) = 1132068864;
    [(UIStackView *)v16->_occupancyAndExitStackView setContentHuggingPriority:0 forAxis:v67];
    LODWORD(v68) = 1148846080;
    [(UIStackView *)v16->_occupancyAndExitStackView setContentHuggingPriority:1 forAxis:v68];
    LODWORD(v69) = 1148846080;
    [(UIStackView *)v16->_occupancyAndExitStackView setContentCompressionResistancePriority:1 forAxis:v69];
    id v70 = objc_alloc((Class)UIStackView);
    v87[0] = v16->_labelAndButtonStackView;
    v87[1] = v16->_occupancyAndExitStackView;
    v71 = +[NSArray arrayWithObjects:v87 count:2];
    id v72 = [v70 initWithArrangedSubviews:v71];

    [v72 setAccessibilityIdentifier:@"MainStackView"];
    [v72 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v72 setAxis:1];
    [v72 setDistribution:3];
    [v72 setAlignment:0];
    uint64_t v73 = sub_1000BBB44(v16);
    double v74 = 8.0;
    if (v73 == 5) {
      double v74 = 3.0;
    }
    [v72 setSpacing:v74];
    LODWORD(v75) = 1132068864;
    [v72 setContentHuggingPriority:0 forAxis:v75];
    LODWORD(v76) = 1148846080;
    [v72 setContentHuggingPriority:1 forAxis:v76];
    LODWORD(v77) = 1148846080;
    [v72 setContentCompressionResistancePriority:1 forAxis:v77];
    [(TransitDirectionsBoardingInfoView *)v16 addSubview:v72];
    uint64_t v78 = [(TransitDirectionsBoardingInfoView *)v16 _maps_addHairlineAtTrailingWithMargin:0.0];
    trailingHairline = v16->_trailingHairline;
    v16->_trailingHairline = (HairlineView *)v78;

    LODWORD(v80) = 1148846080;
    v81 = [v72 _maps_constraintsEqualToEdgesOfView:v16 priority:v80];
    if (sub_1000BBB44(v16) == 5) {
      double v82 = 0.0;
    }
    else {
      double v82 = 5.0;
    }
    v83 = [v81 bottomConstraint];
    [v83 setConstant:v82];

    v84 = [v81 allConstraints];
    +[NSLayoutConstraint activateConstraints:v84];

    [(TransitDirectionsBoardingInfoView *)v16 _updateLayout];
  }
  return v3;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  if (self->_preferredLayout != a3)
  {
    self->_preferredLayout = a3;
    [(TransitDirectionsBoardingInfoView *)self _updateLayout];
  }
}

- (void)setForceVerticalAxis:(BOOL)a3
{
  if (self->_forceVerticalAxis != a3)
  {
    self->_forceVerticalAxis = a3;
    [(TransitDirectionsBoardingInfoView *)self _updateLayout];
  }
}

- (BOOL)separatorHidden
{
  return [(HairlineView *)self->_trailingHairline isHidden];
}

- (void)setSeparatorHidden:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    button = self->_button;
    if (v3) {
      +[UIColor systemWhiteColor];
    }
    else {
    id v6 = +[UIColor systemBlueColor];
    }
    [(MapsLargerHitTargetButton *)button setTitleColor:v6 forState:0];
  }
}

- (unint64_t)resolvedLayout
{
  unint64_t result = self->_preferredLayout;
  if (!result)
  {
    LODWORD(result) = [(GEOTransitBoardingInfoEntry *)self->_entry hasOccupancyInfo];
    if (self->_exitPlanInfo) {
      return result | 2;
    }
    else {
      return result;
    }
  }
  return result;
}

- (void)_updateLayout
{
  unint64_t v3 = [(TransitDirectionsBoardingInfoView *)self resolvedLayout];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B21E80;
  v8[3] = &unk_101318400;
  v8[4] = v3;
  v4 = objc_retainBlock(v8);
  uint64_t v5 = 1;
  [(TransitDirectionsOccupancyStatusView *)self->_occupancyStatusView setHidden:((unsigned int (*)(void *, uint64_t))v4[2])(v4, 1) ^ 1];
  if (v3 == 1) {
    uint64_t v5 = [(TransitDirectionsBoardingInfoView *)self forceVerticalAxis];
  }
  [(TransitDirectionsBoardingInfoStackView *)self->_occupancyStatusView setAxis:v5];
  [(TransitDirectionsExitPlanView *)self->_exitPlanView setHidden:((unsigned int (*)(void *, uint64_t))v4[2])(v4, 2) ^ 1];
  if (v3 == 2) {
    uint64_t v6 = [(TransitDirectionsBoardingInfoView *)self forceVerticalAxis];
  }
  else {
    uint64_t v6 = 1;
  }
  [(TransitDirectionsBoardingInfoStackView *)self->_exitPlanView setAxis:v6];
  if ([(TransitDirectionsOccupancyStatusView *)self->_occupancyStatusView isHidden]) {
    id v7 = [(TransitDirectionsExitPlanView *)self->_exitPlanView isHidden];
  }
  else {
    id v7 = 0;
  }
  [(UIStackView *)self->_occupancyAndExitStackView setHidden:v7];
  [(TransitDirectionsBoardingInfoView *)self invalidateIntrinsicContentSize];
}

- (void)setBoardingInfoEntry:(id)a3 exitPlan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  entrdouble y = self->_entry;
  unint64_t v18 = (unint64_t)v7;
  id v10 = entry;
  if (v18 | (unint64_t)v10)
  {
    unsigned int v11 = [(id)v18 isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  exitPlanInfo = self->_exitPlanInfo;
  unint64_t v13 = (unint64_t)v8;
  id v14 = exitPlanInfo;
  if (v13 | (unint64_t)v14)
  {
    v15 = v14;
    unsigned int v16 = [(id)v13 isEqual:v14];

    if (!v16)
    {
LABEL_8:
      objc_storeStrong((id *)&self->_entry, a3);
      objc_storeStrong((id *)&self->_exitPlanInfo, a4);
      preboardingStrings = self->_preboardingStrings;
      self->_preboardingStrings = 0;

LABEL_9:
      [(TransitDirectionsBoardingInfoView *)self _refreshContent];
      goto LABEL_10;
    }
  }
  if (self->_entry || self->_exitPlanInfo) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setPreboardingStrings:(id)a3
{
  id v5 = a3;
  preboardingStrings = self->_preboardingStrings;
  unint64_t v11 = (unint64_t)v5;
  id v7 = preboardingStrings;
  if (v11 | (unint64_t)v7)
  {
    unsigned int v8 = [(id)v11 isEqual:v7];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_preboardingStrings, a3);
      entrdouble y = self->_entry;
      self->_entrdouble y = 0;

      exitPlanInfo = self->_exitPlanInfo;
      self->_exitPlanInfo = 0;

      goto LABEL_6;
    }
  }
  if (self->_preboardingStrings) {
LABEL_6:
  }
    [(TransitDirectionsBoardingInfoView *)self _refreshContent];
}

- (void)setUseAlternativeInstruction:(BOOL)a3
{
  if (self->_useAlternativeInstruction != a3)
  {
    self->_useAlternativeInstruction = a3;
    if (self->_entry) {
      [(TransitDirectionsBoardingInfoView *)self _refreshContent];
    }
  }
}

- (void)setButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v15 = v8;
  if (a3) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v11 = v9 || a5 == 0;
  button = self->_button;
  id v13 = a3;
  [(MapsLargerHitTargetButton *)button setHidden:v11];
  [(MapsLargerHitTargetButton *)self->_button setTitle:v13 forState:0];

  [(MapsLargerHitTargetButton *)self->_button removeTarget:0 action:0 forControlEvents:64];
  id v14 = v15;
  if (v15 && a5)
  {
    [(MapsLargerHitTargetButton *)self->_button addTarget:v15 action:a5 forControlEvents:64];
    id v14 = v15;
  }
}

- (void)_refreshContent
{
  entrdouble y = self->_entry;
  if (entry)
  {
    v4 = entry;
    exitPlanInfo = self->_exitPlanInfo;
    id v5 = exitPlanInfo;
    double v59 = v4;
    if ([(TransitDirectionsBoardingInfoView *)self useAlternativeInstruction]
      && ([(GEOTransitBoardingInfoEntry *)v4 hasAlternativeTimeInstruction] & 1) != 0)
    {
      uint64_t v6 = [(GEOTransitBoardingInfoEntry *)v4 alternativeTimeInstruction];
    }
    else
    {
      uint64_t v6 = [(GEOTransitBoardingInfoEntry *)v4 mainTimeInstruction];
    }
    id v7 = (void *)v6;
    id v8 = objc_alloc((Class)GEOComposedString);
    BOOL v9 = [v7 primaryText];
    id v60 = [v8 initWithGeoFormattedString:v9];

    id v10 = objc_alloc((Class)GEOComposedString);
    v58 = v7;
    uint64_t v11 = [v7 secondaryText];
    id v55 = [v10 initWithGeoFormattedString:v11];

    uint64_t v12 = +[NSNumber numberWithInteger:5];
    v71[0] = NSFontAttributeName;
    id v13 = [(MKMultiPartLabel *)self->_label font];
    uint64_t v54 = MKServerFormattedStringArtworkSizeAttributeKey;
    v72[0] = v13;
    v72[1] = v12;
    uint64_t v14 = MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey;
    v71[1] = MKServerFormattedStringArtworkSizeAttributeKey;
    v71[2] = MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey;
    id v15 = +[NSNumber numberWithBool:0];
    v72[2] = v15;
    unsigned int v16 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
    v17 = +[NSAttributedString _mapkit_attributedStringForComposedString:v60 defaultAttributes:v16];

    v69[0] = NSFontAttributeName;
    unint64_t v18 = [(MKMultiPartLabel *)self->_label font];
    v70[0] = v18;
    v69[1] = NSForegroundColorAttributeName;
    v19 = +[UIColor secondaryLabelColor];
    v70[1] = v19;
    v70[2] = v12;
    v57 = (void *)v12;
    v69[2] = v54;
    v69[3] = v14;
    v20 = +[NSNumber numberWithBool:0];
    v70[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];
    double v22 = +[NSAttributedString _mapkit_attributedStringForComposedString:v55 defaultAttributes:v21];

    id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    double v24 = v23;
    if (v17) {
      [v23 addObject:v17];
    }
    if (v22) {
      [v24 addObject:v22];
    }
    if ([v24 count])
    {
      id v25 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
      v26 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v24 repeatedSeparator:v25];
      [(MKMultiPartLabel *)self->_label setMultiPartString:v26];
    }
    else
    {
      [(MKMultiPartLabel *)self->_label setMultiPartString:0];
    }
    v41 = [(GEOTransitBoardingInfoEntry *)v59 occupancyInfo];
    unsigned int v42 = [v41 occupancyStatus];

    uint64_t v43 = v42 - 1;
    if (v43 < 4) {
      uint64_t v44 = v43 + 1;
    }
    else {
      uint64_t v44 = 0;
    }
    [(TransitDirectionsOccupancyStatusView *)self->_occupancyStatusView setOccupancyStatus:v44];
    objc_storeStrong((id *)&self->_exitPlanInfo, exitPlanInfo);
    id v45 = objc_alloc((Class)GEOComposedString);
    v46 = [(GEOTransitExitPlanInfo *)v5 label];
    id v47 = [v45 initWithGeoFormattedString:v46];
    [(TransitDirectionsExitPlanView *)self->_exitPlanView setText:v47];

    v48 = +[NSMutableIndexSet indexSet];
    if ([(GEOTransitExitPlanInfo *)v5 selectedCarIndexsCount])
    {
      unint64_t v49 = 0;
      do
        [v48 addIndex:[self selectedCarIndexAtIndex:v49++]];
      while (v49 < (unint64_t)[(GEOTransitExitPlanInfo *)v5 selectedCarIndexsCount]);
    }
    [(TransitDirectionsExitPlanView *)self->_exitPlanView setIndexSetOfSuggestedCars:v48];
    [(TransitDirectionsExitPlanView *)self->_exitPlanView setNumberOfCars:[(GEOTransitExitPlanInfo *)v5 numberOfCars]];
  }
  else if (self->_preboardingStrings)
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    v28 = +[NSNumber numberWithInteger:5];
    v67[0] = NSFontAttributeName;
    v29 = [(MKMultiPartLabel *)self->_label font];
    uint64_t v30 = MKServerFormattedStringArtworkSizeAttributeKey;
    v67[1] = MKServerFormattedStringArtworkSizeAttributeKey;
    v68[0] = v29;
    v68[1] = v28;
    v31 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];

    v65[0] = NSFontAttributeName;
    v32 = [(MKMultiPartLabel *)self->_label font];
    v66[0] = v32;
    v65[1] = NSForegroundColorAttributeName;
    v33 = +[UIColor secondaryLabelColor];
    v65[2] = v30;
    v66[1] = v33;
    v66[2] = v28;
    double v34 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];

    preboardingStrings = self->_preboardingStrings;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100B22984;
    v61[3] = &unk_101318428;
    id v36 = v31;
    id v62 = v36;
    id v37 = v34;
    id v63 = v37;
    id v38 = v27;
    id v64 = v38;
    [(NSArray *)preboardingStrings enumerateObjectsUsingBlock:v61];
    if ([v38 count])
    {
      id v39 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
      double v40 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v38 repeatedSeparator:v39];
      [(MKMultiPartLabel *)self->_label setMultiPartString:v40];
    }
    else
    {
      [(MKMultiPartLabel *)self->_label setMultiPartString:0];
    }
    [(TransitDirectionsOccupancyStatusView *)self->_occupancyStatusView setOccupancyStatus:0];
    v51 = self->_exitPlanInfo;
    self->_exitPlanInfo = 0;

    [(TransitDirectionsExitPlanView *)self->_exitPlanView setIndexSetOfSuggestedCars:0];
    [(TransitDirectionsExitPlanView *)self->_exitPlanView setNumberOfCars:0];
  }
  else
  {
    [(MKMultiPartLabel *)self->_label setMultiPartString:0];
    [(TransitDirectionsOccupancyStatusView *)self->_occupancyStatusView setOccupancyStatus:0];
    v50 = self->_exitPlanInfo;
    self->_exitPlanInfo = 0;

    [(TransitDirectionsExitPlanView *)self->_exitPlanView setIndexSetOfSuggestedCars:0];
    [(TransitDirectionsExitPlanView *)self->_exitPlanView setNumberOfCars:0];
  }
  button = self->_button;
  double v53 = [(TransitDirectionsBoardingInfoView *)self traitCollection];
  -[MapsLargerHitTargetButton setEnabled:](button, "setEnabled:", [v53 isLuminanceReduced] ^ 1);

  [(TransitDirectionsBoardingInfoView *)self _updateLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsBoardingInfoView;
  id v4 = a3;
  [(TransitDirectionsBoardingInfoView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(TransitDirectionsBoardingInfoView *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    id v7 = [(TransitDirectionsBoardingInfoView *)self traitCollection];
    unsigned int v8 = [v7 isLuminanceReduced];

    [(MapsLargerHitTargetButton *)self->_button setEnabled:v8 ^ 1];
  }
}

- (GEOTransitBoardingInfoEntry)entry
{
  return self->_entry;
}

- (GEOTransitExitPlanInfo)exitPlanInfo
{
  return self->_exitPlanInfo;
}

- (NSArray)preboardingStrings
{
  return self->_preboardingStrings;
}

- (unint64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(unint64_t)a3
{
  self->_entryType = a3;
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (BOOL)forceVerticalAxis
{
  return self->_forceVerticalAxis;
}

- (BOOL)useAlternativeInstruction
{
  return self->_useAlternativeInstruction;
}

- (NSLayoutConstraint)fixedWidthConstraint
{
  return self->_fixedWidthConstraint;
}

- (void)setFixedWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedWidthConstraint, 0);
  objc_storeStrong((id *)&self->_preboardingStrings, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_trailingHairline, 0);
  objc_storeStrong((id *)&self->_exitPlanInfo, 0);
  objc_storeStrong((id *)&self->_occupancyAndExitStackView, 0);
  objc_storeStrong((id *)&self->_labelAndButtonStackView, 0);
  objc_storeStrong((id *)&self->_exitPlanView, 0);
  objc_storeStrong((id *)&self->_occupancyStatusView, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end