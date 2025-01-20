@interface NMUDownloadWaitingAlertController
+ (id)requiredPropertiesForModelKind:(id)a3;
- (NMUDownloadWaitingAlertController)initWithModelObject:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6 presentingViewController:(id)a7;
- (void)presentWithCompletion:(id)a3;
@end

@implementation NMUDownloadWaitingAlertController

- (NMUDownloadWaitingAlertController)initWithModelObject:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6 presentingViewController:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NMUDownloadWaitingAlertController;
  v16 = [(NMUDownloadWaitingAlertController *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_modelObject, a3);
    v17->_status = a4;
    v17->_downloadPauseReason = a5;
    objc_storeStrong((id *)&v17->_keepLocalRequestOptions, a6);
    objc_storeStrong((id *)&v17->_presentingViewController, a7);
  }

  return v17;
}

- (void)presentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [[NMUDownloadWaitingAlertConfiguration alloc] initWithModelObject:self->_modelObject status:self->_status downloadPauseReason:self->_downloadPauseReason options:self->_keepLocalRequestOptions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__NMUDownloadWaitingAlertController_presentWithCompletion___block_invoke;
  v9[3] = &unk_264DA3C10;
  v10 = v5;
  id v11 = v4;
  v9[4] = self;
  v6 = v5;
  id v7 = v4;
  v8 = [(NMUKeepLocalAlertConfiguration *)v6 alertViewControllerWithKeepLocalBlock:v9];
  [(UIViewController *)self->_presentingViewController presentViewController:v8 animated:1 completion:0];
}

void __59__NMUDownloadWaitingAlertController_presentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 shouldPerformKeepLocalRequest])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F57508]) initWithModelObject:*(void *)(*(void *)(a1 + 32) + 8) enableState:1];
    id v4 = [[NMUKeepLocalRequestController alloc] initWithRequest:v3 presentingViewController:*(void *)(*(void *)(a1 + 32) + 40)];
    v5 = [v7 keepLocalRequestOptions];
    [(NMUKeepLocalRequestController *)v4 performRequestWithOptions:v5 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
  +[NMUMetricsReporter incrementTapCountForDownloadWaitingReason:action:](NMUMetricsReporter, "incrementTapCountForDownloadWaitingReason:action:", [*(id *)(a1 + 40) reason], objc_msgSend(v7, "downloadAction"));
}

+ (id)requiredPropertiesForModelKind:(id)a3
{
  return +[NMUKeepLocalAlertConfiguration requiredPropertiesForModelKind:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_keepLocalRequestOptions, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end