@interface TransitRouteTableViewCell
- (BOOL)_isShieldListViewOverlappingWithBadge;
- (BOOL)canSpanFullWidth;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)_indexedContentSubviewOrNullArray;
- (TransitRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIEdgeInsets)contentHorizontalMargins;
- (double)_distanceToPositionPrimaryLabelFirstBaseline;
- (double)leftPadding;
- (id)_anchorFromWhichToPositionPrimaryLabelFirstBaseline;
- (id)_autolayoutConstraints;
- (id)_badgeLabelFont;
- (id)_buttonConstraintsController;
- (void)_configureRouteBadge;
- (void)_createSubviews;
- (void)_updateCellLabels;
- (void)_updateConstraintValues;
- (void)_updateRouteBadge;
- (void)_updateShieldListView;
- (void)layoutSubviews;
- (void)setCanSpanFullWidth:(BOOL)a3;
- (void)setLeftPadding:(double)a3;
- (void)setShowDisclosureButton:(BOOL)a3;
@end

@implementation TransitRouteTableViewCell

- (TransitRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TransitRouteTableViewCell;
  v4 = [(RouteTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_leftPadding = 0.0;
    v6 = v4;
  }

  return v5;
}

- (void)_createSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TransitRouteTableViewCell;
  [(RouteTableViewCell *)&v6 _createSubviews];
  v3 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  shieldListView = self->_shieldListView;
  self->_shieldListView = v3;

  [(TransitArtworkListView *)self->_shieldListView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(TransitRouteTableViewCell *)self contentView];
  [v5 addSubview:self->_shieldListView];
}

