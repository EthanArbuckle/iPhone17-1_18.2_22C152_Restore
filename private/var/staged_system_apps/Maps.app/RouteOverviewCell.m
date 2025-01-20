@interface RouteOverviewCell
+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize;
+ (double)horizontalBackgroundInset;
+ (double)horizontalContentInset;
+ (double)minimumHeight;
+ (double)minimumRidesharingHeight;
+ (double)minimumVerticalPadding;
+ (id)goButtonFontProvider;
+ (id)primaryLabelEnlargedFontProvider;
+ (id)primaryLabelFontProvider;
+ (id)secondaryLabelFontProvider;
+ (id)tertiaryLabelBoldFont;
- (BOOL)detailsButtonRotated;
- (BOOL)hasSelectedStep;
- (BOOL)isAdvisoriesViewVisible;
- (BOOL)isArtworkListVisible;
- (BOOL)isDetailsButtonVisible;
- (BOOL)isElevationGraphViewVisible;
- (BOOL)isGoButtonProgressVisible;
- (BOOL)isRouteDescritptionLabelVisible;
- (BOOL)isSelectionBackgroundVisible;
- (BOOL)isTertiaryLabelVisible;
- (BackgroundColorButton)bookButton;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (DirectionsElevationGraphView)elevationGraphView;
- (MapsProgressButton)goButton;
- (MapsThemeMultiPartLabel)routeDescriptionLabel;
- (MapsThemeMultiPartLabel)secondaryLabel;
- (NSArray)advisoriesViewConstraints;
- (NSArray)artworkListConstraints;
- (NSArray)detailsButtonConstraints;
- (NSArray)elevationGraphViewConstraints;
- (NSArray)routeDescriptionLabelConstraints;
- (NSArray)tertiaryLabelConstraints;
- (NSLayoutConstraint)bookButtonLeadingConstraint;
- (NSLayoutConstraint)contentBottomConstraint;
- (NSLayoutConstraint)contentTopConstraint;
- (NSLayoutConstraint)goButtonHeightConstraint;
- (NSLayoutConstraint)goButtonLeadingConstraint;
- (NSLayoutConstraint)goButtonWidthConstraint;
- (NSLayoutConstraint)labelTrailingToPrimaryButtonLeadingPaddingConstraint;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSLayoutConstraint)noButtonLeadingConstraint;
- (NSLayoutConstraint)primaryCompanionImageToLabelPaddingConstraint;
- (NSLayoutConstraint)primaryCompanionImageWidthConstraint;
- (NSLayoutConstraint)primaryToSecondaryLabelConstraint;
- (NSLayoutConstraint)stepsButtonHeightConstraint;
- (NSLayoutConstraint)stepsButtonLeadingConstraint;
- (NSLayoutConstraint)stepsButtonMaxWidthConstraint;
- (NSLayoutConstraint)stepsButtonMinWidthConstraint;
- (RouteAdvisoriesView)advisoriesView;
- (RouteOverviewCell)initWithCoder:(id)a3;
- (RouteOverviewCell)initWithFrame:(CGRect)a3;
- (RouteOverviewCellDelegate)delegate;
- (TransitArtworkListView)artworkList;
- (UIButton)detailsButton;
- (UIButton)stepsButton;
- (UIImage)primaryLabelCompanionImage;
- (UIImageView)primaryLabelCompanionImageView;
- (UILabel)primaryLabel;
- (UILabel)tertiaryLabel;
- (UILayoutGuide)contentGuide;
- (UILayoutGuide)labelTrailingToGoButtonLeadingLayoutGuide;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (double)goButtonProgress;
- (id)keyCommands;
- (int64_t)_resolvedGrouping;
- (int64_t)overrideCellGrouping;
- (unint64_t)buttonVisibility;
- (void)_createSubviews;
- (void)_didTapAutomaticSharingButton;
- (void)_didTapDetailsButton:(id)a3;
- (void)_didTapPrimaryActionButton:(id)a3;
- (void)_doubleTap:(id)a3;
- (void)_reloadElevationChart;
- (void)_resetBookButtonTitle;
- (void)_setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupConstraints;
- (void)_updateButtonVisibility;
- (void)_updateColorsForSelection;
- (void)_updateConstraintsForArtworkListVisible:(BOOL)a3 elevationGraphViewVisible:(BOOL)a4 advisoriesViewVisible:(BOOL)a5 tertiaryLabelVisible:(BOOL)a6 detailsButtonVisible:(BOOL)a7;
- (void)_updateGoButtonWidthConstraint;
- (void)_updateStepsButtonWidthConstraint;
- (void)customInit;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAdvisoriesViewConstraints:(id)a3;
- (void)setAdvisoriesViewVisible:(BOOL)a3;
- (void)setArtworkListConstraints:(id)a3;
- (void)setArtworkListVisible:(BOOL)a3;
- (void)setBookButtonLeadingConstraint:(id)a3;
- (void)setBookButtonTitle:(id)a3;
- (void)setButtonVisibility:(unint64_t)a3;
- (void)setContentBottomConstraint:(id)a3;
- (void)setContentGuide:(id)a3;
- (void)setContentTopConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsButton:(id)a3;
- (void)setDetailsButtonConstraints:(id)a3;
- (void)setDetailsButtonRotated:(BOOL)a3;
- (void)setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4;
- (void)setDetailsButtonVisible:(BOOL)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setElevationGraphViewConstraints:(id)a3;
- (void)setElevationGraphViewVisible:(BOOL)a3;
- (void)setGoButtonHeightConstraint:(id)a3;
- (void)setGoButtonLeadingConstraint:(id)a3;
- (void)setGoButtonProgress:(double)a3;
- (void)setGoButtonProgressVisible:(BOOL)a3;
- (void)setGoButtonWidthConstraint:(id)a3;
- (void)setHasSelectedStep:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLabelTrailingToGoButtonLeadingLayoutGuide:(id)a3;
- (void)setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:(id)a3;
- (void)setNoButtonLeadingConstraint:(id)a3;
- (void)setOverrideCellGrouping:(int64_t)a3;
- (void)setPrimaryCompanionImageToLabelPaddingConstraint:(id)a3;
- (void)setPrimaryCompanionImageWidthConstraint:(id)a3;
- (void)setPrimaryLabelCompanionImage:(id)a3;
- (void)setPrimaryToSecondaryLabelConstraint:(id)a3;
- (void)setRouteDescriptionLabelConstraints:(id)a3;
- (void)setRouteDescritptionLabelVisible:(BOOL)a3;
- (void)setSelectionBackgroundVisible:(BOOL)a3;
- (void)setStepsButtonHeightConstraint:(id)a3;
- (void)setStepsButtonLeadingConstraint:(id)a3;
- (void)setStepsButtonMaxWidthConstraint:(id)a3;
- (void)setStepsButtonMinWidthConstraint:(id)a3;
- (void)setTertiaryLabelConstraints:(id)a3;
- (void)setTertiaryLabelVisible:(BOOL)a3;
- (void)updateConstraints;
- (void)updateTheme;
@end

@implementation RouteOverviewCell

+ (double)minimumHeight
{
  v2 = +[UIScreen mainScreen];
  if (sub_1000BBB44(v2) == 5) {
    double v3 = 48.0;
  }
  else {
    double v3 = 120.0;
  }

  return v3;
}

+ (double)minimumRidesharingHeight
{
  return 103.0;
}

+ (double)minimumVerticalPadding
{
  v2 = +[UIScreen mainScreen];
  if (sub_1000BBB44(v2) == 5) {
    double v3 = 9.0;
  }
  else {
    double v3 = 16.0;
  }

  return v3;
}

+ (double)horizontalContentInset
{
  v2 = +[UIScreen mainScreen];
  if (sub_1000BBB44(v2) == 5) {
    double v3 = 18.0;
  }
  else {
    double v3 = 32.0;
  }

  return v3;
}

+ (double)horizontalBackgroundInset
{
  v2 = +[UIScreen mainScreen];
  if (sub_1000BBB44(v2) == 5) {
    double v3 = 10.0;
  }
  else {
    double v3 = 16.0;
  }

  return v3;
}

+ (id)primaryLabelFontProvider
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)5) {
    double v3 = &stru_1013214A0;
  }
  else {
    double v3 = &stru_101321440;
  }
  v4 = objc_retainBlock(v3);

  return v4;
}

+ (id)primaryLabelEnlargedFontProvider
{
  v2 = objc_retainBlock(&stru_101321400);

  return v2;
}

+ (id)secondaryLabelFontProvider
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)5) {
    double v3 = &stru_101321300;
  }
  else {
    double v3 = &stru_101321340;
  }
  v4 = objc_retainBlock(v3);

  return v4;
}

+ (id)goButtonFontProvider
{
  v2 = objc_retainBlock(&stru_101321480);

  return v2;
}

+ (id)tertiaryLabelBoldFont
{
  return sub_100CE0D34(&stru_101321500);
}

- (RouteOverviewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RouteOverviewCell;
  double v3 = -[RouteOverviewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RouteOverviewCell *)v3 customInit];
    v5 = v4;
  }

  return v4;
}

- (RouteOverviewCell)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RouteOverviewCell;
  double v3 = [(RouteOverviewCell *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(RouteOverviewCell *)v3 customInit];
    v5 = v4;
  }

  return v4;
}

