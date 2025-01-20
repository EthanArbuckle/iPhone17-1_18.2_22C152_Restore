@interface ICLongRunningTaskController
+ (void)setMainWindow:(id)a3;
- (BOOL)allowSingleUnitProgress;
- (BOOL)isCancelled;
- (BOOL)isIndeterminate;
- (BOOL)progressViewControllerDidFinishPresenting;
- (BOOL)shouldDismissProgressViewController;
- (BOOL)shouldShowCancelButton;
- (BOOL)shouldShowCircularProgress;
- (ICLongRunningTaskController)init;
- (ICLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4;
- (ICProgressViewController)progressViewController;
- (NSDate)lastAccessibilityAnnouncementDate;
- (NSDate)openProgressDate;
- (NSProgress)progress;
- (NSString)customCancelButtonTitle;
- (NSString)progressString;
- (UIViewController)viewControllerToPresentFrom;
- (UIWindow)window;
- (double)intervalBeforeOpeningProgressDialog;
- (id)completionBlock;
- (id)keepAlive;
- (id)progressStringBlock;
- (id)updateProgressUIBlock;
- (void)closeProgressDialog;
- (void)completeTaskIfNecessary;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openProgressDialog;
- (void)setAllowSingleUnitProgress:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCustomCancelButtonTitle:(id)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setIntervalBeforeOpeningProgressDialog:(double)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setKeepAlive:(id)a3;
- (void)setLastAccessibilityAnnouncementDate:(id)a3;
- (void)setOpenProgressDate:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressString:(id)a3;
- (void)setProgressStringBlock:(id)a3;
- (void)setProgressViewController:(id)a3;
- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3;
- (void)setShouldDismissProgressViewController:(BOOL)a3;
- (void)setShouldShowCancelButton:(BOOL)a3;
- (void)setShouldShowCircularProgress:(BOOL)a3;
- (void)setUpdateProgressUIBlock:(id)a3;
- (void)setViewControllerToPresentFrom:(id)a3;
- (void)setWindow:(id)a3;
- (void)startTask:(id)a3 completionBlock:(id)a4;
- (void)updateProgress;
- (void)willDismissProgressViewController:(id)a3;
@end

@implementation ICLongRunningTaskController

+ (void)setMainWindow:(id)a3
{
}

- (ICLongRunningTaskController)init
{
  return [(ICLongRunningTaskController *)self initWithWindow:sMainWindow intervalBeforeOpeningProgressDialog:1.0];
}

- (ICLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLongRunningTaskController;
  v7 = [(ICLongRunningTaskController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ICLongRunningTaskController *)v7 setIntervalBeforeOpeningProgressDialog:a4];
    [(ICLongRunningTaskController *)v8 setWindow:v6];
  }

  return v8;
}

- (void)startTask:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICLongRunningTaskController *)self setKeepAlive:self];
  [(ICLongRunningTaskController *)self setCompletionBlock:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:0 userInfo:0];
  [(ICLongRunningTaskController *)self setProgress:v8];

  v9 = [(ICLongRunningTaskController *)self progress];
  objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, @"fractionCompleted", &compoundliteral_0);

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke;
  block[3] = &unk_1E5FDB0C8;
  id v12 = v6;
  id v21 = v12;
  block[4] = self;
  v13 = v10;
  v20 = v13;
  dispatch_async(v11, block);

  [(ICLongRunningTaskController *)self intervalBeforeOpeningProgressDialog];
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  if (dispatch_semaphore_wait(v13, v15))
  {
    v16 = [(ICLongRunningTaskController *)self progress];
    if ([v16 totalUnitCount] == 1)
    {
      BOOL v17 = [(ICLongRunningTaskController *)self allowSingleUnitProgress];

      if (!v17) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v18 = [MEMORY[0x1E4F1C9C8] date];
    [(ICLongRunningTaskController *)self setOpenProgressDate:v18];

    [(ICLongRunningTaskController *)self openProgressDialog];
  }
LABEL_7:
}

