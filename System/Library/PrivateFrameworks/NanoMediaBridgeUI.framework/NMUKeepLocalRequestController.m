@interface NMUKeepLocalRequestController
+ (id)requiredPropertiesForModelKind:(id)a3;
- (NMUKeepLocalRequestController)initWithRequest:(id)a3 presentingViewController:(id)a4;
- (void)_handleResponseForRequest:(id)a3 options:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_presentAlertForRequest:(id)a3 options:(id)a4 error:(id)a5 completion:(id)a6;
- (void)performRequestWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NMUKeepLocalRequestController

- (NMUKeepLocalRequestController)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMUKeepLocalRequestController;
  v9 = [(NMUKeepLocalRequestController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)performRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  request = self->_request;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__NMUKeepLocalRequestController_performRequestWithOptions_completion___block_invoke;
  v11[3] = &unk_264DA3BC0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NMSKeepLocalRequest *)request performWithOptions:v10 completion:v11];
}

uint64_t __70__NMUKeepLocalRequestController_performRequestWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleResponseForRequest:*(void *)(*(void *)(a1 + 32) + 8) options:*(void *)(a1 + 40) error:a2 completion:*(void *)(a1 + 48)];
}

+ (id)requiredPropertiesForModelKind:(id)a3
{
  return +[NMUKeepLocalAlertConfiguration requiredPropertiesForModelKind:a3];
}

- (void)_handleResponseForRequest:(id)a3 options:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    v14 = [v12 domain];
    if ([v14 isEqualToString:*MEMORY[0x263F574F0]])
    {
      uint64_t v15 = [v12 code];

      if (v15 == 1)
      {
LABEL_13:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __84__NMUKeepLocalRequestController__handleResponseForRequest_options_error_completion___block_invoke;
        block[3] = &unk_264DA3BE8;
        block[4] = self;
        id v21 = v10;
        id v22 = v11;
        id v23 = v12;
        id v24 = v13;
        dispatch_async(MEMORY[0x263EF83A0], block);

        goto LABEL_14;
      }
    }
    else
    {
    }
    v19 = NMLogForCategory(7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NMUKeepLocalRequestController _handleResponseForRequest:options:error:completion:]((uint64_t)v12, v10, v19);
    }

    goto LABEL_13;
  }
  v16 = NMLogForCategory(7);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v10 enableState];
    v18 = [v10 modelObject];
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_2397B1000, v16, OS_LOG_TYPE_DEFAULT, "[NMUKeepLocalRequestController] Successfully set keepLocalState:%ld for modelObject: %@", buf, 0x16u);
  }
  if (v13) {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }
LABEL_14:
}

uint64_t __84__NMUKeepLocalRequestController__handleResponseForRequest_options_error_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAlertForRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 48) error:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)_presentAlertForRequest:(id)a3 options:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [NMUKeepLocalErrorAlertConfiguration alloc];
  uint64_t v15 = [v13 modelObject];

  v16 = [(NMUKeepLocalErrorAlertConfiguration *)v14 initWithModelObject:v15 error:v11 options:v12];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__NMUKeepLocalRequestController__presentAlertForRequest_options_error_completion___block_invoke;
  v20[3] = &unk_264DA3C10;
  id v21 = v16;
  id v22 = v10;
  v20[4] = self;
  uint64_t v17 = v16;
  id v18 = v10;
  v19 = [(NMUKeepLocalAlertConfiguration *)v17 alertViewControllerWithKeepLocalBlock:v20];
  [(UIViewController *)self->_presentingViewController presentViewController:v19 animated:1 completion:0];
}

void __82__NMUKeepLocalRequestController__presentAlertForRequest_options_error_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 shouldPerformKeepLocalRequest])
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v6 keepLocalRequestOptions];
    [v3 performRequestWithOptions:v4 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  +[NMUMetricsReporter incrementTapCountForKeepLocalErrorAlertReason:action:](NMUMetricsReporter, "incrementTapCountForKeepLocalErrorAlertReason:action:", [*(id *)(a1 + 40) reason], objc_msgSend(v6, "downloadAction"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_handleResponseForRequest:(NSObject *)a3 options:error:completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 modelObject];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_2397B1000, a3, OS_LOG_TYPE_ERROR, "[NMUKeepLocalRequestController] error (%@) while trying to validate for download model object: %@", (uint8_t *)&v6, 0x16u);
}

@end