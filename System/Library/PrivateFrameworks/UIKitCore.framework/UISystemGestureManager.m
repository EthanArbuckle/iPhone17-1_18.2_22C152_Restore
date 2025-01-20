@interface UISystemGestureManager
@end

@implementation UISystemGestureManager

void __41___UISystemGestureManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_UISystemGestureManager);
  v1 = (void *)qword_1EB260C28;
  qword_1EB260C28 = (uint64_t)v0;
}

void __72___UISystemGestureManager_allowGestureRecognizersOnDisplayWithIdentity___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] removeObjectForKey:*(void *)(a1 + 32)];
    v4 = [v3[1] objectForKey:*(void *)(a1 + 32)];
    v5 = v4;
    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v6 = objc_msgSend(v4, "gestureRecognizers", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [v5 removeGestureRecognizer:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }

      [v3[1] removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
}

id __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_2;
  long long v13 = &unk_1E52F0DA0;
  id v4 = v2;
  id v14 = v4;
  objc_copyWeak(&v15, a1 + 5);
  objc_copyWeak(&v16, a1 + 6);
  objc_copyWeak(&v17, a1 + 7);
  [v4 appendBodySectionWithName:0 block:&v10];
  id v5 = [v4 description];
  v6 = v5;
  if (WeakRetained)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [WeakRetained recursiveDescription];
    v6 = [v7 stringWithFormat:@"%@\n\n%@", v5, v8, v10, v11, v12, v13, v14];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  return v6;
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_2(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_4;
  aBlock[3] = &unk_1E52F0D50;
  id v11 = a1[4];
  id v12 = &__block_literal_global_266;
  id v2 = _Block_copy(aBlock);
  id v3 = a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_7;
  v5[3] = &unk_1E52F0D78;
  id v4 = v2;
  id v6 = v4;
  objc_copyWeak(&v7, a1 + 5);
  objc_copyWeak(&v8, a1 + 6);
  objc_copyWeak(&v9, a1 + 7);
  [v3 appendBodySectionWithName:@"gestures" block:v5];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

id __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = _UIGestureRecognizerStateString([a2 state]);
  [a2 isEnabled];
  id v5 = NSStringFromBOOL();
  id v6 = [v3 stringWithFormat:@"%p state = %@; enabled: %@", a2, v4, v5];;

  return v6;
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_5;
  v7[3] = &unk_1E52F0D28;
  id v8 = v6;
  id v9 = *(id *)(a1 + 40);
  [v8 appendCollection:a3 withName:a2 itemBlock:v7];
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_6;
  v6[3] = &unk_1E52DCA58;
  id v7 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v8 = a2;
  id v9 = v5;
  [v7 appendProem:0 block:v6];
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [*(id *)(a1 + 40) name];
  if (v3)
  {
    id v4 = (id)[v2 appendObject:v7 withName:v3];
  }
  else
  {
    id v5 = [(id)objc_opt_class() description];
    id v6 = (id)[v2 appendObject:v7 withName:v5];
  }
}

void __52____UISystemGestureManager_initWithDisplayIdentity___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, __CFString *, id))(v2 + 16))(v2, @"internal", WeakRetained);

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, __CFString *, id))(v4 + 16))(v4, @"external", v5);

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, __CFString *, id))(v6 + 16))(v6, @"externalEdgeSwipe", v7);
}

uint64_t __55____UISystemGestureManager__addInternalGesturesToView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addGestureRecognizer:a2];
}

uint64_t __51____UISystemGestureManager__removeInternalGestures__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 view];
  [v4 removeGestureRecognizer:a2];

  uint64_t v5 = *(void *)(a1 + 32);
  return [a2 removeTarget:v5 action:0];
}

uint64_t __113____UISystemGestureManager_exclusiveTouchGestureRecognizer_achievedMaximumAbsoluteAccumulatedMovement_timestamp___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAchievedMaximumMovement:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _handleTooMuchMovementWithLastTouchTimestamp:v3];
}

uint64_t __62____UISystemGestureManager__externalGestureRecognizerChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (!result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v3 = *(void **)(a1 + 40);
    return [v3 addObject:v4];
  }
  return result;
}

void __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  id v5 = v3;
  uint64_t v6 = a2;
  [v5 appendProem:0 block:v4];
}

void __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [*(id *)(a1 + 40) name];
  if (v3)
  {
    id v4 = (id)[v2 appendObject:v7 withName:v3];
  }
  else
  {
    id v5 = [(id)objc_opt_class() description];
    id v6 = (id)[v2 appendObject:v7 withName:v5];
  }
}

@end