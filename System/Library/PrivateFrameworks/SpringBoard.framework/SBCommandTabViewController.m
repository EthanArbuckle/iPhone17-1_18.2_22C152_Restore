@interface SBCommandTabViewController
+ (BOOL)canActivateWithRecentDisplayItems:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)iconViewDisplaysAccessories:(id)a3;
- (SBCommandTabViewController)init;
- (SBCommandTabViewController)initWithRecentDisplayItems:(id)a3;
- (SBCommandTabViewControllerDelegate)delegate;
- (id)selectedApplicationDisplayItem;
- (unint64_t)indexOfDisplayItem:(id)a3;
- (void)_configureGridLayoutConfiguration:(id)a3;
- (void)_handleTapDismissGesture:(id)a3;
- (void)_handleUIGesture:(id)a3;
- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3;
- (void)_updateForUserInterfaceStyle;
- (void)_updateIconSelectionPositionAndLabelText;
- (void)dealloc;
- (void)icon:(id)a3 touchEnded:(BOOL)a4;
- (void)iconModelDidChange:(id)a3;
- (void)iconTapped:(id)a3;
- (void)iconTouchBegan:(id)a3;
- (void)next;
- (void)previous;
- (void)removeDisplayItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showCommandTabBar;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBCommandTabViewController

+ (BOOL)canActivateWithRecentDisplayItems:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    v5 = [v4 bundleIdentifier];
    v6 = FBSystemAppBundleID();
    int v7 = [v5 isEqualToString:v6];

    uint64_t v8 = [v3 count];
    char IsActive = v8 == 0;
    if (v8 && v7) {
      char IsActive = SBWorkspaceSpringBoardIsActive();
    }
  }
  else
  {
    char IsActive = [v3 count] == 0;
  }
  char v10 = IsActive ^ 1;

  return v10;
}

- (SBCommandTabViewController)initWithRecentDisplayItems:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBCommandTabViewController;
  v6 = [(SBCommandTabViewController *)&v32 init];
  if (v6)
  {
    uint64_t v7 = [v5 mutableCopy];
    recentDisplayItems = v6->_recentDisplayItems;
    v6->_recentDisplayItems = (NSMutableOrderedSet *)v7;

    v6->_selectedIndex = 0;
    uint64_t v9 = +[SBIconController sharedInstance];
    iconController = v6->_iconController;
    v6->_iconController = (SBIconController *)v9;

    uint64_t v11 = [(SBIconController *)v6->_iconController model];
    iconModel = v6->_iconModel;
    v6->_iconModel = (SBIconModel *)v11;

    v13 = (void *)([(id)SBApp activeInterfaceOrientation] - 1);
    int v14 = __sb__runningInSpringBoard();
    char v15 = v14;
    if ((unint64_t)v13 <= 1)
    {
      if (v14)
      {
        if (SBFEffectiveDeviceClass() != 2)
        {
          v16 = &SBLogSystemAperturePreferencesStackMitosis_onceToken;
          uint64_t v17 = 6;
LABEL_9:
          v16[35] = v17;
LABEL_29:
          v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          iconViews = v6->_iconViews;
          v6->_iconViews = v28;

          v6->_isTouchDown = 0;
          v6->_isIconSelected = 1;
          v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v30 addObserver:v6 selector:sel_iconModelDidChange_ name:SBIconControllerIconModelDidChangeNotification object:v6->_iconController];

          goto LABEL_30;
        }
        goto LABEL_11;
      }
      v13 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v13 userInterfaceIdiom] == 1)
      {
LABEL_11:
        int v18 = __sb__runningInSpringBoard();
        char v19 = v18;
        if (v18)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          id v3 = [MEMORY[0x1E4F42D90] mainScreen];
          [v3 _referenceBounds];
        }
        BSSizeRoundForScale();
        BOOL v24 = v23 < *(double *)(MEMORY[0x1E4FA6E50] + 264);
        uint64_t v25 = 6;
        uint64_t v26 = 7;
        goto LABEL_23;
      }
      v21 = &SBLogSystemAperturePreferencesStackMitosis_onceToken;
      uint64_t v22 = 6;
LABEL_20:
      v21[35] = v22;
LABEL_28:

      goto LABEL_29;
    }
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v16 = &SBLogSystemAperturePreferencesStackMitosis_onceToken;
        uint64_t v17 = 8;
        goto LABEL_9;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v13 userInterfaceIdiom] != 1)
      {
        v21 = &SBLogSystemAperturePreferencesStackMitosis_onceToken;
        uint64_t v22 = 8;
        goto LABEL_20;
      }
    }
    int v20 = __sb__runningInSpringBoard();
    char v19 = v20;
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    BOOL v24 = v27 < *(double *)(MEMORY[0x1E4FA6E50] + 264);
    uint64_t v25 = 8;
    uint64_t v26 = 10;
