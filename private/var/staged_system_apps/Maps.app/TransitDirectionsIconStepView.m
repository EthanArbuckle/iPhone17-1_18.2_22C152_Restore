@interface TransitDirectionsIconStepView
- (BOOL)_indentsLinkMap;
- (MKArtworkImageView)iconImageView;
- (UIColor)bottomLinkColor;
- (UIColor)topLinkColor;
- (double)_bottomLinkExtensionHeight;
- (double)_calculatedSeparatorHeight;
- (double)_distanceToImageCenterForImageSource:(id)a3;
- (double)_maximumIconHeight;
- (double)_maximumIconWidth;
- (double)_topLinkExtensionHeight;
- (id)_UIView;
- (id)_createImageView;
- (id)_imageViewPositionConstraints;
- (id)_initialConstraints;
- (id)_lineColorViewWithStyle:(unint64_t)a3;
- (unint64_t)_preferredStyle;
- (void)_configureArtworkForFirstUse;
- (void)_createSubviews;
- (void)_setCalculatedSeparatorHeight:(double)a3;
- (void)_updateArtwork;
- (void)_updateArtworkTintColor;
- (void)_updateForParentExpansionOrCollapse;
- (void)_updateLinkColors;
- (void)_updateLinkStyles;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomLinkColor:(id)a3;
- (void)setDisplayOptions:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTopLinkColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TransitDirectionsIconStepView

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v4 prepareForReuse];
  hasAlternateImageSource = self->_hasAlternateImageSource;
  self->_hasAlternateImageSource = 0;

  [(MKArtworkImageView *)self->_iconImageView setHidden:0];
}

- (void)_createSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v13 _createSubviews];
  v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  iconLinksGroupingView = self->_iconLinksGroupingView;
  self->_iconLinksGroupingView = v3;

  [(UIView *)self->_iconLinksGroupingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_iconLinksGroupingView setUserInteractionEnabled:0];
  LODWORD(v5) = 1148846080;
  [(UIView *)self->_iconLinksGroupingView _mapkit_setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(UIView *)self->_iconLinksGroupingView _mapkit_setContentHuggingPriority:1 forAxis:v6];
  [(TransitDirectionsIconStepView *)self addSubview:self->_iconLinksGroupingView];
  v7 = [(TransitDirectionsIconStepView *)self _lineColorViewWithStyle:1];
  topLink = self->_topLink;
  self->_topLink = v7;

  [(UIView *)self->_iconLinksGroupingView addSubview:self->_topLink];
  v9 = [(TransitDirectionsIconStepView *)self _lineColorViewWithStyle:2];
  bottomLink = self->_bottomLink;
  self->_bottomLink = v9;

  [(UIView *)self->_iconLinksGroupingView addSubview:self->_bottomLink];
  v11 = [(TransitDirectionsIconStepView *)self _createImageView];
  iconImageView = self->_iconImageView;
  self->_iconImageView = v11;

  [(UIView *)self->_iconLinksGroupingView addSubview:self->_iconImageView];
}

