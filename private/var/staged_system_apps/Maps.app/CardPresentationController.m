@interface CardPresentationController
- (BOOL)_fullHeightFixed;
- (BOOL)_supportDragMultiLayout;
- (BOOL)_wantsSheetGrabber;
- (BOOL)allowResizeInFloatingStyle;
- (BOOL)allowsSwipeToDismiss;
- (BOOL)alwaysUseDefaultContaineeLayout;
- (BOOL)blurInCardView;
- (BOOL)grabberBlurEnabled;
- (BOOL)hidden;
- (BOOL)hideGrabber;
- (BOOL)hidesContentInSmallLayout;
- (BOOL)isFirstCard;
- (BOOL)isFloating;
- (BOOL)presentedModally;
- (BOOL)shouldHidePreviousCards;
- (BOOL)takesAvailableHeight;
- (BOOL)takesAvailableWidth;
- (BOOL)updateHeightConstraintWithValue:(double)a3;
- (BOOL)updateHeightConstraintWithValue:(double)a3 transitionHeight:(double)a4;
- (BOOL)useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls;
- (BOOL)usingSheetPresentation;
- (BOOL)wantsFullscreen;
- (CGSize)sheetContentSize;
- (CardPresentationController)initWithViewController:(id)a3;
- (CardView)cardView;
- (ContaineeProtocol)viewController;
- (ContainerViewController)containerViewController;
- (UIColor)cardColor;
- (double)availableHeight;
- (double)bottomSafeOffset;
- (double)cardHeight;
- (double)contentAlpha;
- (double)grabberSafeAreaHeight;
- (double)headerTransitionHeight;
- (double)transitionProgressFromLayout:(unint64_t)a3 toLayout:(unint64_t)a4;
- (double)transitionProgressToAscendingLayoutFromLayout:(unint64_t)a3;
- (id)_detentIdentifierForContaineeLayout:(unint64_t)a3;
- (id)detents;
- (int64_t)_detentIndexForContaineeLayout:(unint64_t)a3;
- (int64_t)_modalPresentationStyleIsDismissing:(BOOL)a3;
- (int64_t)modalDismissStyle;
- (int64_t)modalPresentStyle;
- (unint64_t)_layoutforDetentIdentifier:(id)a3;
- (unint64_t)containeeLayout;
- (unint64_t)containerStyle;
- (unint64_t)defaultContaineeLayout;
- (unint64_t)edgeAttachedRegularHeightDimmingBehavior;
- (void)_animateToDesiredDetentIdentifier:(id)a3 completion:(id)a4;
- (void)_updateStyle;
- (void)applyWithAnimations:(id)a3 completion:(id)a4;
- (void)configureForSheetPresentationWithContainer:(id)a3 layout:(unint64_t)a4;
- (void)dismiss:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAllowResizeInFloatingStyle:(BOOL)a3;
- (void)setAllowsSwipeToDismiss:(BOOL)a3;
- (void)setAlwaysUseDefaultContaineeLayout:(BOOL)a3;
- (void)setBlurInCardView:(BOOL)a3;
- (void)setCardColor:(id)a3;
- (void)setCardHeight:(double)a3;
- (void)setCardView:(id)a3;
- (void)setCardView:(id)a3 fromContainer:(id)a4;
- (void)setContentAlpha:(double)a3;
- (void)setDefaultContaineeLayout:(unint64_t)a3;
- (void)setEdgeAttachedRegularHeightDimmingBehavior:(unint64_t)a3;
- (void)setFirstCard:(BOOL)a3;
- (void)setGrabberBlurEnabled:(BOOL)a3;
- (void)setHeaderTransitionHeight:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHideContentInSmallLayout:(BOOL)a3;
- (void)setHideGrabber:(BOOL)a3;
- (void)setPresentedModally:(BOOL)a3;
- (void)setShouldHidePreviousCards:(BOOL)a3;
- (void)setTakesAvailableHeight:(BOOL)a3;
- (void)setTakesAvailableWidth:(BOOL)a3;
- (void)setUseDefaultLayoutWhenCalculatingBottomInsetForFloatingControls:(BOOL)a3;
- (void)setUsingSheetPresentation:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setWantsFullscreen:(BOOL)a3;
- (void)updateAdditionalTopMargin;
- (void)updateDimmingBehavior;
- (void)updateGrabber;
- (void)updateHeightForCurrentLayout;
- (void)updateHeightForCurrentLayoutAnimated:(BOOL)a3;
- (void)updateHeightForLayout:(unint64_t)a3;
- (void)wantsExpandLayout;
- (void)wantsLayout:(unint64_t)a3;
- (void)wantsLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)wantsMinimizeLayout;
@end

@implementation CardPresentationController

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v3 = [WeakRetained view];
    [v3 setNeedsLayout];
  }
}

- (CardPresentationController)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CardPresentationController;
  v5 = [(CardPresentationController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CardPresentationController *)v5 setDefaultContaineeLayout:0];
    [(CardPresentationController *)v6 setContentAlpha:1.0];
    [(CardPresentationController *)v6 setHeaderTransitionHeight:30.0];
    [(CardPresentationController *)v6 setViewController:v4];
    [(CardPresentationController *)v6 setHideContentInSmallLayout:1];
    [(CardPresentationController *)v6 setBlurInCardView:1];
    [(CardPresentationController *)v6 setAllowsSwipeToDismiss:1];
  }

  return v6;
}

- (void)updateDimmingBehavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v14 = [WeakRetained sheetPresentationController];

  id v4 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:0];
  [v14 _setFloatingAppearance:v4];

  id v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v6 = sub_1000BBB44(v5);

  v7 = v14;
  if (v6 != 5)
  {
    [v14 _setWantsBottomAttached:1];
    unint64_t v8 = [(CardPresentationController *)self containerStyle];
    if (v8 <= 7 && ((1 << v8) & 0xA3) != 0)
    {
      if ([(CardPresentationController *)self presentedModally]) {
        unsigned int v9 = ![(CardPresentationController *)self takesAvailableHeight];
      }
      else {
        unsigned int v9 = 0;
      }
      unint64_t v10 = [(CardPresentationController *)self edgeAttachedRegularHeightDimmingBehavior];
      if (v10 == 2)
      {
        CFStringRef v11 = @"SmallLayoutDetentIdentifier";
        goto LABEL_14;
      }
      if (v10 != 1)
      {
        v7 = v14;
        if (v10) {
          goto LABEL_16;
        }
        if (!v9)
        {
          CFStringRef v11 = @"MediumLayoutDetentIdentifier";
LABEL_14:
          uint64_t v12 = +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:v11];
          goto LABEL_15;
        }
      }
    }
    uint64_t v12 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:0];
