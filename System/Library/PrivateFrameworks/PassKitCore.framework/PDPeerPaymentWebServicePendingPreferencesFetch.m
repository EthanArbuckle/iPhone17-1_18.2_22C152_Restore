@interface PDPeerPaymentWebServicePendingPreferencesFetch
- (PDPeerPaymentWebServicePendingPreferencesFetch)initWithCompletionHandler:(id)a3;
- (id)completionHandler;
@end

@implementation PDPeerPaymentWebServicePendingPreferencesFetch

- (PDPeerPaymentWebServicePendingPreferencesFetch)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentWebServicePendingPreferencesFetch;
  v5 = [(PDPeerPaymentWebServicePendingPreferencesFetch *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = v6;
  }
  return v5;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end