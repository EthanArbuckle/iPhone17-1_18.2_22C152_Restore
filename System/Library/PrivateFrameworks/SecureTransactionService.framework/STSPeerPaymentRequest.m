@interface STSPeerPaymentRequest
+ (BOOL)supportsSecureCoding;
- (STSMerchantPaymentRequest)topUpRequest;
- (STSPeerPaymentRequest)init;
- (STSPeerPaymentRequest)initWithCoder:(id)a3;
- (STSPeerPaymentRequest)initWithTransferRequest:(id)a3 topUpRequest:(id)a4;
- (STSPeerPaymentTransferRequest)transferRequest;
- (id)toNFPeerPaymentRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTopUpRequest:(id)a3;
- (void)setTransferRequest:(id)a3;
@end

@implementation STSPeerPaymentRequest

- (STSPeerPaymentRequest)initWithTransferRequest:(id)a3 topUpRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSPeerPaymentRequest;
  v9 = [(STSPeerPaymentRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transferRequest, a3);
    objc_storeStrong((id *)&v10->_topUpRequest, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPeerPaymentRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)STSPeerPaymentRequest;
  return [(STSPeerPaymentRequest *)&v3 init];
}

- (STSPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSPeerPaymentRequest;
  v5 = [(STSPeerPaymentRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferRequest"];
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (STSPeerPaymentTransferRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topUpRequest"];
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (STSMerchantPaymentRequest *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transferRequest = self->_transferRequest;
  id v5 = a3;
  [v5 encodeObject:transferRequest forKey:@"transferRequest"];
  [v5 encodeObject:self->_topUpRequest forKey:@"topUpRequest"];
}

- (id)toNFPeerPaymentRequest:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F58120]);
  topUpRequest = self->_topUpRequest;
  if (topUpRequest)
  {
    uint64_t v6 = [(STSMerchantPaymentRequest *)topUpRequest appletIdentifier];

    if (!v6) {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSPeerPaymentRequest toNFPeerPaymentRequest:]", 127, self, @"The topup object is missing the applet identifier.", v7, v8, v14);
    }
    v9 = self->_topUpRequest;
    v10 = [(STSMerchantPaymentRequest *)v9 appletIdentifier];
    objc_super v11 = [(STSMerchantPaymentRequest *)v9 toNFECommercePaymentRequest:v10];
    [v4 setTopUpRequest:v11];
  }
  objc_super v12 = [(STSPeerPaymentTransferRequest *)self->_transferRequest toNFPeerPaymentTransferRequest];
  [v4 setTransferRequest:v12];

  return v4;
}

- (STSMerchantPaymentRequest)topUpRequest
{
  return self->_topUpRequest;
}

- (void)setTopUpRequest:(id)a3
{
}

- (STSPeerPaymentTransferRequest)transferRequest
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