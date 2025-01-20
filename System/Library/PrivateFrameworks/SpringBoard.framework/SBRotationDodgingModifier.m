@interface SBRotationDodgingModifier
- (NSUUID)identifier;
- (SBRotationDodgingModifier)initWithIdentifier:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5;
- (id)handleRotationEvent:(id)a3;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (unint64_t)phase;
- (void)setFromOrientation:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setToOrientation:(int64_t)a3;
@end

@implementation SBRotationDodgingModifier

- (SBRotationDodgingModifier)initWithIdentifier:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRotationDodgingModifier;
  v10 = [(SBChainableModifier *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v11->_fromOrientation = a4;
    v11->_toOrientation = a5;
  }

  return v11;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 1;
}

- (id)handleRotationEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRotationDodgingModifier;
  v5 = [(SBDodgingModifier *)&v12 handleRotationEvent:v4];
  v6 = [v4 identifier];
  int v7 = [v6 isEqual:self->_identifier];

  if (v7)
  {
    unint64_t v8 = [v4 phase];
    self->_phase = v8;
    if (v8 == 2)
    {
      [(SBChainableModifier *)self setState:1];
    }
    else if (v8 == 1)
    {
      id v9 = [[SBInvalidationDodgingModifierEventResponse alloc] initWithOptions:3];
      uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v5];

      v5 = (void *)v10;
    }
  }

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
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