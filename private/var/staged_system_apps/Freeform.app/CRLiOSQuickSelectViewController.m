@interface CRLiOSQuickSelectViewController
- (BOOL)isInCompactViewModeForCompactFrame:(CGRect)a3 andRegularSizeFrame:(CGRect)a4;
- (BOOL)p_isHUDHidden;
- (BOOL)p_isInCompactViewModeForFrame:(CGRect)a3;
- (BOOL)p_isPresented;
- (CGRect)p_visibleCanvasRectInContainerView;
- (CRLiOSQuickSelectViewController)initWithDelegate:(id)a3;
- (CRLiOSUnhittableView)hudContainerView;
- (NSArray)compactHUDConstraints;
- (NSArray)regularSizeHUDConstraints;
- (UIButton)deselectAllButton;
- (UIButton)doneButton;
- (UIButton)selectAllButton;
- (UIImageView)iconImageView;
- (UILabel)textLabel;
- (UIView)HUDView;
- (UIView)backgroundView;
- (id)p_constraintsForBackgroundView:(id)a3 inHudView:(id)a4;
- (id)p_constraintsForIconView:(id)a3 verticallyCenteredToView:(id)a4 inHudView:(id)a5;
- (id)p_constraintsForSelectAllButton:(id)a3 deselectAllButton:(id)a4 andDoneButton:(id)a5 withSeparator:(id)a6 andTextLabel:(id)a7 inHudView:(id)a8 forCompactLayout:(BOOL)a9;
- (id)p_constraintsForTextLabel:(id)a3 inHudView:(id)a4 withIconView:(id)a5 andSelectAllButton:(id)a6 andDeselectAllButton:(id)a7 forCompactLayout:(BOOL)a8;
- (id)p_createBackgroundView;
- (id)p_createBaseHUDView;
- (id)p_createSeparatorView;
- (id)p_makeHUDView;
- (id)p_setupHUDConstraintsInContainerViewForView:(id)a3 isCompact:(BOOL)a4;
- (id)traitCollection;
- (void)dismiss;
- (void)p_beginWatchingSelectionChanges;
- (void)p_configureDoneButton:(id)a3;
- (void)p_configureIconView:(id)a3;
- (void)p_configureSelectAllButton:(id)a3 andDeselectAllButton:(id)a4;
- (void)p_configureSelectButton:(id)a3;
- (void)p_configureTextLabel:(id)a3;
- (void)p_currentEditorDidChange:(id)a3;
- (void)p_deselectAllAction:(id)a3;
- (void)p_dismissAndAlertDelegate;
- (void)p_displayCurrentHUDForTraitCollection:(id)a3 andVisibleRect:(CGRect)a4;
- (void)p_doneEditingAction:(id)a3;
- (void)p_endWatchingSelectionChanges;
- (void)p_hideHUDWithAnimation:(BOOL)a3;
- (void)p_performHudContainerViewFrameUpdate;
- (void)p_performSuperviewInteraction:(id)a3;
- (void)p_selectAllAction:(id)a3;
- (void)p_selectionPathDidChange:(id)a3;
- (void)p_setNeedsHudContainerViewFrameUpdate;
- (void)p_temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3 hudRect:(CGRect)a4;
- (void)p_unhideHUDWithAnimation:(BOOL)a3;
- (void)p_updateHUDAppearance;
- (void)p_updateHUDIcon;
- (void)p_updateHUDState;
- (void)p_updateHUDTitle;
- (void)p_updateHudContainerViewFrameWithVisibleRect:(CGRect)a3 animated:(BOOL)a4;
- (void)p_updateStateForSelectionButtons;
- (void)p_updateUIAfterSwitchingBetweenCompactAndRegular;
- (void)presentOnCanvasViewController:(id)a3 parentView:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setCompactHUDConstraints:(id)a3;
- (void)setDeselectAllButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setHUDView:(id)a3;
- (void)setHudContainerView:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setRegularSizeHUDConstraints:(id)a3;
- (void)setSelectAllButton:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)temporarilyHideUI;
- (void)temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3;
- (void)unhideUI;
- (void)unhideUIIfAppropriateAfterHidingForWindowRect;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRLiOSQuickSelectViewController

- (CRLiOSQuickSelectViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLiOSQuickSelectViewController;
  v5 = [(CRLiOSQuickSelectViewController *)&v21 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = objc_alloc((Class)UIImageView);
    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:17.0];
    v9 = +[UIImage systemImageNamed:@"square.on.circle" withConfiguration:v8];
    v10 = (UIImageView *)[v7 initWithImage:v9];
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = v10;

    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    textLabel = v6->_textLabel;
    v6->_textLabel = v12;

    uint64_t v14 = +[UIButton buttonWithType:1];
    doneButton = v6->_doneButton;
    v6->_doneButton = (UIButton *)v14;

    uint64_t v16 = +[UIButton buttonWithType:1];
    selectAllButton = v6->_selectAllButton;
    v6->_selectAllButton = (UIButton *)v16;

    uint64_t v18 = +[UIButton buttonWithType:1];
    deselectAllButton = v6->_deselectAllButton;
    v6->_deselectAllButton = (UIButton *)v18;
  }
  return v6;
}