LABEL_23:
    if (!v24) {
      uint64_t v25 = v26;
    }
    __max_number_of_apps = v25;
    if ((v19 & 1) == 0) {

    }
    if (v15) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_30:

  return v6;
}

- (SBCommandTabViewController)init
{
  id v3 = [MEMORY[0x1E4F1CAA0] orderedSet];
  v4 = [(SBCommandTabViewController *)self initWithRecentDisplayItems:v3];

  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:SBIconControllerIconModelDidChangeNotification object:self->_iconController];

  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabViewController;
  [(SBCommandTabViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v207[1] = *MEMORY[0x1E4F143B8];
  v201.receiver = self;
  v201.super_class = (Class)SBCommandTabViewController;
  [(SBCommandTabViewController *)&v201 viewDidLoad];
  objc_super v4 = [(SBCommandTabViewController *)self view];
  id v5 = [v4 layer];
  [v5 setHitTestsAsOpaque:1];

  v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v6];

  [v4 setAlpha:0.0];
  uint64_t v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  blurredBackgroundView = self->_blurredBackgroundView;
  self->_blurredBackgroundView = v7;

  [(UIView *)self->_blurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v190 = v4;
  [v4 addSubview:self->_blurredBackgroundView];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA63F8]);
  [(SBCommandTabViewController *)self _configureGridLayoutConfiguration:v9];
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4FA63F0]) initWithLayoutConfiguration:v9];
  id v11 = objc_alloc(MEMORY[0x1E4FA6230]);
  v206 = @"SBIconLocationCommandTab";
  v207[0] = v10;
  v186 = (void *)v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v207 forKeys:&v206 count:1];
  v194 = (void *)[v11 initWithListLayouts:v12];

  v187 = v9;
  [v9 iconImageInfo];
  double v15 = v14 / v13;
  uint64_t v16 = __sb__runningInSpringBoard();
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      double v17 = v15 * 155.0;
      goto LABEL_16;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v12 userInterfaceIdiom] != 1)
    {
      double v17 = v15 * 155.0;
LABEL_15:

      goto LABEL_16;
    }
  }
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v20 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    double v21 = 155.0;
  }
  else {
    double v21 = 169.5;
  }
  double v17 = v15 * v21;
  if ((v19 & 1) == 0) {

  }
  if ((v16 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
  int v22 = __sb__runningInSpringBoard();
  char v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      double v24 = v15 * 106.0;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v16 userInterfaceIdiom] != 1)
    {
      double v24 = v15 * 106.0;
LABEL_30:

      goto LABEL_31;
    }
  }
  int v25 = __sb__runningInSpringBoard();
  char v26 = v25;
  if (v25)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v27 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    double v28 = 106.0;
  }
  else {
    double v28 = 119.5;
  }
  double v24 = v15 * v28;
  if ((v26 & 1) == 0) {

  }
  if ((v23 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:
  id v29 = objc_alloc(MEMORY[0x1E4F743D0]);
  uint64_t v198 = 1061158912;
  long long v199 = *MEMORY[0x1E4F1DB30];
  uint64_t v200 = 0x4036800000000000;
  v30 = (MTShadowView *)[v29 initWithShadowAttributes:&v198 maskCornerRadius:v17];
  backgroundShadowView = self->_backgroundShadowView;
  self->_backgroundShadowView = v30;

  [(MTShadowView *)self->_backgroundShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_blurredBackgroundView addSubview:self->_backgroundShadowView];
  [(MTShadowView *)self->_backgroundShadowView shadowOutsets];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v179 = (void *)MEMORY[0x1E4F28DC8];
  v196 = [(MTShadowView *)self->_backgroundShadowView leadingAnchor];
  v191 = [(UIView *)self->_blurredBackgroundView leadingAnchor];
  v188 = [v196 constraintEqualToAnchor:v191 constant:-v35];
  v205[0] = v188;
  v183 = [(MTShadowView *)self->_backgroundShadowView trailingAnchor];
  v181 = [(UIView *)self->_blurredBackgroundView trailingAnchor];
  v40 = [v183 constraintEqualToAnchor:v181 constant:v39];
  v205[1] = v40;
  v41 = [(MTShadowView *)self->_backgroundShadowView topAnchor];
  v42 = [(UIView *)self->_blurredBackgroundView topAnchor];
  v43 = [v41 constraintEqualToAnchor:v42 constant:-v33];
  v205[2] = v43;
  v44 = [(MTShadowView *)self->_backgroundShadowView bottomAnchor];
  v45 = [(UIView *)self->_blurredBackgroundView bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 constant:v37];
  v205[3] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:4];
  [v179 activateConstraints:v47];

  v48 = (void *)MEMORY[0x1E4F743C8];
  v49 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:0];
  v203[0] = v49;
  v204[0] = @"cmdTabLight";
  v50 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
  v203[1] = v50;
  v204[1] = @"cmdTabLight";
  v51 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  v203[2] = v51;
  v204[2] = @"cmdTabDark";
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v204 forKeys:v203 count:3];
  v53 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v54 = [(SBCommandTabViewController *)self traitCollection];
  v55 = [v48 materialViewWithRecipeNamesByTraitCollection:v52 inBundle:v53 options:0 initialWeighting:0 scaleAdjustment:v54 compatibleWithTraitCollection:1.0];
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v55;

  [(MTMaterialView *)self->_backgroundMaterialView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MTMaterialView *)self->_backgroundMaterialView _setContinuousCornerRadius:v17];
  [(UIView *)self->_blurredBackgroundView addSubview:self->_backgroundMaterialView];
  [(UIView *)self->_blurredBackgroundView _setContinuousCornerRadius:v17];
  v57 = [(UIView *)self->_blurredBackgroundView layer];
  [v57 setAllowsGroupBlending:0];

  v58 = [(UIView *)self->_blurredBackgroundView layer];
  [v58 setBorderWidth:0.3];

  v180 = (void *)MEMORY[0x1E4F28DC8];
  v197 = [(MTMaterialView *)self->_backgroundMaterialView leadingAnchor];
  v192 = [(UIView *)self->_blurredBackgroundView leadingAnchor];
  v189 = [v197 constraintEqualToAnchor:v192];
  v202[0] = v189;
  v184 = [(MTMaterialView *)self->_backgroundMaterialView trailingAnchor];
  v182 = [(UIView *)self->_blurredBackgroundView trailingAnchor];
  v59 = [v184 constraintEqualToAnchor:v182];
  v202[1] = v59;
  v60 = [(MTMaterialView *)self->_backgroundMaterialView topAnchor];
  v61 = [(UIView *)self->_blurredBackgroundView topAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  v202[2] = v62;
  v63 = [(MTMaterialView *)self->_backgroundMaterialView bottomAnchor];
  v64 = [(UIView *)self->_blurredBackgroundView bottomAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  v202[3] = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:4];
  [v180 activateConstraints:v66];

  v67 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
  uint64_t v68 = 1088;
  stackView = self->_stackView;
  self->_stackView = v67;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v70 = self->_stackView;
  int v71 = __sb__runningInSpringBoard();
  char v72 = v71;
  if (v71)
  {
    unint64_t v73 = 0x1E4F42000;
    if (SBFEffectiveDeviceClass() != 2)
    {
      [(UIStackView *)v70 setSpacing:30.0];
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v73 = 0x1E4F42000uLL;
    uint64_t v68 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v68 userInterfaceIdiom] != 1)
    {
      [(UIStackView *)v70 setSpacing:30.0];
LABEL_45:

      goto LABEL_46;
    }
  }
  int v74 = __sb__runningInSpringBoard();
  char v75 = v74;
  if (v74)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v60 = [MEMORY[0x1E4F42D90] mainScreen];
    [v60 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v76 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    double v77 = 30.0;
  }
  else {
    double v77 = 36.0;
  }
  [(UIStackView *)v70 setSpacing:v77];
  if ((v75 & 1) == 0) {

  }
  if ((v72 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_46:
  [(UIView *)self->_blurredBackgroundView addSubview:self->_stackView];
  v78 = [(UIStackView *)self->_stackView centerXAnchor];
  v79 = [(UIView *)self->_blurredBackgroundView centerXAnchor];
  v80 = [v78 constraintEqualToAnchor:v79];
  [v80 setActive:1];

  v81 = [(UIStackView *)self->_stackView centerYAnchor];
  v82 = [(UIView *)self->_blurredBackgroundView centerYAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  [v83 setActive:1];

  v84 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handleUIGesture_];
  uint64_t v85 = 1104;
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v84;

  [(UIStackView *)self->_stackView addGestureRecognizer:self->_panGestureRecognizer];
  v87 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel__handleUIGesture_];
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = v87;

  [(UIStackView *)self->_stackView addGestureRecognizer:self->_hoverGestureRecognizer];
  v89 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapDismissGesture_];
  tapDismissGestureRecognizer = self->_tapDismissGestureRecognizer;
  self->_tapDismissGestureRecognizer = v89;

  [v190 addGestureRecognizer:self->_tapDismissGestureRecognizer];
  v91 = [(UIView *)self->_blurredBackgroundView heightAnchor];
  uint64_t v92 = __sb__runningInSpringBoard();
  if (v92)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v93 = 0;
      int v94 = 0;
      double v95 = 155.0;
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v85 = [*(id *)(v73 + 2376) currentDevice];
    if ([(id)v85 userInterfaceIdiom] != 1)
    {
      int v93 = 0;
      int v94 = 1;
      double v95 = 155.0;
      goto LABEL_56;
    }
  }
  int v94 = v92 ^ 1;
  int v96 = __sb__runningInSpringBoard();
  if (v96)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v92 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v92 _referenceBounds];
  }
  int v93 = v96 ^ 1;
  BSSizeRoundForScale();
  double v95 = 155.0;
  if (v97 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    double v95 = 169.5;
  }
