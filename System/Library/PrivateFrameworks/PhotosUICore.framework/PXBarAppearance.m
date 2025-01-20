@interface PXBarAppearance
+ (id)_sharedDefaultImplementationDelegate;
- (BOOL)adjustedPrefersStatusBarHidden:(BOOL)a3;
- (BOOL)isEnabled;
- (BOOL)prefersNavigationBarVisible;
- (BOOL)prefersStatusBarVisible;
- (BOOL)prefersTabBarVisible;
- (BOOL)prefersToolbarVisible;
- (BOOL)prefersViewIsAppearingForAppearanceUpdates;
- (PXBarAnimationOptions)_animationOptions;
- (PXBarAppearance)init;
- (PXBarAppearance)initWithViewController:(id)a3;
- (PXBarAppearanceImplementationDelegate)_implementationDelegate;
- (PXBarAppearanceImplementationDelegate)implementationDelegate;
- (UIColor)navigationBarTintColor;
- (UIViewController)viewController;
- (int64_t)_preferredStatusBarUpdateAnimation;
- (int64_t)adjustedPreferredStatusBarStyle:(int64_t)a3;
- (int64_t)adjustedPreferredStatusBarUpdateAnimation:(int64_t)a3;
- (int64_t)barAppearancePreferredStatusBarStyle;
- (void)_performBarsTransition:(id)a3;
- (void)_setAnimationOptions:(id)a3;
- (void)_setImplementationDelegate:(id)a3;
- (void)_setNavigationBarTintColor:(id)a3 withAnimationOptions:(id)a4;
- (void)_setNavigationBarVisible:(BOOL)a3 withAnimationOptions:(id)a4;
- (void)_setPreferredStatusBarUpdateAnimation:(int64_t)a3;
- (void)_setTabBarVisible:(BOOL)a3 withAnimationOptions:(id)a4;
- (void)_setToolbarVisible:(BOOL)a3 withAnimationOptions:(id)a4;
- (void)_update;
- (void)_updateImplementationDelegate;
- (void)_updateOnViewAppearance:(BOOL)a3;
- (void)_updateOnViewWillAppear:(BOOL)a3;
- (void)_updateStatusBarStyleAndVisibilityWithAnimationOptions:(id)a3;
- (void)_updateWithAnimationOptions:(id)a3 isStatusBarHidden:(BOOL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performChangesWithAnimationOptions:(id)a3 changes:(id)a4;
- (void)setBarAppearancePreferredStatusBarStyle:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImplementationDelegate:(id)a3;
- (void)setNavigationBarTintColor:(id)a3;
- (void)setPrefersNavigationBarVisible:(BOOL)a3;
- (void)setPrefersStatusBarVisible:(BOOL)a3;
- (void)setPrefersTabBarVisible:(BOOL)a3;
- (void)setPrefersToolbarVisible:(BOOL)a3;
- (void)setPrefersViewIsAppearingForAppearanceUpdates:(BOOL)a3;
- (void)viewControllerViewIsAppearing:(BOOL)a3;
- (void)viewControllerViewWillAppear:(BOOL)a3;
@end

@implementation PXBarAppearance

- (void)performChangesWithAnimationOptions:(id)a3 changes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXBarAppearance *)self _animationOptions];
  v9 = (void *)v8;
  if (v6)
  {
    if (v8)
    {
      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "bar appearance animation options specified multiple times (existing:%@, specified:%@)", buf, 0x16u);
      }
    }
    else
    {
      [(PXBarAppearance *)self _setAnimationOptions:v6];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PXBarAppearance;
  [(PXBarAppearance *)&v11 performChanges:v7];
  [(PXBarAppearance *)self _setAnimationOptions:v9];
}

- (void)_setAnimationOptions:(id)a3
{
}

- (PXBarAnimationOptions)_animationOptions
{
  return self->__animationOptions;
}

- (void)_updateImplementationDelegate
{
  v3 = [(PXBarAppearance *)self viewController];
  v4 = objc_msgSend(v3, "px_barAppearance");
  id v9 = [v4 implementationDelegate];

  uint64_t v5 = (uint64_t)v9;
  if (!v9)
  {
    do
    {
      uint64_t v8 = [v3 parentViewController];
      if (!v8)
      {
        uint64_t v5 = +[PXBarAppearance _sharedDefaultImplementationDelegate];
        goto LABEL_7;
      }
      id v6 = (void *)v8;

      id v7 = objc_msgSend(v6, "px_barAppearance");
      id v10 = [v7 implementationDelegate];

      uint64_t v5 = (uint64_t)v10;
      v3 = v6;
    }
    while (!v10);
    v3 = v6;
  }
LABEL_7:
  id v11 = (id)v5;
  [(PXBarAppearance *)self _setImplementationDelegate:v5];
}