- (void)customInit
{
  if (sub_1000BBB44(self) == 5)
  {
    double v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_doubleTap:"];
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setEnabled:self->_detailsButtonVisible];
    [(RouteOverviewCell *)self addGestureRecognizer:self->_doubleTapGestureRecognizer];
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = 1;
  }
  self->_buttonVisibility = v5;
  v6 = +[UIColor clearColor];
  [(RouteOverviewCell *)self setBackgroundColor:v6];

  objc_super v7 = +[UIColor clearColor];
  v8 = [(RouteOverviewCell *)self contentView];
  [v8 setBackgroundColor:v7];

  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100D9DA40;
  v14 = &unk_1012E8B98;
  objc_copyWeak(&v15, &location);
  [(RouteOverviewCell *)self _setBackgroundViewConfigurationProvider:&v11];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  -[RouteOverviewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10, v11, v12, v13, v14);

  [(RouteOverviewCell *)self _createSubviews];
  [(RouteOverviewCell *)self _setupConstraints];
  [(RouteOverviewCell *)self _updateButtonVisibility];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_createSubviews
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v59 = v3;
  [v3 setNumberOfLines:0];
  v4 = [(id)objc_opt_class() primaryLabelFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v3 withFontProvider:v4];

  objc_storeStrong((id *)&self->_primaryLabel, v3);
  unint64_t v5 = +[UIColor labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v5];

  [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  v6 = [(RouteOverviewCell *)self contentView];
  [v6 addSubview:self->_primaryLabel];

  objc_super v7 = objc_alloc_init(AutolayoutImageView);
  [(AutolayoutImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AutolayoutImageView *)v7 setHidden:1];
  v58 = v7;
  objc_storeStrong((id *)&self->_primaryLabelCompanionImageView, v7);
  [(UIImageView *)self->_primaryLabelCompanionImageView setAccessibilityIdentifier:@"PrimaryLabelCompanionImageView"];
  v8 = [(RouteOverviewCell *)self contentView];
  [v8 addSubview:self->_primaryLabelCompanionImageView];

  v9 = objc_alloc_init(MapsThemeMultiPartLabel);
  [(MapsThemeMultiPartLabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeMultiPartLabel *)v9 setNumberOfLines:0];
  [(MapsThemeMultiPartLabel *)v9 setUserInteractionEnabled:0];
  v10 = [(id)objc_opt_class() secondaryLabelFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v9 withFontProvider:v10];

  v11 = [(RouteOverviewCell *)self contentView];
  [v11 addSubview:v9];

  objc_storeStrong((id *)&self->_secondaryLabel, v9);
  uint64_t v12 = +[UIColor secondaryLabelColor];
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTextColor:v12];

  -[MapsThemeMultiPartLabel setTextInset:](self->_secondaryLabel, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  v13 = +[MapsProgressButton buttonWithType:0];
  [v13 setClipsToBounds:1];
  [v13 _setContinuousCornerRadius:12.0];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v13 titleLabel];
  [v14 setAdjustsFontSizeToFitWidth:1];

  id v15 = [v13 titleLabel];
  [v15 setMinimumScaleFactor:0.474999994];

  v16 = [v13 titleLabel];
  [v16 setAllowsDefaultTighteningForTruncation:1];

  v17 = [v13 titleLabel];
  [v17 setLineBreakMode:2];

  [v13 setFillStyle:0];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"GO [Route Planning]" value:@"localized string not found" table:0];
  [v13 setTitle:v19 forState:0];

  v20 = [v13 titleLabel];
  v21 = [(id)objc_opt_class() goButtonFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v20 withFontProvider:v21];

  +[DynamicTypeWizard makeObject:self performSelector:"_updateGoButtonWidthConstraint" whenSizeCategoryChangesWithOrder:2];
  [v13 setContentEdgeInsets:0.0, 6.0, 0.0, 6.0];
  [v13 addTarget:self];
  [v13 setHidden:self->_buttonVisibility != 1];
  [v13 setAccessibilityIdentifier:@"GoButton"];
  v22 = [(RouteOverviewCell *)self contentView];
  [v22 addSubview:v13];

  objc_storeStrong((id *)&self->_goButton, v13);
  v60 = +[UIBackgroundConfiguration clearConfiguration];
  v23 = +[UIColor secondarySystemFillColor];
  [v60 setBackgroundColor:v23];

  [v60 setCornerRadius:10.0];
  v24 = +[UIButtonConfiguration plainButtonConfiguration];
  [v24 setImagePlacement:1];
  [v24 setTitleLineBreakMode:4];
  v25 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:20.0];
  v26 = +[UIImage systemImageNamed:@"chevron.forward.2" withConfiguration:v25];
  [v24 setImage:v26];

  [v24 setContentInsets:8.0, 8.0, 8.0, 8.0];
  id v27 = objc_alloc((Class)NSAttributedString);
  v28 = +[NSBundle mainBundle];
  v29 = [v28 localizedStringForKey:@"Steps [Route Planning]" value:@"localized string not found" table:0];
  NSAttributedStringKey v64 = NSFontAttributeName;
  v30 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightBold];
  v65 = v30;
  v31 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  id v32 = [v27 initWithString:v29 attributes:v31];
  [v24 setAttributedTitle:v32];

  [v24 setBackground:v60];
  objc_initWeak(&location, self);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100D9E750;
  v61[3] = &unk_1012E8CD0;
  objc_copyWeak(&v62, &location);
  v33 = +[UIAction actionWithHandler:v61];
  v34 = +[UIButton buttonWithConfiguration:v24 primaryAction:v33];

  [v34 setMaximumContentSizeCategory:UIContentSizeCategoryLarge];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v34 setHidden:self->_buttonVisibility != 3];
  [v34 setAccessibilityIdentifier:@"StepsButton"];
  v35 = [(RouteOverviewCell *)self contentView];
  [v35 addSubview:v34];

  objc_storeStrong((id *)&self->_stepsButton, v34);
  v36 = +[BackgroundColorButton buttonWithType:0];
  [v36 setClipsToBounds:1];
  v37 = [v36 layer];
  [v37 setCornerRadius:8.0];

  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RouteOverviewCell *)self _resetBookButtonTitle];
  v38 = [v36 titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v38 withFontProvider:&stru_1013214E0];

  [v36 setContentEdgeInsets:0.0, 11.0, 0.0, 11.0];
  [v36 addTarget:self action:"_didTapPrimaryActionButton:" forControlEvents:64];
  [v36 setHidden:self->_buttonVisibility != 2];
  [v36 setAccessibilityIdentifier:@"BookButton"];
  v39 = [(RouteOverviewCell *)self contentView];
  [v39 addSubview:v36];

  objc_storeStrong((id *)&self->_bookButton, v36);
  v40 = [(RouteOverviewCell *)self contentView];
  [v40 setAccessibilityIdentifier:@"RouteOverviewCellContent"];

  v41 = [(RouteOverviewCell *)self contentView];
  v42 = [(RouteOverviewCell *)self advisoriesView];
  [v41 addSubview:v42];

  v43 = [(RouteOverviewCell *)self contentView];
  v44 = [(RouteOverviewCell *)self artworkList];
  [v43 addSubview:v44];

  v45 = [(RouteOverviewCell *)self contentView];
  v46 = [(RouteOverviewCell *)self detailsButton];
  [v45 addSubview:v46];

  v47 = [(RouteOverviewCell *)self contentView];
  v48 = [(RouteOverviewCell *)self tertiaryLabel];
  [v47 addSubview:v48];

  v49 = [(RouteOverviewCell *)self contentView];
  v50 = [(RouteOverviewCell *)self routeDescriptionLabel];
  [v49 addSubview:v50];

  v51 = [(RouteOverviewCell *)self contentView];
  v52 = [(RouteOverviewCell *)self elevationGraphView];
  [v51 addSubview:v52];

  [(DirectionsElevationGraphView *)self->_elevationGraphView setHidden:1];
  [(UILabel *)self->_tertiaryLabel setHidden:1];
  [(UIButton *)self->_detailsButton setHidden:1];
  [(TransitArtworkListView *)self->_artworkList setHidden:1];
  [(RouteAdvisoriesView *)self->_advisoriesView setHidden:1];
  v53 = [(RouteOverviewCell *)self routeDescriptionLabel];
  [v53 setHidden:1];

  if (sub_1000BBB44(self) == 5)
  {
    v54 = +[UIColor systemWhiteColor];
    [(UILabel *)self->_primaryLabel setHighlightedTextColor:v54];

    v55 = +[UIColor systemWhiteColor];
    [(MapsThemeMultiPartLabel *)self->_secondaryLabel setHighlightedTextColor:v55];

    v56 = +[UIColor systemWhiteColor];
    v57 = [(RouteOverviewCell *)self routeDescriptionLabel];
    [v57 setHighlightedTextColor:v56];
  }
  [(RouteOverviewCell *)self _updateColorsForSelection];

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
}

- (UIImage)primaryLabelCompanionImage
{
  v2 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setPrimaryLabelCompanionImage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  [v5 setImage:v4];

  v6 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  objc_super v7 = v6;
  if (v4) {
    double v8 = 8.0;
  }
  else {
    double v8 = 0.0;
  }
  if (v4) {
    double v9 = 20.0;
  }
  else {
    double v9 = 0.0;
  }
  [v6 setHidden:v4 == 0];

  v10 = [(RouteOverviewCell *)self primaryCompanionImageToLabelPaddingConstraint];
  [v10 setConstant:v8];

  id v11 = [(RouteOverviewCell *)self primaryCompanionImageWidthConstraint];
  [v11 setConstant:v9];
}

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 0;
}

- (void)updateTheme
{
  v22.receiver = self;
  v22.super_class = (Class)RouteOverviewCell;
  [(MapsThemeCollectionViewListCell *)&v22 updateTheme];
  id v3 = [(RouteOverviewCell *)self theme];
  goButton = self->_goButton;
  unint64_t v5 = [v3 greenButtonBackgroundColor:0];
  [(BackgroundColorButton *)goButton setBackgroundColor:v5 forState:0];

  v6 = self->_goButton;
  objc_super v7 = [v3 greenButtonBackgroundColor:1];
  [(BackgroundColorButton *)v6 setBackgroundColor:v7 forState:1];

  double v8 = self->_goButton;
  double v9 = [v3 greenButtonTitleColor:0];
  [(MapsProgressButton *)v8 setTitleColor:v9 forState:0];

  v10 = self->_goButton;
  id v11 = [v3 greenButtonTitleColor:1];
  [(MapsProgressButton *)v10 setTitleColor:v11 forState:1];

  bookButton = self->_bookButton;
  v13 = [v3 blueButtonBackgroundColor:0];
  [(BackgroundColorButton *)bookButton setBackgroundColor:v13 forState:0];

  v14 = self->_bookButton;
  id v15 = [v3 blueButtonBackgroundColor:1];
  [(BackgroundColorButton *)v14 setBackgroundColor:v15 forState:1];

  v16 = self->_bookButton;
  v17 = [v3 blueButtonTitleColor:0];
  [(BackgroundColorButton *)v16 setTitleColor:v17 forState:0];

  v18 = self->_bookButton;
  v19 = [v3 blueButtonTitleColor:1];
  [(BackgroundColorButton *)v18 setTitleColor:v19 forState:1];

  detailsButton = self->_detailsButton;
  v21 = [v3 keyColor];
  [(UIButton *)detailsButton setTitleColor:v21 forState:0];
}

