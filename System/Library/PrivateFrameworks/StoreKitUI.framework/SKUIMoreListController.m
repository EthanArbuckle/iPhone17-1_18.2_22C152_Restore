@interface SKUIMoreListController
- (SKUIMoreListController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SKUIMoreListController

- (SKUIMoreListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIMoreListController initWithNibName:bundle:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMoreListController;
  v16 = [(SKUIMoreListController *)&v20 initWithNibName:v6 bundle:v7];
  v17 = v16;
  if (v16)
  {
    v18 = [(SKUIMoreListController *)v16 navigationItem];
    [v18 setBackButtonTitle:&stru_1F1C879E8];
  }
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4FB19A0] instancesRespondToSelector:a2])
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIMoreListController;
    [(UIMoreListController *)&v11 tableView:v7 didSelectRowAtIndexPath:v8];
  }
  uint64_t v9 = [(SKUIMoreListController *)self navigationController];
  uint64_t v10 = [v9 storeKitDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "moreNavigationController:didSelectItemAtIndex:", v9, objc_msgSend(v8, "row"));
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SKUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end