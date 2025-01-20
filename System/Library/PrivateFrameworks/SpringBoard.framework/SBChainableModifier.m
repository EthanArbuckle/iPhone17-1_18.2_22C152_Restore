@interface SBChainableModifier
+ (BOOL)modifierUnderTest:(id)a3 containsChildModifierKindOfClass:(Class)a4;
+ (Class)makeDynamicSubclassWithDescriptor:(id)a3 implementation:(id)a4 forSelector:(SEL)a5 ofProtocol:(id)a6;
+ (id)baseClassForQueryProtocol;
+ (id)contextProtocol;
+ (id)contextSelectors;
+ (id)newCacheWithSelectorList:(id)a3 subsequentMethodCacheFunc:(void *)a4 cachingDictionary:(id)a5;
+ (id)newContextCache;
+ (id)newEventResponse;
+ (id)newQueryCache;
+ (id)queryProtocol;
+ (id)querySelectors;
+ (void)_initalizeIMPCaching;
+ (void)verifyModifierImplements:(BOOL)a3 methodsOfProtocol:(id)a4;
- (BOOL)_anyDescendentImplementsAnyContextMethod;
- (BOOL)_anyDescendentImplementsAnyQueryMethod;
- (BOOL)completesWhenChildrenComplete;
- (BOOL)containsChildModifier:(id)a3;
- (BOOL)runsInternalVerificationAfterEventDispatch;
- (NSString)description;
- (NSString)key;
- (SBChainableModifier)init;
- (SBChainableModifier)nextQueryModifier;
- (SBChainableModifier)parentModifier;
- (SBChainableModifier)previousContextModifier;
- (SBChainableModifierDelegate)delegate;
- (SBModifierCacheCoordinator)contextCacheCoordinator;
- (SBModifierCacheCoordinator)queryCacheCoordinator;
- (id)_forwardEvent:(id)a3 toChildModifier:(id)a4;
- (id)_handleEvent:(id)a3;
- (id)_lastDeepChildModifier;
- (id)childModifierByKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugPotentialChildModifiers;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)handleEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)modifierLevel;
- (int64_t)state;
- (unint64_t)childModifierCount;
- (void)_addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5 queryResponse:(unint64_t)a6 contextResponse:(unint64_t)a7;
- (void)_insertModifier:(id)a3 afterModifier:(id)a4 queryResponse:(unint64_t)a5 contextResponse:(unint64_t)a6;
- (void)_notifyChildrenDidMoveToParentIfNeeded;
- (void)_removeChildModifier:(id)a3 queryResponse:(unint64_t)a4 contextResponse:(unint64_t)a5;
- (void)addChildModifier:(id)a3;
- (void)addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5;
- (void)dealloc;
- (void)didMoveToParentModifier:(id)a3;
- (void)enumerateChildModifiersWithBlock:(id)a3;
- (void)performTransactionWithTemporaryChildModifier:(id)a3 usingBlock:(id)a4;
- (void)provideNextQueryImplementation:(id)a3 forSelector:(SEL)a4;
- (void)providePreviousContextImplementation:(id)a3 forSelector:(SEL)a4;
- (void)removeChildModifier:(id)a3;
- (void)setContextCacheCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKey:(id)a3;
- (void)setModifierLevel:(int64_t)a3;
- (void)setNextQueryModifier:(id)a3;
- (void)setParentModifier:(id)a3;
- (void)setPreviousContextModifier:(id)a3;
- (void)setQueryCacheCoordinator:(id)a3;
- (void)setState:(int64_t)a3;
- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3;
@end

@implementation SBChainableModifier

