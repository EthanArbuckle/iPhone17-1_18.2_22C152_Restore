@interface VUITabBarController
+ (BOOL)shouldIgnoreLastSelectedTabIndex;
+ (id)_tabBarImageForResource:(id)a3;
- (BOOL)hasSetTabBarIndex;
- (NSArray)tabBarItems;
- (UINavigationController)currentNavigationController;
- (UIViewController)currentViewController;
- (VUITabBarController)init;
- (VUITabBarControllerUpdatingDelegate)updatingDelegate;
- (id)_tabBarChildViewControllerWithIdentifier:(id)a3 documentRef:(id)a4 isNonServerTab:(BOOL)a5 title:(id)a6 isSelectedTab:(BOOL)a7 appContext:(id)a8 iconResource:(id)a9 contextData:(id)a10 uiConfigDict:(id)a11;
- (id)longPressHandler;
- (id)viewControllerWithTabIdentifier:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (unint64_t)indexForTabBarItemIdentifier:(id)a3;
- (unint64_t)previousSelectedIndex;
- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3;
- (void)_addAndPresentBubbleTipIfAny:(id)a3;
- (void)_handleSelectedViewControllerDidChange;
- (void)_saveLastSelectedAndScrollToTop:(id)a3 selectedIndex:(unint64_t)a4 previousSelectedIndex:(unint64_t)a5;
- (void)_setSelectedViewController:(id)a3;
- (void)_updateTabBarChildViewController:(id)a3 withTitle:(id)a4;
- (void)_updateTabbarChildViewController:(id)a3 withTitle:(id)a4 iconResource:(id)a5;
- (void)dealloc;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)removeAllChildViewControllers;
- (void)setHasSetTabBarIndex:(BOOL)a3;
- (void)setLongPressHandler:(id)a3;
- (void)setPreviousSelectedIndex:(unint64_t)a3;
- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3;
- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4;
- (void)setTabBarItems:(id)a3;
- (void)setUpdatingDelegate:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setVuiSelectedIndex:(unint64_t)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5;
- (void)viewDidLoad;
@end

@implementation VUITabBarController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUITabBarController;
  [(VUITabBarController *)&v5 viewDidLoad];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  v4 = [(VUITabBarController *)self view];
  [v4 setVuiBackgroundColor:v3];
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    uint64_t v7 = [v3 presentedViewController];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [v3 presentedViewController];
      if ([v9 conformsToProtocol:&unk_1F4002EA8])
      {
        v10 = [v3 presentedViewController];
        char v11 = [v10 isBeingPresented];

        if (v11) {
          goto LABEL_6;
        }
        v8 = [v3 presentedViewController];
        if ([v8 overridesOrientationLock]) {
          unint64_t v6 = 26;
        }
        else {
          unint64_t v6 = 2;
        }
      }
      else
      {

        unint64_t v6 = 2;
      }

      goto LABEL_12;
    }
LABEL_6:
    unint64_t v6 = 2;
    goto LABEL_12;
  }
  unint64_t v6 = 30;
LABEL_12:

  return v6;
}

- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  BOOL v6 = a4;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v76 = a5;
  v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarUpdateItems", "", buf, 2u);
  }

  v10 = [(VUITabBarController *)self tabBarItems];
  if (v6)
  {
    if ([(id)objc_opt_class() shouldIgnoreLastSelectedTabIndex])
    {
      char v11 = 0;
    }
    else
    {
      char v11 = +[VUIBarItemSelectionManager lastSelectedIdentifier];
    }
    if (([v11 isEqualToString:@"library"] & 1) == 0)
    {
      v12 = +[VUIMetricsController sharedInstance];
      [v12 setShouldPostAppLaunchData:1];
    }
    v13 = [v11 lowercaseString];
    int v14 = [v13 hasPrefix:@"ppt"];

    if (!v14) {
      goto LABEL_12;
    }
  }
  char v11 = 0;
