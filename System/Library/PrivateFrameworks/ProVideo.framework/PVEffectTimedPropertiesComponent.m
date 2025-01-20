@interface PVEffectTimedPropertiesComponent
- (BOOL)addTimedPropertiesToDict:(id)a3 time:(id *)a4;
- (BOOL)applyTimedPropertiesForTime:(id *)a3;
- (BOOL)hasTimedPropertiesDelegate:(id)a3;
- (BOOL)hasTimedPropertiesDelegates;
- (PVEffectTimedPropertiesComponent)initWithEffect:(id)a3;
- (id).cxx_construct;
- (id)delegateWrappers;
- (id)timedPropertiesDelegates;
- (id)userContextForTimedPropertiesDelegate:(id)a3;
- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4;
- (void)addTimedPropertiesDelegateWrapper:(id)a3;
- (void)effectDidLoad:(id)a3 isReady:(BOOL)a4;
- (void)effectDidUnload:(id)a3;
- (void)removeAllTimedPropertiesDelegates;
- (void)removeTimedPropertiesDelegate:(id)a3;
@end

@implementation PVEffectTimedPropertiesComponent

- (PVEffectTimedPropertiesComponent)initWithEffect:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PVEffectTimedPropertiesComponent;
  if ([(PVEffectComponent *)&v6 initWithEffect:v4]) {
    operator new();
  }

  return 0;
}

- (void)addTimedPropertiesDelegateWrapper:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    value = self->_delegateCollectionLock.__ptr_.__value_;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = *(void *)"";
    v7[2] = __70__PVEffectTimedPropertiesComponent_addTimedPropertiesDelegateWrapper___block_invoke;
    v7[3] = &unk_1E61689D8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(*(dispatch_queue_t *)value, v7);
  }
}

uint64_t __70__PVEffectTimedPropertiesComponent_addTimedPropertiesDelegateWrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (BOOL)applyTimedPropertiesForTime:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v5 = [(PVEffectComponent *)self effect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __64__PVEffectTimedPropertiesComponent_applyTimedPropertiesForTime___block_invoke;
  v7[3] = &unk_1E616B8B0;
  v7[4] = self;
  void v7[5] = &v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v5 runWithInspectableProperties:v7];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

void __64__PVEffectTimedPropertiesComponent_applyTimedPropertiesForTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 addTimedPropertiesToDict:v3 time:&v5];
}

- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [PVEffectTimedPropertiesDelegateWrapper alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(PVEffectComponent *)self effect];
  uint64_t v9 = [v11 supportedTimedPropertyGroupsForEffect:v8];
  v10 = [(PVEffectTimedPropertiesDelegateWrapper *)v7 initWithTimedPropertiesDelegate:v11 supportedTimedPropertyGroups:v9 userContext:v6];

  [(PVEffectTimedPropertiesComponent *)self addTimedPropertiesDelegateWrapper:v10];
}

- (void)removeTimedPropertiesDelegate:(id)a3
{
  id v4 = a3;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __66__PVEffectTimedPropertiesComponent_removeTimedPropertiesDelegate___block_invoke;
  v8[3] = &unk_1E61689D8;
  v8[4] = self;
  id v9 = v4;
  id v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __66__PVEffectTimedPropertiesComponent_removeTimedPropertiesDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)removeAllTimedPropertiesDelegates
{
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __69__PVEffectTimedPropertiesComponent_removeAllTimedPropertiesDelegates__block_invoke;
  block[3] = &unk_1E61689B0;
  block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

uint64_t __69__PVEffectTimedPropertiesComponent_removeAllTimedPropertiesDelegates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (id)delegateWrappers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __52__PVEffectTimedPropertiesComponent_delegateWrappers__block_invoke;
  v5[3] = &unk_1E6169380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__PVEffectTimedPropertiesComponent_delegateWrappers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)timedPropertiesDelegates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke;
  v5[3] = &unk_1E6169850;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) anyObject];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = *(void *)"";
    v9[2] = __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke_2;
    v9[3] = &unk_1E616B8D8;
    id v5 = v3;
    id v10 = v5;
    [v4 enumerateObjectsUsingBlock:v9];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    id v8 = v5;
  }
}

