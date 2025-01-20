@interface TransitDirectionsInstructionsStepView
- ($29727DC6989B69F22950FCD998EA20D4)_metrics;
- (BOOL)_combineAccessoryLabels;
- (BOOL)_hasTrailingContent;
- (BOOL)_useSingleInstructionMetrics;
- (MKArtworkImageView)platformArtworkImageView;
- (MKMultiPartLabel)secondaryLabel;
- (MKMultiPartLabel)tertiaryLabel;
- (MapsLargerHitTargetButton)detailButton;
- (TransitArtworkListView)badgesArtworkListView;
- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate;
- (TransitDirectionsListExpandableItem)expandableItem;
- (_MKUILabel)primaryAccessoryLabel;
- (_MKUILabel)primaryLabel;
- (_MKUILabel)secondaryAccessoryLabel;
- (double)_availableWidthForInstructionType:(int64_t)a3;
- (double)_detailButtonBaselineToLabelBaselineDistance;
- (double)_extraSpacingAboveView:(id)a3;
- (double)_instructionsLabelToTrailingLayoutGuideDistance;
- (double)_maximumIconHeight;
- (double)_maximumIconWidth;
- (double)_minPlatformArtworkBottomToBottomDistance;
- (double)_secondaryFirstBaselineToBottomPlatformArtworkDistance;
- (id)_constraintsForCellStyle:(unint64_t)a3;
- (id)_fontForInstructionType:(int64_t)a3;
- (id)_imageViewPositionConstraints;
- (id)_labelViewForInstructionType:(int64_t)a3;
- (id)_layoutItemForInstructionType:(int64_t)a3;
- (id)_platformArtworkHorizontalPositioningConstraint;
- (id)_textAttributesForInstructionType:(int64_t)a3;
- (unint64_t)_bestCellStyleForCurrentState;
- (unint64_t)cellStyle;
- (void)_configureLabelForInstruction:(int64_t)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_detailButtonTapped:(id)a3;
- (void)_setCellStyle:(unint64_t)cellStyle;
- (void)_updateAccessoryLabelCompressionHuggingPriorities;
- (void)_updateConstraintValues;
- (void)_updateConstraints;
- (void)_updateMultipleInstructionImagePositionConstraint;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)_updateNavigationStateDependentFonts;
- (void)configureWithItem:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setExpandableCellDelegate:(id)a3;
- (void)setNavigationState:(int64_t)a3;
- (void)setUseNavigationMetrics:(BOOL)a3;
- (void)updateExpandCollapseStyling;
@end

@implementation TransitDirectionsInstructionsStepView

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsIconStepView *)&v4 prepareForReuse];
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;
}

