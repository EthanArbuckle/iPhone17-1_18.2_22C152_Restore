@interface _SBCaptureButtonRestrictionServerAssertionWrapper
- (BSInvalidatable)wrappedAssertion;
- (BSServiceConnection)associatedConnection;
- (void)setAssociatedConnection:(id)a3;
- (void)setWrappedAssertion:(id)a3;
@end

@implementation _SBCaptureButtonRestrictionServerAssertionWrapper

- (BSInvalidatable)wrappedAssertion
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedConnection);
  objc_storeStrong((id *)&self->_wrappedAssertion, 0);
}

@end