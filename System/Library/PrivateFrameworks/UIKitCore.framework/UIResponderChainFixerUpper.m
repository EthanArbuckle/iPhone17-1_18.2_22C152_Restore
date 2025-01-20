@interface UIResponderChainFixerUpper
@end

@implementation UIResponderChainFixerUpper

void __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _nextResponders];
  if ([v2 count] == 1)
  {
    v3 = [v2 keyEnumerator];
    v4 = [v3 nextObject];

    v5 = [v2 objectForKey:v4];
    [*(id *)(a1 + 32) _callResponder:v4 phase:*(void *)(a1 + 48) components:v5 event:*(void *)(a1 + 40)];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v17 = v2;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v12 = objc_msgSend(v6, "objectForKey:", v11, v17);
          v13 = *(void **)(a1 + 32);
          v14 = [v13 currentDelivery];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke_2;
          v18[3] = &unk_1E52DAD48;
          v15 = *(void **)(a1 + 40);
          v18[4] = *(void *)(a1 + 32);
          v18[5] = v11;
          uint64_t v21 = *(void *)(a1 + 48);
          id v19 = v12;
          id v20 = v15;
          id v16 = v12;
          [v13 _snapshotDeliveryOfComponents:v16 map:v14 block:v18];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    v2 = v17;
  }
}

uint64_t __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callResponder:*(void *)(a1 + 40) phase:*(void *)(a1 + 64) components:*(void *)(a1 + 48) event:*(void *)(a1 + 56)];
}

void __69___UIResponderChainFixerUpper_forward_phase_withEvent_fromResponder___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _callResponder:*(void *)(a1 + 40) phase:*(void *)(a1 + 64) components:v2 event:*(void *)(a1 + 56)];
}

void __53___UIResponderChainFixerUpper__recursiveDescription___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _recursiveDescriptionStep:0];
  [v1 appendString:v2];
}

void __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = NSString;
    id v4 = a2;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = [v3 stringWithFormat:@"<%@: %p>", v6, v4];
  }
  else
  {
    uint64_t v7 = @"(nil)";
  }
  [v2 addObject:v7];
}

void __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [&stru_1ED0E84C0 stringByPaddingToLength:*(void *)(a1 + 56) + 1 withString:@" " startingAtIndex:0];
  [v2 appendString:v3];

  v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v6 = NSString;
    id v7 = v4;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = [v6 stringWithFormat:@"<%@: %p>", v9, v7];
  }
  else
  {
    v10 = @"(nil)";
  }
  [v5 appendFormat:@" - %@\n", v10];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 48) _recursiveDescriptionStep:*(void *)(a1 + 56) + 2];
  [v11 appendString:v12];
}

@end