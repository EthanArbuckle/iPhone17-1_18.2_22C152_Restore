@interface SUMoreNavigationController
+ (Class)_moreListControllerClass;
- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4;
- (SUMoreNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)copyScriptViewController;
- (int64_t)ITunesStoreUIBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUMoreNavigationController

- (SUMoreNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUMoreNavigationController;
  v4 = [(SUMoreNavigationController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(SUMoreNavigationController *)v4 setNavigationBarClass:objc_opt_class()];
  }
  return v4;
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (id)copyScriptViewController
{
  v3 = objc_alloc_init(SUScriptNavigationController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (int64_t)ITunesStoreUIBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1) {
    return 30;
  }
  if (SUAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)[(SUMoreNavigationController *)self tabBarController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "clientInterface"), "appearance"), "styleNavigationBar:", -[SUMoreNavigationController navigationBar](self, "navigationBar"));
  }
  v6.receiver = self;
  v6.super_class = (Class)SUMoreNavigationController;
  [(SUMoreNavigationController *)&v6 viewWillAppear:v3];
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SUMoreNavigationController;
  unsigned int v7 = -[SUMoreNavigationController window:shouldAutorotateToInterfaceOrientation:](&v11, sel_window_shouldAutorotateToInterfaceOrientation_);
  v8 = (void *)[(SUMoreNavigationController *)self topViewController];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    LOBYTE(v7) = [v8 window:a3 shouldAutorotateToInterfaceOrientation:a4];
  }
  return v7;
}

@end