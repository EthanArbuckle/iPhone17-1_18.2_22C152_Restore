@interface _UIVisualEffectViewReversingEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (BOOL)shouldAnimateProperty:(id)a3;
- (_UIVisualEffectViewReversingEntry)initWithViewEntry:(id)a3;
- (id)copyForTransitionOut;
- (id)copyForTransitionToEffect:(id)a3;
- (id)description;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UIVisualEffectViewReversingEntry

- (_UIVisualEffectViewReversingEntry)initWithViewEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectViewReversingEntry;
  v6 = [(_UIVisualEffectViewReversingEntry *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceEntry, a3);
    [(_UIVisualEffectViewEntry *)v7 setRequirements:[(_UIVisualEffectViewEntry *)v7->_sourceEntry requirements]];
  }

  return v7;
}

- (BOOL)shouldAnimateProperty:(id)a3
{
  return [(_UIVisualEffectViewEntry *)self->_sourceEntry shouldAnimateProperty:a3];
}

- (void)addEffectToView:(id)a3
{
}

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)applyIdentityEffectToView:(id)a3
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
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIVisualEffectModel.m" lineNumber:229 description:@"Logic error: attempt to transition from a transitioning helper effect."];

  return 0;
}

- (id)copyForTransitionOut
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIVisualEffectModel.m" lineNumber:235 description:@"Logic error: attempt to transition from a transitioning helper effect."];

  return 0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewReversingEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" source=%@", self->_sourceEntry];

  return v4;
}

- (void).cxx_destruct
{
}

@end