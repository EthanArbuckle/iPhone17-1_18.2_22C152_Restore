@interface UITouchForceObservable
@end

@implementation UITouchForceObservable

void __40___UITouchForceObservable_initWithView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained receiveObservedValue:v3];
}

void __56___UITouchForceObservable__touchForceMessageForTouches___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 _unclampedTouchForceForTouches:v4];
  objc_msgSend(v5, "setUnclampedTouchForce:");
  [*(id *)(a1 + 32) _maximumPossibleForceForTouches:*(void *)(a1 + 40)];
  objc_msgSend(v5, "setMaximumPossibleForce:");
  [v5 setTimestamp:CACurrentMediaTime()];
  objc_msgSend(v5, "setShouldFilterDueToSystemGestures:", objc_msgSend(*(id *)(a1 + 32), "_shouldFilterDueToSystemGesturesForTouches:", *(void *)(a1 + 40)));
  objc_msgSend(v5, "setCentroid:", _CentroidOfTouches(*(void **)(a1 + 40), 0));
}

@end