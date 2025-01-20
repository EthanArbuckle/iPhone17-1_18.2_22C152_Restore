@interface SBBlockSystemAction
+ (void)localActionWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 actionBlock:;
+ (void)toggleSilentModeActionWithRingerControl:(void *)a3 instanceIdentity:(void *)a4 name:;
- (BOOL)isEqual:(id)a3;
- (SBSystemActionAnalyticsData)analyticsData;
- (id)actionBlock;
- (id)newExecutor;
- (uint64_t)name;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)initWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 name:(void *)a5 actionBlock:;
- (void)initWithIdentifier:(void *)a3 sectionIdentifier:(void *)a4 associatedBundleIdentifier:(void *)a5 instanceIdentity:(void *)a6 name:(void *)a7 actionBlock:;
@end

@implementation SBBlockSystemAction

- (void)initWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 name:(void *)a5 actionBlock:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  if (![v11 length])
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[name length] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](sel_initWithConfiguredAction_instanceIdentity_name_actionBlock_, (uint64_t)a1, (uint64_t)v18);
    }
LABEL_12:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8A103B8);
  }
  if (!v12)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"actionBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](sel_initWithConfiguredAction_instanceIdentity_name_actionBlock_, (uint64_t)a1, (uint64_t)v18);
    }
    goto LABEL_12;
  }
  v19.receiver = a1;
  v19.super_class = (Class)SBBlockSystemAction;
  a1 = objc_msgSendSuper2(&v19, sel_initWithConfiguredAction_instanceIdentity_, v9, v10);
  if (a1)
  {
    uint64_t v13 = [v12 copy];
    v14 = (void *)a1[7];
    a1[7] = v13;

    uint64_t v15 = [v11 copy];
    v16 = (void *)a1[8];
    a1[8] = v15;
  }
LABEL_6:

  return a1;
}

- (void)initWithIdentifier:(void *)a3 sectionIdentifier:(void *)a4 associatedBundleIdentifier:(void *)a5 instanceIdentity:(void *)a6 name:(void *)a7 actionBlock:
{
  if (!a1) {
    return 0;
  }
  uint64_t v13 = (objc_class *)MEMORY[0x1E4FB45F8];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = a2;
  v20 = (void *)[[v13 alloc] initWithIdentifier:v19 sectionIdentifier:v18 associatedBundleIdentifier:v17 name:@"Block Action" systemImageName:0 shortcutsMetadata:0];

  v21 = -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](a1, v20, v16, v15, v14);
  v22 = v21;

  return v22;
}

- (SBSystemActionAnalyticsData)analyticsData
{
  v9.receiver = self;
  v9.super_class = (Class)SBBlockSystemAction;
  id v3 = [(SBSystemAction *)&v9 analyticsData];
  v5 = v4;
  uint64_t v6 = [v3 stringByAppendingFormat:@" (%@)", self->_name];

  v7 = (NSString *)v6;
  v8 = v5;
  result.parameterValueIdentifier = v8;
  result.actionIdentifier = v7;
  return result;
}

- (id)newExecutor
{
  id v3 = [SBBlockSystemActionExecutor alloc];
  return [(SBBlockSystemActionExecutor *)v3 initWithSystemAction:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 appendString:name withName:@"name"];
  v6.receiver = self;
  v6.super_class = (Class)SBBlockSystemAction;
  [(SBSystemAction *)&v6 appendDescriptionToFormatter:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBlockSystemAction;
  if ([(SBSystemAction *)&v9 isEqual:v4]
    && (self,
        id v5 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0)
    && self->_actionBlock == v4[7])
  {
    char v7 = BSEqualStrings();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (uint64_t)name
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

+ (void)toggleSilentModeActionWithRingerControl:(void *)a3 instanceIdentity:(void *)a4 name:
{
  id v6 = a2;
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = (objc_class *)self;
  id v10 = [v7 stringByAppendingString:@" Ringer Action"];
  id v11 = [v9 alloc];
  id v12 = (void *)*MEMORY[0x1E4FB4DA8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__SBBlockSystemAction_Utilities__toggleSilentModeActionWithRingerControl_instanceIdentity_name___block_invoke;
  v17[3] = &unk_1E6B07038;
  id v18 = v6;
  id v19 = v10;
  id v13 = v10;
  id v14 = v6;
  id v15 = -[SBBlockSystemAction initWithIdentifier:sectionIdentifier:associatedBundleIdentifier:instanceIdentity:name:actionBlock:](v11, v12, @"SilentMode", @"com.apple.springboard", v8, v7, v17);

  return v15;
}

void __96__SBBlockSystemAction_Utilities__toggleSilentModeActionWithRingerControl_instanceIdentity_name___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [*(id *)(a1 + 32) setRingerMuted:-[SBRingerControl isRingerMuted](v4) ^ 1 withFeedback:0 reason:*(void *)(a1 + 40) clientType:1];
  v5[2](v5, 0);
}

+ (void)localActionWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 actionBlock:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  objc_super v9 = objc_alloc((Class)self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__SBBlockSystemAction_Utilities__localActionWithConfiguredAction_instanceIdentity_actionBlock___block_invoke;
  v13[3] = &unk_1E6B07060;
  id v14 = v6;
  id v10 = v6;
  id v11 = -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](v9, v8, v7, @"Local", v13);

  return v11;
}

void __95__SBBlockSystemAction_Utilities__localActionWithConfiguredAction_instanceIdentity_actionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6928];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  objc_super v9 = -[SBCameraActivationManager workspace]((uint64_t)v7);

  id v10 = (id)[v8 initWithPreciseTimestamp:v9 actionSource:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initWithConfiguredAction:(uint64_t)a3 instanceIdentity:name:actionBlock:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  objc_super v9 = @"SBBlockSystemAction.m";
  __int16 v10 = 1024;
  int v11 = 27;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithConfiguredAction:(uint64_t)a3 instanceIdentity:name:actionBlock:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  objc_super v9 = @"SBBlockSystemAction.m";
  __int16 v10 = 1024;
  int v11 = 28;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end