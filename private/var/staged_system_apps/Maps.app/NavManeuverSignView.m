@interface NavManeuverSignView
- (BOOL)animatingToHideManeuverView;
- (BOOL)flipMajorAndMinorTextInLabels;
- (BOOL)hasManeuverArtwork;
- (BOOL)hasShieldImage;
- (BOOL)hasShieldInfo;
- (BOOL)suppressShieldView;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (GuidanceManeuverView)maneuverView;
- (NSArray)maneuverViewLeadingLayoutGuideConstraints;
- (NSArray)maneuverViewTrailingLayoutGuideConstraints;
- (NSLayoutConstraint)maneuverViewCenterYConstraint;
- (NSLayoutConstraint)maneuverViewEqualSideMarginsConstraint;
- (NSLayoutConstraint)maneuverViewHeightConstraint;
- (NSLayoutConstraint)maneuverViewLeadingMarginConstraint;
- (NSLayoutConstraint)maneuverViewMinLeadingMarginConstraint;
- (NSLayoutConstraint)maneuverViewMinWidthConstraint;
- (NSLayoutConstraint)maneuverViewTopToTopConstraint;
- (NSLayoutConstraint)maneuverViewTrailingMarginConstraint;
- (NSLayoutConstraint)sheildViewBottomToMinorLabelTopConstraint;
- (NSLayoutConstraint)shieldViewTopToTopConstraint;
- (NSLayoutConstraint)shieldViewTrailingMajorLabelConstraint;
- (NSLayoutConstraint)trailingToShieldViewTrailingConstraint;
- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo;
- (UIImageView)shieldView;
- (double)shieldCompressionRatio;
- (id)_defaultSignLayoutDelegate;
- (id)debugDescription;
- (int64_t)maneuverSignType;
- (int64_t)shieldSize;
- (void)_setNeedsUpdateShield;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateLabelText;
- (void)_updateShieldView;
- (void)clearContent;
- (void)configureForArrivalWithSignID:(id)a3 titles:(id)a4 details:(id)a5 maneuverType:(int)a6;
- (void)configureForProceedToRouteWithSignID:(id)a3 displayString:(id)a4;
- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4;
- (void)refreshSign;
- (void)setAnimatingToHideManeuverView:(BOOL)a3;
- (void)setFlipMajorAndMinorTextInLabels:(BOOL)a3;
- (void)setManeuverGuidanceInfo:(id)a3;
- (void)setManeuverGuidanceInfo:(id)a3 hasArrived:(BOOL)a4;
- (void)setShieldSize:(int64_t)a3;
- (void)setSuppressShieldView:(BOOL)a3;
- (void)updateTheme;
@end

@implementation NavManeuverSignView

- (void)clearContent
{
  self->_maneuverSignType = 0;
  [(NavManeuverSignView *)self setManeuverGuidanceInfo:0];
  v3 = [(NavManeuverSignView *)self maneuverView];
  [v3 setManeuverArtwork:0];

  v4.receiver = self;
  v4.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v4 clearContent];
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v9 updateTheme];
  v3 = [(NavManeuverSignView *)self theme];
  objc_super v4 = [v3 navSignGuidanceManeuverColor];
  v5 = [(NavManeuverSignView *)self maneuverView];
  [v5 setArrowColor:v4];

  v6 = [(NavManeuverSignView *)self theme];
  v7 = [v6 navSignGuidanceManeuverAccentColor];
  v8 = [(NavManeuverSignView *)self maneuverView];
  [v8 setAccentColor:v7];
}

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultLayoutDelegateForWalking];
}

- (void)refreshSign
{
  v3 = [(NavSignView *)self signLayoutDelegate];
  objc_super v4 = v3;
  if (v3) {
    [v3 maneuverViewArrowMetricsForSign:self];
  }
  else {
    memset(__src, 0, sizeof(__src));
  }
  v5 = [(NavManeuverSignView *)self maneuverView];
  memcpy(__dst, __src, sizeof(__dst));
  [v5 setArrowMetrics:__dst];

  v6 = [(NavSignView *)self signLayoutDelegate];
  v7 = v6;
  if (v6) {
    [v6 maneuverViewJunctionArrowMetricsForSign:self];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  v8 = [(NavManeuverSignView *)self maneuverView];
  memcpy(v13, v14, sizeof(v13));
  [v8 setJunctionArrowMetrics:v13];

  objc_super v9 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  v10 = [v9 maneuverArtwork];
  v11 = [(NavManeuverSignView *)self maneuverView];
  [v11 setManeuverArtwork:v10];

  [(NavManeuverSignView *)self _setNeedsUpdateShield];
  v12.receiver = self;
  v12.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v12 refreshSign];
}

