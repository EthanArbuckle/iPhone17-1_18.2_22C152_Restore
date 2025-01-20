@interface SBTopAffordanceViewController
+ (UIImageSymbolConfiguration)symbolConfiguration;
+ (id)imageForAction:(int64_t)a3 interfaceOrientation:(int64_t)a4;
+ (id)landscapeImageNameForAction:(int64_t)a3;
+ (id)portraitImageNameForAction:(int64_t)a3;
- (BOOL)_applicationIsInOrCanMoveToSplitViewFromLayoutRole:(int64_t)a3;
- (BOOL)_applicationSupportsAnyAffordanceActions;
- (BOOL)_applicationSupportsMedusa;
- (BOOL)_dismissIfNeededWithLocation:(CGPoint)a3 window:(id)a4;
- (BOOL)_layoutStatePrimaryApplicationSupportsMedusa;
- (BOOL)_multipleSwitcherControllersAvailable;
- (BOOL)autoHides;
- (BOOL)isExpanded;
- (BOOL)isHidden;
- (BOOL)isHighlighted;
- (BOOL)isLumaTrackingEnabled;
- (BOOL)shouldAutorotate;
- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4;
- (BSSpringAnimationSettings)styleSettings;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBTopAffordanceDotsView)dotsView;
- (SBTopAffordanceViewController)initWithDeviceApplicationSceneHandle:(id)a3;
- (SBTopAffordanceViewControllerDelegate)delegate;
- (UIAction)addToSetAction;
- (UIAction)closeAction;
- (UIAction)fullScreenAction;
- (UIAction)maximizationAction;
- (UIAction)moveToDisplayAction;
- (UIAction)primarySplitAction;
- (UIAction)removeFromSetAction;
- (UIAction)sideSplitAction;
- (UIAction)slideOverAction;
- (UIAction)splitViewAction;
- (UIMenu)menu;
- (UIMenu)splitViewMenu;
- (_UILumaTrackingBackdropView)lumaTrackingView;
- (double)_defaultCenterYOffset;
- (id)_localizedMenuTitleForKey:(id)a3;
- (id)_makeDotsView;
- (id)_makeLumaTrackingView;
- (id)_makePillBackgroundContainerView;
- (id)_makePillContentsView;
- (id)_switcherController;
- (void)_emitAnalyticsEventForMenuInteraction:(int64_t)a3;
- (void)_lockScreenUIDidLock:(id)a3;
- (void)_setLayoutStatePrimaryApplicationSupportsMedusa:(BOOL)a3;
- (void)_setMultipleSwitcherControllersAvailable:(BOOL)a3;
- (void)_setSystemPointerInteractionEnabled:(BOOL)a3;
- (void)_updateStyleForOverrideUserInterfaceStyle;
- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)loadView;
- (void)setAutoHides:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5;
- (void)setHighlighted:(BOOL)a3;
- (void)setLumaTrackingEnabled:(BOOL)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setStyleSettings:(id)a3;
- (void)topAffordanceDotsViewWillDismissMenu:(id)a3;
- (void)topAffordanceDotsViewWillPresentMenu:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4;
- (void)updateContextMenuWithLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 interfaceOrientation:(int64_t)a6 isZoomed:(BOOL)a7;
- (void)viewDidLoad;
@end

@implementation SBTopAffordanceViewController

+ (UIImageSymbolConfiguration)symbolConfiguration
{
  if (symbolConfiguration_once != -1) {
    dispatch_once(&symbolConfiguration_once, &__block_literal_global_372);
  }
  v2 = (void *)symbolConfiguration_symbolConfiguration;
  return (UIImageSymbolConfiguration *)v2;
}

void __52__SBTopAffordanceViewController_symbolConfiguration__block_invoke()
{
  v0 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438F8] weight:*MEMORY[0x1E4F43920]];
  id v3 = [v0 fontWithSize:14.0];

  uint64_t v1 = [MEMORY[0x1E4F42A98] configurationWithFont:v3];
  v2 = (void *)symbolConfiguration_symbolConfiguration;
  symbolConfiguration_symbolConfiguration = v1;
}

+ (id)imageForAction:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  v7 = [a1 symbolConfiguration];
  unint64_t v8 = a4 - 1;
  v9 = (void *)MEMORY[0x1E4F42A80];
  if (v8 >= 2) {
    [a1 landscapeImageNameForAction:a3];
  }
  else {
  v10 = [a1 portraitImageNameForAction:a3];
  }
  v11 = [v9 systemImageNamed:v10 withConfiguration:v7];

  v12 = [v11 imageWithRenderingMode:2];

  return v12;
}

