@interface NTKEChooseWatchFaceViewController
+ (id)viewControllerWithAssets:(id)a3;
- (NSArray)faces;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (NTKEChooseWatchFaceViewController)initWithFaces:(id)a3;
- (UILayoutGuide)contentGuide;
- (UIScrollView)scrollView;
- (int64_t)preferredStatusBarStyle;
- (void)_adjustContentHeight;
- (void)_updateEdgeMargins;
- (void)dealloc;
- (void)didChooseFace:(id)a3;
- (void)setContentGuide:(id)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setFaces:(id)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKEChooseWatchFaceViewController

+ (id)viewControllerWithAssets:(id)a3
{
  id v44 = a3;
  id v3 = +[CLKDevice currentDevice];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  v4 = (void (*)(id))off_1000115A0;
  v56 = off_1000115A0;
  if (!off_1000115A0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v60 = sub_100005B30;
    v61 = &unk_10000C348;
    v62 = &v53;
    v5 = (void *)sub_100005B80();
    v6 = dlsym(v5, "NTKAllAvailableFaceDescriptors");
    *(void *)(v62[1] + 24) = v6;
    off_1000115A0 = *(_UNKNOWN **)(v62[1] + 24);
    v4 = (void (*)(id))v54[3];
  }
  _Block_object_dispose(&v53, 8);
  if (!v4)
  {
    sub_1000080B4();
    __break(1u);
  }
  v7 = v4(v3);

  v43 = +[NSMutableArray array];
  int v8 = MGGetBoolAnswer();
  v9 = sub_1000035DC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "NO";
    if (v8) {
      v10 = "YES";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "hasAppleNeuralEngine = %s", (uint8_t *)&buf, 0xCu);
  }

  v42 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v50;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v16 = [v15 faceClass];
        unsigned int v17 = [v16 supportsExternalAssets];
        if ((v17 & ([v16 needsAppleNeuralEngine] ^ 1 | v8)) == 1)
        {
          v18 = [v16 sortableFaceWithAssets:v44 forDevice:v3];
          if (v18)
          {
            v19 = [v15 bundleIdentifier];
            v20 = v19;
            if (v19)
            {
              id v21 = v19;
            }
            else
            {
              +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"faceStyle(%ld)", [v15 faceStyle]);
              id v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            v22 = v21;

            [v42 addObject:v22];
            [v43 addObject:v18];
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v12);
  }

  v23 = sub_1000035DC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v42;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Found faces to use: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if ([v43 count] == (id)1)
  {
    v24 = [v43 firstObject];
    v25 = [v24 face];
    v26 = sub_1000036F4(v25);
    v27 = objc_msgSend(v26, "ntke_cancelExtensionBarButton");
    v28 = [v26 navigationItem];
    [v28 setLeftBarButtonItem:v27];

    id v29 = v26;
  }
  else
  {
    [v43 sortUsingSelector:"compare:"];
    v24 = +[NSMutableArray array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v30 = v43;
    id v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v46;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) face];
          if (v34) {
            [v24 addObject:v34];
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v31);
    }

    id v35 = objc_alloc((Class)a1);
    id v36 = [v24 copy];
    id v37 = [v35 initWithFaces:v36];

    v38 = objc_msgSend(v37, "ntke_cancelExtensionBarButton");
    v39 = [v37 navigationItem];
    [v39 setLeftBarButtonItem:v38];

    id v29 = v37;
  }

  return v29;
}