- (id)p_makeHUDView
{
  v3 = [(CRLiOSQuickSelectViewController *)self p_createBaseHUDView];
  id v4 = [(CRLiOSQuickSelectViewController *)self p_createBackgroundView];
  [(CRLiOSQuickSelectViewController *)self setBackgroundView:v4];

  v5 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  [(CRLiOSQuickSelectViewController *)self p_configureIconView:v5];

  v6 = [(CRLiOSQuickSelectViewController *)self textLabel];
  [(CRLiOSQuickSelectViewController *)self p_configureTextLabel:v6];

  id v7 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  v8 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  [(CRLiOSQuickSelectViewController *)self p_configureSelectAllButton:v7 andDeselectAllButton:v8];

  [(CRLiOSQuickSelectViewController *)self p_updateHUDState];
  v9 = [(CRLiOSQuickSelectViewController *)self p_createSeparatorView];
  v10 = [(CRLiOSQuickSelectViewController *)self backgroundView];
  [v10 addSubview:v9];

  v11 = [(CRLiOSQuickSelectViewController *)self doneButton];
  [(CRLiOSQuickSelectViewController *)self p_configureDoneButton:v11];

  v12 = [(CRLiOSQuickSelectViewController *)self backgroundView];
  [v3 addSubview:v12];

  v13 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  [v3 addSubview:v13];

  uint64_t v14 = [(CRLiOSQuickSelectViewController *)self textLabel];
  [v3 addSubview:v14];

  v15 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  [v3 addSubview:v15];

  uint64_t v16 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  [v3 addSubview:v16];

  v17 = [(CRLiOSQuickSelectViewController *)self doneButton];
  [v3 addSubview:v17];

  id v18 = objc_alloc_init((Class)NSMutableArray);
  v19 = [(CRLiOSQuickSelectViewController *)self backgroundView];
  v20 = [(CRLiOSQuickSelectViewController *)self p_constraintsForBackgroundView:v19 inHudView:v3];
  [v18 addObjectsFromArray:v20];

  +[NSLayoutConstraint activateConstraints:v18];
  objc_super v21 = +[NSMutableArray array];
  v22 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  v23 = [(CRLiOSQuickSelectViewController *)self p_constraintsForIconView:v22 verticallyCenteredToView:v3 inHudView:v3];
  [v21 addObjectsFromArray:v23];

  v24 = [(CRLiOSQuickSelectViewController *)self textLabel];
  v25 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  v26 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  v27 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  v28 = [(CRLiOSQuickSelectViewController *)self p_constraintsForTextLabel:v24 inHudView:v3 withIconView:v25 andSelectAllButton:v26 andDeselectAllButton:v27 forCompactLayout:0];
  [v21 addObjectsFromArray:v28];

  v29 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  v30 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  v31 = [(CRLiOSQuickSelectViewController *)self doneButton];
  v32 = [(CRLiOSQuickSelectViewController *)self textLabel];
  LOBYTE(v55) = 0;
  v33 = [(CRLiOSQuickSelectViewController *)self p_constraintsForSelectAllButton:v29 deselectAllButton:v30 andDoneButton:v31 withSeparator:v9 andTextLabel:v32 inHudView:v3 forCompactLayout:v55];
  [v21 addObjectsFromArray:v33];

  v34 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];

  if (v34)
  {
    v35 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
    v36 = [v35 arrayByAddingObjectsFromArray:v21];
    [(CRLiOSQuickSelectViewController *)self setRegularSizeHUDConstraints:v36];
  }
  else
  {
    [(CRLiOSQuickSelectViewController *)self setRegularSizeHUDConstraints:v21];
  }

  v37 = +[NSMutableArray array];
  v38 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  v39 = [(CRLiOSQuickSelectViewController *)self textLabel];
  v40 = [(CRLiOSQuickSelectViewController *)self p_constraintsForIconView:v38 verticallyCenteredToView:v39 inHudView:v3];
  [v37 addObjectsFromArray:v40];

  v41 = [(CRLiOSQuickSelectViewController *)self textLabel];
  v42 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  v43 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  v44 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  v45 = [(CRLiOSQuickSelectViewController *)self p_constraintsForTextLabel:v41 inHudView:v3 withIconView:v42 andSelectAllButton:v43 andDeselectAllButton:v44 forCompactLayout:1];
  [v37 addObjectsFromArray:v45];

  v46 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  v47 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
  v48 = [(CRLiOSQuickSelectViewController *)self doneButton];
  v49 = [(CRLiOSQuickSelectViewController *)self textLabel];
  LOBYTE(v56) = 1;
  v50 = [(CRLiOSQuickSelectViewController *)self p_constraintsForSelectAllButton:v46 deselectAllButton:v47 andDoneButton:v48 withSeparator:v9 andTextLabel:v49 inHudView:v3 forCompactLayout:v56];
  [v37 addObjectsFromArray:v50];

  v51 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];

  if (v51)
  {
    v52 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
    v53 = [v52 arrayByAddingObjectsFromArray:v37];
    [(CRLiOSQuickSelectViewController *)self setCompactHUDConstraints:v53];
  }
  else
  {
    [(CRLiOSQuickSelectViewController *)self setCompactHUDConstraints:v37];
  }

  return v3;
}

- (void)temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CRLiOSQuickSelectViewController *)self HUDView];
  v9 = [(CRLiOSQuickSelectViewController *)self HUDView];
  [v9 bounds];
  [v8 convertRect:0 toView:nil];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[CRLiOSQuickSelectViewController p_temporarilyHideUIIfAppropriateForWindowRect:hudRect:](self, "p_temporarilyHideUIIfAppropriateForWindowRect:hudRect:", x, y, width, height, v11, v13, v15, v17);
}

- (void)temporarilyHideUI
{
}

- (void)p_temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3 hudRect:(CGRect)a4
{
  if (sub_10006525C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)&& !self->_hidingHUDForWindowRect)
  {
    self->_hidingHUDForWindowRect = 1;
    [(CRLiOSQuickSelectViewController *)self p_hideHUDWithAnimation:1];
  }
}

- (void)unhideUIIfAppropriateAfterHidingForWindowRect
{
  if (self->_hidingHUDForWindowRect)
  {
    self->_hidingHUDForWindowRect = 0;
    [(CRLiOSQuickSelectViewController *)self p_unhideHUDWithAnimation:1];
  }
}

- (void)unhideUI
{
}

- (id)traitCollection
{
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSQuickSelectViewController;
  v2 = [(CRLiOSQuickSelectViewController *)&v8 traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    v9[0] = v2;
    id v4 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];
    v9[1] = v4;
    v5 = +[NSArray arrayWithObjects:v9 count:2];
    uint64_t v6 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v5];

    v2 = (void *)v6;
  }

  return v2;
}

- (BOOL)isInCompactViewModeForCompactFrame:(CGRect)a3 andRegularSizeFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double v13 = [(CRLiOSQuickSelectViewController *)self traitCollection];
  id v14 = [v13 horizontalSizeClass];

  if (v14 == (id)1) {
    double v15 = v11;
  }
  else {
    double v15 = x;
  }
  if (v14 == (id)1) {
    double v16 = v10;
  }
  else {
    double v16 = y;
  }
  if (v14 == (id)1) {
    double v17 = v9;
  }
  else {
    double v17 = width;
  }
  if (v14 == (id)1) {
    double v18 = v8;
  }
  else {
    double v18 = height;
  }

  return -[CRLiOSQuickSelectViewController p_isInCompactViewModeForFrame:](self, "p_isInCompactViewModeForFrame:", v15, v16, v17, v18);
}

