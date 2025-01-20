@interface TSUProgressGroup
- (BOOL)isIndeterminate;
- (TSUProgressGroup)initWithChildren:(id)a3;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)p_updateChildrenProgressObservers;
- (void)removeProgressObserver:(id)a3;
@end

@implementation TSUProgressGroup

- (TSUProgressGroup)initWithChildren:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUProgressGroup;
  v4 = [(TSUProgress *)&v6 init];
  if (v4)
  {
    v4->mChildren = (NSArray *)[a3 copy];
    v4->mChildrenProgressObserversQueue = (OS_dispatch_queue *)dispatch_queue_create("con.apple.iWork.TSUProgressGroup", 0);
  }
  return v4;
}

- (void)dealloc
{
  mChildrenProgressObserversQueue = self->mChildrenProgressObserversQueue;
  if (mChildrenProgressObserversQueue) {
    dispatch_release(mChildrenProgressObserversQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUProgressGroup;
  [(TSUProgress *)&v4 dealloc];
}

- (double)value
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mChildren = self->mChildren;
  uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v11;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(mChildren);
      }
      [*(id *)(*((void *)&v10 + 1) + 8 * i) value];
      double v6 = v6 + v8;
    }
    uint64_t v4 = [(NSArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (double)maxValue
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mChildren = self->mChildren;
  uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v11;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(mChildren);
      }
      [*(id *)(*((void *)&v10 + 1) + 8 * i) maxValue];
      double v6 = v6 + v8;
    }
    uint64_t v4 = [(NSArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (BOOL)isIndeterminate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->mChildren count])
  {
LABEL_11:
    LOBYTE(v4) = 1;
    return v4;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mChildren = self->mChildren;
  uint64_t v4 = [(NSArray *)mChildren countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(mChildren);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) isIndeterminate]) {
        goto LABEL_11;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)mChildren countByEnumeratingWithState:&v9 objects:v13 count:16];
        LOBYTE(v4) = 0;
        if (v5) {
          goto LABEL_4;
        }
        return v4;
      }
    }
  }
  return v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TSUProgressGroup;
  id v6 = [(TSUProgress *)&v8 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  [(TSUProgressGroup *)self p_updateChildrenProgressObservers];
  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSUProgressGroup;
  [(TSUProgress *)&v4 removeProgressObserver:a3];
  [(TSUProgressGroup *)self p_updateChildrenProgressObservers];
}

- (void)p_updateChildrenProgressObservers
{
  [(TSUProgress *)self protected_minProgressObserverValueInterval];
  mChildrenProgressObserversQueue = self->mChildrenProgressObserversQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke;
  v5[3] = &unk_26462A5E8;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(mChildrenProgressObserversQueue, v5);
}

uint64_t __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectAtIndex:", v6 + i), "removeProgressObserver:", *(void *)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
      v6 += i;
    }
    while (v5);
  }

  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 >= 0 && ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
    || (unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFELL)
  {
    id v23 = v2;
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v13 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          double v19 = *(double *)(a1 + 40);
          uint64_t v20 = *(void *)(a1 + 32);
          uint64_t v21 = *(void *)(v20 + 48);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke_2;
          v24[3] = &unk_26462A048;
          v24[4] = v20;
          objc_msgSend(v12, "addObject:", objc_msgSend(v18, "addProgressObserverWithValueInterval:queue:handler:", v21, v24, v19));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v15);
    }
    id v2 = v23;
    *(void *)(*(void *)(a1 + 32) + 40) = v12;
  }
  return [v2 drain];
}

uint64_t __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  return [v2 drain];
}

@end