@interface GuidesHomeViewController
- (CGPoint)contentOffset;
- (ContainerHeaderView)titleHeaderView;
- (ErrorModeView)errorView;
- (GEOGuideLocation)guideLocation;
- (GEOMapServiceTraits)traits;
- (GradientView)citySelectionBackgroundView;
- (GuideHomeCompositionalLayout)layout;
- (GuidesHomeAPIController)apiController;
- (GuidesHomeAnalyticsManager)analyticsManager;
- (GuidesHomeDataSource)dataSource;
- (GuidesHomeViewController)initWithGuideLocation:(id)a3 withTraits:(id)a4;
- (LoadingModeView)loadingView;
- (UIButton)citySelectorButton;
- (UICollectionView)collectionView;
- (UIView)citySelectionView;
- (double)actualCardHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)backgroundViewForCitySelector;
- (id)createLayoutUsingWidth:(double)a3;
- (unint64_t)containeeLayout;
- (void)activateConstraintsForViewAligningHeader:(id)a3;
- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3 headerView:(id)a4;
- (void)activateHeaderConstraints;
- (void)addDefaultHeaderView;
- (void)addGuidesHomeCollectionsView;
- (void)addLoadingView;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didSelectGuide:(id)a3;
- (void)didTapCitySelectorButton:(id)a3;
- (void)dismissGuidesHome;
- (void)handleDismissAction:(id)a3;
- (void)initializeDataSource;
- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)removeCitySelectionUI;
- (void)removeCollectionView;
- (void)removeDefaultHeaderView;
- (void)removeLoadingView;
- (void)resetCollectionViewLayout;
- (void)resetDefaultHeaderConstraints;
- (void)routeToCitySelector;
- (void)routeToCuratedCollection:(id)a3;
- (void)routeToGuideLocation:(id)a3;
- (void)routeToPublisher:(id)a3;
- (void)routeToSingleCuratedCollection:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActualCardHeight:(double)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApiController:(id)a3;
- (void)setCitySelectionBackgroundView:(id)a3;
- (void)setCitySelectionView:(id)a3;
- (void)setCitySelectorButton:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContaineeLayout:(unint64_t)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDataSource:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setGuideLocation:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setTraits:(id)a3;
- (void)setupCitySelectionUI;
- (void)setupCitySelectionUIGradientView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GuidesHomeViewController

