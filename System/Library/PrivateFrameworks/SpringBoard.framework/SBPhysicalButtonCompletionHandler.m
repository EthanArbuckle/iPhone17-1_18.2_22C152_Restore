@interface SBPhysicalButtonCompletionHandler
- (BOOL)completeWithResult:(unint64_t)a3;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(void *)a1;
- (id)descriptionWithMultilinePrefix:(uint64_t)a1;
- (id)succinctDescriptionBuilder;
- (unint64_t)button;
- (void)dealloc;
- (void)initWithIdentifier:(uint64_t)a3 button:(void *)a4 block:;
@end

@implementation SBPhysicalButtonCompletionHandler

- (void)initWithIdentifier:(uint64_t)a3 button:(void *)a4 block:
{
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v7)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:](sel_initWithIdentifier_button_block_);
    }
LABEL_12:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D89A9350);
  }
  if (!v8)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:](sel_initWithIdentifier_button_block_);
    }
    goto LABEL_12;
  }
  v16.receiver = a1;
  v16.super_class = (Class)SBPhysicalButtonCompletionHandler;
  a1 = objc_msgSendSuper2(&v16, sel_init);
  if (a1)
  {
    uint64_t v10 = [v7 copy];
    v11 = (void *)a1[3];
    a1[3] = v10;

    a1[2] = a3;
    uint64_t v12 = [v9 copy];
    v13 = (void *)a1[1];
    a1[1] = v12;
  }
LABEL_6:

  return a1;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)completeWithResult:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id block = self->_block;
  if (block)
  {
    uint64_t v6 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = _NSStringFromUIPhysicalButton();
      uint64_t v8 = NSStringFromSBPhysicalButtonResult(a3);
      identifier = self->_identifier;
      int v13 = 138543874;
      v14 = v7;
      __int16 v15 = 2114;
      objc_super v16 = v8;
      __int16 v17 = 2114;
      v18 = identifier;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Button completion %{public}@-%{public}@ for '%{public}@'", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v10 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](self->_block);
    id v11 = self->_block;
    self->_id block = 0;

    ((void (**)(void, SBPhysicalButtonCompletionHandler *, unint64_t))v10)[2](v10, self, a3);
  }
  return block != 0;
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  if (a1)
  {
    v1 = -[SBPhysicalButtonCompletionHandler succinctDescriptionBuilder](a1);
    v2 = [v1 build];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
    v3 = _NSStringFromUIPhysicalButton();
    [v2 appendString:v3 withName:@"button"];

    [v2 appendString:*(void *)(a1 + 24) withName:@"identifier"];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    a1 = -[SBPhysicalButtonCompletionHandler succinctDescriptionBuilder]((uint64_t)a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)button
{
  return self->_button;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)initWithIdentifier:(const char *)a1 button:block:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithIdentifier:(const char *)a1 button:block:.cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end