@interface _TVRootMenuBarController
- (IKAppNavigationController)appNavigationController;
- (IKAppTabBar)appTabBar;
- (NSArray)appTabBarItems;
- (UINavigationController)currentNavigationController;
- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate;
- (_TVRootMenuBarController)init;
- (id)selectedTabItemForTabBar:(id)a3;
- (id)tabBar:(id)a3 setTabItems:(id)a4;
- (id)tabBar:(id)a3 tabItemAtIndex:(unint64_t)a4;
- (id)transientTabItemForTabBar:(id)a3;
- (unint64_t)numberOfTabsInTabBar:(id)a3;
- (unint64_t)previousSelectedIndex;
- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setAppNavigationControllerDelegate:(id)a3;
- (void)setAppNavigationControllersDelegate:(id)a3;
- (void)setAppTabBarItems:(id)a3;
- (void)setPreviousSelectedIndex:(unint64_t)a3;
- (void)tabBar:(id)a3 setSelectedTabItem:(id)a4;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidLoad;
@end

@implementation _TVRootMenuBarController

- (_TVRootMenuBarController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_TVRootMenuBarController;
  v2 = [(_TVRootMenuBarController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(_TVRootMenuBarController *)v2 setDelegate:v2];
    v3->_previousSelectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F4B3E8]) initWithTabBarController:v3];
    appTabBar = v3->_appTabBar;
    v3->_appTabBar = (IKAppTabBar *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(_TVRootMenuBarController *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)_TVRootMenuBarController;
  [(_TVRootMenuBarController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_TVRootMenuBarController;
  [(_TVRootMenuBarController *)&v4 viewDidLoad];
  objc_super v3 = [(_TVRootMenuBarController *)self view];
  [v3 setBackgroundColor:0];
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 30;
  }
  if (TVShouldConstrainToPortait()) {
    return 2;
  }
  return 26;
}

- (void)setAppNavigationControllersDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_TVRootMenuBarController *)self setAppNavigationControllerDelegate:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(_TVRootMenuBarController *)self viewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setAppNavigationControllerDelegate:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (UINavigationController)currentNavigationController
{
  objc_super v3 = [(_TVRootMenuBarController *)self viewControllers];
  uint64_t v4 = [(_TVRootMenuBarController *)self selectedIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 objectAtIndex:v4];
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

- (IKAppNavigationController)appNavigationController
{
  return 0;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v18 = @"TVAppRootViewControllerCurrentNavigationControllerUserInfoKey";
  v19[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification" object:self userInfo:v6];

  uint64_t v8 = [(_TVRootMenuBarController *)self viewControllers];
  uint64_t v9 = [v8 indexOfObjectIdenticalTo:v5];

  unint64_t v10 = [(_TVRootMenuBarController *)self previousSelectedIndex];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v13 = v5;
    long long v14 = [v13 viewControllers];
    if ([v14 count] == 1)
    {
      v15 = [v13 visibleViewController];
      uint64_t v16 = [v15 view];
      v17 = [v16 window];

      if (!v17)
      {
LABEL_11:

        goto LABEL_12;
      }
      long long v14 = [v13 visibleViewController];
      if (objc_opt_respondsToSelector()) {
        [v14 scrollToTop];
      }
    }

    goto LABEL_11;
  }
  [(_TVRootMenuBarController *)self setPreviousSelectedIndex:v9];
  long long v11 = [(_TVRootMenuBarController *)self appTabBar];
  [v11 onSelect];

  long long v12 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    -[_TVRootMenuBarController tabBarController:didSelectViewController:](v9, v12);
  }
LABEL_12:
}

- (unint64_t)numberOfTabsInTabBar:(id)a3
{
  return [(NSArray *)self->_appTabBarItems count];
}

- (id)tabBar:(id)a3 tabItemAtIndex:(unint64_t)a4
{
  return [(NSArray *)self->_appTabBarItems objectAtIndex:a4];
}

