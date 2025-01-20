@interface PRXCardContentWrapperView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)actionButtons;
- (NSArray)auxiliaryViews;
- (NSLayoutConstraint)scrollViewBottomConstraint;
- (NSString)title;
- (PRXAction)infoButtonAction;
- (PRXButton)dismissButton;
- (PRXCardBottomTray)bottomTray;
- (PRXCardContentView)contentView;
- (PRXCardContentWrapperView)initWithContentView:(id)a3;
- (UILabel)scrolledTitleLabel;
- (UIScrollView)scrollView;
- (UIView)bottomKeyline;
- (UIView)titleContainer;
- (UIView)topKeyline;
- (void)didChangeContentsOfBottomTray:(id)a3;
- (void)layoutSubviews;
- (void)removeBottomTray;
- (void)scrollToBottom;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActionButtons:(id)a3;
- (void)setAuxiliaryButtonWithSymbolName:(id)a3 handler:(id)a4;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDismissButton:(id)a3;
- (void)setInfoButtonAction:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRXCardContentWrapperView

- (PRXCardContentWrapperView)initWithContentView:(id)a3
{
  v162[28] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v161.receiver = self;
  v161.super_class = (Class)PRXCardContentWrapperView;
  v6 = -[PRXCardContentWrapperView initWithFrame:](&v161, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    id v159 = v5;
    [(PRXCardContentWrapperView *)v6 setInsetsLayoutMarginsFromSafeArea:0];
    v8 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(PRXCardContentWrapperView *)v7 setBackgroundColor:v8];

    objc_storeStrong((id *)&v7->_contentView, a3);
    [(PRXCardContentView *)v7->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXCardContentView *)v7->_contentView setDelegate:v7];
    p_contentView = (id *)&v7->_contentView;
    [(PRXCardContentView *)v7->_contentView setPreservesSuperviewLayoutMargins:1];
    v9 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
    scrollView = v7->_scrollView;
    v7->_scrollView = v9;

    [(UIScrollView *)v7->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v7->_scrollView setDelegate:v7];
    [(UIScrollView *)v7->_scrollView setShowsHorizontalScrollIndicator:0];
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 bounds];
    uint64_t v16 = PRXCardPreferredSizeClassForContainerBounds(v12, v13, v14, v15);
    v17 = (double *)&PRXCardCompactLayoutMargins;
    v18 = (double *)&unk_21C6F1430;
    if (v16 != 1) {
      v18 = (double *)&unk_21C6F1410;
    }
    double v19 = *v18;
    v20 = (double *)&unk_21C6F1428;
    if (v16 != 1) {
      v20 = (double *)&unk_21C6F1408;
    }
    double v21 = *v20;
    v22 = (double *)&unk_21C6F1420;
    if (v16 != 1)
    {
      v22 = (double *)&unk_21C6F1400;
      v17 = (double *)&PRXCardDefaultLayoutMargins;
    }
    -[UIScrollView setDirectionalLayoutMargins:](v7->_scrollView, "setDirectionalLayoutMargins:", *v17, *v22, v21, v19);

    -[UIScrollView setVerticalScrollIndicatorInsets:](v7->_scrollView, "setVerticalScrollIndicatorInsets:", 54.0, 0.0, 0.0, 0.0);
    [(UIScrollView *)v7->_scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v7->_scrollView addSubview:v7->_contentView];
    [(PRXCardContentWrapperView *)v7 addSubview:v7->_scrollView];
    v23 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    topKeyline = v7->_topKeyline;
    v7->_topKeyline = v23;

    [(UIView *)v7->_topKeyline setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [MEMORY[0x263F1C550] separatorColor];
    [(UIView *)v7->_topKeyline setBackgroundColor:v25];

    [(UIView *)v7->_topKeyline setAlpha:0.2];
    [(UIView *)v7->_topKeyline setHidden:1];
    [(PRXCardContentWrapperView *)v7 addSubview:v7->_topKeyline];
    v26 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    titleContainer = v7->_titleContainer;
    v7->_titleContainer = v26;

    [(UIView *)v7->_titleContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(UIView *)v7->_titleContainer setBackgroundColor:v28];

    [(UIView *)v7->_titleContainer setHidden:1];
    [(PRXCardContentWrapperView *)v7 addSubview:v7->_titleContainer];
    v29 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    scrolledTitleLabel = v7->_scrolledTitleLabel;
    v7->_scrolledTitleLabel = v29;

    [(UILabel *)v7->_scrolledTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_scrolledTitleLabel setTextAlignment:1];
    v31 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D298] maximumContentSizeCategory:*MEMORY[0x263F1D180]];
    [(UILabel *)v7->_scrolledTitleLabel setFont:v31];

    [(UIView *)v7->_titleContainer addSubview:v7->_scrolledTitleLabel];
    [(UIScrollView *)v7->_scrollView directionalLayoutMargins];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v38 = objc_alloc_init(PRXCardBottomTray);
    bottomTray = v7->_bottomTray;
    v7->_bottomTray = v38;

    [(PRXCardBottomTray *)v7->_bottomTray setTranslatesAutoresizingMaskIntoConstraints:0];
    -[PRXCardBottomTray setDirectionalLayoutMargins:](v7->_bottomTray, "setDirectionalLayoutMargins:", v33, v35, v33, v37);
    [(PRXCardBottomTray *)v7->_bottomTray setInsetsLayoutMarginsFromSafeArea:0];
    [(PRXCardBottomTray *)v7->_bottomTray setDelegate:v7];
    [(PRXCardContentWrapperView *)v7 addSubview:v7->_bottomTray];
    v40 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    bottomKeyline = v7->_bottomKeyline;
    v7->_bottomKeyline = v40;

    [(UIView *)v7->_bottomKeyline setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [MEMORY[0x263F1C550] separatorColor];
    [(UIView *)v7->_bottomKeyline setBackgroundColor:v42];

    [(UIView *)v7->_bottomKeyline setAlpha:0.2];
    [(UIView *)v7->_bottomKeyline setHidden:1];
    [(PRXCardContentWrapperView *)v7 addSubview:v7->_bottomKeyline];
    v43 = [(UIScrollView *)v7->_scrollView bottomAnchor];
    v44 = [(PRXCardContentWrapperView *)v7 bottomTray];
    v45 = [v44 topAnchor];
    uint64_t v46 = [v43 constraintEqualToAnchor:v45];
    scrollViewBottomConstraint = v7->_scrollViewBottomConstraint;
    v7->_scrollViewBottomConstraint = (NSLayoutConstraint *)v46;

    [(UIScrollView *)v7->_scrollView directionalLayoutMargins];
    [(NSLayoutConstraint *)v7->_scrollViewBottomConstraint setConstant:-v48];
    v126 = (void *)MEMORY[0x263EFF980];
    v158 = [(UIScrollView *)v7->_scrollView leadingAnchor];
    v157 = [(PRXCardContentWrapperView *)v7 leadingAnchor];
    v156 = [v158 constraintEqualToAnchor:v157];
    v162[0] = v156;
    v155 = [(UIScrollView *)v7->_scrollView trailingAnchor];
    v154 = [(PRXCardContentWrapperView *)v7 trailingAnchor];
    v153 = [v155 constraintEqualToAnchor:v154];
    v162[1] = v153;
    v151 = [(UIScrollView *)v7->_scrollView topAnchor];
    v152 = [(PRXCardContentWrapperView *)v7 layoutMarginsGuide];
    v150 = [v152 topAnchor];
    v149 = [v151 constraintEqualToAnchor:v150];
    v162[2] = v149;
    v162[3] = v7->_scrollViewBottomConstraint;
    v148 = [(UIScrollView *)v7->_scrollView leadingAnchor];
    v147 = [*p_contentView leadingAnchor];
    v146 = [v148 constraintEqualToAnchor:v147];
    v162[4] = v146;
    v145 = [(UIScrollView *)v7->_scrollView trailingAnchor];
    v144 = [*p_contentView trailingAnchor];
    v143 = [v145 constraintEqualToAnchor:v144];
    v162[5] = v143;
    v142 = [(UIScrollView *)v7->_scrollView topAnchor];
    v141 = [*p_contentView topAnchor];
    v140 = [v142 constraintEqualToAnchor:v141];
    v162[6] = v140;
    v139 = [(UIScrollView *)v7->_scrollView bottomAnchor];
    v138 = [*p_contentView bottomAnchor];
    v137 = [v139 constraintEqualToAnchor:v138];
    v162[7] = v137;
    v135 = [(UIScrollView *)v7->_scrollView widthAnchor];
    v134 = [*p_contentView widthAnchor];
    v133 = [v135 constraintEqualToAnchor:v134];
    v162[8] = v133;
    v132 = [(UIView *)v7->_titleContainer leadingAnchor];
    v131 = [(PRXCardContentWrapperView *)v7 leadingAnchor];
    v130 = [v132 constraintEqualToAnchor:v131];
    v162[9] = v130;
    v129 = [(UIView *)v7->_titleContainer trailingAnchor];
    v128 = [(PRXCardContentWrapperView *)v7 trailingAnchor];
    v127 = [v129 constraintEqualToAnchor:v128];
    v162[10] = v127;
    v125 = [(UIView *)v7->_titleContainer topAnchor];
    v124 = [(PRXCardContentWrapperView *)v7 topAnchor];
    v123 = [v125 constraintEqualToAnchor:v124];
    v162[11] = v123;
    v122 = [(UIView *)v7->_titleContainer heightAnchor];
    v121 = [v122 constraintEqualToConstant:62.0];
    v162[12] = v121;
    v120 = [(UILabel *)v7->_scrolledTitleLabel leadingAnchor];
    v119 = [(UIView *)v7->_titleContainer leadingAnchor];
    v118 = [v120 constraintGreaterThanOrEqualToAnchor:v119 constant:60.0];
    v162[13] = v118;
    v117 = [(UILabel *)v7->_scrolledTitleLabel trailingAnchor];
    v116 = [(UIView *)v7->_titleContainer trailingAnchor];
    v115 = [v117 constraintGreaterThanOrEqualToAnchor:v116 constant:-60.0];
    v162[14] = v115;
    v114 = [(UILabel *)v7->_scrolledTitleLabel centerXAnchor];
    v113 = [(UIView *)v7->_titleContainer centerXAnchor];
    v112 = [v114 constraintEqualToAnchor:v113];
    v162[15] = v112;
    v111 = [(UILabel *)v7->_scrolledTitleLabel topAnchor];
    v110 = [(UIView *)v7->_titleContainer topAnchor];
    v109 = [v111 constraintEqualToAnchor:v110 constant:22.0];
    v162[16] = v109;
    v108 = [(UIView *)v7->_topKeyline leadingAnchor];
    v107 = [(UIView *)v7->_titleContainer leadingAnchor];
    v106 = [v108 constraintEqualToAnchor:v107];
    v162[17] = v106;
    v105 = [(UIView *)v7->_topKeyline trailingAnchor];
    v104 = [(UIView *)v7->_titleContainer trailingAnchor];
    v103 = [v105 constraintEqualToAnchor:v104];
    v162[18] = v103;
    v102 = [(UIView *)v7->_topKeyline topAnchor];
    v101 = [(UIView *)v7->_titleContainer bottomAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v162[19] = v100;
    v99 = [(UIView *)v7->_topKeyline heightAnchor];
    v98 = [v99 constraintEqualToConstant:1.0];
    v162[20] = v98;
    v97 = [(PRXCardBottomTray *)v7->_bottomTray leadingAnchor];
    v96 = [(PRXCardContentWrapperView *)v7 leadingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v162[21] = v95;
    v94 = [(PRXCardBottomTray *)v7->_bottomTray trailingAnchor];
    v93 = [(PRXCardContentWrapperView *)v7 trailingAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v162[22] = v92;
    v91 = [(PRXCardBottomTray *)v7->_bottomTray bottomAnchor];
    v90 = [(PRXCardContentWrapperView *)v7 bottomAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v162[23] = v89;
    v88 = [(UIView *)v7->_bottomKeyline leadingAnchor];
    v87 = [(PRXCardBottomTray *)v7->_bottomTray leadingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v162[24] = v86;
    v49 = [(UIView *)v7->_bottomKeyline trailingAnchor];
    v50 = [(PRXCardBottomTray *)v7->_bottomTray trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v162[25] = v51;
    v52 = [(UIView *)v7->_bottomKeyline bottomAnchor];
    v53 = [(PRXCardBottomTray *)v7->_bottomTray topAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    v162[26] = v54;
    v55 = [(UIView *)v7->_bottomKeyline heightAnchor];
    v56 = [v55 constraintEqualToConstant:1.0];
    v162[27] = v56;
    v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v162 count:28];
    v136 = [v126 arrayWithArray:v57];

    v58 = [MEMORY[0x263F086E0] mainBundle];
    v59 = [v58 bundleIdentifier];
    LODWORD(v56) = [v59 isEqualToString:@"com.apple.FMDMagSafeSetupRemoteUI"];

    v60 = v7->_scrollView;
    if (v56)
    {
      v61 = [(UIScrollView *)v60 contentLayoutGuide];
      v62 = [v61 heightAnchor];
      v63 = [*p_contentView heightAnchor];
      v64 = [v62 constraintEqualToAnchor:v63];

      LODWORD(v65) = 1132068864;
      [v64 setPriority:v65];
      v66 = [(UIScrollView *)v7->_scrollView heightAnchor];
      v67 = [(UIScrollView *)v7->_scrollView contentLayoutGuide];
      v68 = [v67 heightAnchor];
      v69 = [v66 constraintGreaterThanOrEqualToAnchor:v68];

      LODWORD(v70) = 1132068864;
      [v69 setPriority:v70];
      v71 = [(UIScrollView *)v7->_scrollView heightAnchor];
      v72 = [MEMORY[0x263F1C920] mainScreen];
      [v72 bounds];
      v74 = [v71 constraintLessThanOrEqualToConstant:v73];
      v75 = v136;
      [v136 addObject:v74];

      [v136 addObject:v64];
    }
    else
    {
      v76 = [(UIScrollView *)v60 frameLayoutGuide];
      v77 = [v76 heightAnchor];
      v78 = [(UIScrollView *)v7->_scrollView contentLayoutGuide];
      v79 = [v78 heightAnchor];
      v69 = [v77 constraintEqualToAnchor:v79];

      LODWORD(v80) = 1144733696;
      [v69 setPriority:v80];
      v64 = [(UIScrollView *)v7->_scrollView frameLayoutGuide];
      v81 = [v64 heightAnchor];
      v82 = [MEMORY[0x263F1C920] mainScreen];
      [v82 bounds];
      v84 = [v81 constraintLessThanOrEqualToConstant:v83];
      v75 = v136;
      [v136 addObject:v84];
    }
    [v75 addObject:v69];
    [MEMORY[0x263F08938] activateConstraints:v75];

    id v5 = v159;
  }

  return v7;
}

- (void)layoutSubviews
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = [a1 scrollView];
  [v4 frame];
  uint64_t v6 = v5;
  v7 = [a1 scrollView];
  [v7 contentSize];
  int v9 = 134218240;
  uint64_t v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_21C6D2000, a2, OS_LOG_TYPE_DEBUG, "Frame height (%f) content height (%f)", (uint8_t *)&v9, 0x16u);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v12.receiver = self;
  v12.super_class = (Class)PRXCardContentWrapperView;
  -[PRXCardContentWrapperView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v12, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  int v9 = PRXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PRXCardContentWrapperView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v9, v6, v8);
  }

  double v10 = v6;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PRXCardContentWrapperView *)self contentView];
  uint64_t v4 = [v3 cardStyle];
  double v5 = [(PRXCardContentWrapperView *)self traitCollection];
  double v6 = PRXCardPreferredSize(v4, objc_msgSend(v5, "prx_cardSizeClass"));
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [(PRXCardContentWrapperView *)self traitCollection];
  double v5 = [v4 customBackgroundColor];

  if (v5)
  {
    double v6 = [(PRXCardContentWrapperView *)self traitCollection];
    double v7 = [v6 customBackgroundColor];
    [(PRXCardContentWrapperView *)self setBackgroundColor:v7];

    double v8 = [(PRXCardContentWrapperView *)self traitCollection];
    double v9 = [v8 customBackgroundColor];
    double v10 = [(PRXCardContentWrapperView *)self titleContainer];
    [v10 setBackgroundColor:v9];

    id v13 = [(PRXCardContentWrapperView *)self traitCollection];
    double v11 = [v13 customBackgroundColor];
    objc_super v12 = [(PRXCardContentWrapperView *)self bottomTray];
    [v12 setBackgroundColor:v11];
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v6 = [(PRXCardContentWrapperView *)self scrolledTitleLabel];
  [v6 setText:v5];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v7 = [(PRXCardContentWrapperView *)self scrollView];
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);
}