- (void)_createSubviews
{
  v102.receiver = self;
  v102.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsIconStepView *)&v102 _createSubviews];
  self->_cellStyle = [(TransitDirectionsInstructionsStepView *)self _bestCellStyleForCurrentState];
  id v3 = objc_alloc((Class)_MKUILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [_MKUILabel initWithFrame:CGRectZero.origin.x, y, width, height];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  [(_MKUILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(_MKUILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  if (sub_1000BBB44(self) == 5) {
    +[UIColor systemWhiteColor];
  }
  else {
  v9 = +[UIColor labelColor];
  }
  [(_MKUILabel *)self->_primaryLabel setHighlightedTextColor:v9];

  [(_MKUILabel *)self->_primaryLabel setNumberOfLines:0];
  [(_MKUILabel *)self->_primaryLabel setUserInteractionEnabled:0];
  v10 = self;
  if (![(TransitDirectionsStepView *)v10 useNavigationMetrics])
  {
    if (sub_1000BBB44(v10) == 5) {
      +[UIFont system17];
    }
    else {
    uint64_t v13 = +[UIFont system17SemiBold];
    }
    goto LABEL_15;
  }
  id v11 = [(TransitDirectionsStepView *)v10 navigationState];
  uint64_t v12 = sub_1000BBB44(v10);
  if (v11 != (id)4)
  {
    if (v12 != 5)
    {
      uint64_t v13 = +[UIFont system22Semibold];
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v12 == 5)
  {
LABEL_12:
    uint64_t v13 = +[UIFont system22];
    goto LABEL_15;
  }
  uint64_t v13 = +[UIFont system22Bold];
LABEL_15:
  v14 = (void *)v13;

  [(_MKUILabel *)self->_primaryLabel setFont:v14];
  LODWORD(v15) = 1148846080;
  [(_MKUILabel *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(_MKUILabel *)self->_primaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v16];
  v17 = [objc_alloc((Class)MKMultiPartLabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  secondaryLabel = v10->_secondaryLabel;
  v10->_secondaryLabel = v17;

  [(MKMultiPartLabel *)v10->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(MKMultiPartLabel *)v10->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = v10;
  unsigned int v20 = [(TransitDirectionsStepView *)v19 useNavigationMetrics];
  v21 = v19;
  uint64_t v22 = sub_1000BBB44(v21);
  double v101 = height;
  if (v20 || v22 == 5)
  {
    double v23 = width;
    double v24 = y;
    double x = CGRectZero.origin.x;
    uint64_t v26 = +[UIFont system17];
  }
  else
  {
    double v23 = width;
    double v24 = y;
    double x = CGRectZero.origin.x;
    uint64_t v26 = +[UIFont system15];
  }
  v27 = (void *)v26;

  [(MKMultiPartLabel *)v10->_secondaryLabel setFont:v27];
  [(MKMultiPartLabel *)v10->_secondaryLabel setNumberOfLines:0];
  v28 = +[UIColor secondaryLabelColor];
  [(MKMultiPartLabel *)v10->_secondaryLabel setTextColor:v28];

  v29 = [(_MKUILabel *)self->_primaryLabel highlightedTextColor];
  [(MKMultiPartLabel *)v10->_secondaryLabel setHighlightedTextColor:v29];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[MKMultiPartLabel setTextInset:](v10->_secondaryLabel, "setTextInset:", UIEdgeInsetsZero.top, left, bottom, right);
  [(MKMultiPartLabel *)v10->_secondaryLabel setUserInteractionEnabled:0];
  LODWORD(v33) = 1148846080;
  [(MKMultiPartLabel *)v10->_secondaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v33];
  LODWORD(v34) = 1148846080;
  [(MKMultiPartLabel *)v10->_secondaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v34];
  id v35 = [objc_alloc((Class)MKMultiPartLabel) initWithFrame:x v24 v23 v101];
  id v36 = v21[44];
  v21[44] = v35;

  [v21[44] setAccessibilityIdentifier:@"TertiaryLabel"];
  [v21[44] setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = v21;
  if (sub_1000BBB44(v37) == 5) {
    +[UIFont system17];
  }
  else {
  v38 = +[UIFont system15];
  }
  v39 = [v38 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [v21[44] setFont:v39];
  [v21[44] setNumberOfLines:0];
  v40 = +[UIColor secondaryLabelColor];
  [v21[44] setTextColor:v40];

  v41 = [(_MKUILabel *)self->_primaryLabel highlightedTextColor];
  [v21[44] setHighlightedTextColor:v41];

  [v21[44] setTextInset:UIEdgeInsetsZero.top, left, bottom, right];
  [v21[44] setUserInteractionEnabled:0];
  LODWORD(v42) = 1148846080;
  [v21[44] _mapkit_setContentCompressionResistancePriority:1 forAxis:v42];
  LODWORD(v43) = 1148846080;
  [v21[44] _mapkit_setContentHuggingPriority:1 forAxis:v43];
  v44 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", x, v24, v23, v101);
  id v45 = v37[45];
  v37[45] = v44;

  [v37[45] setAccessibilityIdentifier:@"BadgesArtworkListView"];
  [v37[45] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37[45] setUserInteractionEnabled:0];
  LODWORD(v46) = 1148846080;
  [v37[45] _mapkit_setContentCompressionResistancePriority:1 forAxis:v46];
  LODWORD(v47) = 1148846080;
  [v37[45] _mapkit_setContentHuggingPriority:1 forAxis:v47];
  id v48 = [objc_alloc((Class)_MKUILabel) initWithFrame:x v24, v23, v101];
  id v49 = v37[46];
  v37[46] = v48;

  [v37[46] setAccessibilityIdentifier:@"PrimaryAccessoryLabel"];
  [v37[46] setTranslatesAutoresizingMaskIntoConstraints:0];
  v50 = v37;
  v51 = [v50 traitCollection];
  id v52 = [v51 userInterfaceIdiom];
  UIFontTextStyle v53 = UIFontTextStyleBody;
  if (v52 != (id)5) {
    UIFontTextStyle v53 = UIFontTextStyleSubheadline;
  }
  v54 = v53;

  v55 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v54];

  v56 = [v55 fontDescriptor];
  [v56 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:1];
  v58 = v57 = self;

  v59 = +[UIFont fontWithDescriptor:v58 size:0.0];

  [v37[46] setFont:v59];
  [v37[46] _setMultilineLabelRequiresCarefulMeasurement:1];
  v60 = [(_MKUILabel *)v57->_primaryLabel highlightedTextColor];
  [v37[46] setHighlightedTextColor:v60];

  [v37[46] setUserInteractionEnabled:0];
  LODWORD(v61) = 1148846080;
  [v37[46] _mapkit_setContentCompressionResistancePriority:1 forAxis:v61];
  LODWORD(v62) = 1148846080;
  [v37[46] _mapkit_setContentHuggingPriority:1 forAxis:v62];
  id v63 = [objc_alloc((Class)_MKUILabel) initWithFrame:x, v24, v23, v101];
  id v64 = v50[47];
  v50[47] = v63;

  [v50[47] setAccessibilityIdentifier:@"SecondaryAccessoryLabel"];
  [v50[47] setTranslatesAutoresizingMaskIntoConstraints:0];
  v65 = v50;
  v66 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline];
  v67 = [v65 traitCollection];
  id v68 = [v67 userInterfaceIdiom];

  if (v68 == (id)5)
  {
    v69 = [v66 fontDescriptor];
    v70 = [v69 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplay];

    uint64_t v71 = +[UIFont fontWithDescriptor:v70 size:0.0];

    v66 = (void *)v71;
  }

  [v50[47] setFont:v66];
  v72 = +[UIColor systemGrayColor];
  [v50[47] setTextColor:v72];

  v73 = [(_MKUILabel *)v57->_primaryLabel highlightedTextColor];
  [v50[47] setHighlightedTextColor:v73];

  [v50[47] setUserInteractionEnabled:0];
  LODWORD(v74) = 1148846080;
  [v50[47] _mapkit_setContentCompressionResistancePriority:1 forAxis:v74];
  LODWORD(v75) = 1148846080;
  [v50[47] _mapkit_setContentHuggingPriority:1 forAxis:v75];
  v76 = [[PassThroughStackView alloc] initWithArrangedSubviews:&__NSArray0__struct];
  id v77 = v65[37];
  v65[37] = v76;

  [v65[37] setAccessibilityIdentifier:@"TextStackView"];
  [v65[37] setAlignment:1];
  [v65[37] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v65[37] set_mk_axis:1];
  [v65[37] setSpacing:0.0];
  [v65[37] setDistribution:0];
  LODWORD(v78) = 1144766464;
  [v65[37] _mapkit_setContentCompressionResistancePriority:0 forAxis:v78];
  LODWORD(v79) = 1148846080;
  [v65[37] _mapkit_setContentCompressionResistancePriority:1 forAxis:v79];
  LODWORD(v80) = 1148846080;
  [v65[37] _mapkit_setContentHuggingPriority:1 forAxis:v80];
  LODWORD(v81) = 1132068864;
  [v65[37] _mapkit_setContentHuggingPriority:0 forAxis:v81];
  [v65 addSubview:v65[37]];
  id v82 = objc_alloc_init((Class)UILayoutGuide);
  id v83 = v65[33];
  v65[33] = v82;

  [v65 addLayoutGuide:v65[33]];
  uint64_t v84 = [v65 _createImageView];
  id v85 = v65[48];
  v65[48] = (id)v84;

  [v65[48] setAccessibilityIdentifier:@"PlatformArtworkImageView"];
  [(MKMultiPartLabel *)v10->_secondaryLabel _mapkit_contentHuggingPriorityForAxis:0];
  *(float *)&double v87 = v86 + 1.0;
  [v65[48] _mapkit_setContentHuggingPriority:0 forAxis:v87];
  [(MKMultiPartLabel *)v10->_secondaryLabel _mapkit_contentCompressionResistancePriorityForAxis:0];
  *(float *)&double v89 = v88 + 1.0;
  [v65[48] _mapkit_setContentCompressionResistancePriority:0 forAxis:v89];
  [v65 addSubview:v65[48]];
  uint64_t v90 = +[MapsLargerHitTargetButton buttonWithType:1];
  id v91 = v65[49];
  v65[49] = (id)v90;

  [v65[49] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v65[49] setAccessibilityIdentifier:@"DetailButton"];
  v92 = [v65 traitCollection];
  if ([v92 userInterfaceIdiom] == (id)5) {
    double v93 = 6.0;
  }
  else {
    double v93 = 8.0;
  }

  v94 = [v65 detailButton];
  [v94 setTouchInsets:-v93, -16.0, -v93, -16.0];

  id v95 = v65[49];
  v96 = v65;
  if (sub_1000BBB44(v96) == 5) {
    +[UIFont system17];
  }
  else {
  v97 = +[UIFont system15];
  }

  v98 = [v97 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [v95 _setFont:v98];
  id v99 = v65[49];
  v100 = +[UIColor systemGrayColor];
  [v99 setTitleColor:v100 forStates:2];

  [v65[49] addTarget:v96 action:"_detailButtonTapped:" forControlEvents:64];
  [v96 addSubview:v65[49]];
  [v96 updateExpandCollapseStyling];
  [v96 _setCellStyle:v57->_cellStyle];
}

- (unint64_t)_bestCellStyleForCurrentState
{
  id v3 = +[UIApplication sharedApplication];
  objc_super v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    return 1;
  }
  if ([(TransitDirectionsStepView *)self useNavigationMetrics]) {
    return 2;
  }
  return 0;
}

- (void)_setCellStyle:(unint64_t)cellStyle
{
  self->_cellStyle = cellStyle;
  styleConstraints = self->_styleConstraints;
  if (styleConstraints)
  {
    [(_TransitDirectionsInstructionsCellConstraints *)styleConstraints deactivateConstraints];
    v5 = self->_styleConstraints;
    self->_styleConstraints = 0;

    cellStyle = self->_cellStyle;
  }
  switch(cellStyle)
  {
    case 2uLL:
      goto LABEL_6;
    case 1uLL:
      textStackView = self->_textStackView;
      p_primaryAccessoryLabel = &self->_primaryAccessoryLabel;
      primaryAccessoryLabel = self->_primaryAccessoryLabel;
      v26[0] = self->_primaryLabel;
      v26[1] = primaryAccessoryLabel;
      secondaryLabel = self->_secondaryLabel;
      v26[2] = self->_secondaryAccessoryLabel;
      v26[3] = secondaryLabel;
      badgesArtworkListView = self->_badgesArtworkListView;
      v26[4] = self->_tertiaryLabel;
      v26[5] = badgesArtworkListView;
      double v16 = +[NSArray arrayWithObjects:v26 count:6];
      [(UIStackView *)textStackView _mapkit_setArrangedSubviews:v16];

      [(_MKUILabel *)self->_primaryAccessoryLabel setTextAlignment:4];
      [(_MKUILabel *)self->_secondaryAccessoryLabel setTextAlignment:4];
      uint64_t v17 = 2;
LABEL_17:
      [(_MKUILabel *)*p_primaryAccessoryLabel setNumberOfLines:v17];
      break;
    case 0uLL:
LABEL_6:
      unsigned int v6 = [(TransitDirectionsInstructionsStepView *)self _combineAccessoryLabels];
      v7 = self->_textStackView;
      if (v6)
      {
        v8 = self->_primaryAccessoryLabel;
        v28[0] = self->_primaryLabel;
        v28[1] = v8;
        tertiaryLabel = self->_tertiaryLabel;
        v28[2] = self->_secondaryLabel;
        v28[3] = tertiaryLabel;
        v28[4] = self->_badgesArtworkListView;
        v10 = +[NSArray arrayWithObjects:v28 count:5];
        [(UIStackView *)v7 _mapkit_setArrangedSubviews:v10];

        [(_MKUILabel *)self->_primaryAccessoryLabel setTextAlignment:4];
        [(_MKUILabel *)self->_secondaryAccessoryLabel setTextAlignment:4];
        [(_MKUILabel *)self->_secondaryAccessoryLabel removeFromSuperview];
      }
      else
      {
        v18 = self->_secondaryLabel;
        v27[0] = self->_primaryLabel;
        v27[1] = v18;
        v19 = self->_badgesArtworkListView;
        v27[2] = self->_tertiaryLabel;
        v27[3] = v19;
        unsigned int v20 = +[NSArray arrayWithObjects:v27 count:4];
        [(UIStackView *)v7 _mapkit_setArrangedSubviews:v20];

        if (MKApplicationLayoutDirectionIsRightToLeft()) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = 2;
        }
        [(_MKUILabel *)self->_primaryAccessoryLabel setTextAlignment:v21];
        if (MKApplicationLayoutDirectionIsRightToLeft()) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = 2;
        }
        [(_MKUILabel *)self->_secondaryAccessoryLabel setTextAlignment:v22];
        [(TransitDirectionsInstructionsStepView *)self addSubview:self->_primaryAccessoryLabel];
        [(TransitDirectionsInstructionsStepView *)self addSubview:self->_secondaryAccessoryLabel];
      }
      p_primaryAccessoryLabel = &self->_primaryAccessoryLabel;
      uint64_t v17 = 3;
      goto LABEL_17;
  }
  [(TransitDirectionsInstructionsStepView *)self _contentSizeCategoryDidChange];
  double v23 = [(TransitDirectionsInstructionsStepView *)self _constraintsForCellStyle:self->_cellStyle];
  double v24 = self->_styleConstraints;
  self->_styleConstraints = v23;

  v25 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints initialConstraints];
  +[NSLayoutConstraint activateConstraints:v25];

  [(TransitDirectionsInstructionsStepView *)self _cellStyleDidChange];
  [(TransitDirectionsInstructionsStepView *)self _updateConstraints];
}

- (double)_extraSpacingAboveView:(id)a3
{
  objc_super v4 = (_MKUILabel *)a3;
  double v5 = 0.0;
  if (self->_primaryAccessoryLabel == v4)
  {
    [(TransitDirectionsInstructionsStepView *)self _metrics];
    double v5 = v9;
  }
  if (self->_secondaryLabel == v4)
  {
    [(TransitDirectionsInstructionsStepView *)self _metrics];
    double v5 = v8;
  }
  if ((_MKUILabel *)self->_badgesArtworkListView == v4) {
    double v6 = 4.0;
  }
  else {
    double v6 = v5;
  }

  return v6;
}

- (id)_constraintsForCellStyle:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  double v5 = objc_alloc_init(_TransitDirectionsInstructionsCellConstraints);
  double v6 = [(TransitDirectionsInstructionsStepView *)self heightAnchor];
  v7 = [v6 constraintGreaterThanOrEqualToConstant:0.0];
  double v8 = [v7 _maps_withIdentifier:@"minimumCellHeightConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v5 setMinimumCellHeightConstraint:v8];

  double v9 = [(_TransitDirectionsInstructionsCellConstraints *)v5 minimumCellHeightConstraint];
  [v4 addObject:v9];

  v10 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  id v11 = [v10 bottomAnchor];
  uint64_t v12 = [(MKArtworkImageView *)self->_platformArtworkImageView bottomAnchor];
  [(TransitDirectionsInstructionsStepView *)self _minPlatformArtworkBottomToBottomDistance];
  uint64_t v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12];
  v14 = [v13 _maps_withIdentifier:@"platformArtworkBottomToBottomConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v5 setPlatformArtworkBottomToBottomConstraint:v14];

  double v15 = [(_TransitDirectionsInstructionsCellConstraints *)v5 platformArtworkBottomToBottomConstraint];
  [v4 addObject:v15];

  double v16 = [(MapsLargerHitTargetButton *)self->_detailButton trailingAnchor];
  uint64_t v17 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  unsigned int v20 = [v19 _maps_withIdentifier:@"detailButtonTrailingToContentTrailing"];
  [v4 addObject:v20];

  uint64_t v21 = [(MapsLargerHitTargetButton *)self->_detailButton firstBaselineAnchor];
  uint64_t v22 = [(_MKUILabel *)self->_primaryLabel firstBaselineAnchor];
  double v23 = [v21 constraintEqualToAnchor:v22];
  double v24 = [v23 _maps_withIdentifier:@"detailButtonBaselineToPrimaryLabelBaseline"];
  [v4 addObject:v24];

  v25 = [(MKArtworkImageView *)self->_platformArtworkImageView bottomAnchor];
  uint64_t v26 = [(MKMultiPartLabel *)self->_secondaryLabel firstBaselineAnchor];
  [(TransitDirectionsInstructionsStepView *)self _secondaryFirstBaselineToBottomPlatformArtworkDistance];
  v27 = [v25 constraintEqualToAnchor:v26];
  v28 = [v27 _maps_withIdentifier:@"secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v5 setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:v28];

  v29 = [(_TransitDirectionsInstructionsCellConstraints *)v5 secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint];
  [v4 addObject:v29];

  v30 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v31 = [v30 bottomAnchor];
  v32 = [(UIStackView *)self->_textStackView bottomAnchor];
  double v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
  double v34 = [v33 _maps_withIdentifier:@"contentBottomToTextStackBaseline"];
  [v4 addObject:v34];

  id v35 = self;
  id v36 = v5;

  v37 = [(TransitDirectionsInstructionsStepView *)v35 _platformArtworkHorizontalPositioningConstraint];
  v38 = [v37 _maps_withIdentifier:@"platformArtworkHorizontalPositioning"];
  [v4 addObject:v38];

  v179 = v35;
  v180 = v4;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      double v93 = [(UIStackView *)v35->_textStackView leadingAnchor];
      v94 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
      id v95 = [v94 leadingAnchor];
      v96 = [v93 constraintEqualToAnchor:v95];
      v97 = [v96 _maps_withIdentifier:@"contentLayoutGuideToPrimaryLeadingConstraint"];
      [(_TransitDirectionsInstructionsCellConstraints *)v36 setContentLayoutGuideToPrimaryLeadingConstraint:v97];

      v98 = [(_TransitDirectionsInstructionsCellConstraints *)v36 contentLayoutGuideToPrimaryLeadingConstraint];
      [v4 addObject:v98];

      id v99 = [(UIStackView *)v35->_textStackView topAnchor];
      v100 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
      double v101 = [v100 topAnchor];
      objc_super v102 = [v99 constraintEqualToAnchor:v101];
      v103 = [v102 _maps_withIdentifier:@"topToPrimaryConstraint"];
      [(_TransitDirectionsInstructionsCellConstraints *)v36 setTopToPrimaryConstraint:v103];

      v174 = v36;
      v104 = [(_TransitDirectionsInstructionsCellConstraints *)v36 topToPrimaryConstraint];
      [v4 addObject:v104];

      v105 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
      v106 = [v105 trailingAnchor];
      v107 = [(UIStackView *)v35->_textStackView trailingAnchor];
      v108 = [v106 constraintEqualToAnchor:v107];
      v109 = [v108 _maps_withIdentifier:@"contentTrailingToTextStackTrailing"];
      [v4 addObject:v109];

      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id obja = [(UIStackView *)v35->_textStackView arrangedSubviews];
      id v110 = [obja countByEnumeratingWithState:&v181 objects:v189 count:16];
      if (v110)
      {
        id v111 = v110;
        uint64_t v112 = *(void *)v182;
        do
        {
          for (i = 0; i != v111; i = (char *)i + 1)
          {
            if (*(void *)v182 != v112) {
              objc_enumerationMutation(obja);
            }
            v114 = *(_MKUILabel **)(*((void *)&v181 + 1) + 8 * i);
            v115 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
            v116 = [v115 trailingAnchor];
            v117 = [(_MKUILabel *)v114 trailingAnchor];
            v118 = [v116 constraintEqualToAnchor:v117];
            v119 = [v118 _maps_withIdentifier:@"contentTrailingToLabelTrailing"];

            id v35 = v179;
            if (v114 == v179->_primaryLabel)
            {
              [(_TransitDirectionsInstructionsCellConstraints *)v174 setPrimaryAccessoryToTrailingConstraint:v119];
              v120 = [(_TransitDirectionsInstructionsCellConstraints *)v174 primaryAccessoryToTrailingConstraint];
              [v120 setIdentifier:@"primaryAccessoryToTrailingConstraint"];
            }
            id v4 = v180;
            [v180 addObject:v119];
          }
          id v111 = [obja countByEnumeratingWithState:&v181 objects:v189 count:16];
        }
        while (v111);
      }

      goto LABEL_27;
    }
    if (a3) {
      goto LABEL_28;
    }
  }
  v39 = [(_MKUILabel *)v35->_primaryLabel topAnchor];
  v40 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
  v41 = [v40 topAnchor];
  double v42 = [v39 constraintEqualToAnchor:v41];
  double v43 = [v42 _maps_withIdentifier:@"topToPrimaryConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setTopToPrimaryConstraint:v43];

  v44 = [(_TransitDirectionsInstructionsCellConstraints *)v36 topToPrimaryConstraint];
  [v4 addObject:v44];

  id v45 = [(TransitDirectionsStepView *)v35 contentLayoutGuide];
  double v46 = [v45 bottomAnchor];
  double v47 = [(TransitDirectionsInstructionsStepView *)v35 primaryLabel];
  id v48 = [v47 bottomAnchor];
  id v49 = [v46 constraintGreaterThanOrEqualToAnchor:v48];
  [v49 _maps_withIdentifier:@"primaryToContentBottomConstraint"];
  v51 = p_isa = (id *)&v35->super.super.super.super.super.isa;
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPrimaryBaselineToBottomConstraint:v51];

  id v52 = [(_TransitDirectionsInstructionsCellConstraints *)v36 primaryBaselineToBottomConstraint];
  [v4 addObject:v52];

  UIFontTextStyle v53 = [p_isa primaryLabel];
  v54 = [v53 leadingAnchor];
  v55 = [p_isa contentLayoutGuide];
  v56 = [v55 leadingAnchor];
  v57 = [v54 constraintEqualToAnchor:v56];
  v58 = [v57 _maps_withIdentifier:@"contentLayoutGuideToPrimaryLeadingConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setContentLayoutGuideToPrimaryLeadingConstraint:v58];

  v59 = [(_TransitDirectionsInstructionsCellConstraints *)v36 contentLayoutGuideToPrimaryLeadingConstraint];
  [v4 addObject:v59];

  v60 = [p_isa[37] leadingAnchor];
  double v61 = [p_isa[48] trailingAnchor];
  double v62 = [p_isa traitCollection];
  if ([v62 userInterfaceIdiom] == (id)5) {
    double v63 = 6.0;
  }
  else {
    double v63 = 4.0;
  }

  id v64 = [v60 constraintEqualToAnchor:v61 constant:v63];
  v65 = [v64 _maps_withIdentifier:@"platformArtworkTrailingToTextStackLabelLeadingConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:v65];

  v66 = [p_isa[37] leadingAnchor];
  v67 = [p_isa[42] leadingAnchor];
  id v68 = [v66 constraintEqualToAnchor:v67];
  v69 = [v68 _maps_withIdentifier:@"textStackLeadingToPrimaryLabelLeadingConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setTextStackLeadingToPrimaryLabelLeadingConstraint:v69];

  v70 = [(_TransitDirectionsInstructionsCellConstraints *)v36 textStackLeadingToPrimaryLabelLeadingConstraint];
  LODWORD(v71) = 1148829696;
  [v70 setPriority:v71];

  v72 = [(_TransitDirectionsInstructionsCellConstraints *)v36 textStackLeadingToPrimaryLabelLeadingConstraint];
  [v4 addObject:v72];

  v73 = [p_isa[33] leadingAnchor];
  double v74 = [p_isa[42] trailingAnchor];
  double v75 = [v73 constraintEqualToAnchor:v74];
  v76 = [v75 _maps_withIdentifier:@"primaryLabelTrailingToTrailingContentConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPrimaryLabelTrailingToTrailingContentConstraint:v76];

  id v77 = [(_TransitDirectionsInstructionsCellConstraints *)v36 primaryLabelTrailingToTrailingContentConstraint];
  [v4 addObject:v77];

  double v78 = [p_isa[33] leadingAnchor];
  double v79 = [p_isa[43] trailingAnchor];
  double v80 = [v78 constraintEqualToAnchor:v79];
  double v81 = [v80 _maps_withIdentifier:@"secondaryLabelTrailingToTrailingContentConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setSecondaryLabelTrailingToTrailingContentConstraint:v81];

  id v82 = [(_TransitDirectionsInstructionsCellConstraints *)v36 secondaryLabelTrailingToTrailingContentConstraint];
  [v4 addObject:v82];

  id v83 = [p_isa[44] trailingAnchor];
  uint64_t v84 = [p_isa contentLayoutGuide];
  id v85 = [v84 trailingAnchor];
  float v86 = [v83 constraintEqualToAnchor:v85];
  double v87 = [v86 _maps_withIdentifier:@"tertiaryLabelTrailingToContentTrailing"];
  [v4 addObject:v87];

  if ([p_isa _combineAccessoryLabels])
  {
    float v88 = [p_isa contentLayoutGuide];
    double v89 = [v88 trailingAnchor];
    uint64_t v90 = [p_isa[37] trailingAnchor];
    id v91 = [v89 constraintEqualToAnchor:v90];
    v92 = [v91 _maps_withIdentifier:@"contentTrailingToTextStackTrailing"];
    [v4 addObject:v92];

    goto LABEL_28;
  }
  v121 = [p_isa[46] trailingAnchor];
  v122 = [p_isa contentLayoutGuide];
  v123 = [v122 trailingAnchor];
  v124 = [v121 constraintEqualToAnchor:v123];
  v125 = [v124 _maps_withIdentifier:@"primaryAccessoryToTrailingConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPrimaryAccessoryToTrailingConstraint:v125];

  v126 = [(_TransitDirectionsInstructionsCellConstraints *)v36 primaryAccessoryToTrailingConstraint];
  [v4 addObject:v126];

  v127 = [p_isa[47] trailingAnchor];
  v128 = [p_isa[46] trailingAnchor];
  v129 = [v127 constraintEqualToAnchor:v128];
  v130 = [v129 _maps_withIdentifier:@"secondaryAccessoryTrailingToPrimaryAccessoryTrailing"];
  [v4 addObject:v130];

  v131 = [p_isa[47] bottomAnchor];
  v132 = [p_isa contentLayoutGuide];
  v133 = [v132 bottomAnchor];
  v134 = [v131 constraintLessThanOrEqualToAnchor:v133];
  v135 = [v134 _maps_withIdentifier:@"secondaryAccessoryBaselineToContentBottom"];
  [v4 addObject:v135];

  v136 = [p_isa[47] topAnchor];
  v137 = [p_isa[46] bottomAnchor];
  v138 = [v136 constraintEqualToAnchor:v137];
  v139 = [v138 _maps_withIdentifier:@"primaryAccessoryToSecondaryAccessoryConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPrimaryAccessoryToSecondaryAccessoryConstraint:v139];

  v140 = [(_TransitDirectionsInstructionsCellConstraints *)v36 primaryAccessoryToSecondaryAccessoryConstraint];
  [v4 addObject:v140];

  v141 = [p_isa[46] firstBaselineAnchor];
  v142 = [p_isa primaryLabel];
  v143 = [v142 firstBaselineAnchor];
  v144 = [v141 constraintEqualToAnchor:v143];
  v145 = [v144 _maps_withIdentifier:@"primaryAccessoryBaselineToPrimaryBaseline"];
  [v4 addObject:v145];

  v146 = [p_isa[46] widthAnchor];
  v147 = [p_isa contentLayoutGuide];
  v148 = [v147 widthAnchor];
  v149 = [v146 constraintLessThanOrEqualToAnchor:v148 multiplier:0.5];
  v150 = [v149 _maps_withIdentifier:@"primaryAccessoryMaximumWidthFactorConstraint"];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setPrimaryAccessoryMaximumWidthFactorConstraint:v150];

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v151 = p_isa[47];
  v190[0] = p_isa[46];
  v190[1] = v151;
  id objb = +[NSArray arrayWithObjects:v190 count:2];
  id v152 = [objb countByEnumeratingWithState:&v185 objects:v191 count:16];
  v174 = v36;
  if (v152)
  {
    id v153 = v152;
    uint64_t v178 = *(void *)v186;
    do
    {
      for (j = 0; j != v153; j = (char *)j + 1)
      {
        if (*(void *)v186 != v178) {
          objc_enumerationMutation(objb);
        }
        v155 = *(void **)(*((void *)&v185 + 1) + 8 * (void)j);
        v156 = [v155 topAnchor];
        v157 = [(UILayoutGuide *)v179->_trailingContentLayoutGuide topAnchor];
        v158 = [v156 constraintGreaterThanOrEqualToAnchor:v157];
        v159 = [v158 _maps_withIdentifier:@"accessoryTopToTrailingContentTop"];
        [v180 addObject:v159];

        v160 = [v155 leadingAnchor];
        v161 = [(UILayoutGuide *)v179->_trailingContentLayoutGuide leadingAnchor];
        v162 = [v160 constraintEqualToAnchor:v161];
        v163 = [v162 _maps_withIdentifier:@"accessoryLeadingToTrailingContentLeading"];
        [v180 addObject:v163];

        v164 = [(UILayoutGuide *)v179->_trailingContentLayoutGuide trailingAnchor];
        v165 = [v155 trailingAnchor];
        v166 = [v164 constraintEqualToAnchor:v165];
        v167 = [v166 _maps_withIdentifier:@"accessoryTrailingToTrailingContentTrailing"];
        [v180 addObject:v167];

        v168 = [(UILayoutGuide *)v179->_trailingContentLayoutGuide bottomAnchor];
        v169 = [v155 bottomAnchor];
        v170 = [v168 constraintGreaterThanOrEqualToAnchor:v169];
        v171 = [v170 _maps_withIdentifier:@"accessoryBottomToTrailingContentBottom"];
        [v180 addObject:v171];
      }
      id v153 = [objb countByEnumeratingWithState:&v185 objects:v191 count:16];
    }
    while (v153);
  }

  id v4 = v180;
LABEL_27:
  id v36 = v174;
LABEL_28:
  id v172 = [v4 copy];
  [(_TransitDirectionsInstructionsCellConstraints *)v36 setInitialConstraints:v172];

  return v36;
}

- (id)_imageViewPositionConstraints
{
  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsInstructionsStepView;
  id v3 = [(TransitDirectionsIconStepView *)&v21 _imageViewPositionConstraints];
  id v4 = [v3 mutableCopy];

  if (!self->_imageViewSingleInstructionConstraint)
  {
    double v5 = [(MKArtworkImageView *)self->super._iconImageView centerYAnchor];
    double v6 = [(UIStackView *)self->_textStackView centerYAnchor];
    v7 = [v5 constraintEqualToAnchor:v6];
    [v7 _maps_withIdentifier:@"imageViewCenterToTextStackCenter"];
    double v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    imageViewSingleInstructionConstraint = self->_imageViewSingleInstructionConstraint;
    self->_imageViewSingleInstructionConstraint = v8;
  }
  if (!self->_imageViewMultipleInstructionsConstraint)
  {
    v10 = [(MKArtworkImageView *)self->super._iconImageView topAnchor];
    id v11 = [(UIStackView *)self->_textStackView topAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    [v12 _maps_withIdentifier:@"imageViewTopToTextStackTop"];
    uint64_t v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    imageViewMultipleInstructionsConstraint = self->_imageViewMultipleInstructionsConstraint;
    self->_imageViewMultipleInstructionsConstraint = v13;
  }
  [v4 addObject:self->_imageViewSingleInstructionConstraint];
  [v4 addObject:self->_imageViewMultipleInstructionsConstraint];
  double v15 = [(MKArtworkImageView *)self->super._iconImageView widthAnchor];
  [(TransitDirectionsInstructionsStepView *)self _maximumIconWidth];
  double v16 = [v15 constraintEqualToConstant:];
  [v4 addObject:v16];

  uint64_t v17 = [(MKArtworkImageView *)self->super._iconImageView heightAnchor];
  [(TransitDirectionsInstructionsStepView *)self _maximumIconHeight];
  v18 = [v17 constraintEqualToConstant:];
  [v4 addObject:v18];

  id v19 = [v4 copy];

  return v19;
}

- (void)_updateMultipleInstructionImagePositionConstraint
{
  id v3 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
  [v3 userInterfaceIdiom];

  double v4 = 6.0;
  if ([(TransitDirectionsStepView *)self useNavigationMetrics])
  {
    int64_t v5 = [(TransitDirectionsStepView *)self navigationState];
    double v6 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
    [v6 userInterfaceIdiom];

    if (v5 == 4) {
      double v4 = 10.0;
    }
    else {
      double v4 = 8.0;
    }
  }
  id v10 = [(_MKUILabel *)self->_primaryLabel font];
  v7 = self;
  if (v10) {
    [v10 _scaledValueForValue:v4];
  }
  UIRoundToViewScale();
  double v9 = v8;

  [(NSLayoutConstraint *)v7->_imageViewMultipleInstructionsConstraint setConstant:v9];
}

- (void)_updateConstraints
{
  [(TransitDirectionsInstructionsStepView *)self _updateConstraintValues];
  BOOL v3 = [(TransitDirectionsInstructionsStepView *)self _hasTrailingContent];
  double v4 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints primaryAccessoryMaximumWidthFactorConstraint];
  [v4 setActive:v3];

  [(TransitDirectionsInstructionsStepView *)self _updateAccessoryLabelCompressionHuggingPriorities];
  BOOL v5 = [(TransitDirectionsInstructionsStepView *)self _useSingleInstructionMetrics];
  LODWORD(v3) = v5;
  [(NSLayoutConstraint *)self->_imageViewSingleInstructionConstraint setActive:v5];
  [(NSLayoutConstraint *)self->_imageViewMultipleInstructionsConstraint setActive:v3 ^ 1];
  double v6 = [(TransitDirectionsStepView *)self transitListItem];
  v7 = [v6 minorStringImage];

  styleConstraints = self->_styleConstraints;
  if (v7)
  {
    double v9 = [(_TransitDirectionsInstructionsCellConstraints *)styleConstraints textStackLeadingToPrimaryLabelLeadingConstraint];
    [v9 setActive:0];

    id v10 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint];
    [v10 setActive:1];

    [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints platformArtworkBottomToBottomConstraint];
  }
  else
  {
    id v11 = [(_TransitDirectionsInstructionsCellConstraints *)styleConstraints platformArtworkBottomToBottomConstraint];
    [v11 setActive:0];

    uint64_t v12 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint];
    [v12 setActive:0];

    [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints textStackLeadingToPrimaryLabelLeadingConstraint];
  uint64_t v13 = };
  [v13 setActive:1];

  v14.receiver = self;
  v14.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsStepView *)&v14 _updateConstraints];
}

- (void)_updateConstraintValues
{
  [(TransitDirectionsInstructionsStepView *)self _updateMultipleInstructionImagePositionConstraint];
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  [(TransitDirectionsInstructionsStepView *)self _metrics];
  BOOL v3 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints minimumCellHeightConstraint];
  [v3 setConstant:0.0];

  double v4 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints contentLayoutGuideToPrimaryLeadingConstraint];
  [v4 setConstant:0.0];

  BOOL v5 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints topToPrimaryConstraint];
  [v5 setConstant:0.0];

  [(TransitDirectionsInstructionsStepView *)self _secondaryFirstBaselineToBottomPlatformArtworkDistance];
  double v7 = v6;
  double v8 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint];
  [v8 setConstant:v7];

  unint64_t cellStyle = self->_cellStyle;
  if (cellStyle == 2)
  {
LABEL_4:
    textStackView = self->_textStackView;
    [(TransitDirectionsInstructionsStepView *)self _extraSpacingAboveView:self->_badgesArtworkListView];
    double v12 = v11;
    uint64_t v13 = [(TransitDirectionsInstructionsStepView *)self tertiaryLabel];
    [(UIStackView *)textStackView setCustomSpacing:v13 afterView:v12];

    double v14 = 0.0;
    if ([(TransitDirectionsStepView *)self useNavigationMetrics])
    {
      double v15 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
      if ([v15 userInterfaceIdiom] == (id)5) {
        double v14 = 0.0;
      }
      else {
        double v14 = 46.0;
      }
    }
    if ([(TransitDirectionsInstructionsStepView *)self _hasTrailingContent])
    {
      double v16 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
      [v16 userInterfaceIdiom];

      double v14 = 10.0;
    }
    uint64_t v17 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints primaryLabelTrailingToTrailingContentConstraint];
    [v17 setConstant:v14];

    id v18 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints primaryLabelTrailingToTrailingContentConstraint];
    [v18 constant];
    double v20 = v19;
    objc_super v21 = [(_TransitDirectionsInstructionsCellConstraints *)self->_styleConstraints secondaryLabelTrailingToTrailingContentConstraint];
    [v21 setConstant:v20];
    goto LABEL_13;
  }
  if (cellStyle != 1)
  {
    if (cellStyle) {
      return;
    }
    goto LABEL_4;
  }
  uint64_t v22 = [(UIStackView *)self->_textStackView arrangedSubviews];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100CEDDDC;
  v23[3] = &unk_101321708;
  v25 = self;
  id v26 = [v22 count];
  double v24 = v22;
  id v18 = v22;
  [v18 enumerateObjectsUsingBlock:v23];
  objc_super v21 = v24;
LABEL_13:
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsIconStepView *)&v38 layoutSubviews];
  unint64_t v3 = [(TransitDirectionsInstructionsStepView *)self _bestCellStyleForCurrentState];
  if (v3 != self->_cellStyle)
  {
    [(TransitDirectionsInstructionsStepView *)self _setCellStyle:v3];
    [(TransitDirectionsInstructionsStepView *)self updateConstraints];
    [(TransitDirectionsInstructionsStepView *)self layoutSubviews];
    return;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [&off_1013AE868 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v4) {
    return;
  }
  id v5 = v4;
  long long v28 = "layoutSubviews";
  char v29 = 0;
  uint64_t v6 = *(void *)v35;
  uint64_t v31 = *(void *)v35;
  do
  {
    double v7 = 0;
    id v32 = v5;
    do
    {
      if (*(void *)v35 != v6) {
        objc_enumerationMutation(&off_1013AE868);
      }
      id v8 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v7) integerValue:v28];
      double v9 = [(TransitDirectionsInstructionsStepView *)self _layoutItemForInstructionType:v8];
      uint64_t v10 = [(TransitDirectionsInstructionsStepView *)self _labelViewForInstructionType:v8];
      double v11 = (void *)v10;
      if (v9) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v11;
          double v14 = [v13 text];
          if ([v14 length])
          {
            double v15 = [v9 bestFittingMultiPartString];
            double v16 = [v15 attributedString];
            if ([v16 length])
            {
              uint64_t v17 = [v13 multiPartString];
              id v18 = [v9 bestFittingMultiPartString];
              unint64_t v19 = v17;
              unint64_t v20 = v18;
              if (!(v19 | v20))
              {

                goto LABEL_29;
              }
              id v26 = (void *)v20;
              unsigned __int8 v30 = [(id)v19 isEqual:v20];

              if (v30)
              {
                uint64_t v6 = v31;
                id v5 = v32;
LABEL_31:

                goto LABEL_32;
              }
              double v14 = [v9 bestFittingMultiPartString];
              [v13 setMultiPartString:v14];
LABEL_29:
              uint64_t v6 = v31;
              id v5 = v32;
            }
            else
            {

              id v5 = v32;
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_32;
          }
          id v21 = v11;
          uint64_t v22 = [v9 bestFittingMultiPartString];
          double v14 = [v22 attributedString];

          double v23 = [v21 attributedText];
          if ([v23 length] && objc_msgSend(v14, "length"))
          {
            unint64_t v24 = [v21 attributedText];
            unint64_t v25 = v14;
            if (v25 | v24)
            {
              double v14 = (void *)v25;
              unsigned __int8 v27 = [(id)v24 isEqual:v25];

              if ((v27 & 1) == 0)
              {
                [v21 setAttributedText:v14];
                char v29 = 1;
              }
              uint64_t v6 = v31;
            }
            else
            {

              double v14 = 0;
            }
          }
          else
          {
          }
        }

        goto LABEL_31;
      }