void __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) progress];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke_2;
  block[3] = &unk_1E5FD8DF0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTaskIfNecessary];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICLongRunningTaskController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Utilities/ICLongRunningTaskController.m"])
  {
    char v13 = [(ICLongRunningTaskController *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_0 && (v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__ICLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5FD8DF0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICLongRunningTaskController;
    [(ICLongRunningTaskController *)&v15 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

uint64_t __78__ICLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgress];
}

- (void)completeTaskIfNecessary
{
  v3 = [(ICLongRunningTaskController *)self progress];

  if (v3)
  {
    v4 = [(ICLongRunningTaskController *)self openProgressDate];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F1C9C8] date];
      id v6 = [(ICLongRunningTaskController *)self openProgressDate];
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;

      if (v8 < 0.5) {
        [MEMORY[0x1E4F29060] sleepForTimeInterval:0.5 - v8];
      }
      [(ICLongRunningTaskController *)self closeProgressDialog];
      [(ICLongRunningTaskController *)self setOpenProgressDate:0];
    }
    else
    {
      id v11 = [(ICLongRunningTaskController *)self completionBlock];

      if (v11)
      {
        id v12 = [(ICLongRunningTaskController *)self completionBlock];
        char v13 = [(ICLongRunningTaskController *)self progress];
        ((void (**)(void, void *))v12)[2](v12, v13);

        [(ICLongRunningTaskController *)self setCompletionBlock:0];
      }
    }
    double v14 = [(ICLongRunningTaskController *)self progress];
    objc_msgSend(v14, "ic_removeObserver:forKeyPath:context:", self, @"fractionCompleted", &compoundliteral_0);

    [(ICLongRunningTaskController *)self setProgress:0];
  }
  else
  {
    v9 = [(ICLongRunningTaskController *)self completionBlock];

    if (v9)
    {
      id v10 = [(ICLongRunningTaskController *)self completionBlock];
      v10[2](v10, 0);

      [(ICLongRunningTaskController *)self setCompletionBlock:0];
    }
  }
  [(ICLongRunningTaskController *)self setKeepAlive:0];
}

- (void)updateProgress
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Progress format string not set", v1, 2u);
}

- (void)openProgressDialog
{
  v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  v4 = [[ICProgressViewController alloc] initWithDelegate:self];
  [(ICLongRunningTaskController *)self setProgressViewController:v4];
  if ([(ICLongRunningTaskController *)self shouldShowCircularProgress])
  {
    v5 = [(ICLongRunningTaskController *)self progressViewController];
    id v6 = (id)[v5 view];

    double v7 = [(ICLongRunningTaskController *)self progress];
    double v8 = [(ICLongRunningTaskController *)self progressViewController];
    [v8 setObservedProgress:v7];
  }
  if ([(ICLongRunningTaskController *)self shouldShowCancelButton])
  {
    objc_initWeak(&location, self);
    v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
    id v10 = [(ICLongRunningTaskController *)self customCancelButtonTitle];

    if (v10)
    {
      uint64_t v11 = [(ICLongRunningTaskController *)self customCancelButtonTitle];

      v9 = (void *)v11;
    }
    id v12 = (void *)MEMORY[0x1E4FB1410];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke;
    v25[3] = &unk_1E5FDB0F0;
    objc_copyWeak(&v26, &location);
    char v13 = [v12 actionWithTitle:v9 style:1 handler:v25];
    [v3 addAction:v13];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_2;
  v23[3] = &unk_1E5FDB118;
  double v14 = v4;
  v24 = v14;
  [(ICLongRunningTaskController *)self setUpdateProgressUIBlock:v23];
  objc_super v15 = [(ICLongRunningTaskController *)self progressViewController];
  [v3 setContentViewController:v15];

  v16 = [(ICLongRunningTaskController *)self progressViewController];
  id v17 = (id)[v16 view];

  [(ICLongRunningTaskController *)self updateProgress];
  [(ICLongRunningTaskController *)self setProgressViewControllerDidFinishPresenting:0];
  [(ICLongRunningTaskController *)self setShouldDismissProgressViewController:0];
  v18 = [(ICLongRunningTaskController *)self viewControllerToPresentFrom];
  if (!v18)
  {
    v19 = [(ICLongRunningTaskController *)self window];
    v18 = [v19 rootViewController];

    if (!v18) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"viewControllerToPresentFrom" functionName:"-[ICLongRunningTaskController openProgressDialog]" simulateCrash:1 showAlert:0 format:@"No view controller to present progress UI from."];
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_3;
  v21[3] = &unk_1E5FD91D0;
  v21[4] = self;
  id v22 = v18;
  id v20 = v18;
  [v20 presentViewController:v3 animated:1 completion:v21];
}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsCancelled:1];

  id v3 = objc_loadWeakRetained(v1);
  v4 = [v3 progress];
  [v4 cancel];

  id v5 = objc_loadWeakRetained(v1);
  [v5 closeProgressDialog];
}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 label];
  [v4 setText:v3];
}

