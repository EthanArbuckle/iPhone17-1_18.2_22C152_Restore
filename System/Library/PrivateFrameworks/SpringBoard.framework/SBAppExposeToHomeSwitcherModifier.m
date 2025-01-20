@interface SBAppExposeToHomeSwitcherModifier
- (BOOL)_isEffectivelyHome;
- (SBAppExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 bundleIdentifier:(id)a5 appExposeModifier:(id)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)plusButtonAlpha;
- (id)_newAppExposeModifier;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
@end

@implementation SBAppExposeToHomeSwitcherModifier

- (SBAppExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 bundleIdentifier:(id)a5 appExposeModifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v25 initWithTransitionID:v11];
  if (v14)
  {
    if (!v13)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v14, @"SBAppExposeToHomeSwitcherModifier.m", 36, @"Invalid parameter not satisfying: %@", @"appExposeModifier" object file lineNumber description];
    }
    v14->_direction = a4;
    uint64_t v15 = [v12 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_appExposeModifier, a6);
    v17 = [SBRouteToAppExposeSwitcherModifier alloc];
    id v18 = [(SBAppExposeToHomeSwitcherModifier *)v14 _newAppExposeModifier];
    v19 = [(SBRouteToAppExposeSwitcherModifier *)v17 initWithTransitionID:v11 appExposeModifier:v18];

    [(SBChainableModifier *)v14 addChildModifier:v19 atLevel:0 key:0];
    v20 = [SBHomeToGridSwitcherModifier alloc];
    id v21 = [(SBAppExposeToHomeSwitcherModifier *)v14 _newAppExposeModifier];
    v22 = [(SBHomeToSwitcherSwitcherModifier *)v20 initWithTransitionID:v11 direction:a4 multitaskingModifier:v21];

    [(SBChainableModifier *)v14 addChildModifier:v22 atLevel:1 key:0];
  }

  return v14;
}

- (id)transitionWillBegin
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v23 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  v6 = [(SBAppExposeToHomeSwitcherModifier *)self appLayouts];
  v7 = [(SBTransitionSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v6];

  id v8 = [v7 firstObject];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        if (objc_msgSend(v15, "environment", (void)v19) == 1)
        {
          id v8 = v14;
          goto LABEL_11;
        }
        id v8 = v15;

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v8)
  {
    v16 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v8 alignment:0 animated:0];
    uint64_t v17 = +[SBChainableModifierEventResponse responseByAppendingResponse:v16 toResponse:v5];

    v5 = (void *)v17;
  }

  return v5;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if (!self->_direction)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

    v3 = (void *)v5;
  }
  return v3;
}

- (double)plusButtonAlpha
{
  BOOL v2 = [(SBAppExposeToHomeSwitcherModifier *)self _isEffectivelyHome];
  double result = 1.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2810000000;
  v14 = &unk_1D90ED3C6;
  __int16 v15 = 0;
  appExposeModifier = self->_appExposeModifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBAppExposeToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AF6380;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v8];
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __74__SBAppExposeToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) asyncRenderingAttributesForAppLayout:a1[5]];
  *(_WORD *)(*(void *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)_newAppExposeModifier
{
  return (id)[(SBAppExposeGridSwitcherModifier *)self->_appExposeModifier copy];
}

- (BOOL)_isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end