LABEL_12:
  unint64_t v15 = [(VUITabBarController *)self vuiSelectedIndex];
  v75 = v8;
  v81 = v11;
  v82 = self;
  if (!v11 || (unint64_t v16 = v15, v15 == 0x7FFFFFFFFFFFFFFFLL) || v15 >= [v8 count])
  {
    v17 = +[VUIFeaturesConfiguration sharedInstance];
    v18 = [v17 dropOnTabConfig];
    v19 = [v18 dropOnTabIdentifier];

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v104 objects:v119 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v90 = v10;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v105;
      while (2)
      {
        uint64_t v25 = 0;
        uint64_t v26 = v23 + v22;
        do
        {
          if (*(void *)v105 != v24) {
            objc_enumerationMutation(v20);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v104 + 1) + 8 * v25), "vui_stringForKey:", @"identifier");
          char v28 = [v27 isEqualToString:v19];

          if (v28)
          {
            unint64_t v16 = v23 + v25;
            goto LABEL_25;
          }
          ++v25;
        }
        while (v22 != v25);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v104 objects:v119 count:16];
        uint64_t v23 = v26;
        if (v22) {
          continue;
        }
        break;
      }
      unint64_t v16 = 0;
LABEL_25:
      id v8 = v75;
      self = v82;
      v10 = v90;
    }
    else
    {
      unint64_t v16 = 0;
    }
  }
  unint64_t v84 = v16;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v10;
  uint64_t v30 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v101 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        v35 = objc_msgSend(v34, "vui_stringForKey:", @"identifier");
        [v29 setObject:v34 forKey:v35];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
    }
    while (v31);
  }

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v37 = [(VUITabBarController *)self vuiViewControllers];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v96 objects:v117 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v97 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        v43 = [v42 vuiViewControllerIdentifier];

        if (v43)
        {
          v44 = [v42 vuiViewControllerIdentifier];
          [v36 setObject:v42 forKey:v44];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v96 objects:v117 count:16];
    }
    while (v39);
  }
  v79 = v36;

  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8];
  v46 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v47 = [v46 launchedToTest];

  if (v47)
  {
    v115[0] = @"identifier";
    v115[1] = @"documentRef";
    v116[0] = @"pptstack";
    v116[1] = @"PPTStackScroll";
    v115[2] = @"title";
    v116[2] = @"pptstack";
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];
    [v45 addObject:v48];

    v113[0] = @"identifier";
    v113[1] = @"documentRef";
    v114[0] = @"pptsports";
    v114[1] = @"PPTSportsScroll";
    v113[2] = @"title";
    v114[2] = @"pptsports";
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];
    [v45 addObject:v49];

    v111[0] = @"identifier";
    v111[1] = @"documentRef";
    v112[0] = @"pptshowproduct";
    v112[1] = @"PPTShowScrollController";
    v111[2] = @"title";
    v112[2] = @"pptshowproduct";
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:3];
    [v45 addObject:v50];
  }
  v80 = v29;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v51 = v45;
  uint64_t v89 = [v51 countByEnumeratingWithState:&v92 objects:v110 count:16];
  if (!v89)
  {
    uint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_79;
  }
  uint64_t v87 = 0;
  uint64_t v88 = *(void *)v93;
  uint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
  id v83 = v51;
  do
  {
    uint64_t v52 = 0;
    do
    {
      if (*(void *)v93 != v88) {
        objc_enumerationMutation(v51);
      }
      v53 = *(void **)(*((void *)&v92 + 1) + 8 * v52);
      v54 = objc_msgSend(v53, "vui_stringForKey:", @"identifier");
      v55 = objc_msgSend(v53, "vui_stringForKey:", @"documentRef");
      uint64_t v56 = objc_msgSend(v53, "vui_BOOLForKey:defaultValue:", @"isNonServerTab", 0);
      v91 = objc_msgSend(v53, "vui_dictionaryForKey:", @"contextData");
      v57 = objc_msgSend(v53, "vui_stringForKey:", @"title");
      v58 = objc_msgSend(v53, "vui_stringForKey:", @"iconResource");
      v59 = objc_msgSend(v53, "vui_dictionaryForKey:", @"uiConfiguration");
      if ([v54 length] && objc_msgSend(v55, "length") && objc_msgSend(v57, "length"))
      {
        v60 = [MEMORY[0x1E4FB1438] sharedApplication];
        int v61 = [v60 isRunningTest];

        if (v61 && objc_msgSend(v53, "vui_BOOLForKey:defaultValue:", @"isSideBarItem", 0))
        {
          v62 = VUIDefaultLogObject();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v53;
            _os_log_impl(&dword_1E2BD7000, v62, OS_LOG_TYPE_INFO, "VUITabBarController - Tab bar item is a sidebar item. Will ignore when running PPT. TabBarItem: %@", buf, 0xCu);
          }
          goto LABEL_71;
        }
        int v63 = [v81 isEqualToString:v54];
        unint64_t v64 = v84;
        if (v63) {
          unint64_t v64 = v87;
        }
        unint64_t v84 = v64;
        uint64_t v65 = v85;
        if (v63) {
          uint64_t v65 = v87;
        }
        uint64_t v85 = v65;
        v66 = [v80 objectForKey:v54];
        v62 = [v66 mutableCopy];

        if (!v62) {
          v62 = [v53 mutableCopy];
        }
        uint64_t v67 = [v79 objectForKey:v54];
        if (v67)
        {
          v68 = v67;
          [v62 setObject:v57 forKey:@"title"];
          [(VUITabBarController *)v82 _updateTabbarChildViewController:v68 withTitle:v57 iconResource:v58];
          goto LABEL_69;
        }
        v68 = [(VUITabBarController *)v82 _tabBarChildViewControllerWithIdentifier:v54 documentRef:v55 isNonServerTab:v56 title:v57 isSelectedTab:v85 == v87 appContext:v76 iconResource:v58 contextData:v91 uiConfigDict:v59];
        if (v68)
        {
LABEL_69:
          [v78 addObject:v62];
          [v77 addObject:v68];
          ++v87;
        }
        else
        {
          v68 = VUIDefaultLogObject();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v53;
            _os_log_impl(&dword_1E2BD7000, v68, OS_LOG_TYPE_INFO, "VUITabBarController - Unable to create view controller for tab bar item. Will ignore: TabBarItem: %@", buf, 0xCu);
          }
        }

LABEL_71:
        id v51 = v83;
        goto LABEL_72;
      }
      v62 = VUIDefaultLogObject();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v53;
        _os_log_impl(&dword_1E2BD7000, v62, OS_LOG_TYPE_INFO, "VUITabBarController - Tab bar item has a zero length identifier, documentRef or title. Will ignore. TabBarItem: %@", buf, 0xCu);
      }
