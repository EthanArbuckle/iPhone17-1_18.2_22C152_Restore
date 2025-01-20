@interface TransitDirectionsBlockTransferStepView
+ (double)leadingTextInsetForBlockTransferTransitDirectionsListItem:(id)a3 navigationState:(int64_t)a4;
- (double)_primaryLabelLineSpacing;
- (double)_topToPrimaryLabelDistance;
- (id)_initialConstraints;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_updateFonts;
- (void)_updateLineSpacing;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
@end

@implementation TransitDirectionsBlockTransferStepView

- (void)_contentSizeCategoryDidChange
{
  [(TransitDirectionsBlockTransferStepView *)self _topToPrimaryLabelDistance];
  -[NSLayoutConstraint setConstant:](self->_topToPrimaryLabelBaselineConstraint, "setConstant:");
  [(TransitDirectionsBlockTransferStepView *)self _blockTransferImageOffsetFromPrimaryLabelBaseline];
  -[NSLayoutConstraint setConstant:](self->_imageViewToLabelVerticalAlignmentConstraint, "setConstant:");
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsBlockTransferStepView;
  [(TransitDirectionsStepView *)&v3 _contentSizeCategoryDidChange];
  [(TransitDirectionsBlockTransferStepView *)self _updateFonts];
}

- (void)_createSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsBlockTransferStepView;
  [(TransitDirectionsStepView *)&v17 _createSubviews];
  id v3 = objc_alloc((Class)_MKUILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [_MKUILabel initWithFrame:CGRectZero.origin.x, y, width, height];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  [(_MKUILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(_MKUILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_primaryLabel setTextAlignment:4];
  [(_MKUILabel *)self->_primaryLabel setLineBreakMode:0];
  [(_MKUILabel *)self->_primaryLabel setAdjustsFontForContentSizeCategory:1];
  v9 = +[UIColor secondaryLabelColor];
  [(_MKUILabel *)self->_primaryLabel setTextColor:v9];

  [(_MKUILabel *)self->_primaryLabel setNumberOfLines:0];
  [(TransitDirectionsBlockTransferStepView *)self addSubview:self->_primaryLabel];
  v10 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  blockTransferImageView = self->_blockTransferImageView;
  self->_blockTransferImageView = v10;

  [(MKArtworkImageView *)self->_blockTransferImageView setAccessibilityIdentifier:@"BlockTransferImageView"];
  [(MKArtworkImageView *)self->_blockTransferImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(TransitDirectionsBlockTransferStepView *)self layer];
  id v13 = [v12 backgroundColor];
  v14 = [(MKArtworkImageView *)self->_blockTransferImageView layer];
  [v14 setBackgroundColor:v13];

  LODWORD(v15) = 1148829696;
  [(MKArtworkImageView *)self->_blockTransferImageView _mapkit_setContentHuggingPriority:0 forAxis:v15];
  LODWORD(v16) = 1148829696;
  [(MKArtworkImageView *)self->_blockTransferImageView _mapkit_setContentHuggingPriority:1 forAxis:v16];
  [(MKArtworkImageView *)self->_blockTransferImageView setContentMode:1];
  [(TransitDirectionsBlockTransferStepView *)self addSubview:self->_blockTransferImageView];
  [(TransitDirectionsBlockTransferStepView *)self _updateFonts];
}

- (id)_initialConstraints
{
  v37.receiver = self;
  v37.super_class = (Class)TransitDirectionsBlockTransferStepView;
  id v3 = [(TransitDirectionsStepView *)&v37 _initialConstraints];
  v4 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v5 = [v4 leadingAnchor];
  v6 = [(MKArtworkImageView *)self->_blockTransferImageView leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  v8 = [(_MKUILabel *)self->_primaryLabel leadingAnchor];
  v9 = [(MKArtworkImageView *)self->_blockTransferImageView trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:6.0];
  primaryLabelLeadingToImageViewConstraint = self->_primaryLabelLeadingToImageViewConstraint;
  self->_primaryLabelLeadingToImageViewConstraint = v10;

  [v3 addObject:self->_primaryLabelLeadingToImageViewConstraint];
  v12 = [(_MKUILabel *)self->_primaryLabel leadingAnchor];
  id v13 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v14 = [v13 leadingAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14];
  primaryLabelLeadingConstraint = self->_primaryLabelLeadingConstraint;
  self->_primaryLabelLeadingConstraint = v15;

  objc_super v17 = [(_MKUILabel *)self->_primaryLabel trailingAnchor];
  v18 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v19 = [v18 trailingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  v21 = [(_MKUILabel *)self->_primaryLabel firstBaselineAnchor];
  v22 = [(TransitDirectionsBlockTransferStepView *)self topAnchor];
  [(TransitDirectionsBlockTransferStepView *)self _topToPrimaryLabelDistance];
  [v21 constraintEqualToAnchor:v22];
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToPrimaryLabelBaselineConstraint = self->_topToPrimaryLabelBaselineConstraint;
  self->_topToPrimaryLabelBaselineConstraint = v23;

  [v3 addObject:self->_topToPrimaryLabelBaselineConstraint];
  v25 = [(_MKUILabel *)self->_primaryLabel bottomAnchor];
  v26 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  v29 = [(_MKUILabel *)self->_primaryLabel firstBaselineAnchor];
  v30 = [(MKArtworkImageView *)self->_blockTransferImageView centerYAnchor];
  [(TransitDirectionsBlockTransferStepView *)self _blockTransferImageOffsetFromPrimaryLabelBaseline];
  [v29 constraintEqualToAnchor:v30];
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewToLabelVerticalAlignmentConstraint = self->_imageViewToLabelVerticalAlignmentConstraint;
  self->_imageViewToLabelVerticalAlignmentConstraint = v31;

  [v3 addObject:self->_imageViewToLabelVerticalAlignmentConstraint];
  LODWORD(v33) = 1144750080;
  [(MKArtworkImageView *)self->_blockTransferImageView _mapkit_setContentCompressionResistancePriority:0 forAxis:v33];
  LODWORD(v34) = 1132068864;
  [(_MKUILabel *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v34];
  LODWORD(v35) = 1148829696;
  [(_MKUILabel *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v35];

  return v3;
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsBlockTransferStepView;
  [(TransitDirectionsStepView *)&v20 configureWithItem:v4];
  v5 = [v4 imageSourceForStyle:0];
  [(MKArtworkImageView *)self->_blockTransferImageView setImageSource:v5];

  v6 = [(MKArtworkImageView *)self->_blockTransferImageView image];
  [v6 size];
  BOOL v9 = v8 == CGSizeZero.height && v7 == CGSizeZero.width;
  [(NSLayoutConstraint *)self->_primaryLabelLeadingConstraint setActive:v9];

  [(NSLayoutConstraint *)self->_primaryLabelLeadingToImageViewConstraint setActive:[(NSLayoutConstraint *)self->_primaryLabelLeadingConstraint isActive] ^ 1];
  if ([(TransitDirectionsStepView *)self useNavigationMetrics]
    || ([(TransitDirectionsBlockTransferStepView *)self traitCollection],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 preferredContentSizeCategory],
        v11 = objc_claimAutoreleasedReturnValue(),
        IsAccessibilityContentSizeCategordouble y = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(),
        v11,
        v10,
        IsAccessibilityContentSizeCategory))
  {
    uint64_t v13 = 6;
  }
  else
  {
    uint64_t v13 = 5;
  }
  v21[0] = NSFontAttributeName;
  v14 = [(_MKUILabel *)self->_primaryLabel font];
  v22[0] = v14;
  v21[1] = MKServerFormattedStringArtworkSizeAttributeKey;
  double v15 = +[NSNumber numberWithInteger:v13];
  v22[1] = v15;
  double v16 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  objc_super v17 = [v4 majorFormattedStrings];
  v18 = [v17 firstObject];
  v19 = +[NSAttributedString _mapkit_attributedStringForComposedString:v18 defaultAttributes:v16];

  [(_MKUILabel *)self->_primaryLabel setAttributedText:v19];
}

- (double)_topToPrimaryLabelDistance
{
  v2 = [(_MKUILabel *)self->_primaryLabel font];
  [v2 _scaledValueForValue:20.0];

  UIRoundToViewScale();
  return result;
}

- (double)_primaryLabelLineSpacing
{
  id v3 = [(_MKUILabel *)self->_primaryLabel font];
  [v3 _mapkit_lineHeight];
  id v4 = [(_MKUILabel *)self->_primaryLabel font];
  [v4 leading];

  UIRoundToViewScale();
  return result;
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17];
  }
  else {
  id v3 = +[UIFont system15];
  }
  id v4 = [v3 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [(_MKUILabel *)self->_primaryLabel setFont:v4];

  [(TransitDirectionsBlockTransferStepView *)self _updateLineSpacing];
}

- (void)_updateLineSpacing
{
  primaryLabel = self->_primaryLabel;
  [(TransitDirectionsBlockTransferStepView *)self _primaryLabelLineSpacing];

  -[_MKUILabel _maps_setLineSpacing:](primaryLabel, "_maps_setLineSpacing:");
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBlockTransferStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  [(_MKUILabel *)self->_primaryLabel setAlpha:a3];
}

+ (double)leadingTextInsetForBlockTransferTransitDirectionsListItem:(id)a3 navigationState:(int64_t)a4
{
  id v4 = [a3 imageSourceForStyle:0 a4];
  objc_super v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  double v8 = [v4 imageToDisplayWithScreenScale:0 nightMode:v7];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  if (v12 == CGSizeZero.height && v10 == CGSizeZero.width) {
    double v14 = 0.0;
  }
  else {
    double v14 = v10 + 6.0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockTransferImageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelLeadingToImageViewConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewToLabelVerticalAlignmentConstraint, 0);

  objc_storeStrong((id *)&self->_topToPrimaryLabelBaselineConstraint, 0);
}

@end