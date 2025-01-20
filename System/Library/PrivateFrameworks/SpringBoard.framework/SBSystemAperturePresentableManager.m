@interface SBSystemAperturePresentableManager
- (BOOL)_takeProcessAssertionForElement:(id)a3;
- (BOOL)willInterceptPresentable:(id)a3 userInfo:(id)a4;
- (SBSystemApertureController)elementRegistrar;
- (SBSystemAperturePresentableManager)initWithElementRegistrar:(id)a3;
- (id)_elementForPresentableCreatingIfNecessary:(id)a3 elementGenerator:(id)a4;
- (id)_existingAssertionForElement:(id)a3;
- (id)_existingElementForPresentableWithIdentification:(id)a3;
- (id)_existingPresentableWithIdentification:(id)a3;
- (id)_existingPresentablesWithIdentification:(id)a3;
- (id)_presentableElementForElementLayoutSpecifier:(id)a3;
- (id)revocationRequestedForPresentablesWithIdentification:(id)a3 reason:(id)a4;
- (void)_invalidateElement:(id)a3 withReason:(id)a4;
- (void)_noteElementDidAppear:(id)a3;
- (void)_noteElementDidDisappear:(id)a3 reason:(id)a4;
- (void)_noteElementDidInvalidate:(id)a3 reason:(id)a4;
- (void)_noteElementWillDisappear:(id)a3 reason:(id)a4;
- (void)_noteElementWillNotAppearAsBanner:(id)a3 reason:(id)a4;
- (void)_registerElement:(id)a3;
- (void)_removeAssertionForElement:(id)a3;
- (void)_removeElementForPresentableWithIdentification:(id)a3;
- (void)_removePresentableForElement:(id)a3;
- (void)_sync_registerAssertion:(id)a3 forElement:(id)a4;
- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5;
@end

@implementation SBSystemAperturePresentableManager

- (SBSystemAperturePresentableManager)initWithElementRegistrar:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSystemAperturePresentableManager;
  v5 = [(SBSystemAperturePresentableManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_elementRegistrar, v4);
  }

  return v6;
}

- (BOOL)willInterceptPresentable:(id)a3 userInfo:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v6 providesTemplateContent]
    && [v6 presentableBehavior] == 1)
  {
    objc_super v8 = SBLogSystemApertureNotice();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = BNEffectivePresentableDescription();
      *(_DWORD *)buf = 138543362;
      v42 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Intercepting template notice presentable: %{public}@", buf, 0xCu);
    }
    id v10 = v6;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke;
    v39[3] = &unk_1E6AF9150;
    id v40 = v10;
    v11 = [(SBSystemAperturePresentableManager *)self _elementForPresentableCreatingIfNecessary:v10 elementGenerator:v39];
    [(SBSystemAperturePresentableManager *)self _registerElement:v11];

    id v12 = v40;
    goto LABEL_29;
  }
  v13 = [v7 objectForKey:*MEMORY[0x1E4FA7FB8]];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  int v18 = [v17 BOOLValue];
  if (v18)
  {
    uint64_t v19 = objc_opt_class();
    id v20 = v6;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    id v12 = v21;

    BOOL v22 = v12 != 0;
    if (!v12) {
      goto LABEL_30;
    }
    v23 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = BNEffectivePresentableDescription();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Intercepting hosted presentable: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_6;
    v34[3] = &unk_1E6AF91C8;
    id v35 = v20;
    id v12 = v12;
    id v36 = v12;
    v37 = self;
    objc_copyWeak(&v38, (id *)buf);
    v25 = [(SBSystemAperturePresentableManager *)self _elementForPresentableCreatingIfNecessary:v12 elementGenerator:v34];
    if (![v25 isActivated]
      || ([v25 scene],
          v26 = objc_claimAutoreleasedReturnValue(),
          BOOL v27 = v26 == 0,
          v26,
          v27))
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2_11;
      v32[3] = &unk_1E6AF91F0;
      objc_copyWeak(&v33, (id *)buf);
      [v25 setSceneInvalidationHandler:v32];
      [v25 setPresentable:v12];
      if ([v25 isActivated])
      {
        v28 = [v12 scene];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_4;
        v30[3] = &unk_1E6AF9218;
        v30[4] = self;
        id v31 = v25;
        [v31 updateWithConnectedScene:v28 configuration:0 elementAssertionAcquisitionHandler:v30];
      }
      else
      {
        [v25 activate];
      }
      objc_destroyWeak(&v33);
    }

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
LABEL_29:
    BOOL v22 = 1;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v22 = 0;