LABEL_72:

      ++v52;
    }
    while (v89 != v52);
    uint64_t v69 = [v51 countByEnumeratingWithState:&v92 objects:v110 count:16];
    uint64_t v89 = v69;
  }
  while (v69);
LABEL_79:

  v70 = (void *)[v78 copy];
  [(VUITabBarController *)v82 setTabBarItems:v70];

  v71 = (void *)[v77 copy];
  [(VUITabBarController *)v82 setVuiViewControllers:v71];

  [(VUITabBarController *)v82 setPreviousSelectedIndex:v85];
  [(VUITabBarController *)v82 setVuiSelectedIndex:v84];
  v72 = [(VUITabBarController *)v82 tabBar];
  [v72 setNeedsLayout];

  v73 = [(VUITabBarController *)v82 updatingDelegate];
  [v73 tabBarControllerDidUpdateTabBarItems:v82];

  [(VUITabBarController *)v82 _addAndPresentBubbleTipIfAny:v75];
  v74 = VUISignpostLogObject();
  if (os_signpost_enabled(v74))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v74, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarUpdateItems", "", buf, 2u);
  }
}

- (id)_tabBarChildViewControllerWithIdentifier:(id)a3 documentRef:(id)a4 isNonServerTab:(BOOL)a5 title:(id)a6 isSelectedTab:(BOOL)a7 appContext:(id)a8 iconResource:(id)a9 contextData:(id)a10 uiConfigDict:(id)a11
{
  BOOL v12 = a7;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v40 = a4;
  id v17 = a6;
  id v39 = a10;
  id v18 = a11;
  id v36 = a9;
  id v19 = a8;
  id v20 = VUISignpostLogObject();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v16;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarChildViewCreate", "id:%@", buf, 0xCu);
  }

  uint64_t v21 = [[VUIDocumentDataSource alloc] initWithDocumentRef:v40];
  uint64_t v22 = objc_alloc_init(VUIDocumentUIConfiguration);
  if (v18)
  {
    uint64_t v23 = +[VUIDocumentUIConfiguration uiConfigurationWithDict:v18];

    uint64_t v22 = (VUIDocumentUIConfiguration *)v23;
  }
  -[VUIDocumentDataSource setUiConfiguration:](v21, "setUiConfiguration:", v22, v36);
  [(VUIDocumentDataSource *)v21 setShouldLoadPageImmediately:v12];
  if ([v16 length])
  {
    v41 = @"tabIdentifier";
    id v42 = v16;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    if (a5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if (a5) {
      goto LABEL_11;
    }
  }
  [(VUIDocumentDataSource *)v21 setDocumentType:@"default"];
  [(VUIDocumentDataSource *)v21 setControllerRef:v40];
  [(VUIDocumentDataSource *)v21 setTitle:v17];
  if (v39)
  {
    uint64_t v25 = [[VUIDocumentContextData alloc] initWithDictionary:v39];
    [(VUIDocumentDataSource *)v21 setContextData:v25];
  }
LABEL_11:
  uint64_t v26 = [(VUIDocumentDataSource *)v21 uiConfiguration];
  [v26 setViewControllerDocumentIdentifier:v16];

  v27 = +[VUIInterfaceFactory sharedInstance];
  char v28 = [v27 viewControllerWithDocumentDataSource:v21 appContext:v19 documentOptions:v24];

  id v29 = [(_VUITVAppNavigationController *)[VUIAppNavigationController alloc] initWithRootViewController:v28];
  [(_VUITVAppNavigationController *)v29 setMaxNavControllerStackDepth:6];
  [(VUIAppNavigationController *)v29 setVuiViewControllerIdentifier:v16];
  uint64_t v30 = [(VUIAppNavigationController *)v29 vuiTabBarItem];
  [@"UIA.TV.Tab." stringByAppendingString:v16];
  v32 = id v31 = v17;
  [v30 setAccessibilityIdentifier:v32];

  v33 = v31;
  [(VUITabBarController *)self _updateTabbarChildViewController:v29 withTitle:v31 iconResource:v37];

  v34 = VUISignpostLogObject();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarChildViewCreate", "", buf, 2u);
  }

  return v29;
}

