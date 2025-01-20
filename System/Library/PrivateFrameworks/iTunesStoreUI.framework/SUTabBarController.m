@interface SUTabBarController
+ (Class)_moreNavigationControllerClass;
- (BOOL)_isReloadingUnderneathTransientViewController;
- (BOOL)_saveNavigationPathToDefaults;
- (BOOL)_saveTransientNavigationPathToDefaults;
- (BOOL)loadFromDefaults;
- (BOOL)loadFromDefaultsAndSetSections:(id)a3;
- (BOOL)presentOverlayBackgroundViewController:(id)a3;
- (BOOL)saveOrderingToDefaults;
- (BOOL)saveToDefaults;
- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4;
- (NSArray)sections;
- (NSString)moreListTitle;
- (NSString)selectedIdentifier;
- (SUClientInterface)clientInterface;
- (SUPreviewOverlayViewController)_previewOverlayViewController;
- (SUTabBarController)init;
- (SUTabBarController)initWithClientInterface:(id)a3;
- (id)_archivedContextsForViewController:(id)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_rootViewControllerForSection:(id)a3;
- (id)_sectionForIdentifier:(id)a3;
- (id)_sectionForType:(int64_t)a3;
- (id)_sectionForViewController:(id)a3;
- (id)_timingFunctionForAnimation;
- (id)_viewControllerForContext:(id)a3;
- (id)overlayBackgroundViewController;
- (id)rotatingFooterView;
- (id)rotatingHeaderView;
- (id)selectedViewController;
- (id)viewControllerForSectionIdentifier:(id)a3;
- (id)viewControllerForSectionType:(int64_t)a3;
- (int64_t)ITunesStoreUIBarStyle;
- (unint64_t)indexOfViewControllerWithSectionType:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationDidChangeStatusBarFrame:(id)a3;
- (void)_applyMoreListConfiguration;
- (void)_beginReloadingUnderneathTransientViewController;
- (void)_endReloadingUnderneathTransientViewController;
- (void)_fixupTabBarSelection;
- (void)_fixupViewControllers;
- (void)_hidePreviewOverlayAnimated:(BOOL)a3;
- (void)_longPressAction:(id)a3;
- (void)_moveTransientViewController:(id)a3 toSectionWithIdentifier:(id)a4 asRoot:(BOOL)a5;
- (void)_moveView:(id)a3 toView:(id)a4;
- (void)_partnerChanged:(id)a3;
- (void)_reloadViewControllersFromSections:(id)a3 animated:(BOOL)a4;
- (void)_restoreArchivedContexts:(id)a3;
- (void)_restoreArchivedTransientContexts:(id)a3;
- (void)_restoreOverlayContexts:(id)a3;
- (void)_setSelectedViewController:(id)a3;
- (void)_setStoreBarStyle:(int64_t)a3;
- (void)_showPreviewOverlay:(id)a3 animated:(BOOL)a4;
- (void)_transitionSafeHandlePartnerChange:(id)a3;
- (void)cancelTransientViewController:(id)a3;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)dismissOverlayBackgroundViewController;
- (void)loadView;
- (void)pushTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4;
- (void)reloadSectionVisibilityAnimated:(BOOL)a3;
- (void)reloadSectionWithIdentifier:(id)a3 URL:(id)a4;
- (void)resetToSystemDefaults;
- (void)resetUserDefaults;
- (void)scriptOverlayBackgroundDidDismiss:(id)a3;
- (void)selectDefaultSection;
- (void)selectSectionOfType:(int64_t)a3;
- (void)setMoreListSelectedImage:(id)a3 unselectedImage:(id)a4;
- (void)setMoreListTitle:(id)a3;
- (void)setSectionOrdering:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedIdentifier:(id)a3;
- (void)setTransientViewController:(id)a3 animated:(BOOL)a4;
- (void)setTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5;
- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5;
- (void)tabBar:(id)a3 willShowCustomizationSheet:(id)a4 withNavigationBar:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SUTabBarController

- (SUTabBarController)init
{
  id v3 = +[SUClientDispatch clientInterface];

  return [(SUTabBarController *)self initWithClientInterface:v3];
}

- (SUTabBarController)initWithClientInterface:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SUTabBarController;
  v4 = [(SUTabBarController *)&v14 init];
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1) {
      [(SUTabBarController *)v4 _setMaximumNumberOfItems:9];
    }
    v5 = (void *)[(SUTabBarController *)v4 tabBar];
    v6 = [(SUUIAppearance *)[(SUClientInterface *)v4->_clientInterface appearance] tabBarAppearance];
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "setBackgroundImage:", -[SUTabBarAppearance backgroundImage](v6, "backgroundImage"));
      objc_msgSend(v5, "_setSelectionIndicatorImage:", -[SUTabBarAppearance selectionIndicatorImage](v7, "selectionIndicatorImage"));
      [(SUTabBarAppearance *)v7 tabBarButtonWidth];
      if (v8 > 0.00000011920929)
      {
        objc_msgSend(v5, "_setTabButtonWidth:");
        [(SUTabBarAppearance *)v7 tabBarButtonSpacing];
        objc_msgSend(v5, "_setInterTabButtonSpacing:");
      }
      if (([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG] & 1) == 0)
      {
        uint64_t v9 = [(SUTabBarAppearance *)v7 dividerImage];
        uint64_t v10 = [(SUTabBarAppearance *)v7 selectedDividerImage];
        [v5 _setDividerImage:v9 forLeftButtonState:0 rightButtonState:0];
        [v5 _setDividerImage:v10 forLeftButtonState:1 rightButtonState:0];
      }
    }
    else
    {
      v11 = objc_alloc_init(SUNavigationBarBackgroundView);
      v4->_tabBarBackdropView = v11;
      [(SUNavigationBarBackgroundView *)v11 setSeparatorOnTop:1];
      [v5 _setBackgroundView:v4->_tabBarBackdropView];
      [v5 setTranslucent:1];
    }
    v12 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v4 selector:sel__applicationDidChangeStatusBarFrame_ name:*MEMORY[0x263F1D040] object:0];
    [v12 addObserver:v4 selector:sel__partnerChanged_ name:@"SUPartnerChangedNotification" object:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D040] object:0];
  [v3 removeObserver:self name:@"SUPartnerChangedNotification" object:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v5 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [(SUTabBarController *)self removeChildViewController:v9];
        [v9 setDelegate:0];
      }
      uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 dealloc];
}

