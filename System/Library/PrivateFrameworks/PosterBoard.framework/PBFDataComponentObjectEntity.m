@interface PBFDataComponentObjectEntity
- (NSString)component;
- (PBFDataComponentObjectEntity)initWithComponent:(id)a3 object:(id)a4 context:(id)a5;
- (PBFDataRefreshContext)context;
- (id)description;
- (id)determineRefreshState;
- (id)object;
@end

@implementation PBFDataComponentObjectEntity

- (PBFDataComponentObjectEntity)initWithComponent:(id)a3 object:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v12)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
LABEL_27:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4B34);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4B98);
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Nsobject.isa);
  if (!v13)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4BFCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSObjectClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4C60);
  }

  id v14 = v11;
  NSClassFromString(&cfstr_Pbfdatarefresh.isa);
  if (!v14)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4CC4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFDataRefreshContextClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataComponentObjectEntity initWithComponent:object:context:]();
    }
    goto LABEL_27;
  }

  v23.receiver = self;
  v23.super_class = (Class)PBFDataComponentObjectEntity;
  v15 = [(PBFDataComponentObjectEntity *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    objc_storeStrong(&v16->_object, a4);
    objc_storeStrong((id *)&v16->_context, a5);
  }

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_component withName:@"component"];
  id v5 = (id)[v3 appendObject:self->_object withName:@"object"];
  v6 = [v3 build];

  return v6;
}

- (id)determineRefreshState
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = self->_object;
    id v4 = [(PBFDataComponentObjectEntity *)self context];
    uint64_t v5 = [v3 determineRefreshStateWithContext:v4];
    goto LABEL_9;
  }
  v6 = [(PBFDataComponentObjectEntity *)self context];
  id v4 = [v6 now];

  v7 = [(PBFDataComponentObjectEntity *)self context];
  id v3 = [v7 lastRefreshDate];

  v8 = [(PBFDataComponentObjectEntity *)self context];
  id v9 = [v8 component];
  PBFDefaultUpdateIntervalForDataComponent(v9);
  double v11 = v10;

  if (v11 == 1.79769313e308)
  {
    id v12 = [PBFDataRefreshState alloc];
    id v13 = @"Expiration interval is forever.  So no update is needed.";
  }
  else
  {
    [v4 timeIntervalSinceDate:v3];
    double v15 = v14;
    id v12 = [PBFDataRefreshState alloc];
    if (v15 > v11)
    {
      uint64_t v5 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v12, "initWithNeedsRefresh:reason:", 1, @"Entity has exceeded expiration interval %f seconds; needs update",
             *(void *)&v11);
      goto LABEL_9;
    }
    double v18 = v11 - v15;
    id v13 = @"Entity is up to date, update needed in %f seconds";
  }
  uint64_t v5 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v12, "initWithNeedsRefresh:reason:", 0, v13, *(void *)&v18);
LABEL_9:
  v16 = (void *)v5;

  return v16;
}

- (id)object
{
  return self->_object;
}

- (NSString)component
{
  return self->_component;
}

- (PBFDataRefreshContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)initWithComponent:object:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithComponent:object:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithComponent:object:context:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end