@interface OfflineRegionSelectorViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)downloadable;
- (CGSize)preferredContentSize;
- (MUStackView)contentStackView;
- (NSArray)autoUpdateDisclaimerLabelHiddenConstraints;
- (NSArray)autoUpdateDisclaimerLabelVisibleConstraints;
- (OfflineRegionSelectorActionCoordination)delegate;
- (UIButton)cancelButton;
- (UIButton)downloadButton;
- (UILabel)autoUpdateDisclaimerLabel;
- (UILabel)sizeLabel;
- (UIStackView)buttonStackView;
- (double)heightForLayout:(unint64_t)a3;
- (id)_autoUpdateDisclaimerText;
- (int64_t)_preferredButtonStackOrientation;
- (unint64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addButtonsToStackView;
- (void)_cancel;
- (void)_download;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateForCurrentState;
- (void)_updateLayoutForAX;
- (void)setAutoUpdateDisclaimerLabel:(id)a3;
- (void)setAutoUpdateDisclaimerLabelHiddenConstraints:(id)a3;
- (void)setAutoUpdateDisclaimerLabelVisibleConstraints:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)setEstimatedDiskSizeLabel:(int64_t)a3;
- (void)setSizeLabel:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation OfflineRegionSelectorViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)OfflineRegionSelectorViewController;
  [(ContaineeViewController *)&v6 viewDidLoad];
  [(OfflineRegionSelectorViewController *)self _setupViews];
  [(OfflineRegionSelectorViewController *)self _setupConstraints];
  v3 = self;
  v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [(OfflineRegionSelectorViewController *)self registerForTraitChanges:v4 withAction:"_updateLayoutForAX"];
}