- (BOOL)loadFromDefaultsAndSetSections:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];

  self->_preloadedViewController = 0;
  self->_preloadedViewControllerIdentifier = 0;
  self->_preloadedViewControllerKey = 0;
  uint64_t v5 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  [MEMORY[0x263F08928] setClass:objc_opt_class() forClassName:@"ISURLRequest"];
  uint64_t v6 = [v5 objectForKey:@"SUTransientNavigationPath"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v54 = 0;
    uint64_t v7 = (void *)MEMORY[0x263F08928];
    double v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    objc_super v10 = objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), v6, &v54);
    if (v54)
    {
      long long v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v13 &= 2u;
      }
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        int v58 = 138543618;
        uint64_t v59 = v14;
        __int16 v60 = 2114;
        uint64_t v61 = v54;
        LODWORD(v45) = 22;
        v44 = &v58;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v58, v45);
          free(v16);
          v44 = (int *)v17;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count])
    {
      self->_preloadedViewController = (SUViewController *)-[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", [v10 lastObject]);
      self->_preloadedViewControllerKey = (NSString *)@"SUTransientNavigationPath";
    }
  }
  if (!self->_preloadedViewController)
  {
    uint64_t v18 = [v5 objectForKey:@"SUSectionNavigationPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v54 = 0;
      v19 = (void *)MEMORY[0x263F08928];
      v20 = (void *)MEMORY[0x263EFFA08];
      v57[0] = objc_opt_class();
      v57[1] = objc_opt_class();
      v21 = objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v20, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v57, 2)), v18, &v54);
      if (v54)
      {
        v22 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v23 = [v22 shouldLog];
        if ([v22 shouldLogToDisk]) {
          int v24 = v23 | 2;
        }
        else {
          int v24 = v23;
        }
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject", v44), OS_LOG_TYPE_ERROR)) {
          v24 &= 2u;
        }
        if (v24)
        {
          uint64_t v25 = objc_opt_class();
          int v58 = 138543618;
          uint64_t v59 = v25;
          __int16 v60 = 2114;
          uint64_t v61 = v54;
          LODWORD(v45) = 22;
          v44 = &v58;
          uint64_t v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v58, v45);
            free(v27);
            v44 = (int *)v28;
            SSFileLog();
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v21 count]) {
          v29 = objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", 0), "sectionIdentifier");
        }
        else {
          v29 = 0;
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v56, 16, v44);
        if (v30)
        {
          uint64_t v31 = v30;
          int v32 = 0;
          uint64_t v33 = *(void *)v51;
          while (2)
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v51 != v33) {
                objc_enumerationMutation(v21);
              }
              if ([*(id *)(*((void *)&v50 + 1) + 8 * i) type])
              {
                if (v32 > 0)
                {
                  if (objc_msgSend((id)objc_msgSend(v21, "lastObject"), "sectionIdentifier"))
                  {
                    self->_preloadedViewController = (SUViewController *)-[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", [v21 lastObject]);
                    self->_preloadedViewControllerKey = (NSString *)@"SUSectionNavigationPath";
                  }
                  goto LABEL_42;
                }
                int v32 = 1;
              }
            }
            uint64_t v31 = [v21 countByEnumeratingWithState:&v50 objects:v56 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }
LABEL_42:
        if (!self->_preloadedViewController && v29)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v35 = [a3 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            v37 = 0;
            uint64_t v38 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v47 != v38) {
                  objc_enumerationMutation(a3);
                }
                v40 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v40, "identifier"), "isEqualToString:", v29)) {
                  v37 = v40;
                }
              }
              uint64_t v36 = [a3 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v36);
          }
          else
          {
            v37 = 0;
          }
          self->_preloadedViewController = (SUViewController *)[(SUTabBarController *)self _rootViewControllerForSection:v37];
          self->_preloadedViewControllerIdentifier = (NSString *)v29;
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    preloadedViewController = self->_preloadedViewController;
    uint64_t v42 = [(SUViewController *)preloadedViewController loadsWhenHidden];
    [(SUViewController *)preloadedViewController setLoadsWhenHidden:1];
    [(SUViewController *)preloadedViewController reload];
    [(SUViewController *)preloadedViewController setLoadsWhenHidden:v42];
  }
  -[SUTabBarController setSections:](self, "setSections:", a3, v44);
  [(SUTabBarController *)self loadFromDefaults];

  self->_preloadedViewController = 0;
  self->_preloadedViewControllerIdentifier = 0;
  self->_preloadedViewControllerKey = 0;
  return 1;
}

- (BOOL)loadFromDefaults
{
  v50[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  [MEMORY[0x263F08928] setClass:objc_opt_class() forClassName:@"ISURLRequest"];
  uint64_t v4 = [v3 objectForKey:@"SURootSections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUTabBarController *)self setSectionOrdering:v4];
  }
  uint64_t v5 = [v3 objectForKey:@"SUSectionNavigationPath"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v43 = 0;
    uint64_t v6 = (void *)MEMORY[0x263F08928];
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v50, 2)), v5, &v43);
    if (v43)
    {
      uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (v11)
      {
        uint64_t v12 = objc_opt_class();
        int v46 = 138543618;
        uint64_t v47 = v12;
        __int16 v48 = 2114;
        uint64_t v49 = v43;
        LODWORD(v42) = 22;
        v39 = &v46;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v46, v42);
          free(v14);
          v39 = (int *)v15;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUTabBarController *)self _restoreArchivedContexts:v8];
    }
  }
  uint64_t v16 = objc_msgSend(v3, "objectForKey:", @"SUOverlayContexts", v39);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v43 = 0;
    uint64_t v17 = (void *)MEMORY[0x263F08928];
    uint64_t v18 = (void *)MEMORY[0x263EFFA08];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v18, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v45, 2)), v16, &v43);
    if (v43)
    {
      v20 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v22 &= 2u;
      }
      if (v22)
      {
        uint64_t v23 = objc_opt_class();
        int v46 = 138543618;
        uint64_t v47 = v23;
        __int16 v48 = 2114;
        uint64_t v49 = v43;
        LODWORD(v42) = 22;
        v40 = &v46;
        uint64_t v24 = _os_log_send_and_compose_impl();
        if (v24)
        {
          uint64_t v25 = (void *)v24;
          uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v46, v42);
          free(v25);
          v40 = (int *)v26;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUTabBarController *)self _restoreOverlayContexts:v19];
    }
  }
  if ([(SUTabBarController *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_ignoreTabReselection = 1;
    [(SUTabBarController *)self setSelectedIndex:0];
    self->_ignoreTabReselection = 0;
  }
  uint64_t v27 = [v3 objectForKey:@"SUTransientNavigationPath"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v43 = 0;
    uint64_t v28 = (void *)MEMORY[0x263F08928];
    v29 = (void *)MEMORY[0x263EFFA08];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v29, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v44, 2)), v27, &v43);
    if (v43)
    {
      uint64_t v31 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v32 = [v31 shouldLog];
      if ([v31 shouldLogToDisk]) {
        int v33 = v32 | 2;
      }
      else {
        int v33 = v32;
      }
      if (!os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v33 &= 2u;
      }
      if (v33)
      {
        uint64_t v34 = objc_opt_class();
        int v46 = 138543618;
        uint64_t v47 = v34;
        __int16 v48 = 2114;
        uint64_t v49 = v43;
        LODWORD(v42) = 22;
        v41 = &v46;
        uint64_t v35 = _os_log_send_and_compose_impl();
        if (v35)
        {
          uint64_t v36 = (void *)v35;
          uint64_t v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v46, v42);
          free(v36);
          v41 = (int *)v37;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUTabBarController *)self _restoreArchivedTransientContexts:v30];
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v41), "postNotificationName:object:", @"SUTabBarControllerDidLoadNotification", self);
  return 1;
}

