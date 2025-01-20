@interface PKAccountWebServiceCustomizePhysicalCardResponse
- (NSArray)artworkOptions;
- (NSArray)nameOptions;
- (NSArray)priceOptions;
- (PKAccountWebServiceCustomizePhysicalCardResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceCustomizePhysicalCardResponse

- (PKAccountWebServiceCustomizePhysicalCardResponse)initWithData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServiceCustomizePhysicalCardResponse;
  v3 = [(PKWebServiceResponse *)&v20 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"nameOptions"];
      nameOptions = v4->_nameOptions;
      v4->_nameOptions = (NSArray *)v7;

      v9 = [v6 PKArrayContaining:objc_opt_class() forKey:@"artworkOptions"];
      uint64_t v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_375);
      artworkOptions = v4->_artworkOptions;
      v4->_artworkOptions = (NSArray *)v10;

      v12 = [v6 PKArrayContaining:objc_opt_class() forKey:@"priceOptions"];

      uint64_t v13 = [v12 pk_arrayByApplyingBlock:&__block_literal_global_382];
      priceOptions = v4->_priceOptions;
      v4->_priceOptions = (NSArray *)v13;
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        __int16 v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

PKPhysicalCardArtworkOption *__65__PKAccountWebServiceCustomizePhysicalCardResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCardArtworkOption alloc] initWithDictionary:v2];

  return v3;
}

PKPhysicalCardPriceOption *__65__PKAccountWebServiceCustomizePhysicalCardResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCardPriceOption alloc] initWithDictionary:v2];

  return v3;
}

- (NSArray)artworkOptions
{
  return self->_artworkOptions;
}

- (NSArray)nameOptions
{
  return self->_nameOptions;
}

- (NSArray)priceOptions
{
  return self->_priceOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceOptions, 0);
  objc_storeStrong((id *)&self->_nameOptions, 0);
  objc_storeStrong((id *)&self->_artworkOptions, 0);
}

@end