LABEL_31:

  return v22;
}

SBNoticePresentableElement *__72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke(uint64_t a1)
{
  v1 = [[SBNoticePresentableElement alloc] initWithTemplatePresentable:*(void *)(a1 + 32)];
  return v1;
}

SBSystemApertureSceneElement *__72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_6(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2;
  v12[3] = &unk_1E6AF9178;
  id v13 = *(id *)(a1 + 32);
  v2 = +[SBSystemApertureSceneElement activePlaceholderElementPassingTest:v12];
  if (v2)
  {
    v3 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Found existing placeholder for intercepted presentable: %{public}@", buf, 0xCu);
    }

    id v4 = v2;
  }
  else
  {
    v5 = [*(id *)(a1 + 40) scene];
    id v6 = [SBSystemApertureSceneElement alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_9;
    v9[3] = &unk_1E6AF91A0;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    id v10 = *(id *)(a1 + 32);
    id v4 = [(SBSystemApertureSceneElement *)v6 initWithScene:v5 statusBarBackgroundActivitiesSuppresser:WeakRetained readyForPresentationHandler:v9];

    objc_destroyWeak(&v11);
  }

  return v4;
}

uint64_t __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) requesterIdentifier];
  v5 = [v3 clientIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [*(id *)(a1 + 32) requestIdentifier];
    id v7 = [v3 elementIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_9(uint64_t a1, void *a2, int a3)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      uint64_t v7 = [WeakRetained _existingElementForPresentableWithIdentification:*(void *)(a1 + 32)];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        v9 = [v6 _existingPresentableWithIdentification:*(void *)(a1 + 32)];

        if (v9) {
          [v6 _registerElement:v10];
        }
      }
    }
  }
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) isActivated]
    && ([*(id *)(a1 + 32) isDeactivating] & 1) == 0)
  {
    [WeakRetained _invalidateElement:*(void *)(a1 + 32) withReason:@"Presentable client scene unexpectedly invalidated."];
  }
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "_sync_registerAssertion:forElement:", v4, *(void *)(a1 + 40));
  objc_sync_exit(v3);

  [*(id *)(a1 + 32) elementLayoutSpecifier:*(void *)(a1 + 40) layoutModeDidChange:0 reason:0];
}

- (id)revocationRequestedForPresentablesWithIdentification:(id)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  uint64_t v7 = SBLogSystemApertureNotice();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v19;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with identification: %{public}@", buf, 0xCu);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  [(SBSystemAperturePresentableManager *)v8 _existingPresentablesWithIdentification:v19];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v15 = [(SBSystemAperturePresentableManager *)v8 _existingElementForPresentableWithIdentification:v14];
        if (v15)
        {
          uint64_t v16 = [NSString stringWithFormat:@"revocation requested for presentable (%@)", v6];
          [(SBSystemAperturePresentableManager *)v8 _invalidateElement:v15 withReason:v16];

          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v10 addObject:v14];
        }
        else
        {
          id v17 = SBLogSystemApertureNotice();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            BNEffectivePresentableDescription();
            objc_claimAutoreleasedReturnValue();
            -[SBSystemAperturePresentableManager revocationRequestedForPresentablesWithIdentification:reason:]();
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v8);
  return v10;
}

- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5
{
  id v9 = a3;
  uint64_t v7 = [(SBSystemAperturePresentableManager *)self _presentableElementForElementLayoutSpecifier:"_presentableElementForElementLayoutSpecifier:"];
  if (v7)
  {
    uint64_t v8 = [v9 layoutMode];
    if (a4 <= 0 && v8 >= 1) {
      [(SBSystemAperturePresentableManager *)self _noteElementDidAppear:v7];
    }
  }
}

