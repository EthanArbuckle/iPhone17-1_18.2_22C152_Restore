@interface SBFAuthenticationAssertion
- (BOOL)isValid;
- (NSString)description;
- (NSString)identifier;
- (SBFAuthenticationAssertion)initWithIdentifier:(id)a3 type:(int64_t)a4 withController:(id)a5;
- (SBFUserAuthenticationController)controller;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBFAuthenticationAssertion

- (SBFAuthenticationAssertion)initWithIdentifier:(id)a3 type:(int64_t)a4 withController:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (a4)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBFAuthenticationAssertion.m", 40, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SBFAuthenticationAssertion.m", 39, @"Invalid parameter not satisfying: %@", @"type != SBFAuthenticationAssertionTypeUndefined" object file lineNumber description];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBFAuthenticationAssertion.m", 41, @"Invalid parameter not satisfying: %@", @"controller != nil" object file lineNumber description];

LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)SBFAuthenticationAssertion;
  v11 = [(SBFAuthenticationAssertion *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_type = a4;
    objc_storeWeak((id *)&v11->_controller, v10);
  }

  return v11;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = v4;
    unint64_t type = self->_type;
    if (type > 2) {
      v7 = @"(unknown)";
    }
    else {
      v7 = off_1E548D1D0[type];
    }
    [v4 handleFailureInMethod:a2, self, @"SBFAuthenticationAssertion.m", 53, @"the assertion must be invalidated before it can be dealloced : (%@) %@", v7, self->_identifier object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)SBFAuthenticationAssertion;
  [(SBFAuthenticationAssertion *)&v8 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBFAuthenticationAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFAuthenticationAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"reason"];
  unint64_t type = self->_type;
  if (type > 2) {
    v6 = @"(unknown)";
  }
  else {
    v6 = off_1E548D1D0[type];
  }
  [v3 appendString:v6 withName:@"type"];
  if (self->_activated)
  {
    id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFAuthenticationAssertion isValid](self, "isValid"), @"valid");
    if (self->_activationDate)
    {
      objc_super v8 = [MEMORY[0x1E4F4F708] sharedInstance];
      id v9 = [v8 formatDateAsLongYMDHMSZPosixLocaleWithDate:self->_activationDate];
      [v3 appendString:v9 withName:@"activationDate"];
    }
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBFAuthenticationAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)isValid
{
  if (!self->_activated || self->_invalidated) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v5 = [WeakRetained _isAssertionValid:self];

  return v5;
}

- (void)activate
{
  if (!self->_activated && !self->_invalidated)
  {
    self->_activated = 1;
    v3 = [MEMORY[0x1E4F1C9C8] date];
    activationDate = self->_activationDate;
    self->_activationDate = v3;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained _addAuthenticationAssertion:self];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_activated)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      [WeakRetained _removeAuthenticationAssertion:self];
    }
    objc_storeWeak((id *)&self->_controller, 0);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SBFUserAuthenticationController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (SBFUserAuthenticationController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
}

@end