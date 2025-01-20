@interface RCSplitViewController
- (BOOL)_canHandleCustomAction:(SEL)a3 withSender:(id)a4;
- (BOOL)_isPrimaryColumnVisible;
- (BOOL)_willSidebarExceedMaximumAllowedWidthForTotalViewWidth:(double)a3;
- (BOOL)areAllColumnsVisible;
- (BOOL)canDelete;
- (BOOL)canDuplicateRecording;
- (BOOL)canEditRecording;
- (BOOL)canHandleCancel;
- (BOOL)canHandleDone;
- (BOOL)canJumpBackward;
- (BOOL)canJumpForward;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPlayRecording;
- (BOOL)canRenameRecording;
- (BOOL)canShareRecording;
- (BOOL)canStartNewRecording;
- (BOOL)canToggleEnhance;
- (BOOL)canToggleFavorite;
- (BOOL)canToggleRemoveSilence;
- (BOOL)canToggleSidebar;
- (BOOL)canTrimRecording;
- (BOOL)isCollapsedAndShowingPrimary;
- (BOOL)isTransitioningBetweenVisibleColumnStates;
- (RCMainViewController)mainViewController;
- (RCSplitViewResizingDelegate)resizingDelegate;
- (double)_primaryColumnWidth;
- (double)_supplementaryColumnWidth;
- (double)_totalSidebarWidth;
- (double)_totalViewWidth;
- (int64_t)_displayModeForPrimaryColumnVisible;
- (void)_doRestyle;
- (void)_setPreferredSplitBehaviorForViewWidth:(double)a3 needsRestyle:(BOOL)a4;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)delete:(id)a3;
- (void)duplicateRecording:(id)a3;
- (void)editRecording:(id)a3;
- (void)handleCancel:(id)a3;
- (void)handleDone:(id)a3;
- (void)hidePrimaryColumnForEnteringEditModeIfNeeded;
- (void)hidePrimaryColumnIfNeeded;
- (void)jumpSelectionBackward:(id)a3;
- (void)jumpSelectionForward:(id)a3;
- (void)loadView;
- (void)playRecording:(id)a3;
- (void)registerAppIntentsInteractions;
- (void)renameRecording:(id)a3;
- (void)setIsTransitioningBetweenVisibleColumnStates:(BOOL)a3;
- (void)setMainViewController:(id)a3;
- (void)setResizingDelegate:(id)a3;
- (void)setViewController:(id)a3 forColumn:(int64_t)a4;
- (void)shareRecording:(id)a3;
- (void)showPrimaryColumnForExitingEditModeIfNeeded;
- (void)startNewRecording:(id)a3;
- (void)toggleEnhance:(id)a3;
- (void)toggleFavorite:(id)a3;
- (void)toggleRemoveSilence:(id)a3;
- (void)trimRecording:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RCSplitViewController

- (double)_totalViewWidth
{
  v2 = [(RCSplitViewController *)self view];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (void)registerAppIntentsInteractions
{
  v2 = self;
  sub_10001ECE4();
}

- (void)_setPreferredSplitBehaviorForViewWidth:(double)a3 needsRestyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v9 usesSplitBehavior])
  {
    unsigned int v7 = [(RCSplitViewController *)self _willSidebarExceedMaximumAllowedWidthForTotalViewWidth:a3];
    id v8 = (id)(([v9 supportsDisplaceSplitBehavior] & v7) != 0 ? 3 : 1);
    if ([(RCSplitViewController *)self preferredSplitBehavior] != v8)
    {
      [(RCSplitViewController *)self setPreferredSplitBehavior:v8];
      if (v4) {
        [(RCSplitViewController *)self _doRestyle];
      }
    }
  }
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)RCSplitViewController;
  [(RCSplitViewController *)&v7 loadView];
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCSplitViewController *)self setPrimaryBackgroundStyle:1];
  [v3 splitViewSeparatorWidth];
  *(float *)&double v4 = v4;
  [(RCSplitViewController *)self setGutterWidth:v4];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

  v6 = [(RCSplitViewController *)self traitCollection];
  [v3 setSplitViewHorizontalSizeClass:[v6 horizontalSizeClass]];

  [(RCSplitViewController *)self setPreferredDisplayMode:2];
  [(RCSplitViewController *)self _totalViewWidth];
  -[RCSplitViewController _setPreferredSplitBehaviorForViewWidth:needsRestyle:](self, "_setPreferredSplitBehaviorForViewWidth:needsRestyle:", 0);
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)RCSplitViewController;
  [(RCSplitViewController *)&v12 viewDidLoad];
  double v3 = self;
  v13[0] = v3;
  double v4 = self;
  v13[1] = v4;
  v5 = self;
  v13[2] = v5;
  v6 = self;
  v13[3] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v13 count:4];
  id v8 = [(RCSplitViewController *)self registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  v10 = [v9 splitViewSeparatorColor];
  v11 = [(RCSplitViewController *)self view];
  [v11 setBackgroundColor:v10];
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = OSLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10016E328(v7);
      }
    }
    id v8 = [(RCSplitViewController *)self viewControllerForColumn:1];
    if (![(RCSplitViewController *)self isCollapsed]) {
      goto LABEL_10;
    }
    id v9 = [(RCSplitViewController *)self viewControllers];
    v10 = [v9 firstObject];

    v11 = [v10 viewControllers];
    unsigned int v12 = [v11 containsObject:v8];

    if (v12)
    {
      id v16 = v6;
      id v13 = +[NSArray arrayWithObjects:&v16 count:1];
      [v8 setViewControllers:v13 animated:1];
    }
    else
    {
LABEL_10:
      id v13 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
      v15.receiver = self;
      v15.super_class = (Class)RCSplitViewController;
      [(RCSplitViewController *)&v15 setViewController:v13 forColumn:1];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)RCSplitViewController;
    [(RCSplitViewController *)&v14 setViewController:v6 forColumn:a4];
  }
}