LABEL_15:
    v13 = (void *)v12;
    [v14 _setStandardAppearance:v12];

    v7 = v14;
  }
LABEL_16:
}

- (BOOL)_wantsSheetGrabber
{
  if ([(CardPresentationController *)self isFloating])
  {
    return [(CardPresentationController *)self allowResizeInFloatingStyle];
  }
  else if ([(CardPresentationController *)self hideGrabber])
  {
    return 0;
  }
  else
  {
    return ![(CardPresentationController *)self presentedModally];
  }
}

- (BOOL)hideGrabber
{
  return self->_hideGrabber;
}

- (id)detents
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D298C;
  v19[3] = &unk_101314A10;
  v19[4] = self;
  v3 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"SmallLayoutDetentIdentifier" resolver:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000D2CE4;
  v18[3] = &unk_101314A10;
  v18[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D2A14;
  v16[3] = &unk_101314A38;
  v16[4] = self;
  id v4 = objc_retainBlock(v18);
  id v17 = v4;
  id v5 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"MediumLayoutDetentIdentifier" resolver:v16];
  unint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10005AFC4;
  v13 = &unk_101314A38;
  v14 = self;
  id v15 = v4;
  uint64_t v6 = v4;
  v7 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"FullLayoutDetentIdentifier" resolver:&v10];
  v20[0] = v3;
  v20[1] = v5;
  v20[2] = v7;
  unint64_t v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3, v10, v11, v12, v13, v14);

  return v8;
}

- (void)updateGrabber
{
  if ([(CardPresentationController *)self isFloating]) {
    double v3 = 7.0;
  }
  else {
    double v3 = 5.0;
  }
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  uint64_t v6 = [WeakRetained sheetPresentationController];
  [v6 _setGrabberTopSpacing:v3];

  BOOL v7 = [(CardPresentationController *)self _wantsSheetGrabber];
  id v8 = objc_loadWeakRetained((id *)&self->_viewController);
  unsigned int v9 = [v8 sheetPresentationController];
  [v9 setPrefersGrabberVisible:v7];

  BOOL v10 = [(CardPresentationController *)self grabberBlurEnabled];
  id v12 = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v11 = [v12 sheetPresentationController];
  [v11 _setGrabberBlurEnabled:v10];
}

- (id)_detentIdentifierForContaineeLayout:(unint64_t)a3
{
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  BOOL v7 = [WeakRetained sheetPresentationController];

  if (!v7) {
    return @"SmallLayoutDetentIdentifier";
  }
  if (a3 - 3 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)p_viewController);
      BOOL v10 = [v9 sheetPresentationController];
      uint64_t v11 = [v10 detents];
      id v12 = [v11 count];

      if ((unint64_t)v12 > 2) {
        return @"MediumLayoutDetentIdentifier";
      }
    }
    return @"SmallLayoutDetentIdentifier";
  }
  if ((id)[(CardPresentationController *)self containerStyle] == (id)4) {
    return @"MediumLayoutDetentIdentifier";
  }
  else {
    return @"FullLayoutDetentIdentifier";
  }
}

- (void)configureForSheetPresentationWithContainer:(id)a3 layout:(unint64_t)a4
{
  p_viewController = &self->_viewController;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  [WeakRetained setModalPresentationStyle:2];

  [(CardPresentationController *)self setUsingSheetPresentation:1];
  objc_storeWeak((id *)&self->_containerViewController, v7);
  uint64_t v9 = sub_1000BBB44(v7);
  id v10 = objc_loadWeakRetained((id *)p_viewController);
  [v10 setModalPresentationStyle:2];

  id v11 = objc_loadWeakRetained((id *)p_viewController);
  id v34 = [v11 sheetPresentationController];

  id v12 = objc_loadWeakRetained((id *)p_viewController);
  [v12 loadViewIfNeeded];

  int64_t v13 = [(CardPresentationController *)self modalPresentStyle];
  id v14 = objc_loadWeakRetained((id *)p_viewController);
  [v14 setModalTransitionStyle:v13];

  BOOL v15 = [(CardPresentationController *)self _supportDragMultiLayout];
  id v16 = objc_loadWeakRetained((id *)p_viewController);
  [v16 setModalInPresentation:v15];

  [(CardPresentationController *)self sheetContentSize];
  double v18 = v17;
  double v20 = v19;
  id v21 = objc_loadWeakRetained((id *)p_viewController);
  [v21 setPreferredContentSize:v18, v20];

  [v34 _setForcePresentationInPresenterScene:v9 == 5];
  v22 = [(CardPresentationController *)self detents];
  [v34 setDetents:v22];

  [v34 setDelegate:v7];
  v23 = [(CardPresentationController *)self _detentIdentifierForContaineeLayout:a4];
  [v34 setSelectedDetentIdentifier:v23];

  if ([(CardPresentationController *)self isFirstCard])
  {
    [v34 _setSheetID:@"ShowsMapID"];
  }
  else
  {
    unsigned int v24 = [(CardPresentationController *)self _fullHeightFixed];
    unint64_t v25 = [(CardPresentationController *)self containerStyle];
    if (v24) {
      CFStringRef v26 = 0;
    }
    else {
      CFStringRef v26 = @"ShowsMapID";
    }
    if (((1 << v25) & 0xE3) != 0) {
      CFStringRef v27 = v26;
    }
    else {
      CFStringRef v27 = @"ShowsMapID";
    }
    if (v25 <= 7) {
      CFStringRef v28 = v27;
    }
    else {
      CFStringRef v28 = @"ShowsMapID";
    }
    [v34 _setHiddenAncestorSheetID:v28];
  }
  if ([(CardPresentationController *)self presentedModally]) {
    [v34 _setShouldDismissWhenTappedOutside:1];
  }
  [v34 _setHidden:[self hidden]];
  [v34 setPrefersGrabberVisible:[self _wantsSheetGrabber]];
  [v34 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
  [v34 setPrefersEdgeAttachedInCompactHeight:1];
  [v34 _setDetentDirectionWhenFloating:1];
  [v34 _setPeeksWhenFloating:0];
  [v34 _setPrefersScrollingResizesWhenDetentDirectionIsDown:0];
  [v34 _setWantsFloatingInRegularWidthCompactHeight:0];
  if (v9 == 5) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 1;
  }
  [v34 _setHorizontalAlignment:v29];
  [v34 _setMarginInCompactHeight:8.0];
  unsigned int v30 = [(CardPresentationController *)self takesAvailableWidth];
  double v31 = 10.0;
  if (v30) {
    double v31 = 0.0;
  }
  [v34 _setMarginInRegularWidthRegularHeight:v31];
  [v34 _setTucksIntoUnsafeAreaInCompactHeight:1];
  [v34 _setAllowsAsymmetricVerticalMargins:1];
  id v32 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v33 = [v32 statusBarSupplementaryView];
  [v33 frame];
  [v34 _setAdditionalMinimumTopInset:CGRectGetHeight(v36)];

  [(CardPresentationController *)self updateGrabber];
  [(CardPresentationController *)self updateDimmingBehavior];
}

