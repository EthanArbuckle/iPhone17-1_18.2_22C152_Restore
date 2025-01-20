@interface STUsageGraphViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)includePaddle;
- (BOOL)useVibrancy;
- (NSArray)barIndicators;
- (NSArray)barViewHeightConstraints;
- (NSArray)barViews;
- (NSArray)horizontalDividers;
- (NSArray)verticalDividers;
- (NSArray)verticalLayoutGuides;
- (NSLayoutConstraint)paddleViewCenterXConstraint;
- (NSLayoutConstraint)paddleViewConnectorCenterXConstraint;
- (NSLayoutConstraint)weeklyAverageHeightConstraint;
- (NSLayoutConstraint)weeklyAverageTrailingConstraint;
- (NSLayoutConstraint)yAxisLabelSectionWidthConstraint;
- (STBarView)pressedBarView;
- (STBarView)selectedBarView;
- (STDashedVerticalDivider)selectedVerticalDivider;
- (STPaddleView)paddleView;
- (STUsageGraphViewController)initWithCoder:(id)a3;
- (STUsageGraphViewController)initWithTitleView:(id)a3 graphHeight:(double)a4 includePaddle:(BOOL)a5 useVibrancy:(BOOL)a6;
- (STUsageReportGraphDataSet)dataSet;
- (UIImage)dashedAverageLineImage;
- (UIImageView)weeklyAverageLine;
- (UILabel)weeklyAverageLabel;
- (UILayoutGuide)barSectionLayoutGuide;
- (UILayoutGuide)graphLayoutGuide;
- (UILayoutGuide)weeklyAverageLayoutGuide;
- (UILayoutGuide)xAxisLabelSectionLayoutGuide;
- (UILayoutGuide)yAxisLabelSectionLayoutGuide;
- (UIView)paddleConnectorView;
- (UIView)titleView;
- (UIView)vibrancyEffectContentView;
- (double)graphHeight;
- (double)maximumYAxisLabelWidth;
- (id)_closestBarViewToPoint:(CGPoint)a3;
- (id)createBarIndicatorWithImageName:(id)a3 barView:(id)a4;
- (id)createBarViewWithDataPoint:(id)a3 layoutGuide:(id)a4 previousView:(id)a5 previousLayoutGuide:(id)a6 layoutGuideWidthMultiplier:(double)a7;
- (id)createDividerWithView:(id)a3 layoutGuide:(id)a4 previousLayoutGuide:(id)a5 layoutGuideWidthMultiplier:(double)a6;
- (id)createFirstDivider;
- (id)createWeeklyAverageLineWithLayoutGuide:(id)a3;
- (int64_t)selectedWeekday;
- (unint64_t)day;
- (unint64_t)week;
- (void)_handleLongPressGestureForBarSelection:(id)a3;
- (void)_handleLongPressGestureForPaddle:(id)a3;
- (void)_selectBarView:(id)a3;
- (void)_setUpHorizontalDividerLabels;
- (void)_showPaddleForBarView:(id)a3;
- (void)_stUsageGraphViewControllerCommonInit;
- (void)_updateBarViewsAndIndicators;
- (void)loadView;
- (void)setBarIndicators:(id)a3;
- (void)setBarSectionLayoutGuide:(id)a3;
- (void)setBarViewHeightConstraints:(id)a3;
- (void)setBarViews:(id)a3;
- (void)setDataSet:(id)a3;
- (void)setDataSet:(id)a3 animated:(BOOL)a4;
- (void)setDay:(unint64_t)a3;
- (void)setGraphLayoutGuide:(id)a3;
- (void)setHorizontalDividers:(id)a3;
- (void)setPaddleConnectorView:(id)a3;
- (void)setPaddleView:(id)a3;
- (void)setPaddleViewCenterXConstraint:(id)a3;
- (void)setPaddleViewConnectorCenterXConstraint:(id)a3;
- (void)setPressedBarView:(id)a3;
- (void)setSelectedBarView:(id)a3;
- (void)setSelectedVerticalDivider:(id)a3;
- (void)setSelectedWeekday:(int64_t)a3;
- (void)setUpBarViewHeightContraints;
- (void)setUpGraphWithLabelFormatter:(id)a3;
- (void)setUpWeeklyAverageLine:(BOOL)a3;
- (void)setVerticalDividers:(id)a3;
- (void)setVerticalLayoutGuides:(id)a3;
- (void)setVibrancyEffectContentView:(id)a3;
- (void)setWeek:(unint64_t)a3;
- (void)setWeeklyAverageHeightConstraint:(id)a3;
- (void)setWeeklyAverageLabel:(id)a3;
- (void)setWeeklyAverageLayoutGuide:(id)a3;
- (void)setWeeklyAverageLine:(id)a3;
- (void)setWeeklyAverageTrailingConstraint:(id)a3;
- (void)setXAxisLabelSectionLayoutGuide:(id)a3;
- (void)setYAxisLabelSectionLayoutGuide:(id)a3;
- (void)setYAxisLabelSectionWidth:(double)a3;
- (void)setYAxisLabelSectionWidthConstraint:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation STUsageGraphViewController

- (STUsageGraphViewController)initWithTitleView:(id)a3 graphHeight:(double)a4 includePaddle:(BOOL)a5 useVibrancy:(BOOL)a6
{
  v10 = (UIView *)a3;
  v14.receiver = self;
  v14.super_class = (Class)STUsageGraphViewController;
  v11 = [(STUsageGraphViewController *)&v14 initWithNibName:0 bundle:0];
  titleView = v11->_titleView;
  v11->_titleView = v10;

  v11->_graphHeight = a4;
  v11->_includePaddle = a5;
  v11->_useVibrancy = a6;
  [(STUsageGraphViewController *)v11 _stUsageGraphViewControllerCommonInit];
  return v11;
}

- (STUsageGraphViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUsageGraphViewController;
  v3 = [(STUsageGraphViewController *)&v5 initWithCoder:a3];
  [(STUsageGraphViewController *)v3 _stUsageGraphViewControllerCommonInit];
  return v3;
}

- (void)_stUsageGraphViewControllerCommonInit
{
  self->_week = 0x7FFFFFFFFFFFFFFFLL;
  self->_day = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)loadView
{
  v4 = objc_opt_new();
  [(STUsageGraphViewController *)self setView:v4];
  uint64_t v5 = objc_opt_new();
  [(STUsageGraphViewController *)self setGraphLayoutGuide:v5];
  v162 = (void *)v5;
  [v4 addLayoutGuide:v5];
  v6 = objc_opt_new();
  v163 = self;
  BOOL v155 = [(STUsageGraphViewController *)self useVibrancy];
  if (v155)
  {
    v7 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:102];
    v8 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v7];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:v8];
    v9 = [v8 topAnchor];
    v10 = [v4 topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v6 addObject:v11];

    v12 = [v8 leadingAnchor];
    v13 = [v4 leadingAnchor];
    objc_super v14 = [v12 constraintEqualToAnchor:v13];
    [v6 addObject:v14];

    v15 = [v8 bottomAnchor];
    v16 = [v4 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v6 addObject:v17];

    v18 = [v8 trailingAnchor];
    v19 = [v4 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v6 addObject:v20];

    self = v163;
    uint64_t v21 = [v8 contentView];
    [(STUsageGraphViewController *)v163 setVibrancyEffectContentView:v21];
  }
  else
  {
    uint64_t v21 = 0;
  }
  v22 = [(STUsageGraphViewController *)self titleView];
  BOOL v23 = [(STUsageGraphViewController *)self includePaddle];
  BOOL v154 = v23;
  if (v22)
  {
    [v4 addSubview:v22];
    v24 = [v22 topAnchor];
    v25 = [v4 topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v6 addObject:v26];

    v27 = [v22 leadingAnchor];
    v28 = [v4 leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v6 addObject:v29];

    v30 = [v22 trailingAnchor];
    v31 = [v4 trailingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v6 addObject:v32];

LABEL_6:
    goto LABEL_8;
  }
  if (v23)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"STUsageGraphViewController.m", 140, @"Invalid parameter not satisfying: %@", @"!includePaddle" object file lineNumber description];
    goto LABEL_6;
  }
