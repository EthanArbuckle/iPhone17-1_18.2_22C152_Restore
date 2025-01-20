@interface RBProcessState
- (BOOL)carPlayMode;
- (BOOL)effectiveJetsamLenientMode;
- (BOOL)forceRoleManage;
- (BOOL)guaranteedRunning;
- (BOOL)isAppNapEqualToProcessState:(id)a3;
- (BOOL)isBeingDebugged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProcessStateIgnoringIdentity:(id)a3;
- (BOOL)isEqualToProcessStateIgnoringInheritances:(id)a3;
- (BOOL)jetsamLenientMode;
- (BOOL)preventBaseMemoryLimitReduction;
- (BOOL)preventIdleSleep;
- (BOOL)preventSuspend;
- (BOOL)targetedBySuspendableAssertion;
- (BOOL)throttleBestEffortNetworking;
- (NSSet)endowmentInfos;
- (NSSet)legacyAssertions;
- (NSSet)preventIdleSleepIdentifiers;
- (NSSet)preventLaunchReasons;
- (NSSet)primitiveAssertions;
- (NSSet)tags;
- (NSString)memoryLimitCategory;
- (RBInheritanceCollection)inheritances;
- (RBProcessState)init;
- (RBProcessState)initWithIdentity:(id)a3;
- (RBSProcessIdentity)identity;
- (id)_initWithProcessState:(id *)a1;
- (id)clientStateForProcess:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)inheritancesForEnvironment:(id)a3;
- (id)maxCPUUsageLimitsForRole:(unsigned __int8)a3;
- (id)minCPUUsageLimitsForRole:(unsigned __int8)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)memoryLimit;
- (uint64_t)_isEqualToProcessStateIgnoringIdentityAndInheritances:(uint64_t)a1;
- (unint64_t)coalitionLevel;
- (unint64_t)effectiveMaxCPUDuration;
- (unint64_t)effectiveMaxCPUPercentage;
- (unint64_t)effectiveMaxCPUUsageViolationPolicy;
- (unint64_t)effectiveMinCPUDuration;
- (unint64_t)effectiveMinCPUPercentage;
- (unint64_t)explicitJetsamBand;
- (unint64_t)hash;
- (unint64_t)legacyFinishTaskReason;
- (unsigned)gpuRole;
- (unsigned)memoryLimitStrength;
- (unsigned)role;
- (unsigned)terminationResistance;
@end

@implementation RBProcessState

- (BOOL)throttleBestEffortNetworking
{
  return (self->_flags >> 4) & 1;
}

- (id)clientStateForProcess:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F64570]) initWithIdentity:self->_identity];
    goto LABEL_8;
  }
  v6 = [v4 handle];
  if ([v5 isTerminating])
  {
LABEL_8:
    unsigned __int8 v7 = 1;
    goto LABEL_9;
  }
  if ([v5 isReported])
  {
    if ([(RBProcessState *)self preventSuspend]) {
      unsigned __int8 v7 = 4;
    }
    else {
      unsigned __int8 v7 = 3;
    }
  }
  else
  {
    unsigned __int8 v7 = 2;
  }
LABEL_9:
  v8 = [MEMORY[0x263F645E0] stateWithProcess:v6];
  BOOL v9 = [(RBProcessState *)self isBeingDebugged];
  v10 = [(RBProcessState *)self inheritances];
  v11 = [v10 allNamespaces];

  if (v5 && [v5 isReported]) {
    uint64_t terminationResistance = self->_terminationResistance;
  }
  else {
    uint64_t terminationResistance = 20;
  }
  [v8 setTerminationResistance:terminationResistance];
  tags = self->_tags;
  legacyAssertions = self->_legacyAssertions;
  primitiveAssertions = self->_primitiveAssertions;
  v16 = self->_endowmentInfos;
  v17 = primitiveAssertions;
  v18 = legacyAssertions;
  v19 = tags;
  if (v9) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 1;
  }
  [v8 setDebugState:v20];
  [v8 setTaskState:v7];
  [v8 setEndowmentNamespaces:v11];
  [v8 setTags:v19];
  [v8 setLegacyAssertions:v18];
  [v8 setPrimitiveAssertions:v17];
  [v8 setEndowmentInfos:v16];

  return v8;
}

- (BOOL)isBeingDebugged
{
  return (self->_flags >> 1) & 1;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)guaranteedRunning
{
  return self->_guaranteedRunning;
}

