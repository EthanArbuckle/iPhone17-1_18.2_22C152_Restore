@interface PBFPosterConfigurationUpdateResult
- (NSArray)postersToDelete;
- (NSArray)roleCoordinatorChanges;
- (NSArray)updates;
- (PBFPosterConfigurationUpdateResult)initWithConfiguration:(id)a3 updates:(id)a4 changes:(id)a5;
- (PBFPosterConfigurationUpdateResult)initWithIncomingPosterConfiguration:(id)a3 incomingAssocPosterConfiguration:(id)a4 postersToDelete:(id)a5;
- (PRIncomingPosterConfiguration)incomingAssocPosterConfiguration;
- (PRIncomingPosterConfiguration)incomingPosterConfiguration;
- (PRPosterConfiguration)configuration;
- (void)dealloc;
@end

@implementation PBFPosterConfigurationUpdateResult

- (PBFPosterConfigurationUpdateResult)initWithIncomingPosterConfiguration:(id)a3 incomingAssocPosterConfiguration:(id)a4 postersToDelete:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"incomingPosterConfiguration != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:]();
    }
LABEL_11:
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323C4DCLL);
  }
  v12 = v11;
  if (!v11)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"postersToDelete != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:]();
    }
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)PBFPosterConfigurationUpdateResult;
  v13 = [(PBFPosterConfigurationUpdateResult *)&v27 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_incomingPosterConfiguration, a3);
    objc_storeStrong((id *)&v14->_incomingAssocPosterConfiguration, a4);
    objc_storeStrong((id *)&v14->_postersToDelete, a5);
    v15 = [v9 path];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    uint64_t v18 = [v15 extendValidityForReason:v17];
    pathValidityExtension = v14->_pathValidityExtension;
    v14->_pathValidityExtension = (BSInvalidatable *)v18;

    v20 = [v10 path];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    uint64_t v23 = [v20 extendValidityForReason:v22];
    assocPathValidityExtension = v14->_assocPathValidityExtension;
    v14->_assocPathValidityExtension = (BSInvalidatable *)v23;
  }
  return v14;
}

- (PBFPosterConfigurationUpdateResult)initWithConfiguration:(id)a3 updates:(id)a4 changes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v12)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:]();
    }
LABEL_19:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323C6B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323C71CLL);
  }

  if (![v10 count])
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[updates count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323C780);
  }
  if (![v11 count])
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[roleCoordinatorChanges count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:]();
    }
    goto LABEL_19;
  }
  v23.receiver = self;
  v23.super_class = (Class)PBFPosterConfigurationUpdateResult;
  v13 = [(PBFPosterConfigurationUpdateResult *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    uint64_t v15 = [v10 copy];
    updates = v14->_updates;
    v14->_updates = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    roleCoordinatorChanges = v14->_roleCoordinatorChanges;
    v14->_roleCoordinatorChanges = (NSArray *)v17;
  }
  return v14;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  [(BSInvalidatable *)self->_assocPathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterConfigurationUpdateResult;
  [(PBFPosterConfigurationUpdateResult *)&v3 dealloc];
}

- (PRIncomingPosterConfiguration)incomingPosterConfiguration
{
  return self->_incomingPosterConfiguration;
}

- (PRIncomingPosterConfiguration)incomingAssocPosterConfiguration
{
  return self->_incomingAssocPosterConfiguration;
}

- (NSArray)postersToDelete
{
  return self->_postersToDelete;
}

- (PRPosterConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)updates
{
  return self->_updates;
}

- (NSArray)roleCoordinatorChanges
{
  return self->_roleCoordinatorChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleCoordinatorChanges, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_postersToDelete, 0);
  objc_storeStrong((id *)&self->_incomingAssocPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_incomingPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_assocPathValidityExtension, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:updates:changes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:updates:changes:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:updates:changes:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end