- (void)_setupConstraints
{
  id v3 = objc_alloc_init((Class)UILayoutGuide);
  [(RouteOverviewCell *)self setContentGuide:v3];

  id v4 = objc_alloc_init((Class)UILayoutGuide);
  [(RouteOverviewCell *)self setLabelTrailingToGoButtonLeadingLayoutGuide:v4];

  unint64_t v5 = [(RouteOverviewCell *)self contentView];
  v6 = [(RouteOverviewCell *)self contentGuide];
  [v5 addLayoutGuide:v6];

  objc_super v7 = [(RouteOverviewCell *)self contentView];
  double v8 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  [v7 addLayoutGuide:v8];

  double v9 = [(RouteOverviewCell *)self primaryLabel];
  LODWORD(v10) = 1148846080;
  [v9 setContentHuggingPriority:1 forAxis:v10];

  id v11 = [(RouteOverviewCell *)self primaryLabel];
  LODWORD(v12) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v12];

  v13 = [(RouteOverviewCell *)self secondaryLabel];
  LODWORD(v14) = 1148846080;
  [v13 setContentHuggingPriority:1 forAxis:v14];

  id v15 = [(RouteOverviewCell *)self secondaryLabel];
  LODWORD(v16) = 1148846080;
  [v15 setContentCompressionResistancePriority:1 forAxis:v16];

  v17 = [(RouteOverviewCell *)self routeDescriptionLabel];
  LODWORD(v18) = 1148846080;
  [v17 setContentHuggingPriority:1 forAxis:v18];

  v19 = [(RouteOverviewCell *)self routeDescriptionLabel];
  LODWORD(v20) = 1148846080;
  [v19 setContentCompressionResistancePriority:1 forAxis:v20];

  v21 = [(RouteOverviewCell *)self secondaryLabel];
  objc_super v22 = [v21 topAnchor];
  v23 = [(RouteOverviewCell *)self primaryLabel];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v26 = [(id)objc_opt_class() secondaryLabelFontProvider];
  id v27 = +[DynamicTypeWizard autoscaledConstraint:v25 constant:v26 withFontProvider:0.0];
  [(RouteOverviewCell *)self setPrimaryToSecondaryLabelConstraint:v27];

  v28 = [(RouteOverviewCell *)self goButton];
  LODWORD(v29) = 1148846080;
  [v28 setContentCompressionResistancePriority:0 forAxis:v29];

  v30 = [(RouteOverviewCell *)self goButton];
  LODWORD(v31) = 1148846080;
  [v30 setContentHuggingPriority:0 forAxis:v31];

  id v32 = [(RouteOverviewCell *)self goButton];
  v33 = [v32 trailingAnchor];
  v34 = [(RouteOverviewCell *)self contentGuide];
  v35 = [v34 trailingAnchor];
  v207 = [v33 constraintEqualToAnchor:v35];

  LODWORD(v36) = 1148829696;
  [v207 setPriority:v36];
  v37 = [(RouteOverviewCell *)self stepsButton];
  LODWORD(v38) = 1148846080;
  [v37 setContentCompressionResistancePriority:0 forAxis:v38];

  v39 = [(RouteOverviewCell *)self stepsButton];
  LODWORD(v40) = 1148846080;
  [v39 setContentHuggingPriority:0 forAxis:v40];

  v41 = [(RouteOverviewCell *)self stepsButton];
  v42 = [v41 trailingAnchor];
  v43 = [(RouteOverviewCell *)self contentGuide];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];

  v46 = v45;
  v180 = v45;
  LODWORD(v47) = 1148829696;
  [v45 setPriority:v47];
  v48 = [(RouteOverviewCell *)self bookButton];
  LODWORD(v49) = 1148846080;
  [v48 setContentCompressionResistancePriority:0 forAxis:v49];

  v50 = [(RouteOverviewCell *)self bookButton];
  LODWORD(v51) = 1148846080;
  [v50 setContentHuggingPriority:0 forAxis:v51];

  v52 = [(RouteOverviewCell *)self bookButton];
  v53 = [v52 trailingAnchor];
  v54 = [(RouteOverviewCell *)self contentGuide];
  v55 = [v54 trailingAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];

  v57 = v56;
  v179 = v56;
  LODWORD(v58) = 1148829696;
  [v56 setPriority:v58];
  v59 = [(RouteOverviewCell *)self contentView];
  v60 = [v59 heightAnchor];
  [(id)objc_opt_class() minimumHeight];
  [v60 constraintGreaterThanOrEqualToConstant:];
  v61 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v61;

  LODWORD(v63) = 1148829696;
  [(NSLayoutConstraint *)self->_minimumHeightConstraint setPriority:v63];
  [(id)objc_opt_class() horizontalContentInset];
  double v65 = v64;
  v66 = [(RouteOverviewCell *)self contentGuide];
  v67 = [v66 leadingAnchor];
  v68 = [(RouteOverviewCell *)self contentView];
  v69 = [v68 leadingAnchor];
  v199 = [v67 constraintEqualToAnchor:v69 constant:v65];

  v70 = [(RouteOverviewCell *)self contentGuide];
  v71 = [v70 trailingAnchor];
  v72 = [(RouteOverviewCell *)self contentView];
  v73 = [v72 trailingAnchor];
  v198 = [v71 constraintEqualToAnchor:v73 constant:-v65];

  v74 = [(RouteOverviewCell *)self contentGuide];
  v75 = [v74 topAnchor];
  v76 = [(RouteOverviewCell *)self primaryLabel];
  v77 = [v76 topAnchor];
  v78 = [v75 constraintEqualToAnchor:v77];
  [(RouteOverviewCell *)self setContentTopConstraint:v78];

  v79 = [(RouteOverviewCell *)self contentGuide];
  v80 = [v79 bottomAnchor];
  v81 = [(RouteOverviewCell *)self secondaryLabel];
  v82 = [v81 lastBaselineAnchor];
  v83 = [v80 constraintEqualToAnchor:v82];
  [(RouteOverviewCell *)self setContentBottomConstraint:v83];

  v84 = [(RouteOverviewCell *)self goButton];
  v85 = [v84 widthAnchor];
  v86 = [v85 constraintEqualToConstant:64.0];
  [(RouteOverviewCell *)self setGoButtonWidthConstraint:v86];

  v87 = [(RouteOverviewCell *)self goButton];
  v88 = [v87 heightAnchor];
  v89 = [v88 constraintEqualToConstant:64.0];
  [(RouteOverviewCell *)self setGoButtonHeightConstraint:v89];

  [(RouteOverviewCell *)self _updateGoButtonWidthConstraint];
  v90 = [(RouteOverviewCell *)self stepsButton];
  v91 = [v90 widthAnchor];
  v92 = [v91 constraintGreaterThanOrEqualToConstant:64.0];
  [(RouteOverviewCell *)self setStepsButtonMinWidthConstraint:v92];

  v93 = [(RouteOverviewCell *)self stepsButton];
  v94 = [v93 widthAnchor];
  v95 = [v94 constraintLessThanOrEqualToConstant:80.0];
  [(RouteOverviewCell *)self setStepsButtonMaxWidthConstraint:v95];

  v96 = [(RouteOverviewCell *)self stepsButton];
  v97 = [v96 heightAnchor];
  v98 = [v97 constraintEqualToConstant:64.0];
  [(RouteOverviewCell *)self setStepsButtonHeightConstraint:v98];

  v99 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v100 = [v99 widthAnchor];
  v101 = [v100 constraintEqualToConstant:15.0];
  [(RouteOverviewCell *)self setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:v101];

  v102 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  v103 = [v102 widthAnchor];
  v104 = [v103 constraintEqualToConstant:0.0];
  [(RouteOverviewCell *)self setPrimaryCompanionImageWidthConstraint:v104];

  v105 = [(RouteOverviewCell *)self primaryLabel];
  v106 = [v105 leadingAnchor];
  v107 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  v108 = [v107 trailingAnchor];
  v109 = [v106 constraintEqualToAnchor:v108];
  [(RouteOverviewCell *)self setPrimaryCompanionImageToLabelPaddingConstraint:v109];

  v110 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v111 = [v110 trailingAnchor];
  v112 = [(RouteOverviewCell *)self goButton];
  v113 = [v112 trailingAnchor];
  v114 = [v111 constraintEqualToAnchor:v113];
  [(RouteOverviewCell *)self setNoButtonLeadingConstraint:v114];

  v115 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v116 = [v115 trailingAnchor];
  v117 = [(RouteOverviewCell *)self goButton];
  v118 = [v117 leadingAnchor];
  v119 = [v116 constraintEqualToAnchor:v118];
  [(RouteOverviewCell *)self setGoButtonLeadingConstraint:v119];

  v120 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v121 = [v120 trailingAnchor];
  v122 = [(RouteOverviewCell *)self stepsButton];
  v123 = [v122 leadingAnchor];
  v124 = [v121 constraintEqualToAnchor:v123];
  [(RouteOverviewCell *)self setStepsButtonLeadingConstraint:v124];

  v125 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v126 = [v125 trailingAnchor];
  v127 = [(RouteOverviewCell *)self bookButton];
  v128 = [v127 leadingAnchor];
  v129 = [v126 constraintEqualToAnchor:v128];
  [(RouteOverviewCell *)self setBookButtonLeadingConstraint:v129];

  [(id)objc_opt_class() minimumVerticalPadding];
  double v131 = v130;
  v206 = [(RouteOverviewCell *)self minimumHeightConstraint];
  v208[0] = v206;
  v205 = [(RouteOverviewCell *)self contentGuide];
  v203 = [v205 topAnchor];
  v204 = [(RouteOverviewCell *)self contentView];
  v202 = [v204 topAnchor];
  v201 = [v203 constraintGreaterThanOrEqualToAnchor:v202 constant:v131];
  v208[1] = v201;
  v200 = [(RouteOverviewCell *)self contentView];
  v196 = [v200 bottomAnchor];
  v197 = [(RouteOverviewCell *)self contentGuide];
  v195 = [v197 bottomAnchor];
  v194 = [v196 constraintGreaterThanOrEqualToAnchor:v195 constant:v131];
  v208[2] = v194;
  v193 = [(RouteOverviewCell *)self contentGuide];
  v191 = [v193 centerYAnchor];
  v192 = [(RouteOverviewCell *)self contentView];
  v190 = [v192 centerYAnchor];
  v189 = [v191 constraintEqualToAnchor:v190];
  v208[3] = v189;
  v208[4] = v199;
  v208[5] = v198;
  v188 = [(RouteOverviewCell *)self contentTopConstraint];
  v208[6] = v188;
  v187 = [(RouteOverviewCell *)self contentBottomConstraint];
  v208[7] = v187;
  v186 = [(RouteOverviewCell *)self primaryCompanionImageWidthConstraint];
  v208[8] = v186;
  v185 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  v183 = [v185 leadingAnchor];
  v184 = [(RouteOverviewCell *)self contentGuide];
  v182 = [v184 leadingAnchor];
  v181 = [v183 constraintEqualToAnchor:v182];
  v208[9] = v181;
  v178 = [(RouteOverviewCell *)self primaryCompanionImageToLabelPaddingConstraint];
  v208[10] = v178;
  v177 = [(RouteOverviewCell *)self primaryLabel];
  v175 = [v177 trailingAnchor];
  v176 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v174 = [v176 leadingAnchor];
  v173 = [v175 constraintEqualToAnchor:v174];
  v208[11] = v173;
  v172 = [(RouteOverviewCell *)self primaryLabelCompanionImageView];
  v170 = [v172 centerYAnchor];
  v171 = [(RouteOverviewCell *)self primaryLabel];
  v169 = [v171 centerYAnchor];
  v168 = [v170 constraintEqualToAnchor:v169];
  v208[12] = v168;
  v167 = [(RouteOverviewCell *)self secondaryLabel];
  v165 = [v167 leadingAnchor];
  v166 = [(RouteOverviewCell *)self contentGuide];
  v164 = [v166 leadingAnchor];
  v163 = [v165 constraintEqualToAnchor:v164];
  v208[13] = v163;
  v162 = [(RouteOverviewCell *)self secondaryLabel];
  v159 = [v162 trailingAnchor];
  v160 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v158 = [v160 leadingAnchor];
  v157 = [v159 constraintEqualToAnchor:v158];
  v208[14] = v157;
  v156 = [(RouteOverviewCell *)self primaryToSecondaryLabelConstraint];
  v208[15] = v156;
  v208[16] = v207;
  v208[17] = v46;
  v208[18] = v57;
  v155 = [(RouteOverviewCell *)self goButton];
  v153 = [v155 centerYAnchor];
  v154 = [(RouteOverviewCell *)self contentGuide];
  v152 = [v154 centerYAnchor];
  v151 = [v153 constraintEqualToAnchor:v152];
  v208[19] = v151;
  v150 = [(RouteOverviewCell *)self stepsButton];
  v148 = [v150 centerYAnchor];
  v149 = [(RouteOverviewCell *)self contentGuide];
  v147 = [v149 centerYAnchor];
  v146 = [v148 constraintEqualToAnchor:v147];
  v208[20] = v146;
  v145 = [(RouteOverviewCell *)self bookButton];
  v143 = [v145 centerYAnchor];
  v144 = [(RouteOverviewCell *)self contentGuide];
  v142 = [v144 centerYAnchor];
  v132 = [v143 constraintEqualToAnchor:v142];
  v208[21] = v132;
  v133 = [(RouteOverviewCell *)self goButtonWidthConstraint];
  v208[22] = v133;
  v134 = [(RouteOverviewCell *)self labelTrailingToPrimaryButtonLeadingPaddingConstraint];
  v208[23] = v134;
  v135 = [(RouteOverviewCell *)self goButtonHeightConstraint];
  v208[24] = v135;
  v136 = [(RouteOverviewCell *)self stepsButtonMinWidthConstraint];
  v208[25] = v136;
  v137 = [(RouteOverviewCell *)self stepsButtonMaxWidthConstraint];
  v208[26] = v137;
  v138 = [(RouteOverviewCell *)self stepsButtonHeightConstraint];
  v208[27] = v138;
  v139 = [(RouteOverviewCell *)self bookButton];
  v140 = [v139 heightAnchor];
  v141 = [v140 constraintGreaterThanOrEqualToConstant:40.0];
  v208[28] = v141;
  v161 = +[NSArray arrayWithObjects:v208 count:29];

  +[NSLayoutConstraint activateConstraints:v161];
}

