@interface NFTrustPaymentSignResponse
+ (BOOL)supportsSecureCoding;
+ (id)paymentSignResponseWithSignResponse:(id)a3 paymentResponse:(id)a4;
- (NFECommercePaymentResponse)paymentResponse;
- (NFTrustPaymentSignResponse)initWithCoder:(id)a3;
- (NFTrustSignResponse)signResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentResponse:(id)a3;
- (void)setSignResponse:(id)a3;
@end

@implementation NFTrustPaymentSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustPaymentSignResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTrustPaymentSignResponse;
  v5 = [(NFTrustObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signResponse"];
    [(NFTrustPaymentSignResponse *)v5 setValue:v6 forKey:@"signResponse"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentResponse"];
    [(NFTrustPaymentSignResponse *)v5 setValue:v7 forKey:@"paymentResponse"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustPaymentSignResponse *)self signResponse];
  [v4 encodeObject:v5 forKey:@"signResponse"];

  id v6 = [(NFTrustPaymentSignResponse *)self paymentResponse];
  [v4 encodeObject:v6 forKey:@"paymentResponse"];
}

+ (id)paymentSignResponseWithSignResponse:(id)a3 paymentResponse:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_super v9 = [NFTrustPaymentSignResponse alloc];
    v10 = v9;
    if (v9)
    {
      [(NFTrustPaymentSignResponse *)v9 setSignResponse:v7];
      [(NFTrustPaymentSignResponse *)v10 setPaymentResponse:v8];
    }
  }
  else
  {
    v11 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", v17, ClassName, Name, 458);
    }
    dispatch_get_specific(*v11);
    v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(a1);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v24 = v20;
      __int16 v25 = 2082;
      v26 = object_getClassName(a1);
      __int16 v27 = 2082;
      v28 = sel_getName(a2);
      __int16 v29 = 1024;
      int v30 = 458;
      _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", buf, 0x22u);
    }

    v10 = 0;
  }

  return v10;
}

- (NFTrustSignResponse)signResponse
{
  return self->_signResponse;
}

- (void)setSignResponse:(id)a3
{
}

- (NFECommercePaymentResponse)paymentResponse
{
  return self->_paymentResponse;
}

- (void)setPaymentResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentResponse, 0);
  objc_storeStrong((id *)&self->_signResponse, 0);
}

@end