@interface SUUINavigationController
- (BOOL)_topViewControllerPrefersNavigationBarBackgroundViewHidden;
- (id)_accessibilityButtonBackgroundDefaultTintColor;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)description;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_configureNavigationBar:(id)a3 withTintColor:(id)a4 tintAdjustmentMode:(int64_t)a5 titleTextTintColor:(id)a6 shouldTintTitleText:(BOOL)a7 accessibilityButtonBackgroundTintColor:(id)a8;
- (void)_configureNavigationBarForViewController:(id)a3 shouldIgnoreTransitionCoordinator:(BOOL)a4;
- (void)_scheduleConfigurationOfNavigationBar;
- (void)_setNavigationPalette:(id)a3 hidesPaletteShadow:(BOOL)a4;
- (void)_viewControllerNeedsNavigationBarAppearanceUpdate:(id)a3;
- (void)attachPalette:(id)a3 isPinned:(BOOL)a4;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation SUUINavigationController

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  v7 = [(SUUINavigationController *)self tabBarItem];
  v8 = [v7 title];

  if (v8) {
    [v6 appendFormat:@"; title = %@", v8];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)childViewControllerForStatusBarHidden
{
  if ([(SUUINavigationController *)self _topViewControllerPrefersNavigationBarBackgroundViewHidden])
  {
    id v3 = [(SUUINavigationController *)self topViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUINavigationController;
    id v3 = [(SUUINavigationController *)&v5 childViewControllerForStatusBarHidden];
  }
  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  if ([(SUUINavigationController *)self _topViewControllerPrefersNavigationBarBackgroundViewHidden])
  {
    id v3 = [(SUUINavigationController *)self topViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUINavigationController;
    id v3 = [(SUUINavigationController *)&v5 childViewControllerForStatusBarStyle];
  }
  return v3;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  v4 = [(SUUINavigationController *)&v6 popToRootViewControllerAnimated:a3];
  [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUINavigationController;
  objc_super v5 = [(SUUINavigationController *)&v7 popToViewController:a3 animated:a4];
  [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
  return v5;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  v4 = [(SUUINavigationController *)&v6 popViewControllerAnimated:a3];
  [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
  return v4;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  [(SUUINavigationController *)&v5 pushViewController:a3 animated:a4];
  [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  [(SUUINavigationController *)&v5 setViewControllers:a3 animated:a4];
  [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  [(SUUINavigationController *)&v6 attachPalette:a3 isPinned:a4];
  objc_super v5 = [(SUUINavigationController *)self topViewController];
  [(SUUINavigationController *)self _configureNavigationBarForViewController:v5 shouldIgnoreTransitionCoordinator:0];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  [(SUUINavigationController *)&v5 didShowViewController:a3 animated:a4];
  [(SUUINavigationController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_configureNavigationBar:(id)a3 withTintColor:(id)a4 tintAdjustmentMode:(int64_t)a5 titleTextTintColor:(id)a6 shouldTintTitleText:(BOOL)a7 accessibilityButtonBackgroundTintColor:(id)a8
{
  BOOL v9 = a7;
  id v18 = a3;
  id v13 = a6;
  id v14 = a8;
  [v18 setTintColor:a4];
  [v18 setTintAdjustmentMode:a5];
  if (v9)
  {
    id v15 = [v18 titleTextAttributes];
    v16 = (void *)[v15 mutableCopy];
    id v17 = v16;
    if (v13)
    {
      if (!v16) {
        id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      [v17 setObject:v13 forKey:*MEMORY[0x263F81500]];
    }
    else
    {
      [v16 removeObjectForKey:*MEMORY[0x263F81500]];
    }
    if (v15 != v17 && ([v15 isEqualToDictionary:v17] & 1) == 0) {
      [v18 setTitleTextAttributes:v17];
    }
  }
  [v18 _setAccessibilityButtonBackgroundTintColor:v14];
}

- (void)_configureNavigationBarForViewController:(id)a3 shouldIgnoreTransitionCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(SUUINavigationController *)self navigationBar];
  v8 = [(SUUINavigationController *)self view];
  BOOL v9 = [v8 window];

  if (v9)
  {
    id v10 = [v8 tintColor];
  }
  else
  {
    id v10 = 0;
  }
  v11 = [(SUUINavigationController *)self transitionCoordinator];
  v12 = v11;
  if (v11 && !v4)
  {
    id v13 = [v11 viewControllerForKey:*MEMORY[0x263F83C00]];
    id v14 = [v12 viewControllerForKey:*MEMORY[0x263F83C10]];
    if (v13 != v6 && v14 != v6)
    {
      id v33 = 0;
      id v34 = 0;
LABEL_62:

      goto LABEL_63;
    }
    id v92 = v14;
    v16 = [v7 _backgroundView];
    [v16 alpha];
    uint64_t v18 = v17;

    [v7 _shadowAlpha];
    uint64_t v20 = v19;
    v78 = [(SUUINavigationController *)self existingPaletteForEdge:2];
    v21 = objc_getAssociatedObject(v78, (const void *)kHasBeginHidingPaletteShadow);
    char v91 = [v21 BOOLValue];

    uint64_t v22 = [v7 tintColor];
    uint64_t v77 = [v7 tintAdjustmentMode];
    v23 = [v7 titleTextAttributes];
    uint64_t v24 = [v23 objectForKey:*MEMORY[0x263F81500]];

    v84 = (void *)v24;
    BOOL v25 = v24 != 0;
    v86 = [v7 _accessibilityButtonBackgroundTintColor];
    v80 = (void *)v22;
    if ([v13 conformsToProtocol:&unk_2706447B0]) {
      int v26 = [v13 prefersNavigationBarBackgroundViewHidden];
    }
    else {
      int v26 = 0;
    }
    v88 = v13;
    id v89 = v6;
    if (![v92 conformsToProtocol:&unk_2706447B0])
    {
      unsigned int v39 = 0;
      v90 = 0;
      uint64_t v75 = 0;
      v76 = 0;
      double v40 = 1.0;
      BOOL v41 = v25;
      char v74 = v25;
LABEL_47:
      v47 = objc_getAssociatedObject(v7, "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView");
      if (!v47)
      {
        v47 = [v7 _backgroundView];
        objc_setAssociatedObject(v7, "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView", v47, (void *)1);
      }
      v98 = v8;
      unsigned int v96 = v39;
      v83 = v47;
      char v82 = v26 ^ v39;
      if ((v26 ^ v39) == 1)
      {
        if ((v26 | v39) == 1)
        {
          v48 = (void *)MEMORY[0x263F83C18];
          if (!v26) {
            v48 = (void *)MEMORY[0x263F83C08];
          }
          v73 = [v12 viewForKey:*v48];
        }
        else
        {
          v73 = 0;
        }
        [v7 frame];
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;
        double v58 = v57;
        uint64_t v59 = [v7 superview];
        v60 = (void *)v59;
        if (v47)
        {
          uint64_t v50 = v77;
          v49 = v78;
          if (v59)
          {
            [v47 frame];
            objc_msgSend(v7, "convertRect:toView:", v60);
            double v52 = v61;
            double v54 = v62;
            double v56 = v63;
            double v58 = v64;
          }
        }
        else
        {
          uint64_t v50 = v77;
          v49 = v78;
        }
        v65 = objc_msgSend(objc_alloc((Class)-[SUUINavigationController navigationBarClass](self, "navigationBarClass")), "initWithFrame:", v52, v54, v56, v58);
        objc_msgSend(v65, "setBarStyle:", objc_msgSend(v7, "barStyle"));
        v66 = [v7 barTintColor];
        [v65 setBarTintColor:v66];

        [v7 _setBackgroundView:0];
        v67 = [v65 layer];
        [v67 setZPosition:100.0];

        v79 = v65;
        [v73 addSubview:v65];
        [v7 _setShadowAlpha:0.0];
        objc_msgSend(v49, "SUUI_beginHidingPaletteShadow");
        [(SUUINavigationController *)self _setNavigationPalette:v49 hidesPaletteShadow:v96];
      }
      else
      {
        v79 = 0;
        uint64_t v50 = v77;
        v49 = v78;
      }
      v117[0] = MEMORY[0x263EF8330];
      v117[1] = 3221225472;
      v117[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke;
      v117[3] = &unk_2654007A8;
      id v68 = v7;
      uint64_t v124 = v18;
      uint64_t v125 = v20;
      id v118 = v68;
      v119 = self;
      uint64_t v126 = v50;
      id v120 = v80;
      id v121 = v84;
      BOOL v127 = v41;
      id v122 = v86;
      id v69 = v49;
      id v123 = v69;
      char v128 = v91;
      id v81 = v80;
      id v85 = v84;
      id v87 = v86;
      [v12 notifyWhenInteractionEndsUsingBlock:v117];
      v110[0] = MEMORY[0x263EF8330];
      v110[1] = 3221225472;
      v110[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2;
      v110[3] = &unk_2654007D0;
      v110[4] = self;
      id v111 = v68;
      id v10 = v10;
      id v112 = v10;
      uint64_t v115 = v75;
      id v34 = v76;
      id v113 = v34;
      char v116 = v74;
      id v33 = v90;
      id v114 = v33;
      v99[0] = MEMORY[0x263EF8330];
      v99[1] = 3221225472;
      v99[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3;
      v99[3] = &unk_2654007F8;
      id v100 = v79;
      id v101 = v111;
      id v102 = v83;
      double v105 = v40;
      double v106 = v40;
      char v107 = v96;
      v103 = self;
      id v104 = v69;
      char v108 = v91;
      char v109 = v82;
      id v70 = v79;
      id v71 = v83;
      id v72 = v69;
      [v12 animateAlongsideTransition:v110 completion:v99];

      id v13 = v88;
      id v6 = v89;
      id v14 = v92;
      v8 = v98;
      goto LABEL_62;
    }
    v95 = v12;
    id v38 = v92;
    unsigned int v39 = [v38 prefersNavigationBarBackgroundViewHidden];
    if (v39)
    {
      v90 = [(SUUINavigationController *)self _accessibilityButtonBackgroundDefaultTintColor];
      double v40 = 0.0;
    }
    else
    {
      v90 = 0;
      double v40 = 1.0;
    }
    uint64_t v42 = [v38 navigationBarTintColor];

    if (objc_opt_respondsToSelector())
    {
      v43 = [v38 navigationBarTitleTextTintColor];
      if (v43) {
        unsigned int v44 = v39;
      }
      else {
        unsigned int v44 = 0;
      }
      v76 = v43;
      if (v44 != 1)
      {
        char v74 = 1;
        goto LABEL_43;
      }
      unsigned int v45 = v39;
      uint64_t v46 = [v43 colorWithAlphaComponent:0.2];
      char v74 = 1;
    }
    else
    {
      unsigned int v45 = v39;
      uint64_t v46 = 0;
      v76 = 0;
      char v74 = v25;
    }

    v90 = (void *)v46;
    unsigned int v39 = v45;
LABEL_43:
    if (objc_opt_respondsToSelector()) {
      uint64_t v75 = [v38 navigationBarTintAdjustmentMode];
    }
    else {
      uint64_t v75 = 0;
    }
    BOOL v41 = v25;

    id v10 = (id)v42;
    v12 = v95;
    goto LABEL_47;
  }
  v94 = v11;
  v97 = v8;
  if ([v6 conformsToProtocol:&unk_2706447B0])
  {
    id v27 = v6;
    uint64_t v28 = [v27 prefersNavigationBarBackgroundViewHidden];
    id v29 = v6;
    if (v28)
    {
      id v33 = [(SUUINavigationController *)self _accessibilityButtonBackgroundDefaultTintColor];
      double v30 = 0.0;
    }
    else
    {
      id v33 = 0;
      double v30 = 1.0;
    }
    id v93 = [v27 navigationBarTintColor];

    char v31 = objc_opt_respondsToSelector();
    if (v31)
    {
      id v34 = [v27 navigationBarTitleTextTintColor];
      if ([v27 prefersNavigationBarBackgroundViewHidden] && v34)
      {
        uint64_t v35 = [v34 colorWithAlphaComponent:0.2];

        id v33 = (id)v35;
      }
    }
    else
    {
      id v34 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v32 = [v27 navigationBarTintAdjustmentMode];
    }
    else {
      uint64_t v32 = 0;
    }

    id v10 = v93;
  }
  else
  {
    id v29 = v6;
    id v33 = 0;
    char v31 = 0;
    uint64_t v32 = 0;
    id v34 = 0;
    uint64_t v28 = 0;
    double v30 = 1.0;
  }
  v36 = [v7 _backgroundView];
  [v36 setAlpha:v30];

  [v7 _setShadowAlpha:v30];
  [(SUUINavigationController *)self _configureNavigationBar:v7 withTintColor:v10 tintAdjustmentMode:v32 titleTextTintColor:v34 shouldTintTitleText:v31 & 1 accessibilityButtonBackgroundTintColor:v33];
  v37 = [(SUUINavigationController *)self existingPaletteForEdge:2];
  [(SUUINavigationController *)self _setNavigationPalette:v37 hidesPaletteShadow:v28];

  id v6 = v29;
  v12 = v94;
  v8 = v97;
LABEL_63:
}

uint64_t __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    BOOL v4 = [*(id *)(a1 + 32) _backgroundView];
    [v4 setAlpha:*(double *)(a1 + 80)];

    [*(id *)(a1 + 32) _setShadowAlpha:*(double *)(a1 + 88)];
    [*(id *)(a1 + 40) _configureNavigationBar:*(void *)(a1 + 32) withTintColor:*(void *)(a1 + 48) tintAdjustmentMode:*(void *)(a1 + 96) titleTextTintColor:*(void *)(a1 + 56) shouldTintTitleText:*(unsigned __int8 *)(a1 + 104) accessibilityButtonBackgroundTintColor:*(void *)(a1 + 64)];
    objc_super v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 105);
    return [v5 _setNavigationPalette:v6 hidesPaletteShadow:v7];
  }
  return result;
}

uint64_t __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureNavigationBar:*(void *)(a1 + 40) withTintColor:*(void *)(a1 + 48) tintAdjustmentMode:*(void *)(a1 + 72) titleTextTintColor:*(void *)(a1 + 56) shouldTintTitleText:*(unsigned __int8 *)(a1 + 80) accessibilityButtonBackgroundTintColor:*(void *)(a1 + 64)];
}

void __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) _setBackgroundView:*(void *)(a1 + 48)];
    objc_setAssociatedObject(*(id *)(a1 + 40), "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView", 0, (void *)1);
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  if ([v6 isCancelled])
  {
    [*(id *)(a1 + 56) _setNavigationPalette:*(void *)(a1 + 64) hidesPaletteShadow:*(unsigned __int8 *)(a1 + 89)];
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) _backgroundView];
    [v3 setAlpha:*(double *)(a1 + 72)];

    [*(id *)(a1 + 40) _setShadowAlpha:*(double *)(a1 + 80)];
    BOOL v4 = *(void **)(a1 + 56);
    objc_super v5 = [v4 existingPaletteForEdge:2];
    [v4 _setNavigationPalette:v5 hidesPaletteShadow:*(unsigned __int8 *)(a1 + 88)];
  }
  if (*(unsigned char *)(a1 + 90)) {
    objc_msgSend(*(id *)(a1 + 64), "SUUI_endHidingPaletteShadow");
  }
}

- (void)_scheduleConfigurationOfNavigationBar
{
  id v3 = [(SUUINavigationController *)self transitionCoordinator];
  BOOL v4 = [(SUUINavigationController *)self topViewController];
  [(SUUINavigationController *)self _configureNavigationBarForViewController:v4 shouldIgnoreTransitionCoordinator:0];

  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__SUUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke;
    v5[3] = &unk_265400820;
    v5[4] = self;
    [v3 animateAlongsideTransition:0 completion:v5];
  }
}

uint64_t __65__SUUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleConfigurationOfNavigationBar];
}