- (void)_doubleTap:(id)a3
{
  id v4 = [(RouteOverviewCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteOverviewCell *)self delegate];
    [v6 didTapDetailsButtonForRouteOverviewCell:self];
  }
}

- (int64_t)_resolvedGrouping
{
  if (self->_detailsButtonRotated) {
    return 2;
  }
  else {
    return [(RouteOverviewCell *)self overrideCellGrouping];
  }
}

- (MapsThemeMultiPartLabel)routeDescriptionLabel
{
  routeDescriptionLabel = self->_routeDescriptionLabel;
  if (!routeDescriptionLabel)
  {
    id v4 = objc_alloc_init(MapsThemeMultiPartLabel);
    [(MapsThemeMultiPartLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeMultiPartLabel *)v4 setNumberOfLines:0];
    [(MapsThemeMultiPartLabel *)v4 setUserInteractionEnabled:0];
    char v5 = [(id)objc_opt_class() secondaryLabelFontProvider];
    +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:v5];

    id v6 = [(RouteOverviewCell *)self contentView];
    [v6 addSubview:v4];

    objc_super v7 = self->_routeDescriptionLabel;
    self->_routeDescriptionLabel = v4;
    double v8 = v4;

    double v9 = +[UIColor secondaryLabelColor];
    [(MapsThemeMultiPartLabel *)self->_routeDescriptionLabel setTextColor:v9];

    -[MapsThemeMultiPartLabel setTextInset:](self->_routeDescriptionLabel, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(MapsThemeMultiPartLabel *)self->_routeDescriptionLabel setAccessibilityIdentifier:@"RouteDescriptionLabel"];

    routeDescriptionLabel = self->_routeDescriptionLabel;
  }

  return routeDescriptionLabel;
}

- (UILabel)tertiaryLabel
{
  tertiaryLabel = self->_tertiaryLabel;
  if (!tertiaryLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4 setNumberOfLines:0];
    LODWORD(v5) = 1148846080;
    [(UILabel *)v4 setContentHuggingPriority:1 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(UILabel *)v4 setContentCompressionResistancePriority:1 forAxis:v6];
    if ([(RouteOverviewCell *)self isSelectionBackgroundVisible])
    {
      objc_super v7 = +[UIColor systemWhiteColor];
      [(UILabel *)v4 setTextColor:v7];
    }
    if (sub_1000BBB44(self) == 5)
    {
      double v8 = +[UIColor systemWhiteColor];
      [(UILabel *)v4 setHighlightedTextColor:v8];
    }
    double v9 = self->_tertiaryLabel;
    self->_tertiaryLabel = v4;
    double v10 = v4;

    [(UILabel *)self->_tertiaryLabel setAccessibilityIdentifier:@"TertiaryLabel"];
    tertiaryLabel = self->_tertiaryLabel;
  }

  return tertiaryLabel;
}

- (TransitArtworkListView)artworkList
{
  artworkList = self->_artworkList;
  if (!artworkList)
  {
    id v4 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(TransitArtworkListView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(TransitArtworkListView *)v4 setVerticalContentHuggingPriority:v5];
    LODWORD(v6) = 1148846080;
    [(TransitArtworkListView *)v4 setVerticalContentCompressionResistancePriority:v6];
    objc_super v7 = self->_artworkList;
    self->_artworkList = v4;

    artworkList = self->_artworkList;
  }

  return artworkList;
}

- (DirectionsElevationGraphView)elevationGraphView
{
  elevationGraphView = self->_elevationGraphView;
  if (!elevationGraphView)
  {
    id v4 = [DirectionsElevationGraphConfiguration alloc];
    double v5 = [(RouteOverviewCell *)self traitCollection];
    double v6 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v4, "initWithUseType:userInterfaceIdiom:", 1, [v5 userInterfaceIdiom]);

    objc_super v7 = [[DirectionsElevationGraphView alloc] initWithConfiguration:v6];
    [(DirectionsElevationGraphView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(DirectionsElevationGraphView *)v7 setContentCompressionResistancePriority:1 forAxis:v8];
    double v9 = self->_elevationGraphView;
    self->_elevationGraphView = v7;

    elevationGraphView = self->_elevationGraphView;
  }

  return elevationGraphView;
}