- (id)_createImageView
{
  id v3 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v4 = [(TransitDirectionsIconStepView *)self layer];
  id v5 = [v4 backgroundColor];
  double v6 = [v3 layer];
  [v6 setBackgroundColor:v5];

  LODWORD(v7) = 1148829696;
  [v3 _mapkit_setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148829696;
  [v3 _mapkit_setContentHuggingPriority:1 forAxis:v8];
  [v3 setContentMode:1];

  return v3;
}

- (id)_UIView
{
  id v2 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

- (id)_initialConstraints
{
  v89.receiver = self;
  v89.super_class = (Class)TransitDirectionsIconStepView;
  id v3 = [(TransitDirectionsStepView *)&v89 _initialConstraints];
  objc_super v4 = [(TransitDirectionsColoredLine *)self->_topLink topAnchor];
  id v5 = [(UIView *)self->_iconLinksGroupingView topAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];
  double v7 = [v6 _maps_withIdentifier:@"topLinkTopToGroupingTop"];
  [v3 addObject:v7];

  double v8 = [(UIView *)self->_iconLinksGroupingView bottomAnchor];
  v9 = [(TransitDirectionsColoredLine *)self->_bottomLink bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v11 = [v10 _maps_withIdentifier:@"groupingBottomToBottomLinkBottom"];
  [v3 addObject:v11];

  v12 = [(TransitDirectionsColoredLine *)self->_topLink leadingAnchor];
  objc_super v13 = [(UIView *)self->_iconLinksGroupingView leadingAnchor];
  v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
  v15 = [v14 _maps_withIdentifier:@"topLinkLeadingToGroupingLeading"];
  [v3 addObject:v15];

  v16 = [(UIView *)self->_iconLinksGroupingView trailingAnchor];
  v17 = [(TransitDirectionsColoredLine *)self->_topLink trailingAnchor];
  v18 = [v16 constraintGreaterThanOrEqualToAnchor:v17];
  v19 = [v18 _maps_withIdentifier:@"groupingTrailingToTopLinkTrailing"];
  [v3 addObject:v19];

  v20 = [(MKArtworkImageView *)self->_iconImageView leadingAnchor];
  v21 = [(UIView *)self->_iconLinksGroupingView leadingAnchor];
  v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
  v23 = [v22 _maps_withIdentifier:@"iconLeadingToGroupingLeading"];
  [v3 addObject:v23];

  v24 = [(UIView *)self->_iconLinksGroupingView trailingAnchor];
  v25 = [(MKArtworkImageView *)self->_iconImageView trailingAnchor];
  v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
  v27 = [v26 _maps_withIdentifier:@"groupingTrailingToIconTrailing"];
  [v3 addObject:v27];

  v28 = [(MKArtworkImageView *)self->_iconImageView topAnchor];
  v29 = [(UIView *)self->_iconLinksGroupingView topAnchor];
  v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29];
  v31 = [v30 _maps_withIdentifier:@"iconTopToGroupingTop"];
  [v3 addObject:v31];

  v32 = [(UIView *)self->_iconLinksGroupingView bottomAnchor];
  v33 = [(MKArtworkImageView *)self->_iconImageView bottomAnchor];
  v34 = [v32 constraintGreaterThanOrEqualToAnchor:v33];
  v35 = [v34 _maps_withIdentifier:@"groupingBotomToIconBottom"];
  [v3 addObject:v35];

  v36 = [(TransitDirectionsIconStepView *)self _imageViewPositionConstraints];
  [v3 addObjectsFromArray:v36];

  v37 = [(MKArtworkImageView *)self->_iconImageView heightAnchor];
  v38 = [v37 constraintEqualToConstant:1.0];
  v39 = [v38 _maps_withIdentifier:@"iconHeight"];

  v88 = v39;
  LODWORD(v40) = 1132068864;
  [v39 setPriority:v40];
  [v3 addObject:v39];
  v41 = [(MKArtworkImageView *)self->_iconImageView widthAnchor];
  v42 = [v41 constraintEqualToConstant:1.0];
  v43 = [v42 _maps_withIdentifier:@"iconWidth"];

  LODWORD(v44) = 1132068864;
  [v43 setPriority:v44];
  [v3 addObject:v43];
  v45 = [(MKArtworkImageView *)self->_iconImageView widthAnchor];
  [(TransitDirectionsIconStepView *)self _maximumIconWidth];
  v46 = [v45 constraintLessThanOrEqualToConstant:];
  v47 = [v46 _maps_withIdentifier:@"iconMaxWidth"];
  [v3 addObject:v47];

  v48 = [(MKArtworkImageView *)self->_iconImageView heightAnchor];
  [(TransitDirectionsIconStepView *)self _maximumIconHeight];
  v49 = [v48 constraintLessThanOrEqualToConstant:];
  v50 = [v49 _maps_withIdentifier:@"iconMaxHeight"];
  [v3 addObject:v50];

  v51 = [(TransitDirectionsColoredLine *)self->_topLink widthAnchor];
  v52 = [v51 constraintEqualToConstant:0.0];
  [v52 _maps_withIdentifier:@"topLinkWidth"];
  v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  linkWidthConstraint = self->_linkWidthConstraint;
  self->_linkWidthConstraint = v53;

  [v3 addObject:self->_linkWidthConstraint];
  v55 = [(TransitDirectionsColoredLine *)self->_bottomLink widthAnchor];
  v56 = [(TransitDirectionsColoredLine *)self->_topLink widthAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v58 = [v57 _maps_withIdentifier:@"bottomLinkWidth"];
  [v3 addObject:v58];

  v59 = [(TransitDirectionsColoredLine *)self->_topLink centerXAnchor];
  v60 = [(MKArtworkImageView *)self->_iconImageView centerXAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  v62 = [v61 _maps_withIdentifier:@"topLinkCenterXToIconCenterX"];
  [v3 addObject:v62];

  v63 = [(TransitDirectionsColoredLine *)self->_bottomLink centerXAnchor];
  v64 = [(TransitDirectionsColoredLine *)self->_topLink centerXAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  v66 = [v65 _maps_withIdentifier:@"bottomLinkCenterXToIconCenterX"];
  [v3 addObject:v66];

  v67 = [(TransitDirectionsColoredLine *)self->_topLink topAnchor];
  v68 = [(TransitDirectionsIconStepView *)self topAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v69 _maps_withIdentifier:@"topLinkTopToContentViewTopConstraint"];
  v70 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLinkToContentViewTopConstraint = self->_topLinkToContentViewTopConstraint;
  self->_topLinkToContentViewTopConstraint = v70;

  [v3 addObject:self->_topLinkToContentViewTopConstraint];
  v72 = [(TransitDirectionsColoredLine *)self->_topLink bottomAnchor];
  v73 = [(MKArtworkImageView *)self->_iconImageView centerYAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  [v74 _maps_withIdentifier:@"topLinkBottomToImageViewCenterYConstraint"];
  v75 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLinkToImageViewCenterConstraint = self->_topLinkToImageViewCenterConstraint;
  self->_topLinkToImageViewCenterConstraint = v75;

  [v3 addObject:self->_topLinkToImageViewCenterConstraint];
  v77 = [(TransitDirectionsColoredLine *)self->_bottomLink topAnchor];
  v78 = [(MKArtworkImageView *)self->_iconImageView centerYAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];
  [v79 _maps_withIdentifier:@"bottomLinkTopToImageViewCenterYConstraint"];
  v80 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomLinkToImageViewCenterConstraint = self->_bottomLinkToImageViewCenterConstraint;
  self->_bottomLinkToImageViewCenterConstraint = v80;

  [v3 addObject:self->_bottomLinkToImageViewCenterConstraint];
  v82 = [(TransitDirectionsColoredLine *)self->_bottomLink bottomAnchor];
  v83 = [(TransitDirectionsIconStepView *)self bottomAnchor];
  v84 = [v82 constraintEqualToAnchor:v83];
  [v84 _maps_withIdentifier:@"bottomLinkBottomToContentViewBottomConstraint"];
  v85 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomLinkToContentViewBottomConstraint = self->_bottomLinkToContentViewBottomConstraint;
  self->_bottomLinkToContentViewBottomConstraint = v85;

  [v3 addObject:self->_bottomLinkToContentViewBottomConstraint];

  return v3;
}

- (id)_imageViewPositionConstraints
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = [(MKArtworkImageView *)self->_iconImageView centerXAnchor];
  id v5 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
  double v6 = [v5 centerXAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  double v8 = [v7 _maps_withIdentifier:@"iconCenterXToLeadingGuideCenterX"];
  [v3 addObject:v8];

  id v9 = [v3 copy];

  return v9;
}

- (double)_maximumIconWidth
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 40.0;
  if (v2 == 5) {
    return 30.0;
  }
  return result;
}

- (double)_maximumIconHeight
{
  return 30.0;
}

- (double)_distanceToImageCenterForImageSource:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    double v6 = 0.0;
    goto LABEL_7;
  }
  id v5 = [(TransitDirectionsStepView *)self transitListItem];
  objc_opt_class();
  double v6 = 0.0;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  double v7 = [(TransitDirectionsStepView *)self transitListItem];
  id v8 = [v7 type];

  if (v8 != (id)12)
  {
    id v5 = [(TransitDirectionsIconStepView *)self iconImageView];
    id v9 = [v5 image];
    [v9 size];
    double v6 = v10 * 0.5 + -1.0;

LABEL_5:
  }
LABEL_7:

  return v6;
}

- (double)_topLinkExtensionHeight
{
  if (![(TransitDirectionsStepView *)self isHighlighted]) {
    return 0.0;
  }

  [(TransitDirectionsIconStepView *)self _calculatedSeparatorHeight];
  return result;
}

- (double)_bottomLinkExtensionHeight
{
  if (![(TransitDirectionsStepView *)self isHighlighted]) {
    return 0.0;
  }

  [(TransitDirectionsIconStepView *)self _calculatedSeparatorHeight];
  return result;
}

- (id)_lineColorViewWithStyle:(unint64_t)a3
{
  id v3 = [[TransitDirectionsColoredLine alloc] initWithStyle:a3];
  [(TransitDirectionsColoredLine *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v3;
}

- (void)_updateLinkColors
{
  id v3 = [(TransitDirectionsStepView *)self transitListItem];
  id v16 = [v3 fromLineColor];

  id v4 = [(TransitDirectionsStepView *)self transitListItem];
  id v5 = [v4 toLineColor];

  double v6 = [(TransitDirectionsStepView *)self transitListItem];
  double v7 = [v6 parentItem];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  unsigned int v10 = [v9 expanded];
  if (v10)
  {
    v11 = [(TransitDirectionsStepView *)self transitListItem];
    uint64_t v12 = [v11 alternateFromLineColor];

    objc_super v13 = [(TransitDirectionsStepView *)self transitListItem];
    uint64_t v14 = [v13 alternateToLineColor];

    id v5 = (void *)v14;
    id v15 = (id)v12;
  }
  else
  {
    id v15 = v16;
  }
  id v17 = v15;
  [(TransitDirectionsIconStepView *)self setTopLinkColor:v15];
  [(TransitDirectionsIconStepView *)self setBottomLinkColor:v5];
}

- (void)_updateLinkStyles
{
  id v3 = [(TransitDirectionsStepView *)self transitListItem];
  id v4 = [v3 parentItem];

  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v14 = v5;

  if (!v14)
  {
    uint64_t v9 = 1;
LABEL_12:
    uint64_t v13 = 2;
    goto LABEL_13;
  }
  double v6 = [(TransitDirectionsStepView *)self transitListItem];
  double v7 = [v6 previousItem];
  unint64_t v8 = (unint64_t)[v7 type];

  uint64_t v9 = 1;
  if (v8 <= 0xE)
  {
    if (((1 << v8) & 0x4460) != 0)
    {
LABEL_7:
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    if (v8 == 7)
    {
      if (![v14 shouldEnableExpandedButton] || objc_msgSend(v14, "expanded")) {
        goto LABEL_7;
      }
      uint64_t v9 = 1;
    }
  }
LABEL_8:
  unsigned int v10 = [(TransitDirectionsStepView *)self transitListItem];
  v11 = [v10 nextItem];
  unint64_t v12 = (unint64_t)[v11 type];

  uint64_t v13 = 2;
  if (v12 > 0xE) {
    goto LABEL_13;
  }
  if (((1 << v12) & 0x4860) != 0) {
    goto LABEL_10;
  }
  if (v12 == 7)
  {
    if (![v14 shouldEnableExpandedButton] || objc_msgSend(v14, "expanded"))
    {
LABEL_10:
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  [(TransitDirectionsColoredLine *)self->_topLink setStyle:v9];
  [(TransitDirectionsColoredLine *)self->_bottomLink setStyle:v13];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v3 layoutSubviews];
  [(TransitDirectionsIconStepView *)self _updateLinkColors];
  [(TransitDirectionsIconStepView *)self _updateLinkStyles];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v5 setHighlighted:a3];
  [(TransitDirectionsIconStepView *)self _updateArtworkTintColor];
  [(TransitDirectionsIconStepView *)self _topLinkExtensionHeight];
  [(NSLayoutConstraint *)self->_topLinkToContentViewTopConstraint setConstant:-v4];
  [(TransitDirectionsIconStepView *)self _bottomLinkExtensionHeight];
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToContentViewBottomConstraint, "setConstant:");
}

- (void)setDisplayOptions:(unint64_t)a3
{
  unsigned int v5 = [(TransitDirectionsStepView *)self displayOptions];
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v6 setDisplayOptions:a3];
  if ((v5 ^ a3)) {
    [(TransitDirectionsIconStepView *)self _updateArtwork];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsIconStepView *)&v4 traitCollectionDidChange:a3];
  [(TransitDirectionsListItem *)self->super._transitListItem lineWidthForView:self];
  -[NSLayoutConstraint setConstant:](self->_linkWidthConstraint, "setConstant:");
}

- (void)setTopLinkColor:(id)a3
{
}

- (UIColor)topLinkColor
{
  return [(TransitDirectionsColoredLine *)self->_topLink lineColor];
}

- (void)setBottomLinkColor:(id)a3
{
}

- (UIColor)bottomLinkColor
{
  return [(TransitDirectionsColoredLine *)self->_bottomLink lineColor];
}

- (BOOL)_indentsLinkMap
{
  return 1;
}

- (void)configureWithItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v4 configureWithItem:a3];
  [(TransitDirectionsIconStepView *)self _configureArtworkForFirstUse];
  [(TransitDirectionsIconStepView *)self _bottomLinkExtensionHeight];
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToContentViewBottomConstraint, "setConstant:");
  [(TransitDirectionsListItem *)self->super._transitListItem lineWidthForView:self];
  -[NSLayoutConstraint setConstant:](self->_linkWidthConstraint, "setConstant:");
  [(TransitDirectionsIconStepView *)self _updateLinkColors];
  [(TransitDirectionsIconStepView *)self _updateLinkStyles];
  [(TransitDirectionsStepView *)self _updateConstraints];
}

