@interface SBRemovalDodgingModifierEvent
- (NSString)identifier;
- (SBRemovalDodgingModifierEvent)initWithIdentifier:(id)a3;
- (unint64_t)type;
@end

@implementation SBRemovalDodgingModifierEvent

- (SBRemovalDodgingModifierEvent)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemovalDodgingModifierEvent;
  v6 = [(SBRemovalDodgingModifierEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (unint64_t)type
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end