uint64_t __49__ICLongRunningTaskController_openProgressDialog__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressViewControllerDidFinishPresenting:1];
  uint64_t result = [*(id *)(a1 + 32) shouldDismissProgressViewController];
  if (result)
  {
    [*(id *)(a1 + 32) setShouldDismissProgressViewController:0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_4;
    v4[3] = &unk_1E5FD8DF0;
    id v3 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    return [v3 dismissViewControllerAnimated:1 completion:v4];
  }
  return result;
}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionBlock];
    id v4 = [*(id *)(a1 + 32) progress];
    ((void (**)(void, void *))v3)[2](v3, v4);

    id v5 = *(void **)(a1 + 32);
    [v5 setCompletionBlock:0];
  }
}

- (void)closeProgressDialog
{
  id v3 = [(ICLongRunningTaskController *)self progressViewController];

  if (v3)
  {
    id v4 = [(ICLongRunningTaskController *)self progressViewController];
    [v4 setProgressDelegate:0];

    id v5 = [(ICLongRunningTaskController *)self progressViewController];
    id v6 = [v5 presentingViewController];

    [(ICLongRunningTaskController *)self setProgressViewController:0];
    double v7 = [(ICLongRunningTaskController *)self viewControllerToPresentFrom];
    double v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v10 = [(ICLongRunningTaskController *)self window];
      id v9 = [v10 rootViewController];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__ICLongRunningTaskController_closeProgressDialog__block_invoke;
    aBlock[3] = &unk_1E5FD8DF0;
    aBlock[4] = self;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = v11;
    if (v9)
    {
      if (v6) {
        [v6 dismissViewControllerAnimated:1 completion:v11];
      }
      else {
        [(ICLongRunningTaskController *)self setShouldDismissProgressViewController:1];
      }
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
  }
}

void __50__ICLongRunningTaskController_closeProgressDialog__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionBlock];
    id v4 = [*(id *)(a1 + 32) progress];
    ((void (**)(void, void *))v3)[2](v3, v4);

    id v5 = *(void **)(a1 + 32);
    [v5 setCompletionBlock:0];
  }
}

- (void)willDismissProgressViewController:(id)a3
{
  id v3 = [(ICLongRunningTaskController *)self progress];
  [v3 cancel];
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

- (NSString)customCancelButtonTitle
{
  return self->_customCancelButtonTitle;
}

- (void)setCustomCancelButtonTitle:(id)a3
{
}

- (NSString)progressString
{
  return self->_progressString;
}

- (void)setProgressString:(id)a3
{
}

- (id)progressStringBlock
{
  return self->_progressStringBlock;
}

- (void)setProgressStringBlock:(id)a3
{
}

- (UIViewController)viewControllerToPresentFrom
{
  return self->_viewControllerToPresentFrom;
}

- (void)setViewControllerToPresentFrom:(id)a3
{
}

- (BOOL)shouldShowCircularProgress
{
  return self->_shouldShowCircularProgress;
}

- (void)setShouldShowCircularProgress:(BOOL)a3
{
  self->_shouldShowCircularProgress = a3;
}

- (BOOL)allowSingleUnitProgress
{
  return self->_allowSingleUnitProgress;
}

- (void)setAllowSingleUnitProgress:(BOOL)a3
{
  self->_allowSingleUnitProgress = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (double)intervalBeforeOpeningProgressDialog
{
  return self->_intervalBeforeOpeningProgressDialog;
}

- (void)setIntervalBeforeOpeningProgressDialog:(double)a3
{
  self->_intervalBeforeOpeningProgressDialog = a3;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)updateProgressUIBlock
{
  return self->_updateProgressUIBlock;
}

- (void)setUpdateProgressUIBlock:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
}

- (NSDate)openProgressDate
{
  return self->_openProgressDate;
}

- (void)setOpenProgressDate:(id)a3
{
}

- (ICProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
}

- (BOOL)progressViewControllerDidFinishPresenting
{
  return self->_progressViewControllerDidFinishPresenting;
}

- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3
{
  self->_progressViewControllerDidFinishPresenting = a3;
}

- (BOOL)shouldDismissProgressViewController
{
  return self->_shouldDismissProgressViewController;
}

- (void)setShouldDismissProgressViewController:(BOOL)a3
{
  self->_shouldDismissProgressViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_openProgressDate, 0);
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_updateProgressUIBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, 0);
  objc_storeStrong(&self->_progressStringBlock, 0);
  objc_storeStrong((id *)&self->_progressString, 0);
  objc_storeStrong((id *)&self->_customCancelButtonTitle, 0);
}

@end