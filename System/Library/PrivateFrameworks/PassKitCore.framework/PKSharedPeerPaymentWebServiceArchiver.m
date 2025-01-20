@interface PKSharedPeerPaymentWebServiceArchiver
- (PKSharedPeerPaymentWebServiceArchiver)initWithPeerPaymentService:(id)a3;
- (void)archiveContext:(id)a3;
@end

@implementation PKSharedPeerPaymentWebServiceArchiver

- (PKSharedPeerPaymentWebServiceArchiver)initWithPeerPaymentService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharedPeerPaymentWebServiceArchiver;
  v6 = [(PKSharedPeerPaymentWebServiceArchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peerPaymentService, a3);
  }

  return v7;
}

- (void)archiveContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end