+ (id)portraitImageNameForAction:(int64_t)a3
{
  id v3 = @"rectangle.portrait.inset.filled";
  switch(a3)
  {
    case 1:
      break;
    case 2:
      id v3 = @"rectangle.portrait.split.2x1";
      break;
    case 3:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.portrait.lefthalf.inset.filled";
      v6 = @"rectangle.portrait.righthalf.inset.filled";
      goto LABEL_9;
    case 4:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.portrait.righthalf.inset.filled";
      v6 = @"rectangle.portrait.lefthalf.inset.filled";
      goto LABEL_9;
    case 5:
    case 7:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.portrait.rightthird.inset.filled";
      v6 = @"rectangle.portrait.leftthird.inset.filled";
      goto LABEL_9;
    case 6:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.portrait.leftthird.inset.filled";
      v6 = @"rectangle.portrait.rightthird.inset.filled";
LABEL_9:
      if (v4 == 1) {
        v5 = v6;
      }
      id v3 = v5;
      break;
    case 9:
    case 10:
      id v3 = @"rectangle.inset.fill";
      break;
    case 11:
      id v3 = @"rectangle.center.inset.fill";
      break;
    case 12:
      id v3 = @"plus.rectangle.on.rectangle";
      break;
    case 13:
      id v3 = @"minus.rectangle";
      break;
    case 14:
    case 16:
      id v3 = @"ipad";
      break;
    case 15:
      id v3 = @"display";
      break;
    case 17:
      id v3 = @"xmark";
      break;
    default:
      id v3 = &stru_1F3084718;
      break;
  }
  return v3;
}

+ (id)landscapeImageNameForAction:(int64_t)a3
{
  id v3 = @"rectangle.inset.fill";
  switch(a3)
  {
    case 1:
    case 9:
    case 10:
      break;
    case 2:
      id v3 = @"rectangle.split.2x1";
      break;
    case 3:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.lefthalf.inset.fill";
      v6 = @"rectangle.righthalf.inset.fill";
      goto LABEL_8;
    case 4:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.righthalf.inset.fill";
      v6 = @"rectangle.lefthalf.inset.fill";
      goto LABEL_8;
    case 5:
    case 7:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.rightthird.inset.fill";
      v6 = @"rectangle.leftthird.inset.fill";
      goto LABEL_8;
    case 6:
      uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v5 = @"rectangle.leftthird.inset.fill";
      v6 = @"rectangle.rightthird.inset.fill";
LABEL_8:
      if (v4 == 1) {
        v5 = v6;
      }
      id v3 = v5;
      break;
    case 11:
      id v3 = @"rectangle.center.inset.fill";
      break;
    case 12:
      id v3 = @"plus.rectangle.on.rectangle";
      break;
    case 13:
      id v3 = @"minus.rectangle";
      break;
    case 14:
    case 16:
      id v3 = @"ipad.landscape";
      break;
    case 15:
      id v3 = @"display";
      break;
    case 17:
      id v3 = @"xmark";
      break;
    default:
      id v3 = &stru_1F3084718;
      break;
  }
  return v3;
}

