@interface NFPeerPaymentEnrollmentResponse
+ (BOOL)supportsSecureCoding;
- (NFPeerPaymentEnrollmentResponse)initWithCoder:(id)a3;
- (NFPeerPaymentEnrollmentResponse)initWithDictionary:(id)a3;
- (NSData)prePeerPaymentCertificate;
- (NSDictionary)certificate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFPeerPaymentEnrollmentResponse

- (NFPeerPaymentEnrollmentResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = [(NFPeerPaymentEnrollmentResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"paymentCertificate"];
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"certificates"];
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v8;
  }
  return v5;
}

- (NFPeerPaymentEnrollmentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = [(NFPeerPaymentEnrollmentResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentCertificate"];
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v6;

    uint64_t v8 = [MEMORY[0x1E4FBA858] coder:v4 decodeDictOfClass:objc_opt_class() forKey:@"certificates"];
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  prePeerPaymentCertificate = self->_prePeerPaymentCertificate;
  id v5 = a3;
  [v5 encodeObject:prePeerPaymentCertificate forKey:@"paymentCertificate"];
  [v5 encodeObject:self->_certificate forKey:@"certificates"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)prePeerPaymentCertificate
{
  return self->_prePeerPaymentCertificate;
}

- (NSDictionary)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_prePeerPaymentCertificate, 0);
}

@end