- (void)setDefaultContaineeLayout:(unint64_t)a3
{
  self->_defaultContaineeLayout = a3;
}

- (unint64_t)containerStyle
{
  unsigned int v3 = [(CardPresentationController *)self usingSheetPresentation];
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v6 = WeakRetained;
  if (v3)
  {
    id v7 = [WeakRetained traitCollection];

    id v8 = objc_loadWeakRetained((id *)&self->_viewController);
    uint64_t v9 = [v8 sheetPresentationController];
    id v10 = [v9 containerView];

    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    id v12 = [v11 view];
    int64_t v13 = [v12 window];

    if (!v13 && v10)
    {
      uint64_t v14 = [v10 traitCollection];

      id v7 = (void *)v14;
    }
    id v15 = objc_loadWeakRetained((id *)p_containerViewController);
    unsigned int v16 = [v15 allowOnlyStandardStyle];
    id v17 = v7;
    id v18 = v17;
    if (v17)
    {
      if ([v17 userInterfaceIdiom] == (id)5)
      {
        unint64_t v19 = 6;
LABEL_27:

        goto LABEL_28;
      }
      id v20 = [v18 horizontalSizeClass];
      if (v16)
      {
        if (v20 == (id)2
          || [v18 horizontalSizeClass] == (id)1 && objc_msgSend(v18, "verticalSizeClass") == (id)1)
        {
          unint64_t v19 = 2;
        }
        else if ([v18 userInterfaceIdiom] == (id)5)
        {
          unint64_t v19 = 2;
        }
        else
        {
          unint64_t v19 = 1;
        }
        goto LABEL_27;
      }
      if (v20 == (id)1 && [v18 verticalSizeClass] == (id)2)
      {
        unint64_t v19 = 1;
        goto LABEL_27;
      }
      if ([v18 horizontalSizeClass] == (id)1 && objc_msgSend(v18, "verticalSizeClass") == (id)1
        || [v18 horizontalSizeClass] == (id)2 && objc_msgSend(v18, "verticalSizeClass") == (id)1
        || [v18 horizontalSizeClass] == (id)2 && objc_msgSend(v18, "verticalSizeClass") == (id)2)
      {
        unint64_t v19 = 4;
        goto LABEL_27;
      }
    }
    unint64_t v19 = 0;
    goto LABEL_27;
  }

  if (v6)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    unint64_t v19 = (unint64_t)[v18 containerStyle];
LABEL_28:

    return v19;
  }
  return 0;
}

- (BOOL)usingSheetPresentation
{
  return self->_usingSheetPresentation;
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (unint64_t)defaultContaineeLayout
{
  return self->_defaultContaineeLayout;
}

- (BOOL)alwaysUseDefaultContaineeLayout
{
  return self->_alwaysUseDefaultContaineeLayout;
}

- (double)availableHeight
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (!WeakRetained) {
    return 0.0;
  }
  p_viewController = &self->_viewController;
  id v6 = objc_loadWeakRetained((id *)p_viewController);

  id v7 = objc_loadWeakRetained((id *)p_containerViewController);
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_loadWeakRetained((id *)p_viewController);
    [v8 availableHeightForViewController:v9];
    double v11 = v10;
  }
  else
  {
    [v7 availableHeight];
    double v11 = v12;
  }

  return v11;
}

- (ContaineeProtocol)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (ContaineeProtocol *)WeakRetained;
}

- (double)grabberSafeAreaHeight
{
  if (![(CardPresentationController *)self usingSheetPresentation]) {
    return 0.0;
  }
  if (![(CardPresentationController *)self isFloating]) {
    return 0.0;
  }
  unsigned __int8 v3 = [(CardPresentationController *)self allowResizeInFloatingStyle];
  double result = 20.0;
  if ((v3 & 1) == 0) {
    return 0.0;
  }
  return result;
}

- (BOOL)_fullHeightFixed
{
  if ([(CardPresentationController *)self isFloating]) {
    unsigned int v3 = ![(CardPresentationController *)self allowResizeInFloatingStyle];
  }
  else {
    LOBYTE(v3) = 0;
  }
  unsigned int v4 = [(CardPresentationController *)self takesAvailableHeight];
  if (v4) {
    LOBYTE(v4) = [(CardPresentationController *)self presentedModally];
  }
  return v3 | v4;
}

- (BOOL)isFloating
{
  return (id)[(CardPresentationController *)self containerStyle] == (id)6;
}

- (BOOL)takesAvailableHeight
{
  return self->_takesAvailableHeight;
}

- (double)bottomSafeOffset
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (!WeakRetained) {
    return 0.0;
  }
  id v4 = objc_loadWeakRetained((id *)p_containerViewController);
  [v4 bottomSafeOffset];
  double v6 = v5;

  return v6;
}

- (BOOL)presentedModally
{
  return self->_presentedModally;
}

- (BOOL)takesAvailableWidth
{
  return self->_takesAvailableWidth;
}

- (BOOL)useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls
{
  return self->_useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls;
}

- (double)cardHeight
{
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    id v4 = [WeakRetained view];
    [v4 frame];
    double Height = CGRectGetHeight(v8);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
    [WeakRetained height];
    double Height = v6;
  }

  return Height;
}