void __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1BA9C0A20]();
  id v5 = [a2 timedPropertiesDelegate];
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (BOOL)hasTimedPropertiesDelegates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke;
  v5[3] = &unk_1E6169850;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke_2;
  v3[3] = &unk_1E616B900;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 timedPropertiesDelegate];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)hasTimedPropertiesDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegate___block_invoke;
  block[3] = &unk_1E616B740;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  uint64_t v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, block);
  LOBYTE(v6) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

uint64_t __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegate___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)userContextForTimedPropertiesDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __74__PVEffectTimedPropertiesComponent_userContextForTimedPropertiesDelegate___block_invoke;
  block[3] = &unk_1E616B740;
  id v11 = v4;
  uint64_t v12 = &v13;
  block[4] = self;
  uint64_t v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __74__PVEffectTimedPropertiesComponent_userContextForTimedPropertiesDelegate___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) member:a1[5]];
  uint64_t v2 = [v5 userContext];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)addTimedPropertiesToDict:(id)a3 time:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v7 = [(PVEffectComponent *)self effect];
  id v8 = [(PVEffectTimedPropertiesComponent *)self delegateWrappers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  v12[2] = __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke;
  v12[3] = &unk_1E616B950;
  id v9 = v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
  id v13 = v9;
  uint64_t v15 = &v17;
  id v10 = v6;
  id v14 = v10;
  [v8 enumerateObjectsUsingBlock:v12];

  LOBYTE(v6) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

void __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1BA9C0A20]();
  id v5 = [v3 timedPropertiesDelegate];
  if (v5)
  {
    id v6 = [v3 supportedTimedPropertyGroups];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = *(void *)"";
    v9[2] = __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke_2;
    v9[3] = &unk_1E616B928;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    long long v14 = *(_OWORD *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 72);
    id v12 = v3;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    long long v13 = v8;
    [v6 enumerateObjectsUsingBlock:v9];
  }
}

void __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1BA9C0A20]();
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(*(id *)(a1 + 48), "userContext", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88));
  long long v8 = [v5 effect:v6 timedPropertiesForGroup:v3 time:&v9 userContext:v7];

  if ([v8 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 56) addEntriesFromDictionary:v8];
  }
}

- (void)effectDidLoad:(id)a3 isReady:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [(PVEffectTimedPropertiesComponent *)self delegateWrappers];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __58__PVEffectTimedPropertiesComponent_effectDidLoad_isReady___block_invoke;
  v8[3] = &unk_1E616B8D8;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __58__PVEffectTimedPropertiesComponent_effectDidLoad_isReady___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)MEMORY[0x1BA9C0A20]();
  id v4 = [v7 timedPropertiesDelegate];
  if (v4 && [v7 wantsStartStopNotifications])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v7 userContext];
    [v4 effect:v5 willStartRequestingTimedProperties:v6];
  }
}

- (void)effectDidUnload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PVEffectTimedPropertiesComponent *)self delegateWrappers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __52__PVEffectTimedPropertiesComponent_effectDidUnload___block_invoke;
  v7[3] = &unk_1E616B8D8;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __52__PVEffectTimedPropertiesComponent_effectDidUnload___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)MEMORY[0x1BA9C0A20]();
  id v4 = [v7 timedPropertiesDelegate];
  if (v4 && [v7 wantsStartStopNotifications])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v7 userContext];
    [v4 effect:v5 didStopRequestingTimedProperties:v6];
  }
}

- (void).cxx_destruct
{
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_delegateCollectionLock, 0);

  objc_storeStrong((id *)&self->_delegateWrappers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end