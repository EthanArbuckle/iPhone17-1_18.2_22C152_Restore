@interface PUIPosterSceneComponent
- (PUIPosterSceneComponent)initWithScene:(id)a3 bundleIdentifier:(id)a4 processIdentity:(id)a5 options:(unint64_t)a6;
- (void)_main_remoteMLMInvalidation:(id)a3;
- (void)_main_updateState;
- (void)invalidate;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
@end

@implementation PUIPosterSceneComponent

- (void)_main_updateState
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PUIPosterSceneComponent.m";
  __int16 v16 = 1024;
  int v17 = 103;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (PUIPosterSceneComponent)initWithScene:(id)a3 bundleIdentifier:(id)a4 processIdentity:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  __int16 v14 = [(PUIPosterSceneComponent *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scene, a3);
    uint64_t v16 = [v12 copy];
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_processIdentity, a5);
    v15->_options = a6;
    [(FBScene *)v15->_scene addObserver:v15];
    [(PUIPosterSceneComponent *)v15 _main_updateState];
  }

  return v15;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(BSAbsoluteMachTimer *)self->_wakeTimer invalidate];
  [(BSTimerScheduleQuerying *)self->_eventTimer invalidate];
  [(FBScene *)self->_scene removeObserver:self];
  if (self->_mlmAssertion)
  {
    v3 = PUILogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(FBScene *)self->_scene pui_shortDescription];
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_25A0AF000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating MLM assertion.", (uint8_t *)&v11, 0xCu);
    }
    [(RBSAssertion *)self->_mlmAssertion invalidate];
    mlmAssertion = self->_mlmAssertion;
    self->_mlmAssertion = 0;
  }
  [(RBSAssertion *)self->_taskAssertion invalidate];
  taskAssertion = self->_taskAssertion;
  self->_taskAssertion = 0;

  if (self->_locationInUseAssertion)
  {
    v7 = PUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      locationInUseAssertion = self->_locationInUseAssertion;
      int v11 = 138412290;
      id v12 = locationInUseAssertion;
      _os_log_impl(&dword_25A0AF000, v7, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %@", (uint8_t *)&v11, 0xCu);
    }

    [(CLInUseAssertion *)self->_locationInUseAssertion invalidate];
    v9 = self->_locationInUseAssertion;
    self->_locationInUseAssertion = 0;
  }
  scene = self->_scene;
  self->_scene = 0;
}

- (void)_main_remoteMLMInvalidation:(id)a3
{
  if (self->_mlmAssertion == a3)
  {
    [a3 invalidate];
    mlmAssertion = self->_mlmAssertion;
    self->_mlmAssertion = 0;

    [(PUIPosterSceneComponent *)self _main_updateState];
  }
}

void __44__PUIPosterSceneComponent__main_updateState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = PUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_25A0AF000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] MLM assertion for %{public}@ was invalidated remotely.", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__PUIPosterSceneComponent__main_updateState__block_invoke_44;
  v8[3] = &unk_265471C58;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(&v10);
}

void __44__PUIPosterSceneComponent__main_updateState__block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_main_remoteMLMInvalidation:", *(void *)(a1 + 32));
}