- (SBTopAffordanceViewController)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBTopAffordanceViewController;
  v6 = [(SBTopAffordanceViewController *)&v15 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_highlighted = 0;
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    uint64_t v8 = [MEMORY[0x1E4F4F840] settingsWithMass:2.0 stiffness:400.0 damping:45.0];
    styleSettings = v7->_styleSettings;
    v7->_styleSettings = (BSSpringAnimationSettings *)v8;

    v10 = [SBAffordancePresenceController alloc];
    v11 = [(SBDeviceApplicationSceneHandle *)v7->_sceneHandle _windowScene];
    uint64_t v12 = [(SBAffordancePresenceController *)v10 initWithDelegate:v7 windowScene:v11];
    affordancePresenceController = v7->_affordancePresenceController;
    v7->_affordancePresenceController = (SBAffordancePresenceController *)v12;
  }
  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBTopAffordanceViewController;
  [(SBTopAffordanceViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = [_SBTopAffordanceView alloc];
  objc_super v4 = -[_SBTopAffordanceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_SBTopAffordanceView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBTopAffordanceViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBTopAffordanceViewController;
  [(SBTopAffordanceViewController *)&v28 viewDidLoad];
  id v3 = [(SBTopAffordanceViewController *)self view];
  objc_super v4 = [(SBTopAffordanceViewController *)self _makeLumaTrackingView];
  lumaTrackingView = self->_lumaTrackingView;
  self->_lumaTrackingView = v4;

  [v3 addSubview:self->_lumaTrackingView];
  v6 = [(SBTopAffordanceViewController *)self _makeDotsView];
  dotsView = self->_dotsView;
  self->_dotsView = v6;

  [v3 addSubview:self->_dotsView];
  v26 = [(SBTopAffordanceDotsView *)self->_dotsView centerXAnchor];
  v27 = v3;
  v25 = [v3 centerXAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(SBTopAffordanceDotsView *)self->_dotsView centerYAnchor];
  v22 = [v3 topAnchor];
  [(SBTopAffordanceViewController *)self _defaultCenterYOffset];
  v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22);
  v29[1] = v21;
  v20 = [(_UILumaTrackingBackdropView *)self->_lumaTrackingView centerXAnchor];
  v19 = [(SBTopAffordanceDotsView *)self->_dotsView centerXAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v29[2] = v18;
  uint64_t v8 = [(_UILumaTrackingBackdropView *)self->_lumaTrackingView topAnchor];
  v9 = [(SBTopAffordanceDotsView *)self->_dotsView topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v29[3] = v10;
  v11 = [(_UILumaTrackingBackdropView *)self->_lumaTrackingView widthAnchor];
  uint64_t v12 = [v11 constraintEqualToConstant:32.0];
  v29[4] = v12;
  v13 = [(_UILumaTrackingBackdropView *)self->_lumaTrackingView heightAnchor];
  v14 = [v13 constraintEqualToConstant:32.0];
  v29[5] = v14;
  objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
  [v27 addConstraints:v15];

  int64_t v16 = [(SBAffordancePresenceController *)self->_affordancePresenceController currentPresence];
  double v17 = 0.0;
  if (!v16) {
    double v17 = 1.0;
  }
  [(SBTopAffordanceDotsView *)self->_dotsView setAlpha:v17];
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTopAffordanceViewController;
  [(SBTopAffordanceViewController *)&v4 setOverrideUserInterfaceStyle:a3];
  [(SBTopAffordanceViewController *)self _updateStyleForOverrideUserInterfaceStyle];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    styleSettings = self->_styleSettings;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__SBTopAffordanceViewController_setHighlighted___block_invoke;
    v4[3] = &unk_1E6AF5D38;
    v4[4] = self;
    BOOL v5 = a3;
    [MEMORY[0x1E4F4F898] animateWithSettings:styleSettings actions:v4];
  }
}

uint64_t __48__SBTopAffordanceViewController_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isExpanded
{
  v2 = [(SBTopAffordanceViewController *)self dotsView];
  char v3 = [v2 isHeld];

  return v3;
}

- (void)dismissAnimated:(BOOL)a3
{
  if ([(SBTopAffordanceViewController *)self isExpanded])
  {
    id v5 = [(SBTopAffordanceViewController *)self dotsView];
    objc_super v4 = [v5 contextMenuInteraction];
    [v4 dismissMenu];
  }
}

- (BOOL)isLumaTrackingEnabled
{
  return [(_UILumaTrackingBackdropView *)self->_lumaTrackingView isPaused] ^ 1;
}

- (void)setLumaTrackingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UILumaTrackingBackdropView *)self->_lumaTrackingView isPaused] == a3)
  {
    lumaTrackingView = self->_lumaTrackingView;
    if (v3)
    {
      id v7 = [(SBTopAffordanceViewController *)self traitCollection];
      if ([v7 userInterfaceStyle] == 2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      [(_UILumaTrackingBackdropView *)lumaTrackingView unpauseAfterSeedingWithLumaLevel:v6];
    }
    else
    {
      [(_UILumaTrackingBackdropView *)lumaTrackingView setPaused:1];
    }
  }
}

- (BOOL)_dismissIfNeededWithLocation:(CGPoint)a3 window:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![(SBTopAffordanceViewController *)self isExpanded]) {
    goto LABEL_3;
  }
  uint64_t v8 = [(SBTopAffordanceViewController *)self view];
  v9 = [v7 screen];
  v10 = [v9 fixedCoordinateSpace];

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10);
  v11 = objc_msgSend(v8, "hitTest:withEvent:", 0);

  if (!v11)
  {
    v14 = SBLogTopAffordance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v15 = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Top affordance dismiss upon screen tap", v15, 2u);
    }

    BOOL v12 = 1;
    [(SBTopAffordanceViewController *)self dismissAnimated:1];
    [(SBTopAffordanceViewController *)self _emitAnalyticsEventForMenuInteraction:18];
  }
  else
  {
LABEL_3:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  v11 = [v5 window];
  BOOL v12 = [v5 view];
  objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
  double v14 = v13;
  double v16 = v15;

  double v17 = [v5 window];

  LOBYTE(self) = -[SBTopAffordanceViewController _dismissIfNeededWithLocation:window:](self, "_dismissIfNeededWithLocation:window:", v17, v14, v16);
  return (char)self;
}

- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v6 view];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v7 window];
  double v14 = [v6 view];

  objc_msgSend(v13, "convertPoint:fromView:", v14, v10, v12);
  double v16 = v15;
  double v18 = v17;

  id v19 = [v7 window];

  -[SBTopAffordanceViewController _dismissIfNeededWithLocation:window:](self, "_dismissIfNeededWithLocation:window:", v19, v16, v18);
}

- (void)setAutoHides:(BOOL)a3
{
  self->_autoHides = a3;
  -[SBAffordancePresenceController setAutoHideAffordance:](self->_affordancePresenceController, "setAutoHideAffordance:");
}

- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4
{
  dotsView = self->_dotsView;
  double v5 = 0.0;
  if (!a4) {
    double v5 = 1.0;
  }
  -[SBTopAffordanceDotsView setAlpha:](dotsView, "setAlpha:", a3, v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBTopAffordanceViewController;
  id v4 = a3;
  [(SBTopAffordanceViewController *)&v8 traitCollectionDidChange:v4];
  double v5 = [(SBTopAffordanceViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(SBTopAffordanceViewController *)self _updateStyleForOverrideUserInterfaceStyle];
  }
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  if (a4 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(SBTopAffordanceViewController *)self setOverrideUserInterfaceStyle:v4];
}

- (void)_lockScreenUIDidLock:(id)a3
{
}

- (BOOL)_applicationSupportsAnyAffordanceActions
{
  BOOL v3 = [(SBTopAffordanceViewController *)self _switcherController];
  uint64_t v4 = [v3 windowManagementStyle];

  BOOL v5 = [(SBTopAffordanceViewController *)self _applicationSupportsMedusa];
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || v4 == 2) {
    return 1;
  }
  return [(SBTopAffordanceViewController *)self _multipleSwitcherControllersAvailable];
}

- (BOOL)_applicationSupportsMedusa
{
  v2 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  char v3 = [v2 isMedusaCapable];

  return v3;
}

- (BOOL)_layoutStatePrimaryApplicationSupportsMedusa
{
  if (self->_override_layoutStatePrimaryApplicationSupportsMedusa) {
    return 1;
  }
  char v3 = [(SBTopAffordanceViewController *)self _switcherController];
  uint64_t v4 = [v3 layoutState];

  BOOL v5 = [v4 elementWithRole:1];
  BOOL v6 = [v5 workspaceEntity];
  uint64_t v7 = [v6 applicationSceneEntity];

  objc_super v8 = [v7 application];
  LOBYTE(v6) = [v8 isMedusaCapable];

  return (char)v6;
}

- (BOOL)_applicationIsInOrCanMoveToSplitViewFromLayoutRole:(int64_t)a3
{
  BOOL v5 = [(SBTopAffordanceViewController *)self _applicationSupportsMedusa];
  BOOL v7 = a3 == 3 || a3 == 4 || a3 == 1;
  BOOL v8 = !v7 && v5;
  if (!v7 || !v5) {
    return v8;
  }
  return [(SBTopAffordanceViewController *)self _layoutStatePrimaryApplicationSupportsMedusa];
}

- (double)_defaultCenterYOffset
{
  [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  return v2 * 0.5;
}

- (void)_emitAnalyticsEventForMenuInteraction:(int64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4FA76B8];
  uint64_t v4 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  BOOL v5 = [v4 bundleIdentifier];
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E4FA76C0];
  BOOL v6 = [NSNumber numberWithInteger:a3];
  v12[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  BOOL v8 = (void *)MEMORY[0x1E4FA5E78];
  id v9 = v7;
  double v10 = [v8 sharedInstance];
  [v10 emitEvent:52 withPayload:v9];
}