- (id)handleEvent:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__105;
  v66 = __Block_byref_object_dispose__105;
  id v67 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  char v61 = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __35__SBChainableModifier_handleEvent___block_invoke;
  v59[3] = &unk_1E6B0B800;
  v59[5] = &v62;
  v59[6] = v60;
  v59[4] = self;
  v5 = (void *)MEMORY[0x1D948C7A0](v59);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __35__SBChainableModifier_handleEvent___block_invoke_2;
  v57[3] = &unk_1E6B0B828;
  id v7 = v6;
  id v58 = v7;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v57];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __35__SBChainableModifier_handleEvent___block_invoke_3;
  v54[3] = &unk_1E6B0B850;
  v54[4] = self;
  id v33 = v4;
  id v55 = v33;
  id v31 = v5;
  id v56 = v31;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v54];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __35__SBChainableModifier_handleEvent___block_invoke_4;
  v52[3] = &unk_1E6B0B828;
  id v9 = v8;
  id v53 = v9;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v52];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v14 = [(SBChainableModifier *)self loggingCategory];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = [v13 succinctDescription];
          *(_DWORD *)buf = 138412546;
          id v70 = v16;
          __int16 v71 = 2112;
          v72 = v17;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "[%@] Removing child modifier %@ because its state is Completed.", buf, 0x16u);
        }
        [(SBChainableModifier *)self removeChildModifier:v13];
        [v7 removeObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v73 count:16];
    }
    while (v10);
  }

  v35 = [(SBChainableModifier *)self _handleEvent:v33];
  if (v35) {
    (*((void (**)(id, void *, void))v31 + 2))(v31, v35, 0);
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __35__SBChainableModifier_handleEvent___block_invoke_17;
  v43[3] = &unk_1E6B0B878;
  id v30 = v7;
  id v44 = v30;
  v45 = self;
  id v34 = v33;
  id v46 = v34;
  id v32 = v31;
  id v47 = v32;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v43];
  [obj removeAllObjects];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __35__SBChainableModifier_handleEvent___block_invoke_2_18;
  v41[3] = &unk_1E6B0B828;
  id v18 = obj;
  id v42 = v18;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v41];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v68 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v24 = [(SBChainableModifier *)self loggingCategory];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          v27 = [v23 succinctDescription];
          *(_DWORD *)buf = 138412546;
          id v70 = v26;
          __int16 v71 = 2112;
          v72 = v27;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_INFO, "[%@] Removing child modifier %@ because its state is Completed.", buf, 0x16u);
        }
        [(SBChainableModifier *)self removeChildModifier:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v68 count:16];
    }
    while (v20);
  }

  if ([(SBChainableModifier *)self completesWhenChildrenComplete]
    && ![(SBChainableModifier *)self childModifierCount])
  {
    [(SBChainableModifier *)self setState:1];
  }
  if ([(SBChainableModifier *)self runsInternalVerificationAfterEventDispatch])
  {
    [(SBChainableModifier *)self verifyInternalIntegrityAfterHandlingEvent:v34];
  }
  id v28 = (id)v63[5];

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v62, 8);

  return v28;
}

- (void)enumerateChildModifiersWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, char *))a3;
  uint64_t v5 = [(SBChainableModifier *)self nextQueryModifier];
  char v10 = 0;
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = 0;
    do
    {
      id v8 = [v6 parentModifier];

      if (v8 == self) {
        v4[2](v4, v6, v7++, &v10);
      }
      id v9 = [v6 nextQueryModifier];

      if (!v9) {
        break;
      }
      id v6 = v9;
    }
    while (!v10);
  }
}

- (SBChainableModifier)nextQueryModifier
{
  return self->_nextQueryModifier;
}

- (SBChainableModifier)parentModifier
{
  return self->_parentModifier;
}

- (BOOL)completesWhenChildrenComplete
{
  return 0;
}

- (id)_handleEvent:(id)a3
{
  return 0;
}

- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SBChainableModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke;
  v3[3] = &unk_1E6B0B918;
  v3[4] = self;
  v3[5] = a2;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v3];
}

uint64_t __35__SBChainableModifier_handleEvent___block_invoke_17(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 40) _forwardEvent:*(void *)(a1 + 48) toChildModifier:v5];
    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  return MEMORY[0x1F4181870]();
}

void __65__SBChainableModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 state] == 1)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBChainableModifier.m" lineNumber:395 description:@"Should not have any completed modifiers"];
  }
}

void __35__SBChainableModifier_handleEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)state
{
  return self->_state;
}

void __35__SBChainableModifier_handleEvent___block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __35__SBChainableModifier_handleEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _forwardEvent:*(void *)(a1 + 40) toChildModifier:a2];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = v4;
  }
}

- (id)_forwardEvent:(id)a3 toChildModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 handleEvent:v6];
  if (v8)
  {
    id v9 = (void *)v8;
    char v10 = [(SBChainableModifier *)self responseForProposedChildResponse:v8 childModifier:v7 event:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __35__SBChainableModifier_handleEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __83__SBChainableModifier__addChildModifier_atLevel_key_queryResponse_contextResponse___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  id v4 = [v10 key];
  id v5 = v4;
  if (v4 && [v4 isEqualToString:a1[4]])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[9] object:a1[6] file:a1[4] lineNumber:a1[5] description:v10];
  }
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v6 = a1[10];
    uint64_t v7 = [v10 modifierLevel];
    uint64_t v8 = *(void *)(a1[7] + 8);
    if (v6 <= v7)
    {
      *(unsigned char *)(v8 + 24) = 1;
    }
    else if (!*(unsigned char *)(v8 + 24))
    {
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    }
  }
}

void __42__SBChainableModifier_childModifierByKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 key];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)didMoveToParentModifier:(id)a3
{
  if (a3) {
    [(SBChainableModifier *)self _notifyChildrenDidMoveToParentIfNeeded];
  }
}

- (int64_t)modifierLevel
{
  return self->_modifierLevel;
}

