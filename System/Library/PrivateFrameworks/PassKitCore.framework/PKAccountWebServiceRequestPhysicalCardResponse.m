@interface PKAccountWebServiceRequestPhysicalCardResponse
- (PKAccountWebServiceRequestPhysicalCardResponse)initWithData:(id)a3;
- (PKPhysicalCard)physicalCard;
- (unint64_t)shipmentQuoteMaximum;
- (unint64_t)shipmentQuoteMinimum;
@end

@implementation PKAccountWebServiceRequestPhysicalCardResponse

- (PKAccountWebServiceRequestPhysicalCardResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceRequestPhysicalCardResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [PKPhysicalCard alloc];
      v8 = [v6 PKDictionaryForKey:@"physicalCard"];
      uint64_t v9 = [(PKPhysicalCard *)v7 initWithDictionary:v8];
      physicalCard = v4->_physicalCard;
      v4->_physicalCard = (PKPhysicalCard *)v9;

      v4->_shipmentQuoteMinimum = [v6 PKIntegerForKey:@"shipmentQuoteMinimum"];
      uint64_t v11 = [v6 PKIntegerForKey:@"shipmentQuoteMaximum"];

      v4->_shipmentQuoteMaximum = v11;
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2114;
        v22 = v16;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (PKPhysicalCard)physicalCard
{
  return self->_physicalCard;
}

- (unint64_t)shipmentQuoteMinimum
{
  return self->_shipmentQuoteMinimum;
}

- (unint64_t)shipmentQuoteMaximum
{
  return self->_shipmentQuoteMaximum;
}

- (void).cxx_destruct
{
}

@end