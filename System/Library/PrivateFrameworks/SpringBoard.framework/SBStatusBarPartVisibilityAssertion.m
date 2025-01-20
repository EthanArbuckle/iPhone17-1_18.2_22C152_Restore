@interface SBStatusBarPartVisibilityAssertion
- (BOOL)isHidingStatusBarPartWithIdentifier:(id)a3;
- (SBStatusBarPartVisibilityAssertion)initWithIdentifier:(id)a3 statusBar:(id)a4 forReason:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5;
- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5;
- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5;
@end

@implementation SBStatusBarPartVisibilityAssertion

- (SBStatusBarPartVisibilityAssertion)initWithIdentifier:(id)a3 statusBar:(id)a4 forReason:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBStatusBarPartVisibilityAssertion;
  v10 = [(BSSimpleAssertion *)&v15 initWithIdentifier:a3 forReason:a5 invalidationBlock:&__block_literal_global_77];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_statusBar, a4);
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    hiddenParts = v11->_hiddenParts;
    v11->_hiddenParts = (NSMutableSet *)v12;
  }
  return v11;
}

void __77__SBStatusBarPartVisibilityAssertion_initWithIdentifier_statusBar_forReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[7];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "_setStatusBarPartWithIdentifier:hidden:animatedWithDuration:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), 0, 0.0, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isHidingStatusBarPartWithIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_hiddenParts containsObject:a3];
}

- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5
{
  double v5 = 0.35;
  if (!a5) {
    double v5 = 0.0;
  }
  [(SBStatusBarPartVisibilityAssertion *)self setStatusBarPartWithIdentifier:a3 hidden:a4 animatedWithDuration:v5];
}

- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  if (-[SBStatusBarPartVisibilityAssertion isHidingStatusBarPartWithIdentifier:](self, "isHidingStatusBarPartWithIdentifier:") != v6)
  {
    hiddenParts = self->_hiddenParts;
    if (v6)
    {
      uint64_t v9 = (void *)[v10 copy];
      [(NSMutableSet *)hiddenParts addObject:v9];
    }
    else
    {
      [(NSMutableSet *)self->_hiddenParts removeObject:v10];
    }
    [(SBStatusBarPartVisibilityAssertion *)self _setStatusBarPartWithIdentifier:v10 hidden:v6 animatedWithDuration:a5];
  }
}

- (id)succinctDescription
{
  id v2 = [(SBStatusBarPartVisibilityAssertion *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(NSMutableSet *)self->_hiddenParts allObjects];
  double v5 = [v4 componentsJoinedByString:@", "];
  [v3 appendString:v5 withName:@"hiddenParts" skipIfEmpty:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBStatusBarPartVisibilityAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBStatusBarPartVisibilityAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBStatusBarPartVisibilityAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __76__SBStatusBarPartVisibilityAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"statusBar"];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 appendString:v4 withName:@"identifier"];

  double v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) reason];
  [v5 appendString:v6 withName:@"reason"];
}

- (void)_setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5 <= 0.0)
  {
    __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke((uint64_t)v8, self->_statusBar, v8, v6);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke_2;
    v11[3] = &unk_1E6AFBFC8;
    id v13 = &__block_literal_global_19_0;
    v11[4] = self;
    id v12 = v8;
    BOOL v14 = v6;
    [v10 animateWithDuration:v11 animations:0 completion:a5];
  }
}

void __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v14 = a2;
  id v6 = a3;
  id v7 = [v14 disabledPartIdentifiers];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C978] array];
  }
  id v10 = v9;

  int v11 = [v10 containsObject:v6];
  if (a4)
  {
    if (v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v10 arrayByAddingObject:v6];
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = objc_msgSend(v10, "sb_arrayByRemovingObject:", v6);
  }
  id v13 = (void *)v12;
  [v14 setDisabledPartIdentifiers:v12];

LABEL_10:
}

uint64_t __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 48), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenParts, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end