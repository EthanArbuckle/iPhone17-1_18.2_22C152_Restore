@interface OBWelcomeController
- (BOOL)_buttonTrayInlined;
- (BOOL)_landscapeiPhone;
- (BOOL)_scrollViewContentIsUnderTray;
- (BOOL)_shouldDetachButtonTray;
- (BOOL)_shouldInlineButtontray;
- (BOOL)contentViewUnderButtonTray;
- (BOOL)darkMode;
- (BOOL)disableButtonsUntilAllContentWasVisable;
- (BOOL)includePaddingAboveContentView;
- (BOOL)isContentCenterAligned;
- (BOOL)isScrollingDisabled;
- (BOOL)shouldAdjustButtonTrayForKeyboard;
- (BOOL)shouldAdjustScrollViewInsetForKeyboard;
- (BOOL)shouldInlineButtonTray;
- (BOOL)shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen;
- (BOOL)shouldShowHeaderCachedState;
- (CGRect)keyboardFrame;
- (NSLayoutConstraint)buttonTrayScrollContainerHeightConstraint;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)contentViewTopOffsetConstraint;
- (NSLayoutConstraint)headerTopOffsetConstraint;
- (NSLayoutConstraint)secondaryContentViewTopOffsetConstraint;
- (OBBulletedList)bulletedList;
- (OBButtonTray)buttonTray;
- (OBContentView)contentView;
- (OBHeaderView)headerView;
- (OBNavigationBarDisplayState)cachedBarState;
- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (UINavigationController)retainedNavigationController;
- (UIScrollView)scrollView;
- (UIView)bleedView;
- (UIView)buttonTrayScrollContainerView;
- (UIView)scrollContentView;
- (UIView)secondaryContentView;
- (double)_contentViewHeight;
- (double)_headerTopOffset;
- (double)availableContentViewHeight;
- (double)contentViewsTopPaddingFromBottomOfHeader;
- (id)_currentContainerView;
- (id)setupHeaderViewIfNeeded:(id)a3 detailedText:(id)a4 icon:(id)a5;
- (int64_t)contentViewLayout;
- (int64_t)navigationBarScrollToEdgeBehavior;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)templateType;
- (void)_animatePushTransitionForViews:(id)a3 transitionSubtype:(id)a4;
- (void)_commonInitWithContentLayout:(int64_t)a3;
- (void)_enableTrayButtonsForScrollToBottom:(id)a3;
- (void)_floatButtonTray;
- (void)_handleKeyboardPresentation:(id)a3;
- (void)_inlineButtonTray;
- (void)_inlineButtonTrayIfNeeded;
- (void)_keyboardWillHide:(id)a3;
- (void)_layoutButtonTray;
- (void)_registerForKeyboardNotifications;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
- (void)_setupNavigationBarBleed;
- (void)_setupScrollView;
- (void)_unregisterForKeyboardNotifications;
- (void)_updateButtonTrayBackdrop;
- (void)_updateHeaderTopOffsetConstraint;
- (void)_updateScrollContentViewLayoutMargins;
- (void)_updateScrollViewInsets;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (void)loadView;
- (void)restoreNavigationBarAppearance;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAvailableContentViewHeight:(double)a3;
- (void)setBleedView:(id)a3;
- (void)setBulletedList:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setButtonTrayScrollContainerHeightConstraint:(id)a3;
- (void)setButtonTrayScrollContainerView:(id)a3;
- (void)setCachedBarState:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentView:(id)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setContentViewTopOffsetConstraint:(id)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setDisableButtonsUntilAllContentWasVisable:(BOOL)a3;
- (void)setHeaderTopOffsetConstraint:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIncludePaddingAboveContentView:(BOOL)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setRetainedNavigationController:(id)a3;
- (void)setScrollContentView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollingDisabled:(BOOL)a3;
- (void)setSecondaryContentView:(id)a3;
- (void)setSecondaryContentViewTopOffsetConstraint:(id)a3;
- (void)setShouldAdjustButtonTrayForKeyboard:(BOOL)a3;
- (void)setShouldAdjustScrollViewInsetForKeyboard:(BOOL)a3;
- (void)setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:(BOOL)a3;
- (void)setShouldShowHeaderCachedState:(BOOL)a3;
- (void)setTemplateType:(unint64_t)a3;
- (void)set_shouldInlineButtontray:(BOOL)a3;
- (void)setupBulletedListIfNeeded;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDirectionalLayoutMargins;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation OBWelcomeController

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v7 = [(OBWelcomeController *)self scrollView];
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(OBWelcomeController *)self scrollView];
  objc_msgSend(v9, "scrollRectToVisible:animated:", v4, x, y, width, height);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(OBWelcomeController *)self contentViewLayout] != 2)
  {
    id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"Bulleted lists can only be positioned below the header, normal width.", 0 reason userInfo];
    objc_exception_throw(v17);
  }
  [(OBWelcomeController *)self loadViewIfNeeded];
  [(OBWelcomeController *)self setupBulletedListIfNeeded];
  v16 = [(OBWelcomeController *)self bulletedList];
  [v16 addItemWithTitle:v18 description:v12 image:v13 tintColor:v14 linkButton:v15];
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(OBWelcomeController *)self contentViewLayout] != 2)
  {
    id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"Bulleted lists can only be positioned below the header, normal width.", 0 reason userInfo];
    objc_exception_throw(v17);
  }
  [(OBWelcomeController *)self loadViewIfNeeded];
  [(OBWelcomeController *)self setupBulletedListIfNeeded];
  v16 = [(OBWelcomeController *)self bulletedList];
  [v16 addItemWithTitle:v18 description:v12 symbolName:v13 tintColor:v14 linkButton:v15];
}

- (void)_animatePushTransitionForViews:(id)a3 transitionSubtype:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (__CFString *)a4;
  id v7 = [MEMORY[0x1E4F39D18] animation];
  v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v7 setTimingFunction:v8];

  [v7 setDuration:0.2];
  [v7 setType:@"push"];
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  v11 = @"fromRight";
  if (v10 == 1) {
    v11 = @"fromLeft";
  }
  if (!v6) {
    v6 = v11;
  }
  [v7 setSubtype:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    uint64_t v16 = *MEMORY[0x1E4F3A5B0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "layer", (void)v21);
        [v19 removeAllAnimations];

        v20 = [v18 layer];
        [v20 addAnimation:v7 forKey:v16];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  return [(OBWelcomeController *)self initWithTitle:a3 detailText:a4 symbolName:a5 contentLayout:2];
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  return [(OBWelcomeController *)self initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2];
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBWelcomeController;
  uint64_t v13 = [(OBWelcomeController *)&v17 initWithNibName:0 bundle:0];
  if (v13)
  {
    uint64_t v14 = [[OBHeaderView alloc] initWithTitle:v10 detailText:v11 symbolName:v12];
    [(OBWelcomeController *)v13 setHeaderView:v14];

    uint64_t v15 = [(OBWelcomeController *)v13 headerView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(OBWelcomeController *)v13 _commonInitWithContentLayout:a6];
  }

  return v13;
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBWelcomeController;
  uint64_t v13 = [(OBWelcomeController *)&v17 initWithNibName:0 bundle:0];
  if (v13)
  {
    uint64_t v14 = [[OBHeaderView alloc] initWithTitle:v10 detailText:v11 icon:v12];
    [(OBWelcomeController *)v13 setHeaderView:v14];

    uint64_t v15 = [(OBWelcomeController *)v13 headerView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(OBWelcomeController *)v13 _commonInitWithContentLayout:a6];
  }

  return v13;
}