- (PXBarAppearanceImplementationDelegate)implementationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implementationDelegate);
  return (PXBarAppearanceImplementationDelegate *)WeakRetained;
}

- (PXBarAppearance)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXBarAppearance;
  uint64_t v5 = [(PXBarAppearance *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    v5->_prefersStatusBarVisible = 1;
    v5->_prefersNavigationBarVisible = 1;
    v5->_prefersToolbarVisible = 0;
    v5->_prefersTabBarVisible = 1;
    objc_storeWeak((id *)&v5->_viewController, v4);
    [(PXBarAppearance *)v6 registerChangeObserver:v6 context:PXBarAppearanceObservationContext];
  }

  return v6;
}

- (void)_setImplementationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__implementationDelegate, obj);
    self->_implementationDelegateFlags.respondsToWillUpdateBarAppearanceOnViewWillAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToIsStatusBarVisible = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToIsStatusBarVisible = objc_opt_respondsToSelector() & 1;
  }
}

+ (id)_sharedDefaultImplementationDelegate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PXBarAppearance__sharedDefaultImplementationDelegate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedDefaultImplementationDelegate_onceToken != -1) {
    dispatch_once(&_sharedDefaultImplementationDelegate_onceToken, block);
  }
  v2 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate;
  return v2;
}

- (void)viewControllerViewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXBarAppearance *)self isEnabled]
    && [(PXBarAppearance *)self prefersViewIsAppearingForAppearanceUpdates])
  {
    [(PXBarAppearance *)self _updateOnViewAppearance:v3];
  }
}

- (void)viewControllerViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXBarAppearance *)self isEnabled])
  {
    [(PXBarAppearance *)self _updateOnViewWillAppear:v3];
    if (![(PXBarAppearance *)self prefersViewIsAppearingForAppearanceUpdates])
    {
      [(PXBarAppearance *)self _updateOnViewAppearance:v3];
    }
  }
}

- (BOOL)prefersViewIsAppearingForAppearanceUpdates
{
  return self->_prefersViewIsAppearingForAppearanceUpdates;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_update
{
  id v5 = [(PXBarAppearance *)self _animationOptions];
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 isStatusBarHidden];

  [(PXBarAppearance *)self _updateWithAnimationOptions:v5 isStatusBarHidden:v4];
}

- (void)_updateWithAnimationOptions:(id)a3 isStatusBarHidden:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(PXBarAppearance *)self viewController];
  if ([v7 _appearState] - 1 <= 2)
  {
    int v8 = [(PXBarAppearance *)self prefersStatusBarVisible];
    BOOL v9 = [(PXBarAppearance *)self prefersNavigationBarVisible];
    BOOL v10 = [(PXBarAppearance *)self prefersToolbarVisible];
    BOOL v11 = [(PXBarAppearance *)self prefersTabBarVisible];
    uint64_t v16 = [(PXBarAppearance *)self navigationBarTintColor];
    if (v10 && v11) {
      PXAssertGetLog();
    }
    v12 = [v7 navigationController];
    int v13 = [v12 isNavigationBarHidden];
    unsigned int v15 = [v12 _useStandardStatusBarHeight];
    if (v8 == v4 && v9 == v13 && v8 == v9) {
      [v12 _setUseStandardStatusBarHeight:1];
    }
    if (v8)
    {
      [(PXBarAppearance *)self _setNavigationBarVisible:v9 withAnimationOptions:v6];
      __int16 v14 = (void *)v16;
      [(PXBarAppearance *)self _setNavigationBarTintColor:v16 withAnimationOptions:v6];
      [(PXBarAppearance *)self _setTabBarVisible:v11 withAnimationOptions:v6];
      [(PXBarAppearance *)self _setToolbarVisible:v10 withAnimationOptions:v6];
      [(PXBarAppearance *)self _updateStatusBarStyleAndVisibilityWithAnimationOptions:v6];
    }
    else
    {
      [(PXBarAppearance *)self _updateStatusBarStyleAndVisibilityWithAnimationOptions:v6];
      [(PXBarAppearance *)self _setNavigationBarVisible:v9 withAnimationOptions:v6];
      __int16 v14 = (void *)v16;
      [(PXBarAppearance *)self _setNavigationBarTintColor:v16 withAnimationOptions:v6];
      [(PXBarAppearance *)self _setTabBarVisible:v11 withAnimationOptions:v6];
      [(PXBarAppearance *)self _setToolbarVisible:v10 withAnimationOptions:v6];
    }
    [v12 _setUseStandardStatusBarHeight:v15];
  }
}