void __45__SBChainableModifier__lastDeepChildModifier__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5 queryResponse:(unint64_t)a6 contextResponse:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__105;
  id v34 = __Block_byref_object_dispose__105;
  v15 = self;
  v35 = v15;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__SBChainableModifier__addChildModifier_atLevel_key_queryResponse_contextResponse___block_invoke;
  v22[3] = &unk_1E6B0B8F0;
  id v16 = v14;
  SEL v28 = a2;
  id v23 = v16;
  v24 = v15;
  id v17 = v13;
  id v25 = v17;
  id v26 = v36;
  int64_t v29 = a4;
  v27 = &v30;
  [(SBChainableModifier *)v15 enumerateChildModifiersWithBlock:v22];
  [v17 setKey:v16];
  [v17 setParentModifier:v15];
  [v17 setModifierLevel:a4];
  id v18 = (SBChainableModifier *)v31[5];
  if (v18 == v15)
  {
    id v19 = v15;
  }
  else
  {
    id v19 = [(SBChainableModifier *)v18 _lastDeepChildModifier];
  }
  uint64_t v20 = v19;
  [(SBChainableModifier *)v15 _insertModifier:v17 afterModifier:v19 queryResponse:a6 contextResponse:a7];
  if (v15->_parentModifier
    || (id WeakRetained = objc_loadWeakRetained((id *)&v15->_delegate), WeakRetained, WeakRetained))
  {
    [v17 didMoveToParentModifier:v15];
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v36, 8);
}

- (void)setParentModifier:(id)a3
{
  self->_parentModifier = (SBChainableModifier *)a3;
}

- (void)setModifierLevel:(int64_t)a3
{
  self->_modifierLevel = a3;
}

- (void)setKey:(id)a3
{
}

uint64_t __63__SBChainableModifier__anyDescendentImplementsAnyContextMethod__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 _anyDescendentImplementsAnyContextMethod];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_notifyChildrenDidMoveToParentIfNeeded
{
  if (!self->_hasNotifiedChildrenDidMoveToParent)
  {
    self->_hasNotifiedChildrenDidMoveToParent = 1;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __61__SBChainableModifier__notifyChildrenDidMoveToParentIfNeeded__block_invoke;
    v2[3] = &unk_1E6B0B828;
    v2[4] = self;
    [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v2];
  }
}

uint64_t __30__SBChainableModifier_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setParentModifier:0];
}

uint64_t __61__SBChainableModifier__notifyChildrenDidMoveToParentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didMoveToParentModifier:*(void *)(a1 + 32)];
}

uint64_t __50__SBChainableModifier_setContextCacheCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContextCacheCoordinator:*(void *)(a1 + 32)];
}

uint64_t __48__SBChainableModifier_setQueryCacheCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setQueryCacheCoordinator:*(void *)(a1 + 32)];
}

- (void)_removeChildModifier:(id)a3 queryResponse:(unint64_t)a4 contextResponse:(unint64_t)a5
{
  id v14 = a3;
  [v14 setState:1];
  int v8 = [v14 _lastDeepChildModifier];
  id v9 = [v14 previousContextModifier];
  id v10 = [v8 nextQueryModifier];
  [v9 setNextQueryModifier:v10];
  [v10 setPreviousContextModifier:v9];
  [v14 setPreviousContextModifier:0];
  [v8 setNextQueryModifier:0];
  uint64_t v11 = [(SBChainableModifier *)self queryCacheCoordinator];
  [v11 performResponse:a4];

  v12 = [(SBChainableModifier *)self contextCacheCoordinator];
  [v12 performResponse:a5];

  id v13 = [v14 parentModifier];

  if (v13 == self)
  {
    [v14 setParentModifier:0];
    [v14 didMoveToParentModifier:0];
  }
}

- (void)_insertModifier:(id)a3 afterModifier:(id)a4 queryResponse:(unint64_t)a5 contextResponse:(unint64_t)a6
{
  id v20 = a3;
  id v11 = a4;
  if (v20)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBChainableModifier.m", 450, @"Invalid parameter not satisfying: %@", @"modifierToInsert" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBChainableModifier.m", 451, @"Invalid parameter not satisfying: %@", @"afterModifier" object file lineNumber description];

LABEL_3:
  v12 = [(SBChainableModifier *)self queryCacheCoordinator];
  [v20 setQueryCacheCoordinator:v12];

  id v13 = [(SBChainableModifier *)self contextCacheCoordinator];
  [v20 setContextCacheCoordinator:v13];

  id v14 = [v11 nextQueryModifier];
  v15 = [v20 _lastDeepChildModifier];
  [v11 setNextQueryModifier:v20];
  [v20 setPreviousContextModifier:v11];
  [v15 setNextQueryModifier:v14];
  [v14 setPreviousContextModifier:v15];
  id v16 = [(SBChainableModifier *)self queryCacheCoordinator];
  [v16 performResponse:a5];

  id v17 = [(SBChainableModifier *)self contextCacheCoordinator];
  [v17 performResponse:a6];
}

- (void)setPreviousContextModifier:(id)a3
{
  self->_previousContextModifier = (SBChainableModifier *)a3;
}