- (RouteAdvisoriesView)advisoriesView
{
  advisoriesView = self->_advisoriesView;
  if (!advisoriesView)
  {
    id v4 = objc_alloc_init(RouteAdvisoriesView);
    [(RouteAdvisoriesView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1144750080;
    [(RouteAdvisoriesView *)v4 setContentHuggingPriority:1 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(RouteAdvisoriesView *)v4 setContentCompressionResistancePriority:1 forAxis:v6];
    if ([(RouteOverviewCell *)self isSelectionBackgroundVisible])
    {
      objc_super v7 = +[UIColor systemWhiteColor];
      [(RouteAdvisoriesView *)v4 setOverrideTextColor:v7 isSelected:1];
    }
    double v8 = self->_advisoriesView;
    self->_advisoriesView = v4;

    advisoriesView = self->_advisoriesView;
  }

  return advisoriesView;
}

- (UIButton)detailsButton
{
  detailsButton = self->_detailsButton;
  if (!detailsButton)
  {
    if (sub_1000BBB44(self) == 5)
    {
      id v4 = +[UIButton buttonWithType:0];
      double v5 = self->_detailsButton;
      self->_detailsButton = v4;

      if ([(RouteOverviewCell *)self isSelectionBackgroundVisible]) {
        +[UIColor systemWhiteColor];
      }
      else {
      id v15 = +[UIColor tertiaryLabelColor];
      }
      [(UIButton *)self->_detailsButton setTintColor:v15];

      double v16 = self->_detailsButton;
      v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
      double v18 = +[UIImageSymbolConfiguration configurationWithFont:v17];
      v19 = +[UIImage systemImageNamed:@"chevron.forward.circle.fill" withConfiguration:v18];
      [(UIButton *)v16 setImage:v19 forState:0];

      LODWORD(v20) = 1148846080;
      [(UIButton *)self->_detailsButton setContentHuggingPriority:0 forAxis:v20];
      LODWORD(v21) = 1148846080;
      [(UIButton *)self->_detailsButton setContentCompressionResistancePriority:0 forAxis:v21];
      [(RouteOverviewCell *)self setDetailsButtonRotated:self->_detailsButtonRotated animated:0];
    }
    else
    {
      double v6 = +[UIButton buttonWithType:1];
      objc_super v7 = self->_detailsButton;
      self->_detailsButton = v6;

      double v8 = [(UIButton *)self->_detailsButton titleLabel];
      [v8 setAdjustsFontSizeToFitWidth:1];

      double v9 = [(UIButton *)self->_detailsButton titleLabel];
      [v9 setMinimumScaleFactor:0.600000024];

      double v10 = [(UIButton *)self->_detailsButton titleLabel];
      [v10 setLineBreakMode:4];

      id v11 = [(UIButton *)self->_detailsButton titleLabel];
      +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:&stru_101321340];

      double v12 = self->_detailsButton;
      v13 = +[NSBundle mainBundle];
      double v14 = [v13 localizedStringForKey:@"Details [RouteOverviewCell]" value:@"localized string not found" table:0];
      [(UIButton *)v12 setTitle:v14 forState:0];
    }
    [(UIButton *)self->_detailsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v22) = 1148846080;
    [(UIButton *)self->_detailsButton setContentHuggingPriority:1 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIButton *)self->_detailsButton setContentCompressionResistancePriority:1 forAxis:v23];
    [(UIButton *)self->_detailsButton addTarget:self action:"_didTapDetailsButton:" forControlEvents:64];
    [(UIButton *)self->_detailsButton setAccessibilityIdentifier:@"DetailsButton"];
    detailsButton = self->_detailsButton;
  }

  return detailsButton;
}

- (void)setDetailsButtonRotated:(BOOL)a3
{
}

- (void)setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    double v6 = [(RouteOverviewCell *)self traitCollection];
    BOOL v7 = [v6 userInterfaceIdiom] == (id)5;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (self->_detailsButtonRotated != v7)
  {
    [(RouteOverviewCell *)self _setDetailsButtonRotated:v7 animated:v4];
  }
}