- (CGSize)sheetContentSize
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  double v5 = [WeakRetained view];

  double v6 = [v5 superview];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_viewController);
    CGRect v8 = [v7 sheetPresentationController];
    uint64_t v9 = [v8 containerView];

    double v5 = (void *)v9;
  }
  [v5 bounds];
  double Width = CGRectGetWidth(v22);
  if ([(CardPresentationController *)self isFloating])
  {
    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    [v11 availableHeight];
    CGFloat Height = v12;
  }
  else
  {
    [v5 bounds];
    CGFloat Height = CGRectGetHeight(v23);
  }
  if ((id)[(CardPresentationController *)self containerStyle] != (id)1
    && ![(CardPresentationController *)self takesAvailableWidth])
  {
    GEOConfigGetDouble();
    double Width = v14;
  }
  id v15 = objc_loadWeakRetained((id *)p_containerViewController);
  if (v15)
  {
    unsigned int v16 = v15;
    id v17 = objc_loadWeakRetained((id *)p_containerViewController);
    uint64_t v18 = sub_1000BBB44(v17);

    if (v18 == 5) {
      double Width = 282.0;
    }
  }

  double v19 = Width;
  double v20 = Height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)contentAlpha
{
  double v3 = 1.0;
  if ([(CardPresentationController *)self hidesContentInSmallLayout])
  {
    if (![(CardPresentationController *)self usingSheetPresentation]) {
      return self->_contentAlpha;
    }
    if (![(CardPresentationController *)self isFloating]
      && ![(CardPresentationController *)self presentedModally])
    {
      p_viewController = &self->_viewController;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      double v6 = [WeakRetained sheetPresentationController];
      id v7 = [v6 _detentValues];
      id v8 = [v7 count];

      if ((unint64_t)v8 >= 2)
      {
        uint64_t v9 = [(CardPresentationController *)self viewController];
        if ([v9 isBeingPresented])
        {

LABEL_11:
          id v13 = objc_loadWeakRetained((id *)&self->_viewController);
          double v14 = [v13 sheetPresentationController];
          id v15 = [v14 selectedDetentIdentifier];
          if (v15 == @"SmallLayoutDetentIdentifier") {
            double v3 = 0.0;
          }
          else {
            double v3 = 1.0;
          }

          return v3;
        }
        id v11 = [(CardPresentationController *)self viewController];
        unsigned int v12 = [v11 isBeingDismissed];

        if (v12) {
          goto LABEL_11;
        }
        [(CardPresentationController *)self headerTransitionHeight];
        double v16 = 30.0;
        if (v17 >= 30.0)
        {
          [(CardPresentationController *)self headerTransitionHeight];
          double v16 = v18;
        }
        id v19 = objc_loadWeakRetained((id *)&self->_viewController);
        [v19 heightForLayout:1];
        double v21 = v20;

        id v22 = objc_loadWeakRetained((id *)&self->_viewController);
        CGRect v23 = [v22 sheetPresentationController];
        [v23 _currentPresentedViewFrame];
        double Height = CGRectGetHeight(v31);

        id v25 = objc_loadWeakRetained((id *)&self->_containerViewController);
        id v26 = objc_loadWeakRetained((id *)p_viewController);
        [v25 availableHeightForViewController:v26];
        double v28 = v27;

        if (v21 >= 30.0) {
          double v29 = v21;
        }
        else {
          double v29 = 30.0;
        }
        if (Height < v29 || Height > v28)
        {
          if (Height <= v28) {
            return 0.0;
          }
          else {
            return 1.0;
          }
        }
        else
        {
          double v30 = fmin((Height - v29) / v16, 1.0);
          if (v30 >= 0.0) {
            return v30;
          }
          else {
            return 0.0;
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)hidesContentInSmallLayout
{
  return self->_hideContentInSmallLayout;
}

- (double)headerTransitionHeight
{
  return self->_headerTransitionHeight;
}

- (BOOL)wantsFullscreen
{
  return self->_wantsFullscreen;
}

- (BOOL)shouldHidePreviousCards
{
  return self->_shouldHidePreviousCards;
}

- (void)setViewController:(id)a3
{
}

- (void)setUsingSheetPresentation:(BOOL)a3
{
  self->_usingSheetPresentation = a3;
}

- (void)setHideContentInSmallLayout:(BOOL)a3
{
  self->_hideContentInSmallLayout = a3;
}

- (void)setHeaderTransitionHeight:(double)a3
{
  self->_headerTransitiondouble Height = a3;
}

- (void)setFirstCard:(BOOL)a3
{
  self->_firstCard = a3;
}

- (void)setBlurInCardView:(BOOL)a3
{
  self->_blurInCardView = a3;
}

- (void)setAllowsSwipeToDismiss:(BOOL)a3
{
  self->_allowsSwipeToDismiss = a3;
}

- (void)setAllowResizeInFloatingStyle:(BOOL)a3
{
  self->_allowResizeInFloatingStyle = a3;
}

- (int64_t)modalPresentStyle
{
  return [(CardPresentationController *)self _modalPresentationStyleIsDismissing:0];
}

- (BOOL)isFirstCard
{
  return self->_firstCard;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)grabberBlurEnabled
{
  return self->_grabberBlurEnabled;
}

- (unint64_t)edgeAttachedRegularHeightDimmingBehavior
{
  return self->_edgeAttachedRegularHeightDimmingBehavior;
}

- (BOOL)blurInCardView
{
  return self->_blurInCardView;
}

- (BOOL)_supportDragMultiLayout
{
  if ([(CardPresentationController *)self takesAvailableHeight]) {
    return 0;
  }
  else {
    return ![(CardPresentationController *)self presentedModally];
  }
}

- (int64_t)_modalPresentationStyleIsDismissing:(BOOL)a3
{
  BOOL v3 = a3;
  if ((id)[(CardPresentationController *)self containerStyle] != (id)6) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  double v6 = [WeakRetained traitCollection];
  id v7 = [v6 layoutDirection];

  int64_t v8 = 15;
  if (v7 == (id)1) {
    int64_t v9 = 15;
  }
  else {
    int64_t v9 = 16;
  }
  if (v7 == (id)1) {
    int64_t v8 = 16;
  }
  if (v3) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)setHideGrabber:(BOOL)a3
{
  if (self->_hideGrabber != a3)
  {
    self->_hideGrabber = a3;
    [(CardPresentationController *)self _updateStyle];
  }
}

- (void)setPresentedModally:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CardPresentationController *)self viewController];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5)
  {
    id v7 = sub_100A20BC8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting presentedModally to NO on Mac", v8, 2u);
    }

    BOOL v3 = 0;
  }
  if (self->_presentedModally != v3)
  {
    self->_presentedModally = v3;
    [(CardPresentationController *)self _updateStyle];
  }
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    [(CardPresentationController *)self _updateStyle];
  }
}

