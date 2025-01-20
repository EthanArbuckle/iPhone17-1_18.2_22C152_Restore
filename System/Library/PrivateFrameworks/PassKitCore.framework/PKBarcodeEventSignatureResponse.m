@interface PKBarcodeEventSignatureResponse
+ (BOOL)supportsSecureCoding;
- (NSData)signedData;
- (PKBarcodeEventSignatureResponse)initWithCoder:(id)a3;
- (PKBarcodeEventSignatureResponse)initWithSignedData:(NSData *)signedData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSignedData:(NSData *)signedData;
@end

@implementation PKBarcodeEventSignatureResponse

- (PKBarcodeEventSignatureResponse)initWithSignedData:(NSData *)signedData
{
  v5 = signedData;
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodeEventSignatureResponse;
  v6 = [(PKBarcodeEventSignatureResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signedData, signedData);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKBarcodeEventSignatureResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKBarcodeEventSignatureResponse;
  v5 = [(PKBarcodeEventSignatureResponse *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedData"];
    signedData = v5->_signedData;
    v5->_signedData = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; signedData: %tu bytes>",
               objc_opt_class(),
               self,
               [(NSData *)self->_signedData length]);
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(NSData *)signedData
{
}

- (void).cxx_destruct
{
}

@end