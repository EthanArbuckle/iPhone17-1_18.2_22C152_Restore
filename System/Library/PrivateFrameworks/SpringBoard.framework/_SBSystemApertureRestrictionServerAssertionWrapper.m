@interface _SBSystemApertureRestrictionServerAssertionWrapper
- (BSServiceConnection)associatedConnection;
- (NSString)invalidationReason;
- (SAInvalidatable)wrappedAssertion;
- (void)setAssociatedConnection:(id)a3;
- (void)setInvalidationReason:(id)a3;
- (void)setWrappedAssertion:(id)a3;
@end

@implementation _SBSystemApertureRestrictionServerAssertionWrapper

- (NSString)invalidationReason
{
  if (self->_invalidationReason) {
    return self->_invalidationReason;
  }
  else {
    return (NSString *)@"unspecified";
  }
}

- (SAInvalidatable)wrappedAssertion
{
  return self->_wrappedAssertion;
}

- (void)setWrappedAssertion:(id)a3
{
}

- (BSServiceConnection)associatedConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedConnection);
  return (BSServiceConnection *)WeakRetained;
}

- (void)setAssociatedConnection:(id)a3
{
}

- (void)setInvalidationReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_destroyWeak((id *)&self->_associatedConnection);
  objc_storeStrong((id *)&self->_wrappedAssertion, 0);
}

@end