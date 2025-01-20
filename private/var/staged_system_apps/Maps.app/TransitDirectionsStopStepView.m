@interface TransitDirectionsStopStepView
- ($29727DC6989B69F22950FCD998EA20D4)_metrics;
- (MKArtworkImageView)stationArtworkImageView;
- (double)bottomSpacerHeight;
- (id)_imageViewPositionConstraints;
- (id)_initialConstraints;
- (id)_platformArtworkHorizontalPositioningConstraint;
- (void)_cellStyleDidChange;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_refreshAccessoryStringVisibility;
- (void)_updateFonts;
- (void)_updateForParentExpansionOrCollapse;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)prepareForReuse;
@end

@implementation TransitDirectionsStopStepView

- (void)_createSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TransitDirectionsStopStepView;
  [(TransitDirectionsInstructionsStepView *)&v15 _createSubviews];
  v3 = [(TransitDirectionsIconStepView *)self _createImageView];
  stationArtworkImageView = self->_stationArtworkImageView;
  self->_stationArtworkImageView = v3;

  [(MKArtworkImageView *)self->_stationArtworkImageView setAccessibilityIdentifier:@"StationArtworkImageView"];
  LODWORD(v5) = 1132068864;
  [(MKArtworkImageView *)self->_stationArtworkImageView _mapkit_setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1132068864;
  [(MKArtworkImageView *)self->_stationArtworkImageView _mapkit_setContentCompressionResistancePriority:1 forAxis:v6];
  [(TransitDirectionsStopStepView *)self addSubview:self->_stationArtworkImageView];
  v7 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  LODWORD(v8) = 1148829696;
  [v7 _mapkit_setContentHuggingPriority:0 forAxis:v8];

  v9 = +[UIColor secondaryLabelColor];
  v10 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  [v10 setTextColor:v9];

  v11 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  LODWORD(v12) = 1148829696;
  [v11 _mapkit_setContentHuggingPriority:0 forAxis:v12];

  v13 = +[UIColor tertiaryLabelColor];
  v14 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  [v14 setTextColor:v13];

  [(TransitDirectionsStopStepView *)self _updateFonts];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStopStepView;
  [(TransitDirectionsInstructionsStepView *)&v3 prepareForReuse];
  [(MKArtworkImageView *)self->_stationArtworkImageView setImageSource:0];
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17];
  }
  else {
  objc_super v3 = +[UIFont system17SemiBold];
  }
  v4 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
  [v4 setFont:v3];

  if (sub_1000BBB44(self) == 5) {
    +[UIFont system16];
  }
  else {
  double v5 = +[UIFont system15];
  }
  double v6 = [(TransitDirectionsInstructionsStepView *)self secondaryLabel];
  [v6 setFont:v5];

  v7 = self;
  if (sub_1000BBB44(v7) == 5)
  {
    double v8 = [(TransitDirectionsStopStepView *)v7 traitCollection];
    if ([v8 userInterfaceIdiom] == (id)5) {
      v9 = (id *)&UIFontTextStyleBody;
    }
    else {
      v9 = (id *)&UIFontTextStyleSubheadline;
    }
    id v10 = *v9;

    v11 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v10];

    double v12 = [v11 fontDescriptor];
    v13 = [v12 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:1];

    v14 = +[UIFont fontWithDescriptor:v13 size:0.0];
  }
  else
  {
    v14 = +[UIFont system16];
  }

  objc_super v15 = [(TransitDirectionsInstructionsStepView *)v7 primaryAccessoryLabel];
  [v15 setFont:v14];

  v16 = v7;
  if (sub_1000BBB44(v16) == 5)
  {
    v17 = [(TransitDirectionsStopStepView *)v16 traitCollection];
    if ([v17 userInterfaceIdiom] == (id)5) {
      v18 = (id *)&UIFontTextStyleBody;
    }
    else {
      v18 = (id *)&UIFontTextStyleSubheadline;
    }
    id v19 = *v18;

    v20 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v19];

    v21 = [v20 fontDescriptor];
    v22 = [v21 _mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:1];

    id v24 = +[UIFont fontWithDescriptor:v22 size:0.0];
  }
  else
  {
    id v24 = +[UIFont system16];
  }

  v23 = [(TransitDirectionsInstructionsStepView *)v16 secondaryAccessoryLabel];
  [v23 setFont:v24];
}