LABEL_32:

      double v7 = (char *)v7 + 1;
    }
    while (v5 != v7);
    id v5 = [&off_1013AE868 countByEnumeratingWithState:&v34 objects:v39 count:16];
  }
  while (v5);
  if (v29)
  {
    [(TransitDirectionsInstructionsStepView *)self _updateConstraints];
    [(TransitDirectionsInstructionsStepView *)self _mapkit_setNeedsLayout];
    v33.receiver = self;
    v33.super_class = (Class)TransitDirectionsInstructionsStepView;
    [super v28];
  }
}

- (TransitDirectionsListExpandableItem)expandableItem
{
  if (!self->_checkedItemIsExpandable)
  {
    unint64_t v3 = [(TransitDirectionsStepView *)self transitListItem];
    if ([v3 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])
    {
      id v4 = [(TransitDirectionsStepView *)self transitListItem];
      objc_storeWeak((id *)&self->_expandableItem, v4);
    }
    else
    {
      objc_storeWeak((id *)&self->_expandableItem, 0);
    }

    self->_checkedItemIsExpandable = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableItem);

  return (TransitDirectionsListExpandableItem *)WeakRetained;
}

- (void)updateExpandCollapseStyling
{
  unint64_t v3 = [(TransitDirectionsInstructionsStepView *)self expandableItem];
  id v4 = [(MapsLargerHitTargetButton *)self->_detailButton currentTitle];
  if (v3)
  {
    id v5 = [v3 expandingButtonTitleForExpandedState:[v3 expanded]];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100CEE49C;
    v8[3] = &unk_1012E66E0;
    v8[4] = self;
    id v4 = v5;
    id v9 = v4;
    id v10 = v3;
    +[UIView performWithoutAnimation:v8];
  }
  if ([v4 length]) {
    uint64_t v6 = [v3 shouldDisplayExpandButton] ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }
  [(MapsLargerHitTargetButton *)self->_detailButton setHidden:v6];
  if (v3)
  {
    [(TransitDirectionsInstructionsStepView *)self _updateConstraints];
    double v7 = [(TransitDirectionsInstructionsStepView *)self detailButton];
    [v7 sizeToFit];
  }
}

