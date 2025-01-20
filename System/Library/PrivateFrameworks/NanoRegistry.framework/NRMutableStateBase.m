@interface NRMutableStateBase
+ (BOOL)supportsSecureCoding;
+ (id)classTypes;
+ (id)diffFrom:(id)a3 to:(id)a4;
+ (id)enclosedClassTypes;
- (BOOL)isEqual:(id)a3;
- (NRMutableStateBase)init;
- (id)addObserverQueue:(id)a3 withBlock:(id)a4;
- (id)applyDiff:(id)a3;
- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parentDelegate;
- (void)invalidate;
- (void)notifyObserversWithDiff:(id)a3;
- (void)notifyParentWithDiff:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setParentDelegate:(id)a3;
@end

@implementation NRMutableStateBase

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDelegate);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (NRMutableStateBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRMutableStateBase;
  result = [(NRMutableStateBase *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setParentDelegate:(id)a3
{
}

- (id)addObserverQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v16 = __49__NRMutableStateBase_addObserverQueue_withBlock___block_invoke;
  v17 = &unk_1E5B01138;
  v18 = self;
  id v8 = v7;
  id v20 = v8;
  id v9 = v6;
  id v19 = v9;
  v21 = &v22;
  p_lock = &self->_lock;
  v11 = v15;
  v12 = self;
  os_unfair_lock_lock_with_options();
  v16((uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __49__NRMutableStateBase_addObserverQueue_withBlock___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
  }
  self = objc_alloc_init(NRMutableStateBaseObserverWrapper);
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v5, *(id *)(a1 + 48), 8);
    objc_storeStrong((id *)&self->_queue, *(id *)(a1 + 40));
  }
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:self];
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)parentDelegate
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __36__NRMutableStateBase_parentDelegate__block_invoke;
  v10 = &unk_1E5B00C68;
  v11 = self;
  v12 = &v13;
  p_lock = &self->_lock;
  v4 = v8;
  v5 = self;
  os_unfair_lock_lock_with_options();
  v9((uint64_t)v4);

  os_unfair_lock_unlock(p_lock);
  id v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __36__NRMutableStateBase_parentDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)applyDiff:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(NRMutableStateBase *)self applyDiff:a3 upOnly:0 notifyParent:1 unconditional:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  return 0;
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  return 0;
}

+ (id)enclosedClassTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

+ (id)classTypes
{
  uint64_t v2 = [(id)objc_opt_class() enclosedClassTypes];
  uint64_t v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (void)notifyParentWithDiff:(id)a3
{
  id v4 = a3;
  id v5 = [(NRMutableStateBase *)self parentDelegate];
  [v5 child:self didApplyDiff:v4];
}

- (void)notifyObserversWithDiff:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  uint64_t v24 = __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke;
  v25 = &unk_1E5B00C68;
  v26 = self;
  id v27 = &v28;
  p_lock = &self->_lock;
  id v6 = v23;
  uint64_t v7 = self;
  os_unfair_lock_lock_with_options();
  v24((uint64_t)v6);

  os_unfair_lock_unlock(p_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)v29[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        if (v12)
        {
          uint64_t v13 = *(NSObject **)(v12 + 16);
          if (v13)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke_2;
            v17[3] = &unk_1E5B002A8;
            v17[4] = v12;
            id v18 = v4;
            dispatch_async(v13, v17);

            goto LABEL_11;
          }
          v14 = *(void **)(v12 + 8);
        }
        else
        {
          v14 = 0;
        }
        uint64_t v15 = v14;
        v15[2](v15, v4, v12);

LABEL_11:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v19 objects:v34 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __37__NRMutableStateBase_removeObserver___block_invoke;
  v8[3] = &unk_1E5B002A8;
  v8[4] = self;
  id v9 = v4;
  p_lock = &self->_lock;
  id v6 = self;
  id v7 = v4;
  os_unfair_lock_lock_with_options();
  __37__NRMutableStateBase_removeObserver___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(p_lock);
}

void __37__NRMutableStateBase_removeObserver___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = [*(id *)(a1 + 40) nonretainedObjectValue];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v2];
  }
}

- (void)invalidate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__NRMutableStateBase_invalidate__block_invoke;
  v4[3] = &unk_1E5B00230;
  v4[4] = self;
  p_lock = &self->_lock;
  uint64_t v3 = self;
  os_unfair_lock_lock_with_options();
  __32__NRMutableStateBase_invalidate__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __32__NRMutableStateBase_invalidate__block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), 0);
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 removeAllObjects];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (self) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = !v6;
  return (isKindOfClass & 1) != 0 && v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

@end