- (void)pushTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4
{
}

- (void)reloadSectionVisibilityAnimated:(BOOL)a3
{
}

- (void)reloadSectionWithIdentifier:(id)a3 URL:(id)a4
{
  [(SUTabBarController *)self setSelectedIdentifier:a3];
  id v6 = [(UITabBarController *)self selectedNavigationController];
  if (v6 == (id)[(SUTabBarController *)self moreNavigationController])
  {
    uint64_t v7 = (void *)[v6 viewControllers];
    if ((unint64_t)[v7 count] >= 3) {
      objc_msgSend(v6, "popToViewController:animated:", objc_msgSend(v7, "objectAtIndex:", 1), 0);
    }
  }
  else
  {
    [v6 popToRootViewControllerAnimated:0];
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "viewControllers"), "lastObject");
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:a4];
    [v8 reloadWithURLRequestProperties:v9];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v8 reload];
  }
}

- (void)resetToSystemDefaults
{
  [(SUTabBarController *)self resetUserDefaults];
  [(SUTabBarController *)self selectDefaultSection];
  id v3 = [(UITabBarController *)self selectedNavigationController];

  [v3 popToRootViewControllerAnimated:0];
}

- (void)resetUserDefaults
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:@"SUNavigationAccountID"];
  [v2 removeObjectForKey:@"SURootSections"];
  [v2 removeObjectForKey:@"SUSectionNavigationPath"];
  [v2 removeObjectForKey:@"SUTransientNavigationPath"];

  [v2 synchronize];
}

- (BOOL)saveOrderingToDefaults
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = (void *)[(SUTabBarController *)self viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) section];
        if (([v9 isTransient] & 1) == 0 && objc_msgSend(v9, "identifier")) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "identifier"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v3, @"SURootSections");

  return 1;
}

- (BOOL)saveToDefaults
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  if (v3) {
    [v4 setObject:v3 forKey:@"SUNavigationAccountID"];
  }
  else {
    [v4 removeObjectForKey:@"SUNavigationAccountID"];
  }
  if (![(SUTabBarController *)self saveOrderingToDefaults]
    || ![(SUTabBarController *)self _saveNavigationPathToDefaults]
    || ![(SUTabBarController *)self _saveTransientNavigationPathToDefaults])
  {
    return 0;
  }
  uint64_t v5 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v5 synchronize];
}

- (void)selectDefaultSection
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(SUTabBarController *)self viewControllers];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v9, "section"), "isDefaultSection"))
          {
            uint64_t v4 = (uint64_t)v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
    [(SUTabBarController *)self setSelectedViewController:v4];
  }
}

- (void)selectSectionOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[(SUTabBarController *)self viewControllers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * i) section];
        if ([v10 type] == a3)
        {
          uint64_t v11 = [v10 identifier];
          if (v11) {
            [(SUTabBarController *)self setSelectedIdentifier:v11];
          }
          return;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (void)setMoreListSelectedImage:(id)a3 unselectedImage:(id)a4
{
  moreListSelectedImage = self->_moreListSelectedImage;
  if (moreListSelectedImage == a3)
  {
    p_moreListUnselectedImage = &self->_moreListUnselectedImage;
    moreListUnselectedImage = self->_moreListUnselectedImage;
    if (moreListUnselectedImage == a4) {
      return;
    }
  }
  else
  {

    self->_moreListSelectedImage = (UIImage *)a3;
    p_moreListUnselectedImage = &self->_moreListUnselectedImage;
    moreListUnselectedImage = self->_moreListUnselectedImage;
    if (moreListUnselectedImage == a4) {
      goto LABEL_6;
    }
  }

  *p_moreListUnselectedImage = (UIImage *)a4;
LABEL_6:

  [(SUTabBarController *)self _applyMoreListConfiguration];
}

- (void)setMoreListTitle:(id)a3
{
  moreListTitle = self->_moreListTitle;
  if (moreListTitle != a3)
  {

    self->_moreListTitle = (NSString *)a3;
    [(SUTabBarController *)self _applyMoreListConfiguration];
  }
}

- (void)setSectionOrdering:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v24 = [(SUTabBarController *)self selectedIdentifier];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v23 = self;
  uint64_t v6 = objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "mutableCopy");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [v6 count];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          while (1)
          {
            long long v15 = (void *)[v6 objectAtIndex:v14];
            uint64_t v16 = (void *)[v15 section];
            if ([v16 identifier])
            {
              if (objc_msgSend((id)objc_msgSend(v16, "identifier"), "isEqualToString:", v11)) {
                break;
              }
            }
            if (v13 == ++v14) {
              goto LABEL_13;
            }
          }
          [v5 addObject:v15];
          [v6 removeObjectAtIndex:v14];
        }
LABEL_13:
        ;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v6);
        }
        int v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v22, "section"), "isTransient")) {
          [v5 insertObject:v22 atIndex:v19++];
        }
        else {
          [v5 addObject:v22];
        }
      }
      uint64_t v18 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }
  [(SUTabBarController *)v23 setViewControllers:v5];
  [(SUTabBarController *)v23 setSelectedIdentifier:v24];
}

- (void)setTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4
{
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)ITunesStoreUIBarStyle
{
  return self->_storeBarStyle;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v7 loadView];
  uint64_t v3 = (void *)[(SUTabBarController *)self view];
  uint64_t v4 = [SUHitTestView alloc];
  [v3 frame];
  id v5 = -[SUHitTestView initWithFrame:](v4, "initWithFrame:");
  -[SUHitTestView setAutoresizingMask:](v5, "setAutoresizingMask:", [v3 autoresizingMask]);
  [(SUHitTestView *)v5 bounds];
  objc_msgSend(v3, "setFrame:");
  [(SUHitTestView *)v5 addSubview:v3];
  [(SUTabBarController *)self setView:v5];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__longPressAction_];
  objc_msgSend((id)-[SUTabBarController tabBar](self, "tabBar"), "addGestureRecognizer:", v6);
}

