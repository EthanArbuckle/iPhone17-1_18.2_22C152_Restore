@interface PKAccountWebServiceEnhancedMerchantsResponse
- (NSArray)merchants;
- (NSArray)orderings;
- (NSDate)lastAddedDate;
- (NSNumber)minRefreshPeriod;
- (PKAccountWebServiceEnhancedMerchantsResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceEnhancedMerchantsResponse

- (PKAccountWebServiceEnhancedMerchantsResponse)initWithData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceEnhancedMerchantsResponse;
  v3 = [(PKWebServiceResponse *)&v23 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"merchants"];
    uint64_t v7 = objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_817);
    merchants = v4->_merchants;
    v4->_merchants = (NSArray *)v7;

    v9 = [v5 objectForKey:@"orderings"];
    uint64_t v10 = objc_msgSend(v9, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_820);
    orderings = v4->_orderings;
    v4->_orderings = (NSArray *)v10;

    uint64_t v12 = [v5 PKDateForKey:@"lastAddedDate"];
    lastAddedDate = v4->_lastAddedDate;
    v4->_lastAddedDate = (NSDate *)v12;

    uint64_t v14 = [v5 PKNumberForKey:@"minRefreshPeriod"];
    minRefreshPeriod = v4->_minRefreshPeriod;
    v4->_minRefreshPeriod = (NSNumber *)v14;

LABEL_4:
    v16 = v4;
    goto LABEL_8;
  }
  v17 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2114;
    v27 = v21;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v16 = 0;
LABEL_8:

  return v16;
}

PKAccountEnhancedMerchant *__61__PKAccountWebServiceEnhancedMerchantsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountEnhancedMerchant alloc] initWithDictionary:v2];

  return v3;
}

PKAccountEntityOrdering *__61__PKAccountWebServiceEnhancedMerchantsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountEntityOrdering alloc] initWithType:1 dictionary:v2];

  return v3;
}

- (NSArray)merchants
{
  return self->_merchants;
}

- (NSArray)orderings
{
  return self->_orderings;
}

- (NSDate)lastAddedDate
{
  return self->_lastAddedDate;
}

- (NSNumber)minRefreshPeriod
{
  return self->_minRefreshPeriod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minRefreshPeriod, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
}

@end