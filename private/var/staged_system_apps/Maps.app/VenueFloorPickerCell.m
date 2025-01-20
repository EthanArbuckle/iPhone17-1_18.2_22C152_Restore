@interface VenueFloorPickerCell
+ (double)cellHeight;
+ (id)floorNameFont;
+ (id)reuseIdentifier;
- (BOOL)isUserLocation;
- (BOOL)lacksSearchResults;
- (BOOL)showSelection;
- (NSNumber)floorOrdinal;
- (NSString)floorName;
- (UILabel)floorNameLabel;
- (UIView)selectionBackgroundView;
- (VenueFloorPickerCell)initWithFrame:(CGRect)a3;
- (void)setFloorName:(id)a3;
- (void)setFloorNameLabel:(id)a3;
- (void)setFloorOrdinal:(id)a3;
- (void)setIsUserLocation:(BOOL)a3;
- (void)setLacksSearchResults:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionBackgroundView:(id)a3;
- (void)setShowSelection:(BOOL)a3;
- (void)updateStyle;
@end

@implementation VenueFloorPickerCell

- (VenueFloorPickerCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v54.receiver = self;
  v54.super_class = (Class)VenueFloorPickerCell;
  v7 = -[VenueFloorPickerCell initWithFrame:](&v54, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    [(VenueFloorPickerCell *)v7 setAccessibilityIdentifier:@"VenueFloorPickerCell"];
    v9 = (UIView *)objc_alloc_init((Class)UIView);
    selectionBackgroundView = v8->_selectionBackgroundView;
    v8->_selectionBackgroundView = v9;

    [(UIView *)v8->_selectionBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8->_selectionBackgroundView setAlpha:0.0];
    v11 = [(VenueFloorPickerCell *)v8 contentView];
    [v11 addSubview:v8->_selectionBackgroundView];

    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(x + 5.0, y, width + -10.0, height)];
    floorNameLabel = v8->_floorNameLabel;
    v8->_floorNameLabel = v12;

    [(UILabel *)v8->_floorNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[UIColor clearColor];
    [(UILabel *)v8->_floorNameLabel setBackgroundColor:v14];

    [(UILabel *)v8->_floorNameLabel setTextAlignment:1];
    [(UILabel *)v8->_floorNameLabel setBaselineAdjustment:1];
    v15 = [(id)objc_opt_class() floorNameFont];
    [(UILabel *)v8->_floorNameLabel setFont:v15];

    [(UILabel *)v8->_floorNameLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v8->_floorNameLabel setMinimumScaleFactor:0.25];
    v16 = [(VenueFloorPickerCell *)v8 contentView];
    [v16 addSubview:v8->_floorNameLabel];

    v17 = [(VenueFloorPickerCell *)v8 contentView];
    id v18 = [v17 _maps_addHairlineAtBottomWithMargin:0.0];

    v52 = [(UILabel *)v8->_floorNameLabel leadingAnchor];
    v53 = [(VenueFloorPickerCell *)v8 contentView];
    v51 = [v53 leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 constant:5.0];
    v55[0] = v50;
    v48 = [(UILabel *)v8->_floorNameLabel trailingAnchor];
    v49 = [(VenueFloorPickerCell *)v8 contentView];
    v47 = [v49 trailingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:-5.0];
    v55[1] = v46;
    v44 = [(UILabel *)v8->_floorNameLabel centerYAnchor];
    v45 = [(VenueFloorPickerCell *)v8 contentView];
    v43 = [v45 centerYAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v55[2] = v42;
    v40 = [(UILabel *)v8->_floorNameLabel heightAnchor];
    v41 = [(VenueFloorPickerCell *)v8 contentView];
    v39 = [v41 heightAnchor];
    LODWORD(v19) = 1144750080;
    v38 = [v40 constraintLessThanOrEqualToAnchor:v39 constant:-16.0 priority:v19];
    v55[3] = v38;
    v36 = [(UIView *)v8->_selectionBackgroundView leadingAnchor];
    v37 = [(VenueFloorPickerCell *)v8 contentView];
    v35 = [v37 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v55[4] = v34;
    v32 = [(UIView *)v8->_selectionBackgroundView trailingAnchor];
    v33 = [(VenueFloorPickerCell *)v8 contentView];
    v31 = [v33 trailingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v55[5] = v30;
    v20 = [(UIView *)v8->_selectionBackgroundView topAnchor];
    v21 = [(VenueFloorPickerCell *)v8 contentView];
    v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    v55[6] = v23;
    v24 = [(UIView *)v8->_selectionBackgroundView bottomAnchor];
    v25 = [(VenueFloorPickerCell *)v8 contentView];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v55[7] = v27;
    v28 = +[NSArray arrayWithObjects:v55 count:8];
    +[NSLayoutConstraint activateConstraints:v28];

    [(VenueFloorPickerCell *)v8 updateStyle];
  }
  return v8;
}

+ (id)reuseIdentifier
{
  return @"VenueFloorPickerCellIdentifier";
}

+ (double)cellHeight
{
  v2 = [a1 floorNameFont];
  [v2 ascender];
  double v4 = v3;
  [v2 descender];
  double v6 = v4 - v5 + 16.0;

  return v6;
}

+ (id)floorNameFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIContentSizeCategoryLarge contentSizeCategory:0 symbolicTraits:UIFontWeightMedium];
}

- (NSString)floorName
{
  return [(UILabel *)self->_floorNameLabel text];
}

- (void)setFloorName:(id)a3
{
}

- (void)setIsUserLocation:(BOOL)a3
{
  self->_isUserLocation = a3;
  [(VenueFloorPickerCell *)self updateStyle];
}

- (void)setLacksSearchResults:(BOOL)a3
{
  self->_lacksSearchResults = a3;
  [(VenueFloorPickerCell *)self updateStyle];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VenueFloorPickerCell;
  [(VenueFloorPickerCell *)&v4 setSelected:a3];
  [(VenueFloorPickerCell *)self updateStyle];
}

- (void)setShowSelection:(BOOL)a3
{
  self->_showSelection = a3;
  if ([(VenueFloorPickerCell *)self isSelected])
  {
    [(VenueFloorPickerCell *)self updateStyle];
  }
}

- (void)updateStyle
{
  double v3 = +[UIColor tertiarySystemFillColor];
  objc_super v4 = [(VenueFloorPickerCell *)self selectionBackgroundView];
  [v4 setBackgroundColor:v3];

  if ([(VenueFloorPickerCell *)self isUserLocation])
  {
    double v5 = [(VenueFloorPickerCell *)self theme];
    uint64_t v6 = [v5 keyColor];
LABEL_5:
    v7 = (void *)v6;
    v8 = [(VenueFloorPickerCell *)self floorNameLabel];
    [v8 setTextColor:v7];

    goto LABEL_7;
  }
  if ([(VenueFloorPickerCell *)self lacksSearchResults])
  {
    double v5 = [(VenueFloorPickerCell *)self theme];
    uint64_t v6 = [v5 venueFloorPickerLackingSearchResultsTextColor];
    goto LABEL_5;
  }
  double v5 = +[MapsTheme floatingControlsTintColor];
  v7 = [(VenueFloorPickerCell *)self floorNameLabel];
  [v7 setTextColor:v5];
LABEL_7:

  v9 = [(VenueFloorPickerCell *)self floorNameLabel];
  v10 = [v9 textColor];
  v11 = [(VenueFloorPickerCell *)self floorNameLabel];
  [v11 setHighlightedTextColor:v10];

  double v12 = 0.0;
  if ([(VenueFloorPickerCell *)self isSelected])
  {
    if ([(VenueFloorPickerCell *)self showSelection]) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
  }
  id v13 = [(VenueFloorPickerCell *)self selectionBackgroundView];
  [v13 setAlpha:v12];
}

- (NSNumber)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void)setFloorOrdinal:(id)a3
{
}

- (UILabel)floorNameLabel
{
  return self->_floorNameLabel;
}

- (void)setFloorNameLabel:(id)a3
{
}

- (UIView)selectionBackgroundView
{
  return self->_selectionBackgroundView;
}

- (void)setSelectionBackgroundView:(id)a3
{
}

- (BOOL)isUserLocation
{
  return self->_isUserLocation;
}

- (BOOL)lacksSearchResults
{
  return self->_lacksSearchResults;
}

- (BOOL)showSelection
{
  return self->_showSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_floorNameLabel, 0);

  objc_storeStrong((id *)&self->_floorOrdinal, 0);
}

@end