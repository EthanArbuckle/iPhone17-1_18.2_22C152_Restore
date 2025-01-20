@interface PKAccountWebServicePromotionsResponse
- (NSArray)orderings;
- (NSArray)promotions;
- (NSDate)lastAddedDate;
- (NSNumber)maxImpressionCount;
- (NSNumber)minRefreshPeriod;
- (NSNumber)timeVisibleAfterCompleted;
- (PKAccountWebServicePromotionsResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServicePromotionsResponse

- (PKAccountWebServicePromotionsResponse)initWithData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PKAccountWebServicePromotionsResponse;
  v3 = [(PKWebServiceResponse *)&v27 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"promotions"];
    uint64_t v7 = objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_762);
    promotions = v4->_promotions;
    v4->_promotions = (NSArray *)v7;

    v9 = [v5 objectForKey:@"orderings"];
    uint64_t v10 = objc_msgSend(v9, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_768);
    orderings = v4->_orderings;
    v4->_orderings = (NSArray *)v10;

    uint64_t v12 = [v5 PKDateForKey:@"lastAddedDate"];
    lastAddedDate = v4->_lastAddedDate;
    v4->_lastAddedDate = (NSDate *)v12;

    uint64_t v14 = [v5 PKNumberForKey:@"minRefreshPeriod"];
    minRefreshPeriod = v4->_minRefreshPeriod;
    v4->_minRefreshPeriod = (NSNumber *)v14;

    uint64_t v16 = [v5 PKNumberForKey:@"maxImpressionCount"];
    maxImpressionCount = v4->_maxImpressionCount;
    v4->_maxImpressionCount = (NSNumber *)v16;

    uint64_t v18 = [v5 PKNumberForKey:@"timeVisibleAfterCompleted"];
    timeVisibleAfterCompleted = v4->_timeVisibleAfterCompleted;
    v4->_timeVisibleAfterCompleted = (NSNumber *)v18;

LABEL_4:
    v20 = v4;
    goto LABEL_8;
  }
  v21 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    __int16 v30 = 2114;
    v31 = v25;
    _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v20 = 0;
LABEL_8:

  return v20;
}

PKAccountPromotion *__54__PKAccountWebServicePromotionsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountPromotion alloc] initWithDictionary:v2];

  return v3;
}

PKAccountEntityOrdering *__54__PKAccountWebServicePromotionsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountEntityOrdering alloc] initWithType:2 dictionary:v2];

  return v3;
}

- (NSArray)promotions
{
  return self->_promotions;
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

- (NSNumber)maxImpressionCount
{
  return self->_maxImpressionCount;
}

- (NSNumber)timeVisibleAfterCompleted
{
  return self->_timeVisibleAfterCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeVisibleAfterCompleted, 0);
  objc_storeStrong((id *)&self->_maxImpressionCount, 0);
  objc_storeStrong((id *)&self->_minRefreshPeriod, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_promotions, 0);
}

@end