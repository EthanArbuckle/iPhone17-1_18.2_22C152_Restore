@interface SUUIMoreListController
- (SUUIMoreListController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SUUIMoreListController

- (SUUIMoreListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIMoreListController;
  v4 = [(SUUIMoreListController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUIMoreListController *)v4 navigationItem];
    [v6 setBackButtonTitle:&stru_2704F8130];
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x263F82978] instancesRespondToSelector:a2])
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIMoreListController;
    [(UIMoreListController *)&v11 tableView:v7 didSelectRowAtIndexPath:v8];
  }
  v9 = [(SUUIMoreListController *)self navigationController];
  v10 = [v9 storeKitDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "moreNavigationController:didSelectItemAtIndex:", v9, objc_msgSend(v8, "row"));
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SUUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

@end