- (id)_autolayoutConstraints
{
  v19.receiver = self;
  v19.super_class = (Class)TransitRouteTableViewCell;
  v3 = [(RouteTableViewCell *)&v19 _autolayoutConstraints];
  v4 = [(_MKUILabel *)self->super._primaryLabel trailingAnchor];
  v5 = [(TransitRouteTableViewCell *)self contentView];
  objc_super v6 = [v5 trailingAnchor];
  v7 = [v4 constraintLessThanOrEqualToAnchor:v6];
  [v3 addObject:v7];

  objc_super v8 = [(TransitArtworkListView *)self->_shieldListView topAnchor];
  v9 = [(TransitRouteTableViewCell *)self contentView];
  v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:0.0];
  topToShieldListViewConstraint = self->_topToShieldListViewConstraint;
  self->_topToShieldListViewConstraint = v11;

  LODWORD(v13) = 1148829696;
  [(NSLayoutConstraint *)self->_topToShieldListViewConstraint setPriority:v13];
  v20[0] = self->_topToShieldListViewConstraint;
  v14 = [(TransitArtworkListView *)self->_shieldListView leadingAnchor];
  v15 = [(_MKUILabel *)self->super._primaryLabel leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v20[1] = v16;
  v17 = +[NSArray arrayWithObjects:v20 count:2];
  [v3 addObjectsFromArray:v17];

  [(TransitRouteTableViewCell *)self _updateConstraintValues];

  return v3;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)TransitRouteTableViewCell;
  [(TransitRouteTableViewCell *)&v25 layoutSubviews];
  v3 = [(TransitRouteTableViewCell *)self contentView];
  [v3 layoutIfNeeded];

  v4 = [(RouteTableViewCell *)self disclosureButton];
  [v4 frame];
  double v6 = v5;
  v7 = [(RouteTableViewCell *)self disclosureButton];
  [v7 frame];
  double v9 = v6 + v8;
  [(TransitRouteTableViewCell *)self frame];
  double v11 = v9 - v10;

  v12 = [(RouteTableViewCell *)self disclosureButton];
  [v12 setTouchInsets:0.0, 0.0, v11, 0.0];

  [(TransitRouteTableViewCell *)self contentHorizontalMargins];
  -[RouteTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  if (!self->_inRecursiveLayout
    && [(TransitRouteTableViewCell *)self canSpanFullWidth]
    && [(TransitArtworkListView *)self->_shieldListView numberOfLines] >= 2)
  {
    [(TransitArtworkListView *)self->_shieldListView singleLineWidth];
    double v14 = v13;
    v15 = [(TransitRouteTableViewCell *)self accessoryView];
    v16 = v15;
    if (v15)
    {
      [v15 frame];
      double v17 = CGRectGetWidth(v26) + 16.0;
    }
    else
    {
      double v17 = 0.0;
    }
    [(CenteredTableViewCell *)self maximumContentWidth];
    if (v18 > v14 + v17) {
      [(CenteredTableViewCell *)self maximumContentWidth];
    }
    -[CenteredTableViewCell setMaximumContentWidth:](self, "setMaximumContentWidth:");
    [(TransitRouteTableViewCell *)self _mapkit_setNeedsLayout];
    self->_inRecursiveLayout = 1;
    [(TransitRouteTableViewCell *)self layoutSubviews];
    self->_inRecursiveLayout = 0;
  }
  objc_super v19 = [(_MKUILabel *)self->_badgeLabel superview];

  if (v19)
  {
    unsigned int v20 = [(TransitRouteTableViewCell *)self _isShieldListViewOverlappingWithBadge];
    if (v20) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = 5;
    }
    if (v20) {
      v22 = &OBJC_IVAR___RouteTableViewCell__secondaryLabelToContentViewConstraint;
    }
    else {
      v22 = &OBJC_IVAR___TransitRouteTableViewCell__secondaryLabelTrailingToBadgeLeadingConstraint;
    }
    if (v20) {
      uint64_t v23 = 5;
    }
    else {
      uint64_t v23 = 4;
    }
    if (v20) {
      v24 = &OBJC_IVAR___TransitRouteTableViewCell__secondaryLabelTrailingToBadgeLeadingConstraint;
    }
    else {
      v24 = &OBJC_IVAR___RouteTableViewCell__secondaryLabelToContentViewConstraint;
    }
    [*(id *)((char *)&self->super.super + OBJC_IVAR___TransitRouteTableViewCell__shieldListView[v21]) setActive:0];
    [*(id *)((char *)&self->super.super + *v22) setActive:0];
    [*(id *)((char *)&self->super.super + OBJC_IVAR___TransitRouteTableViewCell__shieldListView[v23]) setActive:1];
    [*(id *)((char *)&self->super.super + *v24) setActive:1];
  }
}

- (BOOL)_isShieldListViewOverlappingWithBadge
{
  v3 = [(_MKUILabel *)self->_badgeLabel superview];

  if (!v3) {
    return 0;
  }
  if ([(TransitArtworkListView *)self->_shieldListView numberOfLines] > 1) {
    return 1;
  }
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(TransitRouteTableViewCell *)self semanticContentAttribute]] == (id)1)
  {
    [(_MKUILabel *)self->_badgeLabel frame];
    double MaxX = CGRectGetMaxX(v11);
    [(TransitArtworkListView *)self->_shieldListView frame];
    double v6 = CGRectGetMaxX(v12);
    [(TransitArtworkListView *)self->_shieldListView singleLineWidth];
    double v8 = v6 - v7 + -16.0;
  }
  else
  {
    [(TransitArtworkListView *)self->_shieldListView frame];
    double MinX = CGRectGetMinX(v13);
    [(TransitArtworkListView *)self->_shieldListView singleLineWidth];
    double MaxX = MinX + v10 + 16.0;
    [(_MKUILabel *)self->_badgeLabel frame];
    double v8 = CGRectGetMinX(v14);
  }
  return MaxX > v8;
}

