@interface RBMutableSystemState
- (RBMutableSystemState)init;
- (void)addAllowLaunchPredicate:(id)a3;
- (void)addPreventIdleSleepIdentifier:(id)a3;
- (void)addPreventLaunchPredicate:(id)a3;
- (void)addTag:(id)a3;
- (void)prewarmIdentity:(id)a3 withInterval:(double)a4;
- (void)removeAllPreventIdleSleepIdentifiers;
- (void)removePreventIdleSleepIdentifier:(id)a3;
- (void)setPreventIdleSleep:(BOOL)a3;
- (void)setPreventLaunch:(BOOL)a3;
- (void)unionState:(id)a3;
- (void)upgradeCondition:(id)a3 toValue:(int64_t)a4;
@end

@implementation RBMutableSystemState

- (RBMutableSystemState)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBMutableSystemState;
  return (RBMutableSystemState *)[(RBSystemState *)&v3 _init];
}

- (void)unionState:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v4 = (RBMutableSystemState *)a3;
  v5 = v4;
  if (v4 && v4 != self)
  {
    self->super._preventIdleSleep |= v4->super._preventIdleSleep;
    self->super._preventLaunch |= v4->super._preventLaunch;
    v6 = v4->super._preventIdleSleepIdentifiers;
    if ([(NSMutableSet *)v6 count])
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        [(NSMutableSet *)preventIdleSleepIdentifiers unionSet:v6];
      }
      else
      {
        v8 = (NSMutableSet *)[(NSMutableSet *)v6 mutableCopy];
        v9 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v8;
      }
    }
    v10 = v5->super._tags;
    if ([(NSMutableSet *)v10 count])
    {
      tags = self->super._tags;
      if (tags)
      {
        [(NSMutableSet *)tags unionSet:v10];
      }
      else
      {
        v12 = (NSMutableSet *)[(NSMutableSet *)v10 mutableCopy];
        v13 = self->super._tags;
        self->super._tags = v12;
      }
    }
    v30 = v6;
    v14 = v5->super._preventLaunchPredicates;
    if ([(NSMutableSet *)v14 count])
    {
      preventLaunchPredicates = self->super._preventLaunchPredicates;
      if (preventLaunchPredicates)
      {
        -[NSMutableSet unionSet:](preventLaunchPredicates, "unionSet:", v14, v6);
      }
      else
      {
        v16 = (NSMutableSet *)[(NSMutableSet *)v14 mutableCopy];
        v17 = self->super._preventLaunchPredicates;
        self->super._preventLaunchPredicates = v16;
      }
    }
    v18 = v5->super._allowLaunchPredicates;

    if ([(NSMutableSet *)v18 count])
    {
      allowLaunchPredicates = self->super._allowLaunchPredicates;
      if (allowLaunchPredicates)
      {
        [(NSMutableSet *)allowLaunchPredicates unionSet:v18];
      }
      else
      {
        v20 = (NSMutableSet *)[(NSMutableSet *)v18 mutableCopy];
        v21 = self->super._allowLaunchPredicates;
        self->super._allowLaunchPredicates = v20;
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = [(NSMutableDictionary *)v5->super._conditions allKeys];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v28 = [(NSMutableDictionary *)v5->super._conditions objectForKey:v27];
          -[RBMutableSystemState upgradeCondition:toValue:](self, "upgradeCondition:toValue:", v27, [v28 integerValue]);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v24);
    }

    prewarmConfiguration = v5->super._prewarmConfiguration;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __35__RBMutableSystemState_unionState___block_invoke;
    v32[3] = &unk_2647C8248;
    v32[4] = self;
    [(NSMutableDictionary *)prewarmConfiguration enumerateKeysAndObjectsUsingBlock:v32];
  }
}

void __35__RBMutableSystemState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "prewarmIdentity:withInterval:", v5);
}

- (void)setPreventLaunch:(BOOL)a3
{
  self->super._preventLaunch = a3;
}

- (void)setPreventIdleSleep:(BOOL)a3
{
  self->super._preventIdleSleep = a3;
}

- (void)addPreventIdleSleepIdentifier:(id)a3
{
  id v4 = a3;
  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  id v8 = v4;
  if (!preventIdleSleepIdentifiers)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = v6;

    id v4 = v8;
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  }
  [(NSMutableSet *)preventIdleSleepIdentifiers addObject:v4];
}

- (void)removePreventIdleSleepIdentifier:(id)a3
{
}

- (void)removeAllPreventIdleSleepIdentifiers
{
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  tags = self->super._tags;
  id v8 = v4;
  if (!tags)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._tags;
    self->super._tags = v6;

    id v4 = v8;
    tags = self->super._tags;
  }
  [(NSMutableSet *)tags addObject:v4];
}

- (void)addPreventLaunchPredicate:(id)a3
{
  id v4 = a3;
  preventLaunchPredicates = self->super._preventLaunchPredicates;
  id v8 = v4;
  if (!preventLaunchPredicates)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._preventLaunchPredicates;
    self->super._preventLaunchPredicates = v6;

    id v4 = v8;
    preventLaunchPredicates = self->super._preventLaunchPredicates;
  }
  [(NSMutableSet *)preventLaunchPredicates addObject:v4];
}

- (void)addAllowLaunchPredicate:(id)a3
{
  id v4 = a3;
  allowLaunchPredicates = self->super._allowLaunchPredicates;
  id v8 = v4;
  if (!allowLaunchPredicates)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._allowLaunchPredicates;
    self->super._allowLaunchPredicates = v6;

    id v4 = v8;
    allowLaunchPredicates = self->super._allowLaunchPredicates;
  }
  [(NSMutableSet *)allowLaunchPredicates addObject:v4];
}

- (void)upgradeCondition:(id)a3 toValue:(int64_t)a4
{
  id v6 = a3;
  conditions = self->super._conditions;
  id v14 = v6;
  if (!conditions)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = self->super._conditions;
    self->super._conditions = v8;

    id v6 = v14;
    conditions = self->super._conditions;
  }
  v10 = [(NSMutableDictionary *)conditions objectForKey:v6];
  v11 = v10;
  if (!v10 || [v10 integerValue] < a4)
  {
    v12 = self->super._conditions;
    v13 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setValue:v13 forKey:v14];
  }
}

- (void)prewarmIdentity:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  if (!v6) {
    -[RBMutableSystemState prewarmIdentity:withInterval:]();
  }
  id v7 = v6;
  prewarmConfiguration = self->super._prewarmConfiguration;
  id v16 = v7;
  if (!prewarmConfiguration)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = self->super._prewarmConfiguration;
    self->super._prewarmConfiguration = v9;

    id v7 = v16;
    prewarmConfiguration = self->super._prewarmConfiguration;
  }
  v11 = [(NSMutableDictionary *)prewarmConfiguration objectForKey:v7];
  v12 = v11;
  if (!v11 || ([v11 doubleValue], v13 > a4))
  {
    id v14 = self->super._prewarmConfiguration;
    v15 = [NSNumber numberWithDouble:a4];
    [(NSMutableDictionary *)v14 setObject:v15 forKey:v16];
  }
}

- (void)prewarmIdentity:withInterval:.cold.1()
{
}

@end