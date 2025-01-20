@interface PRComplicationSceneHostViewController
- (PRComplicationSceneHostViewController)initWithScene:(id)a3;
- (void)_clearTouchDeliveryPolicies;
- (void)_updateTouchDeliveryPolicies;
- (void)invalidate;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PRComplicationSceneHostViewController

- (PRComplicationSceneHostViewController)initWithScene:(id)a3
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PRComplicationSceneHostViewController;
  v6 = [(PRComplicationSceneHostViewController *)&v34 init];
  v7 = v6;
  if (v6)
  {
    p_scene = (id *)&v6->_scene;
    objc_storeStrong((id *)&v6->_scene, a3);
    [*p_scene configureParameters:&__block_literal_global_18];
    v9 = [*p_scene uiPresentationManager];
    uint64_t v10 = [v9 createPresenterWithIdentifier:@"complications"];
    id v33 = v5;
    scenePresenter = v7->_scenePresenter;
    v7->_scenePresenter = (UIScenePresenter *)v10;

    [(UIScenePresenter *)v7->_scenePresenter modifyPresentationContext:&__block_literal_global_7];
    [(UIScenePresenter *)v7->_scenePresenter activate];
    v12 = [(UIScenePresenter *)v7->_scenePresenter presentationView];
    [v12 setClipsToBounds:1];
    v13 = [v12 layer];
    [v13 setName:@"Scene View"];

    [*p_scene activateWithTransitionContext:0];
    v14 = [*p_scene layerManager];
    [v14 addObserver:v7];

    v15 = [(PRComplicationSceneHostViewController *)v7 view];
    [v15 addSubview:v12];

    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(PRComplicationSceneHostViewController *)v7 view];
    v17 = (void *)MEMORY[0x1E4F1CA48];
    v32 = [v12 leadingAnchor];
    v31 = [v16 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v29 = [v12 trailingAnchor];
    v28 = [v16 trailingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v35[1] = v27;
    v26 = [v12 topAnchor];
    v18 = [v16 topAnchor];
    v19 = [v26 constraintEqualToAnchor:v18];
    v35[2] = v19;
    v20 = [v12 bottomAnchor];
    v21 = [v16 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v35[3] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    v24 = [v17 arrayWithArray:v23];

    [MEMORY[0x1E4F28DC8] activateConstraints:v24];
    id v5 = v33;
  }

  return v7;
}

uint64_t __55__PRComplicationSceneHostViewController_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSettingsWithBlock:&__block_literal_global_3];
}

void __55__PRComplicationSceneHostViewController_initWithScene___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F62420];
  id v4 = a2;
  v3 = [v2 mainConfiguration];
  [v4 setDisplayConfiguration:v3];

  [v4 setForeground:1];
}

void __55__PRComplicationSceneHostViewController_initWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setBackgroundColorWhileHosting:0];
  [v2 setBackgroundColorWhileNotHosting:0];
  [v2 setShouldPassthroughHitTestEventsIfTransparent:1];
}

- (void)invalidate
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  [(FBScene *)self->_scene setDelegate:0];
  [(FBScene *)self->_scene invalidate];
  scene = self->_scene;
  self->_scene = 0;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F92830]);
  [(PRComplicationSceneHostViewController *)self setView:v3];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PRComplicationSceneHostViewController;
  [(PRComplicationSceneHostViewController *)&v13 viewDidLayoutSubviews];
  id v3 = [(PRComplicationSceneHostViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  uint64_t v6 = [v5 interfaceOrientation];

  [v3 bounds];
  scene = self->_scene;
  v12[1] = 3221225472;
  if ((unint64_t)(v6 - 3) >= 2) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v8;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[2] = __62__PRComplicationSceneHostViewController_viewDidLayoutSubviews__block_invoke;
  v12[3] = &__block_descriptor_72_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
  if ((unint64_t)(v6 - 3) >= 2) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v7;
  }
  v12[4] = 0;
  v12[5] = 0;
  v12[6] = v10;
  v12[7] = v11;
  v12[8] = v6;
  [(FBScene *)scene performUpdate:v12];
}

void __62__PRComplicationSceneHostViewController_viewDidLayoutSubviews__block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
  [v7 setInterfaceOrientation:*((void *)a1 + 8)];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PRComplicationSceneHostViewController;
  [(PRComplicationSceneHostViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(PRComplicationSceneHostViewController *)self _updateTouchDeliveryPolicies];
  }
  else {
    [(PRComplicationSceneHostViewController *)self _clearTouchDeliveryPolicies];
  }
}

