@interface _SBContinuitySessionManagerExternalDependencyProvider
- (_SBContinuitySessionManagerExternalDependencyProvider)init;
- (void)_setResourceHintActive:(BOOL)a3;
- (void)_setRestrictionsActive:(BOOL)a3;
- (void)noteContinuitySessionEnded;
- (void)noteContinuitySessionIsActive;
- (void)noteContinuitySessionNegotiationStarted;
@end

@implementation _SBContinuitySessionManagerExternalDependencyProvider

- (_SBContinuitySessionManagerExternalDependencyProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)_SBContinuitySessionManagerExternalDependencyProvider;
  v2 = [(_SBContinuitySessionManagerExternalDependencyProvider *)&v11 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    resourceHintQueue = v2->_resourceHintQueue;
    v2->_resourceHintQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = BSDispatchQueueCreateSerial();
    restrictionsQueue = v2->_restrictionsQueue;
    v2->_restrictionsQueue = (OS_dispatch_queue *)v5;

    IOPMUpdateOnenessState();
    [(_SBContinuitySessionManagerExternalDependencyProvider *)v2 _setRestrictionsActive:0];
    v7 = v2->_resourceHintQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___SBContinuitySessionManagerExternalDependencyProvider_init__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    v10 = v2;
    dispatch_async(v7, block);
  }
  return v2;
}

- (void)noteContinuitySessionNegotiationStarted
{
  IOPMUpdateOnenessState();
  [(_SBContinuitySessionManagerExternalDependencyProvider *)self _setResourceHintActive:1];
}

- (void)noteContinuitySessionIsActive
{
}

- (void)noteContinuitySessionEnded
{
  IOPMUpdateOnenessState();
  [(_SBContinuitySessionManagerExternalDependencyProvider *)self _setResourceHintActive:0];
  [(_SBContinuitySessionManagerExternalDependencyProvider *)self _setRestrictionsActive:0];
}

- (void)_setResourceHintActive:(BOOL)a3
{
  resourceHintQueue = self->_resourceHintQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80___SBContinuitySessionManagerExternalDependencyProvider__setResourceHintActive___block_invoke;
  v4[3] = &unk_1E6AF5D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(resourceHintQueue, v4);
}

- (void)_setRestrictionsActive:(BOOL)a3
{
  restrictionsQueue = self->_restrictionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v5 = a3;
  dispatch_async(restrictionsQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceHintQueue_resourceHint, 0);
  objc_storeStrong((id *)&self->_restrictionsQueue, 0);
  objc_storeStrong((id *)&self->_resourceHintQueue, 0);
}

@end