- (BOOL)_useSingleInstructionMetrics
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v3 = [(UIStackView *)self->_textStackView arrangedSubviews];
  id v4 = [v3 reverseObjectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(_MKUILabel **)(*((void *)&v12 + 1) + 8 * i);
        if (v9 != self->_primaryLabel && ![(_MKUILabel *)v9 isHidden])
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_hasTrailingContent
{
  if (self->_cellStyle == 1) {
    return 0;
  }
  if ([(_MKUILabel *)self->_primaryAccessoryLabel isHidden]) {
    return [(_MKUILabel *)self->_secondaryAccessoryLabel isHidden] ^ 1;
  }
  return 1;
}

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var6 = 10.0;
  id v5 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
  if ([v5 userInterfaceIdiom] == (id)5) {
    double v6 = 30.0;
  }
  else {
    double v6 = 40.0;
  }

  retstr->var3 = v6;
  uint64_t v7 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
  [v7 userInterfaceIdiom];

  retstr->var4 = 30.0;
  id v8 = [(TransitDirectionsStepView *)self transitListItem];
  id v9 = (char *)[v8 type];

  if ((unint64_t)(v9 - 2) >= 0xD || (double v10 = 0.0, ((0x130Bu >> ((_BYTE)v9 - 2)) & 1) == 0))
  {
    unsigned int v11 = [(TransitDirectionsStepView *)self useNavigationMetrics];
    long long v12 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
    id v13 = [v12 userInterfaceIdiom];

    double v10 = 70.0;
    if (v11) {
      double v10 = 82.0;
    }
    if (v13 == (id)5) {
      double v10 = 43.0;
    }
  }
  retstr->var2 = v10;
  unsigned int v14 = [(TransitDirectionsStepView *)self useNavigationMetrics];
  long long v15 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
  double v16 = v15;
  if (v14) {
    double v17 = 24.0;
  }
  else {
    double v17 = 16.0;
  }
  if ([v15 userInterfaceIdiom] == (id)5) {
    double v17 = 10.0;
  }

  retstr->var0 = v17;
  return result;
}

