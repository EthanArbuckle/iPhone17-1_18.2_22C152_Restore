@interface PKPaymentDataItem
+ (BOOL)supportsMultipleItems;
+ (BOOL)validateBillingAddressForItem:(id)a3 billingAddress:(id)a4 outError:(id *)a5;
+ (int64_t)dataType;
- (BOOL)isRejected;
- (BOOL)isValidWithError:(id *)a3;
- (NSArray)errors;
- (NSArray)paymentContactFormatErrors;
- (PKPaymentAuthorizationDataModel)model;
- (PKPaymentDataItem)initWithModel:(id)a3;
- (int64_t)context;
- (int64_t)status;
- (int64_t)type;
- (void)setModel:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKPaymentDataItem

+ (int64_t)dataType
{
  return -1;
}

- (int64_t)context
{
  return 0;
}

+ (BOOL)supportsMultipleItems
{
  return 0;
}

- (PKPaymentDataItem)initWithModel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentDataItem;
  v5 = [(PKPaymentDataItem *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v6->_type = [(id)objc_opt_class() dataType];
    v6->_status = 0;
  }

  return v6;
}

- (NSArray)errors
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)paymentContactFormatErrors
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isRejected
{
  return [(PKPaymentDataItem *)self status] == 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  }
  return 0;
}

+ (BOOL)validateBillingAddressForItem:(id)a3 billingAddress:(id)a4 outError:(id *)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 errors];
  v10 = [v9 firstObject];

  if (v10)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_8:
    BOOL v13 = 0;
    if (!v10)
    {
LABEL_14:
      v14 = @"IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED_REASON";
      v15 = @"IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED";
      goto LABEL_15;
    }
LABEL_9:
    v15 = @"IN_APP_PAYMENT_BILLING_ADDRESS_INVALID";
    if ([v10 code] == 2)
    {
      v17 = [v10 userInfo];
      v18 = [v17 PKStringForKey:@"PKPaymentErrorPostalAddress"];

      if (v18) {
        v15 = @"IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE";
      }
    }
    v14 = @"IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON";
    goto LABEL_15;
  }
  v16 = [v7 paymentContactFormatErrors];
  v10 = [v16 firstObject];

  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v11 = [v8 postalAddresses];
  uint64_t v12 = [v11 count];
  BOOL v13 = v12 != 0;

  if (v10) {
    goto LABEL_9;
  }
  if (!v12)
  {
    BOOL v13 = 0;
    goto LABEL_14;
  }
  BOOL v13 = 1;
  if (![v7 isRejected])
  {
    v21 = 0;
    v19 = 0;
    goto LABEL_18;
  }
  v14 = @"IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON";
  v15 = @"IN_APP_PAYMENT_BILLING_ADDRESS_INVALID";
LABEL_15:
  v19 = PKLocalizedPaymentString(&v15->isa, 0);
  uint64_t v20 = PKLocalizedPaymentString(&v14->isa, 0);
  v21 = (void *)v20;
  if (a5)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v27[0] = *MEMORY[0x1E4F28568];
    v27[1] = v23;
    v28[0] = v19;
    v28[1] = v20;
    v27[2] = @"PKPaymentErrorIsFieldEmpty";
    v24 = [NSNumber numberWithInt:!v13];
    v28[2] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    *a5 = [v22 errorWithDomain:@"PKPassKitErrorDomain" code:-3002 userInfo:v25];
  }
  LOBYTE(v13) = 0;
LABEL_18:

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (PKPaymentAuthorizationDataModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PKPaymentAuthorizationDataModel *)WeakRetained;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end