- (void)_contentSizeCategoryDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStopStepView;
  [(TransitDirectionsInstructionsStepView *)&v6 _contentSizeCategoryDidChange];
  [(TransitDirectionsStopStepView *)self _updateFonts];
  objc_super v3 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
  v4 = [v3 font];
  [v4 _mapkit_lineHeight];
  [(NSLayoutConstraint *)self->_iconToPrimaryLabelConstraint setConstant:v5 * 0.5];
}

- (id)_initialConstraints
{
  v39.receiver = self;
  v39.super_class = (Class)TransitDirectionsStopStepView;
  objc_super v3 = [(TransitDirectionsIconStepView *)&v39 _initialConstraints];
  v4 = [(MKArtworkImageView *)self->_stationArtworkImageView heightAnchor];
  double v5 = [v4 constraintEqualToConstant:0.0];
  [v5 _maps_withIdentifier:@"stationArtworkScaledHeight"];
  objc_super v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stationArtworkScalingHeightConstraint = self->_stationArtworkScalingHeightConstraint;
  self->_stationArtworkScalingHeightConstraint = v6;

  LODWORD(v8) = 1148829696;
  [(NSLayoutConstraint *)self->_stationArtworkScalingHeightConstraint setPriority:v8];
  [v3 addObject:self->_stationArtworkScalingHeightConstraint];
  v9 = [(MKArtworkImageView *)self->_stationArtworkImageView centerYAnchor];
  id v10 = [(MKArtworkImageView *)self->super.super._iconImageView centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  double v12 = [v11 _maps_withIdentifier:@"stationArtworkCenterYToIconCenterY"];
  [v3 addObject:v12];

  v13 = [(MKArtworkImageView *)self->_stationArtworkImageView centerXAnchor];
  v14 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  objc_super v15 = [v14 centerXAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v17 = [v16 _maps_withIdentifier:@"stationArtworkCenterXToLeadingLayoutCenterX"];
  [v3 addObject:v17];

  v18 = [(MKArtworkImageView *)self->_stationArtworkImageView topAnchor];
  id v19 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20];
  v22 = [v21 _maps_withIdentifier:@"stationArtworkTopToLeadingLayoutTop"];
  [v3 addObject:v22];

  v23 = [(MKArtworkImageView *)self->_stationArtworkImageView leadingAnchor];
  id v24 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  v25 = [v24 leadingAnchor];
  v26 = [v23 constraintGreaterThanOrEqualToAnchor:v25];
  v27 = [v26 _maps_withIdentifier:@"stationArtworkLeadingToLeadingLayoutLeading"];
  [v3 addObject:v27];

  v28 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  v29 = [v28 trailingAnchor];
  v30 = [(MKArtworkImageView *)self->_stationArtworkImageView trailingAnchor];
  v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30];
  v32 = [v31 _maps_withIdentifier:@"leadingLayoutTrailingToStationArtworkTrailing"];
  [v3 addObject:v32];

  v33 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  v34 = [v33 bottomAnchor];
  v35 = [(MKArtworkImageView *)self->_stationArtworkImageView bottomAnchor];
  v36 = [v34 constraintGreaterThanOrEqualToAnchor:v35];
  v37 = [v36 _maps_withIdentifier:@"leadingLayoutBottomToStationArtworkBottom"];
  [v3 addObject:v37];

  return v3;
}