- (void)_setupSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v20 _setupSubviews];
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  [(NavManeuverSignView *)self setAccessibilityIdentifier:v4];

  self->_shieldSize = 4;
  v5 = [GuidanceManeuverView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v9 = -[GuidanceManeuverView initWithFrame:textureProvider:](v5, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
  maneuverView = self->_maneuverView;
  self->_maneuverView = v9;

  [(GuidanceManeuverView *)self->_maneuverView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GuidanceManeuverView *)self->_maneuverView setOverrideUserInterfaceStyle:2];
  LODWORD(v11) = 1148846080;
  [(GuidanceManeuverView *)self->_maneuverView setContentCompressionResistancePriority:0 forAxis:v11];
  LODWORD(v12) = 1148829696;
  [(GuidanceManeuverView *)self->_maneuverView setContentHuggingPriority:0 forAxis:v12];
  [(GuidanceManeuverView *)self->_maneuverView setFraming:1];
  [(NavManeuverSignView *)self addSubview:self->_maneuverView];
  v13 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  shieldView = self->_shieldView;
  self->_shieldView = v13;

  [(UIImageView *)self->_shieldView setAccessibilityIdentifier:@"ShieldView"];
  [(UIImageView *)self->_shieldView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_shieldView setContentMode:1];
  [(UIImageView *)self->_shieldView setOverrideUserInterfaceStyle:2];
  LODWORD(v15) = 1148829696;
  [(UIImageView *)self->_shieldView setContentHuggingPriority:0 forAxis:v15];
  v16 = [(NavSignView *)self majorLabel];
  [v16 contentCompressionResistancePriorityForAxis:0];
  float v18 = v17;

  *(float *)&double v19 = v18 + -1.0;
  [(UIImageView *)self->_shieldView setContentCompressionResistancePriority:0 forAxis:v19];
  [(UIImageView *)self->_shieldView setAccessibilityIdentifier:@"ShieldView"];
  [(NavManeuverSignView *)self addSubview:self->_shieldView];
}