- (void)setResizingDelegate:(id)a3
{
}

- (void)setMainViewController:(id)a3
{
}

- (void)setIsTransitioningBetweenVisibleColumnStates:(BOOL)a3
{
  self->_isTransitioningBetweenVisibleColumnStates = a3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RCSplitViewController;
  id v7 = a4;
  -[RCSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BA4E4;
  v8[3] = &unk_100223260;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RCSplitViewController;
  [(RCSplitViewController *)&v16 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  id v8 = [(RCSplitViewController *)self traitCollection];
  id v9 = [v8 horizontalSizeClass];

  id v10 = [v6 horizontalSizeClass];
  if (v9 != v10)
  {
    id v11 = v10;
    unsigned int v12 = [(RCSplitViewController *)self resizingDelegate];
    [v12 splitViewController:self willTransitionFromHorizontalSizeClass:v9 toHorizontalSizeClass:v11];
  }
  id v13 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v14 = [v13 setSplitViewHorizontalSizeClass:[v6 horizontalSizeClass]];

  if (v14)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BA650;
    v15[3] = &unk_100221960;
    v15[4] = self;
    [v7 animateAlongsideTransition:v15 completion:0];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  id v6 = [(RCSplitViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(RCSplitViewController *)self _doRestyle];
  }
}

- (void)_doRestyle
{
  double v3 = [(RCSplitViewController *)self resizingDelegate];
  [v3 handleRestyleRequest];

  [(RCSplitViewController *)self restyle];
}

- (BOOL)_canHandleCustomAction:(SEL)a3 withSender:(id)a4
{
  p_mainViewController = &self->_mainViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  LOBYTE(a3) = [WeakRetained canHandleCustomAction:a3 withSender:v6];

  return (char)a3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("startNewRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canStartNewRecording]) {
      goto LABEL_20;
    }
LABEL_23:
    BOOL v8 = 0;
    goto LABEL_24;
  }
  if ("duplicateRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canDuplicateRecording]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("editRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canEditRecording]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("trimRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canTrimRecording]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("toggleFavorite:" == a3 || "toggleEnhance:" == a3 || "toggleRemoveSilence:" == a3) {
    goto LABEL_20;
  }
  if ("renameRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canRenameRecording]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("playRecording:" == a3)
  {
    if ([(RCSplitViewController *)self canPlayRecording]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("jumpSelectionBackward:" == a3)
  {
    if ([(RCSplitViewController *)self canJumpBackward]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("jumpSelectionForward:" == a3)
  {
    if ([(RCSplitViewController *)self canJumpForward]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("delete:" == a3)
  {
    if ([(RCSplitViewController *)self canDelete]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("handleDone:" == a3)
  {
    if ([(RCSplitViewController *)self canHandleDone]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("handleCancel:" == a3)
  {
    if ([(RCSplitViewController *)self canHandleCancel]) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if ("shareRecording:" == a3)
  {
    if (![(RCSplitViewController *)self canShareRecording]) {
      goto LABEL_23;
    }
LABEL_20:
    unsigned __int8 v7 = [(RCSplitViewController *)self _canHandleCustomAction:a3 withSender:v6];
    goto LABEL_21;
  }
  if ("toggleSidebar:" != a3 || ![(RCSplitViewController *)self canToggleSidebar]) {
    goto LABEL_23;
  }
  v10.receiver = self;
  v10.super_class = (Class)RCSplitViewController;
  unsigned __int8 v7 = [(RCSplitViewController *)&v10 canPerformAction:a3 withSender:v6];
LABEL_21:
  BOOL v8 = v7;
LABEL_24:

  return v8;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ([v4 action] == "toggleFavorite:")
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    unsigned int v6 = [WeakRetained currentSelectionIsFavorite];

    [v4 setState:v6];
    if ([(RCSplitViewController *)self canToggleFavorite]) {
      goto LABEL_7;
    }
LABEL_6:
    [v4 setAttributes:1];
    goto LABEL_7;
  }
  if ([v4 action] == "toggleEnhance:")
  {
    id v7 = objc_loadWeakRetained((id *)&self->_mainViewController);
    unsigned int v8 = [v7 currentSelectionIsEnhanced];

    [v4 setState:v8];
    if ([(RCSplitViewController *)self canToggleEnhance]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([v4 action] == "toggleRemoveSilence:")
  {
    id v9 = objc_loadWeakRetained((id *)&self->_mainViewController);
    unsigned int v10 = [v9 currentSelectionHasSilenceRemoved];

    [v4 setState:v10];
    if ([(RCSplitViewController *)self canToggleRemoveSilence]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)RCSplitViewController;
  [(RCSplitViewController *)&v11 validateCommand:v4];
LABEL_7:
}

- (BOOL)canStartNewRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canStartNewRecording];

  return v3;
}

- (void)startNewRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained startNewRecordingAction];
}

- (BOOL)canPlayRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canPlayRecording];

  return v3;
}

- (void)playRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained playRecording];
}

- (BOOL)canDuplicateRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canDuplicateRecording];

  return v3;
}

- (void)duplicateRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained duplicateRecording];
}

- (BOOL)canRenameRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canRenameRecording];

  return v3;
}

- (void)renameRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained renameRecording];
}

