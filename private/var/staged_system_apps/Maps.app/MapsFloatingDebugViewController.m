@interface MapsFloatingDebugViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isAttached;
- (CGPoint)initialPosition;
- (FloatingDebugIconLabel)thumbnailIconLabel;
- (MapsFloatingDebugViewController)init;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)topConstraint;
- (PassThroughWindow)floatingDebugWindow;
- (UIImageView)thumbnailImageView;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (UIView)grabberContainerView;
- (id)additionalLongPressActions;
- (id)tintColor;
- (id)windowScene;
- (int64_t)viewState;
- (void)attach;
- (void)detach;
- (void)longPressGestureRecognizerFired:(id)a3;
- (void)panGestureRecognizerFired:(id)a3;
- (void)sceneDidActivateNotification:(id)a3;
- (void)setFloatingDebugWindow:(id)a3;
- (void)setGrabberContainerView:(id)a3;
- (void)setInitialPosition:(CGPoint)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setThumbnailIconLabel:(id)a3;
- (void)setThumbnailImageView:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setViewState:(int64_t)a3;
- (void)tapGestureRecognizerFired:(id)a3;
- (void)toggleState;
- (void)updateTintAndIconLabel;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation MapsFloatingDebugViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MapsFloatingDebugViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsFloatingDebugViewController;
  v2 = [(MapsFloatingDebugViewController *)&v9 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"sceneDidActivateNotification:" name:UISceneDidActivateNotification object:0];

    v4 = [PassThroughWindow alloc];
    v5 = [(MapsFloatingDebugViewController *)v2 windowScene];
    v6 = [(PassThroughWindow *)v4 initWithWindowScene:v5];
    floatingDebugWindow = v2->_floatingDebugWindow;
    v2->_floatingDebugWindow = v6;

    [(PassThroughWindow *)v2->_floatingDebugWindow setWindowLevel:UIHUDWindowLevel];
  }
  return v2;
}

