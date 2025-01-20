@interface LookAroundTrayContaineeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isVisible;
- (BOOL)supportsLookAroundPIP;
- (LookAroundActionCoordination)actionCoordinator;
- (LookAroundTrayContaineeViewController)initWithLookAroundView:(id)a3;
- (LookAroundTrayContaineeViewControllerDelegate)delegate;
- (LookAroundTrayHeaderViewController)headerViewController;
- (LookAroundVibrantBackgroundButton)reportAnIssueButton;
- (LookAroundVibrantBackgroundButton)shareButton;
- (LookAroundVibrantBackgroundButton)toggleLabelsButton;
- (MKLookAroundView)lookAroundView;
- (MKViewWithHairline)grabberSafeAreaView;
- (NSDateFormatter)dateFormatter;
- (NSLayoutConstraint)grabberSafeAreaHeightConstraint;
- (UILabel)lastUpdatedLabel;
- (UILayoutGuide)containerLayoutGuide;
- (UIScrollView)scrollView;
- (UIStackView)buttonStackView;
- (UIView)containerView;
- (double)headerHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)headerView;
- (int64_t)preferredUserInterfaceStyle;
- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateLabelsButton;
- (void)reportAnIssueButtonTapped:(id)a3;
- (void)setActionCoordinator:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setContainerLayoutGuide:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGrabberSafeAreaHeightConstraint:(id)a3;
- (void)setGrabberSafeAreaView:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setLastUpdatedLabel:(id)a3;
- (void)setLookAroundView:(id)a3;
- (void)setReportAnIssueButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setToggleLabelsButton:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)shareButtonTapped:(id)a3;
- (void)toggleLabelsButtonTapped:(id)a3;
- (void)trayHeaderDidReceiveTap;
- (void)updateLocation;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation LookAroundTrayContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LookAroundTrayContaineeViewController)initWithLookAroundView:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LookAroundTrayContaineeViewController;
  v6 = [(LookAroundTrayContaineeViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setAllowResizeInFloatingStyle:1];

    v9 = [(ContaineeViewController *)v7 cardPresentationController];
    [v9 setEdgeAttachedRegularHeightDimmingBehavior:1];

    v10 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v10;

    objc_storeStrong((id *)&v7->_lookAroundView, a3);
    v7->_visible = 0;
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v7;
}

- (void)updateLocation
{
  [(LookAroundTrayContaineeViewController *)self lookAroundView];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_100539958;
  v8 = &unk_1012E5D58;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = self;
  id v3 = v9;
  +[UIView performWithoutAnimation:&v5];
  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 updateHeightForCurrentLayout];
}