- (void)scrollToBottom
{
  id v12 = [(PRXCardContentWrapperView *)self scrollView];
  [v12 contentSize];
  double v4 = v3;
  id v5 = [(PRXCardContentWrapperView *)self scrollView];
  [v5 bounds];
  double v7 = v4 - v6;
  double v8 = [(PRXCardContentWrapperView *)self scrollView];
  [v8 contentInset];
  double v10 = v7 + v9;
  double v11 = [(PRXCardContentWrapperView *)self scrollView];
  objc_msgSend(v11, "setContentOffset:", 0.0, v10);
}

- (void)setInfoButtonAction:(id)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  id v5 = (PRXAction *)a3;
  infoButtonAction = self->_infoButtonAction;
  if (infoButtonAction != v5)
  {
    v24 = v5;
    double v7 = [(PRXAction *)infoButtonAction button];
    [v7 removeFromSuperview];

    objc_storeStrong((id *)&self->_infoButtonAction, a3);
    double v8 = +[PRXButton buttonWithProximityType:4];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXAction *)self->_infoButtonAction setButton:v8];
    [(PRXCardContentWrapperView *)self addSubview:v8];
    BOOL v9 = PRXIsEdgeToEdgePhone();
    double v10 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v9) {
      double v10 = &PRXDismissButtonDefaultMargin;
    }
    double v11 = *(double *)v10;
    double v21 = (void *)MEMORY[0x263F08938];
    v23 = [v8 centerYAnchor];
    v22 = [(PRXCardContentWrapperView *)self topAnchor];
    id v12 = [v23 constraintEqualToAnchor:v22 constant:v11];
    v25[0] = v12;
    id v13 = [v8 centerXAnchor];
    CGFloat v14 = [(PRXCardContentWrapperView *)self leadingAnchor];
    CGFloat v15 = [v13 constraintEqualToAnchor:v14 constant:v11];
    v25[1] = v15;
    uint64_t v16 = [v8 heightAnchor];
    v17 = [v16 constraintEqualToConstant:24.0];
    v25[2] = v17;
    v18 = [v8 widthAnchor];
    double v19 = [v18 constraintEqualToConstant:24.0];
    v25[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v21 activateConstraints:v20];

    id v5 = v24;
  }
}

