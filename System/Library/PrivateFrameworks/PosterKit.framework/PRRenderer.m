@interface PRRenderer
- (CSProminentDisplayViewController)complicationsPreviewProminentDisplayViewController;
- (CSProminentDisplayViewController)timePreviewProminentDisplayViewController;
- (NSArray)attachments;
- (PRPosterRenderingEnvironment)environment;
- (PRPosterRenderingPreferences)preferences;
- (PRRenderer)initWithDelegate:(id)a3;
- (PRRenderer)initWithScene:(id)a3;
- (PRRenderingView)_viewForLevel:(uint64_t)a1;
- (UIScene)_scene;
- (UIView)backgroundView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (UIWindowScene)scene;
- (double)_collectContentSizeForView:(uint64_t)a1;
- (id)_actionsAfterHandlingAppIntentsHandshakeActionsInActions:(void *)a1;
- (id)_makeComplicationPreviewSceneWithSpecification:(uint64_t)a1;
- (id)_makeGraphicComplicationPreviewScene;
- (id)_makeInlineComplicationPreviewScene;
- (id)_makeSidebarComplicationPreviewScene;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)_stateCaptureDescription;
- (id)extendRenderSessionForReason:(id)a3;
- (id)extendRenderingSessionForReason:(id)a3;
- (id)extensionBundleURL;
- (uint64_t)_derivedInterfaceOrientation;
- (uint64_t)_isAmbientSupportedForRendererScene;
- (uint64_t)_isDepthEffectEffectivelyDisabled;
- (void)_cleanupAfterNotifyingDelegateOfInvalidation;
- (void)_configureProminentDisplay;
- (void)_issueSceneInvalidated:(uint64_t)a1;
- (void)_moveViewForLevel:(uint64_t)a3 toLevel:;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_reapUnusedViews;
- (void)_registerForAmbientPresentationTraitChangesIfNecessary;
- (void)_updateAnimatedUnlockProgress:(id *)a1;
- (void)_updateContentSize;
- (void)_updateDepthEffectIfNeededFrom:(uint64_t)a1 to:;
- (void)_updateEnvironmentForUpdatedTraitCollection;
- (void)_updateOrientationIfNeededFrom:(void *)a3 to:;
- (void)_updateProminentViewSizingAndTransforms;
- (void)_updateRenderingExtensions;
- (void)_updateViewsIfNeededFrom:(void *)a3 to:;
- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1;
- (void)dealloc;
- (void)invalidateView:(id)a3;
- (void)noteContentSignificantlyChanged;
- (void)reportUpdatedEnvironment:(void *)a3 withTransition:;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setComplicationsPreviewProminentDisplayViewController:(id)a3;
- (void)setTimePreviewProminentDisplayViewController:(id)a3;
- (void)updatePreferences:(id)a3;
- (void)updatedValuesForView:(id)a3;
@end

@implementation PRRenderer

- (PRRenderer)initWithDelegate:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (initWithDelegate__onceToken != -1) {
    dispatch_once(&initWithDelegate__onceToken, &__block_literal_global_43);
  }
  v36.receiver = self;
  v36.super_class = (Class)PRRenderer;
  v6 = [(PRRenderer *)&v36 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = objc_opt_new();
    viewsByLevel = v7->_viewsByLevel;
    v7->_viewsByLevel = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    sceneInvalidationActions = v7->_sceneInvalidationActions;
    v7->_sceneInvalidationActions = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    preferences = v7->_preferences;
    v7->_preferences = (PRPosterPreferencesImpl *)v12;

    v14 = (void *)MEMORY[0x1E4F4F6E8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __31__PRRenderer_initWithDelegate___block_invoke_2;
    v34[3] = &unk_1E54DCA10;
    v15 = v7;
    v35 = v15;
    uint64_t v16 = [v14 assertionWithIdentifier:@"Render Extension" stateDidChangeHandler:v34];
    sessionExtensions = v15->_sessionExtensions;
    v15->_sessionExtensions = (BSCompoundAssertion *)v16;

    v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    unlockAnimator = v15->_unlockAnimator;
    v15->_unlockAnimator = v18;

    [(UIViewFloatAnimatableProperty *)v15->_unlockAnimator setValue:0.0];
    objc_initWeak(&location, v15);
    objc_initWeak(&from, v15->_unlockAnimator);
    v20 = (void *)MEMORY[0x1E4FB1EB0];
    v37[0] = v15->_unlockAnimator;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __31__PRRenderer_initWithDelegate___block_invoke_4;
    v29[3] = &unk_1E54DCA38;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    [v20 _createTransformerWithInputAnimatableProperties:v21 presentationValueChangedCallback:v29];

    [(id)*MEMORY[0x1E4FB2608] _stopHangTracer];
    if ([(id)__knownRenderers count])
    {
      v22 = PRLogRendering();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PRRenderer initWithDelegate:](v22);
      }
    }
    [(id)__knownRenderers addObject:v15];
    objc_initWeak(&v28, v15);
    id v23 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v27, &v28);
    uint64_t v24 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v15->_stateCaptureHandle;
    v15->_stateCaptureHandle = (BSInvalidatable *)v24;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v7;
}

uint64_t __31__PRRenderer_initWithDelegate___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v1 = __knownRenderers;
  __knownRenderers = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __31__PRRenderer_initWithDelegate___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

void __31__PRRenderer_initWithDelegate___block_invoke_3(uint64_t a1)
{
}

- (void)_updateRenderingExtensions
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = [*(id *)(a1 + 56) isActive];
    uint64_t v3 = *(void *)(a1 + 64);
    if (v2)
    {
      if (!v3)
      {
        v4 = PRLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = a1;
          _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Acquiring extended rendering assertion.", (uint8_t *)&buf, 0xCu);
        }

        *(unsigned char *)(a1 + 72) = 1;
        id v5 = objc_alloc(MEMORY[0x1E4F96318]);
        v6 = [MEMORY[0x1E4F96478] currentProcess];
        v7 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.PosterKit" name:@"FinishRender"];
        v48[0] = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
        uint64_t v9 = [v5 initWithExplanation:@"ExtendRenderSession" target:v6 attributes:v8];
        uint64_t v10 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v9;

        v11 = *(void **)(a1 + 64);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke;
        v42[3] = &unk_1E54DCBC8;
        v42[4] = a1;
        [v11 acquireWithInvalidationHandler:v42];
      }
    }
    else if (v3)
    {
      uint64_t v12 = PRLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_18C1C4000, v12, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Dropping extended rendering assertion.", (uint8_t *)&buf, 0xCu);
      }

      id v13 = *(id *)(a1 + 64);
      v14 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      *(unsigned char *)(a1 + 72) = 0;
LABEL_12:
      if (*(unsigned char *)(a1 + 72)) {
        int v15 = v2;
      }
      else {
        int v15 = 0;
      }
      uint64_t v16 = [*(id *)(a1 + 216) _FBSScene];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke_153;
      v40[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
      char v41 = v15;
      objc_msgSend(v16, "pr_performUpdate:", v40);
      v17 = [*(id *)(a1 + 16) role];
      if (((v15 | [v17 isEqual:@"PRPosterRoleLockScreen"] ^ 1) & 1) == 0)
      {
        BOOL v18 = *(unsigned char *)(a1 + 73) == 0;

        if (!v18) {
          goto LABEL_18;
        }
        v17 = [v16 settings];
        int v19 = [v17 isForeground];
        [*(id *)(a1 + 16) unlockProgress];
        if ((v19 & BSFloatIsOne()) == 1)
        {
          *(unsigned char *)(a1 + 73) = 1;
          if (objc_opt_respondsToSelector())
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v46 = 0x2020000000;
            char v47 = 0;
            MEMORY[0x192F90C30](9, 0, 0, 0);
            v20 = PRLogRendering();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v43 = 134217984;
              uint64_t v44 = a1;
              _os_log_impl(&dword_18C1C4000, v20, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posting kCARenderMetalLayerMarkPurgeable notification.", v43, 0xCu);
            }

            v21 = PRLogRendering();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v43 = 134217984;
              uint64_t v44 = a1;
              _os_log_impl(&dword_18C1C4000, v21, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Calling CABackingStoreCollect.", v43, 0xCu);
            }

            uint64_t v33 = MEMORY[0x1E4F143A8];
            uint64_t v34 = 3221225472;
            v35 = __40__PRRenderer__updateRenderingExtensions__block_invoke_157;
            objc_super v36 = &unk_1E54DCC10;
            p_long long buf = &buf;
            id v22 = v13;
            id v37 = v22;
            uint64_t v38 = a1;
            CABackingStoreCollectWithCompletionHandler();
            id v23 = PRLogRendering();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v43 = 134217984;
              uint64_t v44 = a1;
              _os_log_impl(&dword_18C1C4000, v23, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Notifying renderer delegates to drop excess resources.", v43, 0xCu);
            }

            uint64_t v24 = *(void **)(a1 + 8);
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke_158;
            v29[3] = &unk_1E54DCC10;
            v32 = &buf;
            id v30 = v22;
            uint64_t v31 = a1;
            [v24 renderer:a1 shouldDropExcessResourcesWithCompletionHandler:v29];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            v25 = PRLogRendering();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18C1C4000, v25, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posting kCARenderMetalLayerMarkPurgeable notification.", (uint8_t *)&buf, 0xCu);
            }

            MEMORY[0x192F90C30](9, 0, 0, 0);
            v26 = PRLogRendering();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18C1C4000, v26, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posted kCARenderMetalLayerMarkPurgeable notification.", (uint8_t *)&buf, 0xCu);
            }

            id v27 = PRLogRendering();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18C1C4000, v27, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Calling CABackingStoreCollect.", (uint8_t *)&buf, 0xCu);
            }

            id v28 = v13;
            CABackingStoreCollectWithCompletionHandler();
          }
          goto LABEL_19;
        }
      }

LABEL_18:
      [v13 invalidate];
LABEL_19:

      return;
    }
    id v13 = 0;
    goto LABEL_12;
  }
}

void __31__PRRenderer_initWithDelegate___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && *((unsigned char *)WeakRetained + 168))
  {
    [v2 presentationValue];
    -[PRRenderer _updateAnimatedUnlockProgress:](WeakRetained, v3);
  }
}

