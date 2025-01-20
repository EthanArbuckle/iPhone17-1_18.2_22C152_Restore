@interface SBTransientOverlayBlockTransitionCoordinator
- (id)finalizeTransitionHandler;
- (id)startTransitionHandler;
- (void)finalizeTransitionWithContextProvider:(id)a3;
- (void)setFinalizeTransitionHandler:(id)a3;
- (void)setStartTransitionHandler:(id)a3;
- (void)startTransitionWithContextProvider:(id)a3;
@end

@implementation SBTransientOverlayBlockTransitionCoordinator

- (void)startTransitionWithContextProvider:(id)a3
{
  id v5 = a3;
  startTransitionHandler = (void (**)(void))self->_startTransitionHandler;
  id v9 = v5;
  if (!startTransitionHandler)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBTransientOverlayBlockTransitionCoordinator.m" lineNumber:16 description:@"startTransitionHandler must be non-null when the transition starts."];

    startTransitionHandler = (void (**)(void))self->_startTransitionHandler;
  }
  startTransitionHandler[2]();
  id v7 = self->_startTransitionHandler;
  self->_startTransitionHandler = 0;
}

- (void)finalizeTransitionWithContextProvider:(id)a3
{
  finalizeTransitionHandler = (void (**)(id, id))self->_finalizeTransitionHandler;
  if (finalizeTransitionHandler)
  {
    finalizeTransitionHandler[2](finalizeTransitionHandler, a3);
    id v5 = self->_finalizeTransitionHandler;
    self->_finalizeTransitionHandler = 0;
  }
}

- (id)startTransitionHandler
{
  return self->_startTransitionHandler;
}

- (void)setStartTransitionHandler:(id)a3
{
}

- (id)finalizeTransitionHandler
{
  return self->_finalizeTransitionHandler;
}

- (void)setFinalizeTransitionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalizeTransitionHandler, 0);
  objc_storeStrong(&self->_startTransitionHandler, 0);
}

@end