- (double)_maximumIconWidth
{
  [(TransitDirectionsInstructionsStepView *)self _metrics];
  return v3;
}

- (double)_maximumIconHeight
{
  [(TransitDirectionsInstructionsStepView *)self _metrics];
  return v3;
}

- (double)_secondaryFirstBaselineToBottomPlatformArtworkDistance
{
  v2 = [(MKMultiPartLabel *)self->_secondaryLabel font];
  [v2 _scaledValueForValue:2.0];

  UIRoundToViewScale();
  return result;
}

- (double)_detailButtonBaselineToLabelBaselineDistance
{
  double v3 = [(MKMultiPartLabel *)self->_secondaryLabel font];
  id v4 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
  if ([v4 userInterfaceIdiom] == (id)5) {
    double v5 = 8.0;
  }
  else {
    double v5 = 20.0;
  }

  [v3 _scaledValueForValue:v5];

  UIRoundToViewScale();
  return result;
}

- (double)_minPlatformArtworkBottomToBottomDistance
{
  [(TransitDirectionsInstructionsStepView *)self _secondaryFirstBaselineToBottomPlatformArtworkDistance];

  UIRoundToViewScale();
  return result;
}

- (double)_instructionsLabelToTrailingLayoutGuideDistance
{
  UIRoundToViewScale();
  return result;
}