LABEL_56:
  v98 = [v91 constraintEqualToConstant:v95];
  [v98 setActive:1];

  if (v93) {
  if (v94)
  }

  v99 = [(UIView *)self->_blurredBackgroundView centerYAnchor];
  v100 = [v190 centerYAnchor];
  v101 = [v99 constraintEqualToAnchor:v100];
  [v101 setActive:1];

  v102 = [(UIView *)self->_blurredBackgroundView leadingAnchor];
  v103 = [(UIStackView *)self->_stackView leadingAnchor];
  uint64_t v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v105 = 0;
      int v106 = 0;
      double v107 = 39.5;
      goto LABEL_70;
    }
  }
  else
  {
    v101 = [*(id *)(v73 + 2376) currentDevice];
    if ([v101 userInterfaceIdiom] != 1)
    {
      int v105 = 0;
      int v106 = 1;
      double v107 = 39.5;
      goto LABEL_70;
    }
  }
  int v106 = v104 ^ 1;
  int v108 = __sb__runningInSpringBoard();
  if (v108)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v104 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v104 _referenceBounds];
  }
  int v105 = v108 ^ 1;
  BSSizeRoundForScale();
  double v107 = 39.5;
  if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    double v107 = 43.0;
  }
LABEL_70:
  v110 = [v102 constraintEqualToAnchor:v103 constant:-v107];
  [v110 setActive:1];

  if (v105) {
  if (v106)
  }

  v111 = [(UIView *)self->_blurredBackgroundView trailingAnchor];
  v112 = [(UIStackView *)self->_stackView trailingAnchor];
  uint64_t v113 = __sb__runningInSpringBoard();
  if (!v113)
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom] != 1)
    {
      int v114 = 0;
      int v115 = 1;
      double v116 = 39.5;
      goto LABEL_84;
    }
