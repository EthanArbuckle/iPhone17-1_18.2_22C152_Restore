@interface _SearchResultTableViewCell
+ (double)cellHeight;
+ (double)cellHeightWithTraitCollection:(id)a3 numberOfLines:(unint64_t)a4 hasPlaceContext:(BOOL)a5;
+ (double)estimatedCellHeight;
+ (double)estimatedTwoLinesCellHeight;
+ (double)placeContextHeightWithDisplayScale:(double)a3;
+ (id)_delimiterString;
+ (id)accessibilityIdentifier;
+ (id)identifier;
+ (id)placeContextLabelFont;
- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate;
- (BOOL)_showOpenStateLabel;
- (BOOL)canBecomeFirstResponder;
- (BOOL)displayDistanceIfValidCurrentLocation;
- (BOOL)displaysAsChainResult;
- (BOOL)displaysDistanceAsSnippetLocationAboveThreshold;
- (BOOL)prefersAddressOverCategory;
- (BOOL)shouldShowFallbackToAddressAndDistance;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GEOLocation)currentLocation;
- (GEOPublisherResult)publisherResult;
- (GEORelatedEntitySection)relatedSection;
- (GEOSearchCategory)searchCategory;
- (MKMapItem)mapItem;
- (NSString)debugString;
- (PersonalizedItem)personalizedItemForQuickActionMenu;
- (PlaceContextViewModel)placeContextViewModel;
- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate;
- (UILayoutGuide)contentLayoutGuide;
- (_SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)horizontalSpacing;
- (double)labelStackViewSpacing;
- (double)leadingMargin;
- (double)paddingAboveContextualInformationStackView;
- (double)trailingMargin;
- (id)_concatenateAttributedStrings:(id)a3;
- (id)_delimiterLabel;
- (id)accessoryViewObject;
- (id)attributedFirstPartDetailString;
- (id)attributedSecondPartDetailString;
- (id)attributedSubtitleString;
- (id)attributedTitleString;
- (id)delimiterColor;
- (id)distanceString;
- (id)hoursBuilderForSearchCell;
- (id)ratingsAttributedString;
- (id)secondaryLabelColor;
- (id)secondaryLabelFont;
- (id)shortenedAddressStringForMapItem:(id)a3;
- (id)titleFont;
- (id)titleHighlightFont;
- (id)titleRegularFont;
- (int64_t)accessoryViewType;
- (int64_t)containerAlignment;
- (unint64_t)indexOfVisibleLabelAboveContextualInformationStackView;
- (unint64_t)numberOfLines;
- (void)_clearModel;
- (void)_updateDebugLabel;
- (void)_updateSpacings;
- (void)accessibilitySetup;
- (void)addTransitLabel;
- (void)customInit;
- (void)didTapAccessoryViewButton:(id)a3;
- (void)didTapOnPlaceContextWithViewModel:(id)a3;
- (void)didUpdateMapItem;
- (void)didUpdatePublisherResult;
- (void)didUpdateRelatedSection;
- (void)layoutSubviews;
- (void)needsUpdate;
- (void)preferredContentSizeChanged:(id)a3;
- (void)prepareForActionMenuPresentation;
- (void)prepareForReuse;
- (void)removeTransitLabel;
- (void)setAccessoryViewDelegate:(id)a3;
- (void)setAccessoryViewObject:(id)a3;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDebugString:(id)a3;
- (void)setDisplayDistanceIfValidCurrentLocation:(BOOL)a3;
- (void)setDisplaysAsChainResult:(BOOL)a3;
- (void)setDisplaysDistanceAsSnippetLocationAboveThreshold:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setPlaceContextViewModel:(id)a3;
- (void)setPlaceContextViewModelDelegate:(id)a3;
- (void)setPrefersAddressOverCategory:(BOOL)a3;
- (void)setPublisherResult:(id)a3;
- (void)setRelatedSection:(id)a3;
- (void)setSearchCategory:(id)a3;
- (void)setupPlaceContextContent:(id)a3;
- (void)setupPlaceContextContent:(id)a3 inStackView:(id)a4;
- (void)updateContent;
- (void)updateFonts;
- (void)updateTheme;
@end

@implementation _SearchResultTableViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 prepareForReuse];
  [(_SearchResultTableViewCell *)self setAccessoryViewType:0];
  [(_SearchResultTableViewCell *)self setAccessoryViewObject:0];
  [(_SearchResultTableViewCell *)self setAccessoryViewDelegate:0];
}

+ (double)cellHeight
{
  if (+[UIFont accessibilityTextEnabled]) {
    return UITableViewAutomaticDimension;
  }
  objc_super v3 = +[UIFont system15];
  +[SearchResultTableViewCell estimatedCellHeight];
  [v3 _mapkit_scaledValueForValue:];
  double v5 = v4;

  return v5;
}

+ (double)cellHeightWithTraitCollection:(id)a3 numberOfLines:(unint64_t)a4 hasPlaceContext:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 userInterfaceIdiom] == (id)5)
  {
    if (a4)
    {
      v9 = sub_100A9243C();
      [v8 displayScale];
      +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v9, 1);
      double v11 = v10 + 9.0;

      if (a4 != 1)
      {
        v12 = sub_100A92448();
        [v8 displayScale];
        +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v12, 1);
        double v14 = v13;

        double v11 = v11 + v14 * (double)(a4 - 1);
      }
    }
    else
    {
      double v11 = 9.0;
    }
    double v16 = fmax(v11, 36.0);
    if (v5)
    {
      [v8 displayScale];
      [a1 placeContextHeightWithDisplayScale:];
      double v16 = v16 + v17;
    }
  }
  else
  {
    [a1 cellHeight];
    double v16 = v15;
  }

  return v16;
}

+ (double)estimatedCellHeight
{
  return 94.0;
}

+ (double)estimatedTwoLinesCellHeight
{
  return 72.0;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  double v4 = +[NSString stringWithFormat:@"%@%@", v3, @"Accessibility"];

  return v4;
}

+ (double)placeContextHeightWithDisplayScale:(double)a3
{
  double v4 = [a1 placeContextLabelFont];
  +[UILabel _maps_maximumHeightWithFont:v4 numberOfLines:1 displayScale:a3];
  double v6 = v5;

  return v6;
}

+ (id)placeContextLabelFont
{
  return +[UIFont system15];
}

+ (id)_delimiterString
{
  if (qword_1016101E0 != -1) {
    dispatch_once(&qword_1016101E0, &stru_101312238);
  }
  v2 = (void *)qword_1016101D8;

  return v2;
}

