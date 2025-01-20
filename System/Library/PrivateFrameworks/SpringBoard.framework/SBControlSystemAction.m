@interface SBControlSystemAction
- (SBControlSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4;
- (id)acquireContentVisibilityAssertionForReason:(uint64_t)a1;
- (id)actionBlock;
- (id)controlIdentity;
- (id)iconView;
- (id)newExecutor;
- (id)newSimplePreviewElement;
- (uint64_t)properties;
- (uint64_t)removeObserver:(uint64_t)result;
- (void)addObserver:(uint64_t)a1;
- (void)controlInstanceDescriptorDidChange:(id)a3;
- (void)controlInstanceViewModelDidChange:(id)a3;
- (void)dealloc;
- (void)setProperties:(uint64_t)a1;
- (void)type;
@end

@implementation SBControlSystemAction

- (id)newSimplePreviewElement
{
  v3 = [SBSystemActionSimpleControlPreviewElement alloc];
  return [(SBSystemActionSimpleControlPreviewElement *)v3 initWithSystemAction:self];
}

- (SBControlSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SBControlSystemAction;
  v8 = [(SBSystemAction *)&v35 initWithConfiguredAction:v6 instanceIdentity:v7];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F58CC0]);
    v10 = [v6 extensionBundleIdentifier];
    v11 = [v6 containerBundleIdentifier];
    v12 = (void *)[v9 initWithExtensionBundleIdentifier:v10 containerBundleIdentifier:v11 deviceIdentifier:0];

    id v13 = objc_alloc(MEMORY[0x1E4F58C80]);
    v14 = [v6 kind];
    v15 = [v6 intent];
    v16 = (void *)[v13 initWithExtensionIdentity:v12 kind:v14 intent:v15];

    id v17 = objc_alloc(MEMORY[0x1E4F58C90]);
    v18 = [v7 hostIdentifier];
    v19 = [v7 configurationIdentifier];
    v20 = (void *)[v17 initWithControl:v16 contentType:0 hostIdentifier:v18 configurationIdentifier:v19];

    v21 = [v6 controlType];
    uint64_t v22 = [v21 unsignedIntegerValue];

    v23 = [MEMORY[0x1E4F58F30] instanceOfType:v22 instanceIdentity:v20];
    [v23 modifyConfiguration:&__block_literal_global_227];
    [v23 registerObserver:v8];
    [v23 activate];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_2;
    v33[3] = &unk_1E6B059E0;
    id v24 = v23;
    id v34 = v24;
    v25 = (void *)MEMORY[0x1D948C7A0](v33);
    controlInstance = v8->_controlInstance;
    v8->_controlInstance = (CHUISControlInstance *)v24;
    id v27 = v24;

    uint64_t v28 = MEMORY[0x1D948C7A0](v25);
    id actionBlock = v8->_actionBlock;
    v8->_id actionBlock = (id)v28;

    uint64_t v30 = +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, v27);
    properties = v8->_properties;
    v8->_properties = (SBControlSystemActionProperties *)v30;
  }
  return v8;
}

void __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCanAppearInSecureEnvironment:1];
  [v2 setPreferredColorScheme:2];
  [v2 setLaunchOrigin:*MEMORY[0x1E4FA7078]];
}

void __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_3;
  v7[3] = &unk_1E6AF5DA8;
  id v8 = v4;
  id v6 = v4;
  [v5 performControlActionWithCompletion:v7];
}

uint64_t __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_contentVisibilityAssertions invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBControlSystemAction;
  [(SBControlSystemAction *)&v3 dealloc];
}

- (void)addObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 72) removeObject:a2];
  }
  return result;
}

- (void)type
{
  if (result)
  {
    v1 = [result configuredAction];
    id v2 = [v1 controlType];
    uint64_t v3 = [v2 unsignedIntegerValue];

    return (void *)v3;
  }
  return result;
}

- (id)iconView
{
  if (a1)
  {
    a1 = [a1[7] iconView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)acquireContentVisibilityAssertionForReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    if (!v4)
    {
      id v5 = *(id *)(a1 + 56);
      id v6 = (void *)MEMORY[0x1E4F4F6E8];
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__SBControlSystemAction_acquireContentVisibilityAssertionForReason___block_invoke;
      v13[3] = &unk_1E6B05A08;
      id v14 = v5;
      id v9 = v5;
      uint64_t v10 = [v6 assertionWithIdentifier:v8 stateDidChangeHandler:v13];
      v11 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v10;

      id v4 = *(void **)(a1 + 64);
    }
    a1 = [v4 acquireForReason:v3];
  }

  return (id)a1;
}

uint64_t __68__SBControlSystemAction_acquireContentVisibilityAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isActive]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setVisibility:v3];
}

- (id)newExecutor
{
  uint64_t v3 = [SBBlockSystemActionExecutor alloc];
  return [(SBBlockSystemActionExecutor *)v3 initWithSystemAction:self];
}

- (void)controlInstanceDescriptorDidChange:(id)a3
{
  +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction setProperties:]((uint64_t)self, v4);
}

- (void)setProperties:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 88);
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 88), a2);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = objc_msgSend(*(id *)(a1 + 72), "copy", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v10++) controlSystemAction:a1 propertiesDidChange:v5];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction setProperties:]((uint64_t)self, v4);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (uint64_t)properties
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contentVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_controlInstance, 0);
}

- (id)controlIdentity
{
  return (id)[(CHUISControlInstance *)self->_controlInstance control];
}

@end