- (void)_setupViews
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  id v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setTakesAvailableWidth:1];

  objc_super v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setAllowsSwipeToDismiss:0];

  v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 setHideGrabber:1];

  v8 = [(ContaineeViewController *)self cardPresentationController];
  [v8 setDefaultContaineeLayout:5];

  v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 setEdgeAttachedRegularHeightDimmingBehavior:1];

  v10 = [(ContaineeViewController *)self cardPresentationController];
  [v10 setShouldHidePreviousCards:1];

  v11 = +[UIColor clearColor];
  v12 = [(OfflineRegionSelectorViewController *)self view];
  [v12 setBackgroundColor:v11];

  v13 = [(ContaineeViewController *)self contentView];
  [v13 setAccessibilityIdentifier:@"RegionSelectorContentView"];

  id v14 = objc_alloc((Class)MUStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v18 = [v14 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(OfflineRegionSelectorViewController *)self setContentStackView:v18];

  v19 = [(OfflineRegionSelectorViewController *)self contentStackView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(OfflineRegionSelectorViewController *)self contentStackView];
  [v20 setAlignment:3];

  v21 = [(OfflineRegionSelectorViewController *)self contentStackView];
  [v21 setClipsToBounds:1];

  double v22 = kMUPlacePlatterPadding;
  v23 = [(OfflineRegionSelectorViewController *)self contentStackView];
  [v23 setContentEdgeInsets:v22, v22, 0.0, v22];

  v24 = [(ContaineeViewController *)self contentView];
  v25 = [(OfflineRegionSelectorViewController *)self contentStackView];
  [v24 addSubview:v25];

  id v26 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(OfflineRegionSelectorViewController *)self setSizeLabel:v26];

  v27 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v27 setTextAlignment:1];

  v28 = +[UIColor secondaryLabelColor];
  v29 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v29 setTextColor:v28];

  v30 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v30 setNumberOfLines:0];

  v31 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v31 setAccessibilityIdentifier:@"Size"];

  v32 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  LODWORD(v33) = 1132068864;
  [v32 setContentCompressionResistancePriority:0 forAxis:v33];

  v34 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  LODWORD(v35) = 1148846080;
  [v34 setContentCompressionResistancePriority:1 forAxis:v35];

  v36 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  +[DynamicTypeWizard autorefreshLabel:v36 withFontProvider:&stru_1012F8750];

  v37 = [(OfflineRegionSelectorViewController *)self contentStackView];
  v38 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v37 addArrangedSubview:v38];

  v39 = [(OfflineRegionSelectorViewController *)self contentStackView];
  v40 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  [v39 setCustomSpacing:v40 afterView:12.0];

  if (GEOConfigGetBOOL())
  {
    v41 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v42 = [v41 BOOLForKey:@"OfflineMapsAutoUpdateDisclaimerDisplayed"];

    if ((v42 & 1) == 0)
    {
      id v43 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      [(OfflineRegionSelectorViewController *)self setAutoUpdateDisclaimerLabel:v43];

      v44 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v44 setTextAlignment:1];

      v45 = +[UIColor secondaryLabelColor];
      v46 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v46 setTextColor:v45];

      v47 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v47 setNumberOfLines:0];

      v48 = [(OfflineRegionSelectorViewController *)self _autoUpdateDisclaimerText];
      v49 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v49 setText:v48];

      v50 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      LODWORD(v51) = 1132068864;
      [v50 setContentCompressionResistancePriority:0 forAxis:v51];

      v52 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      LODWORD(v53) = 1148846080;
      [v52 setContentCompressionResistancePriority:1 forAxis:v53];

      v54 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      +[DynamicTypeWizard autorefreshLabel:v54 withFontProvider:&stru_1012F8750];

      v55 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v55 setAccessibilityIdentifier:@"AutoUpdateDisclaimer"];

      v56 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v56 setAlpha:0.0];

      v57 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v57 setHidden:1];

      v58 = [(OfflineRegionSelectorViewController *)self contentStackView];
      v59 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v58 addArrangedSubview:v59];

      v60 = [(OfflineRegionSelectorViewController *)self contentStackView];
      v61 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      [v60 setCustomSpacing:v61 afterView:12.0];
    }
  }
  id v62 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(OfflineRegionSelectorViewController *)self setButtonStackView:v62];

  int64_t v63 = [(OfflineRegionSelectorViewController *)self _preferredButtonStackOrientation];
  v64 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v64 setAxis:v63];

  v65 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v65 setDistribution:1];

  v66 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v66 setAlignment:0];

  double v67 = kMUPlaceHorizontalStackSpacing;
  v68 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v68 setSpacing:v67];

  v69 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v69 setAccessibilityIdentifier:@"ButtonStackView"];

  v70 = [(OfflineRegionSelectorViewController *)self contentStackView];
  v71 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v70 addArrangedSubview:v71];

  id v87 = +[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration];
  v72 = +[NSBundle mainBundle];
  v73 = [v72 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
  [v87 setTitle:v73];

  v74 = +[UIButton buttonWithConfiguration:v87 primaryAction:0];
  [(OfflineRegionSelectorViewController *)self setCancelButton:v74];

  v75 = [(OfflineRegionSelectorViewController *)self cancelButton];
  [v75 addTarget:self action:"_cancel" forControlEvents:0x2000];

  v76 = [(OfflineRegionSelectorViewController *)self cancelButton];
  [v76 setAccessibilityIdentifier:@"Cancel"];

  v77 = [v87 title];
  v78 = [(OfflineRegionSelectorViewController *)self cancelButton];
  [v78 setAccessibilityLabel:v77];

  v79 = +[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration];
  v80 = +[NSBundle mainBundle];
  v81 = [v80 localizedStringForKey:@"Download [button title]" value:@"localized string not found" table:@"Offline"];
  [v79 setTitle:v81];

  v82 = +[UIButton buttonWithConfiguration:v79 primaryAction:0];
  [(OfflineRegionSelectorViewController *)self setDownloadButton:v82];

  v83 = [(OfflineRegionSelectorViewController *)self downloadButton];
  [v83 setAccessibilityIdentifier:@"Download"];

  v84 = [v79 title];
  v85 = [(OfflineRegionSelectorViewController *)self downloadButton];
  [v85 setAccessibilityLabel:v84];

  v86 = [(OfflineRegionSelectorViewController *)self downloadButton];
  [v86 addTarget:self action:"_download" forControlEvents:0x2000];

  [(OfflineRegionSelectorViewController *)self _addButtonsToStackView];
  [(OfflineRegionSelectorViewController *)self _updateForCurrentState];
}

