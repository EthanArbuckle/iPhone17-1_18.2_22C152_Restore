@interface ProgressController
+ (id)sharedProgressController;
- (void)_hideSpinner;
- (void)_setHideSpinnerTimer:(id)a3;
- (void)_showSpinner;
- (void)setLoadingData:(BOOL)a3;
- (void)suspend;
@end

@implementation ProgressController

+ (id)sharedProgressController
{
  v2 = (void *)sharedProgressController_sharedProgressController;
  if (!sharedProgressController_sharedProgressController)
  {
    v3 = objc_alloc_init(ProgressController);
    v4 = (void *)sharedProgressController_sharedProgressController;
    sharedProgressController_sharedProgressController = (uint64_t)v3;

    v2 = (void *)sharedProgressController_sharedProgressController;
  }
  return v2;
}

- (void)_setHideSpinnerTimer:(id)a3
{
  v5 = (NSTimer *)a3;
  hideSpinnerTimer = self->_hideSpinnerTimer;
  p_hideSpinnerTimer = &self->_hideSpinnerTimer;
  v6 = hideSpinnerTimer;
  if (hideSpinnerTimer != v5)
  {
    v9 = v5;
    [(NSTimer *)v6 invalidate];
    objc_storeStrong((id *)p_hideSpinnerTimer, a3);
    v5 = v9;
  }
  MEMORY[0x270F9A758](v6, v5);
}

- (void)_hideSpinner
{
  [(ProgressController *)self _setHideSpinnerTimer:0];
  v2 = (void *)*MEMORY[0x263F1D020];
  [v2 setStatusBarShowsProgress:0];
}

- (void)_showSpinner
{
  [(ProgressController *)self _setHideSpinnerTimer:0];
  v2 = (void *)*MEMORY[0x263F1D020];
  [v2 setStatusBarShowsProgress:1];
}

- (void)setLoadingData:(BOOL)a3
{
  BOOL v3 = a3;
  p_int loadingCount = &self->_loadingCount;
  int loadingCount = self->_loadingCount;
  if (a3) {
    int v7 = loadingCount + 1;
  }
  else {
    int v7 = loadingCount - 1;
  }
  *p_int loadingCount = v7;
  v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ProgressController *)v3 setLoadingData:v8];
  }

  int v9 = *p_loadingCount;
  if (v3)
  {
    if (v9 >= 1)
    {
      if (!self->_progressShowing) {
        [(ProgressController *)self _showSpinner];
      }
      self->_progressShowing = 1;
    }
  }
  else if (!v9)
  {
    if (self->_progressShowing)
    {
      v10 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__hideSpinner selector:0 userInfo:0 repeats:0.1];
      [(ProgressController *)self _setHideSpinnerTimer:v10];
    }
    self->_progressShowing = 0;
  }
}

- (void)suspend
{
  if (self->_progressShowing) {
    [(ProgressController *)self _hideSpinner];
  }
}

- (void).cxx_destruct
{
}

- (void)setLoadingData:(os_log_t)log .cold.1(char a1, int *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = @"NO";
  int v4 = *a2;
  if (a1) {
    BOOL v3 = @"YES";
  }
  int v5 = 138412546;
  v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl(&dword_226D1D000, log, OS_LOG_TYPE_DEBUG, "loading %@, count = %d", (uint8_t *)&v5, 0x12u);
}

@end