- (UIEdgeInsets)contentHorizontalMargins
{
  if ([(TransitRouteTableViewCell *)self canSpanFullWidth])
  {
    [(TransitRouteTableViewCell *)self bounds];
    double Width = CGRectGetWidth(v26);
    [(CenteredTableViewCell *)self maximumContentWidth];
    double v5 = Width - v4;
    [(CenteredTableViewCell *)self minimumHorizontalMargins];
    double v7 = v6;
    [(CenteredTableViewCell *)self minimumHorizontalMargins];
    if (v5 <= v7 + v8)
    {
      [(CenteredTableViewCell *)self minimumHorizontalMargins];
      double v10 = v18;
      double v9 = v19;
      double v11 = v20;
      double v12 = v21;
    }
    else
    {
      double v9 = v5 * 0.5;
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = v9;
    }
  }
  else
  {
    CGRect v13 = [(TransitRouteTableViewCell *)self _tableView];
    [v13 separatorInset];
    double v10 = v14;
    double v9 = v15;
    double v11 = v16;
    double v12 = v17;
  }
  double v22 = v10;
  double v23 = v9;
  double v24 = v11;
  double v25 = v12;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(TransitRouteTableViewCell *)self layoutIfNeeded];
  v14.receiver = self;
  v14.super_class = (Class)TransitRouteTableViewCell;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[TransitRouteTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)_anchorFromWhichToPositionPrimaryLabelFirstBaseline
{
  return [(TransitArtworkListView *)self->_shieldListView bottomAnchor];
}

- (double)_distanceToPositionPrimaryLabelFirstBaseline
{
  return 20.0;
}

- (void)_updateConstraintValues
{
  v18.receiver = self;
  v18.super_class = (Class)TransitRouteTableViewCell;
  [(RouteTableViewCell *)&v18 _updateConstraintValues];
  v3 = [(RouteTableViewCell *)self disclosureButton];
  double v4 = [v3 titleLabel];
  double v5 = [v4 font];
  [v5 _scaledValueForValue:24.0];

  UIRoundToViewScale();
  double v7 = v6;
  double v8 = [(RouteTableViewCell *)self buttonConstraintsController];
  [v8 setFirstBaselineDistance:v7];

  if ([(TransitRouteTableViewCell *)self _shouldHaveFullLengthTopSeparator])
  {
    double v9 = self;
    double v10 = [(TransitRouteTableViewCell *)v9 window];
    double v11 = [v10 screen];
    if (v11)
    {
      double v12 = [(TransitRouteTableViewCell *)v9 window];

      double v13 = [v12 screen];
      [v13 nativeScale];
    }
    else
    {
      double v12 = +[UIScreen mainScreen];

      [v12 nativeScale];
    }
  }
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_topToShieldListViewConstraint, "setConstant:");
  objc_super v14 = [(_MKUILabel *)self->_badgeLabel font];
  [v14 capHeight];
  -[NSLayoutConstraint setConstant:](self->_topShieldViewToBadgeLabelConstraint, "setConstant:");

  [(TransitRouteTableViewCell *)self separatorInset];
  double v15 = 16.0;
  if (v16 > 16.0)
  {
    [(TransitRouteTableViewCell *)self separatorInset];
    double v15 = v17;
  }
  [(NSLayoutConstraint *)self->_badgeLabelTrailingConstraint setConstant:v15];
}

- (void)_updateCellLabels
{
  v4.receiver = self;
  v4.super_class = (Class)TransitRouteTableViewCell;
  [(RouteTableViewCell *)&v4 _updateCellLabels];
  v3 = [(RouteTableViewCell *)self route];

  if (v3)
  {
    [(TransitRouteTableViewCell *)self _updateShieldListView];
    [(TransitRouteTableViewCell *)self _updateRouteBadge];
  }
}

- (void)_updateShieldListView
{
  id v5 = [(RouteTableViewCell *)self route];
  if (v5)
  {
    v3 = [(RouteTableViewCell *)self route];
    objc_super v4 = [v3 routePlanningArtworks];
    [(TransitArtworkListView *)self->_shieldListView setArtworkData:v4];

    [(TransitRouteTableViewCell *)self _mapkit_setNeedsLayout];
  }
  else
  {
    [(TransitArtworkListView *)self->_shieldListView setArtworkData:0];
  }
}

