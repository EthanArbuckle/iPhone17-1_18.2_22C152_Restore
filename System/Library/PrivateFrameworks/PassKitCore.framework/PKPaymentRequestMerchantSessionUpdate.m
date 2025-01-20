@interface PKPaymentRequestMerchantSessionUpdate
+ (BOOL)supportsSecureCoding;
- (PKPaymentAuthorizationStatus)status;
- (PKPaymentMerchantSession)session;
- (PKPaymentRequestMerchantSessionUpdate)init;
- (PKPaymentRequestMerchantSessionUpdate)initWithCoder:(id)a3;
- (PKPaymentRequestMerchantSessionUpdate)initWithStatus:(PKPaymentAuthorizationStatus)status merchantSession:(PKPaymentMerchantSession *)session;
- (void)encodeWithCoder:(id)a3;
- (void)setSession:(PKPaymentMerchantSession *)session;
- (void)setStatus:(PKPaymentAuthorizationStatus)status;
@end

@implementation PKPaymentRequestMerchantSessionUpdate

- (PKPaymentRequestMerchantSessionUpdate)initWithStatus:(PKPaymentAuthorizationStatus)status merchantSession:(PKPaymentMerchantSession *)session
{
  v7 = session;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestMerchantSessionUpdate;
  v8 = [(PKPaymentRequestMerchantSessionUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_status = status;
    objc_storeStrong((id *)&v8->_session, session);
  }

  return v9;
}

- (PKPaymentRequestMerchantSessionUpdate)init
{
  return [(PKPaymentRequestMerchantSessionUpdate *)self initWithStatus:0 merchantSession:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRequestMerchantSessionUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRequestMerchantSessionUpdate;
  v5 = [(PKPaymentRequestMerchantSessionUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];
    session = v5->_session;
    v5->_session = (PKPaymentMerchantSession *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  session = self->_session;
  id v5 = a3;
  [v5 encodeObject:session forKey:@"session"];
  [v5 encodeInteger:self->_status forKey:@"status"];
}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_status = status;
}

- (PKPaymentMerchantSession)session
{
  return self->_session;
}

- (void)setSession:(PKPaymentMerchantSession *)session
{
}

- (void).cxx_destruct
{
}

@end