- (GuidesHomeViewController)initWithGuideLocation:(id)a3 withTraits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GuidesHomeViewController;
  v9 = [(GuidesHomeViewController *)&v16 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_guideLocation, a3);
    objc_storeStrong((id *)&v10->_traits, a4);
    v10->_contentOffset = CGPointZero;
    uint64_t v11 = sub_1000BBB44(v10);
    v12 = [(ContaineeViewController *)v10 cardPresentationController];
    v13 = v12;
    if (v11 == 5)
    {
      [v12 setAllowResizeInFloatingStyle:1];

      v14 = [(ContaineeViewController *)v10 cardPresentationController];
      [v14 setDefaultContaineeLayout:3];
    }
    else
    {
      [v12 setPresentedModally:1];

      v14 = [(ContaineeViewController *)v10 cardPresentationController];
      [v14 setTakesAvailableHeight:1];
    }
  }
  return v10;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  [(GuidesHomeViewController *)self dismissGuidesHome];
  v5.receiver = self;
  v5.super_class = (Class)GuidesHomeViewController;
  [(ContaineeViewController *)&v5 handleDismissAction:v4];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)GuidesHomeViewController;
  [(ContaineeViewController *)&v12 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [GuidesHomeAPIController alloc];
  id v4 = [(GuidesHomeViewController *)self guideLocation];
  objc_copyWeak(&v10, &location);
  objc_super v5 = [(GuidesHomeViewController *)self traits];
  v6 = [(GuidesHomeAPIController *)v3 initWithGuideLocation:v4 onStateChangeHandler:&v9 traits:v5];
  [(GuidesHomeViewController *)self setApiController:v6];

  id v7 = [(GuidesHomeViewController *)self apiController];
  [v7 fetchGuidesHomeViewFilteredBy:0 onCompletion:&stru_1012F4A88];

  id v8 = [(GuidesHomeViewController *)self view];
  [v8 setAccessibilityIdentifier:@"GuidesHomeView"];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setGuideLocation:(id)a3
{
  objc_super v5 = (GEOGuideLocation *)a3;
  if (self->_guideLocation != v5)
  {
    objc_storeStrong((id *)&self->_guideLocation, a3);
    v6 = [(GuidesHomeViewController *)self apiController];
    [v6 refreshWithGuideLocation:self->_guideLocation];

    id v7 = [(GuidesHomeViewController *)self dataSource];
    [v7 refreshedGuideLocation];

    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1006AC62C;
    v10[3] = &unk_1012E6708;
    objc_copyWeak(&v11, &location);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1006AC6BC;
    v8[3] = &unk_1012E6998;
    objc_copyWeak(&v9, &location);
    +[UIView _animateWithDuration:0x10000 delay:v10 options:0 animations:v8 start:0.2 completion:0.0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GuidesHomeViewController;
  [(ContaineeViewController *)&v8 didChangeLayout:"didChangeLayout:"];
  uint64_t v5 = [(GuidesHomeViewController *)self collectionView];
  if (v5)
  {
    v6 = (void *)v5;
    unint64_t v7 = [(GuidesHomeViewController *)self containeeLayout];

    if (v7 != a3)
    {
      [(GuidesHomeViewController *)self setContaineeLayout:a3];
      [(GuidesHomeViewController *)self resetCollectionViewLayout];
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5 = sub_1000BBB44(self);
  if (a3 != 1 || (double result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)GuidesHomeViewController;
    [(ContaineeViewController *)&v7 heightForLayout:a3];
  }
  return result;
}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  objc_super v7 = sub_1006ACAF0();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = sub_1006ACAF0();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DisplayingGuideHomeView", "", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1) {
        goto LABEL_14;
      }
      goto LABEL_20;
    case 1:
      if (a4 == 3)
      {
        [(GuidesHomeViewController *)self removeLoadingView];
        [(GuidesHomeViewController *)self removeCollectionView];
        [(GuidesHomeViewController *)self addErrorView];
      }
      else if (a4 == 2)
      {
        id v11 = [(GuidesHomeViewController *)self apiController];
        objc_super v12 = [v11 guideHomeSingleCollectionIdentifier];

        if (v12)
        {
          [(GuidesHomeViewController *)self routeToSingleCuratedCollection:v12];
          goto LABEL_23;
        }
        [(GuidesHomeViewController *)self removeLoadingView];
        [(GuidesHomeViewController *)self removeDefaultHeaderView];
        [(GuidesHomeViewController *)self setupCitySelectionUI];
        [(GuidesHomeViewController *)self addGuidesHomeCollectionsView];
        v17 = [(GuidesHomeViewController *)self collectionView];
        [(GuidesHomeViewController *)self activateConstraintsForViewAligningHeader:v17];

        [(GuidesHomeViewController *)self setupCitySelectionUIGradientView];
        v18 = [(ContaineeViewController *)self contentView];
        v19 = [(GuidesHomeViewController *)self citySelectionView];
        [v18 bringSubviewToFront:v19];
      }
LABEL_20:
      v20 = sub_1006ACAF0();
      objc_super v12 = v20;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v8, "DisplayingGuideHomeView", "", v21, 2u);
      }
LABEL_23:

      return;
    case 2:
      if (a4 != 1) {
        goto LABEL_20;
      }
      v13 = [(GuidesHomeViewController *)self apiController];
      unsigned __int8 v14 = [v13 isFilteredGuidesHome];

      if (v14) {
        goto LABEL_20;
      }
      [(GuidesHomeViewController *)self removeCollectionView];
      [(GuidesHomeViewController *)self removeCitySelectionUI];
      v15 = [(GuidesHomeViewController *)self view];
      objc_super v16 = [(ContaineeViewController *)self headerView];
      [v15 addSubview:v16];

      [(GuidesHomeViewController *)self resetDefaultHeaderConstraints];
LABEL_14:
      [(GuidesHomeViewController *)self addDefaultHeaderView];
      [(GuidesHomeViewController *)self activateHeaderConstraints];
      goto LABEL_17;
    case 3:
      if (a4 != 1) {
        goto LABEL_20;
      }
      [(GuidesHomeViewController *)self removeErrorView];
LABEL_17:
      [(GuidesHomeViewController *)self addLoadingView];
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GuidesHomeViewController;
  [(GuidesHomeViewController *)&v5 viewDidAppear:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 cardHeight];
  -[GuidesHomeViewController setActualCardHeight:](self, "setActualCardHeight:");
}

- (void)setupCitySelectionUI
{
  v3 = [(GuidesHomeViewController *)self citySelectionView];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)UIView);
    [(GuidesHomeViewController *)self setCitySelectionView:v4];

    objc_super v5 = [(GuidesHomeViewController *)self citySelectionView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = +[UIColor clearColor];
    uint64_t v7 = [(GuidesHomeViewController *)self citySelectionView];
    [(id)v7 setBackgroundColor:v6];

    os_signpost_id_t v8 = [(GuidesHomeViewController *)self citySelectionView];
    [v8 setUserInteractionEnabled:1];

    id v9 = [(GuidesHomeViewController *)self citySelectionView];
    [v9 setAccessibilityIdentifier:@"GuidesHomeCitySelectionView"];

    id v10 = [(GuidesHomeViewController *)self apiController];
    LOBYTE(v7) = [v10 isCuratedGuidesHome];

    if ((v7 & 1) == 0)
    {
      id v11 = [(GuidesHomeViewController *)self citySelectionView];
      id v12 = [v11 _maps_addHairlineAtBottomWithLeadingMargin:16.0 trailingMargin:0.0];
    }
    id v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v13 setAccessibilityIdentifier:@"TitleLabel"];
    unsigned __int8 v14 = +[UIFont system17Bold];
    [v13 setFont:v14];

    v15 = [(GuidesHomeViewController *)self apiController];
    if ([v15 isCuratedGuidesHome])
    {
      objc_super v16 = +[UIColor whiteColor];
      v17 = [v16 colorWithAlphaComponent:0.8];
      [v13 setTextColor:v17];
    }
    else
    {
      objc_super v16 = +[UIColor secondaryLabelColor];
      [v13 setTextColor:v16];
    }

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setNumberOfLines:1];
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"[Guide Home View] Guide Home" value:@"localized string not found" table:0];
    [v13 setText:v19];

    v20 = [(GuidesHomeViewController *)self citySelectionView];
    [v20 addSubview:v13];

    v21 = +[UIButtonConfiguration plainButtonConfiguration];
    v22 = +[UIColor clearColor];
    v23 = [v21 background];
    [v23 setBackgroundColor:v22];

    v24 = [v21 background];
    [v24 setCornerRadius:0.0];

    [v21 setContentInsets:0.0, 0.0, 0.0, 0.0];
    v201[0] = _NSConcreteStackBlock;
    v201[1] = 3221225472;
    v201[2] = sub_1006AE230;
    v201[3] = &unk_1012E90F0;
    v201[4] = self;
    [v21 setTitleTextAttributesTransformer:v201];
    v25 = [(GuidesHomeViewController *)self apiController];
    uint64_t v26 = [v25 guideLocationName];

    if (v26) {
      [v21 setTitle:v26];
    }
    v196 = (void *)v26;
    v197 = v21;
    v27 = +[UIButton buttonWithConfiguration:v21 primaryAction:0];
    [(GuidesHomeViewController *)self setCitySelectorButton:v27];

    v28 = [(GuidesHomeViewController *)self citySelectorButton];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(GuidesHomeViewController *)self citySelectorButton];
    [v29 setAccessibilityIdentifier:@"CitySelectorButton"];

    v30 = [(GuidesHomeViewController *)self apiController];
    unsigned int v31 = [v30 isCuratedGuidesHome];

    v32 = [(GuidesHomeViewController *)self citySelectorButton];
    v33 = v32;
    v200 = v13;
    if (v31) {
      [v32 addTarget:self action:"didTapCitySelectorButton:" forControlEvents:64];
    }
    else {
      [v32 setUserInteractionEnabled:0];
    }

    v34 = [(GuidesHomeViewController *)self citySelectionView];
    v35 = [(GuidesHomeViewController *)self citySelectorButton];
    [v34 addSubview:v35];

    id v36 = objc_alloc_init((Class)UIView);
    [v36 setAccessibilityIdentifier:@"ChevronView"];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = +[UIColor clearColor];
    [v36 setBackgroundColor:v37];

    [v36 setUserInteractionEnabled:1];
    v195 = +[UIBlurEffect effectWithStyle:11];
    id v38 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v195];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
    v199 = v38;
    [v36 addSubview:v38];
    v39 = +[UIButton buttonWithType:0];
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:15.0];
    v41 = +[UIImage systemImageNamed:@"chevron.down" withConfiguration:v40];

    uint64_t v42 = [v41 imageWithRenderingMode:2];

    v43 = +[UIColor whiteColor];
    [v39 setTintColor:v43];

    v194 = (void *)v42;
    [v39 setImage:v42 forState:0];
    [v39 addTarget:self action:"didTapCitySelectorButton:" forControlEvents:64];
    v198 = v39;
    [v36 addSubview:v39];
    [v36 _setContinuousCornerRadius:12.0];
    [v36 setClipsToBounds:1];
    v44 = [(GuidesHomeViewController *)self citySelectionView];
    v45 = v36;
    [v44 addSubview:v36];

    id v46 = objc_alloc_init((Class)UIView);
    [v46 setAccessibilityIdentifier:@"CloseButton"];
    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v46 setUserInteractionEnabled:1];
    id v47 = objc_alloc((Class)UIVisualEffectView);
    v48 = +[UIBlurEffect effectWithStyle:11];
    id v49 = [v47 initWithEffect:v48];

    [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v46 addSubview:v49];
    v50 = [(GuidesHomeViewController *)self apiController];
    LODWORD(v48) = [v50 isCuratedGuidesHome];

    if (v48)
    {
      v51 = +[UIButton buttonWithType:0];
    }
    else
    {
      v51 = +[UIButton buttonWithType:7];
      [v49 setHidden:1];
    }
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = v51;
    v53 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:15.0];
    v54 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v53];

    v193 = [v54 imageWithRenderingMode:2];

    v55 = +[UIColor whiteColor];
    [v52 setTintColor:v55];

    [v52 setImage:v193 forState:0];
    [v52 addTarget:self action:"closeButtonTaped:" forControlEvents:64];
    [v46 _setContinuousCornerRadius:15.0];
    [v46 setClipsToBounds:1];
    [v46 addSubview:v52];
    v56 = [(GuidesHomeViewController *)self citySelectionView];
    [v56 addSubview:v46];

    v57 = [(ContaineeViewController *)self contentView];
    v58 = [(GuidesHomeViewController *)self citySelectionView];
    [v57 addSubview:v58];

    v59 = [v200 text];
    NSAttributedStringKey v203 = NSFontAttributeName;
    v60 = [v200 font];
    v204 = v60;
    +[NSDictionary dictionaryWithObjects:&v204 forKeys:&v203 count:1];
    v62 = v61 = v46;
    [v59 sizeWithAttributes:v62];
    double v64 = v63;

    v192 = [v45 heightAnchor];
    v191 = [v192 constraintEqualToConstant:24.0];
    v202[0] = v191;
    v190 = [v45 widthAnchor];
    v189 = [v190 constraintEqualToConstant:24.0];
    v202[1] = v189;
    v188 = [v199 topAnchor];
    v187 = [v45 topAnchor];
    v186 = [v188 constraintEqualToAnchor:v187];
    v202[2] = v186;
    v185 = [v199 leadingAnchor];
    v184 = [v45 leadingAnchor];
    v183 = [v185 constraintEqualToAnchor:v184];
    v202[3] = v183;
    v182 = [v199 trailingAnchor];
    v181 = [v45 trailingAnchor];
    v180 = [v182 constraintEqualToAnchor:v181];
    v202[4] = v180;
    v179 = [v199 bottomAnchor];
    v178 = [v45 bottomAnchor];
    v177 = [v179 constraintEqualToAnchor:v178];
    v202[5] = v177;
    v176 = [v198 topAnchor];
    v175 = [v199 topAnchor];
    v174 = [v176 constraintEqualToAnchor:v175 constant:2.0];
    v202[6] = v174;
    v173 = [v198 leadingAnchor];
    v172 = [v199 leadingAnchor];
    v171 = [v173 constraintEqualToAnchor:v172 constant:0.5];
    v202[7] = v171;
    v170 = [v198 trailingAnchor];
    v169 = [v199 trailingAnchor];
    v168 = [v170 constraintEqualToAnchor:v169];
    v202[8] = v168;
    v166 = [v198 bottomAnchor];
    v165 = [v199 bottomAnchor];
    v164 = [v166 constraintEqualToAnchor:v165];
    v202[9] = v164;
    v162 = [v61 topAnchor];
    v163 = [(GuidesHomeViewController *)self citySelectionView];
    v161 = [v163 topAnchor];
    v160 = [v162 constraintEqualToAnchor:v161 constant:16.0];
    v202[10] = v160;
    v167 = v61;
    v157 = [v61 trailingAnchor];
    v158 = [(GuidesHomeViewController *)self citySelectionView];
    v156 = [v158 trailingAnchor];
    v155 = [v157 constraintEqualToAnchor:v156 constant:-16.0];
    v202[11] = v155;
    v154 = [v61 heightAnchor];
    v153 = [v154 constraintEqualToConstant:30.0];
    v202[12] = v153;
    v152 = [v61 widthAnchor];
    v151 = [v152 constraintEqualToConstant:30.0];
    v202[13] = v151;
    v150 = [v49 topAnchor];
    v149 = [v61 topAnchor];
    v148 = [v150 constraintEqualToAnchor:v149];
    v202[14] = v148;
    v147 = [v49 leadingAnchor];
    v146 = [v61 leadingAnchor];
    v145 = [v147 constraintEqualToAnchor:v146];
    v202[15] = v145;
    v144 = [v49 trailingAnchor];
    v143 = [v61 trailingAnchor];
    v142 = [v144 constraintEqualToAnchor:v143];
    v202[16] = v142;
    v141 = [v49 bottomAnchor];
    v140 = [v61 bottomAnchor];
    v139 = [v141 constraintEqualToAnchor:v140];
    v202[17] = v139;
    v138 = [v52 topAnchor];
    v137 = [v49 topAnchor];
    v136 = [v138 constraintEqualToAnchor:v137];
    v202[18] = v136;
    v134 = [v52 leadingAnchor];
    v133 = [v49 leadingAnchor];
    v132 = [v134 constraintEqualToAnchor:v133];
    v202[19] = v132;
    v159 = v52;
    v131 = [v52 trailingAnchor];
    v130 = [v49 trailingAnchor];
    v129 = [v131 constraintEqualToAnchor:v130];
    v202[20] = v129;
    v128 = [v52 bottomAnchor];
    v127 = [v49 bottomAnchor];
    v126 = [v128 constraintEqualToAnchor:v127];
    v202[21] = v126;
    v123 = [v200 leadingAnchor];
    v124 = [(GuidesHomeViewController *)self citySelectionView];
    v122 = [v124 leadingAnchor];
    v121 = [v123 constraintEqualToAnchor:v122 constant:16.0];
    v202[22] = v121;
    v119 = [v200 trailingAnchor];
    v120 = [(GuidesHomeViewController *)self citySelectionView];
    v118 = [v120 trailingAnchor];
    v117 = [v119 constraintEqualToAnchor:v118];
    v202[23] = v117;
    v115 = [v200 topAnchor];
    v116 = [(GuidesHomeViewController *)self citySelectionView];
    v114 = [v116 topAnchor];
    v113 = [v115 constraintEqualToAnchor:v114 constant:26.0];
    v202[24] = v113;
    v112 = [v200 heightAnchor];
    v111 = [v112 constraintEqualToConstant:v64];
    v202[25] = v111;
    v110 = [(GuidesHomeViewController *)self citySelectorButton];
    v109 = [v110 leadingAnchor];
    v108 = [v200 leadingAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v202[26] = v107;
    v106 = [(GuidesHomeViewController *)self citySelectorButton];
    v104 = [v106 trailingAnchor];
    v105 = [(GuidesHomeViewController *)self citySelectionView];
    v103 = [v105 trailingAnchor];
    v102 = [v104 constraintLessThanOrEqualToAnchor:v103 constant:-16.0];
    v202[27] = v102;
    v101 = [(GuidesHomeViewController *)self citySelectorButton];
    v100 = [v101 topAnchor];
    v99 = [v200 bottomAnchor];
    v98 = [v100 constraintEqualToAnchor:v99];
    v202[28] = v98;
    v135 = v45;
    v96 = [v45 leadingAnchor];
    v97 = [(GuidesHomeViewController *)self citySelectorButton];
    v95 = [v97 trailingAnchor];
    v94 = [v96 constraintEqualToAnchor:v95 constant:8.0];
    v202[29] = v94;
    v92 = [v45 centerYAnchor];
    v93 = [(GuidesHomeViewController *)self citySelectorButton];
    v91 = [v93 centerYAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v202[30] = v90;
    v89 = [(GuidesHomeViewController *)self citySelectionView];
    v87 = [v89 topAnchor];
    v88 = [(ContaineeViewController *)self contentView];
    v86 = [v88 topAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v202[31] = v85;
    v84 = [(GuidesHomeViewController *)self citySelectionView];
    v82 = [v84 leadingAnchor];
    v83 = [(ContaineeViewController *)self contentView];
    v81 = [v83 leadingAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v202[32] = v80;
    v79 = [(GuidesHomeViewController *)self citySelectionView];
    v77 = [v79 trailingAnchor];
    v78 = [(ContaineeViewController *)self contentView];
    v76 = [v78 trailingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v202[33] = v75;
    v65 = [(GuidesHomeViewController *)self citySelectionView];
    v66 = [v65 heightAnchor];
    +[GuideHomeHeaderView minimumRequiredHeight];
    [v66 constraintGreaterThanOrEqualToConstant:];
    v67 = v125 = v49;
    v202[34] = v67;
    v68 = [(GuidesHomeViewController *)self citySelectionView];
    v69 = [v68 bottomAnchor];
    v70 = [(GuidesHomeViewController *)self citySelectorButton];
    v71 = [v70 bottomAnchor];
    v72 = [v69 constraintEqualToAnchor:v71 constant:15.0];
    v202[35] = v72;
    v73 = +[NSArray arrayWithObjects:v202 count:36];
    +[NSLayoutConstraint activateConstraints:v73];

    v74 = [(GuidesHomeViewController *)self apiController];
    [v135 setHidden:[v74 isCuratedGuidesHome] ^ 1];
  }
}

- (void)setupCitySelectionUIGradientView
{
  v3 = [(GuidesHomeViewController *)self citySelectionView];

  if (v3)
  {
    id v31 = [(GuidesHomeViewController *)self apiController];
    if ([v31 isCuratedGuidesHome])
    {
      id v4 = [(GuidesHomeViewController *)self citySelectionBackgroundView];

      if (!v4)
      {
        objc_super v5 = [(GuidesHomeViewController *)self backgroundViewForCitySelector];
        [(GuidesHomeViewController *)self setCitySelectionBackgroundView:v5];

        v6 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        [v6 setAlpha:0.0];

        uint64_t v7 = [(GuidesHomeViewController *)self citySelectionView];
        os_signpost_id_t v8 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        [v7 addSubview:v8];

        id v9 = [(GuidesHomeViewController *)self citySelectionView];
        id v10 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        [v9 sendSubviewToBack:v10];

        id v32 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        v29 = [v32 topAnchor];
        v30 = [(GuidesHomeViewController *)self citySelectionView];
        v28 = [v30 topAnchor];
        v27 = [v29 constraintEqualToAnchor:v28];
        v33[0] = v27;
        uint64_t v26 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        v24 = [v26 leadingAnchor];
        v25 = [(GuidesHomeViewController *)self citySelectionView];
        v23 = [v25 leadingAnchor];
        v22 = [v24 constraintEqualToAnchor:v23];
        v33[1] = v22;
        v21 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        id v11 = [v21 trailingAnchor];
        id v12 = [(GuidesHomeViewController *)self citySelectionView];
        id v13 = [v12 trailingAnchor];
        unsigned __int8 v14 = [v11 constraintEqualToAnchor:v13];
        v33[2] = v14;
        v15 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
        objc_super v16 = [v15 bottomAnchor];
        v17 = [(GuidesHomeViewController *)self citySelectionView];
        v18 = [v17 bottomAnchor];
        v19 = [v16 constraintEqualToAnchor:v18];
        v33[3] = v19;
        v20 = +[NSArray arrayWithObjects:v33 count:4];
        +[NSLayoutConstraint activateConstraints:v20];
      }
    }
    else
    {
    }
  }
}

- (id)backgroundViewForCitySelector
{
  v3 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(GradientView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(GuidesHomeViewController *)self dataSource];
  objc_super v5 = [v4 featuredGuideViewModel];
  v6 = [v5 backgroundColor];
  [(GradientView *)v3 setBackgroundColor:v6];

  [(GradientView *)v3 setAlpha:0.0];

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(GuidesHomeViewController *)self apiController];
  unsigned __int8 v6 = [v5 isCuratedGuidesHome];

  if (v6)
  {
    uint64_t v7 = [(GuidesHomeViewController *)self dataSource];
    if ([v7 currentState] == (id)1)
    {
LABEL_13:

      goto LABEL_14;
    }
    os_signpost_id_t v8 = [(GuidesHomeViewController *)self layout];
    id v9 = [(GuidesHomeViewController *)self collectionView];
    id v10 = [v9 collectionViewLayout];

    if (v8 == v10)
    {
      [v4 contentOffset];
      -[GuidesHomeViewController setContentOffset:](self, "setContentOffset:");
      [v4 contentOffset];
      double v12 = v11;
      id v13 = [(GuidesHomeViewController *)self dataSource];
      uint64_t v7 = [v13 featuredGuideViewModel];

      unsigned __int8 v14 = [v7 collectionLongTitle];
      v15 = v14;
      if (!v14)
      {
        v15 = [v7 collectionTitle];
      }
      objc_super v16 = [(ContaineeViewController *)self contentView];
      [v16 frame];
      +[GuideHomeHeaderView maximumRequiredHeightWithFeaturedGuideTitle:v15 maxWidth:v17];
      double v19 = v18;
      +[GuideHomeHeaderView minimumRequiredHeight];
      double v21 = v20;

      if (!v14) {
      v22 = [(GuidesHomeViewController *)self citySelectionBackgroundView];
      }
      v23 = v22;
      if (v12 >= 420.0) {
        double v24 = fmin(fmax(v12 / (v19 - v21), 0.0), 1.0);
      }
      else {
        double v24 = 0.0;
      }
      [v22 setAlpha:v24];

      v25 = [(GuidesHomeViewController *)self dataSource];
      [v25 didChangeContentYOffset:v12];

      v26.receiver = self;
      v26.super_class = (Class)GuidesHomeViewController;
      [(ContaineeViewController *)&v26 scrollViewDidScroll:v4];
      goto LABEL_13;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)GuidesHomeViewController;
    [(ContaineeViewController *)&v27 scrollViewDidScroll:v4];
  }
LABEL_14:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v8.receiver = self;
  v8.super_class = (Class)GuidesHomeViewController;
  [(ContaineeViewController *)&v8 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  if (y >= 0.0)
  {
    if (y <= 0.0) {
      return;
    }
    uint64_t v7 = [(GuidesHomeViewController *)self analyticsManager];
    [v7 guidesHomeScrolledDown];
  }
  else
  {
    uint64_t v7 = [(GuidesHomeViewController *)self analyticsManager];
    [v7 guidesHomeScrolledUp];
  }
}

- (void)initializeDataSource
{
  v3 = [(GuidesHomeViewController *)self dataSource];

  if (!v3)
  {
    id v4 = [(GuidesHomeViewController *)self analyticsManager];

    if (v4)
    {
      objc_super v5 = [(GuidesHomeViewController *)self analyticsManager];
      unsigned __int8 v6 = [(GuidesHomeViewController *)self guideLocation];
      uint64_t v7 = [v6 guideLocationIdentifier];
      objc_super v8 = [(GuidesHomeViewController *)self apiController];
      [v5 updateAnalyticsManagerWithGuideLocationId:v7 isCuratedGuidesHome:[GuidesHomeAnalyticsManager isCuratedGuidesHome:v8]];
    }
    else
    {
      id v9 = [GuidesHomeAnalyticsManager alloc];
      objc_super v5 = [(GuidesHomeViewController *)self guideLocation];
      unsigned __int8 v6 = [v5 guideLocationIdentifier];
      uint64_t v7 = [(GuidesHomeViewController *)self apiController];
      objc_super v8 = -[GuidesHomeAnalyticsManager initWithGuideLocationId:isCuratedGuidesHome:](v9, "initWithGuideLocationId:isCuratedGuidesHome:", v6, [v7 isCuratedGuidesHome]);
      [(GuidesHomeViewController *)self setAnalyticsManager:v8];
    }

    id v10 = [GuidesHomeDataSource alloc];
    double v11 = [(GuidesHomeViewController *)self collectionView];
    double v12 = [(GuidesHomeViewController *)self apiController];
    id v13 = [v12 guideHomeViewResult];
    unsigned __int8 v14 = [(GuidesHomeViewController *)self apiController];
    v15 = [(GuidesHomeViewController *)self analyticsManager];
    objc_super v16 = [(GuidesHomeDataSource *)v10 initWithCollectionView:v11 result:v13 routingDelegate:self apiController:v14 analyticsManager:v15];
    [(GuidesHomeViewController *)self setDataSource:v16];

    double v17 = [(GuidesHomeViewController *)self dataSource];
    [v17 setDelegate:self];

    id v18 = [(GuidesHomeViewController *)self analyticsManager];
    [v18 guidesHomeRevealed];
  }
}

- (void)addDefaultHeaderView
{
  v3 = [(GuidesHomeViewController *)self titleHeaderView];

  if (!v3)
  {
    id v4 = [[ContainerHeaderView alloc] initWithCardButtonType:0 cardButtonBlurred:0];
    [(GuidesHomeViewController *)self setTitleHeaderView:v4];

    objc_super v5 = [(GuidesHomeViewController *)self titleHeaderView];
    uint64_t v6 = sub_1000BBB44(v5);

    if (v6 == 5)
    {
      uint64_t v7 = [(GuidesHomeViewController *)self titleHeaderView];
      objc_super v8 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 variant:1024];
      [v7 setCustomTitleFont:v8];
    }
    id v9 = [(GuidesHomeViewController *)self titleHeaderView];
    id v10 = [v9 _headerTapGesture];
    [v10 setCancelsTouchesInView:0];

    double v11 = [(GuidesHomeViewController *)self titleHeaderView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v12 = [(GuidesHomeViewController *)self titleHeaderView];
    LODWORD(v13) = 1148846080;
    [v12 setContentCompressionResistancePriority:1 forAxis:v13];

    unsigned __int8 v14 = [(GuidesHomeViewController *)self titleHeaderView];
    [v14 setDelegate:self];

    v15 = [(GuidesHomeViewController *)self titleHeaderView];
    [v15 setHairLineAlpha:0.0];

    objc_super v16 = +[UIColor clearColor];
    double v17 = [(GuidesHomeViewController *)self titleHeaderView];
    [v17 setBackgroundColor:v16];

    if (sub_1000BBB44(self) == 5) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    double v19 = [(GuidesHomeViewController *)self titleHeaderView];
    [v19 setHeaderSize:v18];

    id v21 = [(ContaineeViewController *)self headerView];
    double v20 = [(GuidesHomeViewController *)self titleHeaderView];
    [v21 addSubview:v20];
  }
}

- (void)removeDefaultHeaderView
{
  v3 = [(ContaineeViewController *)self headerView];
  [v3 removeFromSuperview];

  double v24 = [(ContaineeViewController *)self contentView];
  v22 = [v24 topAnchor];
  v23 = [(GuidesHomeViewController *)self view];
  id v21 = [v23 topAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  double v19 = [(ContaineeViewController *)self contentView];
  double v17 = [v19 leadingAnchor];
  uint64_t v18 = [(GuidesHomeViewController *)self view];
  objc_super v16 = [v18 leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v15;
  unsigned __int8 v14 = [(ContaineeViewController *)self contentView];
  id v4 = [v14 trailingAnchor];
  objc_super v5 = [(GuidesHomeViewController *)self view];
  uint64_t v6 = [v5 trailingAnchor];
  uint64_t v7 = [v4 constraintEqualToAnchor:v6];
  v25[2] = v7;
  objc_super v8 = [(ContaineeViewController *)self contentView];
  id v9 = [v8 bottomAnchor];
  id v10 = [(GuidesHomeViewController *)self view];
  double v11 = [v10 bottomAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v25[3] = v12;
  double v13 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)activateHeaderConstraints
{
  v23 = [(GuidesHomeViewController *)self titleHeaderView];
  id v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self headerView];
  double v20 = [v22 topAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  uint64_t v18 = [(GuidesHomeViewController *)self titleHeaderView];
  objc_super v16 = [v18 leadingAnchor];
  double v17 = [(ContaineeViewController *)self headerView];
  v15 = [v17 leadingAnchor];
  unsigned __int8 v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  double v13 = [(GuidesHomeViewController *)self titleHeaderView];
  v3 = [v13 trailingAnchor];
  id v4 = [(ContaineeViewController *)self headerView];
  objc_super v5 = [v4 trailingAnchor];
  uint64_t v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  uint64_t v7 = [(GuidesHomeViewController *)self titleHeaderView];
  objc_super v8 = [v7 bottomAnchor];
  id v9 = [(ContaineeViewController *)self headerView];
  id v10 = [v9 bottomAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)resetDefaultHeaderConstraints
{
  objc_super v27 = [(ContaineeViewController *)self headerView];
  v25 = [v27 topAnchor];
  objc_super v26 = [(GuidesHomeViewController *)self view];
  double v24 = [v26 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v28[0] = v23;
  v22 = [(ContaineeViewController *)self headerView];
  double v20 = [v22 leadingAnchor];
  id v21 = [(GuidesHomeViewController *)self view];
  double v19 = [v21 leadingAnchor];
  uint64_t v18 = [v20 constraintEqualToAnchor:v19];
  v28[1] = v18;
  double v17 = [(ContaineeViewController *)self headerView];
  v15 = [v17 trailingAnchor];
  objc_super v16 = [(GuidesHomeViewController *)self view];
  unsigned __int8 v14 = [v16 trailingAnchor];
  v3 = [v15 constraintEqualToAnchor:v14];
  v28[2] = v3;
  id v4 = [(ContaineeViewController *)self headerView];
  objc_super v5 = [v4 bottomAnchor];
  uint64_t v6 = [(GuidesHomeViewController *)self view];
  uint64_t v7 = [v6 bottomAnchor];
  objc_super v8 = [v5 constraintLessThanOrEqualToAnchor:v7];
  v28[3] = v8;
  id v9 = [(ContaineeViewController *)self headerView];
  id v10 = [v9 heightAnchor];
  LODWORD(v11) = 1148846080;
  double v12 = [v10 constraintEqualToConstant:60.0 priority:v11];
  v28[4] = v12;
  double v13 = +[NSArray arrayWithObjects:v28 count:5];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)addGuidesHomeCollectionsView
{
  v3 = [(GuidesHomeViewController *)self collectionView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UICollectionView);
    objc_super v5 = [(ContaineeViewController *)self contentView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_alloc_init((Class)UICollectionViewLayout);
    id v15 = [v4 initWithFrame:v14 collectionViewLayout:v7];
    [(GuidesHomeViewController *)self setCollectionView:v15];

    objc_super v16 = [(GuidesHomeViewController *)self collectionView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v17 = +[UIColor clearColor];
    uint64_t v18 = [(GuidesHomeViewController *)self collectionView];
    [v18 setBackgroundColor:v17];

    double v19 = [(ContaineeViewController *)self contentView];
    double v20 = [(GuidesHomeViewController *)self collectionView];
    [v19 addSubview:v20];

    id v21 = [(GuidesHomeViewController *)self collectionView];
    v22 = [(ContaineeViewController *)self contentView];
    [v22 frame];
    double v24 = [(GuidesHomeViewController *)self createLayoutUsingWidth:v23];
    [v21 setCollectionViewLayout:v24];

    v25 = [(GuidesHomeViewController *)self collectionView];
    [v25 setAlpha:0.0];
  }
  [(GuidesHomeViewController *)self initializeDataSource];
  objc_super v26 = [(GuidesHomeViewController *)self dataSource];
  [v26 displayGuidesHomeByReloadingData];

  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1006AF904;
  v27[3] = &unk_1012E6708;
  objc_copyWeak(&v28, &location);
  +[UIView _animateWithDuration:0x10000 delay:v27 options:0 animations:0 start:0.2 completion:0.0];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)removeCollectionView
{
  v3 = [(GuidesHomeViewController *)self collectionView];

  if (v3)
  {
    id v4 = [(GuidesHomeViewController *)self collectionView];
    [v4 removeFromSuperview];

    [(GuidesHomeViewController *)self setCollectionView:0];
    [(GuidesHomeViewController *)self setDataSource:0];
  }
}

- (void)removeCitySelectionUI
{
  v3 = [(GuidesHomeViewController *)self citySelectionView];

  if (v3)
  {
    id v4 = [(GuidesHomeViewController *)self citySelectionView];
    [v4 removeFromSuperview];

    [(GuidesHomeViewController *)self setCitySelectionView:0];
    [(GuidesHomeViewController *)self setCitySelectionBackgroundView:0];
    [(GuidesHomeViewController *)self setCitySelectorButton:0];
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  objc_initWeak(&location, self);
  objc_super v5 = [GuideHomeCompositionalLayout alloc];
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  double v6 = [(GuidesHomeViewController *)self apiController];
  double v7 = [(GuideHomeCompositionalLayout *)v5 initWithSectionProvider:&v9 dataProvider:v6];

  [(GuidesHomeViewController *)self setLayout:v7];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3 headerView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v22 = [v7 leadingAnchor];
  double v23 = [(ContaineeViewController *)self contentView];
  id v21 = [v23 leadingAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  uint64_t v18 = [v7 trailingAnchor];
  double v19 = [(ContaineeViewController *)self contentView];
  double v8 = [v19 trailingAnchor];
  uint64_t v9 = [v18 constraintEqualToAnchor:v8];
  v24[1] = v9;
  double v10 = [v7 topAnchor];
  double v11 = [v6 bottomAnchor];

  double v12 = [v10 constraintEqualToAnchor:v11];
  v24[2] = v12;
  double v13 = [v7 bottomAnchor];

  id v14 = [(ContaineeViewController *)self contentView];
  id v15 = [v14 bottomAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15];
  v24[3] = v16;
  double v17 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)activateConstraintsForViewAligningHeader:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(GuidesHomeViewController *)self apiController];
  unsigned int v6 = [v5 isCuratedGuidesHome];

  if (v6)
  {
    v22 = [v4 leadingAnchor];
    id v23 = [(ContaineeViewController *)self contentView];
    id v21 = [v23 leadingAnchor];
    double v20 = [v22 constraintEqualToAnchor:v21];
    v25[0] = v20;
    uint64_t v18 = [v4 trailingAnchor];
    double v19 = [(ContaineeViewController *)self contentView];
    double v17 = [v19 trailingAnchor];
    id v7 = [v18 constraintEqualToAnchor:v17];
    v25[1] = v7;
    double v8 = [v4 topAnchor];
    uint64_t v9 = [(GuidesHomeViewController *)self citySelectionView];
    double v10 = [v9 topAnchor];
    double v11 = [v8 constraintEqualToAnchor:v10];
    v25[2] = v11;
    double v12 = [v4 bottomAnchor];

    double v13 = [(ContaineeViewController *)self contentView];
    id v14 = [v13 bottomAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14];
    v25[3] = v15;
    objc_super v16 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  else
  {
    id v24 = [(GuidesHomeViewController *)self citySelectionView];
    -[GuidesHomeViewController activateConstraintsForViewPinnedBelowHeader:headerView:](self, "activateConstraintsForViewPinnedBelowHeader:headerView:", v4);
  }
}

- (void)resetCollectionViewLayout
{
  v3 = [(GuidesHomeViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  objc_super v5 = [(GuidesHomeViewController *)self collectionView];
  unsigned int v6 = [(ContaineeViewController *)self contentView];
  [v6 frame];
  double v8 = [(GuidesHomeViewController *)self createLayoutUsingWidth:v7];
  [v5 setCollectionViewLayout:v8];

  id v9 = [(GuidesHomeViewController *)self collectionView];
  [(GuidesHomeViewController *)self contentOffset];
  [v9 setContentOffset:];
}

- (void)addLoadingView
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B0500;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  dispatch_time_t v3 = [(GuidesHomeViewController *)self loadingView];

  if (v3)
  {
    id v4 = [(GuidesHomeViewController *)self loadingView];
    [v4 removeFromSuperview];

    [(GuidesHomeViewController *)self setLoadingView:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GuidesHomeViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  void v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006B07FC;
  v9[3] = &unk_1012E81F8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006B0804;
  v8[3] = &unk_1012E81F8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)routeToSingleCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  unsigned int v6 = [v5 containerViewController];
  [v6 removeControllerFromStack:self];

  id v7 = [(ControlContaineeViewController *)self delegate];
  [v7 viewController:self showCuratedCollectionIdentifier:v4];
}

- (void)dismissGuidesHome
{
  dispatch_time_t v3 = [(GuidesHomeViewController *)self apiController];
  [v3 cancelFetchingGuideHome];

  id v4 = [(GuidesHomeViewController *)self analyticsManager];
  [v4 guidesHomeClosed];
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];
}

- (void)routeToGuideLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showGuidesHome:v4];
}

- (void)routeToPublisher:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewControllerShowPublisher:v4];
}

- (void)routeToCitySelector
{
  id v4 = [(ControlContaineeViewController *)self delegate];
  dispatch_time_t v3 = [(GuidesHomeViewController *)self guideLocation];
  [v4 viewControllerShowCitySelectorFromGuideLocation:v3];
}

- (void)didTapCitySelectorButton:(id)a3
{
  [(GuidesHomeViewController *)self routeToCitySelector];
  id v4 = [(GuidesHomeViewController *)self analyticsManager];
  [v4 guidesHomeCitySelectorTapped];
}

- (void)didSelectGuide:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];

  id v11 = [(GuidesHomeViewController *)self analyticsManager];
  unsigned int v6 = [v4 collectionIdentifier];
  id v7 = [v4 publisher];
  double v8 = [v7 identifier];
  id v9 = +[CuratedCollectionSyncManager sharedManager];
  id v10 = [v9 collectionIsSaved:v4];

  [v11 guidesHomeTappedFeaturedGuide:v6 publisherId:v8 isCurrentlySaved:v10];
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (double)actualCardHeight
{
  return self->_actualCardHeight;
}

- (void)setActualCardHeight:(double)a3
{
  self->_actualCardHeight = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (GuidesHomeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (GuidesHomeAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (GuideHomeCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (void)setContaineeLayout:(unint64_t)a3
{
  self->_containeeLayout = a3;
}

- (GuidesHomeAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (UIView)citySelectionView
{
  return self->_citySelectionView;
}

- (void)setCitySelectionView:(id)a3
{
}

- (UIButton)citySelectorButton
{
  return self->_citySelectorButton;
}

- (void)setCitySelectorButton:(id)a3
{
}

- (GradientView)citySelectionBackgroundView
{
  return self->_citySelectionBackgroundView;
}

- (void)setCitySelectionBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_citySelectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_citySelectorButton, 0);
  objc_storeStrong((id *)&self->_citySelectionView, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end