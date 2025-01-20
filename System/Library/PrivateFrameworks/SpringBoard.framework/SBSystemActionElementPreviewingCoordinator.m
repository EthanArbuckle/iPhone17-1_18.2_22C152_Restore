@interface SBSystemActionElementPreviewingCoordinator
- (uint64_t)initWithElement:(void *)a1;
- (void)_updateAnimationAndPriorityAssertions;
- (void)elementInvalidatedProperties;
@end

@implementation SBSystemActionElementPreviewingCoordinator

- (uint64_t)initWithElement:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (!a1) {
    goto LABEL_5;
  }
  if (v3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)SBSystemActionElementPreviewingCoordinator;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 5, v4);
      a1[4] = 0;
    }
LABEL_5:

    return (uint64_t)a1;
  }
  v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"element != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBSystemActionElementPreviewingCoordinator *)sel_initWithElement_ initWithElement:(uint64_t)v7];
  }
  [v7 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)elementInvalidatedProperties
{
  if (a1) {
    -[SBSystemActionElementPreviewingCoordinator _updateAnimationAndPriorityAssertions](a1);
  }
}

- (void)_updateAnimationAndPriorityAssertions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = SBStringFromSBSADynamicPersistentAnimation(*(void *)(a1 + 32));
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  objc_super v8 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "(%@) Dropping expansion animation assertion with style %@", (uint8_t *)&v5, 0x16u);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_element);
  objc_storeStrong((id *)&self->_expansionAssertion, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_urgencyAssertion, 0);
}

- (void)initWithElement:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSystemActionElementPreviewingCoordinator.m";
  __int16 v16 = 1024;
  int v17 = 30;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end