- (BOOL)canEditRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canEditRecording];

  return v3;
}

- (void)editRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained editRecording];
}

- (BOOL)canTrimRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canTrimRecording];

  return v3;
}

- (void)trimRecording:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained trimRecording];
}

- (BOOL)canToggleFavorite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canToggleFavoriteRecording];

  return v3;
}

- (void)toggleFavorite:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained toggleFavoriteRecording];
}

- (BOOL)canToggleEnhance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canToggleEnhanceRecording];

  return v3;
}

- (void)toggleEnhance:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained toggleEnhanceRecording];
}

- (BOOL)canToggleRemoveSilence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canToggleRemoveSilence];

  return v3;
}

- (void)toggleRemoveSilence:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained toggleRemoveSilence];
}

- (BOOL)canDelete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canDelete];

  return v3;
}

- (void)delete:(id)a3
{
  p_mainViewController = &self->_mainViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  [WeakRetained delete:v4];
}

- (BOOL)canJumpForward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canJumpForward];

  return v3;
}

- (void)jumpSelectionForward:(id)a3
{
  if ([(RCSplitViewController *)self canJumpForward])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    [WeakRetained jumpSelectionForward];
  }
}

- (BOOL)canJumpBackward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canJumpBackward];

  return v3;
}

- (void)jumpSelectionBackward:(id)a3
{
  if ([(RCSplitViewController *)self canJumpBackward])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    [WeakRetained jumpSelectionBackward];
  }
}

- (BOOL)canShareRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canShareRecording];

  return v3;
}

- (void)shareRecording:(id)a3
{
  p_mainViewController = &self->_mainViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  [WeakRetained shareRecording:v4];
}

- (BOOL)canHandleDone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canHandleDone];

  return v3;
}

- (void)handleDone:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained handleDone];
}

- (BOOL)canHandleCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canHandleCancel];

  return v3;
}

- (void)handleCancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  [WeakRetained handleCancel];
}

- (BOOL)canToggleSidebar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  unsigned __int8 v3 = [WeakRetained canToggleSidebar];

  return v3;
}

- (BOOL)areAllColumnsVisible
{
  if ([(RCSplitViewController *)self isCollapsed]) {
    return 0;
  }

  return [(RCSplitViewController *)self _isPrimaryColumnVisible];
}

