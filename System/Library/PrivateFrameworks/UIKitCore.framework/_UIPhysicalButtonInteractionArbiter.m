@interface _UIPhysicalButtonInteractionArbiter
- (NSString)debugDescription;
- (UIScene)_scene;
- (_UIPhysicalButtonInteractionArbiter)init;
- (_UIPhysicalButtonInteractionArbiter)initWithScene:(id)a3;
- (_UIPhysicalButtonInteractionArbiterSystemShellDelegate)systemShellDelegate;
- (id)_actionRespondersForScene:(id)a3;
- (id)_gestureViewsForWindow:(uint64_t)a3 physicalButton:;
- (id)_mostActiveViewServiceSessionForScene;
- (id)_performConfigurationResolutionForRequiredWindow:(uint64_t)a1;
- (id)_registerPhysicalButtonInteraction:(uint64_t)a1;
- (id)_registerViewServiceObserver:(id *)a1;
- (id)configurationResolutionContextForSystemShellWindow:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)localEventDeferringTargetWindowForEnvironment:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceElementCategory;
- (uint64_t)_configureDeferredResolutionDisplayLinkForScreen:(uint64_t)result;
- (void)_addSystemShellWindowRequiringResolutionIfNeeded:(uint64_t)a1;
- (void)_beginObservingWindowVisibilityChanges;
- (void)_beginTrackingWindow:(uint64_t)a1;
- (void)_createEvaluatedObjectCacheIfNeeded;
- (void)_deferredResolutionDisplayLinkTicked:(id)a3;
- (void)_enumerateAndValidateInteractionsInWindow:(uint64_t)a3 withRequiredBehaviorMask:(uint64_t)a4 configurationAcceptanceEvaluator:(uint64_t)a5 interactionAcceptanceHandler:(uint64_t)a6 shouldStopEvaluator:;
- (void)_handleBSAction:(uint64_t)a1;
- (void)_mostActiveViewServiceSessionDidChange:(id)a3;
- (void)_removeAllSystemShellReferencesForDetachingWindow:(uint64_t)a1;
- (void)_resetWindowLevelObservation;
- (void)_resolveConfigurations;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_scheduleDeferredConfigurationResolution;
- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:(uint64_t)a1;
- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:(unint64_t)a3 forReason:;
- (void)_setResolutionStrategy:(int)a3 forInitialization:;
- (void)_setScene:(id)a3;
- (void)_unregisterAllPhysicalButtonInteractionsForDetachingWindow:(uint64_t)a1;
- (void)_windowHostingScene:(id)a3 willMoveFromScreen:(id)a4 toScreen:(id)a5;
- (void)_windowVisibilityDidChange:(id)a3;
- (void)dealloc;
- (void)setNeedsResolutionOfPhysicalButtonConfigurationsForSystemShellDelegate:(id)a3;
- (void)setSystemShellDelegate:(id)a3;
- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5;
@end

@implementation _UIPhysicalButtonInteractionArbiter

- (id)_actionRespondersForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_setScene:(id)a3
{
}

- (void)_scheduleDeferredConfigurationResolution
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained _screen];
  -[_UIPhysicalButtonInteractionArbiter _configureDeferredResolutionDisplayLinkForScreen:](a1, v3);

  *(unsigned char *)(a1 + 40) |= 2u;
}

- (id)localEventDeferringTargetWindowForEnvironment:(id)a3
{
  v6 = _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(a3);
  v7 = [v6 firstObject];
  uint64_t v8 = [v7 unsignedIntegerValue];
  if (!v7 || (unint64_t)(v8 - 1) >= 5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteractionArbiter.m", 978, @"%s: Invalid state: asked for target window of unknown event deferring environment: %@", "-[_UIPhysicalButtonInteractionArbiter localEventDeferringTargetWindowForEnvironment:]", a3 object file lineNumber description];
  }
  v10 = self->_sceneConfigurationResolutionContext;
  v11 = [(_UIPhysicalButtonConfigurationResolutionContext *)v10 configurations];
  v12 = [(_UIPhysicalButtonConfigurationResolutionContext *)v10 configurationToInteractionMap];

  v13 = _UIPhysicalButtonInteractionArbiterTargetWindowForButton(v11, v12);

  return v13;
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

- (uint64_t)_configureDeferredResolutionDisplayLinkForScreen:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v3 = *(void **)(result + 104);
    if (!v3)
    {
      uint64_t v4 = [a2 displayLinkWithTarget:v2 selector:sel__deferredResolutionDisplayLinkTicked_];
      v5 = *(void **)(v2 + 104);
      *(void *)(v2 + 104) = v4;

      v6 = *(void **)(v2 + 104);
      v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

      v3 = *(void **)(v2 + 104);
    }
    result = [v3 isPaused];
    if (result)
    {
      [*(id *)(v2 + 104) setPaused:0];
      return kdebug_trace();
    }
  }
  return result;
}

- (void)_deferredResolutionDisplayLinkTicked:(id)a3
{
  char arbiterFlags = (char)self->_arbiterFlags;
  *(unsigned char *)&self->_char arbiterFlags = arbiterFlags & 0xF9;
  [(CADisplayLink *)self->_deferredConfigurationResolutionDisplayLink setPaused:1];
  if ((arbiterFlags & 2) == 0) {
    goto LABEL_13;
  }
  registeredAndSortedInteractions = self->_registeredAndSortedInteractions;
  if (registeredAndSortedInteractions)
  {
    int v6 = arbiterFlags & 4;
    if ([(NSMutableOrderedSet *)registeredAndSortedInteractions->_sortedObjects count]) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    if (v7) {
      goto LABEL_13;
    }
  }
  else if ((arbiterFlags & 4) == 0)
  {
    goto LABEL_13;
  }
  uint64_t v8 = [(_UIPhysicalButtonInteractionArbiter *)self _scene];
  if (v8)
  {
    v9 = v8;
    char v10 = [v8 _hasInvalidated];

    kdebug_trace();
    if ((v10 & 1) == 0)
    {
      -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
    }
    return;
  }
LABEL_13:
  kdebug_trace();
}

- (void)_windowVisibilityDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

  if (!WeakRetained)
  {
    int v6 = [a3 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v10 = [a3 object];

      BOOL v7 = v10;
      if (v10)
      {
        id v8 = [v10 _windowHostingScene];
        id v9 = objc_loadWeakRetained((id *)&self->_scene);

        if (v8 == v9) {
          -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)self, v10, 0);
        }
        BOOL v7 = v10;
      }
    }
    else
    {

      BOOL v7 = 0;
    }
  }
}