LABEL_8:
  v159 = (void *)v21;
  v157 = v22;
  v33 = [v162 leftAnchor];
  v34 = [v4 leftAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v6 addObject:v35];

  v36 = [v162 rightAnchor];
  v37 = [v4 rightAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v6 addObject:v38];

  v39 = [v162 bottomAnchor];
  v40 = [v4 bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v6 addObject:v41];

  v42 = objc_opt_new();
  [(STUsageGraphViewController *)self setXAxisLabelSectionLayoutGuide:v42];
  [v4 addLayoutGuide:v42];
  v43 = [v42 leftAnchor];
  v44 = [v162 leftAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v6 addObject:v45];

  v46 = [v42 rightAnchor];
  v47 = [v162 rightAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v6 addObject:v48];

  v49 = [v42 bottomAnchor];
  v50 = [v162 bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v6 addObject:v51];

  v52 = objc_opt_new();
  [(STUsageGraphViewController *)self setYAxisLabelSectionLayoutGuide:v52];
  [v4 addLayoutGuide:v52];
  v53 = [v52 topAnchor];
  v54 = [v162 topAnchor];
  [v53 constraintEqualToAnchor:v54];
  v56 = v55 = self;
  [v6 addObject:v56];

  v57 = [v52 rightAnchor];
  v58 = [v162 rightAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v6 addObject:v59];

  v60 = [v52 bottomAnchor];
  v61 = [v162 bottomAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v6 addObject:v62];

  v63 = objc_opt_new();
  [(STUsageGraphViewController *)v55 setBarSectionLayoutGuide:v63];
  [v4 addLayoutGuide:v63];
  v64 = [v63 topAnchor];
  v65 = [v162 topAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  [v6 addObject:v66];

  v67 = [v63 leftAnchor];
  v68 = [v162 leftAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v6 addObject:v69];

  v70 = [v63 bottomAnchor];
  v158 = v42;
  v71 = [v42 topAnchor];
  v72 = [v70 constraintEqualToAnchor:v71];
  [v6 addObject:v72];

  v73 = [v63 rightAnchor];
  v161 = v52;
  v74 = [v52 leftAnchor];
  v75 = [v73 constraintLessThanOrEqualToAnchor:v74];
  [v6 addObject:v75];

  v76 = [v63 heightAnchor];
  [(STUsageGraphViewController *)v55 graphHeight];
  v77 = objc_msgSend(v76, "constraintEqualToConstant:");
  [v6 addObject:v77];

  v78 = [STHorizontalDivider alloc];
  if (v155)
  {
    v79 = [MEMORY[0x263F825C8] systemGrayColor];
    v80 = [(STHorizontalDivider *)v78 initWithTintColor:v79];

    [(STHorizontalDivider *)v80 setTranslatesAutoresizingMaskIntoConstraints:0];
    v81 = v159;
  }
  else
  {
    v82 = [MEMORY[0x263F825C8] systemGray3Color];
    v80 = [(STHorizontalDivider *)v78 initWithTintColor:v82];

    [(STHorizontalDivider *)v80 setTranslatesAutoresizingMaskIntoConstraints:0];
    v81 = v4;
  }
  [v81 addSubview:v80];
  v83 = [(STHorizontalDivider *)v80 leftAnchor];
  v84 = [v63 leftAnchor];
  v85 = [v83 constraintEqualToAnchor:v84];
  [v6 addObject:v85];

  v86 = [(STHorizontalDivider *)v80 centerYAnchor];
  v87 = [v63 bottomAnchor];
  v88 = [v86 constraintEqualToAnchor:v87];
  [v6 addObject:v88];

  v89 = [(STHorizontalDivider *)v80 rightAnchor];
  v90 = [v52 rightAnchor];
  v91 = [v89 constraintEqualToAnchor:v90];
  [v6 addObject:v91];

  v92 = [(STHorizontalDivider *)v80 horizontalLineRightAnchor];
  v93 = [v63 rightAnchor];
  v94 = [v92 constraintEqualToAnchor:v93];
  [v6 addObject:v94];

  v95 = [(STHorizontalDivider *)v80 label];
  v96 = [v95 leftAnchor];
  v97 = [v52 leftAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v6 addObject:v98];

  v99 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v80, 0);
  v100 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  v101 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 1, 4);
  v164[0] = MEMORY[0x263EF8330];
  v164[1] = 3221225472;
  v164[2] = __38__STUsageGraphViewController_loadView__block_invoke;
  v164[3] = &unk_264768B10;
  id v102 = v4;
  id v165 = v102;
  id v103 = v99;
  id v166 = v103;
  id v104 = v6;
  id v167 = v104;
  id v153 = v100;
  id v168 = v153;
  BOOL v172 = v155;
  id v105 = v159;
  id v169 = v105;
  v152 = v80;
  v170 = v152;
  id v151 = v95;
  id v171 = v151;
  v156 = v101;
  [v101 enumerateIndexesUsingBlock:v164];
  v160 = v103;
  v106 = [v103 lastObject];
  v107 = [v106 topAnchor];
  v108 = v157;
  if (v157)
  {
    v109 = [v157 bottomAnchor];
    [v107 constraintEqualToSystemSpacingBelowAnchor:v109 multiplier:1.0];
  }
  else
  {
    v109 = [v102 topAnchor];
    [v107 constraintEqualToAnchor:v109];
  v110 = };
  v111 = v102;
  [v104 addObject:v110];

  v150 = v106;
  v112 = [v106 centerYAnchor];
  v113 = [v162 topAnchor];
  v114 = [v112 constraintEqualToAnchor:v113];
  [v104 addObject:v114];

  v115 = v163;
  [(STUsageGraphViewController *)v163 setHorizontalDividers:v160];
  if (v154)
  {
    v116 = objc_opt_new();
    [v116 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v116 setHidden:1];
    [(STUsageGraphViewController *)v163 setPaddleView:v116];
    [v111 addSubview:v116];
    v117 = [v116 topAnchor];
    v118 = [v157 topAnchor];
    v119 = [v117 constraintEqualToAnchor:v118];
    [v104 addObject:v119];

    v120 = [v116 leftAnchor];
    v121 = [v157 leftAnchor];
    v122 = [v120 constraintGreaterThanOrEqualToAnchor:v121];
    [v104 addObject:v122];

    v123 = [v116 bottomAnchor];
    v124 = [v157 bottomAnchor];
    v125 = [v123 constraintEqualToAnchor:v124];
    [v104 addObject:v125];

    v126 = [v116 rightAnchor];
    v127 = [v157 rightAnchor];
    v128 = [v126 constraintLessThanOrEqualToAnchor:v127];
    [v104 addObject:v128];

    v129 = [v116 centerXAnchor];
    v130 = [v157 centerXAnchor];
    v131 = [v129 constraintEqualToAnchor:v130];

    v149 = v131;
    [(STUsageGraphViewController *)v163 setPaddleViewCenterXConstraint:v131];
    LODWORD(v132) = 1132068864;
    [v131 setPriority:v132];
    [v104 addObject:v131];
    v133 = objc_opt_new();
    [v133 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v133 setHidden:1];
    v134 = [MEMORY[0x263F825C8] systemGreenColor];
    [v133 setBackgroundColor:v134];

    [(STUsageGraphViewController *)v163 setPaddleConnectorView:v133];
    [v111 addSubview:v133];
    v135 = [v133 topAnchor];
    v136 = [v157 bottomAnchor];
    v137 = [v135 constraintEqualToAnchor:v136];
    [v104 addObject:v137];

    v138 = [v133 bottomAnchor];
    v139 = [v63 bottomAnchor];
    v140 = [v138 constraintEqualToAnchor:v139];
    [v104 addObject:v140];

    v141 = [v133 widthAnchor];
    v142 = [v141 constraintEqualToConstant:1.0];
    [v104 addObject:v142];

    v143 = [v133 centerXAnchor];
    v144 = [v157 centerXAnchor];
    [v143 constraintEqualToAnchor:v144];
    id v145 = v105;
    v147 = v146 = v111;

    v108 = v157;
    [(STUsageGraphViewController *)v163 setPaddleViewConnectorCenterXConstraint:v147];
    [v104 addObject:v147];
    v148 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v163 action:sel__handleLongPressGestureForPaddle_];
    [v148 setMinimumPressDuration:0.1];

    v111 = v146;
    id v105 = v145;

    v115 = v163;
  }
  else
  {
    v148 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v163 action:sel__handleLongPressGestureForBarSelection_];
    [v148 setMinimumPressDuration:0.0];
  }
  [v148 setDelegate:v115];
  [v111 addGestureRecognizer:v148];
  [MEMORY[0x263F08938] activateConstraints:v104];
}