- (unint64_t)effectiveMinCPUPercentage
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  v3 = [NSNumber numberWithUnsignedChar:self->_role];
  id v4 = [(NSMutableDictionary *)minCPULimitsByRole objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 percentage];

  return v5;
}

- (unint64_t)effectiveMinCPUDuration
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  v3 = [NSNumber numberWithUnsignedChar:self->_role];
  id v4 = [(NSMutableDictionary *)minCPULimitsByRole objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 duration];

  return v5;
}

- (unint64_t)effectiveMaxCPUUsageViolationPolicy
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  v3 = [NSNumber numberWithUnsignedChar:self->_role];
  id v4 = [(NSMutableDictionary *)maxCPULimitsByRole objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 violationPolicy];

  return v5;
}

- (unint64_t)effectiveMaxCPUPercentage
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  v3 = [NSNumber numberWithUnsignedChar:self->_role];
  id v4 = [(NSMutableDictionary *)maxCPULimitsByRole objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 percentage];

  return v5;
}

- (unint64_t)effectiveMaxCPUDuration
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  v3 = [NSNumber numberWithUnsignedChar:self->_role];
  id v4 = [(NSMutableDictionary *)maxCPULimitsByRole objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 duration];

  return v5;
}

- (unsigned)role
{
  return self->_role;
}

- (id)_initWithProcessState:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)RBProcessState;
    id v4 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      *((_WORD *)a1 + 60) = *((_WORD *)v3 + 60);
      *((unsigned char *)a1 + 89) = *((unsigned char *)v3 + 89);
      a1[12] = v3[12];
      objc_storeStrong(a1 + 13, v3[13]);
      *((unsigned char *)a1 + 112) = *((unsigned char *)v3 + 112);
      *((_DWORD *)a1 + 29) = *((_DWORD *)v3 + 29);
      *((unsigned char *)a1 + 122) = *((unsigned char *)v3 + 122);
      *((unsigned char *)a1 + 123) = *((unsigned char *)v3 + 123);
      *((unsigned char *)a1 + 88) = *((unsigned char *)v3 + 88);
      a1[10] = v3[10];
      a1[16] = v3[16];
      uint64_t v5 = [v3[7] mutableCopy];
      id v6 = a1[7];
      a1[7] = (id)v5;

      uint64_t v7 = [v3[8] mutableCopy];
      id v8 = a1[8];
      a1[8] = (id)v7;

      uint64_t v9 = [v3[9] mutableCopy];
      id v10 = a1[9];
      a1[9] = (id)v9;

      uint64_t v11 = [v3[6] mutableCopy];
      id v12 = a1[6];
      a1[6] = (id)v11;

      uint64_t v13 = [v3[3] mutableCopy];
      id v14 = a1[3];
      a1[3] = (id)v13;

      uint64_t v15 = [v3[4] mutableCopy];
      id v16 = a1[4];
      a1[4] = (id)v15;

      uint64_t v17 = [v3[2] mutableCopy];
      id v18 = a1[2];
      a1[2] = (id)v17;

      uint64_t v19 = [v3[17] mutableCopy];
      id v20 = a1[17];
      a1[17] = (id)v19;
    }
  }

  return a1;
}

- (RBInheritanceCollection)inheritances
{
  v2 = (void *)[(RBInheritanceCollection *)self->_inheritances copy];
  return (RBInheritanceCollection *)v2;
}

