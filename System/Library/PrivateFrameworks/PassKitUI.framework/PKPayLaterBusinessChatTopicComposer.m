@interface PKPayLaterBusinessChatTopicComposer
- (PKPayLaterBusinessChatTopicComposer)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7;
- (id)_staticBusinessChatTopicsForContext:(unint64_t)a3;
- (id)_staticFinancingPlanContextBusinessChatTopics;
- (id)_staticFinancingPlanPaymentContextBusinessChatTopics;
- (id)_staticPassContextBusinessChatTopics;
- (void)_allBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4;
- (void)_dynamicBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4;
- (void)_releventTopicsForPassContextWithCompletion:(id)a3;
- (void)releventTopicsForContext:(unint64_t)a3 completion:(id)a4;
@end

@implementation PKPayLaterBusinessChatTopicComposer

- (PKPayLaterBusinessChatTopicComposer)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterBusinessChatTopicComposer;
  v17 = [(PKPayLaterBusinessChatTopicComposer *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_financingPlan, a5);
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    objc_storeStrong((id *)&v18->_payLaterPass, a4);
    objc_storeStrong((id *)&v18->_installment, a6);
    objc_storeStrong((id *)&v18->_payment, a7);
    v19 = (PKAccountService *)objc_alloc_init(MEMORY[0x1E4F84270]);
    accountService = v18->_accountService;
    v18->_accountService = v19;

    uint64_t v21 = [MEMORY[0x1E4F84D50] sharedService];
    paymentWebService = v18->_paymentWebService;
    v18->_paymentWebService = (PKPaymentWebService *)v21;
  }
  return v18;
}

- (void)releventTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if (a3 - 2 < 2)
    {
      -[PKPayLaterBusinessChatTopicComposer _allBusinessChatTopicsForContext:completion:](self, "_allBusinessChatTopicsForContext:completion:", a3);
    }
    else if (a3)
    {
      if (a3 == 1) {
        [(PKPayLaterBusinessChatTopicComposer *)self _releventTopicsForPassContextWithCompletion:v6];
      }
    }
    else
    {
      v6[2](v6, 0);
    }
  }

  MEMORY[0x1F4181870]();
}

- (void)_releventTopicsForPassContextWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke;
    v5[3] = &unk_1E59D3B08;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    id v6 = v4;
    [(PKPayLaterBusinessChatTopicComposer *)self _allBusinessChatTopicsForContext:1 completion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2;
  v6[3] = &unk_1E59D11A8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v24 = WeakRetained;
    v28 = [*(id *)(*(void *)(a1 + 32) + 32) accountIdentifier];
    id v27 = objc_alloc_init(MEMORY[0x1E4F84518]);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v26 = a1;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v4 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v47 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v9 = [v8 relevantFinancingPlanStates];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v43 != v12) {
                  objc_enumerationMutation(v9);
                }
                [v3 setObject:&unk_1EF2B9168 forKey:*(void *)(*((void *)&v42 + 1) + 8 * j)];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v11);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v5);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    long long v38 = 0u;
    id v14 = v3;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * k);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_14;
          v33[3] = &unk_1E59CF430;
          id v34 = v28;
          uint64_t v35 = v19;
          uint64_t v36 = *(void *)(v26 + 32);
          id v20 = v14;
          id v37 = v20;
          [v27 addOperation:v33];
        }
        uint64_t v16 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v16);
    }

    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_4;
    v29[3] = &unk_1E59D3AE0;
    id v30 = *(id *)(v26 + 40);
    id v31 = v14;
    id v32 = *(id *)(v26 + 48);
    id v22 = v14;
    id v23 = (id)[v27 evaluateWithInput:v21 completion:v29];

    id WeakRetained = v24;
  }
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:*(void *)(a1 + 32) queryItems:64];
  v20[0] = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v8 setCountFinancingPlanStates:v9];

  uint64_t v10 = *(void **)(*(void *)(a1 + 48) + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2_17;
  v15[3] = &unk_1E59D3AB8;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 40);
  id v16 = v11;
  uint64_t v17 = v12;
  id v18 = v6;
  id v19 = v7;
  id v13 = v6;
  id v14 = v7;
  [v10 financingPlansWithQuery:v8 completion:v15];
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CD0E0;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) financingPlanCount];
  id v3 = *(void **)(a1 + 40);
  id v4 = [NSNumber numberWithInteger:v2];
  [v3 setObject:v4 forKey:*(void *)(a1 + 48)];

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v5();
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v3) {
    goto LABEL_19;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v28;
  uint64_t v19 = *(void *)v28;
  id v20 = v2;
  do
  {
    uint64_t v6 = 0;
    uint64_t v21 = v4;
    do
    {
      if (*(void *)v28 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
      id v8 = objc_msgSend(v7, "relevantFinancingPlanStates", v19, v20);
      if (![v8 count])
      {
LABEL_15:
        [v2 addObject:v7];
        goto LABEL_17;
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = [*(id *)(a1 + 40) objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            v12 += [v15 integerValue];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v11);

        BOOL v16 = v12 < 1;
        uint64_t v5 = v19;
        id v2 = v20;
        uint64_t v4 = v21;
        if (!v16) {
          goto LABEL_15;
        }
      }
      else
      {
      }
LABEL_17:

      ++v6;
    }
    while (v6 != v4);
    uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  }
  while (v4);
LABEL_19:

  uint64_t v17 = *(void *)(a1 + 48);
  if ([v2 count])
  {
    id v18 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
  }
}

- (void)_allBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v8 = v6;
    if ([(PKAccount *)self->_payLaterAccount supportsDynamicReportIssueTopics])
    {
      [(PKPayLaterBusinessChatTopicComposer *)self _dynamicBusinessChatTopicsForContext:a3 completion:v8];
    }
    else
    {
      id v7 = [(PKPayLaterBusinessChatTopicComposer *)self _staticBusinessChatTopicsForContext:a3];
      v8[2](v8, v7);
    }
    uint64_t v6 = v8;
  }
}

