@interface PKPaymentRemoteContentPassActionGroupResponse
- (PKPaymentPassActionGroup)updatedActionGroup;
- (PKPaymentRemoteContentPassActionGroupResponse)initWithExistingActionGroup:(id)a3 data:(id)a4 pass:(id)a5;
- (void)setUpdatedActionGroup:(id)a3;
@end

@implementation PKPaymentRemoteContentPassActionGroupResponse

- (PKPaymentRemoteContentPassActionGroupResponse)initWithExistingActionGroup:(id)a3 data:(id)a4 pass:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PKPaymentRemoteContentPassActionGroupResponse;
  v8 = [(PKWebServiceResponse *)&v39 initWithData:a4];
  v9 = v8;
  if (v8)
  {
    v10 = [(PKWebServiceResponse *)v8 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v10;
      v11 = v10;
      uint64_t v12 = [(PKPaymentRemoteContentPassActionGroupResponse *)v11 PKDictionaryForKey:@"actionGroup"];
      v13 = [(PKPaymentRemoteContentPassActionGroupResponse *)v11 PKArrayForKey:@"actions"];
      v14 = [v7 actionLocalizations];
      v33 = v12;
      v15 = [[PKPaymentPassActionGroup alloc] initWithDictionary:v12 localizations:v14];
      updatedActionGroup = v9->_updatedActionGroup;
      v9->_updatedActionGroup = v15;

      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[PKPaymentPassAction alloc] initWithDictionary:*(void *)(*((void *)&v35 + 1) + 8 * i) localizations:v14];
            [v17 safelyAddObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v20);
      }

      v24 = v9->_updatedActionGroup;
      v25 = (void *)[v17 copy];
      [(PKPaymentPassActionGroup *)v24 setActions:v25];

      v10 = v34;
      v27 = v11;
      v26 = v33;
    }
    else
    {
      v26 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        __int16 v42 = 2112;
        v43 = v30;
        id v31 = v30;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v27 = v9;
      v9 = 0;
    }
  }
  return v9;
}

- (PKPaymentPassActionGroup)updatedActionGroup
{
  return self->_updatedActionGroup;
}

- (void)setUpdatedActionGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end