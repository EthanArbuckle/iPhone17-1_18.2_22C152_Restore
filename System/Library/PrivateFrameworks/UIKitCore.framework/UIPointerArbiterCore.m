@interface UIPointerArbiterCore
@end

@implementation UIPointerArbiterCore

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_2;
  v8[3] = &unk_1E52EF898;
  id v9 = *(id *)(a1 + 32);
  id v10 = WeakRetained;
  id v11 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  id v5 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 80);
  id v12 = v5;
  v16[1] = v6;
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  id v15 = v7;
  [WeakRetained _preparePointerPortalSourceCollectionWithCompletion:v8];

  objc_destroyWeak(v16);
}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    [*(id *)(a1 + 32) setPointerPortalSourceCollection:v9];
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_3;
    v18[3] = &unk_1E52EF870;
    id v19 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 64);
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    objc_copyWeak(v28, (id *)(a1 + 88));
    id v23 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 48);
    v16 = *(void **)(a1 + 96);
    id v24 = v15;
    v28[1] = v16;
    id v26 = *(id *)(a1 + 72);
    id v27 = *(id *)(a1 + 80);
    [v13 _prepareContentMatchMoveSourceForPointerRegion:v14 completion:v18];

    objc_destroyWeak(v28);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    uint64_t v17 = *(void *)(a1 + 72);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setContentMatchMoveSource:v5];
  uint64_t v7 = *(void *)(a1 + 80);
  if (v7) {
    (*(void (**)(uint64_t, void, void, id, void))(v7 + 16))(v7, *(void *)(a1 + 40), *(void *)(a1 + 48), v6, *(void *)(a1 + 56));
  }
  v8 = (void *)UIApp;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_4;
  v11[3] = &unk_1E52EF848;
  objc_copyWeak(v17, (id *)(a1 + 104));
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(void **)(a1 + 112);
  id v14 = v9;
  v17[1] = v10;
  id v15 = *(id *)(a1 + 88);
  id v16 = *(id *)(a1 + 96);
  [v8 _performBlockAfterCATransactionCommits:v11];

  objc_destroyWeak(v17);
}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _setActiveHoverRegion:*(void *)(a1 + 32) style:*(void *)(a1 + 40) forPointerRegion:*(void *)(a1 + 48) transactionID:*(void *)(a1 + 80) completion:*(void *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __63___UIPointerArbiterCore_iOS_exitRegion_removeStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 64)
    && ([WeakRetained activePointerRegion],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqual:*(void *)(a1 + 32)],
        v5,
        v6))
  {
    [v4 _setActiveHoverRegion:0 style:0 forPointerRegion:*(void *)(a1 + 32) transactionID:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v4 _clearMatchMoveSourceForRegion:*(void *)(a1 + 32) immediately:0];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
  v8[2]();
}

void __99___UIPointerArbiterCore_iOS__setActiveHoverRegion_style_forPointerRegion_transactionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (!*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if ([WeakRetained transactionRevisionID] == *(void *)(a1 + 64))
    {
      v4 = [WeakRetained pointerPortalView];
      [v4 removeFromSuperview];

      id v5 = [WeakRetained overlayEffectPortalView];
      [v5 removeFromSuperview];

      int v6 = [WeakRetained samplingBackdropView];
      [v6 setPaused:1];

      uint64_t v7 = [WeakRetained samplingBackdropView];
      [v7 removeFromSuperview];
    }
    [WeakRetained _clearMatchMoveSourceForRegion:*(void *)(a1 + 40) immediately:1];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

void __72___UIPointerArbiterCore_iOS__clearMatchMoveSourceForRegion_immediately___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) activePointerRegion];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    v4 = [*(id *)(a1 + 32) pointerRegionToMatchMoveSourceMap];
    id v5 = [v4 objectForKey:*(void *)(a1 + 40)];

    if (v5)
    {
      int v6 = [*(id *)(a1 + 32) pointerRegionToMatchMoveSourceMap];
      [v6 removeObjectForKey:*(void *)(a1 + 40)];

      uint64_t v7 = [*(id *)(a1 + 32) pointerClientController];
      v9[0] = v5;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v7 invalidateContentMatchMoveSources:v8 completion:0];
    }
  }
}

uint64_t __52___UIPointerArbiterCore_iOS_endScrollingWithRegion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_5)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "endScrollingWithRegion: %@ resetting style for that region, after delay", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) exitRegion:*(void *)(a1 + 32) removeStyle:1 completion:0];
}

void __52___UIPointerArbiterCore_iOS__performNextTransaction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setHasRunningTransaction:0];
    [v2 _performNextTransaction];
    id WeakRetained = v2;
  }
}