- (BOOL)p_isInCompactViewModeForFrame:(CGRect)a3
{
  double width = a3.size.width;
  id v4 = [(CRLiOSQuickSelectViewController *)self traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)1 && width >= 480.0) {
    return 0;
  }
  return width < 480.0 || v5 == (id)1;
}

- (id)p_createBaseHUDView
{
  id v2 = objc_alloc_init((Class)UIView);
  v3 = [v2 layer];
  [v3 setCornerRadius:8.0];

  id v4 = [v2 layer];
  [v4 setCornerCurve:kCACornerCurveContinuous];

  id v5 = +[UIColor colorWithWhite:1.0 alpha:0.1];
  id v6 = [v5 CGColor];
  id v7 = [v2 layer];
  [v7 setBorderColor:v6];

  double v8 = [v2 layer];
  [v8 setBorderWidth:1.0];

  LODWORD(v9) = 1144799232;
  [v2 setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1148829696;
  [v2 setContentCompressionResistancePriority:0 forAxis:v10];

  return v2;
}

- (id)p_createBackgroundView
{
  id v2 = objc_alloc_init((Class)UIView);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIColor systemBackgroundColor];
  [v2 setBackgroundColor:v3];

  id v4 = [v2 layer];
  [v4 crl_applyDefaultCanvasOverlayUIShadowSettings];

  id v5 = [v2 layer];
  [v5 setCornerRadius:8.0];

  id v6 = [v2 layer];
  [v6 setCornerCurve:kCACornerCurveContinuous];

  return v2;
}

- (id)p_createSeparatorView
{
  id v2 = objc_alloc_init((Class)UIView);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIColor separatorColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (void)p_configureIconView:(id)a3
{
  id v8 = a3;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIColor labelColor];
  [v8 setTintColor:v3];

  LODWORD(v4) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v8 setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v8 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v8 setContentHuggingPriority:1 forAxis:v7];
}

- (void)p_configureTextLabel:(id)a3
{
  id v7 = a3;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v7 setFont:v3];

  double v4 = +[UIColor labelColor];
  [v7 setTextColor:v4];

  [v7 setNumberOfLines:0];
  [v7 setAdjustsFontSizeToFitWidth:1];
  [v7 setAllowsDefaultTighteningForTruncation:1];
  [v7 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v5) = 1144750080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1132068864;
  [v7 setContentHuggingPriority:0 forAxis:v6];
}

- (void)p_configureSelectAllButton:(id)a3 andDeselectAllButton:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CRLiOSQuickSelectViewController *)self p_configureSelectButton:v7];
  [v7 addTarget:self action:"p_selectAllAction:" forControlEvents:64];
  id v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"Select All" value:0 table:0];
  [v7 setTitle:v9 forState:0];

  [(CRLiOSQuickSelectViewController *)self p_configureSelectButton:v6];
  [v6 addTarget:self action:"p_deselectAllAction:" forControlEvents:64];
  id v11 = +[NSBundle mainBundle];
  double v10 = [v11 localizedStringForKey:@"Deselect All" value:0 table:0];
  [v6 setTitle:v10 forState:0];
}

- (void)p_configureSelectButton:(id)a3
{
  id v3 = a3;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];
  double v5 = [v3 titleLabel];
  [v5 setAdjustsFontForContentSizeCategory:1];

  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  id v7 = [v3 titleLabel];
  [v7 setFont:v6];

  id v8 = [v3 titleLabel];
  [v8 setLineBreakMode:0];

  id v9 = [v3 titleLabel];

  [v9 setNumberOfLines:0];
}

- (void)p_configureDoneButton:(id)a3
{
  id v4 = a3;
  [v4 addTarget:self action:"p_doneEditingAction:" forControlEvents:64];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [v4 setContentCompressionResistancePriority:0 forAxis:v5];
  id v6 = [v4 titleLabel];
  [v6 setAdjustsFontForContentSizeCategory:1];

  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  id v8 = [v4 titleLabel];
  [v8 setFont:v7];

  id v9 = [v4 titleLabel];
  [v9 setLineBreakMode:0];

  double v10 = [v4 titleLabel];
  [v10 setNumberOfLines:0];

  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"Done" value:0 table:0];

  [v4 setTitle:v12 forState:0];
}

