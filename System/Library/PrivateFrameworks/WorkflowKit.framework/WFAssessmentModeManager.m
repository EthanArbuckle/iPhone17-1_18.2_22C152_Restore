@interface WFAssessmentModeManager
+ (BOOL)isAssessmentModeSupportedOnCurrentDevice;
- (AEAssessmentModeGestalt)assessmentGestalt;
- (BOOL)isInAssessmentMode;
- (BOOL)isObserving;
- (OS_dispatch_queue)queue;
- (WFAssessmentModeManager)initWithQueue:(id)a3 delegate:(id)a4;
- (WFAssessmentModeManagerDelegate)delegate;
- (os_unfair_lock_s)isObservingLock;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)startObservingForAssesmentModeChangesIfNeeded;
@end

@implementation WFAssessmentModeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assessmentGestalt, 0);
}

- (os_unfair_lock_s)isObservingLock
{
  return self->_isObservingLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (WFAssessmentModeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAssessmentModeManagerDelegate *)WeakRetained;
}

- (AEAssessmentModeGestalt)assessmentGestalt
{
  return self->_assessmentGestalt;
}

- (void)setIsObserving:(BOOL)a3
{
  p_isObservingLock = &self->_isObservingLock;
  os_unfair_lock_lock(&self->_isObservingLock);
  self->_isObserving = a3;
  os_unfair_lock_unlock(p_isObservingLock);
}

- (BOOL)isObserving
{
  v2 = self;
  p_isObservingLock = &self->_isObservingLock;
  os_unfair_lock_lock(&self->_isObservingLock);
  LOBYTE(v2) = v2->_isObserving;
  os_unfair_lock_unlock(p_isObservingLock);
  return (char)v2;
}

- (void)dealloc
{
  if ([(WFAssessmentModeManager *)self isObserving])
  {
    v3 = [(WFAssessmentModeManager *)self assessmentGestalt];
    [v3 removeObserver:self forKeyPath:@"active" context:WFAssessmentModeActiveContext];
  }
  v4.receiver = self;
  v4.super_class = (Class)WFAssessmentModeManager;
  [(WFAssessmentModeManager *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(WFAssessmentModeManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WFAssessmentModeManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6557368;
  id v20 = v12;
  v21 = a6;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __74__WFAssessmentModeManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  if (v2 == WFAssessmentModeActiveContext)
  {
    if ([v3 isInAssessmentMode])
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 assessmentModeManagerDidBecomeActive:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v8.receiver = v3;
    v8.super_class = (Class)WFAssessmentModeManager;
    objc_msgSendSuper2(&v8, sel_observeValueForKeyPath_ofObject_change_context_, v4, v5, v6);
  }
}

- (void)startObservingForAssesmentModeChangesIfNeeded
{
  if (![(WFAssessmentModeManager *)self isObserving])
  {
    v3 = [(WFAssessmentModeManager *)self assessmentGestalt];
    [v3 addObserver:self forKeyPath:@"active" options:0 context:WFAssessmentModeActiveContext];

    [(WFAssessmentModeManager *)self setIsObserving:1];
  }
}

- (BOOL)isInAssessmentMode
{
  uint64_t v2 = [(WFAssessmentModeManager *)self assessmentGestalt];
  char v3 = [v2 isActive];

  return v3;
}

- (WFAssessmentModeManager)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAssessmentModeManager;
  v9 = [(WFAssessmentModeManager *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F47080]) initWithQueue:v7];
    assessmentGestalt = v10->_assessmentGestalt;
    v10->_assessmentGestalt = (AEAssessmentModeGestalt *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_isObservingLock._os_unfair_lock_opaque = 0;
    v13 = v10;
  }

  return v10;
}

+ (BOOL)isAssessmentModeSupportedOnCurrentDevice
{
  uint64_t v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  BOOL v3 = [v2 idiom] == 1 || objc_msgSend(v2, "idiom") == 2;

  return v3;
}

@end