- (id)_registerPhysicalButtonInteraction:(uint64_t)a1
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a2 view];
    v50 = [v2 _window];

    v3 = [(id)a1 _scene];
    uint64_t v4 = v3;
    if (v3)
    {
      char v5 = [v3 _hasInvalidated];

      if ((v5 & 1) == 0)
      {
        id v6 = [v50 _windowHostingScene];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

        if (v6 == WeakRetained)
        {
          id v8 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
          int v9 = [v8 containsObject:a2];

          if (!v9)
          {
            if (!*(void *)(a1 + 24))
            {
              uint64_t v13 = objc_opt_new();
              v14 = *(void **)(a1 + 24);
              *(void *)(a1 + 24) = v13;
            }
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v15 = [a2 _configurationSet];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v75 count:16];
            if (v16)
            {
              v48 = 0;
              uint64_t v17 = *(void *)v64;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v64 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = [*(id *)(*((void *)&v63 + 1) + 8 * i) _generation];
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v60 = 0u;
                  long long v59 = 0u;
                  id v20 = *(id *)(a1 + 24);
                  uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
                  if (v21)
                  {
                    uint64_t v22 = *(void *)v60;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v21; ++j)
                      {
                        if (*(void *)v60 != v22) {
                          objc_enumerationMutation(v20);
                        }
                        if ([*(id *)(*((void *)&v59 + 1) + 8 * j) unsignedLongLongValue] == v19)
                        {

                          v40 = objc_opt_new();
                          long long v57 = 0u;
                          long long v58 = 0u;
                          long long v55 = 0u;
                          long long v56 = 0u;
                          id v41 = *(id *)(a1 + 24);
                          uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v73 count:16];
                          if (v42)
                          {
                            uint64_t v43 = 0;
                            uint64_t v44 = *(void *)v56;
                            do
                            {
                              for (uint64_t k = 0; k != v42; ++k)
                              {
                                if (*(void *)v56 != v44) {
                                  objc_enumerationMutation(v41);
                                }
                                if (v43 + k) {
                                  v46 = @", ";
                                }
                                else {
                                  v46 = &stru_1ED0E84C0;
                                }
                                [v40 appendFormat:@"%@%llu", v46, objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * k), "unsignedLongLongValue")];
                              }
                              uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v73 count:16];
                              v43 += k;
                            }
                            while (v42);
                          }

                          v47 = [MEMORY[0x1E4F28B00] currentHandler];
                          [v47 handleFailureInMethod:sel__registerPhysicalButtonInteraction_ object:"-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]" file:a2 lineNumber:v40 description:a1];

                          goto LABEL_48;
                        }
                      }
                      uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
                      if (v21) {
                        continue;
                      }
                      break;
                    }
                  }

                  if (!v48) {
                    v48 = objc_opt_new();
                  }
                  v24 = [NSNumber numberWithUnsignedLongLong:v19];
                  [v48 addObject:v24];
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v75 count:16];
              }
              while (v16);

              if (v48)
              {
                [*(id *)(a1 + 24) addObjectsFromArray:v48];
                -[_UIPhysicalButtonInteractionArbiter _beginTrackingWindow:](a1, v50);
                -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:](a1, (uint64_t)v50);
                -[_UIPhysicalButtonInteractionArbiter _createEvaluatedObjectCacheIfNeeded]((id)a1);
                objc_initWeak(&location, (id)a1);
                uint64_t v25 = ++qword_1EB262F90;
                v26 = (objc_class *)objc_opt_class();
                v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%p-%lu", class_getName(v26), a2, v25);
                v28 = NSString;
                id v29 = (id)a1;
                v30 = NSString;
                v31 = (objc_class *)objc_opt_class();
                v32 = NSStringFromClass(v31);
                v33 = [v30 stringWithFormat:@"<%@: %p>", v32, v29];

                v34 = [v28 stringWithFormat:@"Registering interaction with: %@", v33];

                id v35 = objc_alloc(MEMORY[0x1E4F4F838]);
                id v36 = MEMORY[0x1E4F14428];
                v52[0] = MEMORY[0x1E4F143A8];
                v52[1] = 3221225472;
                v52[2] = __74___UIPhysicalButtonInteractionArbiter__registerPhysicalButtonInteraction___block_invoke;
                v52[3] = &unk_1E52F0B18;
                objc_copyWeak(&v53, &location);
                v52[4] = a2;
                v37 = (void *)[v35 initWithIdentifier:v27 forReason:v34 queue:MEMORY[0x1E4F14428] invalidationBlock:v52];

                v38 = *(id *)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_MergedGlobals_1226)+ 8);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = [a2 succinctDescription];
                  *(_DWORD *)buf = 134349570;
                  id v68 = v29;
                  __int16 v69 = 2112;
                  v70 = v39;
                  __int16 v71 = 2112;
                  v72 = v37;
                  _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: registered physical button interaction: %@; with registrationToken: %@",
                    buf,
                    0x20u);
                }
                -[_UIEvaluatedObjectCache addObject:](*(void *)(a1 + 72), (uint64_t)a2);
                -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)v29);
                id v11 = v37;
                objc_destroyWeak(&v53);

                objc_destroyWeak(&location);
                goto LABEL_8;
              }
            }
            else
            {
            }
            v48 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerPhysicalButtonInteraction_, "-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]", a2, a1);
LABEL_48:
            id v11 = 0;

            goto LABEL_8;
          }
          char v10 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerPhysicalButtonInteraction_, "-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]", a2, a1);
        }
      }
    }
    id v11 = 0;
LABEL_8:

    goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:
  return v11;
}

- (void)_resolveConfigurations
{
  uint64_t v280 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  *(unsigned char *)(a1 + 40) &= 0xF9u;
  [*(id *)(a1 + 104) setPaused:1];
  uint64_t v230 = a1;
  uint64_t v2 = [(id)a1 _scene];
  if (!v2 || (v3 = v2, int v4 = [v2 _hasInvalidated], v3, v4))
  {
    *(unsigned char *)(v230 + 40) &= ~0x20u;
    char v5 = *(void **)(v230 + 120);
    [v5 removeAllObjects];
    return;
  }
  char v6 = *(unsigned char *)(v230 + 40);
  if ((v6 & 8) != 0)
  {
    *(unsigned char *)(v230 + 40) = v6 | 0x10;
    return;
  }
  BOOL v7 = *(void **)(v230 + 112);
  v207 = (id *)(v230 + 112);
  *(unsigned char *)(v230 + 40) = v6 | 8;
  id v189 = v7;
  id v8 = [v189 configurations];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F48);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v54 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      uint64_t v275 = v230;
      __int16 v276 = 2112;
      v277 = v8;
      _os_log_impl(&dword_1853B0000, v54, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resolving configurations: current: %@", buf, 0x16u);
    }
  }
  kdebug_trace();
  char v10 = *(unsigned char *)(v230 + 40);
  id v11 = (id *)(v230 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(v230 + 56));
  if (!WeakRetained)
  {
    LODWORD(v14) = 0;
    goto LABEL_49;
  }
  uint64_t v13 = WeakRetained;
  uint64_t v14 = [*(id *)(v230 + 120) count];

  if (!v14) {
    goto LABEL_49;
  }
  char v210 = v10;
  v15 = [*(id *)(v230 + 120) setRepresentation];
  *(unsigned char *)(v230 + 40) &= ~0x20u;
  [*(id *)(v230 + 120) removeAllObjects];
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v245 objects:v256 count:16];
  if (!v16)
  {
    char v214 = 0;
    goto LABEL_48;
  }
  uint64_t v17 = v16;
  char v214 = 0;
  uint64_t v226 = *(void *)v246;
  do
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = v230;
      if (*(void *)v246 != v226) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v245 + 1) + 8 * v18);
      uint64_t v21 = [*(id *)(v230 + 128) objectForKey:v20];
      uint64_t v22 = [v21 configurations];
      unint64_t v23 = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F50);
      if (*(unsigned char *)v23)
      {
        id v36 = *(id *)(v23 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          if (v20)
          {
            v37 = NSString;
            id v38 = v20;
            v39 = (objc_class *)objc_opt_class();
            v40 = NSStringFromClass(v39);
            id v41 = [v37 stringWithFormat:@"<%@: %p>", v40, v38];
          }
          else
          {
            id v41 = @"(nil)";
          }
          *(_DWORD *)buf = 134349570;
          uint64_t v275 = v230;
          __int16 v276 = 2112;
          v277 = v41;
          __int16 v278 = 2112;
          v279 = v22;
          _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: system shell resolving configurations for window: %@; current: %@",
            buf,
            0x20u);

          uint64_t v19 = v230;
        }
      }
      v24 = -[_UIPhysicalButtonInteractionArbiter _performConfigurationResolutionForRequiredWindow:](v19, (uint64_t)v20);
      uint64_t v25 = [v24 configurations];
      v26 = *(void **)(v19 + 128);
      if (!v26)
      {
        uint64_t v27 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:512];
        v28 = *(void **)(v19 + 128);
        *(void *)(v19 + 128) = v27;

        v26 = *(void **)(v19 + 128);
      }
      [v26 setObject:v24 forKey:v20];
      unint64_t v29 = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F58);
      if (*(unsigned char *)v29)
      {
        uint64_t v42 = *(id *)(v29 + 8);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          if (v20)
          {
            uint64_t v43 = NSString;
            v203 = v42;
            id v44 = v20;
            v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            id v200 = (id)objc_claimAutoreleasedReturnValue();
            v46 = [v43 stringWithFormat:@"<%@: %p>", v200, v44];

            uint64_t v42 = v203;
          }
          else
          {
            v46 = @"(nil)";
          }
          *(_DWORD *)buf = 134349570;
          uint64_t v275 = v230;
          __int16 v276 = 2112;
          v277 = v46;
          __int16 v278 = 2112;
          v279 = v25;
          _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: system shell resolving configurations for window: %@; new: %@",
            buf,
            0x20u);
        }
      }
      id v30 = v22;
      id v31 = v25;
      v32 = v31;
      if (v30 == v31)
      {
        v34 = v30;
        id v35 = v30;
        goto LABEL_28;
      }
      if (!v30 || !v31)
      {

LABEL_27:
        id v35 = objc_loadWeakRetained((id *)(v230 + 56));
        v34 = (void *)[v24 copy];
        [v35 physicalButtonInteractionArbiter:v230 resolvedConfigurationsInContext:v34 forWindow:v20];
        char v214 = 1;
LABEL_28:

        goto LABEL_29;
      }
      char v33 = [v30 isEqual:v31];

      if ((v33 & 1) == 0) {
        goto LABEL_27;
      }