LABEL_78:
    int v115 = v113 ^ 1;
    int v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v113 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v113 _referenceBounds];
    }
    int v114 = v117 ^ 1;
    BSSizeRoundForScale();
    double v116 = 39.5;
    if (v118 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
      double v116 = 43.0;
    }
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_78;
  }
  int v114 = 0;
  int v115 = 0;
  double v116 = 39.5;
LABEL_84:
  v119 = [v111 constraintEqualToAnchor:v112 constant:v116];
  [v119 setActive:1];

  if (v114) {
  if (v115)
  }

  v120 = [(UIView *)self->_blurredBackgroundView centerXAnchor];
  v121 = [v190 centerXAnchor];
  v122 = [v120 constraintEqualToAnchor:v121];
  [v122 setActive:1];

  v123 = (UIView *)objc_opt_new();
  selectionSquareView = self->_selectionSquareView;
  self->_selectionSquareView = v123;

  [(UIView *)self->_selectionSquareView _setContinuousCornerRadius:v24];
  [(UIView *)self->_selectionSquareView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addSubview:self->_selectionSquareView];
  unint64_t v125 = __max_number_of_apps;
  unint64_t v126 = [(NSMutableOrderedSet *)self->_recentDisplayItems count];
  if (v125 >= v126) {
    unint64_t v127 = v126;
  }
  else {
    unint64_t v127 = v125;
  }
  uint64_t v128 = [(NSMutableOrderedSet *)self->_recentDisplayItems indexOfObjectPassingTest:&__block_literal_global_323];
  if (v128 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v129 = [(NSMutableOrderedSet *)self->_recentDisplayItems objectAtIndex:v128];
    [(NSMutableOrderedSet *)self->_recentDisplayItems removeObject:v129];
    if (SBWorkspaceSpringBoardIsActive()) {
      --v127;
    }
    else {
      [(NSMutableOrderedSet *)self->_recentDisplayItems insertObject:v129 atIndex:v127 - 1];
    }
  }
  v185 = [(SBIconController *)self->_iconController iconManager];
  v193 = [v185 iconImageCache];
  v130 = [(SBCommandTabViewController *)self traitCollection];
  uint64_t v131 = [v130 userInterfaceStyle];

  if (!v127) {
    goto LABEL_114;
  }
  uint64_t v132 = 0;
  v195 = 0;
  do
  {
    v133 = [(NSMutableOrderedSet *)self->_recentDisplayItems objectAtIndex:v132];
    v134 = [v133 bundleIdentifier];
    v135 = FBSystemAppBundleID();
    int v136 = [v134 isEqualToString:v135];

    if (v136)
    {
      v137 = [[SBSpringBoardApplicationIcon alloc] initWithInterfaceStyle:v131];
    }
    else
    {
      uint64_t v138 = [v133 type];
      iconModel = self->_iconModel;
      if (v138 == 5)
      {
        v140 = [v133 webClipIdentifier];
        v141 = [(SBHIconModel *)iconModel expectedIconForDisplayIdentifier:v140];

        if (v141) {
          goto LABEL_107;
        }
        goto LABEL_102;
      }
      v137 = [(SBHIconModel *)self->_iconModel expectedIconForDisplayIdentifier:v134];
    }
    v141 = v137;
    if (v137)
    {
LABEL_107:
      v143 = [[SBCommandTabIconView alloc] initWithConfigurationOptions:2];
      [(SBCommandTabIconView *)v143 setLocation:@"SBIconLocationCommandTab"];
      [(SBCommandTabIconView *)v143 setDelegate:self];
      [(SBCommandTabIconView *)v143 setIconImageCache:v193];
      [(SBCommandTabIconView *)v143 setListLayoutProvider:v194];
      [(SBCommandTabIconView *)v143 setIcon:v141];
      [(SBCommandTabIconView *)v143 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(NSMutableArray *)self->_iconViews addObject:v143];
      [(UIStackView *)self->_stackView addArrangedSubview:v143];
      if (v136) {
        objc_storeStrong((id *)&self->_homeIconView, v143);
      }

      goto LABEL_110;
    }
LABEL_102:
    id v142 = v195;
    if (!v195) {
      id v142 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    }
    v195 = v142;
    [v142 addIndex:v132];
LABEL_110:

    ++v132;
  }
  while (v127 != v132);
  if (!v195)
  {
LABEL_114:
    v195 = 0;
    goto LABEL_115;
  }
  -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_recentDisplayItems, "removeObjectsAtIndexes:");
  if (![(NSMutableOrderedSet *)self->_recentDisplayItems count])
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained viewControllerWantsDismissal:self];
    goto LABEL_157;
  }
