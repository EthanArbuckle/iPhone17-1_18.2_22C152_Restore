@interface PKPaymentRequestUpdate
+ (BOOL)supportsSecureCoding;
- (NSArray)contentItems;
- (NSArray)multiTokenContexts;
- (NSArray)paymentSummaryItems;
- (NSArray)shippingMethods;
- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKDeferredPaymentRequest)deferredPaymentRequest;
- (PKPaymentAuthorizationStatus)status;
- (PKPaymentRequestUpdate)init;
- (PKPaymentRequestUpdate)initWithCoder:(id)a3;
- (PKPaymentRequestUpdate)initWithPaymentSummaryItems:(NSArray *)paymentSummaryItems;
- (PKRecurringPaymentRequest)recurringPaymentRequest;
- (PKShippingMethods)availableShippingMethods;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest;
- (void)setAvailableShippingMethods:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest;
- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts;
- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems;
- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest;
- (void)setShippingMethods:(NSArray *)shippingMethods;
- (void)setStatus:(PKPaymentAuthorizationStatus)status;
@end

@implementation PKPaymentRequestUpdate

- (PKPaymentRequestUpdate)initWithPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
  v4 = paymentSummaryItems;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestUpdate;
  v5 = [(PKPaymentRequestUpdate *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_status = 0;
    uint64_t v7 = [(NSArray *)v4 copy];
    v8 = v6->_paymentSummaryItems;
    v6->_paymentSummaryItems = (NSArray *)v7;

    v9 = objc_alloc_init(PKShippingMethods);
    availableShippingMethods = v6->_availableShippingMethods;
    v6->_availableShippingMethods = v9;
  }
  return v6;
}

- (PKPaymentRequestUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentRequestUpdate;
  v5 = [(PKPaymentRequestUpdate *)&v34 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"multiTokenContexts"];
    multiTokenContexts = v5->_multiTokenContexts;
    v5->_multiTokenContexts = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentRequest"];
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticReloadPaymentRequest"];
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"paymentSummaryItems"];
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"paymentContentItems"];
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableShippingMethods"];
    availableShippingMethods = v5->_availableShippingMethods;
    v5->_availableShippingMethods = (PKShippingMethods *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v30 = [v4 decodeObjectOfClasses:v29 forKey:@"shippingMethods"];

    if (!v5->_availableShippingMethods && v30)
    {
      v31 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v30];
      v32 = v5->_availableShippingMethods;
      v5->_availableShippingMethods = v31;
    }
  }

  return v5;
}

- (PKPaymentRequestUpdate)init
{
  return [(PKPaymentRequestUpdate *)self initWithPaymentSummaryItems:MEMORY[0x1E4F1CBF0]];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status = self->_status;
  id v6 = a3;
  [v6 encodeInteger:status forKey:@"status"];
  [v6 encodeObject:self->_multiTokenContexts forKey:@"multiTokenContexts"];
  [v6 encodeObject:self->_recurringPaymentRequest forKey:@"recurringPaymentRequest"];
  [v6 encodeObject:self->_automaticReloadPaymentRequest forKey:@"automaticReloadPaymentRequest"];
  [v6 encodeObject:self->_paymentSummaryItems forKey:@"paymentSummaryItems"];
  v5 = [(PKShippingMethods *)self->_availableShippingMethods legacyShippingMethods];
  [v6 encodeObject:v5 forKey:@"shippingMethods"];

  [v6 encodeObject:self->_availableShippingMethods forKey:@"availableShippingMethods"];
  [v6 encodeObject:self->_contentItems forKey:@"paymentContentItems"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)shippingMethods
{
  return [(PKShippingMethods *)self->_availableShippingMethods legacyShippingMethods];
}

- (void)setShippingMethods:(NSArray *)shippingMethods
{
  id v6 = shippingMethods;
  if (v6)
  {
    id v4 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v6];
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = v4;
  }
  else
  {
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = 0;
  }
}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_int64_t status = status;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts
{
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest
{
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest
{
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest
{
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
}

- (PKShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
}

@end