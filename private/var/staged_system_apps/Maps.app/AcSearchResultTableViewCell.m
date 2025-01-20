@interface AcSearchResultTableViewCell
+ (double)childItemRowSpacing;
+ (id)identifierWithChildItemsCount:(unint64_t)a3;
- (AcSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AcSearchResultTableViewCellDelegate)delegate;
- (BOOL)isCompletionTypeAddress;
- (BOOL)shouldEnableGrayscaleHighlighting;
- (BOOL)supportsClientServerDifferentiation;
- (BOOL)wantsTwoLineLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ChildItemsViewModel)childItemsViewModel;
- (NSArray)childItems;
- (NSString)searchQuery;
- (double)estimatedChildItemsStackViewWidthWithContentViewWidth:(double)a3;
- (double)iconSize;
- (double)labelStackViewSpacing;
- (double)paddingAboveContextualInformationStackView;
- (double)trailingMargin;
- (id)_highlightedLabelColor;
- (id)attributedFirstPartDetailString;
- (id)attributedSecondPartDetailString;
- (id)attributedSubtitleString;
- (id)attributedTitleString;
- (id)autocompleteClientSourceString;
- (id)delimiterColor;
- (id)distanceString;
- (id)object;
- (id)secondaryLabelFont;
- (id)titleFont;
- (id)titleHighlightFont;
- (id)titleRegularFont;
- (int64_t)autocompleteCellType;
- (int64_t)autocompleteClientSourceType;
- (int64_t)containerAlignment;
- (void)_setHighlightedLabelColors;
- (void)_updateAccessoryTintColor;
- (void)addTransitLabelWithFirstPartDetailString:(id)a3 secondPartDetailString:(id)a4;
- (void)didTapChildItemButtonForChildItem:(id)a3;
- (void)didUpdateMapItem;
- (void)didUpdatePublisherResult;
- (void)loadPhoto;
- (void)prepareForReuse;
- (void)removeTransitLabel;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setAutocompleteCellType:(int64_t)a3;
- (void)setAutocompleteClientSourceType:(int64_t)a3;
- (void)setChildItems:(id)a3;
- (void)setChildItems:(id)a3 viewModel:(id)a4;
- (void)setChildItemsViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3;
- (void)setupPlaceContextContent:(id)a3;
- (void)updateChildItemGridAlignmentRectInset;
- (void)updateChildItems;
- (void)updateContent;
- (void)updateThirdLineVisibility;
@end

@implementation AcSearchResultTableViewCell

+ (double)childItemRowSpacing
{
  return 10.0;
}

+ (id)identifierWithChildItemsCount:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = [v4 initWithString:v6];

  if (a3) {
    [v7 appendString:@"ChildItems"];
  }
  id v8 = [v7 copy];

  return v8;
}

- (double)estimatedChildItemsStackViewWidthWithContentViewWidth:(double)a3
{
  double v5 = 0.0;
  if (!self->super._accessibilityEnabled)
  {
    [(AcSearchResultTableViewCell *)self iconSize];
    double v7 = v6;
    [(id)objc_opt_class() childItemRowSpacing];
    double v5 = v7 + v8;
  }
  [(_SearchResultTableViewCell *)self leadingMargin];
  double v10 = a3 - v9;
  [(AcSearchResultTableViewCell *)self trailingMargin];
  return v10 - v11 - v5;
}

- (double)iconSize
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 30.0;
  if (v2 == 5) {
    return 24.0;
  }
  return result;
}

- (double)labelStackViewSpacing
{
  return 2.0;
}

- (double)trailingMargin
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 10.0;
  if (v2 == 5) {
    return 16.0;
  }
  return result;
}