- (id)_makeLumaTrackingView
{
  id v3 = objc_alloc(MEMORY[0x1E4F43240]);
  uint64_t v4 = objc_msgSend(v3, "initWithTransitionBoundaries:delegate:frame:", self, 0.4, 0.5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v4;
}

- (id)_makeDotsView
{
  id v3 = [SBTopAffordanceDotsView alloc];
  uint64_t v4 = -[SBTopAffordanceDotsView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  BOOL v5 = +[SBMedusaDomain rootSettings];
  [v5 topAffordanceHitTestExtendTop];
  double v7 = -v6;
  [v5 topAffordanceHitTestExtendLeft];
  double v9 = -v8;
  [v5 topAffordanceHitTestExtendBottom];
  double v11 = -v10;
  [v5 topAffordanceHitTestExtendRight];
  -[SBTopAffordanceDotsView setHitTestEdgeInsets:](v4, "setHitTestEdgeInsets:", v7, v9, v11, -v12);
  double v13 = NSString;
  double v14 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  double v15 = [v14 bundleIdentifier];
  double v16 = [v13 stringWithFormat:@"top-affordance:%@", v15];
  [(SBTopAffordanceDotsView *)v4 setAccessibilityIdentifier:v16];

  [(SBTopAffordanceDotsView *)v4 setHidden:[(SBTopAffordanceViewController *)self _applicationSupportsAnyAffordanceActions] ^ 1];
  [(SBTopAffordanceDotsView *)v4 setShowsMenuAsPrimaryAction:1];
  [(SBTopAffordanceDotsView *)v4 setMenu:self->_menu];

  return v4;
}

- (id)_makePillBackgroundContainerView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (id)_makePillContentsView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (void)updateContextMenuWithLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 interfaceOrientation:(int64_t)a6 isZoomed:(BOOL)a7
{
  BOOL v7 = a7;
  v136[2] = *MEMORY[0x1E4F143B8];
  double v11 = [(SBTopAffordanceViewController *)self _switcherController];
  uint64_t v113 = [v11 windowManagementStyle];

  BOOL v107 = [(SBTopAffordanceViewController *)self _applicationSupportsMedusa];
  objc_initWeak(&location, self);
  if (v113 == 2)
  {
    if (v7) {
      uint64_t v12 = 11;
    }
    else {
      uint64_t v12 = 10;
    }
    double v13 = +[SBTopAffordanceViewController imageForAction:v12 interfaceOrientation:a6];
    double v14 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_MAXIMIZATION_ZOOM"];
    maximizationAction = self->_maximizationAction;
    if (maximizationAction)
    {
      [(UIAction *)maximizationAction setTitle:v14];
      [(UIAction *)self->_maximizationAction setImage:v13];
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F426E8];
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke;
      v133[3] = &unk_1E6AF9818;
      objc_copyWeak(&v134, &location);
      v25 = [v24 actionWithTitle:v14 image:v13 identifier:@"top-affordance-toggle-maximization-button" handler:v133];
      v26 = self->_maximizationAction;
      self->_maximizationAction = v25;

      [(UIAction *)self->_maximizationAction setAccessibilityIdentifier:@"top-affordance-toggle-maximization-button"];
      objc_destroyWeak(&v134);
    }
    if (!self->_addToSetAction)
    {
      v27 = (void *)MEMORY[0x1E4F426E8];
      objc_super v28 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_ADD_TO_SET"];
      v29 = +[SBTopAffordanceViewController imageForAction:12 interfaceOrientation:a6];
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_2;
      v131[3] = &unk_1E6AF9818;
      objc_copyWeak(&v132, &location);
      v30 = [v27 actionWithTitle:v28 image:v29 identifier:@"top-affordance-add-to-set-button" handler:v131];
      addToSetAction = self->_addToSetAction;
      self->_addToSetAction = v30;

      [(UIAction *)self->_addToSetAction setAccessibilityIdentifier:@"top-affordance-add-to-set-button"];
      objc_destroyWeak(&v132);
    }
    if (!self->_removeFromSetAction)
    {
      v32 = (void *)MEMORY[0x1E4F426E8];
      v33 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_REMOVE_FROM_SET"];
      v34 = +[SBTopAffordanceViewController imageForAction:13 interfaceOrientation:a6];
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_3;
      v129[3] = &unk_1E6AF9818;
      objc_copyWeak(&v130, &location);
      v35 = [v32 actionWithTitle:v33 image:v34 identifier:@"top-affordance-remove-from-set-button" handler:v129];
      removeFromSetAction = self->_removeFromSetAction;
      self->_removeFromSetAction = v35;

      [(UIAction *)self->_removeFromSetAction setAccessibilityIdentifier:@"top-affordance-remove-from-set-button"];
      objc_destroyWeak(&v130);
    }
  }
  else
  {
    double v16 = +[SBTopAffordanceViewController imageForAction:1 interfaceOrientation:a6];
    fullScreenAction = self->_fullScreenAction;
    if (fullScreenAction)
    {
      [(UIAction *)fullScreenAction setImage:v16];
    }
    else
    {
      double v18 = (void *)MEMORY[0x1E4F426E8];
      id v19 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_FULL_SCREEN"];
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_4;
      v127[3] = &unk_1E6AF9818;
      objc_copyWeak(&v128, &location);
      v20 = [v18 actionWithTitle:v19 image:v16 identifier:@"top-affordance-full-screen-button" handler:v127];
      v21 = self->_fullScreenAction;
      self->_fullScreenAction = v20;

      [(UIAction *)self->_fullScreenAction setAccessibilityIdentifier:@"top-affordance-full-screen-button"];
      objc_destroyWeak(&v128);
    }
    v22 = +[SBTopAffordanceViewController imageForAction:2 interfaceOrientation:a6];

    splitViewAction = self->_splitViewAction;
    if (splitViewAction)
    {
      [(UIAction *)splitViewAction setImage:v22];
    }
    else
    {
      v37 = (void *)MEMORY[0x1E4F426E8];
      v38 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_SPLIT_VIEW"];
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_5;
      v125[3] = &unk_1E6AF9818;
      objc_copyWeak(&v126, &location);
      v39 = [v37 actionWithTitle:v38 image:v22 identifier:@"top-affordance-split-view-button" handler:v125];
      v40 = self->_splitViewAction;
      self->_splitViewAction = v39;

      [(UIAction *)self->_splitViewAction setAccessibilityIdentifier:@"top-affordance-split-view-button"];
      objc_destroyWeak(&v126);
    }
    if (a3 != 1 || a4 <= 1) {
      uint64_t v42 = 7;
    }
    else {
      uint64_t v42 = 6;
    }
    if (a3 == 2) {
      uint64_t v42 = 7;
    }
    if (a3 == 3 && (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      uint64_t v44 = 6;
    }
    else {
      uint64_t v44 = v42;
    }
    v45 = +[SBTopAffordanceViewController imageForAction:v44 interfaceOrientation:a6];

    slideOverAction = self->_slideOverAction;
    if (slideOverAction)
    {
      [(UIAction *)slideOverAction setImage:v45];
    }
    else
    {
      v47 = (void *)MEMORY[0x1E4F426E8];
      v48 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_SLIDE_OVER"];
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_6;
      v123[3] = &unk_1E6AF9818;
      objc_copyWeak(&v124, &location);
      v49 = [v47 actionWithTitle:v48 image:v45 identifier:@"top-affordance-slide-over-button" handler:v123];
      v50 = self->_slideOverAction;
      self->_slideOverAction = v49;

      [(UIAction *)self->_slideOverAction setAccessibilityIdentifier:@"top-affordance-slide-over-button"];
      objc_destroyWeak(&v124);
    }
    v51 = +[SBTopAffordanceViewController imageForAction:3 interfaceOrientation:a6];

    primarySplitAction = self->_primarySplitAction;
    if (primarySplitAction)
    {
      [(UIAction *)primarySplitAction setImage:v51];
    }
    else
    {
      v53 = (void *)MEMORY[0x1E4F426E8];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        v54 = @"TOP_AFFORDANCE_MENU_TITLE_RIGHT_SPLIT";
      }
      else {
        v54 = @"TOP_AFFORDANCE_MENU_TITLE_LEFT_SPLIT";
      }
      v55 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:v54];
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_7;
      v121[3] = &unk_1E6AF9818;
      objc_copyWeak(&v122, &location);
      v56 = [v53 actionWithTitle:v55 image:v51 identifier:@"top-affordance-split-view-left-button" handler:v121];
      v57 = self->_primarySplitAction;
      self->_primarySplitAction = v56;

      [(UIAction *)self->_primarySplitAction setAccessibilityIdentifier:@"top-affordance-split-view-left-button"];
      objc_destroyWeak(&v122);
    }
    double v13 = +[SBTopAffordanceViewController imageForAction:4 interfaceOrientation:a6];

    sideSplitAction = self->_sideSplitAction;
    if (sideSplitAction)
    {
      [(UIAction *)sideSplitAction setImage:v13];
    }
    else
    {
      v59 = (void *)MEMORY[0x1E4F426E8];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        v60 = @"TOP_AFFORDANCE_MENU_TITLE_LEFT_SPLIT";
      }
      else {
        v60 = @"TOP_AFFORDANCE_MENU_TITLE_RIGHT_SPLIT";
      }
      v61 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:v60];
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_8;
      v119[3] = &unk_1E6AF9818;
      objc_copyWeak(&v120, &location);
      v62 = [v59 actionWithTitle:v61 image:v13 identifier:@"top-affordance-split-view-right-button" handler:v119];
      v63 = self->_sideSplitAction;
      self->_sideSplitAction = v62;

      [(UIAction *)self->_sideSplitAction setAccessibilityIdentifier:@"top-affordance-split-view-right-button"];
      objc_destroyWeak(&v120);
    }
    v64 = (void *)MEMORY[0x1E4F42B80];
    v65 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_SPLIT_VIEW"];
    v66 = +[SBTopAffordanceViewController imageForAction:2 interfaceOrientation:a6];
    v67 = self->_sideSplitAction;
    v136[0] = self->_primarySplitAction;
    v136[1] = v67;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
    v69 = [v64 menuWithTitle:v65 image:v66 identifier:@"top-affordance-split-view-sub-menu" options:32 children:v68];
    splitViewMenu = self->_splitViewMenu;
    self->_splitViewMenu = v69;

    [(UIMenu *)self->_splitViewMenu setAccessibilityIdentifier:@"top-affordance-split-view-sub-menu"];
    [(UIMenu *)self->_splitViewMenu setPreferredElementSize:1];
    [(UIMenu *)self->_splitViewMenu _sb_setSurfacesSelectionState:1];
  }
  uint64_t v71 = 1064;
  if (!self->_closeAction)
  {
    v72 = (void *)MEMORY[0x1E4F426E8];
    v73 = [(SBTopAffordanceViewController *)self _localizedMenuTitleForKey:@"TOP_AFFORDANCE_MENU_TITLE_CLOSE"];
    v74 = +[SBTopAffordanceViewController imageForAction:17 interfaceOrientation:a6];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_9;
    v117[3] = &unk_1E6AF9818;
    objc_copyWeak(&v118, &location);
    v75 = [v72 actionWithTitle:v73 image:v74 identifier:@"top-affordance-close-window" handler:v117];
    closeAction = self->_closeAction;
    self->_closeAction = v75;

    [(UIAction *)self->_closeAction setAccessibilityIdentifier:@"top-affordance-close-window"];
    [(UIAction *)self->_closeAction setAttributes:2];
    objc_destroyWeak(&v118);
  }
  v77 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _windowScene];
  int v78 = [v77 isMainDisplayWindowScene];

  if (v78) {
    uint64_t v79 = 15;
  }
  else {
    uint64_t v79 = 16;
  }
  v80 = +[SBTopAffordanceViewController imageForAction:v79 interfaceOrientation:a6];

  v81 = @"TOP_AFFORDANCE_MENU_TITLE_MOVE_TO_MAIN_DISPLAY";
  if (v78) {
    v81 = @"TOP_AFFORDANCE_MENU_TITLE_MOVE_TO_EXTERNAL_DISPLAY";
  }
  v110 = v81;
  v112 = -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:");
  moveToDisplayAction = self->_moveToDisplayAction;
  if (moveToDisplayAction)
  {
    [(UIAction *)moveToDisplayAction setTitle:v112];
    [(UIAction *)self->_moveToDisplayAction setImage:v80];
  }
  else
  {
    v83 = (void *)MEMORY[0x1E4F426E8];
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_10;
    v115[3] = &unk_1E6AF9818;
    objc_copyWeak(&v116, &location);
    v84 = [v83 actionWithTitle:v112 image:v80 identifier:@"top-affordance-move-to-other-display-button" handler:v115];
    v85 = self->_moveToDisplayAction;
    self->_moveToDisplayAction = v84;

    [(UIAction *)self->_moveToDisplayAction setAccessibilityIdentifier:@"top-affordance-move-to-other-display-button"];
    objc_destroyWeak(&v116);
  }
  v86 = [MEMORY[0x1E4F1CA48] array];
  v87 = v86;
  if (v113 == 2)
  {
    [v86 addObject:self->_maximizationAction];
    [v87 addObject:self->_addToSetAction];
    [v87 addObject:self->_removeFromSetAction];
    goto LABEL_87;
  }
  BOOL v88 = [(SBTopAffordanceViewController *)self _applicationSupportsMedusa];
  if (v113 == 1 && v88)
  {
    v90 = [MEMORY[0x1E4F1CA48] array];
    p_fullScreenAction = &self->_fullScreenAction;
    [v90 addObject:self->_fullScreenAction];
    if ([(SBTopAffordanceViewController *)self _applicationIsInOrCanMoveToSplitViewFromLayoutRole:a3])
    {
      BOOL v92 = a3 == 1 && a4 == 1;
      v93 = &OBJC_IVAR___SBTopAffordanceViewController__splitViewMenu;
      if (v92) {
        v93 = &OBJC_IVAR___SBTopAffordanceViewController__splitViewAction;
      }
      id v94 = *(id *)((char *)&self->super.super.super.isa + *v93);
      [v90 addObject:v94];
    }
    if (v107) {
      [v90 addObject:self->_slideOverAction];
    }
    v114 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F3084718 image:0 identifier:0 options:33 children:v90];
    v108 = v80;
    BOOL v95 = 0;
    if (a3 == 3)
    {
      BOOL v96 = 0;
    }
    else
    {
      BOOL v96 = 0;
      if (a3 != 4)
      {
        BOOL v95 = a4 == 1;
        BOOL v96 = a4 != 1;
      }
    }
    -[UIAction setState:](*p_fullScreenAction, "setState:", 0, v90, 1064);
    p_primarySplitAction = &self->_primarySplitAction;
    [(UIAction *)self->_primarySplitAction setState:0];
    [(UIAction *)self->_sideSplitAction setState:0];
    [(UIAction *)self->_slideOverAction setState:0];
    if (!v95)
    {
      if (v96)
      {
        if (a3 == 1 || (p_primarySplitAction = &self->_sideSplitAction, a3 == 2)) {
          [(UIAction *)*p_primarySplitAction setState:1];
        }
        p_fullScreenAction = &self->_splitViewAction;
      }
      else
      {
        p_fullScreenAction = &self->_slideOverAction;
        if (a3 != 3)
        {
LABEL_86:
          [v87 addObject:v114];

          uint64_t v71 = v106;
          v80 = v108;

          goto LABEL_87;
        }
      }
    }
    [(UIAction *)*p_fullScreenAction setState:1];
    goto LABEL_86;
  }
