@interface UIHomeAffordanceHostSceneComponent
@end

@implementation UIHomeAffordanceHostSceneComponent

uint64_t __84___UIHomeAffordanceHostSceneComponent__sendClientHomeAffordanceSceneReferenceFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setHomeAffordanceSceneReferenceFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void __86___UIHomeAffordanceHostSceneComponent__setUpHomeAffordanceObserverInteractionIfNeeded__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    -[_UIHomeAffordanceHostSceneComponent _sendClientHomeAffordanceSceneReferenceFrame:](WeakRetained, a2, a3, a4, a5);
    id WeakRetained = v10;
  }
}

void __86___UIHomeAffordanceHostSceneComponent__setUpHomeAffordanceObserverInteractionIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    -[_UIHomeAffordanceHostSceneComponent _sendClientDoubleTapGestureDidSucceedAction:](WeakRetained, a2);
    id WeakRetained = v4;
  }
}

void __65___UIHomeAffordanceHostSceneComponent_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasSuccinctStyle] & 1) != 0
    || ([*(id *)(a1 + 32) hasDebugStyle] & 1) == 0)
  {
    id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 24) & 1 withName:@"needsProxyInteractionEvaluation"];
    v3 = *(void **)(*(void *)(a1 + 40) + 64);
    if (v3)
    {
      id v4 = *(void **)(a1 + 32);
      v5 = NSString;
      id v6 = v3;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      id v10 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];

      id v9 = (id)[v4 appendObject:v10 withName:@"proxyHomeAffordanceObserverInteraction"];
    }
  }
}

id __65___UIHomeAffordanceHostSceneComponent_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 24) & 1 withName:@"needsProxyInteractionEvaluation"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"proxyHomeAffordanceObserverInteraction"];
}

@end