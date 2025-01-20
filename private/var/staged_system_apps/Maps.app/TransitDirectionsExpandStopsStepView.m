@interface TransitDirectionsExpandStopsStepView
- (MapsLargerHitTargetButton)detailButton;
- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate;
- (TransitDirectionsListExpandableItem)expandableItem;
- (UIColor)lineColor;
- (double)_minimumLinkHeight;
- (id)_imageViewPositionConstraints;
- (id)_initialConstraints;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_detailButtonTapped:(id)a3;
- (void)_updateExpandButton;
- (void)_updateFonts;
- (void)_updateLinkColors;
- (void)_updateLinkStyles;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)setExpandableCellDelegate:(id)a3;
- (void)setLineColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateExpandCollapseStyling;
@end

@implementation TransitDirectionsExpandStopsStepView

- (void)_createSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsExpandStopsStepView;
  [(TransitDirectionsIconStepView *)&v21 _createSubviews];
  [(TransitDirectionsColoredLine *)self->super._topLink setHidden:1];
  [(TransitDirectionsColoredLine *)self->super._bottomLink setHidden:1];
  v3 = [TransitDirectionsColoredLine alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[TransitDirectionsColoredLine initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  line = self->_line;
  self->_line = v7;

  [(TransitDirectionsColoredLine *)self->_line setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TransitDirectionsExpandStopsStepView *)self addSubview:self->_line];
  if (sub_1000BBB44(self) == 5)
  {
    v9 = -[MapsLargerHitTargetButton initWithFrame:]([MapsLargerHitTargetButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailButton = self->_detailButton;
    self->_detailButton = v9;

    v11 = self->_detailButton;
    v12 = [(TransitDirectionsExpandStopsStepView *)self theme];
    v13 = [v12 keyColor];
    [(MapsLargerHitTargetButton *)v11 setTitleColor:v13 forStates:0];
  }
  else
  {
    v14 = +[MapsLargerHitTargetButton buttonWithType:1];
    v12 = self->_detailButton;
    self->_detailButton = v14;
  }

  [(MapsLargerHitTargetButton *)self->_detailButton setAccessibilityIdentifier:@"DetailButton"];
  [(MapsLargerHitTargetButton *)self->_detailButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [(MapsLargerHitTargetButton *)self->_detailButton titleLabel];
  [v15 setNumberOfLines:2];

  [(MapsLargerHitTargetButton *)self->_detailButton setContentHorizontalAlignment:4];
  [(MapsLargerHitTargetButton *)self->_detailButton addTarget:self action:"_detailButtonTapped:" forControlEvents:64];
  v16 = self->_detailButton;
  v17 = +[UIColor systemGrayColor];
  [(MapsLargerHitTargetButton *)v16 setTitleColor:v17 forStates:2];

  v18 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
  if ([v18 userInterfaceIdiom] == (id)5) {
    double v19 = 6.0;
  }
  else {
    double v19 = 8.0;
  }

  v20 = [(TransitDirectionsExpandStopsStepView *)self detailButton];
  [v20 setTouchInsets:-v19, -16.0, -v19, -16.0];

  [(TransitDirectionsExpandStopsStepView *)self addSubview:self->_detailButton];
  [(TransitDirectionsExpandStopsStepView *)self _updateFonts];
}

- (id)_initialConstraints
{
  v34.receiver = self;
  v34.super_class = (Class)TransitDirectionsExpandStopsStepView;
  v3 = [(TransitDirectionsIconStepView *)&v34 _initialConstraints];
  unsigned int v4 = [(TransitDirectionsIconStepView *)self _indentsLinkMap];
  v5 = [(TransitDirectionsColoredLine *)self->_line centerXAnchor];
  if (v4)
  {
    v6 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    v7 = [v6 leadingAnchor];
    v8 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
    [v8 userInterfaceIdiom];

    [v5 constraintEqualToAnchor:v7 constant:10.0];
  }
  else
  {
    v6 = [(TransitDirectionsStepView *)self leadingAccessoryLayoutGuide];
    v7 = [v6 centerXAnchor];
    [v5 constraintEqualToAnchor:v7];
  v9 = };
  [v3 addObject:v9];

  v10 = [(TransitDirectionsColoredLine *)self->_line topAnchor];
  v11 = [(TransitDirectionsExpandStopsStepView *)self topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  v13 = [(TransitDirectionsColoredLine *)self->_line bottomAnchor];
  v14 = [(TransitDirectionsExpandStopsStepView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(TransitDirectionsColoredLine *)self->_line widthAnchor];
  double v17 = 0.0;
  v18 = [v16 constraintEqualToConstant:0.0];
  lineWidthConstraint = self->_lineWidthConstraint;
  self->_lineWidthConstraint = v18;

  [v3 addObject:self->_lineWidthConstraint];
  v20 = [(TransitDirectionsColoredLine *)self->_line heightAnchor];
  [(TransitDirectionsExpandStopsStepView *)self _minimumLinkHeight];
  [v20 constraintGreaterThanOrEqualToConstant:];
  objc_super v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lineHeightConstraint = self->_lineHeightConstraint;
  self->_lineHeightConstraint = v21;

  [v3 addObject:self->_lineHeightConstraint];
  if ([(TransitDirectionsIconStepView *)self _indentsLinkMap])
  {
    v23 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
    [v23 userInterfaceIdiom];

    double v17 = 24.0;
  }
  v24 = [(MapsLargerHitTargetButton *)self->_detailButton titleLabel];
  v25 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v26 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
  double v27 = 6.5;
  if ([v26 userInterfaceIdiom] == (id)5) {
    double v28 = 6.0;
  }
  else {
    double v28 = 6.5;
  }

  v29 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
  if ([v29 userInterfaceIdiom] == (id)5) {
    double v27 = 6.0;
  }

  LODWORD(v30) = 1148846080;
  v31 = [v24 _maps_constraintsEqualToEdgesOfLayoutGuide:v25 insets:v28 priority:v17, v27, 0.0, v30];

  v32 = [v31 allConstraints];
  [v3 addObjectsFromArray:v32];

  return v3;
}

- (id)_imageViewPositionConstraints
{
  v3 = [(MKArtworkImageView *)self->super._iconImageView centerYAnchor];
  unsigned int v4 = [(TransitDirectionsExpandStopsStepView *)self centerYAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v11[0] = v5;
  v6 = [(MKArtworkImageView *)self->super._iconImageView centerXAnchor];
  v7 = [(TransitDirectionsColoredLine *)self->_line centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v11[1] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (double)_minimumLinkHeight
{
  [(TransitDirectionsListItem *)self->super.super._transitListItem lineWidthForView:self];
  return v2 * 7.0;
}

- (void)_detailButtonTapped:(id)a3
{
  id v5 = [(TransitDirectionsExpandStopsStepView *)self expandableCellDelegate];
  unsigned int v4 = [(TransitDirectionsExpandStopsStepView *)self expandableItem];
  [v5 transitDirectionsCell:self wantsToExpandOrCollapseItem:v4];
}

- (void)_updateFonts
{
  sub_1000BBB44(self);
  id v4 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
  v3 = [(MapsLargerHitTargetButton *)self->_detailButton titleLabel];
  [v3 setFont:v4];
}

- (void)_contentSizeCategoryDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsExpandStopsStepView;
  [(TransitDirectionsStepView *)&v3 _contentSizeCategoryDidChange];
  [(TransitDirectionsExpandStopsStepView *)self _updateFonts];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsExpandStopsStepView;
  id v4 = a3;
  [(TransitDirectionsIconStepView *)&v11 traitCollectionDidChange:v4];
  -[TransitDirectionsListItem lineWidthForView:](self->super.super._transitListItem, "lineWidthForView:", self, v11.receiver, v11.super_class);
  -[NSLayoutConstraint setConstant:](self->_lineWidthConstraint, "setConstant:");
  [(TransitDirectionsExpandStopsStepView *)self _minimumLinkHeight];
  -[NSLayoutConstraint setConstant:](self->_lineHeightConstraint, "setConstant:");
  id v5 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    v7 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
    unsigned int v8 = [v7 isLuminanceReduced];

    detailButton = self->_detailButton;
    if (v8)
    {
      [(MapsLargerHitTargetButton *)self->_detailButton setEnabled:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableItem);
      -[MapsLargerHitTargetButton setEnabled:](detailButton, "setEnabled:", [WeakRetained shouldEnableExpandedButton]);
    }
  }
}

- (void)configureWithItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsExpandStopsStepView;
  id v4 = a3;
  [(TransitDirectionsIconStepView *)&v7 configureWithItem:v4];
  objc_storeWeak((id *)&self->_expandableItem, 0);
  self->_checkedItemIsExpandable = 0;
  [v4 lineWidthForView:self];
  double v6 = v5;

  [(NSLayoutConstraint *)self->_lineWidthConstraint setConstant:v6];
  [(TransitDirectionsExpandStopsStepView *)self _minimumLinkHeight];
  -[NSLayoutConstraint setConstant:](self->_lineHeightConstraint, "setConstant:");
  [(TransitDirectionsExpandStopsStepView *)self updateExpandCollapseStyling];
}

- (UIColor)lineColor
{
  return [(TransitDirectionsColoredLine *)self->_line lineColor];
}

- (void)setLineColor:(id)a3
{
}

- (TransitDirectionsListExpandableItem)expandableItem
{
  if (!self->_checkedItemIsExpandable)
  {
    objc_super v3 = [(TransitDirectionsStepView *)self transitListItem];
    if (v3)
    {
      do
      {
        if ([v3 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])break; {
        uint64_t v4 = [v3 parentItem];
        }

        objc_super v3 = (void *)v4;
      }
      while (v4);
    }
    objc_storeWeak((id *)&self->_expandableItem, v3);
    self->_checkedItemIsExpandable = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableItem);

  return (TransitDirectionsListExpandableItem *)WeakRetained;
}

- (void)_updateLinkColors
{
  id v4 = [(TransitDirectionsStepView *)self transitListItem];
  objc_super v3 = [v4 fromLineColor];
  [(TransitDirectionsExpandStopsStepView *)self setLineColor:v3];
}

- (void)_updateLinkStyles
{
  id v6 = [(TransitDirectionsStepView *)self transitListItem];
  if ([v6 type] == (id)7)
  {
    objc_super v3 = [(TransitDirectionsExpandStopsStepView *)self expandableItem];
    if ([v3 shouldEnableExpandedButton])
    {
      id v4 = [(TransitDirectionsExpandStopsStepView *)self expandableItem];
      if ([v4 expanded]) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = 3;
      }
      [(TransitDirectionsColoredLine *)self->_line setStyle:v5];
    }
    else
    {
      [(TransitDirectionsColoredLine *)self->_line setStyle:0];
    }
  }
  else
  {
    [(TransitDirectionsColoredLine *)self->_line setStyle:0];
  }
}

- (void)updateExpandCollapseStyling
{
  [(TransitDirectionsExpandStopsStepView *)self _updateLinkStyles];

  [(TransitDirectionsExpandStopsStepView *)self _updateExpandButton];
}

- (void)_updateExpandButton
{
  objc_super v3 = [(TransitDirectionsExpandStopsStepView *)self expandableItem];
  id v4 = [(MapsLargerHitTargetButton *)self->_detailButton currentTitle];
  if (v3)
  {
    unsigned int v5 = [v3 shouldEnableExpandedButton];
    id v6 = [(TransitDirectionsExpandStopsStepView *)self traitCollection];
    unsigned int v7 = [v6 isLuminanceReduced];

    int v8 = v5 & ~v7;
    v9 = objc_msgSend(v3, "expandingButtonTitleForExpandedState:", objc_msgSend(v3, "expanded") & v8);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BC5164;
    v10[3] = &unk_1012E5CE0;
    v10[4] = self;
    id v4 = v9;
    id v11 = v4;
    char v12 = v8;
    +[UIView performWithoutAnimation:v10];
  }
  -[MapsLargerHitTargetButton setHidden:](self->_detailButton, "setHidden:", [v4 length] == 0);
  if (v3)
  {
    [(TransitDirectionsStepView *)self _updateConstraints];
    [(TransitDirectionsExpandStopsStepView *)self _mapkit_layoutIfNeeded];
  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsExpandStopsStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v6, "_updateNavigationStateAlpha:");
  unsigned int v5 = [(TransitDirectionsExpandStopsStepView *)self detailButton];
  [v5 setAlpha:a3];

  [(TransitDirectionsColoredLine *)self->_line setAlpha:a3];
}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableCellDelegate);

  return (TransitDirectionsExpandableCellDelegate *)WeakRetained;
}

- (void)setExpandableCellDelegate:(id)a3
{
}

- (MapsLargerHitTargetButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_destroyWeak((id *)&self->_expandableCellDelegate);
  objc_storeStrong((id *)&self->_lineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lineWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_expandableItem);

  objc_storeStrong((id *)&self->_line, 0);
}

@end