- (void)setNextQueryModifier:(id)a3
{
}

- (SBModifierCacheCoordinator)queryCacheCoordinator
{
  return [(SBChainableModifierMethodCache *)self->_queryCache cacheCoordinator];
}

- (SBModifierCacheCoordinator)contextCacheCoordinator
{
  return [(SBChainableModifierMethodCache *)self->_contextCache cacheCoordinator];
}

- (id)_lastDeepChildModifier
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__105;
  v12 = __Block_byref_object_dispose__105;
  v2 = self;
  id v13 = v2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SBChainableModifier__lastDeepChildModifier__block_invoke;
  v7[3] = &unk_1E6B0B8A0;
  v7[4] = &v8;
  [(SBChainableModifier *)v2 enumerateChildModifiersWithBlock:v7];
  id v3 = (SBChainableModifier *)v9[5];
  if (v3 == v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(SBChainableModifier *)v3 _lastDeepChildModifier];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)setQueryCacheCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(SBChainableModifierMethodCache *)self->_queryCache cacheCoordinator];

  if (v5 != v4)
  {
    [(SBChainableModifierMethodCache *)self->_queryCache setCacheCoordinator:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SBChainableModifier_setQueryCacheCoordinator___block_invoke;
    v6[3] = &unk_1E6B0B828;
    id v7 = v4;
    [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v6];
  }
}

- (void)setContextCacheCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(SBChainableModifierMethodCache *)self->_contextCache cacheCoordinator];

  if (v5 != v4)
  {
    [(SBChainableModifierMethodCache *)self->_contextCache setCacheCoordinator:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__SBChainableModifier_setContextCacheCoordinator___block_invoke;
    v6[3] = &unk_1E6B0B828;
    id v7 = v4;
    [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v6];
  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SBChainableModifier)previousContextModifier
{
  return self->_previousContextModifier;
}

uint64_t __61__SBChainableModifier__anyDescendentImplementsAnyQueryMethod__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 _anyDescendentImplementsAnyQueryMethod];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)performTransactionWithTemporaryChildModifier:(id)a3 usingBlock:(id)a4
{
  id v16 = a3;
  uint64_t v6 = (void (**)(void))a4;
  int v7 = [v16 _anyDescendentImplementsAnyQueryMethod];
  int v8 = [v16 _anyDescendentImplementsAnyContextMethod];
  id v9 = [v16 parentModifier];

  if (v9 == self)
  {
    v6[2](v6);
  }
  else
  {
    BOOL v10 = v8 == 0;
    if (v8) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 3;
    }
    if (v10) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 1;
    }
    BOOL v13 = v7 == 0;
    if (v7) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 3;
    }
    if (v13) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 1;
    }
    [(SBChainableModifier *)self _addChildModifier:v16 atLevel:0 key:0 queryResponse:v15 contextResponse:v12];
    v6[2](v6);
    [(SBChainableModifier *)self _removeChildModifier:v16 queryResponse:v14 contextResponse:v11];
  }
}

- (void)addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5
{
  id v8 = a5;
  id v11 = a3;
  if ([v11 _anyDescendentImplementsAnyQueryMethod]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 3;
  }
  if ([v11 _anyDescendentImplementsAnyContextMethod]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 3;
  }
  [(SBChainableModifier *)self _addChildModifier:v11 atLevel:a4 key:v8 queryResponse:v9 contextResponse:v10];
}

- (BOOL)_anyDescendentImplementsAnyQueryMethod
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v9 = 0;
  BOOL v9 = [(SBChainableModifierMethodCache *)self->_queryCache hasNonTrampolineIMPs];
  if (*((unsigned char *)v7 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__SBChainableModifier__anyDescendentImplementsAnyQueryMethod__block_invoke;
    v5[3] = &unk_1E6B0B8A0;
    v5[4] = &v6;
    [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v5];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_anyDescendentImplementsAnyContextMethod
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v9 = 0;
  BOOL v9 = [(SBChainableModifierMethodCache *)self->_contextCache hasNonTrampolineIMPs];
  if (*((unsigned char *)v7 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__SBChainableModifier__anyDescendentImplementsAnyContextMethod__block_invoke;
    v5[3] = &unk_1E6B0B8A0;
    v5[4] = &v6;
    [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v5];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__SBChainableModifier_handleEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  id v14 = v6;
  if (v9)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v10 = (void *)[(id)objc_opt_class() newEventResponse];
      [v10 addChildResponse:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    BOOL v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      [v13 addChildResponse:v14];
    }
    else {
      [v13 insertChildResponse:v14 atIndex:a3];
    }
  }
  else
  {
    objc_storeStrong(v8, a2);
  }
}

- (SBChainableModifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBChainableModifierDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_nextQueryModifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_queryCache, 0);
}

- (void)dealloc
{
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:&__block_literal_global_356];
  BOOL v3 = [(SBChainableModifier *)self nextQueryModifier];
  [v3 setPreviousContextModifier:0];

  v4.receiver = self;
  v4.super_class = (Class)SBChainableModifier;
  [(SBChainableModifier *)&v4 dealloc];
}