LABEL_29:

      ++v18;
    }
    while (v17 != v18);
    uint64_t v47 = [obj countByEnumeratingWithState:&v245 objects:v256 count:16];
    uint64_t v17 = v47;
  }
  while (v47);
LABEL_48:

  LODWORD(v14) = v214 & 1;
  id v11 = (id *)(v230 + 56);
  char v10 = v210;
LABEL_49:
  id v48 = objc_loadWeakRetained(v11);

  if (v48)
  {
    if ((v14 | ((v10 & 0x20) >> 5)) == 1)
    {
      id v49 = objc_loadWeakRetained(v11);
      id v50 = objc_loadWeakRetained((id *)(v230 + 48));
      v51 = [v49 physicalButtonInteractionArbiter:v230 resolutionContextForScene:v50];

      if (v51)
      {
        v52 = (id *)[v51 copy];

        goto LABEL_58;
      }
      long long v55 = [MEMORY[0x1E4F28B00] currentHandler];
      id v56 = objc_loadWeakRetained(v11);
      [v55 handleFailureInMethod:sel__resolveConfigurations, v230, @"_UIPhysicalButtonInteractionArbiter.m", 1412, @"Nil resolution context from system shell delegate: %@", v56 object file lineNumber description];
    }
    v52 = (id *)objc_opt_new();
LABEL_58:
    uint64_t v53 = v230;
  }
  else
  {
    uint64_t v53 = v230;
    -[_UIPhysicalButtonInteractionArbiter _performConfigurationResolutionForRequiredWindow:](v230, 0);
    v52 = (id *)objc_claimAutoreleasedReturnValue();
  }
  v188 = (id *)(v53 + 48);
  id v57 = objc_loadWeakRetained((id *)(v53 + 48));
  long long v58 = v57;
  v206 = v52;
  if (!v52)
  {

    id v93 = 0;
    goto LABEL_211;
  }
  uint64_t v59 = [v52[1] _count];
  if (v59 != [v52[2] count])
  {
    v179 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v272 = *MEMORY[0x1E4F28588];
    id v60 = [NSString stringWithFormat:@"Count of configurations and configurationToInteractionMap do not match"];
    id v273 = v60;
    long long v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v273 forKeys:&v272 count:1];
    id v91 = [v179 errorWithDomain:@"_UIPhysicalButtonConfigurationResolutionErrorDomain" code:0 userInfo:v66];
LABEL_99:

    char v92 = 0;
LABEL_100:

    id v93 = v91;
    if (v92) {
      goto LABEL_101;
    }
LABEL_211:
    long long v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:sel__resolveConfigurations, v230, @"_UIPhysicalButtonInteractionArbiter.m", 1422, @"Invalid resolution context for reason: %@", v93 object file lineNumber description];
    v52 = 0;
    goto LABEL_93;
  }
  if (v59)
  {
    long long v271 = 0u;
    long long v270 = 0u;
    memset(v269, 0, sizeof(v269));
    id v60 = v52[1];
    id obja = (id)[v60 countByEnumeratingWithState:v269 objects:buf count:16];
    if (!obja)
    {
      id v91 = 0;
      char v92 = 1;
      goto LABEL_100;
    }
    v195 = v8;
    id v201 = 0;
    uint64_t v61 = 0;
    long long v62 = **(id ***)&v269[16];
    v211 = v58;
    id v215 = (id)*MEMORY[0x1E4F28588];
    char v197 = 1;
    id v204 = v60;
    id location = **(id ***)&v269[16];
LABEL_64:
    uint64_t v63 = 0;
    while (1)
    {
      if (**(id ***)&v269[16] != v62) {
        objc_enumerationMutation(v60);
      }
      long long v64 = *(void **)(*(void *)&v269[8] + 8 * v63);
      long long v65 = [v52[2] objectForKey:v64];
      if (!v65) {
        break;
      }
      long long v66 = v65;
      uint64_t v227 = v63;
      v67 = [v65 view];
      id v68 = [v67 _window];
      __int16 v69 = [v68 _eventRoutingScene];

      if (v69 != v58)
      {
        v94 = (void *)MEMORY[0x1E4F28C58];
        id v265 = v215;
        v95 = [NSString stringWithFormat:@"Invalid interaction from wrong scene in configurationToInteractionMap: %@", v66];
        v266 = v95;
        v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v266 forKeys:&v265 count:1];
        v97 = [v94 errorWithDomain:@"_UIPhysicalButtonConfigurationResolutionErrorDomain" code:2 userInfo:v96];
        goto LABEL_97;
      }
      if (([v66 _isEnabled] & 1) == 0)
      {
        v98 = (void *)MEMORY[0x1E4F28C58];
        id v263 = v215;
        v95 = [NSString stringWithFormat:@"Invalid disabled interaction in configurationToInteractionMap: %@", v66];
        v264 = v95;
        v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v264 forKeys:&v263 count:1];
        v97 = [v98 errorWithDomain:@"_UIPhysicalButtonConfigurationResolutionErrorDomain" code:3 userInfo:v96];
        __int16 v69 = v58;
LABEL_97:
        id v91 = v97;

LABEL_98:
        id v8 = v195;
        goto LABEL_99;
      }
      unint64_t v70 = [v64 _button];
      uint64_t v71 = 1 << v70;
      if (v70 >= 6) {
        uint64_t v71 = 0;
      }
      if ((v71 & ~v61) != 0)
      {
        unint64_t v72 = v70;
        v61 |= v71;
        v73 = _UIPhysicalButtonRequiredButtonsForButton([v64 _button]);
        long long v249 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        long long v252 = 0u;
        id v74 = v73;
        uint64_t v75 = [v74 countByEnumeratingWithState:&v249 objects:&v259 count:16];
        if (v75)
        {
          uint64_t v76 = v75;
          uint64_t v77 = *(void *)v250;
          while (2)
          {
            for (uint64_t i = 0; i != v76; ++i)
            {
              if (*(void *)v250 != v77) {
                objc_enumerationMutation(v74);
              }
              uint64_t v79 = [*(id *)(*((void *)&v249 + 1) + 8 * i) unsignedIntegerValue];
              if (v79 != v72)
              {
                unint64_t v80 = v79;
                v81 = [v206[1] _configurationForButton:v79];
                uint64_t v82 = [v206[2] objectForKey:v81];
                if (v66 != (void *)v82)
                {
                  v84 = (void *)v82;
                  v85 = (void *)MEMORY[0x1E4F28C58];
                  id v257 = v215;
                  v86 = NSString;
                  v87 = _NSStringFromUIPhysicalButton(v72);
                  v88 = _NSStringFromUIPhysicalButton(v80);
                  objc_msgSend(v86, "stringWithFormat:", @"Configurations for required matching buttons do not have the same interaction: button: %@; requiredMatchingButton: %@",
                    v87,
                  v89 = v88);
                  v258 = v89;
                  v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
                  id v201 = [v85 errorWithDomain:@"_UIPhysicalButtonConfigurationResolutionErrorDomain" code:4 userInfo:v90];

                  char v197 = 0;
                  goto LABEL_87;
                }
                uint64_t v83 = 1 << v80;
                if (v80 >= 6) {
                  uint64_t v83 = 0;
                }
                v61 |= v83;
              }
            }
            uint64_t v76 = [v74 countByEnumeratingWithState:&v249 objects:&v259 count:16];
            if (v76) {
              continue;
            }
            break;
          }
LABEL_87:
          long long v58 = v211;
          id v60 = v204;
        }

        v52 = v206;
        long long v62 = location;
      }

      uint64_t v63 = v227 + 1;
      if ((id)(v227 + 1) == obja)
      {
        id obja = (id)[v60 countByEnumeratingWithState:v269 objects:buf count:16];
        if (obja) {
          goto LABEL_64;
        }
        id v8 = v195;
        id v91 = v201;
        char v92 = v197;
        goto LABEL_100;
      }
    }
    v177 = (void *)MEMORY[0x1E4F28C58];
    id v267 = v215;
    long long v66 = [NSString stringWithFormat:@"No interaction present in configurationToInteractionMap for configuration found in set: %@", v64];
    v268 = v66;
    v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:&v267 count:1];
    id v91 = [v177 errorWithDomain:@"_UIPhysicalButtonConfigurationResolutionErrorDomain" code:1 userInfo:v178];

    goto LABEL_98;
  }
  id v93 = 0;
