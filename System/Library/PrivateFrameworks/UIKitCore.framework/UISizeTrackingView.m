@interface UISizeTrackingView
@end

@implementation UISizeTrackingView

void __70___UISizeTrackingView__updateTextEffectsGeometries_textEffectsWindow___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) view];
  objc_msgSend(v7, "convertRect:fromView:", 0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

void __52___UISizeTrackingView__geometryChanged_forAncestor___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) _window];
    uint64_t v3 = [v2 windowScene];
    int v4 = [v3 _enhancedWindowingEnabled];

    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
      uint64_t v6 = [WeakRetained _existingPresentationControllerImmediate:0 effective:1];

      id v7 = [v6 _viewForRemoteTextEffectsWindowMatchAnimation];
    }
    else
    {
      id v7 = 0;
    }
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 496));

    if (v7 != v8)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 496), v7);
      if (v7)
      {
        v9 = [v7 layer];
        v10 = [v9 context];
        uint64_t v11 = [v10 contextId];

        uint64_t RenderId = CALayerGetRenderId();
      }
      else
      {
        uint64_t RenderId = 0;
        uint64_t v11 = 0;
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "__setRemoteTextEffectsWindowMatchesLayerWithContextId:renderId:", v11, RenderId);
    }
    if (*(unsigned char *)(a1 + 49))
    {
      v13 = [*(id *)(a1 + 32) remoteViewController];
      [v13 _updateUnderflowProperties];
    }
    if (*(unsigned char *)(a1 + 50))
    {
      id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
      v15 = [v14 _fenceForSynchronizedDrawing];

      v16 = *(void **)(a1 + 32);
      v17 = (void *)v16[52];
      [v16 _sizeForRemoteViewService];
      double v19 = v18;
      double v21 = v20;
      v22 = [*(id *)(a1 + 32) _boundingPathForRemoteViewService];
      objc_msgSend(v17, "__setContentSize:boundingPath:withFence:", v22, v15, v19, v21);

      [v15 invalidate];
      [*(id *)(a1 + 32) _clearNeedsRemoteViewServiceBoundingPathUpdate];
    }
    if (*(unsigned char *)(a1 + 51))
    {
      v23 = *(void **)(a1 + 32);
      [v23 frame];
      objc_msgSend(v23, "_updateTextEffectsGeometries:");
    }
  }
  if (*(unsigned char *)(a1 + 52))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
    v26 = *(void **)(a1 + 32);
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v26 _updateSceneGeometries:v27 forOrientation:0];
  }
}

uint64_t __67___UISizeTrackingView__setNeedsRemoteViewServiceBoundingPathUpdate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 504) &= ~8u;
  uint64_t result = *(void *)(a1 + 32);
  if ((*(unsigned char *)(result + 504) & 4) != 0)
  {
    uint64_t v3 = *(void **)(result + 416);
    int v4 = [(id)result _boundingPathForRemoteViewService];
    objc_msgSend(v3, "__setBoundingPath:", v4);

    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _clearNeedsRemoteViewServiceBoundingPathUpdate];
  }
  return result;
}

@end