- (id)childModifierByKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__105;
  uint64_t v15 = __Block_byref_object_dispose__105;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SBChainableModifier_childModifierByKey___block_invoke;
  v8[3] = &unk_1E6B0B8C8;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (SBChainableModifier)init
{
  id v4 = objc_opt_class();
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBChainableModifier.m" lineNumber:50 description:@"SBChainableModifier is abstract. Make a subclass and define the query and context protocols."];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBChainableModifier;
  id v5 = [(SBChainableModifier *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() newQueryCache];
    queryCache = v5->_queryCache;
    v5->_queryCache = (SBChainableModifierMethodCache *)v6;

    [(SBChainableModifierMethodCache *)v5->_queryCache setModifier:v5];
    uint64_t v8 = [(id)objc_opt_class() newContextCache];
    contextCache = v5->_contextCache;
    v5->_contextCache = (SBChainableModifierMethodCache *)v8;

    [(SBChainableModifierMethodCache *)v5->_contextCache setModifier:v5];
    v5->_state = 0;
  }
  return v5;
}

+ (id)newQueryCache
{
  BOOL v3 = [a1 querySelectors];
  id v4 = (void *)[a1 newCacheWithSelectorList:v3 subsequentMethodCacheFunc:NextQueryMethodCacheForMethodCache cachingDictionary:staticPrototypeQueryCacheForClass];

  return v4;
}

+ (id)newContextCache
{
  BOOL v3 = [a1 contextSelectors];
  id v4 = (void *)[a1 newCacheWithSelectorList:v3 subsequentMethodCacheFunc:PreviousContextMethodCacheForMethodCache cachingDictionary:staticPrototypeContextCacheForClass];

  return v4;
}

+ (id)newCacheWithSelectorList:(id)a3 subsequentMethodCacheFunc:(void *)a4 cachingDictionary:(id)a5
{
  uint64_t v8 = (size_t *)a3;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKey:a1];
  if (!v10)
  {
    uint64_t v11 = [(id)objc_opt_class() baseClassForQueryProtocol];
    objc_super v12 = malloc_type_calloc(v8[1], 8uLL, 0x80040B8603338uLL);
    if ((uint64_t)v8[1] >= 1)
    {
      id v19 = a4;
      int64_t v13 = 0;
      char v14 = 1;
LABEL_4:
      char v20 = v14;
      do
      {
        uint64_t v15 = *(void *)(v8[2] + 8 * v13);
        uint64_t v16 = objc_msgSend(a1, "instanceMethodForSelector:", v15, v19);
        if (v16 != [v11 instanceMethodForSelector:v15])
        {
          char v14 = 0;
          v12[v13++] = v16;
          if (v13 < (uint64_t)v8[1]) {
            goto LABEL_4;
          }
          a4 = v19;
          goto LABEL_12;
        }
        ++v13;
      }
      while (v13 < (uint64_t)v8[1]);
      a4 = v19;
      if ((v20 & 1) == 0) {
        goto LABEL_12;
      }
    }
    free(v12);
    objc_super v12 = 0;
LABEL_12:
    uint64_t v10 = [[SBChainableModifierMethodCache alloc] initWithIMPs:v12 selectorList:v8 subsequentMethodCacheFunc:a4];
    [v9 setObject:v10 forKey:a1];
  }
  id v17 = (void *)[(SBChainableModifierMethodCache *)v10 copy];

  return v17;
}

+ (id)contextSelectors
{
  v2 = (void *)staticContextSelectorsForBaseClass;
  BOOL v3 = [a1 baseClassForQueryProtocol];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (id)querySelectors
{
  v2 = (void *)staticQuerySelectorsForBaseClass;
  BOOL v3 = [a1 baseClassForQueryProtocol];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (id)baseClassForQueryProtocol
{
  id v2 = a1;
  if ((id)objc_opt_class() == v2)
  {
    id v5 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v3 = [v2 methodForSelector:sel_queryProtocol];
      if (v3 != objc_msgSend((id)objc_msgSend(v2, "superclass"), "methodForSelector:", sel_queryProtocol)) {
        break;
      }
      uint64_t v4 = [v2 superclass];

      id v2 = (id)v4;
      if (v4 == objc_opt_class())
      {
        id v5 = 0;
        id v2 = (id)v4;
        goto LABEL_7;
      }
    }
    id v2 = v2;
    id v5 = v2;
  }
LABEL_7:

  return v5;
}

- (void)removeChildModifier:(id)a3
{
  id v6 = a3;
  if ([v6 _anyDescendentImplementsAnyQueryMethod]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3;
  }
  if ([v6 _anyDescendentImplementsAnyContextMethod]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  [(SBChainableModifier *)self _removeChildModifier:v6 queryResponse:v4 contextResponse:v5];
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v5 = a3;
  return v5;
}

- (BOOL)containsChildModifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SBChainableModifier_containsChildModifier___block_invoke;
  v7[3] = &unk_1E6B0B8C8;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)addChildModifier:(id)a3
{
}

- (void)provideNextQueryImplementation:(id)a3 forSelector:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = [v7 queryProtocol];
  id v9 = (objc_class *)[v7 makeDynamicSubclassWithDescriptor:@"NextQuery" implementation:v6 forSelector:a4 ofProtocol:v8];

  id v10 = objc_alloc_init(v9);
  [(SBChainableModifier *)self _insertModifier:v10 afterModifier:self queryResponse:0 contextResponse:0];
}

