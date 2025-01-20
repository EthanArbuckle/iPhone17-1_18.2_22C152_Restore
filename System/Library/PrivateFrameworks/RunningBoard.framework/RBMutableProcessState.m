@interface RBMutableProcessState
- (id)copyWithZone:(_NSZone *)a3;
- (void)addEndowmentInfo:(id)a3;
- (void)addInheritance:(id)a3;
- (void)addLegacyAssertion:(id)a3;
- (void)addPreventIdleSleepIdentifier:(id)a3;
- (void)addRBAssertion:(id)a3;
- (void)addTag:(id)a3;
- (void)removeAllEndowmentInfos;
- (void)removeAllInheritances;
- (void)removeAllPreventIdleSleepIdentifiers;
- (void)removeEndowmentInfo:(id)a3;
- (void)removeInheritance:(id)a3;
- (void)removePreventIdleSleepIdentifier:(id)a3;
- (void)setCarPlayMode:(BOOL)a3;
- (void)setCoalitionLevel:(unint64_t)a3;
- (void)setExplicitJetsamBand:(unint64_t)a3;
- (void)setForceRoleManage:(BOOL)a3;
- (void)setGPURole:(unsigned __int8)a3;
- (void)setGuaranteedRunning:(BOOL)a3;
- (void)setIsBeingDebugged:(BOOL)a3;
- (void)setJetsamLenientMode:(BOOL)a3;
- (void)setLegacyFinishTaskReason:(unint64_t)a3;
- (void)setMaxCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4;
- (void)setMemoryLimit:(int)a3;
- (void)setMemoryLimitCategory:(id)a3;
- (void)setMemoryLimitStrength:(unsigned __int8)a3;
- (void)setMinCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4;
- (void)setPreventBaseMemoryLimitReduction:(BOOL)a3;
- (void)setPreventIdleSleep:(BOOL)a3;
- (void)setPreventSuspend:(BOOL)a3;
- (void)setRole:(unsigned __int8)a3;
- (void)setTargetedBySuspendableAssertion:(BOOL)a3;
- (void)setTerminationResistance:(unsigned __int8)a3;
- (void)setThrottleBestEffortNetworking:(BOOL)a3;
- (void)unionState:(id)a3;
@end

@implementation RBMutableProcessState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[RBProcessState allocWithZone:a3];
  return -[RBProcessState _initWithProcessState:]((id *)&v4->super.isa, self);
}

