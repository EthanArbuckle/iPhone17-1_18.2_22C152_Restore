@interface _UIEventDeferringManager
+ (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate;
+ (uint64_t)isAnySceneBufferingEvents;
+ (void)setSystemShellBehaviorDelegate:(id)a3;
+ (void)targetOfEventDeferringEnvironmentsDidUpdateForScene:(uint64_t)a1;
- (BOOL)_shouldDisableNewRecord:(void *)a3 outRecreationReasons:;
- (NSString)debugDescription;
- (UIScene)_scene;
- (_BYTE)beginAndEndLocalEventDeferringForToken:(void *)a3 withReason:;
- (_BYTE)beginLocalEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 withReason:;
- (_BYTE)beginRemoteEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 toTarget:(void *)a5 withReason:;
- (_UIEventDeferringBehavior)behavior;
- (_UIEventDeferringManager)initWithScene:(id)a3;
- (_UISceneUIWindowHosting)windowHostingScene;
- (id)_currentLocalOrCompatibilityRecordForEnvironment:(int)a3 forcePreviousHardwareIdentifier:;
- (id)_currentLocalRecordsMatchingEnvironment:(int)a3 forcePreviousHardwareIdentifier:;
- (id)_descriptorForCompatibility:(void *)a3 environment:(uint64_t)a4 deferringToken:;
- (id)_displayHardwareIndentifierAccountingForNotFinalizedChange:(unsigned __int8 *)a1;
- (id)_environmentsForLocalTargetWindowPointer:(uint64_t)a1;
- (id)_localRecordForEnvironment:(id *)a1;
- (id)_localTargetWindowForEnvironment:(int)a3 consultingFallbackIfPermitted:;
- (id)_localTargetWindowPointersUnderObservation;
- (id)_predicateForDescriptor:(uint64_t)a1;
- (id)_remoteDeferringRecordStackForEnvironment:(uint64_t)a1;
- (id)_remoteRecordsInStackMatchingEnvironment:(uint64_t)a3 passingTest:;
- (id)_targetForDescriptor:(uint64_t)a1;
- (id)_topRemoteRecordInStackForEnvironment:(uint64_t)a1;
- (id)_trackedLocalTargetWindowPointerForEnvironment:(uint64_t)a1;
- (id)_trackedLocalTargetWindowPointers;
- (id)_transactionAssertion;
- (id)bufferKeyboardFocusEnvironmentEventsWithReason:(uint64_t)a1;
- (id)currentLocalDeferringTargetWindowMatchingEnvironment:(id)a3 deferringToken:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:(id *)a1;
- (id)internalBehavior;
- (id)localEventDeferringTargetWindowForEnvironment:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceElementCategory;
- (uint64_t)_displayHardwareIndentifierHasNotFinalizedChange;
- (uint64_t)_isRemoteRuleOwningElement:(id)a3 visibleForLocalTargetWindow:;
- (uint64_t)_removeLocalRecordForEnvironment:(uint64_t)result;
- (uint64_t)compareRemoteRuleOwningElement:(uint64_t)a3 toTopElementInEnvironment:;
- (void)_allEnvironments;
- (void)_currentLocalOrCompatibilityRecordMatchingEnvironment:(uint64_t)a3 recordingManagerPointer:(int)a4 forcePreviousHardwareIdentifier:;
- (void)_disableEventDeferringRecordsInEnvironment:(void *)a3 addingRecreationReason:(void *)a4 forReason:;
- (void)_localTargetWindowDidAttachContext:(id)a3;
- (void)_localTargetWindowDidDetachContext:(id)a3;
- (void)_processEventDeferringActions:(uint64_t)a3 actionsCount:(uint64_t)a4 inScope:(void *)a5 forDeferringToken:(void *)a6 environments:(void *)a7 target:(void *)a8 addingRecreationReason:(void *)a9 removingRecreationReason:(void *)a10 forReason:;
- (void)_pushRemoteRecordOnStack:(uint64_t)a3 forEnvironment:;
- (void)_recreateEventDeferringRecordsInEnvironment:(void *)a3 removingRecreationReason:(void *)a4 forReason:;
- (void)_removeRemoteRecord:(uint64_t)a3 forEnvironment:;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_screenUniqueIdDidChange:(id)a3;
- (void)_screenUniqueIdWillChange:(id)a3;
- (void)_setLocalRecord:(uint64_t)a3 forEnvironment:;
- (void)_setScene:(id)a3;
- (void)_setTransactionAssertion:(uint64_t)a1;
- (void)_stopObservingContextForLocalTargetWindowInEnvironment:(uint64_t)a1;
- (void)_targetProvidersByEnvironment;
- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5;
- (void)dealloc;
- (void)endEventDeferringForToken:(id)a3 withReason:;
- (void)eventDeferringManager:(id)a3 didRemoveLocalCompatibilityRecordForDescriptor:(id)a4;
- (void)registerTargetProvider:(uint64_t)a3 forEnvironment:;
- (void)removeEventDeferringRulesIfNeededForDeallocatingWindow:(void *)a1;
- (void)setNeedsRemoteEventDeferringRuleComparisonInEnvironments:(id)a3 forBehaviorDelegate:(id)a4 withReason:(id)a5;
@end

@implementation _UIEventDeferringManager

- (id)_displayHardwareIndentifierAccountingForNotFinalizedChange:(unsigned __int8 *)a1
{
  v2 = (id *)a1;
  if (a1)
  {
    int HasNotFinalized = -[_UIEventDeferringManager _displayHardwareIndentifierHasNotFinalizedChange](a1);
    if (a2 && HasNotFinalized)
    {
      v2 = (id *)v2[7];
    }
    else
    {
      v5 = [v2 windowHostingScene];
      id v6 = (id)[v5 _screen];

      v7 = [v6 displayConfiguration];

      v2 = [v7 hardwareIdentifier];
    }
  }
  return v2;
}

- (uint64_t)_displayHardwareIndentifierHasNotFinalizedChange
{
  v2 = [a1 windowHostingScene];
  id v3 = (id)[v2 _screen];

  v4 = [v3 displayConfiguration];

  int v5 = [v4 isExternal];
  unsigned int v6 = a1[80];
  if ((v6 & 0x10) != 0) {
    return 0;
  }
  else {
    return v5 & (v6 >> 3);
  }
}

- (_UISceneUIWindowHosting)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (_UISceneUIWindowHosting *)WeakRetained;
}

- (id)currentLocalDeferringTargetWindowMatchingEnvironment:(id)a3 deferringToken:
{
  if (a1)
  {
    uint64_t v4 = -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:](a1, a2, 0);
    int v5 = (id *)v4;
    if (v4 && (id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32)), WeakRetained, WeakRetained == a3))
    {
      id v8 = v5[2];
      v9 = v8;
      if (v8) {
        v10 = (void *)*((void *)v8 + 9);
      }
      else {
        v10 = 0;
      }
      id v7 = v10;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (_UIEventDeferringManager)initWithScene:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)_UIEventDeferringManager;
  int v5 = [(_UIEventDeferringManager *)&v45 init];
  if (v5)
  {
    if (([a3 _hostsWindows] & 1) == 0)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, v5, @"_UIEventDeferringManager.m", 1887, @"Invalid parameter not satisfying: %@", @"[scene _hostsWindows]" object file lineNumber description];
    }
    objc_storeWeak((id *)&v5->_scene, a3);
    v5->_currentState = 1;
    uint64_t v6 = _UIEventDeferringBehaviorForManager(v5);
    behavior = v5->_behavior;
    v5->_behavior = (_UIEventDeferringBehavior *)v6;

    atomic_store(0, (unint64_t *)&v5->_bufferingAssertionCount);
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_scene);
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);

    v11 = (objc_class *)objc_opt_class();
    v12 = class_getName(v11);
    id v13 = objc_loadWeakRetained((id *)&v5->_scene);
    int v14 = _UISceneSystemShellManagesKeyboardFocusForScene(v13);

    v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &initWithScene____s_category_0) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      id v17 = objc_loadWeakRetained((id *)&v5->_scene);
      v18 = v5->_behavior;
      *(_DWORD *)buf = 134350338;
      v47 = v5;
      __int16 v48 = 2082;
      v49 = Name;
      __int16 v50 = 2050;
      id v51 = v17;
      __int16 v52 = 2082;
      v53 = v12;
      __int16 v54 = 2050;
      v55 = v18;
      __int16 v56 = 1026;
      int v57 = v14;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Initialized with scene: <%{public}s: %{public}p>; behavior: <%{public}s: %{public}p>; systemShellMa"
        "nagesKeyboardFocus: %{public}d",
        buf,
        0x3Au);
    }
    if ((*(unsigned char *)&v5->_deferringManagerFlags & 2) == 0)
    {
      *(unsigned char *)&v5->_deferringManagerFlags |= 2u;
      v19 = [(_UIEventDeferringManager *)v5 windowHostingScene];
      id v20 = (id)[v19 _screen];

      v21 = [v20 displayConfiguration];

      int v22 = [v21 isExternal];
      v23 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)v5, 0);
      if (v23) {
        int v24 = 0;
      }
      else {
        int v24 = v22;
      }
      if (v24 == 1) {
        *(unsigned char *)&v5->_deferringManagerFlags |= 8u;
      }
    }
    v25 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v5, (uint64_t)v5, (uint64_t)v25);

    v26 = v5->_behavior;
    LODWORD(v25) = [(_UIEventDeferringBehavior *)v26 wantsSystemKeyCommandOverlayRules];

    if (v25)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F4F280], "ui_systemKeyCommandOverlayEnvironment");
      -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v5, (uint64_t)v5, (uint64_t)v27);
    }
    v28 = [(_UIEventDeferringManager *)v5 windowHostingScene];
    id v29 = (id)[v28 _screen];

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v5 selector:sel__screenUniqueIdWillChange_ name:@"_UIScreenUniqueIdWillChangeNotification" object:v29];
    [v30 addObserver:v5 selector:sel__screenUniqueIdDidChange_ name:@"_UIScreenUniqueIdDidChangeNotification" object:v29];

    objc_initWeak((id *)buf, v5);
    v31 = NSString;
    v32 = [(_UIEventDeferringManager *)v5 windowHostingScene];
    v33 = [v32 _sceneIdentifier];
    v34 = [v31 stringWithFormat:@"UIKit - EventDeferringState - %@", v33];

    id v35 = MEMORY[0x1E4F14428];
    v43[1] = (id)MEMORY[0x1E4F143A8];
    v43[2] = (id)3221225472;
    v43[3] = __42___UIEventDeferringManager_initWithScene___block_invoke;
    v43[4] = &unk_1E52DD088;
    objc_copyWeak(&v44, (id *)buf);
    uint64_t v36 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v5->_stateCaptureToken;
    v5->_stateCaptureToken = (BSInvalidatable *)v36;

    id v38 = objc_loadWeakRetained((id *)&v5->_scene);
    LODWORD(v33) = [v38 _isTargetOfKeyboardEventDeferringEnvironment];

    if (v33)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42___UIEventDeferringManager_initWithScene___block_invoke_2;
      block[3] = &unk_1E52DC308;
      objc_copyWeak(v43, (id *)buf);
      v39 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(v43);
    }
    objc_destroyWeak(&v44);

    objc_destroyWeak((id *)buf);
  }
  return v5;
}

- (void)_setScene:(id)a3
{
}