- (_SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SearchResultTableViewCell;
  double v4 = [(MapsThemeTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    v4->_displaysDistanceAsSnippetLocationAboveThreshold = 1;
    [(_SearchResultTableViewCell *)v4 customInit];
  }
  return v5;
}

- (void)customInit
{
  self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled];
  objc_super v3 = +[UIColor clearColor];
  [(_SearchResultTableViewCell *)self setBackgroundColor:v3];

  [(_SearchResultTableViewCell *)self setClipsToBounds:1];
  self->_displayDistanceIfValidCurrentLocation = 1;
  double v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  double v6 = +[UIColor clearColor];
  [(UILabel *)self->_titleLabel setBackgroundColor:v6];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  objc_super v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  secondLabel = self->_secondLabel;
  self->_secondLabel = v7;

  v9 = +[UIColor clearColor];
  [(UILabel *)self->_secondLabel setBackgroundColor:v9];

  LODWORD(v10) = 1144717312;
  [(UILabel *)self->_secondLabel setContentCompressionResistancePriority:0 forAxis:v10];
  [(UILabel *)self->_secondLabel setAccessibilityIdentifier:@"SecondLabel"];
  double v11 = self->_secondLabel;
  if (!self->_accessibilityEnabled)
  {
    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondPartLabel = self->_secondPartLabel;
    self->_secondPartLabel = v12;

    [(UILabel *)self->_secondPartLabel setAccessibilityIdentifier:@"SecondPartLabel"];
    double v14 = +[UIColor clearColor];
    [(UILabel *)self->_secondPartLabel setBackgroundColor:v14];

    LODWORD(v15) = 1144750080;
    [(UILabel *)self->_secondPartLabel setContentCompressionResistancePriority:0 forAxis:v15];
    double v16 = [(_SearchResultTableViewCell *)self _delimiterLabel];
    double v17 = v11;
    secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
    self->_secondPartDelimiterLabel = v16;

    LODWORD(v19) = 1144733696;
    [(UILabel *)self->_secondPartDelimiterLabel setContentCompressionResistancePriority:0 forAxis:v19];
    id v20 = objc_alloc((Class)NUIContainerStackView);
    v21 = self->_secondPartDelimiterLabel;
    v77[0] = self->_secondLabel;
    v77[1] = v21;
    v77[2] = self->_secondPartLabel;
    v22 = +[NSArray arrayWithObjects:v77 count:3];
    v23 = (NUIContainerStackView *)[v20 initWithArrangedSubviews:v22];
    secondLabelStackView = self->_secondLabelStackView;
    self->_secondLabelStackView = v23;

    [(NUIContainerStackView *)self->_secondLabelStackView setAxis:0];
    [(NUIContainerStackView *)self->_secondLabelStackView setDistribution:2];
    double v11 = self->_secondLabelStackView;
  }
  v25 = (UILabel *)objc_alloc_init((Class)UILabel);
  thirdLabel = self->_thirdLabel;
  self->_thirdLabel = v25;

  v27 = +[UIColor clearColor];
  [(UILabel *)self->_thirdLabel setBackgroundColor:v27];

  [(UILabel *)self->_thirdLabel setAccessibilityIdentifier:@"ThirdLabel"];
  v28 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  contextualInformationImageView = self->_contextualInformationImageView;
  self->_contextualInformationImageView = v28;

  if (sub_1000BBB44(self) == 5) {
    double v30 = 12.0;
  }
  else {
    double v30 = 20.0;
  }
  -[UIImageView setMinimumLayoutSize:](self->_contextualInformationImageView, "setMinimumLayoutSize:", v30, v30);
  -[UIImageView setMaximumLayoutSize:](self->_contextualInformationImageView, "setMaximumLayoutSize:", v30, v30);
  [(UIImageView *)self->_contextualInformationImageView setContentMode:1];
  v31 = +[UIColor clearColor];
  [(UIImageView *)self->_contextualInformationImageView setBackgroundColor:v31];

  [(UIImageView *)self->_contextualInformationImageView setClipsToBounds:1];
  LODWORD(v32) = 1148846080;
  [(UIImageView *)self->_contextualInformationImageView setContentCompressionResistancePriority:0 forAxis:v32];
  LODWORD(v33) = 1144750080;
  [(UIImageView *)self->_contextualInformationImageView setContentHuggingPriority:0 forAxis:v33];
  v34 = (UILabel *)objc_alloc_init((Class)UILabel);
  contextualInformationLabel = self->_contextualInformationLabel;
  self->_contextualInformationLabel = v34;

  [(UILabel *)self->_contextualInformationLabel setAccessibilityIdentifier:@"ContextualInformationLabel"];
  v36 = +[UIColor clearColor];
  [(UILabel *)self->_contextualInformationLabel setBackgroundColor:v36];

  v37 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_contextualInformationLabel setTextColor:v37];

  id v38 = objc_alloc((Class)NUIContainerStackView);
  v39 = self->_contextualInformationLabel;
  v76[0] = self->_contextualInformationImageView;
  v76[1] = v39;
  v40 = +[NSArray arrayWithObjects:v76 count:2];
  v41 = (NUIContainerStackView *)[v38 initWithArrangedSubviews:v40];
  contextualInformationStackView = self->_contextualInformationStackView;
  self->_contextualInformationStackView = v41;

  [(NUIContainerStackView *)self->_contextualInformationStackView setDelegate:self];
  [(NUIContainerStackView *)self->_contextualInformationStackView setAxis:0];
  [(NUIContainerStackView *)self->_contextualInformationStackView setAlignment:3];
  uint64_t v43 = sub_1000BBB44(self);
  double v44 = 10.0;
  if (v43 == 5) {
    double v44 = 5.0;
  }
  -[NUIContainerStackView _setTouchInsets:](self->_contextualInformationStackView, "_setTouchInsets:", -v44, -v44, -v44, -v44);
  [(NUIContainerStackView *)self->_contextualInformationStackView setSpacing:4.0];
  id v72 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"didTapOnPlaceContextWithViewModel:"];
  -[NUIContainerStackView addGestureRecognizer:](self->_contextualInformationStackView, "addGestureRecognizer:");
  id v45 = objc_alloc((Class)NUIContainerStackView);
  v75[0] = self->_titleLabel;
  v75[1] = v11;
  v75[2] = self->_thirdLabel;
  v46 = +[NSArray arrayWithObjects:v75 count:3];
  v47 = (NUIContainerStackView *)[v45 initWithArrangedSubviews:v46];
  labelStackView = self->_labelStackView;
  self->_labelStackView = v47;

  [(NUIContainerStackView *)self->_labelStackView setDelegate:self];
  [(NUIContainerStackView *)self->_labelStackView setAxis:1];
  [(NUIContainerStackView *)self->_labelStackView setAlignment:1];
  LODWORD(v49) = 1112014848;
  [(NUIContainerStackView *)self->_labelStackView setContentHuggingPriority:0 forAxis:v49];
  LODWORD(v50) = 1112014848;
  [(NUIContainerStackView *)self->_labelStackView setContentCompressionResistancePriority:0 forAxis:v50];
  id v51 = objc_alloc((Class)NUIContainerStackView);
  v74 = self->_labelStackView;
  v52 = +[NSArray arrayWithObjects:&v74 count:1];
  v53 = (NUIContainerStackView *)[v51 initWithArrangedSubviews:v52];
  containerStackView = self->_containerStackView;
  self->_containerStackView = v53;

  [(NUIContainerStackView *)self->_containerStackView setDelegate:self];
  [(NUIContainerStackView *)self->_containerStackView setAlignment:[(_SearchResultTableViewCell *)self containerAlignment]];
  [(_SearchResultTableViewCell *)self updateImageViewAlignmentAndSpacingIfNeeded];
  [(NUIContainerStackView *)self->_containerStackView setLayoutMarginsRelativeArrangement:1];
  uint64_t v55 = sub_1000BBB44(self);
  [(_SearchResultTableViewCell *)self leadingMargin];
  double v57 = v56;
  [(_SearchResultTableViewCell *)self trailingMargin];
  double v59 = v58;
  double v60 = -1.0;
  if (v55 == 5) {
    double v60 = 4.5;
  }
  double v61 = 1.0;
  if (v55 == 5) {
    double v61 = 4.5;
  }
  -[NUIContainerStackView setLayoutMargins:](self->_containerStackView, "setLayoutMargins:", v60, v57, v61, v59);
  [(NUIContainerStackView *)self->_containerStackView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
  id v62 = objc_alloc((Class)NUIContainerStackView);
  v73 = self->_containerStackView;
  v63 = +[NSArray arrayWithObjects:&v73 count:1];
  v64 = (NUIContainerStackView *)[v62 initWithArrangedSubviews:v63];
  rootStackView = self->_rootStackView;
  self->_rootStackView = v64;

  [(NUIContainerStackView *)self->_rootStackView setDelegate:self];
  [(NUIContainerStackView *)self->_rootStackView setAxis:1];
  [(_SearchResultTableViewCell *)self _updateDebugLabel];
  [(_SearchResultTableViewCell *)self updateFonts];
  [(_SearchResultTableViewCell *)self _updateSpacings];
  if (self->_accessibilityEnabled) {
    [(_SearchResultTableViewCell *)self accessibilitySetup];
  }
  v66 = [(_SearchResultTableViewCell *)self contentView];
  [v66 addSubview:self->_rootStackView];

  v67 = +[NSNotificationCenter defaultCenter];
  [v67 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v68 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v68];

  v69 = [(_SearchResultTableViewCell *)self secondaryLabelColor];
  [(UILabel *)self->_secondLabel setTextColor:v69];

  v70 = [(_SearchResultTableViewCell *)self secondaryLabelColor];
  [(UILabel *)self->_secondPartLabel setTextColor:v70];

  v71 = [(_SearchResultTableViewCell *)self secondaryLabelColor];
  [(UILabel *)self->_thirdLabel setTextColor:v71];
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(self) == 5;
}