- (AcSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AcSearchResultTableViewCell;
  double v7 = [(_SearchResultTableViewCell *)&v25 initWithStyle:a3 reuseIdentifier:v6];
  double v8 = v7;
  if (v7)
  {
    [(AcSearchResultTableViewCell *)v7 setAccessibilityIdentifier:@"AutocompleteSearchResultTableViewCell"];
    [(_SearchResultTableViewCell *)v8 setDisplaysDistanceAsSnippetLocationAboveThreshold:0];
    id v9 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = v8->_imageView;
    v8->_imageView = v13;

    v15 = +[UIColor clearColor];
    [(UIImageView *)v8->_imageView setBackgroundColor:v15];

    [(AcSearchResultTableViewCell *)v8 iconSize];
    double v17 = v16;
    [(UIImageView *)v8->_imageView setClipsToBounds:1];
    -[UIImageView setMinimumLayoutSize:](v8->_imageView, "setMinimumLayoutSize:", v17, v17);
    -[UIImageView setMaximumLayoutSize:](v8->_imageView, "setMaximumLayoutSize:", v17, v17);
    [(UIImageView *)v8->_imageView setAccessibilityIdentifier:@"ImageView"];
    if (!v8->super._accessibilityEnabled) {
      [(NUIContainerStackView *)v8->super._containerStackView insertArrangedSubview:v8->_imageView atIndex:0];
    }
    if ([v6 containsString:@"ChildItems"])
    {
      v18 = -[_SearchResultChildItemGridView initWithFrame:]([_SearchResultChildItemGridView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      childItemGrid = v8->_childItemGrid;
      v8->_childItemGrid = v18;

      [(id)objc_opt_class() childItemRowSpacing];
      -[_SearchResultChildItemGridView setRowSpacing:](v8->_childItemGrid, "setRowSpacing:");
      [(_SearchResultChildItemGridView *)v8->_childItemGrid setColumnSpacing:10.0];
      [(_SearchResultChildItemGridView *)v8->_childItemGrid setHorizontalDistribution:1];
      [(_SearchResultChildItemGridView *)v8->_childItemGrid setVerticalDistribution:1];
      [(_SearchResultChildItemGridView *)v8->_childItemGrid setHorizontalAlignment:0];
      [(_SearchResultChildItemGridView *)v8->_childItemGrid setVerticalAlignment:0];
      [(AcSearchResultTableViewCell *)v8 updateChildItemGridAlignmentRectInset];
      [(NUIContainerStackView *)v8->super._rootStackView addArrangedSubview:v8->_childItemGrid];
      [(NUIContainerStackView *)v8->super._rootStackView setAlignment:0 forView:v8->_childItemGrid inAxis:0];
      [(_SearchResultTableViewCell *)v8 leadingMargin];
      double v21 = v20;
      [(AcSearchResultTableViewCell *)v8 trailingMargin];
      -[NUIContainerStackView setLayoutMargins:](v8->super._containerStackView, "setLayoutMargins:", 15.0, v21, 10.0, v22);
      v23 = +[NSNotificationCenter defaultCenter];
      [v23 addObserver:v8 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
    }
    if (sub_1000BBB44(v8) == 5)
    {
      [(AcSearchResultTableViewCell *)v8 _maps_setTableViewCellBackgroundConfiguration];
      [(AcSearchResultTableViewCell *)v8 _setHighlightedLabelColors];
      -[UIImageView setCustomAlignmentRectInsets:](v8->_imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, 0.0, 0.0);
    }
  }

  return v8;
}

- (void)_setHighlightedLabelColors
{
  id v3 = [(AcSearchResultTableViewCell *)self _highlightedLabelColor];
  [(UILabel *)self->super._titleLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._secondLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._thirdLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._secondPartLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._secondPartDelimiterLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._transitDelimiterLabel setHighlightedTextColor:v3];
  [(UILabel *)self->super._contextualInformationLabel setHighlightedTextColor:v3];
}

- (id)_highlightedLabelColor
{
  uint64_t v2 = +[UIColor whiteColor];
  id v3 = [v2 colorWithAlphaComponent:0.7];

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(AcSearchResultTableViewCell *)self isSelected];
  v8.receiver = self;
  v8.super_class = (Class)AcSearchResultTableViewCell;
  [(AcSearchResultTableViewCell *)&v8 setSelected:v5 animated:v4];
  if (v7 != v5) {
    [(AcSearchResultTableViewCell *)self updateContent];
  }
}

- (int64_t)containerAlignment
{
  if (sub_1000BBB44(self) != 5) {
    return 3;
  }
  unint64_t v3 = [(_SearchResultTableViewCell *)self numberOfLines];
  imageView = self->_imageView;
  if (v3 == 1) {
    double v5 = -3.0;
  }
  else {
    double v5 = 0.0;
  }
  if (v3 == 1) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 1;
  }
  -[UIImageView setCustomAlignmentRectInsets:](imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, v5, 0.0);
  return v6;
}

- (void)updateChildItemGridAlignmentRectInset
{
  [(AcSearchResultTableViewCell *)self iconSize];
  double v4 = v3;
  [(NUIContainerStackView *)self->super._containerStackView spacing];
  if (self->super._accessibilityEnabled || (double v6 = v5, sub_10072FF94()) || sub_1000BBB44(self) == 5) {
    [(_SearchResultTableViewCell *)self leadingMargin];
  }
  else {
    double v7 = v4 + v6 * 2.0 + 6.5;
  }
  double v8 = -v7;
  [(AcSearchResultTableViewCell *)self trailingMargin];
  childItemGrid = self->_childItemGrid;

  -[_SearchResultChildItemGridView setCustomAlignmentRectInsets:](childItemGrid, "setCustomAlignmentRectInsets:", -4.5, v8, -10.0, -(v9 + 6.5));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(AcSearchResultTableViewCell *)self reuseIdentifier];
  if (([v6 containsString:@"ChildItems"] & 1) != 0
    || self->super._accessibilityEnabled)
  {

LABEL_4:
    rootStackView = self->super._rootStackView;
    -[NUIContainerStackView sizeThatFits:](rootStackView, "sizeThatFits:", width, height);
    goto LABEL_14;
  }
  uint64_t v10 = sub_1000BBB44(self);

  if (v10 == 5) {
    goto LABEL_4;
  }
  int64_t v11 = [(AcSearchResultTableViewCell *)self autocompleteCellType];
  v12 = objc_opt_class();
  if (v11 == 3) {
    [v12 estimatedTwoLinesCellHeight];
  }
  else {
    [v12 estimatedCellHeight];
  }
  double v14 = v13;
  v15 = [(_SearchResultTableViewCell *)self placeContextViewModel];

  if (v15)
  {
    double v16 = [(UILabel *)self->super._contextualInformationLabel font];
    NSInteger v17 = [(UILabel *)self->super._contextualInformationLabel numberOfLines];
    v18 = [(AcSearchResultTableViewCell *)self traitCollection];
    [v18 displayScale];
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v16, v17);
    double v20 = v19;

    [(AcSearchResultTableViewCell *)self paddingAboveContextualInformationStackView];
    double v14 = v14 + v20 + v21;
  }
  double v22 = +[UIFont system15];
  [v22 _mapkit_scaledValueForValue:v14];
  double v24 = v23;

  double v8 = width;
  double v9 = v24;