- (id)rotatingFooterView
{
  if ([(SUTabBarController *)self overlayBackgroundViewController]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUTabBarController;
  return [(SUTabBarController *)&v4 rotatingFooterView];
}

- (id)rotatingHeaderView
{
  if ([(SUTabBarController *)self overlayBackgroundViewController]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUTabBarController;
  return [(SUTabBarController *)&v4 rotatingHeaderView];
}

- (id)_sectionForViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((id)[(SUTabBarController *)self moreNavigationController] != a3
    || (unint64_t)objc_msgSend((id)objc_msgSend(a3, "viewControllers"), "count") < 2)
  {
    return 0;
  }
  id v5 = (void *)[(SUTabBarController *)self viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id result = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend((id)objc_msgSend(v10, "viewControllers"), "count")) {
          return (id)[v10 section];
        }
      }
      id v7 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id result = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)_setSelectedViewController:(id)a3
{
  if ([(SUTabBarController *)self _isReloadingUnderneathTransientViewController])
  {
    self->_preTransientSelectedViewController = (UIViewController *)a3;
  }
  else
  {
    id v5 = [(SUTabBarController *)self selectedViewController];
    id v6 = (id)[(SUTabBarController *)self transientViewController];
    if (v6 && v6 != a3) {
      self->_preTransientSelectedViewController = (UIViewController *)a3;
    }
    if (v5)
    {
      if (v5 != a3)
      {
        uint64_t v7 = [a3 ITunesStoreUIBarStyle];
        if (v7 != self->_storeBarStyle)
        {
          uint64_t v8 = v7;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v9 = a3;
          }
          else {
            id v9 = 0;
          }
          [v9 _setStoreBarStyle:v8 clientInterface:self->_clientInterface];
          [(SUTabBarController *)self _setStoreBarStyle:v8];
          long long v10 = (void *)[MEMORY[0x263F1C408] sharedApplication];
          uint64_t v11 = [v10 statusBarStyle];
          if (v8 == 1)
          {
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v12 = v11;
            if (v8 == 2) {
              uint64_t v12 = 1;
            }
          }
          [v10 setStatusBarStyle:v12 animated:0];
        }
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)SUTabBarController;
    [(SUTabBarController *)&v13 _setSelectedViewController:a3];
    if (v5 == a3 && !self->_ignoreTabReselection) {
      objc_msgSend(-[SUTabBarController selectedViewController](self, "selectedViewController"), "tabBarControllerDidReselectTabBarItem:", self);
    }
  }
}

- (id)selectedViewController
{
  v5.receiver = self;
  v5.super_class = (Class)SUTabBarController;
  id v3 = [(SUTabBarController *)&v5 selectedViewController];
  if (v3 == (id)[(SUTabBarController *)self transientViewController]) {
    return self->_preTransientSelectedViewController;
  }
  return v3;
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if (!self->_preTransientSelectedViewController) {
      self->_preTransientSelectedViewController = (UIViewController *)[(SUTabBarController *)self selectedViewController];
    }
  }
  else
  {
    if ([(SUTabBarController *)self _isReloadingUnderneathTransientViewController])
    {
      return;
    }
    self->_preTransientSelectedViewController = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v9 setTransientViewController:a3 animated:0];
  id v6 = (void *)[(SUTabBarController *)self tabBar];
  int v7 = [v6 isUserInteractionEnabled];
  if (!a3 && v7)
  {
    if (self->_preTransientSelectedViewController)
    {
      uint64_t v8 = [v6 isLocked];
      [v6 setLocked:0];
      objc_msgSend(v6, "setSelectedItem:", -[UIViewController tabBarItem](self->_preTransientSelectedViewController, "tabBarItem"));
      [v6 setLocked:v8];
    }
  }
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_preTransientSelectedViewController
    && objc_msgSend(a3, "indexOfObjectIdenticalTo:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_preTransientSelectedViewController = 0;
  }
  self->_ignoreTabReselection = 1;
  v7.receiver = self;
  v7.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v7 setViewControllers:a3 animated:v4];
  [(SUTabBarController *)self _fixupViewControllers];
  self->_ignoreTabReselection = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "count"))
  {
    id v3 = [(SUTabBarController *)self selectedViewController];
    return [v3 supportedInterfaceOrientations];
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    return 30;
  }
  else if (SUAllowsLandscapePhone())
  {
    return 26;
  }
  else
  {
    return 2;
  }
}

- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  BOOL v5 = a5;
  if ([MEMORY[0x263F1CA30] instancesRespondToSelector:a2])
  {
    v11.receiver = self;
    v11.super_class = (Class)SUTabBarController;
    [(SUTabBarController *)&v11 tabBar:a3 didEndCustomizingItems:a4 changed:v5];
  }
  if (v5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUTabBarConfigurationChangedNotification", self);
  }
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom")
    && [(SUPreviewOverlayViewController *)self->_previewOverlayViewController isViewLoaded])
  {
    objc_super v9 = (void *)[(SUPreviewOverlayViewController *)self->_previewOverlayViewController view];
    uint64_t v10 = [(SUTabBarController *)self view];
    if ([v9 superview] != v10) {
      [(SUTabBarController *)self _moveView:v9 toView:v10];
    }
  }
}

- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  BOOL v5 = a5;
  if ([MEMORY[0x263F1CA30] instancesRespondToSelector:a2])
  {
    v9.receiver = self;
    v9.super_class = (Class)SUTabBarController;
    [(SUTabBarController *)&v9 tabBar:a3 willEndCustomizingItems:a4 changed:v5];
  }
  if (v5) {
    [(SUTabBarController *)self _fixupViewControllers];
  }
}

- (void)tabBar:(id)a3 willShowCustomizationSheet:(id)a4 withNavigationBar:(id)a5
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3), "userInterfaceIdiom"))
  {
    if ([(SUPreviewOverlayViewController *)self->_previewOverlayViewController isViewLoaded])
    {
      uint64_t v8 = (void *)[a4 superview];
      objc_super v9 = (void *)[(SUPreviewOverlayViewController *)self->_previewOverlayViewController view];
      if ((void *)[v9 superview] != v8)
      {
        [(SUTabBarController *)self _moveView:v9 toView:v8];
        [v8 insertSubview:v9 belowSubview:a4];
      }
    }
  }
  uint64_t v10 = [(SUClientInterface *)self->_clientInterface appearance];

  [(SUUIAppearance *)v10 styleNavigationBar:a5];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) viewDidAppear:v3];
      }
      uint64_t v7 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) viewDidDisappear:v3];
      }
      uint64_t v7 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) viewWillAppear:v3];
      }
      uint64_t v7 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) viewWillDisappear:v3];
      }
      uint64_t v7 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 viewWillDisappear:v3];
}