LABEL_93:

LABEL_101:
  objc_storeStrong(v207, v52);
  v99 = [*v207 configurations];
  unint64_t v100 = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F60);
  if (*(unsigned char *)v100)
  {
    v180 = *(NSObject **)(v100 + 8);
    if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      uint64_t v275 = v230;
      __int16 v276 = 2112;
      v277 = v99;
      _os_log_impl(&dword_1853B0000, v180, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resolving configurations: new: %@", buf, 0x16u);
    }
  }
  v101 = v8;
  v102 = v99;
  v103 = v102;
  v104 = v101;
  v105 = v101;
  if (v101 == v102) {
    goto LABEL_198;
  }
  if (!v101 || !v102)
  {

LABEL_108:
    id v186 = v93;
    v187 = v101;
    v105 = [*v207 configurationToInteractionMap];
    long long v241 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
    id v216 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v228 = [v216 countByEnumeratingWithState:&v241 objects:v255 count:16];
    if (v228)
    {
      id objb = *(id *)v242;
      do
      {
        for (uint64_t j = 0; j != v228; ++j)
        {
          if (*(id *)v242 != objb) {
            objc_enumerationMutation(v216);
          }
          v108 = *(void **)(*((void *)&v241 + 1) + 8 * j);
          v109 = _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(v108);
          long long v237 = 0u;
          long long v238 = 0u;
          long long v239 = 0u;
          long long v240 = 0u;
          uint64_t v110 = [v109 countByEnumeratingWithState:&v237 objects:v254 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            locationa = (id *)v108;
            id v112 = 0;
            uint64_t v113 = *(void *)v238;
            do
            {
              for (uint64_t k = 0; k != v111; ++k)
              {
                if (*(void *)v238 != v113) {
                  objc_enumerationMutation(v109);
                }
                v115 = -[__CFString _configurationForButton:](v103, "_configurationForButton:", [*(id *)(*((void *)&v237 + 1) + 8 * k) unsignedIntegerValue]);
                if (v115)
                {
                  id v116 = [v105 objectForKey:v115];
                  v117 = v116;
                  if (v112)
                  {
                    if (v116 != v112)
                    {
                      v212 = [MEMORY[0x1E4F28B00] currentHandler];
                      objc_msgSend(v212, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveConfigurations, "-[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]", locationa, v230);
                    }
                  }
                  else
                  {
                    id v112 = v116;
                  }
                }
              }
              uint64_t v111 = [v109 countByEnumeratingWithState:&v237 objects:v254 count:16];
            }
            while (v111);
          }
          else
          {
            id v112 = 0;
          }
        }
        uint64_t v228 = [v216 countByEnumeratingWithState:&v241 objects:v255 count:16];
      }
      while (v228);
    }

    id v118 = *v207;
    v119 = [v118 configurations];
    v101 = v187;
    v120 = v187;
    v121 = v119;
    v122 = v121;
    if (v121 == v120)
    {
      v205 = v120;
      id v93 = v186;
    }
    else
    {
      if (v187 && v121)
      {
        char v123 = [(__CFString *)v120 isEqual:v121];

        id v93 = v186;
        if (v123) {
          goto LABEL_183;
        }
      }
      else
      {

        id v93 = v186;
      }
      id v124 = objc_loadWeakRetained(v188);
      uint64_t v125 = [v124 _eventDeferringManager];

      v205 = (unsigned char *)v125;
      if (!v125)
      {
LABEL_182:

LABEL_183:
        uint64_t v165 = v230;
        uint64_t v166 = *(void *)(v230 + 64);
        if (!v166)
        {
          id v167 = objc_loadWeakRetained(v188);
          v235[0] = MEMORY[0x1E4F143A8];
          v235[1] = 3221225472;
          v235[2] = __61___UIPhysicalButtonInteractionArbiter__resolveConfigurations__block_invoke;
          v235[3] = &unk_1E52DAE80;
          v236 = v103;
          [v167 _updateUIClientSettingsWithBlock:v235];

          uint64_t v165 = v230;
          uint64_t v166 = *(void *)(v230 + 64);
        }
        if (v166 != 1) {
          goto LABEL_199;
        }
        v104 = [*(id *)(v165 + 112) configurationToInteractionMap];
        long long v231 = 0u;
        long long v232 = 0u;
        long long v233 = 0u;
        long long v234 = 0u;
        id v168 = *(id *)(v165 + 144);
        uint64_t v169 = [v168 countByEnumeratingWithState:&v231 objects:v253 count:16];
        if (v169)
        {
          uint64_t v170 = v169;
          uint64_t v171 = *(void *)v232;
          do
          {
            uint64_t v172 = 0;
            do
            {
              if (*(void *)v232 != v171) {
                objc_enumerationMutation(v168);
              }
              v173 = *(__CFString **)(*((void *)&v231 + 1) + 8 * v172);
              unint64_t v174 = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F68);
              if (*(unsigned char *)v174)
              {
                objd = *(NSObject **)(v174 + 8);
                if (os_log_type_enabled(objd, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134349314;
                  uint64_t v275 = v230;
                  __int16 v276 = 2112;
                  v277 = v173;
                  _os_log_impl(&dword_1853B0000, objd, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: notifying view service observer of resolving configurations: %@", buf, 0x16u);
                }
              }
              [(__CFString *)v173 _physicalButtonInteractionArbiter:v230 didUpdateResolvedConfigurations:v104 inActiveViewServiceSession:*(void *)(v230 + 136)];
              ++v172;
            }
            while (v170 != v172);
            uint64_t v175 = [v168 countByEnumeratingWithState:&v231 objects:v253 count:16];
            uint64_t v170 = v175;
          }
          while (v175);
        }

        id v93 = v186;
        v101 = v187;
LABEL_198:

LABEL_199:
        goto LABEL_200;
      }
      v192 = v120;
      v209 = v122;
      unint64_t v126 = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F38);
      if (*(unsigned char *)v126)
      {
        v181 = *(NSObject **)(v126 + 8);
        if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v275 = v230;
          _os_log_impl(&dword_1853B0000, v181, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: handling event deferring updates for change in resolved configurations", buf, 0xCu);
        }
      }
      v127 = [MEMORY[0x1E4F4F2A0] sharedInstance];
      v128 = NSString;
      id v129 = (id)v230;
      v130 = (objc_class *)objc_opt_class();
      v131 = NSStringFromClass(v130);
      v132 = [v128 stringWithFormat:@"<%@: %p>", v131, v129];

      v133 = v128;
      v134 = (id *)v129;
      uint64_t v135 = [v133 stringWithFormat:@"%@: updating physical button event deferring rules", v132];

      v184 = (void *)v135;
      v185 = v127;
      v183 = [(__CFString *)v127 transactionAssertionWithReason:v135];
      long long v259 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      long long v262 = 0u;
      _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
      id v202 = (id)objc_claimAutoreleasedReturnValue();
      id v217 = (id)[v202 countByEnumeratingWithState:&v259 objects:buf count:16];
      if (v217)
      {
        uint64_t v213 = *(void *)v260;
        id v196 = v118;
        locationb = (id *)v129;
        do
        {
          for (m = 0; m != v217; m = (char *)m + 1)
          {
            if (*(void *)v260 != v213) {
              objc_enumerationMutation(v202);
            }
            v137 = *(void **)(*((void *)&v259 + 1) + 8 * (void)m);
            v138 = _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(v137);
            v139 = [v138 firstObject];
            v140 = v139;
            if (v139)
            {
              uint64_t v141 = [v139 unsignedIntegerValue];
              v142 = [v134[19] objectForKey:v137];
              if (v142)
              {
                -[_UIEventDeferringManager currentLocalDeferringTargetWindowMatchingEnvironment:deferringToken:]((uint64_t)v205, (uint64_t)v137, v142);
                id objc = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id objc = 0;
              }
              v143 = [v118 configurationToInteractionMap];
              _UIPhysicalButtonInteractionArbiterTargetWindowForButton(v209, v143);
              id v229 = (id)objc_claimAutoreleasedReturnValue();

              if (v142)
              {
                v134 = locationb;
                id v144 = objc;
                if (v142[24]) {
                  BOOL v145 = 0;
                }
                else {
                  BOOL v145 = objc == 0;
                }
                int v146 = v145;
              }
              else
              {
                int v146 = 0;
                v134 = locationb;
                id v144 = objc;
              }
              if (v144 != v229 || v146 != 0)
              {
                v208 = [v134[19] objectForKey:v137];
                if (v208)
                {
                  v198 = [(__CFString *)v192 _configurationForButton:v141];
                  v148 = [NSString stringWithFormat:@"[%p]: end %@ event deferring for generation: %llu", v134, v137, objc_msgSend(v198, "_generation")];
                  v149 = (void (**)(id, id *, void *))v208[2];
                  if (v149)
                  {
                    v149[2](v149, v208, v148);
                    id v150 = v208[2];
                    v208[2] = 0;
                  }
                  v134 = locationb;
                  [locationb[19] removeObjectForKey:v137];

                  id v118 = v196;
                }
                if (v229)
                {
                  v151 = [(__CFString *)v209 _configurationForButton:v141];
                  v152 = NSString;
                  v199 = v151;
                  uint64_t v182 = [v151 _generation];
                  v153 = v152;
                  v134 = locationb;
                  v154 = [v153 stringWithFormat:@"[%p]: begin %@ event deferring for generation: %llu", locationb, v137, v182];
                  v193 = [MEMORY[0x1E4F1CAD0] setWithObject:v137];
                  v194 = v154;
                  v155 = -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:](v205, v193, locationb, v154);
                  if (v155)
                  {
                    id v156 = locationb[19];
                    if (!v156)
                    {
                      uint64_t v157 = objc_opt_new();
                      id v158 = locationb[19];
                      locationb[19] = (id)v157;

                      id v156 = locationb[19];
                    }
                    [v156 setObject:v155 forKey:v137];
                  }
                  else
                  {
                    v159 = *(id *)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", (unint64_t *)&qword_1EB262F40)+ 8);
                    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                    {
                      log = v159;
                      id v160 = v199;
                      if (v160)
                      {
                        v161 = NSString;
                        v162 = (objc_class *)objc_opt_class();
                        v190 = NSStringFromClass(v162);
                        v163 = [v161 stringWithFormat:@"<%@: %p>", v190, v160];
                      }
                      else
                      {
                        v163 = @"(nil)";
                      }

                      *(_DWORD *)v269 = 134349570;
                      *(void *)&v269[4] = v230;
                      *(_WORD *)&v269[12] = 2112;
                      *(void *)&v269[14] = v137;
                      *(_WORD *)&v269[22] = 2112;
                      v164 = v163;
                      *(void *)&v269[24] = v163;
                      v159 = log;
                      _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: failed to begin %@ event deferring for configuration: %@", v269, 0x20u);

                      v134 = locationb;
                    }
                  }
                  id v118 = v196;
                }
              }
            }
          }
          id v217 = (id)[v202 countByEnumeratingWithState:&v259 objects:buf count:16];
        }
        while (v217);
      }

      [v183 invalidate];
      v120 = v185;
      id v93 = v186;
      v101 = v187;
      v122 = v209;
    }

    goto LABEL_182;
  }
  char v106 = [(__CFString *)v101 isEqual:v102];

  if ((v106 & 1) == 0) {
    goto LABEL_108;
  }
