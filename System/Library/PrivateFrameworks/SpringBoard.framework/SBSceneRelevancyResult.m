@interface SBSceneRelevancyResult
+ (id)defaultResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground;
- (SBSceneRelevancyResult)initWithActivityMode:(char)a3 jetsamMode:(char)a4 prefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a5;
- (char)activityMode;
- (char)jetsamMode;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation SBSceneRelevancyResult

- (SBSceneRelevancyResult)initWithActivityMode:(char)a3 jetsamMode:(char)a4 prefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBSceneRelevancyResult;
  result = [(SBSceneRelevancyResult *)&v9 init];
  if (result)
  {
    result->_activityMode = a3;
    result->_jetsamMode = a4;
    result->_prefersProcessTaskSuspensionWhileSceneForeground = a5;
  }
  return result;
}

+ (id)defaultResult
{
  v2 = [[SBSceneRelevancyResult alloc] initWithActivityMode:0 jetsamMode:0 prefersProcessTaskSuspensionWhileSceneForeground:0];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t activityMode = self->_activityMode;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__SBSceneRelevancyResult_isEqual___block_invoke;
  v21[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v22 = v7;
  v8 = [v5 appendInteger:activityMode counterpart:v21];
  uint64_t jetsamMode = self->_jetsamMode;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__SBSceneRelevancyResult_isEqual___block_invoke_2;
  v19[3] = &unk_1E6AF9660;
  id v10 = v7;
  id v20 = v10;
  v11 = [v8 appendInteger:jetsamMode counterpart:v19];
  BOOL prefersProcessTaskSuspensionWhileSceneForeground = self->_prefersProcessTaskSuspensionWhileSceneForeground;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__SBSceneRelevancyResult_isEqual___block_invoke_3;
  v17[3] = &unk_1E6AF99E8;
  id v18 = v10;
  id v13 = v10;
  v14 = [v11 appendBool:prefersProcessTaskSuspensionWhileSceneForeground counterpart:v17];
  char v15 = [v14 isEqual];

  return v15;
}

uint64_t __34__SBSceneRelevancyResult_isEqual___block_invoke(uint64_t a1)
{
  return (int)[*(id *)(a1 + 32) activityMode];
}

uint64_t __34__SBSceneRelevancyResult_isEqual___block_invoke_2(uint64_t a1)
{
  return (int)[*(id *)(a1 + 32) jetsamMode];
}

uint64_t __34__SBSceneRelevancyResult_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefersProcessTaskSuspensionWhileSceneForeground];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)[v3 appendInteger:self->_activityMode];
  id v5 = (id)[v3 appendInteger:self->_jetsamMode];
  id v6 = (id)[v3 appendBool:self->_prefersProcessTaskSuspensionWhileSceneForeground];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)succinctDescription
{
  v2 = [(SBSceneRelevancyResult *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSceneRelevancyResult *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneRelevancyResult *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBSceneRelevancyResult_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __64__SBSceneRelevancyResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSStringFromFBSSceneActivityMode();
  [v2 appendString:v3 withName:@"activityMode"];

  id v4 = *(void **)(a1 + 32);
  id v5 = NSStringFromFBSSceneJetsamMode();
  [v4 appendString:v5 withName:@"jetsamMode"];

  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"prefersProcessTaskSuspensionWhileSceneForeground" ifEqualTo:1];
}

- (char)activityMode
{
  return self->_activityMode;
}

- (char)jetsamMode
{
  return self->_jetsamMode;
}

- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground
{
  return self->_prefersProcessTaskSuspensionWhileSceneForeground;
}

@end