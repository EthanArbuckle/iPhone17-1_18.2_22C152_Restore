@interface SBSystemActionSceneElementProvider
+ (id)previewContextForSystemAction:(uint64_t)a1;
+ (uint64_t)providesSceneElementForSystemAction:(uint64_t)a1;
+ (void)_getClientIdentifier:(void *)a3 elementIdentifier:(void *)a4 forSystemAction:(void *)a5 withContext:;
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (UIColor)keyColor;
- (UIView)leadingView;
- (UIView)trailingView;
- (id)initWithSystemAction:(void *)a3 systemApertureController:(void *)a4 context:;
- (id)previewForReason:(uint64_t)a1;
- (int64_t)contentRole;
- (unint64_t)presentationBehaviors;
- (void)_configureIdentificationWithContext:(uint64_t)a1;
- (void)_configurePlaceholderContentProviders;
- (void)_deactivateAndRemoveSceneElementIfNecessaryWithReason:(uint64_t)a1;
- (void)noteSceneClientWantsControlOfElementWithAssertionTransferBlock:(id)a3;
- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3;
- (void)providesElementForSystemAction:(void *)a3 withContext:;
@end

@implementation SBSystemActionSceneElementProvider

+ (uint64_t)providesSceneElementForSystemAction:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 configuredAction];

  v4 = [v3 sectionIdentifier];

  if (([v4 isEqualToString:@"VoiceMemos"] & 1) != 0
    || ([v4 isEqualToString:@"Translate"] & 1) != 0
    || ([v4 isEqualToString:@"MusicRecognition"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 isEqualToString:@"Shortcuts"];
  }

  return v5;
}

+ (id)previewContextForSystemAction:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = +[SBSystemApertureSceneElement activeElements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSystemActionSceneElementProvider_previewContextForSystemAction___block_invoke;
  v9[3] = &unk_1E6AFB4F0;
  id v10 = v2;
  id v4 = v2;
  uint64_t v5 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v9);

  v6 = [v5 userInfo];
  v7 = [v6 objectForKey:@"SBSystemActionSceneElementPreviewContext"];

  return v7;
}

uint64_t __68__SBSystemActionSceneElementProvider_previewContextForSystemAction___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"SBSystemActionSceneElementSystemAction"];

  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  return v5;
}

- (id)initWithSystemAction:(void *)a3 systemApertureController:(void *)a4 context:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:](sel_initWithSystemAction_systemApertureController_context_);
    }
LABEL_12:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8848FF0);
  }
  if (!v9)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemApertureController != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:](sel_initWithSystemAction_systemApertureController_context_);
    }
    goto LABEL_12;
  }
  v14.receiver = a1;
  v14.super_class = (Class)SBSystemActionSceneElementProvider;
  v11 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 10, a2);
    objc_storeWeak(a1 + 1, v9);
    objc_storeStrong(a1 + 4, a4);
    -[SBSystemActionSceneElementProvider _configureIdentificationWithContext:]((uint64_t)a1, v10);
    -[SBSystemActionSceneElementProvider _configurePlaceholderContentProviders]((uint64_t)a1);
  }
LABEL_6:

  return a1;
}

- (void)_configureIdentificationWithContext:(uint64_t)a1
{
  if (a1)
  {
    id v8 = 0;
    id v9 = 0;
    +[SBSystemActionSceneElementProvider _getClientIdentifier:elementIdentifier:forSystemAction:withContext:]((uint64_t)SBSystemActionSceneElementProvider, &v9, &v8, *(void **)(a1 + 80), a2);
    v3 = v9;
    id v4 = v8;
    id v7 = v3;
    uint64_t v5 = [[SBSAElementIdentification alloc] initWithClientIdentifier:v7 elementIdentifier:v4];
    v6 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v5;
  }
}