uint64_t __44__PUIPosterSceneComponent__main_updateState__block_invoke_47(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = PUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_25A0AF000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finalizing delayed invalidation of MLM assertion %p.", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 40) invalidate];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = objc_msgSend(v9, "pui_significantEventTimeDidChange");
  int v11 = objc_msgSend(v9, "pui_significantEventsDidChange");

  if ((v10 & 1) != 0 || v11)
  {
    [(BSTimerScheduleQuerying *)self->_eventTimer invalidate];
    eventTimer = self->_eventTimer;
    self->_eventTimer = 0;

    __int16 v13 = [v8 clientSettings];
    char v14 = objc_msgSend(v13, "pui_significantEventOptions");

    uint64_t v15 = [v8 clientSettings];
    char v16 = objc_msgSend(v15, "pui_significantEventOptions");

    int v17 = objc_msgSend(v8, "pui_isLegacyProvider");
    if ((v14 & 1) != 0 || (v16 & 8) != 0 && ((v17 ^ 1) & 1) == 0)
    {
      __int16 v18 = [v8 clientSettings];
      uint64_t v19 = objc_msgSend(v18, "pui_significantEventTime");

      uint64_t v45 = 0;
      uint64_t v46 = 0;
      if (!dispatch_time_to_nsec())
      {
        uint64_t v20 = PUILogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.6();
        }
        goto LABEL_26;
      }
      if (v19 == (unint64_t)(v45 == 2) << 63)
      {
        uint64_t v20 = PUILogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:]();
        }
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v44 = 0;
      if (!dispatch_time_to_nsec())
      {
        uint64_t v20 = PUILogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.5();
        }
        goto LABEL_26;
      }
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __101__PUIPosterSceneComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      v43[3] = &unk_265471CA8;
      v43[4] = self;
      v22 = (void *)MEMORY[0x25A2F6090](v43);
      double v23 = (double)(unint64_t)(v46 - v44) / 1000000000.0;
      if (v23 <= 0.0)
      {
        v28 = PUILogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.4();
        }
      }
      else
      {
        if (v45 == 3)
        {
          id v29 = objc_alloc(MEMORY[0x263F29D00]);
          v30 = objc_msgSend(v8, "pui_shortDescription");
          v31 = (BSTimerScheduleQuerying *)[v29 initWithIdentifier:v30];
          v32 = self->_eventTimer;
          self->_eventTimer = v31;

          v33 = self->_eventTimer;
          v34 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v23];
          [(BSTimerScheduleQuerying *)v33 scheduleForDate:v34 leewayInterval:MEMORY[0x263EF83A0] queue:v22 handler:0.1];

          v35 = @"wall";
        }
        else if (v45 == 2)
        {
          id v36 = objc_alloc(MEMORY[0x263F29C20]);
          v37 = objc_msgSend(v8, "pui_shortDescription");
          v38 = (BSTimerScheduleQuerying *)[v36 initWithIdentifier:v37];
          v39 = self->_eventTimer;
          self->_eventTimer = v38;

          [(BSTimerScheduleQuerying *)self->_eventTimer scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v22 queue:v23 handler:0.1];
          v35 = @"monotonic";
        }
        else
        {
          if (v45 == 1)
          {
            id v24 = objc_alloc(MEMORY[0x263F29BA8]);
            v25 = objc_msgSend(v8, "pui_shortDescription");
            v26 = (BSTimerScheduleQuerying *)[v24 initWithIdentifier:v25];
            v27 = self->_eventTimer;
            self->_eventTimer = v26;

            [(BSTimerScheduleQuerying *)self->_eventTimer scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v22 queue:v23 handler:0.1];
          }
          else
          {
            v40 = PUILogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v45, v40);
            }
          }
          v35 = @"default";
        }
        if (!self->_eventTimer) {
          goto LABEL_44;
        }
        if (v23 <= 60.0)
        {
          v28 = PUILogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            double v48 = v23;
            __int16 v49 = 2112;
            v50 = v35;
            _os_log_impl(&dword_25A0AF000, v28, OS_LOG_TYPE_DEFAULT, "Setting significant time interval to %.1fs (%@)", buf, 0x16u);
          }
        }
        else
        {
          v28 = objc_alloc_init(MEMORY[0x263F08780]);
          [v28 setUnitsStyle:1];
          v41 = [v28 stringFromTimeInterval:v23];
          v42 = PUILogCommon();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            double v48 = *(double *)&v41;
            __int16 v49 = 2112;
            v50 = v35;
            _os_log_impl(&dword_25A0AF000, v42, OS_LOG_TYPE_DEFAULT, "Setting significant time interval to %{public}@ (%@)", buf, 0x16u);
          }
        }
      }

LABEL_44:
      goto LABEL_27;
    }
    if ((v16 & 8) != 0) {
      char v21 = v17;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0)
    {
      uint64_t v20 = PUILogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](v8, v20);
      }
      goto LABEL_26;
    }
  }
LABEL_27:
}

void __101__PUIPosterSceneComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  if ([v4 isActive])
  {
    uint64_t v5 = PUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = objc_msgSend(v4, "pui_shortDescription");
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "Significant event timer fired for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(v4, "pui_postSignificantEvent:", 1);
  }
  [v3 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTimer, 0);
  objc_storeStrong((id *)&self->_wakeTimer, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_mlmAssertion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)scene:(void *)a1 didUpdateClientSettingsWithDiff:(NSObject *)a2 oldClientSettings:transitionContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a1, "pui_shortDescription");
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_FAULT, "PRPosterSignificantEventOptionLegacySettingsUpdate requested from *not* LegacyPoster BUT: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_25A0AF000, v0, v1, "we do not support significant event timers for \"now\"", v2, v3, v4, v5, v6);
}

- (void)scene:(uint64_t *)a1 didUpdateClientSettingsWithDiff:(NSObject *)a2 oldClientSettings:transitionContext:.cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "bad dispatch time clock ID, clock %lu is unsupported", (uint8_t *)&v3, 0xCu);
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_25A0AF000, v0, v1, "ignoring significant event time in the past", v2, v3, v4, v5, v6);
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_25A0AF000, v0, v1, "bad dispatch time, ignoring signficant event time (2)", v2, v3, v4, v5, v6);
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_25A0AF000, v0, v1, "bad dispatch time, ignoring signficant event time", v2, v3, v4, v5, v6);
}

@end