- (void)p_updateUIAfterSwitchingBetweenCompactAndRegular
{
  BOOL showingCompactHUD = self->_showingCompactHUD;
  id v4 = [(CRLiOSQuickSelectViewController *)self doneButton];
  id v6 = v4;
  if (showingCompactHUD)
  {
    LODWORD(v5) = 1132068864;
    [v4 setContentHuggingPriority:0 forAxis:v5];

    id v7 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
    +[NSLayoutConstraint deactivateConstraints:v7];

    [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
  }
  else
  {
    LODWORD(v5) = 1148829696;
    [v4 setContentHuggingPriority:0 forAxis:v5];

    id v8 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
    +[NSLayoutConstraint deactivateConstraints:v8];

    [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
}

- (id)p_constraintsForBackgroundView:(id)a3 inHudView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v20 = [v6 leadingAnchor];
  v19 = [v5 leadingAnchor];
  double v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  id v7 = [v6 trailingAnchor];
  id v8 = [v5 trailingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  double v10 = [v6 topAnchor];
  id v11 = [v5 topAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  double v13 = [v6 bottomAnchor];

  id v14 = [v5 bottomAnchor];

  double v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  double v16 = +[NSArray arrayWithObjects:v21 count:4];

  return v16;
}

- (id)p_constraintsForIconView:(id)a3 verticallyCenteredToView:(id)a4 inHudView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [v9 leadingAnchor];
  id v11 = [v7 leadingAnchor];

  id v12 = [v10 constraintEqualToAnchor:v11 constant:12.0];
  v18[0] = v12;
  double v13 = [v9 centerYAnchor];

  id v14 = [v8 centerYAnchor];

  double v15 = [v13 constraintEqualToAnchor:v14];
  v18[1] = v15;
  double v16 = +[NSArray arrayWithObjects:v18 count:2];

  return v16;
}

- (id)p_constraintsForTextLabel:(id)a3 inHudView:(id)a4 withIconView:(id)a5 andSelectAllButton:(id)a6 andDeselectAllButton:(id)a7 forCompactLayout:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a6;
  id v41 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_alloc((Class)NSMutableArray);
  double v18 = [v13 leadingAnchor];
  v19 = [v15 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19 constant:12.0];
  v44 = v20;
  objc_super v21 = +[NSArray arrayWithObjects:&v44 count:1];
  id v40 = [v17 initWithArray:v21];

  v39 = v14;
  if (v8)
  {
    v22 = [v13 trailingAnchor];
    v23 = [v16 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-12.0];
    v43[0] = v24;
    v25 = [v13 topAnchor];
    v26 = [v16 topAnchor];

    v27 = [v25 constraintEqualToAnchor:v26 constant:12.0];
    v43[1] = v27;
    v28 = +[NSArray arrayWithObjects:v43 count:2];
    v29 = v40;
    [v40 addObjectsFromArray:v28];
  }
  else
  {
    v30 = [v13 widthAnchor];
    v31 = [v14 widthAnchor];
    v22 = [v30 constraintGreaterThanOrEqualToAnchor:v31 multiplier:2.0];

    v32 = [v13 widthAnchor];
    v33 = [v41 widthAnchor];
    v23 = [v32 constraintGreaterThanOrEqualToAnchor:v33 multiplier:2.0];

    LODWORD(v34) = 1.0;
    [v22 setPriority:v34];
    LODWORD(v35) = 1.0;
    [v23 setPriority:v35];
    v24 = [v13 heightAnchor];
    v25 = [v16 heightAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:-20.0];
    v42[0] = v26;
    v42[1] = v22;
    v42[2] = v23;
    v27 = [v13 centerYAnchor];
    v28 = [v16 centerYAnchor];

    v36 = [v27 constraintEqualToAnchor:v28];
    v42[3] = v36;
    v37 = +[NSArray arrayWithObjects:v42 count:4];
    [v40 addObjectsFromArray:v37];

    v29 = v40;
  }

  return v29;
}

- (id)p_constraintsForSelectAllButton:(id)a3 deselectAllButton:(id)a4 andDoneButton:(id)a5 withSeparator:(id)a6 andTextLabel:(id)a7 inHudView:(id)a8 forCompactLayout:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v118 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  v121 = v14;
  id v122 = objc_alloc_init((Class)NSMutableArray);
  v116 = v16;
  v119 = v17;
  v120 = v15;
  if (a9)
  {
    v112 = [v16 topAnchor];
    v19 = [v18 bottomAnchor];

    v20 = [v112 constraintEqualToAnchor:v19 constant:12.0];
    v129[0] = v20;
    objc_super v21 = [v16 widthAnchor];
    [v17 widthAnchor];
    v23 = v22 = v16;
    v24 = [v21 constraintEqualToAnchor:v23];
    v129[1] = v24;
    v25 = [v22 heightAnchor];
    v26 = +[UIScreen mainScreen];
    [v26 scale];
    v28 = [v25 constraintEqualToConstant:1.0 / v27];
    v129[2] = v28;
    v29 = +[NSArray arrayWithObjects:v129 count:3];
    [v122 addObjectsFromArray:v29];

    v30 = v119;
    uint64_t v31 = [v119 leadingAnchor];
    uint64_t v32 = [v22 bottomAnchor];
  }
  else
  {
    v113 = [v16 leadingAnchor];
    v109 = [v14 trailingAnchor];
    v105 = [v113 constraintEqualToAnchor:v109 constant:12.0];
    v128[0] = v105;
    v101 = [v16 leadingAnchor];
    v97 = [v15 trailingAnchor];
    v94 = [v101 constraintEqualToAnchor:v97 constant:12.0];
    v128[1] = v94;
    v92 = [v16 leadingAnchor];
    v91 = [v14 trailingAnchor];
    v90 = [v92 constraintGreaterThanOrEqualToAnchor:v91 constant:12.0];
    v128[2] = v90;
    v89 = [v16 leadingAnchor];
    v33 = [v15 trailingAnchor];
    double v34 = [v89 constraintGreaterThanOrEqualToAnchor:v33 constant:12.0];
    v128[3] = v34;
    double v35 = [v16 widthAnchor];
    v36 = +[UIScreen mainScreen];
    [v36 scale];
    v38 = [v35 constraintEqualToConstant:1.0 / v37];
    v128[4] = v38;
    v39 = [v16 heightAnchor];
    id v40 = [v119 heightAnchor];
    id v41 = [v39 constraintEqualToAnchor:v40];
    v128[5] = v41;
    v42 = +[NSArray arrayWithObjects:v128 count:6];
    [v122 addObjectsFromArray:v42];

    v30 = v119;
    uint64_t v31 = [v18 trailingAnchor];

    uint64_t v32 = [v119 topAnchor];
  }
  v43 = (void *)v32;
  v106 = [v121 leadingAnchor];
  v102 = [v106 constraintEqualToAnchor:v31 constant:12.0];
  v127[0] = v102;
  v98 = [v121 topAnchor];
  v95 = [v98 constraintEqualToAnchor:v43 constant:12.0];
  v127[1] = v95;
  v93 = [v121 bottomAnchor];
  v44 = [v30 bottomAnchor];
  v45 = [v93 constraintEqualToAnchor:v44 constant:-12.0];
  v127[2] = v45;
  v46 = [v120 leadingAnchor];
  v114 = (void *)v31;
  v47 = [v46 constraintEqualToAnchor:v31 constant:12.0];
  v127[3] = v47;
  v48 = [v120 topAnchor];
  v110 = v43;
  v49 = [v48 constraintEqualToAnchor:v43 constant:12.0];
  v127[4] = v49;
  v50 = [v120 bottomAnchor];
  v51 = [v30 bottomAnchor];
  v52 = [v50 constraintEqualToAnchor:v51 constant:-12.0];
  v127[5] = v52;
  v53 = +[NSArray arrayWithObjects:v127 count:6];
  [v122 addObjectsFromArray:v53];

  if (a9)
  {
    v54 = v121;
    uint64_t v55 = [v121 widthAnchor];
    uint64_t v56 = [v118 widthAnchor];
    v107 = v55;
    v57 = [v55 constraintEqualToAnchor:v56];
    v125[0] = v57;
    v58 = v120;
    v59 = [v120 widthAnchor];
    v60 = [v118 widthAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    v125[1] = v61;
    v62 = v125;
    v63 = v121;
  }
  else
  {
    v64 = [v121 centerYAnchor];
    v54 = v119;
    uint64_t v56 = [v119 centerYAnchor];
    v107 = v64;
    v57 = [v64 constraintEqualToAnchor:v56];
    v126[0] = v57;
    v59 = [v120 centerYAnchor];
    v60 = [v119 centerYAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    v126[1] = v61;
    v62 = v126;
    v58 = v116;
    v63 = v116;
  }
  v65 = +[NSArray arrayWithObjects:v62 count:2];
  [v122 addObjectsFromArray:v65];

  uint64_t v66 = [v63 trailingAnchor];
  uint64_t v67 = [v58 trailingAnchor];
  id v68 = v54;
  v103 = [v118 leadingAnchor];
  v99 = [v103 constraintEqualToAnchor:v66 constant:12.0];
  v124[0] = v99;
  v96 = [v118 leadingAnchor];
  v69 = [v96 constraintEqualToAnchor:v67 constant:12.0];
  v124[1] = v69;
  v70 = [v118 leadingAnchor];
  v115 = (void *)v66;
  v71 = [v70 constraintGreaterThanOrEqualToAnchor:v66 constant:12.0];
  v124[2] = v71;
  v72 = [v118 leadingAnchor];
  v111 = (void *)v67;
  v73 = [v72 constraintGreaterThanOrEqualToAnchor:v67 constant:12.0];
  v124[3] = v73;
  v74 = [v118 centerYAnchor];
  v108 = v68;
  v75 = [v68 centerYAnchor];
  v76 = [v74 constraintEqualToAnchor:v75];
  v124[4] = v76;
  v77 = +[NSArray arrayWithObjects:v124 count:5];
  [v122 addObjectsFromArray:v77];

  if (a9)
  {
    v78 = [v118 trailingAnchor];
    v79 = v119;
    v80 = [v119 trailingAnchor];
    v81 = [v78 constraintEqualToAnchor:v80 constant:-12.0];
    v82 = v122;
    [v122 addObject:v81];
  }
  else
  {
    v117 = [v118 topAnchor];
    v80 = [v119 topAnchor];
    v81 = [v117 constraintEqualToAnchor:v80 constant:10.0];
    v123[0] = v81;
    v104 = [v118 bottomAnchor];
    v100 = [v119 bottomAnchor];
    v83 = [v104 constraintEqualToAnchor:v100 constant:-10.0];
    v123[1] = v83;
    v84 = [v119 trailingAnchor];
    v85 = [v118 trailingAnchor];
    v86 = [v84 constraintEqualToAnchor:v85 constant:12.0];
    v123[2] = v86;
    v87 = +[NSArray arrayWithObjects:v123 count:3];
    v82 = v122;
    [v122 addObjectsFromArray:v87];

    v79 = v119;
    v78 = v117;
  }

  return v82;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSQuickSelectViewController;
  -[CRLiOSQuickSelectViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  [(CRLiOSQuickSelectViewController *)self p_setNeedsHudContainerViewFrameUpdate];
}

- (void)presentOnCanvasViewController:(id)a3 parentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  id v9 = [v8 superview];

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D12B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070A8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D12D0);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController presentOnCanvasViewController:parentView:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 466, 0, "expected nil value for '%{public}s'", "self.hudContainerView.superview");
  }
  id v13 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  id v14 = [v13 superview];

  if (!v14)
  {
    objc_storeWeak((id *)&self->_canvasViewController, v6);
    if (!v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewController);
      id v16 = [WeakRetained canvasView];
      id v17 = [v16 enclosingScrollView];
      id v7 = [v17 superview];

      if (!v7)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_canvasViewController);
        id v7 = [v18 canvasView];
      }
    }
    v19 = [CRLiOSUnhittableView alloc];
    [v7 frame];
    v20 = -[CRLiOSUnhittableView initWithFrame:](v19, "initWithFrame:");
    [(CRLiOSQuickSelectViewController *)self setHudContainerView:v20];

    objc_super v21 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
    [v21 setAutoresizingMask:18];

    v22 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
    [v7 addSubview:v22];

    v23 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
    [(CRLiOSQuickSelectViewController *)self setView:v23];

    v24 = [(CRLiOSQuickSelectViewController *)self p_makeHUDView];
    [(CRLiOSQuickSelectViewController *)self setHUDView:v24];

    v25 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
    v26 = [(CRLiOSQuickSelectViewController *)self HUDView];
    [v25 addSubview:v26];

    double v27 = [(CRLiOSQuickSelectViewController *)self HUDView];
    v28 = [(CRLiOSQuickSelectViewController *)self p_setupHUDConstraintsInContainerViewForView:v27 isCompact:0];

    v29 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];

    if (v29)
    {
      v30 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
      uint64_t v31 = [v30 arrayByAddingObjectsFromArray:v28];
      [(CRLiOSQuickSelectViewController *)self setRegularSizeHUDConstraints:v31];
    }
    else
    {
      [(CRLiOSQuickSelectViewController *)self setRegularSizeHUDConstraints:v28];
    }
    uint64_t v32 = [(CRLiOSQuickSelectViewController *)self HUDView];
    v33 = [(CRLiOSQuickSelectViewController *)self p_setupHUDConstraintsInContainerViewForView:v32 isCompact:1];

    double v34 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];

    if (v34)
    {
      double v35 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
      v36 = [v35 arrayByAddingObjectsFromArray:v33];
      [(CRLiOSQuickSelectViewController *)self setCompactHUDConstraints:v36];
    }
    else
    {
      [(CRLiOSQuickSelectViewController *)self setCompactHUDConstraints:v33];
    }
    if (self->_showingCompactHUD)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D12F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101070A04();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1310);
      }
      double v37 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v37);
      }
      v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController presentOnCanvasViewController:parentView:]");
      v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v38 file:v39 lineNumber:506 isFatal:0 description:"We should flip around which constraints are enabled by default."];
    }
    id v40 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
    +[NSLayoutConstraint activateConstraints:v40];

    [(CRLiOSQuickSelectViewController *)self p_visibleCanvasRectInContainerView];
    -[CRLiOSQuickSelectViewController p_updateHudContainerViewFrameWithVisibleRect:animated:](self, "p_updateHudContainerViewFrameWithVisibleRect:animated:", 0);
    [(CRLiOSQuickSelectViewController *)self p_beginWatchingSelectionChanges];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v45[2] = objc_opt_class();
    id v41 = +[NSArray arrayWithObjects:v45 count:3];
    id v42 = [(CRLiOSQuickSelectViewController *)self registerForTraitChanges:v41 withHandler:&stru_1014D1350];
    dispatch_time_t v43 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100099F98;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_after(v43, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)p_setNeedsHudContainerViewFrameUpdate
{
  if ([(CRLiOSQuickSelectViewController *)self p_isPresented])
  {
    id v3 = +[UIApplication sharedApplication];
    id v4 = [v3 applicationState];

    if (v4 != (id)2)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"p_performHudContainerViewFrameUpdate" object:0];
      NSRunLoopMode v6 = NSRunLoopCommonModes;
      objc_super v5 = +[NSArray arrayWithObjects:&v6 count:1];
      [(CRLiOSQuickSelectViewController *)self performSelector:"p_performHudContainerViewFrameUpdate" withObject:0 afterDelay:v5 inModes:0.05];
    }
  }
}