- (void)_configureArtworkForFirstUse
{
  objc_super v3 = [(TransitDirectionsStepView *)self transitListItem];
  objc_super v4 = [v3 alternateImageSourceForStyle:[self _preferredStyle]];
  +[NSNumber numberWithInt:v4 != 0];
  unsigned int v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hasAlternateImageSource = self->_hasAlternateImageSource;
  self->_hasAlternateImageSource = v5;

  [(TransitDirectionsIconStepView *)self _updateArtworkTintColor];

  [(TransitDirectionsIconStepView *)self _updateArtwork];
}

- (void)_updateArtworkTintColor
{
  if ([(TransitDirectionsStepView *)self isHighlighted] && sub_1000BBB44(self) == 5)
  {
    uint64_t v3 = +[UIColor systemWhiteColor];
  }
  else
  {
    uint64_t v3 = +[UIColor labelColor];
  }
  id v4 = (id)v3;
  [(MKArtworkImageView *)self->_iconImageView setTintColor:v3];
}

- (void)_updateArtwork
{
  if (![(NSNumber *)self->_hasAlternateImageSource BOOLValue]
    || ([(TransitDirectionsStepView *)self displayOptions] & 1) == 0
    || ([(TransitDirectionsStepView *)self transitListItem],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "alternateImageSourceForStyle:", -[TransitDirectionsIconStepView _preferredStyle](self, "_preferredStyle")), id v6 = (id)objc_claimAutoreleasedReturnValue(), v3, !v6))
  {
    id v4 = [(TransitDirectionsStepView *)self transitListItem];
    [v4 imageSourceForStyle:[self _preferredStyle]];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(MKArtworkImageView *)self->_iconImageView setImageSource:v6];
  [(MKArtworkImageView *)self->_iconImageView setHidden:v6 == 0];
  [(TransitDirectionsIconStepView *)self _distanceToImageCenterForImageSource:v6];
  [(NSLayoutConstraint *)self->_topLinkToImageViewCenterConstraint setConstant:-v5];
  [(TransitDirectionsIconStepView *)self _distanceToImageCenterForImageSource:v6];
  -[NSLayoutConstraint setConstant:](self->_bottomLinkToImageViewCenterConstraint, "setConstant:");
}

