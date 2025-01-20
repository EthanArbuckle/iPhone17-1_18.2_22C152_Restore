@interface PKBarcodeEventSignatureRequest
+ (BOOL)supportsSecureCoding;
- (NSData)partialSignature;
- (NSDate)transactionDate;
- (NSNumber)amount;
- (NSString)barcodeIdentifier;
- (NSString)currencyCode;
- (NSString)deviceAccountIdentifier;
- (NSString)merchantName;
- (NSString)rawMerchantName;
- (NSString)transactionIdentifier;
- (NSString)transactionStatus;
- (PKBarcodeEventSignatureRequest)initWithCoder:(id)a3;
- (PKBarcodeEventSignatureRequest)initWithPaymentTransaction:(id)a3 deviceAccountIdentifier:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDeviceAccountIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setPartialSignature:(id)a3;
- (void)setRawMerchantName:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransactionStatus:(id)a3;
@end

@implementation PKBarcodeEventSignatureRequest

- (PKBarcodeEventSignatureRequest)initWithPaymentTransaction:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKBarcodeEventSignatureRequest;
  v8 = [(PKBarcodeEventSignatureRequest *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [v6 amount];
    amount = v8->_amount;
    v8->_amount = (NSNumber *)v9;

    uint64_t v11 = [v6 serviceIdentifier];
    transactionIdentifier = v8->_transactionIdentifier;
    v8->_transactionIdentifier = (NSString *)v11;

    uint64_t v13 = [v6 barcodeIdentifier];
    barcodeIdentifier = v8->_barcodeIdentifier;
    v8->_barcodeIdentifier = (NSString *)v13;

    uint64_t v15 = [v6 currencyCode];
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v15;

    v17 = [v6 merchant];
    uint64_t v18 = [v17 name];
    merchantName = v8->_merchantName;
    v8->_merchantName = (NSString *)v18;

    v20 = [v6 merchant];
    uint64_t v21 = [v20 rawName];
    rawMerchantName = v8->_rawMerchantName;
    v8->_rawMerchantName = (NSString *)v21;

    uint64_t v23 = [v6 transactionDate];
    transactionDate = v8->_transactionDate;
    v8->_transactionDate = (NSDate *)v23;

    uint64_t v25 = PKPaymentTransactionStatusToString([v6 transactionStatus]);
    transactionStatus = v8->_transactionStatus;
    v8->_transactionStatus = (NSString *)v25;

    objc_storeStrong((id *)&v8->_deviceAccountIdentifier, a4);
    v27 = [v6 authenticationContext];
    uint64_t v28 = [v27 partialSignature];
    partialSignature = v8->_partialSignature;
    v8->_partialSignature = (NSData *)v28;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeObject:self->_barcodeIdentifier forKey:@"barcodeIdentifier"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_merchantName forKey:@"merchantName"];
  [v5 encodeObject:self->_rawMerchantName forKey:@"rawMerchantName"];
  [v5 encodeObject:self->_transactionDate forKey:@"transactionDate"];
  [v5 encodeObject:self->_transactionStatus forKey:@"transactionStatus"];
  [v5 encodeObject:self->_deviceAccountIdentifier forKey:@"deviceAccountIdentifier"];
  [v5 encodeObject:self->_partialSignature forKey:@"partialSignature"];
}

- (PKBarcodeEventSignatureRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKBarcodeEventSignatureRequest;
  id v5 = [(PKBarcodeEventSignatureRequest *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeIdentifier"];
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantName"];
    merchantName = v5->_merchantName;
    v5->_merchantName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawMerchantName"];
    rawMerchantName = v5->_rawMerchantName;
    v5->_rawMerchantName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionStatus"];
    transactionStatus = v5->_transactionStatus;
    v5->_transactionStatus = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAccountIdentifier"];
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partialSignature"];
    partialSignature = v5->_partialSignature;
    v5->_partialSignature = (NSData *)v24;
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; transaction identifier: %@>",
               objc_opt_class(),
               self,
               self->_transactionIdentifier);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (NSString)rawMerchantName
{
  return self->_rawMerchantName;
}

- (void)setRawMerchantName:(id)a3
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(id)a3
{
}

- (NSData)partialSignature
{
  return self->_partialSignature;
}

- (void)setPartialSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSignature, 0);
  objc_storeStrong((id *)&self->_transactionStatus, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_rawMerchantName, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end