- (void)_commonInitWithContentLayout:(int64_t)a3
{
  self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen = 1;
  id v5 = [OBButtonTray alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v10 = -[OBButtonTray initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  [(OBWelcomeController *)self setButtonTray:v10];

  id v11 = [(OBWelcomeController *)self buttonTray];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(OBWelcomeController *)self buttonTray];
  [v12 setParentViewController:self];

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
  [(OBWelcomeController *)self setButtonTrayScrollContainerView:v13];

  uint64_t v14 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v15 = a3 == 4 || a3 == 1;
  uint64_t v16 = -[OBContentView initWithFrame:aboveHeaderLayout:]([OBContentView alloc], "initWithFrame:aboveHeaderLayout:", v15, v6, v7, v8, v9);
  [(OBWelcomeController *)self setContentView:v16];

  objc_super v17 = [(OBWelcomeController *)self contentView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  if (a3 == 4)
  {
    id v18 = -[OBContentView initWithFrame:]([OBContentView alloc], "initWithFrame:", v6, v7, v8, v9);
    secondaryContentView = self->_secondaryContentView;
    self->_secondaryContentView = &v18->super;
  }
  [(OBWelcomeController *)self setContentViewLayout:a3];
  [(OBWelcomeController *)self setIncludePaddingAboveContentView:1];
}

- (id)setupHeaderViewIfNeeded:(id)a3 detailedText:(id)a4 icon:(id)a5
{
  headerView = self->_headerView;
  if (!headerView)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v12 = [[OBHeaderView alloc] initWithTitle:v11 detailText:v10 icon:v9];

    uint64_t v13 = self->_headerView;
    self->_headerView = v12;

    [(OBHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    headerView = self->_headerView;
  }
  uint64_t v14 = headerView;
  return v14;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  [(OBBaseWelcomeController *)&v3 loadView];
  [(OBWelcomeController *)self _setupScrollView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
  if ([(OBWelcomeController *)self _appearState] != 3)
  {
    if ([(OBWelcomeController *)self _appearState])
    {
      [(OBWelcomeController *)self _inlineButtonTrayIfNeeded];
      [(OBWelcomeController *)self updateNavigationBarAnimated:0];
      [(OBWelcomeController *)self _updateHeaderTopOffsetConstraint];
      [(OBWelcomeController *)self _updateButtonTrayBackdrop];
      [(OBWelcomeController *)self _updateScrollViewInsets];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OBWelcomeController;
  [(OBWelcomeController *)&v13 viewWillAppear:a3];
  [(OBWelcomeController *)self _registerForKeyboardNotifications];
  BOOL v4 = [(OBWelcomeController *)self navigationController];
  [(OBWelcomeController *)self setRetainedNavigationController:v4];

  id v5 = [(OBWelcomeController *)self cachedBarState];

  if (!v5)
  {
    double v6 = [(OBWelcomeController *)self navigationController];
    double v7 = [v6 navigationBar];
    double v8 = +[OBNavigationBarDisplayState displayStateForNavigationBar:v7];
    [(OBWelcomeController *)self setCachedBarState:v8];
  }
  [(OBWelcomeController *)self updateDirectionalLayoutMargins];
  id v9 = [(OBWelcomeController *)self view];
  [v9 setNeedsUpdateConstraints];

  [(OBWelcomeController *)self _layoutButtonTray];
  if (+[OBViewUtilities shouldUseAccessibilityLayout])
  {
    id v10 = [(OBWelcomeController *)self view];
    [v10 layoutIfNeeded];
  }
  if ([(OBWelcomeController *)self disableButtonsUntilAllContentWasVisable])
  {
    id v11 = [(OBWelcomeController *)self buttonTray];
    id v12 = [v11 buttons];
    [v12 enumerateObjectsUsingBlock:&__block_literal_global_6];
  }
}

uint64_t __38__OBWelcomeController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OBWelcomeController;
  [(OBBaseWelcomeController *)&v9 viewDidAppear:a3];
  if ([(OBWelcomeController *)self _scrollViewContentIsUnderTray])
  {
    BOOL v4 = [(OBWelcomeController *)self scrollView];
    [v4 flashScrollIndicators];
  }
  [(OBWelcomeController *)self contentViewsTopPaddingFromBottomOfHeader];
  double v6 = v5;
  double v7 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
  [v7 setConstant:v6];

  double v8 = [(OBWelcomeController *)self scrollView];
  [(OBWelcomeController *)self _enableTrayButtonsForScrollToBottom:v8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  [(OBWelcomeController *)&v4 viewWillDisappear:a3];
  [(OBWelcomeController *)self _unregisterForKeyboardNotifications];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  [(OBWelcomeController *)&v4 viewDidDisappear:a3];
  -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBWelcomeController *)self restoreNavigationBarAppearance];
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 type];

  if (v4 == 1) {
    return 6;
  }
  v6.receiver = self;
  v6.super_class = (Class)OBWelcomeController;
  return [(OBWelcomeController *)&v6 supportedInterfaceOrientations];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBWelcomeController;
  [(OBWelcomeController *)&v8 traitCollectionDidChange:a3];
  if ([(OBWelcomeController *)self contentViewLayout] == 1
    || [(OBWelcomeController *)self contentViewLayout] == 4)
  {
    [(OBWelcomeController *)self _contentViewHeight];
    double v5 = v4;
    objc_super v6 = [(OBWelcomeController *)self contentViewHeightConstraint];
    [v6 setConstant:v5];
  }
  double v7 = [(OBWelcomeController *)self view];
  [v7 layoutIfNeeded];

  [(OBWelcomeController *)self _layoutButtonTray];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)OBWelcomeController;
  id v7 = a4;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(OBWelcomeController *)self view];
  int64_t v9 = +[OBViewUtilities activeInterfaceOrientationForView:v8];

  id v10 = [(OBWelcomeController *)self view];
  [v10 frame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v19[3] = &unk_1E58AEEE0;
  v19[4] = self;
  v19[5] = v9;
  v19[6] = v12;
  v19[7] = v14;
  v19[8] = v16;
  v19[9] = v18;
  [v7 animateAlongsideTransition:0 completion:v19];
}

void __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) updateDirectionalLayoutMargins];
  if ([*v2 contentViewLayout] == 1 || objc_msgSend(*v2, "contentViewLayout") == 4)
  {
    [*v2 _contentViewHeight];
    double v4 = v3;
    double v5 = [*v2 contentViewHeightConstraint];
  }
  else
  {
    [*v2 contentViewsTopPaddingFromBottomOfHeader];
    double v4 = v6;
    double v5 = [*v2 contentViewTopOffsetConstraint];
  }
  id v7 = v5;
  [v5 setConstant:v4];

  objc_super v8 = [*(id *)(a1 + 32) view];
  int64_t v9 = +[OBViewUtilities activeInterfaceOrientationForView:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10 != v9 && ((unint64_t)(v10 - 3) < 2 || (unint64_t)(v9 - 3) <= 1))
  {
    uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1 && [*v2 contentViewLayout] != 2)
    {
      uint64_t v13 = _OBLoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_cold_1(v2, v13);
      }
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) view];
  [v14 frame];
  v20.origin.double x = v15;
  v20.origin.double y = v16;
  v20.size.double width = v17;
  v20.size.double height = v18;
  BOOL v19 = CGRectEqualToRect(*(CGRect *)(a1 + 48), v20);

  if (!v19) {
    [*v2 _layoutButtonTray];
  }
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
  [(OBWelcomeController *)self setNeedsUserInterfaceAppearanceUpdate];
}