- (void)_updateAnimatedUnlockProgress:(id *)a1
{
  if (a1)
  {
    BSDispatchQueueAssertMain();
    [a1[2] unlockProgress];
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      double v4 = 0.0;
      if ((BSFloatIsZero() & 1) == 0)
      {
        if (BSFloatIsOne()) {
          double v4 = 1.0;
        }
        else {
          double v4 = a2;
        }
      }
      uint64_t v5 = [a1[2] copy];
      id v6 = a1[2];
      a1[2] = (id)v5;

      [a1[2] setUnlockProgress:v4];
      v7 = PRLogRendering();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PRRenderer _updateAnimatedUnlockProgress:]();
      }

      -[PRRenderer reportUpdatedEnvironment:withTransition:](a1, a1[2], 0);
    }
  }
}

id __31__PRRenderer_initWithDelegate___block_invoke_22(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = -[PRRenderer _stateCaptureDescription](WeakRetained);

  return v2;
}

- (id)_stateCaptureDescription
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1[27] _FBSScene];
    double v3 = [v2 settings];
    double v4 = objc_msgSend(v3, "pui_posterContents");

    uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:v1];
    id v6 = (id)[v5 appendObject:v4 withName:@"posterPath"];
    v7 = [v1 environment];
    id v8 = (id)[v5 appendObject:v7 withName:@"environment"];

    uint64_t v9 = [v1[27] _FBSScene];
    id v10 = (id)[v5 appendObject:v9 withName:@"scene"];

    id v11 = (id)[v5 appendBool:*((unsigned __int8 *)v1 + 25) withName:@"invalidating"];
    id v12 = (id)[v5 appendBool:*((unsigned __int8 *)v1 + 24) withName:@"invalidated"];
    id v1 = [v5 build];
  }
  return v1;
}

- (UIView)backgroundView
{
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, -2000);
}

- (PRRenderingView)_viewForLevel:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BSDispatchQueueAssertMain();
    double v4 = *(void **)(a1 + 40);
    uint64_t v5 = [NSNumber numberWithInteger:a2];
    id v6 = [v4 objectForKey:v5];

    if (!v6)
    {
      v7 = [*(id *)(a1 + 216) _FBSScene];
      id v8 = [v7 settings];

      id v6 = -[PRRenderingView initWithOwner:scene:level:extensionUserInteractionEnabled:]([PRRenderingView alloc], "initWithOwner:scene:level:extensionUserInteractionEnabled:", a1, *(void *)(a1 + 216), a2, objc_msgSend(v8, "pui_isExtensionUserInteractionEnabled"));
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = [NSNumber numberWithInteger:a2];
      [v9 setObject:v6 forKey:v10];

      id v11 = PRLogRendering();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 8);
        int v14 = 134218240;
        uint64_t v15 = v12;
        __int16 v16 = 2048;
        uint64_t v17 = [(PRRenderingView *)v6 level];
        _os_log_impl(&dword_18C1C4000, v11, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Created view at level %ld", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (UIView)foregroundView
{
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, -1000);
}

- (UIView)floatingView
{
  int isDepthEffectEffectively = -[PRRenderer _isDepthEffectEffectivelyDisabled]((uint64_t)self);
  double v4 = &PRPosterLevelFloatingUnder;
  if (!isDepthEffectEffectively) {
    double v4 = &PRPosterLevelFloating;
  }
  uint64_t v5 = *v4;
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, v5);
}

- (uint64_t)_isDepthEffectEffectivelyDisabled
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [*(id *)(a1 + 216) _FBSScene];
    char v3 = [*(id *)(v1 + 16) isDepthEffectDisabled];
    int v4 = [*(id *)(v1 + 16) isDepthEffectDisallowed];
    uint64_t v5 = [v2 settings];
    uint64_t v6 = objc_msgSend(v5, "pui_deviceOrientation");
    int v7 = objc_msgSend(v5, "pui_isComplicationRowConfigured");
    if ((unint64_t)(v6 - 1) < 2) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    unsigned int v9 = v4 | v8;
    if (v3) {
      uint64_t v1 = 1;
    }
    else {
      uint64_t v1 = v9;
    }
  }
  return v1;
}

- (void)setAttachments:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_attachments isEqualToArray:v4])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v5 = self->_attachments;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "level"));
          id v11 = [(NSMutableDictionary *)self->_viewsByLevel objectForKey:v10];
          [(NSMutableDictionary *)self->_viewsByLevel removeObjectForKey:v10];
          [v11 invalidate];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    uint64_t v12 = (NSArray *)[v4 copy];
    attachments = self->_attachments;
    self->_attachments = v12;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v14 = self->_attachments;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "level"));
          v21 = [(NSMutableDictionary *)self->_viewsByLevel objectForKey:v20];

          if (!v21)
          {
            id v22 = -[PRRenderingView initWithOwner:scene:level:extensionUserInteractionEnabled:]([PRPosterSceneAttachmentView alloc], "initWithOwner:scene:level:extensionUserInteractionEnabled:", self, self->_scene, [v19 level], 0);
            [(PRPosterSceneAttachmentView *)v22 setAttachment:v19];
            [(NSMutableDictionary *)self->_viewsByLevel setObject:v22 forKey:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
  }
}

- (void)updatePreferences:(id)a3
{
  id v4 = (void (**)(id, PRPosterPreferencesImpl *, id))a3;
  BSDispatchQueueAssertMain();
  id v5 = (id)objc_opt_new();
  v4[2](v4, self->_preferences, v5);

  [(UIWindowScene *)self->_scene pr_updatePreferences:self->_preferences withTransition:v5];
  -[PRRenderer _reapUnusedViews]((uint64_t)self);
}

- (void)_reapUnusedViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = objc_msgSend(*(id *)(a1 + 40), "allKeys", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = [*(id *)(a1 + 40) objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
          if ([v7 isEmpty]) {
            [v7 invalidate];
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (id)extendRenderingSessionForReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_disableReentrantRenderingExtensionForMemoryReclamation)
  {
    uint64_t v5 = PRLogRendering();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "Not extending render session because disabled re-entrant rendering extension for memory reclamation.", buf, 2u);
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"[%u] %@", ++extendRenderingSessionForReason__count, v4];

    long long v8 = PRLogRendering();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_18C1C4000, v8, OS_LOG_TYPE_DEFAULT, "Extending render session for reason: %@", buf, 0xCu);
    }

    long long v9 = [(BSCompoundAssertion *)self->_sessionExtensions acquireForReason:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__PRRenderer_extendRenderingSessionForReason___block_invoke;
    v16[3] = &unk_1E54DCA88;
    id v4 = v7;
    id v17 = v4;
    uint64_t v5 = v9;
    uint64_t v18 = v5;
    long long v10 = (void *)MEMORY[0x192F91830](v16);
    uint64_t v6 = [[PRRenderingSession alloc] initWithReason:v4 invalidationBlock:v10];
    [(PRRenderingSession *)v6 timeRemaining];
    double v12 = v11;
    uint64_t v13 = PRLogRendering();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [NSNumber numberWithDouble:v12];
      *(_DWORD *)long long buf = 138543618;
      id v20 = v4;
      __int16 v21 = 2114;
      id v22 = v14;
      _os_log_impl(&dword_18C1C4000, v13, OS_LOG_TYPE_DEFAULT, "Extend rendering session, reason: %{public}@, %{public}@ seconds", buf, 0x16u);
    }
  }

  return v6;
}

uint64_t __46__PRRenderer_extendRenderingSessionForReason___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PRLogRendering();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_18C1C4000, v2, OS_LOG_TYPE_DEFAULT, "End rendering extension, reason: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invalidate];
}

- (id)extendRenderSessionForReason:(id)a3
{
  uint64_t v3 = [(PRRenderer *)self extendRenderingSessionForReason:a3];
  id v4 = [v3 assertion];

  return v4;
}

- (void)noteContentSignificantlyChanged
{
  id v3 = (id)objc_opt_new();
  [v3 setContentSignificantlyChanged:1];
  [(UIWindowScene *)self->_scene pr_updatePreferences:self->_preferences withTransition:v3];
}

- (id)extensionBundleURL
{
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    }
    else
    {
      uint64_t v1 = 0;
    }
    id v2 = [v1 bundleURL];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)dealloc
{
  scene = self->_scene;
  if (scene && self->_ambientPresentationTraitChangeRegistration) {
    -[UIWindowScene unregisterForTraitChanges:](scene, "unregisterForTraitChanges:");
  }
  [(id)__knownRenderers removeObject:self];
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PRRenderer;
  [(PRRenderer *)&v4 dealloc];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (FBScene *)a3;
  id v7 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        uint64_t v13 = self;
        if (objc_opt_isKindOfClass())
        {
          int v14 = [v12 isValid];

          if (v14)
          {
            if (self->_graphicComplicationScene == v6)
            {
              self->_int graphicComplicationsRendered = 1;
            }
            else if (self->_sidebarComplicationScene == v6)
            {
              self->_sidebarComplicationsRendered = 1;
            }
            else if (self->_inlineComplicationScene == v6)
            {
              self->_int inlineComplicationRendered = 1;
            }
          }
        }
        else
        {
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v15 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
      uint64_t v9 = v15;
    }
    while (v15);
  }
  uint64_t v16 = [(UIWindowScene *)self->_scene _FBSScene];
  id v17 = [v16 settings];

  int v18 = objc_msgSend(v17, "pui_isInlineComplicationConfigured");
  int v19 = objc_msgSend(v17, "pui_isComplicationRowConfigured");
  int v20 = objc_msgSend(v17, "pui_isComplicationSidebarConfigured");
  uint64_t v21 = objc_msgSend(v17, "pui_deviceOrientation");
  if ((unint64_t)(v21 - 1) < 2) {
    int v22 = v19;
  }
  else {
    int v22 = 0;
  }
  if ((unint64_t)(v21 - 3) < 2) {
    int v23 = v20;
  }
  else {
    int v23 = 0;
  }
  if (v18) {
    int inlineComplicationRendered = self->_inlineComplicationRendered;
  }
  else {
    int inlineComplicationRendered = v22 | v23;
  }
  if ((v22 & inlineComplicationRendered) == 1)
  {
    int graphicComplicationsRendered = self->_graphicComplicationsRendered;
    if (!v23) {
      goto LABEL_29;
    }
  }
  else
  {
    int graphicComplicationsRendered = inlineComplicationRendered & ~v22;
    if (!v23)
    {
LABEL_29:
      if (!graphicComplicationsRendered) {
        goto LABEL_35;
      }
LABEL_34:
      long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F927C0]) initWithInfo:0 responder:0];
      long long v27 = [(UIWindowScene *)self->_scene _FBSScene];
      long long v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
      [v27 sendActions:v28];

      goto LABEL_35;
    }
  }
  if (graphicComplicationsRendered && self->_sidebarComplicationsRendered) {
    goto LABEL_34;
  }