- (void)providePreviousContextImplementation:(id)a3 forSelector:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = [v7 contextProtocol];
  id v9 = (objc_class *)[v7 makeDynamicSubclassWithDescriptor:@"PreviousContext" implementation:v6 forSelector:a4 ofProtocol:v8];

  id v11 = objc_alloc_init(v9);
  id v10 = [(SBChainableModifier *)self previousContextModifier];
  [(SBChainableModifier *)self _insertModifier:v11 afterModifier:v10 queryResponse:0 contextResponse:0];
}

+ (Class)makeDynamicSubclassWithDescriptor:(id)a3 implementation:(id)a4 forSelector:(SEL)a5 ofProtocol:(id)a6
{
  id v11 = (Protocol *)a6;
  id v12 = a4;
  id v13 = a3;
  objc_method_description MethodDescription = protocol_getMethodDescription(v11, a5, 1, 1);
  if (!MethodDescription.name)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v28 = NSStringFromSelector(a5);
    int64_t v29 = NSStringFromProtocol(v11);
    [v27 handleFailureInMethod:a2, a1, @"SBChainableModifier+RuntimeProviding.m", 37, @"%@ does not exist in %@", v28, v29 object file lineNumber description];
  }
  SEL v32 = a2;
  id v33 = v11;
  uint64_t v15 = (objc_class *)(id)[a1 baseClassForQueryProtocol];
  uint64_t v16 = NSString;
  id v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  id v19 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v20 = [v19 UUIDString];
  uint64_t v21 = [v16 stringWithFormat:@"%@-%@-%@", v18, v13, v20];

  id v22 = v21;
  ClassPair = objc_allocateClassPair(v15, (const char *)[v22 UTF8String], 0);
  objc_registerClassPair(ClassPair);
  v24 = imp_implementationWithBlock(v12);
  LOBYTE(v20) = class_addMethod(ClassPair, a5, v24, MethodDescription.types);

  if ((v20 & 1) == 0)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    id v31 = NSStringFromSelector(a5);
    [v30 handleFailureInMethod:v32, a1, @"SBChainableModifier+RuntimeProviding.m", 47, @"Implementation for %@ already exists in subclass %@", v31, ClassPair object file lineNumber description];
  }
  id v25 = ClassPair;

  return v25;
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    id v5 = obj;
    if (obj)
    {
      [(SBChainableModifier *)self _notifyChildrenDidMoveToParentIfNeeded];
      id v5 = obj;
    }
  }
}

- (unint64_t)childModifierCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SBChainableModifier_childModifierCount__block_invoke;
  v4[3] = &unk_1E6B0B8A0;
  v4[4] = &v5;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__SBChainableModifier_childModifierCount__block_invoke(uint64_t result)
{
  return result;
}

uint64_t __45__SBChainableModifier_containsChildModifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)debugPotentialChildModifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBChainableModifier_debugPotentialChildModifiers__block_invoke;
  v6[3] = &unk_1E6B0B828;
  id v4 = v3;
  id v7 = v4;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v6];

  return v4;
}

uint64_t __51__SBChainableModifier_debugPotentialChildModifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)verifyModifierImplements:(BOOL)a3 methodsOfProtocol:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (Protocol *)a4;
  *(void *)outCount = 0;
  char v6 = 1;
  id v7 = protocol_copyMethodDescriptionList(v5, 1, 1, &outCount[1]);
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = class_copyMethodList(v8, outCount);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (!outCount[1])
  {
    id v19 = 0;
    goto LABEL_17;
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  do
  {
    name = v7[v11].name;
    if (!outCount[0])
    {
LABEL_7:
      if (!v4) {
        goto LABEL_9;
      }
LABEL_8:
      ++v12;
      uint64_t v16 = NSStringFromSelector(name);
      [v10 appendFormat:@"%@, ", v16];

      goto LABEL_9;
    }
    uint64_t v14 = 0;
    while (1)
    {
      Description = method_getDescription(v9[v14]);
      if (sel_isEqual(Description->name, name)) {
        break;
      }
      if (++v14 >= (unint64_t)outCount[0]) {
        goto LABEL_7;
      }
    }
    if (!v4) {
      goto LABEL_8;
    }
LABEL_9:
    ++v11;
  }
  while (v11 < outCount[1]);
  if (v12)
  {
    id v17 = NSString;
    id v18 = objc_msgSend(v10, "substringWithRange:", 0, objc_msgSend(v10, "length") - 2);
    id v19 = [v17 stringWithFormat:@"Invalid %ld method(s): %@", v12, v18];

    char v6 = 0;
  }
  else
  {
    id v19 = 0;
    char v6 = 1;
  }
LABEL_17:
  free(v7);
  free(v9);
  if ((v6 & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"+[SBChainableModifier verifyModifierImplements:methodsOfProtocol:]"];
    id v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    if (v4) {
      v24 = @"should implement all the methods";
    }
    else {
      v24 = @"shouldn't implement any of the methods";
    }
    id v25 = NSStringFromProtocol(v5);
    [v20 handleFailureInFunction:v21, @"SBChainableModifier.m", 364, @"You declared %@ %@ in the %@ protocol. %@", v23, v24, v25, v19 file lineNumber description];
  }
}