- (void)setScrollingDisabled:(BOOL)a3
{
  if (self->_scrollingDisabled != a3)
  {
    BOOL v3 = a3;
    self->_scrollingDisabled = a3;
    id v4 = [(OBWelcomeController *)self scrollView];
    [v4 setScrollEnabled:!v3];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  if (self->_darkMode) {
    return 2;
  }
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  return [(OBWelcomeController *)&v3 preferredUserInterfaceStyle];
}

- (double)availableContentViewHeight
{
  if ([(OBWelcomeController *)self _buttonTrayInlined])
  {
    objc_super v3 = [(OBWelcomeController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v6 = [(OBWelcomeController *)self buttonTray];
    [v6 bounds];
    double v8 = v5 - v7;
    int64_t v9 = [(OBWelcomeController *)self contentView];
    [v9 frame];
    double v11 = v8 - v10;
    uint64_t v12 = [(OBWelcomeController *)self view];
    [v12 safeAreaInsets];
    double v14 = fmax(v11 - v13, 0.0);
  }
  else
  {
    objc_super v3 = [(OBWelcomeController *)self buttonTray];
    [v3 frame];
    double v16 = v15;
    double v6 = [(OBWelcomeController *)self contentView];
    [v6 frame];
    double v18 = v16 - v17;
    int64_t v9 = [(OBWelcomeController *)self view];
    [v9 safeAreaInsets];
    double v14 = fmax(v18 - v19, 0.0);
  }

  return v14;
}

- (void)_setupNavigationBarBleed
{
  v33[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 _setBackgroundHidden:1];

  id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBWelcomeController *)self setBleedView:v5];

  double v6 = [(OBWelcomeController *)self contentView];
  double v7 = [(OBWelcomeController *)self bleedView];
  [v6 setBleedView:v7];

  double v8 = [(OBWelcomeController *)self bleedView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  int64_t v9 = [(OBWelcomeController *)self view];
  double v10 = [(OBWelcomeController *)self bleedView];
  [v9 insertSubview:v10 atIndex:0];

  long long v23 = (void *)MEMORY[0x1E4F28DC8];
  v32 = [(OBWelcomeController *)self bleedView];
  v30 = [v32 topAnchor];
  v31 = [(OBWelcomeController *)self view];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v33[0] = v28;
  v27 = [(OBWelcomeController *)self bleedView];
  v25 = [v27 leftAnchor];
  uint64_t v26 = [(OBWelcomeController *)self scrollContentView];
  long long v24 = [v26 leftAnchor];
  long long v22 = [v25 constraintEqualToAnchor:v24 constant:0.0];
  v33[1] = v22;
  long long v21 = [(OBWelcomeController *)self bleedView];
  double v11 = [v21 widthAnchor];
  uint64_t v12 = [(OBWelcomeController *)self scrollContentView];
  double v13 = [v12 widthAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 multiplier:1.0];
  v33[2] = v14;
  double v15 = [(OBWelcomeController *)self bleedView];
  double v16 = [v15 bottomAnchor];
  double v17 = [(OBWelcomeController *)self contentView];
  double v18 = [v17 bottomAnchor];
  double v19 = [v16 constraintGreaterThanOrEqualToAnchor:v18];
  v33[3] = v19;
  CGRect v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  [v23 activateConstraints:v20];
}

- (void)_setupScrollView
{
  v229[10] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(OBWelcomeController *)self setScrollView:v8];

  int64_t v9 = [(OBWelcomeController *)self scrollView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = [(OBWelcomeController *)self scrollView];
  [v10 setDelegate:self];

  double v11 = [(OBWelcomeController *)self scrollView];
  [v11 setContentInsetAdjustmentBehavior:2];

  uint64_t v12 = [(OBWelcomeController *)self scrollView];
  [v12 _setIndicatorInsetAdjustmentBehavior:2];

  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v17 = [(OBWelcomeController *)self scrollView];
  objc_msgSend(v17, "setContentInset:", v13, v14, v15, v16);

  uint64_t v18 = [(OBWelcomeController *)self isScrollingDisabled] ^ 1;
  double v19 = [(OBWelcomeController *)self scrollView];
  [v19 setScrollEnabled:v18];

  CGRect v20 = [(OBWelcomeController *)self scrollView];
  long long v21 = [[OBScrollViewWeakLayoutObserver alloc] initWithLayoutObserver:self];
  [v20 _setLayoutObserver:v21];

  long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
  [(OBWelcomeController *)self setScrollContentView:v22];

  long long v23 = [(OBWelcomeController *)self scrollContentView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  long long v24 = [(OBWelcomeController *)self scrollView];
  v25 = [(OBWelcomeController *)self scrollContentView];
  [v24 addSubview:v25];

  uint64_t v26 = [(OBWelcomeController *)self scrollContentView];
  v27 = [(OBWelcomeController *)self headerView];
  [v26 addSubview:v27];

  v28 = [(OBWelcomeController *)self scrollContentView];
  v29 = [(OBWelcomeController *)self contentView];
  [v28 addSubview:v29];

  v30 = [(OBWelcomeController *)self scrollContentView];
  v31 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  [v30 addSubview:v31];

  v32 = [(OBWelcomeController *)self view];
  v33 = [(OBWelcomeController *)self scrollView];
  [v32 addSubview:v33];

  v34 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  v35 = [v34 heightAnchor];
  v36 = [v35 constraintEqualToConstant:0.0];
  [(OBWelcomeController *)self setButtonTrayScrollContainerHeightConstraint:v36];

  v222 = [MEMORY[0x1E4F1CA48] array];
  v216 = [(OBWelcomeController *)self scrollView];
  v204 = [v216 bottomAnchor];
  v210 = [(OBWelcomeController *)self view];
  v198 = [v210 bottomAnchor];
  v192 = [v204 constraintEqualToAnchor:v198 constant:0.0];
  v229[0] = v192;
  v187 = [(OBWelcomeController *)self scrollView];
  v179 = [v187 topAnchor];
  v184 = [(OBWelcomeController *)self scrollContentView];
  v175 = [v184 topAnchor];
  v171 = [v179 constraintEqualToAnchor:v175 constant:0.0];
  v229[1] = v171;
  v168 = [(OBWelcomeController *)self scrollView];
  v162 = [v168 bottomAnchor];
  v165 = [(OBWelcomeController *)self scrollContentView];
  v159 = [v165 bottomAnchor];
  v156 = [v162 constraintEqualToAnchor:v159 constant:0.0];
  v229[2] = v156;
  v154 = [(OBWelcomeController *)self scrollView];
  v150 = [v154 leftAnchor];
  v152 = [(OBWelcomeController *)self scrollContentView];
  v148 = [v152 leftAnchor];
  v146 = [v150 constraintEqualToAnchor:v148 constant:0.0];
  v229[3] = v146;
  v145 = [(OBWelcomeController *)self scrollView];
  v143 = [v145 rightAnchor];
  v144 = [(OBWelcomeController *)self scrollContentView];
  v142 = [v144 rightAnchor];
  v141 = [v143 constraintEqualToAnchor:v142 constant:0.0];
  v229[4] = v141;
  v140 = [(OBWelcomeController *)self scrollView];
  v139 = [v140 frameLayoutGuide];
  v137 = [v139 widthAnchor];
  v138 = [(OBWelcomeController *)self scrollContentView];
  v136 = [v138 widthAnchor];
  v135 = [v137 constraintEqualToAnchor:v136 constant:0.0];
  v229[5] = v135;
  v134 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  v132 = [v134 centerXAnchor];
  v133 = [(OBWelcomeController *)self view];
  v131 = [v133 centerXAnchor];
  v130 = [v132 constraintEqualToAnchor:v131];
  v229[6] = v130;
  v129 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  v127 = [v129 widthAnchor];
  v128 = [(OBWelcomeController *)self headerView];
  v37 = [v128 widthAnchor];
  v38 = [v127 constraintEqualToAnchor:v37 multiplier:1.0];
  v229[7] = v38;
  v39 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  v40 = [v39 bottomAnchor];
  v41 = [(OBWelcomeController *)self scrollContentView];
  v42 = [v41 bottomAnchor];
  v43 = [v40 constraintEqualToAnchor:v42 constant:0.0];
  v229[8] = v43;
  v44 = [(OBWelcomeController *)self buttonTrayScrollContainerHeightConstraint];
  v229[9] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v229 count:10];
  [v222 addObjectsFromArray:v45];

  v217 = [(OBWelcomeController *)self scrollView];
  v205 = [v217 topAnchor];
  v211 = [(OBWelcomeController *)self view];
  v199 = [v211 safeAreaLayoutGuide];
  v193 = [v199 topAnchor];
  v188 = [v205 constraintEqualToAnchor:v193 constant:0.0];
  v228[0] = v188;
  v185 = [(OBWelcomeController *)self scrollContentView];
  v180 = [v185 layoutMarginsGuide];
  v172 = [v180 leftAnchor];
  v176 = [(OBWelcomeController *)self headerView];
  v169 = [v176 leftAnchor];
  v166 = [v172 constraintEqualToAnchor:v169 constant:0.0];
  v228[1] = v166;
  v163 = [(OBWelcomeController *)self scrollContentView];
  v160 = [v163 layoutMarginsGuide];
  v155 = [v160 rightAnchor];
  v157 = [(OBWelcomeController *)self headerView];
  v153 = [v157 rightAnchor];
  v151 = [v155 constraintEqualToAnchor:v153 constant:0.0];
  v228[2] = v151;
  v149 = [(OBWelcomeController *)self scrollView];
  v147 = [v149 leftAnchor];
  v46 = [(OBWelcomeController *)self view];
  v47 = [v46 leftAnchor];
  v48 = [v147 constraintEqualToAnchor:v47 constant:0.0];
  v228[3] = v48;
  v49 = [(OBWelcomeController *)self scrollView];
  v50 = [v49 rightAnchor];
  v51 = [(OBWelcomeController *)self view];
  v52 = [v51 rightAnchor];
  v53 = [v50 constraintEqualToAnchor:v52 constant:0.0];
  v228[4] = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v228 count:5];
  [v222 addObjectsFromArray:v54];

  [MEMORY[0x1E4F28DC8] activateConstraints:v222];
  switch([(OBWelcomeController *)self contentViewLayout])
  {
    case 1:
    case 4:
      v55 = [(OBWelcomeController *)self contentView];
      v56 = [v55 topAnchor];
      v57 = [(OBWelcomeController *)self scrollContentView];
      v58 = [v57 topAnchor];
      v59 = [v56 constraintEqualToAnchor:v58 constant:0.0];
      [(OBWelcomeController *)self setContentViewTopOffsetConstraint:v59];

      v60 = [(OBWelcomeController *)self contentView];
      v61 = [v60 heightAnchor];
      [(OBWelcomeController *)self _contentViewHeight];
      v62 = objc_msgSend(v61, "constraintEqualToConstant:");
      [(OBWelcomeController *)self setContentViewHeightConstraint:v62];

      v194 = (void *)MEMORY[0x1E4F28DC8];
      v218 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
      v227[0] = v218;
      v212 = [(OBWelcomeController *)self contentView];
      v200 = [v212 leftAnchor];
      v206 = [(OBWelcomeController *)self scrollContentView];
      v63 = [v206 leftAnchor];
      v64 = [v200 constraintEqualToAnchor:v63 constant:0.0];
      v227[1] = v64;
      v65 = [(OBWelcomeController *)self contentView];
      v66 = [v65 widthAnchor];
      v67 = [(OBWelcomeController *)self scrollContentView];
      v68 = [v67 widthAnchor];
      v69 = [v66 constraintEqualToAnchor:v68 multiplier:1.0];
      v227[2] = v69;
      v70 = [(OBWelcomeController *)self contentViewHeightConstraint];
      v227[3] = v70;
      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v227 count:4];
      [v194 activateConstraints:v71];

      [(OBWelcomeController *)self _setupNavigationBarBleed];
      if ([(OBWelcomeController *)self contentViewLayout] == 4)
      {
        v72 = [(OBWelcomeController *)self secondaryContentView];
        [v72 setTranslatesAutoresizingMaskIntoConstraints:0];

        v73 = [(OBWelcomeController *)self scrollContentView];
        v74 = [(OBWelcomeController *)self secondaryContentView];
        [v73 addSubview:v74];

        v75 = [(OBWelcomeController *)self secondaryContentView];
        v76 = [v75 topAnchor];
        v77 = [(OBWelcomeController *)self headerView];
        v78 = [v77 bottomAnchor];
        [(OBWelcomeController *)self contentViewsTopPaddingFromBottomOfHeader];
        v79 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78);
        [(OBWelcomeController *)self setSecondaryContentViewTopOffsetConstraint:v79];

        v177 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v213 = [(OBWelcomeController *)self secondaryContentViewTopOffsetConstraint];
        v226[0] = v213;
        v219 = [(OBWelcomeController *)self secondaryContentView];
        v201 = [v219 leftAnchor];
        v207 = [(OBWelcomeController *)self scrollContentView];
        v195 = [v207 layoutMarginsGuide];
        uint64_t v189 = [v195 leftAnchor];
        v186 = [v201 constraintEqualToAnchor:v189 constant:0.0];
        v226[1] = v186;
        v181 = [(OBWelcomeController *)self secondaryContentView];
        v170 = [v181 widthAnchor];
        v173 = [(OBWelcomeController *)self headerView];
        v167 = [v173 widthAnchor];
        v164 = [v170 constraintEqualToAnchor:v167 multiplier:1.0];
        v226[2] = v164;
        v161 = [(OBWelcomeController *)self secondaryContentView];
        v158 = [v161 bottomAnchor];
        v80 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
        v81 = [v80 topAnchor];
        v82 = [v158 constraintEqualToAnchor:v81 constant:0.0];
        v226[3] = v82;
        v83 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
        v84 = [v83 topAnchor];
        v85 = [(OBWelcomeController *)self secondaryContentView];
        v86 = [v85 bottomAnchor];
        v87 = [v84 constraintEqualToAnchor:v86 constant:0.0];
        v226[4] = v87;
        v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v226 count:5];
        [v177 activateConstraints:v88];

        v89 = (void *)v189;
        v90 = (void *)v213;

        v91 = v195;
        v92 = v207;

        v93 = v201;
        v94 = v219;

        v95 = v181;
        goto LABEL_7;
      }
      v124 = (void *)MEMORY[0x1E4F28DC8];
      v90 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
      v94 = [v90 topAnchor];
      v93 = [(OBWelcomeController *)self headerView];
      v92 = [v93 bottomAnchor];
      v91 = [v94 constraintEqualToAnchor:v92 constant:0.0];
      v225 = v91;
      v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v225 count:1];
      [v124 activateConstraints:v89];
      goto LABEL_9;
    case 2:
      v96 = [(OBWelcomeController *)self contentView];
      v97 = [v96 topAnchor];
      v98 = [(OBWelcomeController *)self headerView];
      v99 = [v98 bottomAnchor];
      [(OBWelcomeController *)self contentViewsTopPaddingFromBottomOfHeader];
      v100 = objc_msgSend(v97, "constraintEqualToAnchor:constant:", v99);
      [(OBWelcomeController *)self setContentViewTopOffsetConstraint:v100];

      v182 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v214 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
      v224[0] = v214;
      v220 = [(OBWelcomeController *)self contentView];
      v202 = [v220 leftAnchor];
      v208 = [(OBWelcomeController *)self scrollContentView];
      v196 = [v208 layoutMarginsGuide];
      uint64_t v190 = [v196 leftAnchor];
      v186 = [v202 constraintEqualToAnchor:v190 constant:0.0];
      v224[1] = v186;
      v178 = [(OBWelcomeController *)self contentView];
      v174 = [v178 widthAnchor];
      v101 = [(OBWelcomeController *)self headerView];
      v102 = [v101 widthAnchor];
      v103 = [v174 constraintEqualToAnchor:v102 multiplier:1.0];
      v224[2] = v103;
      v104 = [(OBWelcomeController *)self contentView];
      v105 = [v104 bottomAnchor];
      v106 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
      v107 = [v106 topAnchor];
      v108 = [v105 constraintEqualToAnchor:v107 constant:0.0];
      v224[3] = v108;
      v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v224 count:4];
      [v182 activateConstraints:v109];

      v89 = (void *)v190;
      v91 = v196;

      v92 = v208;
      v93 = v202;

      v94 = v220;
      v90 = (void *)v214;

      goto LABEL_6;
    case 3:
      v110 = [(OBWelcomeController *)self contentView];
      v111 = [v110 topAnchor];
      v112 = [(OBWelcomeController *)self headerView];
      v113 = [v112 bottomAnchor];
      [(OBWelcomeController *)self contentViewsTopPaddingFromBottomOfHeader];
      v114 = objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113);
      [(OBWelcomeController *)self setContentViewTopOffsetConstraint:v114];

      v191 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v215 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
      v223[0] = v215;
      v221 = [(OBWelcomeController *)self contentView];
      v203 = [v221 leftAnchor];
      v209 = [(OBWelcomeController *)self scrollContentView];
      uint64_t v197 = [v209 leftAnchor];
      uint64_t v115 = [v203 constraintEqualToAnchor:v197 constant:0.0];
      v223[1] = v115;
      v186 = [(OBWelcomeController *)self contentView];
      v178 = [v186 widthAnchor];
      v183 = [(OBWelcomeController *)self scrollContentView];
      v116 = [v183 widthAnchor];
      v117 = [v178 constraintEqualToAnchor:v116 multiplier:1.0];
      v223[2] = v117;
      v118 = [(OBWelcomeController *)self contentView];
      v119 = [v118 bottomAnchor];
      v120 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
      v121 = [v120 topAnchor];
      v122 = [v119 constraintEqualToAnchor:v121 constant:0.0];
      v223[3] = v122;
      v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v223 count:4];
      [v191 activateConstraints:v123];

      v89 = (void *)v115;
      v91 = (void *)v197;

      v92 = v209;
      v93 = v203;

      v94 = v221;
      v90 = (void *)v215;