LABEL_115:
  v145 = (void *)MEMORY[0x1E4F42F80];
  v146 = [(SBCommandTabViewController *)self traitCollection];
  v147 = [v146 preferredContentSizeCategory];
  v148 = UIContentSizeCategoryClip();
  WeakRetained = [v145 traitCollectionWithPreferredContentSizeCategory:v148];

  int v149 = __sb__runningInSpringBoard();
  char v150 = v149;
  if (v149)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      id v151 = (id)*MEMORY[0x1E4F43880];
      goto LABEL_130;
    }
LABEL_119:
    int v152 = __sb__runningInSpringBoard();
    char v153 = v152;
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v148 = [MEMORY[0x1E4F42D90] mainScreen];
      [v148 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
      v155 = (id *)MEMORY[0x1E4F43890];
    }
    else {
      v155 = (id *)MEMORY[0x1E4F43880];
    }
    id v151 = *v155;
    if ((v153 & 1) == 0) {

    }
    if ((v150 & 1) == 0) {
      goto LABEL_129;
    }
  }
  else
  {
    v145 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v145 userInterfaceIdiom] == 1) {
      goto LABEL_119;
    }
    id v151 = (id)*MEMORY[0x1E4F43880];
LABEL_129:
  }
LABEL_130:
  v156 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  selectedIconLabel = self->_selectedIconLabel;
  self->_selectedIconLabel = v156;

  v158 = self->_selectedIconLabel;
  v159 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v151 compatibleWithTraitCollection:WeakRetained];
  [(UILabel *)v158 setFont:v159];

  [(UILabel *)self->_selectedIconLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addSubview:self->_selectedIconLabel];
  v160 = [(UIView *)self->_selectionSquareView centerYAnchor];
  v161 = [(UIStackView *)self->_stackView centerYAnchor];
  v162 = [v160 constraintEqualToAnchor:v161];
  [v162 setActive:1];

  v163 = [(UIView *)self->_selectionSquareView heightAnchor];
  uint64_t v164 = __sb__runningInSpringBoard();
  if (v164)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v165 = 0;
      int v166 = 0;
      double v167 = 106.0;
      goto LABEL_139;
    }