- (void)cancelTransientViewController:(id)a3
{
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend((id)-[SUTabBarController view](self, "view"), "viewWithTag:", 1920234350), "removeFromSuperview");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v6 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) didRotateFromInterfaceOrientation:a3];
      }
      uint64_t v7 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if ([(SUPreviewOverlayViewController *)self->_previewOverlayViewController isViewLoaded]) {
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "setHidden:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v10 didRotateFromInterfaceOrientation:a3];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend((id)-[SUTabBarController view](self, "view"), "viewWithTag:", 1920234350), "setAlpha:", 0.0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v8 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) willAnimateRotationToInterfaceOrientation:a3 duration:a4];
      }
      uint64_t v9 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v12 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v8 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) willRotateToInterfaceOrientation:a3 duration:a4];
      }
      uint64_t v9 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUTabBarController;
  [(SUTabBarController *)&v12 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SUTabBarController;
  unsigned int v7 = -[SUTabBarController window:shouldAutorotateToInterfaceOrientation:](&v21, sel_window_shouldAutorotateToInterfaceOrientation_);
  v20.receiver = self;
  v20.super_class = (Class)SUTabBarController;
  id v8 = [(SUTabBarController *)&v20 selectedViewController];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    unsigned int v7 = [v8 window:a3 shouldAutorotateToInterfaceOrientation:a4];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  uint64_t v11 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(overlayBackgroundViewControllers);
        }
        if (v7) {
          unsigned int v7 = [*(id *)(*((void *)&v16 + 1) + 8 * i) window:a3 shouldAutorotateToInterfaceOrientation:a4];
        }
        else {
          unsigned int v7 = 0;
        }
      }
      uint64_t v12 = [(NSMutableArray *)overlayBackgroundViewControllers countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v12);
  }
  if (v7
    && [(SUPreviewOverlayViewController *)self->_previewOverlayViewController isViewLoaded])
  {
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "setHidden:", 1);
  }
  return v7;
}

- (void)dismissOverlayBackgroundViewController
{
  id v2 = [(SUTabBarController *)self overlayBackgroundViewController];

  [v2 dismissAnimated:1];
}

- (id)overlayBackgroundViewController
{
  return (id)[(NSMutableArray *)self->_overlayBackgroundViewControllers lastObject];
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  char v5 = -[NSMutableArray containsObject:](self->_overlayBackgroundViewControllers, "containsObject:");
  if ((v5 & 1) == 0)
  {
    overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
    if (!overlayBackgroundViewControllers)
    {
      overlayBackgroundViewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_overlayBackgroundViewControllers = overlayBackgroundViewControllers;
    }
    unsigned int v7 = (void *)[(NSMutableArray *)overlayBackgroundViewControllers lastObject];
    [(SUTabBarController *)self addChildViewController:a3];
    [(NSMutableArray *)self->_overlayBackgroundViewControllers addObject:a3];
    [a3 setDelegate:self];
    [v7 viewWillDisappear:0];
    [a3 viewWillAppear:0];
    id v8 = (void *)[(SUTabBarController *)self view];
    BOOL v9 = (void *)[a3 view];
    [v8 bounds];
    objc_msgSend(v9, "setFrame:");
    [v8 addSubview:v9];
    if (-[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))objc_msgSend(v8, "bringSubviewToFront:", -[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view")); {
    [a3 viewDidAppear:0];
    }
    [v7 viewDidDisappear:0];
  }
  return v5 ^ 1;
}

- (void)scriptOverlayBackgroundDidDismiss:(id)a3
{
  id v8 = (id)[(NSMutableArray *)self->_overlayBackgroundViewControllers lastObject];
  if (v8 == a3)
  {
    unint64_t v6 = [(NSMutableArray *)self->_overlayBackgroundViewControllers count];
    char v5 = self;
    if (v6 >= 2) {
      char v5 = (SUTabBarController *)[(NSMutableArray *)self->_overlayBackgroundViewControllers objectAtIndex:v6 - 2];
    }
  }
  else
  {
    char v5 = 0;
  }
  [(SUTabBarController *)v5 viewWillAppear:0];
  id v7 = a3;
  [(NSMutableArray *)self->_overlayBackgroundViewControllers removeObjectIdenticalTo:a3];
  [a3 setDelegate:0];
  [(SUTabBarController *)self removeChildViewController:a3];
  if ([a3 isViewLoaded])
  {
    [a3 viewWillDisappear:0];
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
    [a3 viewDidDisappear:0];
  }
  [(SUTabBarController *)v5 viewDidAppear:0];
}

- (unint64_t)indexOfViewControllerWithSectionType:(int64_t)a3
{
  BOOL v4 = (void *)[(SUTabBarController *)self viewControllers];
  uint64_t v5 = [v4 count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  while (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v7), "section"), "type") != a3)
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (NSString)selectedIdentifier
{
  id v2 = objc_msgSend(-[UITabBarController selectedNavigationController](self, "selectedNavigationController"), "section");

  return (NSString *)[v2 identifier];
}

- (void)setSections:(id)a3
{
  sections = self->_sections;
  if (sections != a3)
  {

    uint64_t v6 = (NSArray *)a3;
    self->_sections = v6;
    [(SUTabBarController *)self _reloadViewControllersFromSections:v6 animated:0];
  }
}

- (void)setSelectedIdentifier:(id)a3
{
  uint64_t v5 = (void *)[(SUTabBarController *)self viewControllers];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      BOOL v9 = (void *)[v5 objectAtIndex:v8];
      uint64_t v10 = (void *)[v9 section];
      if ([v10 identifier])
      {
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "identifier"))) {
          break;
        }
      }
      if (v7 == ++v8) {
        return;
      }
    }
    if ([(SUTabBarController *)self selectedViewController] != v9)
    {
      [(SUTabBarController *)self setSelectedViewController:v9];
    }
  }
}

- (id)viewControllerForSectionIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[(SUTabBarController *)self viewControllers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = (void *)[v10 section];
        if (v11 && (objc_msgSend((id)objc_msgSend(v11, "identifier"), "isEqualToString:", a3) & 1) != 0)
        {
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend((id)objc_msgSend(v10, "viewControllers"), "count")) {
              return (id)[(SUTabBarController *)self moreNavigationController];
            }
          }
          return v10;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)viewControllerForSectionType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (void *)[(SUTabBarController *)self allViewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "section"), "type") == a3) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (id)[v9 topViewController];
  }
  return v9;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

- (void)_applicationDidChangeStatusBarFrame:(id)a3
{
  double v4 = (void *)[a3 userInfo];
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x263F1D0A8]), "CGRectValue");
  double v6 = v5;
  double v8 = v7;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarFrame");
  if (v8 >= v6) {
    double v11 = v6;
  }
  else {
    double v11 = v8;
  }
  if (v10 >= v9) {
    double v12 = v9;
  }
  else {
    double v12 = v10;
  }
  float v13 = v11 - v12;
  if (fabsf(v13) > 0.00000011921)
  {
    previewOverlayViewController = self->_previewOverlayViewController;
    if (previewOverlayViewController)
    {
      uint64_t v15 = objc_msgSend((id)-[SUPreviewOverlayViewController view](previewOverlayViewController, "view"), "superview");
      if (v15 == [(SUTabBarController *)self view])
      {
        objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "frame");
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22 - v13;
        uint64_t v24 = (void *)[(SUPreviewOverlayViewController *)self->_previewOverlayViewController view];
        objc_msgSend(v24, "setFrame:", v17, v23, v19, v21);
      }
    }
  }
}