- (void)unionState:(id)a3
{
  v4 = (RBMutableProcessState *)a3;
  v5 = v4;
  if (v4 && v4 != self)
  {
    self->super._flags |= v4->super._flags;
    unsigned int terminationResistance = self->super._terminationResistance;
    if (terminationResistance <= v4->super._terminationResistance) {
      LOBYTE(terminationResistance) = v4->super._terminationResistance;
    }
    self->super._unsigned int terminationResistance = terminationResistance;
    unint64_t explicitJetsamBand = self->super._explicitJetsamBand;
    if (explicitJetsamBand <= v4->super._explicitJetsamBand) {
      unint64_t explicitJetsamBand = v4->super._explicitJetsamBand;
    }
    self->super._unint64_t explicitJetsamBand = explicitJetsamBand;
    int memoryLimit = self->super._memoryLimit;
    int v9 = v4->super._memoryLimit;
    if (memoryLimit == v9)
    {
      unsigned int memoryLimitStrength = self->super._memoryLimitStrength;
      if (memoryLimitStrength <= v4->super._memoryLimitStrength) {
        LOBYTE(memoryLimitStrength) = v4->super._memoryLimitStrength;
      }
      self->super._unsigned int memoryLimitStrength = memoryLimitStrength;
    }
    else if (memoryLimit < v9)
    {
      objc_storeStrong((id *)&self->super._memoryLimitCategory, v4->super._memoryLimitCategory);
      self->super._unsigned int memoryLimitStrength = v5->super._memoryLimitStrength;
      self->super._int memoryLimit = v5->super._memoryLimit;
    }
    unsigned int role = self->super._role;
    if (role <= v5->super._role) {
      LOBYTE(role) = v5->super._role;
    }
    self->super._unsigned int role = role;
    unsigned int gpuRole = self->super._gpuRole;
    if (gpuRole <= v5->super._gpuRole) {
      LOBYTE(gpuRole) = v5->super._gpuRole;
    }
    self->super._unsigned int gpuRole = gpuRole;
    BOOL v13 = self->super._guaranteedRunning || v5->super._guaranteedRunning;
    self->super._guaranteedRunning = v13;
    unint64_t coalitionLevel = self->super._coalitionLevel;
    if (coalitionLevel <= v5->super._coalitionLevel) {
      unint64_t coalitionLevel = v5->super._coalitionLevel;
    }
    self->super._unint64_t coalitionLevel = coalitionLevel;
    unint64_t legacyFinishTaskReason = v5->super._legacyFinishTaskReason;
    if (legacyFinishTaskReason && self->super._legacyFinishTaskReason - 1 >= legacyFinishTaskReason) {
      self->super._unint64_t legacyFinishTaskReason = legacyFinishTaskReason;
    }
    v16 = v5->super._preventIdleSleepIdentifiers;
    if ([(NSMutableSet *)v16 count])
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        [(NSMutableSet *)preventIdleSleepIdentifiers unionSet:v16];
      }
      else
      {
        v18 = (NSMutableSet *)[(NSMutableSet *)v16 mutableCopy];
        v19 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v18;
      }
    }
    v20 = v5->super._minCPULimitsByRole;
    if ([(NSMutableDictionary *)v20 count])
    {
      if (self->super._minCPULimitsByRole)
      {
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __36__RBMutableProcessState_unionState___block_invoke;
        v47[3] = &unk_2647C80E0;
        v47[4] = self;
        [(NSMutableDictionary *)v20 enumerateKeysAndObjectsUsingBlock:v47];
      }
      else
      {
        v21 = (NSMutableDictionary *)[(NSMutableDictionary *)v20 mutableCopy];
        minCPULimitsByRole = self->super._minCPULimitsByRole;
        self->super._minCPULimitsByRole = v21;
      }
    }
    v23 = v5->super._maxCPULimitsByRole;
    if ([(NSMutableDictionary *)v23 count])
    {
      if (self->super._maxCPULimitsByRole)
      {
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __36__RBMutableProcessState_unionState___block_invoke_2;
        v46[3] = &unk_2647C8108;
        v46[4] = self;
        [(NSMutableDictionary *)v23 enumerateKeysAndObjectsUsingBlock:v46];
      }
      else
      {
        v24 = (NSMutableDictionary *)[(NSMutableDictionary *)v23 mutableCopy];
        maxCPULimitsByRole = self->super._maxCPULimitsByRole;
        self->super._maxCPULimitsByRole = v24;
      }
    }
    v26 = v5->super._inheritances;
    if ([(RBInheritanceCollection *)v26 count])
    {
      inheritances = self->super._inheritances;
      if (inheritances)
      {
        [(RBInheritanceCollection *)inheritances unionCollection:v26];
      }
      else
      {
        v28 = (RBInheritanceCollection *)[(RBInheritanceCollection *)v26 mutableCopy];
        v29 = self->super._inheritances;
        self->super._inheritances = v28;
      }
    }
    v30 = v5->super._tags;
    if ([(NSMutableSet *)v30 count])
    {
      tags = self->super._tags;
      if (tags)
      {
        [(NSMutableSet *)tags unionSet:v30];
      }
      else
      {
        v32 = (NSMutableSet *)[(NSMutableSet *)v30 mutableCopy];
        v33 = self->super._tags;
        self->super._tags = v32;
      }
    }
    v34 = v5->super._legacyAssertions;
    if ([(NSMutableSet *)v34 count])
    {
      legacyAssertions = self->super._legacyAssertions;
      if (legacyAssertions)
      {
        [(NSMutableSet *)legacyAssertions unionSet:v34];
      }
      else
      {
        v36 = (NSMutableSet *)[(NSMutableSet *)v34 mutableCopy];
        v37 = self->super._legacyAssertions;
        self->super._legacyAssertions = v36;
      }
    }
    v38 = v5->super._primitiveAssertions;
    if ([(NSMutableSet *)v38 count])
    {
      primitiveAssertions = self->super._primitiveAssertions;
      if (primitiveAssertions)
      {
        [(NSMutableSet *)primitiveAssertions unionSet:v38];
      }
      else
      {
        v40 = (NSMutableSet *)[(NSMutableSet *)v38 mutableCopy];
        v41 = self->super._primitiveAssertions;
        self->super._primitiveAssertions = v40;
      }
    }
    v42 = v5->super._endowmentInfos;
    if ([(NSMutableSet *)v42 count])
    {
      endowmentInfos = self->super._endowmentInfos;
      if (endowmentInfos)
      {
        [(NSMutableSet *)endowmentInfos unionSet:v42];
      }
      else
      {
        v44 = (NSMutableSet *)[(NSMutableSet *)v42 mutableCopy];
        v45 = self->super._endowmentInfos;
        self->super._endowmentInfos = v44;
      }
    }
  }
}

