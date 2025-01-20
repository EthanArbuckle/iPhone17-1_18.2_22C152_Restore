@interface STPINListViewController
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (STPINListViewController)init;
- (STPINListViewController)initWithRootViewModelCoordinator:(id)a3;
- (STRootViewModelCoordinator)coordinator;
- (id)showingPinTarget;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setShowingPinTarget:(id)a3;
- (void)setUpPasscodeAndLineWrapBehaviorForSpecifier:(id)a3;
- (void)showPINSheet:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STPINListViewController

- (STPINListViewController)initWithRootViewModelCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STPINListViewController;
  v6 = [(STListViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v7;
}

- (STPINListViewController)init
{
  return [(STPINListViewController *)self initWithRootViewModelCoordinator:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STPINListViewController;
  [(STPINListViewController *)&v7 viewDidAppear:a3];
  v4 = [(STPINListViewController *)self specifierIDPendingPush];
  id v5 = [(STPINListViewController *)self specifierForID:v4];
  if ([(PSListController *)self st_shouldShowPINSheetForSpecifier:v5]) {
    [(STPINListViewController *)self showPINSheet:v5];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STPINListViewController.viewDidAppear", v6, 2u);
  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self specifierForID:v4];
  if ([(PSListController *)self st_shouldShowPINSheetForSpecifier:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STPINListViewController;
    BOOL v6 = [(STPINListViewController *)&v8 shouldDeferPushForSpecifierID:v4];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STPINListViewController *)self indexForIndexPath:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
  }
  if ([(PSListController *)self st_shouldShowPINSheetForSpecifier:v9])
  {
    [(STPINListViewController *)self showPINSheet:v9];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STPINListViewController;
    [(STPINListViewController *)&v10 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void)showPINSheet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 target];
  [(STPINListViewController *)self setShowingPinTarget:v5];

  [v4 setObject:self forKeyedSubscript:*MEMORY[0x263F60318]];
  v6.receiver = self;
  v6.super_class = (Class)STPINListViewController;
  [(STPINListViewController *)&v6 showPINSheet:v4];
}

- (void)setUpPasscodeAndLineWrapBehaviorForSpecifier:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F5FEF8];
  id v7 = a3;
  uint64_t v4 = MEMORY[0x263EFFA88];
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v3];
  id v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v7 setObject:&unk_26D967138 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v7 setObject:v4 forKeyedSubscript:0x26D940308];
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  id v4 = a3;
  id v6 = [v4 specifier];
  id v5 = [(STPINListViewController *)self showingPinTarget];
  [v6 setTarget:v5];

  [(STPINListViewController *)self setShowingPinTarget:0];
  [(PSListController *)self st_devicePINControllerDidDismissPINPane:v4];
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (id)showingPinTarget
{
  return self->_showingPinTarget;
}

- (void)setShowingPinTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showingPinTarget, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end