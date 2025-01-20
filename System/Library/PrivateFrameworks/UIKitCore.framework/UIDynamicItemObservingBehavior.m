@interface UIDynamicItemObservingBehavior
@end

@implementation UIDynamicItemObservingBehavior

void __54___UIDynamicItemObservingBehavior_willMoveToAnimator___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = objc_msgSend(WeakRetained, "items", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        [WeakRetained linearVelocityForItem:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        double v9 = v8;
        double v11 = v10;
        [WeakRetained targetVelocity];
        BOOL v13 = v9 == 0.0;
        if (fabs(v14) > fabs(v9)) {
          BOOL v13 = 1;
        }
        BOOL v15 = v11 == 0.0;
        if (fabs(v12) > fabs(v11)) {
          BOOL v15 = 1;
        }
        v5 += v13 & v15;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  if ([WeakRetained frameCount] >= 1)
  {
    v16 = [WeakRetained items];
    uint64_t v17 = [v16 count];

    if (v5 == v17)
    {
      [WeakRetained setEnabled:0];
      v18 = [WeakRetained completionHandler];
      if (v18)
      {
        [WeakRetained completionHandlerInvocationDelay];
        dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
        dispatch_after(v20, MEMORY[0x1E4F14428], v18);
      }
    }
  }
  objc_msgSend(WeakRetained, "setFrameCount:", objc_msgSend(WeakRetained, "frameCount") + 1);
}

@end