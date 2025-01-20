@interface SBDashBoardPluginViewController
+ (Class)viewClass;
- (BOOL)handleEvent:(id)a3;
- (SBDashBoardPluginViewController)initWithLockScreenPlugin:(id)a3;
- (SBLockScreenPlugin)plugin;
- (id)_newDisplayLayoutElement;
- (id)coverSheetIdentifier;
- (id)succinctDescriptionBuilder;
- (id)view;
- (int64_t)_presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (void)_updateLegibility;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)pluginAppearanceDidChange:(id)a3;
- (void)updateForPresentation:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToPresented:(BOOL)a3;
@end

@implementation SBDashBoardPluginViewController

- (SBDashBoardPluginViewController)initWithLockScreenPlugin:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(CSCoverSheetViewControllerBase *)self initWithNibName:0 bundle:0];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_plugin, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardPluginViewController;
  v2 = [(SBDashBoardPluginViewController *)&v4 view];
  return v2;
}

- (void)viewDidLoad
{
  v3 = [(SBLockScreenPlugin *)self->_plugin viewController];
  objc_super v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SBDashBoardPluginViewController_viewDidLoad__block_invoke;
    v7[3] = &unk_1E6AF53D0;
    id v8 = v3;
    v9 = self;
    [(SBDashBoardPluginViewController *)self bs_addChildViewController:v8 animated:0 transitionBlock:v7];
  }
  id v5 = [(SBDashBoardPluginViewController *)self view];
  [(CSCoverSheetViewControllerBase *)self registerView:v5 forRole:2];

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
}

void __46__SBDashBoardPluginViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) view];
  objc_super v4 = [*(id *)(a1 + 40) view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  id v5 = [*(id *)(a1 + 32) view];
  [v5 setAutoresizingMask:18];

  objc_super v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    objc_super v6 = v7;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewWillAppear:a3];
  [(SBLockScreenPlugin *)self->_plugin setDelegate:self];
  [(SBDashBoardPluginViewController *)self _updateLegibility];
  objc_super v4 = [(SBDashBoardPluginViewController *)self view];
  id v5 = [(SBLockScreenPlugin *)self->_plugin appearance];
  [v5 presentationRegion];
  objc_msgSend(v4, "setPresentationRegion:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBLockScreenPlugin *)self->_plugin setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardPluginViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidDisappear:v3];
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(SBLockScreenPlugin *)self->_plugin viewController];

  if (v10)
  {
    v11 = [(SBLockScreenPlugin *)self->_plugin viewController];
    id v12 = (id)[v11 pluginAnimateAppearanceTransition:v6 withCompletion:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDashBoardPluginViewController;
    [(CSCoverSheetViewControllerBase *)&v13 performCustomTransitionToVisible:v6 withAnimationSettings:v8 completion:v9];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardPluginViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__SBDashBoardPluginViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AF53F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __86__SBDashBoardPluginViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1048) appearance];
  [v2 presentationRegion];
  objc_msgSend(v3, "setPresentationRegion:");
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardPluginViewController;
  id v3 = [(CSCoverSheetViewControllerBase *)&v7 succinctDescriptionBuilder];
  objc_super v4 = [(SBLockScreenPlugin *)self->_plugin name];
  id v5 = (id)[v3 appendObject:v4 withName:@"plugin"];

  return v3;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v6 aggregateAppearance:v4];
  id v5 = [(SBLockScreenPlugin *)self->_plugin coverSheetAppearance];
  [v4 unionAppearance:v5];
}

- (void)aggregateBehavior:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v6 aggregateBehavior:v4];
  id v5 = [(SBLockScreenPlugin *)self->_plugin coverSheetBehavior];
  [v4 unionBehavior:v5];

  [v4 setIdleTimerDuration:9];
  [v4 setIdleTimerMode:2];
  [v4 setIdleWarnMode:1];
}