- (void)preferredContentSizeChanged:(id)a3
{
  [(_SearchResultTableViewCell *)self updateFonts];
  [(_SearchResultTableViewCell *)self _updateSpacings];
  id v4 = [(_SearchResultTableViewCell *)self contentView];
  [v4 setNeedsLayout];
}

- (void)accessibilitySetup
{
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_secondLabel setNumberOfLines:0];
  [(UILabel *)self->_thirdLabel setNumberOfLines:0];
  [(_SearchResultTableViewCell *)self leadingMargin];
  double v4 = v3;
  [(_SearchResultTableViewCell *)self trailingMargin];
  containerStackView = self->_containerStackView;

  -[NUIContainerStackView setLayoutMargins:](containerStackView, "setLayoutMargins:", 15.0, v4, 15.0, v5);
}

- (void)_updateSpacings
{
  if (sub_1000BBB44(self) == 5)
  {
    [(_SearchResultTableViewCell *)self horizontalSpacing];
    containerStackView = self->_containerStackView;
    -[NUIContainerStackView setSpacing:](containerStackView, "setSpacing:");
  }
  else
  {
    double v4 = [(_SearchResultTableViewCell *)self titleRegularFont];
    [(_SearchResultTableViewCell *)self horizontalSpacing];
    [v4 _mapkit_scaledValueForValue:];
    -[NUIContainerStackView setSpacing:](self->_containerStackView, "setSpacing:");

    [(_SearchResultTableViewCell *)self labelStackViewSpacing];
    -[NUIContainerStackView setSpacing:](self->_labelStackView, "setSpacing:");
    unint64_t v5 = [(_SearchResultTableViewCell *)self indexOfVisibleLabelAboveContextualInformationStackView];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      labelStackView = self->_labelStackView;
      id v9 = [(NUIContainerStackView *)labelStackView arrangedSubviews];
      id v8 = [v9 objectAtIndex:v6];
      [(NUIContainerStackView *)labelStackView setCustomSpacing:v8 afterView:7.0];
    }
  }
}