void __38__STUsageGraphViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  id v47 = (id)objc_opt_new();
  [*(id *)(a1 + 32) addLayoutGuide:v47];
  v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2 - 1];
  uint64_t v5 = *(void **)(a1 + 48);
  v6 = [v47 leftAnchor];
  v7 = [v4 leftAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v5 addObject:v8];

  v9 = *(void **)(a1 + 48);
  v10 = [v47 bottomAnchor];
  v11 = [v4 centerYAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v9 addObject:v12];

  v13 = *(void **)(a1 + 48);
  objc_super v14 = [v47 rightAnchor];
  v15 = [v4 rightAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v13 addObject:v16];

  v17 = [*(id *)(a1 + 56) lastObject];
  if (v17)
  {
    v18 = *(void **)(a1 + 48);
    v19 = [v47 heightAnchor];
    v20 = [v17 heightAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    [v18 addObject:v21];
  }
  [*(id *)(a1 + 56) addObject:v47];
  v22 = [STHorizontalDivider alloc];
  if (*(unsigned char *)(a1 + 88)) {
    [MEMORY[0x263F825C8] systemGrayColor];
  }
  else {
  BOOL v23 = [MEMORY[0x263F825C8] systemGray3Color];
  }
  v24 = [(STHorizontalDivider *)v22 initWithTintColor:v23];

  [(STHorizontalDivider *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v25 = 64;
  if (!*(unsigned char *)(a1 + 88)) {
    uint64_t v25 = 32;
  }
  [*(id *)(a1 + v25) addSubview:v24];
  v26 = *(void **)(a1 + 48);
  v27 = [(STHorizontalDivider *)v24 leftAnchor];
  v28 = [v47 leftAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v26 addObject:v29];

  v30 = *(void **)(a1 + 48);
  v31 = [(STHorizontalDivider *)v24 centerYAnchor];
  v32 = [v47 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v30 addObject:v33];

  v34 = *(void **)(a1 + 48);
  v35 = [(STHorizontalDivider *)v24 rightAnchor];
  v36 = [v47 rightAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v34 addObject:v37];

  v38 = *(void **)(a1 + 48);
  v39 = [(STHorizontalDivider *)v24 horizontalLineRightAnchor];
  v40 = [*(id *)(a1 + 72) horizontalLineRightAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v38 addObject:v41];

  v42 = *(void **)(a1 + 48);
  v43 = [(STHorizontalDivider *)v24 label];
  v44 = [v43 leftAnchor];
  v45 = [*(id *)(a1 + 80) leftAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v42 addObject:v46];

  [*(id *)(a1 + 40) addObject:v24];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [(STUsageGraphViewController *)self dataSet];
  uint64_t v4 = [v3 timePeriod];

  if (v4 == 2)
  {
    uint64_t v5 = [(STUsageGraphViewController *)self weeklyAverageLabel];
    v6 = v5;
    if (v5) {
      int v7 = [v5 isHidden] ^ 1;
    }
    else {
      int v7 = 0;
    }
    [v6 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v16 = [(STUsageGraphViewController *)self horizontalDividers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (v7)
          {
            [*(id *)(*((void *)&v29 + 1) + 8 * i) frame];
            v36.origin.x = v22;
            v36.origin.y = v23;
            v36.size.width = v24;
            v36.size.height = v25;
            v35.origin.x = v9;
            v35.origin.y = v11;
            v35.size.width = v13;
            v35.size.height = v15;
            BOOL v26 = CGRectIntersectsRect(v35, v36);
          }
          else
          {
            BOOL v26 = 0;
          }
          v27 = [v21 label];
          [v27 setHidden:v26];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v18);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageGraphViewController.viewDidLayoutSubviews", v28, 2u);
  }
}

- (void)setDataSet:(id)a3
{
}

- (void)setDataSet:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  double v8 = (STUsageReportGraphDataSet *)a3;
  p_dataSet = &self->_dataSet;
  if (self->_dataSet != v8)
  {
    SEL v48 = a2;
    double v10 = [(STUsageGraphViewController *)self view];
    uint64_t v11 = [(STUsageReportGraphDataSet *)v8 timePeriod];
    if (*p_dataSet)
    {
      if ([(STUsageReportGraphDataSet *)*p_dataSet timePeriod] == v11)
      {
        double v12 = [(STUsageReportGraphDataSet *)*p_dataSet dataPoints];
        uint64_t v47 = v11;
        BOOL v13 = v4;
        uint64_t v14 = [v12 count];
        CGFloat v15 = [(STUsageReportGraphDataSet *)v8 dataPoints];
        uint64_t v16 = [v15 count];

        BOOL v17 = v14 == v16;
        BOOL v4 = v13;
        uint64_t v11 = v47;
        if (v17)
        {
          objc_storeStrong((id *)&self->_dataSet, a3);
          [(STUsageGraphViewController *)self _updateBarViewsAndIndicators];
LABEL_43:
          [(STUsageGraphViewController *)self _setUpHorizontalDividerLabels];
          if (v11 == 2
            && ([(STUsageReportGraphDataSet *)v8 averageAsPercentageOfMax], v43 > 0.05))
          {
            [(STUsageGraphViewController *)self setUpWeeklyAverageLine:v4];
            if (!v4)
            {
LABEL_46:
              [(STUsageGraphViewController *)self setUpBarViewHeightContraints];
LABEL_49:

              goto LABEL_50;
            }
          }
          else
          {
            v44 = [(STUsageGraphViewController *)self weeklyAverageLine];
            [v44 setHidden:1];

            v45 = [(STUsageGraphViewController *)self weeklyAverageLabel];
            [v45 setHidden:1];

            if (!v4) {
              goto LABEL_46;
            }
          }
          [v10 layoutIfNeeded];
          [(STUsageGraphViewController *)self setUpBarViewHeightContraints];
          v46 = (void *)MEMORY[0x263F82E00];
          v49[0] = MEMORY[0x263EF8330];
          v49[1] = 3221225472;
          v49[2] = __50__STUsageGraphViewController_setDataSet_animated___block_invoke;
          v49[3] = &unk_264766F30;
          id v50 = v10;
          [v46 animateWithDuration:0 delay:v49 usingSpringWithDamping:0 initialSpringVelocity:0.6 options:0.0 animations:0.9 completion:0.1];

          goto LABEL_49;
        }
      }
    }
    objc_storeStrong((id *)&self->_dataSet, a3);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v18 = [(STUsageGraphViewController *)self verticalDividers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v64 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v63 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v20);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    CGFloat v23 = [(STUsageGraphViewController *)self barViews];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v60 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v25);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v28 = [(STUsageGraphViewController *)self barIndicators];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v56 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * k) removeFromSuperview];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v30);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v33 = [(STUsageGraphViewController *)self verticalLayoutGuides];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v67 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v52;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          [v10 removeLayoutGuide:*(void *)(*((void *)&v51 + 1) + 8 * m)];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v67 count:16];
      }
      while (v35);
    }

    v38 = [(STUsageGraphViewController *)self paddleView];
    [v38 setHidden:1];

    v39 = [(STUsageGraphViewController *)self paddleConnectorView];
    [v39 setHidden:1];

    v40 = objc_opt_new();
    [v40 setFormattingContext:3];
    if (v11 == 2)
    {
      v42 = @"ccccc";
    }
    else
    {
      if (v11 != 1)
      {
        if (!v11)
        {
          v41 = [MEMORY[0x263F08690] currentHandler];
          [v41 handleFailureInMethod:v48 object:self file:@"STUsageGraphViewController.m" lineNumber:321 description:@"We don't have a graph for hourly reports."];
        }
        goto LABEL_42;
      }
      v42 = @"hj";
    }
    [v40 setLocalizedDateFormatFromTemplate:v42];
