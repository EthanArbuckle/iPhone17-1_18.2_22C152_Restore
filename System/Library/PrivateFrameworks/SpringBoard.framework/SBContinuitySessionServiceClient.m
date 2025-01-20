@interface SBContinuitySessionServiceClient
@end

@implementation SBContinuitySessionServiceClient

void __86___SBContinuitySessionServiceClient__connectionQueue_handleLaunchEventOfType_payload___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received launch event of type: %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v8 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received launch event of type: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 continuitySessionServiceClient:*(void *)(a1 + 32) handleLaunchEventOfType:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
  }
}

void __82___SBContinuitySessionServiceClient__connectionQueue_handleContinuityButtonEvent___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v7 = NSStringFromSBUIContinuityButtonEventType();
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent button event: %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v8 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v9 = NSStringFromSBUIContinuityButtonEventType();
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent button event: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 continuitySessionServiceClient:*(void *)(a1 + 32) handleContinuityButtonEvent:*(void *)(a1 + 40)];
  }
}

void __84___SBContinuitySessionServiceClient__connectionQueue_setHostedInterfaceOrientation___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v7 = BSInterfaceOrientationDescription();
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] set hosted interface orientation: %{public}@ but we are already invalidated so ignoring", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v8 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v9 = BSInterfaceOrientationDescription();
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] set hosted interface orientation: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 continuitySessionServiceClient:*(void *)(a1 + 32) setHostedInterfaceOrientation:*(void *)(a1 + 40)];
  }
}

void __69___SBContinuitySessionServiceClient__connectionQueue_handleActivated__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 13))
  {
    int v3 = SBLogContinuitySessionService();
    if (os_signpost_enabled(v3))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION_ACTIVATED", (const char *)&unk_1D8FE2CAB, (uint8_t *)&v11, 2u);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 13) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  v6 = SBLogContinuitySessionService();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = [*(id *)(a1 + 32) succinctDescription];
      int v11 = 138543362;
      __int16 v12 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent activation message but we are already invalidated so ignoring!", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 32) succinctDescription];
      int v11 = 138543362;
      __int16 v12 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] handling activation message", (uint8_t *)&v11, 0xCu);
    }
    int v10 = [*(id *)(a1 + 32) delegate];
    [v10 continuitySessionServiceClientDidUpdateExternallyBlockedReasons:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) continuitySessionDidUpdateState:*(void *)(*(void *)(a1 + 32) + 32)];
  }
}

void __92___SBContinuitySessionServiceClient__connectionQueue_handleUpdatedExternallyBlockedReasons___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  uint64_t v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) succinctDescription];
      BOOL v7 = objc_msgSend(*(id *)(a1 + 40), "bs_array");
      int v10 = 138543618;
      int v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent externally blocked reasons %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v8 = [*(id *)(a1 + 32) succinctDescription];
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "bs_array");
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent externally blocked reasons %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 continuitySessionServiceClientDidUpdateExternallyBlockedReasons:*(void *)(a1 + 32)];
  }
}

void __81___SBContinuitySessionServiceClient__connectionQueue_handleHIDServicesConfigured__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  uint64_t v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) succinctDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished configuring HID services but we are already invalidated so ignoring!", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      BOOL v7 = [*(id *)(a1 + 32) succinctDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished configuring HID services", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 continuitySessionServiceClientDidConfigureHIDServices:*(void *)(a1 + 32)];
  }
}

void __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  int v3 = *((unsigned __int8 *)*v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 2);
  uint64_t v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      uint64_t v9 = [*v2 succinctDescription];
      int v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] updated appearance settings", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = [*v2 delegate];
    int v8 = v10;
    if (v10)
    {
      [v10 continuitySessionServiceClient:a1[4] updatedAppearanceSettings:a1[5] transitionContext:a1[6] completion:a1[7]];
    }
    else
    {
      int v11 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke_cold_1((uint64_t)v2);
      }

      uint64_t v12 = a1[7];
      if (v12)
      {
        uint64_t v13 = SBUIContinuitySessionErrorCreate();
        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
      }
    }
    goto LABEL_14;
  }
  if (v5)
  {
    v6 = [*v2 succinctDescription];
    int v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] updated appearance settings but we are already invalidated so ignoring!", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = a1[7];
  if (v7)
  {
    int v8 = SBUIContinuitySessionErrorCreate();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
LABEL_14:
  }
}

