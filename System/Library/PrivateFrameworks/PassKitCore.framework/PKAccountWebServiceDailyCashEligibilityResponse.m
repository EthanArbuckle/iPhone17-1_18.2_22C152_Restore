@interface PKAccountWebServiceDailyCashEligibilityResponse
- (PKAccountDailyCashDestinationsSummary)summary;
- (PKAccountWebServiceDailyCashEligibilityResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceDailyCashEligibilityResponse

- (PKAccountWebServiceDailyCashEligibilityResponse)initWithData:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountWebServiceDailyCashEligibilityResponse;
  v3 = [(PKWebServiceResponse *)&v38 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKArrayForKey:@"destinations"];
      v7 = [v5 PKStringForKey:@"localizedTitle"];
      v8 = [v5 PKStringForKey:@"localizedFooter"];
      v9 = [v5 PKStringForKey:@"currentDestination"];
      uint64_t v32 = PKAccountRewardRedemptionTypeFromString(v9);

      if ([v6 count])
      {
        v28 = v8;
        v30 = v5;
        v31 = v4;
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v29 = v6;
        id v10 = v6;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [v15 PKStringForKey:@"localizedTitle"];
                v17 = [v15 PKStringForKey:@"localizedSubtitle"];
                v18 = [v15 PKStringForKey:@"destination"];
                uint64_t v19 = PKAccountRewardRedemptionTypeFromString(v18);

                if (v19) {
                  BOOL v20 = v16 == 0;
                }
                else {
                  BOOL v20 = 1;
                }
                if (!v20 && v17 != 0)
                {
                  v22 = [[PKAccountDailyCashDestination alloc] initWithDestination:v19 isCurrent:v19 == v32 localizedTitle:v16 localizedSubtitle:v17];
                  [v33 addObject:v22];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v12);
        }

        v23 = [PKAccountDailyCashDestinationsSummary alloc];
        v24 = (void *)[v33 copy];
        v8 = v28;
        uint64_t v25 = [(PKAccountDailyCashDestinationsSummary *)v23 initWithDestinations:v24 localizedTitle:v7 localizedFooterText:v28];
        v4 = v31;
        summary = v31->_summary;
        v31->_summary = (PKAccountDailyCashDestinationsSummary *)v25;

        v6 = v29;
        v5 = v30;
      }
    }
  }
  return v4;
}

- (PKAccountDailyCashDestinationsSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
}

@end