@interface PKRemoteNetworkPaymentLoadingViewInterface
- (PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4;
- (UIViewController)primaryViewController;
- (id)serviceDelegate;
- (void)didAppear;
@end

@implementation PKRemoteNetworkPaymentLoadingViewInterface

- (PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteNetworkPaymentLoadingViewInterface;
  v8 = [(PKRemoteNetworkPaymentLoadingViewInterface *)&v12 init];
  if (v8)
  {
    v9 = [[_PKRemoteNetworkPaymentLoadingViewInterface alloc] initWithContext:v6 configuration:v7];
    underlying = v8->_underlying;
    v8->_underlying = v9;
  }
  return v8;
}

- (UIViewController)primaryViewController
{
  return [(_PKRemoteNetworkPaymentLoadingViewInterface *)self->_underlying primaryViewController];
}

- (id)serviceDelegate
{
  return [(_PKRemoteNetworkPaymentLoadingViewInterface *)self->_underlying serviceDelegate];
}

- (void)didAppear
{
}

- (void).cxx_destruct
{
}

@end