- (id)fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1 && [a1[13] shouldAllowFallbackWindowForEnvironment:a2])
  {
    uint64_t v4 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    int v5 = [a2 isEqual:v4];

    if (v5)
    {
      uint64_t v6 = [a1 windowHostingScene];
      id v7 = objc_msgSend((id)UIApp, "_keyWindowForScreen:", objc_msgSend(v6, "_screen"));
      id v8 = [v7 _windowHostingScene];
      if (v8 == v6) {
        v9 = v7;
      }
      else {
        v9 = 0;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &fallbackLocalDeferringTargetWindowIfPermittedForEnvironment____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v13 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134349570;
        v15 = a1;
        __int16 v16 = 2114;
        id v17 = a2;
        __int16 v18 = 2114;
        id v19 = v10;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning fallback target window: %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)succinctDescription
{
  v2 = [(_UIEventDeferringManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:_NSStringFromUIDeferringState[self->_currentState] withName:@"currentState"];
  id v4 = (id)[v3 appendObject:self->_transactionAssertion withName:@"transactionAssertion"];
  int v5 = -[_UIEventDeferringManager internalBehavior]((id *)&self->super.isa);
  uint64_t v6 = [v5 succinctDescription];
  id v7 = (id)[v3 appendObject:v6 withName:@"behavior"];

  return v3;
}

- (id)_descriptorForCompatibility:(void *)a3 environment:(uint64_t)a4 deferringToken:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a4)
    {
      uint64_t v8 = *(void *)(a4 + 56);
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
      uint64_t v8 = 0;
    }
    v46 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
    __int16 v48 = a3;
    if (v8 == 1)
    {
      id v10 = -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)a1, a3, 0);
      if ([*((id *)a1 + 13) shouldAllowFallbackWindowForEnvironment:a3])
      {
        uint64_t v11 = -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)a3, 0);
        if (!v11
          || ((v12 = (void *)v11, id v13 = *(id *)(v11 + 16), (v14 = v13) == 0)
            ? (v15 = 0)
            : (v15 = (void *)*((void *)v13 + 9)),
              id v16 = v15,
              v14,
              v12,
              !v16))
        {
          id v16 = v10;
        }
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F690);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          __int16 v18 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = v18;
            *(_DWORD *)buf = 134349826;
            id v50 = a1;
            __int16 v51 = 2114;
            __int16 v52 = a3;
            __int16 v53 = 1026;
            int v54 = [v10 _contextId];
            __int16 v55 = 2114;
            __int16 v56 = v10;
            _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning fallback remote predicate window: contextID: 0x%{public}X; %{public}@",
              buf,
              0x26u);
          }
        }
      }
      else
      {
        unint64_t v21 = __UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F688);
        if (*(unsigned char *)v21)
        {
          id v44 = *(NSObject **)(v21 + 8);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_super v45 = v44;
            *(_DWORD *)buf = 134349826;
            id v50 = a1;
            __int16 v51 = 2114;
            __int16 v52 = a3;
            __int16 v53 = 1026;
            int v54 = [v10 _contextId];
            __int16 v55 = 2114;
            __int16 v56 = v10;
            _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning remote predicate window: contextID: 0x%{public}X; %{public}@",
              buf,
              0x26u);
          }
        }
        id v16 = v10;
      }

      int v20 = [v16 _contextId];
    }
    else
    {
      id v16 = 0;
      int v20 = 0;
    }
    char v47 = a2;
    if ((v9 | a2))
    {
      int v22 = 0;
    }
    else
    {
      v23 = [a1 windowHostingScene];
      int v24 = [v23 _FBSScene];
      v25 = [v24 identityToken];
      int v22 = [v25 stringRepresentation];
    }
    if (v8 == 1)
    {
      if (a4) {
        v26 = *(void **)(a4 + 72);
      }
      else {
        v26 = 0;
      }
      id v27 = v26;
      int v28 = [v27 pid];

      if (!v9) {
        goto LABEL_25;
      }
    }
    else
    {
      int v28 = 0;
      if (!v9)
      {
LABEL_25:
        id v29 = -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)a1, v48, 1);
        if (!v29)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:sel__descriptorForCompatibility_environment_deferringToken_, a1, @"_UIEventDeferringManager.m", 2979, @"[%p] [%@] %s: Missing target window for environment", a1, v48, "-[_UIEventDeferringManager _descriptorForCompatibility:environment:deferringToken:]" object file lineNumber description];
        }
        unint64_t v30 = __UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F698);
        if (*(unsigned char *)v30)
        {
          v41 = *(NSObject **)(v30 + 8);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = v41;
            int v43 = [v29 _contextId];
            *(_DWORD *)buf = 134349826;
            id v50 = a1;
            __int16 v51 = 2114;
            __int16 v52 = v48;
            __int16 v53 = 1026;
            int v54 = v43;
            __int16 v55 = 2114;
            __int16 v56 = v29;
            _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Local target window: contextID: 0x%{public}X; %{public}@",
              buf,
              0x26u);
          }
        }
        int v31 = [v29 _contextId];
        v32 = 0;
        goto LABEL_39;
      }
    }
    if (a4) {
      v33 = *(void **)(a4 + 72);
    }
    else {
      v33 = 0;
    }
    id v34 = v33;
    id v35 = [v34 token];

    if ([v35 _isIdentifierOfCAContext])
    {
      int v31 = [v35 _identifierOfCAContext];
    }
    else
    {
      if ([v35 _isString])
      {
        v32 = [v35 _string];
        int v31 = 0;
LABEL_38:

        id v29 = 0;
LABEL_39:
        uint64_t v36 = [_UIEventDeferringDescriptor alloc];
        if (a4) {
          v37 = *(void **)(a4 + 56);
        }
        else {
          v37 = 0;
        }
        id v38 = -[_UIEventDeferringDescriptor _initWithScope:compatibility:environment:displayHardwareIdentifier:predicateSceneIdentityString:predicateWindowPointer:predicateContextID:targetPID:targetSceneIdentityString:targetWindowPointer:targetContextID:](v36, v37, v47, v48, v46, v22, v16, v20, v28, v32, v29, v31);

        goto LABEL_42;
      }
      int v31 = 0;
    }
    v32 = 0;
    goto LABEL_38;
  }
  id v38 = 0;
LABEL_42:
  return v38;
}

- (void)registerTargetProvider:(uint64_t)a3 forEnvironment:
{
  if (a1)
  {
    uint64_t v6 = -[_UIEventDeferringManager _targetProvidersByEnvironment](a1);
    id v7 = [v6 objectForKey:a3];

    if (!v7)
    {
      -[_UIEventDeferringManager _targetProvidersByEnvironment](a1);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [v8 setObject:a2 forKey:a3];
    }
  }
}

- (id)_localTargetWindowForEnvironment:(int)a3 consultingFallbackIfPermitted:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = -[_UIEventDeferringManager _targetProvidersByEnvironment]((void *)a1);
  id v7 = [v6 objectForKey:a2];

  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__targetProviderForEnvironment_, a1, @"_UIEventDeferringManager.m", 2788, @"[%p] [%@] %s: No registered target provider for this environment", a1, a2, "-[_UIEventDeferringManager _targetProviderForEnvironment:]" object file lineNumber description];
  }
  id v8 = [v7 localEventDeferringTargetWindowForEnvironment:a2];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &_localTargetWindowForEnvironment_consultingFallbackIfPermitted____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v12 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      *(_DWORD *)buf = 134350082;
      uint64_t v16 = a1;
      __int16 v17 = 2114;
      __int16 v18 = a2;
      __int16 v19 = 2114;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2050;
      int v22 = v7;
      __int16 v23 = 2114;
      int v24 = v8;
      id v14 = v20;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Target provider: <%{public}@: %{public}p>; returned local target window: %{public}@",
        buf,
        0x34u);
    }
  }
  if (!v8 && a3)
  {
    if ([*(id *)(a1 + 104) shouldAllowFallbackWindowForEnvironment:a2])
    {
      id v8 = -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:]((id *)a1, a2);
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_targetProvidersByEnvironment
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[4];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      int v5 = (void *)v2[4];
      v2[4] = v4;

      id v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)localEventDeferringTargetWindowForEnvironment:(id)a3
{
  if (self)
  {
    id v3 = [(_UIEventDeferringManager *)self windowHostingScene];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    int v5 = v4;
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = -[UIWindowScene _keyWindow](v5);

  return v6;
}

- (id)_currentLocalOrCompatibilityRecordForEnvironment:(int)a3 forcePreviousHardwareIdentifier:
{
  id v3 = (id *)a1;
  if (a1)
  {
    uint64_t v4 = -[_UIEventDeferringManager _currentLocalRecordsMatchingEnvironment:forcePreviousHardwareIdentifier:](a1, a2, a3);
    if ([v3[13] wantsLocalIdealRules])
    {
      int v5 = @"LocalIdealRecord";
    }
    else
    {
      if (![v3[13] wantsLocalCompatibilityRules])
      {
        id v3 = 0;
        goto LABEL_8;
      }
      int v5 = @"LocalCompatibilityRecord";
    }
    id v3 = [v4 objectForKey:v5];
LABEL_8:
  }
  return v3;
}

- (id)_currentLocalRecordsMatchingEnvironment:(int)a3 forcePreviousHardwareIdentifier:
{
  uint64_t v6 = [*(id *)(a1 + 16) objectForKey:a2];
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__35;
  int v24 = __Block_byref_object_dispose__35;
  id v25 = 0;
  if (a3)
  {
    id v7 = *(id *)(a1 + 56);
  }
  else
  {
    -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;
  if (v7) {
    [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v7];
  }
  else {
  BOOL v9 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
  }
  id v10 = _eventDeferringCompatibilityQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100___UIEventDeferringManager__currentLocalRecordsMatchingEnvironment_forcePreviousHardwareIdentifier___block_invoke;
  block[3] = &unk_1E52E1B98;
  __int16 v19 = &v20;
  id v11 = v9;
  id v17 = v11;
  uint64_t v18 = a2;
  dispatch_sync(v10, block);

  if (v6 || v21[5])
  {
    v12 = objc_opt_new();
    id v13 = v12;
    if (v6) {
      [v12 setObject:v6 forKeyedSubscript:@"LocalIdealRecord"];
    }
    uint64_t v14 = v21[5];
    if (v14) {
      [v13 setObject:v14 forKeyedSubscript:@"LocalCompatibilityRecord"];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)internalBehavior
{
  if (a1)
  {
    a1 = (id *)a1[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_trackedLocalTargetWindowPointerForEnvironment:(uint64_t)a1
{
  if (a1)
  {
    id v3 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
    uint64_t v4 = [v3 objectForKey:a2];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_trackedLocalTargetWindowPointers
{
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v3;

    v2 = *(void **)(a1 + 40);
  }
  return v2;
}

- (id)_localTargetWindowPointersUnderObservation
{
  v2 = *(void **)(a1 + 48);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v3;

    v2 = *(void **)(a1 + 48);
  }
  return v2;
}

- (id)_targetForDescriptor:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F368]);
    int v5 = v4;
    if (a2)
    {
      if (*(int *)(a2 + 16) >= 1) {
        objc_msgSend(v4, "setPid:");
      }
      if (*(_DWORD *)(a2 + 20))
      {
        id v6 = *(id *)(a2 + 64);

        if (v6)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:sel__targetForDescriptor_, a1, @"_UIEventDeferringManager.m", 3055, @"[%p] %s: Descriptor should not specify a target contextId and a target scene identity: %@", a1, "-[_UIEventDeferringManager _targetForDescriptor:]", a2 object file lineNumber description];
        }
        if (*(_DWORD *)(a2 + 20))
        {
          id v8 = objc_msgSend(MEMORY[0x1E4F4F290], "tokenForIdentifierOfCAContext:");
          [v5 setToken:v8];
        }
      }
      BOOL v9 = *(void **)(a2 + 64);
    }
    else
    {
      BOOL v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1E4F4F290];
      if (a2) {
        v12 = *(void **)(a2 + 64);
      }
      else {
        v12 = 0;
      }
      id v13 = v12;
      uint64_t v14 = [v11 tokenForString:v13];
      [v5 setToken:v14];
    }
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (BOOL)_shouldDisableNewRecord:(void *)a3 outRecreationReasons:
{
  if (a1)
  {
    if (!a3)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__shouldDisableNewRecord_outRecreationReasons_, a1, @"_UIEventDeferringManager.m", 3068, @"Invalid parameter not satisfying: %@", @"outRecreationReasons" object file lineNumber description];
    }
    id v6 = objc_opt_new();
    if (-[_UIEventDeferringManager _displayHardwareIndentifierHasNotFinalizedChange]((unsigned __int8 *)a1)) {
      [v6 addObject:@"_UIEventDeferringRecreationReasonChangingScreenIdentifier"];
    }
    if (a2)
    {
      id v7 = *(id *)(a2 + 16);
      if (v7 && (uint64_t v8 = v7[3], v7, v8))
      {
        if (v8 != 1)
        {
          id v12 = 0;
          goto LABEL_20;
        }
        id v9 = *(id *)(a2 + 16);
        id v10 = v9;
        if (v9) {
          id v11 = (void *)*((void *)v9 + 7);
        }
        else {
          id v11 = 0;
        }
        uint64_t v8 = 1;
      }
      else
      {
        id v15 = *(id *)(a2 + 16);
        id v10 = v15;
        if (v15)
        {
          uint64_t v8 = 0;
          id v11 = (void *)*((void *)v15 + 9);
        }
        else
        {
          id v11 = 0;
          uint64_t v8 = 0;
        }
      }
    }
    else
    {
      id v11 = 0;
      uint64_t v8 = 0;
      id v10 = 0;
    }
    id v12 = v11;

LABEL_20:
    if (![v12 _contextId]) {
      [v6 addObject:@"_UIEventDeferringRecreationReasonDetachedContext"];
    }
    if (v8 != 1) {
      goto LABEL_37;
    }
    id v16 = *(id *)(a1 + 104);
    if (a2)
    {
      id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a2 + 32));
      uint64_t v18 = WeakRetained;
      if (WeakRetained) {
        uint64_t v19 = WeakRetained[6];
      }
      else {
        uint64_t v19 = 0;
      }
      id v20 = *(id *)(a2 + 16);
      __int16 v21 = v20;
      if (v20)
      {
        uint64_t v22 = (void *)*((void *)v20 + 4);
        goto LABEL_28;
      }
    }
    else
    {
      __int16 v21 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    uint64_t v22 = 0;
LABEL_28:
    id v23 = v22;
    int v24 = [v16 shouldSuppressRemoteRuleForOwningElement:v19 inEnvironment:v23];

    if (v24) {
      [v6 addObject:@"_UIEventDeferringRecreationReasonBehaviorDelegateSuppressed"];
    }
    if (!v12) {
      goto LABEL_37;
    }
    if (a2)
    {
      id v25 = objc_loadWeakRetained((id *)(a2 + 32));
      v26 = v25;
      if (v25)
      {
        id v27 = (void *)*((void *)v25 + 6);
LABEL_34:
        id v28 = v27;

        if ((-[_UIEventDeferringManager _isRemoteRuleOwningElement:visibleForLocalTargetWindow:]((id *)a1, v28, v12) & 1) == 0) {
          [v6 addObject:@"_UIEventDeferringRecreationReasonTopRemoteElementNotVisible"];
        }

LABEL_37:
        *a3 = (id)[v6 copy];
        BOOL v14 = [v6 count] != 0;

        return v14;
      }
    }
    else
    {
      v26 = 0;
    }
    id v27 = 0;
    goto LABEL_34;
  }
  return 0;
}