- (void)setAuxiliaryButtonWithSymbolName:(id)a3 handler:(id)a4
{
  v33[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v29 = [MEMORY[0x263F1C6B0] systemImageNamed:a3];
  double v7 = (void *)MEMORY[0x263F1C3C0];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __70__PRXCardContentWrapperView_setAuxiliaryButtonWithSymbolName_handler___block_invoke;
  v31[3] = &unk_264418198;
  id v32 = v6;
  id v30 = v6;
  v28 = [v7 actionWithHandler:v31];
  double v8 = [MEMORY[0x263F1C488] systemButtonWithPrimaryAction:v28];
  [v8 setImage:v29 forState:0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v9 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v8 setTintColor:v9];

  double v10 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v10];

  double v11 = [v8 layer];
  [v11 setCornerRadius:12.0];

  id v12 = [MEMORY[0x263F1C6C8] configurationWithPointSize:7 weight:1 scale:15.0];
  [v8 setPreferredSymbolConfiguration:v12 forImageInState:0];

  [(PRXCardContentWrapperView *)self addSubview:v8];
  BOOL v13 = PRXIsEdgeToEdgePhone();
  CGFloat v14 = &PRXDismissButtonEdgeToEdgeMargin;
  if (!v13) {
    CGFloat v14 = &PRXDismissButtonDefaultMargin;
  }
  double v15 = *(double *)v14;
  v27 = objc_msgSend(v8, "centerYAnchor", MEMORY[0x263F08938]);
  v26 = [(PRXCardContentWrapperView *)self topAnchor];
  uint64_t v16 = [v27 constraintEqualToAnchor:v26 constant:v15];
  v33[0] = v16;
  v17 = [v8 centerXAnchor];
  v18 = [(PRXCardContentWrapperView *)self leadingAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18 constant:v15];
  v33[1] = v19;
  v20 = [v8 heightAnchor];
  double v21 = [v20 constraintEqualToConstant:24.0];
  v33[2] = v21;
  v22 = [v8 widthAnchor];
  v23 = [v22 constraintEqualToConstant:24.0];
  v33[3] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v25 activateConstraints:v24];
}

