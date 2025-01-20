@interface SUCreditCardReaderViewController
+ (BOOL)cameraSupported;
- (id)completionBlock;
- (void)_cancelButtonPressed;
- (void)_returnCameraOutput:(id)a3 error:(id)a4;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidEnd:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)setCompletionBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUCreditCardReaderViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)SUCreditCardReaderViewController;
  [(SUCreditCardReaderViewController *)&v20 viewDidLoad];
  v3 = [(SUCreditCardReaderViewController *)self view];
  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed];
  v6 = [(SUCreditCardReaderViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__cancelButtonPressed];
  v8 = [(SUCreditCardReaderViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  if ([(id)objc_opt_class() cameraSupported])
  {
    v9 = (CRCameraReader *)objc_alloc_init(MEMORY[0x263F37E00]);
    cameraController = self->cameraController;
    self->cameraController = v9;

    [(CRCameraReader *)self->cameraController setHidePlacementText:1];
    [(CRCameraReader *)self->cameraController setDelegate:self];
    v11 = self->cameraController;
    v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F37DE8], *MEMORY[0x263F37DD8], *MEMORY[0x263F37DE0], 0);
    [(CRCameraReader *)v11 setOutputObjectTypes:v12];

    [(SUCreditCardReaderViewController *)self addChildViewController:self->cameraController];
    [(CRCameraReader *)self->cameraController didMoveToParentViewController:self];
    v13 = [(SUCreditCardReaderViewController *)self view];
    v14 = [(CRCameraReader *)self->cameraController view];
    [v13 addSubview:v14];
  }
  v15 = [SUCreditCardReaderInfoView alloc];
  v16 = -[SUCreditCardReaderInfoView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  captureInfoView = self->captureInfoView;
  self->captureInfoView = v16;

  v18 = [(SUCreditCardReaderViewController *)self view];
  [v18 addSubview:self->captureInfoView];

  v19 = [(SUCreditCardReaderViewController *)self view];
  [v19 bringSubviewToFront:self->captureInfoView];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUCreditCardReaderViewController;
  [(SUCreditCardReaderViewController *)&v5 viewDidDisappear:a3];
  [(CRCameraReader *)self->cameraController setDelegate:0];
  [(CRCameraReader *)self->cameraController cancel];
  [(CRCameraReader *)self->cameraController willMoveToParentViewController:0];
  v4 = [(CRCameraReader *)self->cameraController view];
  [v4 removeFromSuperview];

  [(CRCameraReader *)self->cameraController removeFromParentViewController];
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SUCreditCardReaderViewController;
  [(SUCreditCardReaderViewController *)&v21 viewDidLayoutSubviews];
  v3 = [(SUCreditCardReaderViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v11 * 0.66;
  v13 = [(CRCameraReader *)self->cameraController view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v12);

  v14 = [(SUCreditCardReaderViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[SUCreditCardReaderInfoView setFrame:](self->captureInfoView, "setFrame:", v16, v12, v18, v20 - v12);
}

- (void)didReceiveMemoryWarning
{
  v6.receiver = self;
  v6.super_class = (Class)SUCreditCardReaderViewController;
  [(SUCreditCardReaderViewController *)&v6 didReceiveMemoryWarning];
  if ([(SUCreditCardReaderViewController *)self isViewLoaded])
  {
    v3 = [(SUCreditCardReaderViewController *)self view];
    double v4 = [v3 window];

    if (!v4)
    {
      [(SUCreditCardReaderViewController *)self setView:0];
      cameraController = self->cameraController;
      self->cameraController = 0;
    }
  }
}

+ (BOOL)cameraSupported
{
  return [MEMORY[0x263F37E00] supportedCameraCount] != 0;
}

- (void)_cancelButtonPressed
{
  id v3 = (id)objc_opt_new();
  [v3 setCancelled:1];
  [(SUCreditCardReaderViewController *)self _returnCameraOutput:v3 error:0];
}

- (void)_returnCameraOutput:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 setError:v7];
  if (v7)
  {
    double v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    double v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v7;
      id v12 = *(id *)&location[4];
      LODWORD(v16) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      double v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, location, v16);
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke;
  block[3] = &unk_264812730;
  objc_copyWeak(&v19, (id *)location);
  id v18 = v6;
  id v14 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
  pendingOutput = self->pendingOutput;
  self->pendingOutput = 0;

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
}

void __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = [WeakRetained completionBlock];

  if (v4)
  {
    double v5 = [WeakRetained completionBlock];
    v5[2](v5, *(void *)(a1 + 32));
  }
  id v6 = *(void **)(a1 + 32);
  if (!v6
    || ([v6 manualEntrySelected] & 1) != 0
    || ([*(id *)(a1 + 32) cancelled] & 1) != 0)
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke_2;
    block[3] = &unk_264812708;
    objc_copyWeak(&v9, v2);
    dispatch_after(v7, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v9);
  }
}

void __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  [(SUCreditCardReaderViewController *)self _returnCameraOutput:0 error:a4];
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  v28 = self;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a4;
  double v5 = (SUCreditCardReaderOutput *)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = *MEMORY[0x263F37DE8];
    uint64_t v10 = *MEMORY[0x263F37DD8];
    uint64_t v11 = *MEMORY[0x263F37DE0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "type", v28);
        int v15 = [v14 isEqual:v9];

        if (v15)
        {
          uint64_t v16 = [v13 stringValue];
          [(SUCreditCardReaderOutput *)v5 setCardNumber:v16];
        }
        double v17 = [v13 type];
        int v18 = [v17 isEqual:v10];

        if (v18)
        {
          id v19 = [v13 stringValue];
          [(SUCreditCardReaderOutput *)v5 setCardCardholderName:v19];
        }
        double v20 = [v13 type];
        int v21 = [v20 isEqual:v11];

        if (v21)
        {
          id v22 = v13;
          uint64_t v23 = [v22 dayValue];
          [(SUCreditCardReaderOutput *)v5 setCardExpirationDay:v23];

          v24 = [v22 monthValue];
          [(SUCreditCardReaderOutput *)v5 setCardExpirationMonth:v24];

          v25 = [v22 yearValue];
          [(SUCreditCardReaderOutput *)v5 setCardExpirationYear:v25];

          v26 = [v22 stringValue];
          [(SUCreditCardReaderOutput *)v5 setCardExpirationStringValue:v26];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  pendingOutput = v28->pendingOutput;
  v28->pendingOutput = v5;
}

- (void)cameraReaderDidEnd:(id)a3
{
  pendingOutput = self->pendingOutput;
  if (pendingOutput) {
    [(SUCreditCardReaderViewController *)self _returnCameraOutput:pendingOutput error:0];
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->pendingOutput, 0);
  objc_storeStrong((id *)&self->captureInfoView, 0);

  objc_storeStrong((id *)&self->cameraController, 0);
}

@end