- (unint64_t)containeeLayout
{
  if (![(CardPresentationController *)self usingSheetPresentation])
  {
    p_containerViewController = &self->_containerViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

    if (!WeakRetained) {
      return (unint64_t)WeakRetained;
    }
    id v5 = objc_loadWeakRetained((id *)p_containerViewController);
    id WeakRetained = [v5 containeeLayout];
LABEL_8:

    return (unint64_t)WeakRetained;
  }
  if ([(CardPresentationController *)self allowResizeInFloatingStyle]
    || (id)[(CardPresentationController *)self containerStyle] != (id)6)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_viewController);
    uint64_t v6 = [v5 sheetPresentationController];
    id v7 = [v6 selectedDetentIdentifier];
    id WeakRetained = [(CardPresentationController *)self _layoutforDetentIdentifier:v7];

    goto LABEL_8;
  }
  return 3;
}

- (void)wantsLayout:(unint64_t)a3
{
}

- (void)wantsLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    p_viewController = &self->_viewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    uint64_t v8 = [WeakRetained sheetPresentationController];
    if (v8)
    {
      int64_t v9 = (void *)v8;
      id v10 = objc_loadWeakRetained((id *)&self->_viewController);
      id v11 = [v10 view];
      unsigned int v12 = [v11 window];

      if (!v12) {
        return;
      }
      if (a3 == 2 && (id)[(CardPresentationController *)self containerStyle] == (id)4)
      {
        +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:0];
        return;
      }
      id v15 = [(CardPresentationController *)self _detentIdentifierForContaineeLayout:a3];
      id v16 = objc_loadWeakRetained((id *)&self->_viewController);
      double v17 = [v16 sheetPresentationController];
      double v18 = [v17 selectedDetentIdentifier];

      if (v18 == v15)
      {
LABEL_70:

        return;
      }
      id v19 = sub_100A20BC8();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_41:

        p_containerViewController = &self->_containerViewController;
        id v41 = objc_loadWeakRetained((id *)&self->_containerViewController);
        id v42 = objc_loadWeakRetained((id *)&self->_viewController);
        [v41 containee:v42 willChangeLayout:a3 source:0];

        if (v4)
        {
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_100A2164C;
          v73[3] = &unk_1012E69C0;
          v73[4] = self;
          v73[5] = a3;
          [(CardPresentationController *)self _animateToDesiredDetentIdentifier:v15 completion:v73];
          goto LABEL_70;
        }
        id v43 = objc_loadWeakRetained((id *)&self->_viewController);
        v44 = [v43 sheetPresentationController];
        [v44 setSelectedDetentIdentifier:v15];

        id v45 = objc_loadWeakRetained((id *)&self->_containerViewController);
        id v46 = objc_loadWeakRetained((id *)&self->_viewController);
        [v45 containee:v46 didChangeLayout:a3];

        v47 = sub_100A20BC8();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
LABEL_69:

          goto LABEL_70;
        }
        v48 = self;
        if (!v48)
        {
          v53 = @"<nil>";
LABEL_52:

          v54 = v53;
          id v55 = objc_loadWeakRetained((id *)p_containerViewController);
          if (!v55)
          {
            v60 = @"<nil>";
LABEL_60:

            v61 = v60;
            id v62 = objc_loadWeakRetained((id *)p_viewController);
            if (!v62)
            {
              v67 = @"<nil>";
              goto LABEL_68;
            }
            v63 = (objc_class *)objc_opt_class();
            v64 = NSStringFromClass(v63);
            if (objc_opt_respondsToSelector())
            {
              v65 = [v62 performSelector:"accessibilityIdentifier"];
              v66 = v65;
              if (v65 && ![v65 isEqualToString:v64])
              {
                v67 = +[NSString stringWithFormat:@"%@<%p, %@>", v64, v62, v66];

                goto LABEL_66;
              }
            }
            v67 = +[NSString stringWithFormat:@"%@<%p>", v64, v62];
LABEL_66:

LABEL_68:
            *(_DWORD *)buf = 138544130;
            v75 = v54;
            __int16 v76 = 2048;
            unint64_t v77 = a3;
            __int16 v78 = 2112;
            v79 = v61;
            __int16 v80 = 2112;
            v81 = v67;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}@] Did change layout: %lu for container: %@ continee: %@", buf, 0x2Au);

            goto LABEL_69;
          }
          v56 = (objc_class *)objc_opt_class();
          v57 = NSStringFromClass(v56);
          if (objc_opt_respondsToSelector())
          {
            v58 = [v55 performSelector:"accessibilityIdentifier"];
            v59 = v58;
            if (v58 && ![v58 isEqualToString:v57])
            {
              v60 = +[NSString stringWithFormat:@"%@<%p, %@>", v57, v55, v59];

              goto LABEL_58;
            }
          }
          v60 = +[NSString stringWithFormat:@"%@<%p>", v57, v55];
LABEL_58:

          goto LABEL_60;
        }
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        if (objc_opt_respondsToSelector())
        {
          v51 = [(CardPresentationController *)v48 performSelector:"accessibilityIdentifier"];
          v52 = v51;
          if (v51 && ![v51 isEqualToString:v50])
          {
            v53 = +[NSString stringWithFormat:@"%@<%p, %@>", v50, v48, v52];

            goto LABEL_50;
          }
        }
        v53 = +[NSString stringWithFormat:@"%@<%p>", v50, v48];