LABEL_35:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v29 = [(NSMutableDictionary *)self->_viewsByLevel allValues];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "setExtensionUserInteractionEnabled:", objc_msgSend(v17, "pui_isExtensionUserInteractionEnabled"));
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v31);
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_scene)
  {
    uint64_t v32 = [NSString stringWithFormat:@"already have a scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRRenderer scene:willConnectToSession:options:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2810C4);
  }
  double v12 = v11;
  id v13 = v9;
  NSClassFromString(&cfstr_Uiwindowscene.isa);
  if (!v13)
  {
    uint64_t v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRRenderer scene:willConnectToSession:options:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C281128);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIWindowSceneClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRRenderer scene:willConnectToSession:options:]();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C28118CLL);
  }

  int v14 = PRLogRendering();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18C1C4000, v14, OS_LOG_TYPE_DEFAULT, "Scene did connect", buf, 2u);
  }

  objc_storeStrong((id *)&self->_scene, a3);
  [(UIWindowScene *)self->_scene setDelegate:self];
  [(UIWindowScene *)self->_scene _registerSceneComponent:self forKey:@"PRRenderer"];
  scene = self->_scene;
  v36[0] = self;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [(UIWindowScene *)scene _registerBSActionResponderArray:v16 forKey:@"PRRenderer"];

  id v17 = [(UIWindowScene *)self->_scene _FBSScene];
  int v18 = [v17 backlightSceneEnvironment];
  [v18 setSupportsAlwaysOn:1];

  int v19 = [v17 settings];
  int v20 = PRLogTelemetrySignposts();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18C1C4000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_INIT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  uint64_t v21 = [PRPosterEnvironmentImpl alloc];
  int v22 = [(UIWindowScene *)self->_scene traitCollection];
  int v23 = -[PRRenderer extensionBundleURL]((uint64_t)self);
  long long v24 = [(PRPosterEnvironmentImpl *)v21 initWithSceneSettings:v19 traitCollection:v22 targetConfig:0 extensionBundleURL:v23];
  environment = self->_environment;
  self->_environment = v24;

  if ([(PRPosterEnvironmentImpl *)self->_environment isPreview]
    || [(PRPosterEnvironmentImpl *)self->_environment isSnapshot])
  {
    [(id)*MEMORY[0x1E4FB2608] _stopHangTracer];
  }
  else
  {
    [(id)*MEMORY[0x1E4FB2608] _startHangTracer];
  }
  -[PRRenderer _updateViewsIfNeededFrom:to:](self, 0, v19);
  [(PRRenderingDelegate *)self->_delegate renderer:self didInitializeWithEnvironment:self->_environment];
  [(PRRenderer *)self didInitializeWithEnvironment:self->_environment];
  long long v26 = PRLogTelemetrySignposts();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18C1C4000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_INIT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  -[PRRenderer _updateContentSize]((uint64_t)self);
  -[PRRenderer _configureProminentDisplay]((id *)&self->super.isa);
  long long v27 = [[PRRenderingBackdropView alloc] initWithOwner:self scene:self->_scene];
  backdropView = self->_backdropView;
  self->_backdropView = v27;

  long long v29 = self->_backdropView;
  [(PRPosterEnvironmentImpl *)self->_environment backlightProgress];
  -[PRRenderingBackdropView setTargetBacklightProgress:](v29, "setTargetBacklightProgress:");
  uint64_t v30 = objc_msgSend(v19, "pui_sceneAttachments");
  [(PRRenderer *)self setAttachments:v30];

  uint64_t v31 = [v13 _FBSScene];
  [v31 updateClientSettingsWithBlock:&__block_literal_global_60_0];

  -[PRRenderer _registerForAmbientPresentationTraitChangesIfNecessary](self);
}

- (void)_updateViewsIfNeededFrom:(void *)a3 to:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    -[PRRenderer _updateOrientationIfNeededFrom:to:](a1, v6, v5);
    -[PRRenderer _updateDepthEffectIfNeededFrom:to:]((uint64_t)a1);
  }
}

- (void)_updateContentSize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v4 = [*(id *)(a1 + 40) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = -[PRRenderer _collectContentSizeForView:](a1, *(void **)(*((void *)&v13 + 1) + 8 * v8));
          if (v2 < v9) {
            double v2 = v9;
          }
          if (v3 < v10) {
            double v3 = v10;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    id v11 = [*(id *)(a1 + 216) _FBSScene];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__PRRenderer__updateContentSize__block_invoke;
    v12[3] = &__block_descriptor_48_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
    *(double *)&v12[4] = v2;
    *(double *)&v12[5] = v3;
    objc_msgSend(v11, "pr_performUpdate:", v12);
  }
}

- (void)_configureProminentDisplay
{
  v95[4] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  double v2 = [a1[27] _FBSScene];
  double v3 = [v2 settings];

  int v4 = objc_msgSend(v3, "pui_isInlineComplicationConfigured");
  int v5 = objc_msgSend(v3, "pui_isComplicationRowConfigured");
  int v6 = objc_msgSend(v3, "pui_isComplicationSidebarConfigured");
  int v7 = objc_msgSend(v3, "pui_showsHeaderElements");
  int v8 = objc_msgSend(v3, "pui_showsComplications");
  if (!v7
    || ([a1 timePreviewProminentDisplayViewController],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    if (v5) {
      goto LABEL_5;
    }
LABEL_20:
    BOOL v10 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
  int v80 = v6;
  id v76 = a1[1];
  if (v76)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v13 = [a1[2] targetConfiguredProperties];
  long long v14 = [v13 titleStyleConfiguration];

  v72 = [a1[2] role];
  v86 = objc_msgSend(v14, "effectiveTimeFontWithExtensionBundle:forRole:", v12);
  v88 = v14;
  v84 = [v14 effectiveTitleColor];
  long long v15 = [a1[2] traitCollection];
  int v78 = v5;
  if ([v15 _backlightLuminance] == 1)
  {
    BOOL v16 = 1;
  }
  else
  {
    id v17 = [a1[2] traitCollection];
    BOOL v16 = [v17 _backlightLuminance] == 0;
  }
  v74 = (void *)v12;
  BOOL v68 = v16;
  uint64_t v18 = [v88 vibrancyConfigurationWithExtensionBundle:v12 luminanceReduced:v16];
  int v82 = v4;
  if (v4) {
    uint64_t v19 = -3;
  }
  else {
    uint64_t v19 = -1;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F5E4C8]);
  uint64_t v21 = [v84 color];
  int v22 = (void *)[v20 initWithElements:v19 baseFont:v86 date:0 textColor:v21];

  objc_msgSend(v22, "setBackgroundType:", objc_msgSend(v18, "backgroundType"));
  objc_msgSend(v22, "setEffectType:", objc_msgSend(v18, "effectType"));
  int v23 = v18;
  long long v24 = [v18 alternativeVibrancyEffectLUT];
  LOBYTE(v21) = objc_opt_respondsToSelector();
  long long v25 = [v24 lutIdentifier];
  v71 = v24;
  long long v26 = [v24 bundleURL];
  int v92 = v8;
  int v90 = v7;
  if (v21) {
    [v22 setAlternativeVibrancyEffectLUTIdentifier:v25 alternativeVibrancyEffectLUTBundleURL:v26 luminanceReduced:v68];
  }
  else {
    [v22 setAlternativeVibrancyEffectLUTIdentifier:v25 alternativeVibrancyEffectLUTBundleURL:v26];
  }

  v70 = v23;
  long long v27 = [v23 groupName];
  [v22 setGroupName:v27];

  objc_msgSend(v22, "pr_setAlternateDateEnabled:", objc_msgSend(v88, "isAlternateDateEnabled"));
  v69 = [v88 timeNumberingSystem];
  [v22 setNumberingSystem:v69];
  long long v28 = -[PRRenderer _viewForLevel:]((uint64_t)a1, 0);
  long long v29 = [v22 view];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 addSubview:v29];
  v62 = (void *)MEMORY[0x1E4F28DC8];
  v67 = [v29 leadingAnchor];
  v66 = [v28 leadingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v95[0] = v65;
  v64 = [v29 trailingAnchor];
  v63 = [v28 trailingAnchor];
  v61 = [v64 constraintEqualToAnchor:v63];
  v95[1] = v61;
  v60 = [v29 topAnchor];
  v59 = [v28 topAnchor];
  uint64_t v30 = [v60 constraintEqualToAnchor:v59];
  v95[2] = v30;
  uint64_t v31 = [v29 bottomAnchor];
  uint64_t v32 = [v28 bottomAnchor];
  uint64_t v33 = [v31 constraintEqualToAnchor:v32];
  v95[3] = v33;
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
  [v62 activateConstraints:v34];

  long long v35 = [v88 titleContentStyle];
  [v22 setTitleContentStyle:v35];

  [a1 setTimePreviewProminentDisplayViewController:v22];
  int v8 = v92;
  int v7 = v90;
  int v4 = v82;
  int v6 = v80;
  if (!v78) {
    goto LABEL_20;
  }
LABEL_5:
  BOOL v10 = (unint64_t)(objc_msgSend(v3, "pui_deviceOrientation") - 1) < 2;
  if (!v6)
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_22;
  }
LABEL_21:
  BOOL v11 = (unint64_t)(objc_msgSend(v3, "pui_deviceOrientation") - 3) < 2;
LABEL_22:
  if ((v8 & (v4 | v10 | v11)) == 1)
  {
    long long v36 = [a1 complicationsPreviewProminentDisplayViewController];

    if (!v36)
    {
      long long v37 = (void *)[objc_alloc(MEMORY[0x1E4F5E4C8]) initWithElements:28 baseFont:0 date:0 textColor:0];
      if (v10)
      {
        uint64_t v38 = -[PRRenderer _makeGraphicComplicationPreviewScene](a1);
        id v39 = a1[14];
        a1[14] = (id)v38;

        [a1[14] setDelegate:a1];
        long long v40 = [[PRComplicationsSnapshotSceneHostViewController alloc] initWithScene:a1[14]];
        [v37 setComplicationContainerViewController:v40];
      }
      if (v11)
      {
        uint64_t v41 = -[PRRenderer _makeSidebarComplicationPreviewScene](a1);
        id v42 = a1[16];
        a1[16] = (id)v41;

        [a1[16] setDelegate:a1];
        v43 = [[PRComplicationsSnapshotSceneHostViewController alloc] initWithScene:a1[16]];
        [v37 setComplicationSidebarViewController:v43];
      }
      int v91 = v7;
      int v93 = v8;
      if (v4)
      {
        uint64_t v44 = -[PRRenderer _makeInlineComplicationPreviewScene](a1);
        id v45 = a1[18];
        a1[18] = (id)v44;

        [a1[18] setDelegate:a1];
        uint64_t v46 = [[PRComplicationsSnapshotSceneHostViewController alloc] initWithScene:a1[18]];
        [v37 setSubtitleComplicationViewController:v46];
      }
      char v47 = -[PRRenderer _viewForLevel:]((uint64_t)a1, 2000);
      v48 = [v37 view];
      [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v47 addSubview:v48];
      v79 = (void *)MEMORY[0x1E4F28DC8];
      v89 = [v48 leadingAnchor];
      v87 = [v47 leadingAnchor];
      v85 = [v89 constraintEqualToAnchor:v87];
      v94[0] = v85;
      v83 = [v48 trailingAnchor];
      v81 = [v47 trailingAnchor];
      v77 = [v83 constraintEqualToAnchor:v81];
      v94[1] = v77;
      v73 = [v48 topAnchor];
      v49 = [v47 topAnchor];
      v50 = [v73 constraintEqualToAnchor:v49];
      v94[2] = v50;
      v51 = [v48 bottomAnchor];
      [v47 bottomAnchor];
      v52 = v75 = v37;
      v53 = [v51 constraintEqualToAnchor:v52];
      v94[3] = v53;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
      [v79 activateConstraints:v54];

      [a1 setComplicationsPreviewProminentDisplayViewController:v75];
      int v8 = v93;
      int v7 = v91;
    }
  }
  v55 = [a1 timePreviewProminentDisplayViewController];
  v56 = [v55 view];
  [v56 setHidden:v7 ^ 1u];

  v57 = [a1 complicationsPreviewProminentDisplayViewController];
  v58 = [v57 view];
  [v58 setHidden:v8 ^ 1u];

  -[PRRenderer _updateProminentViewSizingAndTransforms](a1);
}