LABEL_42:
    [(STUsageGraphViewController *)self setUpGraphWithLabelFormatter:v40];

    goto LABEL_43;
  }
LABEL_50:
}

uint64_t __50__STUsageGraphViewController_setDataSet_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setSelectedWeekday:(int64_t)a3
{
  v6 = [(STUsageGraphViewController *)self dataSet];
  if ([v6 timePeriod] != 2)
  {
    double v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"STUsageGraphViewController.m", 363, @"Invalid parameter not satisfying: %@", @"dataSet.timePeriod == STUsageReportTimePeriodWeek" object file lineNumber description];
  }
  if (self->_selectedWeekday != a3)
  {
    self->_selectedWeekday = a3;
    int v7 = [(STUsageGraphViewController *)self barViews];
    double v8 = v7;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(STUsageGraphViewController *)self _selectBarView:0];
    }
    else if ([v7 count])
    {
      CGFloat v9 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v10 = [v6 dataPoints];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __49__STUsageGraphViewController_setSelectedWeekday___block_invoke;
      v13[3] = &unk_264768B38;
      int64_t v17 = a3;
      id v14 = v9;
      CGFloat v15 = self;
      id v16 = v8;
      id v11 = v9;
      [v10 enumerateObjectsUsingBlock:v13];
    }
  }
}

void __49__STUsageGraphViewController_setSelectedWeekday___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = *(void **)(a1 + 32);
  double v8 = [a2 date];
  uint64_t v9 = [v7 component:512 fromDate:v8];
  uint64_t v10 = *(void *)(a1 + 56);

  if (v9 == v10)
  {
    id v11 = *(void **)(a1 + 40);
    double v12 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
    [v11 _selectBarView:v12];

    *a4 = 1;
  }
}

- (void)setPressedBarView:(id)a3
{
  BOOL v4 = (STBarView *)a3;
  [(STBarView *)self->_pressedBarView setDarkened:0];
  pressedBarView = self->_pressedBarView;
  self->_pressedBarView = v4;
  v6 = v4;

  [(STBarView *)v6 setDarkened:1];
}

- (double)maximumYAxisLabelWidth
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(STUsageGraphViewController *)self weeklyAverageLabel];
  objc_msgSend(v3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v5 = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(STUsageGraphViewController *)self horizontalDividers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) label];
        objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        double v13 = v12;

        if (v5 < v13) {
          double v5 = v13;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)setYAxisLabelSectionWidth:(double)a3
{
  double v5 = [(STUsageGraphViewController *)self yAxisLabelSectionWidthConstraint];
  if (v5)
  {
    id v8 = v5;
    [v5 setConstant:a3];
  }
  else
  {
    v6 = [(STUsageGraphViewController *)self yAxisLabelSectionLayoutGuide];
    uint64_t v7 = [v6 widthAnchor];
    id v8 = [v7 constraintEqualToConstant:a3];

    [v8 setActive:1];
    [(STUsageGraphViewController *)self setYAxisLabelSectionWidthConstraint:v8];
  }
}

- (void)_setUpHorizontalDividerLabels
{
  v3 = [(STUsageGraphViewController *)self dataSet];
  uint64_t v4 = [v3 itemType];
  if ((unint64_t)(v4 - 1) >= 4)
  {
    if ((unint64_t)(v4 - 5) < 2)
    {
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 0;
      id v14 = [v3 max];
      [v14 doubleValue];
      double v16 = v15;

      long long v17 = [(STUsageGraphViewController *)self horizontalDividers];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke_2;
      v18[3] = &unk_264768B88;
      v18[4] = &v23;
      *(double *)&v18[5] = v16 / (double)4uLL;
      [v17 enumerateObjectsUsingBlock:v18];

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    uint64_t v5 = [v3 timePeriod];
    v6 = [v3 max];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = objc_opt_new();
    [v9 setFormattingContext:3];
    if (v8 <= 3600.0 && v5 == 1) {
      uint64_t v11 = 64;
    }
    else {
      uint64_t v11 = 32;
    }
    [v9 setAllowedUnits:v11];
    [v9 setUnitsStyle:1];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    double v12 = [(STUsageGraphViewController *)self horizontalDividers];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke;
    v19[3] = &unk_264768B60;
    uint64_t v21 = &v23;
    id v13 = v9;
    id v20 = v13;
    double v22 = v8 / (double)4uLL;
    [v12 enumerateObjectsUsingBlock:v19];

    _Block_object_dispose(&v23, 8);
  }
}

void __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = [a2 label];
  id v10 = v5;
  if (a3)
  {
    [v5 setText:0];
  }
  else if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0.0)
  {
    v6 = (void *)MEMORY[0x263F08A30];
    double v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    double v8 = [v6 localizedStringFromNumber:v7 numberStyle:0];
    [v10 setText:v8];
  }
  else
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "stringFromTimeInterval:");
    [v10 setText:v9];
  }
  [v10 setHidden:0];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 48)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

