@interface SBCaptureButtonRestrictionCoordinator
- (BOOL)isCaptureButtonActionInhibited:(id *)a3;
- (SBCaptureButtonRestrictionCoordinator)init;
- (id)addObserver:(id)a3;
- (id)inhibitCaptureButtonActionAssertionWithReason:(id)a3;
- (void)_notifyObserversCaptureButtonInhibitionDidChange;
@end

@implementation SBCaptureButtonRestrictionCoordinator

- (SBCaptureButtonRestrictionCoordinator)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBCaptureButtonRestrictionCoordinator;
  v2 = [(SBCaptureButtonRestrictionCoordinator *)&v12 init];
  if (v2)
  {
    v3 = [[SBCaptureButtonRestrictionServer alloc] initWithDelegate:v2];
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = v3;

    v5 = [[SBCaptureButtonSOSRestriction alloc] initWithCoordinator:v2];
    restrictionForSOS = v2->_restrictionForSOS;
    v2->_restrictionForSOS = v5;

    v7 = [[SBCaptureButtonMCProfileRestriction alloc] initWithCoordinator:v2];
    restrictionForMCProfile = v2->_restrictionForMCProfile;
    v2->_restrictionForMCProfile = v7;

    v9 = [[SBCaptureButtonDisabledUserDefaultRestriction alloc] initWithCoordinator:v2];
    restrictionForUserDefault = v2->_restrictionForUserDefault;
    v2->_restrictionForUserDefault = v9;
  }
  return v2;
}

- (id)inhibitCaptureButtonActionAssertionWithReason:(id)a3
{
  id v4 = a3;
  inhibitedAssertion = self->_inhibitedAssertion;
  if (!inhibitedAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __87__SBCaptureButtonRestrictionCoordinator_inhibitCaptureButtonActionAssertionWithReason___block_invoke;
    v16 = &unk_1E6AF92D8;
    objc_copyWeak(&v17, &location);
    v7 = [v6 assertionWithIdentifier:@"CaptureButtonRestrictions" stateDidChangeHandler:&v13];
    v8 = self->_inhibitedAssertion;
    self->_inhibitedAssertion = v7;

    v9 = self->_inhibitedAssertion;
    v10 = SBLogCameraCaptureRestriction();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    inhibitedAssertion = self->_inhibitedAssertion;
  }
  v11 = [(BSCompoundAssertion *)inhibitedAssertion acquireForReason:v4];

  return v11;
}

void __87__SBCaptureButtonRestrictionCoordinator_inhibitCaptureButtonActionAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversCaptureButtonInhibitionDidChange];
}

- (BOOL)isCaptureButtonActionInhibited:(id *)a3
{
  int v5 = [(BSCompoundAssertion *)self->_inhibitedAssertion isActive];
  BOOL v6 = v5;
  if (a3 && v5)
  {
    v7 = [(BSCompoundAssertion *)self->_inhibitedAssertion orderedReasons];
    v8 = [v7 array];
    *a3 = [v8 componentsJoinedByString:@","];
  }
  return v6;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    BOOL v6 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"CaptureButtonInhibitionObservers"];
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  v8 = [(id)objc_opt_class() description];
  v9 = [(BSCompoundAssertion *)observers acquireForReason:v8 withContext:v4];

  return v9;
}

- (void)_notifyObserversCaptureButtonInhibitionDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBCaptureButtonRestrictionCoordinator *)self isCaptureButtonActionInhibited:0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(BSCompoundAssertion *)self->_observers orderedContext];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) captureButtonRestrictionChangedTo:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionForUserDefault, 0);
  objc_storeStrong((id *)&self->_restrictionForMCProfile, 0);
  objc_storeStrong((id *)&self->_restrictionForSOS, 0);
  objc_storeStrong((id *)&self->_inhibitedAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end