- (void)_setupConstraints
{
  v114.receiver = self;
  v114.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v114 _setupConstraints];
  id v3 = objc_alloc_init((Class)UILayoutGuide);
  [(NavManeuverSignView *)self addLayoutGuide:"addLayoutGuide:"];
  id v113 = objc_alloc_init((Class)UILayoutGuide);
  [(NavManeuverSignView *)self addLayoutGuide:v113];
  objc_super v4 = +[NSMutableArray array];
  uint64_t v5 = _NSDictionaryOfVariableBindings(@"_maneuverView, _shieldView", self->_maneuverView, self->_shieldView, 0);
  v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_maneuverView]-(>=0)-|" options:0 metrics:0 views:v5];
  [v4 addObjectsFromArray:v6];

  v7 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[_maneuverView]-(>=0)-|", 0, 0, v5);
  [v4 addObjectsFromArray:v7];

  v112 = (void *)v5;
  v8 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(>=0)-[_shieldView]-(>=0)-|", 0, 0, v5);
  [v4 addObjectsFromArray:v8];

  objc_super v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[_shieldView]-(>=0)-|", 0, 0, v5);
  [v4 addObjectsFromArray:v9];

  v10 = [(NavManeuverSignView *)self maneuverView];
  double v11 = [v10 leadingAnchor];
  double v12 = [(NavManeuverSignView *)self leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  maneuverViewLeadingMarginConstraint = self->_maneuverViewLeadingMarginConstraint;
  self->_maneuverViewLeadingMarginConstraint = v13;

  LODWORD(v15) = 1148829696;
  [(NSLayoutConstraint *)self->_maneuverViewLeadingMarginConstraint setPriority:v15];
  v16 = [(NavManeuverSignView *)self maneuverViewLeadingMarginConstraint];
  [v4 addObject:v16];

  float v17 = [(NavManeuverSignView *)self trailingAnchor];
  float v18 = [(NavManeuverSignView *)self shieldView];
  double v19 = [v18 trailingAnchor];
  objc_super v20 = [v17 constraintEqualToAnchor:v19];
  trailingToShieldViewTrailingConstraint = self->_trailingToShieldViewTrailingConstraint;
  self->_trailingToShieldViewTrailingConstraint = v20;

  v22 = [(NavManeuverSignView *)self trailingToShieldViewTrailingConstraint];
  v111 = v4;
  [v4 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v4];
  v23 = v3;
  v108 = [v3 leadingAnchor];
  v106 = [(NavManeuverSignView *)self leadingAnchor];
  v104 = [v108 constraintEqualToAnchor:v106];
  v116[0] = v104;
  v100 = [v3 trailingAnchor];
  v102 = [(NavManeuverSignView *)self maneuverView];
  v98 = [v102 leadingAnchor];
  v24 = [v100 constraintEqualToAnchor:v98];
  v116[1] = v24;
  v110 = v3;
  v25 = [v3 topAnchor];
  v26 = [(NavManeuverSignView *)self maneuverView];
  v27 = [v26 topAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v116[2] = v28;
  v29 = [v23 heightAnchor];
  v30 = [(NavManeuverSignView *)self maneuverView];
  v31 = [v30 heightAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  v116[3] = v32;
  v33 = +[NSArray arrayWithObjects:v116 count:4];
  maneuverViewLeadingLayoutGuideConstraints = self->_maneuverViewLeadingLayoutGuideConstraints;
  self->_maneuverViewLeadingLayoutGuideConstraints = v33;

  v107 = [v113 leadingAnchor];
  v109 = [(NavManeuverSignView *)self maneuverView];
  v105 = [v109 trailingAnchor];
  v103 = [v107 constraintEqualToAnchor:v105];
  v115[0] = v103;
  v99 = [v113 trailingAnchor];
  v101 = [(NavSignView *)self majorLabel];
  v97 = [v101 leadingAnchor];
  v35 = [v99 constraintEqualToAnchor:v97];
  v115[1] = v35;
  v36 = [v113 topAnchor];
  v37 = [(NavManeuverSignView *)self maneuverView];
  v38 = [v37 topAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  v115[2] = v39;
  v40 = [v113 heightAnchor];
  v41 = [(NavManeuverSignView *)self maneuverView];
  v42 = [v41 heightAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v115[3] = v43;
  v44 = +[NSArray arrayWithObjects:v115 count:4];
  maneuverViewTrailingLayoutGuideConstraints = self->_maneuverViewTrailingLayoutGuideConstraints;
  self->_maneuverViewTrailingLayoutGuideConstraints = v44;

  v46 = [(NavManeuverSignView *)self maneuverView];
  v47 = [v46 leadingAnchor];
  v48 = [(NavManeuverSignView *)self leadingAnchor];
  v49 = [v47 constraintGreaterThanOrEqualToAnchor:v48];
  maneuverViewMinLeadingMarginConstraint = self->_maneuverViewMinLeadingMarginConstraint;
  self->_maneuverViewMinLeadingMarginConstraint = v49;

  v51 = [(NavManeuverSignView *)self maneuverView];
  v52 = [v51 widthAnchor];
  v53 = [v52 constraintGreaterThanOrEqualToConstant:0.0];
  maneuverViewMinWidthConstraint = self->_maneuverViewMinWidthConstraint;
  self->_maneuverViewMinWidthConstraint = v53;

  v55 = [(NavManeuverSignView *)self maneuverView];
  v56 = [v55 heightAnchor];
  v57 = [v56 constraintEqualToConstant:0.0];
  maneuverViewHeightConstraint = self->_maneuverViewHeightConstraint;
  self->_maneuverViewHeightConstraint = v57;

  v59 = [(NavManeuverSignView *)self maneuverView];
  v60 = [v59 centerYAnchor];
  v61 = [(NavManeuverSignView *)self centerYAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  maneuverViewCenterYConstraint = self->_maneuverViewCenterYConstraint;
  self->_maneuverViewCenterYConstraint = v62;

  v64 = [(NavManeuverSignView *)self maneuverView];
  v65 = [v64 topAnchor];
  v66 = [(NavManeuverSignView *)self topAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  maneuverViewTopToTopConstraint = self->_maneuverViewTopToTopConstraint;
  self->_maneuverViewTopToTopConstraint = v67;

  v69 = [(NavSignView *)self majorLabel];
  v70 = [v69 leadingAnchor];
  v71 = [(NavManeuverSignView *)self maneuverView];
  v72 = [v71 trailingAnchor];
  v73 = [v70 constraintEqualToAnchor:v72];
  maneuverViewTrailingMarginConstraint = self->_maneuverViewTrailingMarginConstraint;
  self->_maneuverViewTrailingMarginConstraint = v73;

  v75 = [v110 widthAnchor];
  v76 = [v113 widthAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  maneuverViewEqualSideMarginsConstraint = self->_maneuverViewEqualSideMarginsConstraint;
  self->_maneuverViewEqualSideMarginsConstraint = v77;

  LODWORD(v79) = 1148813312;
  [(NSLayoutConstraint *)self->_maneuverViewEqualSideMarginsConstraint setPriority:v79];
  v80 = [(NavManeuverSignView *)self shieldView];
  v81 = [v80 topAnchor];
  v82 = [(NavManeuverSignView *)self topAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  shieldViewTopToTopConstraint = self->_shieldViewTopToTopConstraint;
  self->_shieldViewTopToTopConstraint = v83;

  v85 = [(NavManeuverSignView *)self shieldView];
  v86 = [v85 leadingAnchor];
  v87 = [(NavSignView *)self majorLabel];
  v88 = [v87 trailingAnchor];
  v89 = [v86 constraintEqualToAnchor:v88];
  shieldViewTrailingMajorLabelConstraint = self->_shieldViewTrailingMajorLabelConstraint;
  self->_shieldViewTrailingMajorLabelConstraint = v89;

  v91 = [(NavSignView *)self minorLabel];
  v92 = [v91 topAnchor];
  v93 = [(NavManeuverSignView *)self shieldView];
  v94 = [v93 bottomAnchor];
  v95 = [v92 constraintGreaterThanOrEqualToAnchor:v94];
  sheildViewBottomToMinorLabelTopConstraint = self->_sheildViewBottomToMinorLabelTopConstraint;
  self->_sheildViewBottomToMinorLabelTopConstraint = v95;
}

- (void)_updateConstraints
{
  v82.receiver = self;
  v82.super_class = (Class)NavManeuverSignView;
  [(NavSignView *)&v82 _updateConstraints];
  if ([(NavManeuverSignView *)self hasManeuverArtwork])
  {
    objc_super v4 = [(NavSignView *)self signLayoutDelegate];
    uint64_t v5 = [v4 forceHideManeuverViewForSign:self] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(NavManeuverSignView *)self hasShieldImage]
    && ![(NavManeuverSignView *)self suppressShieldView])
  {
    v7 = [(NavSignView *)self signLayoutDelegate];
    unsigned int v6 = [v7 forceHideShieldViewForSign:self] ^ 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  uint64_t v8 = v5 ^ 1;
  objc_super v9 = [(NavManeuverSignView *)self maneuverView];
  [v9 setHidden:v8];

  if (v6)
  {
    uint64_t v8 = [(NavManeuverSignView *)self shieldView];
    objc_super v9 = [(id)v8 layer];
    v2 = [v9 animationKeys];
    BOOL v10 = v2 != 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  double v11 = [(NavManeuverSignView *)self shieldView];
  [v11 setHidden:v10];

  if (v6)
  {
  }
  if ([(NavManeuverSignView *)self animatingToHideManeuverView])
  {
    double v12 = [(NavManeuverSignView *)self maneuverView];
    [v12 setHidden:0];
  }
  v13 = [(NavSignView *)self signLayoutDelegate];
  v14 = v13;
  if (v13) {
    [v13 maneuverViewArrowMetricsForSign:self];
  }
  else {
    memset(__src, 0, sizeof(__src));
  }
  double v15 = [(NavManeuverSignView *)self maneuverView];
  memcpy(__dst, __src, sizeof(__dst));
  [v15 setArrowMetrics:__dst];

  v16 = [(NavSignView *)self signLayoutDelegate];
  float v17 = v16;
  if (v16) {
    [v16 maneuverViewJunctionArrowMetricsForSign:self];
  }
  else {
    memset(v79, 0, sizeof(v79));
  }
  float v18 = [(NavManeuverSignView *)self maneuverView];
  memcpy(v78, v79, sizeof(v78));
  [v18 setJunctionArrowMetrics:v78];

  double v19 = [(NavSignView *)self signLayoutDelegate];
  [v19 maneuverViewSizeForSign:self];
  double v21 = v20;
  double v23 = v22;

  v24 = [(NavManeuverSignView *)self maneuverViewMinWidthConstraint];
  [v24 setConstant:v21];

  v25 = [(NavManeuverSignView *)self maneuverViewHeightConstraint];
  [v25 setConstant:v23];

  v26 = [(NavSignView *)self signLayoutDelegate];
  [v26 contentSideMarginForSign:self];
  double v28 = v27;

  v29 = [(NavManeuverSignView *)self maneuverView];
  [v29 frame];
  double Width = CGRectGetWidth(v85);

  if (v5) {
    double v31 = v28;
  }
  else {
    double v31 = -Width;
  }
  v32 = [(NavManeuverSignView *)self maneuverViewLeadingMarginConstraint];
  [v32 setConstant:v31];

  v33 = [(NavManeuverSignView *)self maneuverViewMinLeadingMarginConstraint];
  [v33 setConstant:v28];

  v34 = [(NavManeuverSignView *)self trailingToShieldViewTrailingConstraint];
  [v34 setConstant:v28];

  v35 = [(NavSignView *)self signLayoutDelegate];
  [v35 maneuverViewTopMarginForSign:self];
  double v37 = round(v36);

  v38 = [(NavManeuverSignView *)self maneuverViewTopToTopConstraint];
  [v38 setConstant:v37];

  v39 = [(NavSignView *)self signLayoutDelegate];
  unsigned int v40 = 1;
  [v39 navSignView:self textLeadingMarginForMajorText:1];
  double v42 = v41;

  v43 = [(NavManeuverSignView *)self maneuverViewTrailingMarginConstraint];
  [v43 setConstant:v42];

  v44 = [(NavSignView *)self signLayoutDelegate];
  [v44 navSignView:self textTrailingMarginForMajorText:1];
  double v46 = v45;

  v47 = [(NavManeuverSignView *)self shieldViewTrailingMajorLabelConstraint];
  [v47 setConstant:v46];

  v48 = [(NavSignView *)self minorLabel];
  v49 = [v48 font];
  [v49 _scaledValueForValue:1 useLanguageAwareScaling:2.0];
  double v51 = v50;

  v52 = [(NavManeuverSignView *)self sheildViewBottomToMinorLabelTopConstraint];
  [v52 setConstant:v51];

  v53 = [(NavSignView *)self signLayoutDelegate];
  [v53 shieldViewTopMarginForSign:self];
  double v55 = round(v54);

  v56 = [(NavManeuverSignView *)self shieldViewTopToTopConstraint];
  [v56 setConstant:v55];

  v57 = objc_alloc_init(LayoutConstraintActivationHelper);
  if (![(NavSignView *)self hasMajorText]) {
    unsigned int v40 = [(NavSignView *)self hasMinorText];
  }
  v58 = [(NavManeuverSignView *)self maneuverViewLeadingLayoutGuideConstraints];
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraints:v58 activate:v5];

  v59 = [(NavManeuverSignView *)self maneuverViewTrailingLayoutGuideConstraints];
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraints:v59 activate:v5 & v40];

  v60 = [(NavManeuverSignView *)self maneuverViewMinLeadingMarginConstraint];
  v84[0] = v60;
  v61 = [(NavManeuverSignView *)self maneuverViewMinWidthConstraint];
  v84[1] = v61;
  v62 = [(NavManeuverSignView *)self maneuverViewHeightConstraint];
  v84[2] = v62;
  v63 = +[NSArray arrayWithObjects:v84 count:3];
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraints:v63 activate:v5];

  v64 = [(NavSignView *)self signLayoutDelegate];
  id v65 = [v64 maneuverViewPositionForSign:self];

  v66 = [(NavManeuverSignView *)self maneuverViewCenterYConstraint];
  if (v65 == (id)2) {
    uint64_t v67 = 0;
  }
  else {
    uint64_t v67 = v5;
  }
  if (v65 == (id)2) {
    uint64_t v68 = v5;
  }
  else {
    uint64_t v68 = 0;
  }
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraint:v66 activate:v67];

  v69 = [(NavManeuverSignView *)self maneuverViewTopToTopConstraint];
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraint:v69 activate:v68];

  v70 = [(NavManeuverSignView *)self maneuverViewEqualSideMarginsConstraint];
  if (v65 == (id)1) {
    uint64_t v71 = v5 & v40;
  }
  else {
    uint64_t v71 = 0;
  }
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraint:v70 activate:v71];

  v72 = [(NavManeuverSignView *)self maneuverViewTrailingMarginConstraint];
  if (v5)
  {
    if (v65 == (id)1) {
      uint64_t v73 = 0;
    }
    else {
      uint64_t v73 = v40;
    }
  }
  else
  {
    uint64_t v73 = 0;
  }
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraint:v72 activate:v73];

  v74 = [(NavManeuverSignView *)self shieldViewTopToTopConstraint];
  v83[0] = v74;
  v75 = [(NavManeuverSignView *)self shieldViewTrailingMajorLabelConstraint];
  v83[1] = v75;
  v76 = [(NavManeuverSignView *)self sheildViewBottomToMinorLabelTopConstraint];
  v83[2] = v76;
  v77 = +[NSArray arrayWithObjects:v83 count:3];
  [(LayoutConstraintActivationHelper *)v57 scheduleConstraints:v77 activate:v6];

  [(LayoutConstraintActivationHelper *)v57 commitPendingConstraints];
}

- (void)_updateLabelText
{
  if ([(NavManeuverSignView *)self flipMajorAndMinorTextInLabels]
    && ![(NavManeuverSignView *)self maneuverSignType])
  {
    BOOL v10 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    double v11 = [v10 minorTextAlternatives];
    double v12 = [(NavSignView *)self majorLabel];
    [v12 setTextAlternatives:v11];

    id v18 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    uint64_t v9 = [v18 majorTextAlternatives];
    goto LABEL_7;
  }
  if ((id)[(NavManeuverSignView *)self maneuverSignType] != (id)1
    || ([(NavManeuverSignView *)self maneuverGuidanceInfo],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 majorTextAlternatives],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v3,
        v5))
  {
    unsigned int v6 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    v7 = [v6 majorTextAlternatives];
    uint64_t v8 = [(NavSignView *)self majorLabel];
    [v8 setTextAlternatives:v7];

    id v18 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    uint64_t v9 = [v18 minorTextAlternatives];
LABEL_7:
    v13 = (void *)v9;
    v14 = [(NavSignView *)self minorLabel];
    [v14 setTextAlternatives:v13];

    goto LABEL_8;
  }
  double v15 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  v16 = [v15 minorTextAlternatives];
  float v17 = [(NavSignView *)self majorLabel];
  [v17 setTextAlternatives:v16];

  id v18 = [(NavSignView *)self minorLabel];
  [v18 setTextAlternatives:0];
LABEL_8:
}

- (void)setManeuverGuidanceInfo:(id)a3
{
}

- (void)setManeuverGuidanceInfo:(id)a3 hasArrived:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (NavSignManeuverGuidanceInfo *)a3;
  if (self->_maneuverGuidanceInfo != v7)
  {
    v13 = v7;
    objc_storeStrong((id *)&self->_maneuverGuidanceInfo, a3);
    uint64_t v8 = [(NavSignManeuverGuidanceInfo *)v13 maneuverArtwork];
    unsigned __int8 v9 = [v8 isStartRouteManeuver];

    if (v9)
    {
      int64_t v10 = 1;
    }
    else if (v4 {
           && ([(NavSignManeuverGuidanceInfo *)v13 maneuverArtwork],
    }
               double v11 = objc_claimAutoreleasedReturnValue(),
               unsigned __int8 v12 = [v11 isArriveManeuver],
               v11,
               (v12 & 1) != 0))
    {
      int64_t v10 = 2;
    }
    else
    {
      int64_t v10 = 0;
    }
    self->_maneuverSignType = v10;
    [(NavManeuverSignView *)self refreshSign];
    v7 = v13;
  }
}

