@interface UIPrintingProgress
- (BOOL)creatingPDF;
- (BOOL)progressVisible;
- (NSString)title;
- (UIPrintingProgress)initWithPrinterName:(id)a3 forceDisplayAsAlert:(BOOL)a4 hostingWindowScene:(id)a5 cancelHandler:(id)a6;
- (UIWindow)progressAlertWindow;
- (UIWindowScene)hostingWindowScene;
- (double)lastPageUpdate;
- (double)nextPrintDelay;
- (double)progressAlertDelay;
- (id)initPDFCreationWithHostingWindowScene:(id)a3 cancelHandler:(id)a4;
- (void)_mainQueue_endProgress;
- (void)_mainQueue_hideProgressAnimated:(BOOL)a3;
- (void)_mainQueue_presentProgressAlert;
- (void)_mainQueue_showProgress:(id)a3 immediately:(BOOL)a4;
- (void)_presentProgressAlert;
- (void)endProgress;
- (void)hideProgressAnimated:(BOOL)a3;
- (void)progressCancel;
- (void)setCreatingPDF:(BOOL)a3;
- (void)setHostingWindowScene:(id)a3;
- (void)setLastPageUpdate:(double)a3;
- (void)setPage:(int64_t)a3 ofPage:(int64_t)a4;
- (void)setPrinterInfoState:(int)a3;
- (void)setProgressAlertDelay:(double)a3;
- (void)setProgressAlertWindow:(id)a3;
- (void)showProgress:(id)a3 immediately:(BOOL)a4;
@end

@implementation UIPrintingProgress

- (UIPrintingProgress)initWithPrinterName:(id)a3 forceDisplayAsAlert:(BOOL)a4 hostingWindowScene:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UIPrintingProgress;
  v13 = [(UIPrintingProgress *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    printerName = v13->_printerName;
    v13->_printerName = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    id cancelHandler = v13->_cancelHandler;
    v13->_id cancelHandler = (id)v16;

    v13->_forceDisplayAsAlert = a4;
    *(_WORD *)&v13->_presentingAlert = 0;
    [(UIPrintingProgress *)v13 setProgressAlertDelay:1.0];
    [(UIPrintingProgress *)v13 setHostingWindowScene:v11];
  }

  return v13;
}

- (id)initPDFCreationWithHostingWindowScene:(id)a3 cancelHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintingProgress;
  v8 = [(UIPrintingProgress *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    id cancelHandler = v8->_cancelHandler;
    v8->_id cancelHandler = (id)v9;

    v8->_forceDisplayAsAlert = 1;
    v8->_creatingPDF = 1;
    [(UIPrintingProgress *)v8 setProgressAlertDelay:0.0];
    [(UIPrintingProgress *)v8 setHostingWindowScene:v6];
  }

  return v8;
}

- (BOOL)progressVisible
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom])
  {

LABEL_4:
    v5 = [(UIPrintingProgress *)self progressAlertWindow];
    char v6 = [v5 _isVisible];

    return v6;
  }
  BOOL forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert) {
    goto LABEL_4;
  }
  viewController = self->_viewController;
  return [(UIPrintingProgressViewController *)viewController visible];
}

- (NSString)title
{
  if (self->_creatingPDF)
  {
    v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"Creating PDF" value:@"Creating PDF" table:@"Localizable"];
  }
  else
  {
    v5 = NSString;
    v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v6 = [v2 localizedStringForKey:@"Printing to “%@”" value:@"Printing to “%@”" table:@"Localizable"];
    v3 = objc_msgSend(v5, "stringWithFormat:", v6, self->_printerName);
  }
  return (NSString *)v3;
}

- (void)_presentProgressAlert
{
  self->_presentingAlert = 1;
  if (pthread_main_np() == 1)
  {
    [(UIPrintingProgress *)self _mainQueue_presentProgressAlert];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__UIPrintingProgress__presentProgressAlert__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __43__UIPrintingProgress__presentProgressAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentProgressAlert");
}

- (void)_mainQueue_presentProgressAlert
{
  id v7 = [(UIPrintingProgress *)self hostingWindowScene];
  if (!v7)
  {
    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v7 = [v3 _findUISceneForLegacyInterfaceOrientation];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v7];
  [(UIPrintingProgress *)self setProgressAlertWindow:v4];
  [v4 setOpaque:0];
  v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v5];

  [v4 setWindowLevel:*MEMORY[0x1E4FB3108]];
  [v4 setHidden:1];
  [v4 _setRoleHint:*MEMORY[0x1E4FB3350]];
  char v6 = objc_opt_new();
  [v4 setRootViewController:v6];
  [v4 makeKeyAndVisible];
  [v6 presentViewController:self->_alertController animated:0 completion:0];
}

