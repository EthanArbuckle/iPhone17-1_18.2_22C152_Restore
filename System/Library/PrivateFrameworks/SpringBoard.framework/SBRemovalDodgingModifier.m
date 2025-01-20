@interface SBRemovalDodgingModifier
- (NSString)identifier;
- (NSUUID)completionIdentifier;
- (SBRemovalDodgingModifier)initWithIdentifier:(id)a3;
- (id)handleAnimationCompletionEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)modelForInvalidatedModel:(id)a3;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
- (void)setCompletionIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SBRemovalDodgingModifier

- (SBRemovalDodgingModifier)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemovalDodgingModifier;
  v6 = [(SBChainableModifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifiers];
  int v6 = [v5 containsObject:self->_identifier];

  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__SBRemovalDodgingModifier_modelForInvalidatedModel___block_invoke;
    v12[3] = &unk_1E6AF9300;
    v12[4] = self;
    v7 = [v4 modelByModifyingModelWithBlock:v12];

    v11.receiver = self;
    v11.super_class = (Class)SBRemovalDodgingModifier;
    v8 = [(SBRemovalDodgingModifier *)&v11 modelForInvalidatedModel:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBRemovalDodgingModifier;
    v8 = [(SBRemovalDodgingModifier *)&v10 modelForInvalidatedModel:v4];
  }
  return v8;
}

uint64_t __53__SBRemovalDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeIdentifier:*(void *)(*(void *)(a1 + 32) + 88)];
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 3;
}

- (id)handleRemovalEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBRemovalDodgingModifier;
  id v4 = a3;
  id v5 = [(SBDodgingModifier *)&v13 handleRemovalEvent:v4];
  objc_msgSend(v4, "identifier", v13.receiver, v13.super_class);
  int v6 = (SBInvalidationDodgingModifierEventResponse *)objc_claimAutoreleasedReturnValue();

  if ([(SBInvalidationDodgingModifierEventResponse *)v6 isEqual:self->_identifier])
  {
    completionIdentifier = self->_completionIdentifier;

    if (completionIdentifier) {
      goto LABEL_5;
    }
    int v6 = [[SBInvalidationDodgingModifierEventResponse alloc] initWithOptions:3];
    v8 = [MEMORY[0x1E4F29128] UUID];
    objc_super v9 = self->_completionIdentifier;
    self->_completionIdentifier = v8;

    objc_super v10 = [(NSUUID *)self->_completionIdentifier UUIDString];
    [(SBInvalidationDodgingModifierEventResponse *)v6 setCompletionIdentifier:v10];

    uint64_t v11 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];

    id v5 = (void *)v11;
  }

LABEL_5:
  return v5;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRemovalDodgingModifier;
  id v5 = [(SBDodgingModifier *)&v10 handleAnimationCompletionEvent:v4];
  if (self->_completionIdentifier)
  {
    int v6 = [v4 identifier];
    v7 = [(NSUUID *)self->_completionIdentifier UUIDString];
    int v8 = [v6 isEqualToString:v7];

    if (v8) {
      [(SBChainableModifier *)self setState:1];
    }
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)completionIdentifier
{
  return self->_completionIdentifier;
}

- (void)setCompletionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end