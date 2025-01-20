@interface SBAutoPIPWorkspaceTransaction
+ (BOOL)isSystemGesture:(uint64_t)a1;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 tetheringMode:(int64_t *)a5 transitionStyle:(int64_t *)a6 reason:(int64_t)a7;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 transitionStyle:(int64_t *)a5;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 reason:(int64_t)a4;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 tetheringMode:(int64_t *)a4 reason:(int64_t)a5;
+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 transitionStyle:(int64_t *)a4;
+ (uint64_t)_doesPegasusAllowEntityToAutoPIP:(void *)a3 pipCoordinator:;
+ (uint64_t)transitionStyleForProcessIdentifier:(void *)a3 entityToPIP:(void *)a4 withTransitionContext:(void *)a5 request:(uint64_t)a6 reason:;
- (BOOL)_canBeInterrupted;
- (SBApplicationSceneEntity)entityToPIP;
- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3 includeActiveAppEntity:(BOOL)a4 reason:(int64_t)a5;
- (id)_customizedDescriptionProperties;
- (int64_t)transitionStyle;
- (uint64_t)_transitionStyle;
- (void)_begin;
- (void)_didComplete;
- (void)setTransitionStyle:(int64_t)a3;
@end

@implementation SBAutoPIPWorkspaceTransaction

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 tetheringMode:(int64_t *)a4 reason:(int64_t)a5
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:0 tetheringMode:a4 transitionStyle:0 reason:a5];
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 tetheringMode:(int64_t *)a5 transitionStyle:(int64_t *)a6 reason:(int64_t)a7
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(id)SBApp windowSceneManager];
  v12 = [v10 displayIdentity];
  v13 = [v11 windowSceneForDisplayIdentity:v12];

  if (v13
    && ([v13 uiLockStateProvider],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isUILocked],
        v14,
        (v15 & 1) == 0))
  {
    v60 = a5;
    int64_t v62 = a7;
    v17 = [v10 applicationContext];
    v18 = [v10 workspace];
    v19 = [v18 pipCoordinator];

    v20 = [(id)SBApp windowSceneManager];
    v21 = [v10 displayIdentity];
    v22 = [v20 windowSceneForDisplayIdentity:v21];

    v61 = v22;
    v23 = [v22 switcherController];
    uint64_t v24 = [v23 windowManagementStyle];

    if (v24 == 2)
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v25 = [v17 previousEntities];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v69 objects:v82 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v70;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v70 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            if ([v30 isApplicationSceneEntity]
              && +[SBAutoPIPWorkspaceTransaction _doesPegasusAllowEntityToAutoPIP:pipCoordinator:]((uint64_t)a1, v30, v19))
            {
              id v31 = v30;
              goto LABEL_25;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
      id v31 = 0;
LABEL_25:
    }
    else
    {
      v32 = [v17 previousApplicationSceneEntityForLayoutRole:1];
      v33 = [v17 previousApplicationSceneEntityForLayoutRole:2];
      if (v33)
      {
        uint64_t v34 = objc_opt_class();
        v35 = [v10 applicationContext];
        v36 = [v35 previousLayoutState];
        v37 = SBSafeCast(v34, v36);

        if (v37 && [v37 spaceConfiguration] == 2)
        {
          id v38 = v33;

          v32 = v38;
        }
      }
      if (+[SBAutoPIPWorkspaceTransaction _doesPegasusAllowEntityToAutoPIP:pipCoordinator:]((uint64_t)a1, v32, v19))v39 = v32; {
      else
      }
        v39 = 0;
      id v31 = v39;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v40 = [v17 applicationSceneEntities];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v66;
      while (2)
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(v40);
          }
          if ([*(id *)(*((void *)&v65 + 1) + 8 * j) isAnalogousToEntity:v31])
          {

            id v31 = 0;
            goto LABEL_36;
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
LABEL_36:

    v45 = [v31 application];
    v46 = [v45 info];
    int v47 = [v46 isBlockedForScreenTimeExpiration];

    if (v47)
    {

      id v31 = 0;
    }
    v48 = [v17 removalContextForEntity:v31];

    if (v48)
    {

      id v31 = 0;
    }
    if ([v10 isCrossingDisplays])
    {

      id v31 = 0;
    }

    if (v31)
    {
      v49 = [v31 application];
      v50 = [v49 processState];
      uint64_t v51 = [v50 pid];

      v52 = [v31 sceneHandle];
      v53 = [v52 persistenceIdentifier];

      uint64_t v54 = [v19 tetheringModeForScenePersistenceIdentifier:v53 pipContentType:0];
      int64_t v55 = v54;
      BOOL v56 = (unint64_t)(v62 - 1) >= 3 && v54 == 1;
      BOOL v16 = !v56;
      if (!v56)
      {
        if (a6) {
          *a6 = +[SBAutoPIPWorkspaceTransaction transitionStyleForProcessIdentifier:entityToPIP:withTransitionContext:request:reason:]((uint64_t)a1, v51, v31, v17, v10, v62);
        }
        if (a4) {
          *a4 = v31;
        }
      }
      if (v60) {
        int64_t *v60 = v55;
      }
      v57 = SBLogPIP();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        id v74 = v10;
        __int16 v75 = 1024;
        BOOL v76 = v16;
        __int16 v77 = 2048;
        int64_t v78 = v55;
        __int16 v79 = 2048;
        int64_t v80 = v62;
        _os_log_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_DEFAULT, "[ShouldAutoPiP] Request(%p) shouldStart: %{BOOL}u; tetheringMode: %ld; reason:%li",
          buf,
          0x26u);
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  v58 = SBLogPIP();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v74 = v10;
    __int16 v75 = 1024;
    BOOL v76 = v16;
    _os_log_impl(&dword_1D85BA000, v58, OS_LOG_TYPE_DEFAULT, "[ShouldAutoPiP] For request(%p): %{BOOL}u", buf, 0x12u);
  }

  return v16;
}

