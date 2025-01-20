@interface PKAccountWebServicePhysicalCardsResponse
- (NSSet)expirationMessaging;
- (NSSet)physicalCards;
- (PKAccountWebServicePhysicalCardsResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServicePhysicalCardsResponse

- (PKAccountWebServicePhysicalCardsResponse)initWithData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServicePhysicalCardsResponse;
  v3 = [(PKWebServiceResponse *)&v19 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKSetContaining:objc_opt_class() forKey:@"physicalCards"];
    uint64_t v7 = objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_738);
    physicalCards = v4->_physicalCards;
    v4->_physicalCards = (NSSet *)v7;

    v9 = [v5 PKSetContaining:objc_opt_class() forKey:@"physicalCardExpirationMessaging"];
    uint64_t v10 = objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &__block_literal_global_744);
    expirationMessaging = v4->_expirationMessaging;
    v4->_expirationMessaging = (NSSet *)v10;

LABEL_4:
    v12 = v4;
    goto LABEL_8;
  }
  v13 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

PKPhysicalCard *__57__PKAccountWebServicePhysicalCardsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCard alloc] initWithDictionary:v2];

  return v3;
}

PKAccountPhysicalCardExpirationMessagingInfo *__57__PKAccountWebServicePhysicalCardsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountPhysicalCardExpirationMessagingInfo alloc] initWithDictionary:v2];

  return v3;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (NSSet)expirationMessaging
{
  return self->_expirationMessaging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationMessaging, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
}

@end