uint64_t __70__PRXCardContentWrapperView_setAuxiliaryButtonWithSymbolName_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeBottomTray
{
  id v2 = [(PRXCardContentWrapperView *)self bottomTray];
  [v2 removeFromSuperview];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXCardContentWrapperView *)self contentView];
  id v6 = [v5 titleView];
  [v6 frame];
  double MaxY = CGRectGetMaxY(v15);

  [v4 contentOffset];
  double v9 = v8;

  if (v9 <= MaxY)
  {
    BOOL v11 = 1;
  }
  else
  {
    double v10 = [(PRXCardContentWrapperView *)self title];
    BOOL v11 = v10 == 0;
  }
  id v12 = [(PRXCardContentWrapperView *)self topKeyline];
  [v12 setHidden:v11];

  id v13 = [(PRXCardContentWrapperView *)self titleContainer];
  [v13 setHidden:v11];
}

- (void)setDismissButton:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = (PRXButton *)a3;
  p_dismissButton = &self->_dismissButton;
  dismissButton = self->_dismissButton;
  if (dismissButton != v5)
  {
    [(PRXButton *)dismissButton removeFromSuperview];
    objc_storeStrong((id *)&self->_dismissButton, a3);
    [(PRXButton *)*p_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXCardContentWrapperView *)self addSubview:*p_dismissButton];
    BOOL v8 = PRXIsEdgeToEdgePhone();
    double v9 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v8) {
      double v9 = &PRXDismissButtonDefaultMargin;
    }
    double v10 = *(double *)v9;
    BOOL v11 = (void *)MEMORY[0x263F08938];
    id v12 = [(PRXButton *)*p_dismissButton centerYAnchor];
    id v13 = [(PRXCardContentWrapperView *)self topAnchor];
    CGFloat v14 = [v12 constraintEqualToAnchor:v13 constant:v10];
    v19[0] = v14;
    CGRect v15 = [(PRXButton *)*p_dismissButton centerXAnchor];
    uint64_t v16 = [(PRXCardContentWrapperView *)self trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-v10];
    v19[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v11 activateConstraints:v18];
  }
}

