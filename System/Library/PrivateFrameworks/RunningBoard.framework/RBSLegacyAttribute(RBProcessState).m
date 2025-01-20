@interface RBSLegacyAttribute(RBProcessState)
- (BOOL)preventsSuspension;
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAcquisitionContext:()RBProcessState;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSLegacyAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!a4)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2 object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:346 description:@"must provide error outparam"];
  }
  if ([a1 requestedReason] == 9)
  {
    v8 = [v7 targetIdentity];
    int v9 = [v8 isXPCService];

    if (v9)
    {
      v10 = rbs_assertion_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v7 assertionDescriptor];
        v12 = [v11 identifier];
        *(_DWORD *)buf = 138543362;
        v34 = v12;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Mutating assertion %{public}@ reason from ViewService to Extension because it targets an xpc service.", buf, 0xCu);
      }
      [a1 setReason:13];
    }
  }
  v30 = 0;
  int v13 = -[RBSLegacyAttribute _isOriginatorValidForContext:errorReason:](a1, v7, &v30);
  v14 = v30;
  v15 = v14;
  if (v13)
  {
    v29 = 0;
    char v16 = -[RBSLegacyAttribute _isTargetValidForContext:errorReason:]((uint64_t)a1, v7, &v29);
    v17 = v29;

    if (v16)
    {
      uint64_t v18 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v17 = v14;
  }
  if (!v17)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:356 description:@"no failure reason provided"];
  }
  v19 = rbs_assertion_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[RBSLegacyAttribute(RBProcessState) isValidForContext:withError:](v17);
  }

  v20 = (void *)MEMORY[0x263F087E8];
  uint64_t v21 = *MEMORY[0x263F64670];
  uint64_t v22 = *MEMORY[0x263F08338];
  v32[0] = v17;
  uint64_t v23 = *MEMORY[0x263F64668];
  v31[0] = v22;
  v31[1] = v23;
  v24 = [a1 description];
  v32[1] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  *a4 = [v20 errorWithDomain:v21 code:2 userInfo:v25];

  uint64_t v18 = 0;
LABEL_17:

  return v18;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6 != a1 && (uint64_t v7 = objc_opt_class(), v7 == objc_opt_class()))
  {
    if (a4)
    {
      int v9 = [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F64670];
      uint64_t v13 = *MEMORY[0x263F08338];
      v14[0] = v9;
      v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *(void *)a4 = [v10 errorWithDomain:v11 code:2 userInfo:v12];

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  -[RBSLegacyAttribute _mutateReasonWithContext:](a1, v8);
  if ([v8 isActiveDueToInheritedEndowment])
  {
    int v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v8);
    }
LABEL_34:

    goto LABEL_35;
  }
  if (applyToAssertionIntransientState_attributePath_context__onceToken != -1) {
    dispatch_once(&applyToAssertionIntransientState_attributePath_context__onceToken, &__block_literal_global);
  }
  double v10 = -[RBSLegacyAttribute _invalidationDurationExpiringTaskCompletionsQuickly:](a1, applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly);
  [v7 invalidationDuration];
  if (v10 > v11) {
    [v7 setInvalidationDuration:v10];
  }
  if (v10 == 0.0) {
    double v12 = 0.0;
  }
  else {
    double v12 = 5.0;
  }
  [v7 warningDuration];
  if (v12 > v13) {
    [v7 setWarningDuration:v12];
  }
  unint64_t started = -[RBSLegacyAttribute _startPolicy]((uint64_t)a1);
  if (started > [v7 startPolicy]) {
    [v7 setStartPolicy:started];
  }
  unint64_t v15 = 2 * (a1 != 0);
  if (v15 > [v7 endPolicy]) {
    [v7 setEndPolicy:v15];
  }
  if (a1 && ([a1 reason] == 9 || objc_msgSend(a1, "reason") == 13)) {
    [v7 setSuspendsOnOriginatorSuspension:1];
  }
  if (-[RBSLegacyAttribute _definesRelativeStartTime]((uint64_t)a1)) {
    [v7 setDefinesRelativeStartTime:1];
  }
  if ([a1 reason]) {
    objc_msgSend(v7, "setLegacyReason:", objc_msgSend(a1, "reason"));
  }
  if (-[RBSLegacyAttribute _role](a1) >= 2) {
    [v7 setPreventsSuspension:1];
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = -[RBSLegacyAttribute _invalidateOnThermalLevel]((uint64_t)a1);
    int v9 = [v7 invalidatesOnConditions];
    if (!v9)
    {
      int v9 = [MEMORY[0x263EFF9A0] dictionary];
      [v7 setInvalidatesOnConditions:v9];
    }
    v17 = [v9 objectForKey:@"therm"];
    uint64_t v18 = v17;
    if (!v17 || v16 < [v17 integerValue])
    {
      v19 = [NSNumber numberWithInteger:v16];
      [v9 setValue:v19 forKey:@"therm"];
    }
    goto LABEL_34;
  }
