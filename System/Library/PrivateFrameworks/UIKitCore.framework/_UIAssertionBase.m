@interface _UIAssertionBase
- (BOOL)initialState;
- (BOOL)invalidated;
- (BOOL)requiresExplicitInvalidation;
- (NSString)description;
- (NSString)reason;
- (_UIAssertionController)parentController;
- (id)_initWithType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6;
- (unint64_t)type;
- (void)_invalidate;
- (void)dealloc;
- (void)setParentController:(id)a3;
@end

@implementation _UIAssertionBase

- (id)_initWithType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIAssertionBase;
  v11 = [(_UIAssertionBase *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    uint64_t v13 = [v10 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v12->_initialState = a4;
    v12->_requiresExplicitInvalidation = a6;
  }

  return v12;
}

- (void)_invalidate
{
  if (self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIAssertionController.m", 56, @"Tried to invalidate an assertion that is already invalid. %@", self object file lineNumber description];
  }
  self->_invalidated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  [WeakRetained _endTrackingAssertion:self];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p %lux %@>", v5, self, self->_type, self->_reason];

  return (NSString *)v6;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    if (self->_requiresExplicitInvalidation)
    {
      id WeakRetained = [MEMORY[0x1E4F28B00] currentHandler];
      [WeakRetained handleFailureInMethod:a2, self, @"_UIAssertionController.m", 70, @"Assertion deallocated before it was invalidated. %@", self object file lineNumber description];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
      [WeakRetained _endTrackingAssertion:self];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAssertionBase;
  [(_UIAssertionBase *)&v5 dealloc];
}

- (BOOL)initialState
{
  return self->_initialState;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)reason
{
  return self->_reason;
}

- (_UIAssertionController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return (_UIAssertionController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (BOOL)requiresExplicitInvalidation
{
  return self->_requiresExplicitInvalidation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end