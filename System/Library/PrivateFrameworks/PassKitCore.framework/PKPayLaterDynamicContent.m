@interface PKPayLaterDynamicContent
+ (id)_contentByPageTypeFromDictionary:(id)a3;
- (PKPayLaterDynamicContent)initWithDictionary:(id)a3;
- (id)description;
- (id)dynamicContentPageForPageType:(unint64_t)a3;
- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5;
@end

@implementation PKPayLaterDynamicContent

- (PKPayLaterDynamicContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _contentByPageTypeFromDictionary:v4];

  if ([v5 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPayLaterDynamicContent;
    v6 = [(PKPayLaterDynamicContent *)&v11 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      contentByPageType = v6->_contentByPageType;
      v6->_contentByPageType = (NSDictionary *)v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_contentByPageTypeFromDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PKPayLaterDynamicContent__contentByPageTypeFromDictionary___block_invoke;
  v9[3] = &unk_1E56DCAC8;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v6 count]) {
    uint64_t v7 = (void *)[v6 copy];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

void __61__PKPayLaterDynamicContent__contentByPageTypeFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (__CFString *)v5;
  v60 = v7;
  if (v7 == @"payLaterTab")
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (!v7)
    {
      id v10 = 0;
      goto LABEL_58;
    }
    char v8 = [(__CFString *)v7 isEqualToString:@"payLaterTab"];

    if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      objc_super v11 = v60;
      if (v11 == @"splashScreen"
        || (v12 = v11,
            char v13 = [(__CFString *)v11 isEqualToString:@"splashScreen"],
            v12,
            (v13 & 1) != 0))
      {
        uint64_t v9 = 2;
      }
      else
      {
        v14 = v12;
        if (v14 == @"paymentPlan"
          || (v15 = v14,
              char v16 = [(__CFString *)v14 isEqualToString:@"paymentPlan"],
              v15,
              (v16 & 1) != 0))
        {
          uint64_t v9 = 4;
        }
        else
        {
          v17 = v15;
          if (v17 == @"paymentMethod"
            || (v18 = v17,
                char v19 = [(__CFString *)v17 isEqualToString:@"paymentMethod"],
                v18,
                (v19 & 1) != 0))
          {
            uint64_t v9 = 5;
          }
          else
          {
            v20 = v18;
            if (v20 == @"paymentOptions"
              || (v21 = v20,
                  char v22 = [(__CFString *)v20 isEqualToString:@"paymentOptions"],
                  v21,
                  (v22 & 1) != 0))
            {
              uint64_t v9 = 6;
            }
            else
            {
              v23 = v21;
              if (v23 == @"selectedFinancingOption"
                || (v24 = v23,
                    char v25 = [(__CFString *)v23 isEqualToString:@"selectedFinancingOption"],
                    v24,
                    (v25 & 1) != 0))
              {
                uint64_t v9 = 7;
              }
              else
              {
                v26 = v24;
                if (v26 == @"selectedFinancingOptionLineItems"
                  || (v27 = v26,
                      char v28 = [(__CFString *)v26 isEqualToString:@"selectedFinancingOptionLineItems"], v27, (v28 & 1) != 0))
                {
                  uint64_t v9 = 8;
                }
                else
                {
                  v29 = v27;
                  if (v29 == @"moreInformation"
                    || (v30 = v29,
                        char v31 = [(__CFString *)v29 isEqualToString:@"moreInformation"],
                        v30,
                        (v31 & 1) != 0))
                  {
                    uint64_t v9 = 9;
                  }
                  else
                  {
                    v32 = v30;
                    if (v32 == @"userEnteredAmount"
                      || (v33 = v32,
                          char v34 = [(__CFString *)v32 isEqualToString:@"userEnteredAmount"],
                          v33,
                          (v34 & 1) != 0))
                    {
                      uint64_t v9 = 10;
                    }
                    else
                    {
                      v35 = v33;
                      if (v35 == @"approvalScreen"
                        || (v36 = v35,
                            char v37 = [(__CFString *)v35 isEqualToString:@"approvalScreen"],
                            v36,
                            (v37 & 1) != 0))
                      {
                        uint64_t v9 = 11;
                      }
                      else
                      {
                        v38 = v36;
                        if (v38 == @"loadingScreen"
                          || (v39 = v38,
                              char v40 = [(__CFString *)v38 isEqualToString:@"loadingScreen"],
                              v39,
                              (v40 & 1) != 0))
                        {
                          uint64_t v9 = 3;
                        }
                        else
                        {
                          v41 = v39;
                          if (v41 == @"disputeTopicExplanation"
                            || (v42 = v41,
                                char v43 = [(__CFString *)v41 isEqualToString:@"disputeTopicExplanation"], v42, (v43 & 1) != 0))
                          {
                            uint64_t v9 = 12;
                          }
                          else
                          {
                            v44 = v42;
                            if (v44 == @"languageDisclosure"
                              || (v45 = v44,
                                  char v46 = [(__CFString *)v44 isEqualToString:@"languageDisclosure"], v45, (v46 & 1) != 0))
                            {
                              uint64_t v9 = 13;
                            }
                            else
                            {
                              v47 = v45;
                              if (v47 == @"dashboardDispute"
                                || (v48 = v47,
                                    char v49 = [(__CFString *)v47 isEqualToString:@"dashboardDispute"], v48, (v49 & 1) != 0))
                              {
                                uint64_t v9 = 14;
                              }
                              else
                              {
                                v50 = v48;
                                if (v50 == @"changeShippingMethod"
                                  || (v51 = v50,
                                      char v52 = [(__CFString *)v50 isEqualToString:@"changeShippingMethod"], v51, (v52 & 1) != 0))
                                {
                                  uint64_t v9 = 15;
                                }
                                else
                                {
                                  v53 = v51;
                                  if (v53 == @"currentObligations"
                                    || (v54 = v53,
                                        char v55 = [(__CFString *)v53 isEqualToString:@"currentObligations"], v54, (v55 & 1) != 0))
                                  {
                                    uint64_t v9 = 16;
                                  }
                                  else
                                  {
                                    v56 = v54;
                                    if (v56 != @"financingPlanCancellationReasons")
                                    {
                                      id v10 = (PKPayLaterDynamicContentPage *)v56;
                                      int v57 = [(__CFString *)v56 isEqualToString:@"financingPlanCancellationReasons"];

                                      if (!v57) {
                                        goto LABEL_58;
                                      }
                                    }
                                    uint64_t v9 = 17;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v7 = v60;
  }

  id v10 = [[PKPayLaterDynamicContentPage alloc] initWithDictionary:v6 pageType:v9];
  if (v10)
  {
    v58 = *(void **)(a1 + 32);
    v59 = [NSNumber numberWithUnsignedInteger:v9];
    [v58 setObject:v10 forKey:v59];
  }
LABEL_58:
}

- (id)dynamicContentPageForPageType:(unint64_t)a3
{
  contentByPageType = self->_contentByPageType;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)contentByPageType objectForKey:v4];

  return v5;
}

- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(PKPayLaterDynamicContent *)self dynamicContentPageForPageType:a3];
  id v10 = [v9 dynamicContentPageForProductType:a4 optionIdentifier:v8];

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  contentByPageType = self->_contentByPageType;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PKPayLaterDynamicContent_description__block_invoke;
  v8[3] = &unk_1E56E8AD0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)contentByPageType enumerateKeysAndObjectsUsingBlock:v8];
  [v5 appendFormat:@">"];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __39__PKPayLaterDynamicContent_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  PKPayLaterDynamicContentPageTypeToString([a2 integerValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) appendFormat:@"pageString: '%@'; => %@", v6, v5];
}

- (void).cxx_destruct
{
}

@end