- (BOOL)isCollapsedAndShowingPrimary
{
  if (![(RCSplitViewController *)self isCollapsed]) {
    return 0;
  }
  BOOL v3 = 1;
  id v4 = [(RCSplitViewController *)self viewControllerForColumn:1];
  if ([v4 isViewLoaded])
  {
    id v5 = [v4 view];
    unsigned int v6 = [v5 window];
    BOOL v3 = v6 == 0;
  }
  return v3;
}

- (void)hidePrimaryColumnIfNeeded
{
  unsigned int v3 = [(RCSplitViewController *)self _isPrimaryColumnVisible];
  id v4 = [(RCSplitViewController *)self splitBehavior];
  if (v3 && v4 == (id)3)
  {
    [(RCSplitViewController *)self hideColumn:0];
  }
}

- (void)hidePrimaryColumnForEnteringEditModeIfNeeded
{
  if ([(RCSplitViewController *)self areAllColumnsVisible])
  {
    [(RCSplitViewController *)self hideColumn:0];
    self->_didHidePrimaryColumnForEditMode = 1;
  }
}

- (void)showPrimaryColumnForExitingEditModeIfNeeded
{
  if (self->_didHidePrimaryColumnForEditMode)
  {
    [(RCSplitViewController *)self showColumn:0];
    self->_didHidePrimaryColumnForEditMode = 0;
  }
}

- (BOOL)_willSidebarExceedMaximumAllowedWidthForTotalViewWidth:(double)a3
{
  [(RCSplitViewController *)self _totalSidebarWidth];
  if (a3 <= 0.0) {
    return 0;
  }
  double v5 = v4;
  unsigned int v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v6 minimumSecondaryColumnWidth];
  double v8 = v7;

  return a3 - v5 < v8;
}

- (BOOL)_isPrimaryColumnVisible
{
  id v3 = [(RCSplitViewController *)self displayMode];
  return v3 == (id)[(RCSplitViewController *)self _displayModeForPrimaryColumnVisible];
}

- (int64_t)_displayModeForPrimaryColumnVisible
{
  if ([(RCSplitViewController *)self splitBehavior] == (id)1) {
    return 4;
  }
  else {
    return 6;
  }
}

- (double)_totalSidebarWidth
{
  [(RCSplitViewController *)self _primaryColumnWidth];
  double v4 = v3;
  [(RCSplitViewController *)self _supplementaryColumnWidth];
  return v4 + v5;
}

- (double)_primaryColumnWidth
{
  double v3 = [(RCSplitViewController *)self viewControllerForColumn:0];
  double v4 = [v3 view];
  double v5 = [v4 window];
  if (v5) {
    unsigned int v6 = ![(RCSplitViewController *)self _isPrimaryColumnVisible];
  }
  else {
    unsigned int v6 = 1;
  }

  [(RCSplitViewController *)self primaryColumnWidth];
  if (v6)
  {
    [(RCSplitViewController *)self minimumPrimaryColumnWidth];
    double v9 = v8;
    [(RCSplitViewController *)self primaryColumnWidth];
    if (v9 < v10) {
      double v9 = v10;
    }
    [(RCSplitViewController *)self maximumPrimaryColumnWidth];
    if (v11 < v9) {
      double v9 = v11;
    }
  }
  else
  {
    double v9 = v7;
  }

  return v9;
}

- (double)_supplementaryColumnWidth
{
  double v3 = [(RCSplitViewController *)self viewControllerForColumn:1];
  double v4 = [v3 view];
  double v5 = [v4 window];

  [(RCSplitViewController *)self supplementaryColumnWidth];
  if (v5)
  {
    double v7 = v6;
  }
  else
  {
    [(RCSplitViewController *)self minimumSupplementaryColumnWidth];
    double v7 = v8;
    [(RCSplitViewController *)self supplementaryColumnWidth];
    if (v7 < v9) {
      double v7 = v9;
    }
    [(RCSplitViewController *)self maximumSupplementaryColumnWidth];
    if (v10 < v7) {
      double v7 = v10;
    }
  }

  return v7;
}

- (RCSplitViewResizingDelegate)resizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resizingDelegate);

  return (RCSplitViewResizingDelegate *)WeakRetained;
}

- (RCMainViewController)mainViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);

  return (RCMainViewController *)WeakRetained;
}

- (BOOL)isTransitioningBetweenVisibleColumnStates
{
  return self->_isTransitioningBetweenVisibleColumnStates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainViewController);

  objc_destroyWeak((id *)&self->_resizingDelegate);
}

@end