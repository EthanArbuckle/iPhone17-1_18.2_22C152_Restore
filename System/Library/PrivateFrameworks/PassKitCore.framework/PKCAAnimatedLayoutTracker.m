@interface PKCAAnimatedLayoutTracker
+ (PKCAAnimatedLayoutTracker)_create;
- (PKCAAnimatedLayoutTracker)init;
- (id)beginTrackingAnimation;
- (void)_addAbsoluteCompletion:(uint64_t)a1;
- (void)_beginTrackingAbsoluteAnimation;
- (void)_effectiveTracker;
- (void)_executeAbsoluteCompletionsIfPossible;
- (void)_performAbsoluteTransactionWithBlock:(void *)a3 completion:;
- (void)_performIsolatedAbsoluteTransactionWithBlock:(void *)a3 completion:;
- (void)_resume;
- (void)_suspend;
- (void)addAbsoluteCompletion:(id)a3;
- (void)addCompletion:(id)a3;
- (void)dealloc;
- (void)performAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4;
- (void)performIsolatedAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4;
- (void)performIsolatedTransactionWithBlock:(id)a3 completion:(id)a4;
- (void)performTransactionWithBlock:(id)a3 completion:(id)a4;
- (void)trackAnimation:(id)a3;
@end

@implementation PKCAAnimatedLayoutTracker

+ (PKCAAnimatedLayoutTracker)_create
{
  self;
  result = [PKCAAnimatedLayoutTracker alloc];
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)PKCAAnimatedLayoutTracker;
    return (PKCAAnimatedLayoutTracker *)objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (PKCAAnimatedLayoutTracker)init
{
  return 0;
}

- (void)dealloc
{
  if (self->_completions)
  {
    __break(1u);
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)PKCAAnimatedLayoutTracker;
    [(PKCAAnimatedLayoutTracker *)&v2 dealloc];
  }
}

- (id)beginTrackingAnimation
{
  objc_super v2 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  v3 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](v2);

  return v3;
}

- (void)_effectiveTracker
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  objc_super v2 = v1;
  v3 = (void *)*((void *)v1 + 5);
  if (!v3) {
    return v1;
  }
  do
  {
    v4 = v3;

    v3 = (void *)v4[5];
    objc_super v2 = v4;
  }
  while (v3);
  return v4;
}

- (void)_beginTrackingAbsoluteAnimation
{
  id v1 = result;
  if (!result) {
    return v1;
  }
  uint64_t v2 = result[1];
  uint64_t v3 = v2 + 1;
  uint64_t v4 = v2 == -1;
  uint64_t v5 = v4 << 63 >> 63;
  result[1] = v3;
  if (v5 == v4 && (v5 & 0x8000000000000000) == 0)
  {
    v6 = [PKDeallocationGuard alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke;
    v12[3] = &unk_1E56D8AE0;
    v12[4] = v1;
    v7 = [(PKDeallocationGuard *)v6 initWithBlock:v12];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_3;
    aBlock[3] = &unk_1E56E8D48;
    v10 = v7;
    v11 = v1;
    v8 = v7;
    id v1 = _Block_copy(aBlock);

    return v1;
  }
  __break(1u);
  return result;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _addAbsoluteCompletion:]((uint64_t)v5, v4);
}

- (void)_addAbsoluteCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      __break(1u);
      return;
    }
    id v4 = *(void **)(a1 + 48);
    aBlock = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    v7 = _Block_copy(aBlock);
    [v4 addObject:v7];

    -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible](a1);
    id v3 = aBlock;
  }
}

- (void)addAbsoluteCompletion:(id)a3
{
}

- (void)performTransactionWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _performAbsoluteTransactionWithBlock:completion:](v8, v7, v6);
}

- (void)_performAbsoluteTransactionWithBlock:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_4;
  }
  if (v5)
  {
    id v7 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](a1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__PKCAAnimatedLayoutTracker__performAbsoluteTransactionWithBlock_completion___block_invoke;
    v9[3] = &unk_1E56E0960;
    id v10 = v6;
    id v11 = v7;
    v8 = v7;
    -[PKCAAnimatedLayoutTracker _performIsolatedAbsoluteTransactionWithBlock:completion:]((uint64_t)a1, v5, v9);

LABEL_4:
    return;
  }
  __break(1u);
}