LABEL_6:
      v95 = v178;
LABEL_7:

LABEL_9:
      break;
    default:
      break;
  }
  [(OBWelcomeController *)self _layoutButtonTray];
  [(OBWelcomeController *)self _updateHeaderTopOffsetConstraint];
  v125 = [(OBWelcomeController *)self tabBarController];

  if (v125)
  {
    v126 = [(OBWelcomeController *)self scrollView];
    [(OBWelcomeController *)self setContentScrollView:v126 forEdge:4];
  }
}

- (void)setupBulletedListIfNeeded
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(OBWelcomeController *)self bulletedList];

  if (!v3)
  {
    double v4 = objc_alloc_init(OBBulletedList);
    [(OBWelcomeController *)self setBulletedList:v4];

    double v5 = [(OBWelcomeController *)self bulletedList];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    unint64_t v6 = [(OBWelcomeController *)self templateType];
    double v7 = [(OBWelcomeController *)self bulletedList];
    [v7 setTemplateType:v6];

    double v8 = [(OBWelcomeController *)self contentView];
    int64_t v9 = [(OBWelcomeController *)self bulletedList];
    [v8 addSubview:v9];

    [(OBWelcomeController *)self contentViewsTopPaddingFromBottomOfHeader];
    double v11 = v10;
    uint64_t v12 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
    [v12 setActive:0];

    double v13 = [(OBWelcomeController *)self contentView];
    double v14 = [v13 topAnchor];
    double v15 = [(OBWelcomeController *)self headerView];
    double v16 = [v15 bottomAnchor];
    double v17 = [v14 constraintEqualToAnchor:v16 constant:v11];
    [(OBWelcomeController *)self setContentViewTopOffsetConstraint:v17];

    uint64_t v18 = [(OBWelcomeController *)self contentViewTopOffsetConstraint];
    [v18 setActive:1];

    double v19 = [(OBWelcomeController *)self contentView];
    CGRect v20 = [v19 leadingAnchor];
    long long v21 = [(OBWelcomeController *)self bulletedList];
    long long v22 = [v21 leadingAnchor];
    long long v23 = [v20 constraintEqualToAnchor:v22];
    long long v24 = [(OBWelcomeController *)self bulletedList];
    [v24 setLeadingConstraint:v23];

    v25 = [(OBWelcomeController *)self contentView];
    uint64_t v26 = [v25 trailingAnchor];
    v27 = [(OBWelcomeController *)self bulletedList];
    v28 = [v27 trailingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v30 = [(OBWelcomeController *)self bulletedList];
    [v30 setTrailingConstraint:v29];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [(OBWelcomeController *)self bulletedList];
    v45 = [v46 leadingConstraint];
    v47[0] = v45;
    v44 = [(OBWelcomeController *)self bulletedList];
    v43 = [v44 trailingConstraint];
    v47[1] = v43;
    v42 = [(OBWelcomeController *)self contentView];
    v31 = [v42 topAnchor];
    v32 = [(OBWelcomeController *)self bulletedList];
    v33 = [v32 topAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v47[2] = v34;
    v35 = [(OBWelcomeController *)self contentView];
    v36 = [v35 bottomAnchor];
    v37 = [(OBWelcomeController *)self bulletedList];
    v38 = [v37 bottomAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    v47[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v41 activateConstraints:v40];
  }
}

- (double)contentViewsTopPaddingFromBottomOfHeader
{
  id v3 = [(OBWelcomeController *)self bulletedList];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v5 = [(OBWelcomeController *)self view];
    unint64_t v6 = [v5 window];
    uint64_t v7 = [v4 supportedInterfaceOrientationsForWindow:v6];

    BOOL v9 = v7 == 3 || (v7 & 0xFFFFFFFFFFFFFFF7) == 16;
    double v10 = [(OBWelcomeController *)self view];
    double v11 = [v10 window];

    if (![(OBWelcomeController *)self _landscapeiPhone] || !v11 || (double v12 = 24.0, !v9))
    {
      double v13 = +[OBDevice currentDevice];
      unint64_t v14 = [v13 templateType];

      double v12 = 0.0;
      if (v14 <= 9)
      {
        if (((1 << v14) & 0x24E) != 0)
        {
          uint64_t v15 = MGGetProductType();
          if (v15 == 1895344378 || v15 == 2903084588) {
            return 27.0;
          }
          else {
            return 30.0;
          }
        }
        else if (((1 << v14) & 0x1B0) != 0)
        {
          return 27.0;
        }
      }
    }
  }
  else
  {
    double v12 = 0.0;
    if ([(OBWelcomeController *)self contentViewLayout] != 1
      && [(OBWelcomeController *)self contentViewLayout] != 4)
    {
      if ([(OBWelcomeController *)self includePaddingAboveContentView]) {
        return 20.0;
      }
      else {
        return 0.0;
      }
    }
  }
  return v12;
}

- (int64_t)navigationBarScrollToEdgeBehavior
{
  if ([(OBWelcomeController *)self contentViewLayout] == 1) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  return [(OBBaseWelcomeController *)&v4 navigationBarScrollToEdgeBehavior];
}

- (BOOL)contentViewUnderButtonTray
{
  int64_t v3 = [(OBWelcomeController *)self contentViewLayout];
  if ((unint64_t)(v3 - 2) < 2)
  {
    uint64_t v4 = [(OBWelcomeController *)self contentView];
  }
  else
  {
    if (v3 != 4 && v3 != 1)
    {
      double v5 = 0;
      goto LABEL_8;
    }
    uint64_t v4 = [(OBWelcomeController *)self secondaryContentView];
  }
  double v5 = (void *)v4;
LABEL_8:
  [v5 frame];
  double MaxY = CGRectGetMaxY(v12);
  uint64_t v7 = [(OBWelcomeController *)self scrollView];
  [v7 frame];
  double v8 = CGRectGetMaxY(v13);
  BOOL v9 = [(OBWelcomeController *)self buttonTray];
  [v9 frame];
  BOOL v10 = MaxY >= v8 - CGRectGetHeight(v14);

  return v10;
}

- (BOOL)isContentCenterAligned
{
  return !+[OBViewUtilities shouldUseAccessibilityLayout];
}

- (double)_contentViewHeight
{
  if ([(OBWelcomeController *)self contentViewLayout] == 1
    || (int64_t v3 = [(OBWelcomeController *)self contentViewLayout], result = 0.0, v3 == 4))
  {
    double v5 = +[OBDevice currentDevice];
    uint64_t v6 = [v5 type];

    if (v6 == 2)
    {
      uint64_t v7 = [(OBWelcomeController *)self presentingViewController];
      if (!v7) {
        goto LABEL_11;
      }
      double v8 = (void *)v7;
      BOOL v9 = [(OBWelcomeController *)self presentingViewController];
      BOOL v10 = [v9 presentedViewController];
      uint64_t v11 = [v10 modalPresentationStyle];

      if (v11)
      {
        v26.receiver = self;
        v26.super_class = (Class)OBWelcomeController;
        [(OBBaseWelcomeController *)&v26 preferredContentSize];
      }
      else
      {
LABEL_11:
        CGRect v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v20 bounds];
        double v22 = v21;

        long long v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v23 bounds];
        double v25 = v24;

        if (v22 >= v25) {
          double v12 = v22;
        }
        else {
          double v12 = v25;
        }
      }
      return v12 * 0.36;
    }
    else
    {
      CGRect v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v13 bounds];
      double v15 = v14;

      double v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v16 bounds];
      double v18 = v17;

      if (v15 >= v18) {
        double v19 = v15;
      }
      else {
        double v19 = v18;
      }
      return v19 * 0.36;
    }
  }
  return result;
}