- (void)_setLocalRecord:(uint64_t)a3 forEnvironment:
{
  if (a1)
  {
    if (!*(void *)(a1 + 96))
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__setLocalRecord_forEnvironment_, a1, @"_UIEventDeferringManager.m", 2385, @"[%p] %s: Invalid state. Saving records without a transaction: %@", a1, "-[_UIEventDeferringManager _setLocalRecord:forEnvironment:]", a1 object file lineNumber description];
    }
    id v11 = [*(id *)(a1 + 16) objectForKey:a3];
    if (v11)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__setLocalRecord_forEnvironment_, a1, @"_UIEventDeferringManager.m", 2389, @"[%p] %s: Invalid to set a new local record when one already exists for the environment: %@", a1, "-[_UIEventDeferringManager _setLocalRecord:forEnvironment:]", a3 object file lineNumber description];
    }
    id v6 = *(void **)(a1 + 16);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v7;

      id v6 = *(void **)(a1 + 16);
    }
    [v6 setObject:a2 forKey:a3];
  }
}

- (id)_localRecordForEnvironment:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)_removeLocalRecordForEnvironment:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!*(void *)(result + 96))
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__removeLocalRecordForEnvironment_, v3, @"_UIEventDeferringManager.m", 2398, @"[%p] %s: Invalid state. Removing records without a transaction: %@", v3, "-[_UIEventDeferringManager _removeLocalRecordForEnvironment:]", v3 object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 16);
    return [v4 removeObjectForKey:a2];
  }
  return result;
}

- (_BYTE)beginAndEndLocalEventDeferringForToken:(void *)a3 withReason:
{
  uint64_t v3 = a1;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a1[80])
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      if (a2) {
        BOOL v14 = *(void **)(a2 + 64);
      }
      else {
        BOOL v14 = 0;
      }
      id v9 = v14;
      uint64_t v3 = (unsigned char *)[v9 countByEnumeratingWithState:&v52 objects:v67 count:16];
      if (v3)
      {
        uint64_t v15 = *(void *)v53;
        do
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(void *)v53 != v15) {
              objc_enumerationMutation(v9);
            }
            if (a2)
            {
              [*(id *)(a2 + 8) removeObject:*(void *)(*((void *)&v52 + 1) + 8 * i)];
              if (!*(unsigned char *)(a2 + 24) && ![*(id *)(a2 + 8) count]) {
                *(unsigned char *)(a2 + 24) = 1;
              }
            }
          }
          uint64_t v3 = (unsigned char *)[v9 countByEnumeratingWithState:&v52 objects:v67 count:16];
        }
        while (v3);
      }
    }
    else
    {
      id v39 = a3;
      if (a2)
      {
        if (*(void *)(a2 + 56))
        {
          id v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:sel_beginAndEndLocalEventDeferringForToken_withReason_, v3, @"_UIEventDeferringManager.m", 3720, @"[%p] %s: Attempting to begin and end local event deferring for a non-local token: %@", v3, "-[_UIEventDeferringManager beginAndEndLocalEventDeferringForToken:withReason:]", a2, v39 object file lineNumber description];
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        int v5 = *(void **)(a2 + 64);
      }
      else
      {
        int v5 = 0;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
      }
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v66 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = 0;
        uint64_t v10 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v49 != v10) {
              objc_enumerationMutation(v6);
            }
            id v12 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            id v13 = -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)v3, v12, 1);

            if (!v13)
            {
              if (!v9) {
                id v9 = (id)objc_opt_new();
              }
              [v9 addObject:v12];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v66 count:16];
        }
        while (v8);
      }
      else
      {
        id v9 = 0;
      }

      id v17 = v39;
      uint64_t v18 = [v17 UTF8String];
      if (v9 && [v9 count])
      {
        uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F710) + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349570;
          uint64_t v58 = v3;
          __int16 v59 = 2114;
          uint64_t v60 = (uint64_t)v9;
          __int16 v61 = 2082;
          uint64_t v62 = v18;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "[%{public}p] Exiting request to begin and end local event deferring as environments are missing local target windows: %{public}@; request reason: %{public}s",
            buf,
            0x20u);
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        if (a2) {
          id v20 = *(void **)(a2 + 64);
        }
        else {
          id v20 = 0;
        }
        id v21 = v20;
        uint64_t v3 = (unsigned char *)[v21 countByEnumeratingWithState:&v44 objects:v65 count:16];
        if (v3)
        {
          uint64_t v22 = *(void *)v45;
          do
          {
            for (k = 0; k != v3; ++k)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v21);
              }
              if (a2)
              {
                [*(id *)(a2 + 8) removeObject:*(void *)(*((void *)&v44 + 1) + 8 * (void)k)];
                if (!*(unsigned char *)(a2 + 24) && ![*(id *)(a2 + 8) count]) {
                  *(unsigned char *)(a2 + 24) = 1;
                }
              }
            }
            uint64_t v3 = (unsigned char *)[v21 countByEnumeratingWithState:&v44 objects:v65 count:16];
          }
          while (v3);
        }
      }
      else
      {
        int v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F718) + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v24;
          if (a2) {
            v26 = *(void **)(a2 + 64);
          }
          else {
            v26 = 0;
          }
          id v27 = v26;
          uint64_t v28 = [v27 count];
          *(_DWORD *)buf = 134349826;
          uint64_t v58 = v3;
          __int16 v59 = 2050;
          uint64_t v60 = a2;
          __int16 v61 = 2048;
          uint64_t v62 = v28;
          __int16 v63 = 2082;
          uint64_t v64 = v18;
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}p] Beginning and ending local event deferring requested for token: %{public}p; environments: %lu; "
            "reason: %{public}s",
            buf,
            0x2Au);
        }
        if (a2)
        {
          id v21 = *(id *)(a2 + 48);
          id v29 = *(void **)(a2 + 64);
        }
        else
        {
          id v21 = 0;
          id v29 = 0;
        }
        id v30 = v29;
        -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:](v3, v30, v21, v17);
        uint64_t v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        if (a2) {
          int v31 = *(void **)(a2 + 64);
        }
        else {
          int v31 = 0;
        }
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v41;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v41 != v35) {
                objc_enumerationMutation(v32);
              }
              if (a2)
              {
                [*(id *)(a2 + 8) removeObject:*(void *)(*((void *)&v40 + 1) + 8 * m)];
                if (!*(unsigned char *)(a2 + 24) && ![*(id *)(a2 + 8) count]) {
                  *(unsigned char *)(a2 + 24) = 1;
                }
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
          }
          while (v34);
        }
      }
    }
  }
  return v3;
}

- (void)setNeedsRemoteEventDeferringRuleComparisonInEnvironments:(id)a3 forBehaviorDelegate:(id)a4 withReason:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_deferringManagerFlags & 1) == 0)
  {
    if ((_UIEventDeferringSystemShellBehaviorIsAllowedForProcess() & 1) == 0)
    {
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEventDeferringManager.m", 3917, @"[%p] %s: System shell behavior is not allowed for this process", self, "-[_UIEventDeferringManager setNeedsRemoteEventDeferringRuleComparisonInEnvironments:forBehaviorDelegate:withReason:]");
    }
    id v10 = +[_UIEventDeferringManager systemShellBehaviorDelegate];

    if (v10 != a4)
    {
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, self, @"_UIEventDeferringManager.m", 3920, @"[%p] %s: Incoming delegate does not match existing delegate: %@", self, "-[_UIEventDeferringManager setNeedsRemoteEventDeferringRuleComparisonInEnvironments:forBehaviorDelegate:withReason:]", a4 object file lineNumber description];
    }
    id v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    id v13 = a5;
    uint64_t v14 = [v13 UTF8String];
    uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason____s_category)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      v37 = self;
      __int16 v38 = 2082;
      id v39 = Name;
      __int16 v40 = 2050;
      id v41 = a4;
      __int16 v42 = 2082;
      uint64_t v43 = v14;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}p] Remote event deferring rule comparison requested by system shell behavior delegate: <%{public}s: %{public}p>; reason: %{public}s",
        buf,
        0x2Au);
    }
    objc_initWeak((id *)buf, self);
    id v16 = [_UIEventDeferringOwnershipToken alloc];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __116___UIEventDeferringManager_setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason___block_invoke;
    v34[3] = &unk_1E52E31C0;
    v34[4] = self;
    id v17 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:endDeferringBlock:](v16, (uint64_t)self, 1, a3, 0, v13, v34);
    uint64_t v18 = (id *)v17;
    if (v17)
    {
      uint64_t v19 = *((void *)v17 + 7);
      id v20 = *((id *)v17 + 8);
      id v21 = v18[9];
      id v22 = v18[10];
    }
    else
    {
      id v21 = 0;
      uint64_t v19 = 0;
      id v20 = 0;
      id v22 = 0;
    }
    id v23 = v22;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)self, setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason__actions, 5, v19, v18, v20, v21, @"_UIEventDeferringRecreationReasonNoLongerTopRemoteRecord", 0, v23);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = a3;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v24);
          }
          if (v18)
          {
            [v18[1] removeObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            if (!*((unsigned char *)v18 + 24) && ![v18[1] count]) {
              *((unsigned char *)v18 + 24) = 1;
            }
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v25);
    }

    objc_destroyWeak((id *)buf);
  }
}

- (_BYTE)beginLocalEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 withReason:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a1 || (a1[80] & 1) != 0)
  {
    uint64_t v18 = 0;
  }
  else
  {
    _UIEventDeferringAssertForInvalidOwningInterfaceElement(a3);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = a2;
    uint64_t v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v13 = -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)a1, v12, 1);
          BOOL v14 = v13 == 0;

          if (v14)
          {
            if (!v8) {
              uint64_t v8 = objc_opt_new();
            }
            [v8 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v9);
    }

    id v15 = a4;
    uint64_t v16 = [v15 UTF8String];
    if (v8 && [v8 count])
    {
      id v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F700) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349570;
        id v39 = a1;
        __int16 v40 = 2114;
        id v41 = v8;
        __int16 v42 = 2082;
        uint64_t v43 = v16;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "[%{public}p] Exiting request to begin local event deferring as environments are missing local target windows: %{public}@; request reason: %{public}s",
          buf,
          0x20u);
      }
      uint64_t v18 = 0;
    }
    else
    {
      objc_initWeak(&location, a1);
      uint64_t v19 = [_UIEventDeferringOwnershipToken alloc];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __104___UIEventDeferringManager_beginLocalEventDeferringInEnvironments_forOwningInterfaceElement_withReason___block_invoke;
      v31[3] = &unk_1E52E3198;
      objc_copyWeak(&v32, &location);
      uint64_t v18 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:endDeferringBlock:](v19, (uint64_t)a3, 0, v7, 0, v15, v31);
      id v20 = *(id *)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F708) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (v18) {
          id v21 = (void *)*((void *)v18 + 8);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;
        uint64_t v23 = [v22 count];
        *(_DWORD *)buf = 134349826;
        id v39 = a1;
        __int16 v40 = 2050;
        id v41 = v18;
        __int16 v42 = 2048;
        uint64_t v43 = v23;
        __int16 v44 = 2082;
        uint64_t v45 = v16;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}p] Begin local event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
          buf,
          0x2Au);
      }
      if (v18)
      {
        uint64_t v24 = *((void *)v18 + 7);
        id v25 = *((id *)v18 + 8);
        id v26 = *((id *)v18 + 9);
        id v27 = (void *)*((void *)v18 + 10);
      }
      else
      {
        id v26 = 0;
        uint64_t v24 = 0;
        id v25 = 0;
        id v27 = 0;
      }
      id v28 = v27;
      -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)a1, beginLocalEventDeferringInEnvironments_forOwningInterfaceElement_withReason__actions, 5, v24, v18, v25, v26, @"_UIEventDeferringRecreationReasonTopRemoteElementNotVisible", 0, v28);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  return v18;
}