- (id)_imageViewPositionConstraints
{
  if ([(TransitDirectionsIconStepView *)self _indentsLinkMap])
  {
    objc_super v3 = [(MKArtworkImageView *)self->super.super._iconImageView centerYAnchor];
    v4 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
    double v5 = [v4 topAnchor];
    objc_super v6 = [(TransitDirectionsInstructionsStepView *)self primaryLabel];
    v7 = [v6 font];
    [v7 _mapkit_lineHeight];
    v9 = [v3 constraintEqualToAnchor:v5 constant:v8 * 0.5];
    [v9 _maps_withIdentifier:@"iconCenterYToPrimaryLabelTop"];
    id v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    iconToPrimaryLabelConstraint = self->_iconToPrimaryLabelConstraint;
    self->_iconToPrimaryLabelConstraint = v10;

    v25 = [(MKArtworkImageView *)self->super.super._iconImageView leadingAnchor];
    double v12 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    v13 = [v12 leadingAnchor];
    v14 = [v25 constraintGreaterThanOrEqualToAnchor:v13];
    objc_super v15 = [v14 _maps_withIdentifier:@"iconLeadingToContentLeading"];
    v27[0] = v15;
    v16 = [(MKArtworkImageView *)self->super.super._iconImageView centerXAnchor];
    v17 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    v18 = [v17 leadingAnchor];
    id v19 = [(TransitDirectionsStopStepView *)self traitCollection];
    [v19 userInterfaceIdiom];

    v20 = [v16 constraintEqualToAnchor:v18 constant:10.0];
    v21 = [v20 _maps_withIdentifier:@"iconCenterXToContentLeading"];
    v22 = self->_iconToPrimaryLabelConstraint;
    v27[1] = v21;
    v27[2] = v22;
    v23 = +[NSArray arrayWithObjects:v27 count:3];
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)TransitDirectionsStopStepView;
    v23 = [(TransitDirectionsInstructionsStepView *)&v26 _imageViewPositionConstraints];
  }

  return v23;
}

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->double var0 = 0u;
  v14.receiver = self;
  v14.super_class = (Class)TransitDirectionsStopStepView;
  [($29727DC6989B69F22950FCD998EA20D4 *)&v14 _metrics];
  double var0 = retstr->var0;
  objc_super v6 = [(TransitDirectionsStepView *)self transitListItem];
  id v7 = [v6 type];

  if (v7 == (id)11)
  {
    double v8 = [(TransitDirectionsStopStepView *)self traitCollection];
    BOOL v9 = [v8 userInterfaceIdiom] == (id)5;
    double v10 = 11.0;
    double v11 = 13.0;
  }
  else
  {
    if (v7 != (id)10) {
      goto LABEL_9;
    }
    double v8 = [(TransitDirectionsStopStepView *)self traitCollection];
    BOOL v9 = [v8 userInterfaceIdiom] == (id)5;
    double v10 = 16.0;
    double v11 = 4.0;
  }
  if (v9) {
    double var0 = v11;
  }
  else {
    double var0 = v10;
  }

LABEL_9:
  retstr->var6 = 1.0;
  retstr->double var0 = var0;
  result = ($29727DC6989B69F22950FCD998EA20D4 *)[(TransitDirectionsIconStepView *)self _indentsLinkMap];
  if (result)
  {
    v13 = [(TransitDirectionsStopStepView *)self traitCollection];
    [v13 userInterfaceIdiom];

    retstr->var1 = 24.0;
  }
  return result;
}

- (double)bottomSpacerHeight
{
  objc_super v3 = [(TransitDirectionsStepView *)self transitListItem];

  if (!v3)
  {
    [(TransitDirectionsStepView *)&v14 bottomSpacerHeight];
    return v10;
  }
  v4 = [(TransitDirectionsStepView *)self transitListItem];
  id v5 = [v4 type];

  if (v5 == (id)11)
  {
    objc_super v6 = [(TransitDirectionsStopStepView *)self traitCollection];
    BOOL v7 = [v6 userInterfaceIdiom] == (id)5;
    double v8 = 32.0;
    double v9 = 10.0;
    goto LABEL_7;
  }
  if (v5 != (id)10)
  {
    [(TransitDirectionsStepView *)&v13 bottomSpacerHeight];
    return v10;
  }
  objc_super v6 = [(TransitDirectionsStopStepView *)self traitCollection];
  BOOL v7 = [v6 userInterfaceIdiom] == (id)5;
  double v8 = 11.0;
  double v9 = 8.0;
LABEL_7:
  if (v7) {
    double v11 = v9;
  }
  else {
    double v11 = v8;
  }

  return v11;
}

- (void)_cellStyleDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsStopStepView;
  [(TransitDirectionsInstructionsStepView *)&v5 _cellStyleDidChange];
  [(NSLayoutConstraint *)self->_iconToPrimaryLabelConstraint setActive:1];
  objc_super v3 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  [v3 setNumberOfLines:1];

  v4 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  [v4 setNumberOfLines:1];
}

