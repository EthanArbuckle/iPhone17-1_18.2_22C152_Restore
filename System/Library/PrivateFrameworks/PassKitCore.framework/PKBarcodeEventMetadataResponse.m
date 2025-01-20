@interface PKBarcodeEventMetadataResponse
+ (BOOL)supportsSecureCoding;
- (NSData)paymentInformation;
- (PKBarcodeEventMetadataResponse)initWithCoder:(id)a3;
- (PKBarcodeEventMetadataResponse)initWithPaymentInformation:(NSData *)paymentInformation;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentInformation:(NSData *)paymentInformation;
@end

@implementation PKBarcodeEventMetadataResponse

- (PKBarcodeEventMetadataResponse)initWithPaymentInformation:(NSData *)paymentInformation
{
  v5 = paymentInformation;
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodeEventMetadataResponse;
  v6 = [(PKBarcodeEventMetadataResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paymentInformation, paymentInformation);
  }

  return v7;
}

- (PKBarcodeEventMetadataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKBarcodeEventMetadataResponse;
  v5 = [(PKBarcodeEventMetadataResponse *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentInformation"];
    paymentInformation = v5->_paymentInformation;
    v5->_paymentInformation = (NSData *)v6;

    v8 = v5;
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

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; paymentInformation: %@>",
               objc_opt_class(),
               self,
               self->_paymentInformation);
}

- (NSData)paymentInformation
{
  return self->_paymentInformation;
}

- (void)setPaymentInformation:(NSData *)paymentInformation
{
}

- (void).cxx_destruct
{
}

@end