void __59__STUsageGraphViewController__setUpHorizontalDividerLabels__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v8 = [a2 label];
  if (a3)
  {
    [v8 setText:0];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F08A30];
    v6 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    double v7 = [v5 localizedStringFromNumber:v6 numberStyle:0];
    [v8 setText:v7];
  }
  [v8 setHidden:0];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (void)setUpGraphWithLabelFormatter:(id)a3
{
  id v53 = a3;
  long long v61 = self;
  uint64_t v5 = [(STUsageGraphViewController *)self dataSet];
  long long v56 = [v5 dataPoints];
  uint64_t v6 = [v56 count];
  if (!v6) {
    goto LABEL_37;
  }
  uint64_t v7 = v6;
  SEL v49 = a2;
  id v50 = v5;
  uint64_t v8 = [v5 timePeriod];
  long long v52 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  long long v55 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
  long long v51 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
  long long v62 = 0;
  long long v63 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v58 = v8;
  if (v8 == 1) {
    double v12 = 0.5;
  }
  else {
    double v12 = 1.0;
  }
  uint64_t v54 = v7;
  do
  {
    id v13 = [v56 objectAtIndexedSubscript:v11];
    id v14 = [v13 date];
    long long v59 = v13;
    if (v58 != 2)
    {
      if (v58 != 1) {
        goto LABEL_14;
      }
      double v15 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v16 = [v15 component:32 fromDate:v14];

      unint64_t v17 = __ROR8__(v16, 1);
      id v13 = v59;
      uint64_t v18 = (1 << v17) & 0x249;
      if (v17 > 9 || v18 == 0)
      {
LABEL_14:

        if (v63)
        {
          id v20 = 0;
          uint64_t v21 = 0;
          ++v10;
          goto LABEL_18;
        }
LABEL_16:
        uint64_t v21 = [(STUsageGraphViewController *)v61 createFirstDivider];
        id v20 = 0;
        goto LABEL_17;
      }
    }

    if (!v63) {
      goto LABEL_16;
    }
    id v20 = objc_opt_new();
    [v9 addObject:v20];
    uint64_t v21 = [(STUsageGraphViewController *)v61 createDividerWithView:v63 layoutGuide:v20 previousLayoutGuide:v62 layoutGuideWidthMultiplier:v12];
LABEL_17:
    double v22 = [v53 stringFromDate:v14];
    [v21 setLabelText:v22];

    [v52 addObject:v21];
    uint64_t v10 = 0;
    id v13 = v59;
LABEL_18:
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v63;
    }
    id v24 = v23;

    if (v20) {
      uint64_t v25 = v20;
    }
    else {
      uint64_t v25 = v62;
    }
    id v26 = v25;

    uint64_t v27 = objc_opt_new();
    long long v62 = (void *)v27;
    [v9 addObject:v27];
    if (!v24)
    {
      v41 = [MEMORY[0x263F08690] currentHandler];
      [v41 handleFailureInMethod:v49, v61, @"STUsageGraphViewController.m", 517, @"Invalid parameter not satisfying: %@", @"previousView" object file lineNumber description];
    }
    if (v10 == 1) {
      double v28 = 2.0;
    }
    else {
      double v28 = 1.0;
    }
    long long v63 = [(STUsageGraphViewController *)v61 createBarViewWithDataPoint:v13 layoutGuide:v27 previousView:v24 previousLayoutGuide:v26 layoutGuideWidthMultiplier:v28];
    objc_msgSend(v55, "addObject:");
    uint64_t v29 = [v13 indicatorImageName];
    if (v29)
    {
      [(STUsageGraphViewController *)v61 createBarIndicatorWithImageName:v29 barView:v63];
      long long v57 = v21;
      uint64_t v30 = v11;
      uint64_t v31 = v10;
      v33 = id v32 = v14;
      [v13 indicatorImageColor];
      id v34 = v26;
      uint64_t v35 = v9;
      v37 = id v36 = v24;
      [v33 setTintColor:v37];

      id v24 = v36;
      uint64_t v9 = v35;
      id v26 = v34;
      id v13 = v59;
      [v51 addObject:v33];

      id v14 = v32;
      uint64_t v10 = v31;
      uint64_t v11 = v30;
      uint64_t v21 = v57;
    }
    if (!v11)
    {
      [(STUsageGraphViewController *)v61 paddleView];
      uint64_t v38 = v10;
      v40 = id v39 = v14;
      [v40 setDataPoint:v13];

      id v14 = v39;
      uint64_t v10 = v38;
      uint64_t v11 = 0;
    }

    ++v11;
  }
  while (v54 != v11);
  v42 = objc_opt_new();
  [v9 addObject:v42];
  long long v60 = v9;
  if (!v63)
  {
    SEL v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:v49, v61, @"STUsageGraphViewController.m", 543, @"Invalid parameter not satisfying: %@", @"previousView" object file lineNumber description];
  }
  double v43 = [(STUsageGraphViewController *)v61 createDividerWithView:v63 layoutGuide:v42 previousLayoutGuide:v62 layoutGuideWidthMultiplier:v12];
  [v52 addObject:v43];
  v44 = [v43 rightAnchor];
  v45 = [(STUsageGraphViewController *)v61 barSectionLayoutGuide];
  v46 = [v45 rightAnchor];
  uint64_t v47 = [v44 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  [(STUsageGraphViewController *)v61 setVerticalDividers:v52];
  [(STUsageGraphViewController *)v61 setVerticalLayoutGuides:v60];
  [(STUsageGraphViewController *)v61 setBarViews:v55];
  [(STUsageGraphViewController *)v61 setBarIndicators:v51];

  uint64_t v5 = v50;
LABEL_37:
}

- (void)setUpBarViewHeightContraints
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(STUsageGraphViewController *)self barViewHeightConstraints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v7++) setActive:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(STUsageGraphViewController *)self barViews];
  uint64_t v9 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  uint64_t v10 = [v9 heightAnchor];

  uint64_t v11 = [(STUsageGraphViewController *)self dataSet];
  double v12 = [v11 dataPoints];

  id v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__STUsageGraphViewController_setUpBarViewHeightContraints__block_invoke;
  v17[3] = &unk_264768BB0;
  id v18 = v12;
  id v19 = v10;
  id v20 = v13;
  id v14 = v13;
  id v15 = v10;
  id v16 = v12;
  [v8 enumerateObjectsUsingBlock:v17];
  [(STUsageGraphViewController *)self setBarViewHeightConstraints:v14];
}

void __58__STUsageGraphViewController_setUpBarViewHeightContraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 heightAnchor];

  uint64_t v8 = *(void *)(a1 + 40);
  [v10 totalAsPercentageOfMax];
  uint64_t v9 = objc_msgSend(v7, "constraintEqualToAnchor:multiplier:", v8);

  [v9 setActive:1];
  [*(id *)(a1 + 48) addObject:v9];
}

- (void)_updateBarViewsAndIndicators
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(STUsageGraphViewController *)self barIndicators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(STUsageGraphViewController *)self dataSet];
  uint64_t v9 = [v8 dataPoints];

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v11 = [(STUsageGraphViewController *)self barViews];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__STUsageGraphViewController__updateBarViewsAndIndicators__block_invoke;
  v14[3] = &unk_264768BB0;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 enumerateObjectsUsingBlock:v14];

  [(STUsageGraphViewController *)self setBarIndicators:v12];
}

void __58__STUsageGraphViewController__updateBarViewsAndIndicators__block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [a1[4] objectAtIndexedSubscript:a3];
  [v9 setDataPoint:v5];
  uint64_t v6 = [v5 indicatorImageName];
  if (v6)
  {
    uint64_t v7 = [a1[5] createBarIndicatorWithImageName:v6 barView:v9];
    uint64_t v8 = [v5 indicatorImageColor];
    [v7 setTintColor:v8];

    [a1[6] addObject:v7];
  }
}

- (void)setUpWeeklyAverageLine:(BOOL)a3
{
  BOOL v3 = a3;
  id v23 = [(STUsageGraphViewController *)self view];
  uint64_t v5 = [(STUsageGraphViewController *)self weeklyAverageLine];
  uint64_t v6 = [(STUsageGraphViewController *)self weeklyAverageLayoutGuide];
  if (v5)
  {
    [v23 bringSubviewToFront:v5];
    [v5 setHidden:0];
    uint64_t v7 = [(STUsageGraphViewController *)self weeklyAverageLabel];
    [v7 setHidden:0];
  }
  else
  {
    uint64_t v8 = objc_opt_new();

    [(STUsageGraphViewController *)self setWeeklyAverageLayoutGuide:v8];
    uint64_t v5 = [(STUsageGraphViewController *)self createWeeklyAverageLineWithLayoutGuide:v8];
    [(STUsageGraphViewController *)self setWeeklyAverageLine:v5];
    uint64_t v6 = (void *)v8;
  }
  id v9 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  id v10 = [(STUsageGraphViewController *)self weeklyAverageHeightConstraint];
  [v10 setActive:0];
  uint64_t v11 = [v6 heightAnchor];
  id v12 = [v9 heightAnchor];
  id v13 = [(STUsageGraphViewController *)self dataSet];
  [v13 averageAsPercentageOfMax];
  id v14 = objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v12);

  [v14 setActive:1];
  [(STUsageGraphViewController *)self setWeeklyAverageHeightConstraint:v14];
  id v15 = [(STUsageGraphViewController *)self weeklyAverageTrailingConstraint];
  id v16 = v15;
  if (v3)
  {
    [v15 setActive:0];
    id v17 = [v5 rightAnchor];
    long long v18 = [v9 leftAnchor];
    long long v19 = [v17 constraintEqualToAnchor:v18];

    [v19 setActive:1];
    [v23 layoutIfNeeded];
    id v16 = v19;
  }
  [v16 setActive:0];
  long long v20 = [v5 rightAnchor];
  long long v21 = [v9 rightAnchor];
  long long v22 = [v20 constraintEqualToAnchor:v21];

  [v22 setActive:1];
  [(STUsageGraphViewController *)self setWeeklyAverageTrailingConstraint:v22];
}

