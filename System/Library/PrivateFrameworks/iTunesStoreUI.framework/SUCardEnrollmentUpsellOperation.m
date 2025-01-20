@interface SUCardEnrollmentUpsellOperation
- (BOOL)didSucceed;
- (NSString)referrerIdentifier;
- (OS_dispatch_semaphore)semaphore;
- (SUCardEnrollmentUpsellOperation)initWithViewController:(id)a3;
- (UIViewController)viewController;
- (id)_paymentSetupFeature;
- (int64_t)paymentSetupFeatureState;
- (void)paymentSetupViewControllerDidDismiss;
- (void)run;
- (void)setPaymentSetupFeatureState:(int64_t)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SUCardEnrollmentUpsellOperation

- (SUCardEnrollmentUpsellOperation)initWithViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUCardEnrollmentUpsellOperation;
  v6 = [(SUCardEnrollmentUpsellOperation *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AppleMediaServices.SUCardEnrollmentUpsellOperation.dispatch", 0);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v6;
}

- (BOOL)didSucceed
{
  return [(SUCardEnrollmentUpsellOperation *)self paymentSetupFeatureState] == 3;
}

- (void)run
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = [(SUCardEnrollmentUpsellOperation *)self _paymentSetupFeature];
  if (v3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke;
    block[3] = &unk_264812290;
    block[4] = self;
    id v5 = v3;
    id v56 = v5;
    dispatch_sync(dispatchQueue, block);
    id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    dispatch_queue_t v7 = [(SUCardEnrollmentUpsellOperation *)self referrerIdentifier];
    [v6 setReferrerIdentifier:v7];

    id v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    [v8 setConfiguration:v6];
    id v57 = v5;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    [v8 setPaymentSetupFeatures:v9];

    uint64_t v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    v11 = (void *)v10;
    if (v8)
    {
      if (!v10)
      {
        v11 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      v14 = [v11 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        v15 = objc_opt_class();
        int v58 = 138543362;
        id v59 = v15;
        id v16 = v15;
        LODWORD(v49) = 12;
        v47 = &v58;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17) {
          goto LABEL_14;
        }
        v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v58, v49);
        free(v17);
        v47 = (int *)v14;
        SSFileLog();
      }

LABEL_14:
      dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
      [(SUCardEnrollmentUpsellOperation *)self setSemaphore:v18];

      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke_12;
      v52[3] = &unk_264812290;
      id v53 = v8;
      v54 = self;
      dispatch_async(MEMORY[0x263EF83A0], v52);
      v19 = [(SUCardEnrollmentUpsellOperation *)self semaphore];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

      v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      if (!v20)
      {
        v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v21 = objc_msgSend(v20, "shouldLog", v47);
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      v23 = [v20 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        v22 &= 2u;
      }
      if (v22)
      {
        v24 = objc_opt_class();
        int v58 = 138543362;
        id v59 = v24;
        id v25 = v24;
        LODWORD(v49) = 12;
        v48 = &v58;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26) {
          goto LABEL_25;
        }
        v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v58, v49);
        free(v26);
        v48 = (int *)v23;
        SSFileLog();
      }

LABEL_25:
      v27 = [(SUCardEnrollmentUpsellOperation *)self _paymentSetupFeature];

      if (v27)
      {
        v28 = self->_dispatchQueue;
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke_14;
        v50[3] = &unk_264812290;
        v50[4] = self;
        id v51 = v27;
        dispatch_sync(v28, v50);

LABEL_61:
        v11 = v53;
        id v5 = v27;
        goto LABEL_62;
      }
      v40 = [MEMORY[0x263F7B1F8] sharedConfig];
      if (!v40)
      {
        v40 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v41 = objc_msgSend(v40, "shouldLog", v48);
      if ([v40 shouldLogToDisk]) {
        int v42 = v41 | 2;
      }
      else {
        int v42 = v41;
      }
      v43 = [v40 OSLogObject];
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        v42 &= 2u;
      }
      if (v42)
      {
        v44 = objc_opt_class();
        int v58 = 138543362;
        id v59 = v44;
        id v45 = v44;
        LODWORD(v49) = 12;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
        {
LABEL_60:

          goto LABEL_61;
        }
        v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v58, v49);
        free(v46);
        SSFileLog();
      }

      goto LABEL_60;
    }
    if (!v10)
    {
      v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v34 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v35 = v34 | 2;
    }
    else {
      int v35 = v34;
    }
    v36 = [v11 OSLogObject];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      v35 &= 2u;
    }
    if (v35)
    {
      v37 = objc_opt_class();
      int v58 = 138543362;
      id v59 = v37;
      id v38 = v37;
      LODWORD(v49) = 12;
      v39 = (void *)_os_log_send_and_compose_impl();

      if (!v39)
      {
LABEL_62:

        goto LABEL_63;
      }
      v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v58, v49);
      free(v39);
      SSFileLog();
    }

    goto LABEL_62;
  }
  id v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v29 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  v31 = [v5 OSLogObject];
  if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    v30 &= 2u;
  }
  if (!v30) {
    goto LABEL_37;
  }
  int v58 = 138543362;
  id v59 = (id)objc_opt_class();
  id v32 = v59;
  LODWORD(v49) = 12;
  v33 = (void *)_os_log_send_and_compose_impl();

  if (v33)
  {
    v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v58, v49);
    free(v33);
    SSFileLog();