- (void)_performBarsTransition:(id)a3
{
  int v4 = (void (**)(void))a3;
  int64_t transitionsCounter = self->_transitionsCounter;
  self->_int64_t transitionsCounter = transitionsCounter + 1;
  if (!transitionsCounter)
  {
    id v6 = [(PXBarAppearance *)self viewController];
    objc_msgSend(v6, "px_willTransitionBars");
  }
  v4[2](v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXBarAppearance__performBarsTransition___block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  aBlock[4] = self;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  int v8 = [(PXBarAppearance *)self viewController];
  BOOL v9 = [v8 transitionCoordinator];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__PXBarAppearance__performBarsTransition___block_invoke_2;
    v10[3] = &unk_1E5DBE858;
    BOOL v11 = v7;
    [v9 animateAlongsideTransition:0 completion:v10];
  }
  else
  {
    v7[2](v7);
  }
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

void __42__PXBarAppearance__performBarsTransition___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 104);
  v1 = *(void **)(a1 + 32);
  if (!v1[13])
  {
    id v2 = [v1 viewController];
    objc_msgSend(v2, "px_didTransitionBars");
  }
}

uint64_t __59__PXBarAppearance__setToolbarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  switch(result)
  {
    case 2:
      BOOL v5 = *(unsigned char *)(a1 + 48) == 0;
      id v6 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) duration];
      id v7 = v6;
      BOOL v8 = v5;
      uint64_t v9 = 4;
      break;
    case 1:
      BOOL v10 = *(unsigned char *)(a1 + 48) == 0;
      BOOL v11 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) duration];
      id v7 = v11;
      BOOL v8 = v10;
      uint64_t v9 = 15;
      break;
    case 0:
      BOOL v3 = *(void **)(a1 + 40);
      BOOL v4 = *(unsigned char *)(a1 + 48) == 0;
      return [v3 setToolbarHidden:v4 animated:0];
    default:
      return result;
  }
  return objc_msgSend(v7, "_setToolbarHidden:edge:duration:", v8, v9);
}

uint64_t __58__PXBarAppearance__setTabBarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 52);
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) duration];
  if (v1)
  {
    return objc_msgSend(v3, "showBarWithTransition:duration:", v2);
  }
  else
  {
    return objc_msgSend(v3, "hideBarWithTransition:duration:", v2);
  }
}

- (BOOL)prefersToolbarVisible
{
  return self->_prefersToolbarVisible;
}

- (BOOL)prefersTabBarVisible
{
  return self->_prefersTabBarVisible;
}

- (BOOL)prefersStatusBarVisible
{
  return self->_prefersStatusBarVisible;
}

- (BOOL)prefersNavigationBarVisible
{
  return self->_prefersNavigationBarVisible;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (void)_setToolbarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [(PXBarAppearance *)self viewController];
  BOOL v8 = [v7 navigationController];

  if ([v8 isToolbarHidden] == v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PXBarAppearance__setToolbarVisible_withAnimationOptions___block_invoke;
    v9[3] = &unk_1E5DD21E8;
    id v10 = v6;
    id v11 = v8;
    char v12 = v4;
    [(PXBarAppearance *)self _performBarsTransition:v9];
  }
}

- (void)_setNavigationBarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [(PXBarAppearance *)self viewController];
  BOOL v8 = [v7 navigationController];

  if ([v8 isNavigationBarHidden] == v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__PXBarAppearance__setNavigationBarVisible_withAnimationOptions___block_invoke;
    v9[3] = &unk_1E5DD21E8;
    id v10 = v6;
    id v11 = v8;
    char v12 = v4;
    [(PXBarAppearance *)self _performBarsTransition:v9];
  }
}

- (void)setPrefersToolbarVisible:(BOOL)a3
{
  if (self->_prefersToolbarVisible != a3)
  {
    [(PXBarAppearance *)self signalChange:4];
    self->_prefersToolbarVisible = a3;
  }
}

- (void)setPrefersTabBarVisible:(BOOL)a3
{
  if (self->_prefersTabBarVisible != a3)
  {
    [(PXBarAppearance *)self signalChange:8];
    self->_prefersTabBarVisible = a3;
  }
}