LABEL_35:
}

- (void)applyToAcquisitionContext:()RBProcessState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 acquisitionPolicy])
  {
    uint64_t v5 = [a1 requestedReason];
    id v6 = [v4 descriptor];
    id v7 = v6;
    if (v5 == 1
      || v5 == 9
      && ([v6 explanation],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"com.apple.extension.session"],
          v8,
          v9))
    {
      double v10 = rbs_assertion_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        double v11 = [v7 identifier];
        int v12 = 138412290;
        double v13 = v11;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_INFO, "forcing acquisition after state application for assertion %@", (uint8_t *)&v12, 0xCu);
      }
      [v4 setAcquisitionPolicy:1];
    }
  }
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 isActiveDueToInheritedEndowment])
  {
    int v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v8);
    }
  }
  else
  {
    if ([(id)a1 reason])
    {
      double v10 = NSStringFromRBSLegacyReason();
      [v7 addTag:v10];
    }
    if (a1)
    {
      unint64_t v11 = [(id)a1 reason];
      if (v11 <= 0x17 && ((1 << v11) & 0xA80010) != 0) {
        a1 = 1;
      }
      else {
        a1 = 2;
      }
    }
    unsigned __int8 v12 = 2;
    do
    {
      unsigned int v13 = v12;
      if (a1 > [v7 maxCPUUsageViolationPolicyForRole:v12]) {
        [v7 setMaxCPUUsageViolationPolicy:a1 forRole:v12];
      }
      ++v12;
    }
    while (v13 < 4);
  }
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 isActiveDueToInheritedEndowment])
  {
    int v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:](v8);
    }
    goto LABEL_62;
  }
  unint64_t v10 = -[RBSLegacyAttribute _explicitJetsamBand:](a1, v8);
  if (v10 > [v7 explicitJetsamBand]) {
    [v7 setExplicitJetsamBand:v10];
  }
  int v11 = [v7 memoryLimit];
  unsigned __int8 v12 = [v8 target];
  int v9 = [v12 process];

  if (v9)
  {
    unsigned int v13 = [v9 memoryLimits];
    if (v10 == 100
      || [a1 reason] == 9
      && ([v8 assertion],
          unint64_t v15 = objc_claimAutoreleasedReturnValue(),
          [v15 explanation],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:@"com.apple.viewservice.session"],
          v16,
          v15,
          v17)
      && v10 == 80)
    {
      id v14 = (id)*MEMORY[0x263F64690];
    }
    else
    {
      id v14 = (id)*MEMORY[0x263F64698];
      if (v10) {
        [v7 setPreventBaseMemoryLimitReduction:1];
      }
    }
    unsigned __int8 v51 = 2;
    uint64_t v18 = [v13 memoryLimitForCategory:v14 strength:&v51];
    if (v11 == v18)
    {
      unsigned int v19 = v51;
      unsigned int v20 = [v7 memoryLimitStrength];
      if (v19 <= v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v19;
      }
      [v7 setMemoryLimitStrength:v21];
    }
    else if (v11 < (int)v18)
    {
      uint64_t v22 = v18;
      [v7 setMemoryLimitCategory:v14];
      [v7 setMemoryLimitStrength:v51];
      [v7 setMemoryLimit:v22];
    }
  }
  else
  {
    unsigned int v13 = rbs_assertion_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_INFO, "applying Legacy Assertion to process state without concrete target", buf, 2u);
    }
  }

  uint64_t v23 = -[RBSLegacyAttribute _role](a1);
  if (v23 > [v7 role])
  {
    if (v23 >= 2) {
      [v7 setPreventSuspend:1];
    }
    [v7 setRole:v23];
  }
  uint64_t v24 = -[RBSLegacyAttribute _terminationResistance]((uint64_t)a1);
  if (v24 > [v7 terminationResistance]) {
    [v7 setTerminationResistance:v24];
  }
  if (a1)
  {
    if (([a1 flags] & 4) == 0)
    {
      [v7 setPreventIdleSleep:1];
      v25 = NSString;
      v26 = [v8 assertionID];
      v27 = [v8 assertion];
      v28 = [v27 explanation];
      [a1 reason];
      v29 = NSStringFromRBSLegacyReason();
      v30 = [v25 stringWithFormat:@"%@:%@(%@)", v26, v28, v29];
      [v7 addPreventIdleSleepIdentifier:v30];
    }
    if (([a1 flags] & 0x20) != 0) {
      goto LABEL_35;
    }
  }
  if ((unint64_t)[v7 explicitJetsamBand] >= 0x50)
  {
LABEL_35:
    if ([v7 gpuRole] <= 1) {
      [v7 setGPURole:2];
    }
  }
  if (a1 && ([a1 reason] == 9 || objc_msgSend(a1, "reason") == 13)) {
    [v7 setTargetedBySuspendableAssertion:1];
  }
  v31 = [v8 targetIdentity];
  v32 = [v31 embeddedApplicationIdentifier];
  int v33 = [v32 isEqualToString:@"com.apple.mobilesafari"];

  if (v33)
  {
    if (([v7 jetsamLenientMode] & 1) == 0)
    {
      v34 = [v8 availableInheritances];
      uint64_t v35 = [v34 allNamespaces];
      int v36 = [v35 containsObject:*MEMORY[0x263F646F0]];

      if (v36) {
        [v7 setJetsamLenientMode:1];
      }
    }
  }
  unint64_t v37 = [a1 reason];
  if (v37 == 10008) {
    [v7 setThrottleBestEffortNetworking:1];
  }
  if (a1)
  {
    unint64_t v38 = [a1 reason] - 19;
    if (v38 > 4) {
      uint64_t v39 = 80;
    }
    else {
      uint64_t v39 = qword_226B36678[v38];
    }
    uint64_t v40 = -[RBSLegacyAttribute _maxCPUDuration]((uint64_t)a1);
LABEL_52:
    v41 = [v8 targetProcess];
    char v42 = [v41 isPlatformBinary];

    if ((v42 & 1) == 0)
    {
      if (a1)
      {
        unint64_t v43 = [a1 reason];
        if (v43 <= 0x17 && ((1 << v43) & 0xA80010) != 0) {
          uint64_t v44 = 1;
        }
        else {
          uint64_t v44 = 2;
        }
      }
      else
      {
        uint64_t v44 = 0;
      }
      v45 = [[RBProcessCPUMaximumLimits alloc] initWithPercentage:v39 duration:v40 violationPolicy:v44];
      v46 = [[RBProcessCPUMaximumLimits alloc] initWithPercentage:80 duration:180 violationPolicy:0];
      v47 = [[RBProcessCPUMaximumLimits alloc] initWithPercentage:80 duration:180 violationPolicy:0];
      [v7 setMaxCPUUsageLimits:v45 forRole:2];
      [v7 setMaxCPUUsageLimits:v45 forRole:4];
      [v7 setMaxCPUUsageLimits:v46 forRole:5];
      [v7 setMaxCPUUsageLimits:v47 forRole:7];
    }
    goto LABEL_58;
  }
  uint64_t v49 = -[RBSLegacyAttribute _maxCPUDuration](0);
  if (v49)
  {
    uint64_t v40 = v49;
    uint64_t v39 = 0;
    goto LABEL_52;
  }
LABEL_58:
  uint64_t v48 = [v7 legacyFinishTaskReason];
  if (-[RBSLegacyAttribute _isLegacyReasonFinishableTask:]((BOOL)a1, v37) && v48 - 1 >= v37) {
    [v7 setLegacyFinishTaskReason:v37];
  }

LABEL_62:
}

- (BOOL)preventsSuspension
{
  return -[RBSLegacyAttribute _role](a1) > 1;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1)
{
  v1 = [a1 assertion];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226AB3000, v2, v3, "Not applying RBSLegacyAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", v4, v5, v6, v7, v8);
}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226AB3000, v1, v2, "legacy assertion validation failed: %s", v3, v4, v5, v6, v7);
}

@end