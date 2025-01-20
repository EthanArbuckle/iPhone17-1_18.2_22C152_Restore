@interface SBSystemActionPreviewCoordinator
- (SBWindowScene)windowScene;
- (id)_showPreviewForAction:(void *)a3 withContext:;
- (id)customSoundForPerformingAction:(id)a3;
- (id)initWithWindowScene:(void *)a3 activityManager:;
- (id)previewContextForAction:(id)a3;
- (id)showPreviewForAction:(id)a3 withContext:(id)a4;
- (void)_notifyDidBeginPreview:(void *)a3 forAction:;
- (void)_notifyDidEndPreview:(void *)a3 forAction:(uint64_t)a4 withResult:;
- (void)_notifyDidInvalidateExpansionOfPreview:(void *)a3 forAction:(uint64_t)a4 withResult:;
- (void)addPreviewProvider:(uint64_t)a1;
- (void)provideDiscreteNoActionInteractionFeedback;
@end

@implementation SBSystemActionPreviewCoordinator

- (id)initWithWindowScene:(void *)a3 activityManager:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowScene != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewCoordinator initWithWindowScene:activityManager:](sel_initWithWindowScene_activityManager_, (uint64_t)a1, (uint64_t)v11);
    }
LABEL_12:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8CA0008);
  }
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activityManager != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionPreviewCoordinator initWithWindowScene:activityManager:](sel_initWithWindowScene_activityManager_, (uint64_t)a1, (uint64_t)v11);
    }
    goto LABEL_12;
  }
  v12.receiver = a1;
  v12.super_class = (Class)SBSystemActionPreviewCoordinator;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 6, a2);
    objc_storeStrong(a1 + 5, a3);
  }
LABEL_6:

  return a1;
}

- (void)addPreviewProvider:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
      id v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)previewContextForAction:(id)a3
{
  id v3 = a3;
  if (+[SBSystemActionSceneElementProvider providesSceneElementForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v3))
  {
    v4 = +[SBSystemActionSceneElementProvider previewContextForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)showPreviewForAction:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[SBSystemActionPreviewCoordinator _showPreviewForAction:withContext:]((id *)&self->super.isa, v6, v7);
  -[SBSystemActionPreviewCoordinator _notifyDidBeginPreview:forAction:]((uint64_t)self, v8, v6);
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke;
  v15[3] = &unk_1E6B094E0;
  objc_copyWeak(&v17, &location);
  id v9 = v6;
  id v16 = v9;
  [v8 addExpansionInvalidationBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke_2;
  v12[3] = &unk_1E6B094E0;
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v13 = v10;
  [v8 addInvalidationBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_showPreviewForAction:(void *)a3 withContext:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 windowScene];
    v45 = [v7 systemApertureController];

    v47 = [v5 configuredAction];
    v46 = [v47 identifier];
    uint64_t v8 = SBFEffectiveArtworkSubtype();
    if (v8 > 2795)
    {
      if (v8 != 2868 && v8 != 2796) {
        goto LABEL_18;
      }
    }
    else if (v8 != 2556 && v8 != 2622)
    {
      goto LABEL_18;
    }
    if (+[SBSystemActionSceneElementProvider providesSceneElementForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v5))
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v9 = [a1[3] objectEnumerator];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v63;
LABEL_11:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
          if (-[SBSystemActionSceneElementProvider providesElementForSystemAction:withContext:](v13, v5, v6))break; {
          if (v10 == ++v12)
          }
          {
            uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
            if (v10) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }
        id v17 = v13;

        if (v17) {
          goto LABEL_24;
        }
      }
      else
      {
LABEL_17:
      }
      id v17 = -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:]((id *)[SBSystemActionSceneElementProvider alloc], v5, v45, v6);
      id v18 = a1[3];
      if (!v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        id v21 = a1[3];
        v20 = (uint64_t *)(a1 + 3);
        uint64_t *v20 = v19;

        id v18 = (id)*v20;
      }
      [v18 addObject:v17];
LABEL_24:
      -[SBSystemActionSceneElementProvider previewForReason:]((uint64_t)v17, @"Show Preview");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
LABEL_18:
    id v14 = a1[1];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke;
    v60[3] = &unk_1E6B09508;
    v43 = v46;
    v61 = v43;
    v44 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v60);
    v15 = [v44 showPreviewForAction:v5 withContext:v6];
    id v16 = v15;
    if (v15)
    {
      a1 = v15;
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v22 = [a1[4] keyEnumerator];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v57;
LABEL_27:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v56 + 1) + 8 * v25);
          v27 = -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)v26);
          char v28 = [v27 isEqual:v5];

          if (v28) {
            break;
          }
          if (v23 == ++v25)
          {
            uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
            if (v23) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
        id v30 = v26;
        v29 = [a1[4] objectForKey:v30];

        v31 = v29;
        if (v30) {
          goto LABEL_40;
        }
      }
      else
      {
LABEL_33:

        v29 = 0;
      }
      v32 = (void *)[v5 newSimplePreviewElement];
      v33 = SBLogSystemActionPreviewing();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v43;
        _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "Registering simple preview element for action with identifier: %@", buf, 0xCu);
      }

      v34 = [v45 registerElement:v32];
      objc_initWeak((id *)buf, a1);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_56;
      v53[3] = &unk_1E6AF7BE8;
      objc_copyWeak(&v55, (id *)buf);
      id v35 = v32;
      id v54 = v35;
      [v34 addInvalidationBlock:v53];
      v36 = [SBSystemActionCompoundPreviewAssertion alloc];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_2;
      v50[3] = &unk_1E6B09530;
      id v51 = v35;
      id v37 = v34;
      id v52 = v37;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_3;
      v48[3] = &unk_1E6B09558;
      id v30 = v51;
      id v49 = v30;
      v31 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v36, v43, v50, v48);

      id v38 = a1[4];
      if (!v38)
      {
        uint64_t v39 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        id v41 = a1[4];
        v40 = (uint64_t *)(a1 + 4);
        uint64_t *v40 = v39;

        id v38 = (id)*v40;
      }
      [v38 setObject:v31 forKey:v30];

      objc_destroyWeak(&v55);
      objc_destroyWeak((id *)buf);

