@interface SBContinuitySessionStateMachine
@end

@implementation SBContinuitySessionStateMachine

id __106___SBContinuitySessionStateMachine_initWithSystemEventMonitor_continuityDisplayAuthenticationCoordinator___block_invoke(uint64_t a1, Class a2)
{
  v2 = (void *)[[a2 alloc] initWithSystemEventMonitor:*(void *)(a1 + 32) continuityDisplayAuthenticationCoordinator:*(void *)(a1 + 40)];
  return v2;
}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_2;
  v11[3] = &unk_1E6B0E0E0;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(void *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D948C7A0](v11);
  v9 = (void *)MEMORY[0x1D948C7A0](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 13) != *(void *)(a1 + 48))
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"_SBContinuitySessionStateMachine.m", 243, @"invalid state handler called from state %ld that isn't the current state %ld", *(void *)(a1 + 48), objc_msgSend(v4, "state"));
    }
    [v4 _moveToInvalidStateForReasons:v6 postToDelegate:1];
  }
}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_3(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_4;
  v11[3] = &unk_1E6B0E130;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(void *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D948C7A0](v11);
  v9 = (void *)MEMORY[0x1D948C7A0](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (WeakRetained[13] != *(void *)(a1 + 48))
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"_SBContinuitySessionStateMachine.m", 255, @"state transition handler called from state %ld that isn't the current state %ld", *(void *)(a1 + 48), objc_msgSend(v6, "state"));
    }
    [v6 _moveToState:a2];
    id WeakRetained = v6;
  }
}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_5(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_6;
  v11[3] = &unk_1E6B0E0E0;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(void *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D948C7A0](v11);
  v9 = (void *)MEMORY[0x1D948C7A0](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 13) != *(void *)(a1 + 48))
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"_SBContinuitySessionStateMachine.m", 267, @"state transition handler called from state %ld that isn't the current state %ld", *(void *)(a1 + 48), objc_msgSend(v4, "state"));
    }
    [v4 _updateCurrentStateReasons:v6];
  }
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_7(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[5];
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v10 = a2;
  uint64_t v7 = v6(v5, a3);
  [v10 setStateTransitionHandler:v7];

  uint64_t v8 = (*(void (**)(void))(a1[6] + 16))();
  [v10 setInvalidStateHandler:v8];

  v9 = (*(void (**)(void))(a1[7] + 16))();
  [v10 setStateUpdateHandler:v9];

  [v10 setClientExternallyBlockedReasonsProvider:a1[4]];
}

void __63___SBContinuitySessionStateMachine__updateCurrentStateReasons___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] == (id)11)
    {
      v4 = SBLogContinuityDisplay();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State Machine] already posted .invalid to client - ignoring updated reasons: %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      objc_storeStrong(WeakRetained + 16, *(id *)(a1 + 32));
      v4 = [v3 delegate];
      [v4 continuitySessionStateMachineDidUpdateState:v3 oldState:*(void *)(a1 + 48)];
    }
  }
}

void __49___SBContinuitySessionStateMachine__moveToState___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] == (id)11)
    {
      v4 = SBLogContinuityDisplay();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = NSStringFromSBContinuitySessionState(*(void *)(a1 + 48));
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[State Machine] internal state is .invalid so ignoring async move to state %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      WeakRetained[15] = *(id *)(a1 + 48);
      objc_storeStrong(WeakRetained + 16, *(id *)(a1 + 32));
      v4 = [v3 delegate];
      [v4 continuitySessionStateMachineDidUpdateState:v3 oldState:*(void *)(a1 + 56)];
    }
  }
}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 137) withName:@"invalidated" ifEqualTo:1];
}

void __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  v3 = NSStringFromSBContinuitySessionState(*(void *)(a1[5] + 120));
  [v2 appendString:v3 withName:0];

  v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_3;
  v8[3] = &unk_1E6AF5290;
  id v6 = v4;
  uint64_t v7 = a1[5];
  id v9 = v6;
  uint64_t v10 = v7;
  [v6 overlayStyle:v5 block:v8];
}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:0];
}

void __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_4(void *a1)
{
  v2 = (void *)a1[4];
  v3 = NSStringFromSBContinuitySessionState(*(void *)(a1[5] + 104));
  [v2 appendString:v3 withName:0];

  v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_5;
  v8[3] = &unk_1E6AF5290;
  id v6 = v4;
  uint64_t v7 = a1[5];
  id v9 = v6;
  uint64_t v10 = v7;
  [v6 overlayStyle:v5 block:v8];
}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_5(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:0];
}

@end