- (BOOL)supportsLookAroundPIP
{
  return 0;
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_visible != a3)
  {
    BOOL v4 = a4;
    self->_visible = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100539C6C;
    v8[3] = &unk_1012E6300;
    v8[4] = self;
    BOOL v9 = a3;
    uint64_t v6 = objc_retainBlock(v8);
    v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 wantsLayout:1];

    [(LookAroundTrayContaineeViewController *)self updateLocation];
    [(LookAroundTrayContaineeViewController *)self _updateLabelsButton];
    if (v4) {
      +[UIView animateWithDuration:v6 animations:0.25];
    }
    else {
      ((void (*)(void *))v6[2])(v6);
    }
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)LookAroundTrayContaineeViewController;
  [(ContaineeViewController *)&v4 viewDidLoad];
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setHidden:1];

  [(LookAroundTrayContaineeViewController *)self _setupViews];
  [(LookAroundTrayContaineeViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundTrayContaineeViewController;
  [(ContaineeViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 grabberSafeAreaHeight];
  -[NSLayoutConstraint setConstant:](self->_grabberSafeAreaHeightConstraint, "setConstant:");
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (double)headerHeight
{
  double height = UILayoutFittingCompressedSize.height;
  objc_super v4 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  [v4 frame];
  double Width = CGRectGetWidth(v12);

  uint64_t v6 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  [v6 systemLayoutSizeFittingSize:Width withHorizontalFittingPriority:height verticalFittingPriority:v7, v8];
  double v10 = v9;

  return v10;
}

- (id)headerView
{
  return [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
}

- (id)contentView
{
  return self->_scrollView;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 1)
  {
    double v10 = 0.0;
    goto LABEL_5;
  }
  double v4 = -1.0;
  if (a3 == 3)
  {
    double height = UILayoutFittingCompressedSize.height;
    [(UIView *)self->_containerView frame];
    CGFloat Width = CGRectGetWidth(v16);
    LODWORD(v7) = 1148846080;
    LODWORD(v8) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_containerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, height, v7, v8);
    double v10 = v9 + 0.0;
LABEL_5:
    [(LookAroundTrayContaineeViewController *)self headerHeight];
    double v12 = v11;
    v13 = [(ContaineeViewController *)self cardPresentationController];
    [v13 bottomSafeOffset];
    double v4 = v10 + v12 + v14;
  }
  return v4;
}

- (void)willChangeLayout:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LookAroundTrayContaineeViewController;
  [(ContaineeViewController *)&v10 willChangeLayout:"willChangeLayout:"];
  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (a3 == 2 && v6 == (id)1)
  {
    uint64_t v7 = 1;
LABEL_7:
    [(LookAroundTrayContaineeViewController *)self _captureUserAction:v7 onTarget:1701 eventValue:0];
    return;
  }
  double v8 = [(ContaineeViewController *)self cardPresentationController];
  id v9 = [v8 containeeLayout];

  if (a3 == 1 && v9 == (id)2)
  {
    uint64_t v7 = 2;
    goto LABEL_7;
  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LookAroundTrayContaineeViewController;
  [(ContaineeViewController *)&v8 willChangeContainerStyle:a3];
  double v4 = [(LookAroundTrayContaineeViewController *)self view];

  if (v4)
  {
    BOOL v5 = !self->_visible;
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 setHidden:v5];
  }
  uint64_t v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 grabberSafeAreaHeight];
  -[NSLayoutConstraint setConstant:](self->_grabberSafeAreaHeightConstraint, "setConstant:");
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v18 = a5;
  objc_super v8 = self->_lookAroundView;
  [(MKLookAroundView *)v8 centerCoordinate];
  id v11 = [objc_alloc((Class)GEOLocation) initWithLatitude:v9 longitude:v10];
  [(MKLookAroundView *)v8 presentationYaw];
  double v13 = v12;
  double v14 = [(MKLookAroundView *)v8 visiblePlaceMUIDs];
  id v15 = [v14 count];
  if ([(MKLookAroundView *)v8 showsRoadLabels]) {
    unsigned __int8 v16 = 1;
  }
  else {
    unsigned __int8 v16 = [(MKLookAroundView *)v8 showsPointLabels];
  }
  LOBYTE(v17) = v16;
  +[GEOAPPortal captureLookAroundUserAction:v6 onTarget:v5 eventValue:v18 location:v11 heading:v13 zoom:v15 numberPoisInView:0.0 labelingShown:v17];
}

- (void)trayHeaderDidReceiveTap
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containeeLayout];

  if (v4 == (id)1)
  {
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 wantsExpandLayout];
  }
  else
  {
    if (v4 != (id)2) {
      return;
    }
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 wantsMinimizeLayout];
  }
}

- (void)toggleLabelsButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(LookAroundTrayContaineeViewController *)self delegate];
  [v5 lookAroundTrayContaineeViewController:self didTapToggleLabelsButton:v4];

  [(LookAroundTrayContaineeViewController *)self _updateLabelsButton];
}

- (void)shareButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(LookAroundTrayContaineeViewController *)self delegate];
  [v5 lookAroundTrayContaineeViewController:self didTapShareButton:v4];
}

- (void)reportAnIssueButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(LookAroundTrayContaineeViewController *)self delegate];
  [v5 lookAroundTrayContaineeViewController:self didTapReportAnIssueButton:v4];
}

