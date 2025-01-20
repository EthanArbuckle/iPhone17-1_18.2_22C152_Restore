@interface PRSPosterRoleCollectionObserver
- (BOOL)needsSandboxExtensions;
- (NSOrderedSet)posterCollection;
- (NSString)role;
- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3;
- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3 needsSandboxExtensions:(BOOL)a4;
- (id)handler;
- (void)issueUpdatedState:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation PRSPosterRoleCollectionObserver

- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3 needsSandboxExtensions:(BOOL)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterRoleCollectionObserver initWithRole:needsSandboxExtensions:]();
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CA434);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterRoleCollectionObserver initWithRole:needsSandboxExtensions:]();
    }
    goto LABEL_11;
  }

  v12.receiver = self;
  v12.super_class = (Class)PRSPosterRoleCollectionObserver;
  v7 = [(PRSPosterRoleCollectionObserver *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    role = v7->_role;
    v7->_role = (NSString *)v8;

    v7->_needsSandboxExtensions = a4;
  }

  return v7;
}

- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3
{
  return [(PRSPosterRoleCollectionObserver *)self initWithRole:a3 needsSandboxExtensions:0];
}

- (void)issueUpdatedState:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAA0];
  id v12 = v4;
  id v6 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_9);
  v7 = [v5 orderedSetWithArray:v6];

  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ((BSEqualObjects() & 1) == 0)
  {
    v9 = v8->_posterCollection;
    objc_storeStrong((id *)&v8->_posterCollection, v7);
    uint64_t v10 = [(PRSPosterRoleCollectionObserver *)v8 handler];
    v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, PRSPosterRoleCollectionObserver *, NSOrderedSet *, void *))(v10 + 16))(v10, v8, v9, v7);
    }
  }
  objc_sync_exit(v8);
}

id __53__PRSPosterRoleCollectionObserver_issueUpdatedState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRSPosterConfiguration alloc] _initWithPath:v2];

  return v3;
}

- (NSString)role
{
  return self->_role;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
}

- (NSOrderedSet)posterCollection
{
  return self->_posterCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (void)initWithRole:needsSandboxExtensions:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end