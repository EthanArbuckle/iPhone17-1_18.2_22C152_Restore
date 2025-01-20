@interface PKAccountWebServicePhysicalCardActionResponse
- (NSSet)updatedPhysicalCards;
- (PKAccountWebServicePhysicalCardActionResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServicePhysicalCardActionResponse

- (PKAccountWebServicePhysicalCardActionResponse)initWithData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKAccountWebServicePhysicalCardActionResponse;
  v3 = [(PKWebServiceResponse *)&v24 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v8 = [v6 PKArrayForKey:@"physicalCards", 0];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[PKPhysicalCard alloc] initWithDictionary:*(void *)(*((void *)&v20 + 1) + 8 * v12)];
            if (v13) {
              [v7 addObject:v13];
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v10);
      }

      uint64_t v14 = [v7 copy];
      updatedPhysicalCards = v4->_updatedPhysicalCards;
      v4->_updatedPhysicalCards = (NSSet *)v14;
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        return v4;
      }
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      id v26 = v7;
      __int16 v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  return v4;
}

- (NSSet)updatedPhysicalCards
{
  return self->_updatedPhysicalCards;
}

- (void).cxx_destruct
{
}

@end