- (void)_processEventDeferringActions:(uint64_t)a3 actionsCount:(uint64_t)a4 inScope:(void *)a5 forDeferringToken:(void *)a6 environments:(void *)a7 target:(void *)a8 addingRecreationReason:(void *)a9 removingRecreationReason:(void *)a10 forReason:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v15 = a3;
  if (![a6 count])
  {
    uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3237, @"Invalid parameter not satisfying: %@", @"environments.count > 0" object file lineNumber description];

    uint64_t v15 = a3;
  }
  if (![a10 length])
  {
    __int16 v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3238, @"Invalid parameter not satisfying: %@", @"reason.length > 0" object file lineNumber description];

    uint64_t v15 = a3;
  }
  uint64_t v17 = 0;
  int v18 = 0;
  do
    v18 |= 1 << LODWORD(a2[v17++]);
  while (v15 != v17);
  if ((*(void *)&v18 & 0x28003) != 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");
  }
  if (a5) {
    uint64_t v20 = a5[6];
  }
  else {
    uint64_t v20 = 0;
  }
  BOOL v22 = (v18 & 0x24) == 0x20 || (v18 & 0x480) == 1024;
  BOOL v23 = v20 != a1 && (v18 & 0x84) != 0;
  BOOL v24 = v20 != a1 && v22;
  BOOL v61 = v24;
  BOOL v62 = v23;
  if (a4 && (v18 & 4) != 0)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");
  }
  if (a4 != 1 && (v18 & 0x80) != 0)
  {
    long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

    if (a4) {
      goto LABEL_31;
    }
  }
  else if (a4)
  {
    goto LABEL_31;
  }
  if (a7)
  {
    uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = (void *)a1;
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3287, @"[%p] %s: It is invalid to specify a target when deferring events locally", a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

    goto LABEL_32;
  }
LABEL_31:
  id v25 = (void *)a1;
  if (!a7) {
    goto LABEL_34;
  }
LABEL_32:
  if ((int)[a7 pid] >= 1)
  {
    int v26 = [a7 pid];
    if (v26 != getpid())
    {
LABEL_34:
      if (a8) {
        goto LABEL_35;
      }
      goto LABEL_37;
    }
  }
  __int16 v42 = [MEMORY[0x1E4F28B00] currentHandler];
  id v25 = (void *)a1;
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3288, @"[%p] %s: Remote event deferring cannot be pointed at the originating process", a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

  if (a8)
  {
LABEL_35:
    if (a9)
    {
      uint64_t v60 = [MEMORY[0x1E4F28B00] currentHandler];
      id v25 = (void *)a1;
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3295, @"[%p] %s: Invalid combination of recreation reasons: add: %@; remove: %@",
        a1,
        "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:tar"
        "get:addingRecreationReason:removingRecreationReason:forReason:]",
        a8,
        a9);
    }
  }
LABEL_37:
  id v27 = [v25 windowHostingScene];

  if (!v27)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3298, @"[%p] %s: Invalid %@ object. There is no scene", a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]", objc_opt_class() object file lineNumber description];
  }
  uint64_t v28 = a1;
  id v29 = -[_UIEventDeferringManager _transactionAssertion]((id *)a1);

  if (v29)
  {
    long long v49 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v28 = a1;
    [v49 handleFailureInMethod:sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3301, @"[%p] %s: Invalid state. Processing actions with an existing transaction: %@", a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]", a1 object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke;
  aBlock[3] = &unk_1E52E3170;
  aBlock[9] = a2;
  aBlock[10] = a3;
  aBlock[4] = v28;
  aBlock[5] = a5;
  aBlock[6] = a6;
  aBlock[7] = a7;
  aBlock[8] = a10;
  __int16 v63 = _Block_copy(aBlock);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6A0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long long v50 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      long long v51 = a8;
      long long v52 = (void (*)(void *, __CFString *))v63[2];
      long long v53 = v50;
      v52(v63, @"Processing actions");
      long long v54 = v53;
      long long v55 = a8 = v51;
      __int16 v56 = [v55 build];
      *(_DWORD *)buf = 134349314;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      _os_log_impl(&dword_1853B0000, v54, OS_LOG_TYPE_ERROR, "[%{public}p] State before processing actions:\n%{public}@", buf, 0x16u);
    }
  }
  if ((*(unsigned char *)(a1 + 80) & 0x10) != 0) {
    long long v31 = *(void **)(a1 + 56);
  }
  else {
    long long v31 = 0;
  }
  id v32 = v31;
  uint64_t v81 = 0;
  *(void *)buf = a1;
  *(void *)&buf[8] = a5;
  *(void *)&buf[16] = 0;
  id v78 = a8;
  id v79 = a9;
  id v80 = a10;
  LOBYTE(v81) = v61;
  BYTE1(v81) = v62;
  BYTE2(v81) = (*(unsigned char *)(a1 + 80) & 0x10) != 0;
  id v64 = v32;
  id v82 = v64;
  long long v33 = (uint64_t *)(a1 + 8);
  handleEvent(stateMachineSpec, *(void *)(a1 + 8), 0, (uint64_t)buf, (uint64_t *)(a1 + 8));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v34 = a6;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v68 != v36) {
          objc_enumerationMutation(v34);
        }
        objc_storeStrong((id *)&buf[16], *(id *)(*((void *)&v67 + 1) + 8 * i));
        handleEvent(stateMachineSpec, *v33, 1, (uint64_t)buf, v33);
        __int16 v38 = a2;
        uint64_t v39 = a3;
        do
        {
          uint64_t v40 = *v38++;
          handleEvent(stateMachineSpec, *v33, v40, (uint64_t)buf, v33);
          --v39;
        }
        while (v39);
        handleEvent(stateMachineSpec, *v33, 15, (uint64_t)buf, v33);
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v35);
  }

  handleEvent(stateMachineSpec, *v33, 17, (uint64_t)buf, v33);
  unint64_t v41 = __UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6A8);
  if (*(unsigned char *)v41)
  {
    uint64_t v57 = *(id *)(v41 + 8);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = ((void (*)(void *, __CFString *))v63[2])(v63, @"Processed actions");
      __int16 v59 = [v58 build];
      *(_DWORD *)v72 = 134349314;
      uint64_t v73 = a1;
      __int16 v74 = 2114;
      v75 = v59;
      _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_ERROR, "[%{public}p] State after processing actions:\n%{public}@", v72, 0x16u);
    }
  }
  __destructor_8_s8_s16_s24_s32_s40_s56((uint64_t)buf);
}

- (id)_transactionAssertion
{
  if (a1)
  {
    a1 = (id *)a1[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setTransactionAssertion:(uint64_t)a1
{
  if (a1)
  {
    if (obj && *(void *)(a1 + 96))
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setTransactionAssertion_, a1, @"_UIEventDeferringManager.m", 2123, @"[%p] %s: Invalid to set a transaction assertion with one already present", a1, "-[_UIEventDeferringManager _setTransactionAssertion:]");
    }
    objc_storeStrong((id *)(a1 + 96), obj);
  }
}

- (id)_topRemoteRecordInStackForEnvironment:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a2);
    if ([v2 count])
    {
      uint64_t v3 = [v2 lastObject];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_remoteDeferringRecordStackForEnvironment:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      id v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    id v7 = [v4 objectForKey:a2];
    if (!v7)
    {
      id v7 = objc_opt_new();
      [*(id *)(a1 + 24) setObject:v7 forKey:a2];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return (_UIEventDeferringSystemShellBehaviorDelegate *)(id)qword_1EB25F660;
}

- (void)_stopObservingContextForLocalTargetWindowInEnvironment:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [a2 description];
    uint64_t v5 = [v4 UTF8String];

    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &_stopObservingContextForLocalTargetWindowInEnvironment____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v12 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        uint64_t v20 = a1;
        __int16 v21 = 2082;
        uint64_t v22 = v5;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] Stop observing context for local target window", buf, 0x16u);
      }
    }
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __83___UIEventDeferringManager__stopObservingContextForLocalTargetWindowInEnvironment___block_invoke;
    uint64_t v16 = &unk_1E52E30D0;
    uint64_t v17 = a1;
    uint64_t v18 = v5;
    id v7 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:](a1, (uint64_t)a2);
    if (v7)
    {
      uint64_t v8 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
      objc_msgSend(v8, "removeObjectForKey:", a2, v13, v14);

      uint64_t v9 = -[_UIEventDeferringManager _localTargetWindowPointersUnderObservation](a1);
      [v9 removeObject:v7];

      uint64_t v10 = -[_UIEventDeferringManager _localTargetWindowPointersUnderObservation](a1);
      uint64_t v11 = [v10 countForObject:v7];

      if (!v11) {
        v15((uint64_t)&v13, v7);
      }
    }
  }
}

- (id)_predicateForDescriptor:(uint64_t)a1
{
  if (!a1)
  {
    uint64_t v5 = 0;
    goto LABEL_30;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F358]);
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = *(id *)(a2 + 32);
    [v5 setEnvironment:v6];

    id v7 = *(id *)(a2 + 40);
    uint64_t v8 = (void *)MEMORY[0x1E4F4F2D0];
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v7];
      goto LABEL_8;
    }
  }
  else
  {
    [v4 setEnvironment:0];
    uint64_t v8 = (void *)MEMORY[0x1E4F4F2D0];
  }
  uint64_t v9 = [v8 builtinDisplay];
  id v7 = 0;
LABEL_8:
  [v5 setDisplay:v9];

  if (a2)
  {
    BOOL v10 = *(void *)(a2 + 24) == 0;
    uint64_t v11 = *(void **)(a2 + 48);
    BOOL v12 = *(void *)(a2 + 56) == 0;
  }
  else
  {
    uint64_t v11 = 0;
    BOOL v12 = 1;
    BOOL v10 = 1;
  }
  id v13 = v11;
  BOOL v14 = v13 == 0;

  if (v12)
  {
    if (a2) {
      uint64_t v15 = *(void **)(a2 + 48);
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;
    BOOL v14 = v16 != 0;
  }
  if (v10)
  {
    if (a2)
    {
      if (*(unsigned char *)(a2 + 8)) {
        BOOL v14 = 0;
      }
      BOOL v17 = *(unsigned char *)(a2 + 8) != 0;
      if (v14) {
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v17 = 0;
      if (v14) {
        goto LABEL_22;
      }
    }
    if (!v17) {
      goto LABEL_33;
    }
  }
  else if (v13)
  {
LABEL_33:
    int v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel__predicateForDescriptor_, a1, @"_UIEventDeferringManager.m", 3034, @"[%p] %s: Invalid descriptor: %@", a1, "-[_UIEventDeferringManager _predicateForDescriptor:]", a2 object file lineNumber description];
  }
LABEL_22:
  if (a2)
  {
    if (*(_DWORD *)(a2 + 12))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F4F290], "tokenForIdentifierOfCAContext:");
      [v5 setToken:v18];
    }
    uint64_t v19 = *(void **)(a2 + 48);
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    __int16 v21 = (void *)MEMORY[0x1E4F4F290];
    if (a2) {
      uint64_t v22 = *(void **)(a2 + 48);
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;
    BOOL v24 = [v21 tokenForString:v23];
    [v5 setToken:v24];
  }
LABEL_30:
  return v5;
}