- (void)viewDidLoad
{
  v157.receiver = self;
  v157.super_class = (Class)MapsFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v157 viewDidLoad];
  id v156 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"panGestureRecognizerFired:"];
  v3 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v3 addGestureRecognizer:v156];

  id v155 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGestureRecognizerFired:"];
  v4 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v4 addGestureRecognizer:v155];

  id v154 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"longPressGestureRecognizerFired:"];
  v5 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v5 addGestureRecognizer:v154];

  v6 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  v7 = [(MapsFloatingDebugViewController *)self view];
  [v6 addSubview:v7];

  v8 = [(MapsFloatingDebugViewController *)self view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(MapsFloatingDebugViewController *)self tintColor];
  v10 = [(MapsFloatingDebugViewController *)self view];
  [v10 setBackgroundColor:v9];

  v11 = [(MapsFloatingDebugViewController *)self view];
  v12 = [v11 leadingAnchor];
  v13 = [(MapsFloatingDebugViewController *)self view];
  v14 = [v13 superview];
  v15 = [v14 leadingAnchor];
  v16 = [v12 constraintEqualToAnchor:v15];
  [(MapsFloatingDebugViewController *)self setLeadingConstraint:v16];

  v17 = [(MapsFloatingDebugViewController *)self view];
  v18 = [v17 topAnchor];
  v19 = [(MapsFloatingDebugViewController *)self view];
  v20 = [v19 superview];
  v21 = [v20 topAnchor];
  v22 = [v18 constraintEqualToAnchor:v21];
  [(MapsFloatingDebugViewController *)self setTopConstraint:v22];

  v23 = [(MapsFloatingDebugViewController *)self leadingConstraint];
  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];

  v25 = [(MapsFloatingDebugViewController *)self topConstraint];
  LODWORD(v26) = 1148829696;
  [v25 setPriority:v26];

  [(MapsFloatingDebugViewController *)self initialPosition];
  double v28 = v27;
  v29 = [(MapsFloatingDebugViewController *)self leadingConstraint];
  [v29 setConstant:v28];

  [(MapsFloatingDebugViewController *)self initialPosition];
  double v31 = v30;
  v32 = [(MapsFloatingDebugViewController *)self topConstraint];
  [v32 setConstant:v31];

  v152 = [(MapsFloatingDebugViewController *)self view];
  v143 = [v152 topAnchor];
  v149 = [(MapsFloatingDebugViewController *)self view];
  v146 = [v149 superview];
  v140 = [v146 safeAreaLayoutGuide];
  v137 = [v140 topAnchor];
  v134 = [v143 constraintGreaterThanOrEqualToAnchor:v137];
  v161[0] = v134;
  v132 = [(MapsFloatingDebugViewController *)self view];
  v126 = [v132 bottomAnchor];
  v130 = [(MapsFloatingDebugViewController *)self view];
  v128 = [v130 superview];
  v125 = [v128 safeAreaLayoutGuide];
  v123 = [v125 bottomAnchor];
  v120 = [v126 constraintLessThanOrEqualToAnchor:v123];
  v161[1] = v120;
  v119 = [(MapsFloatingDebugViewController *)self view];
  v116 = [v119 leadingAnchor];
  v118 = [(MapsFloatingDebugViewController *)self view];
  v117 = [v118 superview];
  v115 = [v117 safeAreaLayoutGuide];
  v114 = [v115 leadingAnchor];
  v113 = [v116 constraintGreaterThanOrEqualToAnchor:v114];
  v161[2] = v113;
  v112 = [(MapsFloatingDebugViewController *)self view];
  v33 = [v112 trailingAnchor];
  v34 = [(MapsFloatingDebugViewController *)self view];
  v35 = [v34 superview];
  v36 = [v35 safeAreaLayoutGuide];
  v37 = [v36 trailingAnchor];
  v38 = [v33 constraintLessThanOrEqualToAnchor:v37];
  v161[3] = v38;
  v39 = [(MapsFloatingDebugViewController *)self leadingConstraint];
  v161[4] = v39;
  v40 = [(MapsFloatingDebugViewController *)self topConstraint];
  v161[5] = v40;
  v41 = +[NSArray arrayWithObjects:v161 count:6];
  +[NSLayoutConstraint activateConstraints:v41];

  id v42 = [objc_alloc((Class)UIImageView) initWithImage:0];
  [(MapsFloatingDebugViewController *)self setThumbnailImageView:v42];

  v43 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

  v44 = +[UIColor whiteColor];
  v45 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v45 setTintColor:v44];

  v46 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v46 setContentMode:1];

  v47 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  LODWORD(v48) = 1148846080;
  [v47 setContentCompressionResistancePriority:1 forAxis:v48];

  v49 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  LODWORD(v50) = 1148846080;
  [v49 setContentCompressionResistancePriority:0 forAxis:v50];

  v51 = [FloatingDebugIconLabel alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v55 = -[FloatingDebugIconLabel initWithFrame:](v51, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MapsFloatingDebugViewController *)self setThumbnailIconLabel:v55];

  v56 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

  v57 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v57 setTextAlignment:1];

  v58 = +[UIColor whiteColor];
  v59 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v59 setTextColor:v58];

  v60 = +[UIFont systemFontOfSize:14.0];
  v61 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v61 setFont:v60];

  v62 = [(MapsFloatingDebugViewController *)self tintColor];
  v63 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v63 setBackgroundColor:v62];

  v64 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v64 setClipsToBounds:1];

  v65 = [(MapsFloatingDebugViewController *)self iconText];
  v66 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v66 setText:v65];

  v67 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  v68 = [v67 layer];
  [v68 setCornerRadius:9.0];

  id v69 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MapsFloatingDebugViewController *)self setGrabberContainerView:v69];

  v70 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  [v70 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v71 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
  v72 = +[UIColor whiteColor];
  [v71 setBackgroundColor:v72];

  v73 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  [v73 addSubview:v71];

  v147 = [v71 leadingAnchor];
  v150 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  v144 = [v150 leadingAnchor];
  v141 = [v147 constraintEqualToAnchor:v144 constant:8.0];
  v160[0] = v141;
  v135 = [v71 trailingAnchor];
  v138 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  v74 = [v138 trailingAnchor];
  v75 = [v135 constraintEqualToAnchor:v74 constant:-8.0];
  v160[1] = v75;
  v153 = v71;
  v76 = [v71 bottomAnchor];
  v77 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  v78 = [v77 bottomAnchor];
  v79 = [v76 constraintEqualToAnchor:v78];
  v160[2] = v79;
  v80 = [v71 heightAnchor];
  v81 = [v80 constraintEqualToConstant:1.0];
  v160[3] = v81;
  v82 = +[NSArray arrayWithObjects:v160 count:4];
  +[NSLayoutConstraint activateConstraints:v82];

  id v83 = [objc_alloc((Class)_UIGrabber) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v83 setTranslatesAutoresizingMaskIntoConstraints:0];
  v84 = +[UIColor whiteColor];
  [v83 setBackgroundColor:v84];

  v85 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  [v85 addSubview:v83];

  v151 = v83;
  v86 = [v83 centerXAnchor];
  v87 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  v88 = [v87 centerXAnchor];
  v89 = [v86 constraintEqualToAnchor:v88];
  v159[0] = v89;
  v90 = [v83 centerYAnchor];
  v91 = [(MapsFloatingDebugViewController *)self grabberContainerView];
  v92 = [v91 centerYAnchor];
  v93 = [v90 constraintEqualToAnchor:v92];
  v159[1] = v93;
  v94 = +[NSArray arrayWithObjects:v159 count:2];
  +[NSLayoutConstraint activateConstraints:v94];

  v95 = objc_opt_new();
  [(MapsFloatingDebugViewController *)self setScrollView:v95];

  v96 = [(MapsFloatingDebugViewController *)self scrollView];
  [v96 setTranslatesAutoresizingMaskIntoConstraints:0];

  v97 = [(MapsFloatingDebugViewController *)self scrollView];
  LODWORD(v98) = 1148846080;
  [v97 setContentHuggingPriority:1 forAxis:v98];

  v99 = [(MapsFloatingDebugViewController *)self scrollView];
  LODWORD(v100) = 1132068864;
  [v99 setContentCompressionResistancePriority:1 forAxis:v100];

  v101 = [(MapsFloatingDebugViewController *)self scrollView];
  v102 = [(MapsFloatingDebugViewController *)self contentView];
  [v101 addSubview:v102];

  v148 = [(MapsFloatingDebugViewController *)self contentView];
  v142 = [v148 leadingAnchor];
  v145 = [(MapsFloatingDebugViewController *)self scrollView];
  v139 = [v145 leadingAnchor];
  v136 = [v142 constraintEqualToAnchor:v139];
  v158[0] = v136;
  v133 = [(MapsFloatingDebugViewController *)self contentView];
  v129 = [v133 trailingAnchor];
  v131 = [(MapsFloatingDebugViewController *)self scrollView];
  v127 = [v131 trailingAnchor];
  v124 = [v129 constraintEqualToAnchor:v127];
  v158[1] = v124;
  v122 = [(MapsFloatingDebugViewController *)self contentView];
  v121 = [v122 topAnchor];
  v103 = [(MapsFloatingDebugViewController *)self scrollView];
  v104 = [v103 topAnchor];
  v105 = [v121 constraintEqualToAnchor:v104];
  v158[2] = v105;
  v106 = [(MapsFloatingDebugViewController *)self contentView];
  v107 = [v106 bottomAnchor];
  v108 = [(MapsFloatingDebugViewController *)self scrollView];
  v109 = [v108 bottomAnchor];
  v110 = [v107 constraintEqualToAnchor:v109];
  v158[3] = v110;
  v111 = +[NSArray arrayWithObjects:v158 count:4];
  +[NSLayoutConstraint activateConstraints:v111];

  [(MapsFloatingDebugViewController *)self updateViewForCurrentState];
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(UIView *)self->_contentView setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIView *)self->_contentView setContentCompressionResistancePriority:0 forAxis:v7];
    contentView = self->_contentView;
  }

  return contentView;
}