- (id)createFirstDivider
{
  v29[4] = *MEMORY[0x263EF8340];
  BOOL v3 = [(STUsageGraphViewController *)self vibrancyEffectContentView];
  uint64_t v4 = [STDashedVerticalDivider alloc];
  double v28 = v3;
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] systemDarkGrayColor];
    uint64_t v6 = [(STDashedVerticalDivider *)v4 initWithTintColor:v5];

    [(STDashedVerticalDivider *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v6];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F825C8] systemGray3Color];
    uint64_t v6 = [(STDashedVerticalDivider *)v4 initWithTintColor:v7];

    [(STDashedVerticalDivider *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = [(STUsageGraphViewController *)self view];
    [v8 addSubview:v6];
  }
  id v9 = [(STUsageGraphViewController *)self graphLayoutGuide];
  long long v20 = (void *)MEMORY[0x263F08938];
  uint64_t v27 = [(STDashedVerticalDivider *)v6 topAnchor];
  long long v24 = v9;
  uint64_t v26 = [v9 topAnchor];
  uint64_t v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  long long v22 = [(STDashedVerticalDivider *)v6 leftAnchor];
  id v23 = [(STUsageGraphViewController *)self xAxisLabelSectionLayoutGuide];
  long long v21 = [v23 leftAnchor];
  id v10 = [v22 constraintEqualToAnchor:v21];
  v29[1] = v10;
  uint64_t v11 = [(STDashedVerticalDivider *)v6 bottomAnchor];
  id v12 = [v9 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v29[2] = v13;
  id v14 = [(STDashedVerticalDivider *)v6 labelTopAnchor];
  id v15 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  id v16 = [v15 bottomAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16 constant:6.0];
  v29[3] = v17;
  long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v20 activateConstraints:v18];

  return v6;
}

