@interface PKPaymentClientUpdate
+ (BOOL)supportsSecureCoding;
+ (id)paymentUpdateResponseWithProtobuf:(id)a3;
- (NSArray)multiTokenContexts;
- (NSArray)paymentSummaryItems;
- (NSString)selectedAID;
- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKDeferredPaymentRequest)deferredPaymentRequest;
- (PKPaymentClientUpdate)initWithCoder:(id)a3;
- (PKPaymentClientUpdate)initWithPaymentSummaryItems:(id)a3 shippingMethods:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 status:(int64_t)a9 selectedAID:(id)a10 selectedPaymentMethodType:(unint64_t)a11;
- (PKRecurringPaymentRequest)recurringPaymentRequest;
- (PKShippingMethods)shippingMethods;
- (id)protobuf;
- (int64_t)status;
- (unint64_t)selectedPaymentMethodType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentClientUpdate

+ (id)paymentUpdateResponseWithProtobuf:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v5 = [v3 paymentSummaryItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[PKPaymentSummaryItem itemWithProtobuf:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v7);
  }

  if ([v3 hasAvailableShippingMethods])
  {
    v11 = [v3 availableShippingMethods];
    v12 = +[PKShippingMethods shippingMethodsWithProtobuf:v11];
LABEL_19:
    v21 = v12;

    goto LABEL_20;
  }
  v13 = [v3 shippingMethods];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v15 = [v3 shippingMethods];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = +[PKShippingMethod shippingMethodWithProtobuf:*(void *)(*((void *)&v38 + 1) + 8 * j)];
          [v11 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v17);
    }

    v12 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v11];
    goto LABEL_19;
  }
  v21 = 0;
LABEL_20:
  v22 = [v3 multiTokenContexts];
  uint64_t v23 = objc_msgSend(v22, "pk_arrayByApplyingBlock:", &__block_literal_global_172);
  v24 = (void *)v23;
  v25 = (void *)MEMORY[0x1E4F1CBF0];
  if (v23) {
    v25 = (void *)v23;
  }
  id v26 = v25;

  if ([v3 hasRecurringPaymentRequest])
  {
    v27 = [v3 recurringPaymentRequest];
    v28 = +[PKRecurringPaymentRequest recurringPaymentRequestWithProtobuf:v27];
  }
  else
  {
    v28 = 0;
  }
  if ([v3 hasAutomaticReloadPaymentRequest])
  {
    v29 = [v3 automaticReloadPaymentRequest];
    v30 = +[PKAutomaticReloadPaymentRequest automaticReloadPaymentRequestWithProtobuf:v29];
  }
  else
  {
    v30 = 0;
  }
  v31 = [v3 deferredPaymentRequest];

  if (v31)
  {
    v32 = [v3 deferredPaymentRequest];
    v31 = +[PKDeferredPaymentRequest deferredPaymentRequestWithProtobuf:v32];
  }
  v33 = [PKPaymentClientUpdate alloc];
  uint64_t v34 = [v3 status];
  v35 = [v3 selectedAID];
  v36 = -[PKPaymentClientUpdate initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:](v33, "initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:", v4, v21, v26, v28, v30, v31, v34, v35, [v3 selectedPaymentType]);

  return v36;
}

PKPaymentTokenContext *__69__PKPaymentClientUpdate_Protobuf__paymentUpdateResponseWithProtobuf___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentTokenContext contextWithProtobuf:a2];
}

- (id)protobuf
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(PKProtobufPaymentClientUpdate);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = [(PKPaymentClientUpdate *)self multiTokenContexts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v39 + 1) + 8 * i) protobuf];
        [(PKProtobufPaymentClientUpdate *)v3 addMultiTokenContexts:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v6);
  }

  v10 = [(PKPaymentClientUpdate *)self recurringPaymentRequest];
  v11 = [v10 protobuf];
  [(PKProtobufPaymentClientUpdate *)v3 setRecurringPaymentRequest:v11];

  v12 = [(PKPaymentClientUpdate *)self automaticReloadPaymentRequest];
  v13 = [v12 protobuf];
  [(PKProtobufPaymentClientUpdate *)v3 setAutomaticReloadPaymentRequest:v13];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = [(PKPaymentClientUpdate *)self paymentSummaryItems];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v35 + 1) + 8 * j) summaryItemProtobuf];
        [(PKProtobufPaymentClientUpdate *)v3 addPaymentSummaryItems:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v16);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v20 = [(PKPaymentClientUpdate *)self shippingMethods];
  v21 = [v20 legacyShippingMethods];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v31 + 1) + 8 * k) shippingMethodProtobuf];
        [(PKProtobufPaymentClientUpdate *)v3 addShippingMethods:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v23);
  }

  v27 = [(PKPaymentClientUpdate *)self shippingMethods];
  v28 = [v27 protobuf];
  [(PKProtobufPaymentClientUpdate *)v3 setAvailableShippingMethods:v28];

  [(PKProtobufPaymentClientUpdate *)v3 setStatus:[(PKPaymentClientUpdate *)self status]];
  v29 = [(PKPaymentClientUpdate *)self selectedAID];
  [(PKProtobufPaymentClientUpdate *)v3 setSelectedAID:v29];

  [(PKProtobufPaymentClientUpdate *)v3 setSelectedPaymentType:[(PKPaymentClientUpdate *)self selectedPaymentMethodType]];
  return v3;
}