- (void)attach
{
  v3 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v3 setHidden:0];

  [(MapsFloatingDebugViewController *)self loadViewIfNeeded];
}

- (void)detach
{
  id v2 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v2 setHidden:1];
}

- (BOOL)isAttached
{
  id v2 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (id)windowScene
{
  id v2 = +[UIApplication _maps_lockScreenSceneDelegate];
  char v3 = [v2 lockScreenWindow];
  v4 = [v3 windowScene];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = +[UIApplication _maps_keyMapsSceneDelegate];
    v8 = [v7 window];
    id v6 = [v8 windowScene];
  }

  return v6;
}

- (void)toggleState
{
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (!v3)
  {
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    uint64_t v4 = 0;
LABEL_5:
    [(MapsFloatingDebugViewController *)self setViewState:v4];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005FAFB0;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  +[UIView animateWithDuration:6 delay:v5 options:0 animations:0.5 completion:0.0];
}

- (void)updateViewForCurrentState
{
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (v3 == 1)
  {
    v32 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    [v32 removeFromSuperview];

    v33 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
    [v33 removeFromSuperview];

    v34 = [(MapsFloatingDebugViewController *)self view];
    v35 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    [v34 addSubview:v35];

    v111 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    v103 = [v111 leadingAnchor];
    v107 = [(MapsFloatingDebugViewController *)self view];
    v99 = [v107 leadingAnchor];
    v95 = [v103 constraintEqualToAnchor:v99];
    v114[0] = v95;
    v91 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    v85 = [v91 trailingAnchor];
    v88 = [(MapsFloatingDebugViewController *)self view];
    v80 = [v88 trailingAnchor];
    v77 = [v85 constraintEqualToAnchor:v80];
    v114[1] = v77;
    v36 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    v37 = [v36 topAnchor];
    v38 = [(MapsFloatingDebugViewController *)self view];
    v39 = [v38 topAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    v114[2] = v40;
    v41 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    id v42 = [v41 heightAnchor];
    v43 = [v42 constraintEqualToConstant:44.0];
    v114[3] = v43;
    v44 = +[NSArray arrayWithObjects:v114 count:4];
    +[NSLayoutConstraint activateConstraints:v44];

    v45 = [(MapsFloatingDebugViewController *)self view];
    v46 = [(MapsFloatingDebugViewController *)self scrollView];
    [v45 addSubview:v46];

    v112 = [(MapsFloatingDebugViewController *)self scrollView];
    v104 = [v112 leadingAnchor];
    v108 = [(MapsFloatingDebugViewController *)self view];
    double v100 = [v108 leadingAnchor];
    v96 = [v104 constraintEqualToAnchor:v100];
    v113[0] = v96;
    v92 = [(MapsFloatingDebugViewController *)self scrollView];
    v86 = [v92 trailingAnchor];
    v89 = [(MapsFloatingDebugViewController *)self view];
    id v83 = [v89 trailingAnchor];
    v81 = [v86 constraintEqualToAnchor:v83];
    v113[1] = v81;
    v78 = [(MapsFloatingDebugViewController *)self scrollView];
    v74 = [v78 topAnchor];
    v75 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    id v71 = [v75 bottomAnchor];
    id v69 = [v74 constraintEqualToAnchor:v71];
    v113[2] = v69;
    v67 = [(MapsFloatingDebugViewController *)self scrollView];
    v63 = [v67 bottomAnchor];
    v65 = [(MapsFloatingDebugViewController *)self view];
    v61 = [v65 bottomAnchor];
    v59 = [v63 constraintEqualToAnchor:v61];
    v113[3] = v59;
    v57 = [(MapsFloatingDebugViewController *)self contentView];
    v56 = [v57 widthAnchor];
    v47 = [(MapsFloatingDebugViewController *)self view];
    double v48 = [v47 widthAnchor];
    v49 = [v56 constraintEqualToAnchor:v48];
    v113[4] = v49;
    double v50 = [(MapsFloatingDebugViewController *)self contentView];
    v51 = [v50 heightAnchor];
    v52 = [(MapsFloatingDebugViewController *)self view];
    v53 = [v52 heightAnchor];
    v54 = [v51 constraintGreaterThanOrEqualToAnchor:v53 constant:-44.0];
    v113[5] = v54;
    v55 = +[NSArray arrayWithObjects:v113 count:6];
    +[NSLayoutConstraint activateConstraints:v55];

    double v28 = [(MapsFloatingDebugViewController *)self view];
    v29 = [v28 layer];
    double v30 = v29;
    double v31 = 5.0;
  }
  else
  {
    if (v3) {
      return;
    }
    uint64_t v4 = [(MapsFloatingDebugViewController *)self grabberContainerView];
    [v4 removeFromSuperview];

    v5 = [(MapsFloatingDebugViewController *)self scrollView];
    [v5 removeFromSuperview];

    id v6 = [(MapsFloatingDebugViewController *)self view];
    double v7 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    [v6 addSubview:v7];

    v109 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v101 = [v109 leadingAnchor];
    v105 = [(MapsFloatingDebugViewController *)self view];
    v97 = [v105 leadingAnchor];
    v93 = [v101 constraintEqualToAnchor:v97 constant:5.0];
    v116[0] = v93;
    v90 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v84 = [v90 trailingAnchor];
    v87 = [(MapsFloatingDebugViewController *)self view];
    v82 = [v87 trailingAnchor];
    v79 = [v84 constraintEqualToAnchor:v82 constant:-5.0];
    v116[1] = v79;
    v76 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v72 = [v76 topAnchor];
    v73 = [(MapsFloatingDebugViewController *)self view];
    v70 = [v73 topAnchor];
    v68 = [v72 constraintEqualToAnchor:v70 constant:5.0];
    v116[2] = v68;
    v66 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v62 = [v66 bottomAnchor];
    v64 = [(MapsFloatingDebugViewController *)self view];
    v60 = [v64 bottomAnchor];
    v58 = [v62 constraintEqualToAnchor:v60 constant:-5.0];
    v116[3] = v58;
    v8 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    objc_super v9 = [v8 widthAnchor];
    v10 = [v9 constraintEqualToConstant:34.0];
    v116[4] = v10;
    v11 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v12 = [v11 heightAnchor];
    v13 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
    v14 = [v13 widthAnchor];
    v15 = [v12 constraintEqualToAnchor:v14 multiplier:1.0];
    v116[5] = v15;
    v16 = +[NSArray arrayWithObjects:v116 count:6];
    +[NSLayoutConstraint activateConstraints:v16];

    v17 = [(MapsFloatingDebugViewController *)self view];
    v18 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
    [v17 addSubview:v18];

    v110 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
    v102 = [v110 centerXAnchor];
    v106 = [(MapsFloatingDebugViewController *)self view];
    double v98 = [v106 centerXAnchor];
    v94 = [v102 constraintEqualToAnchor:v98];
    v115[0] = v94;
    v19 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
    v20 = [v19 topAnchor];
    v21 = [(MapsFloatingDebugViewController *)self view];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:5.0];
    v115[1] = v23;
    double v24 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
    v25 = [v24 heightAnchor];
    double v26 = [v25 constraintEqualToConstant:18.0];
    v115[2] = v26;
    double v27 = +[NSArray arrayWithObjects:v115 count:3];
    +[NSLayoutConstraint activateConstraints:v27];

    double v28 = [(MapsFloatingDebugViewController *)self view];
    v29 = [v28 layer];
    double v30 = v29;
    double v31 = 22.0;
  }
  [v29 setCornerRadius:v31];
}

- (void)updateTintAndIconLabel
{
  int64_t v3 = [(MapsFloatingDebugViewController *)self tintColor];
  uint64_t v4 = [(MapsFloatingDebugViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(MapsFloatingDebugViewController *)self tintColor];
  id v6 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v6 setBackgroundColor:v5];

  id v8 = [(MapsFloatingDebugViewController *)self iconText];
  double v7 = [(MapsFloatingDebugViewController *)self thumbnailIconLabel];
  [v7 setText:v8];
}

- (id)tintColor
{
  return 0;
}

- (CGPoint)initialPosition
{
  id v2 = (objc_class *)objc_opt_class();
  int64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = +[NSString stringWithFormat:@"%@%@", @"kFloatingDebugViewControllerInitialPositionKeyPrefix", v3];

  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:v4];

  if (v6)
  {
    CGPoint v7 = CGPointFromString(v6);
    CGFloat x = v7.x;
    CGFloat y = v7.y;
  }
  else
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  NSStringFromCGPoint(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@%@", @"kFloatingDebugViewControllerInitialPositionKeyPrefix", v4];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:v7 forKey:v5];
}

- (id)additionalLongPressActions
{
  return 0;
}

- (void)panGestureRecognizerFired:(id)a3
{
  id v4 = a3;
  v5 = [(MapsFloatingDebugViewController *)self view];
  id v6 = [v5 superview];
  [v4 translationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(MapsFloatingDebugViewController *)self view];
  [v11 frame];
  double v13 = v8 + v12;
  v14 = [(MapsFloatingDebugViewController *)self view];
  [v14 frame];
  double v16 = v10 + v15;

  v17 = [(MapsFloatingDebugViewController *)self leadingConstraint];
  [v17 setConstant:v13];

  v18 = [(MapsFloatingDebugViewController *)self topConstraint];
  [v18 setConstant:v16];

  v19 = [(MapsFloatingDebugViewController *)self view];
  [v4 setTranslation:v19 inView:CGPointZero.x, CGPointZero.y];

  v20 = [(MapsFloatingDebugViewController *)self contentView];
  [v20 setNeedsLayout];

  v21 = [(MapsFloatingDebugViewController *)self contentView];
  [v21 layoutIfNeeded];

  id v22 = [v4 state];
  if (v22 == (id)3)
  {
    -[MapsFloatingDebugViewController setInitialPosition:](self, "setInitialPosition:", v13, v16);
  }
}

- (void)tapGestureRecognizerFired:(id)a3
{
}

- (void)longPressGestureRecognizerFired:(id)a3
{
  id v4 = +[UIAlertController alertControllerWithTitle:@"Choose an action" message:0 preferredStyle:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005FC0EC;
  v16[3] = &unk_1012E6DE0;
  v16[4] = self;
  v5 = +[UIAlertAction actionWithTitle:@"Dismiss foating debug UI" style:0 handler:v16];
  [v4 addAction:v5];

  id v6 = [(MapsFloatingDebugViewController *)self additionalLongPressActions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addAction:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
  double v11 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v4 addAction:v11];

  [(MapsFloatingDebugViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)sceneDidActivateNotification:(id)a3
{
  id v5 = [(MapsFloatingDebugViewController *)self windowScene];
  id v4 = [(MapsFloatingDebugViewController *)self floatingDebugWindow];
  [v4 setWindowScene:v5];
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void)setViewState:(int64_t)a3
{
  self->_viewState = a3;
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
}

- (PassThroughWindow)floatingDebugWindow
{
  return self->_floatingDebugWindow;
}

- (void)setFloatingDebugWindow:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (UIView)grabberContainerView
{
  return self->_grabberContainerView;
}

- (void)setGrabberContainerView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (FloatingDebugIconLabel)thumbnailIconLabel
{
  return self->_thumbnailIconLabel;
}

- (void)setThumbnailIconLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailIconLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_grabberContainerView, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingDebugWindow, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end