- (id)createDividerWithView:(id)a3 layoutGuide:(id)a4 previousLayoutGuide:(id)a5 layoutGuideWidthMultiplier:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(STUsageGraphViewController *)self vibrancyEffectContentView];
  id v14 = [(STUsageGraphViewController *)self view];
  id v15 = [STDashedVerticalDivider alloc];
  uint64_t v47 = v11;
  if (v13)
  {
    id v16 = [MEMORY[0x263F825C8] systemDarkGrayColor];
    id v17 = [(STDashedVerticalDivider *)v15 initWithTintColor:v16];

    [(STDashedVerticalDivider *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v18 = v13;
  }
  else
  {
    long long v19 = [MEMORY[0x263F825C8] systemGray3Color];
    id v17 = [(STDashedVerticalDivider *)v15 initWithTintColor:v19];

    [(STDashedVerticalDivider *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v18 = v14;
  }
  [v18 addSubview:v17];
  long long v20 = [(STUsageGraphViewController *)self graphLayoutGuide];
  long long v21 = [(STDashedVerticalDivider *)v17 topAnchor];
  long long v22 = [v20 topAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  long long v24 = [(STDashedVerticalDivider *)v17 bottomAnchor];
  uint64_t v25 = [v20 bottomAnchor];
  uint64_t v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  uint64_t v27 = [(STDashedVerticalDivider *)v17 labelTopAnchor];
  double v28 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  uint64_t v29 = [v28 bottomAnchor];
  uint64_t v30 = [v27 constraintEqualToAnchor:v29 constant:6.0];
  [v30 setActive:1];

  [v14 addLayoutGuide:v10];
  uint64_t v31 = [v10 topAnchor];
  id v32 = [v20 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  id v34 = [v10 leftAnchor];
  uint64_t v35 = [v12 rightAnchor];

  id v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [v10 bottomAnchor];
  uint64_t v38 = [v20 bottomAnchor];
  id v39 = [v37 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [v10 rightAnchor];
  v41 = [(STDashedVerticalDivider *)v17 dashedLineCenterXAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  if (v47)
  {
    double v43 = [v10 widthAnchor];
    v44 = [v47 widthAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 multiplier:a6];
    [v45 setActive:1];
  }

  return v17;
}

- (id)createBarViewWithDataPoint:(id)a3 layoutGuide:(id)a4 previousView:(id)a5 previousLayoutGuide:(id)a6 layoutGuideWidthMultiplier:(double)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a3;
  id v16 = [[STBarView alloc] initWithDataPoint:v15 useVibrancy:[(STUsageGraphViewController *)self useVibrancy]];

  [(STBarView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [(STUsageGraphViewController *)self view];
  [v17 addSubview:v16];
  long long v18 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  long long v19 = [(STBarView *)v16 bottomAnchor];
  long long v20 = [v18 bottomAnchor];
  long long v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  long long v22 = [(STUsageGraphViewController *)self dataSet];
  uint64_t v23 = [v22 timePeriod];
  long long v24 = [v22 dataPoints];
  unint64_t v25 = [v24 count];

  if (v25)
  {
    double v26 = 0.7;
    if (v23 != 1) {
      double v26 = 0.5;
    }
    double v27 = (double)v25;
    if ((double)v25 < 1.0) {
      double v27 = 1.0;
    }
    double v28 = v26 / v27;
  }
  else
  {
    double v28 = 0.0;
  }
  uint64_t v29 = [(STBarView *)v16 widthAnchor];
  uint64_t v30 = [v18 widthAnchor];
  uint64_t v31 = [v29 constraintEqualToAnchor:v30 multiplier:v28];
  [v31 setActive:1];

  [v17 addLayoutGuide:v12];
  id v32 = [v12 topAnchor];
  v33 = [v18 topAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v13;
    id v36 = [v12 leftAnchor];
    v37 = [v35 dashedLineCenterXAnchor];
  }
  else
  {
    id v36 = [v12 leftAnchor];
    v37 = [v13 rightAnchor];
  }
  uint64_t v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  id v39 = [v12 bottomAnchor];
  v40 = [v18 bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [v12 rightAnchor];
  double v43 = [(STBarView *)v16 leftAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  if (v14)
  {
    v45 = [v12 widthAnchor];
    v46 = [v14 widthAnchor];
    uint64_t v47 = [v45 constraintEqualToAnchor:v46 multiplier:a7];
    [v47 setActive:1];
  }

  return v16;
}

- (id)createWeeklyAverageLineWithLayoutGuide:(id)a3
{
  v53[9] = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)MEMORY[0x263F82828];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(STUsageGraphViewController *)self dashedAverageLineImage];
  uint64_t v8 = (void *)[v6 initWithImage:v7];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [MEMORY[0x263F825C8] systemGreenColor];
  [v8 setTintColor:v9];

  id v10 = [(STUsageGraphViewController *)self view];
  [v10 addSubview:v8];
  id v11 = [(STUsageGraphViewController *)self barSectionLayoutGuide];
  long long v52 = v10;
  [v10 addLayoutGuide:v5];
  id v12 = objc_opt_new();
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v12 setFont:v13];

  id v14 = [MEMORY[0x263F825C8] systemGreenColor];
  [v12 setTextColor:v14];

  id v15 = +[STScreenTimeSettingsUIBundle bundle];
  id v16 = [v15 localizedStringForKey:@"DailyAverageLineLabel" value:&stru_26D9391A8 table:0];
  [v12 setText:v16];

  LODWORD(v17) = 1144750080;
  [v12 setContentHuggingPriority:0 forAxis:v17];
  LODWORD(v18) = 1144766464;
  [v12 setContentCompressionResistancePriority:0 forAxis:v18];
  [(STUsageGraphViewController *)self setWeeklyAverageLabel:v12];
  [v10 addSubview:v12];
  long long v19 = [(STUsageGraphViewController *)self yAxisLabelSectionLayoutGuide];
  id v39 = (void *)MEMORY[0x263F08938];
  long long v51 = [v8 leftAnchor];
  id v50 = [v11 leftAnchor];
  SEL v49 = [v51 constraintEqualToAnchor:v50];
  v53[0] = v49;
  SEL v48 = [v8 heightAnchor];
  uint64_t v47 = [v48 constraintEqualToConstant:1.5];
  v53[1] = v47;
  v45 = [v5 leftAnchor];
  v44 = [v11 leftAnchor];
  double v43 = [v45 constraintEqualToAnchor:v44];
  v53[2] = v43;
  v42 = [v5 bottomAnchor];
  v46 = v11;
  v41 = [v11 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v53[3] = v40;
  uint64_t v38 = [v5 rightAnchor];
  v37 = [v11 rightAnchor];
  id v36 = [v38 constraintEqualToAnchor:v37];
  v53[4] = v36;
  id v34 = [v5 topAnchor];

  v33 = [v8 centerYAnchor];
  id v32 = [v34 constraintEqualToAnchor:v33];
  v53[5] = v32;
  uint64_t v31 = [v12 leftAnchor];
  id v35 = v19;
  long long v20 = [v19 leftAnchor];
  long long v21 = [v31 constraintEqualToAnchor:v20];
  v53[6] = v21;
  long long v22 = [v12 centerYAnchor];
  id v30 = v8;
  uint64_t v23 = [v8 centerYAnchor];
  long long v24 = [v22 constraintEqualToAnchor:v23];
  v53[7] = v24;
  unint64_t v25 = [v12 rightAnchor];
  double v26 = [v19 rightAnchor];
  double v27 = [v25 constraintEqualToAnchor:v26];
  v53[8] = v27;
  double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:9];
  [v39 activateConstraints:v28];

  return v30;
}

- (id)createBarIndicatorWithImageName:(id)a3 barView:(id)a4
{
  id v6 = (void *)MEMORY[0x263F827E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = +[STScreenTimeSettingsUIBundle bundle];
  id v10 = [v6 imageNamed:v8 inBundle:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [(STUsageGraphViewController *)self view];
  [v12 addSubview:v11];

  id v13 = [v11 topAnchor];
  id v14 = [v7 bottomAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v16 = [v11 centerXAnchor];
  double v17 = [v7 centerXAnchor];

  double v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handleLongPressGestureForPaddle:(id)a3
{
  id v4 = a3;
  id v5 = [(STUsageGraphViewController *)self barViews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if ((unint64_t)[v4 state] > 2)
    {
      id v15 = [(STUsageGraphViewController *)self paddleView];
      [v15 setHidden:1];

      id v16 = [(STUsageGraphViewController *)self paddleConnectorView];
      [v16 setHidden:1];

      double v17 = [(STUsageGraphViewController *)self selectedBarView];
      [v17 setColor:0];

      double v18 = [(STUsageGraphViewController *)self titleView];
      [v18 alpha];
      double v20 = v19;

      if (v20 <= 0.00000011920929)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __63__STUsageGraphViewController__handleLongPressGestureForPaddle___block_invoke;
        v21[3] = &unk_264766F30;
        v21[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:v21 animations:0.2];
      }
    }
    else
    {
      id v7 = [(STUsageGraphViewController *)self view];
      [v4 locationInView:v7];
      double v9 = v8;
      double v11 = v10;

      id v12 = [(STUsageGraphViewController *)self graphLayoutGuide];
      [v12 layoutFrame];
      v22.x = v9;
      v22.y = v11;
      BOOL v13 = CGRectContainsPoint(v23, v22);

      if (v13)
      {
        id v14 = -[STUsageGraphViewController _closestBarViewToPoint:](self, "_closestBarViewToPoint:", v9, v11);
        [(STUsageGraphViewController *)self _showPaddleForBarView:v14];
      }
    }
  }
}

void __63__STUsageGraphViewController__handleLongPressGestureForPaddle___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleView];
  [v1 setAlpha:1.0];
}

- (id)_closestBarViewToPoint:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(STUsageGraphViewController *)self barViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v21;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 dataPoint];
        BOOL v13 = [v12 total];
        [v13 doubleValue];
        double v15 = v14;

        if (v15 > 0.0)
        {
          [v11 frame];
          double v16 = CGRectGetMidX(v27) - x;
          double v17 = v16 >= 0.0 ? v16 : -v16;
          if (v17 < v9)
          {
            id v18 = v11;

            double v9 = v17;
            id v7 = v18;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_showPaddleForBarView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STUsageGraphViewController *)self selectedBarView];
  [v5 setColor:0];
  if (v4)
  {
    uint64_t v6 = [(STUsageGraphViewController *)self titleView];
    [v6 alpha];
    double v8 = v7;

    if (v8 > 0.00000011920929)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __52__STUsageGraphViewController__showPaddleForBarView___block_invoke;
      v25[3] = &unk_264766F30;
      v25[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v25 animations:0.2];
    }
    id v9 = v4;

    double v10 = [MEMORY[0x263F825C8] systemGreenColor];
    [v9 setColor:v10];

    [(STUsageGraphViewController *)self setSelectedBarView:v9];
    double v11 = [(STUsageGraphViewController *)self paddleView];
    [v11 setHidden:0];
    id v12 = [v9 dataPoint];
    [v11 setDataPoint:v12];

    BOOL v13 = [(STUsageGraphViewController *)self paddleViewCenterXConstraint];
    [v13 setActive:0];
    double v14 = [v11 centerXAnchor];
    double v15 = [v9 centerXAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];

    LODWORD(v17) = 1132068864;
    [v16 setPriority:v17];
    [v16 setActive:1];
    [(STUsageGraphViewController *)self setPaddleViewCenterXConstraint:v16];
    id v18 = [(STUsageGraphViewController *)self paddleConnectorView];
    [v18 setHidden:0];
    double v19 = [(STUsageGraphViewController *)self paddleViewConnectorCenterXConstraint];
    [v19 setActive:0];
    long long v20 = [v18 centerXAnchor];
    long long v21 = [v9 centerXAnchor];
    long long v22 = [v20 constraintEqualToAnchor:v21];

    [v22 setActive:1];
    [(STUsageGraphViewController *)self setPaddleViewConnectorCenterXConstraint:v22];

    uint64_t v5 = v9;
  }
  else
  {
    long long v23 = [(STUsageGraphViewController *)self paddleView];
    [v23 setHidden:1];

    long long v24 = [(STUsageGraphViewController *)self paddleConnectorView];
    [v24 setHidden:1];
  }
}

void __52__STUsageGraphViewController__showPaddleForBarView___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleView];
  [v1 setAlpha:0.0];
}

- (void)_handleLongPressGestureForBarSelection:(id)a3
{
  id v23 = a3;
  id v4 = [(STUsageGraphViewController *)self barViews];
  if (![v4 count]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(STUsageGraphViewController *)self dataSet];
  uint64_t v6 = [v5 timePeriod];

  if (v6 != 2) {
    goto LABEL_20;
  }
  id v4 = [(STUsageGraphViewController *)self view];
  [v23 locationInView:v4];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = -[STUsageGraphViewController _closestBarViewToPoint:](self, "_closestBarViewToPoint:");
  unint64_t v12 = [v23 state];
  [v23 _translationInView:v4];
  double v15 = -v13;
  if (v13 >= 0.0) {
    double v15 = v13;
  }
  if (v15 > 10.0) {
    goto LABEL_16;
  }
  if (v14 < 0.0) {
    double v14 = -v14;
  }
  if (v14 > 10.0) {
    goto LABEL_16;
  }
  if (v12 < 3)
  {
    long long v21 = [(STUsageGraphViewController *)self graphLayoutGuide];
    [v21 layoutFrame];
    v26.double x = v8;
    v26.y = v10;
    BOOL v22 = CGRectContainsPoint(v28, v26);

    long long v20 = v11;
    if (!v22) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v12 - 4 < 2)
  {
LABEL_16:
    long long v20 = 0;
LABEL_17:
    [(STUsageGraphViewController *)self setPressedBarView:v20];
    goto LABEL_18;
  }
  if (v12 == 3)
  {
    double v16 = [(STUsageGraphViewController *)self graphLayoutGuide];
    [v16 layoutFrame];
    v25.double x = v8;
    v25.y = v10;
    BOOL v17 = CGRectContainsPoint(v27, v25);

    if (v17)
    {
      id v18 = [(STUsageGraphViewController *)self selectedBarView];
      int v19 = [v18 isEqual:v11];

      if (v19)
      {

        double v11 = 0;
      }
      [(STUsageGraphViewController *)self _selectBarView:v11];
    }
    goto LABEL_16;
  }
LABEL_18:

LABEL_19:
LABEL_20:
}

- (void)_selectBarView:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(STUsageGraphViewController *)self selectedBarView];
  [(STUsageGraphViewController *)self setSelectedBarView:v4];
  uint64_t v6 = [(STUsageGraphViewController *)self verticalDividers];
  double v7 = [(STUsageGraphViewController *)self barViews];
  CGFloat v8 = v7;
  if (v4)
  {
    double v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "indexOfObject:", v4));
  }
  else
  {
    double v9 = 0;
  }
  CGFloat v10 = [(STUsageGraphViewController *)self selectedVerticalDivider];
  [(STUsageGraphViewController *)self setSelectedVerticalDivider:v9];
  if (v4 && v5)
  {
    double v11 = [MEMORY[0x263F825C8] systemGray4Color];
    [(id)v5 setColor:v11];

    [v10 setSelected:0];
    [(id)v4 setColor:0];
    [v9 setSelected:1];
  }
  else if (v4 | v5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__STUsageGraphViewController__selectBarView___block_invoke;
    v15[3] = &unk_264768BD8;
    BOOL v18 = v5 != 0;
    id v16 = v6;
    id v17 = (id)v4;
    [v8 enumerateObjectsUsingBlock:v15];
    if (v4) {
      [MEMORY[0x263F825C8] systemGrayColor];
    }
    else {
    unint64_t v12 = [MEMORY[0x263F825C8] systemGreenColor];
    }
    double v13 = [(STUsageGraphViewController *)self weeklyAverageLine];
    [v13 setTintColor:v12];

    double v14 = [(STUsageGraphViewController *)self weeklyAverageLabel];
    [v14 setTextColor:v12];
  }
}

