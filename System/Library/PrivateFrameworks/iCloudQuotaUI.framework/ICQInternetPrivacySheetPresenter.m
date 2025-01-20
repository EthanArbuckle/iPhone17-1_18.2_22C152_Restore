@interface ICQInternetPrivacySheetPresenter
+ (id)presenterWithIdentifier:(id)a3 viewModel:(id)a4;
- (ICQInternetPrivacySheet)sheet;
- (UINavigationController)navigationController;
- (UIViewController)presentingViewController;
- (void)present;
- (void)setNavigationController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSheet:(id)a3;
@end

@implementation ICQInternetPrivacySheetPresenter

+ (id)presenterWithIdentifier:(id)a3 viewModel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [[ICQInternetPrivacySheet alloc] initWithIdentifier:v6 viewModel:v5];

  [v7 setSheet:v8];
  id v9 = objc_alloc(MEMORY[0x263F829B8]);
  v10 = [v7 sheet];
  v11 = (void *)[v9 initWithRootViewController:v10];
  [v7 setNavigationController:v11];

  v12 = [v7 navigationController];
  [v12 setModalPresentationStyle:2];

  return v7;
}

- (void)present
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[ICQInternetPrivacySheetPresenter present]";
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "presentingViewController is nil in %s!", (uint8_t *)&v1, 0xCu);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICQInternetPrivacySheet)sheet
{
  return self->_sheet;
}

- (void)setSheet:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_sheet, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end