- (id)tabBar:(id)a3 setTabItems:(id)a4
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = [(_TVRootMenuBarController *)self previousSelectedIndex];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v7 = v6, v6 >= [(NSArray *)self->_appTabBarItems count]))
  {
    v87 = 0;
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_appTabBarItems objectAtIndex:v7];
    v87 = [v8 objectForKey:*MEMORY[0x263F4B318]];
  }
  unint64_t v9 = [(_TVRootMenuBarController *)self selectedIndex];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v10 = v9, v9 >= [v5 count])) {
    unint64_t v10 = 0;
  }
  unint64_t v96 = v10;
  id v98 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v80 = self;
  long long v11 = self->_appTabBarItems;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v109 objects:v115 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v110;
    uint64_t v15 = *MEMORY[0x263F4B318];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v110 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        v18 = [v17 objectForKeyedSubscript:v15];
        [v98 setObject:v17 forKey:v18];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v109 objects:v115 count:16];
    }
    while (v13);
  }

  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v20 = v80;
  v21 = [(_TVRootMenuBarController *)v80 viewControllers];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v114 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v106 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v105 + 1) + 8 * j);
        v27 = [v26 tvIdentifier];
        [v19 setObject:v26 forKey:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v105 objects:v114 count:16];
    }
    while (v23);
  }

  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v86 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v5;
  uint64_t v89 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
  if (v89)
  {
    v85 = v28;
    v99 = 0;
    v97 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    uint64_t v88 = 0;
    v32 = 0;
    uint64_t v84 = *(void *)v102;
    uint64_t v83 = *MEMORY[0x263F4B318];
    uint64_t v79 = *MEMORY[0x263F4B330];
    uint64_t v92 = *MEMORY[0x263F4B338];
    uint64_t v91 = *MEMORY[0x263F4B320];
    uint64_t v95 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v82 = *MEMORY[0x263F4B328];
    id v90 = v19;
    do
    {
      uint64_t v33 = 0;
      v34 = v99;
      v35 = v97;
      v36 = v29;
      do
      {
        if (*(void *)v102 != v84) {
          objc_enumerationMutation(obj);
        }
        v37 = *(void **)(*((void *)&v101 + 1) + 8 * v33);
        uint64_t v38 = objc_msgSend(v37, "objectForKeyedSubscript:", v83, v79);

        v32 = (void *)v38;
        v39 = [v98 objectForKey:v38];

        v100 = v32;
        if (v39)
        {
          v40 = [v98 objectForKey:v32];
          v41 = v30;
          uint64_t v42 = [v40 mutableCopy];

          v31 = (void *)v42;
          v30 = v41;
          v32 = v100;
        }
        else
        {
          v40 = v31;
          v31 = (void *)[v37 mutableCopy];
        }

        v43 = [v19 objectForKey:v32];

        v94 = v36;
        if (v43)
        {
          uint64_t v44 = [v19 objectForKey:v32];

          v30 = (void *)v44;
        }
        else
        {
          v45 = +[TVInterfaceFactory sharedInterfaceFactory];
          uint64_t v46 = [v45 _navigationControllerForTabIdentifier:v32];
          v47 = v30;
          v48 = (_TVAppNavigationController_iOS *)v46;

          v49 = v48;
          if (!v48) {
            v49 = objc_alloc_init(_TVAppNavigationController_iOS);
          }
          objc_opt_class();
          v30 = v49;
          if (objc_opt_isKindOfClass())
          {
            [(_TVAppNavigationController *)v49 setAppNavigationControllerDelegate:v80->_appNavigationControllerDelegate];
            [v31 setObject:v49 forKeyedSubscript:v79];
          }
          [(UIViewController *)v49 tv_setIdentifier:v32];
        }
        uint64_t v50 = v91;
        v51 = [v37 objectForKey:v92];

        v99 = v51;
        if ([v51 length])
        {
          v52 = [v31 objectForKeyedSubscript:v92];
          [v31 setObject:v51 forKeyedSubscript:v92];
          [v30 setTitle:v51];
          if (v52 && ([v52 isEqualToString:v51] & 1) == 0)
          {
            v53 = [v30 tabBarItem];
            [v53 setTitle:v51];

            v32 = v100;
          }

          uint64_t v50 = v91;
        }
        uint64_t v93 = v33;
        v54 = v37;
        v55 = [v37 objectForKey:v50];

        if ([v55 length])
        {
          [v31 setObject:v55 forKeyedSubscript:v50];
          v56 = [NSURL URLWithString:v55];
          [v30 tabBarItem];
          v57 = v30;
          v59 = v58 = v31;
          v60 = +[TVInterfaceFactory sharedInterfaceFactory];
          v61 = objc_msgSend(v56, "tv_resourceName");
          v62 = [v60 imageForResource:v61];
          v63 = [v62 _imageThatSuppressesAccessibilityHairlineThickening];
          [v59 setImage:v63];

          id v19 = v90;
          v31 = v58;
          v30 = v57;

          v32 = v100;
        }
        v97 = v55;
        v29 = [v54 objectForKey:v82];

        if ([v29 length])
        {
          [v31 setObject:v29 forKeyedSubscript:v82];
          v64 = [NSURL URLWithString:v29];
          v65 = [v30 tabBarItem];
          v66 = +[TVInterfaceFactory sharedInterfaceFactory];
          objc_msgSend(v64, "tv_resourceName");
          v67 = v30;
          v69 = v68 = v31;
          v70 = [v66 imageForResource:v69];
          v71 = [v70 _imageThatSuppressesAccessibilityHairlineThickening];
          [v65 setSelectedImage:v71];

          id v19 = v90;
          v31 = v68;
          v30 = v67;

          v32 = v100;
        }
        [v85 addObject:v31];
        [v86 addObject:v30];
        int v72 = [v87 isEqualToString:v32];
        if (v72) {
          unint64_t v73 = v88 + v93;
        }
        else {
          unint64_t v73 = v96;
        }
        uint64_t v74 = v95;
        if (v72) {
          uint64_t v74 = v88 + v93;
        }
        uint64_t v95 = v74;
        unint64_t v96 = v73;
        uint64_t v33 = v93 + 1;
        v34 = v99;
        v35 = v97;
        v36 = v29;
      }
      while (v89 != v93 + 1);
      v88 += v89;
      uint64_t v89 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
    }
    while (v89);

    v20 = v80;
    id v28 = v85;
    uint64_t v75 = v95;
  }
  else
  {
    uint64_t v75 = 0x7FFFFFFFFFFFFFFFLL;
  }

  [(_TVRootMenuBarController *)v20 setViewControllers:v86];
  [(_TVRootMenuBarController *)v20 setAppTabBarItems:v28];
  [(_TVRootMenuBarController *)v20 setPreviousSelectedIndex:v75];
  [(_TVRootMenuBarController *)v20 setSelectedIndex:v96];
  v76 = [(_TVRootMenuBarController *)v20 tabBar];
  [v76 setNeedsLayout];

  v77 = +[_TVAppLoadingView loadingScreen];
  [v77 hide];

  return v28;
}