- (void)_setupConstraints
{
  v3 = [(OfflineRegionSelectorViewController *)self sizeLabel];
  v4 = [v3 widthAnchor];
  id v5 = [v4 constraintEqualToConstant:400.0];

  LODWORD(v6) = 1144750080;
  [v5 setPriority:v6];
  v7 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  v8 = [v7 widthAnchor];
  v9 = [v8 constraintEqualToConstant:400.0];

  LODWORD(v10) = 1144750080;
  [v9 setPriority:v10];
  v36 = [(ContaineeViewController *)self headerView];
  double v35 = [v36 heightAnchor];
  v34 = [v35 constraintEqualToConstant:0.0];
  v40[0] = v34;
  double v33 = [(OfflineRegionSelectorViewController *)self contentStackView];
  v31 = [v33 topAnchor];
  v32 = [(ContaineeViewController *)self contentView];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v40[1] = v29;
  v28 = [(OfflineRegionSelectorViewController *)self contentStackView];
  id v26 = [v28 leadingAnchor];
  v27 = [(ContaineeViewController *)self contentView];
  v11 = [v27 leadingAnchor];
  v12 = [v26 constraintEqualToAnchor:v11];
  v40[2] = v12;
  v13 = [(OfflineRegionSelectorViewController *)self contentStackView];
  id v14 = [v13 trailingAnchor];
  v15 = [(ContaineeViewController *)self contentView];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v40[3] = v17;
  v40[4] = v5;
  v37 = v9;
  v38 = v5;
  v40[5] = v9;
  id v18 = +[NSArray arrayWithObjects:v40 count:6];
  id v19 = [v18 mutableCopy];

  v20 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];

  if (v20)
  {
    v21 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
    double v22 = [v21 widthAnchor];
    v23 = [v22 constraintEqualToConstant:400.0];

    LODWORD(v24) = 1144750080;
    [v23 setPriority:v24];
    v39 = v23;
    v25 = +[NSArray arrayWithObjects:&v39 count:1];
    [v19 addObjectsFromArray:v25];
  }
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_updateLayoutForAX
{
  [(OfflineRegionSelectorViewController *)self _updateForCurrentState];
  v3 = [(OfflineRegionSelectorViewController *)self _autoUpdateDisclaimerText];
  v4 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
  [v4 setText:v3];

  int64_t v5 = [(OfflineRegionSelectorViewController *)self _preferredButtonStackOrientation];
  double v6 = [(OfflineRegionSelectorViewController *)self buttonStackView];
  [v6 setAxis:v5];

  [(OfflineRegionSelectorViewController *)self _addButtonsToStackView];
  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 updateHeightForCurrentLayout];
}