- (unint64_t)indexOfVisibleLabelAboveContextualInformationStackView
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  double v3 = [(NUIContainerStackView *)self->_labelStackView arrangedSubviews];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10097E620;
  v6[3] = &unk_101312260;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  [v3 enumerateObjectsUsingBlock:v6];

  if (*((unsigned char *)v8 + 24)) {
    unint64_t v4 = v12[3];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (double)paddingAboveContextualInformationStackView
{
  return 8.0;
}

- (id)distanceString
{
  if ([(_SearchResultTableViewCell *)self displayDistanceIfValidCurrentLocation])
  {
    double v3 = [(_SearchResultTableViewCell *)self currentLocation];
    unint64_t v4 = [(_SearchResultTableViewCell *)self mapItem];
    unint64_t v5 = +[NSString distanceStringFromLocation:v3 toMapItem:v4 showsDistance:&self->_showDistance];

    if (!self->_showDistance)
    {
      if ([(_SearchResultTableViewCell *)self displaysAsChainResult])
      {
        id v6 = 0;
        goto LABEL_4;
      }
      if ([(_SearchResultTableViewCell *)self displaysDistanceAsSnippetLocationAboveThreshold])
      {
        id v8 = [(_SearchResultTableViewCell *)self mapItem];
        uint64_t v9 = [v8 _geoMapItem];
        uint64_t v10 = [v9 _resultSnippetLocationString];

        unint64_t v5 = (void *)v10;
      }
    }
    id v6 = v5;
    unint64_t v5 = v6;
LABEL_4:

    goto LABEL_6;
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (void)addTransitLabel
{
  transitInfoLabel = self->_transitInfoLabel;
  if (!transitInfoLabel)
  {
    unint64_t v4 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
    unint64_t v5 = self->_transitInfoLabel;
    self->_transitInfoLabel = v4;

    id v6 = +[UIColor clearColor];
    [(MKTransitInfoLabelView *)self->_transitInfoLabel setBackgroundColor:v6];

    transitInfoLabel = self->_transitInfoLabel;
  }
  if ([(NUIContainerStackView *)self->_labelStackView indexOfArrangedSubview:transitInfoLabel] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    labelStackView = self->_labelStackView;
    id v8 = self->_transitInfoLabel;
    [(NUIContainerStackView *)labelStackView addArrangedSubview:v8];
  }
}

- (void)removeTransitLabel
{
  [(NUIContainerStackView *)self->_labelStackView removeArrangedSubview:self->_transitInfoLabel];
  transitInfoLabel = self->_transitInfoLabel;

  [(MKTransitInfoLabelView *)transitInfoLabel removeFromSuperview];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 layoutSubviews];
  double v3 = [(_SearchResultTableViewCell *)self contentView];
  [v3 bounds];
  -[NUIContainerStackView setFrame:](self->_rootStackView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (self->_accessibilityEnabled)
  {
    rootStackView = self->_rootStackView;
    -[NUIContainerStackView sizeThatFits:](rootStackView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    uint64_t v7 = +[UIFont system15];
    [(id)objc_opt_class() estimatedCellHeight];
    [v7 _mapkit_scaledValueForValue];
    double v9 = v8;

    double v5 = width;
    double v6 = v9;
  }
  result.height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(_SearchResultTableViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v19.receiver = self;
  v19.super_class = (Class)_SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v19 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;
  double v16 = [(_SearchResultTableViewCell *)self contentView];
  [v16 setFrame:v5, v7, v9, v11];

  double v17 = v13;
  double v18 = v15;
  result.height = v18;
  result.CGFloat width = v17;
  return result;
}

- (void)setMapItem:(id)a3
{
  double v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(_SearchResultTableViewCell *)self didUpdateMapItem];
    double v5 = v6;
  }
}

- (void)setRelatedSection:(id)a3
{
  double v5 = (GEORelatedEntitySection *)a3;
  if (self->_relatedSection != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_relatedSection, a3);
    [(_SearchResultTableViewCell *)self didUpdateRelatedSection];
    double v5 = v6;
  }
}

- (void)setPublisherResult:(id)a3
{
  double v5 = (GEOPublisherResult *)a3;
  if (self->_publisherResult != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_publisherResult, a3);
    double v5 = v6;
    if (v6)
    {
      [(_SearchResultTableViewCell *)self didUpdatePublisherResult];
      double v5 = v6;
    }
  }
}

- (void)setDebugString:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_debugString != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_debugString, a3);
    [(_SearchResultTableViewCell *)self _updateDebugLabel];
    double v5 = v6;
  }
}

- (void)needsUpdate
{
  double v3 = [(_SearchResultTableViewCell *)self window];

  if (v3)
  {
    [(_SearchResultTableViewCell *)self updateContent];
    id v4 = [(_SearchResultTableViewCell *)self contentView];
    [v4 setNeedsLayout];
  }
}

- (void)_clearModel
{
  mapItem = self->_mapItem;
  self->_mapItem = 0;

  publisherResult = self->_publisherResult;
  self->_publisherResult = 0;
}

- (id)_delimiterLabel
{
  id v3 = objc_alloc_init((Class)UILabel);
  [v3 setAccessibilityIdentifier:@"DelimiterLabel"];
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  double v5 = [(id)objc_opt_class() _delimiterString];
  [v3 setText:v5];

  double v6 = +[UIColor secondaryLabelColor];
  [v3 setTextColor:v6];

  double v7 = [(_SearchResultTableViewCell *)self secondaryLabelFont];
  [v3 setFont:v7];

  [v3 setTextAlignment:0];

  return v3;
}

- (void)updateContent
{
  id v3 = [(_SearchResultTableViewCell *)self mapItem];
  if (v3)
  {
  }
  else
  {
    id v4 = [(_SearchResultTableViewCell *)self publisherResult];

    if (!v4) {
      return;
    }
  }
  self->_showDistance = 0;
  self->_onlyDistanceOrEmpty = 1;
  double v5 = [(_SearchResultTableViewCell *)self attributedTitleString];
  [(UILabel *)self->_titleLabel setAttributedText:v5];

  double v6 = [(_SearchResultTableViewCell *)self attributedFirstPartDetailString];
  double v7 = [(_SearchResultTableViewCell *)self attributedSecondPartDetailString];
  double v8 = [(_SearchResultTableViewCell *)self delimiterColor];
  [(UILabel *)self->_secondPartDelimiterLabel setTextColor:v8];

  BOOL accessibilityEnabled = self->_accessibilityEnabled;
  id v10 = [v6 length];
  if (accessibilityEnabled)
  {
    if (v10)
    {
      if ([v7 length])
      {
        v49[0] = v6;
        id v11 = objc_alloc((Class)NSAttributedString);
        v47 = [(id)objc_opt_class() _delimiterString];
        id v12 = [v11 initWithString:v47];
        v49[1] = v12;
        v49[2] = v7;
        double v13 = +[NSArray arrayWithObjects:v49 count:3];
        [(_SearchResultTableViewCell *)self _concatenateAttributedStrings:v13];
        v15 = double v14 = v7;
        [(UILabel *)self->_secondLabel setAttributedText:v15];

        double v7 = v14;
        goto LABEL_15;
      }
      secondLabel = self->_secondLabel;
      double v18 = v6;
    }
    else
    {
      secondLabel = self->_secondLabel;
      double v18 = v7;
    }
    [(UILabel *)secondLabel setAttributedText:v18];
  }
  else
  {
    if (v10) {
      BOOL v16 = [v7 length] == 0;
    }
    else {
      BOOL v16 = 1;
    }
    [(UILabel *)self->_secondPartDelimiterLabel setHidden:v16];
    [(UILabel *)self->_secondLabel setAttributedText:v6];
    [(UILabel *)self->_secondPartLabel setAttributedText:v7];
  }
LABEL_15:
  objc_super v19 = [(_SearchResultTableViewCell *)self mapItem];
  unsigned int v20 = [v19 _hasTransitLabels];

  if (v20)
  {
    [(_SearchResultTableViewCell *)self addTransitLabel];
    v21 = [(_SearchResultTableViewCell *)self mapItem];
    v22 = [v21 _preloadedTransitInfo];

    v23 = [(_SearchResultTableViewCell *)self mapItem];
    if (v22)
    {
      v24 = [v23 _preloadedTransitInfo];
      v25 = +[MKTransitInfoPreloader attributedTextFromPreload:v24 view:self->_transitInfoLabel];
      [(MKTransitInfoLabelView *)self->_transitInfoLabel setAttributedText:v25];
    }
    else
    {
      [(MKTransitInfoLabelView *)self->_transitInfoLabel setMapItem:v23];
    }

    goto LABEL_31;
  }
  [(_SearchResultTableViewCell *)self removeTransitLabel];
  if ([(_SearchResultTableViewCell *)self displaysAsChainResult])
  {
LABEL_31:
    [(UILabel *)self->_thirdLabel setHidden:1];
    goto LABEL_32;
  }
  unsigned int v26 = [(_SearchResultTableViewCell *)self shouldShowFallbackToAddressAndDistance];
  v27 = [(_SearchResultTableViewCell *)self attributedSubtitleString];
  [(UILabel *)self->_thirdLabel setAttributedText:v27];

  [(UILabel *)self->_thirdLabel setHidden:0];
  if (v26)
  {
    v48 = v7;
    v28 = [(_SearchResultTableViewCell *)self distanceString];
    v29 = [(_SearchResultTableViewCell *)self mapItem];
    double v30 = [v29 _addressFormattedAsCity];

    if (!v30
      || ([(UILabel *)self->_titleLabel text],
          v31 = objc_claimAutoreleasedReturnValue(),
          unsigned int v32 = [v31 isEqualToString:v30],
          v31,
          v32))
    {
      double v33 = [(_SearchResultTableViewCell *)self mapItem];
      uint64_t v34 = [v33 _addressFormattedAsSinglelineAddress];

      double v30 = (void *)v34;
    }
    v35 = +[NSMutableArray arrayWithCapacity:2];
    if ([v30 length]) {
      [v35 addObject:v30];
    }
    if ([v28 length]) {
      [v35 addObject:v28];
    }
    if ((unint64_t)[v35 count] > 1)
    {
      v36 = [(id)objc_opt_class() _delimiterString];
      [(UILabel *)self->_thirdLabel setText:&stru_101324E70];
      [(UILabel *)self->_thirdLabel setHidden:1];
      if (self->_accessibilityEnabled)
      {
        v40 = [v35 objectAtIndexedSubscript:0];
        v41 = [v35 objectAtIndexedSubscript:1];
        v42 = +[NSString stringWithFormat:@"%@%@%@", v40, v36, v41];
        [(UILabel *)self->_secondLabel setText:v42];

LABEL_38:
        double v7 = v48;
        goto LABEL_32;
      }
      uint64_t v43 = [v35 objectAtIndexedSubscript:0];
      [(UILabel *)self->_secondLabel setText:v43];

      double v44 = [v35 objectAtIndexedSubscript:1];
      [(UILabel *)self->_secondPartLabel setText:v44];

      id v45 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_secondLabel setTextColor:v45];

      v46 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_secondPartLabel setTextColor:v46];

      secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
      uint64_t v38 = 0;
    }
    else
    {
      v36 = [v35 firstObject];
      [(UILabel *)self->_thirdLabel setText:v36];
      [(UILabel *)self->_thirdLabel setHidden:0];
      [(UILabel *)self->_secondLabel setText:&stru_101324E70];
      [(UILabel *)self->_secondPartLabel setText:&stru_101324E70];
      secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
      uint64_t v38 = 1;
    }
    [(UILabel *)secondPartDelimiterLabel setHidden:v38];
    goto LABEL_38;
  }