+ (uint64_t)_doesPegasusAllowEntityToAutoPIP:(void *)a3 pipCoordinator:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [v5 application];
  v7 = [v6 processState];
  uint64_t v8 = [v7 pid];

  v9 = [v5 sceneHandle];

  id v10 = [v9 persistenceIdentifier];

  uint64_t v11 = [v4 shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:v8 scenePersistenceIdentifier:v10 pipContentType:0];
  return v11;
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:0 tetheringMode:0 transitionStyle:0 reason:0];
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 reason:(int64_t)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:0 tetheringMode:0 transitionStyle:0 reason:a4];
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:a4 tetheringMode:0 transitionStyle:0 reason:0];
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 transitionStyle:(int64_t *)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:0 tetheringMode:0 transitionStyle:a4 reason:0];
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 transitionStyle:(int64_t *)a5
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:a3 foundEntity:a4 tetheringMode:0 transitionStyle:a5 reason:0];
}

+ (uint64_t)transitionStyleForProcessIdentifier:(void *)a3 entityToPIP:(void *)a4 withTransitionContext:(void *)a5 request:(uint64_t)a6 reason:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  self;
  uint64_t v13 = objc_opt_class();
  id v14 = v11;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      char v15 = v14;
    }
    else {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }
  id v16 = v15;

  uint64_t v17 = objc_opt_class();
  id v18 = v14;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  BOOL v21 = +[SBAutoPIPWorkspaceTransaction isSystemGesture:]((uint64_t)SBAutoPIPWorkspaceTransaction, v12);
  v22 = [v16 previousLayoutState];
  uint64_t v23 = [v22 unlockedEnvironmentMode];

  if (a6 == 3)
  {
    uint64_t v24 = 2;
    goto LABEL_26;
  }
  if (SBReduceMotion()) {
    goto LABEL_25;
  }
  if (!v16 || v23 == 2)
  {
    if (!v20) {
      goto LABEL_25;
    }
    int v26 = 0;
    goto LABEL_20;
  }
  int v25 = [v16 animationDisabled];
  if (v20)
  {
    int v26 = v25 ^ 1;
LABEL_20:
    if ([v20 isAnimated] & 1) != 0 || (v26)
    {
      if ((v21 | v26) != 1)
      {
        uint64_t v24 = 1;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
LABEL_25:
    uint64_t v24 = 0;
    goto LABEL_26;
  }
  if (v25) {
    goto LABEL_25;
  }
LABEL_27:
  uint64_t v28 = objc_opt_class();
  id v29 = v10;
  if (v28)
  {
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }
  id v31 = v30;

  v32 = [v31 sceneHandle];
  uint64_t v33 = [v32 persistenceIdentifier];

  BOOL v44 = [v12 source] == 11;
  uint64_t v34 = [v31 objectForActivationSetting:58];

  uint64_t v35 = [v34 integerValue];
  v36 = [v12 workspace];
  v45 = [v36 pipCoordinator];

  v37 = [v45 controllerForType:v35];
  id v38 = [(id)SBApp windowSceneManager];
  uint64_t v39 = v33;
  uint64_t v43 = (void *)v33;
  v40 = [v38 windowSceneForPersistentIdentifier:v33];

  uint64_t v41 = [[SBPIPMorphAnimatorController alloc] initWithTargetProcessIdentifier:a2 scenePersistenceIdentifier:v39 windowScene:v40 direction:0 gestureInitiated:v44 delegate:v37 uuid:0];
  uint64_t v42 = [(SBPIPMorphAnimatorController *)v41 viewMorphAnimator];
  LODWORD(v39) = [v42 preflightCheck];

  if (v39) {
    uint64_t v24 = 3;
  }
  else {
    uint64_t v24 = 0;
  }

LABEL_26:
  return v24;
}

+ (BOOL)isSystemGesture:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_opt_class();
  id v4 = SBSafeCast(v3, v2);

  if (v4) {
    BOOL v5 = [v4 source] == 11;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  return [(SBAutoPIPWorkspaceTransaction *)self initWithTransitionRequest:a3 includeActiveAppEntity:0 reason:0];
}

- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3 includeActiveAppEntity:(BOOL)a4 reason:(int64_t)a5
{
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  uint64_t v8 = [(SBWorkspaceTransaction *)&v25 initWithTransitionRequest:v7];
  v9 = v8;
  if (v8)
  {
    v8->_inferredTransitionStyle = 2;
    id v24 = 0;
    BOOL v10 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v7 foundEntity:&v24 tetheringMode:0 transitionStyle:&v8->_transitionStyle reason:a5];
    id v11 = v24;
    id v12 = v24;
    uint64_t v13 = [v12 application];
    id v14 = [v13 processState];
    v9->_pidToPIP = [v14 pid];

    objc_storeStrong((id *)&v9->_entityToPIP, v11);
    char v15 = [v7 workspace];
    uint64_t v16 = [v15 pipCoordinator];
    pipCoordinator = v9->_pipCoordinator;
    v9->_pipCoordinator = (SBPIPControllerCoordinator *)v16;

    if (v10 && v9->_pidToPIP)
    {
      if ([(SBAutoPIPWorkspaceTransaction *)v9 isAuditHistoryEnabled]) {
        [(SBAutoPIPWorkspaceTransaction *)v9 _addAuditHistoryItem:@"PIPController says to start!"];
      }
      id v18 = [NSString alloc];
      v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      uint64_t v21 = [v18 initWithFormat:@"%@-%p", v20, v9];
      reason = v9->_reason;
      v9->_reason = (NSString *)v21;
    }
    else if ([(SBAutoPIPWorkspaceTransaction *)v9 isAuditHistoryEnabled])
    {
      [(SBAutoPIPWorkspaceTransaction *)v9 _addAuditHistoryItem:@"PIPController is not interested."];
    }
  }
  return v9;
}

