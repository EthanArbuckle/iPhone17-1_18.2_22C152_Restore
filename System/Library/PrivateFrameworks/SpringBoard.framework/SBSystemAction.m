@interface SBSystemAction
- (BOOL)canBePerformedInSetupMode;
- (BOOL)hostBundleRequiresValidation;
- (BOOL)isCameraCaptureAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBePerformedWhenSuppressed;
- (BOOL)shouldWakeScreenWhenPerformed;
- (CHSControlIdentity)controlIdentity;
- (NSString)description;
- (NSString)hostBundleIdentifier;
- (SBSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4;
- (SBSystemActionAnalyticsData)analyticsData;
- (SBSystemActionInstanceIdentifying)instanceIdentity;
- (WFConfiguredStaccatoAction)configuredAction;
- (id)controlAction;
- (id)newExecutor;
- (id)newSimplePreviewElement;
- (unint64_t)hash;
- (void)_configureWithConfiguredAction;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBSystemAction

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (id)newSimplePreviewElement
{
  v3 = [(SBSystemAction *)self configuredAction];
  v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:@"Accessibility"];

  v6 = off_1E6AF0B38;
  if (!v5) {
    v6 = off_1E6AF0B48;
  }
  v7 = (void *)[objc_alloc(*v6) initWithSystemAction:self];

  return v7;
}

- (id)controlAction
{
  return 0;
}

- (SBSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)SBSystemAction;
    v11 = [(SBSystemAction *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_configuredAction, a3);
      uint64_t v13 = [v10 copyWithZone:0];
      instanceIdentity = v12->_instanceIdentity;
      v12->_instanceIdentity = (SBSystemActionInstanceIdentifying *)v13;

      -[SBSystemAction _configureWithConfiguredAction]((uint64_t)v12);
    }

    return v12;
  }
  else
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"action != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemAction initWithConfiguredAction:instanceIdentity:](a2, (uint64_t)self, (uint64_t)v16);
    }
    [v16 UTF8String];
    result = (SBSystemAction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_configureWithConfiguredAction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v9 = 138544642;
  v10 = v5;
  OUTLINED_FUNCTION_0_18();
  uint64_t v11 = a2;
  __int16 v12 = v8;
  uint64_t v13 = @"SBSystemAction.m";
  __int16 v14 = 1024;
  int v15 = 58;
  __int16 v16 = v8;
  uint64_t v17 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  [v6 appendString:self->_hostBundleIdentifier withName:@"hostBundleIdentifier"];
  id v4 = (id)[v6 appendBool:self->_cameraCaptureAction withName:@"isCameraCaptureAction" ifEqualTo:1];
  if (os_variant_has_internal_content()) {
    id v5 = (id)[v6 appendObject:self->_configuredAction withName:@"configuredAction"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSystemAction *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualObjects()) {
        char v6 = SBSystemActionInstanceIdentityEqualToIdentity(self->_instanceIdentity, v5[3]);
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(WFConfiguredStaccatoAction *)self->_configuredAction hash];
  return [(SBSystemActionInstanceIdentifying *)self->_instanceIdentity hash] ^ v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __29__SBSystemAction_description__block_invoke;
  v10 = &unk_1E6AF5290;
  id v11 = v3;
  __int16 v12 = self;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return (NSString *)v5;
}

id __29__SBSystemAction_description__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 40) withName:0];
}

- (WFConfiguredStaccatoAction)configuredAction
{
  return self->_configuredAction;
}

- (SBSystemActionInstanceIdentifying)instanceIdentity
{
  return self->_instanceIdentity;
}

- (BOOL)isCameraCaptureAction
{
  return self->_cameraCaptureAction;
}

- (BOOL)shouldBePerformedWhenSuppressed
{
  return self->_shouldBePerformedWhenSuppressed;
}

- (BOOL)shouldWakeScreenWhenPerformed
{
  return self->_shouldWakeScreenWhenPerformed;
}

- (BOOL)canBePerformedInSetupMode
{
  return self->_canBePerformedInSetupMode;
}

- (BOOL)hostBundleRequiresValidation
{
  return self->_hostBundleRequiresValidation;
}

- (SBSystemActionAnalyticsData)analyticsData
{
  id v3 = self->_analyticsData.actionIdentifier;
  id v4 = self->_analyticsData.parameterValueIdentifier;
  id v5 = v3;
  result.parameterValueIdentifier = v4;
  result.actionIdentifier = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceIdentity, 0);
  objc_storeStrong((id *)&self->_configuredAction, 0);
}

- (CHSControlIdentity)controlIdentity
{
  return 0;
}

- (id)newExecutor
{
  return 0;
}

- (void)initWithConfiguredAction:(uint64_t)a3 instanceIdentity:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  char v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v9 = 138544642;
  v10 = v5;
  OUTLINED_FUNCTION_0_18();
  uint64_t v11 = a2;
  __int16 v12 = v8;
  uint64_t v13 = @"SBSystemAction.m";
  __int16 v14 = 1024;
  int v15 = 27;
  __int16 v16 = v8;
  uint64_t v17 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

@end