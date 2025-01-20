@interface UIPreviewInteractionClassicImpl
@end

@implementation UIPreviewInteractionClassicImpl

void __48___UIPreviewInteractionClassicImpl_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = 0.0;
    if (((_WORD)WeakRetained[2] & 8) != 0)
    {
      id v6 = objc_loadWeakRetained(WeakRetained + 14);
      v7 = [v4 previewInteraction];
      int v8 = [v6 _previewInteractionShouldAutomaticallyTransitionToPreviewAfterDelay:v7];

      double v5 = 0.0;
      if (v8) {
        double v5 = 3.5;
      }
    }
    [v9 setAutomaticTouchForce:v5];
  }
}

void __63___UIPreviewInteractionClassicImpl__prepareHighlighterIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

void __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

void __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[11];
    v4[11] = 0;

    [v4 _endInteractionIfNeeded];
    WeakRetained = v4;
  }
}

void __82___UIPreviewInteractionClassicImpl__prepareForViewControllerPresentationObserving__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[11])
  {
    double v5 = [v8 object];
    id v6 = [v4[12] viewControllerPresentation];
    v7 = [v6 viewController];

    if (v7 != v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 88) _applyHighlightEffectsToViewControllerDuringCancellation:v5];
      [*(id *)(*(void *)(a1 + 32) + 120) cancelInteraction];
    }
  }
}

@end