LABEL_32:
  [(NUIContainerStackView *)self->_containerStackView setAlignment:[(_SearchResultTableViewCell *)self containerAlignment]];
  [(_SearchResultTableViewCell *)self updateImageViewAlignmentAndSpacingIfNeeded];
  v39 = [(_SearchResultTableViewCell *)self placeContextViewModel];
  [(_SearchResultTableViewCell *)self setupPlaceContextContent:v39];
}

- (void)setupPlaceContextContent:(id)a3
{
  id v8 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    [(_SearchResultTableViewCell *)self setupPlaceContextContent:v8 inStackView:self->_labelStackView];
  }
  else
  {
    [(_SearchResultTableViewCell *)self setupPlaceContextContent:v8 inStackView:self->_rootStackView];

    [(_SearchResultTableViewCell *)self leadingMargin];
    double v5 = -v4;
    [(_SearchResultTableViewCell *)self trailingMargin];
    contextualInformationStackView = self->_contextualInformationStackView;
    -[NUIContainerStackView setCustomAlignmentRectInsets:](contextualInformationStackView, "setCustomAlignmentRectInsets:", 0.0, v5, -14.3299999, -v6);
  }
}

- (void)setupPlaceContextContent:(id)a3 inStackView:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (v23)
  {
    double v7 = [(_SearchResultTableViewCell *)self placeContextViewModel];
    id v8 = [v7 image];

    contextualInformationStackView = self->_contextualInformationStackView;
    contextualInformationImageView = self->_contextualInformationImageView;
    if (v8)
    {
      [(NUIContainerStackView *)contextualInformationStackView insertArrangedSubview:contextualInformationImageView atIndex:0];
    }
    else
    {
      [(NUIContainerStackView *)contextualInformationStackView removeArrangedSubview:contextualInformationImageView];
      [(UIImageView *)self->_contextualInformationImageView removeFromSuperview];
    }
    [v6 addArrangedSubview:self->_contextualInformationStackView];
    id v11 = [(_SearchResultTableViewCell *)self placeContextViewModel];
    -[NUIContainerStackView setUserInteractionEnabled:](self->_contextualInformationStackView, "setUserInteractionEnabled:", [v11 isTappable]);

    id v12 = [(_SearchResultTableViewCell *)self placeContextViewModel];
    double v13 = [v12 image];
    [(UIImageView *)self->_contextualInformationImageView setImage:v13];

    double v14 = [(_SearchResultTableViewCell *)self placeContextViewModel];
    double v15 = [v14 imageTintColor];
    [(UIImageView *)self->_contextualInformationImageView setTintColor:v15];

    BOOL v16 = [(_SearchResultTableViewCell *)self placeContextViewModel];
    [v16 imageContinuousCornerRadius];
    -[UIImageView _setContinuousCornerRadius:](self->_contextualInformationImageView, "_setContinuousCornerRadius:");

    if (sub_1000BBB44(self) == 5 && [(_SearchResultTableViewCell *)self isSelected])
    {
      double v17 = [(_SearchResultTableViewCell *)self placeContextViewModel];
      double v18 = [v17 highlightedAttributedString];
      [(UILabel *)self->_contextualInformationLabel setAttributedText:v18];

      objc_super v19 = +[UIColor whiteColor];
      [(UIImageView *)self->_contextualInformationImageView setTintColor:v19];
    }
    else
    {
      unsigned int v20 = [(_SearchResultTableViewCell *)self placeContextViewModel];
      v21 = [v20 attributedString];
      [(UILabel *)self->_contextualInformationLabel setAttributedText:v21];

      objc_super v19 = [(_SearchResultTableViewCell *)self placeContextViewModel];
      v22 = [v19 imageTintColor];
      [(UIImageView *)self->_contextualInformationImageView setTintColor:v22];
    }
  }
  else
  {
    [v6 removeArrangedSubview:self->_contextualInformationStackView];
    [(NUIContainerStackView *)self->_contextualInformationStackView removeFromSuperview];
  }
}

- (BOOL)shouldShowFallbackToAddressAndDistance
{
  id v3 = [(_SearchResultTableViewCell *)self mapItem];
  unsigned __int8 v4 = [v3 _hasPriceRange];

  double v5 = [(_SearchResultTableViewCell *)self mapItem];
  unsigned int v6 = [v5 _sampleSizeForUserRatingScore];

  if (self->_onlyDistanceOrEmpty) {
    return (v6 == 0) & ~v4;
  }
  else {
    return 0;
  }
}

