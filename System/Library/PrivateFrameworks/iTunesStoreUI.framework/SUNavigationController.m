@interface SUNavigationController
- (BOOL)clearsWeakScriptReferences;
- (BOOL)isSkLoading;
- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4;
- (NSString)description;
- (SUClientInterface)clientInterface;
- (SUNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUNavigationController)initWithRootViewController:(id)a3;
- (SUNavigationController)initWithSection:(id)a3;
- (SUNavigationController)initWithSection:(id)a3 rootViewController:(id)a4;
- (SUSection)section;
- (id)copyArchivableContext;
- (id)copyScriptViewController;
- (id)moreListImage;
- (id)moreListSelectedImage;
- (int64_t)ITunesStoreUIBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_loadingDidChangeNotification:(id)a3;
- (void)_setStoreBarStyle:(int64_t)a3 clientInterface:(id)a4;
- (void)addChildViewController:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)removeChildViewController:(id)a3;
- (void)restoreArchivableContext:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSection:(id)a3;
- (void)setSkLoading:(BOOL)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUNavigationController

- (SUNavigationController)initWithSection:(id)a3
{
  return [(SUNavigationController *)self initWithSection:a3 rootViewController:0];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v6 loadView];
  if (!self->_storeBarStyle)
  {
    v3 = [(SUNavigationController *)self section];
    if ([v3 defaultPNGStyle] == 1)
    {
      v4 = [(SUNavigationController *)self navigationBar];
      [v4 setBarStyle:1];

      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 1;
    }
    [(SUNavigationController *)self _setStoreBarStyle:v5 clientInterface:self->_clientInterface];
  }
}

- (SUSection)section
{
  return self->_section;
}

- (void)_setStoreBarStyle:(int64_t)a3 clientInterface:(id)a4
{
  if (self->_storeBarStyle != a3)
  {
    self->_storeBarStyle = a3;
    v4.receiver = self;
    v4.super_class = (Class)SUNavigationController;
    -[UINavigationController _setStoreBarStyle:clientInterface:](&v4, sel__setStoreBarStyle_clientInterface_);
  }
}

- (void)setParentViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUNavigationController *)self parentViewController];
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v8 setParentViewController:v4];

  objc_super v6 = [(SUNavigationController *)self parentViewController];

  if (v5 != v6)
  {
    [(UIViewController *)self parentViewControllerHierarchyDidChange];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUViewControllerParentViewControllerDidChangeNotification" object:self];
  }
  if (v4 && !self->_canBeWeakScriptReference) {
    self->_canBeWeakScriptReference = 1;
  }
}

- (SUNavigationController)initWithSection:(id)a3 rootViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SUNavigationController *)self setSection:v6];
  v13.receiver = self;
  v13.super_class = (Class)SUNavigationController;
  objc_super v8 = [(SUNavigationController *)&v13 init];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v7 clientInterface];
      [(SUNavigationController *)v8 setClientInterface:v9];
    }
    if (v7)
    {
      if ([v6 type] == 1 || !objc_msgSend(v6, "type"))
      {
        [(SUNavigationController *)v8 pushViewController:v7 animated:0];
      }
      else
      {
        v10 = [[SUNavigationContainerViewController alloc] initWithChildViewController:v7];
        [(SUNavigationController *)v8 pushViewController:v10 animated:0];
      }
      v11 = [v7 tabBarItem];
      [(SUNavigationController *)v8 setTabBarItem:v11];
    }
  }

  return v8;
}

- (void)setSection:(id)a3
{
}

- (SUNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  id v4 = [(SUNavigationController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(SUNavigationController *)v4 setNavigationBarClass:objc_opt_class()];
  }
  return v4;
}

- (void)setClientInterface:(id)a3
{
  p_clientInterface = &self->_clientInterface;
  if (self->_clientInterface != a3)
  {
    objc_storeStrong((id *)&self->_clientInterface, a3);
    objc_super v6 = [(SUClientInterface *)*p_clientInterface appearance];
    id v7 = [(SUNavigationController *)self navigationBar];
    [v6 styleNavigationBar:v7];

    if (([(SUNavigationController *)self isToolbarHidden] & 1) == 0)
    {
      objc_super v8 = [(SUClientInterface *)*p_clientInterface appearance];
      v9 = [(SUNavigationController *)self toolbar];
      [v8 styleToolbar:v9];
    }
  }

  MEMORY[0x270F9A758]();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SUNavigationController *)self topViewController];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 supportedInterfaceOrientations];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      unint64_t v4 = 30;
    }
    else if (SUAllowsLandscapePhone())
    {
      unint64_t v4 = 26;
    }
    else
    {
      unint64_t v4 = 2;
    }
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUNavigationController *)self _popoverController];

  if (v5)
  {
    uint64_t v6 = [(SUNavigationController *)self navigationBar];
    SUNavigationBarRemoveStyling(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v7 viewWillAppear:v3];
}