- (id)_autoUpdateDisclaimerText
{
  v2 = [(OfflineRegionSelectorViewController *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  int64_t v5 = +[NSBundle mainBundle];
  double v6 = v5;
  if (IsAccessibilityCategory) {
    CFStringRef v7 = @"OFFLINE_REGION_SELECTOR_AUTO_UPDATES_DISCLAIMER_AX";
  }
  else {
    CFStringRef v7 = @"OFFLINE_REGION_SELECTOR_AUTO_UPDATES_DISCLAIMER";
  }
  v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:@"Offline"];

  return v8;
}

- (int64_t)_preferredButtonStackOrientation
{
  v2 = [(OfflineRegionSelectorViewController *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_addButtonsToStackView
{
  v3 = [(OfflineRegionSelectorViewController *)self cancelButton];
  v33[0] = v3;
  v4 = [(OfflineRegionSelectorViewController *)self downloadButton];
  v33[1] = v4;
  int64_t v5 = +[NSArray arrayWithObjects:v33 count:2];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * (void)v10) removeFromSuperview];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v11 = [(OfflineRegionSelectorViewController *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    id v14 = [v6 reverseObjectEnumerator];
    uint64_t v15 = [v14 allObjects];

    id v6 = (id)v15;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v20);
        double v22 = [(OfflineRegionSelectorViewController *)self buttonStackView];
        [v22 addArrangedSubview:v21];

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

- (CGSize)preferredContentSize
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  v4 = [v3 containerViewController];
  int64_t v5 = [v4 view];
  id v6 = [v5 window];
  [v6 bounds];
  double v8 = v7;

  uint64_t v9 = [(ContaineeViewController *)self cardPresentationController];
  -[OfflineRegionSelectorViewController heightForLayout:](self, "heightForLayout:", [v9 containeeLayout]);
  double v11 = v10;

  double v12 = v8;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_cancel
{
  id v3 = [(OfflineRegionSelectorViewController *)self delegate];
  [v3 closeOfflineRegionSelector];

  if ([(OfflineRegionSelectorViewController *)self downloadable]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }

  +[GEOAPPortal captureUserAction:18 target:89 value:v4];
}

- (void)_download
{
  id v3 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];

  if (v3)
  {
    CFStringRef v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:1 forKey:@"OfflineMapsAutoUpdateDisclaimerDisplayed"];
  }
  int64_t v5 = [(OfflineRegionSelectorViewController *)self delegate];
  unsigned int v6 = [v5 downloadSelectedOfflineRegion];

  if (v6)
  {
    [(OfflineRegionSelectorViewController *)self setState:3];
  }
}

- (BOOL)downloadable
{
  return (id)[(OfflineRegionSelectorViewController *)self state] == (id)1;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(OfflineRegionSelectorViewController *)self _updateForCurrentState];
  }
}

- (void)setEstimatedDiskSizeLabel:(int64_t)a3
{
  self->_estimatedDiskSize = a3;
  [(OfflineRegionSelectorViewController *)self _updateForCurrentState];
}

- (void)_updateForCurrentState
{
  if (qword_10160F8D8 != -1) {
    dispatch_once(&qword_10160F8D8, &stru_1012F8770);
  }
  switch([(OfflineRegionSelectorViewController *)self state])
  {
    case 0uLL:
      id v3 = +[NSBundle mainBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"Calculating...";
      goto LABEL_18;
    case 1uLL:
      double v7 = [(OfflineRegionSelectorViewController *)self traitCollection];
      double v8 = [v7 preferredContentSizeCategory];
      if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8))
      {

LABEL_14:
        uint64_t v19 = [(id)qword_10160F8D0 stringFromByteCount:self->_estimatedDiskSize];
        v20 = [(OfflineRegionSelectorViewController *)self sizeLabel];
        [v20 setText:v19];
        goto LABEL_20;
      }
      id v16 = [(OfflineRegionSelectorViewController *)self traitCollection];
      id v17 = [v16 preferredContentSizeCategory];
      NSComparisonResult v18 = UIContentSizeCategoryCompareToCategory(v17, UIContentSizeCategoryExtraExtraLarge);

      if (v18 == NSOrderedDescending) {
        goto LABEL_14;
      }
      uint64_t v19 = +[NSBundle mainBundle];
      v20 = [v19 localizedStringForKey:@"Size of selected map: %@" value:@"localized string not found" table:@"Offline"];
      long long v23 = [(id)qword_10160F8D0 stringFromByteCount:self->_estimatedDiskSize];
      long long v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v23);
      long long v25 = [(OfflineRegionSelectorViewController *)self sizeLabel];
      [v25 setText:v24];

LABEL_20:
      double v12 = [(OfflineRegionSelectorViewController *)self downloadButton];
      int v6 = 1;
      [v12 setEnabled:1];
LABEL_21:

LABEL_22:
      long long v26 = [(OfflineRegionSelectorViewController *)self sizeLabel];
      long long v27 = [v26 text];
      long long v28 = [(OfflineRegionSelectorViewController *)self sizeLabel];
      [v28 setAccessibilityLabel:v27];

      uint64_t v29 = [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel];
      if (v29
        && (long long v30 = (void *)v29,
            [(OfflineRegionSelectorViewController *)self autoUpdateDisclaimerLabel],
            v31 = objc_claimAutoreleasedReturnValue(),
            unsigned int v32 = [v31 isHidden],
            v31,
            v30,
            v6 == v32))
      {
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1007A0D10;
        v35[3] = &unk_1012E6300;
        char v36 = v6;
        v35[4] = self;
        +[UIView animateWithDuration:v35 animations:0 completion:0.25];
      }
      else
      {
        double v33 = [(ContaineeViewController *)self cardPresentationController];
        [v33 updateHeightForCurrentLayout];

        id v34 = [(OfflineRegionSelectorViewController *)self view];
        [v34 layoutIfNeeded];
      }
      return;
    case 2uLL:
      uint64_t v9 = [(OfflineRegionSelectorViewController *)self traitCollection];
      double v10 = [v9 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);

      CFStringRef v4 = +[NSBundle mainBundle];
      if (IsAccessibilityCategory) {
        CFStringRef v5 = @"Offline maps unavailable";
      }
      else {
        CFStringRef v5 = @"Offline maps aren’t available in this region yet";
      }
      goto LABEL_17;
    case 3uLL:
      double v12 = [(OfflineRegionSelectorViewController *)self downloadButton];
      [v12 setEnabled:0];
      int v6 = 1;
      goto LABEL_21;
    case 4uLL:
      double v13 = [(OfflineRegionSelectorViewController *)self traitCollection];
      id v14 = [v13 preferredContentSizeCategory];
      BOOL v15 = UIContentSizeCategoryIsAccessibilityCategory(v14);

      CFStringRef v4 = +[NSBundle mainBundle];
      if (v15) {
        CFStringRef v5 = @"Network error";
      }
      else {
        CFStringRef v5 = @"Network error: offline map not available";
      }
LABEL_17:
      id v3 = v4;
LABEL_18:
      uint64_t v21 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:@"Offline"];
      double v22 = [(OfflineRegionSelectorViewController *)self sizeLabel];
      [v22 setText:v21];

      double v12 = [(OfflineRegionSelectorViewController *)self downloadButton];
      [v12 setEnabled:0];
      int v6 = 0;
      goto LABEL_21;
    default:
      int v6 = 0;
      goto LABEL_22;
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  CFStringRef v4 = [(OfflineRegionSelectorViewController *)self contentStackView];
  CFStringRef v5 = [(ContaineeViewController *)self contentView];
  [v5 bounds];
  [v4 _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v15)];
  double v7 = v6;

  double v8 = [(ContaineeViewController *)self cardPresentationController];
  [v8 bottomSafeOffset];
  double v10 = v9;

  if (v10 <= 0.0)
  {
    double v13 = kMUPlacePlatterPadding;
  }
  else
  {
    double v11 = [(ContaineeViewController *)self cardPresentationController];
    [v11 bottomSafeOffset];
    double v13 = v12 + 2.0;
  }
  return v7 + v13;
}

- (OfflineRegionSelectorActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OfflineRegionSelectorActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (MUStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
}

- (UILabel)autoUpdateDisclaimerLabel
{
  return self->_autoUpdateDisclaimerLabel;
}

- (void)setAutoUpdateDisclaimerLabel:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)downloadButton
{
  return self->_downloadButton;
}

- (void)setDownloadButton:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (NSArray)autoUpdateDisclaimerLabelVisibleConstraints
{
  return self->_autoUpdateDisclaimerLabelVisibleConstraints;
}

- (void)setAutoUpdateDisclaimerLabelVisibleConstraints:(id)a3
{
}

- (NSArray)autoUpdateDisclaimerLabelHiddenConstraints
{
  return self->_autoUpdateDisclaimerLabelHiddenConstraints;
}

- (void)setAutoUpdateDisclaimerLabelHiddenConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabelHiddenConstraints, 0);
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabelVisibleConstraints, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_autoUpdateDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end