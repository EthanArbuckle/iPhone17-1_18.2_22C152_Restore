@interface SBSceneHandleActivityModeAssertion
- (SBSceneHandleActivityModeAssertion)initWithReason:(id)a3 activityMode:(char)a4 invalidationBlock:(id)a5;
- (char)activityMode;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
@end

@implementation SBSceneHandleActivityModeAssertion

- (SBSceneHandleActivityModeAssertion)initWithReason:(id)a3 activityMode:(char)a4 invalidationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSceneHandleActivityModeAssertion.m", 16, @"Invalid parameter not satisfying: %@", @"updateActivityModeReason != nil" object file lineNumber description];
  }
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__SBSceneHandleActivityModeAssertion_initWithReason_activityMode_invalidationBlock___block_invoke;
  v18[3] = &unk_1E6B016D0;
  id v19 = v10;
  v17.receiver = self;
  v17.super_class = (Class)SBSceneHandleActivityModeAssertion;
  id v13 = v10;
  v14 = [(BSSimpleAssertion *)&v17 initWithIdentifier:v12 forReason:v9 invalidationBlock:v18];

  if (v14) {
    v14->_activityMode = a4;
  }

  return v14;
}

void __84__SBSceneHandleActivityModeAssertion_initWithReason_activityMode_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = SBLogSceneRelevancy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Scene handle assertion was invalidated: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSceneHandleActivityModeAssertion;
  uint64_t v4 = [(BSSimpleAssertion *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  [(SBSceneHandleActivityModeAssertion *)self activityMode];
  id v5 = NSStringFromFBSSceneActivityMode();
  [v4 appendString:v5 withName:@"activityMode"];

  return v4;
}

- (char)activityMode
{
  return self->_activityMode;
}

@end