LABEL_134:
    int v165 = v164 ^ 1;
    int v168 = __sb__runningInSpringBoard();
    if (v168)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v164 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v164 _referenceBounds];
    }
    int v166 = v168 ^ 1;
    BSSizeRoundForScale();
    double v167 = dbl_1D8FD2D20[v169 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)];
  }
  else
  {
    v161 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v161 userInterfaceIdiom] == 1) {
      goto LABEL_134;
    }
    int v166 = 0;
    int v165 = 1;
    double v167 = 106.0;
  }
LABEL_139:
  v170 = [v163 constraintEqualToConstant:v167];
  [v170 setActive:1];

  if (v166) {
  if (v165)
  }

  v171 = [(UIView *)self->_selectionSquareView widthAnchor];
  uint64_t v172 = __sb__runningInSpringBoard();
  if (!v172)
  {
    v161 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v161 userInterfaceIdiom] != 1)
    {
      int v174 = 0;
      int v173 = 1;
      double v175 = 106.0;
      goto LABEL_152;
    }
LABEL_147:
    int v173 = v172 ^ 1;
    int v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v172 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v172 _referenceBounds];
    }
    int v174 = v176 ^ 1;
    BSSizeRoundForScale();
    double v175 = dbl_1D8FD2D20[v177 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)];
    goto LABEL_152;
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_147;
  }
  int v173 = 0;
  int v174 = 0;
  double v175 = 106.0;
LABEL_152:
  v178 = [v171 constraintEqualToConstant:v175];
  [v178 setActive:1];

  if (v174) {
  if (v173)
  }

  [(SBCommandTabViewController *)self _updateForUserInterfaceStyle];
  [(SBCommandTabViewController *)self _moveSelectionSquareToIconAtIndex:self->_selectedIndex];

LABEL_157:
}

uint64_t __41__SBCommandTabViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = [a2 bundleIdentifier];
  v6 = FBSystemAppBundleID();
  uint64_t v7 = [v5 isEqualToString:v6];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)showCommandTabBar
{
  id v2 = [(SBCommandTabViewController *)self view];
  [v2 setAlpha:1.0];
}

- (void)next
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex == [(NSMutableArray *)self->_iconViews count] - 1) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = self->_selectedIndex + 1;
  }
  self->_unint64_t selectedIndex = v4;
  -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
}

- (void)previous
{
  uint64_t v3 = [(NSMutableArray *)self->_iconViews count];
  if (v3 != 1)
  {
    unint64_t selectedIndex = self->_selectedIndex;
    if (!selectedIndex) {
      unint64_t selectedIndex = v3;
    }
    self->_unint64_t selectedIndex = selectedIndex - 1;
    -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
  }
}

- (id)selectedApplicationDisplayItem
{
  if (self->_isIconSelected)
  {
    id v2 = [(NSMutableOrderedSet *)self->_recentDisplayItems objectAtIndex:self->_selectedIndex];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)removeDisplayItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    unint64_t v5 = [(SBCommandTabViewController *)self indexOfDisplayItem:v4];
    id v4 = v11;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = [(NSMutableArray *)self->_iconViews objectAtIndex:v5];
      [v6 removeFromSuperview];
      [(NSMutableArray *)self->_iconViews removeObject:v6];
      unint64_t selectedIndex = self->_selectedIndex;
      uint64_t v8 = [(NSMutableArray *)self->_iconViews count];
      if (selectedIndex >= v8 - 1) {
        unint64_t v9 = v8 - 1;
      }
      else {
        unint64_t v9 = selectedIndex;
      }
      self->_unint64_t selectedIndex = v9;
      -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
      [(NSMutableOrderedSet *)self->_recentDisplayItems removeObject:v11];
      if (![(NSMutableOrderedSet *)self->_recentDisplayItems count]
        || ![(NSMutableArray *)self->_iconViews count])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained viewControllerWantsDismissal:self];
      }
      id v4 = v11;
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)iconModelDidChange:(id)a3
{
  id v4 = [(SBIconController *)self->_iconController model];
  iconModel = self->_iconModel;
  self->_iconModel = v4;
}

- (void)iconTouchBegan:(id)a3
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_iconViews count])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = [(NSMutableArray *)self->_iconViews objectAtIndex:v4];
      if ([v5 isEqual:v6])
      {
        self->_unint64_t selectedIndex = v4;
        [(SBCommandTabViewController *)self _moveSelectionSquareToIconAtIndex:v4];
      }

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_iconViews count]);
  }
}

- (void)icon:(id)a3 touchEnded:(BOOL)a4
{
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [(SBCommandTabViewController *)self selectedApplicationDisplayItem];
    [WeakRetained viewController:self selectedApplicationWithDisplayItem:v6];
  }
}