- (void)_updateRouteBadge
{
  v3 = [(RouteTableViewCell *)self route];
  objc_super v4 = [v3 transitRouteBadge];
  NSAttributedStringKey v8 = NSFontAttributeName;
  id v5 = [(TransitRouteTableViewCell *)self _badgeLabelFont];
  double v9 = v5;
  double v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  double v7 = +[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:v4 defaultAttributes:v6];

  if (-[RouteTableViewCell showDisclosureButton](self, "showDisclosureButton") || ![v7 length])
  {
    [(_MKUILabel *)self->_badgeLabel removeFromSuperview];
  }
  else
  {
    [(TransitRouteTableViewCell *)self _configureRouteBadge];
    [(_MKUILabel *)self->_badgeLabel setAttributedText:v7];
  }
}

- (id)_badgeLabelFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption2 addingSymbolicTraits:0];
}

- (void)_configureRouteBadge
{
  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    objc_super v4 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    id v5 = self->_badgeLabel;
    self->_badgeLabel = v4;

    [(_MKUILabel *)self->_badgeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(_MKUILabel *)self->_badgeLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(_MKUILabel *)self->_badgeLabel _mapkit_setContentHuggingPriority:0 forAxis:v7];
    NSAttributedStringKey v8 = +[UIColor systemGrayColor];
    [(_MKUILabel *)self->_badgeLabel setTextColor:v8];

    double v9 = [(TransitRouteTableViewCell *)self _badgeLabelFont];
    [(_MKUILabel *)self->_badgeLabel setFont:v9];

    badgeLabel = self->_badgeLabel;
  }
  double v10 = [(_MKUILabel *)badgeLabel superview];

  if (!v10)
  {
    double v11 = [(TransitRouteTableViewCell *)self contentView];
    [v11 addSubview:self->_badgeLabel];

    if (!self->_badgeLabelTrailingConstraint)
    {
      double v12 = [(TransitRouteTableViewCell *)self trailingAnchor];
      double v13 = [(_MKUILabel *)self->_badgeLabel trailingAnchor];
      objc_super v14 = [v12 constraintEqualToAnchor:v13];
      badgeLabelTrailingConstraint = self->_badgeLabelTrailingConstraint;
      self->_badgeLabelTrailingConstraint = v14;
    }
    if (!self->_topShieldViewToBadgeLabelConstraint)
    {
      double v16 = [(_MKUILabel *)self->_badgeLabel firstBaselineAnchor];
      double v17 = [(TransitArtworkListView *)self->_shieldListView topAnchor];
      objc_super v18 = [v16 constraintEqualToAnchor:v17];
      topShieldViewToBadgeLabelConstraint = self->_topShieldViewToBadgeLabelConstraint;
      self->_topShieldViewToBadgeLabelConstraint = v18;
    }
    if (!self->_secondaryLabelBaselineAlignWithBadgeConstraint)
    {
      double v20 = [(_MKUILabel *)self->super._secondaryLabel lastBaselineAnchor];
      double v21 = [(_MKUILabel *)self->_badgeLabel firstBaselineAnchor];
      double v22 = [v20 constraintEqualToAnchor:v21];
      secondaryLabelBaselineAlignWithBadgeConstraint = self->_secondaryLabelBaselineAlignWithBadgeConstraint;
      self->_secondaryLabelBaselineAlignWithBadgeConstraint = v22;
    }
    if (!self->_secondaryLabelTrailingToBadgeLeadingConstraint)
    {
      double v24 = [(_MKUILabel *)self->_badgeLabel leadingAnchor];
      double v25 = [(_MKUILabel *)self->super._secondaryLabel trailingAnchor];
      CGRect v26 = [v24 constraintEqualToAnchor:v25 constant:16.0];
      secondaryLabelTrailingToBadgeLeadingConstraint = self->_secondaryLabelTrailingToBadgeLeadingConstraint;
      self->_secondaryLabelTrailingToBadgeLeadingConstraint = v26;
    }
    v28 = self->_topShieldViewToBadgeLabelConstraint;
    v30[0] = self->_badgeLabelTrailingConstraint;
    v30[1] = v28;
    v29 = +[NSArray arrayWithObjects:v30 count:2];
    +[NSLayoutConstraint activateConstraints:v29];
  }
}