- (void)p_performHudContainerViewFrameUpdate
{
  [(CRLiOSQuickSelectViewController *)self p_visibleCanvasRectInContainerView];

  -[CRLiOSQuickSelectViewController p_updateHudContainerViewFrameWithVisibleRect:animated:](self, "p_updateHudContainerViewFrameWithVisibleRect:animated:", 1);
}

- (void)p_updateHudContainerViewFrameWithVisibleRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v10 = [(CRLiOSQuickSelectViewController *)self traitCollection];
  id v11 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  id v12 = [v11 superview];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v58.size.double width = v18 + 1.0;
  v58.size.double height = v20 + 1.0;
  v58.origin.CGFloat x = v14;
  v58.origin.CGFloat y = v16;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  BOOL v21 = CGRectContainsRect(v58, v63);
  p_lastKnownVisibleRect = &self->_lastKnownVisibleRect;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.double width = width;
  v64.size.double height = height;
  if ((!CGRectEqualToRect(self->_lastKnownVisibleRect, v64)
     || ([(UITraitCollection *)self->_lastKnownTraitCollection isEqual:v10] & 1) == 0)
    && width >= 100.0
    && height >= 100.0
    && v21)
  {
    v59.origin.CGFloat x = p_lastKnownVisibleRect->origin.x;
    v59.origin.CGFloat y = self->_lastKnownVisibleRect.origin.y;
    v59.size.double width = self->_lastKnownVisibleRect.size.width;
    v59.size.double height = self->_lastKnownVisibleRect.size.height;
    v65.origin.CGFloat x = CGRectZero.origin.x;
    v65.origin.CGFloat y = CGRectZero.origin.y;
    v65.size.double width = CGRectZero.size.width;
    v65.size.double height = CGRectZero.size.height;
    BOOL v23 = CGRectEqualToRect(v59, v65);
    v24 = [(CRLiOSQuickSelectViewController *)self HUDView];
    v25 = [v24 superview];
    v26 = [(CRLiOSQuickSelectViewController *)self HUDView];
    [v26 frame];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v35 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
    v36 = [v35 superview];
    [v25 convertRect:v36 toView:v28];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.double width = width;
    v60.size.double height = height;
    v66.origin.CGFloat x = v38;
    v66.origin.CGFloat y = v40;
    v66.size.double width = v42;
    v66.size.double height = v44;
    if (!CGRectContainsRect(v60, v66)) {
      goto LABEL_11;
    }
    if (v23) {
      goto LABEL_11;
    }
    v61.origin.CGFloat x = x;
    v61.origin.CGFloat y = y;
    v61.size.double width = width;
    v61.size.double height = height;
    CGRect v62 = CGRectInset(v61, -18.0, -18.0);
    v67.origin.CGFloat x = p_lastKnownVisibleRect->origin.x;
    v67.origin.CGFloat y = self->_lastKnownVisibleRect.origin.y;
    v67.size.double width = self->_lastKnownVisibleRect.size.width;
    v67.size.double height = self->_lastKnownVisibleRect.size.height;
    if (!CGRectContainsRect(v62, v67)
      || width / self->_lastKnownVisibleRect.size.width > 1.3
      || height / self->_lastKnownVisibleRect.size.height > 1.3)
    {
LABEL_11:
      p_lastKnownVisibleRect->origin.CGFloat x = x;
      self->_lastKnownVisibleRect.origin.CGFloat y = y;
      self->_lastKnownVisibleRect.size.double width = width;
      self->_lastKnownVisibleRect.size.double height = height;
      objc_storeStrong((id *)&self->_lastKnownTraitCollection, v10);
      v48 = _NSConcreteStackBlock;
      uint64_t v49 = 3221225472;
      v50 = sub_10009A4A8;
      v51 = &unk_1014D1378;
      v52 = self;
      CGFloat v54 = x;
      CGFloat v55 = y;
      double v56 = width;
      double v57 = height;
      id v53 = v10;
      v45 = objc_retainBlock(&v48);
      v46 = [(CRLiOSQuickSelectViewController *)self HUDView];
      v47 = [v46 layer];
      [v47 removeAllAnimations];

      if (v4) {
        +[UIView animateWithDuration:v45 animations:0 completion:0.2];
      }
      else {
        ((void (*)(void ***))v45[2])(v45);
      }
    }
  }
}