- (void)iconTapped:(id)a3
{
  id v8 = a3;
  if ([(NSMutableArray *)self->_iconViews count])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = [(NSMutableArray *)self->_iconViews objectAtIndex:v4];
      if ([v5 isEqual:v8])
      {
        self->_unint64_t selectedIndex = v4;
        [(SBCommandTabViewController *)self _moveSelectionSquareToIconAtIndex:v4];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v7 = [(SBCommandTabViewController *)self selectedApplicationDisplayItem];
        [WeakRetained viewController:self selectedApplicationWithDisplayItem:v7];
      }
      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_iconViews count]);
  }
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  iconController = self->_iconController;
  unint64_t v4 = [a3 icon];
  LOBYTE(iconController) = [(SBIconController *)iconController allowsBadgingForIcon:v4];

  return (char)iconController;
}

- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_iconViews count] > a3)
  {
    unint64_t v5 = [(NSMutableArray *)self->_iconViews objectAtIndex:a3];
    selectedIconView = self->_selectedIconView;
    self->_selectedIconView = v5;

    [(UIView *)self->_selectionSquareView setAlpha:1.0];
    [(UILabel *)self->_selectedIconLabel setAlpha:1.0];
    self->_isIconSelected = 1;
    [(SBCommandTabViewController *)self _updateIconSelectionPositionAndLabelText];
    id v7 = [(SBCommandTabViewController *)self view];
    [v7 setNeedsDisplay];
  }
}

- (void)_updateIconSelectionPositionAndLabelText
{
  [(UIStackView *)self->_stackView removeConstraint:self->_selectionXLayoutConstraint];
  uint64_t v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_selectionSquareView attribute:9 relatedBy:0 toItem:self->_selectedIconView attribute:9 multiplier:1.0 constant:0.0];
  selectionXLayoutConstraint = self->_selectionXLayoutConstraint;
  self->_selectionXLayoutConstraint = v3;

  [(UIStackView *)self->_stackView addConstraint:self->_selectionXLayoutConstraint];
  selectedIconLabel = self->_selectedIconLabel;
  id v6 = [(SBIconView *)self->_selectedIconView icon];
  id v7 = [v6 displayName];
  [(UILabel *)selectedIconLabel setText:v7];

  [(UILabel *)self->_selectedIconLabel sizeToFit];
  [(UIStackView *)self->_stackView removeConstraint:self->_selectedLabelXConstraint];
  [(UIStackView *)self->_stackView removeConstraint:self->_selectedLabelBottomConstraint];
  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_selectedIconLabel attribute:9 relatedBy:0 toItem:self->_selectionSquareView attribute:9 multiplier:1.0 constant:0.0];
  selectedLabelXConstraint = self->_selectedLabelXConstraint;
  self->_selectedLabelXConstraint = v8;

  [(UIStackView *)self->_stackView addConstraint:self->_selectedLabelXConstraint];
  uint64_t v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_selectedIconLabel attribute:12 relatedBy:0 toItem:self->_blurredBackgroundView attribute:4 multiplier:1.0 constant:-8.0];
  selectedLabelBottomConstraint = self->_selectedLabelBottomConstraint;
  self->_selectedLabelBottomConstraint = v10;

  blurredBackgroundView = self->_blurredBackgroundView;
  double v13 = self->_selectedLabelBottomConstraint;
  [(UIView *)blurredBackgroundView addConstraint:v13];
}

- (unint64_t)indexOfDisplayItem:(id)a3
{
  return [(NSMutableOrderedSet *)self->_recentDisplayItems indexOfObject:a3];
}