- (void)_updateHeaderTopOffsetConstraint
{
  int64_t v3 = [(OBWelcomeController *)self headerTopOffsetConstraint];

  if (v3)
  {
    [(OBWelcomeController *)self _headerTopOffset];
    double v5 = -v4;
    id v14 = [(OBWelcomeController *)self headerTopOffsetConstraint];
    [v14 setConstant:v5];
    goto LABEL_10;
  }
  int64_t v6 = [(OBWelcomeController *)self contentViewLayout];
  if ((unint64_t)(v6 - 2) < 2)
  {
    uint64_t v7 = [(OBWelcomeController *)self scrollView];
    uint64_t v8 = [v7 topAnchor];
  }
  else
  {
    if (v6 != 4 && v6 != 1) {
      goto LABEL_9;
    }
    uint64_t v7 = [(OBWelcomeController *)self contentView];
    uint64_t v8 = [v7 bottomAnchor];
  }
  BOOL v9 = (void *)v8;
  BOOL v10 = [(OBWelcomeController *)self headerView];
  uint64_t v11 = [v10 topAnchor];
  [(OBWelcomeController *)self _headerTopOffset];
  CGRect v13 = [v9 constraintEqualToAnchor:v11 constant:-v12];
  [(OBWelcomeController *)self setHeaderTopOffsetConstraint:v13];

LABEL_9:
  id v14 = [(OBWelcomeController *)self headerTopOffsetConstraint];
  [v14 setActive:1];
LABEL_10:
}

- (double)_headerTopOffset
{
  int64_t v4 = [(OBWelcomeController *)self contentViewLayout];
  if ((unint64_t)(v4 - 2) < 2)
  {
    int64_t v6 = +[OBDevice currentDevice];
    uint64_t v7 = [v6 type];

    if (v7 == 2)
    {
      uint64_t v8 = [(OBWelcomeController *)self view];
      [v8 bounds];
      float v10 = v9 * 0.09 + -20.0;
      float v11 = 20.0;
    }
    else
    {
      double v12 = [(OBWelcomeController *)self navigationController];
      CGRect v13 = [v12 navigationBar];
      [v13 bounds];
      double v15 = v14;

      double v16 = [(OBWelcomeController *)self navigationController];
      double v17 = [v16 navigationBar];
      LODWORD(v13) = [v17 isHidden];

      if (v13) {
        double v15 = 0.0;
      }
      uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v8 bounds];
      float v10 = -(v15 - v18 * 0.09);
      float v11 = 0.0;
    }
    double v2 = fmaxf(v10, v11);
  }
  else if (v4 == 4 || v4 == 1)
  {
    [(OBWelcomeController *)self _contentViewHeight];
    return v5 * 0.09;
  }
  return v2;
}

- (BOOL)_shouldDetachButtonTray
{
  [(OBWelcomeController *)self keyboardFrame];
  return !CGRectEqualToRect(v3, *MEMORY[0x1E4F1DB28]);
}

- (BOOL)shouldInlineButtonTray
{
  BOOL v3 = +[OBViewUtilities shouldUseAccessibilityLayout];
  int64_t v4 = [(OBWelcomeController *)self contentViewLayout];
  if ((unint64_t)(v4 - 2) >= 3)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    int64_t v6 = [(OBWelcomeController *)self headerView];
    [v6 frame];
    double MaxY = CGRectGetMaxY(v51);
    uint64_t v8 = [(OBWelcomeController *)self view];
    [v8 bounds];
    double v9 = CGRectGetMaxY(v52);
    float v10 = [(OBWelcomeController *)self buttonTray];
    [v10 frame];
    BOOL v5 = MaxY >= v9 - CGRectGetHeight(v53);
  }
  else
  {
    BOOL v5 = [(OBWelcomeController *)self contentViewUnderButtonTray];
  }
  if (v3 && v5) {
    return 1;
  }
LABEL_6:
  if ([(OBWelcomeController *)self _shouldInlineButtontray]) {
    return 1;
  }
  if ([(OBWelcomeController *)self shouldAdjustButtonTrayForKeyboard]
    && [(OBWelcomeController *)self _shouldDetachButtonTray]
    && ([(OBWelcomeController *)self buttonTray],
        double v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isHidden],
        v12,
        (v13 & 1) == 0))
  {
    double v14 = [(OBWelcomeController *)self buttonTray];
    [v14 frame];
    CGFloat v16 = v15;
    double v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    if ([(OBWelcomeController *)self _shouldDetachButtonTray])
    {
      long long v23 = [(OBWelcomeController *)self buttonTray];
      [v23 detachedSize];
      CGFloat v20 = v24;
      double v25 = [(OBWelcomeController *)self buttonTray];
      [v25 detachedSize];
      CGFloat v22 = v26;
      CGFloat v16 = 0.0;

      CGFloat rect = 0.0;
    }
    else
    {
      CGFloat rect = v18;
    }
    v27 = [(OBWelcomeController *)self view];
    v28 = [(OBWelcomeController *)self headerView];
    [v28 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(OBWelcomeController *)self headerView];
    objc_msgSend(v27, "convertRect:fromView:", v37, v30, v32, v34, v36);
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;

    [(OBWelcomeController *)self keyboardFrame];
    double MinY = CGRectGetMinY(v54);
    v55.origin.double x = v16;
    v55.origin.double y = rect;
    v55.size.double width = v20;
    v55.size.double height = v22;
    CGFloat v47 = MinY - CGRectGetHeight(v55);
    v56.origin.double x = v39;
    v56.origin.double y = v41;
    v56.size.double width = v43;
    v56.size.double height = v45;
    double v48 = CGRectGetMaxY(v56);
    v57.origin.double x = v16;
    v57.origin.double y = v47;
    v57.size.double width = v20;
    v57.size.double height = v22;
    return v48 > CGRectGetMinY(v57);
  }
  else
  {
    return [(OBWelcomeController *)self _shouldDetachButtonTray];
  }
}