- (void)setShowDisclosureButton:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransitRouteTableViewCell;
  -[RouteTableViewCell setShowDisclosureButton:](&v8, "setShowDisclosureButton:");
  if (v3)
  {
    id v5 = [(RouteTableViewCell *)self disclosureButton];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"More Routes Prompt" value:@"localized string not found" table:0];
    [v5 setTitle:v7 forState:0];

    [(TransitRouteTableViewCell *)self _updateConstraintValues];
  }
  [(TransitRouteTableViewCell *)self _updateRouteBadge];
}

- (id)_buttonConstraintsController
{
  UIRoundToViewScale();
  double v4 = v3;
  id v5 = [RouteTableViewCellButtonConstraintsController alloc];
  double v6 = [(TransitArtworkListView *)self->_shieldListView trailingAnchor];
  double v7 = [(TransitRouteTableViewCell *)self contentView];
  objc_super v8 = [v7 trailingAnchor];
  double v9 = [(TransitRouteTableViewCell *)self contentView];
  double v10 = [v9 topAnchor];
  double v11 = [(RouteTableViewCellButtonConstraintsController *)v5 initWithLeadingAnchor:v6 trailingAnchor:v8 firstBaselineAnchor:v10 leadingDistance:4.0 firstBaselineDistance:v4];

  return v11;
}

- (void)setLeftPadding:(double)a3
{
  self->_leftPadding = a3;
  -[NSLayoutConstraint setConstant:](self->super._leftPaddingConstraint, "setConstant:");
}

- (NSArray)_indexedContentSubviewOrNullArray
{
  double v3 = [(TransitArtworkListView *)self->_shieldListView window];
  if (v3)
  {
    uint64_t shieldListView = (uint64_t)self->_shieldListView;
  }
  else
  {
    uint64_t shieldListView = +[NSNull null];
  }
  double v17 = (void *)shieldListView;
  v18[0] = shieldListView;
  id v5 = [(_MKUILabel *)self->super._primaryLabel window];
  if (v5)
  {
    uint64_t primaryLabel = (uint64_t)self->super._primaryLabel;
  }
  else
  {
    uint64_t primaryLabel = +[NSNull null];
  }
  v18[1] = primaryLabel;
  double v7 = [(_MKUILabel *)self->super._secondaryLabel window];
  if (v7)
  {
    secondaryLabel = self->super._secondaryLabel;
  }
  else
  {
    secondaryLabel = +[NSNull null];
  }
  v18[2] = secondaryLabel;
  double v9 = [(RouteTableViewCell *)self disclosureButton];
  double v10 = [v9 window];
  if (v10) {
    [(RouteTableViewCell *)self disclosureButton];
  }
  else {
  double v11 = +[NSNull null];
  }
  v18[3] = v11;
  double v12 = [(_MKUILabel *)self->_badgeLabel window];
  if (v12)
  {
    badgeLabel = self->_badgeLabel;
  }
  else
  {
    badgeLabel = +[NSNull null];
  }
  v18[4] = badgeLabel;
  objc_super v14 = +[NSArray arrayWithObjects:v18 count:5];
  if (!v12) {

  }
  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return (NSArray *)v14;
}

- (BOOL)canSpanFullWidth
{
  return self->_canSpanFullWidth;
}

- (void)setCanSpanFullWidth:(BOOL)a3
{
  self->_canSpanFulldouble Width = a3;
}

- (double)leftPadding
{
  return self->_leftPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelTrailingToBadgeLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBaselineAlignWithBadgeConstraint, 0);
  objc_storeStrong((id *)&self->_topShieldViewToBadgeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_badgeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_topToShieldListViewConstraint, 0);

  objc_storeStrong((id *)&self->_shieldListView, 0);
}

@end