- (id)_platformArtworkHorizontalPositioningConstraint
{
  unint64_t v4 = [(TransitDirectionsInstructionsStepView *)self cellStyle];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      objc_super v5 = [(TransitDirectionsInstructionsStepView *)self platformArtworkImageView];
      objc_super v6 = [v5 trailingAnchor];
      BOOL v7 = [(MKArtworkImageView *)self->super.super._iconImageView trailingAnchor];
      double v8 = [v6 constraintEqualToAnchor:v7];
      double v9 = v8;
      CFStringRef v10 = @"platformArtworkTrailingToIconTrailing";
      goto LABEL_6;
    }
    if (v4) {
      goto LABEL_7;
    }
  }
  objc_super v5 = [(TransitDirectionsInstructionsStepView *)self platformArtworkImageView];
  objc_super v6 = [v5 leadingAnchor];
  BOOL v7 = [(MKArtworkImageView *)self->super.super._iconImageView leadingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  double v9 = v8;
  CFStringRef v10 = @"platformArtworkLeadingToIconLeading";
LABEL_6:
  v2 = [v8 _maps_withIdentifier:v10];

LABEL_7:

  return v2;
}

- (void)configureWithItem:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsStopStepView;
  id v4 = a3;
  [(TransitDirectionsInstructionsStepView *)&v16 configureWithItem:v4];
  [v4 majorStringImage];

  [(MKArtworkImageView *)self->_stationArtworkImageView setImageSource:v5];
  [(MKArtworkImageView *)self->_stationArtworkImageView setHidden:v5 == 0];
  [v5 size];
  double v7 = v6;
  double v8 = [(TransitDirectionsStopStepView *)self traitCollection];
  if ([v8 userInterfaceIdiom] == (id)5) {
    double v9 = 0.850000024;
  }
  else {
    double v9 = 0.75;
  }

  [(NSLayoutConstraint *)self->_stationArtworkScalingHeightConstraint setConstant:v7 * v9];
  CFStringRef v10 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  double v11 = [v10 attributedText];

  double v12 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  objc_super v13 = [v12 attributedText];

  if (v13 && !v11)
  {
    objc_super v14 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
    [v14 setAttributedText:v13];

    objc_super v15 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
    [v15 setAttributedText:0];
  }
  [(TransitDirectionsStopStepView *)self _refreshAccessoryStringVisibility];
}

- (void)_refreshAccessoryStringVisibility
{
  objc_super v3 = [(TransitDirectionsStepView *)self transitListItem];
  unsigned int v4 = [v3 hideAccessoryStringsWhenCollapsed];

  if (v4)
  {
    objc_super v5 = [(TransitDirectionsStepView *)self transitListItem];
    double v6 = [v5 parentItem];

    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;
    if (v8)
    {
      double v9 = v8;
      unsigned int v10 = [v8 expanded];

      if (!v10)
      {
        char v11 = 1;
        BOOL v12 = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  double v6 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  double v9 = [v6 attributedText];
  char v11 = 0;
  BOOL v12 = [v9 length] == 0;
LABEL_10:
  objc_super v13 = [(TransitDirectionsInstructionsStepView *)self primaryAccessoryLabel];
  [v13 setHidden:v12];

  if (v11)
  {
    BOOL v14 = 1;
  }
  else
  {

    id v16 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
    double v6 = [v16 attributedText];
    BOOL v14 = [v6 length] == 0;
  }
  objc_super v15 = [(TransitDirectionsInstructionsStepView *)self secondaryAccessoryLabel];
  [v15 setHidden:v14];

  if ((v11 & 1) == 0)
  {
  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStopStepView;
  -[TransitDirectionsInstructionsStepView _updateNavigationStateAlpha:](&v6, "_updateNavigationStateAlpha:");
  objc_super v5 = [(TransitDirectionsStopStepView *)self stationArtworkImageView];
  [v5 setAlpha:a3];
}

- (void)_updateForParentExpansionOrCollapse
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStopStepView;
  [(TransitDirectionsIconStepView *)&v3 _updateForParentExpansionOrCollapse];
  [(TransitDirectionsStopStepView *)self _refreshAccessoryStringVisibility];
}

- (MKArtworkImageView)stationArtworkImageView
{
  return self->_stationArtworkImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationArtworkImageView, 0);
  objc_storeStrong((id *)&self->_stationArtworkScalingHeightConstraint, 0);

  objc_storeStrong((id *)&self->_iconToPrimaryLabelConstraint, 0);
}

@end