- (void)setPrefersStatusBarVisible:(BOOL)a3
{
  if (self->_prefersStatusBarVisible != a3)
  {
    [(PXBarAppearance *)self signalChange:1];
    self->_prefersStatusBarVisible = a3;
  }
}

- (void)setPrefersNavigationBarVisible:(BOOL)a3
{
  if (self->_prefersNavigationBarVisible != a3)
  {
    [(PXBarAppearance *)self signalChange:2];
    self->_prefersNavigationBarVisible = a3;
  }
}

- (void)_updateOnViewAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(PXBarAppearance *)self viewController];
  [(PXBarAppearance *)self _updateImplementationDelegate];
  BOOL v5 = [(PXBarAppearance *)self _implementationDelegate];
  id v6 = [v11 transitionCoordinator];
  if ([v6 isCancelled])
  {
    id v7 = [(PXBarAppearance *)self navigationBarTintColor];
    [(PXBarAppearance *)self _setNavigationBarTintColor:v7 withAnimationOptions:0];
  }
  else
  {
    if (v3)
    {
      BOOL v8 = [PXBarAnimationOptions alloc];
      [v6 transitionDuration];
      id v7 = -[PXBarAnimationOptions initWithType:duration:](v8, "initWithType:duration:", 1);
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v10 = [v9 isStatusBarHidden];

    if (self->_implementationDelegateFlags.respondsToIsStatusBarVisible) {
      uint64_t v10 = [v5 barAppearanceIsStatusBarVisible:self] ^ 1;
    }
    [(PXBarAppearance *)self _updateWithAnimationOptions:v7 isStatusBarHidden:v10];
  }
}

- (void)_updateOnViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXBarAppearance *)self _updateImplementationDelegate];
  BOOL v5 = [(PXBarAppearance *)self _implementationDelegate];
  if (self->_implementationDelegateFlags.respondsToWillUpdateBarAppearanceOnViewWillAppear)
  {
    id v6 = v5;
    [v5 barAppearance:self willUpdateBarAppearanceOnViewWillAppear:v3];
    BOOL v5 = v6;
  }
}

- (PXBarAppearanceImplementationDelegate)_implementationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);
  return (PXBarAppearanceImplementationDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXBarAppearanceObservationContext == a5) {
    [(PXBarAppearance *)self _update];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

void __74__PXBarAppearance__updateStatusBarStyleAndVisibilityWithAnimationOptions___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 setNeedsStatusBarAppearanceUpdate];
}

- (int64_t)adjustedPreferredStatusBarStyle:(int64_t)a3
{
  switch([(PXBarAppearance *)self barAppearancePreferredStatusBarStyle])
  {
    case 0:
      return a3;
    case 1:
      a3 = 0;
      break;
    case 2:
      a3 = 1;
      break;
    case 3:
      a3 = 3;
      break;
    default:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXBarAppearance.m" lineNumber:172 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return a3;
}

- (int64_t)barAppearancePreferredStatusBarStyle
{
  return self->_barAppearancePreferredStatusBarStyle;
}

void __55__PXBarAppearance__sharedDefaultImplementationDelegate__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 32) defaultImplementationDelegate];
    BOOL v3 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate;
    _sharedDefaultImplementationDelegate_defaultImplementationDelegate = v2;
  }
}

- (void)_updateStatusBarStyleAndVisibilityWithAnimationOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = 1;
  if (v5 == 2) {
    uint64_t v6 = 2;
  }
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  [(PXBarAppearance *)self _setPreferredStatusBarUpdateAnimation:v7];
  BOOL v8 = (void *)MEMORY[0x1E4FB1EB0];
  [v4 duration];
  double v10 = v9;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PXBarAppearance__updateStatusBarStyleAndVisibilityWithAnimationOptions___block_invoke;
  v11[3] = &unk_1E5DD36F8;
  v11[4] = self;
  [v8 animateWithDuration:v11 animations:v10];
}

- (void)_setPreferredStatusBarUpdateAnimation:(int64_t)a3
{
  self->__preferredStatusBarUpdateAnimation = a3;
}

- (void)_setTabBarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 type];
  if (v7 == 1) {
    int v8 = 6;
  }
  else {
    int v8 = 0;
  }
  if (v7 == 2) {
    int v9 = 7;
  }
  else {
    int v9 = v8;
  }
  double v10 = [(PXBarAppearance *)self viewController];
  id v11 = [v10 tabBarController];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PXBarAppearance__setTabBarVisible_withAnimationOptions___block_invoke;
  v14[3] = &unk_1E5DC6248;
  BOOL v18 = a3;
  int v17 = v9;
  id v15 = v11;
  id v16 = v6;
  id v12 = v6;
  id v13 = v11;
  [(PXBarAppearance *)self _performBarsTransition:v14];
}