- (id)_concatenateAttributedStrings:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (void)v12)) {
          [v4 appendAttributedString:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updateFonts
{
  id v3 = [(_SearchResultTableViewCell *)self titleFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  id v5 = [(_SearchResultTableViewCell *)self secondaryLabelFont];
  [(UILabel *)self->_secondLabel setFont:v5];
  [(UILabel *)self->_secondPartLabel setFont:v5];
  [(UILabel *)self->_secondPartDelimiterLabel setFont:v5];
  [(UILabel *)self->_transitDelimiterLabel setFont:v5];
  [(UILabel *)self->_thirdLabel setFont:v5];
  unsigned __int8 v4 = [(id)objc_opt_class() placeContextLabelFont];
  [(UILabel *)self->_contextualInformationLabel setFont:v4];
}

- (void)updateTheme
{
  v4.receiver = self;
  v4.super_class = (Class)_SearchResultTableViewCell;
  [(MapsThemeTableViewCell *)&v4 updateTheme];
  [(_SearchResultTableViewCell *)self updateContent];
  id v3 = [(_SearchResultTableViewCell *)self contentView];
  [v3 setNeedsLayout];
}

- (void)_updateDebugLabel
{
  debugString = self->_debugString;
  debugLabel = self->_debugLabel;
  if (debugString)
  {
    if (!debugLabel)
    {
      id v5 = (UILabel *)objc_alloc_init((Class)UILabel);
      id v6 = self->_debugLabel;
      self->_debugLabel = v5;

      [(UILabel *)self->_debugLabel setAccessibilityIdentifier:@"SearchCellDebug"];
      [(UILabel *)self->_debugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      id v7 = +[UIFont system11];
      [(UILabel *)self->_debugLabel setFont:v7];

      uint64_t v8 = +[UIColor redColor];
      [(UILabel *)self->_debugLabel setTextColor:v8];

      [(UILabel *)self->_debugLabel setAlpha:0.5];
      double v9 = +[UIColor clearColor];
      [(UILabel *)self->_debugLabel setBackgroundColor:v9];

      id v10 = [(_SearchResultTableViewCell *)self contentView];
      [v10 addSubview:self->_debugLabel];

      id v11 = [(UILabel *)self->_debugLabel leadingAnchor];
      long long v12 = [(_SearchResultTableViewCell *)self contentView];
      long long v13 = [v12 leadingAnchor];
      long long v14 = [v11 constraintEqualToAnchor:v13 constant:10.0];
      [v14 setActive:1];

      long long v15 = [(UILabel *)self->_debugLabel bottomAnchor];
      BOOL v16 = [(_SearchResultTableViewCell *)self contentView];
      double v17 = [v16 bottomAnchor];
      double v18 = [v15 constraintEqualToAnchor:v17 constant:-2.0];
      [v18 setActive:1];

      debugString = self->_debugString;
      debugLabel = self->_debugLabel;
    }
    [(UILabel *)debugLabel setText:debugString];
  }
  else if (debugLabel)
  {
    [(UILabel *)debugLabel removeFromSuperview];
    objc_super v19 = self->_debugLabel;
    self->_debugLabel = 0;
  }
}

- (id)titleFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  v2 = +[UIFont system20AdaptiveSemibold];
  }

  return v2;
}

- (id)titleHighlightFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  v2 = +[UIFont system20AdaptiveSemibold];
  }

  return v2;
}

- (id)titleRegularFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  v2 = +[UIFont system20Adaptive];
  }

  return v2;
}

- (id)secondaryLabelFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A92448();
  }
  else {
  v2 = +[UIFont system15];
  }

  return v2;
}

- (id)secondaryLabelColor
{
  if (sub_1000BBB44(self) == 5 || [(_SearchResultTableViewCell *)self displaysAsChainResult])
  {
    id v3 = +[UIColor secondaryLabelColor];
  }
  else
  {
    id v3 = +[UIColor labelColor];
  }

  return v3;
}

- (double)leadingMargin
{
  return 16.0;
}

- (unint64_t)numberOfLines
{
  id v3 = [(UILabel *)self->_titleLabel text];
  id v4 = [v3 length];

  id v5 = [(UILabel *)self->_secondLabel text];
  id v6 = [v5 length];

  uint64_t v7 = 1;
  if (v4) {
    uint64_t v7 = 2;
  }
  if (v6) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v4 != 0;
  }
  double v9 = [(UILabel *)self->_thirdLabel text];
  if ([v9 length])
  {

    return ++v8;
  }
  id v10 = [(MKTransitInfoLabelView *)self->_transitInfoLabel text];
  id v11 = [v10 length];

  if (v11) {
    return ++v8;
  }
  return v8;
}

- (int64_t)containerAlignment
{
  if (sub_1000BBB44(self) == 5) {
    return 1;
  }
  else {
    return 3;
  }
}

- (double)horizontalSpacing
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 10.0;
  if (v2 == 5) {
    return 8.0;
  }
  return result;
}

- (double)trailingMargin
{
  return 10.0;
}

- (void)didUpdateMapItem
{
  id v3 = [(_SearchResultTableViewCell *)self window];

  if (v3)
  {
    [(_SearchResultTableViewCell *)self updateContent];
    [(_SearchResultTableViewCell *)self _updateSpacings];
  }
}

- (void)didUpdatePublisherResult
{
  id v3 = [(_SearchResultTableViewCell *)self window];

  if (v3)
  {
    [(_SearchResultTableViewCell *)self updateContent];
  }
}

- (void)didUpdateRelatedSection
{
  id v3 = [(_SearchResultTableViewCell *)self window];

  if (v3)
  {
    [(_SearchResultTableViewCell *)self updateContent];
  }
}

- (id)attributedTitleString
{
  id v3 = [(_SearchResultTableViewCell *)self mapItem];

  if (v3)
  {
    if ([(_SearchResultTableViewCell *)self displaysAsChainResult])
    {
      id v4 = [(_SearchResultTableViewCell *)self mapItem];
      id v5 = [v4 _addressFormattedAsName];
    }
    else
    {
      id v4 = [(_SearchResultTableViewCell *)self relatedSection];
      id v6 = [v4 name];
      uint64_t v7 = v6;
      if (v6)
      {
        id v5 = v6;
      }
      else
      {
        unint64_t v8 = [(_SearchResultTableViewCell *)self mapItem];
        id v5 = [v8 name];
      }
    }

    id v9 = objc_alloc((Class)NSAttributedString);
    if (v5) {
      CFStringRef v10 = v5;
    }
    else {
      CFStringRef v10 = &stru_101324E70;
    }
    id v3 = [v9 initWithString:v10];
  }

  return v3;
}

