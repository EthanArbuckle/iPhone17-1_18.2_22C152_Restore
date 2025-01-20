@interface SBRotationDodgingModifierEvent
- (NSUUID)identifier;
- (SBRotationDodgingModifierEvent)initWithIdentifier:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 phase:(unint64_t)a6;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (unint64_t)phase;
- (unint64_t)type;
@end

@implementation SBRotationDodgingModifierEvent

- (SBRotationDodgingModifierEvent)initWithIdentifier:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 phase:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBRotationDodgingModifierEvent;
  v12 = [(SBRotationDodgingModifierEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_fromOrientation = a4;
    v13->_toOrientation = a5;
    v13->_phase = a6;
  }

  return v13;
}

- (unint64_t)type
{
  return 4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
}

@end