- (void)dismiss
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"p_performHudContainerViewFrameUpdate" object:0];
  [(CRLiOSQuickSelectViewController *)self p_endWatchingSelectionChanges];
  id v3 = [(CRLiOSQuickSelectViewController *)self HUDView];
  [v3 removeFromSuperview];

  id v4 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  [v4 removeFromSuperview];
}

- (id)p_setupHUDConstraintsInContainerViewForView:(id)a3 isCompact:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRLiOSQuickSelectViewController *)self hudContainerView];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1398);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070BBC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D13B8);
    }
    BOOL v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 635, 0, "invalid nil value for '%{public}s'", "self.hudContainerView");
  }
  id v11 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D13D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070B24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D13F8);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:]");
    CGFloat v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 638, 0, "invalid nil value for '%{public}s'", "view");
  }
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v15 = [v6 widthAnchor];
  CGFloat v16 = [v11 widthAnchor];
  double v17 = [v15 constraintLessThanOrEqualToAnchor:v16];

  LODWORD(v18) = 1148829696;
  v50 = v17;
  [v17 setPriority:v18];
  double v19 = [v6 heightAnchor];
  double v20 = [v11 heightAnchor];
  BOOL v21 = [v19 constraintLessThanOrEqualToAnchor:v20];

  LODWORD(v22) = 1.0;
  uint64_t v49 = v21;
  [v21 setPriority:v22];
  BOOL v23 = [v6 leadingAnchor];
  v24 = [v11 safeAreaLayoutGuide];
  v25 = [v24 leadingAnchor];
  if (v4)
  {
    v26 = [v23 constraintEqualToAnchor:v25 constant:16.0];

    double v27 = [v6 trailingAnchor];
    double v28 = [v11 safeAreaLayoutGuide];
    double v29 = [v28 trailingAnchor];
    double v30 = [v27 constraintEqualToAnchor:v29 constant:-16.0];

    int v32 = 1148846080;
  }
  else
  {
    v26 = [v23 constraintGreaterThanOrEqualToAnchor:v25 constant:16.0];

    double v33 = [v6 trailingAnchor];
    double v34 = [v11 safeAreaLayoutGuide];
    double v35 = [v34 trailingAnchor];
    double v30 = [v33 constraintLessThanOrEqualToAnchor:v35 constant:-16.0];

    int v32 = 1144782848;
  }
  int v36 = v32;
  LODWORD(v31) = v32;
  [v26 setPriority:v31];
  LODWORD(v37) = v36;
  [v30 setPriority:v37];
  v47 = v26;
  v48 = v30;
  v51[0] = v26;
  v51[1] = v30;
  CGFloat v38 = [v6 centerXAnchor];
  double v39 = [v11 centerXAnchor];
  [v38 constraintEqualToAnchor:v39];
  v41 = CGFloat v40 = v6;
  v51[2] = v41;
  CGFloat v42 = [v40 bottomAnchor];
  double v43 = [v11 bottomAnchor];
  CGFloat v44 = [v42 constraintEqualToAnchor:v43 constant:-16.0];
  v51[3] = v44;
  v51[4] = v50;
  v51[5] = v49;
  id v46 = +[NSArray arrayWithObjects:v51 count:6];

  return v46;
}