- (void)_handleUIGesture:(id)a3
{
  int v18 = (UIHoverGestureRecognizer *)a3;
  self->_isTouchDown = 1;
  unint64_t v4 = [(UIStackView *)self->_stackView superview];
  [(UIHoverGestureRecognizer *)v18 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if (self->_hoverGestureRecognizer == v18)
  {
    if (v6 == self->_lastHoverLocation.x && v8 == self->_lastHoverLocation.y) {
      goto LABEL_15;
    }
    self->_lastHoverLocation.x = v6;
    self->_lastHoverLocation.y = v8;
  }
  [(UIStackView *)self->_stackView frame];
  v20.x = v6;
  v20.y = v8;
  if (CGRectContainsPoint(v23, v20))
  {
    if ([(NSMutableArray *)self->_iconViews count])
    {
      unint64_t v10 = 0;
      while (1)
      {
        [(UIHoverGestureRecognizer *)v18 locationInView:self->_stackView];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        double v15 = [(NSMutableArray *)self->_iconViews objectAtIndex:v10];
        [v15 frame];
        v21.x = v12;
        v21.y = v14;
        if (CGRectContainsPoint(v24, v21)) {
          break;
        }

        if (++v10 >= [(NSMutableArray *)self->_iconViews count]) {
          goto LABEL_15;
        }
      }
      self->_unint64_t selectedIndex = v10;
      [(SBCommandTabViewController *)self _moveSelectionSquareToIconAtIndex:v10];
    }
  }
  else
  {
    [(UIView *)self->_selectionSquareView setAlpha:0.0];
    [(UILabel *)self->_selectedIconLabel setAlpha:0.0];
    self->_isIconSelected = 0;
  }
LABEL_15:
  if ([(UIHoverGestureRecognizer *)v18 state] == 3)
  {
    self->_isTouchDown = 0;
    uint64_t v16 = [(SBCommandTabViewController *)self delegate];
    [(UIStackView *)self->_stackView frame];
    v22.x = v6;
    v22.y = v8;
    if (CGRectContainsPoint(v25, v22) && self->_isIconSelected)
    {
      double v17 = [(SBCommandTabViewController *)self selectedApplicationDisplayItem];
      [v16 viewController:self selectedApplicationWithDisplayItem:v17];
    }
  }
}

- (void)_handleTapDismissGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(SBCommandTabViewController *)self delegate];
    [v4 viewControllerWantsDismissal:self];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCommandTabViewController;
  id v4 = a3;
  [(SBCommandTabViewController *)&v7 traitCollectionDidChange:v4];
  double v5 = [(SBCommandTabViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(SBCommandTabViewController *)self _updateForUserInterfaceStyle];
  }
}

- (void)_updateForUserInterfaceStyle
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBCommandTabViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  double v5 = [(UIView *)self->_blurredBackgroundView layer];
  double v6 = 0.0;
  if (v4 == 2)
  {
    double v6 = 1.0;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 1;
  }
  id v8 = [MEMORY[0x1E4F428B8] colorWithWhite:v6 alpha:0.08];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  selectionSquareView = self->_selectionSquareView;
  unint64_t v10 = [MEMORY[0x1E4F428B8] systemFillColor];
  double v11 = [v10 resolvedColorWithTraitCollection:v3];
  [(UIView *)selectionSquareView setBackgroundColor:v11];

  [(UIView *)self->_selectionSquareView _setDrawsAsBackdropOverlayWithBlendMode:v7];
  selectedIconLabel = self->_selectedIconLabel;
  double v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  CGFloat v14 = [v13 resolvedColorWithTraitCollection:v3];
  [(UILabel *)selectedIconLabel setTextColor:v14];

  [(UILabel *)self->_selectedIconLabel _setDrawsAsBackdropOverlayWithBlendMode:v7];
  double v15 = [[SBSpringBoardApplicationIcon alloc] initWithInterfaceStyle:v4];
  uint64_t v16 = [(SBIconView *)self->_homeIconView iconImageCache];
  v18[0] = v15;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v16 purgeCachedImagesForIcons:v17];

  [(SBIconView *)self->_homeIconView setIcon:v15];
}

- (void)_configureGridLayoutConfiguration:(id)a3
{
  id v4 = a3;
  id v12 = [v4 iconAccessoryVisualConfiguration];
  unint64_t v5 = [MEMORY[0x1E4FA6238] currentDeviceScreenType];
  double v6 = 16.0;
  if (v5 > 0x2F) {
    goto LABEL_10;
  }
  if (((1 << v5) & 0x5AFDE0000000) != 0)
  {
    double v7 = 11.0;
    double v8 = 26.0;
    uint64_t v9 = 0x4053000000000000;
LABEL_4:
    double v10 = *(double *)&v9;
    goto LABEL_7;
  }
  if (((1 << v5) & 0xA50200000000) == 0)
  {
LABEL_10:
    double v7 = 11.0;
    double v8 = 26.0;
    uint64_t v9 = 0x404E000000000000;
    goto LABEL_4;
  }
  double v7 = 12.0;
  double v8 = 27.0;
  double v10 = 83.5;
  double v6 = 18.5;
LABEL_7:
  [v12 setFontSize:v6];
  objc_msgSend(v12, "setSize:", v8, v8);
  objc_msgSend(v12, "setOffset:", v7, v7);
  double v11 = [(SBCommandTabViewController *)self traitCollection];
  [v11 displayScale];

  MEMORY[0x1D948A4E0](v10);
  SBIconImageInfoMake();
  objc_msgSend(v4, "setIconImageInfo:");
}

- (SBCommandTabViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCommandTabViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_homeIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_selectedLabelXConstraint, 0);
  objc_storeStrong((id *)&self->_selectionXLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_selectedIconLabel, 0);
  objc_storeStrong((id *)&self->_selectedIconView, 0);
  objc_storeStrong((id *)&self->_selectionSquareView, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_backgroundShadowView, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_recentDisplayItems, 0);
}

@end