+ (void)targetOfEventDeferringEnvironmentsDidUpdateForScene:(uint64_t)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = self;
  if ([a2 _isTargetOfKeyboardEventDeferringEnvironment])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = +[UIScene _scenesIncludingInternal:1];
    uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v40)
    {
      uint64_t v3 = 0;
      uint64_t v39 = *(void *)v50;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v50 != v39)
          {
            uint64_t v5 = v4;
            objc_enumerationMutation(obj);
            uint64_t v4 = v5;
          }
          uint64_t v41 = v4;
          id v6 = *(void **)(*((void *)&v49 + 1) + 8 * v4);
          id v7 = [v6 _eventDeferringManager];
          if (v7 && ([v3 containsObject:v7] & 1) == 0)
          {
            if (!v3) {
              uint64_t v3 = objc_opt_new();
            }
            [v3 addObject:v7];
            int v8 = [v7[13] systemShellManagesKeyboardFocus];
            int v9 = _UISceneSystemShellManagesKeyboardFocusForScene(v6);
            int v10 = [v7[13] eligibleForLocalCompatibilityRuleRemoval];
            uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F670) + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v12 = v11;
              id v13 = [v7 windowHostingScene];
              *(_DWORD *)buf = 134350080;
              *(void *)&uint8_t buf[4] = v7;
              *(_WORD *)&buf[12] = 2050;
              *(void *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v56) = v8;
              WORD2(v56) = 1026;
              *(_DWORD *)((char *)&v56 + 6) = v9;
              WORD5(v56) = 1026;
              HIDWORD(v56) = v10;
              _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Scene target of event deferring environments did update: scene: %{public}p; current systemS"
                "hellManagesKeyboardFocus: %{public}d; systemShellManagesKeyboardFocusForScene: %{public}d; eligibleForRe"
                "cordRemoval: %{public}d;",
                buf,
                0x28u);
            }
            if (((v8 | v9 ^ 1) & 1) == 0 && ((v10 ^ 1) & 1) == 0)
            {
              BOOL v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F678) + 8);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134349312;
                *(void *)&uint8_t buf[4] = v37;
                *(_WORD *)&buf[12] = 1026;
                *(_DWORD *)&buf[14] = 1;
                _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] Updating system shell management of keyboard focus to: %{public}d", buf, 0x12u);
              }
              [v7[13] setSystemShellManagesKeyboardFocus:1];
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              -[_UIEventDeferringManager _allEnvironments](v7);
              id v42 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v44 = [v42 countByEnumeratingWithState:&v45 objects:v53 count:16];
              if (v44)
              {
                uint64_t v43 = *(void *)v46;
                do
                {
                  uint64_t v15 = 0;
                  do
                  {
                    if (*(void *)v46 != v43) {
                      objc_enumerationMutation(v42);
                    }
                    id v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
                    BOOL v17 = [NSString stringWithFormat:@"%@: %p: Removing local compatibility record for system shell managing keyboard focus in %@", objc_opt_class(), v7, v16];
                    if (([v7[13] eligibleForLocalCompatibilityRuleRemoval] & 1) == 0)
                    {
                      id v34 = [MEMORY[0x1E4F28B00] currentHandler];
                      uint64_t v35 = [v7 windowHostingScene];
                      [v34 handleFailureInMethod:sel__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason_, v7, @"_UIEventDeferringManager.m", 3456, @"[%p] %s: Invalid to request compatibility record removal on this scene: %@", v7, "-[_UIEventDeferringManager _removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment:withReason:]", v35 object file lineNumber description];
                    }
                    id v18 = [v16 description];
                    uint64_t v19 = [v18 UTF8String];

                    id v20 = v17;
                    uint64_t v21 = [v20 UTF8String];
                    uint64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6D0) + 8);
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)__int16 v59 = 134349570;
                      *(void *)&v59[4] = v7;
                      *(_WORD *)&v59[12] = 2082;
                      *(void *)&v59[14] = v19;
                      *(_WORD *)&v59[22] = 2082;
                      uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t))v21;
                      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Removing all local compatibility event deferring rules for reason: %{public}s", v59, 0x20u);
                    }
                    id v23 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)v7, 1);
                    if (v23) {
                      [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v23];
                    }
                    else {
                    BOOL v24 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
                    }
                    *(void *)__int16 v59 = 0;
                    *(void *)&v59[8] = v59;
                    *(void *)&v59[16] = 0x3032000000;
                    uint64_t v60 = __Block_byref_object_copy__35;
                    BOOL v61 = __Block_byref_object_dispose__35;
                    id v62 = 0;
                    id v25 = _eventDeferringCompatibilityQueue();
                    *(void *)buf = MEMORY[0x1E4F143A8];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __119___UIEventDeferringManager__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason___block_invoke;
                    *(void *)&long long v56 = &unk_1E52E1B98;
                    uint64_t v58 = v59;
                    id v26 = v24;
                    *((void *)&v56 + 1) = v26;
                    uint64_t v57 = v16;
                    dispatch_sync(v25, buf);

                    uint64_t v27 = *(void *)(*(void *)&v59[8] + 40);
                    if (v27)
                    {
                      id WeakRetained = objc_loadWeakRetained((id *)(v27 + 32));
                      id v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
                      long long v30 = v3;
                      if (WeakRetained)
                      {
                        uint64_t v31 = WeakRetained[7];
                        id v32 = (void *)WeakRetained[9];
                      }
                      else
                      {
                        uint64_t v31 = 0;
                        id v32 = 0;
                      }
                      id v33 = v32;
                      -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)v7, (uint64_t *)&_removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason__actions, 2, v31, WeakRetained, v29, v33, 0, 0, v20);
                      uint64_t v3 = v30;
                    }
                    _Block_object_dispose(v59, 8);

                    ++v15;
                  }
                  while (v44 != v15);
                  uint64_t v36 = [v42 countByEnumeratingWithState:&v45 objects:v53 count:16];
                  uint64_t v44 = v36;
                }
                while (v36);
              }
            }
          }

          uint64_t v4 = v41 + 1;
        }
        while (v41 + 1 != v40);
        uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v40);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  [v5 appendString:_NSStringFromUIDeferringState[self->_currentState] withName:@"currentState"];
  id v6 = (id)[v5 appendObject:self->_transactionAssertion withName:@"transactionAssertion"];
  unint64_t v7 = atomic_load((unint64_t *)&self->_bufferingAssertionCount);
  id v8 = (id)[v5 appendInteger:v7 withName:@"bufferingAssertionCount"];
  id v9 = (id)[v5 appendBool:*(unsigned char *)&self->_deferringManagerFlags & 1 withName:@"hasInvalidated"];
  id v10 = (id)[v5 appendBool:(*(unsigned char *)&self->_deferringManagerFlags >> 1) & 1 withName:@"evaluatedInitialExternalScreenDisconnection"];
  id v11 = (id)[v5 appendBool:(*(unsigned char *)&self->_deferringManagerFlags >> 2) & 1 withName:@"processingScreenIdentifierWillChange"];
  id v12 = (id)[v5 appendBool:(*(unsigned char *)&self->_deferringManagerFlags >> 3) & 1 withName:@"processedScreenIdentifierWillChange"];
  id v13 = (id)[v5 appendBool:(*(unsigned char *)&self->_deferringManagerFlags >> 4) & 1 withName:@"processingScreenIdentifierDidChange"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v18[3] = &unk_1E52D9F98;
  id v14 = v5;
  id v19 = v14;
  id v20 = self;
  id v15 = (id)[v14 modifyBody:v18];
  id v16 = v14;

  return v16;
}

- (void)_removeRemoteRecord:(uint64_t)a3 forEnvironment:
{
  if (a1)
  {
    if (!*(void *)(a1 + 96))
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__removeRemoteRecord_forEnvironment_, a1, @"_UIEventDeferringManager.m", 2466, @"[%p] %s: Invalid state. Removing records without a transaction: %@", a1, "-[_UIEventDeferringManager _removeRemoteRecord:forEnvironment:]", a1 object file lineNumber description];
    }
    -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 removeObjectIdenticalTo:a2];
  }
}

- (uint64_t)_isRemoteRuleOwningElement:(id)a3 visibleForLocalTargetWindow:
{
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__isRemoteRuleOwningElement_visibleForLocalTargetWindow_, a1, @"_UIEventDeferringManager.m", 3126, @"Invalid parameter not satisfying: %@", @"remoteRuleElement" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:sel__isRemoteRuleOwningElement_visibleForLocalTargetWindow_, a1, @"_UIEventDeferringManager.m", 3127, @"Invalid parameter not satisfying: %@", @"localTargetWindow" object file lineNumber description];

LABEL_4:
  id v6 = a1[13];
  uint64_t v7 = [a2 interfaceElementCategory];
  if (v7 != 1)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (v7 == 3)
    {
      id v10 = [a2 _existingView];
      id v9 = [v10 window];
    }
    else
    {
      if (v7 != 2)
      {
        BOOL v11 = 0;
        id v9 = 0;
        goto LABEL_16;
      }
      id v9 = a2;
    }
    BOOL v11 = v9 != 0;
    if (v8 == 2 && v9)
    {
      uint64_t v12 = [v6 isRemoteRuleOwningElement:a2 andContainingWindow:v9 visibleComparedToLocalTargetWindow:a3];
      if (v12)
      {
        BOOL v13 = v12 == 1;
LABEL_29:
        BOOL v23 = v13;
        goto LABEL_30;
      }
      BOOL v11 = 1;
    }
LABEL_16:
    uint64_t IsElementOccludedByWindow = _UIEventDeferringBehaviorIsElementOccludedByWindow(a2, a3);
    if (IsElementOccludedByWindow != 1)
    {
      if (IsElementOccludedByWindow)
      {
        if (IsElementOccludedByWindow == -1)
        {
LABEL_19:
          BOOL v23 = 0;
LABEL_30:

          uint64_t v14 = v23;
          goto LABEL_31;
        }
      }
      else if (v8 != 2)
      {
        goto LABEL_28;
      }
      if (v11)
      {
        if (v9 == a3)
        {
          BOOL v23 = 1;
          id v9 = a3;
          goto LABEL_30;
        }
        if (([v6 wantsLocalIdealRules] & 1) != 0
          || ![v6 wantsLocalCompatibilityRules])
        {
          id v16 = [a1 windowHostingScene];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __83___UIEventDeferringManager__isRemoteRuleOwningElement_visibleForLocalTargetWindow___block_invoke;
          v21[3] = &unk_1E52E30F8;
          v21[4] = a3;
          id v9 = v9;
          id v22 = v9;
          id v17 = [v16 _topVisibleWindowPassingTest:v21];

          BOOL v23 = !v17 || v17 != a3;
          goto LABEL_30;
        }
        goto LABEL_19;
      }
    }
LABEL_28:
    BOOL v13 = 1;
    goto LABEL_29;
  }
  uint64_t v14 = 1;
LABEL_31:

  return v14;
}

- (void)_pushRemoteRecordOnStack:(uint64_t)a3 forEnvironment:
{
  if (a1)
  {
    if (!*(void *)(a1 + 96))
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__pushRemoteRecordOnStack_forEnvironment_, a1, @"_UIEventDeferringManager.m", 2460, @"[%p] %s: Invalid state. Saving records without a transaction: %@", a1, "-[_UIEventDeferringManager _pushRemoteRecordOnStack:forEnvironment:]", a1 object file lineNumber description];
    }
    -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:a2];
  }
}

- (void)_sceneWillInvalidate:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(_UIEventDeferringManager *)self windowHostingScene];
  int v6 = [v5 _hasInvalidated];

  if (v6 && (*(unsigned char *)&self->_deferringManagerFlags & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"%@: %p: removing all deferring rules due to scene invalidation: %p", objc_opt_class(), self, a3];
    unint64_t v8 = -[_UIEventDeferringManager _allEnvironments](self);
    objc_initWeak(&location, self);
    id v9 = [_UIEventDeferringOwnershipToken alloc];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103___UIEventDeferringManager__removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason___block_invoke;
    v30[3] = &unk_1E52E3198;
    objc_copyWeak(&v31, &location);
    id v10 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:endDeferringBlock:](v9, (uint64_t)self, 1, v8, 0, v7, v30);
    id v25 = v7;
    uint64_t v11 = [v25 UTF8String];
    uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &_removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v34 = self;
      __int16 v35 = 2082;
      uint64_t v36 = v11;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules for reason: %{public}s", buf, 0x16u);
    }
    if (v10)
    {
      uint64_t v13 = *((void *)v10 + 7);
      id v14 = *((id *)v10 + 8);
      id v15 = (void *)*((void *)v10 + 9);
    }
    else
    {
      id v14 = 0;
      uint64_t v13 = 0;
      id v15 = 0;
    }
    id v16 = v15;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)self, _removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason__actions, 3, v13, v10, v14, v16, 0, 0, v25);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:buf count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v17);
          }
          if (v10)
          {
            [*((id *)v10 + 1) removeObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            if (!v10[24] && ![*((id *)v10 + 1) count]) {
              v10[24] = 1;
            }
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:buf count:16];
      }
      while (v18);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 removeObserver:self];

    id v22 = self->_behavior;
    BOOL v23 = [(_UIEventDeferringBehavior *)v22 systemShellBehaviorDelegate];

    if (v23)
    {
      BOOL v24 = self->_behavior;
      [(_UIEventDeferringBehavior *)v24 setSystemShellBehaviorDelegate:0];
    }
    *(unsigned char *)&self->_deferringManagerFlags |= 1u;
  }
}