uint64_t __49__PRRenderer_scene_willConnectToSession_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setDidFinishInitialization:", 1);
}

- (void)_registerForAmbientPresentationTraitChangesIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Registering for ambient presentation trait changes", (uint8_t *)&v2, 0xCu);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)_issueSceneInvalidated:(uint64_t)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    uint64_t v4 = PRLogRendering();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v60 = a1;
      __int16 v61 = 1024;
      *(_DWORD *)v62 = v3 != 0;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called w/ scene invalidation action: %{BOOL}u", buf, 0x12u);
    }

    if (*(unsigned char *)(a1 + 24) || *(unsigned char *)(a1 + 25))
    {
      int v5 = PRLogRendering();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 24);
        int v7 = *(unsigned __int8 *)(a1 + 25);
        *(_DWORD *)long long buf = 134218496;
        uint64_t v60 = a1;
        __int16 v61 = 1024;
        *(_DWORD *)v62 = v6;
        *(_WORD *)&v62[4] = 1024;
        *(_DWORD *)&v62[6] = v7;
        _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnected (%{BOOL}u) or disconnecting (%{BOOL}u)", buf, 0x18u);
      }

      if (v3 && *(unsigned char *)(a1 + 24))
      {
        int v8 = PRLogRendering();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(unsigned __int8 *)(a1 + 24);
          *(_DWORD *)long long buf = 134218240;
          uint64_t v60 = a1;
          __int16 v61 = 1024;
          *(_DWORD *)v62 = v9;
          _os_log_impl(&dword_18C1C4000, v8, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnected (%{BOOL}u); will fire sceneInvalidationAction immediately",
            buf,
            0x12u);
        }

        BOOL v10 = (void *)MEMORY[0x1E4F4F678];
        BOOL v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = *MEMORY[0x1E4F28588];
        v58 = @"Scene already disconnected";
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        long long v13 = objc_msgSend(v11, "pr_errorWithCode:userInfo:", 5, v12);
        long long v14 = [v10 responseForError:v13];
        [v3 sendResponse:v14];
      }
      else if (v3 && *(unsigned char *)(a1 + 25))
      {
        long long v15 = PRLogRendering();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *(unsigned __int8 *)(a1 + 24);
          *(_DWORD *)long long buf = 134218240;
          uint64_t v60 = a1;
          __int16 v61 = 1024;
          *(_DWORD *)v62 = v16;
          _os_log_impl(&dword_18C1C4000, v15, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnecting (%{BOOL}u); will enqueue sceneInvalidation"
            "Action for calling after disconnected",
            buf,
            0x12u);
        }

        [*(id *)(a1 + 32) addObject:v3];
      }
      if (*(void *)(a1 + 8) || *(void *)(a1 + 216))
      {
        id v17 = PRLogRendering();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v60 = a1;
          _os_log_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated cleaning issuing poster invalidation cleanup because things are in an inconsistent state", buf, 0xCu);
        }

        -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](a1);
      }
      uint64_t v18 = PRLogRendering();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v60 = a1;
        _os_log_impl(&dword_18C1C4000, v18, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene already disconnected; bailing",
          buf,
          0xCu);
      }
    }
    else
    {
      uint64_t v19 = PRLogRendering();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v60 = a1;
        _os_log_impl(&dword_18C1C4000, v19, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Acquiring runtime assertion to allow for invalidation",
          buf,
          0xCu);
      }

      id v20 = objc_alloc(MEMORY[0x1E4F96318]);
      uint64_t v21 = [MEMORY[0x1E4F96478] currentProcess];
      int v22 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.PosterKit" name:@"FinishRender"];
      v56 = v22;
      int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      long long v24 = (void *)[v20 initWithExplanation:@"ExtendRenderSession" target:v21 attributes:v23];

      objc_initWeak(&location, (id)a1);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke;
      v53[3] = &unk_1E54DCAB0;
      objc_copyWeak(&v54, &location);
      [v24 acquireWithInvalidationHandler:v53];
      long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
      uint64_t v26 = PRGetMemoryUsageForCurrentProcess();
      long long v27 = PRLogRendering();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218240;
        uint64_t v60 = a1;
        __int16 v61 = 2048;
        *(void *)v62 = v26;
        _os_log_impl(&dword_18C1C4000, v27, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Memory usage prior to invalidation: %llu",
          buf,
          0x16u);
      }

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_83;
      v47[3] = &unk_1E54DCAD8;
      v47[4] = a1;
      id v28 = v25;
      id v48 = v28;
      v51 = sel__issueSceneInvalidated_;
      id v49 = v3;
      uint64_t v52 = v26;
      uint64_t v18 = v24;
      v50 = v18;
      long long v29 = (void (**)(void, void))MEMORY[0x192F91830](v47);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v30 = PRLogRendering();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v60 = a1;
          _os_log_impl(&dword_18C1C4000, v30, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnecting (async)", buf, 0xCu);
        }

        *(unsigned char *)(a1 + 25) = 1;
        uint64_t v31 = (void *)MEMORY[0x192F915E0]();
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        uint64_t v33 = *(void **)(a1 + 8);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_90;
        v43[3] = &unk_1E54DCB28;
        uint8_t v43[4] = a1;
        CFAbsoluteTime v46 = Current;
        long long v34 = v29;
        id v45 = v34;
        uint64_t v44 = v18;
        [v33 rendererDidInvalidate:a1 completion:v43];
        dispatch_time_t v35 = dispatch_time(0, 8000000000);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_92;
        v39[3] = &unk_1E54DCB50;
        id v40 = v28;
        uint64_t v41 = a1;
        id v42 = v34;
        dispatch_after(v35, MEMORY[0x1E4F14428], v39);
      }
      else
      {
        *(unsigned char *)(a1 + 24) = 1;
        long long v36 = PRLogRendering();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v60 = a1;
          _os_log_impl(&dword_18C1C4000, v36, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene disconnection (sync)", buf, 0xCu);
        }

        long long v37 = (void *)MEMORY[0x192F915E0]();
        [*(id *)(a1 + 8) rendererDidInvalidate:a1];
        -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](a1);
        uint64_t v38 = PRLogRendering();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v60 = a1;
          _os_log_impl(&dword_18C1C4000, v38, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene did disconnect (sync)", buf, 0xCu);
        }

        v29[2](v29, 0);
      }

      objc_destroyWeak(&v54);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_cleanupAfterNotifyingDelegateOfInvalidation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = PRLogRendering();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v19 = a1;
      _os_log_impl(&dword_18C1C4000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _cleanupAfterNotifyingDelegateOfInvalidation begin", buf, 0xCu);
    }

    id v3 = (void *)MEMORY[0x192F915E0]();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "allValues", 0);
    int v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v9++) invalidate];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 96) invalidate];
    [*(id *)(a1 + 112) invalidate];
    [*(id *)(a1 + 128) invalidate];
    [*(id *)(a1 + 144) invalidate];
    [*(id *)(a1 + 56) invalidate];
    [*(id *)(a1 + 160) invalidate];
    [*(id *)(a1 + 64) invalidate];
    [*(id *)(a1 + 40) removeAllObjects];
    if (*(void *)(a1 + 176)) {
      objc_msgSend(*(id *)(a1 + 216), "unregisterForTraitChanges:");
    }
    [*(id *)(a1 + 216) setDelegate:0];
    BOOL v10 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = 0;

    BOOL v11 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    [(id)__knownRenderers removeObject:a1];
    [*(id *)(a1 + 104) invalidate];
    uint64_t v12 = PRLogRendering();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v19 = a1;
      _os_log_impl(&dword_18C1C4000, v12, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _cleanupAfterNotifyingDelegateOfInvalidation end", buf, 0xCu);
    }
  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PRLogRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 134218242;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Runtime assertion to allow for invalidation: %{public}@",
      (uint8_t *)&v7,
      0x16u);
  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_83(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = PRLogRendering();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v23 = v5;
    __int16 v24 = 1024;
    int v25 = a2;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidation completion block was called; didTimeOut: %{BOOL}u",
      buf,
      0x12u);
  }

  if ([*(id *)(a1 + 40) setFlag:1])
  {
    if (a2)
    {
      long long v16 = objc_msgSend(NSString, "stringWithFormat:", @"<PRRenderer %p> did not call the completion block.  Aborting.", *(void *)(a1 + 32), 1);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __37__PRRenderer__issueSceneInvalidated___block_invoke_83_cold_1();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      uint64_t v6 = PRLogRendering();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v23 = v7;
        _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidation completion block marked completed", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
      id v8 = [MEMORY[0x1E4F4F678] response];
      __int16 v9 = *(void **)(a1 + 48);
      if (v9) {
        [v9 sendResponse:v8];
      }
      if ([*(id *)(*(void *)(a1 + 32) + 32) count])
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = *(id *)(*(void *)(a1 + 32) + 32);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v17 + 1) + 8 * i) sendResponse:v8];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v12);
        }

        [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
      }
      -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:](*(void *)(a1 + 32), *(void *)(a1 + 72));

      [*(id *)(a1 + 56) invalidate];
    }
  }
  else
  {
    long long v15 = PRLogRendering();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __37__PRRenderer__issueSceneInvalidated___block_invoke_83_cold_2(a1, v15);
    }
  }
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = PRGetMemoryUsageForCurrentProcess();
    uint64_t v5 = PRGetMaximumMemoryUsageForCurrentProcess();
    uint64_t v6 = PRLogRendering();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      uint64_t v17 = a1;
      __int16 v18 = 2048;
      uint64_t v19 = a2;
      _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory before invalidation: %{iec-bytes}lld", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v7 = PRLogRendering();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      uint64_t v17 = a1;
      __int16 v18 = 2048;
      uint64_t v19 = v4;
      _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory after invalidation: %{iec-bytes}lld", (uint8_t *)&v16, 0x16u);
    }

    id v8 = PRLogRendering();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      uint64_t v17 = a1;
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      _os_log_impl(&dword_18C1C4000, v8, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory maximum: %{iec-bytes}lld", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v9 = a2 - v4;
    if (a2 - v4 > -1000001)
    {
      uint64_t v12 = PRLogRendering();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134218240;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        uint64_t v19 = v9;
        _os_log_impl(&dword_18C1C4000, v12, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory freed after invalidation: %{iec-bytes}llu", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      int has_internal_content = os_variant_has_internal_content();
      uint64_t v11 = PRLogRendering();
      uint64_t v12 = v11;
      if (has_internal_content)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:]();
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:].cold.4();
      }
    }

    if (v4 > v5)
    {
      int v13 = os_variant_has_internal_content();
      long long v14 = PRLogRendering();
      long long v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:](a1, v15);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:](a1, v15);
      }
    }
  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_90(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  id v3 = PRLogRendering();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = Current - *(double *)(a1 + 56);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnecting (async); client has called internal invalidation completion block in %{time}f",
      buf,
      0x16u);
  }

  -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](*(void *)(a1 + 32));
  uint64_t v6 = PRLogRendering();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v11 = v7;
    _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene did disconnect! (async)", buf, 0xCu);
  }

  id v9 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  BSDispatchMain();
}