- (void)addRBAssertion:(id)a3
{
  id v4 = a3;
  primitiveAssertions = self->super._primitiveAssertions;
  id v8 = v4;
  if (!primitiveAssertions)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._primitiveAssertions;
    self->super._primitiveAssertions = v6;

    id v4 = v8;
    primitiveAssertions = self->super._primitiveAssertions;
  }
  [(NSMutableSet *)primitiveAssertions addObject:v4];
}

- (void)setPreventBaseMemoryLimitReduction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFF7F | v3;
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

- (void)setTargetedBySuspendableAssertion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFEFF | v3;
}

- (void)setPreventSuspend:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFBF | v3;
}

- (void)setRole:(unsigned __int8)a3
{
  self->super._unsigned int role = a3;
}

- (void)setTerminationResistance:(unsigned __int8)a3
{
  self->super._unsigned int terminationResistance = a3;
}

- (void)setExplicitJetsamBand:(unint64_t)a3
{
  self->super._unint64_t explicitJetsamBand = a3;
}

- (void)setGPURole:(unsigned __int8)a3
{
  self->super._unsigned int gpuRole = a3;
}

- (void)addInheritance:(id)a3
{
  id v4 = a3;
  inheritances = self->super._inheritances;
  id v13 = v4;
  if (!inheritances)
  {
    v6 = objc_alloc_init(RBMutableInheritanceCollection);
    v7 = self->super._inheritances;
    self->super._inheritances = &v6->super;

    id v4 = v13;
    inheritances = self->super._inheritances;
  }
  [(RBInheritanceCollection *)inheritances addInheritance:v4];
  id v8 = objc_alloc(MEMORY[0x263F64550]);
  int v9 = [v13 endowmentNamespace];
  v10 = [v13 environment];
  v11 = [v13 encodedEndowment];
  v12 = (void *)[v8 _initWithNamespace:v9 environment:v10 encodedEndowment:v11];

  [(RBMutableProcessState *)self addEndowmentInfo:v12];
}

- (void)addEndowmentInfo:(id)a3
{
  id v4 = a3;
  endowmentInfos = self->super._endowmentInfos;
  id v8 = v4;
  if (!endowmentInfos)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._endowmentInfos;
    self->super._endowmentInfos = v6;

    id v4 = v8;
    endowmentInfos = self->super._endowmentInfos;
  }
  [(NSMutableSet *)endowmentInfos addObject:v4];
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

- (void)setPreventIdleSleep:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFB | v3;
}

- (void)setMemoryLimitStrength:(unsigned __int8)a3
{
  self->super._unsigned int memoryLimitStrength = a3;
}

- (void)setMemoryLimitCategory:(id)a3
{
}

- (void)setMemoryLimit:(int)a3
{
  self->super._int memoryLimit = a3;
}

- (void)addLegacyAssertion:(id)a3
{
  id v4 = a3;
  legacyAssertions = self->super._legacyAssertions;
  id v8 = v4;
  if (!legacyAssertions)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = self->super._legacyAssertions;
    self->super._legacyAssertions = v6;

    id v4 = v8;
    legacyAssertions = self->super._legacyAssertions;
  }
  [(NSMutableSet *)legacyAssertions addObject:v4];
}