- (void)showProgress:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (pthread_main_np() == 1)
  {
    [(UIPrintingProgress *)self _mainQueue_showProgress:v6 immediately:v4];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_startTime = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__UIPrintingProgress_showProgress_immediately___block_invoke;
    block[3] = &unk_1E6DA14C8;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __47__UIPrintingProgress_showProgress_immediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_showProgress:immediately:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_mainQueue_showProgress:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIPrintingProgress *)self progressVisible] && v4)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_displayTime = v7;
  }
  v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v8 userInterfaceIdiom])
  {

LABEL_7:
    alertController = self->_alertController;
    if (alertController)
    {
      [(UIAlertController *)alertController setMessage:v6];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4FB1418];
      objc_super v12 = [(UIPrintingProgress *)self title];
      v13 = [v11 alertControllerWithTitle:v12 message:v6 preferredStyle:1];
      uint64_t v14 = self->_alertController;
      self->_alertController = v13;

      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"PRINT_PROGRESS_CANCEL_BUTTON" value:@"Cancel" table:@"Localizable"];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke;
      v37 = &unk_1E6DA19A0;
      objc_copyWeak(&v38, &location);
      v18 = [v15 actionWithTitle:v17 style:1 handler:&v34];

      objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v34, v35, v36, v37);
      self->_startTime = v19;
      [(UIAlertController *)self->_alertController addAction:v18];

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    v20 = [(UIAlertController *)self->_alertController actions];
    v21 = [v20 firstObject];
    BOOL donePrinting = self->_donePrinting;
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = v23;
    if (donePrinting)
    {
      v25 = @"PRINT_PROGRESS_OK_BUTTON";
      v26 = @"OK";
    }
    else
    {
      v25 = @"PRINT_PROGRESS_CANCEL_BUTTON";
      v26 = @"Cancel";
    }
    v27 = [v23 localizedStringForKey:v25 value:v26 table:@"Localizable"];
    [v21 setTitle:v27];

    if (v4 && !self->_presentingAlert && ![(id)*MEMORY[0x1E4FB2608] applicationState]) {
      [(UIPrintingProgress *)self _presentProgressAlert];
    }
    goto LABEL_21;
  }
  BOOL forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert) {
    goto LABEL_7;
  }
  viewController = self->_viewController;
  if (viewController)
  {
    [(UIPrintingProgressViewController *)viewController setMessage:v6];
  }
  else
  {
    v29 = [UIPrintingProgressViewController alloc];
    v30 = [(UIPrintingProgress *)self title];
    v31 = [(UIPrintingProgressViewController *)v29 initWithTitle:v30 message:v6 printingProgress:self];
    v32 = self->_viewController;
    self->_viewController = v31;

    [(UIPrintingProgressViewController *)self->_viewController show];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_displayTime = v33;
  }
  [(UIPrintingProgressViewController *)self->_viewController setDonePrinting:self->_donePrinting];
LABEL_21:
}

void __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke_2;
  block[3] = &unk_1E6DA1408;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result progressCancel];
  }
  return result;
}

- (void)hideProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() == 1)
  {
    [(UIPrintingProgress *)self _mainQueue_hideProgressAnimated:v3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__UIPrintingProgress_hideProgressAnimated___block_invoke;
    v5[3] = &unk_1E6DA19C8;
    v5[4] = self;
    BOOL v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __43__UIPrintingProgress_hideProgressAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_hideProgressAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_mainQueue_hideProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_endProgress object:0];
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v5 userInterfaceIdiom])
  {

LABEL_4:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__UIPrintingProgress__mainQueue_hideProgressAnimated___block_invoke;
    v9[3] = &unk_1E6DA1408;
    v9[4] = self;
    double v7 = (void *)MEMORY[0x1E4E4C3C0](v9);
    [(UIAlertController *)self->_alertController dismissViewControllerAnimated:1 completion:v7];

    return;
  }
  BOOL forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert) {
    goto LABEL_4;
  }
  viewController = self->_viewController;
  [(UIPrintingProgressViewController *)viewController dismissAnimated:v3];
}

uint64_t __54__UIPrintingProgress__mainQueue_hideProgressAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressAlertWindow];
  [v2 setHidden:1];

  uint64_t result = [*(id *)(a1 + 32) setProgressAlertWindow:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  return result;
}

- (void)progressCancel
{
  if (self->_donePrinting)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_startTime = v3 + 100.0;
  }
  else
  {
    _UIPrinterInfoCancelRequests();
    BOOL v4 = (void (*)(void))*((void *)self->_cancelHandler + 2);
    v4();
  }
}

- (void)endProgress
{
  if (pthread_main_np() == 1)
  {
    [(UIPrintingProgress *)self _mainQueue_endProgress];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__UIPrintingProgress_endProgress__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __33__UIPrintingProgress_endProgress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_endProgress");
}

- (void)_mainQueue_endProgress
{
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] applicationState];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  double displayTime = self->_displayTime;
  if ([(UIPrintingProgress *)self progressVisible]
    && !v3
    && ((double v7 = v5 - displayTime, v5 - displayTime > 0.0) ? (v8 = v7 < 1.0) : (v8 = 0), v8))
  {
    [(UIPrintingProgress *)self performSelector:sel_endProgress withObject:0 afterDelay:v7];
  }
  else
  {
    BOOL v9 = [(UIPrintingProgress *)self progressVisible];
    if (v3) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v9;
    }
    [(UIPrintingProgress *)self hideProgressAnimated:v10];
  }
}