LABEL_14:
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)setObject:(id)a3
{
  id v5 = a3;
  [(_SearchResultTableViewCell *)self setPublisherResult:0];
  objc_storeStrong(&self->_object, a3);
  id v6 = v5;
  double v7 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  objc_opt_class();
  id v28 = v6;
  if (objc_opt_isKindOfClass()) {
    double v8 = v28;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  if (v9
    && ([v9 historyEntry],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 conformsToProtocol:v7],
        v10,
        v11))
  {
    id v12 = v28;
  }
  else
  {
    id v12 = 0;
  }

  if (v12)
  {
    id v13 = v28;
    double v14 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    objc_opt_class();
    id v15 = v13;
    if (objc_opt_isKindOfClass()) {
      double v16 = v15;
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;

    if (v17
      && ([v17 historyEntry],
          v18 = objc_claimAutoreleasedReturnValue(),
          unsigned int v19 = [v18 conformsToProtocol:v14],
          v18,
          v19))
    {
      id v20 = v15;
    }
    else
    {
      id v20 = 0;
    }

    double v21 = [v20 historyEntry];
    double v22 = [v21 geoMapItem];
    double v23 = +[MKMapItem _itemWithGeoMapItem:v22];

    [(_SearchResultTableViewCell *)self setMapItem:v23];
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    completion = self->_completion;
    self->_completion = 0;
    id v27 = v28;

    id v20 = [v27 mapItem];

    goto LABEL_23;
  }
  objc_storeStrong((id *)&self->_completion, a3);
  double v24 = [(MKLocalSearchCompletion *)self->_completion publisherResult];

  objc_super v25 = self->_completion;
  if (!v24)
  {
    id v20 = [(MKLocalSearchCompletion *)v25 mapItem];
LABEL_23:
    [(_SearchResultTableViewCell *)self setMapItem:v20];
    goto LABEL_24;
  }
  id v20 = [(MKLocalSearchCompletion *)v25 publisherResult];
  [(_SearchResultTableViewCell *)self setPublisherResult:v20];
LABEL_24:

LABEL_25:
}

- (BOOL)isCompletionTypeAddress
{
  return [(MKLocalSearchCompletion *)self->_completion _type] == (id)2;
}

- (id)attributedTitleString
{
  double v3 = [(AcSearchResultTableViewCell *)self titleRegularFont];
  double v4 = [(AcSearchResultTableViewCell *)self titleHighlightFont];
  completion = self->_completion;
  if (completion)
  {
    id v6 = [(MKLocalSearchCompletion *)completion title];
    double v7 = [(MKLocalSearchCompletion *)self->_completion titleHighlightRanges];
    if (sub_1000BBB44(self) == 5)
    {
      if ([(AcSearchResultTableViewCell *)self isSelected]) {
        +[UIColor whiteColor];
      }
      else {
      id v17 = +[UIColor labelColor];
      }
      if ([(AcSearchResultTableViewCell *)self isSelected]) {
        [(AcSearchResultTableViewCell *)self _highlightedLabelColor];
      }
      else {
      v18 = +[UIColor secondaryLabelColor];
      }
      [(UILabel *)self->super._titleLabel setTextColor:v18];
      uint64_t v19 = +[NSAttributedString attributedStringWithText:v6 highlightRanges:v7 font:v3 highlightedFont:v4 highlightedTextColor:v17];
    }
    else
    {
      if (![(AcSearchResultTableViewCell *)self shouldEnableGrayscaleHighlighting])
      {
        id v9 = +[NSAttributedString attributedStringWithText:v6 boldInRange:v7 font:v3 bold:v4];
LABEL_19:

        goto LABEL_22;
      }
      id v17 = +[UIColor labelColor];
      v18 = +[UIColor secondaryLabelColor];
      uint64_t v19 = +[NSAttributedString attributedStringWithText:v6 highlightRanges:v7 font:v4 highlightedFont:v4 highlightedTextColor:v17 unhighlightedTextColor:v18];
    }
    id v9 = (void *)v19;

    goto LABEL_19;
  }
  if (sub_1000BBB44(self) == 5)
  {
    double v8 = +[UIColor labelColor];
    [(UILabel *)self->super._titleLabel setTextColor:v8];
  }
  v22.receiver = self;
  v22.super_class = (Class)AcSearchResultTableViewCell;
  id v9 = [(_SearchResultTableViewCell *)&v22 attributedTitleString];
  uint64_t v10 = [(AcSearchResultTableViewCell *)self searchQuery];

  if (v10)
  {
    unsigned int v11 = [v9 string];
    id v12 = [(AcSearchResultTableViewCell *)self searchQuery];
    id v13 = [v11 _maps_prefixMatchesForSearchString:v12];

    LODWORD(v12) = [(AcSearchResultTableViewCell *)self shouldEnableGrayscaleHighlighting];
    double v14 = [v9 string];
    if (v12)
    {
      id v15 = +[UIColor labelColor];
      double v16 = +[UIColor secondaryLabelColor];
      +[NSAttributedString attributedStringWithText:v14 highlightRanges:v13 font:v4 highlightedFont:v4 highlightedTextColor:v15 unhighlightedTextColor:v16];
    }
    else
    {
      id v15 = [(AcSearchResultTableViewCell *)self titleRegularFont];
      double v16 = [(AcSearchResultTableViewCell *)self titleHighlightFont];
      +[NSAttributedString attributedStringWithText:v14 boldInRange:v13 font:v15 bold:v16];
    uint64_t v20 = };

    id v9 = (void *)v20;
  }
LABEL_22:

  return v9;
}

- (id)titleRegularFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  uint64_t v2 = +[UIFont system17];
  }

  return v2;
}