- (void)_setupConstraints
{
  id v3 = [(MKViewWithHairline *)self->_grabberSafeAreaView heightAnchor];
  id v4 = [v3 constraintEqualToConstant:0.0];
  grabberSafeAreaHeightConstraint = self->_grabberSafeAreaHeightConstraint;
  self->_grabberSafeAreaHeightConstraint = v4;

  v111 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  v109 = [v111 topAnchor];
  v110 = [(LookAroundTrayContaineeViewController *)self view];
  v108 = [v110 topAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v112[0] = v107;
  v106 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  v104 = [v106 leadingAnchor];
  v105 = [(LookAroundTrayContaineeViewController *)self view];
  v103 = [v105 leadingAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v112[1] = v102;
  v101 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  v99 = [v101 trailingAnchor];
  v100 = [(LookAroundTrayContaineeViewController *)self view];
  v98 = [v100 trailingAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v112[2] = v97;
  v95 = [(MKViewWithHairline *)self->_grabberSafeAreaView leadingAnchor];
  v96 = [(LookAroundTrayContaineeViewController *)self view];
  v94 = [v96 leadingAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v112[3] = v93;
  v91 = [(MKViewWithHairline *)self->_grabberSafeAreaView trailingAnchor];
  v92 = [(LookAroundTrayContaineeViewController *)self view];
  v90 = [v92 trailingAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v112[4] = v89;
  v87 = [(MKViewWithHairline *)self->_grabberSafeAreaView bottomAnchor];
  v88 = [(LookAroundTrayContaineeViewController *)self view];
  v86 = [v88 bottomAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  uint64_t v6 = self->_grabberSafeAreaHeightConstraint;
  v112[5] = v85;
  v112[6] = v6;
  v83 = [(UIScrollView *)self->_scrollView topAnchor];
  v84 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  v82 = [v84 bottomAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v112[7] = v81;
  v79 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v80 = [(LookAroundTrayContaineeViewController *)self view];
  v78 = [v80 leadingAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v112[8] = v77;
  v75 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v76 = [(LookAroundTrayContaineeViewController *)self view];
  v74 = [v76 trailingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v112[9] = v73;
  v72 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v70 = [v72 widthAnchor];
  v71 = [(LookAroundTrayContaineeViewController *)self view];
  v69 = [v71 widthAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v112[10] = v68;
  v67 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v66 = [(MKViewWithHairline *)self->_grabberSafeAreaView topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v112[11] = v65;
  v64 = [(UIView *)self->_containerView topAnchor];
  v63 = [(UIScrollView *)self->_scrollView topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v112[12] = v62;
  v61 = [(UIView *)self->_containerView leadingAnchor];
  v60 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v112[13] = v59;
  v58 = [(UIView *)self->_containerView trailingAnchor];
  v57 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v112[14] = v56;
  v55 = [(UIView *)self->_containerView bottomAnchor];
  v54 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v112[15] = v53;
  v52 = [(UILayoutGuide *)self->_containerLayoutGuide topAnchor];
  v51 = [(UIView *)self->_containerView topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:15.0];
  v112[16] = v50;
  v49 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v48 = [(UIView *)self->_containerView leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:16.0];
  v112[17] = v47;
  v46 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v45 = [(UIView *)self->_containerView trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:-16.0];
  v112[18] = v44;
  v43 = [(UILayoutGuide *)self->_containerLayoutGuide bottomAnchor];
  v42 = [(UIView *)self->_containerView bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-15.0];
  v112[19] = v41;
  v40 = [(UIStackView *)self->_buttonStackView topAnchor];
  v39 = [(UILayoutGuide *)self->_containerLayoutGuide topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v112[20] = v38;
  v37 = [(UIStackView *)self->_buttonStackView leadingAnchor];
  v36 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v112[21] = v35;
  v34 = [(UIStackView *)self->_buttonStackView trailingAnchor];
  v33 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v112[22] = v32;
  v31 = [(LookAroundVibrantBackgroundButton *)self->_toggleLabelsButton heightAnchor];
  v30 = [v31 constraintGreaterThanOrEqualToConstant:52.0];
  v29 = +[DynamicTypeWizard autoscaledConstraint:v30 constant:&stru_1012EE628 withFontProvider:52.0];
  v112[23] = v29;
  v28 = [(LookAroundVibrantBackgroundButton *)self->_shareButton heightAnchor];
  v27 = [(LookAroundVibrantBackgroundButton *)self->_toggleLabelsButton heightAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v112[24] = v26;
  v25 = [(UILabel *)self->_lastUpdatedLabel leadingAnchor];
  v24 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v112[25] = v23;
  v22 = [(UILabel *)self->_lastUpdatedLabel trailingAnchor];
  v21 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v112[26] = v20;
  uint64_t v7 = [(UILabel *)self->_lastUpdatedLabel firstBaselineAnchor];
  objc_super v8 = [(UIStackView *)self->_buttonStackView bottomAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  double v10 = +[DynamicTypeWizard autoscaledConstraint:v9 constant:&stru_1012EE628 withFontProvider:32.0];
  v112[27] = v10;
  id v11 = [(UILabel *)self->_lastUpdatedLabel bottomAnchor];
  double v12 = [(UILayoutGuide *)self->_containerLayoutGuide bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v112[28] = v13;
  double v14 = +[NSArray arrayWithObjects:v112 count:29];
  id v15 = +[NSMutableArray arrayWithArray:v14];

  reportAnIssueButton = self->_reportAnIssueButton;
  if (reportAnIssueButton)
  {
    uint64_t v17 = [(LookAroundVibrantBackgroundButton *)reportAnIssueButton heightAnchor];
    id v18 = [(LookAroundVibrantBackgroundButton *)self->_shareButton heightAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v15 addObject:v19];
  }
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)_setupViews
{
  id v3 = [(LookAroundTrayContaineeViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = objc_alloc_init(LookAroundTrayHeaderViewController);
  headerViewController = self->_headerViewController;
  self->_headerViewController = v4;

  [(LookAroundTrayHeaderViewController *)self->_headerViewController setDelegate:self];
  uint64_t v6 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(LookAroundTrayHeaderViewController *)self->_headerViewController setAccessibilityIdentifier:@"LookAroundTrayHeader"];
  uint64_t v7 = [(LookAroundTrayContaineeViewController *)self view];
  objc_super v8 = [(LookAroundTrayHeaderViewController *)self->_headerViewController view];
  [v7 addSubview:v8];

  id v9 = objc_alloc((Class)UIScrollView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
  scrollView = self->_scrollView;
  self->_scrollView = v13;

  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:1];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  id v15 = [(UIScrollView *)self->_scrollView layer];
  [v15 setAllowsGroupOpacity:0];

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned __int8 v16 = [(LookAroundTrayContaineeViewController *)self view];
  [v16 addSubview:self->_scrollView];

  uint64_t v17 = [objc_alloc((Class)MKViewWithHairline) initWithFrame:CGRectZero.origin.x, y, width, height];
  grabberSafeAreaView = self->_grabberSafeAreaView;
  self->_grabberSafeAreaView = v17;

  [(MKViewWithHairline *)self->_grabberSafeAreaView setBottomHairlineHidden:1];
  [(MKViewWithHairline *)self->_grabberSafeAreaView setTopHairlineHidden:0];
  [(MKViewWithHairline *)self->_grabberSafeAreaView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = +[UIColor clearColor];
  [(MKViewWithHairline *)self->_grabberSafeAreaView setBackgroundColor:v19];

  [(MKViewWithHairline *)self->_grabberSafeAreaView setPreservesSuperviewLayoutMargins:1];
  v20 = [(LookAroundTrayContaineeViewController *)self view];
  [v20 addSubview:self->_grabberSafeAreaView];

  v21 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  containerView = self->_containerView;
  self->_containerView = v21;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView setAccessibilityIdentifier:@"LookAroundTray"];
  [(UIScrollView *)self->_scrollView addSubview:self->_containerView];
  v23 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  containerLayoutGuide = self->_containerLayoutGuide;
  self->_containerLayoutGuide = v23;

  [(UIView *)self->_containerView addLayoutGuide:self->_containerLayoutGuide];
  v25 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v25;

  [(UIStackView *)self->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_buttonStackView setAxis:1];
  [(UIStackView *)self->_buttonStackView setSpacing:15.0];
  [(UIStackView *)self->_buttonStackView setAccessibilityIdentifier:@"LookAroundTrayButtonsStack"];
  [(UIView *)self->_containerView addSubview:self->_buttonStackView];
  v27 = +[LookAroundVibrantBackgroundButton customButtonWithImage:0 title:0 target:self action:"toggleLabelsButtonTapped:"];
  toggleLabelsButton = self->_toggleLabelsButton;
  self->_toggleLabelsButton = v27;

  [(LookAroundVibrantBackgroundButton *)self->_toggleLabelsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LookAroundVibrantBackgroundButton *)self->_toggleLabelsButton setAccessibilityIdentifier:@"LookAroundTrayToggleLabelsButton"];
  [(LookAroundTrayContaineeViewController *)self _updateLabelsButton];
  [(UIStackView *)self->_buttonStackView addArrangedSubview:self->_toggleLabelsButton];
  v29 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"Share [LookAround]" value:@"localized string not found" table:0];
  v32 = +[LookAroundVibrantBackgroundButton customButtonWithImage:v29 title:v31 target:self action:"shareButtonTapped:"];
  shareButton = self->_shareButton;
  self->_shareButton = v32;

  [(LookAroundVibrantBackgroundButton *)self->_shareButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LookAroundVibrantBackgroundButton *)self->_shareButton setAccessibilityIdentifier:@"LookAroundTrayShareButton"];
  [(UIStackView *)self->_buttonStackView addArrangedSubview:self->_shareButton];
  if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0)
  {
    v34 = +[UIImage systemImageNamed:@"exclamationmark.bubble"];
    v35 = +[NSBundle mainBundle];
    v36 = [v35 localizedStringForKey:@"Report an Issue" value:@"localized string not found" table:0];
    v37 = +[LookAroundVibrantBackgroundButton customButtonWithImage:v34 title:v36 target:self action:"reportAnIssueButtonTapped:"];
    reportAnIssueButton = self->_reportAnIssueButton;
    self->_reportAnIssueButton = v37;

    [(LookAroundVibrantBackgroundButton *)self->_reportAnIssueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(LookAroundVibrantBackgroundButton *)self->_reportAnIssueButton setAccessibilityIdentifier:@"LookAroundTrayReportAnIssueButton"];
    [(UIStackView *)self->_buttonStackView addArrangedSubview:self->_reportAnIssueButton];
  }
  v39 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, y, width, height)];
  lastUpdatedLabel = self->_lastUpdatedLabel;
  self->_lastUpdatedLabel = v39;

  [(UILabel *)self->_lastUpdatedLabel setNumberOfLines:2];
  [(UILabel *)self->_lastUpdatedLabel setTextAlignment:1];
  v41 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_lastUpdatedLabel setTextColor:v41];

  LODWORD(v42) = 1132068864;
  [(UILabel *)self->_lastUpdatedLabel setContentCompressionResistancePriority:0 forAxis:v42];
  LODWORD(v43) = 1148846080;
  [(UILabel *)self->_lastUpdatedLabel setContentCompressionResistancePriority:1 forAxis:v43];
  [(UILabel *)self->_lastUpdatedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  +[DynamicTypeWizard autorefreshLabel:self->_lastUpdatedLabel withFontProvider:&stru_1012EE628];
  [(UILabel *)self->_lastUpdatedLabel setAccessibilityIdentifier:@"LookAroundTrayLastUpdatedLabel"];
  v44 = self->_containerView;
  v45 = self->_lastUpdatedLabel;

  [(UIView *)v44 addSubview:v45];
}

- (void)_updateLabelsButton
{
  if ([(MKLookAroundView *)self->_lookAroundView showsPointLabels]
    && [(MKLookAroundView *)self->_lookAroundView showsRoadLabels])
  {
    toggleLabelsButton = self->_toggleLabelsButton;
    id v8 = +[UIImage systemImageNamed:@"eye.slash"];
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"Hide Labels [LookAround]";
  }
  else
  {
    toggleLabelsButton = self->_toggleLabelsButton;
    id v8 = +[UIImage systemImageNamed:@"eye"];
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"Show Labels [LookAround]";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];
  [(LookAroundVibrantBackgroundButton *)toggleLabelsButton setImage:v8 title:v7];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 updateHeightForCurrentLayout];
}

- (LookAroundActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (LookAroundActionCoordination *)WeakRetained;
}

- (void)setActionCoordinator:(id)a3
{
}

- (LookAroundTrayContaineeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LookAroundTrayContaineeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
}

- (LookAroundTrayHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILayoutGuide)containerLayoutGuide
{
  return self->_containerLayoutGuide;
}

- (void)setContainerLayoutGuide:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (LookAroundVibrantBackgroundButton)toggleLabelsButton
{
  return self->_toggleLabelsButton;
}

- (void)setToggleLabelsButton:(id)a3
{
}

- (LookAroundVibrantBackgroundButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (LookAroundVibrantBackgroundButton)reportAnIssueButton
{
  return self->_reportAnIssueButton;
}

- (void)setReportAnIssueButton:(id)a3
{
}

- (UILabel)lastUpdatedLabel
{
  return self->_lastUpdatedLabel;
}

- (void)setLastUpdatedLabel:(id)a3
{
}

- (MKViewWithHairline)grabberSafeAreaView
{
  return self->_grabberSafeAreaView;
}

- (void)setGrabberSafeAreaView:(id)a3
{
}

- (NSLayoutConstraint)grabberSafeAreaHeightConstraint
{
  return self->_grabberSafeAreaHeightConstraint;
}

- (void)setGrabberSafeAreaHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSafeAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_grabberSafeAreaView, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_reportAnIssueButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_toggleLabelsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_containerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_actionCoordinator);
}

@end