- (void)updateForPresentation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v4 regions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  double v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) role] == 2)
        {
          double v7 = 0.0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v11 = [(SBDashBoardPluginViewController *)self view];
  [v11 setAlpha:v7];

  id v12 = [(SBLockScreenPlugin *)self->_plugin controller];
  if (objc_opt_respondsToSelector())
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FA7968]);
    v14 = [MEMORY[0x1E4FA7948] defaultSettings];
    [v13 setLegibilitySettings:v14];

    v15 = [(SBDashBoardPluginViewController *)self view];
    [v15 bounds];
    objc_msgSend(v4, "suggestedInsetsForPreferredContentFrame:");
    objc_msgSend(v13, "setSuggestedContentInsets:");

    v16 = (void *)[v13 copy];
    [v12 updateForPresentation:v16];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardPluginViewController;
  [(CSCoverSheetViewControllerBase *)&v17 updateForPresentation:v4];
}

- (id)_newDisplayLayoutElement
{
  v2 = [(SBDashBoardPluginViewController *)self plugin];
  id v3 = [v2 name];
  int v4 = [v3 isEqualToString:@"MapsLockScreen"];

  if (!v4) {
    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
  uint64_t v6 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F50]];
  [v6 setFillsDisplayBounds:1];
  [v6 setLayoutRole:6];
  return v6;
}

- (void)willTransitionToPresented:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase willTransitionToPresented:](&v9, sel_willTransitionToPresented_);
  if (!a3)
  {
    id v5 = [(SBLockScreenPlugin *)self->_plugin viewController];
    [(SBDashBoardPluginViewController *)self bs_removeChildViewController:v5];

    [(SBDashBoardPluginViewController *)self setView:0];
    uint64_t v6 = [(CSCoverSheetViewControllerBase *)self kitPresentedViewController];
    double v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 presentingViewController];
      [v8 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (int64_t)presentationStyle
{
  v2 = [(SBLockScreenPlugin *)self->_plugin appearance];
  uint64_t v3 = [v2 presentationStyle];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)presentationTransition
{
  v2 = [(SBLockScreenPlugin *)self->_plugin viewController];
  int64_t v3 = [v2 pluginAnimatesAppearanceTransition:1]
    && (objc_opt_respondsToSelector() & 1) != 0;

  return v3;
}

- (int64_t)presentationType
{
  if ([(SBDashBoardPluginViewController *)self _presentationPriority] < 500) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)coverSheetIdentifier
{
  int64_t v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SBLockScreenPlugin *)self->_plugin name];
  double v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (void)pluginAppearanceDidChange:(id)a3
{
  id v5 = [(SBDashBoardPluginViewController *)self viewIfLoaded];
  int v4 = [(SBLockScreenPlugin *)self->_plugin appearance];
  [v4 presentationRegion];
  objc_msgSend(v5, "setPresentationRegion:");

  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardPluginViewController;
  if ((![(CSCoverSheetViewControllerBase *)&v7 handleEvent:v4]
     || ([v4 isConsumable] & 1) == 0)
    && ![(SBLockScreenPlugin *)self->_plugin handleDashBoardEvent:v4])
  {
    if ([v4 type] != 1)
    {
      char v5 = 0;
      goto LABEL_8;
    }
    [(SBDashBoardPluginViewController *)self _updateLegibility];
  }
  char v5 = [v4 isConsumable];
LABEL_8:

  return v5;
}

- (void)_updateLegibility
{
  id v5 = [(SBLockScreenPlugin *)self->_plugin controller];
  if (objc_opt_respondsToSelector())
  {
    int64_t v3 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
    id v4 = [v3 legibilitySettings];
    [v5 setLegibilitySettings:v4];
  }
}

- (int64_t)_presentationPriority
{
  int64_t v3 = [(SBLockScreenPlugin *)self->_plugin name];
  int v4 = [v3 isEqualToString:@"FindMyiPhoneLockScreen"];

  BOOL v5 = [(SBLockScreenPlugin *)self->_plugin isCapabilityRestricted:8];
  if (v4)
  {
    if (v5) {
      return 560;
    }
    else {
      return 540;
    }
  }
  else if (v5)
  {
    return 530;
  }
  else
  {
    objc_super v7 = [(SBLockScreenPlugin *)self->_plugin appearance];
    uint64_t v8 = [v7 notificationBehavior];

    if (v8 == 3) {
      return 3;
    }
    else {
      return 6;
    }
  }
}

- (SBLockScreenPlugin)plugin
{
  return self->_plugin;
}

- (void).cxx_destruct
{
}

@end