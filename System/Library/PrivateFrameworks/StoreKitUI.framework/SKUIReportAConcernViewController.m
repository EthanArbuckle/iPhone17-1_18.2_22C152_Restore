@interface SKUIReportAConcernViewController
- (SKUIReportAConcernViewController)initWithConfiguration:(id)a3;
@end

@implementation SKUIReportAConcernViewController

- (SKUIReportAConcernViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernViewController initWithConfiguration:]();
  }
  v5 = [[SKUIReportAConcernReasonViewController alloc] initWithConfiguration:v4];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke;
  v9[3] = &unk_1E6428260;
  objc_copyWeak(&v10, &location);
  [(SKUIReportAConcernReasonViewController *)v5 setCompletion:v9];
  v8.receiver = self;
  v8.super_class = (Class)SKUIReportAConcernViewController;
  v6 = [(SKUIReportAConcernViewController *)&v8 initWithRootViewController:v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:&__block_literal_global_37];
}

void __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v0 imageNamed:@"toast-exclamation" inBundle:v1];

  v2 = [SKUIToastViewController alloc];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TOAST_CONCERN_REPORTED_PRIMARY" value:&stru_1F1C879E8 table:0];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TOAST_CONCERN_REPORTED_SECONDARY" value:&stru_1F1C879E8 table:0];
  v7 = [(SKUIToastViewController *)v2 initWithTitle:v4 description:v6 image:v8];

  [(SKUIToastViewController *)v7 present];
}

- (void)initWithConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReportAConcernViewController initWithConfiguration:]";
}

@end