- (id)attributedSubtitleString
{
  id v3 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
  id v4 = [v3 localizedOperatingHours];

  id v5 = objc_alloc((Class)NSMutableAttributedString);
  if (v4) {
    CFStringRef v6 = v4;
  }
  else {
    CFStringRef v6 = &stru_101324E70;
  }
  v26[0] = NSForegroundColorAttributeName;
  uint64_t v7 = +[UIColor secondaryLabelColor];
  v27[0] = v7;
  v26[1] = NSFontAttributeName;
  unint64_t v8 = +[UIFont system15];
  v27[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v10 = [v5 initWithString:v6 attributes:v9];

  id v11 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
  long long v12 = [v11 localizedOpenState];

  id v13 = [(__CFString *)v4 rangeOfString:v12];
  if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = v13;
    uint64_t v16 = v14;
    double v17 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
    double v18 = +[UIColor secondaryLabelColor];
    [v17 updateHoursLabelColorWithDefaultLabelColor:v18];

    objc_super v19 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
    unsigned int v20 = [v19 hoursStateLabelColor];

    NSAttributedStringKey v24 = NSForegroundColorAttributeName;
    v25 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v10 addAttributes:v21 range:v15, v16];
  }
  id v22 = [v10 copy];

  return v22;
}

- (id)ratingsAttributedString
{
  id v3 = [(_SearchResultTableViewCell *)self theme];
  id v4 = +[MKInfoCardThemeManager themeWithThemeType:](MKInfoCardThemeManager, "themeWithThemeType:", [v3 infoCardThemeType]);

  mapItem = self->_mapItem;
  CFStringRef v6 = +[UIColor secondaryLabelColor];
  uint64_t v7 = +[UIFont system15];
  unint64_t v8 = +[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:mapItem textColor:v6 font:v7 theme:v4];

  return v8;
}

- (id)attributedFirstPartDetailString
{
  if ([(_SearchResultTableViewCell *)self displaysAsChainResult])
  {
    id v3 = [(_SearchResultTableViewCell *)self secondaryLabelColor];
    id v4 = objc_alloc((Class)NSMutableAttributedString);
    id v5 = [(_SearchResultTableViewCell *)self mapItem];
    uint64_t v6 = [v5 _addressFormattedAsCity];
    uint64_t v7 = (void *)v6;
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    else {
      CFStringRef v8 = &stru_101324E70;
    }
    v31[0] = NSForegroundColorAttributeName;
    v31[1] = NSFontAttributeName;
    v32[0] = v3;
    id v9 = +[UIFont system15];
    v32[1] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    id v11 = [v4 initWithString:v8 attributes:v10];

    id v12 = objc_alloc((Class)NSAttributedString);
    id v13 = [(id)objc_opt_class() _delimiterString];
    NSAttributedStringKey v29 = NSForegroundColorAttributeName;
    double v30 = v3;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v15 = [v12 initWithString:v13 attributes:v14];

    uint64_t v16 = [(_SearchResultTableViewCell *)self ratingsAttributedString];
    v28[0] = v16;
    v28[1] = v15;
    v28[2] = v11;
    double v17 = +[NSArray arrayWithObjects:v28 count:3];
    id v18 = [(_SearchResultTableViewCell *)self _concatenateAttributedStrings:v17];
  }
  else
  {
    objc_super v19 = [(_SearchResultTableViewCell *)self mapItem];
    id v3 = [v19 _firstLocalizedCategoryName];

    if ([(_SearchResultTableViewCell *)self prefersAddressOverCategory])
    {
      unsigned int v20 = [(_SearchResultTableViewCell *)self mapItem];
      v21 = [(_SearchResultTableViewCell *)self shortenedAddressStringForMapItem:v20];

      if ([v21 length])
      {
        id v22 = v21;

        id v3 = v22;
      }
    }
    if ([(__CFString *)v3 length]) {
      self->_onlyDistanceOrEmpty = 0;
    }
    id v23 = objc_alloc((Class)NSMutableAttributedString);
    if (v3) {
      CFStringRef v24 = v3;
    }
    else {
      CFStringRef v24 = &stru_101324E70;
    }
    id v11 = +[UIColor secondaryLabelColor];
    v27[0] = v11;
    v26[1] = NSFontAttributeName;
    id v15 = +[UIFont system15];
    v27[1] = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    id v18 = [v23 initWithString:v24 attributes:v16];
  }

  return v18;
}

- (id)shortenedAddressStringForMapItem:(id)a3
{
  id v3 = a3;
  if ([v3 _venueFeatureType] == (id)4)
  {
    id v4 = [v3 _venueInfo];
    id v5 = [v4 parent];
    unsigned int v6 = [v5 featureType];

    if (v6 != 2)
    {
      id v9 = [v3 _geoMapItem];
      id v10 = [v9 addressObject];
      id v11 = [v10 venueShortAddress];
      id v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [v3 venueLabelWithContext:0];
      }
      CFStringRef v8 = v13;

      goto LABEL_10;
    }
    uint64_t v7 = [v3 venueLabelWithContext:2];
  }
  else
  {
    uint64_t v7 = [v3 _addressFormattedAsShortenedAddress];
  }
  CFStringRef v8 = (void *)v7;
LABEL_10:

  return v8;
}

- (id)hoursBuilderForSearchCell
{
  uint64_t v2 = [(_SearchResultTableViewCell *)self mapItem];
  id v3 = [v2 hoursBuilderForSearchResultCellForOptions:128 conciseStyle:0];

  return v3;
}

- (id)attributedSecondPartDetailString
{
  id v3 = +[NSMutableArray array];
  id v4 = [(_SearchResultTableViewCell *)self distanceString];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  if (![(_SearchResultTableViewCell *)self displaysAsChainResult])
  {
    unsigned __int8 v7 = [(MKMapItem *)self->_mapItem _hasPriceDescription];
    mapItem = self->_mapItem;
    if (v7) {
      [(MKMapItem *)mapItem _priceDescription];
    }
    else {
    id v9 = [(MKMapItem *)mapItem _priceRangeString];
    }
    if ([v9 length]) {
      [v3 addObject:v9];
    }

    goto LABEL_13;
  }
  if (![(_SearchResultTableViewCell *)self _showOpenStateLabel])
  {
LABEL_13:
    unsigned int v6 = 0;
    goto LABEL_14;
  }
  id v5 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
  unsigned int v6 = [v5 localizedOpenState];

  if ([v6 length]) {
    [v3 addObject:v6];
  }
LABEL_14:
  id v10 = [(id)objc_opt_class() _delimiterString];
  v28 = v3;
  id v11 = [v3 componentsJoinedByString:v10];
  if ([(__CFString *)v11 length] && !self->_showDistance) {
    self->_onlyDistanceOrEmpty = 0;
  }
  id v12 = +[UIColor secondaryLabelColor];
  id v13 = objc_alloc((Class)NSMutableAttributedString);
  if (v11) {
    CFStringRef v14 = v11;
  }
  else {
    CFStringRef v14 = &stru_101324E70;
  }
  v31[0] = NSForegroundColorAttributeName;
  v31[1] = NSFontAttributeName;
  v32[0] = v12;
  id v15 = +[UIFont system15];
  v32[1] = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  id v17 = [v13 initWithString:v14 attributes:v16];

  if ([v6 length])
  {
    id v18 = [(__CFString *)v11 rangeOfString:v6];
    if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = v18;
      uint64_t v27 = v19;
      v21 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
      id v22 = +[UIColor secondaryLabelColor];
      [v21 updateHoursLabelColorWithDefaultLabelColor:v22];

      id v23 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
      CFStringRef v24 = [v23 hoursStateLabelColor];

      NSAttributedStringKey v29 = NSForegroundColorAttributeName;
      double v30 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [v17 addAttributes:v25 range:v20];
    }
  }

  return v17;
}