- (BOOL)_scrollViewContentIsUnderTray
{
  BOOL v3 = [(OBWelcomeController *)self scrollView];
  int64_t v4 = [(OBWelcomeController *)self buttonTray];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  char v13 = [(OBWelcomeController *)self buttonTray];
  objc_msgSend(v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  CGFloat v22 = [(OBWelcomeController *)self scrollView];
  [v22 contentSize];
  double v24 = v23;
  v26.origin.double x = v15;
  v26.origin.double y = v17;
  v26.size.double width = v19;
  v26.size.double height = v21;
  LOBYTE(v3) = v24 > CGRectGetMinY(v26);

  return (char)v3;
}

- (void)_updateButtonTrayBackdrop
{
  if ([(OBWelcomeController *)self shouldInlineButtonTray])
  {
    BOOL v3 = [(OBWelcomeController *)self buttonTray];
    id v6 = v3;
  }
  else
  {
    BOOL v4 = [(OBWelcomeController *)self _scrollViewContentIsUnderTray];
    BOOL v3 = [(OBWelcomeController *)self buttonTray];
    id v6 = v3;
    if (v4)
    {
      uint64_t v5 = 2;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 1;
LABEL_6:
  [v3 setBackdropStyle:v5];
}

- (void)_updateScrollContentViewLayoutMargins
{
  BOOL v3 = [(OBWelcomeController *)self scrollContentView];
  [v3 directionalLayoutMargins];
  double v5 = v4;

  BOOL v6 = [(OBWelcomeController *)self _landscapeiPhone];
  double v7 = [(OBWelcomeController *)self view];
  [v7 directionalLayoutMargins];
  double v9 = v8;
  if (v6)
  {
    double v10 = [(OBWelcomeController *)self view];
    [v10 safeAreaInsets];
    double v9 = v9 - v11;

    double v12 = [(OBWelcomeController *)self view];
    [v12 directionalLayoutMargins];
    double v14 = v13;
    CGFloat v15 = [(OBWelcomeController *)self view];
    [v15 safeAreaInsets];
    double v17 = v14 - v16;
  }
  else
  {

    double v12 = [(OBWelcomeController *)self view];
    [v12 directionalLayoutMargins];
    double v17 = v18;
  }

  double v19 = 0.0;
  if (![(OBWelcomeController *)self shouldInlineButtonTray])
  {
    double v20 = [(OBWelcomeController *)self buttonTray];
    [v20 frame];
    double v19 = v21;
  }
  id v22 = [(OBWelcomeController *)self scrollContentView];
  objc_msgSend(v22, "setDirectionalLayoutMargins:", v5, v9, v19, v17);
}

- (void)_updateScrollViewInsets
{
  BOOL v3 = [(OBWelcomeController *)self scrollView];

  if (!v3) {
    return;
  }
  double v4 = [(OBWelcomeController *)self scrollView];
  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = [(OBWelcomeController *)self scrollView];
  [v11 verticalScrollIndicatorInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  BOOL v18 = [(OBWelcomeController *)self shouldAdjustScrollViewInsetForKeyboard];
  if ([(OBWelcomeController *)self shouldAdjustButtonTrayForKeyboard])
  {
    if (![(OBWelcomeController *)self _buttonTrayInlined])
    {
LABEL_8:
      double v23 = [(OBWelcomeController *)self buttonTray];
      if ([v23 hasContent])
      {
        double v24 = [(OBWelcomeController *)self buttonTray];
        [v24 frame];
        IsEmptdouble y = CGRectIsEmpty(v39);

        if (!IsEmpty)
        {
          double Height = 0.0;
          if ([(OBWelcomeController *)self _buttonTrayInlined]) {
            goto LABEL_16;
          }
          v27 = [(OBWelcomeController *)self _currentContainerView];
          v28 = [(OBWelcomeController *)self view];
          double v29 = [(OBWelcomeController *)self buttonTray];
          [v29 frame];
          objc_msgSend(v28, "convertPoint:toView:", v27);
          double v31 = v30;

          [v27 bounds];
          double Height = v32 - v31;
          goto LABEL_14;
        }
      }
      else
      {
      }
      v27 = [(OBWelcomeController *)self view];
      [v27 safeAreaInsets];
      double Height = v33;
LABEL_14:

      goto LABEL_16;
    }
  }
  else if (!v18)
  {
    goto LABEL_8;
  }
  [(OBWelcomeController *)self keyboardFrame];
  v41.origin.double x = v19;
  v41.origin.double y = v20;
  v41.size.double width = v21;
  v41.size.double height = v22;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v41)) {
    goto LABEL_8;
  }
  [(OBWelcomeController *)self keyboardFrame];
  double Height = CGRectGetHeight(v40);
LABEL_16:
  if ([(OBWelcomeController *)self _landscapeiPhone] && Height == 0.0)
  {
    double v34 = [(OBWelcomeController *)self view];
    [v34 safeAreaInsets];
    double Height = v35;
  }
  double v36 = [(OBWelcomeController *)self scrollView];
  objc_msgSend(v36, "setContentInset:", v6, v8, Height, v10);

  id v37 = [(OBWelcomeController *)self scrollView];
  objc_msgSend(v37, "setScrollIndicatorInsets:", v13, v15, Height, v17);
}

- (id)_currentContainerView
{
  BOOL v3 = [(OBWelcomeController *)self navigationController];
  double v4 = [v3 view];

  if (!v4)
  {
    double v5 = [(OBWelcomeController *)self parentViewController];
    double v4 = [v5 view];

    if (!v4)
    {
      double v4 = [(OBWelcomeController *)self view];
    }
  }
  return v4;
}

- (void)_inlineButtonTray
{
  v34[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  double v4 = [(OBWelcomeController *)self buttonTray];
  [v3 addSubview:v4];

  double v5 = [(OBWelcomeController *)self buttonTrayScrollContainerHeightConstraint];
  [v5 setActive:0];

  CGFloat v22 = (void *)MEMORY[0x1E4F28DC8];
  double v33 = [(OBWelcomeController *)self buttonTray];
  double v31 = [v33 topAnchor];
  double v32 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  double v30 = [v32 topAnchor];
  double v29 = [v31 constraintEqualToAnchor:v30 constant:0.0];
  v34[0] = v29;
  v28 = [(OBWelcomeController *)self buttonTray];
  CGRect v26 = [v28 bottomAnchor];
  v27 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  double v25 = [v27 bottomAnchor];
  double v24 = [v26 constraintEqualToAnchor:v25 constant:0.0];
  v34[1] = v24;
  double v23 = [(OBWelcomeController *)self buttonTray];
  CGFloat v20 = [v23 leadingAnchor];
  CGFloat v21 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  CGFloat v19 = [v21 leadingAnchor];
  BOOL v18 = [v20 constraintEqualToAnchor:v19 constant:0.0];
  v34[2] = v18;
  double v17 = [(OBWelcomeController *)self buttonTray];
  double v16 = [v17 trailingAnchor];
  double v6 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  double v7 = [v6 trailingAnchor];
  double v8 = [v16 constraintEqualToAnchor:v7];
  v34[3] = v8;
  double v9 = [(OBWelcomeController *)self buttonTray];
  double v10 = [v9 buttonLayoutGuide];
  double v11 = [v10 bottomAnchor];
  double v12 = [(OBWelcomeController *)self buttonTrayScrollContainerView];
  double v13 = [v12 bottomAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13];
  v34[4] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  [v22 activateConstraints:v15];
}

- (void)_floatButtonTray
{
  v41[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(OBWelcomeController *)self buttonTray];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v4 = [(OBWelcomeController *)self view];
  double v5 = [(OBWelcomeController *)self buttonTray];
  [v4 addSubview:v5];

  double v6 = [(OBWelcomeController *)self view];
  double v7 = [v6 bottomAnchor];

  if ([(OBWelcomeController *)self shouldAdjustButtonTrayForKeyboard]
    && ([(OBWelcomeController *)self keyboardFrame],
        v43.origin.double x = v8,
        v43.origin.double y = v9,
        v43.size.double width = v10,
        v43.size.double height = v11,
        !CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v43)))
  {
    CGFloat v20 = [(OBWelcomeController *)self buttonTray];
    CGFloat v21 = [v20 buttonLayoutGuide];
    CGFloat v22 = [v21 bottomAnchor];
    [(OBWelcomeController *)self keyboardFrame];
    uint64_t v19 = [v7 constraintEqualToAnchor:v22 constant:CGRectGetHeight(v42)];

    double v17 = [(OBWelcomeController *)self buttonTray];
    BOOL v18 = [v17 buttonLayoutGuide];
    uint64_t v16 = [v18 bottomAnchor];
  }
  else
  {
    double v12 = [(OBWelcomeController *)self tabBarController];

    if (v12)
    {
      double v13 = [(OBWelcomeController *)self view];
      double v14 = [v13 safeAreaLayoutGuide];
      uint64_t v15 = [v14 bottomAnchor];

      double v7 = (void *)v15;
    }
    uint64_t v16 = (uint64_t)v7;
    double v17 = [(OBWelcomeController *)self buttonTray];
    BOOL v18 = [v17 buttonLayoutGuide];
    double v7 = [v18 bottomAnchor];
    uint64_t v19 = [v7 constraintEqualToAnchor:v16];
  }
  double v33 = (void *)v19;
  double v36 = (void *)v16;

  double v35 = (void *)MEMORY[0x1E4F28DC8];
  CGRect v40 = [(OBWelcomeController *)self buttonTray];
  CGRect v39 = [v40 bottomAnchor];
  double v38 = [v39 constraintEqualToAnchor:v16 constant:0.0];
  v41[0] = v38;
  id v37 = [(OBWelcomeController *)self buttonTray];
  double v34 = [v37 leadingAnchor];
  double v23 = [(OBWelcomeController *)self view];
  double v24 = [v23 leadingAnchor];
  double v25 = [v34 constraintEqualToAnchor:v24 constant:0.0];
  v41[1] = v25;
  CGRect v26 = [(OBWelcomeController *)self buttonTray];
  v27 = [v26 trailingAnchor];
  v28 = [(OBWelcomeController *)self view];
  double v29 = [v28 trailingAnchor];
  double v30 = [v27 constraintEqualToAnchor:v29 constant:0.0];
  v41[2] = v30;
  v41[3] = v19;
  double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v35 activateConstraints:v31];

  double v32 = [(OBWelcomeController *)self buttonTrayScrollContainerHeightConstraint];
  [v32 setActive:1];
}

- (void)_layoutButtonTray
{
  v45[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(OBWelcomeController *)self buttonTray];
  [v3 removeFromSuperview];

  if ([(OBWelcomeController *)self shouldInlineButtonTray])
  {
    [(OBWelcomeController *)self _inlineButtonTray];
    double v4 = [(OBWelcomeController *)self buttonTray];
    double v5 = v4;
    BOOL v6 = 0;
  }
  else
  {
    [(OBWelcomeController *)self _floatButtonTray];
    BOOL v7 = [(OBWelcomeController *)self _shouldDetachButtonTray];
    double v4 = [(OBWelcomeController *)self buttonTray];
    double v5 = v4;
    BOOL v6 = v7;
  }
  [v4 setDetached:v6];

  CGFloat v8 = +[OBDevice currentDevice];
  if ([v8 type] != 2 && !-[OBWelcomeController _landscapeiPhone](self, "_landscapeiPhone"))
  {

    goto LABEL_11;
  }
  CGFloat v9 = +[OBDevice currentDevice];
  CGFloat v10 = [(OBWelcomeController *)self view];
  [v10 bounds];
  uint64_t v12 = [v9 templateTypeForBoundsWidth:v11];

  if (v12 == 7)
  {
LABEL_11:
    CGRect v39 = (void *)MEMORY[0x1E4F28DC8];
    CGRect v42 = [(OBWelcomeController *)self buttonTray];
    CGRect v40 = [v42 buttonLayoutGuide];
    id v37 = [v40 leadingAnchor];
    double v38 = [(OBWelcomeController *)self view];
    double v36 = [v38 layoutMarginsGuide];
    v27 = [v36 leadingAnchor];
    v28 = [v37 constraintEqualToAnchor:v27];
    v44[0] = v28;
    CGRect v43 = [(OBWelcomeController *)self buttonTray];
    double v29 = [v43 buttonLayoutGuide];
    double v30 = [v29 trailingAnchor];
    double v31 = [(OBWelcomeController *)self view];
    double v32 = [v31 layoutMarginsGuide];
    double v33 = [v32 trailingAnchor];
    double v34 = [v30 constraintEqualToAnchor:v33];
    v44[1] = v34;
    double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    [v39 activateConstraints:v35];

    CGRect v26 = v36;
    double v25 = v38;

    double v24 = v37;
    double v23 = v40;

    CGFloat v22 = v42;
    goto LABEL_12;
  }
  double v13 = [(OBWelcomeController *)self buttonTray];
  double v14 = [v13 buttonLayoutGuide];
  uint64_t v15 = [v14 widthConstraint];

  if (!v15)
  {
    uint64_t v16 = [(OBWelcomeController *)self buttonTray];
    double v17 = [v16 buttonLayoutGuide];
    BOOL v18 = [v17 widthAnchor];
    uint64_t v19 = [v18 constraintEqualToConstant:360.0];
    CGFloat v20 = [(OBWelcomeController *)self buttonTray];
    CGFloat v21 = [v20 buttonLayoutGuide];
    [v21 setWidthConstraint:v19];
  }
  CGRect v41 = (void *)MEMORY[0x1E4F28DC8];
  CGFloat v22 = [(OBWelcomeController *)self buttonTray];
  double v23 = [v22 buttonLayoutGuide];
  double v24 = [v23 widthConstraint];
  v45[0] = v24;
  double v25 = [(OBWelcomeController *)self buttonTray];
  CGRect v26 = [v25 buttonLayoutGuide];
  v27 = [v26 centerXAnchor];
  v28 = [(OBWelcomeController *)self view];
  CGRect v43 = [v28 centerXAnchor];
  double v29 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v45[1] = v29;
  double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v41 activateConstraints:v30];
LABEL_12:

  [(OBWelcomeController *)self _updateScrollViewInsets];
}

