@interface PKPayLaterFinancingPlanPaymentScheduleComposerItemList
- (NSArray)items;
- (PKPayLaterFinancingPlanPaymentScheduleComposerItemList)initWithFinancingPlan:(id)a3;
- (id)_itemsFromFinancingPlan:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerItemList

- (PKPayLaterFinancingPlanPaymentScheduleComposerItemList)initWithFinancingPlan:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerItemList;
  v5 = [(PKPayLaterFinancingPlanPaymentScheduleComposerItemList *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(PKPayLaterFinancingPlanPaymentScheduleComposerItemList *)v5 _itemsFromFinancingPlan:v4];
    items = v6->_items;
    v6->_items = (NSArray *)v7;
  }
  return v6;
}

- (id)_itemsFromFinancingPlan:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 scheduleSummary];
  v5 = [v4 installments];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v5;
  uint64_t v51 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v74 != v50) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v10 = [v9 status];
        if ((unint64_t)(v10 - 1) >= 2)
        {
          if (v10 == 3)
          {
            v26 = [v9 payments];
            v27 = [v26 lastObject];
            v56 = v27;
            uint64_t v58 = i;
            v54 = v9;
            if ([v27 type] == 1)
            {
              uint64_t v28 = objc_msgSend(v26, "pk_arrayByRemovingObject:", v27);

              v26 = (void *)v28;
            }
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v14 = v26;
            uint64_t v29 = [v14 countByEnumeratingWithState:&v65 objects:v78 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v66;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v66 != v31) {
                    objc_enumerationMutation(v14);
                  }
                  v33 = *(void **)(*((void *)&v65 + 1) + 8 * j);
                  v34 = [v33 paymentIdentifier];
                  if (([v7 containsObject:v34] & 1) == 0)
                  {
                    [v7 addObject:v34];
                    v35 = [[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc] initWithFinancingPlan:v3 payment:v33];
                    [v6 addObject:v35];
                  }
                }
                uint64_t v30 = [v14 countByEnumeratingWithState:&v65 objects:v78 count:16];
              }
              while (v30);
            }

            v22 = v56;
            if (v56)
            {
              v36 = [v56 paymentIdentifier];
              [v7 addObject:v36];
            }
            v25 = [[PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem alloc] initWithFinancingPlan:v3 installment:v54 payment:v56];
            uint64_t i = v58;
            goto LABEL_40;
          }
          if (v10 != 4) {
            continue;
          }
        }
        v11 = [v9 payments];
        v12 = [v11 lastObject];
        v55 = v12;
        uint64_t v57 = i;
        uint64_t v52 = [v12 type];
        v53 = v9;
        if (v52 == 5)
        {
          uint64_t v13 = objc_msgSend(v11, "pk_arrayByRemovingObject:", v12);

          v11 = (void *)v13;
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v14 = v11;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v70;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v70 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v69 + 1) + 8 * k);
              v20 = [v19 paymentIdentifier];
              if (([v7 containsObject:v20] & 1) == 0)
              {
                [v7 addObject:v20];
                v21 = [[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc] initWithFinancingPlan:v3 payment:v19];
                [v6 addObject:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v79 count:16];
          }
          while (v16);
        }

        v22 = v55;
        if (v55)
        {
          v23 = [v55 paymentIdentifier];
          [v7 addObject:v23];
        }
        uint64_t i = v57;
        if (v52 == 5) {
          v24 = [[PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem alloc] initWithFinancingPlan:v3 installment:v53 payment:v55];
        }
        else {
          v24 = [[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem alloc] initWithFinancingPlan:v3 installment:v53];
        }
        v25 = (PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *)v24;
LABEL_40:
        [v6 addObject:v25];
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v51);
  }

  v37 = [v3 scheduleSummary];
  v38 = [v37 payments];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke;
  v63[3] = &unk_1E59D7680;
  id v39 = v7;
  id v64 = v39;
  v40 = objc_msgSend(v38, "pk_objectsPassingTest:", v63);

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v41 = v40;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = [[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc] initWithFinancingPlan:v3 payment:*(void *)(*((void *)&v59 + 1) + 8 * m)];
        [v6 addObject:v46];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v59 objects:v77 count:16];
    }
    while (v43);
  }

  v47 = [v6 sortedArrayUsingComparator:&__block_literal_global_130];

  return v47;
}

uint64_t __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 paymentIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end