- (NTKEChooseWatchFaceViewController)initWithFaces:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKEChooseWatchFaceViewController;
  v5 = [(NTKEChooseWatchFaceViewController *)&v17 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [v4 copy];
    [(NTKEChooseWatchFaceViewController *)v5 setFaces:v6];

    v7 = +[NSBundle mainBundle];
    int v8 = [v7 localizedStringForKey:@"CHOOSE_WATCH_FACE" value:&stru_10000C520 table:0];
    [(NTKEChooseWatchFaceViewController *)v5 setTitle:v8];

    v9 = [(NTKEChooseWatchFaceViewController *)v5 navigationItem];
    [v9 _setLargeTitleTwoLineMode:1];

    id v10 = objc_alloc((Class)UIBarButtonItem);
    id v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"CHOOSE_WATCH_FACE_BACK" value:&stru_10000C520 table:0];
    id v13 = [v10 initWithTitle:v12 style:0 target:0 action:0];
    v14 = [(NTKEChooseWatchFaceViewController *)v5 navigationItem];
    [v14 setBackBarButtonItem:v13];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v5 selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKEChooseWatchFaceViewController;
  [(NTKEChooseWatchFaceViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v126.receiver = self;
  v126.super_class = (Class)NTKEChooseWatchFaceViewController;
  [(NTKEChooseWatchFaceViewController *)&v126 viewDidLoad];
  id v3 = +[UIColor systemBackgroundColor];
  objc_super v4 = [(NTKEChooseWatchFaceViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = objc_opt_new();
  [(NTKEChooseWatchFaceViewController *)self setScrollView:v5];

  [(UIScrollView *)self->_scrollView setDelegate:self];
  id v6 = [(NTKEChooseWatchFaceViewController *)self view];
  [v6 addSubview:self->_scrollView];

  v7 = +[NSMutableArray array];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  int v8 = [(NTKEChooseWatchFaceViewController *)self faces];
  id v9 = [v8 countByEnumeratingWithState:&v122 objects:v130 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v123;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v123 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [[_NTKEFaceChoice alloc] initWithFace:*(void *)(*((void *)&v122 + 1) + 8 * i)];
        [(_NTKEFaceChoice *)v13 setDelegate:self];
        LODWORD(v14) = 1148846080;
        [(_NTKEFaceChoice *)v13 setContentHuggingPriority:1 forAxis:v14];
        LODWORD(v15) = 1148846080;
        [(_NTKEFaceChoice *)v13 setContentCompressionResistancePriority:1 forAxis:v15];
        [(_NTKEFaceChoice *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v122 objects:v130 count:16];
    }
    while (v10);
  }

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  v118 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v120 = [(NTKEChooseWatchFaceViewController *)self view];
  v114 = [v120 leadingAnchor];
  v111 = [v118 constraintEqualToAnchor:v114];
  v129[0] = v111;
  v105 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v108 = [(NTKEChooseWatchFaceViewController *)self view];
  v102 = [v108 trailingAnchor];
  v99 = [v105 constraintEqualToAnchor:v102];
  v129[1] = v99;
  v96 = [(UIScrollView *)self->_scrollView topAnchor];
  id v16 = [(NTKEChooseWatchFaceViewController *)self view];
  objc_super v17 = [v16 topAnchor];
  v18 = [v96 constraintEqualToAnchor:v17];
  v129[2] = v18;
  v19 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v20 = [(NTKEChooseWatchFaceViewController *)self view];
  id v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v129[3] = v22;
  v23 = +[NSArray arrayWithObjects:v129 count:4];

  v121 = v23;
  id v119 = [v23 mutableCopy];
  if ([v7 count] == (id)2)
  {
    id v24 = [v7 firstObject];
    LODWORD(v25) = 1148846080;
    [v24 setContentHuggingPriority:1 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [v24 setContentCompressionResistancePriority:1 forAxis:v26];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [v7 lastObject];
    LODWORD(v28) = 1148846080;
    [v27 setContentHuggingPriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [v27 setContentCompressionResistancePriority:1 forAxis:v29];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v30 = objc_opt_new();
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v30 addSubview:v24];
    [v30 addSubview:v27];
    [(UIScrollView *)self->_scrollView addSubview:v30];
    id v31 = (UILayoutGuide *)objc_opt_new();
    contentGuide = self->_contentGuide;
    self->_contentGuide = v31;

    v33 = [(NTKEChooseWatchFaceViewController *)self view];
    [v33 addLayoutGuide:self->_contentGuide];

    v34 = [v30 heightAnchor];
    id v35 = [v34 constraintEqualToConstant:0.0];
    [(NTKEChooseWatchFaceViewController *)self setContentViewHeightConstraint:v35];

    id v36 = [v24 leadingAnchor];
    id v37 = [(UILayoutGuide *)self->_contentGuide leadingAnchor];
    v38 = [v36 constraintGreaterThanOrEqualToAnchor:v37 constant:0.0];
    [(NTKEChooseWatchFaceViewController *)self setLeadingMarginConstraint:v38];

    v39 = [v24 trailingAnchor];
    v40 = [(UILayoutGuide *)self->_contentGuide trailingAnchor];
    v41 = [v39 constraintGreaterThanOrEqualToAnchor:v40 constant:-0.0];
    [(NTKEChooseWatchFaceViewController *)self setTrailingMarginConstraint:v41];

    [(NTKEChooseWatchFaceViewController *)self _updateEdgeMargins];
    v115 = [v30 leadingAnchor];
    v112 = [(UIScrollView *)self->_scrollView leadingAnchor];
    v109 = [v115 constraintEqualToAnchor:v112];
    v128[0] = v109;
    v106 = [v30 trailingAnchor];
    v103 = [(UIScrollView *)self->_scrollView trailingAnchor];
    v100 = [v106 constraintEqualToAnchor:v103];
    v128[1] = v100;
    v97 = [v30 topAnchor];
    v94 = [(UIScrollView *)self->_scrollView topAnchor];
    v93 = [v97 constraintEqualToAnchor:v94];
    v128[2] = v93;
    v92 = [v30 bottomAnchor];
    v91 = [(UIScrollView *)self->_scrollView bottomAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    contentViewHeightConstraint = self->_contentViewHeightConstraint;
    v128[3] = v90;
    v128[4] = contentViewHeightConstraint;
    v89 = [v30 widthAnchor];
    v117 = [(UIScrollView *)self->_scrollView widthAnchor];
    v88 = [v89 constraintEqualToAnchor:v117];
    v128[5] = v88;
    v87 = [(UILayoutGuide *)self->_contentGuide leadingAnchor];
    v86 = [v30 leadingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v128[6] = v85;
    [(UILayoutGuide *)self->_contentGuide trailingAnchor];
    v84 = v83 = v30;
    v82 = [v30 trailingAnchor];
    v81 = [v84 constraintEqualToAnchor:v82];
    v128[7] = v81;
    v80 = [v24 centerXAnchor];
    v79 = [(UILayoutGuide *)self->_contentGuide centerXAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v128[8] = v78;
    v43 = v27;
    v77 = [v27 centerXAnchor];
    v76 = [v24 centerXAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    leadingMarginConstraint = self->_leadingMarginConstraint;
    v128[9] = v75;
    v128[10] = leadingMarginConstraint;
    v128[11] = self->_trailingMarginConstraint;
    v73 = [v27 leadingAnchor];
    v72 = [v24 leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v128[12] = v71;
    v70 = [v27 trailingAnchor];
    v69 = [v24 trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v128[13] = v68;
    v67 = [(UILayoutGuide *)self->_contentGuide centerYAnchor];
    v66 = [v30 centerYAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v128[14] = v65;
    v64 = [v24 topAnchor];
    v63 = [(UILayoutGuide *)self->_contentGuide topAnchor];
    long long v45 = [v64 constraintEqualToAnchor:v63 constant:14.0];
    v128[15] = v45;
    long long v46 = [v27 topAnchor];
    long long v47 = [v24 bottomAnchor];
    long long v48 = [v46 constraintEqualToAnchor:v47 constant:30.0];
    v128[16] = v48;
    long long v49 = [v43 bottomAnchor];
    long long v50 = [(UILayoutGuide *)self->_contentGuide bottomAnchor];
    long long v51 = [v49 constraintEqualToAnchor:v50 constant:-14.0];
    v128[17] = v51;
    v74 = +[NSArray arrayWithObjects:v128 count:18];

    long long v52 = v43;
    uint64_t v53 = v119;
    [v119 addObjectsFromArray:v74];
  }
  else
  {
    id v24 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v7];
    [v24 setAxis:1];
    [v24 setSpacing:30.0];
    [v24 setAlignment:0];
    [v24 setDistribution:3];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)self->_scrollView addSubview:v24];
    v116 = [v24 leadingAnchor];
    v113 = [(UIScrollView *)self->_scrollView leadingAnchor];
    v110 = [v116 constraintEqualToAnchor:v113];
    v127[0] = v110;
    v107 = [v24 trailingAnchor];
    v104 = [(UIScrollView *)self->_scrollView trailingAnchor];
    v101 = [v107 constraintEqualToAnchor:v104];
    v127[1] = v101;
    v98 = [v24 topAnchor];
    v95 = [(UIScrollView *)self->_scrollView topAnchor];
    v54 = [v98 constraintEqualToAnchor:v95];
    v127[2] = v54;
    uint64_t v55 = [v24 bottomAnchor];
    v56 = [(UIScrollView *)self->_scrollView bottomAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v127[3] = v57;
    v58 = [v24 widthAnchor];
    v59 = [(UIScrollView *)self->_scrollView widthAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v127[4] = v60;
    uint64_t v61 = +[NSArray arrayWithObjects:v127 count:5];

    long long v52 = (void *)v61;
    uint64_t v53 = v119;
    [v119 addObjectsFromArray:v52];
  }

  id v62 = [v53 copy];
  +[NSLayoutConstraint activateConstraints:v62];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKEChooseWatchFaceViewController;
  [(NTKEChooseWatchFaceViewController *)&v3 viewDidLayoutSubviews];
  [(NTKEChooseWatchFaceViewController *)self _adjustContentHeight];
}

- (void)_adjustContentHeight
{
  if (self->_contentViewHeightConstraint)
  {
    objc_super v3 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
    [v3 layoutFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UIScrollView *)self->_scrollView adjustedContentInset];
    CGFloat v13 = v7 + v12;
    CGFloat v16 = v9 - (v14 + v15);
    v22.size.height = v11 - (v12 + v17);
    v22.origin.x = v5 + v14;
    v22.origin.y = v13;
    v22.size.width = v16;
    double Height = CGRectGetHeight(v22);

    [(UILayoutGuide *)self->_contentGuide layoutFrame];
    double v19 = CGRectGetHeight(v23);
    if (Height >= v19) {
      double v19 = Height;
    }
    contentViewHeightConstraint = self->_contentViewHeightConstraint;
    [(NSLayoutConstraint *)contentViewHeightConstraint setConstant:v19];
  }
}

- (void)_updateEdgeMargins
{
  if (self->_leadingMarginConstraint)
  {
    double v3 = 0.0;
    if (!sub_100004998())
    {
      uint64_t v7 = 0;
      double v8 = &v7;
      uint64_t v9 = 0x2020000000;
      double v4 = (double (*)(void))off_1000115B8;
      double v10 = off_1000115B8;
      if (!off_1000115B8)
      {
        double v5 = (void *)sub_100005B80();
        v8[3] = (uint64_t)dlsym(v5, "NTKCScreenEdgeMargin");
        off_1000115B8 = (_UNKNOWN *)v8[3];
        double v4 = (double (*)(void))v8[3];
      }
      _Block_object_dispose(&v7, 8);
      if (!v4)
      {
        double v6 = (_Unwind_Exception *)sub_1000080B4();
        _Block_object_dispose(&v7, 8);
        _Unwind_Resume(v6);
      }
      double v3 = v4();
    }
    [(NSLayoutConstraint *)self->_leadingMarginConstraint setConstant:v3];
    [(NSLayoutConstraint *)self->_trailingMarginConstraint setConstant:-v3];
  }
}

- (void)didChooseFace:(id)a3
{
  sub_1000036F4(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(NTKEChooseWatchFaceViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (NSArray)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (void)setContentGuide:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_faces, 0);
}

@end