- (void)configureForProceedToRouteWithSignID:(id)a3 displayString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NavManeuverSignView *)self clearContent];
  if ([v6 length])
  {
    uint64_t v8 = [v6 mkServerFormattedString];
  }
  else
  {
    unsigned __int8 v9 = +[NSBundle mainBundle];
    int64_t v10 = [v9 localizedStringForKey:@"Proceed to the route [Driving/Walking Navigation]" value:@"localized string not found" table:0];
    uint64_t v8 = [v10 mkServerFormattedString];
  }
  double v11 = [NavSignManeuverGuidanceInfo alloc];
  unsigned __int8 v12 = +[GuidanceManeuverArtwork artworkWithManeuver:17];
  double v15 = v8;
  v13 = +[NSArray arrayWithObjects:&v15 count:1];
  v14 = [(NavSignManeuverGuidanceInfo *)v11 initWithSignID:v7 maneuverArtwork:v12 majorTextAlternatives:v13 minorTextAlternatives:0 shieldInfo:0];

  [(NavManeuverSignView *)self setManeuverGuidanceInfo:v14];
}

- (void)configureForArrivalWithSignID:(id)a3 titles:(id)a4 details:(id)a5 maneuverType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  [(NavManeuverSignView *)self clearContent];
  if (![v10 count])
  {
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Arrived [Driving/Walking Navigation]" value:@"localized string not found" table:0];
    double v15 = [v14 mkServerFormattedString];
    double v20 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v20 count:1];

    id v10 = (id)v16;
  }
  float v17 = [NavSignManeuverGuidanceInfo alloc];
  id v18 = +[GuidanceManeuverArtwork artworkWithManeuver:v6];
  double v19 = [(NavSignManeuverGuidanceInfo *)v17 initWithSignID:v12 maneuverArtwork:v18 majorTextAlternatives:v10 minorTextAlternatives:v11 shieldInfo:0];

  [(NavManeuverSignView *)self setManeuverGuidanceInfo:v19 hasArrived:1];
}

