@interface SBPhysicalButtonZStackPolicyAssistant
- (BOOL)_sceneHasFullFidelityEventsEntitlement:(uint64_t)a1;
- (id)observedSceneSettings;
- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3;
- (uint64_t)captureButtonFullFidelityEventRequestingScenes;
- (uint64_t)foregroundCaptureSceneTargets;
- (uint64_t)physicalButtonSceneTargets;
@end

@implementation SBPhysicalButtonZStackPolicyAssistant

- (uint64_t)physicalButtonSceneTargets
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)foregroundCaptureSceneTargets
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)captureButtonFullFidelityEventRequestingScenes
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = a3;
  uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  v3 = 0;
  v4 = 0;
  if (v32)
  {
    v33 = 0;
    uint64_t v30 = *(void *)v38;
    id v31 = 0;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v7 = [v6 clientSettings];
        v8 = self;
        id v9 = v7;
        if (v8)
        {
          if (objc_opt_isKindOfClass()) {
            v10 = v9;
          }
          else {
            v10 = 0;
          }
        }
        else
        {
          v10 = 0;
        }
        id v11 = v10;

        v12 = [v11 physicalButtonConfigurations];
        if ([v12 _count])
        {
          v13 = [MEMORY[0x1E4FA5FA8] targetWithScene:v6];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __84__SBPhysicalButtonZStackPolicyAssistant_resolveProposedPoliciesForForegroundScenes___block_invoke;
          v35[3] = &unk_1E6AFAE70;
          id v14 = v13;
          id v36 = v14;
          [v12 _enumerateConfigurationsWithBlock:v35];
          id v15 = v33;
          if (!v33) {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v33 = v15;
          [v15 addObject:v14];
        }
        if (!v4)
        {
          v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SBPhysicalButtonZStackPolicyAssistant _sceneHasFullFidelityEventsEntitlement:]((uint64_t)self, v6));
        }
        v34 = v11;
        if ([v4 BOOLValue])
        {
          if (!v31) {
            id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v16 = [v12 _configurationForButton:5];
          if (v16) {
            [v31 addObject:v6];
          }
        }
        v17 = +[SBCaptureApplicationCenter sharedInstance];
        v18 = [v6 clientHandle];
        v19 = [v18 processHandle];
        v20 = [v19 bundle];
        v21 = [v20 identifier];

        v22 = [v17 captureApplicationForBundleIdentifier:v21];
        if (v22
          || ([v17 captureApplicationForExtensionIdentifier:v21],
              (v22 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          if (!v3)
          {
            v3 = [MEMORY[0x1E4F1CA48] array];
          }
          v23 = [[SBCaptureIntentSceneTarget alloc] initWithScene:v6 andCaptureApplication:v22];
          [v3 addObject:v23];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v32);
  }
  else
  {
    id v31 = 0;
    v33 = 0;
  }
  if (BSEqualArrays())
  {
    int64_t v24 = 0;
  }
  else
  {
    v25 = (NSArray *)[v33 copy];
    physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = v25;

    int64_t v24 = 1;
  }
  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, v31);
    int64_t v24 = 1;
  }
  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, v3);
    int64_t v24 = 1;
  }

  return v24;
}

- (BOOL)_sceneHasFullFidelityEventsEntitlement:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [a2 clientHandle];
  v3 = [v2 processHandle];

  BOOL v4 = 0;
  if (v3)
  {
    objc_msgSend(v3, "auditToken", 0, 0, 0, 0);
    if ((BSAuditTokenTaskHasEntitlement() & 1) != 0 || BSAuditTokenTaskHasEntitlement()) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

void __84__SBPhysicalButtonZStackPolicyAssistant_resolveProposedPoliciesForForegroundScenes___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FA5FB8];
  id v4 = a2;
  uint64_t v5 = [v4 _button];
  uint64_t v6 = [v4 _generation];
  v7 = [v4 _auditToken];

  id v8 = [v3 targetWithPhysicalButton:v5 generation:v6 auditToken:v7];

  [*(id *)(a1 + 32) addButtonTarget:v8];
}

- (id)observedSceneSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:sel_physicalButtonConfigurations];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
}

@end