- (void)_updateForParentExpansionOrCollapse
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsIconStepView;
  [(TransitDirectionsStepView *)&v3 _updateForParentExpansionOrCollapse];
  [(TransitDirectionsIconStepView *)self _updateLinkColors];
  [(TransitDirectionsIconStepView *)self _updateLinkStyles];
}

- (unint64_t)_preferredStyle
{
  return 0;
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsIconStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v10, "_updateNavigationStateAlpha:");
  unint64_t v5 = [(TransitDirectionsStepView *)self navigationState];
  if (v5 <= 5)
  {
    if (v5 == 2) {
      double v6 = a3;
    }
    else {
      double v6 = 1.0;
    }
    if (v5 == 2) {
      double v7 = 1.0;
    }
    else {
      double v7 = a3;
    }
    if (((1 << v5) & 0x33) != 0)
    {
      double v6 = 1.0;
      double v8 = 1.0;
    }
    else
    {
      double v8 = v7;
    }
    [(TransitDirectionsColoredLine *)self->_topLink setAlpha:v6];
    uint64_t v9 = [(TransitDirectionsIconStepView *)self iconImageView];
    [v9 setAlpha:1.0];

    [(TransitDirectionsColoredLine *)self->_bottomLink setAlpha:1.0];
    [(UIView *)self->_iconLinksGroupingView setAlpha:v8];
  }
}

- (double)_calculatedSeparatorHeight
{
  return self->_calculatedSeparatorHeight;
}

- (void)_setCalculatedSeparatorHeight:(double)a3
{
  self->_calculatedSeparatorHeight = a3;
}

- (MKArtworkImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasAlternateImageSource, 0);
  objc_storeStrong((id *)&self->_linkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLinkToContentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLinkToImageViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_topLinkToContentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_topLinkToImageViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_iconLinksGroupingView, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_topLink, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end