- (void)_setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_detailsButtonRotated = a3;
  [(RouteOverviewCell *)self _setBackgroundViewConfigurationGrouping:[(RouteOverviewCell *)self _resolvedGrouping]];
  BOOL v7 = [(RouteOverviewCell *)self traitCollection];
  id v8 = [v7 layoutDirection];

  memset(&v15, 0, sizeof(v15));
  if (v5)
  {
    CGAffineTransformMakeRotation(&v15, dbl_100F74170[v8 == 0]);
    if (!v4)
    {
LABEL_3:
      CGAffineTransform v12 = v15;
      double v9 = [(RouteOverviewCell *)self detailsButton];
      CGAffineTransform v11 = v12;
      [v9 setTransform:&v11];

      return;
    }
  }
  else
  {
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v15.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (!v4) {
      goto LABEL_3;
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  CGAffineTransform v14 = v15;
  v13[2] = sub_100DA075C;
  v13[3] = &unk_101323EB0;
  v13[4] = self;
  +[UIView animateWithDuration:v13 animations:0.1];
}

- (void)setTertiaryLabelVisible:(BOOL)a3
{
  if (self->_tertiaryLabelVisible != a3)
  {
    self->_tertiaryLabelVisible = a3;
    [(UILabel *)self->_tertiaryLabel setHidden:!a3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setRouteDescritptionLabelVisible:(BOOL)a3
{
  if (self->_routeDescritptionLabelVisible != a3)
  {
    self->_routeDescritptionLabelVisible = a3;
    [(MapsThemeMultiPartLabel *)self->_routeDescriptionLabel setHidden:!a3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setArtworkListVisible:(BOOL)a3
{
  if (self->_artworkListVisible != a3)
  {
    self->_artworkListVisible = a3;
    [(TransitArtworkListView *)self->_artworkList setHidden:!a3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setElevationGraphViewVisible:(BOOL)a3
{
  if (self->_elevationGraphViewVisible != a3)
  {
    self->_elevationGraphViewVisible = a3;
    [(DirectionsElevationGraphView *)self->_elevationGraphView setHidden:!a3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setAdvisoriesViewVisible:(BOOL)a3
{
  if (self->_advisoriesViewVisible != a3)
  {
    self->_advisoriesViewVisible = a3;
    [(RouteAdvisoriesView *)self->_advisoriesView setHidden:!a3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setButtonVisibility:(unint64_t)a3
{
  BOOL v5 = [(RouteOverviewCell *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a3;
  }
  if (self->_buttonVisibility != v7)
  {
    self->_buttonVisibility = v7;
    [(RouteOverviewCell *)self _updateButtonVisibility];
  }
}

- (void)_updateButtonVisibility
{
  switch(self->_buttonVisibility)
  {
    case 0uLL:
      id v3 = [(RouteOverviewCell *)self goButton];
      [v3 setHidden:1];

      BOOL v4 = [(RouteOverviewCell *)self stepsButton];
      [v4 setHidden:1];

      BOOL v5 = [(RouteOverviewCell *)self bookButton];
      [v5 setHidden:1];

      id v6 = [(RouteOverviewCell *)self noButtonLeadingConstraint];
      [v6 setActive:1];

      unint64_t v7 = [(RouteOverviewCell *)self goButtonLeadingConstraint];
      [v7 setActive:0];

      id v8 = [(RouteOverviewCell *)self stepsButtonLeadingConstraint];
      [v8 setActive:0];

      double v9 = [(RouteOverviewCell *)self bookButtonLeadingConstraint];
      [v9 setActive:0];

      long long v10 = [(RouteOverviewCell *)self goButtonWidthConstraint];
      [v10 setConstant:0.0];

      CGAffineTransform v11 = [(RouteOverviewCell *)self stepsButtonMinWidthConstraint];
      [v11 setConstant:0.0];

      CGAffineTransform v12 = [(RouteOverviewCell *)self stepsButtonMaxWidthConstraint];
      [v12 setConstant:0.0];

      v13 = [(RouteOverviewCell *)self labelTrailingToPrimaryButtonLeadingPaddingConstraint];
      id v37 = v13;
      uint64_t v14 = 0;
      goto LABEL_7;
    case 1uLL:
      CGAffineTransform v15 = [(RouteOverviewCell *)self goButton];
      [v15 setHidden:0];

      double v16 = [(RouteOverviewCell *)self stepsButton];
      [v16 setHidden:1];

      v17 = [(RouteOverviewCell *)self bookButton];
      [v17 setHidden:1];

      double v18 = [(RouteOverviewCell *)self noButtonLeadingConstraint];
      [v18 setActive:0];

      v19 = [(RouteOverviewCell *)self goButtonLeadingConstraint];
      [v19 setActive:1];

      double v20 = [(RouteOverviewCell *)self stepsButtonLeadingConstraint];
      [v20 setActive:0];

      double v21 = [(RouteOverviewCell *)self bookButtonLeadingConstraint];
      [v21 setActive:0];

      [(RouteOverviewCell *)self _updateGoButtonWidthConstraint];
      goto LABEL_6;
    case 2uLL:
      double v22 = [(RouteOverviewCell *)self noButtonLeadingConstraint];
      [v22 setActive:0];

      double v23 = [(RouteOverviewCell *)self goButtonLeadingConstraint];
      [v23 setActive:0];

      v24 = [(RouteOverviewCell *)self stepsButtonLeadingConstraint];
      [v24 setActive:0];

      v25 = [(RouteOverviewCell *)self bookButtonLeadingConstraint];
      [v25 setActive:1];

      v26 = [(RouteOverviewCell *)self goButtonWidthConstraint];
      [v26 setConstant:0.0];

      id v27 = [(RouteOverviewCell *)self goButton];
      [v27 setHidden:1];

      v28 = [(RouteOverviewCell *)self stepsButton];
      [v28 setHidden:1];

      double v29 = [(RouteOverviewCell *)self bookButton];
      [v29 setHidden:0];

      goto LABEL_6;
    case 3uLL:
      v30 = [(RouteOverviewCell *)self goButton];
      [v30 setHidden:1];

      double v31 = [(RouteOverviewCell *)self stepsButton];
      [v31 setHidden:0];

      id v32 = [(RouteOverviewCell *)self bookButton];
      [v32 setHidden:1];

      v33 = [(RouteOverviewCell *)self noButtonLeadingConstraint];
      [v33 setActive:0];

      v34 = [(RouteOverviewCell *)self goButtonLeadingConstraint];
      [v34 setActive:0];

      v35 = [(RouteOverviewCell *)self stepsButtonLeadingConstraint];
      [v35 setActive:1];

      double v36 = [(RouteOverviewCell *)self bookButtonLeadingConstraint];
      [v36 setActive:0];

      [(RouteOverviewCell *)self _updateGoButtonWidthConstraint];
      [(RouteOverviewCell *)self _updateStepsButtonWidthConstraint];
LABEL_6:
      v13 = [(RouteOverviewCell *)self labelTrailingToPrimaryButtonLeadingPaddingConstraint];
      id v37 = v13;
      uint64_t v14 = 1;
LABEL_7:
      [v13 setActive:v14];

      break;
    default:
      return;
  }
}

- (void)setBookButtonTitle:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    BOOL v4 = [(RouteOverviewCell *)self bookButton];
    BOOL v5 = [v6 localizedUppercaseString];
    [v4 setTitle:v5 forState:0];
  }
  else
  {
    [(RouteOverviewCell *)self _resetBookButtonTitle];
  }
}

- (double)goButtonProgress
{
  v2 = [(RouteOverviewCell *)self goButton];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (BOOL)isGoButtonProgressVisible
{
  v2 = [(RouteOverviewCell *)self goButton];
  char v3 = [v2 progressBarHidden] ^ 1;

  return v3;
}

- (void)setGoButtonProgress:(double)a3
{
  id v4 = [(RouteOverviewCell *)self goButton];
  [v4 setProgress:a3];
}

- (void)setGoButtonProgressVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(RouteOverviewCell *)self goButton];
  [v4 setProgressBarHidden:v3];
}

- (void)_reloadElevationChart
{
  [(DirectionsElevationGraphView *)self->_elevationGraphView removeFromSuperview];
  elevationGraphView = self->_elevationGraphView;
  self->_elevationGraphView = 0;

  id v4 = [(RouteOverviewCell *)self contentView];
  BOOL v5 = [(RouteOverviewCell *)self elevationGraphView];
  [v4 addSubview:v5];

  BOOL v6 = !self->_elevationGraphViewVisible;
  unint64_t v7 = [(RouteOverviewCell *)self elevationGraphView];
  [v7 setHidden:v6];

  [(RouteOverviewCell *)self setNeedsUpdateConstraints];
}

- (void)_resetBookButtonTitle
{
  id v5 = [(RouteOverviewCell *)self bookButton];
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Book [Route Planning]" value:@"localized string not found" table:0];
  id v4 = [v3 localizedUppercaseString];
  [v5 setTitle:v4 forState:0];
}

- (void)_updateGoButtonWidthConstraint
{
  if (self->_buttonVisibility == 1)
  {
    if (qword_101611200 != -1) {
      dispatch_once(&qword_101611200, &stru_101323ED0);
    }
    BOOL v3 = [(MapsProgressButton *)self->_goButton titleLabel];
    id v4 = [v3 text];

    id v5 = [(id)objc_opt_class() goButtonFontProvider];
    BOOL v6 = v5[2]();

    [v6 pointSize];
    id v8 = +[NSString stringWithFormat:@"%@%f", v4, v7];
    double v9 = [(id)qword_1016111F8 objectForKey:v8];
    long long v10 = v9;
    if (v9)
    {
      [v9 floatValue];
      double v12 = v11;
    }
    else
    {
      NSAttributedStringKey v21 = NSFontAttributeName;
      v13 = sub_100CE0D04(&stru_101321480);
      double v22 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [v4 sizeWithAttributes:v14];
      double v16 = v15;

      double v17 = v16 + 12.0;
      if (v16 + 12.0 > 72.0) {
        double v17 = 72.0;
      }
      if (v17 >= 64.0) {
        double v12 = v17;
      }
      else {
        double v12 = 64.0;
      }
      double v18 = (void *)qword_1016111F8;
      v19 = +[NSNumber numberWithDouble:v12];
      [v18 setObject:v19 forKey:v8];
    }
    double v20 = [(RouteOverviewCell *)self goButtonWidthConstraint];
    [v20 setConstant:v12];
  }
}

- (void)_updateStepsButtonWidthConstraint
{
  if (self->_buttonVisibility == 3)
  {
    [(NSLayoutConstraint *)self->_stepsButtonMinWidthConstraint setConstant:64.0];
    stepsButtonMaxWidthConstraint = self->_stepsButtonMaxWidthConstraint;
    [(NSLayoutConstraint *)stepsButtonMaxWidthConstraint setConstant:80.0];
  }
}

- (void)setDetailsButtonVisible:(BOOL)a3
{
  if (self->_detailsButtonVisible != a3)
  {
    BOOL v3 = a3;
    self->_detailsButtonVisible = a3;
    -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
    [(UIButton *)self->_detailsButton setHidden:!v3];
    [(RouteOverviewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setHasSelectedStep:(BOOL)a3
{
  if (self->_hasSelectedStep != a3)
  {
    self->_hasSelectedStep = a3;
    [(RouteOverviewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setSelectionBackgroundVisible:(BOOL)a3
{
  if (self->_selectionBackgroundVisible != a3)
  {
    self->_selectionBackgroundVisible = a3;
    [(RouteOverviewCell *)self _updateColorsForSelection];
    [(RouteOverviewCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)setOverrideCellGrouping:(int64_t)a3
{
  if (self->_overrideCellGrouping != a3)
  {
    self->_overrideCellGrouping = a3;
    int64_t v4 = [(RouteOverviewCell *)self _resolvedGrouping];
    [(RouteOverviewCell *)self _setBackgroundViewConfigurationGrouping:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RouteOverviewCell;
  [(RouteOverviewCell *)&v4 setHighlighted:a3];
  [(RouteOverviewCell *)self _updateColorsForSelection];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteOverviewCell;
  [(RouteOverviewCell *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  uint64_t v7 = [v6 previouslyFocusedView];
  if (v7 == self
    || ([v6 nextFocusedView], id v8 = (RouteOverviewCell *)objc_claimAutoreleasedReturnValue(), v8 == self))
  {
    double v9 = [v6 previouslyFocusedView];
    long long v10 = [v6 nextFocusedView];

    if (v7 != self) {
    if (v9 != v10)
    }
      [(RouteOverviewCell *)self _updateColorsForSelection];
  }
  else
  {
  }
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"_didTapPrimaryActionButton:"];
  id v5 = v2;
  BOOL v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  if ([(RouteOverviewCell *)self isArtworkListVisible])
  {
    [(RouteOverviewCell *)self bounds];
    -[RouteOverviewCell setBounds:](self, "setBounds:");
  }
  [(RouteOverviewCell *)self layoutIfNeeded];
  v14.receiver = self;
  v14.super_class = (Class)RouteOverviewCell;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[RouteOverviewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCell;
  [(RouteOverviewCell *)&v3 updateConstraints];
  [(RouteOverviewCell *)self _updateConstraintsForArtworkListVisible:[(RouteOverviewCell *)self isArtworkListVisible] elevationGraphViewVisible:[(RouteOverviewCell *)self isElevationGraphViewVisible] advisoriesViewVisible:[(RouteOverviewCell *)self isAdvisoriesViewVisible] tertiaryLabelVisible:[(RouteOverviewCell *)self isTertiaryLabelVisible] detailsButtonVisible:[(RouteOverviewCell *)self isDetailsButtonVisible]];
}

- (void)_updateConstraintsForArtworkListVisible:(BOOL)a3 elevationGraphViewVisible:(BOOL)a4 advisoriesViewVisible:(BOOL)a5 tertiaryLabelVisible:(BOOL)a6 detailsButtonVisible:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v162 = a4;
  BOOL v163 = a5;
  BOOL v9 = a3;
  double v11 = [(RouteOverviewCell *)self tertiaryLabelConstraints];
  +[NSLayoutConstraint deactivateConstraints:v11];

  double v12 = [(RouteOverviewCell *)self artworkListConstraints];
  +[NSLayoutConstraint deactivateConstraints:v12];

  double v13 = [(RouteOverviewCell *)self elevationGraphViewConstraints];
  +[NSLayoutConstraint deactivateConstraints:v13];

  objc_super v14 = [(RouteOverviewCell *)self detailsButtonConstraints];
  +[NSLayoutConstraint deactivateConstraints:v14];

  double v15 = [(RouteOverviewCell *)self advisoriesViewConstraints];
  +[NSLayoutConstraint deactivateConstraints:v15];

  double v16 = [(RouteOverviewCell *)self routeDescriptionLabelConstraints];
  +[NSLayoutConstraint deactivateConstraints:v16];

  double v17 = [(RouteOverviewCell *)self contentBottomConstraint];
  [v17 setActive:0];

  id v164 = +[NSMutableArray array];
  uint64_t v18 = sub_1000BBB44(self);
  v19 = [(RouteOverviewCell *)self secondaryLabel];
  double v20 = v19;
  if (v18 == 5) {
    [v19 lastBaselineAnchor];
  }
  else {
  NSAttributedStringKey v21 = [v19 bottomAnchor];
  }

  BOOL v161 = v9;
  if ([(RouteOverviewCell *)self isRouteDescritptionLabelVisible])
  {
    BOOL v22 = v7;
    if (sub_1000BBB44(self) == 5) {
      double v23 = 5.0;
    }
    else {
      double v23 = 0.0;
    }
    v24 = +[NSMutableArray array];
    v25 = [(RouteOverviewCell *)self routeDescriptionLabel];
    v26 = [v25 leadingAnchor];
    id v27 = [(RouteOverviewCell *)self contentGuide];
    v28 = [v27 leadingAnchor];
    double v29 = [v26 constraintEqualToAnchor:v28];
    [v24 addObject:v29];

    v30 = [(RouteOverviewCell *)self routeDescriptionLabel];
    double v31 = [v30 trailingAnchor];
    id v32 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
    v33 = [v32 leadingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    [v24 addObject:v34];

    v35 = [(RouteOverviewCell *)self routeDescriptionLabel];
    double v36 = [v35 topAnchor];
    id v37 = [v36 constraintEqualToAnchor:v21];
    double v38 = +[DynamicTypeWizard autoscaledConstraint:v37 constant:&stru_101321340 withFontProvider:v23];
    [v24 addObject:v38];

    uint64_t v39 = sub_1000BBB44(self);
    double v40 = [(RouteOverviewCell *)self routeDescriptionLabel];
    v41 = v40;
    if (v39 == 5) {
      [v40 lastBaselineAnchor];
    }
    else {
    uint64_t v42 = [v40 bottomAnchor];
    }

    [(RouteOverviewCell *)self setRouteDescriptionLabelConstraints:v24];
    v43 = [(RouteOverviewCell *)self routeDescriptionLabelConstraints];
    [v164 addObjectsFromArray:v43];

    NSAttributedStringKey v21 = (void *)v42;
    BOOL v7 = v22;
    BOOL v9 = v161;
    if (v8)
    {
LABEL_15:
      v44 = +[NSMutableArray array];
      v45 = [(RouteOverviewCell *)self tertiaryLabel];
      v46 = [v45 leadingAnchor];
      double v47 = [(RouteOverviewCell *)self contentGuide];
      v48 = [v47 leadingAnchor];
      [v46 constraintEqualToAnchor:v48];
      v50 = BOOL v49 = v7;
      [v44 addObject:v50];

      double v51 = [(RouteOverviewCell *)self tertiaryLabel];
      v52 = [v51 trailingAnchor];
      v53 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
      v54 = [v53 leadingAnchor];
      v55 = [v52 constraintEqualToAnchor:v54];
      [v44 addObject:v55];

      BOOL v7 = v49;
      v56 = [(RouteOverviewCell *)self tertiaryLabel];
      v57 = [v56 topAnchor];
      double v58 = [v57 constraintEqualToAnchor:v21];
      v59 = +[DynamicTypeWizard autoscaledConstraint:v58 constant:&stru_101321340 withFontProvider:0.0];
      [v44 addObject:v59];

      v60 = [(RouteOverviewCell *)self tertiaryLabel];
      uint64_t v61 = [v60 bottomAnchor];

      [(RouteOverviewCell *)self setTertiaryLabelConstraints:v44];
      id v62 = [(RouteOverviewCell *)self tertiaryLabelConstraints];
      [v164 addObjectsFromArray:v62];

      NSAttributedStringKey v21 = (void *)v61;
      if (v161) {
        goto LABEL_16;
      }
LABEL_12:
      [(RouteOverviewCell *)self setArtworkListConstraints:0];
      goto LABEL_17;
    }
  }
  else
  {
    [(RouteOverviewCell *)self setRouteDescriptionLabelConstraints:0];
    if (v8) {
      goto LABEL_15;
    }
  }
  [(RouteOverviewCell *)self setTertiaryLabelConstraints:0];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_16:
  double v63 = +[NSMutableArray array];
  double v64 = [(RouteOverviewCell *)self artworkList];
  double v65 = [v64 leadingAnchor];
  v66 = [(RouteOverviewCell *)self contentGuide];
  v67 = [v66 leadingAnchor];
  v68 = [v65 constraintEqualToAnchor:v67];
  [v63 addObject:v68];

  v69 = [(RouteOverviewCell *)self artworkList];
  v70 = [v69 trailingAnchor];
  v71 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
  v72 = [v71 leadingAnchor];
  v73 = [v70 constraintEqualToAnchor:v72];
  [v63 addObject:v73];

  v74 = [(RouteOverviewCell *)self artworkList];
  v75 = [v74 topAnchor];
  v76 = [v75 constraintEqualToAnchor:v21 constant:10.0];
  [v63 addObject:v76];

  v77 = [(RouteOverviewCell *)self artworkList];
  uint64_t v78 = [v77 bottomAnchor];

  [(RouteOverviewCell *)self setArtworkListConstraints:v63];
  v79 = [(RouteOverviewCell *)self artworkListConstraints];
  [v164 addObjectsFromArray:v79];

  NSAttributedStringKey v21 = (void *)v78;
LABEL_17:
  if (v162)
  {
    v80 = +[NSMutableArray array];
    v81 = [(RouteOverviewCell *)self elevationGraphView];
    v82 = [v81 leadingAnchor];
    v83 = [(RouteOverviewCell *)self contentGuide];
    v84 = [v83 leadingAnchor];
    v85 = [v82 constraintEqualToAnchor:v84];
    [v80 addObject:v85];

    uint64_t v86 = sub_1000BBB44(self);
    v87 = [(RouteOverviewCell *)self elevationGraphView];
    v88 = v87;
    if (v86 == 5)
    {
      v89 = [v87 trailingAnchor];
      v90 = [(RouteOverviewCell *)self contentGuide];
      v91 = [v90 trailingAnchor];
      v92 = [v89 constraintEqualToAnchor:v91];
      [v80 addObject:v92];
    }
    else
    {
      v89 = [v87 widthAnchor];
      v90 = [v89 constraintEqualToConstant:80.0];
      [v80 addObject:v90];
    }

    v93 = [(RouteOverviewCell *)self elevationGraphView];
    v94 = [v93 topAnchor];
    v95 = [v94 constraintEqualToAnchor:v21 constant:10.0];
    [v80 addObject:v95];

    v96 = [(RouteOverviewCell *)self elevationGraphView];
    v97 = [v96 heightAnchor];
    v98 = [v97 constraintEqualToConstant:25.0];
    [v80 addObject:v98];

    v99 = [(RouteOverviewCell *)self elevationGraphView];
    uint64_t v100 = [v99 bottomAnchor];

    [(RouteOverviewCell *)self setElevationGraphViewConstraints:v80];
    v101 = [(RouteOverviewCell *)self elevationGraphViewConstraints];
    [v164 addObjectsFromArray:v101];

    NSAttributedStringKey v21 = (void *)v100;
  }
  else
  {
    [(RouteOverviewCell *)self setElevationGraphViewConstraints:0];
  }
  if (v163)
  {
    v102 = +[NSMutableArray array];
    v103 = [(RouteOverviewCell *)self advisoriesView];
    v104 = [v103 leadingAnchor];
    v105 = [(RouteOverviewCell *)self contentGuide];
    v106 = [v105 leadingAnchor];
    v107 = [v104 constraintEqualToAnchor:v106];
    [v102 addObject:v107];

    v108 = [(RouteOverviewCell *)self traitCollection];
    id v109 = [v108 userInterfaceIdiom];

    v110 = [(RouteOverviewCell *)self advisoriesView];
    v111 = [v110 trailingAnchor];
    if (v109 == (id)5)
    {
      v112 = [(RouteOverviewCell *)self contentGuide];
      [v112 trailingAnchor];
    }
    else
    {
      v112 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
      [v112 leadingAnchor];
    v113 = };
    v114 = [v111 constraintEqualToAnchor:v113];
    [v102 addObject:v114];

    if (sub_1000BBB44(self) == 5) {
      double v115 = 10.0;
    }
    else {
      double v115 = 6.0;
    }
    v116 = [(RouteOverviewCell *)self advisoriesView];
    v117 = [v116 topAnchor];
    v118 = [v117 constraintEqualToAnchor:v21 constant:v115];
    [v102 addObject:v118];

    v119 = [(RouteOverviewCell *)self advisoriesView];
    uint64_t v120 = [v119 bottomAnchor];

    [(RouteOverviewCell *)self setAdvisoriesViewConstraints:v102];
    v121 = [(RouteOverviewCell *)self advisoriesViewConstraints];
    [v164 addObjectsFromArray:v121];

    NSAttributedStringKey v21 = (void *)v120;
    if (v7) {
      goto LABEL_33;
    }
  }
  else
  {
    [(RouteOverviewCell *)self setAdvisoriesViewConstraints:0];
    if (v7)
    {
LABEL_33:
      v122 = +[NSMutableArray array];
      v123 = [(RouteOverviewCell *)self traitCollection];
      id v124 = [v123 userInterfaceIdiom];

      v125 = [(RouteOverviewCell *)self detailsButton];
      v126 = [v125 leadingAnchor];
      if (v124 == (id)5)
      {
        v127 = [(RouteOverviewCell *)self labelTrailingToGoButtonLeadingLayoutGuide];
        v128 = [v127 leadingAnchor];
        v129 = [v126 constraintGreaterThanOrEqualToAnchor:v128];
        [v122 addObject:v129];

        double v130 = [(RouteOverviewCell *)self detailsButton];
        double v131 = [v130 trailingAnchor];
        v132 = [(RouteOverviewCell *)self contentGuide];
        v133 = [v132 trailingAnchor];
        v134 = [v131 constraintEqualToAnchor:v133];
        [v122 addObject:v134];

        v135 = [(RouteOverviewCell *)self detailsButton];
        v136 = [v135 firstBaselineAnchor];
        v137 = [(UILabel *)self->_primaryLabel firstBaselineAnchor];
        v138 = [v136 constraintEqualToAnchor:v137];
        [v122 addObject:v138];
      }
      else
      {
        v139 = [(RouteOverviewCell *)self contentGuide];
        v140 = [v139 leadingAnchor];
        v141 = [v126 constraintEqualToAnchor:v140];
        [v122 addObject:v141];

        v142 = [(RouteOverviewCell *)self detailsButton];
        v143 = [v142 trailingAnchor];
        v144 = [(RouteOverviewCell *)self contentGuide];
        v145 = [v144 trailingAnchor];
        v146 = [v143 constraintLessThanOrEqualToAnchor:v145];
        [v122 addObject:v146];

        v147 = [(RouteOverviewCell *)self detailsButton];
        v148 = [v147 topAnchor];
        v149 = [(RouteOverviewCell *)self goButton];
        v150 = [v149 bottomAnchor];
        v151 = [v148 constraintGreaterThanOrEqualToAnchor:v150];
        [v122 addObject:v151];

        v152 = [(RouteOverviewCell *)self detailsButton];
        v153 = [v152 firstBaselineAnchor];
        v154 = [v153 constraintGreaterThanOrEqualToAnchor:v21];
        v155 = +[DynamicTypeWizard autoscaledConstraint:v154 constant:&stru_101321340 withFontProvider:32.0];
        [v122 addObject:v155];

        v135 = [(RouteOverviewCell *)self detailsButton];
        [v135 lastBaselineAnchor];
        NSAttributedStringKey v21 = v136 = v21;
      }

      [(RouteOverviewCell *)self setDetailsButtonConstraints:v122];
      v156 = [(RouteOverviewCell *)self detailsButtonConstraints];
      [v164 addObjectsFromArray:v156];

      goto LABEL_37;
    }
  }
  [(RouteOverviewCell *)self setDetailsButtonConstraints:0];
LABEL_37:
  v157 = [(RouteOverviewCell *)self contentGuide];
  v158 = [v157 bottomAnchor];
  v159 = [v158 constraintEqualToAnchor:v21];
  [(RouteOverviewCell *)self setContentBottomConstraint:v159];

  v160 = [(RouteOverviewCell *)self contentBottomConstraint];
  [v164 addObject:v160];

  +[NSLayoutConstraint activateConstraints:v164];
}

- (void)_updateColorsForSelection
{
  if (sub_1000BBB44(self) == 5
    && ([(RouteOverviewCell *)self isSelectionBackgroundVisible]
     || ([(RouteOverviewCell *)self isHighlighted] & 1) != 0
     || [(RouteOverviewCell *)self isFocused]))
  {
    objc_super v3 = +[UIColor systemWhiteColor];
    [(UIButton *)self->_detailsButton setTintColor:v3];

    objc_super v4 = +[UIColor systemWhiteColor];
    [(UILabel *)self->_primaryLabel setTextColor:v4];

    id v5 = +[UIColor systemWhiteColor];
    [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTextColor:v5];

    id v6 = +[UIColor systemWhiteColor];
    BOOL v7 = [(RouteOverviewCell *)self routeDescriptionLabel];
    [v7 setTextColor:v6];

    BOOL v8 = +[UIColor systemWhiteColor];
    [(UILabel *)self->_tertiaryLabel setTextColor:v8];

    advisoriesView = self->_advisoriesView;
    double v10 = +[UIColor systemWhiteColor];
    [(RouteAdvisoriesView *)advisoriesView setOverrideTextColor:v10 isSelected:1];

    double v11 = +[UIColor systemWhiteColor];
    [(TransitArtworkListView *)self->_artworkList setOverrideTintColor:v11];

    elevationGraphView = self->_elevationGraphView;
    [(DirectionsElevationGraphView *)elevationGraphView setSelected:1];
  }
  else
  {
    if (sub_1000BBB44(self) == 5)
    {
      double v13 = +[UIColor tertiaryLabelColor];
      [(UIButton *)self->_detailsButton setTintColor:v13];

      [(TransitArtworkListView *)self->_artworkList setOverrideTintColor:0];
      [(DirectionsElevationGraphView *)self->_elevationGraphView setSelected:0];
    }
    objc_super v14 = +[UIColor labelColor];
    [(UILabel *)self->_primaryLabel setTextColor:v14];

    double v15 = +[UIColor secondaryLabelColor];
    [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTextColor:v15];

    double v16 = +[UIColor secondaryLabelColor];
    [(MapsThemeMultiPartLabel *)self->_routeDescriptionLabel setTextColor:v16];

    double v17 = +[UIColor labelColor];
    [(UILabel *)self->_tertiaryLabel setTextColor:v17];

    uint64_t v18 = self->_advisoriesView;
    [(RouteAdvisoriesView *)v18 setOverrideTextColor:0 isSelected:0];
  }
}

- (void)_didTapPrimaryActionButton:(id)a3
{
  id v4 = [(RouteOverviewCell *)self delegate];
  [v4 didTapGoButtonForRouteOverviewCell:self];
}

- (void)_didTapDetailsButton:(id)a3
{
  id v4 = [(RouteOverviewCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteOverviewCell *)self delegate];
    [v6 didTapDetailsButtonForRouteOverviewCell:self];
  }
}

- (void)_didTapAutomaticSharingButton
{
  objc_super v3 = [(RouteOverviewCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RouteOverviewCell *)self delegate];
    [v5 didTapAutomaticSharingButtonForRouteOverviewCell:self];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCell;
  [(RouteOverviewCell *)&v3 prepareForReuse];
  [(RouteOverviewCell *)self setSelectionBackgroundVisible:0];
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (MapsThemeMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (BOOL)isRouteDescritptionLabelVisible
{
  return self->_routeDescritptionLabelVisible;
}

- (BOOL)isTertiaryLabelVisible
{
  return self->_tertiaryLabelVisible;
}

- (BOOL)isArtworkListVisible
{
  return self->_artworkListVisible;
}

- (BOOL)isElevationGraphViewVisible
{
  return self->_elevationGraphViewVisible;
}

- (BOOL)isDetailsButtonVisible
{
  return self->_detailsButtonVisible;
}

- (BOOL)isSelectionBackgroundVisible
{
  return self->_selectionBackgroundVisible;
}

- (unint64_t)buttonVisibility
{
  return self->_buttonVisibility;
}

- (BOOL)isAdvisoriesViewVisible
{
  return self->_advisoriesViewVisible;
}

- (int64_t)overrideCellGrouping
{
  return self->_overrideCellGrouping;
}

- (BOOL)detailsButtonRotated
{
  return self->_detailsButtonRotated;
}

- (RouteOverviewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteOverviewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasSelectedStep
{
  return self->_hasSelectedStep;
}

- (MapsProgressButton)goButton
{
  return self->_goButton;
}

- (UIButton)stepsButton
{
  return self->_stepsButton;
}

- (BackgroundColorButton)bookButton
{
  return self->_bookButton;
}

- (UIImageView)primaryLabelCompanionImageView
{
  return self->_primaryLabelCompanionImageView;
}

- (void)setDetailsButton:(id)a3
{
}

- (UILayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (void)setContentGuide:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)goButtonWidthConstraint
{
  return self->_goButtonWidthConstraint;
}

- (void)setGoButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)goButtonHeightConstraint
{
  return self->_goButtonHeightConstraint;
}

- (void)setGoButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)stepsButtonMinWidthConstraint
{
  return self->_stepsButtonMinWidthConstraint;
}

- (void)setStepsButtonMinWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)stepsButtonMaxWidthConstraint
{
  return self->_stepsButtonMaxWidthConstraint;
}

- (void)setStepsButtonMaxWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)stepsButtonHeightConstraint
{
  return self->_stepsButtonHeightConstraint;
}

- (void)setStepsButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelTrailingToPrimaryButtonLeadingPaddingConstraint
{
  return self->_labelTrailingToPrimaryButtonLeadingPaddingConstraint;
}

- (void)setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryToSecondaryLabelConstraint
{
  return self->_primaryToSecondaryLabelConstraint;
}

- (void)setPrimaryToSecondaryLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryCompanionImageToLabelPaddingConstraint
{
  return self->_primaryCompanionImageToLabelPaddingConstraint;
}

- (void)setPrimaryCompanionImageToLabelPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryCompanionImageWidthConstraint
{
  return self->_primaryCompanionImageWidthConstraint;
}

- (void)setPrimaryCompanionImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)noButtonLeadingConstraint
{
  return self->_noButtonLeadingConstraint;
}

- (void)setNoButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)goButtonLeadingConstraint
{
  return self->_goButtonLeadingConstraint;
}

- (void)setGoButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stepsButtonLeadingConstraint
{
  return self->_stepsButtonLeadingConstraint;
}

- (void)setStepsButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bookButtonLeadingConstraint
{
  return self->_bookButtonLeadingConstraint;
}

- (void)setBookButtonLeadingConstraint:(id)a3
{
}

- (NSArray)tertiaryLabelConstraints
{
  return self->_tertiaryLabelConstraints;
}

- (void)setTertiaryLabelConstraints:(id)a3
{
}

- (NSArray)routeDescriptionLabelConstraints
{
  return self->_routeDescriptionLabelConstraints;
}

- (void)setRouteDescriptionLabelConstraints:(id)a3
{
}

- (NSArray)artworkListConstraints
{
  return self->_artworkListConstraints;
}

- (void)setArtworkListConstraints:(id)a3
{
}

- (NSArray)elevationGraphViewConstraints
{
  return self->_elevationGraphViewConstraints;
}

- (void)setElevationGraphViewConstraints:(id)a3
{
}

- (NSArray)advisoriesViewConstraints
{
  return self->_advisoriesViewConstraints;
}

- (void)setAdvisoriesViewConstraints:(id)a3
{
}

- (NSArray)detailsButtonConstraints
{
  return self->_detailsButtonConstraints;
}

- (void)setDetailsButtonConstraints:(id)a3
{
}

- (UILayoutGuide)labelTrailingToGoButtonLeadingLayoutGuide
{
  return self->_labelTrailingToGoButtonLeadingLayoutGuide;
}

- (void)setLabelTrailingToGoButtonLeadingLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelTrailingToGoButtonLeadingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailsButtonConstraints, 0);
  objc_storeStrong((id *)&self->_advisoriesViewConstraints, 0);
  objc_storeStrong((id *)&self->_elevationGraphViewConstraints, 0);
  objc_storeStrong((id *)&self->_artworkListConstraints, 0);
  objc_storeStrong((id *)&self->_routeDescriptionLabelConstraints, 0);
  objc_storeStrong((id *)&self->_tertiaryLabelConstraints, 0);
  objc_storeStrong((id *)&self->_bookButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_noButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryCompanionImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_primaryCompanionImageToLabelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingToPrimaryButtonLeadingPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonMaxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonMinWidthConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_primaryLabelCompanionImageView, 0);
  objc_storeStrong((id *)&self->_bookButton, 0);
  objc_storeStrong((id *)&self->_stepsButton, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_routeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_advisoriesView, 0);
  objc_storeStrong((id *)&self->_artworkList, 0);
  objc_storeStrong((id *)&self->_elevationGraphView, 0);

  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
}

@end