- (id)_existingPresentablesWithIdentification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = v5->_presentablesToElements;
    uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification()) {
            objc_msgSend(v6, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_existingPresentableWithIdentification:(id)a3
{
  if (a3)
  {
    id v3 = -[SBSystemAperturePresentableManager _existingPresentablesWithIdentification:](self, "_existingPresentablesWithIdentification:");
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_existingElementForPresentableWithIdentification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(SBSystemAperturePresentableManager *)v5 _existingPresentableWithIdentification:v4];
    if (v6)
    {
      uint64_t v7 = [(NSMapTable *)v5->_presentablesToElements objectForKey:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_elementForPresentableCreatingIfNecessary:(id)a3 elementGenerator:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v6)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    uint64_t v9 = [(SBSystemAperturePresentableManager *)v8 _existingElementForPresentableWithIdentification:v6];
    if (!v9)
    {
      uint64_t v9 = v7[2](v7);
      presentablesToElements = v8->_presentablesToElements;
      if (!presentablesToElements)
      {
        uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v12 = v8->_presentablesToElements;
        v8->_presentablesToElements = (NSMapTable *)v11;

        presentablesToElements = v8->_presentablesToElements;
      }
      [(NSMapTable *)presentablesToElements setObject:v9 forKey:v6];
    }
    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_removeElementForPresentableWithIdentification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(SBSystemAperturePresentableManager *)v5 _existingPresentableWithIdentification:v7];
    if (v6) {
      [(NSMapTable *)v5->_presentablesToElements removeObjectForKey:v6];
    }

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (id)_existingAssertionForElement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->_elementsToAssertions objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_registerElement:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(SBSystemAperturePresentableManager *)v5 _existingAssertionForElement:v4];
    if (!v6)
    {
      id v7 = SBLogSystemApertureNotice();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = MEMORY[0x1D948A070](v4);
        int v11 = 138543362;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Registering element: %{public}@", (uint8_t *)&v11, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_elementRegistrar);
      id v6 = [WeakRetained registerElement:v4];

      if (v6)
      {
        [(SBSystemAperturePresentableManager *)v5 _sync_registerAssertion:v6 forElement:v4];
      }
      else
      {
        id v10 = SBLogSystemApertureNotice();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          MEMORY[0x1D948A070](v4);
          objc_claimAutoreleasedReturnValue();
          -[SBSystemAperturePresentableManager _registerElement:]();
        }

        id v6 = 0;
      }
    }

    objc_sync_exit(v5);
  }
}

- (void)_sync_registerAssertion:(id)a3 forElement:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogSystemApertureNotice();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Registering assertion %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__SBSystemAperturePresentableManager__sync_registerAssertion_forElement___block_invoke;
  v12[3] = &unk_1E6AF9240;
  objc_copyWeak(&v13, (id *)buf);
  objc_copyWeak(&v14, &location);
  [v6 addInvalidationBlock:v12];
  elementsToAssertions = self->_elementsToAssertions;
  if (!elementsToAssertions)
  {
    id v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    int v11 = self->_elementsToAssertions;
    self->_elementsToAssertions = v10;

    elementsToAssertions = self->_elementsToAssertions;
  }
  [(NSMapTable *)elementsToAssertions setObject:v6 forKey:v7];
  if (objc_opt_respondsToSelector()) {
    [v7 addElementLayoutSpecifierObserver:self];
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __73__SBSystemAperturePresentableManager__sync_registerAssertion_forElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _noteElementDidInvalidate:v6 reason:v5];
}

- (void)_removeAssertionForElement:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(SBSystemAperturePresentableManager *)v6 _existingAssertionForElement:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 isValid])
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        int v11 = MEMORY[0x1D948A070](v5);
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SBSystemAperturePresentableManager.m", 272, @"Removing a valid assertion: element: %@; assertion: %@",
          v11,
          v8);
      }
      [(NSMapTable *)v6->_elementsToAssertions removeObjectForKey:v5];
    }
    else
    {
      uint64_t v9 = SBLogSystemApertureNotice();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        MEMORY[0x1D948A070](v5);
        objc_claimAutoreleasedReturnValue();
        -[SBSystemAperturePresentableManager _removeAssertionForElement:]();
      }
    }
    objc_sync_exit(v6);
  }
}

- (void)_removePresentableForElement:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5->_presentablesToElements;
    uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        -[NSMapTable objectForKey:](v5->_presentablesToElements, "objectForKey:", v10, (void)v15);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v12 = v11 == v4;

        if (v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v10;

      if (!v13) {
        goto LABEL_13;
      }
      [(NSMapTable *)v5->_presentablesToElements removeObjectForKey:v13];
    }
    else
    {
LABEL_10:

LABEL_13:
      id v14 = SBLogSystemApertureNotice();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        MEMORY[0x1D948A070](v4);
        objc_claimAutoreleasedReturnValue();
        -[SBSystemAperturePresentableManager _removePresentableForElement:]();
      }

      id v13 = 0;
    }

    objc_sync_exit(v5);
  }
}

