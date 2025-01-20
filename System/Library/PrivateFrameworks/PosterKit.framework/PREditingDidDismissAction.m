@interface PREditingDidDismissAction
+ (id)acceptChangesWithCompletion:(id)a3;
+ (id)cancelAction;
- (NSArray)graphicComplications;
- (PRSWidget)inlineComplication;
- (id)_initWithCompletion:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)sendResponseWithUpdatedConfiguration:(id)a3 updatedProperties:(id)a4;
@end

@implementation PREditingDidDismissAction

+ (id)cancelAction
{
  id v2 = [[PREditingDidDismissAction alloc] _initWithCompletion:0];
  return v2;
}

+ (id)acceptChangesWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    id v5 = [[PREditingDidDismissAction alloc] _initWithCompletion:v3];

    return v5;
  }
  else
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PREditingDidDismissAction acceptChangesWithCompletion:]();
    }
    [v7 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    v6 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
    [v5 setObject:v6 forSetting:2];

    v7 = (void *)MEMORY[0x1E4F4F670];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__PREditingDidDismissAction__initWithCompletion___block_invoke;
    v12[3] = &unk_1E54DBED8;
    id v14 = v4;
    v13 = self;
    v8 = [v7 responderWithHandler:v12];
    [v8 setQueue:MEMORY[0x1E4F14428]];
  }
  else
  {
    id v5 = 0;
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PREditingDidDismissAction;
  v9 = [(PREditingDidDismissAction *)&v11 initWithInfo:v5 responder:v8];

  return v9;
}

void __49__PREditingDidDismissAction__initWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 info];
  id v5 = [v4 objectForSetting:1];
  v6 = [v4 objectForSetting:4];
  v7 = [v4 objectForSetting:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v8 = [v5 descriptorIdentifier];

    if (!v8)
    {
      id v11 = [(PRPosterConfiguration *)[PRMutablePosterConfiguration alloc] _initWithPath:v5];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_11;
    }
    v9 = PRSLogPosterContents();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__PREditingDidDismissAction__initWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v9);
    }

    [v7 invalidate];
  }
  else
  {
    v10 = PRSLogPosterContents();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v12);
      v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v3 error];
      *(_DWORD *)buf = 138544642;
      v20 = v18;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2048;
      v24 = v5;
      __int16 v25 = 2112;
      v26 = v16;
      __int16 v27 = 2048;
      v28 = v7;
      v30 = __int16 v29 = 2112;
      v17 = (void *)v30;
      _os_log_error_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration or finishedSavingAction in response is invalid : path=<%@:%p> finishedSavingAction=<%@:%p> error=%@", buf, 0x3Eu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

- (void)sendResponseWithUpdatedConfiguration:(id)a3 updatedProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Prmutableposte.isa);
  if (!v8)
  {
    __int16 v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:]();
    }
LABEL_23:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C254E34);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRMutablePosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C254E98);
  }

  v9 = [v8 _path];
  v10 = [v9 descriptorIdentifier];

  if (v10)
  {
    __int16 v29 = [NSString stringWithFormat:@"updatedConfiguration looks to be invalid : %@", v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:]();
    }
    goto LABEL_23;
  }
  id v11 = [(PREditingDidDismissAction *)self info];
  v12 = [v11 objectForSetting:2];
  uint64_t v13 = objc_opt_class();
  id v14 = v12;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v9 extendContentsReadAccessToAuditToken:v16 error:0];

  if (v17)
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v9 extendValidityForReason:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F4F668]);
    v22 = (void *)MEMORY[0x1E4F4F670];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __84__PREditingDidDismissAction_sendResponseWithUpdatedConfiguration_updatedProperties___block_invoke;
    v32[3] = &unk_1E54DC348;
    id v33 = v20;
    id v23 = v20;
    v24 = [v22 responderWithHandler:v32];
    __int16 v25 = (void *)[v21 initWithInfo:0 responder:v24];

    id v26 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v26 setObject:v17 forSetting:1];
    [v26 setObject:v25 forSetting:3];
    [v26 setObject:v7 forSetting:4];
    __int16 v27 = [MEMORY[0x1E4F4F678] responseWithInfo:v26];
    v31.receiver = self;
    v31.super_class = (Class)PREditingDidDismissAction;
    [(PREditingDidDismissAction *)&v31 sendResponse:v27];
  }
  else
  {
    v28 = PRSLogPosterContents();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:]((uint64_t)self, v28);
    }

    [(PREditingDidDismissAction *)self invalidate];
  }
}

uint64_t __84__PREditingDidDismissAction_sendResponseWithUpdatedConfiguration_updatedProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2) {
    return @"serverAuditToken";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 2)
  {
    id v7 = objc_msgSend(a4, "description", a3, v5);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (NSArray)graphicComplications
{
  return self->_graphicComplications;
}

- (PRSWidget)inlineComplication
{
  return self->_inlineComplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_graphicComplications, 0);
}

+ (void)acceptChangesWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __49__PREditingDidDismissAction__initWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration in response looks to be invalid : %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)sendResponseWithUpdatedConfiguration:updatedProperties:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendResponseWithUpdatedConfiguration:(uint64_t)a1 updatedProperties:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: cannot send updatedConfiguration back to server due to sandbox extension error", (uint8_t *)&v5, 0xCu);
}

- (void)sendResponseWithUpdatedConfiguration:updatedProperties:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end