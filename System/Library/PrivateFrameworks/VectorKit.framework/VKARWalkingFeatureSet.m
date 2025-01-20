@interface VKARWalkingFeatureSet
- (BOOL)isEqual:(id)a3;
- (NSArray)features;
- (VKARWalkingFeatureSet)initWithFeatures:(id)a3;
- (id).cxx_construct;
- (id)description;
- (int64_t)state;
- (unint64_t)uniqueIdentifier;
- (void)_stateWillChangeFromState:(int64_t)a3 nextState:(int64_t)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation VKARWalkingFeatureSet

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_1EF559DF8;
  *((void *)self + 2) = 0;
  *((void *)self + 6) = &unk_1EF5594D8;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = 850045863;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 72));
  *((void *)self + 6) = &unk_1EF5594D8;

  *((void *)self + 1) = &unk_1EF559DF8;
  v3 = (void *)*((void *)self + 2);
}

- (unint64_t)uniqueIdentifier
{
  return *((void *)self + 4);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  unint64_t v7 = *((void *)self + 5) - 1;
  if (v7 > 4) {
    v8 = @"VKARWalkingFeatureSetStateNone";
  }
  else {
    v8 = (__CFString *)*((void *)&off_1E5A92B48 + v7);
  }
  v9 = [v3 stringWithFormat:@"<%@: %p uniqueIdentifier:%llu state:%@ features:%@>", v5, self, *((void *)self + 4), v8, *((void *)self + 2)];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKARWalkingFeatureSet *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      unint64_t v7 = v4;
      v8 = [(VKARWalkingFeatureSet *)self features];
      v9 = [(VKARWalkingFeatureSet *)v7 features];

      if (v8 == v9)
      {
        char v6 = 1;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CAD0];
        v11 = [(VKARWalkingFeatureSet *)self features];
        v12 = [v10 setWithArray:v11];

        v13 = (void *)MEMORY[0x1E4F1CAD0];
        v14 = [(VKARWalkingFeatureSet *)v7 features];
        v15 = [v13 setWithArray:v14];

        char v6 = [v12 isEqualToSet:v15];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 72));
  [*((id *)self + 7) removeObject:v4];
  std::mutex::unlock((std::mutex *)((char *)self + 72));
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 72));
  [*((id *)self + 7) addObject:v4];
  std::mutex::unlock((std::mutex *)((char *)self + 72));
}

- (NSArray)features
{
  return (NSArray *)*((id *)self + 2);
}

- (void)_stateWillChangeFromState:(int64_t)a3 nextState:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *((id *)self + 7);
  uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    v9 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__VKARWalkingFeatureSet__stateWillChangeFromState_nextState___block_invoke;
        block[3] = &unk_1E5A92B28;
        block[4] = v11;
        block[5] = self;
        block[6] = a3;
        block[7] = a4;
        dispatch_async(v9, block);
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

uint64_t __61__VKARWalkingFeatureSet__stateWillChangeFromState_nextState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) featureSetStateDidChange:*(void *)(a1 + 40) previous:*(void *)(a1 + 48) current:*(void *)(a1 + 56)];
}

- (void)setState:(int64_t)a3
{
  uint64_t v5 = (std::mutex *)((char *)self + 72);
  std::mutex::lock((std::mutex *)((char *)self + 72));
  uint64_t v6 = *((void *)self + 5);
  if (v6 != a3)
  {
    [(VKARWalkingFeatureSet *)self _stateWillChangeFromState:v6 nextState:a3];
    *((void *)self + 5) = a3;
  }
  std::mutex::unlock(v5);
}

- (int64_t)state
{
  v3 = (std::mutex *)((char *)self + 72);
  std::mutex::lock((std::mutex *)((char *)self + 72));
  int64_t v4 = *((void *)self + 5);
  std::mutex::unlock(v3);
  return v4;
}

- (VKARWalkingFeatureSet)initWithFeatures:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKARWalkingFeatureSet;
  uint64_t v5 = [(VKARWalkingFeatureSet *)&v14 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v7;

    *((void *)v5 + 4) = atomic_fetch_add(&nextIdentifier(void)::key, 1uLL) + 1;
    *((void *)v5 + 5) = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v11 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v10;

    v12 = v5;
  }

  return v5;
}

@end