- (void)_partnerChanged:(id)a3
{
  double v4 = (void *)[MEMORY[0x263F1CB68] transitionSafePerformer:self];

  [v4 _transitionSafeHandlePartnerChange:a3];
}

- (void)_hidePreviewOverlayAnimated:(BOOL)a3
{
  if (self->_previewOverlayViewController)
  {
    BOOL v3 = a3;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
    {
      previewOverlayViewController = self->_previewOverlayViewController;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke;
      v9[3] = &unk_264812130;
      v9[4] = self;
      [(SUPreviewOverlayViewController *)previewOverlayViewController hideInViewController:self animated:v3 completionBlock:v9];
    }
    else
    {
      id v6 = [(UITabBarController *)self selectedNavigationController];
      double v7 = self->_previewOverlayViewController;
      if (v6)
      {
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke_2;
        v8[3] = &unk_264812130;
        v8[4] = self;
        [(SUPreviewOverlayViewController *)v7 hideInNavigationController:v6 animated:v3 completionBlock:v8];
      }
      else
      {

        self->_previewOverlayViewController = 0;
      }
    }
  }
}

void __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1312) = 0;
}

void __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1312) = 0;
}

- (SUPreviewOverlayViewController)_previewOverlayViewController
{
  double v2 = self->_previewOverlayViewController;

  return v2;
}

- (void)_setStoreBarStyle:(int64_t)a3
{
  if (self->_storeBarStyle != a3)
  {
    self->_storeBarStyle = a3;
    if (a3 == 1)
    {
      double v4 = [(SUClientInterface *)self->_clientInterface lightKeyColor];
      uint64_t v5 = 10060;
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      double v4 = [(SUClientInterface *)self->_clientInterface darkKeyColor];
      uint64_t v5 = 11050;
    }
    [(SUNavigationBarBackgroundView *)self->_tabBarBackdropView setBackdropStyle:v5];
    if (v4)
    {
      id v6 = (void *)[(SUTabBarController *)self tabBar];
      [v6 setInteractionTintColor:v4];
    }
  }
}

- (void)_showPreviewOverlay:(id)a3 animated:(BOOL)a4
{
  previewOverlayViewController = self->_previewOverlayViewController;
  if (previewOverlayViewController != a3)
  {
    BOOL v6 = a4;
    if (previewOverlayViewController)
    {
      if ([(SUPreviewOverlayViewController *)previewOverlayViewController isViewLoaded]) {
        objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "removeFromSuperview");
      }
      [(SUPreviewOverlayViewController *)self->_previewOverlayViewController removeFromParentViewController];
      double v8 = self->_previewOverlayViewController;
    }
    else
    {
      double v8 = 0;
    }

    double v9 = (SUPreviewOverlayViewController *)a3;
    self->_previewOverlayViewController = v9;
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
      {
        double v10 = self->_previewOverlayViewController;
        [(SUPreviewOverlayViewController *)v10 showInViewController:self animated:v6 completionBlock:0];
      }
      else
      {
        id v11 = [(UITabBarController *)self selectedNavigationController];
        if (v11)
        {
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __51__SUTabBarController__showPreviewOverlay_animated___block_invoke;
          v12[3] = &unk_264812158;
          v12[4] = self;
          v12[5] = a3;
          [a3 showInNavigationController:v11 animated:v6 completionBlock:v12];
        }
      }
    }
  }
}

uint64_t __51__SUTabBarController__showPreviewOverlay_animated___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) view];
  uint64_t v4 = [*(id *)(a1 + 32) view];

  return [v2 _moveView:v3 toView:v4];
}

- (void)_applyMoreListConfiguration
{
  uint64_t v3 = objc_msgSend((id)-[SUTabBarController moreNavigationController](self, "moreNavigationController"), "firstViewController");
  uint64_t v4 = v3;
  if (self->_moreListTitle) {
    objc_msgSend(v3, "setTitle:");
  }
  int v5 = _UIApplicationUsesLegacyUI();
  moreListSelectedImage = self->_moreListSelectedImage;
  if (v5)
  {
    if (moreListSelectedImage)
    {
      double v7 = (void *)[v4 tabBarItem];
      double v8 = self->_moreListSelectedImage;
      moreListUnselectedImage = self->_moreListUnselectedImage;
      [v7 setFinishedSelectedImage:v8 withFinishedUnselectedImage:moreListUnselectedImage];
      return;
    }
  }
  else if (moreListSelectedImage)
  {
    objc_msgSend((id)objc_msgSend(v4, "tabBarItem"), "setSelectedImage:", -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](self->_moreListSelectedImage, "_imageThatSuppressesAccessibilityHairlineThickening"));
  }
  if (self->_moreListUnselectedImage)
  {
    double v10 = (void *)[v4 tabBarItem];
    uint64_t v11 = [(UIImage *)self->_moreListUnselectedImage _imageThatSuppressesAccessibilityHairlineThickening];
    [v10 setImage:v11];
  }
}

- (id)_archivedContextsForViewController:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = (void *)[a3 viewControllers];
  }
  else {
    int v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);
  }
  BOOL v6 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) copyArchivableContext];
        if (v11)
        {
          double v12 = (void *)v11;
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
  uint64_t v22 = 0;
  float v13 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v22];
  if (v22)
  {
    long long v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      int v27 = 138543618;
      uint64_t v28 = v17;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      LODWORD(v21) = 22;
      uint64_t v18 = _os_log_send_and_compose_impl();
      if (v18)
      {
        double v19 = (void *)v18;
        objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v27, v21);
        free(v19);
        SSFileLog();
      }
    }
  }

  return v13;
}

- (void)_beginReloadingUnderneathTransientViewController
{
  if ([(SUTabBarController *)self transientViewController]) {
    ++self->_reloadingUnderneathTransientControllerCount;
  }
}

- (void)_endReloadingUnderneathTransientViewController
{
  int64_t reloadingUnderneathTransientControllerCount = self->_reloadingUnderneathTransientControllerCount;
  BOOL v3 = reloadingUnderneathTransientControllerCount < 1;
  int64_t v4 = reloadingUnderneathTransientControllerCount - 1;
  if (!v3) {
    self->_int64_t reloadingUnderneathTransientControllerCount = v4;
  }
}

