@interface SBSystemActionDataSourceWithDefaultAction
- (id)executorForSystemAction:(id)a3;
- (id)initWithInnerDataSource:(void *)a3 defaultAction:;
- (void)updateSelectedAction;
@end

@implementation SBSystemActionDataSourceWithDefaultAction

- (id)initWithInnerDataSource:(void *)a3 defaultAction:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"innerDataSource != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionDataSourceWithDefaultAction initWithInnerDataSource:defaultAction:](sel_initWithInnerDataSource_defaultAction_, (uint64_t)a1, (uint64_t)v11);
    }
LABEL_12:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B043F0);
  }
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"defaultAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionDataSourceWithDefaultAction initWithInnerDataSource:defaultAction:](sel_initWithInnerDataSource_defaultAction_, (uint64_t)a1, (uint64_t)v11);
    }
    goto LABEL_12;
  }
  objc_storeStrong(a1 + 4, a2);
  objc_storeStrong(a1 + 5, a3);
  v9 = [v6 hostIdentifier];
  v12.receiver = a1;
  v12.super_class = (Class)SBSystemActionDataSourceWithDefaultAction;
  a1 = (id *)objc_msgSendSuper2(&v12, sel_initWithHostIdentifier_, v9);

  if (a1) {
    [v6 addObserver:a1];
  }
LABEL_6:

  return a1;
}

- (id)executorForSystemAction:(id)a3
{
  return (id)[(SBSystemActionDataSource *)self->_innerDataSource executorForSystemAction:a3];
}

- (void)updateSelectedAction
{
  v3 = [(SBSystemActionDataSource *)self->_innerDataSource selectedSystemAction];
  if (!v3) {
    v3 = self->_defaultAction;
  }
  v4 = v3;
  [(SBSystemActionAbstractDataSource *)self setSelectedSystemAction:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_innerDataSource, 0);
}

- (void)initWithInnerDataSource:(uint64_t)a3 defaultAction:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"SBSystemActionDataSourceWithDefaultAction.m";
  __int16 v10 = 1024;
  int v11 = 29;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithInnerDataSource:(uint64_t)a3 defaultAction:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"SBSystemActionDataSourceWithDefaultAction.m";
  __int16 v10 = 1024;
  int v11 = 30;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end