void __45__STUsageGraphViewController__selectBarView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (*(unsigned char *)(a1 + 48))
  {
    [v5 setColor:0];
LABEL_5:
    double v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    CGFloat v8 = v7;
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  if (*(id *)(a1 + 40) != v5)
  {
    uint64_t v6 = [MEMORY[0x263F825C8] systemGray4Color];
    [v10 setColor:v6];

    goto LABEL_5;
  }
  double v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  CGFloat v8 = v7;
  uint64_t v9 = 1;
LABEL_6:
  [v7 setSelected:v9];
}

- (UIImage)dashedAverageLineImage
{
  if (dashedAverageLineImage_onceToken[0] != -1) {
    dispatch_once(dashedAverageLineImage_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)dashedAverageLineImage_dashedAverageLineImage;

  return (UIImage *)v2;
}

void __52__STUsageGraphViewController_dashedAverageLineImage__block_invoke()
{
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", 8.0, 1.5);
  uint64_t v0 = [v6 imageWithActions:&__block_literal_global_66];
  id v1 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v0;

  uint64_t v2 = objc_msgSend((id)dashedAverageLineImage_dashedAverageLineImage, "resizableImageWithCapInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  BOOL v3 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v2;

  uint64_t v4 = [(id)dashedAverageLineImage_dashedAverageLineImage imageWithRenderingMode:2];
  id v5 = (void *)dashedAverageLineImage_dashedAverageLineImage;
  dashedAverageLineImage_dashedAverageLineImage = v4;
}

void __52__STUsageGraphViewController_dashedAverageLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = (CGContext *)[a2 CGContext];
  CGContextSetLineWidth(v2, 1.5);
  *(_OWORD *)lengths = xmmword_225C13BB0;
  CGContextSetLineDash(v2, 0.0, lengths, 2uLL);
  v3[0] = (CGPoint)xmmword_225C13B90;
  v3[1] = (CGPoint)xmmword_225C13BA0;
  CGContextAddLines(v2, v3, 2uLL);
  CGContextStrokeLineSegments(v2, v3, 2uLL);
}

- (STUsageReportGraphDataSet)dataSet
{
  return self->_dataSet;
}

- (int64_t)selectedWeekday
{
  return self->_selectedWeekday;
}

- (STBarView)selectedBarView
{
  return (STBarView *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSelectedBarView:(id)a3
{
}

- (unint64_t)week
{
  return self->_week;
}

- (void)setWeek:(unint64_t)a3
{
  self->_weeuint64_t k = a3;
}

- (unint64_t)day
{
  return self->_day;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

- (UIView)titleView
{
  return (UIView *)objc_getProperty(self, a2, 1024, 1);
}

- (STPaddleView)paddleView
{
  return (STPaddleView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPaddleView:(id)a3
{
}

- (UIView)paddleConnectorView
{
  return (UIView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPaddleConnectorView:(id)a3
{
}

- (NSLayoutConstraint)paddleViewCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPaddleViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)paddleViewConnectorCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPaddleViewConnectorCenterXConstraint:(id)a3
{
}

- (NSArray)verticalDividers
{
  return (NSArray *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setVerticalDividers:(id)a3
{
}

- (NSArray)horizontalDividers
{
  return (NSArray *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setHorizontalDividers:(id)a3
{
}

- (NSArray)barViews
{
  return (NSArray *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setBarViews:(id)a3
{
}

- (NSArray)barIndicators
{
  return (NSArray *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setBarIndicators:(id)a3
{
}

- (NSArray)barViewHeightConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setBarViewHeightConstraints:(id)a3
{
}

- (NSArray)verticalLayoutGuides
{
  return (NSArray *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setVerticalLayoutGuides:(id)a3
{
}

- (UILayoutGuide)graphLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setGraphLayoutGuide:(id)a3
{
}

- (UILayoutGuide)xAxisLabelSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setXAxisLabelSectionLayoutGuide:(id)a3
{
}

- (UILayoutGuide)yAxisLabelSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setYAxisLabelSectionLayoutGuide:(id)a3
{
}

- (UILayoutGuide)barSectionLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setBarSectionLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)yAxisLabelSectionWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setYAxisLabelSectionWidthConstraint:(id)a3
{
}

- (UIImageView)weeklyAverageLine
{
  return (UIImageView *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setWeeklyAverageLine:(id)a3
{
}

- (UILabel)weeklyAverageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setWeeklyAverageLabel:(id)a3
{
}

- (UILayoutGuide)weeklyAverageLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setWeeklyAverageLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)weeklyAverageHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setWeeklyAverageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)weeklyAverageTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setWeeklyAverageTrailingConstraint:(id)a3
{
}

- (UIView)vibrancyEffectContentView
{
  return (UIView *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setVibrancyEffectContentView:(id)a3
{
}

- (STDashedVerticalDivider)selectedVerticalDivider
{
  return (STDashedVerticalDivider *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSelectedVerticalDivider:(id)a3
{
}

- (STBarView)pressedBarView
{
  return self->_pressedBarView;
}

- (double)graphHeight
{
  return self->_graphHeight;
}

- (BOOL)includePaddle
{
  return self->_includePaddle;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedBarView, 0);
  objc_storeStrong((id *)&self->_selectedVerticalDivider, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectContentView, 0);
  objc_storeStrong((id *)&self->_weeklyAverageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_weeklyAverageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLabel, 0);
  objc_storeStrong((id *)&self->_weeklyAverageLine, 0);
  objc_storeStrong((id *)&self->_yAxisLabelSectionWidthConstraint, 0);
  objc_storeStrong((id *)&self->_barSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_yAxisLabelSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_xAxisLabelSectionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_graphLayoutGuide, 0);
  objc_storeStrong((id *)&self->_verticalLayoutGuides, 0);
  objc_storeStrong((id *)&self->_barViewHeightConstraints, 0);
  objc_storeStrong((id *)&self->_barIndicators, 0);
  objc_storeStrong((id *)&self->_barViews, 0);
  objc_storeStrong((id *)&self->_horizontalDividers, 0);
  objc_storeStrong((id *)&self->_verticalDividers, 0);
  objc_storeStrong((id *)&self->_paddleViewConnectorCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paddleViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paddleConnectorView, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_selectedBarView, 0);

  objc_storeStrong((id *)&self->_dataSet, 0);
}

@end