- (void)dealloc
{
  v6[4] = *MEMORY[0x1E4F143B8];
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"_UIScreenUniqueIdWillChangeNotification";
  v6[1] = @"_UIScreenUniqueIdDidChangeNotification";
  v6[2] = _UIWindowDidAttachContextNotification;
  v6[3] = _UIWindowDidDetachContextNotification;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIEventDeferringManager;
  [(_UIEventDeferringManager *)&v5 dealloc];
}

+ (void)setSystemShellBehaviorDelegate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((_UIEventDeferringSystemShellBehaviorIsAllowedForProcess() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UIEventDeferringManager.m", 2141, @"%s: A system shell behavior delegate is not allowed for this process", "+[_UIEventDeferringManager setSystemShellBehaviorDelegate:]");
  }
  id v6 = (id)qword_1EB25F660;
  id v7 = v6;
  if (a3 && v6)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UIEventDeferringManager.m", 2144, @"%s: Invalid to set a system shell behavior delegate with one already present", "+[_UIEventDeferringManager setSystemShellBehaviorDelegate:]");
  }
  unint64_t v8 = (objc_class *)objc_opt_class();
  Name = class_getName(v8);
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = class_getName(v10);
  uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", (unint64_t *)algn_1EB25F668) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    long long v28 = Name;
    __int16 v29 = 2082;
    long long v30 = v11;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Setting system shell behavior delegate: existing: %{public}s; new: %{public}s",
      buf,
      0x16u);
  }
  objc_storeStrong((id *)&qword_1EB25F660, a3);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = +[UIScene _scenesIncludingInternal:1];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) _eventDeferringManager];
        if (v19 && ([v16 containsObject:v19] & 1) == 0)
        {
          if (!v16) {
            id v16 = objc_opt_new();
          }
          [v16 addObject:v19];
          [v19[13] setSystemShellBehaviorDelegate:qword_1EB25F660];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }
}

- (void)eventDeferringManager:(id)a3 didRemoveLocalCompatibilityRecordForDescriptor:(id)a4
{
  if (a4) {
    id v6 = (void *)*((void *)a4 + 4);
  }
  else {
    id v6 = 0;
  }
  id v11 = v6;
  id v7 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:]((uint64_t)self, (uint64_t)v11);
  unint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 pointerValue];
    uint64_t v10 = a4 ? *((void *)a4 + 9) : 0;
    if (v9 == v10) {
      -[_UIEventDeferringManager _stopObservingContextForLocalTargetWindowInEnvironment:]((uint64_t)self, v11);
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringManager *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIEventDeferringManager *)self succinctDescriptionBuilder];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIEventDeferringManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (void)_allEnvironments
{
  uint64_t v1 = a1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = -[_UIEventDeferringManager _targetProvidersByEnvironment](v1);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    uint64_t v1 = (void *)[v2 copy];
  }
  return v1;
}

- (void)_currentLocalOrCompatibilityRecordMatchingEnvironment:(uint64_t)a3 recordingManagerPointer:(int)a4 forcePreviousHardwareIdentifier:
{
  uint64_t v5 = -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:](a1, a2, a4);
  uint64_t v6 = v5;
  if (v5 && v5[5] != a3) {
    uint64_t v5 = 0;
  }
  id v7 = v5;

  return v7;
}

- (id)_remoteRecordsInStackMatchingEnvironment:(uint64_t)a3 passingTest:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a3 + 16))(a3, v10, &v12))
      {
        if (!v7) {
          id v7 = objc_opt_new();
        }
        [v7 addObject:v10];
        if (v12) {
          break;
        }
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_environmentsForLocalTargetWindowPointer:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v3 objectForKeyedSubscript:v9];
          int v11 = [a2 isEqualToValue:v10];

          if (v11)
          {
            if (!v6) {
              uint64_t v6 = objc_opt_new();
            }
            [v6 addObject:v9];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)_localTargetWindowDidAttachContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a3 object];
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(_UIEventDeferringManager *)self windowHostingScene];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [v6 _windowHostingScene];

      if (v9 == v8)
      {
        uint64_t v10 = [MEMORY[0x1E4F29238] valueWithPointer:v6];
        int v11 = -[_UIEventDeferringManager _environmentsForLocalTargetWindowPointer:]((uint64_t)self, v10);
        if (v11)
        {
          id v20 = v10;
          uint64_t v21 = v8;
          uint64_t v12 = [v6 _contextId];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v19 = v11;
          obuint64_t j = v11;
          uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
                objc_msgSend(NSString, "stringWithFormat:", @"%@: %p: recreating %@: context attached for window: %p; contextID: 0x%X",
                  objc_opt_class(),
                  self,
                  v17,
                  v6,
                uint64_t v18 = v12);
                -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v17, @"_UIEventDeferringRecreationReasonDetachedContext", v18);

                ++v16;
              }
              while (v14 != v16);
              uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
            }
            while (v14);
          }

          uint64_t v10 = v20;
          uint64_t v8 = v21;
          int v11 = v19;
        }
      }
    }
  }
}

- (void)_recreateEventDeferringRecordsInEnvironment:(void *)a3 removingRecreationReason:(void *)a4 forReason:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v8 = [a2 description];
    uint64_t v9 = [v8 UTF8String];

    if (a3)
    {
      _UIEventDeferringShorterRecreationReasonStringForReason(a3);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = @"(nil)";
    }
    int v11 = v10;
    uint64_t v12 = [(__CFString *)v11 UTF8String];
    id v13 = a4;
    uint64_t v14 = [v13 UTF8String];
    uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6B0) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      uint64_t v29 = a1;
      __int16 v30 = 2082;
      uint64_t v31 = v9;
      __int16 v32 = 2082;
      uint64_t v33 = v12;
      __int16 v34 = 2082;
      uint64_t v35 = v14;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Recreation of event deferring records requested: removing recreation reason: %{public}s; for reason: %{public}s",
        buf,
        0x2Au);
    }
    -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:](a1, (uint64_t)a2, a1, (*(unsigned __int8 *)(a1 + 80) >> 4) & 1);
    uint64_t v16 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    if (a3 && v16)
    {
      uint64_t v18 = -[_UIEventDeferringRecord recreationReasons](v16);
      char v19 = [v18 containsObject:a3];

      if ((v19 & 1) == 0)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v21 = -[_UIEventDeferringRecord recreationReasons](v17);
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__recreateEventDeferringRecordsInEnvironment_removingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3379, @"[%p] %s: Invalid state for recreating record. Recreation reason should be present but is not: %@; reasons: %@; record: %@",
          a1,
          "-[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]",
          a3,
          v21,
          v17);
      }
    }
    else if (!v16)
    {
      long long v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6B8) + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        uint64_t v29 = a1;
        __int16 v30 = 2082;
        uint64_t v31 = v9;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] No records. Exiting event deferring records recreation request.", buf, 0x16u);
      }
      goto LABEL_15;
    }
    id WeakRetained = objc_loadWeakRetained(v17 + 4);
    long long v23 = [MEMORY[0x1E4F1CAD0] setWithObject:a2];
    if (WeakRetained)
    {
      uint64_t v24 = WeakRetained[7];
      long long v25 = (void *)WeakRetained[9];
    }
    else
    {
      uint64_t v24 = 0;
      long long v25 = 0;
    }
    id v26 = v25;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, _recreateEventDeferringRecordsInEnvironment_removingRecreationReason_forReason__actions, 3, v24, WeakRetained, v23, v26, 0, a3, v13);

LABEL_15:
  }
}

- (void)_localTargetWindowDidDetachContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a3 object];
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (objc_msgSend(v6, sel_allowsWeakReference)) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [(_UIEventDeferringManager *)self windowHostingScene];
  uint64_t v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = [v8 _windowHostingScene];

    if (v12 == v10)
    {
      id v13 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
      uint64_t v14 = -[_UIEventDeferringManager _environmentsForLocalTargetWindowPointer:]((uint64_t)self, v13);
      if (v14)
      {
        long long v25 = v13;
        id v26 = v10;
        long long v27 = v6;
        uint64_t v15 = [a3 userInfo];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"contextId"];
        uint64_t v17 = [v16 unsignedIntValue];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v24 = v14;
        obuint64_t j = v14;
        uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(obj);
              }
              long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
              objc_msgSend(NSString, "stringWithFormat:", @"%@: %p: disabling %@: context detached for window: %p; contextID: 0x%X",
                objc_opt_class(),
                self,
                v22,
                v8,
              long long v23 = v17);
              -[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]((uint64_t)self, v22, @"_UIEventDeferringRecreationReasonDetachedContext", v23);

              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v19);
        }

        uint64_t v10 = v26;
        uint64_t v6 = v27;
        uint64_t v14 = v24;
        id v13 = v25;
      }
    }
  }
}

- (void)_disableEventDeferringRecordsInEnvironment:(void *)a3 addingRecreationReason:(void *)a4 forReason:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v8 = [a2 description];
    uint64_t v9 = [v8 UTF8String];

    _UIEventDeferringShorterRecreationReasonStringForReason(a3);
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 UTF8String];

    id v12 = a4;
    uint64_t v13 = [v12 UTF8String];
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6C0) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      uint64_t v28 = a1;
      __int16 v29 = 2082;
      uint64_t v30 = v9;
      __int16 v31 = 2082;
      uint64_t v32 = v11;
      __int16 v33 = 2082;
      uint64_t v34 = v13;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Disabling event deferring records requested: adding recreation reason: %{public}s; for"
        " reason: %{public}s",
        buf,
        0x2Au);
    }
    -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:](a1, (uint64_t)a2, a1, 0);
    uint64_t v15 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = -[_UIEventDeferringRecord recreationReasons](v15);
      int v18 = [v17 containsObject:a3];

      if (v18)
      {
        long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
        id v26 = -[_UIEventDeferringRecord recreationReasons](v16);
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__disableEventDeferringRecordsInEnvironment_addingRecreationReason_forReason_, a1, @"_UIEventDeferringManager.m", 3424, @"[%p] %s: Invalid state for disabling. Recreation reason should not be present but is: %@; reasons: %@; record: %@",
          a1,
          "-[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]",
          a3,
          v26,
          v16);
      }
      id WeakRetained = objc_loadWeakRetained(v16 + 4);
      uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithObject:a2];
      if (WeakRetained)
      {
        uint64_t v21 = WeakRetained[7];
        long long v22 = (void *)WeakRetained[9];
      }
      else
      {
        uint64_t v21 = 0;
        long long v22 = 0;
      }
      id v23 = v22;
      -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, _disableEventDeferringRecordsInEnvironment_addingRecreationReason_forReason__actions, 3, v21, WeakRetained, v20, v23, a3, 0, v12);
    }
    else
    {
      uint64_t v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6C8) + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        uint64_t v28 = a1;
        __int16 v29 = 2082;
        uint64_t v30 = v9;
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] No records. Exiting event deferring records disable request.", buf, 0x16u);
      }
    }
  }
}

