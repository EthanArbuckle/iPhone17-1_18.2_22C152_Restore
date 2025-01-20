@interface PKPaymentAuthorizationInterfaceConfiguration
- (NSString)relevantPassID;
- (PKPaymentAuthorizationHostProtocol)host;
- (PKPaymentAuthorizationInterfaceConfiguration)initWithRelevantPassID:(id)a3 presenter:(id)a4 host:(id)a5 supportedOrientations:(unint64_t)a6;
- (PKPaymentAuthorizationPresenter)presenter;
- (unint64_t)supportedOrientations;
@end

@implementation PKPaymentAuthorizationInterfaceConfiguration

- (PKPaymentAuthorizationInterfaceConfiguration)initWithRelevantPassID:(id)a3 presenter:(id)a4 host:(id)a5 supportedOrientations:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentAuthorizationInterfaceConfiguration;
  v14 = [(PKPaymentAuthorizationInterfaceConfiguration *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_relevantPassID, a3);
    objc_storeStrong((id *)&v15->_presenter, a4);
    objc_storeStrong((id *)&v15->_host, a5);
    v15->_supportedOrientations = a6;
  }

  return v15;
}

- (NSString)relevantPassID
{
  return self->_relevantPassID;
}

- (PKPaymentAuthorizationPresenter)presenter
{
  return self->_presenter;
}

- (PKPaymentAuthorizationHostProtocol)host
{
  return self->_host;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_relevantPassID, 0);
}

@end