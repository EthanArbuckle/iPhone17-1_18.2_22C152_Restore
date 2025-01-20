@interface PXProgressIndicatorAlertController
+ (id)beginShowingModalProgressWithConfiguration:(id)a3;
- (BOOL)isInternalUIAllowed;
- (NSString)label;
- (NSString)title;
- (PXProgressIndicatorAlertController)init;
- (double)delay;
- (double)minimumDisplayDuration;
- (void)_dismissAlert:(id)a3;
- (void)_presentAlert;
- (void)_startShowingProgress;
- (void)dealloc;
- (void)setDelay:(double)a3;
- (void)setIsInternalUIAllowed:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMinimumDisplayDuration:(double)a3;
- (void)setTitle:(id)a3;
- (void)stopShowing;
- (void)stopShowing:(id)a3;
@end

@implementation PXProgressIndicatorAlertController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_alertPresentedDate, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setIsInternalUIAllowed:(BOOL)a3
{
  self->_isInternalUIAllowed = a3;
}

- (BOOL)isInternalUIAllowed
{
  return self->_isInternalUIAllowed;
}

- (void)setMinimumDisplayDuration:(double)a3
{
  self->_minimumDisplayDuration = a3;
}

- (double)minimumDisplayDuration
{
  return self->_minimumDisplayDuration;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)_dismissAlert:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _Dismiss(self->_alertController, self->_window, a3);
  alertController = self->_alertController;
  self->_alertController = 0;

  window = self->_window;
  self->_window = 0;

  PLUIGetLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      int v9 = 134217984;
      v10 = self;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXProgressIndicatorAlertControllerShowing", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_presentAlert
{
  if (!self->_isCanceled)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    alertPresentedDate = self->_alertPresentedDate;
    self->_alertPresentedDate = v3;

    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    [v5 setAutoresizingMask:18];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [v21 view];
    objc_msgSend(v14, "setBounds:", v7, v9, v11, v13);

    v15 = [v21 view];
    [v15 addSubview:v5];

    [v5 startAnimating];
    v16 = (void *)MEMORY[0x1E4FB1418];
    v17 = [(PXProgressIndicatorAlertController *)self title];
    v18 = [v16 alertControllerWithTitle:v17 message:0 preferredStyle:1];
    alertController = self->_alertController;
    self->_alertController = v18;

    [(UIAlertController *)self->_alertController setContentViewController:v21];
    v20 = [(UIWindow *)self->_window rootViewController];
    objc_msgSend(v20, "px_presentOverTopmostPresentedViewController:animated:completion:", self->_alertController, 1, 0);
  }
}

- (void)_startShowingProgress
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v4 = [v3 windows];
  v5 = [v4 firstObject];
  window = self->_window;
  self->_window = v5;

  [(UIWindow *)self->_window setUserInteractionEnabled:0];
  [(PXProgressIndicatorAlertController *)self delay];
  double v8 = v7;
  PLUIGetLog();
  double v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 134218240;
      v16 = self;
      __int16 v17 = 2048;
      double v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXProgressIndicatorAlertControllerShowing", "Context=%{signpost.telemetry:string2}lu delay:%.2f", buf, 0x16u);
    }
  }

  if (v8 <= 0.0)
  {
    [(PXProgressIndicatorAlertController *)self _presentAlert];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PXProgressIndicatorAlertController__startShowingProgress__block_invoke;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __59__PXProgressIndicatorAlertController__startShowingProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentAlert];
}

- (void)dealloc
{
  v3 = self->_alertController;
  v4 = self->_window;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __45__PXProgressIndicatorAlertController_dealloc__block_invoke;
  os_signpost_id_t v10 = &unk_1E5DD32A8;
  os_signpost_id_t v11 = v3;
  dispatch_time_t v12 = v4;
  v5 = v4;
  double v6 = v3;
  px_dispatch_on_main_queue();
}

void __45__PXProgressIndicatorAlertController_dealloc__block_invoke(uint64_t a1)
{
}

- (void)stopShowing:(id)a3
{
  id v4 = a3;
  if (!self->_isCanceled)
  {
    self->_isCanceled = 1;
    v4;
    px_dispatch_on_main_queue();
  }
}

void __50__PXProgressIndicatorAlertController_stopShowing___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 16)];
    double v5 = v4;

    if (v5 > 0.0 && v5 < 0.8)
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)((0.8 - v5) * 1000000000.0));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__PXProgressIndicatorAlertController_stopShowing___block_invoke_2;
      v9[3] = &unk_1E5DD3280;
      uint64_t v7 = *(void **)(a1 + 40);
      v9[4] = *(void *)(a1 + 32);
      id v10 = v7;
      dispatch_after(v6, MEMORY[0x1E4F14428], v9);

      return;
    }
    v2 = *(void **)(a1 + 32);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  [v2 _dismissAlert:v8];
}

uint64_t __50__PXProgressIndicatorAlertController_stopShowing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAlert:*(void *)(a1 + 40)];
}

- (void)stopShowing
{
}

- (PXProgressIndicatorAlertController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXProgressIndicatorAlertController;
  result = [(PXProgressIndicatorAlertController *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_delay = xmmword_1AB35A1C0;
  }
  return result;
}

+ (id)beginShowingModalProgressWithConfiguration:(id)a3
{
  objc_super v3 = (void (**)(id, PXProgressIndicatorAlertController *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v4 = objc_alloc_init(PXProgressIndicatorAlertController);
  if (v3) {
    v3[2](v3, v4);
  }
  [(PXProgressIndicatorAlertController *)v4 _startShowingProgress];

  return v4;
}

@end