- (void)_invalidateElement:(id)a3 withReason:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = SBLogSystemApertureNotice();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = MEMORY[0x1D948A070](v7);
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    __int16 v26 = 2114;
    id v27 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Asked to invalidate element with reason: element: %{public}@; reason: %{public}@",
      buf,
      0x16u);
  }
  if (v7)
  {
    if (!v8)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"SBSystemAperturePresentableManager.m", 303, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
    }
    id v11 = self;
    objc_sync_enter(v11);
    BOOL v12 = [(SBSystemAperturePresentableManager *)v11 _existingAssertionForElement:v7];
    uint64_t v13 = objc_opt_class();
    id v14 = v7;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
    }
    else
    {
      long long v15 = 0;
    }
    id v16 = v15;

    if ([v16 isActivated] && (objc_msgSend(v16, "isDeactivating") & 1) == 0)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__SBSystemAperturePresentableManager__invalidateElement_withReason___block_invoke;
      v21[3] = &unk_1E6AF9268;
      v21[4] = v11;
      id v22 = v14;
      id v23 = v8;
      [v16 deactivateWhenRemovedWithHandler:v21];
    }
    else if (!v16)
    {
      [(SBSystemAperturePresentableManager *)v11 _removePresentableForElement:v14];
    }
    if (objc_opt_respondsToSelector()) {
      [v14 removeElementLayoutSpecifierObserver:v11];
    }
    if ([v12 isValid])
    {
      [v12 invalidateWithReason:v8];
      [(SBSystemAperturePresentableManager *)v11 _removeAssertionForElement:v14];
    }
    else
    {
      long long v17 = SBLogSystemApertureNotice();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = MEMORY[0x1D948A070](v14);
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "There was no assertion for element: %{public}@", buf, 0xCu);
      }
      id v19 = [v14 presentable];
      [v19 presentableWillNotAppearAsBanner:v19 withReason:@"revoked before ever becoming visible"];
    }
    objc_sync_exit(v11);
  }
}

uint64_t __68__SBSystemAperturePresentableManager__invalidateElement_withReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _noteElementWillDisappear:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _noteElementDidDisappear:v3 reason:v4];
}

- (id)_presentableElementForElementLayoutSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_elementsToAssertions;
  id v6 = (id)[(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          id v6 = v4;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_noteElementDidAppear:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    if (![(NSHashTable *)v5->_elementsThatDidAppear containsObject:v10])
    {
      id v6 = [v10 presentable];
      if ([(SBSystemAperturePresentableManager *)v5 _takeProcessAssertionForElement:v10])
      {
        [v6 presentableWillAppearAsBanner:v6];
        [v6 presentableDidAppearAsBanner:v6];
      }
    }
    elementsThatDidAppear = v5->_elementsThatDidAppear;
    if (!elementsThatDidAppear)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v9 = v5->_elementsThatDidAppear;
      v5->_elementsThatDidAppear = (NSHashTable *)v8;

      elementsThatDidAppear = v5->_elementsThatDidAppear;
    }
    [(NSHashTable *)elementsThatDidAppear addObject:v10];
    objc_sync_exit(v5);

    id v4 = v10;
  }
}

- (void)_noteElementDidInvalidate:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    if ([(NSHashTable *)v8->_elementsThatDidAppear containsObject:v6])
    {
      [(SBSystemAperturePresentableManager *)v8 _noteElementWillDisappear:v6 reason:v7];
      uint64_t v9 = objc_opt_class();
      id v10 = v6;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          long long v11 = v10;
        }
        else {
          long long v11 = 0;
        }
      }
      else
      {
        long long v11 = 0;
      }
      id v12 = v11;

      if ([v12 isActivated] && (objc_msgSend(v12, "isDeactivating") & 1) == 0)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __71__SBSystemAperturePresentableManager__noteElementDidInvalidate_reason___block_invoke;
        v13[3] = &unk_1E6AF9268;
        v13[4] = v8;
        id v14 = v10;
        id v15 = v7;
        [v12 deactivateWhenRemovedWithHandler:v13];
      }
      else if (([v12 isActivated] & 1) == 0)
      {
        [(SBSystemAperturePresentableManager *)v8 _noteElementDidDisappear:v10 reason:v7];
      }
    }
    else
    {
      [(SBSystemAperturePresentableManager *)v8 _noteElementWillNotAppearAsBanner:v6 reason:@"revoked before ever becoming visible"];
    }
    objc_sync_exit(v8);
  }
}

uint64_t __71__SBSystemAperturePresentableManager__noteElementDidInvalidate_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteElementDidDisappear:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

- (void)_noteElementWillNotAppearAsBanner:(id)a3 reason:(id)a4
{
  id v5 = a3;
  id v6 = [v5 presentable];
  LODWORD(self) = [(SBSystemAperturePresentableManager *)self _takeProcessAssertionForElement:v5];

  if (self) {
    [v6 presentableWillNotAppearAsBanner:v6 withReason:@"revoked before ever becoming visible"];
  }
}