- (void)_detailButtonTapped:(id)a3
{
  id v5 = [(TransitDirectionsInstructionsStepView *)self expandableCellDelegate];
  id v4 = [(TransitDirectionsInstructionsStepView *)self expandableItem];
  [v5 transitDirectionsCell:self wantsToExpandOrCollapseItem:v4];
}

- (void)_updateNavigationStateDependentFonts
{
  [(NSMutableDictionary *)self->_layoutItemsByType setObject:0 forKeyedSubscript:&off_1013AB020];
  [(NSMutableDictionary *)self->_layoutItemsByType setObject:0 forKeyedSubscript:&off_1013AB038];
  double v3 = self;
  if (![(TransitDirectionsStepView *)v3 useNavigationMetrics])
  {
    if (sub_1000BBB44(v3) == 5) {
      +[UIFont system17];
    }
    else {
    uint64_t v6 = +[UIFont system17SemiBold];
    }
    goto LABEL_12;
  }
  id v4 = [(TransitDirectionsStepView *)v3 navigationState];
  uint64_t v5 = sub_1000BBB44(v3);
  if (v4 != (id)4)
  {
    if (v5 != 5)
    {
      uint64_t v6 = +[UIFont system22Semibold];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v5 == 5)
  {
LABEL_9:
    uint64_t v6 = +[UIFont system22];
    goto LABEL_12;
  }
  uint64_t v6 = +[UIFont system22Bold];
LABEL_12:
  uint64_t v7 = (void *)v6;

  [(_MKUILabel *)v3->_primaryLabel setFont:v7];
  id v8 = v3;
  LODWORD(v7) = [v8 useNavigationMetrics];
  uint64_t v9 = sub_1000BBB44(v8);
  if (v7 || v9 == 5)
  {
    uint64_t v10 = +[UIFont system17];
  }
  else
  {
    uint64_t v10 = +[UIFont system15];
  }
  unsigned int v11 = (void *)v10;

  [v8[43] setFont:v11];
  [v8 _configureLabelForInstruction:0];

  [v8 _configureLabelForInstruction:1];
}

- (void)_contentSizeCategoryDidChange
{
  v37.receiver = self;
  v37.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsStepView *)&v37 _contentSizeCategoryDidChange];
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;

  detailButton = self->_detailButton;
  uint64_t v5 = self;
  if (sub_1000BBB44(v5) == 5) {
    +[UIFont system17];
  }
  else {
  uint64_t v6 = +[UIFont system15];
  }
  uint64_t v7 = [v6 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [(MapsLargerHitTargetButton *)detailButton _setFont:v7];
  id v8 = v5;
  if (![v8 useNavigationMetrics])
  {
    if (sub_1000BBB44(v8) == 5) {
      +[UIFont system17];
    }
    else {
    uint64_t v11 = +[UIFont system17SemiBold];
    }
    goto LABEL_15;
  }
  id v9 = [v8 navigationState];
  uint64_t v10 = sub_1000BBB44(v8);
  if (v9 != (id)4)
  {
    if (v10 != 5)
    {
      uint64_t v11 = +[UIFont system22Semibold];
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v10 == 5)
  {
LABEL_12:
    uint64_t v11 = +[UIFont system22];
    goto LABEL_15;
  }
  uint64_t v11 = +[UIFont system22Bold];
LABEL_15:
  long long v12 = (void *)v11;

  [v8[42] setFont:v12];
  id v13 = v8;
  LODWORD(v12) = [v13 useNavigationMetrics];
  unsigned int v14 = v13;
  uint64_t v15 = sub_1000BBB44(v14);
  if (v12 || v15 == 5)
  {
    uint64_t v16 = +[UIFont system17];
  }
  else
  {
    uint64_t v16 = +[UIFont system15];
  }
  double v17 = (void *)v16;

  [v14[43] setFont:v17];
  id v18 = v14;
  if (sub_1000BBB44(v18) == 5) {
    +[UIFont system17];
  }
  else {
  unint64_t v19 = +[UIFont system15];
  }
  unint64_t v20 = [v19 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [v18[44] setFont:v20];
  id v21 = v18;
  uint64_t v22 = [v21 traitCollection];
  id v23 = [v22 userInterfaceIdiom];
  UIFontTextStyle v24 = UIFontTextStyleBody;
  if (v23 != (id)5) {
    UIFontTextStyle v24 = UIFontTextStyleSubheadline;
  }
  unint64_t v25 = v24;

  id v26 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v25];

  unsigned __int8 v27 = [v26 fontDescriptor];
  long long v28 = [v27 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:1];

  char v29 = +[UIFont fontWithDescriptor:v28 size:0.0];

  [v21[46] setFont:v29];
  unsigned __int8 v30 = v21;
  uint64_t v31 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline];
  id v32 = [v30 traitCollection];
  id v33 = [v32 userInterfaceIdiom];

  if (v33 == (id)5)
  {
    long long v34 = [v31 fontDescriptor];
    long long v35 = [v34 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplay];

    uint64_t v36 = +[UIFont fontWithDescriptor:v35 size:0.0];

    uint64_t v31 = (void *)v36;
  }

  [v30[47] setFont:v31];
  [v30 _updateConstraints];
}

