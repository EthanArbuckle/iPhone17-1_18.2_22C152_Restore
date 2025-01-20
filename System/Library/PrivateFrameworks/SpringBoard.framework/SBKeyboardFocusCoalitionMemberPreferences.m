@interface SBKeyboardFocusCoalitionMemberPreferences
+ (id)build:(id)a3;
+ (id)new;
+ (id)preferencesWithPolicy:(id)a3 lockReasons:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)lockReasons;
- (NSString)description;
- (SBKeyboardFocusPolicy)policy;
- (id)_init;
- (id)_initWithCopyOf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)focusLockReasonStrength;
- (unint64_t)hash;
- (void)_init;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBKeyboardFocusCoalitionMemberPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReasons, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)preferencesWithPolicy:(id)a3 lockReasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__SBKeyboardFocusCoalitionMemberPreferences_preferencesWithPolicy_lockReasons___block_invoke;
  v12[3] = &unk_1E6AFADF8;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = [a1 build:v12];

  return v10;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = [(SBKeyboardFocusCoalitionMemberPreferences *)[SBMutableKeyboardFocusCoalitionPreferences alloc] _init];
  v3[2](v3, v4);

  char v5 = (void *)[v4 copy];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBKeyboardFocusCoalitionMemberPreferences alloc];
  return [(SBKeyboardFocusCoalitionMemberPreferences *)v4 _initWithCopyOf:self];
}

- (id)_initWithCopyOf:(id)a3
{
  id v4 = (id *)a3;
  char v5 = [(SBKeyboardFocusCoalitionMemberPreferences *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    id v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [v4[2] copy];
    id v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (id)_init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (uint64_t v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBKeyboardFocusCoalitionMemberPreferences;
    return [(SBKeyboardFocusCoalitionMemberPreferences *)&v7 init];
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"SBKeyboardFocusCoalitionMemberPreferences cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoalitionMemberPreferences _init]();
    }
    [v6 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __79__SBKeyboardFocusCoalitionMemberPreferences_preferencesWithPolicy_lockReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPolicy:v3];
  id v5 = (id)[*(id *)(a1 + 40) copy];
  [v4 setLockReasons:v5];
}

- (SBKeyboardFocusPolicy)policy
{
  return self->_policy;
}

+ (id)new
{
  v2 = objc_opt_class();
  return (id)[v2 _init];
}

- (unint64_t)hash
{
  unint64_t v3 = [(SBKeyboardFocusPolicy *)self->_policy hash];
  lockReasons = self->_lockReasons;
  if (lockReasons) {
    v3 ^= [(NSSet *)lockReasons hash];
  }
  return MEMORY[0x1F410C388](v3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBMutableKeyboardFocusCoalitionPreferences alloc];
  return [(SBKeyboardFocusCoalitionMemberPreferences *)v4 _initWithCopyOf:self];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SBKeyboardFocusCoalitionMemberPreferences_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendBodySectionWithName:0 block:v6];
}

id __71__SBKeyboardFocusCoalitionMemberPreferences_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"policy"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"lockReasons"];
}

- (NSSet)lockReasons
{
  return self->_lockReasons;
}

- (int64_t)focusLockReasonStrength
{
  if ([(SBKeyboardFocusPolicy *)self->_policy advicePolicy]) {
    return 0;
  }
  lockReasons = self->_lockReasons;
  return +[SBKeyboardFocusLockReason maximumStrengthInSet:lockReasons];
}

- (void)_init
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end