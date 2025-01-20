@interface SBPreferenceChangeDodgingModifierEvent
- (NSString)identifier;
- (SBPreferenceChangeDodgingModifierEvent)initWithIdentifier:(id)a3 phase:(unint64_t)a4 style:(unint64_t)a5;
- (unint64_t)phase;
- (unint64_t)style;
- (unint64_t)type;
@end

@implementation SBPreferenceChangeDodgingModifierEvent

- (SBPreferenceChangeDodgingModifierEvent)initWithIdentifier:(id)a3 phase:(unint64_t)a4 style:(unint64_t)a5
{
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBPreferenceChangeDodgingModifierEvent;
  v11 = [(SBPreferenceChangeDodgingModifierEvent *)&v14 init];
  if (v11)
  {
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v11, @"SBPreferenceChangeDodgingModifierEvent.m", 16, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v11->_identifier, a3);
    v11->_phase = a4;
    v11->_style = a5;
  }

  return v11;
}

- (unint64_t)type
{
  return 5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end