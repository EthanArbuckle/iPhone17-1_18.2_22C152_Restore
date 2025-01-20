@interface SBTraitsSceneOrientationRequestAssistant
- (NSString)errorDomain;
- (SBTraitsSceneOrientationRequestAssistant)initWithTraitsSceneDelegate:(id)a3 errorDomain:(id)a4;
- (SBTraitsSceneParticipantDelegate)traitsDelegate;
- (void)_performCoalescedBroadcastArbitrationUpdateWithReason:(id)a3;
- (void)_startSceneOrientationRequestWithDesiredOrientations:(unint64_t)a3 error:(id *)a4;
- (void)checkValidityAgainstUpdateReasons:(int64_t)a3;
- (void)invalidate;
- (void)setUpForTransitionContextIfNeeded:(id)a3;
@end

@implementation SBTraitsSceneOrientationRequestAssistant

- (SBTraitsSceneOrientationRequestAssistant)initWithTraitsSceneDelegate:(id)a3 errorDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsSceneOrientationRequestAssistant;
  v8 = [(SBTraitsSceneOrientationRequestAssistant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_traitsDelegate, v6);
    objc_storeWeak((id *)&v9->_errorDomain, v7);
  }

  return v9;
}

- (void)invalidate
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  v5 = [WeakRetained sceneHandle];
  SBSafeCast(v3, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 _setInitialDeviceOrientationFromSceneOrientationRequestSetup:0];
  [v6 _setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:0];
  [v6 _setSettingUpSceneOrientationRequest:0];
}

- (void)checkValidityAgainstUpdateReasons:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  uint64_t v5 = objc_opt_class();
  id v6 = [WeakRetained sceneHandle];
  id v7 = SBSafeCast(v5, v6);

  if (v7)
  {
    if ([v7 _isSettingUpSceneOrientationRequest])
    {
      [v7 _setSettingUpSceneOrientationRequest:0];
    }
    else
    {
      v8 = [WeakRetained participant];
      uint64_t v9 = objc_msgSend(v8, "sbf_currentDeviceOrientation");

      uint64_t v10 = [v7 _initialDeviceOrientationFromSceneOrientationRequestSetup];
      if ([v7 _supportedInterfaceOrientationsFromSceneOrientationRequestSetup] && (!v10 || v9 != v10))
      {
        if ((unint64_t)(v9 - 1) > 3)
        {
          [v7 _setInitialDeviceOrientationFromSceneOrientationRequestSetup:0];
        }
        else
        {
          objc_initWeak(&location, self);
          objc_super v11 = (void *)MEMORY[0x1E4F39CF8];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __78__SBTraitsSceneOrientationRequestAssistant_checkValidityAgainstUpdateReasons___block_invoke;
          v12[3] = &unk_1E6AF4B10;
          objc_copyWeak(&v13, &location);
          objc_msgSend(v11, "bs_performAfterCommit:", v12);
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __78__SBTraitsSceneOrientationRequestAssistant_checkValidityAgainstUpdateReasons___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained invalidate];
    [v2 _performCoalescedBroadcastArbitrationUpdateWithReason:@"SceneOrientationRequest invalidation"];
    id WeakRetained = v2;
  }
}

- (void)setUpForTransitionContextIfNeeded:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 actions];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorDomain);
  if ([v4 count])
  {
    id v6 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_307);
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 requestedInterfaceOrientationMask];
      if ([v7 policy] == 2
        && (+[SBOrientationLockManager sharedInstance],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 isUserLocked],
            v9,
            v10))
      {
        objc_super v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v30[0] = @"NOOP: honoring user orientation lock";
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        id v13 = [v11 errorWithDomain:WeakRetained code:1 userInfo:v12];
      }
      else
      {
        v12 = objc_loadWeakRetained((id *)&self->_traitsDelegate);
        uint64_t v14 = objc_opt_class();
        v15 = [v12 sceneHandle];
        v16 = SBSafeCast(v14, v15);

        if (v16)
        {
          id v26 = 0;
          [(SBTraitsSceneOrientationRequestAssistant *)self _startSceneOrientationRequestWithDesiredOrientations:v8 error:&v26];
          id v13 = v26;
        }
        else
        {
          v17 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          v18 = NSString;
          v19 = [v12 scene];
          v20 = [v19 identifier];
          v21 = [v18 stringWithFormat:@"The requesting scene [%@] is not supported", v20];
          v28 = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          id v13 = [v17 errorWithDomain:WeakRetained code:1 userInfo:v22];
        }
      }

      if ([v7 canSendResponse])
      {
        id v23 = objc_alloc(MEMORY[0x1E4F4F678]);
        v24 = [v7 info];
        v25 = (void *)[v23 initWithInfo:v24 error:v13];

        [v7 sendResponse:v25];
      }
    }
  }
}

BOOL __78__SBTraitsSceneOrientationRequestAssistant_setUpForTransitionContextIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UIActionType] == 49;
}

- (void)_startSceneOrientationRequestWithDesiredOrientations:(unint64_t)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  uint64_t v9 = objc_opt_class();
  int v10 = [WeakRetained sceneHandle];
  objc_super v11 = SBSafeCast(v9, v10);

  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBTraitsSceneOrientationRequestAssistant.m", 112, @"Invalid parameter not satisfying: %@", @"outError" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = objc_loadWeakRetained((id *)&self->_errorDomain);
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Invalid requested orientation.";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a4 = [v16 errorWithDomain:v17 code:0 userInfo:v18];

    goto LABEL_8;
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SBTraitsSceneOrientationRequestAssistant.m", 111, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = [v11 _supportedInterfaceOrientationsFromSceneOrientationRequestSetup];
  [v11 _setInterfaceOrientationFromUserResizing:0];
  [v11 _setSettingUpSceneOrientationRequest:v12 == 0];
  [v11 _setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:a3];
  id v13 = [WeakRetained participant];
  objc_msgSend(v11, "_setInitialDeviceOrientationFromSceneOrientationRequestSetup:", objc_msgSend(v13, "currentDeviceOrientation"));

  [(SBTraitsSceneOrientationRequestAssistant *)self _performCoalescedBroadcastArbitrationUpdateWithReason:@"SceneOrientationRequest setup"];
LABEL_8:
}

- (void)_performCoalescedBroadcastArbitrationUpdateWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BSRunLoopPerformRelativeToCACommit();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __98__SBTraitsSceneOrientationRequestAssistant__performCoalescedBroadcastArbitrationUpdateWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"SBSceneGeometryOrientationRequestChanged" object:0];

    id WeakRetained = v3;
  }
}

- (SBTraitsSceneParticipantDelegate)traitsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsDelegate);
  return (SBTraitsSceneParticipantDelegate *)WeakRetained;
}

- (NSString)errorDomain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_errorDomain);
  return (NSString *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorDomain);
  objc_destroyWeak((id *)&self->_traitsDelegate);
}

@end