- (id)titleHighlightFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  uint64_t v2 = +[UIFont system17SemiBold];
  }

  return v2;
}

- (id)titleFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A9243C();
  }
  else {
  uint64_t v2 = +[UIFont system17SemiBold];
  }

  return v2;
}

- (id)secondaryLabelFont
{
  if (sub_1000BBB44(self) == 5) {
    sub_100A92448();
  }
  else {
  uint64_t v2 = +[UIFont system15];
  }

  return v2;
}

- (id)attributedFirstPartDetailString
{
  double v3 = +[NSMutableArray array];
  double v4 = [(AcSearchResultTableViewCell *)self autocompleteClientSourceString];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  if ([(AcSearchResultTableViewCell *)self wantsTwoLineLayout]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  id v5 = +[UIColor labelColor];
  }
  id v6 = [(_SearchResultTableViewCell *)self publisherResult];

  if (v6)
  {
    double v7 = [(_SearchResultTableViewCell *)self publisherResult];
    double v8 = [v7 publisher];
    id v9 = [v8 publisherAttribution];
    uint64_t v10 = [v9 subtitle];

    if ([v10 length]) {
      [v3 addObject:v10];
    }
  }
  else
  {
    uint64_t v10 = [(AcSearchResultTableViewCell *)self distanceString];
    if ([v10 length]) {
      [v3 addObject:v10];
    }
    unsigned int v11 = [(_SearchResultTableViewCell *)self mapItem];
    id v12 = [(_SearchResultTableViewCell *)self shortenedAddressStringForMapItem:v11];

    if ([(AcSearchResultTableViewCell *)self isCompletionTypeAddress])
    {
      uint64_t v13 = [(MKLocalSearchCompletion *)self->_completion subtitle];

      uint64_t v14 = +[UIColor secondaryLabelColor];

      id v12 = (void *)v13;
      id v5 = (void *)v14;
    }
    if ([v12 length]) {
      [v3 addObject:v12];
    }
  }
  id v15 = +[UIApplication sharedApplication];
  id v16 = [v15 userInterfaceLayoutDirection];

  if (v16 == (id)1)
  {
    id v17 = [v3 reverseObjectEnumerator];
    v18 = [v17 allObjects];
    id v19 = [v18 mutableCopy];

    double v3 = v19;
  }
  uint64_t v20 = [(id)objc_opt_class() _delimiterString];
  double v21 = [v3 componentsJoinedByString:v20];

  id v22 = objc_alloc((Class)NSMutableAttributedString);
  if (v21) {
    CFStringRef v23 = v21;
  }
  else {
    CFStringRef v23 = &stru_101324E70;
  }
  v28[0] = NSForegroundColorAttributeName;
  v28[1] = NSFontAttributeName;
  v29[0] = v5;
  double v24 = +[UIFont system15];
  v29[1] = v24;
  objc_super v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  id v26 = [v22 initWithString:v23 attributes:v25];

  self->super._onlyDistanceOrEmptdouble y = 0;

  return v26;
}