- (SUNavigationController)initWithRootViewController:(id)a3
{
  return [(SUNavigationController *)self initWithSection:0 rootViewController:a3];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUViewControllerLoadingDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v4 dealloc];
}

- (void)setSkLoading:(BOOL)a3
{
  if (self->_skLoading != a3)
  {
    self->_skLoading = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"SUViewControllerLoadingDidChangeNotification" object:self];
  }
}

- (void)addChildViewController:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:@"SUViewControllerLoadingDidChangeNotification" object:v5];
  [v6 addObserver:self selector:sel__loadingDidChangeNotification_ name:@"SUViewControllerLoadingDidChangeNotification" object:v5];
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v7 addChildViewController:v5];
}

- (id)copyArchivableContext
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SUNavigationController;
  id v3 = [(UIViewController *)&v17 copyArchivableContext];
  [v3 setType:4];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SUNavigationController isNavigationBarHidden](self, "isNavigationBarHidden"));
  [v3 setValue:v4 forMetadataKey:@"navbarhidden"];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(SUNavigationController *)self viewControllers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyArchivableContext];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
  if ([v5 count]) {
    [v3 setValue:v5 forMetadataKey:@"controllers"];
  }

  return v3;
}

- (id)copyScriptViewController
{
  id v3 = objc_alloc_init(SUScriptNavigationController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SUNavigationController;
  id v4 = [(SUNavigationController *)&v9 description];
  id v5 = [(SUNavigationController *)self section];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v3 stringWithFormat:@"%@: %@", v4, v6];

  return (NSString *)v7;
}

- (int64_t)ITunesStoreUIBarStyle
{
  return self->_storeBarStyle;
}

- (id)moreListImage
{
  v2 = [(SUNavigationController *)self section];
  id v3 = [v2 moreListImage];

  return v3;
}

- (id)moreListSelectedImage
{
  v2 = [(SUNavigationController *)self section];
  id v3 = [v2 selectedMoreListImage];

  return v3;
}

- (void)removeChildViewController:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:@"SUViewControllerLoadingDidChangeNotification" object:v5];
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v7 removeChildViewController:v5];
}

- (void)restoreArchivableContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForMetadataKey:@"navbarhidden"];
  -[SUNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", [v5 BOOLValue]);

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v7 = [v4 valueForMetadataKey:@"controllers"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyViewController];
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(SUNavigationController *)self setViewControllers:v6];
  v13.receiver = self;
  v13.super_class = (Class)SUNavigationController;
  [(UIViewController *)&v13 restoreArchivableContext:v4];
}

- (void)setToolbarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    id v5 = [(SUClientInterface *)self->_clientInterface appearance];
    id v6 = [(SUNavigationController *)self toolbar];
    [v5 styleToolbar:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v7 setToolbarHidden:v3];
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    objc_super v7 = [(SUClientInterface *)self->_clientInterface appearance];
    uint64_t v8 = [(SUNavigationController *)self toolbar];
    [v7 styleToolbar:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v9 setToolbarHidden:v5 animated:v4];
}

- (void)setViewControllers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndex:0];
    id v6 = [v5 tabBarItem];
    [(SUNavigationController *)self setTabBarItem:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v7 setViewControllers:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUViewControllerDidDisappearNotification" object:self];

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  [(SUNavigationController *)&v6 viewDidDisappear:v3];
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUNavigationController;
  unsigned int v7 = [(SUNavigationController *)&v12 window:v6 shouldAutorotateToInterfaceOrientation:a4];
  uint64_t v8 = [(SUNavigationController *)self topViewController];
  objc_super v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    LOBYTE(v7) = [v8 window:v6 shouldAutorotateToInterfaceOrientation:a4];
  }

  return v7;
}

- (BOOL)clearsWeakScriptReferences
{
  return self->_canBeWeakScriptReference;
}

- (void)_loadingDidChangeNotification:(id)a3
{
  id v4 = [(SUNavigationController *)self topViewController];
  -[SUNavigationController setSkLoading:](self, "setSkLoading:", [v4 isSkLoaded]);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (BOOL)isSkLoading
{
  return self->_skLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);

  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end