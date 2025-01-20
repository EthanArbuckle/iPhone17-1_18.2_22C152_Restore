@interface TRAArbitrationKeyboardInputs
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTraitsArbitrationKeyboardInputs:(id)a3;
- (NSString)focusedParticipantUniqueIdentifier;
- (TRAArbitrationKeyboardInputs)initWithKeyboardFocusedParticipantUniqueIdentifier:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation TRAArbitrationKeyboardInputs

- (TRAArbitrationKeyboardInputs)initWithKeyboardFocusedParticipantUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAArbitrationKeyboardInputs;
  v5 = [(TRAArbitrationKeyboardInputs *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    focusedParticipantUniqueIdentifier = v5->_focusedParticipantUniqueIdentifier;
    v5->_focusedParticipantUniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqualToTraitsArbitrationKeyboardInputs:(id)a3
{
  v5 = (TRAArbitrationKeyboardInputs *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"TRAArbitration.m", 589, @"Invalid parameter not satisfying: %@", @"inputs == nil || [inputs isKindOfClass:[TRAArbitrationKeyboardInputs class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      char v8 = 1;
    }
    else
    {
      focusedParticipantUniqueIdentifier = self->_focusedParticipantUniqueIdentifier;
      v7 = [(TRAArbitrationKeyboardInputs *)v5 focusedParticipantUniqueIdentifier];
      char v8 = [(NSString *)focusedParticipantUniqueIdentifier isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRAArbitrationKeyboardInputs *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAArbitrationKeyboardInputs *)self isEqualToTraitsArbitrationKeyboardInputs:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationKeyboardInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_focusedParticipantUniqueIdentifier withName:@"focusedParticipantUniqueIdentifier"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbitrationKeyboardInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)focusedParticipantUniqueIdentifier
{
  return self->_focusedParticipantUniqueIdentifier;
}

- (void).cxx_destruct
{
}

@end