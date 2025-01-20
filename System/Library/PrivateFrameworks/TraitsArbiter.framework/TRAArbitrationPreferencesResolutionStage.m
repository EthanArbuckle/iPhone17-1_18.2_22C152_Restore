@interface TRAArbitrationPreferencesResolutionStage
- (NSArray)participantsRoles;
- (NSString)debugDescription;
- (TRAArbiter)arbiter;
- (TRAArbitrationPreferencesResolutionStage)initWithParticipantsRoles:(id)a3 preferencesType:(int64_t)a4 arbiter:(id)a5;
- (id)_setupStateDump;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferencesType;
- (void)_addStageComponent:(id)a3 toArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6;
- (void)_removeComponent:(id)a3 fromArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6;
- (void)addNodesSpecificationsSpecifier:(id)a3;
- (void)addResolutionPolicySpecifier:(id)a3;
- (void)addResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4;
- (void)addResolutionPolicySpecifier:(id)a3 update:(BOOL)a4;
- (void)addStageResolver:(id)a3;
- (void)dealloc;
- (void)removeNodesSpecificationsSpecifier:(id)a3;
- (void)removeResolutionPolicySpecifier:(id)a3;
- (void)removeResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4;
- (void)removeResolutionPolicySpecifier:(id)a3 update:(BOOL)a4;
- (void)removeStageResolver:(id)a3;
- (void)updateResolutionWithContext:(id)a3;
@end

@implementation TRAArbitrationPreferencesResolutionStage

uint64_t __86__TRAArbitrationPreferencesResolutionStage__addStageComponent_toArray_update_animate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 componentOrder];
  v6 = [v4 componentOrder];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_addStageComponent:(id)a3 toArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v21 = a3;
  id v11 = a4;
  v12 = v21;
  if (!v21)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRAArbitration.m", 283, @"Invalid parameter not satisfying: %@", @"component" object file lineNumber description];

    v12 = 0;
  }
  uint64_t v13 = [v12 preferencesType];
  if (v13 != [(TRAArbitrationPreferencesResolutionStage *)self preferencesType])
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = TRAStringFromTraitsPreferencesType([v21 preferencesType]);
    v20 = TRAStringFromTraitsPreferencesType([(TRAArbitrationPreferencesResolutionStage *)self preferencesType]);
    [v18 handleFailureInMethod:a2, self, @"TRAArbitration.m", 284, @"Preferences stage component[%@] preferences type[%@], doesn't match stage[%@] preferences type[%@]", v21, v19, self, v20 object file lineNumber description];
  }
  if ([v11 containsObject:v21])
  {
    WeakRetained = [MEMORY[0x263F08690] currentHandler];
    [WeakRetained handleFailureInMethod:a2, self, @"TRAArbitration.m", 296, @"[%@] already added to the stage[%@]", v21, self object file lineNumber description];
    v15 = v11;
  }
  else
  {
    [v11 addObject:v21];
    v16 = [v11 sortedArrayUsingComparator:&__block_literal_global_167];
    v15 = (void *)[v16 mutableCopy];

    if (!v7) {
      goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _preferencesResolutionStageDidUpdateComponents:self animate:v6];
  }

LABEL_10:
}

- (int64_t)preferencesType
{
  return self->_preferencesType;
}

- (NSArray)participantsRoles
{
  return &self->_participantsRoles->super;
}

- (void)updateResolutionWithContext:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v5 = self->_resolutionPolicySpecifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v11 = [v4 acquiredParticipants];
        [v10 updateStageParticipantsResolutionPolicies:v11 context:v4];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v12 = self->_nodesSpecsSpecifiers;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (!v13)
  {
    v15 = v12;
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  v15 = 0;
  uint64_t v16 = *(void *)v38;
  do
  {
    uint64_t v17 = 0;
    v18 = v15;
    do
    {
      if (*(void *)v38 != v16) {
        objc_enumerationMutation(v12);
      }
      v15 = [*(id *)(*((void *)&v37 + 1) + 8 * v17) updateStageTreeNodesSpecifications:v18 stageParticipantsRoles:self->_participantsRoles context:v4];

      ++v17;
      v18 = v15;
    }
    while (v14 != v17);
    uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
  }
  while (v14);

  if (v15)
  {
    BOOL v19 = [(TRAArbitrationPreferencesResolutionStage *)self preferencesType] == 1;
    v20 = TRAStringFromTraitsPreferencesType([(TRAArbitrationPreferencesResolutionStage *)self preferencesType]);
    id v21 = +[TRAPreferencesTree treeWithNodesSpecifications:v15 traversalType:v19 debugName:v20];
    stagePreferencesTree = self->_stagePreferencesTree;
    self->_stagePreferencesTree = v21;

LABEL_18:
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v23 = self->_stageResolvers;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v34;
    *(void *)&long long v25 = 138543618;
    long long v32 = v25;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v28), "resolveStagePreferencesWithContext:preferencesTree:", v4, self->_stagePreferencesTree, v32, (void)v33);
        v29 = TRALogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v30 = TRAStringFromTraitsPreferencesType(self->_preferencesType);
          v31 = [(TRAPreferencesTree *)self->_stagePreferencesTree recursiveDescription];
          *(_DWORD *)buf = v32;
          v46 = v30;
          __int16 v47 = 2114;
          v48 = v31;
          _os_log_debug_impl(&dword_2600B7000, v29, OS_LOG_TYPE_DEBUG, "Current stage tree %{public}@: %{public}@", buf, 0x16u);
        }
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v26);
  }
}

