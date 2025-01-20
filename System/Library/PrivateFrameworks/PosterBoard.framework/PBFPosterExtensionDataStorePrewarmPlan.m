@interface PBFPosterExtensionDataStorePrewarmPlan
- (NSDictionary)phaseToExecutionBlock;
- (NSDictionary)phaseToPrewarmTimeout;
- (NSOrderedSet)prewarmPhasePlan;
- (NSString)identifier;
- (PBFPosterExtensionDataStorePrewarmPlan)init;
- (double)defaultPhaseTimeoutInterval;
- (double)timeoutIntervalForPhase:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)executionBlockForPhase:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDefaultPhaseTimeoutInterval:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setPhaseToExecutionBlock:(id)a3;
- (void)setPhaseToPrewarmTimeout:(id)a3;
- (void)setPrewarmPhasePlan:(id)a3;
@end

@implementation PBFPosterExtensionDataStorePrewarmPlan

- (PBFPosterExtensionDataStorePrewarmPlan)init
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PBFPosterExtensionDataStorePrewarmPlan;
  v2 = [(PBFPosterExtensionDataStorePrewarmPlan *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CAA0];
    v11[0] = @"PBFPrewarmPhaseReloadDescriptors";
    v11[1] = @"PBFPrewarmPhasePushToProactive";
    v11[2] = @"PBFPrewarmPhaseAcquireNewGallery";
    v11[3] = @"PBFPrewarmPhaseSnapshotGallery";
    v11[4] = @"PBFPrewarmPhaseSnapshotSwitcher";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
    v5 = [v3 orderedSetWithArray:v4];
    [(PBFPosterExtensionDataStorePrewarmPlan *)v2 setPrewarmPhasePlan:v5];

    [(PBFPosterExtensionDataStorePrewarmPlan *)v2 setDefaultPhaseTimeoutInterval:120.0];
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    v8 = [v7 substringToIndex:7];
    [(PBFPosterExtensionDataStorePrewarmPlan *)v2 setIdentifier:v8];
  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(PBFPosterExtensionDataStorePrewarmPlan *)+[PBFMutablePosterExtensionDataStorePrewarmPlan allocWithZone:a3] init];
  v5 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
  [(PBFPosterExtensionDataStorePrewarmPlan *)v4 setPrewarmPhasePlan:v5];

  v6 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToPrewarmTimeout];
  [(PBFPosterExtensionDataStorePrewarmPlan *)v4 setPhaseToPrewarmTimeout:v6];

  [(PBFPosterExtensionDataStorePrewarmPlan *)self defaultPhaseTimeoutInterval];
  [(PBFPosterExtensionDataStorePrewarmPlan *)v4 setDefaultPhaseTimeoutInterval:"setDefaultPhaseTimeoutInterval:"];
  v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToExecutionBlock];
  [(PBFPosterExtensionDataStorePrewarmPlan *)v4 setPhaseToExecutionBlock:v7];

  v8 = [(PBFPosterExtensionDataStorePrewarmPlan *)self identifier];
  [(PBFPosterExtensionDataStorePrewarmPlan *)v4 setIdentifier:v8];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
  [v4 setPrewarmPhasePlan:v5];

  v6 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToPrewarmTimeout];
  [v4 setPhaseToPrewarmTimeout:v6];

  [(PBFPosterExtensionDataStorePrewarmPlan *)self defaultPhaseTimeoutInterval];
  objc_msgSend(v4, "setDefaultPhaseTimeoutInterval:");
  v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToExecutionBlock];
  [v4 setPhaseToExecutionBlock:v7];

  v8 = [(PBFPosterExtensionDataStorePrewarmPlan *)self identifier];
  [v4 setIdentifier:v8];

  return v4;
}

- (double)timeoutIntervalForPhase:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToPrewarmTimeout];
    v8 = [v7 objectForKey:v6];

    if (v8) {
      [v8 doubleValue];
    }
    else {
      [(PBFPosterExtensionDataStorePrewarmPlan *)self defaultPhaseTimeoutInterval];
    }
    double v10 = v9;

    return v10;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"phase"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStorePrewarmPlan timeoutIntervalForPhase:](a2);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)executionBlockForPhase:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToExecutionBlock];
    v8 = [v7 objectForKey:v6];

    return v8;
  }
  else
  {
    double v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"phase"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStorePrewarmPlan executionBlockForPhase:](a2);
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSOrderedSet)prewarmPhasePlan
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrewarmPhasePlan:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (double)defaultPhaseTimeoutInterval
{
  return self->_defaultPhaseTimeoutInterval;
}

- (void)setDefaultPhaseTimeoutInterval:(double)a3
{
  self->_defaultPhaseTimeoutInterval = a3;
}

- (NSDictionary)phaseToPrewarmTimeout
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhaseToPrewarmTimeout:(id)a3
{
}

- (NSDictionary)phaseToExecutionBlock
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhaseToExecutionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseToExecutionBlock, 0);
  objc_storeStrong((id *)&self->_phaseToPrewarmTimeout, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_prewarmPhasePlan, 0);
}

- (void)timeoutIntervalForPhase:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)executionBlockForPhase:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end