- (id)attributedSecondPartDetailString
{
  if ([(AcSearchResultTableViewCell *)self isCompletionTypeAddress]
    || ([(_SearchResultTableViewCell *)self publisherResult],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = 0;
  }
  else
  {
    if ([(AcSearchResultTableViewCell *)self wantsTwoLineLayout]
      && [(_SearchResultTableViewCell *)self _showOpenStateLabel])
    {
      id v6 = [(_SearchResultTableViewCell *)self hoursBuilderForSearchCell];
      double v7 = [v6 localizedOpenState];
    }
    else
    {
      double v7 = 0;
    }
    id v8 = objc_alloc((Class)NSAttributedString);
    if (v7) {
      CFStringRef v9 = v7;
    }
    else {
      CFStringRef v9 = &stru_101324E70;
    }
    v14[0] = NSForegroundColorAttributeName;
    uint64_t v10 = +[UIColor secondaryLabelColor];
    v15[0] = v10;
    v14[1] = NSFontAttributeName;
    unsigned int v11 = +[UIFont system15];
    v15[1] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v13 = [v8 initWithString:v9 attributes:v12];
    id v4 = [v13 copy];
  }

  return v4;
}

- (id)delimiterColor
{
  if ([(AcSearchResultTableViewCell *)self wantsTwoLineLayout]) {
    double v3 = (AcSearchResultTableViewCell *)UIColor;
  }
  else {
    double v3 = self;
  }
  id v4 = [(_SearchResultTableViewCell *)v3 secondaryLabelColor];

  return v4;
}

- (id)attributedSubtitleString
{
  if ([(AcSearchResultTableViewCell *)self isCompletionTypeAddress]
    || ([(_SearchResultTableViewCell *)self publisherResult],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AcSearchResultTableViewCell;
    id v4 = [(_SearchResultTableViewCell *)&v6 attributedSubtitleString];
  }

  return v4;
}

- (id)distanceString
{
  if (![(AcSearchResultTableViewCell *)self isCompletionTypeAddress]) {
    goto LABEL_4;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  if (([(MKLocalSearchCompletion *)self->_completion getCoordinate:&v10] & 1) == 0) {
    goto LABEL_4;
  }
  double v3 = v10;
  double v4 = v11;
  id v5 = [(_SearchResultTableViewCell *)self currentLocation];
  objc_super v6 = [(_SearchResultTableViewCell *)self mapItem];
  double v7 = +[NSString distanceStringFromLocation:toCoordinate:withMapItem:showsDistance:onlyUseThreshold:maximumDistance:useShortThreshold:](NSString, "distanceStringFromLocation:toCoordinate:withMapItem:showsDistance:onlyUseThreshold:maximumDistance:useShortThreshold:", v5, v6, &self->super._showDistance, 1, 0, 1, v3, v4);

  if (!v7)
  {
LABEL_4:
    v9.receiver = self;
    v9.super_class = (Class)AcSearchResultTableViewCell;
    double v7 = [(_SearchResultTableViewCell *)&v9 distanceString];
  }

  return v7;
}

- (void)didUpdateMapItem
{
  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 didUpdateMapItem];
  ++self->_imageState;
  [(UIImageView *)self->_imageView setImage:0];
  [(AcSearchResultTableViewCell *)self loadPhoto];
  [(AcSearchResultTableViewCell *)self updateChildItems];
}

- (void)didUpdatePublisherResult
{
  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 didUpdatePublisherResult];
  [(AcSearchResultTableViewCell *)self loadPhoto];
  [(AcSearchResultTableViewCell *)self updateChildItems];
}

- (void)updateThirdLineVisibility
{
  if ([(AcSearchResultTableViewCell *)self wantsTwoLineLayout])
  {
    objc_super v3 = [(UILabel *)self->super._secondLabel text];
    if ([v3 length])
    {
    }
    else
    {
      unsigned __int8 v4 = [(UILabel *)self->super._thirdLabel isHidden];

      if ((v4 & 1) == 0) {
        return;
      }
    }
    thirdLabel = self->super._thirdLabel;
    [(UILabel *)thirdLabel setHidden:1];
  }
}

- (void)updateContent
{
  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 updateContent];
  [(AcSearchResultTableViewCell *)self updateThirdLineVisibility];
  [(AcSearchResultTableViewCell *)self _updateAccessoryTintColor];
}