+ (id)contextProtocol
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSString;
  char v6 = NSStringFromSelector(a2);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"*** +[SBChainableModier %@]: method only defined for abstract class.  Define +[%@ %@]!", v6, v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)queryProtocol
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSString;
  char v6 = NSStringFromSelector(a2);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"*** +[SBChainableModier %@]: method only defined for abstract class.  Define +[%@ %@]!", v6, v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return 0;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBChainableModifierEventResponse);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (NSString)description
{
  return (NSString *)[(SBChainableModifier *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBChainableModifier *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v6 = (id)[v5 appendObject:self->_key withName:@"key"];
  if (self->_state) {
    uint64_t v7 = @"Complete";
  }
  else {
    uint64_t v7 = @"Active";
  }
  id v8 = (id)[v5 appendObject:v7 withName:@"state"];
  if ([(SBChainableModifier *)self childModifierCount])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
    v10[3] = &unk_1E6AF4E00;
    id v11 = v4;
    uint64_t v12 = self;
    id v13 = v5;
    [v13 appendBodySectionWithName:@"children" multilinePrefix:v11 block:v10];
  }
  return v5;
}

void __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 stringByAppendingString:@"\t"];
  }
  else
  {
    uint64_t v3 = @"\t";
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E6B0AD98;
  id v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = v3;
  uint64_t v5 = v3;
  [v4 enumerateChildModifiersWithBlock:v6];
}

void __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 descriptionWithMultilinePrefix:*(void *)(a1 + 40)];
  id v3 = (id)[v2 appendObject:v4 withName:&stru_1F3084718];
}

- (id)succinctDescription
{
  unint64_t v2 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

+ (BOOL)modifierUnderTest:(id)a3 containsChildModifierKindOfClass:(Class)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBChainableModifier_modifierUnderTest_containsChildModifierKindOfClass___block_invoke;
  v7[3] = &unk_1E6B0B940;
  void v7[4] = &v8;
  void v7[5] = a4;
  [v5 enumerateChildModifiersWithBlock:v7];
  LOBYTE(a4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)a4;
}