- (BOOL)_buttonTrayInlined
{
  double v2 = self;
  BOOL v3 = [(OBWelcomeController *)self buttonTray];
  double v4 = [v3 superview];
  double v5 = [(OBWelcomeController *)v2 buttonTrayScrollContainerView];
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)_inlineButtonTrayIfNeeded
{
  BOOL v3 = [(OBWelcomeController *)self shouldInlineButtonTray];
  if (v3 != [(OBWelcomeController *)self _buttonTrayInlined])
  {
    [(OBWelcomeController *)self _layoutButtonTray];
  }
}

- (void)updateDirectionalLayoutMargins
{
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  [(OBBaseWelcomeController *)&v3 updateDirectionalLayoutMargins];
  [(OBWelcomeController *)self _updateScrollContentViewLayoutMargins];
  [(OBWelcomeController *)self _updateScrollViewInsets];
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(OBWelcomeController *)self contentViewLayout] != 1)
  {
    if ([(OBWelcomeController *)self shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen])
    {
      double v5 = [(OBWelcomeController *)self navigationController];
      BOOL v6 = [v5 topViewController];
      int v7 = [v6 conformsToProtocol:&unk_1EEC4D598];

      if (v7)
      {
        CGFloat v8 = [(OBBaseWelcomeController *)self navigationItem];
        CGFloat v9 = [(OBWelcomeController *)self headerView];
        CGFloat v10 = [(OBWelcomeController *)self scrollView];
        BOOL v11 = +[OBViewUtilities shouldUpdateNavigationBarWithNavigationItem:v8 forHeaderView:v9 inScrollView:v10];

        if (v11 != [(OBWelcomeController *)self shouldShowHeaderCachedState])
        {
          [(OBWelcomeController *)self setShouldShowHeaderCachedState:v11];
          id v14 = [(OBBaseWelcomeController *)self navigationItem];
          uint64_t v12 = [(OBWelcomeController *)self headerView];
          double v13 = [(OBWelcomeController *)self scrollView];
          +[OBViewUtilities updateNavigationBarWithNavigationItem:v14 forHeaderView:v12 inScrollView:v13 animated:v3];
        }
      }
    }
  }
}

- (void)_enableTrayButtonsForScrollToBottom:(id)a3
{
  BOOL v4 = [(OBWelcomeController *)self _buttonTrayInlined];
  double v5 = [(OBWelcomeController *)self scrollView];
  [v5 contentOffset];
  unint64_t v7 = (unint64_t)v6;
  CGFloat v8 = [(OBWelcomeController *)self scrollView];
  [v8 frame];
  unint64_t v10 = (unint64_t)v9 + v7;

  BOOL v11 = [(OBWelcomeController *)self scrollView];
  [v11 contentSize];
  BOOL v13 = v10 >= (unint64_t)v12 - 1;

  if (!v4) {
    BOOL v13 = ![(OBWelcomeController *)self _scrollViewContentIsUnderTray];
  }
  if ([(OBWelcomeController *)self disableButtonsUntilAllContentWasVisable]
    && v13)
  {
    id v15 = [(OBWelcomeController *)self buttonTray];
    id v14 = [v15 buttons];
    [v14 enumerateObjectsUsingBlock:&__block_literal_global_89];
  }
}

void __59__OBWelcomeController__enableTrayButtonsForScrollToBottom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isEnabled] & 1) == 0) {
    [v2 setEnabled:1];
  }
}

- (void)_registerForKeyboardNotifications
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  id v12 = (id)*MEMORY[0x1E4FB2C58];
  BOOL v4 = [(OBWelcomeController *)self presentingViewController];
  if (v4)
  {
    double v5 = [(OBWelcomeController *)self presentingViewController];
    double v6 = [v5 presentedViewController];
    BOOL v7 = [v6 modalPresentationStyle] != 2;
  }
  else
  {
    BOOL v7 = 1;
  }

  CGFloat v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !v7)
  {
    id v10 = (id)*MEMORY[0x1E4FB2BC8];

    id v12 = v10;
  }
  BOOL v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__handleKeyboardPresentation_ name:v12 object:0];
}

- (void)_unregisterForKeyboardNotifications
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2BC8] object:0];
}