LABEL_50:

        goto LABEL_52;
      }
      id v72 = v15;
      double v20 = self;
      v68 = v19;
      if (!v20)
      {
        id v25 = @"<nil>";
LABEL_24:

        id v26 = v25;
        id v27 = objc_loadWeakRetained((id *)&v20->_containerViewController);
        v69 = v26;
        if (!v27)
        {
          id v32 = @"<nil>";
LABEL_32:

          v33 = v32;
          id v34 = objc_loadWeakRetained((id *)&self->_viewController);
          if (!v34)
          {
            v39 = @"<nil>";
            goto LABEL_40;
          }
          v35 = (objc_class *)objc_opt_class();
          CGRect v36 = NSStringFromClass(v35);
          if (objc_opt_respondsToSelector())
          {
            v37 = [v34 performSelector:"accessibilityIdentifier"];
            v38 = v37;
            if (v37 && ![v37 isEqualToString:v36])
            {
              v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

              goto LABEL_38;
            }
          }
          v39 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_38:

LABEL_40:
          id v19 = v68;

          *(_DWORD *)buf = 138544130;
          v75 = v69;
          __int16 v76 = 2048;
          unint64_t v77 = a3;
          __int16 v78 = 2112;
          v79 = v33;
          __int16 v80 = 2112;
          v81 = v39;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "[%{public}@] Will change layout: %lu for container: %@ containee: %@", buf, 0x2Au);

          id v15 = v72;
          goto LABEL_41;
        }
        double v28 = (objc_class *)objc_opt_class();
        double v29 = NSStringFromClass(v28);
        if (objc_opt_respondsToSelector())
        {
          double v30 = [v27 performSelector:"accessibilityIdentifier"];
          CGRect v31 = v30;
          if (v30 && ![v30 isEqualToString:v29])
          {
            id v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

            goto LABEL_30;
          }
        }
        id v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_30:

        goto LABEL_32;
      }
      double v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      if (objc_opt_respondsToSelector())
      {
        CGRect v23 = [(CardPresentationController *)v20 performSelector:"accessibilityIdentifier"];
        unsigned int v24 = v23;
        if (v23 && ![v23 isEqualToString:v22])
        {
          id v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

          goto LABEL_22;
        }
      }
      id v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_22:

      goto LABEL_24;
    }
    double v14 = WeakRetained;
  }
  else
  {
    id v71 = [(CardPresentationController *)self containerViewController];
    id v13 = objc_loadWeakRetained((id *)&self->_viewController);
    [v71 controller:v13 wantsLayout:a3];

    double v14 = v71;
  }
}

- (void)_animateToDesiredDetentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1001097B8())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    int64_t v9 = [WeakRetained sheetPresentationController];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100A21BD4;
    v22[3] = &unk_1012E5D58;
    id v10 = &v23;
    v22[4] = self;
    id v23 = v6;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100A21C58;
    void v20[3] = &unk_1013149E8;
    id v11 = &v21;
    id v21 = v7;
    id v12 = v7;
    id v13 = v6;
    [v9 _animateChanges:v22 completion:v20];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100A21C68;
    v18[3] = &unk_1012E5D58;
    id v10 = &v19;
    v18[4] = self;
    id v19 = v6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A21D24;
    v16[3] = &unk_1012EAFC0;
    id v11 = &v17;
    id v17 = v7;
    id v14 = v7;
    id v15 = v6;
    +[UIView animateWithDuration:v18 animations:v16 completion:0.25];
  }
}

- (void)wantsExpandLayout
{
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    if ((id)[(CardPresentationController *)self containeeLayout] == (id)1)
    {
      BOOL v3 = self;
      uint64_t v4 = 2;
    }
    else
    {
      BOOL v3 = self;
      uint64_t v4 = 3;
    }
    [(CardPresentationController *)v3 wantsLayout:v4];
  }
  else
  {
    id v6 = [(CardPresentationController *)self containerViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    [v6 expandContainee:WeakRetained];
  }
}

- (void)wantsMinimizeLayout
{
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    if ((id)[(CardPresentationController *)self containeeLayout] == (id)3)
    {
      BOOL v3 = self;
      uint64_t v4 = 2;
    }
    else
    {
      BOOL v3 = self;
      uint64_t v4 = 1;
    }
    [(CardPresentationController *)v3 wantsLayout:v4];
  }
  else
  {
    id v6 = [(CardPresentationController *)self containerViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    [v6 minimizeContainee:WeakRetained];
  }
}

- (void)applyWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(CardPresentationController *)self containerViewController];
  uint64_t v8 = [v10 cardHeightAnimation];
  int64_t v9 = [v8 coordinatedUnitAnimation];
  [v9 applyWithAnimations:v7 completion:v6];
}

- (void)dismiss:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  uint64_t v4 = (CardPresentationController *)((char *)v4 + 88);
  id v7 = objc_loadWeakRetained((id *)&v4->super.isa);
  id v8 = [v7 currentViewController];

  id v10 = objc_loadWeakRetained((id *)&v4->super.isa);
  id v9 = objc_loadWeakRetained((id *)p_viewController);
  if (WeakRetained == v8) {
    [v10 popLastViewControllerFromViewController:v9 animated:v3 useDefaultContaineeLayout:0];
  }
  else {
    [v10 removeControllerFromStack:v9];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  p_containerViewController = &self->_containerViewController;
  id v11 = objc_loadWeakRetained((id *)p_containerViewController);
  id v12 = [v11 currentViewController];

  if (WeakRetained == v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_containerViewController);
    [v13 presentController:v14 animated:v6 completion:v8];
  }
}

- (void)_updateStyle
{
  p_cardView = &self->_cardView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_cardView);
    BOOL v6 = v5;
    BOOL v7 = self->_hideGrabber || self->_presentedModally;
    [v5 setHideGrabber:v7];

    id v26 = objc_loadWeakRetained((id *)p_cardView);
    [v26 setShowFooterGrabber:self->_allowResizeInFloatingStyle];

    BOOL hidden = self->_hidden;
    id v30 = objc_loadWeakRetained((id *)p_cardView);
    [v30 setHidden:hidden];
LABEL_15:

    return;
  }
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    if (![(CardPresentationController *)self wantsFullscreen])
    {
      id v8 = objc_loadWeakRetained((id *)&self->_viewController);
      id v9 = [v8 modalPresentationStyle];

      if (v9 != (id)2)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_viewController);
        [v10 setModalPresentationStyle:2];
      }
    }
    BOOL v11 = [(CardPresentationController *)self _wantsSheetGrabber];
    p_viewController = &self->_viewController;
    id v13 = objc_loadWeakRetained((id *)&self->_viewController);
    id v14 = [v13 sheetPresentationController];
    [v14 setPrefersGrabberVisible:v11];

    id v15 = objc_loadWeakRetained((id *)&self->_viewController);
    id v16 = [v15 sheetPresentationController];
    LODWORD(v14) = [v16 _isHidden];
    unsigned int v17 = [(CardPresentationController *)self hidden];

    if (v14 != v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_viewController);
      id v19 = [v18 view];
      uint64_t v20 = [v19 window];
      if (v20)
      {
        id v21 = (void *)v20;
        id v22 = objc_loadWeakRetained((id *)&self->_viewController);
        id v23 = [v22 presentedViewController];

        if (!v23)
        {
          id v24 = objc_loadWeakRetained((id *)&self->_viewController);
          id v25 = [v24 sheetPresentationController];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100A22380;
          v31[3] = &unk_1012E5D08;
          v31[4] = self;
          [v25 animateChanges:v31];

          return;
        }
      }
      else
      {
      }
      BOOL v28 = [(CardPresentationController *)self hidden];
      id v30 = objc_loadWeakRetained((id *)p_viewController);
      double v29 = [v30 sheetPresentationController];
      [v29 _setHidden:v28];

      goto LABEL_15;
    }
  }
}

