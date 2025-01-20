@interface SBAppIntentsCoordinator
- (BOOL)providesPreviewForActionWithIdentifier:(id)a3;
- (id)_actionReasonForAppIntent:(uint64_t)a1;
- (id)_previewReasonForActionIdentifier:(void *)a1;
- (id)initWithClientCoordinator:(void *)a3 cameraActivationManager:(void *)a4 flashlightActivityManager:(void *)a5 focusActivityManager:(void *)a6 ringerControl:;
- (id)showPreviewForAction:(id)a3 withContext:(id)a4;
- (id)soundForPerformingActionWithIdentifier:(id)a3;
- (id)systemActionDataSource:(id)a3 overrideActionForAction:(id)a4;
- (uint64_t)_performFocusAppIntent:(uint64_t)a1;
- (uint64_t)_performOpenCameraAppIntent:(void *)a3 withCompletion:;
- (uint64_t)_performToggleFlashlightAppIntent:(uint64_t)result;
- (void)_performAppIntent:(void *)a3 locallyWithCompletion:;
- (void)_performAppIntent:(void *)a3 withCompletion:;
- (void)appIntentsCoordinator:(id)a3 performAppIntent:(id)a4 withCompletion:(id)a5;
@end

@implementation SBAppIntentsCoordinator

- (id)initWithClientCoordinator:(void *)a3 cameraActivationManager:(void *)a4 flashlightActivityManager:(void *)a5 focusActivityManager:(void *)a6 ringerControl:
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v29 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (a1)
  {
    if (!v12)
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clientCoordinator != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BAE638);
    }
    if (!v29)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"cameraActivationManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BAE6A0);
    }
    if (!v13)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"flashlightActivityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BAE708);
    }
    if (!v14)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"focusActivityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.4();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BAE770);
    }
    if (!v15)
    {
      v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"ringerControl != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.5();
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BAE7D8);
    }
    v30.receiver = a1;
    v30.super_class = (Class)SBAppIntentsCoordinator;
    v17 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 2, a2);
      [v12 setDelegate:a1];
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      objc_storeStrong(a1 + 5, a5);
      objc_storeStrong(a1 + 6, a6);
      v18 = [@"com.apple.springboard" stringByAppendingFormat:@".%@", *MEMORY[0x1E4FA6958]];
      v31[0] = v18;
      v19 = [@"com.apple.springboard" stringByAppendingFormat:@".%@", *MEMORY[0x1E4FA6948]];
      uint64_t v20 = *MEMORY[0x1E4FB4DA8];
      v31[1] = v19;
      v31[2] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
      id v22 = a1[1];
      a1[1] = (id)v21;
    }
  }

  return a1;
}

- (BOOL)providesPreviewForActionWithIdentifier:(id)a3
{
  return [(NSArray *)self->_allPreviewingActionIdentifiers containsObject:a3];
}

- (id)showPreviewForAction:(id)a3 withContext:(id)a4
{
  v5 = [a3 configuredAction];
  v6 = [v5 identifier];
  v7 = -[SBAppIntentsCoordinator _previewReasonForActionIdentifier:](self, (uint64_t)v6);
  if ([v6 hasSuffix:*MEMORY[0x1E4FA6958]])
  {
    if (self) {
      flashlightActivityManager = self->_flashlightActivityManager;
    }
    else {
      flashlightActivityManager = 0;
    }
    uint64_t v9 = -[SBFlashlightActivityManager previewFlashlightActivityForReason:]((uint64_t)flashlightActivityManager, v7);
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_15;
  }
  if ([v6 hasSuffix:*MEMORY[0x1E4FA6948]])
  {
    if (self) {
      focusActivityManager = self->_focusActivityManager;
    }
    else {
      focusActivityManager = 0;
    }
    id v12 = focusActivityManager;
    id v13 = objc_msgSend(v5, "sb_configuredIntentAction");
    id v14 = -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v13);

    v10 = -[SBFocusActivityManager previewFocusWithModeIdentifier:withReason:]((uint64_t)v12, v14, v7);

    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB4DA8]])
  {
    if (self) {
      ringerControl = self->_ringerControl;
    }
    else {
      ringerControl = 0;
    }
    uint64_t v9 = [(SBRingerControl *)ringerControl previewRingerStateForReason:v7];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)_previewReasonForActionIdentifier:(void *)a1
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"%@ Action Preview", a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)soundForPerformingActionWithIdentifier:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4FB4DA8]])
  {
    if (self) {
      ringerControl = self->_ringerControl;
    }
    else {
      ringerControl = 0;
    }
    v5 = ringerControl;
    v6 = -[SBRingerControl soundForRingerMuted:](v5, "soundForRingerMuted:", -[SBRingerControl isRingerMuted]((uint64_t)v5) ^ 1);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)systemActionDataSource:(id)a3 overrideActionForAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 configuredAction];
  uint64_t v9 = [v8 sectionIdentifier];
  v10 = [v7 instanceIdentity];
  objc_initWeak(&location, self);
  if ([v9 isEqualToString:@"Camera"])
  {
    v27 = 0;
    v28 = 0;
    v11 = objc_msgSend(v8, "sb_configuredIntentAction");
    -[WFConfiguredStaccatoIntentAction sb_getCameraCaptureMode:andCaptureDevice:](v11, (uint64_t *)&v28, &v27);

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke;
    v25[3] = &unk_1E6B06C40;
    v26[1] = v27;
    v26[2] = v28;
    id v12 = v26;
    objc_copyWeak(v26, &location);
    uint64_t v13 = +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v25);