- (void)p_displayCurrentHUDForTraitCollection:(id)a3 andVisibleRect:(CGRect)a4
{
  if (-[CRLiOSQuickSelectViewController p_isInCompactViewModeForFrame:](self, "p_isInCompactViewModeForFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))
  {
    if (self->_showingCompactHUD)
    {
      objc_super v5 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
      +[NSLayoutConstraint deactivateConstraints:v5];

      uint64_t v6 = [(CRLiOSQuickSelectViewController *)self compactHUDConstraints];
LABEL_11:
      id v8 = (id)v6;
      +[NSLayoutConstraint activateConstraints:v6];

      return;
    }
    self->_BOOL showingCompactHUD = 1;
  }
  else
  {
    if (!self->_showingCompactHUD)
    {
      id v7 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
      +[NSLayoutConstraint deactivateConstraints:v7];

      uint64_t v6 = [(CRLiOSQuickSelectViewController *)self regularSizeHUDConstraints];
      goto LABEL_11;
    }
    self->_BOOL showingCompactHUD = 0;
  }

  [(CRLiOSQuickSelectViewController *)self p_updateUIAfterSwitchingBetweenCompactAndRegular];
}

- (CGRect)p_visibleCanvasRectInContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained visibleCanvasRectForQuickSelectViewController:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)&self->_canvasViewController);
  double v13 = [v12 canvasView];
  CGFloat v14 = [(CRLiOSQuickSelectViewController *)self hudContainerView];
  double v15 = [v14 superview];
  [v13 convertRect:v15 toView:v5];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)p_doneEditingAction:(id)a3
{
}

- (void)p_dismissAndAlertDelegate
{
  [(CRLiOSQuickSelectViewController *)self dismiss];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didDismissQuickSelectViewController:self];
}

- (void)p_selectAllAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = [WeakRetained editorController];
  id v10 = [v6 editorForEditAction:"selectAll:" withSender:self];

  if (v10)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    double v8 = [v7 editorController];
    id v9 = [v8 editorForEditAction:"selectAllForQuickSelect:" withSender:self];

    if (v9 == v10) {
      [v10 selectAllForQuickSelect:self];
    }
    else {
      [v10 selectAll:self];
    }
    self->_areAllSelected = 1;
  }
  [(CRLiOSQuickSelectViewController *)self p_updateHUDState];
}

- (void)p_deselectAllAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewController);
  double v5 = [WeakRetained interactiveCanvasController];
  id v8 = [v5 canvasEditor];

  double v6 = [v8 editorController];
  id v7 = [v8 selectionPathWithInfos:0];
  [v6 setSelectionPath:v7 withFlags:0x8000];

  self->_areAllSelected = 0;
  [(CRLiOSQuickSelectViewController *)self p_updateHUDState];
}

- (void)p_hideHUDWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1418);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070C54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1438);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_hideHUDWithAnimation:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:734 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(CRLiOSQuickSelectViewController *)self p_isHUDHidden])
  {
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      void v9[2] = sub_10009B364;
      v9[3] = &unk_1014CBBB0;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0 completion:0.2];
    }
    else
    {
      id v8 = [(CRLiOSQuickSelectViewController *)self HUDView];
      [v8 setAlpha:0.0];
    }
  }
  ++self->_hudHidingCount;
}