LABEL_87:
  if ([(SBTopAffordanceViewController *)self _multipleSwitcherControllersAvailable])
  {
    [v87 addObject:self->_moveToDisplayAction];
  }
  v98 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F3084718 image:0 identifier:0 options:1 children:v87];
  v99 = [MEMORY[0x1E4F1CA48] array];
  [v99 addObject:v98];
  if (!-[SBDeviceApplicationSceneHandle prefersKillingInSwitcherDisabled](self->_sceneHandle, "prefersKillingInSwitcherDisabled"))[v99 addObject:*(Class *)((char *)&self->super.super.super.isa + v71)]; {
  v100 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F3084718 image:0 identifier:@"top-affordance-context-menu" options:1 children:v99];
  }
  menu = self->_menu;
  self->_menu = v100;

  BOOL v102 = [(SBTopAffordanceViewController *)self _applicationSupportsAnyAffordanceActions];
  [(SBTopAffordanceDotsView *)self->_dotsView setHidden:!v102];
  if ([(SBTopAffordanceViewController *)self isExpanded] && !v102)
  {
    v103 = [(SBTopAffordanceViewController *)self dotsView];
    v104 = [v103 contextMenuInteraction];
    [v104 dismissMenu];
  }
  [(SBTopAffordanceDotsView *)self->_dotsView setShowsMenuAsPrimaryAction:1];
  [(SBTopAffordanceDotsView *)self->_dotsView setMenu:self->_menu];

  objc_destroyWeak(&location);
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:9];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:12];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:13];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:1];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:2];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:5];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:3];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:4];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:17];
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 topAffordanceViewController:WeakRetained handleActionType:14];
}