- (void)_removeComponent:(id)a3 fromArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v16 = a3;
  id v11 = a4;
  id v12 = v16;
  id v13 = v11;
  if (!v16)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRAArbitration.m", 301, @"Invalid parameter not satisfying: %@", @"component" object file lineNumber description];

    id v12 = 0;
  }
  if ([v13 containsObject:v12])
  {
    [v13 removeObject:v16];
    if (!v7) {
      goto LABEL_8;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _preferencesResolutionStageDidUpdateComponents:self animate:v6];
  }
  else
  {
    WeakRetained = [MEMORY[0x263F08690] currentHandler];
    [WeakRetained handleFailureInMethod:a2, self, @"TRAArbitration.m", 308, @"[%@] already removed from the stage[%@]", v16, self object file lineNumber description];
  }

LABEL_8:
}

- (void)addResolutionPolicySpecifier:(id)a3 update:(BOOL)a4
{
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationPreferencesResolutionStage *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = TRAStringFromTraitsPreferencesType(self->_preferencesType);
  [v3 appendString:v4 withName:@"preferencesType"];

  return v3;
}

- (void)removeResolutionPolicySpecifier:(id)a3 update:(BOOL)a4
{
}

- (void)removeResolutionPolicySpecifier:(id)a3
{
}

- (void)addResolutionPolicySpecifier:(id)a3
{
}

- (void)addResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4
{
}

- (TRAArbitrationPreferencesResolutionStage)initWithParticipantsRoles:(id)a3 preferencesType:(int64_t)a4 arbiter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRAArbitration.m", 189, @"Invalid parameter not satisfying: %@", @"participantsRoles" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRAArbitration.m", 190, @"Invalid parameter not satisfying: %@", @"arbiter" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)TRAArbitrationPreferencesResolutionStage;
  id v12 = [(TRAArbitrationPreferencesResolutionStage *)&v27 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_arbiter, v11);
    v13->_preferencesType = a4;
    uint64_t v14 = [v9 copy];
    participantsRoles = v13->_participantsRoles;
    v13->_participantsRoles = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    resolutionPolicySpecifiers = v13->_resolutionPolicySpecifiers;
    v13->_resolutionPolicySpecifiers = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF980] array];
    nodesSpecsSpecifiers = v13->_nodesSpecsSpecifiers;
    v13->_nodesSpecsSpecifiers = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x263EFF980] array];
    stageResolvers = v13->_stageResolvers;
    v13->_stageResolvers = (NSMutableArray *)v20;

    uint64_t v22 = [(TRAArbitrationPreferencesResolutionStage *)v13 _setupStateDump];
    stateDumpHandle = v13->_stateDumpHandle;
    v13->_stateDumpHandle = (BSInvalidatable *)v22;
  }
  return v13;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateDumpHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TRAArbitrationPreferencesResolutionStage;
  [(TRAArbitrationPreferencesResolutionStage *)&v3 dealloc];
}

- (void)addNodesSpecificationsSpecifier:(id)a3
{
}

- (void)addStageResolver:(id)a3
{
}

- (void)removeResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4
{
}

- (void)removeNodesSpecificationsSpecifier:(id)a3
{
}

- (void)removeStageResolver:(id)a3
{
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAArbitrationPreferencesResolutionStage *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(TRAArbitrationPreferencesResolutionStage *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(TRAArbitrationPreferencesResolutionStage *)self succinctDescriptionBuilder];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSMutableArray count](self->_resolutionPolicySpecifiers, "count"));
  [v4 appendString:v5 withName:@"resolutionPolicySpecifiers count"];

  BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSMutableArray count](self->_nodesSpecsSpecifiers, "count"));
  [v4 appendString:v6 withName:@"nodesSpecificationSpecifiers count"];

  BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSMutableArray count](self->_stageResolvers, "count"));
  [v4 appendString:v7 withName:@"stageResolvers count"];

  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_participantsRoles, "count"), @"participantsRoles count");
  if (self->_stagePreferencesTree)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__TRAArbitrationPreferencesResolutionStage_descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_265543D20;
    id v13 = v4;
    uint64_t v14 = self;
    [v13 appendBodySectionWithName:@"Preference Tree" multilinePrefix:0 block:v12];
  }
  else
  {
    id v9 = [0 recursiveDescription];
    [v4 appendString:v9 withName:@"Preference Tree"];
  }
  [v4 appendArraySection:self->_resolutionPolicySpecifiers withName:@"Resolution Policy Specifiers" skipIfEmpty:0];
  [v4 appendArraySection:self->_stageResolvers withName:@"Resolvers" skipIfEmpty:0];
  id v10 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_participantsRoles, "count"), @"Managed Roles");
  return v4;
}

void __82__TRAArbitrationPreferencesResolutionStage_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 40) recursiveDescription];
  [v1 appendString:v2 withName:0];
}

- (id)_setupStateDump
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  id v4 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  BOOL v6 = TRAStringFromTraitsPreferencesType(self->_preferencesType);
  BOOL v7 = [v4 stringWithFormat:@"TraitsArbiter - %p - Arbitration Pipeline - Preferences Resolution Stages - %@", WeakRetained, v6];
  objc_copyWeak(&v10, &location);
  id v8 = BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v8;
}

__CFString *__59__TRAArbitrationPreferencesResolutionStage__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained debugDescription];
  }
  else
  {
    id v3 = &stru_270BF7BE8;
  }

  return v3;
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_stagePreferencesTree, 0);
  objc_storeStrong((id *)&self->_participantsRoles, 0);
  objc_storeStrong((id *)&self->_stageResolvers, 0);
  objc_storeStrong((id *)&self->_nodesSpecsSpecifiers, 0);
  objc_storeStrong((id *)&self->_resolutionPolicySpecifiers, 0);
}

@end