- (void)_updateAccessoryTintColor
{
  if (sub_1000BBB44(self) == 5
    && (id)[(_SearchResultTableViewCell *)self accessoryViewType] == (id)1)
  {
    if ([(AcSearchResultTableViewCell *)self isSelected])
    {
      id v6 = +[UIColor whiteColor];
      objc_super v3 = [(AcSearchResultTableViewCell *)self accessoryView];
      [v3 setTintColor:v6];
    }
    else
    {
      id v6 = [(AcSearchResultTableViewCell *)self accessoryView];
      objc_super v3 = [v6 theme];
      unsigned __int8 v4 = [v3 keyColor];
      id v5 = [(AcSearchResultTableViewCell *)self accessoryView];
      [v5 setTintColor:v4];
    }
  }
}

- (void)setAccessoryViewType:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 setAccessoryViewType:a3];
  [(AcSearchResultTableViewCell *)self _updateAccessoryTintColor];
}

- (void)setupPlaceContextContent:(id)a3
{
  labelStackView = self->super._labelStackView;
  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 setupPlaceContextContent:a3 inStackView:labelStackView];
}

- (void)loadPhoto
{
  int imageState = self->_imageState;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100984704;
  v23[3] = &unk_101312320;
  int v24 = imageState;
  v23[4] = self;
  objc_super v4 = objc_retainBlock(v23);
  id v5 = [(_SearchResultTableViewCell *)self mapItem];
  id v6 = self->_completion;
  [(AcSearchResultTableViewCell *)self iconSize];
  double v8 = v7;
  objc_super v9 = [(_SearchResultTableViewCell *)self publisherResult];

  if (v9)
  {
    double v10 = +[MapsUIImageCache sharedCache];
    double v11 = [(_SearchResultTableViewCell *)self publisherResult];
    id v12 = [v11 publisher];
    id v13 = [v12 publisherAttribution];
    id v14 = [v13 iconIdentifier];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100984738;
    v21[3] = &unk_1012E60A0;
    id v22 = v4;
    [v10 getImageForPublisherWithIconIdentifier:v14 completion:v21];

    double v15 = 5.0;
    id v16 = v22;
  }
  else
  {
    double v15 = v8 * 0.5;
    if (v6
      && (![(MKLocalSearchCompletion *)v6 _type] || [(MKLocalSearchCompletion *)v6 _type] == (id)3))
    {
      id v16 = +[MapsUIImageCache sharedCache];
      id v17 = [v16 searchImage];
      [(UIImageView *)self->_imageView setImage:v17];
    }
    else
    {
      v18 = +[MapsUIImageCache sharedCache];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1009847BC;
      v19[3] = &unk_1012E60A0;
      uint64_t v20 = v4;
      [v18 getImageForMapItem:v5 completion:v19];

      id v16 = v20;
    }
  }

  [(UIImageView *)self->_imageView _setContinuousCornerRadius:v15];
}