- (id)delimiterColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)labelStackViewSpacing
{
  return 0.0;
}

- (BOOL)_showOpenStateLabel
{
  uint64_t v2 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
  unsigned __int8 v3 = [v2 geoMapItemOpeningHourOptions];

  return (v3 & 0x64) != 0;
}

- (void)setAccessoryViewType:(int64_t)a3
{
  self->_accessoryViewType = a3;
  switch(a3)
  {
    case 1:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      id v4 = +[UIDevice currentDevice];
      id v5 = [v4 userInterfaceIdiom];
      unsigned int v6 = @"plus";
      if (v5 == (id)5) {
        unsigned int v6 = @"plus.circle";
      }
      unsigned __int8 v7 = v6;

      CFStringRef v8 = +[UIImage systemImageNamed:v7];

      [v27 setImage:v8 forState:0];
      id v9 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v9 forImageInState:0];

      id v10 = [v27 theme];
      id v11 = [v10 keyColor];
      [v27 setTintColor:v11];

      CFStringRef v12 = @"AccessoryAddButton";
      goto LABEL_10;
    case 2:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      id v13 = +[UIImage systemImageNamed:@"arrow.up.backward.circle"];
      [v27 setImage:v13 forState:0];

      CFStringRef v14 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v14 forImageInState:0];

      id v15 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v15];

      CFStringRef v12 = @"AccessoryQueryAcceleratorButton";
      goto LABEL_10;
    case 3:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      uint64_t v16 = +[UIImage systemImageNamed:@"checkmark"];
      [v27 setImage:v16 forState:0];

      id v17 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v17 forImageInState:0];

      id v18 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v18];

      CFStringRef v12 = @"AccessoryCheckmarkButton";
      goto LABEL_10;
    case 4:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      uint64_t v19 = +[UIDevice currentDevice];
      id v20 = [v19 userInterfaceIdiom];
      v21 = @"pin";
      if (v20 == (id)5) {
        v21 = @"pin.circle";
      }
      id v22 = v21;

      id v23 = +[UIImage systemImageNamed:v22];

      [v27 setImage:v23 forState:0];
      CFStringRef v24 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v24 forImageInState:0];

      v25 = [v27 theme];
      unsigned int v26 = [v25 keyColor];
      [v27 setTintColor:v26];

      CFStringRef v12 = @"AccessoryPinButton";
LABEL_10:
      [v27 setAccessibilityIdentifier:v12];
      if (!v27) {
        goto LABEL_12;
      }
      [v27 addTarget:self action:"didTapAccessoryViewButton:" forControlEvents:0x2000];
      break;
    default:
LABEL_12:
      id v27 = 0;
      break;
  }
  [v27 setAccessibilityIdentifier:@"AccessoryButton"];
  [(_SearchResultTableViewCell *)self setAccessoryView:v27];
}

- (void)didTapAccessoryViewButton:(id)a3
{
  id v6 = [(_SearchResultTableViewCell *)self accessoryViewDelegate];
  int64_t v4 = [(_SearchResultTableViewCell *)self accessoryViewType];
  id v5 = [(_SearchResultTableViewCell *)self accessoryViewObject];
  [v6 didTapOnAccessoryView:self withType:v4 object:v5];
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3
{
  id v5 = [(_SearchResultTableViewCell *)self placeContextViewModelDelegate];
  int64_t v4 = [(_SearchResultTableViewCell *)self placeContextViewModel];
  [v5 didTapOnPlaceContextWithViewModel:v4 parentView:self];
}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  unsigned __int8 v3 = [(_SearchResultTableViewCell *)self mapItem];

  if (v3)
  {
    int64_t v4 = [SearchResult alloc];
    id v5 = [(_SearchResultTableViewCell *)self mapItem];
    id v6 = [(SearchResult *)v4 initWithMapItem:v5];

    unsigned __int8 v7 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return (PersonalizedItem *)v7;
}

- (void)prepareForActionMenuPresentation
{
}

- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryViewDelegate);

  return (AutocompleteCellAccessoryDelegate *)WeakRetained;
}

- (void)setAccessoryViewDelegate:(id)a3
{
}

- (id)accessoryViewObject
{
  return self->_accessoryViewObject;
}

- (void)setAccessoryViewObject:(id)a3
{
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);

  return (PlaceContextViewModelCellDelegate *)WeakRetained;
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (void)setPlaceContextViewModel:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)debugString
{
  return self->_debugString;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (BOOL)displaysAsChainResult
{
  return self->_displaysAsChainResult;
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  self->_displaysAsChainResult = a3;
}

- (BOOL)displaysDistanceAsSnippetLocationAboveThreshold
{
  return self->_displaysDistanceAsSnippetLocationAboveThreshold;
}

- (void)setDisplaysDistanceAsSnippetLocationAboveThreshold:(BOOL)a3
{
  self->_displaysDistanceAsSnippetLocationAboveThreshold = a3;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (void)setPrefersAddressOverCategory:(BOOL)a3
{
  self->_prefersAddressOverCategory = a3;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (BOOL)displayDistanceIfValidCurrentLocation
{
  return self->_displayDistanceIfValidCurrentLocation;
}

- (void)setDisplayDistanceIfValidCurrentLocation:(BOOL)a3
{
  self->_displayDistanceIfValidCurrentLocation = a3;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
}

- (GEORelatedEntitySection)relatedSection
{
  return self->_relatedSection;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_relatedSection, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong(&self->_accessoryViewObject, 0);
  objc_destroyWeak((id *)&self->_accessoryViewDelegate);
  objc_storeStrong((id *)&self->_contextualInformationStackView, 0);
  objc_storeStrong((id *)&self->_secondLabelStackView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_transitInfoLabel, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_contextualInformationLabel, 0);
  objc_storeStrong((id *)&self->_contextualInformationImageView, 0);
  objc_storeStrong((id *)&self->_thirdLabel, 0);
  objc_storeStrong((id *)&self->_transitDelimiterLabel, 0);
  objc_storeStrong((id *)&self->_secondPartDelimiterLabel, 0);
  objc_storeStrong((id *)&self->_secondPartLabel, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end