@interface SBExternalDisplayServiceConnectionListener
@end

@implementation SBExternalDisplayServiceConnectionListener

void __68___SBExternalDisplayServiceConnectionListener_initWithServiceQueue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6A88] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

void __114___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidUpdateProperties_requestingClient___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1[4] + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (v7 != (void *)a1[5])
        {
          v8 = [v7 connection];
          v9 = [v8 remoteTarget];
          [v9 externalDisplayDidUpdateProperties:a1[6]];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
}

void __88___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) connection];
        v8 = [v7 remoteTarget];
        [v8 externalDisplayDidConnect:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

void __92___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayWillDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) connection];
        v8 = [v7 remoteTarget];
        [v8 externalDisplayWillDisconnect:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6A88] interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v5 = [MEMORY[0x1E4FA6A88] serviceQuality];
  [v3 setServiceQuality:v5];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6AF7BA0;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_65;
  v6[3] = &unk_1E6AF7BA0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = SBLogDisplayControlling();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(v3);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = SBLogDisplayControlling();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_65_cold_1(v3);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 remoteProcess];
  [v1 pid];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v2, v3, "SBExternalDisplayService: connection <%p> pid: %i was interrupted", v4, v5, v6, v7, v8);
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_65_cold_1(void *a1)
{
  v1 = [a1 remoteProcess];
  [v1 pid];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v2, v3, "SBExternalDisplayService: connection <%p> pid: %i was invalidated", v4, v5, v6, v7, v8);
}

@end