id __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F39C08];
  id v3 = a2;
  v4 = [v2 animation];
  objc_msgSend(v4, "setSourceContextId:", objc_msgSend(v3, "sourceContextID"));
  uint64_t v5 = [v3 sourceLayerRenderID];

  [v4 setSourceLayerRenderId:v5];
  [v4 setKeyPath:@"transform"];
  [v4 setAdditive:1];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v4 setRemovedOnCompletion:0];
  [v4 setDuration:INFINITY];
  return v4;
}

void __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [v4 firstObject];

  if (v6 && WeakRetained)
  {
    uint64_t v7 = [WeakRetained pointerRegionToMatchMoveSourceMap];

    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      [WeakRetained setPointerRegionToMatchMoveSourceMap:v8];
    }
    id v9 = [WeakRetained pointerRegionToMatchMoveSourceMap];
    [v9 setObject:v6 forKey:*(void *)(a1 + 32)];

    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [_UIPointerContentEffectAnimationBuilder alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_3;
    v14[3] = &unk_1E52EF958;
    id v16 = *(id *)(a1 + 48);
    id v12 = v6;
    id v15 = v12;
    id v13 = [(_UIPointerContentEffectAnimationBuilder *)v11 initWithCreationHandler:v14];
    (*(void (**)(uint64_t, id, _UIPointerContentEffectAnimationBuilder *))(v10 + 16))(v10, v12, v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81___UIPointerArbiterCore_iOS__preparePointerPortalSourceCollectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 pointerPortalSource];
    uint64_t v6 = _UIFrozenPortalWithSource(v5, @"_UIPointerArbiter.pointer");
    [*(id *)(a1 + 32) setPointerPortalView:v6];

    uint64_t v7 = [v4 overlayEffectPortalSource];
    uint64_t v8 = _UIFrozenPortalWithSource(v7, @"_UIPointerArbiter.specularOverlay");
    [*(id *)(a1 + 32) setOverlayEffectPortalView:v8];

    id v9 = -[_UILumaTrackingBackdropView initWithTransitionBoundaries:delegate:frame:]([_UILumaTrackingBackdropView alloc], "initWithTransitionBoundaries:delegate:frame:", *(void *)(a1 + 32), 0.45, 0.55, 0.0, 0.0, 1.0, 1.0);
    [(_UILumaTrackingBackdropView *)v9 setPaused:0];
    uint64_t v10 = [v4 samplingMatchMoveSource];
    id v11 = [MEMORY[0x1E4F39C00] animation];
    objc_msgSend(v11, "setSourceContextId:", objc_msgSend(v10, "sourceContextID"));
    objc_msgSend(v11, "setSourceLayerRenderId:", objc_msgSend(v10, "sourceLayerRenderID"));
    [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v11 setRemovedOnCompletion:0];
    [v11 setDuration:INFINITY];
    [v11 setUsesNormalizedCoordinates:1];
    id v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", -0.5, -0.5);
    v23[0] = v12;
    id v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, -0.5);
    v23[1] = v13;
    id v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, 0.5);
    v23[2] = v14;
    id v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", -0.5, 0.5);
    v23[3] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v11 setSourcePoints:v16];

    uint64_t v17 = [(UIView *)v9 layer];
    [v17 addAnimation:v11 forKey:@"samplingBackdropMatchMove"];

    [*(id *)(a1 + 32) setSamplingBackdropView:v9];
    [*(id *)(a1 + 32) setPointerPortalSourceCollection:v4];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = [*(id *)(a1 + 32) pointerPortalSourceCollection];
    id v20 = [*(id *)(a1 + 32) pointerPortalView];
    id v21 = [*(id *)(a1 + 32) overlayEffectPortalView];
    id v22 = [*(id *)(a1 + 32) samplingBackdropView];
    (*(void (**)(uint64_t, void *, void *, void *, void *))(v18 + 16))(v18, v19, v20, v21, v22);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __76___UIPointerArbiterCore_iOS__getPointerRegion_andStyle_atLocation_inWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "convertPoint:fromWindow:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __69___UIPointerArbiterCore_iOS_backgroundLumaView_didTransitionToLevel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained lastSentHoverRegion];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [WeakRetained activePointerStyle];
  objc_msgSend(v6, "_pointerIntensityForMaterialLuminance:", objc_msgSend(WeakRetained, "lastMaterialLuminance"));
  objc_msgSend(v5, "setPointerVisualIntensity:");

  objc_msgSend(v5, "setPreferredPointerMaterialLuminance:", objc_msgSend(WeakRetained, "lastMaterialLuminance"));
  [WeakRetained setLastSentHoverRegion:v5];
  uint64_t v7 = [WeakRetained pointerClientController];
  [v7 setActiveHoverRegion:v5 transitionCompletion:0];

  v3[2](v3);
}

@end