uint64_t __74__SBChainableModifier_modifierUnderTest_containsChildModifierKindOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (void)_initalizeIMPCaching
{
  if (!staticPrototypeQueryCacheForClass)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = (void *)staticPrototypeQueryCacheForClass;
    staticPrototypeQueryCacheForClass = (uint64_t)v4;
  }
  if (!staticPrototypeContextCacheForClass)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (void *)staticPrototypeContextCacheForClass;
    staticPrototypeContextCacheForClass = (uint64_t)v6;
  }
  id v8 = [a1 baseClassForQueryProtocol];

  if (v8 == a1)
  {
    id v9 = &sharedInstance_onceToken_47;
    if (!staticQuerySelectorsForBaseClass)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      char v11 = (void *)staticQuerySelectorsForBaseClass;
      staticQuerySelectorsForBaseClass = (uint64_t)v10;
    }
    SEL v57 = a2;
    uint64_t v12 = [a1 queryProtocol];
    id v13 = &selRef__deviceBlockedChanged_;
    if (v12)
    {
      uint64_t v14 = 0;
      unsigned int v15 = 0;
      int v16 = 0;
      while (!protocol_isEqual(v12, (Protocol *)v13[38]))
      {
        unsigned int outCount = 0;
        id v17 = protocol_copyMethodDescriptionList(v12, 1, 1, &outCount);
        if (outCount)
        {
          id v18 = v17;
          v15 += outCount;
          uint64_t v14 = malloc_type_realloc(v14, 8 * v15, 0x80040B8603338uLL);
          if (outCount)
          {
            unsigned int v55 = v15;
            unint64_t v19 = 0;
            p_types = &v18->types;
            do
            {
              uint64_t v21 = *(p_types - 1);
              id v22 = *p_types;
              if ([a1 instancesRespondToSelector:v21])
              {
                v24 = [MEMORY[0x1E4F28B00] currentHandler];
                id v53 = NSStringFromSelector(v21);
                [v24 handleFailureInMethod:v57, a1, @"SBChainableModifier.m", 584, @"%@: Cannot implement %@ on an implementer of +queryProtocol - it messes up the caching implementation.", a1, v53 object file lineNumber description];
              }
              TrampolineForMethod = (void (*)(void))SBChainableModifierMethodCacheQueryTrampolineForMethod(v21, v22, (v16 + v19));
              class_addMethod((Class)a1, v21, TrampolineForMethod, v22);
              *((void *)v14 + (v16 + v19++)) = v21;
              p_types += 2;
            }
            while (v19 < outCount);
            v16 += v19;
            id v13 = &selRef__deviceBlockedChanged_;
            id v9 = &sharedInstance_onceToken_47;
            unsigned int v15 = v55;
          }
          free(v18);
        }
        unsigned int v58 = 0;
        id v25 = protocol_copyProtocolList(v12, &v58);
        if (!v58)
        {

          uint64_t v12 = 0;
          break;
        }
        id v26 = (id *)v25;
        if (v58 != 1)
        {
          SEL v28 = [MEMORY[0x1E4F28B00] currentHandler];
          [v28 handleFailureInMethod:v57 object:a1 file:@"SBChainableModifier.m" lineNumber:598 description:@"Multiple sub protocols not currently supported"];
        }
        v27 = (Protocol *)*v26;

        free(v26);
        uint64_t v12 = v27;
        if (!v27) {
          break;
        }
      }
    }
    else
    {
      unsigned int v15 = 0;
      uint64_t v14 = 0;
    }
    int64_t v29 = (void *)v9[44];
    uint64_t v30 = off_1E6AEF000;
    id v31 = [[SBModifierCacheSelectorList alloc] initWithSelectors:v14 count:v15];
    [v29 setObject:v31 forKey:a1];

    SEL v32 = &sharedInstance_onceToken_47;
    if (!staticContextSelectorsForBaseClass)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v34 = (void *)staticContextSelectorsForBaseClass;
      staticContextSelectorsForBaseClass = (uint64_t)v33;
    }
    v35 = [a1 contextProtocol];
    if (v35)
    {
      int v36 = 0;
      unsigned int v37 = 0;
      long long v38 = 0;
      while (!protocol_isEqual(v35, (Protocol *)v13[38]))
      {
        unsigned int outCount = 0;
        long long v39 = protocol_copyMethodDescriptionList(v35, 1, 1, &outCount);
        if (outCount)
        {
          long long v40 = v39;
          v37 += outCount;
          long long v38 = malloc_type_realloc(v38, 8 * v37, 0x80040B8603338uLL);
          if (outCount)
          {
            unsigned int v56 = v37;
            unint64_t v41 = 0;
            id v42 = &v40->types;
            do
            {
              v43 = *(v42 - 1);
              id v44 = *v42;
              if ([a1 instancesRespondToSelector:v43])
              {
                id v46 = [MEMORY[0x1E4F28B00] currentHandler];
                v54 = NSStringFromSelector(v43);
                [v46 handleFailureInMethod:v57, a1, @"SBChainableModifier.m", 626, @"%@: Cannot implement %@ on an implementer of +contextProtocol - it messes up the caching implementation.", a1, v54 object file lineNumber description];
              }
              v45 = (void (*)(void))SBChainableModifierMethodCacheContextTrampolineForMethod(v43, v44, (v36 + v41));
              class_addMethod((Class)a1, v43, v45, v44);
              *((void *)v38 + (v36 + v41++)) = v43;
              v42 += 2;
            }
            while (v41 < outCount);
            v36 += v41;
            id v13 = &selRef__deviceBlockedChanged_;
            uint64_t v30 = off_1E6AEF000;
            SEL v32 = &sharedInstance_onceToken_47;
            unsigned int v37 = v56;
          }
          free(v40);
        }
        unsigned int v58 = 0;
        id v47 = protocol_copyProtocolList(v35, &v58);
        if (!v58)
        {

          v35 = 0;
          break;
        }
        long long v48 = (id *)v47;
        if (v58 != 1)
        {
          long long v50 = [MEMORY[0x1E4F28B00] currentHandler];
          [v50 handleFailureInMethod:v57 object:a1 file:@"SBChainableModifier.m" lineNumber:640 description:@"Multiple sub protocols not currently supported"];
        }
        long long v49 = (Protocol *)*v48;

        free(v48);
        v35 = v49;
        if (!v49) {
          break;
        }
      }
    }
    else
    {
      long long v38 = 0;
      unsigned int v37 = 0;
    }
    long long v51 = (void *)v32[41];
    v52 = (void *)[objc_alloc(v30[125]) initWithSelectors:v38 count:v37];
    [v51 setObject:v52 forKey:a1];
  }
}

@end