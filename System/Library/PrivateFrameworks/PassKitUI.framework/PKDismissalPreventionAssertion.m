@interface PKDismissalPreventionAssertion
- (BOOL)isInvalidated;
- (PKDismissalPreventionAssertion)initWithInvalidationHandler:(id)a3;
- (void)invalidate;
@end

@implementation PKDismissalPreventionAssertion

- (PKDismissalPreventionAssertion)initWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDismissalPreventionAssertion;
  v5 = [(PKDismissalPreventionAssertion *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_invalidated = 0;
    v7 = _Block_copy(v4);
    id invalidationHandler = v6->_invalidationHandler;
    v6->_id invalidationHandler = v7;
  }
  return v6;
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
}

@end