- (void)_screenUniqueIdWillChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a3 object];
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(_UIEventDeferringManager *)self windowHostingScene];
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [v7 _screen];
      id v10 = [v6 displayConfiguration];
      int v11 = [v10 isExternal];

      if ((void *)v9 == v6 && v11 && (*(unsigned char *)&self->_deferringManagerFlags & 8) == 0)
      {
        __int16 v31 = v8;
        __int16 v33 = v6;
        *(unsigned char *)&self->_deferringManagerFlags |= 4u;
        -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)self, 0);
        id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        previousExternalScreenIdentifier = self->_previousExternalScreenIdentifier;
        self->_previousExternalScreenIdentifier = v12;

        uint64_t v14 = (__CFString *)self->_previousExternalScreenIdentifier;
        if (!v14) {
          uint64_t v14 = @"(nil)";
        }
        uint64_t v15 = v14;
        uint64_t v16 = [a3 userInfo];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"_UIScreenNewUniqueIdUserInfoKey"];
        int v18 = (void *)v17;
        if (v17) {
          uint64_t v19 = (__CFString *)v17;
        }
        else {
          uint64_t v19 = @"(nil)";
        }
        uint64_t v20 = v19;

        uint64_t v30 = v15;
        uint64_t v21 = [(__CFString *)v30 UTF8String];
        __int16 v29 = v20;
        uint64_t v22 = [(__CFString *)v29 UTF8String];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        -[_UIEventDeferringManager _allEnvironments](self);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v35 != v25) {
                objc_enumerationMutation(obj);
              }
              long long v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_msgSend(NSString, "stringWithFormat:", @"%@: %p: disabling %@: screen identifier will change for screen: %p; current: %s; new: %s",
                objc_opt_class(),
                self,
                v27,
                v33,
                v21,
              uint64_t v28 = v22);
              -[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]((uint64_t)self, v27, @"_UIEventDeferringRecreationReasonChangingScreenIdentifier", v28);
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v24);
        }

        *(unsigned char *)&self->_deferringManagerFlags = *(unsigned char *)&self->_deferringManagerFlags & 0xF3 | 8;
        uint64_t v6 = v33;
        id v8 = v31;
      }
    }
  }
}

- (void)_screenUniqueIdDidChange:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a3 object];
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = [(_UIEventDeferringManager *)self windowHostingScene];
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = (id)[v7 _screen];
    if (v9 == v6)
    {
      char deferringManagerFlags = (char)self->_deferringManagerFlags;

      if ((deferringManagerFlags & 8) != 0)
      {
        int v11 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)self, 0);
        if (v11)
        {
          uint64_t v24 = v8;
          *(unsigned char *)&self->_deferringManagerFlags |= 0x10u;
          previousExternalScreenIdentifier = (__CFString *)self->_previousExternalScreenIdentifier;
          if (!previousExternalScreenIdentifier) {
            previousExternalScreenIdentifier = @"(nil)";
          }
          uint64_t v22 = previousExternalScreenIdentifier;
          uint64_t v13 = [(__CFString *)v22 UTF8String];
          uint64_t v23 = v11;
          uint64_t v14 = [v11 UTF8String];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          -[_UIEventDeferringManager _allEnvironments](self);
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v27;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * v18);
                objc_msgSend(NSString, "stringWithFormat:", @"%@: %p: recreating %@: screen identifier changed for screen: %p; current: %s; new: %s",
                  objc_opt_class(),
                  self,
                  v19,
                  v6,
                  v13,
                uint64_t v20 = v14);
                -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v19, @"_UIEventDeferringRecreationReasonChangingScreenIdentifier", v20);

                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
            }
            while (v16);
          }

          *(unsigned char *)&self->_deferringManagerFlags &= 0xE3u;
          uint64_t v21 = self->_previousExternalScreenIdentifier;
          self->_previousExternalScreenIdentifier = 0;

          int v11 = v23;
          id v8 = v24;
        }
      }
    }
    else
    {
    }
  }
}

- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = [(_UIEventDeferringManager *)self windowHostingScene];
  if (v10 == a3)
  {
    int v11 = [(_UIEventDeferringManager *)self windowHostingScene];
    id v12 = (id)[v11 _screen];

    if (v12 == a5)
    {
      if ((*(unsigned char *)&self->_deferringManagerFlags & 8) != 0)
      {
        uint64_t v13 = [a4 displayConfiguration];
        uint64_t v14 = [v13 hardwareIdentifier];
        uint64_t v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = (__CFString *)v14;
        }
        else {
          uint64_t v16 = @"(nil)";
        }
        uint64_t v17 = v16;

        uint64_t v18 = [a5 displayConfiguration];
        uint64_t v19 = [v18 hardwareIdentifier];
        uint64_t v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = (__CFString *)v19;
        }
        else {
          uint64_t v21 = @"(nil)";
        }
        uint64_t v22 = v21;

        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEventDeferringManager.m", 2759, @"Invalid state: window hosting scene moved screens while a screen hardware identifier change is in process: previousExternalScreenIdentifier: %@; oldScreenHardwareIdentifier: %@; newScreenHardwareIdentifier: %@; self: %@",
          self->_previousExternalScreenIdentifier,
          v17,
          v22,
          self);
      }
      id v24 = a4;
      id v25 = a5;
      id v26 = a3;
      long long v27 = (objc_class *)objc_opt_class();
      Name = class_getName(v27);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      -[_UIEventDeferringManager _allEnvironments](self);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(obj);
            }
            __int16 v33 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_msgSend(NSString, "stringWithFormat:", @"%@: %p: recreating %@: window hosting scene moved screens: scene: <%s: %p>; oldScreen: %p; newScreen: %p",
              objc_opt_class(),
              self,
              v33,
              Name,
              v26,
              v24,
            long long v34 = v25);
            -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v33, 0, v34);
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v30);
      }
    }
  }
  else
  {
  }
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

- (void)removeEventDeferringRulesIfNeededForDeallocatingWindow:(void *)a1
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  id v6 = [a2 _windowHostingScene];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = class_getName(v7);

  if (os_variant_has_internal_diagnostics())
  {
    id v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6D8) + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = v62;
      id v64 = [a2 _windowHostingScene];
      *(_DWORD *)buf = 134350082;
      v94 = a1;
      __int16 v95 = 2082;
      uint64_t v96 = (uint64_t)Name;
      __int16 v97 = 2050;
      uint64_t v98 = (uint64_t)a2;
      __int16 v99 = 2082;
      uint64_t v100 = (uint64_t)v8;
      __int16 v101 = 2050;
      v102 = v64;
      _os_log_impl(&dword_1853B0000, v63, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules (if needed) for deallocating window: <%{public}s: %{public}p>; s"
        "cene: <%{public}s: %{public}p>",
        buf,
        0x34u);
    }
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  -[_UIEventDeferringManager _allEnvironments](a1);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v74 = [obj countByEnumeratingWithState:&v87 objects:v107 count:16];
  if (!v74)
  {
    long long v70 = 0;
    v72 = 0;
    goto LABEL_48;
  }
  long long v70 = 0;
  uint64_t v73 = *(void *)v88;
  v72 = 0;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v88 != v73) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v87 + 1) + 8 * v9);
      int v11 = -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:]((uint64_t)a1, (uint64_t)v10);
      id v12 = v11;
      if (v11 && (id)[v11 pointerValue] == a2)
      {
        uint64_t v13 = v70;
        if (!v70) {
          uint64_t v13 = objc_opt_new();
        }
        long long v70 = v13;
        [v13 addObject:v10];
      }
      -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)v10, (uint64_t)a1, 0);
      uint64_t v14 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)v10, 0);
      if (os_variant_has_internal_diagnostics())
      {
        id v26 = [v10 description];
        uint64_t v27 = [v26 UTF8String];

        if (v15)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v15 + 32));
          uint64_t v29 = WeakRetained;
          if (WeakRetained)
          {
            uint64_t v30 = (void *)*((void *)WeakRetained + 10);
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v29 = 0;
        }
        uint64_t v30 = 0;
LABEL_36:
        id v31 = v30;
        uint64_t v69 = [v31 UTF8String];

        uint64_t v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6E0) + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v33 = v32;
          if (v15) {
            long long v34 = *(void **)(v15 + 40);
          }
          else {
            long long v34 = 0;
          }
          uint64_t v35 = [v12 pointerValue];
          *(_DWORD *)buf = 134350594;
          v94 = a1;
          __int16 v95 = 2082;
          uint64_t v96 = v27;
          __int16 v97 = 2050;
          uint64_t v98 = (uint64_t)v14;
          __int16 v99 = 2050;
          uint64_t v100 = v15;
          __int16 v101 = 2050;
          v102 = v34;
          __int16 v103 = 2082;
          uint64_t v104 = v69;
          __int16 v105 = 2050;
          uint64_t v106 = v35;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Record matching manager: %{public}p; wild card match: %{public}p; wild card match "
            "recording manager: %{public}p; wild card match reason: %{public}s; target window for environment: %{public}p",
            buf,
            0x48u);
        }
      }
      if (v14)
      {
        uint64_t v16 = objc_loadWeakRetained(v14 + 4);
        id v17 = v16 ? (id)v16[6] : 0;
        BOOL v18 = v17 == a2;

        if (v18)
        {
          long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:sel_removeEventDeferringRulesIfNeededForDeallocatingWindow_, a1, @"_UIEventDeferringManager.m", 3525, @"[%p] %s: Bug in event deferring client: owning interface element is deallocating before deferring has ended: %@", a1, "-[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:]", v14 object file lineNumber description];
        }
      }
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke;
      v86[3] = &unk_1E52E3080;
      v86[4] = a2;
      uint64_t v19 = -[_UIEventDeferringManager _remoteRecordsInStackMatchingEnvironment:passingTest:]((uint64_t)a1, (uint64_t)v10, (uint64_t)v86);
      uint64_t v20 = v19;
      if (v19 && [v19 count])
      {
        long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:sel_removeEventDeferringRulesIfNeededForDeallocatingWindow_, a1, @"_UIEventDeferringManager.m", 3532, @"[%p] %s: Bug in event deferring client: owning interface element is deallocating before deferring has ended: %@", a1, "-[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:]", v20 object file lineNumber description];
      }
      if (v14)
      {
        id v21 = v14[2];
        uint64_t v22 = v21;
        if (v21) {
          uint64_t v23 = (void *)*((void *)v21 + 9);
        }
        else {
          uint64_t v23 = 0;
        }
        id v24 = v23;
      }
      else
      {
        id v24 = 0;
      }
      if (v24 == a2)
      {
        id v25 = v72;
        if (!v72) {
          id v25 = objc_opt_new();
        }
        v72 = v25;
        [v25 addObject:v10];
      }

      ++v9;
    }
    while (v74 != v9);
    uint64_t v38 = [obj countByEnumeratingWithState:&v87 objects:v107 count:16];
    uint64_t v74 = v38;
  }
  while (v38);
LABEL_48:

  [v70 minusSet:v72];
  if (os_variant_has_internal_diagnostics())
  {
    v65 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6E8) + 8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      uint64_t v67 = [v72 count];
      uint64_t v68 = [v70 count];
      *(_DWORD *)buf = 134349568;
      v94 = a1;
      __int16 v95 = 2050;
      uint64_t v96 = v67;
      __int16 v97 = 2050;
      uint64_t v98 = v68;
      _os_log_impl(&dword_1853B0000, v66, OS_LOG_TYPE_DEFAULT, "[%{public}p] Environments to remove for deallocating window: %{public}lu; separate environments to end observati"
        "on for deallocating window: %{public}lu",
        buf,
        0x20u);
    }
  }
  if (v72)
  {
    long long v39 = [NSString stringWithFormat:@"%@: %p: removing deferring rules for deallocating window: %p", objc_opt_class(), a1, a2];
    objc_initWeak(&location, a1);
    uint64_t v40 = [_UIEventDeferringOwnershipToken alloc];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke_516;
    v83[3] = &unk_1E52E3198;
    objc_copyWeak(&v84, &location);
    uint64_t v41 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:endDeferringBlock:](v40, (uint64_t)a1, 0, v72, 0, v39, v83);
    id v42 = *(id *)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6F0) + 8);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [a2 _contextId];
      *(_DWORD *)buf = 134349568;
      v94 = a1;
      __int16 v95 = 2050;
      uint64_t v96 = (uint64_t)a2;
      __int16 v97 = 1026;
      LODWORD(v98) = v43;
      _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules for deallocating window: %{public}p; contextId: 0x%{public}X",
        buf,
        0x1Cu);
    }

    if (v41)
    {
      uint64_t v44 = *((void *)v41 + 7);
      id v45 = *((id *)v41 + 8);
      long long v46 = (void *)*((void *)v41 + 9);
    }
    else
    {
      id v45 = 0;
      uint64_t v44 = 0;
      long long v46 = 0;
    }
    id v47 = v46;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)a1, (uint64_t *)&removeEventDeferringRulesIfNeededForDeallocatingWindow__actions, 2, v44, v41, v45, v47, 0, 0, v39);

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v48 = v72;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v79 objects:v92 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v80 != v50) {
            objc_enumerationMutation(v48);
          }
          if (v41)
          {
            [*((id *)v41 + 1) removeObject:*(void *)(*((void *)&v79 + 1) + 8 * i)];
            if (!v41[24] && ![*((id *)v41 + 1) count]) {
              v41[24] = 1;
            }
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v79 objects:v92 count:16];
      }
      while (v49);
    }

    objc_destroyWeak(&v84);
    objc_destroyWeak(&location);
  }
  long long v52 = v70;
  if (v70)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v53 = v70;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v75 objects:v91 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v76;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v76 != v55) {
            objc_enumerationMutation(v53);
          }
          uint64_t v57 = *(void **)(*((void *)&v75 + 1) + 8 * v56);
          id v58 = [v57 description];
          uint64_t v59 = [v58 UTF8String];

          if (os_variant_has_internal_diagnostics())
          {
            uint64_t v60 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F6F8) + 8);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134349570;
              v94 = a1;
              __int16 v95 = 2082;
              uint64_t v96 = v59;
              __int16 v97 = 2050;
              uint64_t v98 = (uint64_t)a2;
              _os_log_impl(&dword_1853B0000, v60, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Ending observation of deallocating window: [%{public}p", buf, 0x20u);
            }
          }
          -[_UIEventDeferringManager _stopObservingContextForLocalTargetWindowInEnvironment:]((uint64_t)a1, v57);
          ++v56;
        }
        while (v54 != v56);
        uint64_t v61 = [v53 countByEnumeratingWithState:&v75 objects:v91 count:16];
        uint64_t v54 = v61;
      }
      while (v61);
    }

    long long v52 = v70;
  }
}