- (void)_updateTabbarChildViewController:(id)a3 withTitle:(id)a4 iconResource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(id)objc_opt_class() _tabBarImageForResource:v8];

  char v11 = [v10 tabBarItem];
  [v11 setImage:v12];

  [(VUITabBarController *)self _updateTabBarChildViewController:v10 withTitle:v9];
}

- (void)_updateTabBarChildViewController:(id)a3 withTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTitle:v5];
  id v7 = [v6 tabBarItem];

  [v7 setTitle:v5];
}

+ (id)_tabBarImageForResource:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"symbol://"])
  {
    v4 = [v3 stringByReplacingOccurrencesOfString:@"symbol://" withString:&stru_1F3E921E0];
    id v5 = (void *)MEMORY[0x1E4FB1818];
    id v6 = [MEMORY[0x1E4FB1830] configurationPreferringMonochrome];
    id v7 = [v5 _systemImageNamed:v4 withConfiguration:v6];
    id v8 = [v7 _imageThatSuppressesAccessibilityHairlineThickening];

LABEL_6:
    goto LABEL_7;
  }
  id v9 = @"resource://";
  if ([v3 hasPrefix:@"resource://"]
    || (id v9 = @"resource-symbol://", [v3 hasPrefix:@"resource-symbol://"]))
  {
    v4 = [v3 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F3E921E0];
    id v6 = [MEMORY[0x1E4FB1818] vuiImageNamed:v4];
    id v8 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (void)_handleSelectedViewControllerDidChange
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(VUITabBarController *)self vuiSelectedIndex];
  v4 = [(VUITabBarController *)self tabBarItems];
  if ([v4 count])
  {
    if (v3 >= [v4 count]) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = v3;
    }
    id v6 = [v4 objectAtIndex:v5];
    objc_msgSend(v6, "vui_stringForKey:", @"identifier");
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend(v6, "vui_stringForKey:", @"pageContext");
    id v9 = (void *)v8;
    id v10 = &stru_1F3E921E0;
    if (v7) {
      id v10 = v7;
    }
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    char v11 = v10;

    int v14 = @"VUIMetricsTabBarItemNotificationKey";
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    +[VUIBarItemSelectionManager updateLastSelectedIdentifier:v7 tabItemInfo:v6];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];

    [v13 postNotificationName:@"TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification" object:self userInfo:v12];
  }
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)_setSelectedViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUITabBarController *)self vuiSelectedIndex];
  id v6 = [(VUITabBarController *)self vuiSelectedViewController];
  if (v6 != v4) {
    +[VideosUI notifyAppearingViewControllerOfTabSwitch:v4];
  }
  [(VUITabBarController *)self setPreviousSelectedIndex:v5];
  v7.receiver = self;
  v7.super_class = (Class)VUITabBarController;
  [(VUITabBarController *)&v7 _setSelectedViewController:v4];
  if (v5 != [(VUITabBarController *)self vuiSelectedIndex]
    || ![(VUITabBarController *)self hasSetTabBarIndex])
  {
    [(VUITabBarController *)self _handleSelectedViewControllerDidChange];
    if (![(VUITabBarController *)self hasSetTabBarIndex]) {
      [(VUITabBarController *)self setHasSetTabBarIndex:1];
    }
  }
}