- (PKPaymentClientUpdate)initWithPaymentSummaryItems:(id)a3 shippingMethods:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 status:(int64_t)a9 selectedAID:(id)a10 selectedPaymentMethodType:(unint64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v37 = a7;
  id v36 = a8;
  id v21 = a10;
  v38.receiver = self;
  v38.super_class = (Class)PKPaymentClientUpdate;
  uint64_t v22 = [(PKPaymentClientUpdate *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    paymentSummaryItems = v22->_paymentSummaryItems;
    v22->_paymentSummaryItems = (NSArray *)v23;

    uint64_t v25 = [v18 copy];
    shippingMethods = v22->_shippingMethods;
    v22->_shippingMethods = (PKShippingMethods *)v25;

    uint64_t v27 = [v19 copy];
    id v28 = v18;
    id v29 = v20;
    id v30 = v17;
    long long v31 = (void *)v27;
    if (v27) {
      long long v32 = (void *)v27;
    }
    else {
      long long v32 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v22->_multiTokenContexts, v32);

    id v17 = v30;
    id v20 = v29;
    id v18 = v28;
    objc_storeStrong((id *)&v22->_recurringPaymentRequest, a6);
    objc_storeStrong((id *)&v22->_automaticReloadPaymentRequest, a7);
    objc_storeStrong((id *)&v22->_deferredPaymentRequest, a8);
    v22->_status = a9;
    uint64_t v33 = [v21 copy];
    selectedAID = v22->_selectedAID;
    v22->_selectedAID = (NSString *)v33;

    v22->_selectedPaymentMethodType = a11;
  }

  return v22;
}

- (PKPaymentClientUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentClientUpdate;
  uint64_t v5 = [(PKPaymentClientUpdate *)&v34 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"paymentSummaryItems"];
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"multiTokenContexts"];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    else {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_multiTokenContexts, v16);

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentRequest"];
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticReloadPaymentRequest"];
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deferredPaymentRequest"];
    deferredPaymentRequest = v5->_deferredPaymentRequest;
    v5->_deferredPaymentRequest = (PKDeferredPaymentRequest *)v21;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedAID"];
    selectedAID = v5->_selectedAID;
    v5->_selectedAID = (NSString *)v23;

    v5->_selectedPaymentMethodType = [v4 decodeIntegerForKey:@"selectedPaymentMethodType"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableShippingMethods"];
    shippingMethods = v5->_shippingMethods;
    v5->_shippingMethods = (PKShippingMethods *)v25;

    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    id v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    id v30 = [v4 decodeObjectOfClasses:v29 forKey:@"shippingMethods"];

    if (!v5->_shippingMethods && v30)
    {
      long long v31 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v30];
      long long v32 = v5->_shippingMethods;
      v5->_shippingMethods = v31;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentSummaryItems = self->_paymentSummaryItems;
  id v6 = a3;
  [v6 encodeObject:paymentSummaryItems forKey:@"paymentSummaryItems"];
  [v6 encodeObject:self->_multiTokenContexts forKey:@"multiTokenContexts"];
  [v6 encodeObject:self->_recurringPaymentRequest forKey:@"recurringPaymentRequest"];
  [v6 encodeObject:self->_automaticReloadPaymentRequest forKey:@"automaticReloadPaymentRequest"];
  [v6 encodeObject:self->_deferredPaymentRequest forKey:@"deferredPaymentRequest"];
  [v6 encodeInteger:self->_status forKey:@"status"];
  [v6 encodeObject:self->_selectedAID forKey:@"selectedAID"];
  [v6 encodeInteger:self->_selectedPaymentMethodType forKey:@"selectedPaymentMethodType"];
  uint64_t v5 = [(PKShippingMethods *)self->_shippingMethods legacyShippingMethods];
  [v6 encodeObject:v5 forKey:@"shippingMethods"];

  [v6 encodeObject:self->_shippingMethods forKey:@"availableShippingMethods"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (PKShippingMethods)shippingMethods
{
  return self->_shippingMethods;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)selectedAID
{
  return self->_selectedAID;
}

- (unint64_t)selectedPaymentMethodType
{
  return self->_selectedPaymentMethodType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAID, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
}

@end