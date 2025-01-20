@interface SBSpringBoardFocusLockResolutionStage
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (SBSpringBoardFocusLockResolutionStageDelegate)delegate;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setDelegate:(id)a3;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBSpringBoardFocusLockResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v62 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [v7 keyboardFocusTarget];
  v10 = [v9 sceneIdentityToken];
  v11 = [v10 stringRepresentation];

  v12 = [v7 auditHistory];
  [v12 addItemWithFormat:@"-- SBSpringBoardFocusLockResolutionStage --"];

  v13 = [v8 springBoardFocusLockReasons];
  uint64_t v14 = [v13 count];
  v15 = +[SBKeyboardFocusLockReason coverSheet];
  if ([v13 containsObject:v15]) {
    int v16 = 1;
  }
  else {
    int v16 = [v8 isCoverSheetHostingAnApp];
  }

  v17 = +[SBKeyboardFocusLockReason controlCenter];
  int v18 = [v13 containsObject:v17];

  if (!v14)
  {
    uint64_t v20 = 1;
    goto LABEL_77;
  }
  if (v18)
  {
    v19 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "policy: control center is visible and overriding transient overlays", buf, 2u);
    }
    uint64_t v20 = 0;
    goto LABEL_39;
  }
  if ([v8 hasActiveTransientOverlayPresentation])
  {
    v21 = +[SBKeyboardFocusLockReason activeTransientOverlay];
    v19 = [v13 member:v21];

    v22 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v13 strength:2];
    v60 = v22;
    if ([v8 activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus])
    {
      if (!v22) {
        goto LABEL_20;
      }
      v23 = +[SBKeyboardFocusLockReason coverSheet];
      if ([v22 isEqual:v23])
      {

        goto LABEL_20;
      }
      int loga = [v19 isMoreRecentThanReason:v22];

      if (loga)
      {
LABEL_20:
        if (v16)
        {
          uint64_t v20 = [v7 advicePolicy];
          v25 = [v7 auditHistory];
          [v25 addItemWithFormat:@"accepting policy: secret scene - transient overlay hosted above coversheet"];

          v26 = SBLogKeyboardFocus();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v27 = "policy: activeTransientOverlay with scene-based deferring above coversheet -- not deferring to SB";
LABEL_29:
            _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
          }
        }
        else
        {
          if (![v8 isActiveTransientOverlayPresentationFromSceneWithIdentityTokenString:v11])
          {
            v26 = [v8 focusTargetForActiveTransientOverlayPresentation];
            if (v26)
            {
              uint64_t v20 = [v7 advicePolicy];
              [v7 setKeyboardFocusTarget:v26];
              log = SBLogKeyboardFocus();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v11;
                __int16 v66 = 2114;
                v67 = v26;
                _os_log_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEFAULT, "policy: activeTransientOverlay is not %{public}@. Using topmost: %{public}@.", buf, 0x16u);
              }
              v29 = log;
            }
            else
            {
              v30 = SBLogKeyboardFocus();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v11;
                _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "policy: activeTransientOverlay is not %{public}@ and has no keyboardFocusTarget; ignoring request.",
                  buf,
                  0xCu);
              }
              v29 = v30;
              uint64_t v20 = 0;
            }

            goto LABEL_38;
          }
          uint64_t v20 = [v7 advicePolicy];
          v28 = [v7 auditHistory];
          [v28 addItemWithFormat:@"accepting policy: secret scene - transient overlay hosted"];

          v26 = SBLogKeyboardFocus();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v27 = "policy: activeTransientOverlay with scene-based deferring is arbiter target -- not deferring to SB";
            goto LABEL_29;
          }
        }
LABEL_38:

        goto LABEL_39;
      }
    }
    v26 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.5(v26);
    }
    uint64_t v20 = 0;
    goto LABEL_38;
  }
  if (![v62 isSpotlightVisible])
  {
    uint64_t v20 = 0;
    goto LABEL_40;
  }
  uint64_t v20 = [v7 advicePolicy];
  v24 = [v7 auditHistory];
  [v24 addItemWithFormat:@"accepting policy: spotlight visible (non-transient overlay)"];

  v19 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "policy: spotlight visible (non-transient overlay)", buf, 2u);
  }
LABEL_39:

LABEL_40:
  if ([v8 isBannerKitHostingSceneWithIdentityTokenString:v11])
  {
    uint64_t v20 = [v7 advicePolicy];
    v31 = [v7 auditHistory];
    [v31 addItemWithFormat:@"accepting policy: secret scene - banner hosted"];

    v32 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v11;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "policy: arbiter target %{public}@ is scene-backed banner, not deferring to SB", buf, 0xCu);
    }
  }
  else
  {
    v32 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.4((uint64_t)v11, v32);
    }
  }

  if (([v62 isSiriVisible] & v16) == 1)
  {
    uint64_t v20 = [v7 advicePolicy];
    v33 = [v7 auditHistory];
    [v33 addItemWithFormat:@"accepting policy: secret scene - siri above coversheet"];

    v34 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "policy: Siri -- not deferring to SB", buf, 2u);
    }
  }
  else
  {
    v34 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:]((uint64_t)v11, v34);
    }
  }

  if (!v20)
  {
    v35 = [v7 auditHistory];
    v36 = [v13 allObjects];
    v37 = [v36 componentsJoinedByString:@", "];
    [v35 addItemWithFormat:@"rejecting target: preferring SB for reasons: %@", v37];

    v38 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [v13 allObjects];
      v40 = [v39 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      v65 = v40;
      _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "policy: preferSpringBoardFocus for reasons:(%{public}@)", buf, 0xCu);
    }
    v41 = [WeakRetained springBoardSceneFocusTarget];
    [v7 setKeyboardFocusTarget:v41];
    if (v18)
    {
      v42 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:](v42);
      }
      goto LABEL_73;
    }
    if (![v8 isCoverSheetHostingAnApp]
      || ([v8 hasActiveTransientOverlayPresentation] & 1) != 0)
    {
      v42 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:](v8, v42);
      }
      goto LABEL_73;
    }
    unsigned __int8 v63 = 0;
    v42 = [v8 focusTargetForCoverSheetHostedAppGetCameraIsHosted:&v63];
    [v7 setCameraIsHosted:v63];
    if (v42)
    {
      [v7 setKeyboardFocusTarget:v42];
      v43 = [v7 auditHistory];
      v44 = v43;
      if (v63) {
        v45 = @"YES";
      }
      else {
        v45 = @"NO";
      }
      [v43 addItemWithFormat:@"deferring events to coversheet hosted app %@ - camera is hosted: %@", v42, v45];

      v46 = SBLogKeyboardFocus();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 138543618;
      v65 = v42;
      __int16 v66 = 1024;
      LODWORD(v67) = v63;
      v47 = "policy: deferring events from SpringBoard to CoverSheet hosted app: %{public}@ (camera is hosted:%{BOOL}u)";
      v48 = v46;
      uint32_t v49 = 18;
    }
    else
    {
      v50 = [v7 auditHistory];
      v51 = v50;
      if (v63) {
        v52 = @"YES";
      }
      else {
        v52 = @"NO";
      }
      [v50 addItemWithFormat:@"deferring events to coversheet hosted app but scene doesn't exist yet - camera is hosted: %@", v52];

      v46 = SBLogKeyboardFocus();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v65) = v63;
      v47 = "policy: deferring events from SpringBoard to CoverSheet hosted app, but scene doesn't exist yet (camera is hosted:%{BOOL}u)";
      v48 = v46;
      uint32_t v49 = 8;
    }
    _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
LABEL_72:

LABEL_73:
    uint64_t v53 = [v7 keyboardFocusTarget];
    if (v53)
    {
      v54 = (void *)v53;
      v55 = [WeakRetained springBoardSceneFocusTarget];
      v56 = [v7 keyboardFocusTarget];
      char v57 = BSEqualObjects();

      if ((v57 & 1) == 0) {
        [v7 setShouldSuppressRemoteDeferring:1];
      }
    }

    uint64_t v20 = 0;
  }
LABEL_77:
  [v7 setAdvicePolicy:v20];
}

- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
  return (SBKeyboardFocusResolutionStageSceneProviding *)WeakRetained;
}

- (void)setSceneProvider:(id)a3
{
}

- (SBSpringBoardFocusLockResolutionStageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSpringBoardFocusLockResolutionStageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneProvider);
}

- (void)resolveKeyboardFocusPolicy:(os_log_t)log context:stop:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "policy: control center is visible", v1, 2u);
}

- (void)resolveKeyboardFocusPolicy:(void *)a1 context:(NSObject *)a2 stop:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a1 isCoverSheetHostingAnApp]) {
    v4 = "is";
  }
  else {
    v4 = "is NOT";
  }
  int v5 = [a1 hasActiveTransientOverlayPresentation];
  v6 = "NO";
  if (v5) {
    v6 = "has";
  }
  int v7 = 136315394;
  id v8 = v4;
  __int16 v9 = 2080;
  v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "policy: coversheet %s hosting an app and %s active transient overlay presentation", (uint8_t *)&v7, 0x16u);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a1 context:(NSObject *)a2 stop:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "policy: %{public}@ not siri secret scene", (uint8_t *)&v2, 0xCu);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a1 context:(NSObject *)a2 stop:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "policy: %{public}@ is not a banner kit hosted secret scene", (uint8_t *)&v2, 0xCu);
}

- (void)resolveKeyboardFocusPolicy:(os_log_t)log context:stop:.cold.5(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "policy: active transient overlay presentation but doesn't want scene based focus or is outvoted by a more recent SB focus lock", v1, 2u);
}

@end