LABEL_200:

  char v176 = *(unsigned char *)(v230 + 40);
  *(unsigned char *)(v230 + 40) = v176 & 0xE7;
  if ((v176 & 0x10) != 0)
  {
    -[_UIPhysicalButtonInteractionArbiter _scheduleDeferredConfigurationResolution](v230);
    *(unsigned char *)(v230 + 40) |= 4u;
  }
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2)
    {
      if ([*(id *)(v2 + 24) count])
      {
        v3 = [(id)a1 _scene];
        if (v3)
        {
          int v4 = v3;
          char v5 = [v3 _hasInvalidated];

          if ((v5 & 1) == 0)
          {
            int v6 = *(unsigned char *)(a1 + 40) & 2;
            kdebug_trace();
            if (!v6)
            {
              -[_UIPhysicalButtonInteractionArbiter _scheduleDeferredConfigurationResolution](a1);
            }
          }
        }
      }
    }
  }
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:(unint64_t)a3 forReason:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 72);
      if (v5)
      {
        if ([*(id *)(v5 + 24) count])
        {
          BOOL v7 = [(id)a1 _scene];
          if (v7)
          {
            id v8 = v7;
            char v9 = [v7 _hasInvalidated];

            if ((v9 & 1) == 0 && (a3 != 2 || [*(id *)(a1 + 80) containsObject:a2]))
            {
              id v10 = [a2 _windowHostingScene];
              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

              if (v10 == WeakRetained)
              {
                -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:](a1, (uint64_t)a2);
                -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:](a1);
              }
              else
              {
                v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow_forReason____s_category)+ 8);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                {
                  if (a3 > 4) {
                    uint64_t v13 = &stru_1ED0E84C0;
                  }
                  else {
                    uint64_t v13 = off_1E53066A8[a3];
                  }
                  int v15 = 134349570;
                  uint64_t v16 = a1;
                  __int16 v17 = 2112;
                  uint64_t v18 = a2;
                  __int16 v19 = 2112;
                  id v20 = v13;
                  uint64_t v14 = v12;
                  _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: Invalid state: dropping request to resolve configurations due to invalid window in scene: %@; resolutionReason: %@",
                    (uint8_t *)&v15,
                    0x20u);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_addSystemShellWindowRequiringResolutionIfNeeded:(uint64_t)a1
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 && WeakRetained)
  {
    uint64_t v5 = *(void *)(a2 + 96);

    if ((v5 & 0x1000) == 0)
    {
      int v6 = *(void **)(a1 + 120);
      if (!v6)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:3];
        id v8 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = v7;

        int v6 = *(void **)(a1 + 120);
      }
      [v6 addObject:a2];
    }
  }
  else
  {
  }
}

- (id)_performConfigurationResolutionForRequiredWindow:(uint64_t)a1
{
  int v4 = objc_opt_new();
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__180;
  __int16 v19 = __Block_byref_object_dispose__180;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__180;
  uint64_t v13 = __Block_byref_object_dispose__180;
  id v14 = 0;
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke;
  v8[3] = &unk_1E5306610;
  v8[4] = &v15;
  v6[4] = &v15;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_2;
  v7[3] = &unk_1E53065C0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_3;
  v6[3] = &unk_1E5306638;
  -[_UIPhysicalButtonInteractionArbiter _enumerateAndValidateInteractionsInWindow:withRequiredBehaviorMask:configurationAcceptanceEvaluator:interactionAcceptanceHandler:shouldStopEvaluator:](a1, a2, 0, (uint64_t)v8, (uint64_t)v7, (uint64_t)v6);
  [v4 setConfigurations:v16[5]];
  [v4 setConfigurationToInteractionMap:v10[5]];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v4;
}

- (void)_enumerateAndValidateInteractionsInWindow:(uint64_t)a3 withRequiredBehaviorMask:(uint64_t)a4 configurationAcceptanceEvaluator:(uint64_t)a5 interactionAcceptanceHandler:(uint64_t)a6 shouldStopEvaluator:
{
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6)
  {
    if ([*(id *)(v6 + 24) count])
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__180;
      v26[4] = __Block_byref_object_dispose__180;
      id v27 = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__180;
      v24[4] = __Block_byref_object_dispose__180;
      id v25 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      id v14 = [WeakRetained _coordinateSpace];

      uint64_t v15 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke_2;
      v16[3] = &unk_1E5306598;
      v16[4] = a1;
      v16[5] = a2;
      uint64_t v22 = v24;
      uint64_t v23 = a3;
      v16[6] = v14;
      id v17 = &__block_literal_global_138;
      uint64_t v18 = a4;
      uint64_t v19 = a5;
      uint64_t v20 = a6;
      uint64_t v21 = v26;
      [v15 enumerateObjectsWithOptions:2 usingBlock:v16];

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v26, 8);
    }
  }
}