uint64_t __37__PRRenderer__issueSceneInvalidated___block_invoke_91(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = PRLogRendering();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_18C1C4000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnected (async); sending external invalidation completion",
      (uint8_t *)&v5,
      0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return [*(id *)(a1 + 40) invalidate];
}

uint64_t __37__PRRenderer__issueSceneInvalidated___block_invoke_92(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) getFlag];
  if ((result & 1) == 0)
  {
    uint64_t v3 = PRLogRendering();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 134218240;
      uint64_t v6 = v4;
      __int16 v7 = 2048;
      uint64_t v8 = 0x4020000000000000;
      _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene disconnection (async) timedout after %f seconds", (uint8_t *)&v5, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  return result;
}

- (PRRenderer)initWithScene:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"this should not be called"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    int v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = @"PRRenderer.m";
    __int16 v19 = 1024;
    int v20 = 594;
    __int16 v21 = 2114;
    int v22 = v6;
    _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  uint64_t result = (PRRenderer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (UIScene)_scene
{
  return (UIScene *)self->_scene;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

- (id)_actionsAfterHandlingAppIntentsHandshakeActionsInActions:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v14 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    a1 = (void *)[v3 mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 isValid])
            {
              int v11 = [MEMORY[0x1E4F18940] sharedListener];
              __int16 v12 = [v11 listenerEndpoint];
              [v10 respondWithListenerEndpoint:v12 error:0];
            }
            [a1 removeObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  return a1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = (uint64_t)a5;
  unint64_t v16 = (unint64_t)a6;
  id v17 = a7;
  if (*(_WORD *)&self->_disconnected) {
    goto LABEL_87;
  }
  id v122 = v13;
  long long v18 = [v14 settings];
  if (!(v15 | v16))
  {
    uint64_t v15 = [MEMORY[0x1E4F62A80] diffFromSettings:0 toSettings:v18];
  }
  int v121 = objc_msgSend(v18, "pui_isWallpaperObscured");
  if (v121) {
    [v17 setAnimationSettings:0];
  }
  v124 = objc_opt_new();
  v125 = v18;
  if (PUIDynamicRotationIsActive()
    && ([v17 animationSettings], __int16 v19 = objc_claimAutoreleasedReturnValue(),
                                                v19,
                                                v19))
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F4F680];
    __int16 v21 = [v17 animationSettings];
    [v21 duration];
    double v23 = v22;
    __int16 v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    int v25 = [v20 settingsWithDuration:v24 timingFunction:v23];
  }
  else
  {
    int v25 = [v17 animationSettings];
  }
  [v124 setAnimationSettings:v25];

  uint64_t v26 = [v17 actions];
  long long v27 = -[PRRenderer _actionsAfterHandlingAppIntentsHandshakeActionsInActions:](self, v26);
  id v28 = [v27 allObjects];
  [v124 setActions:v28];

  objc_msgSend(v124, "setSignificantEvent:", objc_msgSend(v17, "pui_significantEvent"));
  [v124 setSettingsDiff:v15];
  v123 = self->_environment;
  double v30 = *MEMORY[0x1E4F1DAD8];
  double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v31 = &off_18C2DC000;
  if (v15)
  {
    int v120 = objc_msgSend((id)v16, "pui_showsHeaderElements");
    int v119 = objc_msgSend((id)v16, "pui_showsComplications");
    scene = self->_scene;
    uint64_t v33 = objc_opt_class();
    long long v34 = scene;
    if (v33)
    {
      if (objc_opt_isKindOfClass()) {
        dispatch_time_t v35 = v34;
      }
      else {
        dispatch_time_t v35 = 0;
      }
    }
    else
    {
      dispatch_time_t v35 = 0;
    }
    id v39 = v35;

    id v40 = [(UIWindowScene *)v39 traitCollection];

    uint64_t v41 = [PRPosterEnvironmentImpl alloc];
    id v42 = -[PRRenderer extensionBundleURL]((uint64_t)self);
    v43 = [(PRPosterEnvironmentImpl *)v41 initWithSceneSettings:v125 traitCollection:v40 targetConfig:0 extensionBundleURL:v42];
    environment = self->_environment;
    self->_environment = v43;

    id v45 = self->_environment;
    [(PRPosterEnvironmentImpl *)v123 backlightProgress];
    -[PRPosterEnvironmentImpl setBacklightProgress:](v45, "setBacklightProgress:");
    CFAbsoluteTime v46 = self->_environment;
    [(PRPosterEnvironmentImpl *)v123 linearBacklightProgress];
    -[PRPosterEnvironmentImpl setLinearBacklightProgress:](v46, "setLinearBacklightProgress:");
    [v124 setSettingsDiff:v15];
    BOOL v47 = [(PRPosterEnvironmentImpl *)self->_environment isPreview];
    id v48 = (id *)MEMORY[0x1E4FB2608];
    if (v47 || [(PRPosterEnvironmentImpl *)self->_environment isSnapshot]) {
      [*v48 _stopHangTracer];
    }
    else {
      [*v48 _startHangTracer];
    }
    -[PRRenderer _updateViewsIfNeededFrom:to:](self, (void *)v16, v125);
    int v49 = objc_msgSend((id)v16, "pui_isSnapshot");
    int v50 = objc_msgSend(v125, "pui_isSnapshot");
    int v51 = objc_msgSend(v125, "pui_showsHeaderElements");
    int v52 = objc_msgSend(v125, "pui_showsComplications");
    if (v120 != v51 || ((v119 ^ v52) & 1) != 0 || v49 != v50) {
      -[PRRenderer _configureProminentDisplay]((id *)&self->super.isa);
    }
    int64_t v53 = [(PRPosterEnvironmentImpl *)self->_environment luminance];
    uint64_t v38 = v125;
    if ([(PRPosterEnvironmentImpl *)v123 luminance] != v53)
    {
      id v54 = PRLogRendering();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = NSStringFromBLSAdjustedLuminance();
        *(_DWORD *)long long buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        _os_log_impl(&dword_18C1C4000, v54, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p>: Backlight now: %{public}@", buf, 0x16u);

        uint64_t v38 = v125;
      }

      v56 = [(PRRenderer *)self extendRenderSessionForReason:@"LuminanceDidChange"];
      [(PRInvalidatable *)self->_wakeToken invalidate];
      wakeToken = self->_wakeToken;
      self->_wakeToken = 0;

      if (v53 == 2)
      {
        v58 = [(PRRenderer *)self extendRenderSessionForReason:@"ScreenWake"];
        v59 = self->_wakeToken;
        self->_wakeToken = v58;

        uint64_t v60 = v58;
        if (v121) {
          int64_t v61 = 0;
        }
        else {
          int64_t v61 = 3000000000;
        }
        dispatch_time_t v62 = dispatch_time(0, v61);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
        block[3] = &unk_1E54DAA08;
        block[4] = self;
        v149 = v60;
        uint64_t v63 = v60;
        dispatch_time_t v64 = v62;
        uint64_t v38 = v125;
        dispatch_after(v64, MEMORY[0x1E4F14428], block);
      }
      double v65 = 0.0;
      if ((v121 & 1) == 0)
      {
        v66 = +[PRPosterDomain rootSettings];
        [v66 wakeDuration];
        double v65 = v67;
      }
      BOOL v69 = v65 > 0.0 && v53 != 0;
      double v70 = 1.0;
      if (v53 != 2) {
        double v70 = 0.0;
      }
      [(PRRenderingBackdropView *)self->_backdropView setTargetBacklightProgress:v69 animated:v70];
      dispatch_time_t v71 = dispatch_time(0, (uint64_t)(v65 * 1000000000.0));
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2;
      v146[3] = &unk_1E54DAFB8;
      id v147 = v56;
      id v72 = v56;
      dispatch_after(v71, MEMORY[0x1E4F14428], v146);
    }
    char v73 = objc_msgSend((id)v16, "pr_isParallaxEffectivelyEnabled");
    char v37 = v73 ^ objc_msgSend(v38, "pr_isParallaxEffectivelyEnabled");
    objc_msgSend((id)v16, "pui_userTapLocation");
    double v75 = v74;
    double v77 = v76;
    objc_msgSend(v38, "pui_userTapLocation");
    double v79 = v78;
    double v81 = v80;
    uint64_t v82 = objc_msgSend((id)v16, "pui_userTapEventsCounter");
    if (v82 == objc_msgSend(v38, "pui_userTapEventsCounter") && v79 == v75 && v81 == v77)
    {
      char v36 = 0;
    }
    else
    {
      char v36 = 1;
      double v29 = v81;
      double v30 = v79;
    }
    v83 = objc_msgSend(v38, "pui_sceneAttachments");
    [(PRRenderer *)self setAttachments:v83];

    uint64_t v31 = &off_18C2DC000;
  }
  else
  {
    char v36 = 0;
    char v37 = 0;
    uint64_t v38 = v125;
  }
  *(_OWORD *)long long buf = *MEMORY[0x1E4F1DB30];
  if (objc_msgSend(v17, "pr_finishUnlockingWithParameters:", buf))
  {
    if (self->_animatingUnlock)
    {
      v118 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_animatingUnlock"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRRenderer _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:]();
      }
      [v118 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C284330);
    }
    self->_animatingUnlock = 1;
    v84 = PRLogTelemetrySignposts();
    BOOL v85 = v16 == 0;
    if (os_signpost_enabled(v84))
    {
      *(_WORD *)v150 = 0;
      _os_signpost_emit_with_name_impl(&dword_18C1C4000, v84, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_UNLOCK_PROGRESS", " enableTelemetry=YES  isAnimation=YES ", v150, 2u);
    }

    kdebug_trace();
    self->_interruptedUnlock = 0;
    v86 = [(PRRenderer *)self extendRenderSessionForReason:@"FinishUnlock"];
    unlockToken = self->_unlockToken;
    self->_unlockToken = v86;

    v140[4] = self;
    uint64_t v141 = MEMORY[0x1E4F143A8];
    uint64_t v142 = *((void *)v31 + 350);
    v143 = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_115;
    v144 = &unk_1E54DAFB8;
    v145 = self;
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = v142;
    v140[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3;
    v140[3] = &unk_1E54DCB78;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:&v141 interactive:v140 animations:*(double *)buf completion:*(double *)&buf[8]];
    goto LABEL_79;
  }
  objc_msgSend(v38, "pr_unlockProgress");
  double v89 = v88;
  int v90 = objc_msgSend((id)v15, "pr_unlockProgressDidChange");
  if (self->_animatingUnlock)
  {
    BOOL v85 = v16 == 0;
    if (v90)
    {
      objc_msgSend((id)v16, "pr_unlockProgress");
      if (v89 < v91)
      {
        int v92 = PRLogRendering();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v150 = 134217984;
          v151 = self;
          _os_log_impl(&dword_18C1C4000, v92, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Interrupting animated unlock!", v150, 0xCu);
        }

        *(_WORD *)&self->_animatingUnlock = 256;
        unlockAnimator = self->_unlockAnimator;
        [(UIViewFloatAnimatableProperty *)unlockAnimator presentationValue];
        -[UIViewFloatAnimatableProperty setValue:](unlockAnimator, "setValue:");
        goto LABEL_79;
      }
    }
    v94 = self->_environment;
    [(PRPosterEnvironmentImpl *)v123 unlockProgress];
    v96 = v94;
    goto LABEL_78;
  }
  BOOL v85 = v16 == 0;
  if (v90)
  {
    v97 = PRLogRendering();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
      -[PRRenderer _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:]();
    }

    if (self->_interruptedUnlock)
    {
      [(UIViewFloatAnimatableProperty *)self->_unlockAnimator value];
      double v99 = v98;
      objc_msgSend((id)v16, "pr_unlockProgress");
      double v101 = v89 - v100;
      double v102 = 0.0;
      if (v89 - v100 <= 0.0) {
        double v103 = 0.0;
      }
      else {
        double v103 = 1.0;
      }
      double v104 = v103 - v89;
      if ((BSFloatIsZero() & 1) == 0) {
        double v102 = (v103 - v99) / v104;
      }
      if (BSFloatIsZero()) {
        double v89 = v103;
      }
      else {
        double v89 = v99 + v101 * v102;
      }
      if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne()) {
        self->_interruptedUnlock = 0;
      }
    }
    [(UIViewFloatAnimatableProperty *)self->_unlockAnimator setValue:v89];
    v96 = self->_environment;
    double v95 = v89;
