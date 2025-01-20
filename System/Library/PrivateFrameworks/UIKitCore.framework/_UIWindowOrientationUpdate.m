@interface _UIWindowOrientationUpdate
- (uint64_t)invalidateFences;
- (void)initWithOrientation:(void *)a3 transitionAnimationSettings:(void *)a4 updateBlock:;
- (void)synchronizeDrawingWithFencesOnScene:(uint64_t)a1;
- (void)trackFence:(uint64_t)a1;
- (void)transferFencesToUpdate:(uint64_t)a1;
@end

@implementation _UIWindowOrientationUpdate

- (void)synchronizeDrawingWithFencesOnScene:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(a1 + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "_synchronizeDrawingWithFence:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    -[_UIWindowOrientationUpdate invalidateFences](a1);
  }
}

- (void)initWithOrientation:(void *)a3 transitionAnimationSettings:(void *)a4 updateBlock:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)_UIWindowOrientationUpdate;
    id v10 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v10;
    if (v10)
    {
      *((void *)v10 + 2) = a2;
      objc_storeStrong((id *)v10 + 3, a3);
      long long v11 = _Block_copy(v9);
      long long v12 = (void *)a1[4];
      a1[4] = v11;

      v13 = (void *)a1[1];
      a1[1] = 0;
    }
  }

  return a1;
}

- (uint64_t)invalidateFences
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(result + 8);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidate", (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return [*(id *)(v1 + 8) removeAllObjects];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_transitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_trackedFences, 0);
}

- (void)trackFence:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    long long v8 = v4;
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      long long v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      uint64_t v5 = *(void **)(a1 + 8);
    }
    [v5 addObject:v8];
    uint64_t v4 = v8;
  }
}

- (void)transferFencesToUpdate:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(a1 + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v3, *(void **)(*((void *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects", (void)v9);
  }
}

@end