- (void)_dynamicBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 12;
  if (a3 == 2) {
    uint64_t v7 = 13;
  }
  if (a3 == 3) {
    uint64_t v8 = 14;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
  id v10 = objc_alloc_init(MEMORY[0x1E4F84340]);
  [v10 setAccountIdentifier:v9];
  uint64_t v11 = [(PKAccount *)self->_payLaterAccount accountBaseURL];
  [v10 setBaseURL:v11];

  [v10 setType:v8];
  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke;
  v14[3] = &unk_1E59D3B30;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  id v15 = v13;
  [(PKPaymentWebService *)paymentWebService accountPayLaterContentWithRequest:v10 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke_2;
  v10[3] = &unk_1E59D00B8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void, void))(v3 + 16))(*(void *)(a1 + 48), 0);
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 40) reportIssueTopics];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
    }
    id WeakRetained = v5;
  }
}

- (id)_staticBusinessChatTopicsForContext:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      uint64_t v3 = [(PKPayLaterBusinessChatTopicComposer *)self _staticFinancingPlanPaymentContextBusinessChatTopics];
      break;
    case 2uLL:
      uint64_t v3 = [(PKPayLaterBusinessChatTopicComposer *)self _staticFinancingPlanContextBusinessChatTopics];
      break;
    case 1uLL:
      uint64_t v3 = [(PKPayLaterBusinessChatTopicComposer *)self _staticPassContextBusinessChatTopics];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

- (id)_staticPassContextBusinessChatTopics
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:1];
  [v2 safelyAddObject:v3];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:4];

  [v2 safelyAddObject:v4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:6];

  [v2 safelyAddObject:v5];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:5];

  [v2 safelyAddObject:v6];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:9];

  [v2 safelyAddObject:v7];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:8];

  [v2 safelyAddObject:v8];
  id v9 = (void *)[v2 copy];

  return v9;
}

- (id)_staticFinancingPlanContextBusinessChatTopics
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:1];
  [v2 safelyAddObject:v3];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:4];

  [v2 safelyAddObject:v4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:6];

  [v2 safelyAddObject:v5];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:5];

  [v2 safelyAddObject:v6];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:9];

  [v2 safelyAddObject:v7];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:8];

  [v2 safelyAddObject:v8];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:7];

  [v2 safelyAddObject:v9];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:17];

  [v2 safelyAddObject:v10];
  id v11 = (void *)[v2 copy];

  return v11;
}

- (id)_staticFinancingPlanPaymentContextBusinessChatTopics
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:3 topicType:10];
  [v2 safelyAddObject:v3];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:3 topicType:17];

  [v2 safelyAddObject:v4];
  id v5 = (void *)[v2 copy];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end