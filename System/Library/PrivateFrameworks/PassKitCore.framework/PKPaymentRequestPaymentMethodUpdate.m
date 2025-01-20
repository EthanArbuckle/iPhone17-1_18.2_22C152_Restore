@interface PKPaymentRequestPaymentMethodUpdate
+ (BOOL)supportsSecureCoding;
- (NSArray)errors;
- (NSString)installmentGroupIdentifier;
- (PKPaymentRequestPaymentMethodUpdate)initWithCoder:(id)a3;
- (PKPaymentRequestPaymentMethodUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems;
- (PKPaymentRequestPaymentMethodUpdate)initWithPaymentSummaryItems:(id)a3;
- (PKPeerPaymentQuote)peerPaymentQuote;
- (void)encodeWithCoder:(id)a3;
- (void)setErrors:(NSArray *)errors;
- (void)setInstallmentGroupIdentifier:(id)a3;
- (void)setPeerPaymentQuote:(id)a3;
@end

@implementation PKPaymentRequestPaymentMethodUpdate

- (PKPaymentRequestPaymentMethodUpdate)initWithPaymentSummaryItems:(id)a3
{
  return [(PKPaymentRequestPaymentMethodUpdate *)self initWithErrors:0 paymentSummaryItems:a3];
}

- (PKPaymentRequestPaymentMethodUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems
{
  v6 = errors;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  v7 = [(PKPaymentRequestUpdate *)&v11 initWithPaymentSummaryItems:paymentSummaryItems];
  if (v7)
  {
    if (v6)
    {
      v8 = +[PKPaymentAuthorizationResult sanitizedErrors:v6];
    }
    else
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    v9 = v7->_errors;
    v7->_errors = v8;
  }
  return v7;
}

- (void)setErrors:(NSArray *)errors
{
  v4 = errors;
  v5 = v4;
  v6 = self->_errors;
  if (v6 != v4)
  {
    v8 = v4;
    if (v4)
    {
      v7 = +[PKPaymentAuthorizationResult sanitizedErrors:v4];
      v6 = self->_errors;
    }
    else
    {
      v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    self->_errors = v7;

    v5 = v8;
  }
}

- (PKPaymentRequestPaymentMethodUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  v5 = [(PKPaymentRequestUpdate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentQuote"];
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentGroupIdentifier"];
    installmentGroupIdentifier = v5->_installmentGroupIdentifier;
    v5->_installmentGroupIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  id v4 = a3;
  [(PKPaymentRequestUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerPaymentQuote, @"peerPaymentQuote", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_installmentGroupIdentifier forKey:@"installmentGroupIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)errors
{
  return self->_errors;
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (void)setPeerPaymentQuote:(id)a3
{
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end