- (void)_updateStyleForOverrideUserInterfaceStyle
{
  id v2 = [(SBTopAffordanceViewController *)self view];
  [v2 layoutIfNeeded];
}

- (void)_setSystemPointerInteractionEnabled:(BOOL)a3
{
  if (self->_isSystemPointerInteractionEnabled != a3)
  {
    self->_isSystemPointerInteractionEnabled = a3;
    -[SBTopAffordanceDotsView setPointerInteractionEnabled:](self->_dotsView, "setPointerInteractionEnabled:");
  }
}

- (id)_localizedMenuTitleForKey:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  BOOL v5 = [v3 mainBundle];
  double v6 = [v5 localizedStringForKey:v4 value:&stru_1F3084718 table:@"SpringBoard"];

  return v6;
}

- (BOOL)_multipleSwitcherControllersAvailable
{
  if (self->_override_multipleSwitcherControllersAvailable) {
    return 1;
  }
  id v3 = [(SBTopAffordanceViewController *)self _switcherController];
  id v4 = [v3 switcherCoordinator];
  BOOL v5 = [v4 coordinatedSwitcherControllers];
  BOOL v2 = (unint64_t)[v5 count] > 1;

  return v2;
}

- (id)_switcherController
{
  BOOL v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _windowScene];
  id v3 = [v2 switcherController];

  return v3;
}