- (BOOL)targetedBySuspendableAssertion
{
  return HIBYTE(self->_flags) & 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[RBMutableProcessState allocWithZone:a3];
  return -[RBProcessState _initWithProcessState:]((id *)&v4->super.super.isa, self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventLaunchReasons, 0);
  objc_storeStrong((id *)&self->_endowmentInfos, 0);
  objc_storeStrong((id *)&self->_memoryLimitCategory, 0);
  objc_storeStrong((id *)&self->_primitiveAssertions, 0);
  objc_storeStrong((id *)&self->_legacyAssertions, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_preventIdleSleepIdentifiers, 0);
  objc_storeStrong((id *)&self->_jetsamLenientModeByRole, 0);
  objc_storeStrong((id *)&self->_minCPULimitsByRole, 0);
  objc_storeStrong((id *)&self->_maxCPULimitsByRole, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (RBProcessState)initWithIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"RBProcessState.m", 244, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)RBProcessState;
  id v6 = [(RBProcessState *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identity = v6->_identity;
    v6->_identity = (RBSProcessIdentity *)v7;

    *(_WORD *)&v6->_role = 257;
    v6->_uint64_t terminationResistance = 20;
    objc_storeStrong((id *)&v6->_memoryLimitCategory, (id)*MEMORY[0x263F64698]);
    v6->_memoryLimitStrength = 0;
    v6->_memoryLimit = 0;
    v6->_coalitionLevel = 0;
  }

  return v6;
}

- (unint64_t)legacyFinishTaskReason
{
  return self->_legacyFinishTaskReason;
}

- (unsigned)terminationResistance
{
  return self->_terminationResistance;
}

- (BOOL)isEqualToProcessStateIgnoringInheritances:(id)a3
{
  id v4 = (RBProcessState *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if (-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    char v5 = [(RBSProcessIdentity *)self->_identity isEqualToIdentity:v4->_identity];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToProcessStateIgnoringIdentity:(id)a3
{
  id v4 = (RBProcessState *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  if (!-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    char v7 = 0;
    goto LABEL_9;
  }
  inheritances = self->_inheritances;
  id v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_7:
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    if (inheritances && v6) {
      char v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
    }
  }
LABEL_9:

  return v7;
}

- (uint64_t)_isEqualToProcessStateIgnoringIdentityAndInheritances:(uint64_t)a1
{
  v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    if (*(unsigned __int16 *)(a1 + 120) != *((unsigned __int16 *)v3 + 60)
      || *(unsigned __int8 *)(a1 + 89) != *((unsigned __int8 *)v3 + 89)
      || *(void *)(a1 + 96) != v3[12]
      || *(void *)(a1 + 104) != v3[13]
      || *(unsigned __int8 *)(a1 + 112) != *((unsigned __int8 *)v3 + 112)
      || *(unsigned __int8 *)(a1 + 122) != *((unsigned __int8 *)v3 + 122)
      || *(unsigned __int8 *)(a1 + 123) != *((unsigned __int8 *)v3 + 123)
      || *(void *)(a1 + 128) != v3[16]
      || *(unsigned __int8 *)(a1 + 88) != *((unsigned __int8 *)v3 + 88)
      || *(void *)(a1 + 80) != v3[10])
    {
      goto LABEL_43;
    }
    CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 24);
    CFDictionaryRef v7 = (const __CFDictionary *)v4[3];
    if (v6 != v7)
    {
      uint64_t v5 = 0;
      if (!v6 || !v7) {
        goto LABEL_44;
      }
      id v8 = *(void **)(a1 + 24);
      CFIndex Count = CFDictionaryGetCount(v6);
      if (Count != CFDictionaryGetCount(v7) || ![v8 isEqualToDictionary:v7]) {
        goto LABEL_43;
      }
    }
    id v10 = *(void **)(a1 + 32);
    objc_super v11 = (void *)v4[4];
    if (v10 != v11)
    {
      uint64_t v5 = 0;
      if (!v10 || !v11) {
        goto LABEL_44;
      }
      CFDictionaryRef v12 = (const __CFDictionary *)v4[4];
      CFIndex v13 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
      if (v13 != CFDictionaryGetCount(v12) || ![v10 isEqualToDictionary:v12]) {
        goto LABEL_43;
      }
    }
    CFSetRef v14 = *(const __CFSet **)(a1 + 48);
    CFSetRef v15 = (const __CFSet *)v4[6];
    if (v14 != v15)
    {
      uint64_t v5 = 0;
      if (!v14 || !v15) {
        goto LABEL_44;
      }
      CFIndex v16 = CFSetGetCount(*(CFSetRef *)(a1 + 48));
      if (v16 != CFSetGetCount(v15) || ![(__CFSet *)v14 isEqualToSet:v15]) {
        goto LABEL_43;
      }
    }
    CFSetRef v17 = *(const __CFSet **)(a1 + 56);
    CFSetRef v18 = (const __CFSet *)v4[7];
    if (v17 != v18)
    {
      uint64_t v5 = 0;
      if (!v17 || !v18) {
        goto LABEL_44;
      }
      CFIndex v19 = CFSetGetCount(*(CFSetRef *)(a1 + 56));
      if (v19 != CFSetGetCount(v18) || ![(__CFSet *)v17 isEqualToSet:v18]) {
        goto LABEL_43;
      }
    }
    CFSetRef v20 = *(const __CFSet **)(a1 + 64);
    CFSetRef v21 = (const __CFSet *)v4[8];
    if (v20 != v21)
    {
      uint64_t v5 = 0;
      if (!v20 || !v21) {
        goto LABEL_44;
      }
      CFIndex v22 = CFSetGetCount(*(CFSetRef *)(a1 + 64));
      if (v22 != CFSetGetCount(v21) || ![(__CFSet *)v20 isEqualToSet:v21]) {
        goto LABEL_43;
      }
    }
    CFSetRef v23 = *(const __CFSet **)(a1 + 72);
    CFSetRef v24 = (const __CFSet *)v4[9];
    if (v23 == v24)
    {
      uint64_t v5 = 1;
      goto LABEL_44;
    }
    uint64_t v5 = 0;
    if (v23 && v24)
    {
      CFIndex v25 = CFSetGetCount(v23);
      if (v25 == CFSetGetCount(v24))
      {
        uint64_t v5 = [(__CFSet *)v23 isEqualToSet:v24];
        goto LABEL_44;
      }
LABEL_43:
      uint64_t v5 = 0;
    }
  }
LABEL_44:

  return v5;
}

- (BOOL)preventSuspend
{
  return (self->_flags >> 6) & 1;
}

- (int)memoryLimit
{
  return self->_memoryLimit;
}

- (BOOL)preventIdleSleep
{
  return (self->_flags >> 2) & 1;
}

- (NSSet)preventIdleSleepIdentifiers
{
  return &self->_preventIdleSleepIdentifiers->super;
}

- (BOOL)effectiveJetsamLenientMode
{
  return (self->_flags & 8) != 0 && self->_explicitJetsamBand > 0x28;
}

- (unsigned)gpuRole
{
  return self->_gpuRole;
}

- (BOOL)carPlayMode
{
  return (self->_flags >> 9) & 1;
}

- (BOOL)preventBaseMemoryLimitReduction
{
  return (self->_flags >> 7) & 1;
}

- (unsigned)memoryLimitStrength
{
  return self->_memoryLimitStrength;
}

- (NSString)memoryLimitCategory
{
  return self->_memoryLimitCategory;
}

- (unint64_t)explicitJetsamBand
{
  return self->_explicitJetsamBand;
}

- (BOOL)forceRoleManage
{
  return (self->_flags >> 5) & 1;
}

- (id)description
{
  id v2 = [NSString alloc];
  v3 = [(id)objc_opt_class() description];
  id v4 = NSStringFromRBSRole();
  uint64_t v5 = (void *)[v2 initWithFormat:@"<%@| role:%@>", v3, v4];

  return v5;
}

- (RBProcessState)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcessState.m" lineNumber:239 description:@"-init is not allowed on RBProcessState"];

  return 0;
}

- (BOOL)jetsamLenientMode
{
  return (self->_flags >> 3) & 1;
}

- (id)inheritancesForEnvironment:(id)a3
{
  return [(RBInheritanceCollection *)self->_inheritances inheritancesForEnvironment:a3];
}

- (id)maxCPUUsageLimitsForRole:(unsigned __int8)a3
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  uint64_t v5 = [(NSMutableDictionary *)maxCPULimitsByRole objectForKeyedSubscript:v4];

  return v5;
}