- (BOOL)hasManeuverArtwork
{
  v2 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  id v3 = [v2 maneuverArtwork];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasShieldInfo
{
  v2 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  id v3 = [v2 shieldInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasShieldImage
{
  v2 = [(NavManeuverSignView *)self shieldView];
  id v3 = [v2 image];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setShieldSize:(int64_t)a3
{
  if (self->_shieldSize != a3)
  {
    self->_shieldSize = a3;
    [(NavManeuverSignView *)self _setNeedsUpdateShield];
  }
}

- (void)setSuppressShieldView:(BOOL)a3
{
  if (self->_suppressShieldView != a3)
  {
    self->_suppressShieldView = a3;
    if ([(NavManeuverSignView *)self hasShieldInfo])
    {
      if ([(NavManeuverSignView *)self hasShieldImage])
      {
        [(NavManeuverSignView *)self setNeedsLayout];
      }
    }
  }
}

- (double)shieldCompressionRatio
{
  id v3 = [(NavManeuverSignView *)self shieldView];
  [v3 bounds];
  double Width = CGRectGetWidth(v10);

  id v5 = [(NavManeuverSignView *)self shieldView];
  uint64_t v6 = [v5 image];
  [v6 size];
  double v8 = v7;

  double result = Width / v8;
  if (v8 <= 0.0) {
    return 0.0;
  }
  return result;
}

- (void)setFlipMajorAndMinorTextInLabels:(BOOL)a3
{
  if (self->_flipMajorAndMinorTextInLabels != a3)
  {
    self->_flipMajorAndMinorTextInLabels = a3;
    [(NavManeuverSignView *)self setNeedsLayout];
  }
}

- (void)_setNeedsUpdateShield
{
  if (!self->_needsUpdateShield)
  {
    self->_needsUpdateShield = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100646B28;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateShieldView
{
  if (self->_needsUpdateShield)
  {
    id v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    uint64_t v6 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    double v7 = [v6 shieldInfo];
    [v7 shieldImageWithSize:[self shieldSize] scale:0 idiom:v5];
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    double v8 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v11 image], 0, v5);
    unsigned __int8 v9 = [(NavManeuverSignView *)self shieldView];
    [v9 setImage:v8];

    CGRect v10 = [(NavManeuverSignView *)self shieldView];
    [v10 sizeToFit];

    [(NavManeuverSignView *)self setNeedsLayout];
    self->_needsUpdateShield = 0;
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(NavManeuverSignView *)self _updateShieldView];
  [(NavManeuverSignView *)self setNeedsLayout];
  [(NavManeuverSignView *)self layoutIfNeeded];
  v14.receiver = self;
  v14.super_class = (Class)NavManeuverSignView;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[NavManeuverSignView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)NavManeuverSignView;
  id v3 = [(NavManeuverSignView *)&v7 debugDescription];
  double v4 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
  double v5 = +[NSString stringWithFormat:@"%@\nManeuver: [%@]", v3, v4];

  return v5;
}

- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4
{
  id v16 = a3;
  id v6 = [(NavSignView *)self majorLabel];

  if (v6 == v16)
  {
    unsigned __int8 v9 = [(NavSignView *)self analyticsDelegate];
    double v10 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    double v11 = [v10 signID];
    double v12 = v9;
    double v13 = self;
    unint64_t v14 = a4;
    uint64_t v15 = 1;
  }
  else
  {
    id v7 = [(NavSignView *)self minorLabel];

    double v8 = v16;
    if (v7 != v16) {
      goto LABEL_6;
    }
    unsigned __int8 v9 = [(NavSignView *)self analyticsDelegate];
    double v10 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
    double v11 = [v10 signID];
    double v12 = v9;
    double v13 = self;
    unint64_t v14 = a4;
    uint64_t v15 = 0;
  }
  [v12 navSignView:v13 didSelectAlternate:v14 forPrimaryString:v15 inSign:v11];

  double v8 = v16;
LABEL_6:
}

- (int64_t)maneuverSignType
{
  return self->_maneuverSignType;
}

- (NavSignManeuverGuidanceInfo)maneuverGuidanceInfo
{
  return self->_maneuverGuidanceInfo;
}

- (GuidanceManeuverView)maneuverView
{
  return self->_maneuverView;
}

- (UIImageView)shieldView
{
  return self->_shieldView;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (BOOL)suppressShieldView
{
  return self->_suppressShieldView;
}

- (BOOL)animatingToHideManeuverView
{
  return self->_animatingToHideManeuverView;
}

- (void)setAnimatingToHideManeuverView:(BOOL)a3
{
  self->_animatingToHideManeuverView = a3;
}

- (BOOL)flipMajorAndMinorTextInLabels
{
  return self->_flipMajorAndMinorTextInLabels;
}

- (NSLayoutConstraint)maneuverViewMinWidthConstraint
{
  return self->_maneuverViewMinWidthConstraint;
}

- (NSLayoutConstraint)maneuverViewHeightConstraint
{
  return self->_maneuverViewHeightConstraint;
}

- (NSLayoutConstraint)maneuverViewMinLeadingMarginConstraint
{
  return self->_maneuverViewMinLeadingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewLeadingMarginConstraint
{
  return self->_maneuverViewLeadingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewTrailingMarginConstraint
{
  return self->_maneuverViewTrailingMarginConstraint;
}

- (NSLayoutConstraint)maneuverViewEqualSideMarginsConstraint
{
  return self->_maneuverViewEqualSideMarginsConstraint;
}

- (NSLayoutConstraint)maneuverViewCenterYConstraint
{
  return self->_maneuverViewCenterYConstraint;
}

- (NSLayoutConstraint)maneuverViewTopToTopConstraint
{
  return self->_maneuverViewTopToTopConstraint;
}

- (NSLayoutConstraint)shieldViewTopToTopConstraint
{
  return self->_shieldViewTopToTopConstraint;
}

- (NSLayoutConstraint)trailingToShieldViewTrailingConstraint
{
  return self->_trailingToShieldViewTrailingConstraint;
}

- (NSLayoutConstraint)shieldViewTrailingMajorLabelConstraint
{
  return self->_shieldViewTrailingMajorLabelConstraint;
}

- (NSLayoutConstraint)sheildViewBottomToMinorLabelTopConstraint
{
  return self->_sheildViewBottomToMinorLabelTopConstraint;
}

- (NSArray)maneuverViewLeadingLayoutGuideConstraints
{
  return self->_maneuverViewLeadingLayoutGuideConstraints;
}

- (NSArray)maneuverViewTrailingLayoutGuideConstraints
{
  return self->_maneuverViewTrailingLayoutGuideConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverViewTrailingLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_maneuverViewLeadingLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_sheildViewBottomToMinorLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_shieldViewTrailingMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_trailingToShieldViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_shieldViewTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewEqualSideMarginsConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewMinLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maneuverViewMinWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);

  objc_storeStrong((id *)&self->_maneuverGuidanceInfo, 0);
}

@end