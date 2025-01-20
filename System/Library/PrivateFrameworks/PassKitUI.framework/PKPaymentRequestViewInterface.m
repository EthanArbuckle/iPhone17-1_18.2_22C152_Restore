@interface PKPaymentRequestViewInterface
- (PKPaymentRequestViewInterface)initWithConfiguration:(id)a3 delegate:(id)a4;
- (_TtC9PassKitUI27PaymentRequestViewInterface)wrappedInterface;
- (id)serviceDelegate;
- (id)viewController;
- (void)invalidate;
- (void)setWrappedInterface:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PKPaymentRequestViewInterface

- (PKPaymentRequestViewInterface)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRequestViewInterface;
  v8 = [(PKPaymentRequestViewInterface *)&v13 init];
  if (v8
    && (+[PaymentRequestViewInterfaceFactory interfaceForConfiguration:v6 withDelegate:v7], uint64_t v9 = objc_claimAutoreleasedReturnValue(), wrappedInterface = v8->_wrappedInterface, v8->_wrappedInterface = (_TtC9PassKitUI27PaymentRequestViewInterface *)v9, wrappedInterface, !v8->_wrappedInterface))
  {
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)viewController
{
  return [(PaymentRequestViewInterface *)self->_wrappedInterface viewController];
}

- (id)serviceDelegate
{
  return [(PaymentRequestViewInterface *)self->_wrappedInterface serviceDelegate];
}

- (void)start
{
}

- (void)stop
{
}

- (void)invalidate
{
}

- (_TtC9PassKitUI27PaymentRequestViewInterface)wrappedInterface
{
  return self->_wrappedInterface;
}

- (void)setWrappedInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end