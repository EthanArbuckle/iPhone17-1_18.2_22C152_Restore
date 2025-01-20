@interface UISceneLayerHostContainerView
@end

@implementation UISceneLayerHostContainerView

void __90___UISceneLayerHostContainerView__rebuildLayersForNormalPresentationWithReason_withFence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) indexOfObject:v12];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [*(id *)(a1 + 48) _createHostViewForLayer:v12];
    if (!v6) {
      goto LABEL_11;
    }
LABEL_7:
    [*(id *)(*(void *)(a1 + 48) + 432) addObject:v12];
    [*(id *)(*(void *)(a1 + 48) + 424) addObject:v6];
    v8 = [*(id *)(a1 + 48) _presentationContextForLayer:v12];
    BOOL v9 = ([v8 isClippingDisabled] & 1) == 0 && *(unsigned char *)(a1 + 64) == 0;
    [v6 setClipsToBounds:v9];
    v10 = [v8 transformer];
    [v6 setTransformer:v10];

    [v8 alpha];
    objc_msgSend(v6, "setAlpha:");
    objc_msgSend(v6, "setInheritsSecurity:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 456), "inheritsSecurity"));
    objc_msgSend(v6, "setResizesHostedContext:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 456), "resizesHostedContext"));
    objc_msgSend(v6, "setStopsHitTestTransformAccumulation:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 456), "stopsHitTestTransformAccumulation"));
    objc_msgSend(v6, "setStopsSecureSuperlayersValidation:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 456), "stopsSecureSuperlayersValidation"));
    [*(id *)(*(void *)(a1 + 48) + 464) insertSubview:v6 atIndex:a3];
    [*(id *)(a1 + 48) _adjustHostViewFrameAlignment:v6];

    goto LABEL_11;
  }
  uint64_t v7 = v5;
  v6 = [*(id *)(a1 + 40) objectAtIndex:v5];
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"_UISceneLayerHostContainerView.m", 756, @"no existing view for layer: %@", v12 object file lineNumber description];
  }
  [*(id *)(a1 + 32) removeObjectAtIndex:v7];
  [*(id *)(a1 + 40) removeObjectAtIndex:v7];
  if (v6) {
    goto LABEL_7;
  }
LABEL_11:
}

void __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke_2;
  block[3] = &unk_1E52D9900;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72___UISceneLayerHostContainerView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 432) array];
  [v1 appendArraySection:v2 withName:@"hostedLayers" skipIfEmpty:1];
}

uint64_t __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 level];
  double v6 = v5;
  [v4 level];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 != v8;
  }
}

void __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 isHidden])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([v5 matchesLayer:v11]) {
            [*(id *)(a1 + 32) removeObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

void __63___UISceneLayerHostContainerView__presentationContextForLayer___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 matchesLayer:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

@end