- (void)setCardView:(id)a3 fromContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_cardView, v6);
  objc_storeWeak((id *)&self->_containerViewController, v7);

  if (v6)
  {
    id v8 = [v6 layer];
    [v8 setAllowsGroupOpacity:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
    id v10 = [WeakRetained contentView];

    id v11 = objc_loadWeakRetained((id *)&self->_viewController);
    id v12 = [v11 view];

    [v10 addSubview:v12];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = objc_loadWeakRetained((id *)&self->_cardView);
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v30 = [v10 topAnchor];
    double v29 = [v12 topAnchor];
    BOOL v28 = [v30 constraintEqualToAnchor:v29];
    v32[0] = v28;
    id v27 = [v10 bottomAnchor];
    id v26 = [v12 bottomAnchor];
    id v24 = [v27 constraintEqualToAnchor:v26];
    v32[1] = v24;
    id v14 = [v10 leadingAnchor];
    id v15 = [v12 leadingAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    v32[2] = v16;
    [v10 trailingAnchor];
    unsigned int v17 = location = (id *)&self->_cardView;
    id v18 = [v12 trailingAnchor];
    [v17 constraintEqualToAnchor:v18];
    id v19 = v31 = v6;
    v32[3] = v19;
    +[NSArray arrayWithObjects:v32 count:4];
    v21 = uint64_t v20 = self;
    +[NSLayoutConstraint activateConstraints:v21];

    carddouble Height = v20->_cardHeight;
    id v23 = objc_loadWeakRetained(location);
    [v23 setHeight:cardHeight];

    id v6 = v31;
    [(CardPresentationController *)v20 _updateStyle];
  }
}

- (void)updateHeightForCurrentLayout
{
}

- (void)updateHeightForCurrentLayoutAnimated:(BOOL)a3
{
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    if (a3 || +[UIView _isInAnimationBlock])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      id v6 = [WeakRetained sheetPresentationController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100A22878;
      v15[3] = &unk_1012E5D08;
      v15[4] = self;
      [v6 animateChanges:v15];

      return;
    }
    p_viewController = &self->_viewController;
    id v11 = objc_loadWeakRetained((id *)p_viewController);
    id v12 = [v11 sheetPresentationController];
    [v12 invalidateDetents];

    id v14 = objc_loadWeakRetained((id *)p_viewController);
    id v13 = [v14 view];
    [v13 setNeedsLayout];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v8 = [v7 currentViewController];
    id v9 = [(CardPresentationController *)self viewController];

    if (v8 != v9) {
      return;
    }
    id v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
    -[CardPresentationController updateHeightForLayout:](self, "updateHeightForLayout:", [v14 containeeLayout]);
  }
}

- (void)updateHeightForLayout:(unint64_t)a3
{
  if ([(CardPresentationController *)self usingSheetPresentation]) {
    return;
  }
  id v5 = [(CardPresentationController *)self viewController];
  [v5 heightForLayout:a3];
  double v7 = v6;

  if (v7 == -1.0) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ([WeakRetained layoutModalPresenter] != (id)3) {
    goto LABEL_6;
  }
  id v9 = [(CardPresentationController *)self viewController];
  id v10 = [v9 cardPresentationController];
  unsigned int v11 = [v10 presentedModally];

  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v12 = [WeakRetained modalPresenter];
    id v13 = [v12 cardPresentationController];
    [v13 updateHeightConstraintWithValue:v7];

LABEL_6:
  }

  [(CardPresentationController *)self updateHeightConstraintWithValue:v7];
}

- (BOOL)updateHeightConstraintWithValue:(double)a3
{
  [(CardPresentationController *)self headerTransitionHeight];

  return [(CardPresentationController *)self updateHeightConstraintWithValue:a3 transitionHeight:v5];
}

- (BOOL)updateHeightConstraintWithValue:(double)a3 transitionHeight:(double)a4
{
  p_cardView = &self->_cardView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
  [WeakRetained height];
  double v10 = v9;

  if (v10 == a3) {
    return 0;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_viewController);
  id v13 = [v12 view];
  id v14 = [v13 window];

  if (!v14) {
    return 0;
  }
  double v15 = 30.0;
  if (a4 >= 30.0) {
    double v16 = a4;
  }
  else {
    double v16 = 30.0;
  }
  id v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v18 = objc_loadWeakRetained((id *)&self->_viewController);
  [v17 availableHeightForViewController:v18];
  double v20 = v19;

  id v21 = objc_loadWeakRetained((id *)&self->_viewController);
  [v21 heightForLayout:1];
  if (v22 >= 30.0)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_viewController);
    [v23 heightForLayout:1];
    double v15 = v24;
  }
  if (v15 <= a3 && v20 >= a3)
  {
    double v25 = fmin((a3 - v15) / v16, 1.0);
    if (v25 >= 0.0) {
      double v26 = v25;
    }
    else {
      double v26 = 0.0;
    }
    id v27 = [(CardPresentationController *)self viewController];
    BOOL v28 = [v27 cardPresentationController];
    if ([v28 presentedModally])
    {
    }
    else
    {
      v35 = [(CardPresentationController *)self viewController];
      CGRect v36 = [v35 cardPresentationController];
      unsigned int v37 = [v36 hidesContentInSmallLayout];

      if (v37) {
        [(CardPresentationController *)self setContentAlpha:v26];
      }
    }
    id v32 = objc_loadWeakRetained((id *)p_cardView);
    v33 = v32;
    double v34 = a3;
    goto LABEL_25;
  }
  if (v15 > a3)
  {
    double v29 = [(CardPresentationController *)self viewController];
    id v30 = [v29 cardPresentationController];
    unsigned int v31 = [v30 hidesContentInSmallLayout];

    if (v31) {
      [(CardPresentationController *)self setContentAlpha:0.0];
    }
    id v32 = objc_loadWeakRetained((id *)p_cardView);
    v33 = v32;
    double v34 = v15;
    goto LABEL_25;
  }
  if (v20 >= a3) {
    return 0;
  }
  [(CardPresentationController *)self setContentAlpha:1.0];
  id v32 = objc_loadWeakRetained((id *)p_cardView);
  v33 = v32;
  double v34 = v20;