- (id)minCPUUsageLimitsForRole:(unsigned __int8)a3
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  uint64_t v5 = [(NSMutableDictionary *)minCPULimitsByRole objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isAppNapEqualToProcessState:(id)a3
{
  return 1;
}

- (id)debugDescription
{
  v3 = [(NSMutableSet *)self->_tags allObjects];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(NSMutableSet *)self->_legacyAssertions allObjects];
  uint64_t v6 = [v5 count];

  CFDictionaryRef v7 = [(NSMutableSet *)self->_primitiveAssertions allObjects];
  uint64_t v8 = [v7 count];

  uint64_t v9 = [(NSMutableSet *)self->_endowmentInfos allObjects];
  uint64_t v10 = [v9 count];

  id v46 = [NSString alloc];
  uint64_t v49 = [(id)objc_opt_class() description];
  uint64_t v11 = [(RBSProcessIdentity *)self->_identity shortDescription];
  uint64_t v47 = NSStringFromRBSRole();
  v54 = NSStringFromRBSGPURole();
  uint64_t explicitJetsamBand_low = LODWORD(self->_explicitJetsamBand);
  unint64_t coalitionLevel = self->_coalitionLevel;
  memoryLimitCategory = self->_memoryLimitCategory;
  v53 = NSStringFromRBSMemoryLimitStrength();
  uint64_t flags = self->_flags;
  if (self->_guaranteedRunning) {
    CFDictionaryRef v12 = @"YES";
  }
  else {
    CFDictionaryRef v12 = @"NO";
  }
  unint64_t legacyFinishTaskReason = self->_legacyFinishTaskReason;
  v41 = v12;
  inheritances = self->_inheritances;
  CFSetRef v14 = @" inheritances:";
  if (!inheritances)
  {
    CFSetRef v14 = &stru_26DA9D688;
    inheritances = (RBInheritanceCollection *)&stru_26DA9D688;
  }
  v38 = inheritances;
  v39 = v14;
  CFSetRef v15 = @" attributes:[\n\t";
  if (!v4) {
    CFSetRef v15 = &stru_26DA9D688;
  }
  v37 = v15;
  uint64_t v51 = v4;
  if (v4)
  {
    v35 = [(NSMutableSet *)self->_tags allObjects];
    v52 = [v35 componentsJoinedByString:@",\n\t"];
    v36 = @"\n\t]";
  }
  else
  {
    v36 = &stru_26DA9D688;
    v52 = &stru_26DA9D688;
  }
  v48 = (void *)v11;
  if (v6) {
    CFIndex v16 = @" legacyAssertions:[\n\t";
  }
  else {
    CFIndex v16 = &stru_26DA9D688;
  }
  uint64_t v50 = v6;
  if (v6)
  {
    v34 = [(NSMutableSet *)self->_legacyAssertions allObjects];
    CFSetRef v17 = [v34 componentsJoinedByString:@",\n\t"];
    CFSetRef v18 = @"\n\t]";
  }
  else
  {
    CFSetRef v18 = &stru_26DA9D688;
    CFSetRef v17 = &stru_26DA9D688;
  }
  if (v8) {
    CFIndex v19 = @" primitiveAssertions:[\n\t";
  }
  else {
    CFIndex v19 = &stru_26DA9D688;
  }
  if (v8)
  {
    v33 = [(NSMutableSet *)self->_primitiveAssertions allObjects];
    CFSetRef v20 = [v33 componentsJoinedByString:@",\n\t"];
    CFSetRef v21 = @"\n\t]";
    if (v10)
    {
LABEL_22:
      CFIndex v22 = [(NSMutableSet *)self->_endowmentInfos allObjects];
      CFSetRef v23 = [v22 componentsJoinedByString:@",\n\t"];
      v31 = v19;
      v29 = v18;
      CFSetRef v24 = (void *)v47;
      CFIndex v25 = v48;
      v26 = (void *)v49;
      v27 = objc_msgSend(v46, "initWithFormat:", @"<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36,
                      v16,
                      v17,
                      v29,
                      v31,
                      v20,
                      v21,
                      @" endowments:[\n\t",
                      v23,
                      @"\n\t]");

      goto LABEL_25;
    }
  }
  else
  {
    CFSetRef v21 = &stru_26DA9D688;
    CFSetRef v20 = &stru_26DA9D688;
    if (v10) {
      goto LABEL_22;
    }
  }
  v32 = v19;
  v30 = v18;
  CFSetRef v24 = (void *)v47;
  CFIndex v25 = v48;
  v26 = (void *)v49;
  v27 = objc_msgSend(v46, "initWithFormat:", @"<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36,
                  v16,
                  v17,
                  v30,
                  v32,
                  v20,
                  v21,
                  &stru_26DA9D688,
                  &stru_26DA9D688,
                  &stru_26DA9D688);
LABEL_25:
  if (v8)
  {
  }
  if (v50)
  {
  }
  if (v51)
  {
  }
  return v27;
}

- (unint64_t)hash
{
  return [(RBSProcessIdentity *)self->_identity hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBProcessState *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4)
    || ![(RBSProcessIdentity *)self->_identity isEqualToIdentity:v4->_identity])
  {
    char v7 = 0;
    goto LABEL_11;
  }
  inheritances = self->_inheritances;
  uint64_t v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_10:
    char v7 = 1;
    goto LABEL_11;
  }
  char v7 = 0;
  if (inheritances && v6) {
    char v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
  }
LABEL_11:

  return v7;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

- (NSSet)legacyAssertions
{
  return &self->_legacyAssertions->super;
}

- (NSSet)primitiveAssertions
{
  return &self->_primitiveAssertions->super;
}

- (unint64_t)coalitionLevel
{
  return self->_coalitionLevel;
}

- (NSSet)endowmentInfos
{
  return &self->_endowmentInfos->super;
}

- (NSSet)preventLaunchReasons
{
  return self->_preventLaunchReasons;
}

@end