LABEL_78:
    [(PRPosterEnvironmentImpl *)v96 setUnlockProgress:v95];
  }
LABEL_79:
  v105 = self->_environment;
  uint64_t v128 = MEMORY[0x1E4F143A8];
  uint64_t v106 = *((void *)v31 + 350);
  uint64_t v129 = v106;
  v130 = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_118;
  v131 = &unk_1E54DCBA0;
  BOOL v137 = v85;
  v132 = self;
  v107 = v105;
  v133 = v107;
  id v108 = v124;
  id v134 = v108;
  char v138 = v37;
  char v139 = v36;
  double v135 = v30;
  double v136 = v29;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  if (objc_msgSend(v125, "pui_isInvalidated"))
  {
    v109 = PRLogRendering();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v150 = 134217984;
      v151 = self;
      _os_log_impl(&dword_18C1C4000, v109, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> issuing scene settings invalidation", v150, 0xCu);
    }

    v110 = [v125 otherSettings];
    v111 = [v110 objectForSetting:20469];

    -[PRRenderer _issueSceneInvalidated:]((uint64_t)self, v111);
  }
  [(PRPosterEnvironmentImpl *)self->_environment unlockProgress];
  int IsOne = BSFloatIsOne();
  v113 = [(PRPosterEnvironmentImpl *)self->_environment role];
  int v114 = [v113 isEqual:@"PRPosterRoleLockScreen"];

  if (v114 && IsOne)
  {
    v115 = [(PRRenderer *)self extendRenderingSessionForReason:@"delaySuspend"];
    v116 = (void *)MEMORY[0x1E4F39CF8];
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = v106;
    v126[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_125;
    v126[3] = &unk_1E54DAFB8;
    id v127 = v115;
    id v117 = v115;
    objc_msgSend(v116, "bs_performAfterSynchronizedCommit:", v126);
  }
  id v13 = v122;
LABEL_87:
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v3 == v2)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;
  }
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_115(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_116;
  v4[3] = &unk_1E54DAFB8;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2490370, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_116(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) setValue:1.0];
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3(uint64_t a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  uint64_t v6 = PRLogRendering();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 134218496;
    uint64_t v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_debug_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Unlock animator complete! %d/%d", (uint8_t *)&v11, 0x18u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  uint64_t v7 = PRLogTelemetrySignposts();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_18C1C4000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_UNLOCK_PROGRESS", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
  }

  kdebug_trace();
  [*(id *)(*(void *)(a1 + 32) + 88) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = 0;
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_118(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    -[PRRenderer reportUpdatedEnvironment:withTransition:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    if (*(unsigned char *)(a1 + 73)) {
      -[PRRenderer _updateContentSize](*(void *)(a1 + 32));
    }
    if (*(unsigned char *)(a1 + 74) && (objc_opt_respondsToSelector() & 1) != 0) {
      [*(id *)(*(void *)(a1 + 32) + 8) renderer:*(double *)(a1 + 56) didReceiveTapAtPoint:*(double *)(a1 + 64)];
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  -[PRRenderer _reapUnusedViews](v2);
}

- (void)reportUpdatedEnvironment:(void *)a3 withTransition:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    uint64_t v7 = PRLogTelemetrySignposts();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_18C1C4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_UPDATE", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
    }

    kdebug_trace();
    uint64_t v8 = [v5 animationSettings];
    if (v8)
    {
      uint64_t v9 = PRLogRendering();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134218242;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        int v14 = v8;
        _os_log_impl(&dword_18C1C4000, v9, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Reporting updated environment with non-nil animation settings: %{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
    [a1[1] renderer:a1 didUpdateEnvironment:v6 withTransition:v5];
    [a1 didUpdateEnvironment:v6];

    uint64_t v10 = PRLogTelemetrySignposts();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_18C1C4000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_UPDATE", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
    }

    kdebug_trace();
  }
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_125(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_126;
  block[3] = &unk_1E54DAFB8;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_126(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) assertion];
  [v1 invalidate];
}

- (void)_updateOrientationIfNeededFrom:(void *)a3 to:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 interfaceOrientation];
    if (v7 != [v6 interfaceOrientation])
    {
      uint64_t v8 = [v5 interfaceOrientation];
      uint64_t v9 = [v6 interfaceOrientation];
      uint64_t v10 = PRLogRendering();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        switch(v8)
        {
          case 1:
            int v11 = @"UIInterfaceOrientationPortrait";
            break;
          case 3:
            int v11 = @"UIInterfaceOrientationLandscapeRight";
            break;
          case 4:
            int v11 = @"UIInterfaceOrientationLandscapeLeft";
            break;
          default:
            int v11 = @"UIInterfaceOrientationPortraitUpsideDown";
            if (v8 != 2) {
              int v11 = 0;
            }
            break;
        }
        switch(v9)
        {
          case 1:
            uint64_t v12 = @"UIInterfaceOrientationPortrait";
            break;
          case 3:
            uint64_t v12 = @"UIInterfaceOrientationLandscapeRight";
            break;
          case 4:
            uint64_t v12 = @"UIInterfaceOrientationLandscapeLeft";
            break;
          default:
            uint64_t v12 = @"UIInterfaceOrientationPortraitUpsideDown";
            if (v9 != 2) {
              uint64_t v12 = 0;
            }
            break;
        }
        *(_DWORD *)long long buf = 134218498;
        long long v27 = a1;
        __int16 v28 = 2114;
        double v29 = v11;
        __int16 v30 = 2114;
        uint64_t v31 = v12;
        _os_log_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene Orientation has updated from %{public}@ -> %{public}@", buf, 0x20u);
      }
    }
    uint64_t v13 = objc_msgSend(v5, "pui_deviceOrientation");
    if (v13 == objc_msgSend(v6, "pui_deviceOrientation")) {
      goto LABEL_47;
    }
    uint64_t v14 = objc_msgSend(v5, "pui_deviceOrientation");
    uint64_t v15 = objc_msgSend(v6, "pui_deviceOrientation");
    int v16 = PRLogRendering();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      switch(v14)
      {
        case 1:
          uint64_t v17 = @"UIInterfaceOrientationPortrait";
          break;
        case 3:
          uint64_t v17 = @"UIInterfaceOrientationLandscapeRight";
          break;
        case 4:
          uint64_t v17 = @"UIInterfaceOrientationLandscapeLeft";
          break;
        default:
          uint64_t v17 = @"UIInterfaceOrientationPortraitUpsideDown";
          if (v14 != 2) {
            uint64_t v17 = 0;
          }
          break;
      }
      switch(v15)
      {
        case 1:
          long long v18 = @"UIInterfaceOrientationPortrait";
          break;
        case 3:
          long long v18 = @"UIInterfaceOrientationLandscapeRight";
          break;
        case 4:
          long long v18 = @"UIInterfaceOrientationLandscapeLeft";
          break;
        default:
          long long v18 = @"UIInterfaceOrientationPortraitUpsideDown";
          if (v15 != 2) {
            long long v18 = 0;
          }
          break;
      }
      *(_DWORD *)long long buf = 134218498;
      long long v27 = a1;
      __int16 v28 = 2114;
      double v29 = v17;
      __int16 v30 = 2114;
      uint64_t v31 = v18;
      _os_log_impl(&dword_18C1C4000, v16, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Device Orientation has updated from %{public}@ -> %{public}@", buf, 0x20u);
    }

    if ((unint64_t)(v14 - 3) >= 2)
    {
      double v19 = 0.5;
      if (((v14 - 1) | (unint64_t)(v15 - 1)) >= 2)
      {
LABEL_46:
        uint64_t v20 = [a1 extendRenderingSessionForReason:@"RotationAnimations"];
        __int16 v21 = (void *)MEMORY[0x1E4F39CF8];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke;
        v23[3] = &unk_1E54DB6C8;
        double v25 = v19;
        id v24 = v20;
        id v22 = v20;
        objc_msgSend(v21, "bs_performAfterSynchronizedCommit:", v23);

LABEL_47:
        -[PRRenderer _updateProminentViewSizingAndTransforms]((id *)a1);
        goto LABEL_48;
      }
    }
    else
    {
      double v19 = 0.5;
      if ((unint64_t)(v15 - 3) > 1) {
        goto LABEL_46;
      }
    }
    double v19 = 0.9;
    goto LABEL_46;
  }
