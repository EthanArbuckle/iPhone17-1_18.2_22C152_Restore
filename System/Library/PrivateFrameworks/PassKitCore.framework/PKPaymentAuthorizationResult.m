@interface PKPaymentAuthorizationResult
+ (BOOL)supportsSecureCoding;
+ (id)sanitizedErrors:(id)a3;
- (NSArray)errors;
- (NSString)localizedErrorMessageOverride;
- (PKPaymentAuthorizationResult)init;
- (PKPaymentAuthorizationResult)initWithCoder:(id)a3;
- (PKPaymentAuthorizationResult)initWithStatus:(PKPaymentAuthorizationStatus)status errors:(NSArray *)errors;
- (PKPaymentAuthorizationStatus)status;
- (PKPaymentOrderDetails)orderDetails;
- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata;
- (int64_t)resultSource;
- (void)encodeWithCoder:(id)a3;
- (void)setErrors:(NSArray *)errors;
- (void)setLocalizedErrorMessageOverride:(id)a3;
- (void)setOrderDetails:(PKPaymentOrderDetails *)orderDetails;
- (void)setPeerPaymentTransactionMetadata:(id)a3;
- (void)setResultSource:(int64_t)a3;
- (void)setStatus:(PKPaymentAuthorizationStatus)status;
@end

@implementation PKPaymentAuthorizationResult

- (PKPaymentAuthorizationResult)initWithStatus:(PKPaymentAuthorizationStatus)status errors:(NSArray *)errors
{
  v6 = errors;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationResult;
  v7 = [(PKPaymentAuthorizationResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_status = status;
    if (v6)
    {
      v9 = +[PKPaymentAuthorizationResult sanitizedErrors:v6];
    }
    else
    {
      v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    v10 = v8->_errors;
    v8->_errors = v9;
  }
  return v8;
}

- (PKPaymentAuthorizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentAuthorizationResult;
  v5 = [(PKPaymentAuthorizationResult *)&v18 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentTransactionMetadata"];
    peerPaymentTransactionMetadata = v5->_peerPaymentTransactionMetadata;
    v5->_peerPaymentTransactionMetadata = (PKPeerPaymentTransactionMetadata *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedErrorMessageOverride"];
    localizedErrorMessageOverride = v5->_localizedErrorMessageOverride;
    v5->_localizedErrorMessageOverride = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderDetails"];
    orderDetails = v5->_orderDetails;
    v5->_orderDetails = (PKPaymentOrderDetails *)v15;
  }
  return v5;
}

- (PKPaymentAuthorizationResult)init
{
  return [(PKPaymentAuthorizationResult *)self initWithStatus:0 errors:MEMORY[0x1E4F1CBF0]];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status = self->_status;
  id v5 = a3;
  [v5 encodeInteger:status forKey:@"status"];
  [v5 encodeObject:self->_errors forKey:@"errors"];
  [v5 encodeObject:self->_peerPaymentTransactionMetadata forKey:@"peerPaymentTransactionMetadata"];
  [v5 encodeObject:self->_localizedErrorMessageOverride forKey:@"localizedErrorMessageOverride"];
  [v5 encodeObject:self->_orderDetails forKey:@"orderDetails"];
}

- (void)setErrors:(NSArray *)errors
{
  id v4 = errors;
  id v5 = v4;
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

    id v5 = v8;
  }
}

+ (id)sanitizedErrors:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v23;
    uint64_t v4 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v7 = [v6 userInfo];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = [v7 objectForKeyedSubscript:@"PKPaymentErrorContactField"];
        [v8 setObject:v9 forKeyedSubscript:@"PKPaymentErrorContactField"];

        v10 = [v7 objectForKeyedSubscript:@"PKDisbursementErrorContactField"];
        [v8 setObject:v10 forKeyedSubscript:@"PKDisbursementErrorContactField"];

        uint64_t v11 = [v7 objectForKeyedSubscript:@"PKPaymentErrorPostalAddress"];
        [v8 setObject:v11 forKeyedSubscript:@"PKPaymentErrorPostalAddress"];

        objc_super v12 = [v7 objectForKeyedSubscript:v4];
        [v8 setObject:v12 forKeyedSubscript:v4];

        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        v14 = [v6 domain];
        uint64_t v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, objc_msgSend(v6, "code"), v8);

        [v20 addObject:v15];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v21);
  }

  v16 = (void *)[v20 copy];
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_int64_t status = status;
}

- (NSArray)errors
{
  return self->_errors;
}

- (PKPaymentOrderDetails)orderDetails
{
  return self->_orderDetails;
}

- (void)setOrderDetails:(PKPaymentOrderDetails *)orderDetails
{
}

- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata
{
  return self->_peerPaymentTransactionMetadata;
}

- (void)setPeerPaymentTransactionMetadata:(id)a3
{
}

- (NSString)localizedErrorMessageOverride
{
  return self->_localizedErrorMessageOverride;
}

- (void)setLocalizedErrorMessageOverride:(id)a3
{
}

- (int64_t)resultSource
{
  return self->_resultSource;
}

- (void)setResultSource:(int64_t)a3
{
  self->_resultSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_peerPaymentTransactionMetadata, 0);
  objc_storeStrong((id *)&self->_orderDetails, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end