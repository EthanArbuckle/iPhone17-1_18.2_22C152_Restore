@interface PKRemoteNetworkPaymentCoordinator
- (PKRemoteNetworkPaymentCoordinator)init;
- (PKRemoteNetworkPaymentCoordinatorDelegate)delegate;
- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4;
- (void)handleRemoteNetworkPaymentCoordinatorComplete;
- (void)handleRemoteNetworkPaymentCoordinatorDidPresentPaymentSheet:(BOOL)a3;
- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5;
- (void)setDelegate:(id)a3;
@end

@implementation PKRemoteNetworkPaymentCoordinator

- (PKRemoteNetworkPaymentCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKRemoteNetworkPaymentCoordinator;
  v2 = [(PKRemoteNetworkPaymentCoordinator *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_PKRemoteNetworkPaymentCoordinator);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    [(_PKRemoteNetworkPaymentCoordinator *)v2->_underlying setWrapper:v2];
  }
  return v2;
}

- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4
{
}

- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5
{
}

- (void)handleRemoteNetworkPaymentCoordinatorComplete
{
  v3 = [(PKRemoteNetworkPaymentCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKRemoteNetworkPaymentCoordinator *)self delegate];
    [v5 remoteNetworkPaymentCoordinatorDidComplete:self];
  }
}

- (void)handleRemoteNetworkPaymentCoordinatorDidPresentPaymentSheet:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKRemoteNetworkPaymentCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PKRemoteNetworkPaymentCoordinator *)self delegate];
    [v7 remoteNetworkPaymentCoordinator:self didPresentPaymentSheet:v3];
  }
}

- (PKRemoteNetworkPaymentCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKRemoteNetworkPaymentCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end