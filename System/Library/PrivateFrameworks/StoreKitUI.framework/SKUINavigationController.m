@interface SKUINavigationController
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
- (void)childViewControllerForStatusBarHidden;
- (void)childViewControllerForStatusBarStyle;
- (void)description;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation SKUINavigationController

- (id)description
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUINavigationController *)v3 description];
      }
    }
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = (void *)[v11 initWithFormat:@"<%@: %p", v13, self];

  v15 = [(SKUINavigationController *)self tabBarItem];
  v16 = [v15 title];

  if (v16) {
    [v14 appendFormat:@"; title = %@", v16];
  }
  [v14 appendString:@">"];

  return v14;
}

- (id)childViewControllerForStatusBarHidden
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUINavigationController *)v3 childViewControllerForStatusBarHidden];
      }
    }
  }
  if ([(SKUINavigationController *)self _topViewControllerPrefersNavigationBarBackgroundViewHidden])
  {
    id v11 = [(SKUINavigationController *)self topViewController];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUINavigationController;
    id v11 = [(SKUINavigationController *)&v13 childViewControllerForStatusBarHidden];
  }

  return v11;
}

- (id)childViewControllerForStatusBarStyle
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUINavigationController *)v3 childViewControllerForStatusBarStyle];
      }
    }
  }
  if ([(SKUINavigationController *)self _topViewControllerPrefersNavigationBarBackgroundViewHidden])
  {
    id v11 = [(SKUINavigationController *)self topViewController];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUINavigationController;
    id v11 = [(SKUINavigationController *)&v13 childViewControllerForStatusBarStyle];
  }

  return v11;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUINavigationController popToRootViewControllerAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationController;
  objc_super v13 = [(SKUINavigationController *)&v15 popToRootViewControllerAnimated:v3];
  [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];

  return v13;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUINavigationController popToViewController:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUINavigationController;
  objc_super v15 = [(SKUINavigationController *)&v17 popToViewController:v6 animated:v4];
  [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];

  return v15;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUINavigationController popViewControllerAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationController;
  uint64_t v13 = [(SKUINavigationController *)&v15 popViewControllerAnimated:v3];
  [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];

  return v13;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUINavigationController pushViewController:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationController;
  [(SKUINavigationController *)&v15 pushViewController:v6 animated:v4];
  [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUINavigationController setViewControllers:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationController;
  [(SKUINavigationController *)&v15 setViewControllers:v6 animated:v4];
  [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUINavigationController attachPalette:isPinned:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUINavigationController;
  [(SKUINavigationController *)&v16 attachPalette:v6 isPinned:v4];
  objc_super v15 = [(SKUINavigationController *)self topViewController];
  [(SKUINavigationController *)self _configureNavigationBarForViewController:v15 shouldIgnoreTransitionCoordinator:0];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUINavigationController didShowViewController:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationController;
  [(SKUINavigationController *)&v15 didShowViewController:v6 animated:v4];
  [(SKUINavigationController *)self setNeedsStatusBarAppearanceUpdate];
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
    objc_super v16 = (void *)[v15 mutableCopy];
    id v17 = v16;
    if (v13)
    {
      if (!v16) {
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      [v17 setObject:v13 forKey:*MEMORY[0x1E4FB0700]];
    }
    else
    {
      [v16 removeObjectForKey:*MEMORY[0x1E4FB0700]];
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
  BOOL v7 = [(SKUINavigationController *)self navigationBar];
  uint64_t v8 = [(SKUINavigationController *)self view];
  BOOL v9 = [v8 window];

  if (v9)
  {
    id v10 = [v8 tintColor];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = [(SKUINavigationController *)self transitionCoordinator];
  uint64_t v12 = v11;
  if (v11 && !v4)
  {
    id v13 = [v11 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
    id v14 = [v12 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    if (v13 != v6 && v14 != v6)
    {
      id v33 = 0;
      id v34 = 0;
LABEL_62:

      goto LABEL_63;
    }
    id v92 = v14;
    objc_super v16 = [v7 _backgroundView];
    [v16 alpha];
    uint64_t v18 = v17;

    [v7 _shadowAlpha];
    uint64_t v20 = v19;
    v78 = [(SKUINavigationController *)self existingPaletteForEdge:2];
    v21 = objc_getAssociatedObject(v78, (const void *)kHasBeginHidingPaletteShadow);
    char v91 = [v21 BOOLValue];

    uint64_t v22 = [v7 tintColor];
    uint64_t v77 = [v7 tintAdjustmentMode];
    v23 = [v7 titleTextAttributes];
    uint64_t v24 = [v23 objectForKey:*MEMORY[0x1E4FB0700]];

    v84 = (void *)v24;
    BOOL v25 = v24 != 0;
    v86 = [v7 _accessibilityButtonBackgroundTintColor];
    v80 = (void *)v22;
    if ([v13 conformsToProtocol:&unk_1F1DC6B30]) {
      int v26 = [v13 prefersNavigationBarBackgroundViewHidden];
    }
    else {
      int v26 = 0;
    }
    v88 = v13;
    id v89 = v6;
    if (![v92 conformsToProtocol:&unk_1F1DC6B30])
    {
      unsigned int v39 = 0;
      v90 = 0;
      uint64_t v75 = 0;
      v76 = 0;
      double v40 = 1.0;
      BOOL v41 = v25;
      char v74 = v25;
LABEL_47:
      v47 = objc_getAssociatedObject(v7, "com.apple.StoreKitUI.SKUINavigationController.originalBackgroundView");
      if (!v47)
      {
        v47 = [v7 _backgroundView];
        objc_setAssociatedObject(v7, "com.apple.StoreKitUI.SKUINavigationController.originalBackgroundView", v47, (void *)1);
      }
      v98 = v8;
      unsigned int v96 = v39;
      v83 = v47;
      char v82 = v26 ^ v39;
      if ((v26 ^ v39) == 1)
      {
        if ((v26 | v39) == 1)
        {
          v48 = (void *)MEMORY[0x1E4FB30D0];
          if (!v26) {
            v48 = (void *)MEMORY[0x1E4FB30C0];
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
        v65 = objc_msgSend(objc_alloc((Class)-[SKUINavigationController navigationBarClass](self, "navigationBarClass")), "initWithFrame:", v52, v54, v56, v58);
        objc_msgSend(v65, "setBarStyle:", objc_msgSend(v7, "barStyle"));
        v66 = [v7 barTintColor];
        [v65 setBarTintColor:v66];

        [v7 _setBackgroundView:0];
        v67 = [v65 layer];
        [v67 setZPosition:100.0];

        v79 = v65;
        [v73 addSubview:v65];
        [v7 _setShadowAlpha:0.0];
        objc_msgSend(v49, "SKUI_beginHidingPaletteShadow");
        [(SKUINavigationController *)self _setNavigationPalette:v49 hidesPaletteShadow:v96];
      }
      else
      {
        v79 = 0;
        uint64_t v50 = v77;
        v49 = v78;
      }
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke;
      v117[3] = &unk_1E642AE40;
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
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2;
      v110[3] = &unk_1E642AE68;
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
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3;
      v99[3] = &unk_1E642AE90;
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
      uint64_t v8 = v98;
      goto LABEL_62;
    }
    v95 = v12;
    id v38 = v92;
    unsigned int v39 = [v38 prefersNavigationBarBackgroundViewHidden];
    if (v39)
    {
      v90 = [(SKUINavigationController *)self _accessibilityButtonBackgroundDefaultTintColor];
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
    uint64_t v12 = v95;
    goto LABEL_47;
  }
  v94 = v11;
  v97 = v8;
  if ([v6 conformsToProtocol:&unk_1F1DC6B30])
  {
    id v27 = v6;
    uint64_t v28 = [v27 prefersNavigationBarBackgroundViewHidden];
    id v29 = v6;
    if (v28)
    {
      id v33 = [(SKUINavigationController *)self _accessibilityButtonBackgroundDefaultTintColor];
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
  [(SKUINavigationController *)self _configureNavigationBar:v7 withTintColor:v10 tintAdjustmentMode:v32 titleTextTintColor:v34 shouldTintTitleText:v31 & 1 accessibilityButtonBackgroundTintColor:v33];
  v37 = [(SKUINavigationController *)self existingPaletteForEdge:2];
  [(SKUINavigationController *)self _setNavigationPalette:v37 hidesPaletteShadow:v28];

  id v6 = v29;
  uint64_t v12 = v94;
  uint64_t v8 = v97;
LABEL_63:
}

uint64_t __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    BOOL v4 = [*(id *)(a1 + 32) _backgroundView];
    [v4 setAlpha:*(double *)(a1 + 80)];

    [*(id *)(a1 + 32) _setShadowAlpha:*(double *)(a1 + 88)];
    [*(id *)(a1 + 40) _configureNavigationBar:*(void *)(a1 + 32) withTintColor:*(void *)(a1 + 48) tintAdjustmentMode:*(void *)(a1 + 96) titleTextTintColor:*(void *)(a1 + 56) shouldTintTitleText:*(unsigned __int8 *)(a1 + 104) accessibilityButtonBackgroundTintColor:*(void *)(a1 + 64)];
    BOOL v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 105);
    return [v5 _setNavigationPalette:v6 hidesPaletteShadow:v7];
  }
  return result;
}

uint64_t __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureNavigationBar:*(void *)(a1 + 40) withTintColor:*(void *)(a1 + 48) tintAdjustmentMode:*(void *)(a1 + 72) titleTextTintColor:*(void *)(a1 + 56) shouldTintTitleText:*(unsigned __int8 *)(a1 + 80) accessibilityButtonBackgroundTintColor:*(void *)(a1 + 64)];
}

void __103__SKUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) _setBackgroundView:*(void *)(a1 + 48)];
    objc_setAssociatedObject(*(id *)(a1 + 40), "com.apple.StoreKitUI.SKUINavigationController.originalBackgroundView", 0, (void *)1);
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  if ([v6 isCancelled])
  {
    [*(id *)(a1 + 56) _setNavigationPalette:*(void *)(a1 + 64) hidesPaletteShadow:*(unsigned __int8 *)(a1 + 89)];
  }
  else
  {
    BOOL v3 = [*(id *)(a1 + 40) _backgroundView];
    [v3 setAlpha:*(double *)(a1 + 72)];

    [*(id *)(a1 + 40) _setShadowAlpha:*(double *)(a1 + 80)];
    BOOL v4 = *(void **)(a1 + 56);
    BOOL v5 = [v4 existingPaletteForEdge:2];
    [v4 _setNavigationPalette:v5 hidesPaletteShadow:*(unsigned __int8 *)(a1 + 88)];
  }
  if (*(unsigned char *)(a1 + 90)) {
    objc_msgSend(*(id *)(a1 + 64), "SKUI_endHidingPaletteShadow");
  }
}

- (void)_scheduleConfigurationOfNavigationBar
{
  BOOL v3 = [(SKUINavigationController *)self transitionCoordinator];
  BOOL v4 = [(SKUINavigationController *)self topViewController];
  [(SKUINavigationController *)self _configureNavigationBarForViewController:v4 shouldIgnoreTransitionCoordinator:0];

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__SKUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke;
    v5[3] = &unk_1E6422278;
    v5[4] = self;
    [v3 animateAlongsideTransition:0 completion:v5];
  }
}

uint64_t __65__SKUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke(uint64_t a1)
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
      objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, MEMORY[0x1E4F1CC38], (void *)1);
      objc_msgSend(object, "SKUI_beginHidingPaletteShadow");
    }
    else
    {
      id v5 = object;
      if (!v7) {
        goto LABEL_8;
      }
      objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, 0, (void *)1);
      objc_msgSend(object, "SKUI_endHidingPaletteShadow");
    }
    id v5 = object;
  }
LABEL_8:
}

- (BOOL)_topViewControllerPrefersNavigationBarBackgroundViewHidden
{
  v2 = [(SKUINavigationController *)self topViewController];
  if ([v2 conformsToProtocol:&unk_1F1DC6B30]) {
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
  id v5 = [(SKUINavigationController *)self topViewController];

  if (v5 == v4)
  {
    id v6 = [(SKUINavigationController *)self transitionCoordinator];

    if (v6)
    {
      int v7 = [(SKUINavigationController *)self topViewController];
      [(SKUINavigationController *)self _configureNavigationBarForViewController:v7 shouldIgnoreTransitionCoordinator:1];
    }
    [(SKUINavigationController *)self _scheduleConfigurationOfNavigationBar];
  }
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1) {
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global_67);
  }
  v2 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;

  return v2;
}

uint64_t __74__SKUINavigationController__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
  uint64_t v1 = _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)description
{
}

- (void)childViewControllerForStatusBarHidden
{
}

- (void)childViewControllerForStatusBarStyle
{
}

- (void)popToRootViewControllerAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)popToViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)popViewControllerAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pushViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setViewControllers:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attachPalette:(uint64_t)a3 isPinned:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didShowViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end