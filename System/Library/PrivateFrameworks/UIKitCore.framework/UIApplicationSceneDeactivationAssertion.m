@interface UIApplicationSceneDeactivationAssertion
- (BOOL)isAcquired;
- (NSString)description;
- (UIApplicationSceneDeactivationAssertion)initWithReason:(int64_t)a3 manager:(id)a4;
- (UIApplicationSceneDeactivationManager)manager;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)predicate;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)reason;
- (void)acquire;
- (void)acquireWithPredicate:(id)a3 transitionContext:(id)a4;
- (void)dealloc;
- (void)relinquish;
@end

@implementation UIApplicationSceneDeactivationAssertion

- (NSString)description
{
  return (NSString *)[(UIApplicationSceneDeactivationAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)dealloc
{
  [(UIApplicationSceneDeactivationAssertion *)self relinquish];
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationSceneDeactivationAssertion;
  [(UIApplicationSceneDeactivationAssertion *)&v3 dealloc];
}

- (void)relinquish
{
  if (self->_acquired)
  {
    self->_acquired = 0;
    id predicate = self->_predicate;
    self->_id predicate = 0;

    id v4 = [(UIApplicationSceneDeactivationAssertion *)self manager];
    [v4 removeAssertion:self];
  }
}

- (void)acquireWithPredicate:(id)a3 transitionContext:(id)a4
{
  if (!self->_acquired)
  {
    self->_acquired = 1;
    id v6 = a4;
    v7 = (void *)[a3 copy];
    id predicate = self->_predicate;
    self->_id predicate = v7;

    id v9 = [(UIApplicationSceneDeactivationAssertion *)self manager];
    [v9 addAssertion:self withTransitionContext:v6];
  }
}

- (UIApplicationSceneDeactivationManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (UIApplicationSceneDeactivationManager *)WeakRetained;
}

- (int64_t)reason
{
  return self->_reason;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong(&self->_predicate, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(UIApplicationSceneDeactivationAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = UIApplicationSceneDeactivationReasonDescription(self->_reason);
  id v5 = (id)[v3 appendObject:v4 withName:@"reason"];

  id v6 = (id)[v3 appendObject:@"all scene levels" withName:0];
  id v7 = (id)[v3 appendBool:self->_predicate != 0 withName:@"hasPredicate"];
  return v3;
}

- (UIApplicationSceneDeactivationAssertion)initWithReason:(int64_t)a3 manager:(id)a4
{
  id v7 = a4;
  if ((unint64_t)a3 >= 0x13 && a3 != 30)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIApplicationSceneDeactivationAssertion.m", 24, @"Invalid parameter not satisfying: %@", @"UIApplicationSceneDeactivationReasonIsValid(reason)" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)UIApplicationSceneDeactivationAssertion;
  v8 = [(UIApplicationSceneDeactivationAssertion *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    v8->_reason = a3;
    objc_storeWeak((id *)&v8->_manager, v7);
  }

  return v9;
}

- (void)acquire
{
}

- (id)succinctDescription
{
  v2 = [(UIApplicationSceneDeactivationAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

@end