- (void)_noteElementWillDisappear:(id)a3 reason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(NSHashTable *)self->_elementsThatDidAppear containsObject:v8])
  {
    id v7 = [v8 presentable];
    if ([(SBSystemAperturePresentableManager *)self _takeProcessAssertionForElement:v8])
    {
      [v7 presentableWillDisappearAsBanner:v7 withReason:v6];
    }
  }
}

- (void)_noteElementDidDisappear:(id)a3 reason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(NSHashTable *)self->_elementsThatDidAppear containsObject:v8])
  {
    id v7 = [v8 presentable];
    [(SBSystemAperturePresentableManager *)self _removePresentableForElement:v8];
    if ([(SBSystemAperturePresentableManager *)self _takeProcessAssertionForElement:v8])
    {
      [v7 presentableDidDisappearAsBanner:v7 withReason:v6];
    }
    [(NSHashTable *)self->_elementsThatDidAppear removeObject:v8];
  }
}

- (BOOL)_takeProcessAssertionForElement:(id)a3
{
  v34[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 scene];
  uint64_t v9 = [v8 clientProcess];
  uint64_t v10 = [v9 pid];

  if ((int)v10 < 2)
  {
    id v21 = 0;
  }
  else
  {
    v25 = [MEMORY[0x1E4F96478] targetWithPid:v10];
    long long v11 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
    v34[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F96338] grantWithUserInteractivity];
    v34[1] = v12;
    long long v13 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
    v34[2] = v13;
    id v14 = [MEMORY[0x1E4F96460] grantWithResistance:40];
    v34[3] = v14;
    id v15 = [MEMORY[0x1E4F96350] grant];
    void v34[4] = v15;
    id v16 = [MEMORY[0x1E4F96470] withReason:7];
    v34[5] = v16;
    long long v17 = [MEMORY[0x1E4F96368] invalidateAfterInterval:1.0];
    v34[6] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:7];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__8;
    v32 = __Block_byref_object_dispose__8;
    id v33 = (id)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"SBSystemAperturePresentableManagerBannerKitCallbacks" target:v25 attributes:v18];
    id v19 = (void *)v29[5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __70__SBSystemAperturePresentableManager__takeProcessAssertionForElement___block_invoke;
    v27[3] = &unk_1E6AF9290;
    v27[4] = &v28;
    [v19 setInvalidationHandler:v27];
    uint64_t v20 = (void *)v29[5];
    id v26 = 0;
    LOBYTE(v12) = [v20 acquireWithError:&v26];
    id v21 = v26;
    _Block_object_dispose(&v28, 8);

    if (v12)
    {
      BOOL v22 = 1;
      goto LABEL_13;
    }
  }
  id v23 = SBLogSystemApertureNotice();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    [(SBSystemAperturePresentableManager *)v5 _takeProcessAssertionForElement:v23];
  }

  BOOL v22 = 0;
LABEL_13:

  return v22;
}

void __70__SBSystemAperturePresentableManager__takeProcessAssertionForElement___block_invoke(uint64_t a1)
{
  v2 = SBLogSystemApertureNotice();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__SBSystemAperturePresentableManager__takeProcessAssertionForElement___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (SBSystemApertureController)elementRegistrar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementRegistrar);
  return (SBSystemApertureController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementRegistrar);
  objc_storeStrong((id *)&self->_elementsThatDidAppear, 0);
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_storeStrong((id *)&self->_presentablesToElements, 0);
}

- (void)revocationRequestedForPresentablesWithIdentification:reason:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  _DWORD *v1 = 138543362;
  void *v3 = v2;
  _os_log_error_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_ERROR, "Failed to find element for presentable: %{public}@", v4, 0xCu);
}

- (void)_registerElement:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain assertion when registering element: %{public}@", v4, 0xCu);
}

- (void)_removeAssertionForElement:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEBUG, "No assertion to remove for element: %{public}@", v4, 0xCu);
}

- (void)_removePresentableForElement:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_ERROR, "Failed to find presentable for element: %{public}@", v4, 0xCu);
}

- (void)_takeProcessAssertionForElement:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_t v5 = [a1 presentable];
  id v6 = BNEffectivePresentableDescription();
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for presentable: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x16u);
}

void __70__SBSystemAperturePresentableManager__takeProcessAssertionForElement___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Invalidated %@", (uint8_t *)&v3, 0xCu);
}

@end