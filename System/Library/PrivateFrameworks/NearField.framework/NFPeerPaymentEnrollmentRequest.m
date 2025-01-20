@interface NFPeerPaymentEnrollmentRequest
+ (BOOL)supportsSecureCoding;
- (NFPeerPaymentEnrollmentRequest)initWithCoder:(id)a3;
- (NFPeerPaymentEnrollmentRequest)initWithDictionary:(id)a3;
- (NSData)alternateDSID;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateDSID:(id)a3;
@end

@implementation NFPeerPaymentEnrollmentRequest

- (NFPeerPaymentEnrollmentRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = [(NFPeerPaymentEnrollmentRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"alternateDSID"];
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v6;
  }
  return v5;
}

- (NFPeerPaymentEnrollmentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = [(NFPeerPaymentEnrollmentRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateDSID"];
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end