LABEL_37:
  }
LABEL_63:
}

uint64_t __38__SUCardEnrollmentUpsellOperation_run__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  id v6 = objc_opt_class();
  dispatch_queue_t v7 = NSNumber;
  id v8 = *(void **)(a1 + 40);
  id v9 = v6;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "state"));
  int v13 = 138543618;
  v14 = v6;
  __int16 v15 = 2114;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v12);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  uint64_t result = [*(id *)(a1 + 40) state];
  *(void *)(*(void *)(a1 + 32) + 352) = result;
  return result;
}

void __38__SUCardEnrollmentUpsellOperation_run__block_invoke_12(uint64_t a1)
{
  int v3 = [[SUPaymentSetupViewController alloc] initWithPaymentSetupRequest:*(void *)(a1 + 32)];
  [(SUPaymentSetupViewController *)v3 setDelegate:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) viewController];
  [v2 presentViewController:v3 animated:0 completion:&__block_literal_global_13];
}

void __38__SUCardEnrollmentUpsellOperation_run__block_invoke_2()
{
  v0 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v0)
  {
    v0 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v1 = [v0 shouldLog];
  if ([v0 shouldLogToDisk]) {
    int v2 = v1 | 2;
  }
  else {
    int v2 = v1;
  }
  int v3 = [v0 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    int v4 = v2;
  }
  else {
    int v4 = v2 & 2;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v7[0] = 0;
  LODWORD(v6) = 2;
  id v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    int v3 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, v7, v6);
    free(v5);
    SSFileLog();
LABEL_12:
  }
}

uint64_t __38__SUCardEnrollmentUpsellOperation_run__block_invoke_14(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v2)
  {
    int v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = objc_opt_class();
  dispatch_queue_t v7 = NSNumber;
  id v8 = *(void **)(a1 + 40);
  id v9 = v6;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "state"));
  int v13 = 138543618;
  v14 = v6;
  __int16 v15 = 2114;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v12);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  uint64_t result = [*(id *)(a1 + 40) state];
  *(void *)(*(void *)(a1 + 32) + 352) = result;
  return result;
}

- (id)_paymentSetupFeature
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F27DF0]);
  int v4 = [(SUCardEnrollmentUpsellOperation *)self referrerIdentifier];
  id v5 = (void *)[v3 initWithIdentifier:v4];

  uint64_t v6 = [v5 performPaymentSetupFeatureLookup];
  id v18 = 0;
  dispatch_queue_t v7 = [v6 resultWithError:&v18];
  id v8 = v18;

  if (v8)
  {
    id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    if (!v9)
    {
      id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    uint64_t v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v13 = objc_opt_class();
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2114;
      id v22 = v8;
      id v14 = v13;
      LODWORD(v17) = 22;
      __int16 v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v19, v17);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (void)paymentSetupViewControllerDidDismiss
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  LODWORD(v11) = 138543362;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v7 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  id v9 = [(SUCardEnrollmentUpsellOperation *)self semaphore];
  dispatch_semaphore_signal(v9);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (int64_t)paymentSetupFeatureState
{
  return self->_paymentSetupFeatureState;
}

- (void)setPaymentSetupFeatureState:(int64_t)a3
{
  self->_paymentSetupFeatureState = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end