- (void)_createEvaluatedObjectCacheIfNeeded
{
  if (!*((void *)val + 9))
  {
    objc_initWeak(&location, val);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __74___UIPhysicalButtonInteractionArbiter__createEvaluatedObjectCacheIfNeeded__block_invoke;
    v6[3] = &unk_1E5306550;
    objc_copyWeak(&v7, &location);
    uint64_t v2 = _Block_copy(v6);
    v3 = (void *)*((void *)val + 2);
    *((void *)val + 2) = v2;

    int v4 = -[_UIEvaluatedObjectCache initWithSortComparator:evaluationBlock:]([_UIEvaluatedObjectCache alloc], &__block_literal_global_493, 0);
    uint64_t v5 = (void *)*((void *)val + 9);
    *((void *)val + 9) = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_beginTrackingWindow:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F29238] valueWithPointer:a2];
  uint64_t v5 = *(void **)(a1 + 80);
  if (!v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:2];
    id v7 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v6;

    uint64_t v5 = *(void **)(a1 + 80);
  }
  [v5 addObject:a2];
  id v8 = *(void **)(a1 + 88);
  if (!v8)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v9;

    id v8 = *(void **)(a1 + 88);
  }
  [v8 addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained)
  {
    v12 = *(void **)(a1 + 96);
    if (!v12)
    {
      uint64_t v13 = objc_opt_new();
      id v14 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v13;

      v12 = *(void **)(a1 + 96);
    }
    char v15 = [v12 containsObject:v4];
    [*(id *)(a1 + 96) addObject:v4];
    if ((v15 & 1) == 0)
    {
      [a2 _addWindowLevelChangedObserver:a1];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_beginTrackingWindow____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v17 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          if (a2)
          {
            uint64_t v18 = NSString;
            id v19 = a2;
            uint64_t v20 = (objc_class *)objc_opt_class();
            uint64_t v21 = NSStringFromClass(v20);
            uint64_t v22 = [v18 stringWithFormat:@"<%@: %p>", v21, v19];
          }
          else
          {
            uint64_t v22 = @"(nil)";
          }
          *(_DWORD *)buf = 134349314;
          uint64_t v24 = a1;
          __int16 v25 = 2112;
          v26 = v22;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter began observing window level for window: %@", buf, 0x16u);
        }
      }
    }
  }
}

- (_UIPhysicalButtonInteractionArbiter)initWithScene:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)_UIPhysicalButtonInteractionArbiter;
  int v4 = [(_UIPhysicalButtonInteractionArbiter *)&v31 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_scene, a3);
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &initWithScene____s_category_1);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v24 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (a3)
        {
          __int16 v25 = NSString;
          id v26 = a3;
          uint64_t v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          unint64_t v29 = [v25 stringWithFormat:@"<%@: %p>", v28, v26];
        }
        else
        {
          unint64_t v29 = @"(nil)";
        }
        *(_DWORD *)id location = 134349314;
        *(void *)&location[4] = v5;
        __int16 v37 = 2112;
        id v38 = v29;
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: initializing with scene: %@", location, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
    id v8 = [WeakRetained _FBSScene];
    BOOL v9 = v8 == 0;

    -[_UIPhysicalButtonInteractionArbiter _setResolutionStrategy:forInitialization:]((void *)v5, v9, 1);
    id v10 = objc_loadWeakRetained((id *)(v5 + 48));
    uint64_t v11 = [v10 _eventDeferringManager];

    if (v11 && (*(unsigned char *)(v5 + 40) & 1) == 0)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v12 = _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:location count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v12);
            }
            -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v11, v5, *(void *)(*((void *)&v32 + 1) + 8 * i));
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:location count:16];
        }
        while (v13);
      }

      *(unsigned char *)(v5 + 40) |= 1u;
    }

    objc_initWeak((id *)location, (id)v5);
    uint64_t v16 = NSString;
    id v17 = objc_loadWeakRetained((id *)(v5 + 48));
    uint64_t v18 = [v17 _sceneIdentifier];
    id v19 = [v16 stringWithFormat:@"UIKit - PhysicalButtonInteractionArbiter - %@", v18];

    id v20 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v30, (id *)location);
    uint64_t v21 = BSLogAddStateCaptureBlockWithTitle();
    uint64_t v22 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v21;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  return (_UIPhysicalButtonInteractionArbiter *)v5;
}

- (void)_setResolutionStrategy:(int)a3 forInitialization:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[8];
  if (v3 != a2 || a3 != 0)
  {
    a1[8] = a2;
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (a3) {
      -[_UIPhysicalButtonInteractionArbiter _beginObservingWindowVisibilityChanges]((uint64_t)a1);
    }
    if (v3 == 1)
    {
      [v8 removeObserver:a1 name:@"_UIActiveViewServiceSessionDidChangeNotification" object:0];
      BOOL v9 = (void *)a1[17];
      a1[17] = 0;

      id v10 = (void *)a1[1];
      a1[1] = 0;
    }
    if (a2 == 1)
    {
      [v8 addObserver:a1 selector:sel__mostActiveViewServiceSessionDidChange_ name:@"_UIActiveViewServiceSessionDidChangeNotification" object:0];
      if (!a1[17])
      {
        uint64_t v11 = -[_UIPhysicalButtonInteractionArbiter _mostActiveViewServiceSessionForScene]((uint64_t)a1);
        v12 = (void *)a1[17];
        a1[17] = v11;

        uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_setResolutionStrategy_forInitialization____s_category)+ 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = a1[8];
          char v15 = &stru_1ED0E84C0;
          if (v14 == 1) {
            char v15 = @"viewServices";
          }
          if (v14) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = @"sceneClientSettings";
          }
          id v17 = v16;
          uint64_t v18 = (void *)a1[17];
          id v19 = v13;
          id v20 = [v18 succinctDescription];
          *(_DWORD *)buf = 134349570;
          id v26 = a1;
          __int16 v27 = 2112;
          v28 = v17;
          __int16 v29 = 2112;
          id v30 = v20;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: set %@ strategy; most active view service session: %@",
            buf,
            0x20u);
        }
      }
      objc_initWeak((id *)buf, a1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __80___UIPhysicalButtonInteractionArbiter__setResolutionStrategy_forInitialization___block_invoke;
      aBlock[3] = &unk_1E5306550;
      objc_copyWeak(&v24, (id *)buf);
      uint64_t v21 = _Block_copy(aBlock);
      uint64_t v22 = (void *)a1[1];
      a1[1] = v21;

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_beginObservingWindowVisibilityChanges
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__windowVisibilityDidChange_ name:@"UIWindowDidBecomeVisibleNotification" object:0];
    [v2 addObserver:a1 selector:sel__windowVisibilityDidChange_ name:@"UIWindowDidBecomeHiddenNotification" object:0];
  }
}

- (_UIPhysicalButtonInteractionArbiter)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteractionArbiter.m", 561, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonInteractionArbiter init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  [(CADisplayLink *)self->_deferredConfigurationResolutionDisplayLink invalidate];
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowFirstResponderDidChangeNotification";
  v6[1] = @"UIWindowDidBecomeVisibleNotification";
  void v6[2] = @"UIWindowDidBecomeHiddenNotification";
  v6[3] = @"_UIActiveViewServiceSessionDidChangeNotification";
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIPhysicalButtonInteractionArbiter;
  [(_UIPhysicalButtonInteractionArbiter *)&v5 dealloc];
}

- (void)_windowHostingScene:(id)a3 willMoveFromScreen:(id)a4 toScreen:(id)a5
{
  char arbiterFlags = (char)self->_arbiterFlags;
  [(CADisplayLink *)self->_deferredConfigurationResolutionDisplayLink invalidate];
  deferredConfigurationResolutionDisplayLinuint64_t k = self->_deferredConfigurationResolutionDisplayLink;
  self->_deferredConfigurationResolutionDisplayLinuint64_t k = 0;

  if ((arbiterFlags & 2) != 0)
  {
    -[_UIPhysicalButtonInteractionArbiter _configureDeferredResolutionDisplayLinkForScreen:]((uint64_t)self, a5);
  }
}

