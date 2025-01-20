@interface NFPeerPaymentRequest
+ (BOOL)supportsSecureCoding;
- (NFECommercePaymentRequest)topUpRequest;
- (NFPeerPaymentRequest)initWithCoder:(id)a3;
- (NFPeerPaymentRequest)initWithDictionary:(id)a3;
- (NFPeerPaymentTransferRequest)transferRequest;
- (void)encodeWithCoder:(id)a3;
- (void)setTopUpRequest:(id)a3;
- (void)setTransferRequest:(id)a3;
@end

@implementation NFPeerPaymentRequest

- (NFPeerPaymentRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentRequest;
  v5 = [(NFPeerPaymentRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"topUpRequest"];
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (NFECommercePaymentRequest *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"transferRequest"];
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (NFPeerPaymentTransferRequest *)v8;
  }
  return v5;
}

- (NFPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentRequest;
  v5 = [(NFPeerPaymentRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topUpRequest"];
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (NFECommercePaymentRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferRequest"];
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (NFPeerPaymentTransferRequest *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  topUpRequest = self->_topUpRequest;
  id v5 = a3;
  [v5 encodeObject:topUpRequest forKey:@"topUpRequest"];
  [v5 encodeObject:self->_transferRequest forKey:@"transferRequest"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFECommercePaymentRequest)topUpRequest
{
  return self->_topUpRequest;
}

- (void)setTopUpRequest:(id)a3
{
}

- (NFPeerPaymentTransferRequest)transferRequest
{
  return self->_transferRequest;
}

- (void)setTransferRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferRequest, 0);
  objc_storeStrong((id *)&self->_topUpRequest, 0);
}

@end