- (void)_fixupTabBarSelection
{
  BOOL v3 = (void *)[(SUTabBarController *)self tabBar];
  int64_t v4 = (void *)[v3 items];
  unint64_t v5 = [(SUTabBarController *)self selectedIndex];
  if (v5 < [v4 count]
    && ![(SUTabBarController *)self _isReloadingUnderneathTransientViewController])
  {
    uint64_t v6 = [v3 isLocked];
    [v3 setLocked:0];
    objc_msgSend(v3, "setSelectedItem:", objc_msgSend(v4, "objectAtIndex:", -[SUTabBarController selectedIndex](self, "selectedIndex")));
    [v3 setLocked:v6];
  }
}

- (void)_fixupViewControllers
{
  uint64_t v3 = [MEMORY[0x263F1C7F8] transitionSafetyDelegate];
  uint64_t v4 = [(SUTabBarController *)self moreNavigationController];
  unint64_t v5 = objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "copy");
  unint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (unint64_t i = 0; i != v8; ++i)
    {
      double v10 = (void *)[v5 objectAtIndex:i];
      if (v10 != (void *)v4 && i > v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = (void *)[v10 viewControllers];
          if ((unint64_t)[v11 count] >= 2) {
            objc_msgSend(v10, "setViewControllers:", objc_msgSend(v11, "subarrayWithRange:", 0, 1));
          }
        }
      }
      [v10 setDelegate:v3];
    }
  }

  [(SUTabBarController *)self _applyMoreListConfiguration];
}

- (BOOL)_isReloadingUnderneathTransientViewController
{
  return self->_reloadingUnderneathTransientControllerCount > 0;
}

- (void)_longPressAction:(id)a3
{
  unint64_t v6 = (void *)[a3 view];
  [a3 removeTarget:self action:a2];
  [v6 removeGestureRecognizer:a3];
  objc_msgSend(-[SUTabBarController selectedViewController](self, "selectedViewController"), "tabBarControllerDidLongPressTabBarItem:", self);
  id v7 = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:a2];
  [v6 addGestureRecognizer:v7];
}

- (void)_moveTransientViewController:(id)a3 toSectionWithIdentifier:(id)a4 asRoot:(BOOL)a5
{
  if ([(SUTabBarController *)self viewControllerForSectionIdentifier:a4])
  {
    id v8 = (id)[(SUTabBarController *)self transientViewController];
    id v9 = a3;
    for (BOOL i = a3 != 0; v9 && v9 != v8; BOOL i = v9 != 0)
      id v9 = (id)[v9 parentViewController];
    id v18 = v9;
    if (i)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = (void *)[v18 topViewController];
      }
      else {
        uint64_t v11 = v18;
      }
      id v19 = v11;
      id v12 = v11;
      [(SUTabBarController *)self setSelectedIdentifier:a4];
      [(SUTabBarController *)self setTransientViewController:0];
      id v13 = [(UITabBarController *)self selectedNavigationController];
      long long v14 = v13;
      if (a5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [(SUTabBarController *)self _sectionForIdentifier:a4];
          [v19 setSection:v15];
          objc_msgSend((id)objc_msgSend(v19, "_existingTabBarItem"), "setTitle:", objc_msgSend(v15, "title"));
        }
        if (v14 == (void *)[(SUTabBarController *)self moreNavigationController])
        {
          int v16 = objc_msgSend((id)objc_msgSend(v14, "viewControllers"), "mutableCopy");
          if ((unint64_t)[v16 count] >= 2) {
            objc_msgSend(v16, "removeObjectsInRange:", 1, objc_msgSend(v16, "count") - 1);
          }
          [v16 addObject:v19];
          [v14 setViewControllers:v16];
        }
        else
        {
          objc_msgSend(v14, "setViewControllers:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v19));
        }
      }
      else
      {
        [v13 pushViewController:v19 animated:0];
      }
    }
  }
}

- (void)_moveView:(id)a3 toView:(id)a4
{
  [a3 frame];
  objc_msgSend(a4, "convertRect:fromView:", objc_msgSend(a3, "superview"), v6, v7, v8, v9);
  objc_msgSend(a3, "setFrame:");

  [a4 addSubview:a3];
}

- (void)_reloadViewControllersFromSections:(id)a3 animated:(BOOL)a4
{
  BOOL v26 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v33 = (id)objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "mutableCopy");
  uint64_t v25 = [v33 count];
  uint64_t v7 = [(SUTabBarController *)self moreNavigationController];
  uint64_t v23 = v7;
  if (v7) {
    uint64_t v27 = objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "indexOfObjectIdenticalTo:", v7);
  }
  else {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v8 = (void *)[(SUTabBarController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    double v8 = 0;
  }
  uint64_t v32 = [+[SUNetworkObserver sharedInstance] partnerIdentifier];
  uint64_t v9 = [a3 count];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = v9;
    long long v31 = v8;
    do
    {
      id v12 = (void *)[a3 objectAtIndex:v11];
      uint64_t v13 = [v12 partnerHeader];
      if ((!v13 || [(NSString *)v32 isEqualToString:v13])
        && (!v8 || [v8 tabBarController:self shouldShowSection:v12]))
      {
        long long v14 = v6;
        uint64_t v15 = [v33 count];
        if (v15 < 1) {
          goto LABEL_17;
        }
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        while (1)
        {
          id v18 = (void *)[v33 objectAtIndex:v17];
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v18, "section"), "identifier")))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }
          if (v16 == ++v17) {
            goto LABEL_17;
          }
        }
        if (v27 != 0x7FFFFFFFFFFFFFFFLL
          && v11 < v27
          && !objc_msgSend((id)objc_msgSend(v18, "viewControllers"), "count"))
        {
          uint64_t v20 = [v24 popToRootViewControllerAnimated:0];
          objc_msgSend((id)objc_msgSend(v24, "view"), "layoutIfNeeded");
          [v18 setViewControllers:v20];
        }
        id v19 = v18;
        [v33 removeObjectAtIndex:v17];
        if (!v19)
        {
LABEL_17:
          id v19 = [[SUNavigationController alloc] initWithSection:v12 rootViewController:[(SUTabBarController *)self _rootViewControllerForSection:v12]];
          [(SUNavigationController *)v19 setClientInterface:self->_clientInterface];
        }
        id v6 = v14;
        if ([v12 isTransient])
        {
          [v14 insertObject:v19 atIndex:v29++];
        }
        else
        {
          [v14 addObject:v19];
          [v28 addObject:v19];
        }

        uint64_t v10 = v30;
        double v8 = v31;
      }
      ++v11;
    }
    while (v11 != v10);
  }
  if (![v6 count])
  {
    id v21 = [(SUViewControllerFactory *)[(SUClientInterface *)self->_clientInterface viewControllerFactory] newPlaceholderViewController];
    [v21 setClientInterface:self->_clientInterface];
    uint64_t v22 = [[SUNavigationController alloc] initWithRootViewController:v21];
    [(SUNavigationController *)v22 setClientInterface:self->_clientInterface];
    [v6 addObject:v22];
  }
  [(SUTabBarController *)self setViewControllers:v6 animated:v26];
  [(SUTabBarController *)self setCustomizableViewControllers:v28];
  if (v25 >= 1) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUTabBarConfigurationChangedNotification", self);
  }
  if ([v6 count] == 1) {
    [(SUTabBarController *)self hideBarWithTransition:0];
  }
  else {
    [(SUTabBarController *)self showBarWithTransition:0];
  }
}