- (void)endEventDeferringForToken:(id)a3 withReason:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v5 = a1;
  if (a2)
  {
    if (*(unsigned char *)(a2 + 24)) {
      return;
    }
    uint64_t v6 = *(void *)(a2 + 56);
    if (v6 == 1)
    {
      id v7 = a3;
      uint64_t v8 = [v7 UTF8String];
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F738) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = *(id *)(a2 + 64);
        *(_DWORD *)buf = 134349826;
        uint64_t v66 = v5;
        __int16 v67 = 2050;
        uint64_t v68 = a2;
        __int16 v69 = 2048;
        uint64_t v70 = [v11 count];
        __int16 v71 = 2082;
        uint64_t v72 = v8;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}p] End remote event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
          buf,
          0x2Au);
      }
      if (!*(unsigned char *)(a2 + 24))
      {
        uint64_t v45 = *(void *)(a2 + 56);
        id v46 = *(id *)(a2 + 64);
        id v47 = *(id *)(a2 + 72);
        -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](v5, endRemoteEventDeferringForToken_withReason__actions, 3, v45, (void *)a2, v46, v47, 0, 0, v7);

        return;
      }
      id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F740) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        uint64_t v66 = v5;
        __int16 v67 = 2050;
        uint64_t v68 = a2;
        uint64_t v13 = buf;
LABEL_21:
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Performing no actions as deferring token has already been invalidated: %{public}p", v13, 0x16u);
        return;
      }
      return;
    }
    if (v6)
    {
      long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:sel_endLocalEventDeferringForToken_withReason_, v5, @"_UIEventDeferringManager.m", 3821, @"[%p] %s: Wrong method for deferring token: %@", v5, "-[_UIEventDeferringManager endLocalEventDeferringForToken:withReason:]", a2 object file lineNumber description];
    }
  }
  id v53 = a3;
  uint64_t v14 = [v53 UTF8String];
  uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F720) + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    if (a2) {
      id v17 = *(void **)(a2 + 64);
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    *(_DWORD *)uint64_t v73 = 134349826;
    uint64_t v74 = v5;
    __int16 v75 = 2050;
    uint64_t v76 = a2;
    __int16 v77 = 2048;
    uint64_t v78 = [v18 count];
    __int16 v79 = 2082;
    uint64_t v80 = v14;
    _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] End local event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
      v73,
      0x2Au);
  }
  if (!a2)
  {
    uint64_t v19 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    goto LABEL_23;
  }
  if (!*(unsigned char *)(a2 + 24))
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v19 = *(void **)(a2 + 64);
LABEL_23:
    obuint64_t j = v19;
    uint64_t v20 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v61;
      uint64_t v23 = @"LocalIdealRecord";
      while (2)
      {
        uint64_t v24 = 0;
        uint64_t v54 = v21;
        do
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(obj);
          }
          id v25 = -[_UIEventDeferringManager _currentLocalRecordsMatchingEnvironment:forcePreviousHardwareIdentifier:](v5, *(void *)(*((void *)&v60 + 1) + 8 * v24), 0);
          if ([v25 count])
          {
            id v26 = (id)objc_opt_new();
            uint64_t v27 = [v25 objectForKeyedSubscript:v23];
            long long v28 = (void *)v27;
            if (v27)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v27 + 32));

              if (WeakRetained == (id)a2) {
                [v26 setObject:v28 forKeyedSubscript:v23];
              }
            }
            uint64_t v30 = [v25 objectForKeyedSubscript:@"LocalCompatibilityRecord"];
            id v31 = (void *)v30;
            if (v30)
            {
              uint64_t v32 = v22;
              uint64_t v33 = v5;
              long long v34 = v23;
              id v35 = objc_loadWeakRetained((id *)(v30 + 32));

              BOOL v36 = v35 == (id)a2;
              uint64_t v23 = v34;
              uint64_t v5 = v33;
              uint64_t v22 = v32;
              uint64_t v21 = v54;
              if (v36) {
                [v26 setObject:v31 forKeyedSubscript:@"LocalCompatibilityRecord"];
              }
            }
          }
          else
          {
            id v26 = v25;
          }

          uint64_t v37 = [v26 count];
          if (v37)
          {

            if (a2)
            {
              uint64_t v48 = *(void *)(a2 + 56);
              id v49 = *(id *)(a2 + 64);
              uint64_t v50 = *(void **)(a2 + 72);
            }
            else
            {
              id v49 = 0;
              uint64_t v48 = 0;
              uint64_t v50 = 0;
            }
            id v51 = v50;
            -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](v5, (uint64_t *)&endLocalEventDeferringForToken_withReason__actions, 2, v48, (void *)a2, v49, v51, 0, 0, v53);

            return;
          }
          ++v24;
        }
        while (v21 != v24);
        uint64_t v21 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    uint64_t v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F730) + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v73 = 134349312;
      uint64_t v74 = v5;
      __int16 v75 = 2050;
      uint64_t v76 = a2;
      _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}p] No existing records found, invalidating token for all environments: %{public}p", v73, 0x16u);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    if (a2) {
      long long v39 = *(void **)(a2 + 64);
    }
    else {
      long long v39 = 0;
    }
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          if (a2)
          {
            [*(id *)(a2 + 8) removeObject:*(void *)(*((void *)&v56 + 1) + 8 * i)];
            if (!*(unsigned char *)(a2 + 24) && ![*(id *)(a2 + 8) count]) {
              *(unsigned char *)(a2 + 24) = 1;
            }
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v42);
    }

    return;
  }
  id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &qword_1EB25F728) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v73 = 134349312;
    uint64_t v74 = v5;
    __int16 v75 = 2050;
    uint64_t v76 = a2;
    uint64_t v13 = v73;
    goto LABEL_21;
  }
}

- (_BYTE)beginRemoteEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 toTarget:(void *)a5 withReason:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1 || (a1[80] & 1) != 0)
  {
    id v11 = 0;
  }
  else
  {
    _UIEventDeferringAssertForInvalidOwningInterfaceElement(a3);
    objc_initWeak(&location, a1);
    id v10 = [_UIEventDeferringOwnershipToken alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __114___UIEventDeferringManager_beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason___block_invoke;
    v23[3] = &unk_1E52E3198;
    objc_copyWeak(&v24, &location);
    id v11 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:endDeferringBlock:](v10, (uint64_t)a3, 1, a2, a4, a5, v23);
    uint64_t v12 = [a5 UTF8String];
    uint64_t v13 = *(id *)(__UILogGetCategoryCachedImpl("EventDeferring", &beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        uint64_t v14 = (void *)*((void *)v11 + 8);
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = [v15 count];
      *(_DWORD *)buf = 134349826;
      uint64_t v27 = a1;
      __int16 v28 = 2050;
      uint64_t v29 = v11;
      __int16 v30 = 2048;
      uint64_t v31 = v16;
      __int16 v32 = 2082;
      uint64_t v33 = v12;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}p] Begin remote event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
        buf,
        0x2Au);
    }
    if (v11)
    {
      uint64_t v17 = *((void *)v11 + 7);
      id v18 = *((id *)v11 + 8);
      id v19 = *((id *)v11 + 9);
      uint64_t v20 = (void *)*((void *)v11 + 10);
    }
    else
    {
      id v19 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      uint64_t v20 = 0;
    }
    id v21 = v20;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)a1, beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason__actions, 5, v17, v11, v18, v19, @"_UIEventDeferringRecreationReasonNoLongerTopRemoteRecord", 0, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (uint64_t)compareRemoteRuleOwningElement:(uint64_t)a3 toTopElementInEnvironment:
{
  if (!a1 || (*(unsigned char *)(a1 + 80) & 1) != 0) {
    return 0;
  }
  uint64_t v6 = -[_UIEventDeferringManager _topRemoteRecordInStackForEnvironment:](a1, a3);
  id v7 = (void *)v6;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 32));
    uint64_t v9 = WeakRetained;
    if (WeakRetained) {
      id v10 = (void *)*((void *)WeakRetained + 6);
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11 == a2) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = [*(id *)(a1 + 104) compareRemoteRuleOwningElement:v11 toElement:a2 inEnvironment:a3];
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

+ (uint64_t)isAnySceneBufferingEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v0 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v1 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v1; ++i)
      {
        if (*(void *)v8 != v2) {
          objc_enumerationMutation(v0);
        }
        uint64_t v4 = [*(id *)(*((void *)&v7 + 1) + 8 * i) _eventDeferringManager];
        if (v4)
        {
          uint64_t v5 = atomic_load(v4 + 9);

          if (v5 > 0)
          {
            uint64_t v1 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v1 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v1) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v1;
}

- (id)bufferKeyboardFocusEnvironmentEventsWithReason:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1
    && (*(unsigned char *)(a1 + 80) & 1) == 0
    && ([(id)a1 _scene],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = _UISceneSystemShellManagesKeyboardFocusForScene(v4),
        v4,
        v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    long long v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);

    id v9 = a2;
    uint64_t v10 = [v9 UTF8String];
    id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventDeferring", &bufferKeyboardFocusEnvironmentEventsWithReason____s_category)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      id v13 = objc_loadWeakRetained((id *)(a1 + 88));
      *(_DWORD *)buf = 134349826;
      uint64_t v34 = a1;
      __int16 v35 = 2082;
      BOOL v36 = Name;
      __int16 v37 = 2050;
      id v38 = v13;
      __int16 v39 = 2082;
      uint64_t v40 = v10;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Buffer events for keyboard focus environment in scene: <%{public}s: %{public}p>; reason: %{public}s",
        buf,
        0x2Au);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    id v15 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
    if (v15) {
      [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v15];
    }
    else {
    uint64_t v17 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    }
    [v14 setDisplay:v17];
    id v18 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [v14 setEnvironment:v18];

    id v19 = [(id)a1 windowHostingScene];
    uint64_t v20 = [v19 _FBSScene];
    id v21 = [v20 identityToken];
    uint64_t v22 = [v21 stringRepresentation];

    uint64_t v23 = [MEMORY[0x1E4F4F290] tokenForString:v22];
    [v14 setToken:v23];

    id v24 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    id v25 = [v24 bufferEventsMatchingPredicate:v14 withReason:v9];

    id v26 = objc_msgSend(NSString, "stringWithFormat:", @"<%p> - Wrapper", v25);
    id v27 = objc_alloc(MEMORY[0x1E4F4F838]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75___UIEventDeferringManager_bufferKeyboardFocusEnvironmentEventsWithReason___block_invoke;
    v30[3] = &unk_1E52E31E8;
    id v31 = v25;
    uint64_t v32 = a1;
    id v28 = v25;
    uint64_t v16 = (void *)[v27 initWithIdentifier:v26 forReason:v9 invalidationBlock:v30];
    atomic_fetch_add((atomic_ullong *volatile)(a1 + 72), 1uLL);
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (_UIEventDeferringBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_transactionAssertion, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_previousExternalScreenIdentifier, 0);
  objc_storeStrong((id *)&self->_localTargetWindowPointersUnderObservation, 0);
  objc_storeStrong((id *)&self->_trackedLocalTargetWindowPointersByEnvironment, 0);
  objc_storeStrong((id *)&self->_targetWindowProvidersByEnvironment, 0);
  objc_storeStrong((id *)&self->_remoteDeferringRecordStacksByEnvironment, 0);
  objc_storeStrong((id *)&self->_localDeferringRecordsByEnvironment, 0);
}

@end