- (void)performAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4
{
}

- (void)performIsolatedTransactionWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _performIsolatedAbsoluteTransactionWithBlock:completion:]((uint64_t)v8, v7, v6);
}

- (void)_performIsolatedAbsoluteTransactionWithBlock:(void *)a3 completion:
{
  v18 = a2;
  id v5 = a3;
  if (a1)
  {
    if (v18)
    {
      id v6 = +[PKCAAnimatedLayoutTracker _create]();
      id v7 = v6;
      if (!v6
        || (v8 = v6->_suspended, v9 = v8 + 1, uint64_t v10 = v8 == -1, v11 = v10 << 63 >> 63, v6->_suspended = v9, v11 == v10)
        && (v11 & 0x8000000000000000) == 0)
      {
        v12 = (void *)MEMORY[0x192FDC630]();
        v14 = *(void **)(a1 + 40);
        v13 = (id *)(a1 + 40);
        id v15 = v14;
        objc_storeStrong(v13, v7);
        v18[2]();
        id v16 = *v13;
        id *v13 = v15;

        if (v5) {
          [(PKCAAnimatedLayoutTracker *)v7 addCompletion:v5];
        }
        if (!v7) {
          goto LABEL_11;
        }
        unint64_t suspended = v7->_suspended;
        v7->_unint64_t suspended = suspended - 1;
        if (suspended)
        {
          -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible]((uint64_t)v7);
LABEL_11:

          goto LABEL_12;
        }
      }
    }
    __break(1u);
    return;
  }
LABEL_12:
}

- (void)performIsolatedAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4
{
}

- (void)trackAnimation:(id)a3
{
  id v4 = a3;
  if (!v4
    || (id v5 = v4, [v4 delegate], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    __break(1u);
  }
  else
  {
    id v7 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
    unint64_t v8 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](v7);

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PKCAAnimatedLayoutTracker_trackAnimation___block_invoke;
    v10[3] = &unk_1E56D8ED8;
    id v11 = v8;
    unint64_t v9 = v8;
    objc_msgSend(v5, "pkui_setCompletionHandler:", v10);
  }
}

uint64_t __44__PKCAAnimatedLayoutTracker_trackAnimation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_2;
  block[3] = &unk_1E56D8AE0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_2(uint64_t a1)
{
}

- (void)_executeAbsoluteCompletionsIfPossible
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(void *)(a1 + 32) && *(void *)(a1 + 8) <= *(void *)(a1 + 24) + *(void *)(a1 + 16))
  {
    id v2 = *(id *)(a1 + 48);
    id v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if ([v2 count])
    {
      id v4 = (void *)MEMORY[0x192FDC630]();
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_3(uint64_t a1, int a2)
{
  if ([*(id *)(a1 + 32) invalidate])
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 16;
    if (a2) {
      uint64_t v4 = 24;
    }
    ++*(void *)(*(void *)(a1 + 40) + v4);
    uint64_t v5 = *(void *)(a1 + 40);
    -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible](v5);
  }
}

uint64_t __77__PKCAAnimatedLayoutTracker__performAbsoluteTransactionWithBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_suspend
{
  if (a1)
  {
    id v1 = -[PKCAAnimatedLayoutTracker _effectiveTracker](a1);
    if (v1 && ((uint64_t v2 = v1[4], v3 = v2 + 1, v4 = v2 == -1, v5 = v4 << 63 >> 63, v1[4] = v3, v5 ^ v4) || v5 < 0))
    {
      __break(1u);
    }
    else
    {
    }
  }
}

- (void)_resume
{
  if (a1)
  {
    id v1 = -[PKCAAnimatedLayoutTracker _effectiveTracker](a1);
    if (v1)
    {
      uint64_t v2 = v1[4];
      v1[4] = v2 - 1;
      if (!v2)
      {
        __break(1u);
        return;
      }
      uint64_t v3 = v1;
      -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible]((uint64_t)v1);
      id v1 = v3;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_effectiveTracker, 0);
}

@end