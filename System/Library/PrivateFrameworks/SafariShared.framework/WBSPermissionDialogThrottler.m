@interface WBSPermissionDialogThrottler
- (BOOL)_canShowPermissionDialog;
- (WBSPermissionDialogThrottler)init;
- (void)_callNextPresentationHandlerIfNeeded;
- (void)didCompletePermissionDialog:(BOOL)a3;
- (void)invalidate;
- (void)requestPermissionDialogPresentation:(id)a3;
- (void)willPerformUserInitiatedNavigation;
@end

@implementation WBSPermissionDialogThrottler

- (WBSPermissionDialogThrottler)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSPermissionDialogThrottler;
  v2 = [(WBSPermissionDialogThrottler *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestedPresentations = v2->_requestedPresentations;
    v2->_requestedPresentations = v3;

    v5 = v2;
  }

  return v2;
}

- (void)requestPermissionDialogPresentation:(id)a3
{
  requestedPresentations = self->_requestedPresentations;
  v5 = (void *)MEMORY[0x1AD0C4F80](a3, a2);
  [(NSMutableArray *)requestedPresentations addObject:v5];

  [(WBSPermissionDialogThrottler *)self _callNextPresentationHandlerIfNeeded];
}

- (void)didCompletePermissionDialog:(BOOL)a3
{
  self->_isShowingDialog = 0;
  if (a3) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = self->_denyCount + 1;
  }
  self->_denyCount = v3;
  [(WBSPermissionDialogThrottler *)self _callNextPresentationHandlerIfNeeded];
}

- (void)willPerformUserInitiatedNavigation
{
  self->_denyCount = 0;
}

- (void)invalidate
{
  self->_invalidated = 1;
  [(WBSPermissionDialogThrottler *)self _callNextPresentationHandlerIfNeeded];
}

- (void)_callNextPresentationHandlerIfNeeded
{
  if (!self->_callingPresentationHandler && [(NSMutableArray *)self->_requestedPresentations count])
  {
    do
    {
      if (self->_isShowingDialog && !self->_invalidated) {
        break;
      }
      uint64_t v3 = [(NSMutableArray *)self->_requestedPresentations firstObject];
      if (!v3) {
        break;
      }
      v4 = (void (**)(void))v3;
      [(NSMutableArray *)self->_requestedPresentations removeObjectAtIndex:0];
      BOOL v5 = !self->_invalidated
        && [(WBSPermissionDialogThrottler *)self _canShowPermissionDialog];
      char v6 = self->_isShowingDialog || v5;
      self->_isShowingDialog = v6;
      self->_callingPresentationHandler = 1;
      v4[2](v4);
      self->_callingPresentationHandler = 0;
    }
    while ([(NSMutableArray *)self->_requestedPresentations count]);
  }
}

- (BOOL)_canShowPermissionDialog
{
  return !self->_invalidated && self->_denyCount < 3;
}

- (void).cxx_destruct
{
}

@end