@interface UIPreviewInteractionClickImpl
@end

@implementation UIPreviewInteractionClickImpl

void __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresentationAssistant:0];
  -[_UIPreviewInteractionClickImpl _endInteractionDidComplete:wasCancelledByClient:]((uint64_t)WeakRetained, 1u, 0);
}

uint64_t __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_3;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

uint64_t __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endInteractionEffectIfNeeded];
}

void __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v6 ended] & 1) == 0)
  {
    [v6 progress];
    -[_UIPreviewInteractionClickImpl _delegateUpdatePreviewTransitionWithProgress:ended:](WeakRetained, 0, v4);
    v5 = [WeakRetained interactionEffect];
    [v5 interaction:WeakRetained didChangeWithContext:v6];
  }
}

void __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v5 ended] & 1) == 0)
  {
    [v5 progress];
    -[_UIPreviewInteractionClickImpl _delegateUpdateCommitTransitionWithProgress:ended:](WeakRetained, 0, v4);
  }
}

uint64_t __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    v3 = (void *)UIApp;
    uint64_t v4 = [*(id *)(result + 40) type];
    id v5 = [*(id *)(v2 + 32) view];
    id v6 = [v5 _window];
    v7 = [v6 _eventRoutingScene];
    [v3 _cancelAllEventsOfType:v4 onEventRoutingScene:v7];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke_2;
    v8[3] = &unk_1E52D9F70;
    v8[4] = *(void *)(v2 + 32);
    return +[UIView performWithoutAnimation:v8];
  }
  return result;
}

uint64_t __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endInteractionEffectIfNeeded];
}

@end