- (void)_updateAccessoryLabelCompressionHuggingPriorities
{
  if ([(TransitDirectionsInstructionsStepView *)self _hasTrailingContent])
  {
    [(_MKUILabel *)self->_primaryLabel _mapkit_contentCompressionResistancePriorityForAxis:0];
    float v4 = 1000.0;
    if ((float)(*(float *)&v3 + 100.0) <= 1000.0)
    {
      [(_MKUILabel *)self->_primaryLabel _mapkit_contentCompressionResistancePriorityForAxis:0];
      float v4 = *(float *)&v3 + 100.0;
    }
    float v5 = v4 + -1.0;
  }
  else
  {
    float v5 = 999.0;
    float v4 = 1000.0;
  }
  *(float *)&double v3 = v4;
  [(_MKUILabel *)self->_primaryAccessoryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v3];
  *(float *)&double v6 = v4;
  [(_MKUILabel *)self->_secondaryAccessoryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v6];
  *(float *)&double v7 = v5;
  [(_MKUILabel *)self->_primaryAccessoryLabel _mapkit_setContentHuggingPriority:0 forAxis:v7];
  secondaryAccessoryLabel = self->_secondaryAccessoryLabel;
  *(float *)&double v9 = v5;

  [(_MKUILabel *)secondaryAccessoryLabel _mapkit_setContentHuggingPriority:0 forAxis:v9];
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsIconStepView *)&v20 configureWithItem:v4];
  self->_checkedItemIsExpandable = 0;
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;

  double v6 = [(UIStackView *)self->_textStackView arrangedSubviews];
  double v7 = [v6 valueForKeyPath:@"isHidden"];

  [(TransitDirectionsInstructionsStepView *)self _configureLabelForInstruction:0];
  [(TransitDirectionsInstructionsStepView *)self _configureLabelForInstruction:1];
  [(TransitDirectionsInstructionsStepView *)self _configureLabelForInstruction:2];
  [(TransitDirectionsInstructionsStepView *)self _configureLabelForInstruction:3];
  [(TransitDirectionsInstructionsStepView *)self _configureLabelForInstruction:4];
  id v8 = [(TransitDirectionsStepView *)self transitListItem];
  double v9 = [v8 minorStringImage];
  [(MKArtworkImageView *)self->_platformArtworkImageView setImageSource:v9];

  uint64_t v10 = [(TransitDirectionsStepView *)self transitListItem];
  uint64_t v11 = [v10 minorStringImage];
  [(MKArtworkImageView *)self->_platformArtworkImageView setHidden:v11 == 0];

  long long v12 = [v4 badges];
  id v13 = [v12 count];
  if (v13)
  {
    unsigned int v14 = [v4 badges];
    uint64_t v15 = +[GEOTransitStepBadge _maps_artworkListFromStepBadges:v14];
    p_badgesArtworkListView = &self->_badgesArtworkListView;
    [(TransitArtworkListView *)self->_badgesArtworkListView setArtworkData:v15];
  }
  else
  {
    p_badgesArtworkListView = &self->_badgesArtworkListView;
    [(TransitArtworkListView *)self->_badgesArtworkListView setArtworkData:0];
  }
  [(TransitArtworkListView *)*p_badgesArtworkListView setHidden:v13 == 0];
  [(TransitDirectionsInstructionsStepView *)self _updateAccessoryLabelCompressionHuggingPriorities];
  double v17 = [(TransitDirectionsInstructionsStepView *)self expandableItem];
  if (v17) {
    [(TransitDirectionsInstructionsStepView *)self updateExpandCollapseStyling];
  }
  id v18 = [(UIStackView *)self->_textStackView arrangedSubviews];
  unint64_t v19 = [v18 valueForKeyPath:@"isHidden"];

  if (([v19 isEqualToArray:v7] & 1) == 0) {
    [(TransitDirectionsInstructionsStepView *)self _updateConstraints];
  }
}

- (void)_configureLabelForInstruction:(int64_t)a3
{
  float v5 = [(TransitDirectionsInstructionsStepView *)self _layoutItemForInstructionType:"_layoutItemForInstructionType:"];
  id v21 = v5;
  switch(a3)
  {
    case 0:
      double v6 = [v5 bestFittingMultiPartString];
      double v7 = [v6 attributedString];
      [(_MKUILabel *)self->_primaryLabel setAttributedText:v7];

      goto LABEL_13;
    case 1:
      id v8 = [v5 strings];
      double v9 = [v8 firstObject];

      if (v9)
      {
        uint64_t v10 = [v21 bestFittingMultiPartString];
        uint64_t v11 = 344;
        goto LABEL_7;
      }
      uint64_t v20 = 344;
      goto LABEL_16;
    case 2:
      long long v12 = [v5 strings];
      id v13 = [v12 firstObject];

      if (v13)
      {
        uint64_t v10 = [v21 bestFittingMultiPartString];
        uint64_t v11 = 352;
LABEL_7:
        [*(id *)((char *)&self->super.super.super.super.super.isa + v11) setMultiPartString:v10];

        unsigned int v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v20 = 352;
LABEL_16:
        [*(id *)((char *)&self->super.super.super.super.super.isa + v20) setText:0];
        unsigned int v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v20);
        uint64_t v15 = 1;
      }
      [v14 setHidden:v15];
LABEL_18:
      float v5 = v21;
LABEL_19:

      return;
    case 3:
      if ([(TransitDirectionsInstructionsStepView *)self _combineAccessoryLabels])
      {
        uint64_t v16 = +[UIColor secondaryLabelColor];
        [(_MKUILabel *)self->_primaryAccessoryLabel setTextColor:v16];
      }
      double v17 = [v21 bestFittingMultiPartString];
      id v18 = [v17 attributedString];
      uint64_t v19 = 368;
      goto LABEL_12;
    case 4:
      double v17 = [v5 bestFittingMultiPartString];
      id v18 = [v17 attributedString];
      uint64_t v19 = 376;
LABEL_12:
      [*(id *)((char *)&self->super.super.super.super.super.isa + v19) setAttributedText:v18];

      double v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v19) attributedText];
      [*(id *)((char *)&self->super.super.super.super.super.isa + v19) setHidden:[v6 length] == 0];
LABEL_13:

      goto LABEL_18;
    default:
      goto LABEL_19;
  }
}