- (void)p_unhideHUDWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1458);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070E24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1478);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:751 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (!self->_hudHidingCount)
  {
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1498);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070D64(v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D14B8);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 752, 0, "expected inequality between %{public}s and %{public}s", "_hudHidingCount", "0");
  }
  if (![(CRLiOSQuickSelectViewController *)self p_isHUDHidden])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D14D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070CDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D14F8);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]");
    CGFloat v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:753 isFatal:0 description:"Attempting to unhide Quick Select HUD but the HUD is not hidden."];
  }
  int64_t hudHidingCount = self->_hudHidingCount;
  if (hudHidingCount <= 1) {
    int64_t hudHidingCount = 1;
  }
  int64_t v16 = hudHidingCount - 1;
  self->_int64_t hudHidingCount = v16;
  if (!v16 && [(CRLiOSQuickSelectViewController *)self p_isHUDHidden])
  {
    if (v3)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      void v18[2] = sub_10009B97C;
      v18[3] = &unk_1014CBBB0;
      v18[4] = self;
      +[UIView animateWithDuration:v18 animations:0 completion:0.2];
    }
    else
    {
      double v17 = [(CRLiOSQuickSelectViewController *)self HUDView];
      [v17 setAlpha:1.0];
    }
  }
}

- (BOOL)p_isHUDHidden
{
  id v2 = [(CRLiOSQuickSelectViewController *)self HUDView];
  [v2 alpha];
  BOOL v4 = fabs(v3) < 0.00999999978 || v3 == 0.0;

  return v4;
}

- (void)p_updateHUDState
{
  [(CRLiOSQuickSelectViewController *)self p_updateStateForSelectionButtons];
  [(CRLiOSQuickSelectViewController *)self p_updateHUDTitle];

  [(CRLiOSQuickSelectViewController *)self p_updateHUDIcon];
}

- (void)p_updateStateForSelectionButtons
{
  BOOL areAllSelected = self->_areAllSelected;
  BOOL v4 = [(CRLiOSQuickSelectViewController *)self selectAllButton];
  double v5 = v4;
  if (areAllSelected)
  {
    [v4 setHidden:1];

    double v6 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    [v4 setHidden:0];

    double v6 = [(CRLiOSQuickSelectViewController *)self deselectAllButton];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  [v6 setHidden:v7];
}

- (void)p_updateHUDTitle
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10009BC64;
  double v13 = sub_10009BC74;
  double v3 = +[NSBundle mainBundle];
  id v14 = [v3 localizedStringForKey:@"To select or deselect an object, tap it. To select multiple objects, drag across them.", 0, 0 value table];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [WeakRetained editorController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009BC7C;
  v8[3] = &unk_1014D1520;
  v8[4] = &v9;
  [v5 enumerateEditorsOnStackUsingBlock:v8];

  uint64_t v6 = v10[5];
  uint64_t v7 = [(CRLiOSQuickSelectViewController *)self textLabel];
  [v7 setText:v6];

  _Block_object_dispose(&v9, 8);
}

- (void)p_updateHUDIcon
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_10009BC64;
  id v14 = sub_10009BC74;
  double v15 = @"square.on.circle";
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained editorController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10009BE8C;
  v9[3] = &unk_1014D1520;
  v9[4] = &v10;
  [v4 enumerateEditorsOnStackUsingBlock:v9];

  uint64_t v5 = v11[5];
  uint64_t v6 = +[UIImageSymbolConfiguration configurationWithPointSize:17.0];
  uint64_t v7 = +[UIImage systemImageNamed:v5 withConfiguration:v6];
  id v8 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  [v8 setImage:v7];

  _Block_object_dispose(&v10, 8);
}

- (void)p_updateHUDAppearance
{
  double v3 = +[UIColor systemBackgroundColor];
  BOOL v4 = [(CRLiOSQuickSelectViewController *)self backgroundView];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = +[UIColor labelColor];
  uint64_t v6 = [(CRLiOSQuickSelectViewController *)self iconImageView];
  [v6 setTintColor:v5];

  id v8 = +[UIColor labelColor];
  uint64_t v7 = [(CRLiOSQuickSelectViewController *)self textLabel];
  [v7 setTextColor:v8];
}

- (void)p_beginWatchingSelectionChanges
{
  double v3 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained editorController];
  [v3 addObserver:self selector:"p_selectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v5];

  id v8 = +[NSNotificationCenter defaultCenter];
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [v6 editorController];
  [v8 addObserver:self selector:"p_currentEditorDidChange:" name:@"CRLEditorControllerDidChangeCurrentEditors" object:v7];
}

- (void)p_endWatchingSelectionChanges
{
  double v3 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained editorController];
  [v3 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v5];

  id v8 = +[NSNotificationCenter defaultCenter];
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [v6 editorController];
  [v8 removeObserver:self name:@"CRLEditorControllerDidChangeCurrentEditors" object:v7];
}

- (void)p_selectionPathDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = [WeakRetained shouldExitQuickSelectModeForQuickSelectViewController:self];

  if (v5)
  {
    [(CRLiOSQuickSelectViewController *)self p_dismissAndAlertDelegate];
  }
  else
  {
    self->_BOOL areAllSelected = 0;
    [(CRLiOSQuickSelectViewController *)self p_updateHUDState];
  }
}

- (void)p_currentEditorDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = [WeakRetained shouldExitQuickSelectModeForQuickSelectViewController:self];

  if (v5)
  {
    [(CRLiOSQuickSelectViewController *)self p_dismissAndAlertDelegate];
  }
}

- (void)p_performSuperviewInteraction:(id)a3
{
}

- (BOOL)p_isPresented
{
  id v2 = [(CRLiOSQuickSelectViewController *)self HUDView];
  double v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UIView)HUDView
{
  return self->_HUDView;
}

- (void)setHUDView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)selectAllButton
{
  return self->_selectAllButton;
}

- (void)setSelectAllButton:(id)a3
{
}

- (UIButton)deselectAllButton
{
  return self->_deselectAllButton;
}

- (void)setDeselectAllButton:(id)a3
{
}

- (NSArray)regularSizeHUDConstraints
{
  return self->_regularSizeHUDConstraints;
}

- (void)setRegularSizeHUDConstraints:(id)a3
{
}

- (NSArray)compactHUDConstraints
{
  return self->_compactHUDConstraints;
}

- (void)setCompactHUDConstraints:(id)a3
{
}

- (CRLiOSUnhittableView)hudContainerView
{
  return self->_hudContainerView;
}

- (void)setHudContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudContainerView, 0);
  objc_storeStrong((id *)&self->_compactHUDConstraints, 0);
  objc_storeStrong((id *)&self->_regularSizeHUDConstraints, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_selectAllButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_HUDView, 0);
  objc_storeStrong((id *)&self->_lastKnownTraitCollection, 0);
  objc_destroyWeak((id *)&self->_canvasViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end