void __36__RBMutableProcessState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKey:v7];
  id v8 = [v6 unionLimit:v9];

  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v8 forKey:v7];
}

void __36__RBMutableProcessState_unionState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKey:v7];
  id v8 = [v6 unionLimit:v9];

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:v7];
}

- (void)setIsBeingDebugged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFD | v3;
}

- (void)setJetsamLenientMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFF7 | v3;
}

- (void)setCoalitionLevel:(unint64_t)a3
{
  self->super._unint64_t coalitionLevel = a3;
}

- (void)setLegacyFinishTaskReason:(unint64_t)a3
{
  self->super._unint64_t legacyFinishTaskReason = a3;
}

- (void)removePreventIdleSleepIdentifier:(id)a3
{
  [(NSMutableSet *)self->super._preventIdleSleepIdentifiers removeObject:a3];
  if (![(NSMutableSet *)self->super._preventIdleSleepIdentifiers count])
  {
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = 0;
  }
}

- (void)removeAllPreventIdleSleepIdentifiers
{
  self->super._preventIdleSleepIdentifiers = 0;
  MEMORY[0x270F9A758]();
}

- (void)setMinCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v15 = v6;
    minCPULimitsByRole = self->super._minCPULimitsByRole;
    if (!minCPULimitsByRole)
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      id v9 = self->super._minCPULimitsByRole;
      self->super._minCPULimitsByRole = v8;

      minCPULimitsByRole = self->super._minCPULimitsByRole;
    }
    v10 = [NSNumber numberWithUnsignedChar:v4];
    v11 = [(NSMutableDictionary *)minCPULimitsByRole objectForKeyedSubscript:v10];

    v12 = [v15 unionLimit:v11];
    id v13 = self->super._minCPULimitsByRole;
    v14 = [NSNumber numberWithUnsignedChar:v4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    id v6 = v15;
  }
}

- (void)setThrottleBestEffortNetworking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFEF | v3;
}

- (void)setForceRoleManage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFDF | v3;
}

- (void)setGuaranteedRunning:(BOOL)a3
{
  self->super._guaranteedRunning = a3;
}

- (void)setCarPlayMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFDFF | v3;
}

- (void)removeEndowmentInfo:(id)a3
{
  endowmentInfos = self->super._endowmentInfos;
  v5 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(NSMutableSet *)endowmentInfos minusSet:v5];

  if (![(NSMutableSet *)self->super._endowmentInfos count])
  {
    id v6 = self->super._endowmentInfos;
    self->super._endowmentInfos = 0;
  }
}

- (void)removeAllEndowmentInfos
{
  self->super._endowmentInfos = 0;
  MEMORY[0x270F9A758]();
}

- (void)removeInheritance:(id)a3
{
  inheritances = self->super._inheritances;
  id v5 = a3;
  [(RBInheritanceCollection *)inheritances removeInheritance:v5];
  if (![(RBInheritanceCollection *)self->super._inheritances count])
  {
    id v6 = self->super._inheritances;
    self->super._inheritances = 0;
  }
  id v7 = objc_alloc(MEMORY[0x263F64550]);
  id v8 = [v5 endowmentNamespace];
  id v9 = [v5 environment];
  v10 = [v5 encodedEndowment];

  id v11 = (id)[v7 _initWithNamespace:v8 environment:v9 encodedEndowment:v10];
  [(RBMutableProcessState *)self removeEndowmentInfo:v11];
}

- (void)removeAllInheritances
{
  inheritances = self->super._inheritances;
  self->super._inheritances = 0;

  [(RBMutableProcessState *)self removeAllEndowmentInfos];
}

- (void)setMaxCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v15 = v6;
    maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    if (!maxCPULimitsByRole)
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      id v9 = self->super._maxCPULimitsByRole;
      self->super._maxCPULimitsByRole = v8;

      maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    }
    v10 = [NSNumber numberWithUnsignedChar:v4];
    id v11 = [(NSMutableDictionary *)maxCPULimitsByRole objectForKeyedSubscript:v10];

    v12 = [v15 unionLimit:v11];
    id v13 = self->super._maxCPULimitsByRole;
    v14 = [NSNumber numberWithUnsignedChar:v4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    id v6 = v15;
  }
}

@end