- (id)_layoutItemForInstructionType:(int64_t)a3
{
  -[TransitDirectionsInstructionsStepView _availableWidthForInstructionType:](self, "_availableWidthForInstructionType:");
  double v6 = v5;
  layoutItemsByType = self->_layoutItemsByType;
  id v8 = +[NSNumber numberWithInteger:a3];
  double v9 = [(NSMutableDictionary *)layoutItemsByType objectForKeyedSubscript:v8];

  if (v9)
  {
    [v9 setWidth:v6];
    uint64_t v10 = v9;
    goto LABEL_16;
  }
  uint64_t v11 = [(TransitDirectionsInstructionsStepView *)self _fontForInstructionType:a3];
  long long v12 = [(TransitDirectionsStepView *)self transitListItem];
  id v13 = [v12 formattedStringsForType:a3];

  if ((unint64_t)(a3 - 3) <= 1
    && [(TransitDirectionsInstructionsStepView *)self _combineAccessoryLabels])
  {
    uint64_t v14 = 0;
    if (a3 == 4)
    {
      id v18 = 0;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_9;
      }
      id v15 = [v13 mutableCopy];
      uint64_t v16 = [(TransitDirectionsStepView *)self transitListItem];
      double v17 = [v16 formattedStringsForType:4];
      [v15 addObjectsFromArray:v17];

      id v18 = [v15 copy];
      uint64_t v14 = 1;
      id v13 = v15;
    }

    id v13 = v18;
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_9:
  uint64_t v19 = [(TransitDirectionsInstructionsStepView *)self _textAttributesForInstructionType:a3];
  if (v11 && [v13 count])
  {
    if (!self->_layoutItemsByType)
    {
      uint64_t v20 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
      id v21 = self->_layoutItemsByType;
      self->_layoutItemsByType = v20;
    }
    uint64_t v22 = [[TransitInstructionLayoutItem alloc] initWithStrings:v13 font:v11 width:v19 extraTextAttributes:v6];
    [(TransitInstructionLayoutItem *)v22 setCombineStrings:v14];
    id v23 = self->_layoutItemsByType;
    UIFontTextStyle v24 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

    uint64_t v10 = v22;
  }
  else
  {
    uint64_t v10 = 0;
  }

LABEL_16:

  return v10;
}

- (id)_platformArtworkHorizontalPositioningConstraint
{
  unint64_t cellStyle = self->_cellStyle;
  if (cellStyle != 2)
  {
    if (cellStyle == 1)
    {
      double v5 = [(MKArtworkImageView *)self->_platformArtworkImageView trailingAnchor];
      double v6 = [(MKArtworkImageView *)self->super._iconImageView trailingAnchor];
      double v7 = [v5 constraintEqualToAnchor:v6];
      id v8 = v7;
      CFStringRef v9 = @"platformArtworkTrailingToIconTrailing";
      goto LABEL_6;
    }
    if (cellStyle) {
      goto LABEL_7;
    }
  }
  double v5 = [(MKArtworkImageView *)self->_platformArtworkImageView leadingAnchor];
  double v6 = [(_MKUILabel *)self->_primaryLabel leadingAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  id v8 = v7;
  CFStringRef v9 = @"platformArtworkLeadingToPrimaryLeading";
LABEL_6:
  v2 = [v7 _maps_withIdentifier:v9];

LABEL_7:

  return v2;
}

- (double)_availableWidthForInstructionType:(int64_t)a3
{
  [(TransitDirectionsInstructionsStepView *)self bounds];
  double v6 = v5;
  [(TransitDirectionsStepView *)self leadingInstructionMargin];
  double v8 = v6 - v7;
  [(TransitDirectionsStepView *)self _trailingGuideToContentViewDistance];
  double v10 = v8 - v9;
  uint64_t v11 = [(TransitDirectionsStepView *)self trailingView];
  [v11 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v13 = v10 - v12;

  switch(a3)
  {
    case 2:
      return v13 + -16.0;
    case 1:
      uint64_t v19 = [(TransitDirectionsStepView *)self transitListItem];
      uint64_t v20 = [v19 minorStringImage];

      if (v20)
      {
        id v21 = [(TransitDirectionsStepView *)self transitListItem];
        uint64_t v22 = [v21 minorStringImage];
        [v22 size];
        double v24 = v23;
        unint64_t v25 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
        if ([v25 userInterfaceIdiom] == (id)5) {
          double v26 = 6.0;
        }
        else {
          double v26 = 4.0;
        }

        double v13 = v13 - (v24 - v26);
      }
      break;
    case 0:
      uint64_t v14 = [(TransitDirectionsInstructionsStepView *)self expandableItem];
      if (v14)
      {
        id v15 = (void *)v14;
        uint64_t v16 = [(TransitDirectionsInstructionsStepView *)self expandableItem];
        unsigned int v17 = [v16 shouldDisplayExpandButton];

        if (v17)
        {
          [(TransitDirectionsInstructionsStepView *)self _instructionsLabelToTrailingLayoutGuideDistance];
          return v13 - v18;
        }
      }
      break;
  }
  return v13;
}

- (id)_fontForInstructionType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double v3 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
      goto LABEL_8;
    case 1:
      double v3 = [(TransitDirectionsInstructionsStepView *)self secondaryLabel];
      goto LABEL_8;
    case 2:
      double v3 = [(TransitDirectionsInstructionsStepView *)self tertiaryLabel];
      goto LABEL_8;
    case 3:
      double v3 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
      goto LABEL_8;
    case 4:
      double v3 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
LABEL_8:
      double v5 = v3;
      id v4 = [v3 font];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)_labelViewForInstructionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    double v3 = &OBJC_IVAR___TransitDirectionsInstructionsStepView__tertiaryLabel;
  }
  else {
    double v3 = off_101321728[a3];
  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
}

- (id)_textAttributesForInstructionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      id v15 = 0;
      goto LABEL_14;
    }
    if ([(TransitDirectionsStepView *)self useNavigationMetrics]
      || ([(TransitDirectionsInstructionsStepView *)self traitCollection],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 preferredContentSizeCategory],
          double v12 = objc_claimAutoreleasedReturnValue(),
          IsAccessibilityContentSizeCategordouble y = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(),
          v12,
          v11,
          IsAccessibilityContentSizeCategory))
    {
      uint64_t v14 = 6;
    }
    else
    {
      uint64_t v14 = 5;
    }
    uint64_t v19 = MKServerFormattedStringArtworkSizeAttributeKey;
    double v8 = +[NSNumber numberWithInteger:v14];
    uint64_t v20 = v8;
    double v9 = &v20;
    double v10 = &v19;
  }
  else
  {
    id v4 = [(TransitDirectionsInstructionsStepView *)self traitCollection];
    double v5 = [v4 preferredContentSizeCategory];
    int v6 = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    if (v6) {
      uint64_t v7 = 6;
    }
    else {
      uint64_t v7 = 5;
    }
    uint64_t v17 = MKServerFormattedStringArtworkSizeAttributeKey;
    double v8 = +[NSNumber numberWithInteger:v7];
    double v18 = v8;
    double v9 = &v18;
    double v10 = &v17;
  }
  id v15 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:1];

LABEL_14:

  return v15;
}

- (BOOL)_combineAccessoryLabels
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class() && sub_1000BBB44(self) == 5;
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsStepView *)&v4 setUseNavigationMetrics:a3];
  [(TransitDirectionsInstructionsStepView *)self _setCellStyle:[(TransitDirectionsInstructionsStepView *)self _bestCellStyleForCurrentState]];
}

- (void)setNavigationState:(int64_t)a3
{
  double v5 = [(TransitDirectionsStepView *)self navigationState];
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsInstructionsStepView;
  [(TransitDirectionsStepView *)&v6 setNavigationState:a3];
  if (v5 != (void *)[(TransitDirectionsStepView *)self navigationState])
  {
    [(TransitDirectionsInstructionsStepView *)self _updateNavigationStateDependentFonts];
    [(TransitDirectionsInstructionsStepView *)self _updateMultipleInstructionImagePositionConstraint];
  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v11, "_updateNavigationStateAlpha:");
  double v5 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
  [v5 setAlpha:a3];

  objc_super v6 = [(TransitDirectionsInstructionsStepView *)self secondaryLabel];
  [v6 setAlpha:a3];

  uint64_t v7 = [(TransitDirectionsInstructionsStepView *)self tertiaryLabel];
  [v7 setAlpha:a3];

  double v8 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  [v8 setAlpha:a3];

  double v9 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  [v9 setAlpha:a3];

  double v10 = [(TransitDirectionsInstructionsStepView *)self platformArtworkImageView];
  [v10 setAlpha:a3];
}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableCellDelegate);

  return (TransitDirectionsExpandableCellDelegate *)WeakRetained;
}

- (void)setExpandableCellDelegate:(id)a3
{
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (_MKUILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (MKMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (MKMultiPartLabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (TransitArtworkListView)badgesArtworkListView
{
  return self->_badgesArtworkListView;
}

- (_MKUILabel)primaryAccessoryLabel
{
  return self->_primaryAccessoryLabel;
}

- (_MKUILabel)secondaryAccessoryLabel
{
  return self->_secondaryAccessoryLabel;
}

- (MKArtworkImageView)platformArtworkImageView
{
  return self->_platformArtworkImageView;
}

- (MapsLargerHitTargetButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_storeStrong((id *)&self->_platformArtworkImageView, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_badgesArtworkListView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_destroyWeak((id *)&self->_expandableCellDelegate);
  objc_storeStrong((id *)&self->_imageViewMultipleInstructionsConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewSingleInstructionConstraint, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_layoutItemsByType, 0);
  objc_destroyWeak((id *)&self->_expandableItem);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuide, 0);

  objc_storeStrong((id *)&self->_styleConstraints, 0);
}

@end