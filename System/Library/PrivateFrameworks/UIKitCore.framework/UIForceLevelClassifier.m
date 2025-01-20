@interface UIForceLevelClassifier
@end

@implementation UIForceLevelClassifier

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke(uint64_t a1, void *a2)
{
  if (![a2 shouldFilterDueToSystemGestures]
    || (uint64_t result = [*(id *)(a1 + 32) respectsSystemGestureTouchFiltering], (result & 1) == 0))
  {
    v5 = *(void **)(a1 + 32);
    [a2 touchForce];
    double v7 = v6;
    [a2 timestamp];
    double v9 = v8;
    [a2 centroid];
    return objc_msgSend(v5, "observeTouchWithForceValue:atTimestamp:withCentroidAtLocation:", v7, v9, v10, v11);
  }
  return result;
}

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __39___UIForceLevelClassifier_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v5 = WeakRetained[5];
    if (v5 <= 2 && v5 + 1 == *(void *)(a1 + 40))
    {
      id v6 = WeakRetained;
      [a2 doubleValue];
      objc_msgSend(v6, "_notifyDelegateOfProgress:toForceLevel:", *(void *)(a1 + 40));
      WeakRetained = v6;
    }
  }
}

@end