- (void)_setNavigationBarTintColor:(id)a3 withAnimationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PXBarAppearance *)self viewController];
  int v9 = [v8 navigationController];
  double v10 = [v9 navigationBar];

  if (v10)
  {
    if ([v7 type])
    {
      id v11 = (void *)MEMORY[0x1E4FB1EB0];
      [v7 duration];
      double v13 = v12;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __67__PXBarAppearance__setNavigationBarTintColor_withAnimationOptions___block_invoke;
      v16[3] = &unk_1E5DD32A8;
      id v17 = v10;
      id v18 = v6;
      [v11 animateWithDuration:v16 animations:v13];
    }
    else if (v6)
    {
      [v10 setTintColor:v6];
    }
    else
    {
      __int16 v14 = [MEMORY[0x1E4FB19D0] appearance];
      id v15 = [v14 tintColor];
      [v10 setTintColor:v15];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implementationDelegate);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->__animationOptions, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_destroyWeak((id *)&self->__implementationDelegate);
}

- (void)setImplementationDelegate:(id)a3
{
}

- (void)setPrefersViewIsAppearingForAppearanceUpdates:(BOOL)a3
{
  self->_prefersViewIsAppearingForAppearanceUpdates = a3;
}

- (int64_t)_preferredStatusBarUpdateAnimation
{
  return self->__preferredStatusBarUpdateAnimation;
}

uint64_t __42__PXBarAppearance__performBarsTransition___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PXBarAppearance__setNavigationBarTintColor_withAnimationOptions___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "setTintColor:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB19D0] appearance];
    BOOL v3 = [v4 tintColor];
    [*(id *)(a1 + 32) setTintColor:v3];
  }
}

uint64_t __65__PXBarAppearance__setNavigationBarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  switch(result)
  {
    case 2:
      BOOL v5 = *(unsigned char *)(a1 + 48) == 0;
      id v6 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) duration];
      id v7 = v6;
      BOOL v8 = v5;
      uint64_t v9 = 1;
      break;
    case 1:
      BOOL v10 = *(unsigned char *)(a1 + 48) == 0;
      id v11 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) duration];
      id v7 = v11;
      BOOL v8 = v10;
      uint64_t v9 = 15;
      break;
    case 0:
      BOOL v3 = *(void **)(a1 + 40);
      BOOL v4 = *(unsigned char *)(a1 + 48) == 0;
      return [v3 setNavigationBarHidden:v4 animated:0];
    default:
      return result;
  }
  return objc_msgSend(v7, "_setNavigationBarHidden:edge:duration:", v8, v9);
}

- (int64_t)adjustedPreferredStatusBarUpdateAnimation:(int64_t)a3
{
  if (![(PXBarAppearance *)self isEnabled]) {
    return a3;
  }
  return [(PXBarAppearance *)self _preferredStatusBarUpdateAnimation];
}

- (BOOL)adjustedPrefersStatusBarHidden:(BOOL)a3
{
  LOBYTE(v3) = a3;
  if ([(PXBarAppearance *)self isEnabled]) {
    return ![(PXBarAppearance *)self prefersStatusBarVisible];
  }
  return v3;
}

- (void)setNavigationBarTintColor:(id)a3
{
  BOOL v8 = (UIColor *)a3;
  BOOL v4 = self->_navigationBarTintColor;
  navigationBarTintColor = v8;
  if (v4 != v8)
  {
    char v6 = [(UIColor *)v8 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    [(PXBarAppearance *)self signalChange:16];
    id v7 = (UIColor *)[(UIColor *)v8 copy];
    navigationBarTintColor = self->_navigationBarTintColor;
    self->_navigationBarTintColor = v7;
  }

LABEL_5:
}

- (void)setBarAppearancePreferredStatusBarStyle:(int64_t)a3
{
  if (self->_barAppearancePreferredStatusBarStyle != a3)
  {
    [(PXBarAppearance *)self signalChange:32];
    self->_barAppearancePreferredStatusBarStyle = a3;
  }
}

- (void)performChanges:(id)a3
{
}

- (PXBarAppearance)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXBarAppearance.m" lineNumber:50 description:@"unavailable initializer"];

  return 0;
}

@end