@interface SBContinuitySessionServiceConnectionListener
@end

@implementation SBContinuitySessionServiceConnectionListener

void __70___SBContinuitySessionServiceConnectionListener_initWithServiceQueue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA7C90] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

void __104___SBContinuitySessionServiceConnectionListener_updatedAppearanceSettings_transitionContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v5 = NSNumber;
    id v6 = a3;
    id v7 = [v5 numberWithBool:a2];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA7C90] interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  v5 = [MEMORY[0x1E4FA7C90] serviceQuality];
  [v3 setServiceQuality:v5];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E6AF7BA0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(v3, v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    id v6 = [*((id *)WeakRetained + 2) objectForKey:v3];
    [*((id *)WeakRetained + 2) removeObjectForKey:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    objc_msgSend(v6, "_connectionQueue_didInvalidate");
    objc_initWeak(&location, WeakRetained);
    objc_copyWeak(&v8, &location);
    id v7 = v6;
    BSDispatchMain();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_26(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(WeakRetained + 6);
  [v2 clientDidDisconnect:*(void *)(a1 + 32)];
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained clientDidConnect:*(void *)(a1 + 40)];
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 remoteProcess];
  int v5 = 134218240;
  id v6 = a1;
  __int16 v7 = 1024;
  int v8 = [v4 pid];
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "SBContinuitySessionService: connection <%p> pid: %i was invalidated", (uint8_t *)&v5, 0x12u);
}

@end