- (void)_updateTouchDeliveryPolicies
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  double v3 = [(PRComplicationSceneHostViewController *)self view];
  double v4 = [v3 _window];

  if (v4)
  {
    double v5 = [(FBScene *)self->_scene layerManager];
    objc_super v6 = [v5 layers];

    id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions allKeys];
    v42 = (void *)[v7 initWithArray:v8];

    v9 = [(PRComplicationSceneHostViewController *)self view];
    uint64_t v10 = [v9 _window];
    unsigned int v39 = [v10 _contextId];

    uint64_t v11 = PRLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v60 = self;
      __int16 v61 = 2114;
      id v62 = v6;
      _os_log_impl(&dword_18C1C4000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Updating touch delivery policies for layers: %{public}@", buf, 0x16u);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v12)
    {
      uint64_t v41 = *(void *)v55;
      *(void *)&long long v13 = 134218498;
      long long v38 = v13;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v55 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "contextID", v38);
          v16 = [NSNumber numberWithUnsignedInt:v15];
          [v42 removeObject:v16];

          touchDeliveryPolicyAssertions = self->_touchDeliveryPolicyAssertions;
          v18 = [NSNumber numberWithUnsignedInt:v15];
          v19 = [(NSMutableDictionary *)touchDeliveryPolicyAssertions objectForKey:v18];
          LODWORD(touchDeliveryPolicyAssertions) = v19 == 0;

          if (touchDeliveryPolicyAssertions)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F4F3E8]);
            v21 = [MEMORY[0x1E4F4F3E0] policyRequiringSharingOfTouchesDeliveredToChildContextId:v15 withHostContextId:v39];
            v22 = [v20 endpoint];
            [v21 setAssertionEndpoint:v22];

            objc_initWeak(&location, self);
            uint64_t v47 = MEMORY[0x1E4F143A8];
            uint64_t v48 = 3221225472;
            v49 = __69__PRComplicationSceneHostViewController__updateTouchDeliveryPolicies__block_invoke;
            v50 = &unk_1E54DBB10;
            objc_copyWeak(&v52, &location);
            id v23 = v21;
            id v51 = v23;
            v24 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
            if (v24)
            {
              v25 = PRLogCommon();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v38;
                v60 = self;
                __int16 v61 = 2114;
                id v62 = v20;
                __int16 v63 = 1024;
                int v64 = v15;
                _os_log_impl(&dword_18C1C4000, v25, OS_LOG_TYPE_DEFAULT, "[%p] Saving touch policy assertion %{public}@ for context id %u", buf, 0x1Cu);
              }

              v26 = self->_touchDeliveryPolicyAssertions;
              if (!v26)
              {
                v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v28 = self->_touchDeliveryPolicyAssertions;
                self->_touchDeliveryPolicyAssertions = v27;

                v26 = self->_touchDeliveryPolicyAssertions;
              }
              v29 = [NSNumber numberWithUnsignedInt:v15];
              [(NSMutableDictionary *)v26 setObject:v20 forKey:v29];

              objc_msgSend(v24, "ipc_addPolicy:", v23);
            }

            objc_destroyWeak(&v52);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v12);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v42;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v30);
          }
          objc_super v34 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          v35 = [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions objectForKey:v34];
          [v35 invalidate];
          [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions removeObjectForKey:v34];
          v36 = PRLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            int v37 = [v34 unsignedIntValue];
            *(_DWORD *)buf = 134218498;
            v60 = self;
            __int16 v61 = 2114;
            id v62 = v35;
            __int16 v63 = 1024;
            int v64 = v37;
            _os_log_impl(&dword_18C1C4000, v36, OS_LOG_TYPE_DEFAULT, "[%p] Invalidating assertion %{public}@ for context id %u", buf, 0x1Cu);
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
      }
      while (v31);
    }
  }
}

void __69__PRComplicationSceneHostViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = PRLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_clearTouchDeliveryPolicies
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = PRLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    double v5 = self;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "[%p] Clearing any touch delivery policies", (uint8_t *)&v4, 0xCu);
  }

  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_28];
  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions removeAllObjects];
}

uint64_t __68__PRComplicationSceneHostViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end