- (NSArray)auxiliaryViews
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [(PRXCardContentWrapperView *)self bottomTray];
  v5[0] = v2;
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSArray)actionButtons
{
  id v2 = [(PRXCardContentWrapperView *)self bottomTray];
  double v3 = [v2 actionButtons];

  return (NSArray *)v3;
}

- (void)setActionButtons:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXCardContentWrapperView *)self bottomTray];
  [v5 setActionButtons:v4];
}

- (void)didChangeContentsOfBottomTray:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXCardContentWrapperView *)self bottomTray];

  if (v5 == v4)
  {
    id v6 = [(PRXCardContentWrapperView *)self bottomTray];
    char v7 = [v6 containsContents];

    if (v7)
    {
      BOOL v8 = [(PRXCardContentWrapperView *)self scrollViewBottomConstraint];
      double v9 = 0.0;
      id v12 = v8;
    }
    else
    {
      [(UIScrollView *)self->_scrollView directionalLayoutMargins];
      double v11 = -v10;
      BOOL v8 = [(PRXCardContentWrapperView *)self scrollViewBottomConstraint];
      id v12 = v8;
      double v9 = v11;
    }
    [v8 setConstant:v9];
  }
}

- (PRXButton)dismissButton
{
  return self->_dismissButton;
}

- (NSString)title
{
  return self->_title;
}

- (PRXAction)infoButtonAction
{
  return self->_infoButtonAction;
}

- (PRXCardBottomTray)bottomTray
{
  return self->_bottomTray;
}

- (PRXCardContentView)contentView
{
  return self->_contentView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)bottomKeyline
{
  return self->_bottomKeyline;
}

- (UIView)topKeyline
{
  return self->_topKeyline;
}

- (UIView)titleContainer
{
  return self->_titleContainer;
}

- (UILabel)scrolledTitleLabel
{
  return self->_scrolledTitleLabel;
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scrolledTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_topKeyline, 0);
  objc_storeStrong((id *)&self->_bottomKeyline, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomTray, 0);
  objc_storeStrong((id *)&self->_infoButtonAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

- (void)systemLayoutSizeFittingSize:(NSObject *)a1 withHorizontalFittingPriority:(double)a2 verticalFittingPriority:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_21C6D2000, a1, OS_LOG_TYPE_DEBUG, "Layout size fitting size: %@", (uint8_t *)&v5, 0xCu);
}

@end