LABEL_25:
  [v32 setHeight:v34];

  id v38 = objc_loadWeakRetained((id *)p_cardView);
  [v38 height];
  self->_carddouble Height = v39;

  return 1;
}

- (unint64_t)_layoutforDetentIdentifier:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  double v6 = [WeakRetained sheetPresentationController];

  if (!v6) {
    return 1;
  }
  if (a3 == @"FullLayoutDetentIdentifier") {
    return 3;
  }
  if (a3 != @"MediumLayoutDetentIdentifier") {
    return 1;
  }
  if ((id)[(CardPresentationController *)self containerStyle] == (id)4) {
    return 3;
  }
  else {
    return 2;
  }
}

- (void)updateAdditionalTopMargin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  uint64_t v4 = [WeakRetained sheetPresentationController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A22DFC;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [v4 animateChanges:v5];
}

- (int64_t)modalDismissStyle
{
  return [(CardPresentationController *)self _modalPresentationStyleIsDismissing:1];
}

- (int64_t)_detentIndexForContaineeLayout:(unint64_t)a3
{
  unint64_t v4 = a3 - 3;
  unint64_t v5 = [(CardPresentationController *)self containerStyle];
  int64_t v7 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 && v5 != 4;
  int64_t v8 = 1;
  if (v5 != 4) {
    int64_t v8 = 2;
  }
  if (v4 <= 2) {
    return v8;
  }
  else {
    return v7;
  }
}

- (double)transitionProgressFromLayout:(unint64_t)a3 toLayout:(unint64_t)a4
{
  double v7 = 0.0;
  if ([(CardPresentationController *)self usingSheetPresentation])
  {
    p_viewController = &self->_viewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    double v10 = [WeakRetained sheetPresentationController];

    unsigned int v11 = [v10 _detentValues];
    id v12 = [v11 count];

    if (v12 == (id)3)
    {
      int64_t v13 = [(CardPresentationController *)self _detentIndexForContaineeLayout:a3];
      int64_t v14 = [(CardPresentationController *)self _detentIndexForContaineeLayout:a4];
      if (a3 > a4) {
        int64_t v15 = v13;
      }
      else {
        int64_t v15 = v14;
      }
      if (a3 > a4) {
        int64_t v13 = v14;
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100A23180;
      v38[3] = &unk_101314A60;
      v38[4] = self;
      double v16 = objc_retainBlock(v38);
      id v17 = [v10 _detentValues];
      id v18 = [v17 objectAtIndexedSubscript:v13];
      [v18 floatValue];
      double v20 = ((double (*)(void *, unint64_t, double))v16[2])(v16, a3, v19);

      id v21 = [v10 _detentValues];
      double v22 = [v21 objectAtIndexedSubscript:v15];
      [v22 floatValue];
      double v24 = ((double (*)(void *, unint64_t, double))v16[2])(v16, a4, v23);

      [v10 _currentPresentedViewFrame];
      double Height = CGRectGetHeight(v39);
      id v26 = objc_loadWeakRetained((id *)p_viewController);
      id v27 = [v26 sheetPresentationController];
      [v27 _additionalMinimumTopInset];
      double v29 = Height + v28;

      id v30 = [v10 traitCollection];
      [v30 displayScale];
      double v32 = 1.0 / v31;

      if (vabdd_f64(v29, v20) <= v32 || v29 < v20)
      {
        if (a3 <= a4) {
          double v7 = 0.0;
        }
        else {
          double v7 = 1.0;
        }
      }
      else if (vabdd_f64(v29, v24) > v32 && v29 <= v24)
      {
        double v35 = v29 - v20;
        double v7 = 0.0;
        if (v35 != 0.0)
        {
          double v36 = v35 / (v24 - v20);
          if (a3 > a4) {
            double v7 = 1.0 - v36;
          }
          else {
            double v7 = v36;
          }
        }
      }
      else if (a3 > a4)
      {
        double v7 = 0.0;
      }
      else
      {
        double v7 = 1.0;
      }
    }
  }
  return v7;
}

- (double)transitionProgressToAscendingLayoutFromLayout:(unint64_t)a3
{
  -[CardPresentationController transitionProgressFromLayout:toLayout:](self, "transitionProgressFromLayout:toLayout:");
  return result;
}

- (void)setEdgeAttachedRegularHeightDimmingBehavior:(unint64_t)a3
{
  self->_edgeAttachedRegularHeightDimmingBehavior = a3;
}

- (void)setAlwaysUseDefaultContaineeLayout:(BOOL)a3
{
  self->_alwaysUseDefaultContaineeLayout = a3;
}

- (UIColor)cardColor
{
  return self->_cardColor;
}

- (void)setCardColor:(id)a3
{
}

- (BOOL)allowsSwipeToDismiss
{
  return self->_allowsSwipeToDismiss;
}

- (void)setGrabberBlurEnabled:(BOOL)a3
{
  self->_grabberBlurEnabled = a3;
}

- (void)setTakesAvailableHeight:(BOOL)a3
{
  self->_takesAvailabledouble Height = a3;
}

- (void)setTakesAvailableWidth:(BOOL)a3
{
  self->_takesAvailabledouble Width = a3;
}

- (BOOL)allowResizeInFloatingStyle
{
  return self->_allowResizeInFloatingStyle;
}

- (void)setShouldHidePreviousCards:(BOOL)a3
{
  self->_shouldHidePreviousCards = a3;
}

- (void)setWantsFullscreen:(BOOL)a3
{
  self->_wantsFullscreen = a3;
}

- (void)setUseDefaultLayoutWhenCalculatingBottomInsetForFloatingControls:(BOOL)a3
{
  self->_useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls = a3;
}

- (void)setCardHeight:(double)a3
{
  self->_carddouble Height = a3;
}

- (CardView)cardView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);

  return (CardView *)WeakRetained;
}

- (void)setCardView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_cardView);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_cardColor, 0);
}

@end