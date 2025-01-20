@interface SBPreferenceChangeDodgingModifier
- (BOOL)isResigningLifecycleManagement;
- (SBPreferenceChangeDodgingModifier)initWithIdentifier:(id)a3 animated:(BOOL)a4;
- (id)handleAnimationCompletionEvent:(id)a3;
- (id)handlePreferenceChangeEvent:(id)a3;
- (id)modelForInvalidatedModel:(id)a3;
- (id)zOrderedIdentifiers;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
- (void)setBoostUpdatedIdentifier:(BOOL)a3;
- (void)setResignLifecycleManagement:(BOOL)a3;
@end

@implementation SBPreferenceChangeDodgingModifier

- (SBPreferenceChangeDodgingModifier)initWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPreferenceChangeDodgingModifier;
  v8 = [(SBChainableModifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_animated = a4;
  }

  return v9;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBPreferenceChangeDodgingModifier;
  v5 = [(SBDodgingModifier *)&v13 handlePreferenceChangeEvent:v4];
  identifier = self->_identifier;
  id v7 = [v4 identifier];
  LODWORD(identifier) = [(NSString *)identifier isEqual:v7];

  if (identifier)
  {
    unint64_t v8 = [v4 phase];
    self->_phase = v8;
    if (v8 == 1)
    {
      v9 = +[SBInvalidationDodgingModifierEventResponse responseWithOptions:3];
      v10 = v9;
      if (self->_animated)
      {
        [v9 setCompletionIdentifier:self->_identifier];
      }
      else if (![(SBPreferenceChangeDodgingModifier *)self isResigningLifecycleManagement])
      {
        [(SBChainableModifier *)self setState:1];
      }
      uint64_t v11 = +[SBChainableModifierEventResponse responseByAppendingResponse:v10 toResponse:v5];

      v5 = (void *)v11;
    }
  }

  return v5;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBPreferenceChangeDodgingModifier;
  id v4 = a3;
  v5 = [(SBDodgingModifier *)&v9 handleAnimationCompletionEvent:v4];
  v6 = objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);

  if ([v6 isEqualToString:self->_identifier])
  {
    BOOL v7 = [(SBPreferenceChangeDodgingModifier *)self isResigningLifecycleManagement];

    if (!v7) {
      [(SBChainableModifier *)self setState:1];
    }
  }
  else
  {
  }
  return v5;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifiers];
  v6 = [(SBPreferenceChangeDodgingModifier *)self preferenceForIdentifier:self->_identifier];
  BOOL v7 = [v6 excludedDodgingIdentifiers];

  uint64_t v8 = 0;
  if ([v5 count])
  {
    while (1)
    {
      objc_super v9 = [v5 objectAtIndex:v8];
      v10 = [(SBPreferenceChangeDodgingModifier *)self preferenceForIdentifier:v9];
      uint64_t v11 = [v10 excludedDodgingIdentifiers];

      if (([v11 containsObject:self->_identifier] & 1) == 0
        && (self->_boostUpdatedIdentifier
         || ([v9 isEqual:self->_identifier] & 1) != 0
         || [v7 containsObject:v9]))
      {
        break;
      }

      if (++v8 >= (unint64_t)[v5 count]) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__SBPreferenceChangeDodgingModifier_modelForInvalidatedModel___block_invoke;
  v16[3] = &unk_1E6B004B8;
  v16[4] = self;
  v16[5] = v8;
  v12 = [v4 modelByModifyingModelWithBlock:v16];
  v15.receiver = self;
  v15.super_class = (Class)SBPreferenceChangeDodgingModifier;
  objc_super v13 = [(SBPreferenceChangeDodgingModifier *)&v15 modelForInvalidatedModel:v12];

  return v13;
}

uint64_t __62__SBPreferenceChangeDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIndex:*(void *)(a1 + 40) forIdentifier:*(void *)(*(void *)(a1 + 32) + 88)];
}

- (id)zOrderedIdentifiers
{
  if (self->_animated)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPreferenceChangeDodgingModifier;
    v3 = [(SBPreferenceChangeDodgingModifier *)&v9 zOrderedIdentifiers];
    id v4 = (void *)[v3 mutableCopy];

    uint64_t v5 = [v4 indexOfObject:self->_identifier];
    v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
    [v4 moveObjectsAtIndexes:v6 toIndex:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPreferenceChangeDodgingModifier;
    id v4 = [(SBPreferenceChangeDodgingModifier *)&v8 zOrderedIdentifiers];
  }
  return v4;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  if (self->_animated) {
    return 3;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPreferenceChangeDodgingModifier;
  return [(SBPreferenceChangeDodgingModifier *)&v4 animationBehaviorModeForIdentifier:a3];
}

- (BOOL)isResigningLifecycleManagement
{
  return self->_boostUpdatedIdentifier;
}

- (void)setResignLifecycleManagement:(BOOL)a3
{
  self->_resignLifecycleManagement = a3;
}

- (void)setBoostUpdatedIdentifier:(BOOL)a3
{
  self->_boostUpdatedIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end