- (void)_restoreArchivedContexts:(id)a3
{
  unint64_t v5 = [a3 count];
  if (v5) {
    id v6 = (void *)[a3 objectAtIndex:0];
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [v6 sectionIdentifier];
  if (v6 && !v7)
  {
    uint64_t v8 = [(SUTabBarController *)self moreNavigationController];
    if (v8)
    {
      uint64_t v9 = v8;
      if (objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "indexOfObjectIdenticalTo:", v8) != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(SUTabBarController *)self setSelectedViewController:v9];
      }
    }
    return;
  }
  if (!v7) {
    return;
  }
  [(SUTabBarController *)self setSelectedIdentifier:v7];
  id v10 = [(UITabBarController *)self selectedNavigationController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  uint64_t v11 = (void *)[v10 viewControllers];
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = (void *)[v10 firstViewController];
  if (v10 == (id)[(SUTabBarController *)self moreNavigationController])
  {
    [v15 addObject:v12];
    if ((unint64_t)[v11 count] < 2) {
      id v12 = 0;
    }
    else {
      id v12 = (void *)[v11 objectAtIndex:1];
    }
    if ((unint64_t)[a3 count] < 2) {
      id v6 = 0;
    }
    else {
      id v6 = (void *)[a3 objectAtIndex:1];
    }
    unint64_t v13 = 2;
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  unint64_t v13 = 1;
  if (v12)
  {
LABEL_15:
    [v12 restoreArchivableContext:v6];
    [v15 addObject:v12];
  }
LABEL_16:
  if (v13 < v5)
  {
    do
    {
      if (v5 - 1 == v13
        && self->_preloadedViewController
        && [(NSString *)self->_preloadedViewControllerKey isEqualToString:@"SUSectionNavigationPath"])
      {
        long long v14 = self->_preloadedViewController;

        self->_preloadedViewController = 0;
      }
      else
      {
        long long v14 = -[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", [a3 objectAtIndex:v13]);
      }
      if (v14) {
        [v15 addObject:v14];
      }
      ++v13;
    }
    while (v5 != v13);
  }
  [v10 setViewControllers:v15];
}

- (void)_restoreOverlayContexts:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * v8) copyViewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SUTabBarController *)self presentOverlayBackgroundViewController:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_restoreArchivedTransientContexts:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([a3 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [a3 objectAtIndex:v5];
      if (v5 == [a3 count] - 1
        && self->_preloadedViewController
        && [(NSString *)self->_preloadedViewControllerKey isEqualToString:@"SUTransientNavigationPath"])
      {
        break;
      }
      uint64_t v7 = [(SUTabBarController *)self _viewControllerForContext:v6];
      if (v7) {
        goto LABEL_9;
      }
LABEL_10:
      if (++v5 >= (unint64_t)[a3 count]) {
        goto LABEL_11;
      }
    }
    uint64_t v7 = self->_preloadedViewController;

    self->_preloadedViewController = 0;
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    [v9 addObject:v7];
    goto LABEL_10;
  }
LABEL_11:
  if ([v9 count])
  {
    uint64_t v8 = -[SUNavigationController initWithSection:]([SUNavigationController alloc], "initWithSection:", objc_msgSend(-[UITabBarController selectedNavigationController](self, "selectedNavigationController"), "section"));
    [(SUNavigationController *)v8 setClientInterface:self->_clientInterface];
    [(SUNavigationController *)v8 setViewControllers:v9];
    [(SUTabBarController *)self setTransientViewController:v8 animated:0];
  }
}

- (id)_rootViewControllerForSection:(id)a3
{
  if (-[NSString isEqualToString:](self->_preloadedViewControllerIdentifier, "isEqualToString:", [a3 identifier])&& (preloadedViewController = self->_preloadedViewController) != 0)
  {
    uint64_t v6 = preloadedViewController;

    self->_preloadedViewController = 0;
    return v6;
  }
  else
  {
    uint64_t v8 = (void *)[(SUTabBarController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      id v9 = (id)[v8 tabBarController:self rootViewControllerForSection:a3];
    }
    else {
      id v9 = [(SUViewControllerFactory *)[(SUClientInterface *)self->_clientInterface viewControllerFactory] newStorePageViewControllerWithSection:a3];
    }
    long long v10 = v9;
    if (![v9 clientInterface]) {
      [v10 setClientInterface:self->_clientInterface];
    }
    objc_msgSend(v10, "setTitle:", objc_msgSend(a3, "title"));
    return v10;
  }
}

- (BOOL)_saveNavigationPathToDefaults
{
  id v2 = [(SUTabBarController *)self _archivedContextsForViewController:[(UITabBarController *)self selectedNavigationController]];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v2, @"SUSectionNavigationPath");
  }
  return 1;
}

- (BOOL)_saveTransientNavigationPathToDefaults
{
  uint64_t v3 = [(SUTabBarController *)self transientViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [(SUTabBarController *)self _archivedContextsForViewController:v3];
  }
  else {
    id v4 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v4, @"SUTransientNavigationPath");
  return 1;
}

- (id)_sectionForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sections = self->_sections;
  uint64_t v5 = [(NSArray *)sections countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(sections);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)sections countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_sectionForType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sections = self->_sections;
  uint64_t v5 = [(NSArray *)sections countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(sections);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 type] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)sections countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_transitionSafeHandlePartnerChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_sections count])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v13 = 138412546;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2112;
      uint64_t v16 = [a3 object];
      LODWORD(v12) = 22;
      long long v11 = &v13;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v13, v12);
        free(v9);
        long long v11 = (int *)v10;
        SSFileLog();
      }
    }
    [(SUTabBarController *)self _beginReloadingUnderneathTransientViewController];
    [(SUTabBarController *)self _reloadViewControllersFromSections:self->_sections animated:1];
    [(SUTabBarController *)self _endReloadingUnderneathTransientViewController];
  }
}

- (id)_viewControllerForContext:(id)a3
{
  uint64_t v5 = (void *)[(SUTabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = (id)[v5 tabBarController:self viewControllerForContext:a3];
    if (![v6 clientInterface]) {
      [v6 setClientInterface:self->_clientInterface];
    }
  }
  else
  {
    id v6 = (id)[a3 copyViewController];
    [v6 setClientInterface:self->_clientInterface];
    [v6 restoreArchivableContext:a3];
  }
  return v6;
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (NSArray)sections
{
  return self->_sections;
}

@end