- (void)_setNavigationPalette:(id)a3 hidesPaletteShadow:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    id object = v5;
    id v6 = objc_getAssociatedObject(v5, (const void *)kHasBeginHidingPaletteShadow);
    int v7 = [v6 BOOLValue];

    if (v4)
    {
      id v5 = object;
      if (v7) {
        goto LABEL_8;
      }
      objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, MEMORY[0x263EFFA88], (void *)1);
      objc_msgSend(object, "SUUI_beginHidingPaletteShadow");
    }
    else
    {
      id v5 = object;
      if (!v7) {
        goto LABEL_8;
      }
      objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, 0, (void *)1);
      objc_msgSend(object, "SUUI_endHidingPaletteShadow");
    }
    id v5 = object;
  }
LABEL_8:
}

- (BOOL)_topViewControllerPrefersNavigationBarBackgroundViewHidden
{
  v2 = [(SUUINavigationController *)self topViewController];
  if ([v2 conformsToProtocol:&unk_2706447B0]) {
    char v3 = [v2 prefersNavigationBarBackgroundViewHidden];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)_viewControllerNeedsNavigationBarAppearanceUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUINavigationController *)self topViewController];

  if (v5 == v4)
  {
    id v6 = [(SUUINavigationController *)self transitionCoordinator];

    if (v6)
    {
      int v7 = [(SUUINavigationController *)self topViewController];
      [(SUUINavigationController *)self _configureNavigationBarForViewController:v7 shouldIgnoreTransitionCoordinator:1];
    }
    [(SUUINavigationController *)self _scheduleConfigurationOfNavigationBar];
  }
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1) {
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global);
  }
  v2 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  return v2;
}

uint64_t __74__SUUINavigationController__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
  uint64_t v1 = _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end