LABEL_40:
      -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)v31, @"Show Preview");
      a1 = (id *)objc_claimAutoreleasedReturnValue();

      id v16 = 0;
    }

    id v17 = v61;
LABEL_42:
  }
  return a1;
}

- (void)_notifyDidBeginPreview:(void *)a3 forAction:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) systemActionPreviewCoordinator:a1 didBeginPreview:v5 forAction:v6];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    -[SBSystemActionPreviewCoordinator _notifyDidInvalidateExpansionOfPreview:forAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), a3);
  }
}

- (void)_notifyDidInvalidateExpansionOfPreview:(void *)a3 forAction:(uint64_t)a4 withResult:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) systemActionPreviewCoordinator:a1 didInvalidateExpansionOfPreview:v7 forAction:v8 withResult:a4];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

void __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    -[SBSystemActionPreviewCoordinator _notifyDidEndPreview:forAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), a3);
  }
}

- (void)_notifyDidEndPreview:(void *)a3 forAction:(uint64_t)a4 withResult:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) systemActionPreviewCoordinator:a1 didEndPreview:v7 forAction:v8 withResult:a4];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)customSoundForPerformingAction:(id)a3
{
  v4 = [a3 configuredAction];
  id v5 = [v4 identifier];

  previewProviders = self->_previewProviders;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__SBSystemActionPreviewCoordinator_customSoundForPerformingAction___block_invoke;
  v11[3] = &unk_1E6B09508;
  id v12 = v5;
  id v7 = v5;
  id v8 = [(NSMutableSet *)previewProviders bs_firstObjectPassingTest:v11];
  uint64_t v9 = [v8 soundForPerformingActionWithIdentifier:v7];

  return v9;
}

uint64_t __67__SBSystemActionPreviewCoordinator_customSoundForPerformingAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 providesPreviewForActionWithIdentifier:*(void *)(a1 + 32)];
}

- (void)provideDiscreteNoActionInteractionFeedback
{
  v2 = [(SBSystemActionPreviewCoordinator *)self windowScene];
  id v3 = [v2 systemApertureController];

  [v3 animateDiscreteAnimationStyle:2 toElement:0];
}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 providesPreviewForActionWithIdentifier:*(void *)(a1 + 32)];
}

void __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_56(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[4] removeObjectForKey:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = -[SBSystemActionCompoundPreviewAssertion state](a2);
  [*(id *)(a1 + 32) setPreviewing:v3 & 1];
  [*(id *)(a1 + 32) setUrgent:HIBYTE(v3) & 1];
  [*(id *)(a1 + 32) setExpanding:(v3 >> 8) & 1];
  [*(id *)(a1 + 32) setProminent:HIWORD(v3) & 1];
  uint64_t result = [*(id *)(a1 + 40) isValid];
  if ((v3 & 1) == 0 && result)
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 invalidateWithReason:@"Compound previewing ended"];
  }
  return result;
}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) pop];
  }
  return result;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_activeSimplePreviewElementsToAssertions, 0);
  objc_storeStrong((id *)&self->_activeSceneElementProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previewProviders, 0);
}

- (void)initWithWindowScene:(uint64_t)a3 activityManager:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBSystemActionPreviewCoordinator.m";
  __int16 v10 = 1024;
  int v11 = 55;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithWindowScene:(uint64_t)a3 activityManager:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBSystemActionPreviewCoordinator.m";
  __int16 v10 = 1024;
  int v11 = 56;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end