LABEL_48:
}

- (void)_updateDepthEffectIfNeededFrom:(uint64_t)a1 to:
{
  if (a1)
  {
    int isDepthEffectEffectively = -[PRRenderer _isDepthEffectEffectivelyDisabled](a1);
    char v3 = isDepthEffectEffectively;
    if (*(unsigned __int8 *)(a1 + 184) != isDepthEffectEffectively)
    {
      if (*(unsigned char *)(a1 + 184)) {
        uint64_t v4 = -500;
      }
      else {
        uint64_t v4 = 1000;
      }
      if (isDepthEffectEffectively) {
        uint64_t v5 = -500;
      }
      else {
        uint64_t v5 = 1000;
      }
      -[PRRenderer _moveViewForLevel:toLevel:](a1, v4, v5);
    }
    *(unsigned char *)(a1 + 184) = v3;
  }
}

void __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke_2;
  block[3] = &unk_1E54DAFB8;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) assertion];
  [v1 invalidate];
}

- (void)_updateProminentViewSizingAndTransforms
{
  if (a1)
  {
    uint64_t v2 = [a1[27] _FBSScene];
    char v3 = [(id)v2 settings];

    uint64_t v4 = objc_msgSend(v3, "pui_deviceOrientation");
    LOBYTE(v2) = objc_msgSend(v3, "pui_isSnapshot");
    uint64_t v5 = objc_msgSend(v3, "pui_content");
    if ((v2 & 1) != 0 || v5 == 1)
    {
      id v6 = -[PRRenderer _viewForLevel:]((uint64_t)a1, 0);
      uint64_t v7 = [a1 timePreviewProminentDisplayViewController];
      uint64_t v8 = [v7 view];

      uint64_t v9 = -[PRRenderer _viewForLevel:]((uint64_t)a1, 2000);
      uint64_t v10 = [a1 complicationsPreviewProminentDisplayViewController];
      int v11 = [v10 view];

      [v8 bounds];
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
      unint64_t v16 = v4 - 3;
      double v17 = CGRectGetWidth(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      double v18 = CGRectGetHeight(v51);
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      double v19 = CGRectGetWidth(v52);
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      double v20 = CGRectGetHeight(v53);
      if (v17 >= v18) {
        double v21 = v17;
      }
      else {
        double v21 = v18;
      }
      if (v17 >= v18) {
        double v22 = v18;
      }
      else {
        double v22 = v17;
      }
      if (v19 >= v20) {
        double v23 = v20;
      }
      else {
        double v23 = v19;
      }
      if (v19 >= v20) {
        double v20 = v19;
      }
      if (v16 >= 2) {
        double v24 = v20;
      }
      else {
        double v24 = v23;
      }
      if (v16 >= 2) {
        double v25 = v22;
      }
      else {
        double v25 = v21;
      }
      double v26 = 0.0;
      objc_msgSend(v6, "setFrame:", 0.0, 0.0, v25, v24);
      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v25, v24);
      long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v42 = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v49.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v49.c = v41;
      long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v49.tCGFloat x = v40;
      uint64_t v27 = objc_msgSend(v3, "pui_deviceOrientation");
      if (PUIDynamicRotationIsActive())
      {
        memset(&v48, 0, sizeof(v48));
        if (v27 != 1)
        {
          switch(v27)
          {
            case 3:
              double v26 = 1.57079633;
              break;
            case 4:
              double v26 = -1.57079633;
              break;
            case 2:
              double v26 = 3.14159265;
              break;
            default:
              double v26 = 0.0;
              break;
          }
        }
        CGAffineTransformMakeRotation(&v47, v26);
        UIIntegralTransform();
        [v8 bounds];
        CGFloat v32 = v28;
        CGFloat v33 = v29;
        CGFloat v34 = v30;
        *(_OWORD *)&v46.a = v42;
        *(_OWORD *)&v46.c = v41;
        *(_OWORD *)&v46.tCGFloat x = v40;
        if ((unint64_t)(v27 - 3) <= 1)
        {
          CGFloat v35 = v31;
          double v36 = CGRectGetHeight(*(CGRect *)&v28);
          v54.origin.CGFloat x = v32;
          v54.origin.CGFloat y = v33;
          v54.size.CGFloat width = v34;
          v54.size.CGFloat height = v35;
          double v37 = v36 - CGRectGetWidth(v54);
          if (v37 < 0.0) {
            double v37 = -v37;
          }
          double v38 = v37 * 0.5;
          double v39 = -(v37 * 0.5);
          if (v27 == 3) {
            double v39 = v38;
          }
          *(_OWORD *)&t1.a = v42;
          *(_OWORD *)&t1.c = v41;
          *(_OWORD *)&t1.tCGFloat x = v40;
          CGAffineTransformTranslate(&v45, &t1, v39, v39);
          UIIntegralTransform();
        }
        CGAffineTransform t1 = v46;
        CGAffineTransform t2 = v48;
        CGAffineTransformConcat(&v49, &t1, &t2);
      }
      CGAffineTransform v48 = v49;
      [v8 setTransform:&v48];
      CGAffineTransform v48 = v49;
      [v11 setTransform:&v48];
    }
  }
}

- (void)_moveViewForLevel:(uint64_t)a3 toLevel:
{
  if (a1)
  {
    BSDispatchQueueAssertMain();
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithInteger:a2];
    id v12 = [v6 objectForKey:v7];

    if (v12)
    {
      [v12 setLevel:a3];
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [NSNumber numberWithInteger:a2];
      [v8 removeObjectForKey:v9];

      uint64_t v10 = *(void **)(a1 + 40);
      int v11 = [NSNumber numberWithInteger:a3];
      [v10 setObject:v12 forKey:v11];
    }
  }
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v14 = v12;
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          double v17 = [v16 eventType];
          int v18 = [v17 isEqual:@"PRRenderingEventTypeTap"];

          char v19 = objc_opt_respondsToSelector();
          if (v18 && (v19 & 1) != 0)
          {
            delegate = self->_delegate;
            [v16 location];
            -[PRRenderingDelegate renderer:didReceiveTapAtPoint:](delegate, "renderer:didReceiveTapAtPoint:", self);
          }
          if (objc_opt_respondsToSelector())
          {
            double v21 = self->_delegate;
            double v22 = [[PRRenderingEvent alloc] initWithAction:v16];
            [(PRRenderingDelegate *)v21 renderer:self didReceiveEvent:v22];
          }
        }
        else
        {
          [v24 addObject:v14];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v24;
}

- (void)updatedValuesForView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  [(PRRenderingBackdropView *)self->_backdropView backlightProgress];
  double v5 = v4;
  double v6 = 1.0;
  double v7 = 1.0;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    double v7 = 0.0;
    if (!BSFloatLessThanOrEqualToFloat()) {
      double v7 = v5;
    }
  }
  [(PRRenderingBackdropView *)self->_backdropView linearBacklightProgress];
  double v9 = v8;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    double v6 = 0.0;
    if (!BSFloatLessThanOrEqualToFloat()) {
      double v6 = v9;
    }
  }
  uint64_t v10 = PRLogRendering();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218496;
    id v14 = self;
    __int16 v15 = 2048;
    double v16 = v7;
    __int16 v17 = 2048;
    double v18 = v6;
    _os_log_debug_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Backlight progress is %.6f; linear is %.6f",
      (uint8_t *)&v13,
      0x20u);
  }

  [(PRPosterEnvironmentImpl *)self->_environment backlightProgress];
  if (!BSFloatEqualToFloat()
    || ([(PRPosterEnvironmentImpl *)self->_environment linearBacklightProgress],
        (BSFloatEqualToFloat() & 1) == 0))
  {
    int v11 = (PRPosterEnvironmentImpl *)[(PRPosterEnvironmentImpl *)self->_environment copy];
    environment = self->_environment;
    self->_environment = v11;

    [(PRPosterEnvironmentImpl *)self->_environment setBacklightProgress:v7];
    [(PRPosterEnvironmentImpl *)self->_environment setLinearBacklightProgress:v6];
    -[PRRenderer reportUpdatedEnvironment:withTransition:]((id *)&self->super.isa, self->_environment, 0);
  }
}