LABEL_5:
    id v14 = (void *)v13;
    objc_destroyWeak(v12);
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"Flashlight"])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_2;
    v23[3] = &unk_1E6B06C68;
    id v12 = &v24;
    objc_copyWeak(&v24, &location);
    uint64_t v13 = +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v23);
    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"Focus"])
  {
    v16 = objc_msgSend(v8, "sb_configuredIntentAction");
    v17 = -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v16);

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_3;
    v20[3] = &unk_1E6B06C90;
    v18 = v17;
    uint64_t v21 = v18;
    objc_copyWeak(&v22, &location);
    id v14 = +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v20);
    objc_destroyWeak(&v22);

LABEL_15:
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"SilentMode"])
  {
    if (self) {
      ringerControl = self->_ringerControl;
    }
    else {
      ringerControl = 0;
    }
    v18 = ringerControl;
    id v14 = +[SBBlockSystemAction toggleSilentModeActionWithRingerControl:instanceIdentity:name:]((uint64_t)SBBlockSystemAction, v18, v10, @"Local");
    goto LABEL_15;
  }
  id v14 = 0;
LABEL_6:
  objc_destroyWeak(&location);

  return v14;
}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4FA6940];
  id v6 = a3;
  id v7 = a2;
  id v9 = (id)[[v5 alloc] initWithCaptureDevice:*(void *)(a1 + 40) captureMode:*(void *)(a1 + 48) systemContext:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v9, v6);
}

- (void)_performAppIntent:(void *)a3 locallyWithCompletion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SBAppIntentsCoordinator__performAppIntent_locallyWithCompletion___block_invoke;
    v7[3] = &unk_1E6AF5A50;
    id v8 = v5;
    -[SBAppIntentsCoordinator _performAppIntent:withCompletion:](a1, a2, v7);
  }
}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6920];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  id v10 = (id)[v8 initWithIdentifier:*MEMORY[0x1E4FA6958] systemContext:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v10, v6);
}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6938];
  id v6 = a3;
  id v7 = a2;
  id v9 = (id)[[v5 alloc] initWithModeIdentifier:*(void *)(a1 + 32) systemContext:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v9, v6);
}

- (void)appIntentsCoordinator:(id)a3 performAppIntent:(id)a4 withCompletion:(id)a5
{
}

- (void)_performAppIntent:(void *)a3 withCompletion:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = [v9 identifier];
    if ([v6 isEqualToString:*MEMORY[0x1E4FA6950]])
    {
      -[SBAppIntentsCoordinator _performOpenCameraAppIntent:withCompletion:](a1, v9, v5);
LABEL_10:

      goto LABEL_11;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4FA6958]])
    {
      uint64_t v7 = -[SBAppIntentsCoordinator _performToggleFlashlightAppIntent:](a1, v9);
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x1E4FA6948]])
      {
        uint64_t v8 = 0;
        if (!v5) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      uint64_t v7 = -[SBAppIntentsCoordinator _performFocusAppIntent:](a1, v9);
    }
    uint64_t v8 = v7;
    if (!v5) {
      goto LABEL_10;
    }
LABEL_9:
    (*((void (**)(id, uint64_t))v5 + 2))(v5, v8);
    goto LABEL_10;
  }
LABEL_11:
}

void __67__SBAppIntentsCoordinator__performAppIntent_locallyWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = SBSystemActionExecutionErrorCreate(0, @"Local action failed");
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)_performOpenCameraAppIntent:(void *)a3 withCompletion:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    [v6 captureDevice];
    uint64_t v7 = NSStringFromSBINCameraCaptureDevice();
    [v6 captureMode];
    uint64_t v8 = NSStringFromSBINCameraCaptureMode();
    id v9 = NSURLForCameraActivationWithCaptureConfiguration(v7, v8);
    id v10 = [v6 systemContext];

    id v11 = *(id *)(a1 + 24);
    uint64_t v12 = [v10 actionSource];
    uint64_t v13 = 67;
    if (v12 != 1) {
      uint64_t v13 = 0;
    }
    if (v12 == 2) {
      unint64_t v14 = 13;
    }
    else {
      unint64_t v14 = v13;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__SBAppIntentsCoordinator__performOpenCameraAppIntent_withCompletion___block_invoke;
    v16[3] = &unk_1E6AFA3D8;
    id v17 = v5;
    a1 = -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)v11, 0, v9, v14, 0, v16);
  }
  return a1;
}

- (uint64_t)_performToggleFlashlightAppIntent:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 32);
    id v5 = -[SBAppIntentsCoordinator _actionReasonForAppIntent:](v3, a2);
    uint64_t v6 = -[SBFlashlightActivityManager toggleFlashlightForReason:]((uint64_t)v4, v5);

    return v6;
  }
  return result;
}

- (uint64_t)_performFocusAppIntent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 40);
    id v5 = [v3 modeIdentifier];
    if ([v5 isEqualToString:*MEMORY[0x1E4FA6960]])
    {
      a1 = -[SBFocusActivityManager toggleActivityPickerPresentation]((uint64_t)v4);
    }
    else
    {
      uint64_t v6 = -[SBAppIntentsCoordinator _actionReasonForAppIntent:](a1, v3);
      a1 = -[SBFocusActivityManager toggleFocusWithModeIdentifier:withReason:]((uint64_t)v4, v5, v6);
    }
  }

  return a1;
}

uint64_t __70__SBAppIntentsCoordinator__performOpenCameraAppIntent_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)_actionReasonForAppIntent:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = NSString;
    id v3 = [a2 identifier];
    id v4 = [v2 stringWithFormat:@"%@ App Intent", v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_cameraActivationManager, 0);
  objc_storeStrong((id *)&self->_clientCoordinator, 0);
  objc_storeStrong((id *)&self->_allPreviewingActionIdentifiers, 0);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end