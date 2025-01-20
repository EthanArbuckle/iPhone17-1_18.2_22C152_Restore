@interface PKPaymentRequestShippingContactUpdate
+ (BOOL)supportsSecureCoding;
- (NSArray)errors;
- (PKPaymentRequestShippingContactUpdate)initWithCoder:(id)a3;
- (PKPaymentRequestShippingContactUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems shippingMethods:(NSArray *)shippingMethods;
- (PKPaymentRequestShippingContactUpdate)initWithPaymentSummaryItems:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setErrors:(NSArray *)errors;
@end

@implementation PKPaymentRequestShippingContactUpdate

- (PKPaymentRequestShippingContactUpdate)initWithPaymentSummaryItems:(id)a3
{
  return [(PKPaymentRequestShippingContactUpdate *)self initWithErrors:0 paymentSummaryItems:a3 shippingMethods:MEMORY[0x1E4F1CBF0]];
}

- (PKPaymentRequestShippingContactUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems shippingMethods:(NSArray *)shippingMethods
{
  v8 = errors;
  v9 = shippingMethods;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRequestShippingContactUpdate;
  v10 = [(PKPaymentRequestUpdate *)&v16 initWithPaymentSummaryItems:paymentSummaryItems];
  if (v10)
  {
    if (v8)
    {
      v11 = +[PKPaymentAuthorizationResult sanitizedErrors:v8];
    }
    else
    {
      v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    v12 = v10->_errors;
    v10->_errors = v11;

    if (v9)
    {
      v13 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v9];
      availableShippingMethods = v10->super._availableShippingMethods;
      v10->super._availableShippingMethods = v13;
    }
  }

  return v10;
}

- (PKPaymentRequestShippingContactUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestShippingContactUpdate;
  v5 = [(PKPaymentRequestUpdate *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRequestShippingContactUpdate;
  id v4 = a3;
  [(PKPaymentRequestUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_errors, @"errors", v5.receiver, v5.super_class);
}

- (void)setErrors:(NSArray *)errors
{
  id v4 = errors;
  objc_super v5 = v4;
  v6 = self->_errors;
  if (v6 != v4)
  {
    v8 = v4;
    if (v4)
    {
      uint64_t v7 = +[PKPaymentAuthorizationResult sanitizedErrors:v4];
      v6 = self->_errors;
    }
    else
    {
      uint64_t v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    self->_errors = v7;

    objc_super v5 = v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
}

@end