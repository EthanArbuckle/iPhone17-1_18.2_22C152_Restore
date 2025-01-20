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
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", v16, ClassName, Name, 458);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(a1);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v23 = v19;
      __int16 v24 = 2082;
      v25 = object_getClassName(a1);
      __int16 v26 = 2082;
      v27 = sel_getName(a2);
      __int16 v28 = 1024;
      int v29 = 458;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", buf, 0x22u);
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