- (void)setPreviousSelectedIndex:(unint64_t)a3
{
  self->_previousSelectedIndex = a3;
}

- (BOOL)hasSetTabBarIndex
{
  return self->_hasSetTabBarIndex;
}

- (void)setVuiSelectedIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUITabBarController;
  [(VUITabBarController *)&v5 setVuiSelectedIndex:a3];
  id v4 = [(VUITabBarController *)self updatingDelegate];
  [v4 tabBarControllerDidUpdateSelectedIndex:self];
}

- (VUITabBarControllerUpdatingDelegate)updatingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updatingDelegate);
  return (VUITabBarControllerUpdatingDelegate *)WeakRetained;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)VUITabBarController;
  [(VUITabBarController *)&v4 setViewControllers:a3 animated:a4];
}

- (void)setTabBarItems:(id)a3
{
}

- (void)setHasSetTabBarIndex:(BOOL)a3
{
  self->_hasSetTabBarIndex = a3;
}

- (void)_addAndPresentBubbleTipIfAny:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v33 = self;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v35;
    uint64_t v10 = -1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v4);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "vui_stringForKey:", @"tipPlacementId");
        v13 = v12;
        if (v12 && [v12 length])
        {
          uint64_t v10 = v7 + i;
          id v14 = v13;

          uint64_t v8 = v14;
        }
      }
      v7 += v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
    if (v10 != -1)
    {
      unint64_t v15 = +[VideosUI getTipViewControllerIfAny:v8];
      if (v15)
      {
        id v16 = [(VUITabBarController *)v33 tabBar];
        [v16 bounds];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;

        unint64_t v25 = [v4 count];
        if (v25 <= 1) {
          unint64_t v26 = 1;
        }
        else {
          unint64_t v26 = v25;
        }
        double v27 = v22 / (double)v26;
        [v15 setModalPresentationStyle:7];
        char v28 = [v15 popoverPresentationController];
        id v29 = [(VUITabBarController *)v33 tabBar];
        [v28 setSourceView:v29];

        uint64_t v30 = [v15 popoverPresentationController];
        objc_msgSend(v30, "setSourceRect:", v18 + (double)(unint64_t)(v10 * (int)v27), v20, v27, v24);

        [v15 setDelegate:v33];
        id v31 = [v15 popoverPresentationController];
        [v31 setDelegate:v33];

        [(VUITabBarController *)v33 presentViewController:v15 animated:1 completion:0];
      }
      else
      {
        uint64_t v32 = VUIDefaultLogObject();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v8;
          _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::No TipViewController found for %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
}

+ (BOOL)shouldIgnoreLastSelectedTabIndex
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!+[VUIUtilities isStoreOrPressDemoMode])
  {
    unint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 objectForKey:@"lastActiveDate"];

    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 objectForKey:@"lastPlaybackDate"];

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__VUITabBarController_shouldIgnoreLastSelectedTabIndex__block_invoke;
    aBlock[3] = &unk_1E6DFA988;
    id v8 = v7;
    id v26 = v8;
    uint64_t v9 = (uint64_t (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    uint64_t v10 = +[VUIFeaturesConfiguration sharedInstance];
    char v11 = [v10 dropOnTabConfig];

    id v12 = [v11 daysWithoutPlaybackThreshold];
    v13 = [v11 daysWithoutOpeningThreshold];
    double v24 = (void *)v6;
    int v14 = v9[2](v9, v6, v12);
    unint64_t v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)char v28 = v14;
      *(_WORD *)&v28[4] = 2112;
      *(void *)&v28[6] = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v6;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "DropOnTab: isPastPlaybackThreshold = %i for %@ days since date of %@ ", buf, 0x1Cu);
    }

    int v16 = v9[2](v9, (uint64_t)v4, v13);
    double v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)char v28 = v16;
      *(_WORD *)&v28[4] = 2112;
      *(void *)&v28[6] = v13;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v4;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "DropOnTab: isPastAppOpeningThreshold = %i for %@ days since date of %@ ", buf, 0x1Cu);
    }

    int v18 = v14 | v16;
    if (v4) {
      char v2 = v14 | v16;
    }
    else {
      char v2 = 1;
    }
    double v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v19 setObject:v8 forKey:@"lastActiveDate"];

    double v20 = VUIDefaultLogObject();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v18)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v28 = v8;
          _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "DropOnTab: shouldIgnoreLastSelectedTabIndex=NO. Updating lastActiveDate to %@", buf, 0xCu);
        }
        goto LABEL_18;
      }
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)char v28 = v8;
        double v22 = "DropOnTab: shouldIgnoreLastSelectedTabIndex=YES. Updating lastActiveDate and lastPlaybackDate to %@";