- (id)selectedTabItemForTabBar:(id)a3
{
  if ([(_TVRootMenuBarController *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_appTabBarItems objectAtIndex:[(_TVRootMenuBarController *)self selectedIndex]];
    uint64_t v4 = [v5 objectForKey:*MEMORY[0x263F4B318]];
  }
  return v4;
}

- (void)tabBar:(id)a3 setSelectedTabItem:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v6 = self->_appTabBarItems;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v16 = self;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = *MEMORY[0x263F4B318];
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v10 + v8;
      uint64_t v15 = v9;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v6);
        }
        unint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) objectForKey:v12];

        if ([v9 isEqualToString:v5])
        {
          [(_TVRootMenuBarController *)v16 setSelectedIndex:v10 + v13];
          [(_TVRootMenuBarController *)v16 setPreviousSelectedIndex:v10 + v13];
          goto LABEL_11;
        }
        ++v13;
        uint64_t v15 = v9;
      }
      while (v8 != v13);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v10 = v14;
      if (v8) {
        continue;
      }
      break;
    }
LABEL_11:
  }
}

- (id)transientTabItemForTabBar:(id)a3
{
  return 0;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(_TVRootMenuBarController *)self presentedViewController];
  uint64_t v8 = +[_TVModalPresenter presenter];
  unint64_t v9 = [v8 modalRootViewController];
  if (([v7 isEqual:v9] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v10 = +[_TVModalPresenter presenter];
  char v11 = [v10 _isDismissing];

  if (v11)
  {
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_TVRootMenuBarController;
    [(_TVRootMenuBarController *)&v13 dismissViewControllerAnimated:v4 completion:v6];
    goto LABEL_6;
  }
  uint64_t v12 = +[_TVModalPresenter presenter];
  [v12 hideAllAnimated:v4 withCompletion:v6];

LABEL_6:
}

- (IKAppTabBar)appTabBar
{
  return self->_appTabBar;
}

- (NSArray)appTabBarItems
{
  return self->_appTabBarItems;
}

- (void)setAppTabBarItems:(id)a3
{
}

- (unint64_t)previousSelectedIndex
{
  return self->_previousSelectedIndex;
}

- (void)setPreviousSelectedIndex:(unint64_t)a3
{
  self->_previousSelectedIndex = a3;
}

- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate
{
  return self->_appNavigationControllerDelegate;
}

- (void)setAppNavigationControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNavigationControllerDelegate, 0);
  objc_storeStrong((id *)&self->_appTabBarItems, 0);
  objc_storeStrong((id *)&self->_appTabBar, 0);
}

- (void)tabBarController:(uint64_t)a1 didSelectViewController:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_230B4C000, a2, OS_LOG_TYPE_DEBUG, "Selected menu item at index %ld", (uint8_t *)&v2, 0xCu);
}

@end