- (void)_sceneWillInvalidate:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (![a3 _hasInvalidated]) {
    return;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_sceneWillInvalidate____s_category_1);
  if ((*(unsigned char *)CategoryCachedImpl & 1) == 0)
  {
    if (!self) {
      return;
    }
    goto LABEL_4;
  }
  long long v33 = *(id *)(CategoryCachedImpl + 8);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    if (a3)
    {
      long long v34 = NSString;
      id v35 = a3;
      id v36 = (objc_class *)objc_opt_class();
      __int16 v37 = NSStringFromClass(v36);
      id v38 = [v34 stringWithFormat:@"<%@: %p>", v37, v35];
    }
    else
    {
      id v38 = @"(nil)";
    }
    *(_DWORD *)buf = 134349314;
    v45 = self;
    __int16 v46 = 2112;
    uint64_t v47 = v38;
    _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resetting state for invalidating scene: %@", buf, 0x16u);
  }
  if (self)
  {
LABEL_4:
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = self->_eventDeferringTokenByEnvironment;
    uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v40 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v11 = [(NSMutableDictionary *)self->_eventDeferringTokenByEnvironment objectForKey:v10];
          v12 = NSString;
          uint64_t v13 = self;
          uint64_t v14 = (objc_class *)objc_opt_class();
          char v15 = NSStringFromClass(v14);
          uint64_t v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];

          id v17 = [v12 stringWithFormat:@"%@: ending %@ event deferring for arbiter reset", v16, v10];

          -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:]((uint64_t)v11, (uint64_t)v17);
        }
        uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v40 objects:buf count:16];
      }
      while (v7);
    }

    *(unsigned char *)&self->_arbiterFlags &= 0xE1u;
    [(CADisplayLink *)self->_deferredConfigurationResolutionDisplayLink invalidate];
    deferredConfigurationResolutionDisplayLinuint64_t k = self->_deferredConfigurationResolutionDisplayLink;
    self->_deferredConfigurationResolutionDisplayLinuint64_t k = 0;

    mostActiveViewServiceSession = self->_mostActiveViewServiceSession;
    self->_mostActiveViewServiceSession = 0;

    viewServiceObservers = self->_viewServiceObservers;
    self->_viewServiceObservers = 0;

    viewServiceValidationBlocuint64_t k = self->_viewServiceValidationBlock;
    self->_viewServiceValidationBlocuint64_t k = 0;

    interactionValidationBlocuint64_t k = self->_interactionValidationBlock;
    self->_interactionValidationBlocuint64_t k = 0;

    -[_UIPhysicalButtonInteractionArbiter _resetWindowLevelObservation]((uint64_t)self);
    countedWindowPointerValues = self->_countedWindowPointerValues;
    self->_countedWindowPointerValues = 0;

    trackedWindowPointers = self->_trackedWindowPointers;
    self->_trackedWindowPointers = 0;

    registeredAndSortedInteractions = self->_registeredAndSortedInteractions;
    self->_registeredAndSortedInteractions = 0;

    systemShellWindowsRequiringResolution = self->_systemShellWindowsRequiringResolution;
    self->_systemShellWindowsRequiringResolution = 0;

    systemShellWindowConfigurationResolutionContexts = self->_systemShellWindowConfigurationResolutionContexts;
    self->_systemShellWindowConfigurationResolutionContexts = 0;

    sceneConfigurationResolutionContext = self->_sceneConfigurationResolutionContext;
    self->_sceneConfigurationResolutionContext = 0;

    uniqueConfigurationGenerationNumbers = self->_uniqueConfigurationGenerationNumbers;
    self->_uniqueConfigurationGenerationNumbers = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    uint64_t v31 = [WeakRetained _FBSScene];
    BOOL v32 = v31 == 0;

    -[_UIPhysicalButtonInteractionArbiter _setResolutionStrategy:forInitialization:](self, v32, 0);
  }
}

- (void)_unregisterAllPhysicalButtonInteractionsForDetachingWindow:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 40) & 8) == 0) {
      *(unsigned char *)(a1 + 40) |= 8u;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v4 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
    objc_super v5 = objc_msgSend(v4, "copy", 0);

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 view];
          v12 = [v11 _window];

          if (v12 == (void *)a2) {
            -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)v10);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    char v13 = *(unsigned char *)(a1 + 40);
    *(unsigned char *)(a1 + 40) = v13 & 0xE7;
    if ((v13 & 0x10) != 0) {
      -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations](a1);
    }
    -[_UIPhysicalButtonInteractionArbiter _removeAllSystemShellReferencesForDetachingWindow:](a1, a2);
  }
}

- (void)_removeAllSystemShellReferencesForDetachingWindow:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

    if (WeakRetained)
    {
      [*(id *)(a1 + 120) removeObject:a2];
      objc_super v5 = *(void **)(a1 + 128);
      [v5 removeObjectForKey:a2];
    }
  }
}

- (id)_mostActiveViewServiceSessionForScene
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v2 = [WeakRetained _screen];
    uint64_t v3 = [v2 _userInterfaceIdiom];

    uint64_t v4 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(v3);
    objc_super v5 = +[_UIActiveViewServiceSessionTracker sharedTracker];
    uint64_t v6 = -[_UIActiveViewServiceSessionTracker mostActiveViewServiceSessionForUserInterfaceIdiom:](v5, v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_gestureViewsForWindow:(uint64_t)a3 physicalButton:
{
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 112) configurations];
    uint64_t v7 = [v6 _configurationForButton:a3];

    if (v7)
    {
      uint64_t v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      id v20 = __Block_byref_object_copy__180;
      uint64_t v21 = __Block_byref_object_dispose__180;
      id v22 = 0;
      unint64_t v8 = [v7 _behavior];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke;
      v16[3] = &unk_1E53065C0;
      v16[4] = &v17;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke_2;
      v14[3] = &unk_1E53065E8;
      if (v8 >= 3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 1 << v8;
      }
      BOOL v15 = v8 != 2;
      v14[4] = &v17;
      -[_UIPhysicalButtonInteractionArbiter _enumerateAndValidateInteractionsInWindow:withRequiredBehaviorMask:configurationAcceptanceEvaluator:interactionAcceptanceHandler:shouldStopEvaluator:](a1, a2, v9, 0, (uint64_t)v16, (uint64_t)v14);
      uint64_t v10 = (void *)v18[5];
      if (v10) {
        uint64_t v11 = [v10 copy];
      }
      else {
        uint64_t v11 = objc_opt_new();
      }
      v12 = (void *)v11;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v12 = objc_opt_new();
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

  if (!WeakRetained)
  {
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject]((uint64_t)self->_registeredAndSortedInteractions);
    -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
  }
}

- (void)_resetWindowLevelObservation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 96);
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
          uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "pointerValue", (void)v10);
          unint64_t v8 = v7;
          if (v7) {
            [v7 _removeWindowLevelChangedObserver:a1];
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    uint64_t v9 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;
  }
}

- (void)setSystemShellDelegate:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  char IsSpringBoard = _UIApplicationProcessIsSpringBoard();
  char v7 = IsSpringBoard;
  if (a3)
  {
    char v8 = [a3 conformsToProtocol:&unk_1ED701540];
    char v9 = v8;
    if ((v7 & 1) == 0)
    {
      __int16 v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonInteractionArbiter.m", 1706, @"%s: A system shell delegate is not allowed for this process", "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]");

      if (v9) {
        return;
      }
      goto LABEL_4;
    }
    if ((v8 & 1) == 0)
    {
LABEL_4:
      id v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteractionArbiter.m", 1707, @"%s: Candidate system shell delegate does not conform to _UIPhysicalButtonInteractionArbiterSystemShellDelegate: %@", "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]", a3 object file lineNumber description];
LABEL_28:

      return;
    }
  }
  else if ((IsSpringBoard & 1) == 0)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonInteractionArbiter.m", 1706, @"%s: A system shell delegate is not allowed for this process", "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]", v30);
    goto LABEL_28;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
  id v11 = a3;
  id v12 = WeakRetained;
  long long v13 = v12;
  if (v12 == v11)
  {
    char v14 = 1;
  }
  else
  {
    char v14 = 0;
    if (v11 && v12) {
      char v14 = [v11 isEqual:v12];
    }
  }

  uint64_t v15 = *(id *)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &setSystemShellDelegate____s_category)+ 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
    if (v16)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      id v20 = [v17 stringWithFormat:@"<%@: %p>", v19, v16];
    }
    else
    {
      id v20 = @"(nil)";
    }

    uint64_t v21 = v20;
    if (a3)
    {
      id v22 = NSString;
      id v23 = v11;
      id v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      id v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];
    }
    else
    {
      id v26 = @"(nil)";
    }
    *(_DWORD *)buf = 134349570;
    long long v33 = self;
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    __int16 v37 = v26;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: setting system shell delegate: existing: %@; new: %@",
      buf,
      0x20u);
  }
  objc_storeWeak((id *)&self->_systemShellDelegate, v11);
  if ((v14 & 1) == 0)
  {
    id v27 = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

    if (v27)
    {
      -[_UIPhysicalButtonInteractionArbiter _resetWindowLevelObservation]((uint64_t)self);
      if (self)
      {
        v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v28 removeObserver:self name:@"UIWindowDidBecomeVisibleNotification" object:0];
        [v28 removeObserver:self name:@"UIWindowDidBecomeHiddenNotification" object:0];
      }
    }
    else
    {
      -[_UIPhysicalButtonInteractionArbiter _beginObservingWindowVisibilityChanges]((uint64_t)self);
    }
  }
}

