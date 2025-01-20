@interface SBInsertionDodgingModifier
- (CGPoint)initialCenter;
- (CGSize)initialSize;
- (NSString)identifier;
- (SBInsertionDodgingModifier)initWithIdentifier:(id)a3 initialCenter:(CGPoint)a4 initialSize:(CGSize)a5;
- (id)_animationDidCompleteEventName;
- (id)_modelDidUpdateEventName;
- (id)framesForIdentifiers;
- (id)handleAnimationCompletionEvent:(id)a3;
- (id)handleCustomEvent:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)modelForInvalidatedModel:(id)a3;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
- (unint64_t)phase;
- (void)setIdentifier:(id)a3;
- (void)setInitialCenter:(CGPoint)a3;
- (void)setInitialSize:(CGSize)a3;
- (void)setPhase:(unint64_t)a3;
@end

@implementation SBInsertionDodgingModifier

- (SBInsertionDodgingModifier)initWithIdentifier:(id)a3 initialCenter:(CGPoint)a4 initialSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBInsertionDodgingModifier;
  v13 = [(SBChainableModifier *)&v16 init];
  if (v13)
  {
    if (!v12)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"SBInsertionDodgingModifier.m", 33, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v13->_identifier, a3);
    v13->_initialCenter.CGFloat x = x;
    v13->_initialCenter.CGFloat y = y;
    v13->_initialSize.CGFloat width = width;
    v13->_initialSize.CGFloat height = height;
    v13->_phase = 0;
  }

  return v13;
}

- (id)handleInsertionEvent:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBInsertionDodgingModifier;
  id v5 = a3;
  v6 = [(SBDodgingModifier *)&v16 handleInsertionEvent:v5];
  identifier = self->_identifier;
  v8 = objc_msgSend(v5, "identifier", v16.receiver, v16.super_class);

  LODWORD(v5) = [(NSString *)identifier isEqual:v8];
  if (v5)
  {
    if (self->_phase)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"SBInsertionDodgingModifier.m" lineNumber:45 description:@"Phase should be possible. Is the same identifier being inserted twice?"];
    }
    self->_phase = 1;
    v9 = [[SBInvalidationDodgingModifierEventResponse alloc] initWithOptions:3];
    [(SBInvalidationDodgingModifierEventResponse *)v9 setIdentifier:self->_identifier];
    [(SBInvalidationDodgingModifierEventResponse *)v9 setDisableCoalescing:1];
    v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v6];

    v11 = [SBScheduleEventDodgingModifierEventResponse alloc];
    id v12 = [(SBInsertionDodgingModifier *)self _modelDidUpdateEventName];
    v13 = [(SBScheduleEventDodgingModifierEventResponse *)v11 initWithName:v12];

    v6 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v10];
  }
  return v6;
}

- (id)handleCustomEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBInsertionDodgingModifier;
  id v4 = a3;
  id v5 = [(SBDodgingModifier *)&v13 handleCustomEvent:v4];
  v6 = objc_msgSend(v4, "name", v13.receiver, v13.super_class);

  v7 = [(SBInsertionDodgingModifier *)self _modelDidUpdateEventName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    self->_phase = 2;
    v9 = [[SBInvalidationDodgingModifierEventResponse alloc] initWithOptions:2];
    v10 = [(SBInsertionDodgingModifier *)self _animationDidCompleteEventName];
    [(SBInvalidationDodgingModifierEventResponse *)v9 setCompletionIdentifier:v10];

    uint64_t v11 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v5];

    id v5 = (void *)v11;
  }
  return v5;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInsertionDodgingModifier;
  id v4 = a3;
  id v5 = [(SBDodgingModifier *)&v10 handleAnimationCompletionEvent:v4];
  v6 = objc_msgSend(v4, "identifier", v10.receiver, v10.super_class);

  v7 = [(SBInsertionDodgingModifier *)self _animationDidCompleteEventName];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phase == 1
    && ([v4 identifiers],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:self->_identifier],
        v6,
        (v7 & 1) == 0))
  {
    v9 = [(SBInsertionDodgingModifier *)self preferenceForIdentifier:self->_identifier];
    objc_super v10 = [v9 excludedDodgingIdentifiers];

    uint64_t v11 = [v5 identifiers];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke;
    v35[3] = &unk_1E6AF4A20;
    id v12 = v10;
    id v36 = v12;
    v31 = v11;
    objc_super v13 = objc_msgSend(v11, "bs_filter:", v35);
    v14 = [v5 identifiers];
    if ([v14 count])
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      do
      {
        v17 = [v14 objectAtIndex:v15];
        unint64_t v18 = v15 + 1;
        if ([v13 containsObject:v17]) {
          uint64_t v16 = v15 + 1;
        }

        ++v15;
      }
      while (v18 < [v14 count]);
    }
    else
    {
      uint64_t v16 = 0;
    }
    v19 = [(SBInsertionDodgingModifier *)self preferenceForIdentifier:self->_identifier];
    [v19 preferredCenter];
    uint64_t v21 = v20;
    uint64_t v23 = v22;

    v24 = [(SBInsertionDodgingModifier *)self preferenceForIdentifier:self->_identifier];
    [v24 preferredSize];
    uint64_t v26 = v25;
    uint64_t v28 = v27;

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke_2;
    v34[3] = &unk_1E6AF4A48;
    v34[4] = self;
    v34[5] = v16;
    v34[6] = v21;
    v34[7] = v23;
    v34[8] = v26;
    v34[9] = v28;
    v29 = [v5 modelByModifyingModelWithBlock:v34];
    v33.receiver = self;
    v33.super_class = (Class)SBInsertionDodgingModifier;
    int v8 = [(SBInsertionDodgingModifier *)&v33 modelForInvalidatedModel:v29];
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)SBInsertionDodgingModifier;
    int v8 = [(SBInsertionDodgingModifier *)&v32 modelForInvalidatedModel:v5];
  }

  return v8;
}

uint64_t __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIdentifier:atIndex:center:size:", *(void *)(*(void *)(a1 + 32) + 88), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)framesForIdentifiers
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBInsertionDodgingModifier;
  v3 = [(SBInsertionDodgingModifier *)&v8 framesForIdentifiers];
  if (self->_phase == 1)
  {
    SBRectWithSize();
    UIRectCenteredAboutPoint();
    identifier = self->_identifier;
    id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
    v10[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&identifier count:1];
    uint64_t v6 = objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v5);

    v3 = (void *)v6;
  }
  return v3;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phase == 1 && ([v4 isEqual:self->_identifier] & 1) != 0) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 3;
  }

  return v6;
}

- (id)_modelDidUpdateEventName
{
  return (id)[NSString stringWithFormat:@"InsertionDidUpdateModel-%p-%@", self->_identifier, self->_identifier];
}

- (id)_animationDidCompleteEventName
{
  return (id)[NSString stringWithFormat:@"InsertionAnimationDidComplete-%p-%@", self->_identifier, self->_identifier];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGPoint)initialCenter
{
  double x = self->_initialCenter.x;
  double y = self->_initialCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCenter:(CGPoint)a3
{
  self->_initialCenter = a3;
}

- (CGSize)initialSize
{
  double width = self->_initialSize.width;
  double height = self->_initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void).cxx_destruct
{
}

@end