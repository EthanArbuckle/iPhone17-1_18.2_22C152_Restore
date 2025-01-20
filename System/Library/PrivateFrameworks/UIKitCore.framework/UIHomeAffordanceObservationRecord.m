@interface UIHomeAffordanceObservationRecord
@end

@implementation UIHomeAffordanceObservationRecord

void __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  v4 = [WeakRetained description];
  id v5 = (id)[v2 appendObject:v4 withName:@"observer"];

  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"legacyViewServiceSessionIdentifier" skipIfNil:1];
  v7 = *(void **)(a1 + 32);
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  if (v13)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v13];
  }
  else
  {
    v11 = @"(nil)";
  }

  id v12 = (id)[v7 appendObject:v11 withName:@"window"];
}

void __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSuccinctStyle];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    if (v24)
    {
      v4 = NSString;
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      v7 = [v4 stringWithFormat:@"<%@: %p>", v6, v24];
    }
    else
    {
      v7 = @"(nil)";
    }

    id v14 = (id)[v3 appendObject:v7 withName:@"observer"];
  }
  else if (([*(id *)(a1 + 32) hasDebugStyle] & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    if (v9)
    {
      v10 = NSString;
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = [v10 stringWithFormat:@"<%@: %p>", v12, v9];
    }
    else
    {
      id v13 = @"(nil)";
    }

    id v15 = (id)[v8 appendObject:v13 withName:@"observer"];
    v16 = *(void **)(a1 + 32);
    id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    if (v17)
    {
      v18 = NSString;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
    }
    else
    {
      v21 = @"(nil)";
    }

    id v22 = (id)[v16 appendObject:v21 withName:@"window"];
    id v23 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 24) != 0 withName:@"forLegacyViewService"];
  }
}

@end