LABEL_16:
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)char v28 = v8;
      double v22 = "DropOnTab: shouldIgnoreLastSelectedTabIndex=YES. no lastActiveDate, setting lastActiveDate and lastPlaybackDate to %@";
      goto LABEL_16;
    }

    double v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v20 setObject:v8 forKey:@"lastPlaybackDate"];
LABEL_18:

    return v2;
  }
  return 0;
}

BOOL __55__VUITabBarController_shouldIgnoreLastSelectedTabIndex__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a2) {
    return 0;
  }
  id v5 = a2;
  int v6 = [a3 intValue];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:(double)(86400 * v6)];

  [*(id *)(a1 + 32) timeIntervalSinceDate:v7];
  BOOL v9 = v8 > 0.0;

  return v9;
}

- (VUITabBarController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUITabBarController;
  char v2 = [(VUITabBarController *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = [(VUITabBarController *)v2 tabBar];
    [v4 setUserInteractionEnabled:1];

    [(VUITabBarController *)v3 setVuiDelegate:v3];
    v3->_previousSelectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)dealloc
{
  [(VUITabBarController *)self setVuiDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VUITabBarController;
  [(VUITabBarController *)&v3 dealloc];
}

- (void)removeAllChildViewControllers
{
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3
{
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = -1;
  objc_super v6 = [(VUITabBarController *)self vuiViewControllers];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __74__VUITabBarController_setSelectedIndexForTabBarItemIdentifier_clearStack___block_invoke;
  char v11 = &unk_1E6DFA960;
  id v7 = v5;
  id v12 = v7;
  v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];
  if ((v15[3] & 0x8000000000000000) == 0) {
    -[VUITabBarController setVuiSelectedIndex:](self, "setVuiSelectedIndex:", v8, v9, v10, v11);
  }

  _Block_object_dispose(&v14, 8);
}

void __74__VUITabBarController_setSelectedIndexForTabBarItemIdentifier_clearStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 vuiViewControllerIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v7 caseInsensitiveCompare:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (unint64_t)indexForTabBarItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VUITabBarController *)self tabBarItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(VUITabBarController *)self tabBarItems];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v7];

      uint64_t v10 = [v9 objectForKeyedSubscript:@"identifier"];
      char v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
      ++v7;
      id v12 = [(VUITabBarController *)self tabBarItems];
      unint64_t v13 = [v12 count];

      if (v7 >= v13) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = -1;
  }

  return v7;
}