- (void)updateChildItems
{
  id v6 = [(AcSearchResultTableViewCell *)self childItems];
  if ([(ChildItemButtonProtocol *)self->_childItemButtons count])
  {
    unint64_t v3 = 0;
    do
    {
      objc_super v4 = [(ChildItemButtonProtocol *)self->_childItemButtons objectAtIndexedSubscript:v3];
      [v4 setDelegate:self];
      id v5 = [v6 objectAtIndexedSubscript:v3];
      [v4 setChildItem:v5];

      ++v3;
    }
    while (v3 < (unint64_t)[(ChildItemButtonProtocol *)self->_childItemButtons count]);
  }
}

- (void)setChildItems:(id)a3 viewModel:(id)a4
{
  id v23 = a4;
  double v7 = (NSArray *)[a3 copy];
  childItems = self->_childItems;
  self->_childItems = v7;

  objc_super v9 = self->_childItemsViewModel;
  objc_storeStrong((id *)&self->_childItemsViewModel, a4);
  if (![(ChildItemsViewModel *)self->_childItemsViewModel isEqual:v9])
  {
    childItemGrid = self->_childItemGrid;
    if (childItemGrid)
    {
      [(_SearchResultChildItemGridView *)childItemGrid removeAllArrangedSubviews];
      double v11 = [NSMutableArray arrayWithCapacity:][v23 numberOfColumns] * [v23 numberOfRows];
      if ([v23 numberOfRows])
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        do
        {
          id v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v23 numberOfColumns]);
          if ([v23 numberOfColumns])
          {
            uint64_t v15 = 0;
            id v16 = v23;
            do
            {
              if (v13 + v15 >= (unint64_t)[v16 childItemsCount])
              {
                id v17 = objc_alloc_init((Class)UIView);
                v18 = v14;
              }
              else
              {
                if (sub_1000BBB44(self) == 5) {
                  +[ChildItemCatalystButton childItemCatalystButton];
                }
                else {
                id v17 = +[ChildItemButton button];
                }
                [v14 addObject:v17];
                v18 = v11;
              }
              [v18 addObject:v17];

              BOOL v19 = ++v15 >= (unint64_t)[v23 numberOfColumns];
              id v16 = v23;
            }
            while (!v19);
            v13 += v15;
          }
          if ([v14 count]) {
            id v20 = [(_SearchResultChildItemGridView *)self->_childItemGrid addRowWithArrangedSubviews:v14];
          }

          ++v12;
        }
        while (v12 < (unint64_t)[v23 numberOfRows]);
      }
      double v21 = (ChildItemButtonProtocol *)[v11 copy];
      childItemButtons = self->_childItemButtons;
      self->_childItemButtons = v21;
    }
  }
}

- (id)autocompleteClientSourceString
{
  if ([(AcSearchResultTableViewCell *)self supportsClientServerDifferentiation])
  {
    unint64_t v3 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:[(AcSearchResultTableViewCell *)self autocompleteClientSourceType]];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)wantsTwoLineLayout
{
  return (id)[(AcSearchResultTableViewCell *)self autocompleteCellType] == (id)3
      || (id)[(AcSearchResultTableViewCell *)self autocompleteCellType] == (id)4;
}

- (BOOL)supportsClientServerDifferentiation
{
  return (char *)[(AcSearchResultTableViewCell *)self autocompleteCellType] - 3 < (char *)2;
}

- (void)prepareForReuse
{
  [(_SearchResultTableViewCell *)self _clearModel];
  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 prepareForReuse];
  completion = self->_completion;
  self->_completion = 0;

  [(AcSearchResultTableViewCell *)self setAutocompleteCellType:0];
  [(AcSearchResultTableViewCell *)self setAutocompleteClientSourceType:0];
  [(AcSearchResultTableViewCell *)self setSearchQuery:0];
}

