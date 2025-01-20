@interface PKPeerPaymentPerformResponse
+ (BOOL)supportsSecureCoding;
- (NSUUID)deviceScoreIdentifier;
- (PKPeerPaymentPerformResponse)initWithCoder:(id)a3;
- (PKPeerPaymentPerformResponse)initWithData:(id)a3;
- (PKPeerPaymentPerformResponse)initWithData:(id)a3 deviceScoreIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentPerformResponse

- (PKPeerPaymentPerformResponse)initWithData:(id)a3
{
  return [(PKPeerPaymentPerformResponse *)self initWithData:a3 deviceScoreIdentifier:0];
}

- (PKPeerPaymentPerformResponse)initWithData:(id)a3 deviceScoreIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPerformResponse;
  v7 = [(PKPeerPaymentStatusResponse *)&v11 initWithData:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    deviceScoreIdentifier = v7->_deviceScoreIdentifier;
    v7->_deviceScoreIdentifier = (NSUUID *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPerformResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPerformResponse;
  v5 = [(PKWebServiceResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceScoreIdentifier"];
    uint64_t v7 = [v6 copy];
    deviceScoreIdentifier = v5->_deviceScoreIdentifier;
    v5->_deviceScoreIdentifier = (NSUUID *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentPerformResponse;
  id v4 = a3;
  [(PKWebServiceResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceScoreIdentifier, @"deviceScoreIdentifier", v5.receiver, v5.super_class);
}

- (NSUUID)deviceScoreIdentifier
{
  return self->_deviceScoreIdentifier;
}

- (void).cxx_destruct
{
}

@end