- (int64_t)transitionStyle
{
  if (!self) {
    return 0;
  }
  int64_t transitionStyle = self->_transitionStyle;
  if (!transitionStyle) {
    return self->_inferredTransitionStyle;
  }
  return transitionStyle;
}

- (uint64_t)_transitionStyle
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 256);
  if (!v1) {
    return *(void *)(a1 + 216);
  }
  return v1;
}

- (void)_begin
{
  v31.receiver = self;
  v31.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  [(SBAutoPIPWorkspaceTransaction *)&v31 _begin];
  entityToPIP = self->_entityToPIP;
  if (entityToPIP)
  {
    uint64_t v4 = objc_opt_class();
    BOOL v5 = entityToPIP;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [(SBApplicationSceneEntity *)v7 sceneHandle];
    v9 = [v8 persistenceIdentifier];

    BOOL v10 = [(SBWorkspaceEntity *)v7 objectForActivationSetting:58];
    uint64_t v11 = [v10 integerValue];

    int64_t transitionStyle = self->_transitionStyle;
    if (!transitionStyle) {
      int64_t transitionStyle = self->_inferredTransitionStyle;
    }
    uint64_t v13 = [(SBPIPControllerCoordinator *)self->_pipCoordinator controllerForType:v11];
    pipController = self->_pipController;
    self->_pipController = v13;

    [(SBAutoPIPWorkspaceTransaction *)self addMilestone:@"PIPTransition"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke;
    v29[3] = &unk_1E6AFDDB0;
    v29[4] = self;
    id v15 = v9;
    id v30 = v15;
    uint64_t v16 = (void *)MEMORY[0x1D948C7A0](v29);
    uint64_t v17 = (void *)*MEMORY[0x1E4F43630];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_26;
    v25[3] = &unk_1E6AF74C0;
    int64_t v28 = transitionStyle;
    v25[4] = self;
    id v26 = v15;
    id v18 = v16;
    id v27 = v18;
    id v19 = v15;
    [v17 _performBlockAfterCATransactionCommits:v25];
    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    uint64_t v21 = [(SBTransaction *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_3;
    block[3] = &unk_1E6AF5300;
    id v24 = v18;
    id v22 = v18;
    dispatch_after(v20, v21, block);
  }
  else if ([(SBAutoPIPWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    [(SBAutoPIPWorkspaceTransaction *)self _addAuditHistoryItem:@"Nothing to PIP."];
  }
}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 248))
  {
    *(unsigned char *)(v6 + 248) = 1;
    if ([*(id *)(a1 + 32) isWaitingForMilestone:@"PIPTransition"]) {
      [*(id *)(a1 + 32) satisfyMilestone:@"PIPTransition"];
    }
    id v7 = SBLogPIP();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 67109378;
      int v15 = a2;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "PiP did start with success{%{BOOL}u} error{%{public}@}", buf, 0x12u);
    }
    if ((a2 & 1) == 0)
    {
      v9 = [*(id *)(*(void *)(a1 + 32) + 232) pictureInPictureMorphAnimatorControllerForProcessIdentifier:*(unsigned int *)(*(void *)(a1 + 32) + 208) scenePersistenceIdentifier:*(void *)(a1 + 40)];
      BOOL v10 = v9;
      if (v9) {
        [v9 cancel];
      }
      [*(id *)(*(void *)(a1 + 32) + 232) cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:*(unsigned int *)(*(void *)(a1 + 32) + 208) scenePersistenceIdentifier:*(void *)(a1 + 40)];
      uint64_t v11 = NSString;
      id v12 = [*(id *)(*(void *)(a1 + 32) + 264) uniqueIdentifier];
      uint64_t v13 = [v11 stringWithFormat:@"Couldn't start PIP for %@ (pid %d)", v12, *(unsigned int *)(*(void *)(a1 + 32) + 208)];

      [*(id *)(a1 + 32) _failWithReason:@"startingPIPFailed" description:v13 precipitatingError:v5];
    }
  }
}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_26(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = SBLogPIP();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v2 == 1;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "AutoPIP Workspace transaction did begin animated{%{BOOL}u}", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(v4 + 232);
  uint64_t v7 = *(unsigned int *)(v4 + 208);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_27;
  v8[3] = &unk_1E6AF5E48;
  v8[4] = v4;
  id v9 = *(id *)(a1 + 48);
  [v6 startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:v7 scenePersistenceIdentifier:v5 animated:v2 == 1 completionHandler:v8];
}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_2;
  block[3] = &unk_1E6B03F00;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  [(SBPIPController *)self->_pipController setPictureInPictureWindowsHidden:0 forReason:self->_reason];
  v3.receiver = self;
  v3.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  [(SBWorkspaceTransaction *)&v3 _didComplete];
}

- (id)_customizedDescriptionProperties
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_pidToPIP >= 1)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:");
    [v3 setObject:v4 forKey:@"pidToPIP"];
  }
  entityToPIP = self->_entityToPIP;
  if (entityToPIP)
  {
    uint64_t v6 = [(SBWorkspaceEntity *)entityToPIP succinctDescription];
    [v3 setObject:v6 forKey:@"entityToPIP"];
  }
  unint64_t transitionStyle = self->_transitionStyle;
  if (!transitionStyle) {
    unint64_t transitionStyle = self->_inferredTransitionStyle;
  }
  if (transitionStyle > 3) {
    id v8 = 0;
  }
  else {
    id v8 = off_1E6B03F20[transitionStyle];
  }
  [v3 setObject:v8 forKey:@"transitionStyle"];
  return v3;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_unint64_t transitionStyle = a3;
}

- (SBApplicationSceneEntity)entityToPIP
{
  return self->_entityToPIP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityToPIP, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
}

@end