void __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  int v3 = SBLogContinuitySessionService();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      BOOL v5 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did capture screenshot but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did capture screenshot", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [*v1 delegate];
    int v3 = v7;
    if (v7)
    {
      [v7 continuitySessionServiceClientDidCaptureScreenshot:*v1];
    }
    else
    {
      int v8 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke_cold_1((uint64_t)v1);
      }
    }
  }
}

void __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  int v3 = SBLogContinuitySessionService();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      BOOL v5 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start screen recording but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start screen recording", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [*v1 delegate];
    int v3 = v7;
    if (v7)
    {
      [v7 continuitySessionServiceClientDidStartScreenRecording:*v1];
    }
    else
    {
      int v8 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke_cold_1((uint64_t)v1);
      }
    }
  }
}

void __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  int v3 = SBLogContinuitySessionService();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      BOOL v5 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client has adopted screen capture notifications but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client has adopted screen capture notifications", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [*v1 delegate];
    int v3 = v7;
    if (v7)
    {
      [v7 continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:*v1];
    }
    else
    {
      int v8 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke_cold_1((uint64_t)v1);
      }
    }
  }
}

void __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  int v3 = SBLogContinuitySessionService();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      BOOL v5 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did stop screen recording but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = [*v1 succinctDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did stop screen recording", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [*v1 delegate];
    int v3 = v7;
    if (v7)
    {
      [v7 continuitySessionServiceClientDidStopScreenRecording:*v1];
    }
    else
    {
      int v8 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke_cold_1((uint64_t)v1);
      }
    }
  }
}

uint64_t __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendInt:*(unsigned int *)(*(void *)(a1 + 40) + 20) withName:@"pid"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"INVALIDATED" ifEqualTo:1];
  uint64_t result = [*(id *)(a1 + 32) hasSuccinctStyle];
  if ((result & 1) == 0)
  {
    id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14) withName:@"suppressingClientCallouts"];
    return (uint64_t)(id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 15) withName:@"sentDisplayUUID"];
  }
  return result;
}

void __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) externallyBlockedReasons];
  id v4 = (id)[v2 appendObject:v3 withName:@"externallyBlockedReasons"];

  id v5 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_3;
  v17 = &unk_1E6AF5290;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  id v18 = v6;
  uint64_t v19 = v7;
  [v6 appendBodySectionWithName:@"internalState" block:&v14];
  int v8 = *(void **)(a1 + 32);
  int v9 = BSInterfaceOrientationDescription();
  id v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, @"currentInterfaceOrientation", v14, v15, v16, v17);

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = BSInterfaceOrientationMaskDescription();
  id v13 = (id)[v11 appendObject:v12 withName:@"supportedInterfaceOrientations"];
}

void __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSStringFromSBContinuitySessionState(*(void *)(*(void *)(a1 + 40) + 48));
  id v4 = (id)[v2 appendObject:v3 withName:@"state"];

  id v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "bs_array");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 appendObject:v7 withName:@"stateReasons"];
}

void __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2_14(a1) succinctDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "[%{public}@] updated appearance settings - no delegate", v4, v5, v6, v7, v8);
}

void __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2_14(a1) succinctDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "[%{public}@] did capture screenshot - no delegate", v4, v5, v6, v7, v8);
}

void __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2_14(a1) succinctDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "[%{public}@] did start screen recording - no delegate", v4, v5, v6, v7, v8);
}

void __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2_14(a1) succinctDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "[%{public}@] client has adopted screen capture notifications - no delegate", v4, v5, v6, v7, v8);
}

void __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2_14(a1) succinctDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "[%{public}@] did stop screen recording - no delegate", v4, v5, v6, v7, v8);
}

@end