- (void)_setLayoutStatePrimaryApplicationSupportsMedusa:(BOOL)a3
{
  if (self->_override_layoutStatePrimaryApplicationSupportsMedusa != a3) {
    self->_override_layoutStatePrimaryApplicationSupportsMedusa = a3;
  }
}

- (void)_setMultipleSwitcherControllersAvailable:(BOOL)a3
{
  if (self->_override_multipleSwitcherControllersAvailable != a3) {
    self->_override_multipleSwitcherControllersAvailable = a3;
  }
}

- (BOOL)isHidden
{
  return [(SBAffordancePresenceController *)self->_affordancePresenceController currentPresence] != 0;
}

- (void)setHidden:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBTopAffordanceViewController.m" lineNumber:809 description:@"-setHidden: is unavailable on SBTopAffordanceViewController"];
}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (v6) {
    [(SBTopAffordanceViewController *)self dismissAnimated:v5];
  }
  [(SBAffordancePresenceController *)self->_affordancePresenceController setHidden:v6 forReason:v8 animated:v5];
}

- (void)topAffordanceDotsViewWillPresentMenu:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained topAffordanceViewControllerWillPresentMenu:self];

  id v7 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _windowScene];
  BOOL v5 = [v7 transientUIInteractionManager];
  [v5 registerParticipantForTapToDismiss:self];

  BOOL v6 = [v7 transientUIInteractionManager];
  [v6 registerParticipantForIndirectPanToDismiss:self];
}

- (void)topAffordanceDotsViewWillDismissMenu:(id)a3
{
  id v6 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _windowScene];
  id v4 = [v6 transientUIInteractionManager];
  [v4 unregisterParticipantForTapToDismiss:self];

  BOOL v5 = [v6 transientUIInteractionManager];
  [v5 unregisterParticipantForIndirectPanToDismiss:self];
}

- (SBTopAffordanceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBTopAffordanceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)autoHides
{
  return self->_autoHides;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (_UILumaTrackingBackdropView)lumaTrackingView
{
  return self->_lumaTrackingView;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBTopAffordanceDotsView)dotsView
{
  return self->_dotsView;
}

- (UIAction)maximizationAction
{
  return self->_maximizationAction;
}

- (UIAction)addToSetAction
{
  return self->_addToSetAction;
}

- (UIAction)removeFromSetAction
{
  return self->_removeFromSetAction;
}

- (UIAction)moveToDisplayAction
{
  return self->_moveToDisplayAction;
}

- (UIAction)closeAction
{
  return self->_closeAction;
}

- (UIAction)fullScreenAction
{
  return self->_fullScreenAction;
}

- (UIAction)splitViewAction
{
  return self->_splitViewAction;
}

- (UIMenu)splitViewMenu
{
  return self->_splitViewMenu;
}

- (UIAction)slideOverAction
{
  return self->_slideOverAction;
}

- (UIAction)primarySplitAction
{
  return self->_primarySplitAction;
}

- (UIAction)sideSplitAction
{
  return self->_sideSplitAction;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BSSpringAnimationSettings)styleSettings
{
  return self->_styleSettings;
}

- (void)setStyleSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSettings, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_sideSplitAction, 0);
  objc_storeStrong((id *)&self->_primarySplitAction, 0);
  objc_storeStrong((id *)&self->_slideOverAction, 0);
  objc_storeStrong((id *)&self->_splitViewMenu, 0);
  objc_storeStrong((id *)&self->_splitViewAction, 0);
  objc_storeStrong((id *)&self->_fullScreenAction, 0);
  objc_storeStrong((id *)&self->_closeAction, 0);
  objc_storeStrong((id *)&self->_moveToDisplayAction, 0);
  objc_storeStrong((id *)&self->_removeFromSetAction, 0);
  objc_storeStrong((id *)&self->_addToSetAction, 0);
  objc_storeStrong((id *)&self->_maximizationAction, 0);
  objc_storeStrong((id *)&self->_dotsView, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_lumaTrackingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_affordancePresenceController, 0);
}

@end