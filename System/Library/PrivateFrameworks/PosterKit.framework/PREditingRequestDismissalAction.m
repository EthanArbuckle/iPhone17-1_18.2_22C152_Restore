@interface PREditingRequestDismissalAction
- (BOOL)userAcceptedChanges;
- (BSInvalidatable)tempPathValidityExtension;
- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 completion:(id)a4;
- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 completion:(id)a5;
- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 completion:(id)a6;
- (PRMutablePosterConfiguration)updatedConfiguration;
- (PRPosterConfiguredProperties)updatedConfiguredProperties;
- (id)_initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 auditTokenForSandboxExtension:(id)a6 completion:(id)a7;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)sendResponseWithSuccess:(BOOL)a3 error:(id)a4;
- (void)updatedConfiguration;
@end

@implementation PREditingRequestDismissalAction

- (id)_initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 auditTokenForSandboxExtension:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1E4F4F670];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __154__PREditingRequestDismissalAction__initWithUserAcceptedChanges_updatedConfiguration_updatedConfiguredProperties_auditTokenForSandboxExtension_completion___block_invoke;
  v35[3] = &unk_1E54DBED8;
  id v17 = v15;
  id v37 = v17;
  v18 = self;
  v36 = v18;
  v19 = [v16 responderWithHandler:v35];
  [v19 setQueue:MEMORY[0x1E4F14428]];
  id v20 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v20 setFlag:BSSettingFlagForBool() forSetting:1];
  [v20 setObject:v13 forSetting:5];
  v21 = [v12 _path];
  [v20 setObject:v21 forSetting:2];
  v22 = [v21 descriptorIdentifier];

  if (v22)
  {
    v31 = [NSString stringWithFormat:@"updatedConfiguration looks to be invalid : %@", v21];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:](a2, (uint64_t)v18, (uint64_t)v31);
    }
    [v31 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v14)
    {
      id v32 = v12;
      id v34 = 0;
      v23 = [v21 extendContentsReadAccessToAuditToken:v14 error:&v34];
      id v24 = v34;
      if (v23)
      {
        [v20 setObject:v23 forSetting:2];
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        uint64_t v27 = [v21 extendValidityForReason:v26];
        tempPathValidityExtension = v18->_tempPathValidityExtension;
        v18->_tempPathValidityExtension = (BSInvalidatable *)v27;
      }
      else
      {
        v26 = PRSLogPosterContents();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:]();
        }
      }

      id v12 = v32;
    }
    v33.receiver = v18;
    v33.super_class = (Class)PREditingRequestDismissalAction;
    v29 = [(PREditingRequestDismissalAction *)&v33 initWithInfo:v20 responder:v19];

    return v29;
  }
  return result;
}

void __154__PREditingRequestDismissalAction__initWithUserAcceptedChanges_updatedConfiguration_updatedConfiguredProperties_auditTokenForSandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    v5 = [v3 tempPathValidityExtension];
    [v5 invalidate];

    id v7 = [v4 info];

    [v7 BOOLForSetting:3];
    v6 = [v7 objectForSetting:4];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PREditingRequestDismissalAction_initWithUserAcceptedChanges_completion___block_invoke;
    v10[3] = &unk_1E54DBF00;
    id v11 = v6;
    v8 = (PREditingRequestDismissalAction *)[(PREditingRequestDismissalAction *)self _initWithUserAcceptedChanges:v4 updatedConfiguration:0 updatedConfiguredProperties:0 auditTokenForSandboxExtension:0 completion:v10];
  }
  else
  {
    v8 = (PREditingRequestDismissalAction *)[(PREditingRequestDismissalAction *)self _initWithUserAcceptedChanges:v4 updatedConfiguration:0 updatedConfiguredProperties:0 auditTokenForSandboxExtension:0 completion:0];
  }

  return v8;
}

uint64_t __74__PREditingRequestDismissalAction_initWithUserAcceptedChanges_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 completion:(id)a5
{
  return (PREditingRequestDismissalAction *)[(PREditingRequestDismissalAction *)self _initWithUserAcceptedChanges:a3 updatedConfiguration:a4 updatedConfiguredProperties:0 auditTokenForSandboxExtension:0 completion:a5];
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 completion:(id)a6
{
  return (PREditingRequestDismissalAction *)[(PREditingRequestDismissalAction *)self _initWithUserAcceptedChanges:a3 updatedConfiguration:a4 updatedConfiguredProperties:a5 auditTokenForSandboxExtension:0 completion:a6];
}

- (BOOL)userAcceptedChanges
{
  v2 = [(PREditingRequestDismissalAction *)self info];
  [v2 flagForSetting:1];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (PRMutablePosterConfiguration)updatedConfiguration
{
  v3 = [(PREditingRequestDismissalAction *)self info];
  BOOL v4 = [v3 objectForSetting:2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = PRSLogPosterContents();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PREditingRequestDismissalAction *)(uint64_t)self updatedConfiguration];
    }
    goto LABEL_7;
  }
  v5 = [v4 descriptorIdentifier];

  if (v5)
  {
    id v6 = PRSLogPosterContents();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PREditingRequestDismissalAction updatedConfiguration]();
    }
LABEL_7:

    id v7 = 0;
    goto LABEL_8;
  }
  id v7 = [(PRPosterConfiguration *)[PRMutablePosterConfiguration alloc] _initWithPath:v4];
LABEL_8:

  return (PRMutablePosterConfiguration *)v7;
}

- (PRPosterConfiguredProperties)updatedConfiguredProperties
{
  v2 = [(PREditingRequestDismissalAction *)self info];
  v3 = [v2 objectForSetting:5];

  return (PRPosterConfiguredProperties *)v3;
}

- (void)sendResponseWithSuccess:(BOOL)a3 error:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setFlag:BSSettingFlagForBool() forSetting:3];
  [v7 setObject:v6 forSetting:4];

  v8 = [MEMORY[0x1E4F4F678] responseWithInfo:v7];
  v9.receiver = self;
  v9.super_class = (Class)PREditingRequestDismissalAction;
  [(PREditingRequestDismissalAction *)&v9 sendResponse:v8];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"updatedConfiguration";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"userAcceptedChanges";
  }
  else {
    return v3;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  id v7 = v6;
  if (a5 == 2)
  {
    uint64_t v8 = [v6 description];
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v8 = BSSettingFlagDescription();
LABEL_5:
    objc_super v9 = (void *)v8;
    goto LABEL_7;
  }
  objc_super v9 = 0;
LABEL_7:

  return v9;
}

- (BSInvalidatable)tempPathValidityExtension
{
  return self->_tempPathValidityExtension;
}

- (void).cxx_destruct
{
}

- (void)_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "%{public}@: cannot send updatedConfiguration back to server due to sandbox extension error %@", v4, v5, v6, v7, 2u);
}

- (void)_initWithUserAcceptedChanges:(uint64_t)a3 updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  objc_super v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"PREditingRequestDismissalAction.m";
  __int16 v16 = 1024;
  int v17 = 54;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)updatedConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  int v9 = 138543874;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  __int16 v12 = v8;
  __int16 v13 = 2048;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration is invalid : path=<%@:%p>", (uint8_t *)&v9, 0x20u);
}

@end