- (void)_keyboardWillHide:(id)a3
{
  [(OBWelcomeController *)self keyboardFrame];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v10.origin.double y = v5;
  v10.size.double width = v6;
  v10.size.double height = v7;
  if (!CGRectEqualToRect(v9, v10))
  {
    -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", v4, v5, v6, v7);
    [(OBWelcomeController *)self _layoutButtonTray];
    if ([(OBWelcomeController *)self shouldAdjustScrollViewInsetForKeyboard])
    {
      [(OBWelcomeController *)self _updateScrollViewInsets];
    }
  }
}

- (void)_handleKeyboardPresentation:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v13 != 0.0 && v11 != 0.0)
  {
    id v14 = [(OBWelcomeController *)self view];
    objc_msgSend(v14, "convertRect:fromView:", 0, v7, v9, v11, v13);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    double v23 = [(OBWelcomeController *)self view];
    [v23 frame];
    v36.origin.double x = v16;
    v36.origin.double y = v18;
    v36.size.double width = v20;
    v36.size.double height = v22;
    CGRect v34 = CGRectIntersection(v33, v36);
    double x = v34.origin.x;
    double y = v34.origin.y;
    double width = v34.size.width;
    double height = v34.size.height;

    [(OBWelcomeController *)self keyboardFrame];
    v37.origin.double x = v28;
    v37.origin.double y = v29;
    v37.size.double width = v30;
    v37.size.double height = v31;
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    if (!CGRectEqualToRect(v35, v37)) {
      -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", x, y, width, height);
    }
    if ([(OBWelcomeController *)self shouldAdjustButtonTrayForKeyboard]) {
      [(OBWelcomeController *)self _layoutButtonTray];
    }
    if ([(OBWelcomeController *)self shouldAdjustScrollViewInsetForKeyboard])
    {
      [(OBWelcomeController *)self _updateScrollViewInsets];
    }
  }
}

- (void)setTemplateType:(unint64_t)a3
{
  double v5 = [(OBWelcomeController *)self headerView];
  [v5 setTemplateType:a3];

  double v6 = [(OBWelcomeController *)self bulletedList];
  [v6 setTemplateType:a3];

  self->_templateType = a3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(OBWelcomeController *)self _updateButtonTrayBackdrop];
  [(OBWelcomeController *)self updateNavigationBarAnimated:1];
  [(OBWelcomeController *)self _enableTrayButtonsForScrollToBottom:v4];
}

- (void)restoreNavigationBarAppearance
{
  BOOL v3 = [(OBWelcomeController *)self retainedNavigationController];
  id v4 = [(OBWelcomeController *)self transitionCoordinator];
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    if ([v6 conformsToProtocol:&unk_1EEC4D598])
    {
      id v7 = v6;
      double v8 = [(OBWelcomeController *)self cachedBarState];
      [v7 setCurrentNavigationBarDisplayState:v8];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke;
    v13[3] = &unk_1E58AEC08;
    v13[4] = self;
    id v14 = v3;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke_2;
    v10[3] = &unk_1E58AEC08;
    id v11 = v14;
    double v12 = self;
    [v5 animateAlongsideTransition:v13 completion:v10];
  }
  else
  {
    double v6 = [(OBWelcomeController *)self cachedBarState];
    double v9 = [v3 navigationBar];
    [v6 applyState:v9];
  }
  [(OBWelcomeController *)self setRetainedNavigationController:0];
}

void __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cachedBarState];
  id v2 = [*(id *)(a1 + 40) navigationBar];
  [v3 applyState:v2];
}

void __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  int v4 = [a2 isCancelled];
  double v5 = *(void **)(a1 + 40);
  if (v4)
  {
    double v6 = [v5 navigationItem];
    char v7 = [v6 _backgroundHidden];
    if (v7)
    {
      double v8 = 0.0;
    }
    else
    {
      id v2 = [*(id *)(a1 + 40) cachedBarState];
      [v2 backgroundOpacity];
      double v8 = v10;
    }
    id v11 = [*(id *)(a1 + 32) navigationBar];
    [v11 _setBackgroundOpacity:v8];

    if ((v7 & 1) == 0) {
    id v15 = [*(id *)(a1 + 40) navigationItem];
    }
    double v9 = [v15 navigationBar];
    [v9 _titleOpacity];
    double v13 = v12;
    id v14 = [*(id *)(a1 + 32) navigationBar];
    [v14 _setTitleOpacity:v13];
  }
  else
  {
    id v15 = [v5 cachedBarState];
    double v9 = [*(id *)(a1 + 32) navigationBar];
    [v15 applyState:v9];
  }
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  BOOL v4 = [(OBWelcomeController *)self _buttonTrayInlined];
  [(OBWelcomeController *)self _inlineButtonTrayIfNeeded];
  [(OBWelcomeController *)self _updateButtonTrayBackdrop];
  if (v4 != [(OBWelcomeController *)self _buttonTrayInlined])
  {
    double v5 = [(OBWelcomeController *)self scrollView];
    [v5 setNeedsLayout];

    double v6 = [(OBWelcomeController *)self scrollView];
    [v6 layoutIfNeeded];
  }
  id v7 = [(OBWelcomeController *)self scrollView];
  [(OBWelcomeController *)self _enableTrayButtonsForScrollToBottom:v7];
}

- (BOOL)_landscapeiPhone
{
  id v3 = +[OBDevice currentDevice];
  if ([v3 type] == 1)
  {
    BOOL v4 = [(OBWelcomeController *)self view];
    BOOL v5 = (unint64_t)(+[OBViewUtilities activeInterfaceOrientationForView:v4]- 3) < 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (OBHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (OBContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)secondaryContentView
{
  return self->_secondaryContentView;
}

- (void)setSecondaryContentView:(id)a3
{
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIView)bleedView
{
  return self->_bleedView;
}

- (void)setBleedView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
}

- (UIView)buttonTrayScrollContainerView
{
  return self->_buttonTrayScrollContainerView;
}

- (void)setButtonTrayScrollContainerView:(id)a3
{
}

- (NSLayoutConstraint)buttonTrayScrollContainerHeightConstraint
{
  return self->_buttonTrayScrollContainerHeightConstraint;
}

- (void)setButtonTrayScrollContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)headerTopOffsetConstraint
{
  return self->_headerTopOffsetConstraint;
}

- (void)setHeaderTopOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopOffsetConstraint
{
  return self->_contentViewTopOffsetConstraint;
}

- (void)setContentViewTopOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryContentViewTopOffsetConstraint
{
  return self->_secondaryContentViewTopOffsetConstraint;
}

- (void)setSecondaryContentViewTopOffsetConstraint:(id)a3
{
}

- (OBBulletedList)bulletedList
{
  return self->_bulletedList;
}

- (void)setBulletedList:(id)a3
{
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (OBNavigationBarDisplayState)cachedBarState
{
  return self->_cachedBarState;
}

- (void)setCachedBarState:(id)a3
{
}

- (UINavigationController)retainedNavigationController
{
  return self->_retainedNavigationController;
}

- (void)setRetainedNavigationController:(id)a3
{
}

- (BOOL)_shouldInlineButtontray
{
  return self->__shouldInlineButtontray;
}

- (void)set_shouldInlineButtontray:(BOOL)a3
{
  self->__shouldInlineButtontradouble y = a3;
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (BOOL)shouldAdjustScrollViewInsetForKeyboard
{
  return self->_shouldAdjustScrollViewInsetForKeyboard;
}

- (void)setShouldAdjustScrollViewInsetForKeyboard:(BOOL)a3
{
  self->_shouldAdjustScrollViewInsetForKeyboard = a3;
}

- (BOOL)shouldAdjustButtonTrayForKeyboard
{
  return self->_shouldAdjustButtonTrayForKeyboard;
}

- (void)setShouldAdjustButtonTrayForKeyboard:(BOOL)a3
{
  self->_shouldAdjustButtonTrayForKeyboard = a3;
}

- (BOOL)disableButtonsUntilAllContentWasVisable
{
  return self->_disableButtonsUntilAllContentWasVisable;
}

- (void)setDisableButtonsUntilAllContentWasVisable:(BOOL)a3
{
  self->_disableButtonsUntilAllContentWasVisable = a3;
}

- (BOOL)shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen
{
  return self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen;
}

- (void)setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:(BOOL)a3
{
  self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen = a3;
}

- (BOOL)includePaddingAboveContentView
{
  return self->_includePaddingAboveContentView;
}

- (void)setIncludePaddingAboveContentView:(BOOL)a3
{
  self->_includePaddingAboveContentView = a3;
}

- (void)setAvailableContentViewHeight:(double)a3
{
  self->_availableContentViewdouble Height = a3;
}

- (BOOL)shouldShowHeaderCachedState
{
  return self->_shouldShowHeaderCachedState;
}

- (void)setShouldShowHeaderCachedState:(BOOL)a3
{
  self->_shouldShowHeaderCachedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedNavigationController, 0);
  objc_storeStrong((id *)&self->_cachedBarState, 0);
  objc_storeStrong((id *)&self->_bulletedList, 0);
  objc_storeStrong((id *)&self->_secondaryContentViewTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_headerTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerView, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_bleedView, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_secondaryContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

void __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 contentViewLayout];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_FAULT, "The contentLayoutType currently in use does not support landscape rotation layout:%li", (uint8_t *)&v4, 0xCu);
}

@end