@interface SUUIReportAConcernViewController
- (SUUIReportAConcernViewController)initWithConfiguration:(id)a3;
@end

@implementation SUUIReportAConcernViewController

- (SUUIReportAConcernViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[SUUIReportAConcernReasonViewController alloc] initWithConfiguration:v4];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke;
  v9[3] = &unk_265408B38;
  objc_copyWeak(&v10, &location);
  [(SUUIReportAConcernReasonViewController *)v5 setCompletion:v9];
  v8.receiver = self;
  v8.super_class = (Class)SUUIReportAConcernViewController;
  v6 = [(SUUIReportAConcernViewController *)&v8 initWithRootViewController:v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:&__block_literal_global_63];
}

void __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke_2()
{
  v0 = (void *)MEMORY[0x263F827E8];
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v0 imageNamed:@"toast-exclamation" inBundle:v1];

  v2 = [SUUIToastViewController alloc];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TOAST_CONCERN_REPORTED_PRIMARY" value:&stru_2704F8130 table:0];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TOAST_CONCERN_REPORTED_SECONDARY" value:&stru_2704F8130 table:0];
  v7 = [(SUUIToastViewController *)v2 initWithTitle:v4 description:v6 image:v8];

  [(SUUIToastViewController *)v7 present];
}

@end