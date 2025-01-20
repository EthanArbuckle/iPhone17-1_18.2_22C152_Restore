@interface _UIVisualEffectViewTransitioningEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (BOOL)shouldAnimateProperty:(id)a3;
- (_UIVisualEffectViewTransitioningEntry)initWithSourceEntry:(id)a3 destinationEntry:(id)a4;
- (id)copyForTransitionOut;
- (id)copyForTransitionToEffect:(id)a3;
- (id)description;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UIVisualEffectViewTransitioningEntry

- (_UIVisualEffectViewTransitioningEntry)initWithSourceEntry:(id)a3 destinationEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIVisualEffectViewTransitioningEntry;
  v9 = [(_UIVisualEffectViewTransitioningEntry *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceEntry, a3);
    objc_storeStrong((id *)&v10->_destinationEntry, a4);
    uint64_t v11 = [(_UIVisualEffectViewEntry *)v10->_sourceEntry requirements];
    uint64_t v12 = [(_UIVisualEffectViewEntry *)v10->_destinationEntry requirements];
    if (v11 == v12 || v12 == 0) {
      goto LABEL_8;
    }
    if (!v11)
    {
      uint64_t v11 = v12;
LABEL_8:
      [(_UIVisualEffectViewEntry *)v10 setRequirements:v11];
    }
  }

  return v10;
}

- (BOOL)shouldAnimateProperty:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIVisualEffectViewEntry *)self->_sourceEntry shouldAnimateProperty:v4]
    || [(_UIVisualEffectViewEntry *)self->_destinationEntry shouldAnimateProperty:v4];

  return v5;
}

- (void)addEffectToView:(id)a3
{
}

- (void)applyIdentityEffectToView:(id)a3
{
}

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  return 0;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 0;
}

- (id)copyForTransitionToEffect:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIVisualEffectModel.m" lineNumber:307 description:@"Logic error: attempt to transition from a transitioning helper effect."];

  return 0;
}

- (id)copyForTransitionOut
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIVisualEffectModel.m" lineNumber:313 description:@"Logic error: attempt to transition from a transitioning helper effect."];

  return 0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewTransitioningEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" source=%@ destination=%@", self->_sourceEntry, self->_destinationEntry];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationEntry, 0);
  objc_storeStrong((id *)&self->_sourceEntry, 0);
}

@end