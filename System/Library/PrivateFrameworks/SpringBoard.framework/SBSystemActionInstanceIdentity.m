@interface SBSystemActionInstanceIdentity
- (BOOL)isEqual:(id)a3;
- (NSString)configurationIdentifier;
- (NSString)description;
- (NSString)hostIdentifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)initWithHostIdentifier:(void *)a3 configurationIdentifier:;
@end

@implementation SBSystemActionInstanceIdentity

- (void)initWithHostIdentifier:(void *)a3 configurationIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v5)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostIdentifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionInstanceIdentity initWithHostIdentifier:configurationIdentifier:](sel_initWithHostIdentifier_configurationIdentifier_, (uint64_t)a1, (uint64_t)v13);
    }
LABEL_12:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B9C75CLL);
  }
  if (!v6)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configurationIdentifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionInstanceIdentity initWithHostIdentifier:configurationIdentifier:](sel_initWithHostIdentifier_configurationIdentifier_, (uint64_t)a1, (uint64_t)v13);
    }
    goto LABEL_12;
  }
  v14.receiver = a1;
  v14.super_class = (Class)SBSystemActionInstanceIdentity;
  a1 = objc_msgSendSuper2(&v14, sel_init);
  if (a1)
  {
    uint64_t v8 = [v5 copy];
    v9 = (void *)a1[1];
    a1[1] = v8;

    uint64_t v10 = [v7 copy];
    v11 = (void *)a1[2];
    a1[2] = v10;
  }
LABEL_6:

  return a1;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBSystemActionInstanceIdentity_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

uint64_t __63__SBSystemActionInstanceIdentity_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"hostIdentifier"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16);
  return [v2 appendString:v3 withName:@"configurationIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSystemActionInstanceIdentity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if (BSEqualStrings()) {
        char v8 = BSEqualStrings();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendString:self->_hostIdentifier];
  id v5 = [v4 appendString:self->_configurationIdentifier];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)initWithHostIdentifier:(uint64_t)a3 configurationIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"SBSystemActionInstanceIdentity.m";
  __int16 v10 = 1024;
  int v11 = 24;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithHostIdentifier:(uint64_t)a3 configurationIdentifier:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"SBSystemActionInstanceIdentity.m";
  __int16 v10 = 1024;
  int v11 = 25;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end