- (void)setNeedsResolutionOfPhysicalButtonConfigurationsForSystemShellDelegate:(id)a3
{
  p_systemShellDelegate = &self->_systemShellDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
  if (WeakRetained)
  {
    char v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_systemShellDelegate);

    if (v8 == a3)
    {
      *(unsigned char *)&self->_arbiterFlags |= 0x20u;
      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:]((uint64_t)self);
    }
  }
}

- (id)configurationResolutionContextForSystemShellWindow:(id)a3
{
  uint64_t v5 = [(NSMapTable *)self->_systemShellWindowConfigurationResolutionContexts objectForKey:a3];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (void)_mostActiveViewServiceSessionDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v6 = [WeakRetained _screen];
  uint64_t v7 = [v6 _userInterfaceIdiom];

  uint64_t v8 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(v7);
  char v9 = [a3 userInfo];
  long long v10 = [v9 objectForKey:@"_UIActiveViewServiceSessionChangingIdiomKey"];

  if (v10 && [v10 integerValue] == v8)
  {
    -[_UIPhysicalButtonInteractionArbiter _mostActiveViewServiceSessionForScene]((uint64_t)self);
    id v11 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
    mostActiveViewServiceSession = self->_mostActiveViewServiceSession;
    self->_mostActiveViewServiceSession = v11;

    long long v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_mostActiveViewServiceSessionDidChange____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = self->_mostActiveViewServiceSession;
      uint64_t v15 = v13;
      id v16 = [(_UIViewServiceSessionActivityRecord *)v14 succinctDescription];
      int v17 = 134349314;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: received new most active view service session: %@", (uint8_t *)&v17, 0x16u);
    }
    -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
  }
}

- (id)_registerViewServiceObserver:(id *)a1
{
  id v2 = a1;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [a1 _scene];
    uint64_t v5 = v4;
    if (!v4) {
      goto LABEL_16;
    }
    char v6 = [v4 _hasInvalidated];

    if (v6) {
      goto LABEL_16;
    }
    if ([v2[18] containsObject:a2])
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerViewServiceObserver_, v2, @"_UIPhysicalButtonInteractionArbiter.m", 1830, @"%s: View service observer is already registered with arbiter: viewServiceObserver: %@; arbiter: %@",
        "-[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:]",
        a2,
        v2);
LABEL_15:

LABEL_16:
      id v2 = 0;
      goto LABEL_17;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([a2 isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([a2 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerViewServiceObserver_, v2, @"_UIPhysicalButtonInteractionArbiter.m", 1841, @"%s: Invalid view service observer attempting registration with arbiter: viewServiceObserver: %@; arbiter: %@",
        "-[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:]",
        a2,
        v2);
      goto LABEL_15;
    }
    if (!v2[18])
    {
      uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v9 = v2[18];
      v2[18] = (id)v8;
    }
    objc_initWeak(&location, v2);
    objc_initWeak(&from, a2);
    uint64_t v10 = ++qword_1EB262FA8;
    id v11 = (objc_class *)objc_opt_class();
    __int16 v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%p-%lu", class_getName(v11), a2, v10);
    id v12 = NSString;
    long long v13 = v2;
    char v14 = NSString;
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    int v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v13];

    v28 = [v12 stringWithFormat:@"Registering view service observer with: %@", v17];

    id v18 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v19 = MEMORY[0x1E4F14428];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68___UIPhysicalButtonInteractionArbiter__registerViewServiceObserver___block_invoke;
    v30[3] = &unk_1E52F3A90;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    id v20 = (void *)[v18 initWithIdentifier:v29 forReason:v28 queue:MEMORY[0x1E4F14428] invalidationBlock:v30];

    uint64_t v21 = *(id *)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB262F78) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = a2;
      if (v22)
      {
        id v23 = NSString;
        id v24 = (objc_class *)objc_opt_class();
        __int16 v25 = NSStringFromClass(v24);
        id v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
      }
      else
      {
        id v26 = @"(nil)";
      }

      *(_DWORD *)buf = 134349570;
      __int16 v36 = v13;
      __int16 v37 = 2112;
      uint64_t v38 = v26;
      __int16 v39 = 2112;
      long long v40 = v20;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: registered view service observer: %@ with registrationToken: %@", buf, 0x20u);
    }
    [v2[18] addObject:a2];
    id v2 = v20;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
LABEL_17:
  return v2;
}

- (void)_handleBSAction:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB262F80) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      __int16 v25 = a2;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: received BSAction: %@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 112) configurations];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke;
    v21[3] = &unk_1E5306660;
    v21[4] = a2;
    char v6 = [v5 _configurationPassingTest:v21];
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 112) configurationToInteractionMap];
      uint64_t v8 = [v7 objectForKey:v6];

      if ([v8 _isProxyInteraction])
      {
        id v9 = -[_UIPhysicalButtonInteraction _bsActionDriver](v8);
        [v9 _handleBSAction:a2];
LABEL_17:

LABEL_18:
LABEL_19:

        return;
      }
      if ([a2 behavior] == 2)
      {
        id v12 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        id v16 = __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke_238;
        int v17 = &unk_1E5306688;
        uint64_t v18 = a1;
        id v19 = v6;
        id v20 = a2;
        [v12 enumerateObjectsWithOptions:2 usingBlock:&v14];
      }
      else
      {
        long long v13 = -[_UIPhysicalButtonInteraction _bsActionDriver](v8);
        [v13 _handleBSAction:a2];
      }
      if (!objc_msgSend(a2, "canSendResponse", v14, v15, v16, v17, v18)) {
        goto LABEL_18;
      }
      uint64_t v11 = [MEMORY[0x1E4F4F678] response];
    }
    else
    {
      uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB262F88) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349570;
        uint64_t v23 = a1;
        __int16 v24 = 2112;
        __int16 v25 = a2;
        __int16 v26 = 2112;
        id v27 = v5;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: dropping action as there is no matching configuration in resolved configurations; action"
          ": %@; resolved configurations: %@",
          buf,
          0x20u);
      }
      if (![a2 canSendResponse]) {
        goto LABEL_19;
      }
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIPhysicalButtonBSActionErrorDomain" code:0 userInfo:0];
      uint64_t v11 = [MEMORY[0x1E4F4F678] responseForError:v8];
    }
    id v9 = (void *)v11;
    [a2 sendResponse:v11];
    goto LABEL_17;
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonInteractionArbiter *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  id v2 = [(_UIPhysicalButtonInteractionArbiter *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = v3;
  unint64_t resolutionStrategy = self->_resolutionStrategy;
  char v6 = &stru_1ED0E84C0;
  if (resolutionStrategy == 1) {
    char v6 = @"viewServices";
  }
  if (resolutionStrategy) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"sceneClientSettings";
  }
  [v3 appendString:v7 withName:@"resolutionStrategy"];
  id v8 = (id)[v4 appendBool:(*(unsigned char *)&self->_arbiterFlags >> 1) & 1 withName:@"hasScheduledDeferredConfigurationResolution"];
  id v9 = [(_UIPhysicalButtonConfigurationResolutionContext *)self->_sceneConfigurationResolutionContext configurations];
  uint64_t v10 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(v9);
  id v11 = (id)[v4 appendObject:v10 withName:@"resolvedConfigurations"];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonInteractionArbiter *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonInteractionArbiter *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (_UIPhysicalButtonInteractionArbiterSystemShellDelegate)systemShellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
  return (_UIPhysicalButtonInteractionArbiterSystemShellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDeferringTokenByEnvironment, 0);
  objc_storeStrong((id *)&self->_viewServiceObservers, 0);
  objc_storeStrong((id *)&self->_mostActiveViewServiceSession, 0);
  objc_storeStrong((id *)&self->_systemShellWindowConfigurationResolutionContexts, 0);
  objc_storeStrong((id *)&self->_systemShellWindowsRequiringResolution, 0);
  objc_storeStrong((id *)&self->_sceneConfigurationResolutionContext, 0);
  objc_storeStrong((id *)&self->_deferredConfigurationResolutionDisplayLink, 0);
  objc_storeStrong((id *)&self->_windowPointersObservedForLevelChanges, 0);
  objc_storeStrong((id *)&self->_countedWindowPointerValues, 0);
  objc_storeStrong((id *)&self->_trackedWindowPointers, 0);
  objc_storeStrong((id *)&self->_registeredAndSortedInteractions, 0);
  objc_destroyWeak((id *)&self->_systemShellDelegate);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_uniqueConfigurationGenerationNumbers, 0);
  objc_storeStrong(&self->_interactionValidationBlock, 0);
  objc_storeStrong(&self->_viewServiceValidationBlock, 0);
}

@end