- (void)_configurePlaceholderContentProviders
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)providesElementForSystemAction:(void *)a3 withContext:
{
  v3 = a1;
  if (a1)
  {
    id v9 = 0;
    id v10 = 0;
    +[SBSystemActionSceneElementProvider _getClientIdentifier:elementIdentifier:forSystemAction:withContext:]((uint64_t)SBSystemActionSceneElementProvider, &v10, &v9, a2, a3);
    id v4 = v10;
    id v5 = v9;
    uint64_t v6 = [v3 clientIdentifier];
    if ([v6 isEqualToString:v4])
    {
      uint64_t v7 = [v3 elementIdentifier];
      v3 = (void *)[v7 isEqualToString:v5];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (void)_getClientIdentifier:(void *)a3 elementIdentifier:(void *)a4 forSystemAction:(void *)a5 withContext:
{
  id v22 = a5;
  id v8 = a4;
  self;
  id v9 = [v8 configuredAction];

  id v10 = [v9 sectionIdentifier];
  v11 = [v22 clientIdentifier];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 associatedBundleIdentifier];
  }
  objc_super v14 = v13;

  uint64_t v15 = [v22 elementIdentifier];
  v16 = (void *)v15;
  v17 = (void *)*MEMORY[0x1E4FA7F18];
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  if ([v10 isEqualToString:@"VoiceMemos"])
  {
    id v19 = (id)*MEMORY[0x1E4FA7F68];

    id v18 = v19;
  }
  id v20 = v14;
  *a2 = v20;
  id v21 = v18;
  *a3 = v21;
}

- (id)previewForReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[SBSystemApertureSceneElement activeElements];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke;
    v25[3] = &unk_1E6AFB4F0;
    v25[4] = a1;
    objc_msgSend(v4, "bs_firstObjectPassingTest:", v25);
    id v5 = (SBSystemApertureSceneElement *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, (id)a1);
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v7 = [SBSystemApertureSceneElement alloc];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_2;
      v20[3] = &unk_1E6AFB568;
      objc_copyWeak(&v23, &location);
      id v8 = WeakRetained;
      id v21 = v8;
      uint64_t v22 = a1;
      id v5 = [(SBSystemApertureSceneElement *)v7 initWithScene:0 placeholderContentProvider:a1 statusBarBackgroundActivitiesSuppresser:v8 readyForPresentationHandler:v20];
      objc_storeStrong((id *)(a1 + 88), v5);

      objc_destroyWeak(&v23);
    }
    if (![(SBSystemApertureSceneElement *)v5 isActivated]) {
      [(SBSystemApertureSceneElement *)v5 activate];
    }
    id v9 = [(SBSystemApertureSceneElement *)v5 userInfo];
    [v9 setObject:*(void *)(a1 + 80) forKey:@"SBSystemActionSceneElementSystemAction"];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      [v9 setObject:v10 forKey:@"SBSystemActionSceneElementPreviewContext"];
    }
    v11 = [v9 objectForKey:@"SBSystemActionSceneElementCompoundPreviewAssertion"];
    if (!v11)
    {
      objc_initWeak(&from, v5);
      v12 = [SBSystemActionCompoundPreviewAssertion alloc];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_5;
      v16[3] = &unk_1E6AFB590;
      objc_copyWeak(&v17, &from);
      objc_copyWeak(&v18, &location);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_6;
      v14[3] = &unk_1E6AFB5B8;
      objc_copyWeak(&v15, &from);
      v11 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v12, @"Scene Previewing", v16, v14);
      [v9 setObject:v11 forKey:@"SBSystemActionSceneElementCompoundPreviewAssertion"];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
    }
    a1 = -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)v11, v3);

    objc_destroyWeak(&location);
  }

  return (id)a1;
}

uint64_t __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clientIdentifier];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) clientIdentifier];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 elementIdentifier];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 40) elementIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && a3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) registerElement:v5];
    uint64_t v8 = (void *)WeakRetained[6];
    WeakRetained[6] = v7;

    id v9 = (void *)WeakRetained[6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_3;
    v10[3] = &unk_1E6AFB540;
    v10[4] = *(void *)(a1 + 40);
    [v9 addInvalidationBlock:v10];
  }
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  if ([v2 isActivated] && (objc_msgSend(v2, "isDeactivating") & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_4;
    v5[3] = &unk_1E6AFB518;
    v5[4] = *(void *)(a1 + 32);
    [v2 deactivateWhenRemovedWithHandler:v5];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;
  }
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = -[SBSystemActionCompoundPreviewAssertion state](a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPreviewing:v3 & 1];
  [WeakRetained setUrgent:HIBYTE(v3) & 1];
  [WeakRetained setExpanding:(v3 >> 8) & 1];
  [WeakRetained setProminent:HIWORD(v3) & 1];
  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    -[SBSystemActionSceneElementProvider _deactivateAndRemoveSceneElementIfNecessaryWithReason:]((uint64_t)v4, @"Compound previewing ended");
  }
}

- (void)_deactivateAndRemoveSceneElementIfNecessaryWithReason:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 88);
    id v4 = *(id *)(a1 + 48);
    if (v4)
    {
      if ([v3 isActivated] && (objc_msgSend(v3, "isDeactivating") & 1) == 0) {
        [v3 deactivateWhenRemovedWithHandler:0];
      }
      if ([v4 isValid]) {
        [v4 invalidateWithReason:v5];
      }
    }
  }
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained pop];
  }
}

- (NSString)elementIdentifier
{
  return (NSString *)[(SAElementIdentifying *)self->_elementIdentification elementIdentifier];
}

- (NSString)clientIdentifier
{
  return (NSString *)[(SAElementIdentifying *)self->_elementIdentification clientIdentifier];
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    id v4 = self->_leadingPlaceholderContentViewProvider;
    [(SBUISystemApertureContentViewProviding *)v4 setContentContainer:self];
    id v5 = [(SBUISystemApertureContentViewProviding *)v4 providedView];
    uint64_t v6 = self->_leadingView;
    self->_leadingView = v5;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    id v4 = self->_trailingPlaceholderContentViewProvider;
    [(SBUISystemApertureContentViewProviding *)v4 setContentContainer:self];
    id v5 = [(SBUISystemApertureContentViewProviding *)v4 providedView];
    uint64_t v6 = self->_trailingView;
    self->_trailingView = v5;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (int64_t)contentRole
{
  return 2;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (void)noteSceneClientWantsControlOfElementWithAssertionTransferBlock:(id)a3
{
  elementAssertion = self->_elementAssertion;
  self->_elementAssertion = 0;
  id v5 = elementAssertion;
  uint64_t v6 = (void (**)(id, id))a3;

  v6[2](v6, v5);
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  if (self) {
    sceneElement = self->_sceneElement;
  }
  else {
    sceneElement = 0;
  }
  id v4 = sceneElement;
  id v5 = [(SBSystemApertureSceneElement *)v4 layoutHost];
  [v5 preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneElement, 0);
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_elementAssertion, 0);
  objc_storeStrong((id *)&self->_elementIdentification, 0);
  objc_storeStrong((id *)&self->_previewContext, 0);
  objc_storeStrong((id *)&self->_trailingPlaceholderContentViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingPlaceholderContentViewProvider, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
}

- (void)initWithSystemAction:(const char *)a1 systemApertureController:context:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSystemAction:(const char *)a1 systemApertureController:context:.cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end