- (id)viewControllerWithTabIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(VUITabBarController *)self vuiViewControllers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "vuiViewControllerIdentifier", (void)v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v10 caseInsensitiveCompare:v4])
        {
          id v6 = v9;

          goto LABEL_12;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 originalRequest];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    double v19 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action dialogResult: %@, request: %@", (uint8_t *)&v16, 0x16u);
  }
  [(VUITabBarController *)self dismissViewControllerAnimated:1 completion:0];
  uint64_t v10 = [v7 originalRequest];
  char v11 = [v7 selectedActionIdentifier];
  long long v12 = [v10 locateActionWithIdentifier:v11];

  if (v12)
  {
    long long v13 = [v12 deepLink];
    if (v13)
    {
      +[VideosUI processDeeplink:v13];
    }
    else
    {
      long long v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action Deeplink does not exist", (uint8_t *)&v16, 2u);
      }
    }
    +[VideosUI messageViewController:v6 didSelectActionWith:v7];
  }
  else
  {
    long long v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = [v7 selectedActionIdentifier];
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "VUITabBarController - UnifiedMessaging::Action Could not find action for %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (UINavigationController)currentNavigationController
{
  objc_super v3 = [(VUITabBarController *)self vuiViewControllers];
  uint64_t v4 = [(VUITabBarController *)self vuiSelectedIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndex:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (UINavigationController *)v6;
}

- (UIViewController)currentViewController
{
  objc_super v3 = [(VUITabBarController *)self vuiViewControllers];
  uint64_t v4 = [(VUITabBarController *)self vuiSelectedIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndex:v4];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = v5;
    goto LABEL_8;
  }
  if ([v5 conformsToProtocol:&unk_1F3F5D0F8])
  {
    id v6 = [0 currentViewController];
LABEL_8:
    id v7 = v6;
    goto LABEL_10;
  }
  uint64_t v8 = [v5 viewControllers];
  id v7 = [v8 lastObject];

LABEL_10:
  return (UIViewController *)v7;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(VUITabBarController *)self vuiViewControllers];
  -[VUITabBarController _saveLastSelectedAndScrollToTop:selectedIndex:previousSelectedIndex:](self, "_saveLastSelectedAndScrollToTop:selectedIndex:previousSelectedIndex:", v5, [v6 indexOfObjectIdenticalTo:v5], -[VUITabBarController previousSelectedIndex](self, "previousSelectedIndex"));
}

- (void)_saveLastSelectedAndScrollToTop:(id)a3 selectedIndex:(unint64_t)a4 previousSelectedIndex:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8 && a5 != a4)
  {
    id v10 = [(VUITabBarController *)self tabBarItems];
    if ([v10 count] <= a4)
    {
      __int16 v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[VUITabBarController _saveLastSelectedAndScrollToTop:selectedIndex:previousSelectedIndex:](a4, v18);
      }

      goto LABEL_15;
    }
    char v11 = [v10 objectAtIndex:a4];
    long long v12 = [v9 vuiViewControllerIdentifier];
    +[VUIBarItemSelectionManager updateLastSelectedIdentifier:v12 tabItemInfo:v11];

    goto LABEL_11;
  }
  if (v8)
  {
    if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        char v11 = [v10 viewControllers];
        if ([v11 count] == 1)
        {
          long long v13 = [v10 visibleViewController];
          long long v14 = [v13 view];
          long long v15 = [v14 window];

          if (!v15)
          {
LABEL_15:

            goto LABEL_16;
          }
          char v11 = [v10 visibleViewController];
          int v16 = +[VUIInterfaceFactory sharedInstance];
          id v17 = [v16 documentCreator];
          [v17 scrollViewControllerToTop:v11 animated:1 needsFocusUpdate:1];

          +[VideosUI notifyAppearingViewControllerOfTabSelection:v10];
        }
LABEL_11:

        goto LABEL_15;
      }
    }
  }
LABEL_16:
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)setUpdatingDelegate:(id)a3
{
}

- (id)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
}

- (unint64_t)previousSelectedIndex
{
  return self->_previousSelectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong(&self->_longPressHandler, 0);
  objc_destroyWeak((id *)&self->_updatingDelegate);
}

- (void)_saveLastSelectedAndScrollToTop:(uint64_t)a1 selectedIndex:(NSObject *)a2 previousSelectedIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUITabBarController:: saveLastSelectedAndScrollToTop: Invalid selectedIndex: %lu", (uint8_t *)&v2, 0xCu);
}

@end