- (void)addTransitLabelWithFirstPartDetailString:(id)a3 secondPartDetailString:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  unsigned int v7 = [(AcSearchResultTableViewCell *)self wantsTwoLineLayout];
  transitInfoLabel = self->super._transitInfoLabel;
  if (v7)
  {
    if (!transitInfoLabel)
    {
      objc_super v9 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
      double v10 = self->super._transitInfoLabel;
      self->super._transitInfoLabel = v9;

      double v11 = +[UIColor clearColor];
      [(MKTransitInfoLabelView *)self->super._transitInfoLabel setBackgroundColor:v11];

      LODWORD(v12) = 1144733696;
      [(MKTransitInfoLabelView *)self->super._transitInfoLabel setContentCompressionResistancePriority:0 forAxis:v12];
    }
    uint64_t v13 = v25;
    if (!v25)
    {
      uint64_t v13 = [(AcSearchResultTableViewCell *)self attributedFirstPartDetailString];
    }
    id v25 = v13;
    if ([v13 length]) {
      goto LABEL_10;
    }
    if (!v6)
    {
      id v6 = [(AcSearchResultTableViewCell *)self attributedSecondPartDetailString];
    }
    if ([v6 length])
    {
LABEL_10:
      transitDelimiterLabel = self->super._transitDelimiterLabel;
      if (!transitDelimiterLabel)
      {
        uint64_t v15 = [(_SearchResultTableViewCell *)self _delimiterLabel];
        id v16 = self->super._transitDelimiterLabel;
        self->super._transitDelimiterLabel = v15;

        LODWORD(v17) = 1144717312;
        [(UILabel *)self->super._transitDelimiterLabel setContentCompressionResistancePriority:0 forAxis:v17];
        transitDelimiterLabel = self->super._transitDelimiterLabel;
      }
      [(NUIContainerStackView *)self->super._secondLabelStackView insertArrangedSubview:transitDelimiterLabel atIndex:0];
    }
    secondLabelStackView = self->super._secondLabelStackView;
    BOOL v19 = self->super._transitInfoLabel;
    id v20 = 0;
    goto LABEL_19;
  }
  if (!transitInfoLabel)
  {
    double v21 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
    id v22 = self->super._transitInfoLabel;
    self->super._transitInfoLabel = v21;

    id v23 = +[UIColor clearColor];
    [(MKTransitInfoLabelView *)self->super._transitInfoLabel setBackgroundColor:v23];
  }
  if (self->_childItemGrid)
  {
    int v24 = (char *)-[NUIContainerStackView indexOfArrangedSubview:](self->super._labelStackView, "indexOfArrangedSubview:");
    BOOL v19 = self->super._transitInfoLabel;
    if (v24 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = v24 - 1;
      secondLabelStackView = self->super._labelStackView;
LABEL_19:
      [(NUIContainerStackView *)secondLabelStackView insertArrangedSubview:v19 atIndex:v20];
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v19 = self->super._transitInfoLabel;
  }
  [(NUIContainerStackView *)self->super._labelStackView addArrangedSubview:v19];
LABEL_22:
}

- (void)removeTransitLabel
{
  if (self->super._transitInfoLabel)
  {
    v3.receiver = self;
    v3.super_class = (Class)AcSearchResultTableViewCell;
    [(_SearchResultTableViewCell *)&v3 removeTransitLabel];
    [(NUIContainerStackView *)self->super._secondLabelStackView removeArrangedSubview:self->super._transitInfoLabel];
    [(MKTransitInfoLabelView *)self->super._transitInfoLabel removeFromSuperview];
  }
  if (self->super._transitDelimiterLabel)
  {
    -[NUIContainerStackView removeArrangedSubview:](self->super._secondLabelStackView, "removeArrangedSubview:");
    [(UILabel *)self->super._transitDelimiterLabel removeFromSuperview];
  }
}

- (void)didTapChildItemButtonForChildItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = [(AcSearchResultTableViewCell *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    id v4 = v10;
    if (v6)
    {
      NSUInteger v7 = [(NSArray *)self->_childItems indexOfObject:v10];
      id v4 = v10;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v8 = +[NSIndexPath indexPathForRow:v7 inSection:0];
        objc_super v9 = [(AcSearchResultTableViewCell *)self delegate];
        [v9 didTapItemInChildItems:self->_childItems atIndexPath:v8 forCell:self];

        id v4 = v10;
      }
    }
  }
}

- (double)paddingAboveContextualInformationStackView
{
  return 4.0;
}

- (id)object
{
  return self->_object;
}

- (AcSearchResultTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AcSearchResultTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)autocompleteCellType
{
  return self->_autocompleteCellType;
}

- (void)setAutocompleteCellType:(int64_t)a3
{
  self->_autocompleteCellType = a3;
}

- (int64_t)autocompleteClientSourceType
{
  return self->_autocompleteClientSourceType;
}

- (void)setAutocompleteClientSourceType:(int64_t)a3
{
  self->_autocompleteClientSourceType = a3;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3
{
  self->_shouldEnableGrayscaleHighlighting = a3;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (ChildItemsViewModel)childItemsViewModel
{
  return self->_childItemsViewModel;
}

- (void)setChildItemsViewModel:(id)a3
{
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (void)setChildItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_childItemsViewModel, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_childItemGrid, 0);
  objc_storeStrong((id *)&self->_childItemButtons, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_completion, 0);
}

@end