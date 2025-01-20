@interface PKRemoveableAnimationTracker
+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5;
+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6;
+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6 completionAction:(id)a7;
- (BOOL)isPreempted;
- (CALayer)layer;
- (NSString)key;
- (PKRemoveableAnimationTracker)init;
- (void)_preempt;
- (void)_remove;
- (void)_removeWithLayer:(uint64_t)a1;
@end

@implementation PKRemoveableAnimationTracker

- (void)_preempt
{
  if (!a1 || *(unsigned char *)(a1 + 11)) {
    return;
  }
  *(unsigned char *)(a1 + 11) = 1;
  v9 = (void (**)(void))_Block_copy(*(const void **)(a1 + 16));
  v2 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  if (!*(unsigned char *)(a1 + 8) && !*(unsigned char *)(a1 + 9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (!WeakRetained)
    {
      -[PKRemoveableAnimationTracker _removeWithLayer:](a1, 0);
LABEL_16:

      goto LABEL_17;
    }
    v5 = [WeakRetained animationForKey:*(void *)(a1 + 40)];
    if (v5)
    {
      objc_msgSend(v4, "pkui_elapsedDurationForAnimation:", v5);
      if (v6 > 0.0)
      {
LABEL_15:

        goto LABEL_16;
      }
      *(unsigned char *)(a1 + 24) = 1;
      if (v9) {
        v9[2]();
      }
      uint64_t v7 = a1;
      v8 = v4;
    }
    else
    {
      uint64_t v7 = a1;
      v8 = 0;
    }
    -[PKRemoveableAnimationTracker _removeWithLayer:](v7, v8);
    goto LABEL_15;
  }
LABEL_17:
}

- (void)_remove
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[PKRemoveableAnimationTracker _removeWithLayer:](a1, WeakRetained);
  }
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5
{
  return (id)[a1 createForAnimation:a3 inLayer:a4 store:a5 withPreemptAction:0 completionAction:0];
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6
{
  return (id)[a1 createForAnimation:a3 inLayer:a4 store:a5 withPreemptAction:a6 completionAction:0];
}

+ (id)createForAnimation:(id)a3 inLayer:(id)a4 store:(id)a5 withPreemptAction:(id)a6 completionAction:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  v13 = (id *)a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (v11 && v12)
  {
    v17 = [v11 delegate];

    if (v17)
    {
      __break(1u);
    }
    else
    {
      v18 = [PKRemoveableAnimationTracker alloc];
      if (v18)
      {
        v32.receiver = v18;
        v32.super_class = (Class)PKRemoveableAnimationTracker;
        v19 = objc_msgSendSuper2(&v32, sel_init);
LABEL_6:
        objc_storeWeak(v19 + 4, v12);
        v20 = _Block_copy(v14);
        id v21 = v19[2];
        v19[2] = v20;

        if (v13)
        {
          *((unsigned char *)v19 + 10) = 1;
          [v13[1] addObject:v19];
        }
        objc_initWeak(&v32.receiver, v13);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __100__PKRemoveableAnimationTracker_createForAnimation_inLayer_store_withPreemptAction_completionAction___block_invoke;
        v28[3] = &unk_1E56F4940;
        v22 = v19;
        v29 = v22;
        objc_copyWeak(&v31, &v32.receiver);
        id v30 = v16;
        objc_msgSend(v11, "pkui_setCompletionHandler:", v28);
        uint64_t v23 = objc_msgSend(v12, "pkui_addAdditiveAnimation:", v11);
        id v24 = v22[5];
        v22[5] = (id)v23;

        *((unsigned char *)v22 + 8) = v22[5] == 0;
        v25 = v30;
        v26 = v22;

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v32.receiver);
        goto LABEL_12;
      }
    }
    v19 = 0;
    goto LABEL_6;
  }
  if (v15) {
    (*((void (**)(id, BOOL))v15 + 2))(v15, v11 == 0);
  }
  v26 = 0;
LABEL_12:

  return v26;
}

uint64_t __100__PKRemoveableAnimationTracker_createForAnimation_inLayer_store_withPreemptAction_completionAction___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 10))
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v3 = *(id *)(a1 + 32);
      v4 = v3;
      if (v3) {
        *((unsigned char *)v3 + 10) = 0;
      }
      uint64_t v5 = [WeakRetained[1] indexOfObjectIdenticalTo:v3];
      if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
        [WeakRetained[1] removeObjectAtIndex:v5];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (PKRemoveableAnimationTracker)init
{
  return 0;
}

- (void)_removeWithLayer:(uint64_t)a1
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 8) && !*(unsigned char *)(a1 + 9))
  {
    if (*(unsigned char *)(a1 + 11) || (v4 = v3, -[PKRemoveableAnimationTracker _preempt](a1), id v3 = v4, !*(unsigned char *)(a1 + 8)))
    {
      *(unsigned char *)(a1 + 8) = 1;
      if (v3)
      {
        id v5 = v3;
        [v3 removeAnimationForKey:*(void *)(a1 + 40)];
        id v3 = v5;
      }
    }
  }
}

- (CALayer)layer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layer);
  return (CALayer *)WeakRetained;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isPreempted
{
  return self->_preempted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_layer);
  objc_storeStrong(&self->_preemptAction, 0);
}

@end