- (void)setPrinterInfoState:(int)a3
{
  if (a3 == 2)
  {
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v6 = [v5 localizedStringForKey:@"Failed to Contact Printer" value:@"Failed to Contact Printer" table:@"Localizable"];
    [(UIPrintingProgress *)self showProgress:v6 immediately:1];

    [(UIPrintingProgress *)self progressCancel];
    self->_BOOL donePrinting = 1;
  }
  else if (!a3)
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = [v7 localizedStringForKey:@"Contacting Printer…" value:@"Contacting Printer…" table:@"Localizable"];
    [(UIPrintingProgress *)self showProgress:v4 immediately:1];
  }
}

- (void)setPage:(int64_t)a3 ofPage:(int64_t)a4
{
  if (a3 == -2)
  {
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v21 = [v5 localizedStringForKey:@"Preparing…" value:@"Preparing…" table:@"Localizable"];
LABEL_16:

    goto LABEL_17;
  }
  if (a3 != -1)
  {
    int64_t v7 = a4 - 1;
    if (a4 - 1 >= a3) {
      int64_t v7 = a3;
    }
    if (a4 <= 0) {
      int64_t v7 = a3;
    }
    BOOL v8 = (void *)MEMORY[0x1E4F28EE0];
    BOOL v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7 + 1];
    double v5 = [v8 localizedStringFromNumber:v9 numberStyle:0];

    if (a4 < 1)
    {
      v17 = NSString;
      objc_super v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v12 localizedStringForKey:@"Preparing page %@…" value:@"Preparing page %@…" table:@"Localizable"];
      objc_msgSend(v17, "stringWithFormat:", v14, v5);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x1E4F28EE0];
      id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
      objc_super v12 = [v10 localizedStringFromNumber:v11 numberStyle:0];

      v13 = NSString;
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"Preparing page %@ of %@…" value:@"Preparing page %@ of %@…" table:@"Localizable"];
      objc_msgSend(v13, "stringWithFormat:", v15, v5, v12);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if (self->_creatingPDF)
  {
    v21 = &stru_1F3C9D3F8;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v21 = [v16 localizedStringForKey:@"Sending to Printer…" value:@"Sending to Printer…" table:@"Localizable"];
  }
  self->_BOOL donePrinting = 1;
LABEL_17:
  if (self->_donePrinting && [(id)*MEMORY[0x1E4FB2608] applicationState])
  {
    [(UIPrintingProgress *)self endProgress];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v19 = v18;
    [(UIPrintingProgress *)self lastPageUpdate];
    if (v19 > v20 + 2.0)
    {
      [(UIPrintingProgress *)self showProgress:v21 immediately:0];
      [(UIPrintingProgress *)self setLastPageUpdate:v19];
    }
  }
}

- (double)nextPrintDelay
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom])
  {
  }
  else
  {
    BOOL forceDisplayAsAlert = self->_forceDisplayAsAlert;

    if (!forceDisplayAsAlert)
    {
      double v6 = 0.0;
      goto LABEL_9;
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = 0.0;
  if (!self->_presentingAlert)
  {
    double v7 = v5;
    double startTime = self->_startTime;
    [(UIPrintingProgress *)self progressAlertDelay];
    if (v7 >= startTime + v9 && ![(id)*MEMORY[0x1E4FB2608] applicationState])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_double displayTime = v10;
      [(UIPrintingProgress *)self _presentProgressAlert];
      double v6 = 0.5;
    }
  }
LABEL_9:
  viewController = self->_viewController;
  if (viewController)
  {
    [(UIPrintingProgressViewController *)viewController rotationDelay];
    if (v12 > 0.0)
    {
      [(UIPrintingProgressViewController *)self->_viewController rotationDelay];
      double v14 = v13 + 0.1;
      if (v6 < v14) {
        return v14;
      }
    }
  }
  return v6;
}

- (BOOL)creatingPDF
{
  return self->_creatingPDF;
}

- (void)setCreatingPDF:(BOOL)a3
{
  self->_creatingPDF = a3;
}

- (double)lastPageUpdate
{
  return self->_lastPageUpdate;
}

- (void)setLastPageUpdate:(double)a3
{
  self->_lastPageUpdate = a3;
}

- (double)progressAlertDelay
{
  return self->_progressAlertDelay;
}

- (void)setProgressAlertDelay:(double)a3
{
  self->_progressAlertDelay = a3;
}

- (UIWindowScene)hostingWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingWindowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)setHostingWindowScene:(id)a3
{
}

- (UIWindow)progressAlertWindow
{
  return (UIWindow *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProgressAlertWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressAlertWindow, 0);
  objc_destroyWeak((id *)&self->_hostingWindowScene);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_printerName, 0);
}

@end