- (void)invalidateView:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PRLogRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    double v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v4 level];
    _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidated view at level %ld", (uint8_t *)&v8, 0x16u);
  }

  viewsByLevel = self->_viewsByLevel;
  double v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "level"));
  [(NSMutableDictionary *)viewsByLevel removeObjectForKey:v7];

  [v4 removeFromSuperview];
}

- (uint64_t)_derivedInterfaceOrientation
{
  if (!a1) {
    return 0;
  }
  int IsActive = PUIDynamicRotationIsActive();
  char v3 = [*(id *)(a1 + 216) _FBSScene];
  id v4 = [v3 settings];
  double v5 = v4;
  if (IsActive) {
    uint64_t v6 = objc_msgSend(v4, "pui_deviceOrientation");
  }
  else {
    uint64_t v6 = [v4 interfaceOrientation];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_makeGraphicComplicationPreviewScene
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(PRComplicationsSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)_makeSidebarComplicationPreviewScene
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(PRSidebarComplicationsSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)_makeInlineComplicationPreviewScene
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(PRInlineComplicationSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PRLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [v3 descriptionWithMultilinePrefix:0];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated rendering assertion: %@", buf, 0xCu);
  }
  BSDispatchMain();
}

uint64_t __40__PRRenderer__updateRenderingExtensions__block_invoke_152(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  return -[PRRenderer _updateRenderingExtensions](*(void *)(a1 + 32));
}

uint64_t __40__PRRenderer__updateRenderingExtensions__block_invoke_153(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setInExtendedRenderSession:", *(unsigned __int8 *)(a1 + 32));
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_157(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    [*(id *)(a1 + 32) invalidate];
    *(unsigned char *)(*(void *)(a1 + 40) + 73) = 0;
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v2 + 24) = 1;
  id v3 = PRLogRendering();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: CABackingStoreCollect completed.", (uint8_t *)&v5, 0xCu);
  }
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_158(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    [*(id *)(a1 + 32) invalidate];
    *(unsigned char *)(*(void *)(a1 + 40) + 73) = 0;
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v2 + 24) = 1;
  id v3 = PRLogRendering();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Renderer delegates completed dropping excess resources.", (uint8_t *)&v5, 0xCu);
  }
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_159(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) invalidate];
  *(unsigned char *)(*(void *)(a1 + 40) + 73) = 0;
  uint64_t v2 = PRLogRendering();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18C1C4000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: CABackingStoreCollect completed.", (uint8_t *)&v4, 0xCu);
  }
}

- (double)_collectContentSizeForView:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    if (([v3 isHidden] & 1) != 0 || (objc_msgSend(v4, "alpha"), v5 == 0.0))
    {
      double v6 = *MEMORY[0x1E4F1DB30];
    }
    else
    {
      [v4 bounds];
      double v6 = v8;
      double v10 = v9;
      if (([v4 clipsToBounds] & 1) == 0)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v11 = objc_msgSend(v4, "subviews", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              double v16 = -[PRRenderer _collectContentSizeForView:](a1, *(void *)(*((void *)&v18 + 1) + 8 * i));
              if (v6 < v16) {
                double v6 = v16;
              }
              if (v10 < v17) {
                double v10 = v17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v13);
        }
      }
    }
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

uint64_t __32__PRRenderer__updateContentSize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (id)_makeComplicationPreviewSceneWithSpecification:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = PRComplicationsSceneWorkspace();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke;
    v19[3] = &unk_1E54DB760;
    id v20 = v3;
    double v5 = [v4 createScene:v19];

    double v6 = [*(id *)(a1 + 16) targetConfiguredProperties];
    uint64_t v7 = [v6 titleStyleConfiguration];

    id v8 = *(id *)(a1 + 8);
    if (v8)
    {
      double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    }
    else
    {
      double v9 = 0;
    }
    double v10 = [*(id *)(a1 + 16) traitCollection];
    if ([v10 _backlightLuminance] == 1)
    {
      BOOL v11 = 1;
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 16) traitCollection];
      BOOL v11 = [v12 _backlightLuminance] == 0;
    }
    uint64_t v13 = [v7 vibrancyConfigurationWithExtensionBundle:v9 luminanceReduced:v11];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_2;
    v16[3] = &unk_1E54DCC58;
    id v17 = v13;
    uint64_t v18 = a1;
    id v14 = v13;
    [v5 configureParameters:v16];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSString;
  int v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a2;
  double v6 = [v4 UUID];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"PRRenderer-%@", v7];
  [v5 setIdentifier:v8];

  [v5 setSpecification:*(void *)(a1 + 32)];
  double v9 = FBSSceneClientIdentity;
  id v11 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:@"com.apple.PosterBoard"];
  double v10 = [v9 identityForProcessIdentity:v11];
  [v5 setClientIdentity:v10];
}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_3;
  v6[3] = &unk_1E54DB518;
  id v7 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 updateClientSettingsWithBlock:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_4;
  v5[3] = &unk_1E54DBD10;
  v5[4] = *(void *)(a1 + 40);
  [v4 updateSettingsWithBlock:v5];
}

uint64_t __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVibrancyConfiguration:", *(void *)(a1 + 32));
}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 216);
  id v4 = a2;
  id v5 = [v3 _FBSScene];
  double v6 = [v5 settings];
  objc_msgSend(v6, "pui_posterContents");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pui_setPosterContents:", v10);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 216) _FBSScene];
  id v8 = [v7 settings];
  double v9 = objc_msgSend(v8, "pui_previewIdentifier");
  objc_msgSend(v4, "pui_setPreviewIdentifier:", v9);
}

- (uint64_t)_isAmbientSupportedForRendererScene
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 216) _FBSScene];
    uint64_t v2 = [v1 settings];
    char v3 = objc_opt_respondsToSelector();
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

void __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRLogRendering();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke_cold_1(a1, v3, v4);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[PRRenderer _updateEnvironmentForUpdatedTraitCollection](WeakRetained);
}

- (void)_updateEnvironmentForUpdatedTraitCollection
{
  if (a1)
  {
    id v10 = [a1[27] _FBSScene];
    id v2 = a1[2];
    id v3 = [PRPosterEnvironmentImpl alloc];
    id v4 = [v10 settings];
    id v5 = [a1[27] traitCollection];
    double v6 = -[PRRenderer extensionBundleURL]((uint64_t)a1);
    id v7 = [(PRPosterEnvironmentImpl *)v3 initWithSceneSettings:v4 traitCollection:v5 targetConfig:0 extensionBundleURL:v6];

    [v2 backlightProgress];
    -[PRPosterEnvironmentImpl setBacklightProgress:](v7, "setBacklightProgress:");
    [v2 linearBacklightProgress];
    -[PRPosterEnvironmentImpl setLinearBacklightProgress:](v7, "setLinearBacklightProgress:");
    [v2 unlockProgress];
    -[PRPosterEnvironmentImpl setUnlockProgress:](v7, "setUnlockProgress:");
    id v8 = a1[2];
    a1[2] = v7;
    double v9 = v7;

    -[PRRenderer reportUpdatedEnvironment:withTransition:](a1, a1[2], 0);
  }
}

- (PRPosterRenderingEnvironment)environment
{
  return (PRPosterRenderingEnvironment *)self->_environment;
}

- (PRPosterRenderingPreferences)preferences
{
  return (PRPosterRenderingPreferences *)self->_preferences;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (CSProminentDisplayViewController)timePreviewProminentDisplayViewController
{
  return self->_timePreviewProminentDisplayViewController;
}

- (void)setTimePreviewProminentDisplayViewController:(id)a3
{
}

- (CSProminentDisplayViewController)complicationsPreviewProminentDisplayViewController
{
  return self->_complicationsPreviewProminentDisplayViewController;
}

- (void)setComplicationsPreviewProminentDisplayViewController:(id)a3
{
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_complicationsPreviewProminentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_timePreviewProminentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_unlockAnimator, 0);
  objc_storeStrong((id *)&self->_inlineComplicationScene, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationScene, 0);
  objc_storeStrong((id *)&self->_graphicComplicationScene, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_unlockToken, 0);
  objc_storeStrong((id *)&self->_wakeToken, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_sessionExtensions, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_viewsByLevel, 0);
  objc_storeStrong((id *)&self->_sceneInvalidationActions, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "More than one renderer instantiated at a time?", v1, 2u);
}

- (void)_updateAnimatedUnlockProgress:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_3();
  _os_log_debug_impl(&dword_18C1C4000, v0, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Unlock progress is %.6f (animated)", v1, 0x16u);
}

- (void)scene:willConnectToSession:options:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:willConnectToSession:options:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_3();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 64));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_83_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "<PRRenderer %p> Invalidation completion block ALREADY CALLED", (uint8_t *)&v3, 0xCu);
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_FAULT, "<PRRenderer %p> Memory after invalidation exceeds max memory usage for poster!", (uint8_t *)&v2, 0xCu);
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "<PRRenderer %p> Memory after invalidation exceeds max memory usage for poster!", (uint8_t *)&v2, 0xCu);
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  _os_log_fault_impl(&dword_18C1C4000, v0, OS_LOG_TYPE_FAULT, "<PRRenderer %p> Memory increased after invalidation; invalidating this poster caused a memory gain of %{iec-bytes}llu bytes",
    v1,
    0x16u);
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_18C1C4000, v0, OS_LOG_TYPE_ERROR, "<PRRenderer %p> Memory increased after invalidation; invalidating this poster caused a memory gain of %{iec-bytes}llu bytes",
    v1,
    0x16u);
}

- (void)_performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_3();
  _os_log_debug_impl(&dword_18C1C4000, v0, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Unlock progress is %.6f (explicit)", v1, 0x16u);
}

void __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [a2 traitCollection];
  int v7 = [v6 isAmbientPresented];
  uint64_t v8 = [a2 traitCollection];
  [v8 ambientDisplayStyle];
  uint8_t v9 = AMUIAmbientDisplayStyleString();
  int v10 = 134218498;
  id v11 = WeakRetained;
  __int16 v12 = 1024;
  int v13 = v7;
  __int16 v14 = 2114;
  __int16 v15 = v9;
  _os_log_debug_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Updating renderer environment for ambient presentation update [ isAmbientPresented:%{BOOL}d ; ambien"
    "tDisplayStyle:%{public}@ ]",
    (uint8_t *)&v10,
    0x1Cu);
}

@end