@interface PKPayLaterInstallmentsMonth
- (NSArray)activeInstallments;
- (NSArray)financingPlans;
- (NSArray)paidInstallments;
- (NSDate)endDate;
- (NSDate)startDate;
- (PKPayLaterInstallmentsMonth)initWithFinancingPlans:(id)a3 fallbackAmount:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (id)description;
- (id)financingPlanForInstallmentIdentifier:(id)a3;
- (id)installmentsDueInDate:(id)a3;
- (id)totalDue;
- (id)totalPaid;
- (void)_updateValues;
@end

@implementation PKPayLaterInstallmentsMonth

- (PKPayLaterInstallmentsMonth)initWithFinancingPlans:(id)a3 fallbackAmount:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterInstallmentsMonth;
  v15 = [(PKPayLaterInstallmentsMonth *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fallbackAmount, a4);
    objc_storeStrong((id *)&v16->_financingPlans, a3);
    objc_storeStrong((id *)&v16->_startDate, a5);
    objc_storeStrong((id *)&v16->_endDate, a6);
    [(PKPayLaterInstallmentsMonth *)v16 _updateValues];
  }

  return v16;
}

- (id)totalDue
{
  return self->_totalDue;
}

- (id)totalPaid
{
  return self->_totalPaid;
}

- (id)financingPlanForInstallmentIdentifier:(id)a3
{
  return [(NSDictionary *)self->_financingPlanByInstallmentIdentifier objectForKeyedSubscript:a3];
}

- (id)installmentsDueInDate:(id)a3
{
  installmentsByDate = self->_installmentsByDate;
  v4 = PKStartOfDay(a3);
  v5 = [(NSMutableDictionary *)installmentsByDate objectForKey:v4];
  v6 = (void *)[v5 copy];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(NSDate *)self->_startDate description];
  [v3 appendFormat:@"startDate: '%@'; ", v4];

  v5 = [(NSDate *)self->_endDate description];
  [v3 appendFormat:@"endDate: '%@'; ", v5];

  [v3 appendFormat:@"totalDue: '%@'; ", self->_totalDue];
  objc_msgSend(v3, "appendFormat:", @"%ld plans; ", -[NSArray count](self->_financingPlans, "count"));
  [v3 appendFormat:@"financingPlans: '%@'; ", self->_financingPlans];
  [v3 appendFormat:@">"];
  v6 = (void *)[v3 copy];

  return v6;
}

- (void)_updateValues
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v3 = self->_financingPlans;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    v74 = 0;
    uint64_t v7 = *(void *)v92;
    v69 = v3;
    v70 = self;
    uint64_t v68 = *(void *)v92;
    do
    {
      uint64_t v8 = 0;
      uint64_t v73 = v5;
      do
      {
        if (*(void *)v92 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v91 + 1) + 8 * v8);
        unint64_t v10 = [v9 state];
        if (v10 > 8 || ((1 << v10) & 0x10C) == 0)
        {
          uint64_t v76 = v8;
          v77 = v6;
          id v12 = [v9 scheduleSummary];
          startDate = self->_startDate;
          endDate = self->_endDate;
          v15 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EE22BFC0];
          uint64_t v78 = [v12 relevantInstallmentsFromPayoffDateStart:startDate payoffDateEnd:endDate statues:v15];

          v16 = self->_startDate;
          v17 = self->_endDate;
          objc_super v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE22BFD8, &unk_1EE22BFF0, &unk_1EE22C008, 0);
          v80 = [v12 relevantInstallmentsFromDueDateStart:v16 dueDateEnd:v17 statues:v18];

          v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE22BFC0, &unk_1EE22BFD8, &unk_1EE22BFF0, &unk_1EE22C008, 0);
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          v75 = v12;
          v20 = [v12 installments];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v87 objects:v96 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v88;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v88 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "status"));
                int v27 = [v19 containsObject:v26];

                if (v27)
                {
                  v28 = [v25 installmentIdentifier];
                  [v81 safelySetObject:v9 forKey:v28];

                  [v82 addObject:v25];
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v87 objects:v96 count:16];
            }
            while (v22);
          }

          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v30 = (void *)v78;
          objc_msgSend(v29, "pk_safelyAddObjectsFromArray:", v78);
          objc_msgSend(v29, "pk_safelyAddObjectsFromArray:", v80);
          [v71 addObjectsFromArray:v78];
          [v72 addObjectsFromArray:v80];
          self = v70;
          v31 = +[PKPayLaterFinancingPlanScheduleSummary totalDueForInstallments:v29 fallbackAmount:v70->_fallbackAmount];
          v32 = +[PKPayLaterFinancingPlanScheduleSummary totalPaidForInstallments:v29 fallbackAmount:v70->_fallbackAmount];
          if (v31)
          {
            v33 = v77;
            v34 = v74;
            if (!v74)
            {
              v35 = [MEMORY[0x1E4F28C28] zero];
              v36 = [v31 currency];
              uint64_t v37 = PKCurrencyAmountCreate(v35, v36, 0);

              v30 = (void *)v78;
              v34 = (void *)v37;
            }
            uint64_t v38 = [v34 currencyAmountByAddingCurrencyAmount:v31];

            if (!v77)
            {
              v39 = [MEMORY[0x1E4F28C28] zero];
              v40 = [v32 currency];
              v33 = PKCurrencyAmountCreate(v39, v40, 0);

              v30 = (void *)v78;
            }
            v6 = [v33 currencyAmountByAddingCurrencyAmount:v32];

            v74 = (PKCurrencyAmount *)v38;
          }
          else
          {
            v6 = v77;
          }
          uint64_t v7 = v68;
          v3 = v69;

          uint64_t v5 = v73;
          uint64_t v8 = v76;
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v74 = 0;
  }

  v41 = [v71 sortedArrayUsingComparator:&__block_literal_global_36];
  v42 = (void *)[v41 mutableCopy];

  v43 = [v72 sortedArrayUsingComparator:&__block_literal_global_36];
  v44 = (void *)[v43 mutableCopy];

  v79 = v44;
  if ([v44 count])
  {
    v45 = (NSArray *)[v44 copy];
    activeInstallments = self->_activeInstallments;
    self->_activeInstallments = v45;
  }
  else
  {
    activeInstallments = self->_activeInstallments;
    self->_activeInstallments = 0;
  }

  if ([v42 count])
  {
    v47 = (NSArray *)[v42 copy];
    paidInstallments = self->_paidInstallments;
    self->_paidInstallments = v47;
  }
  else
  {
    paidInstallments = self->_paidInstallments;
    self->_paidInstallments = 0;
  }

  if ([v82 count])
  {
    v49 = (NSArray *)[v82 copy];
    allInstallments = self->_allInstallments;
    self->_allInstallments = v49;
  }
  else
  {
    allInstallments = self->_allInstallments;
    self->_allInstallments = 0;
  }

  if ([v81 count])
  {
    v51 = (NSDictionary *)[v81 copy];
    financingPlanByInstallmentIdentifier = self->_financingPlanByInstallmentIdentifier;
    self->_financingPlanByInstallmentIdentifier = v51;
  }
  else
  {
    financingPlanByInstallmentIdentifier = self->_financingPlanByInstallmentIdentifier;
    self->_financingPlanByInstallmentIdentifier = 0;
  }

  fallbackAmount = v74;
  if (!v74) {
    fallbackAmount = self->_fallbackAmount;
  }
  objc_storeStrong((id *)&self->_totalDue, fallbackAmount);
  v54 = v6;
  if (!v6) {
    v54 = self->_fallbackAmount;
  }
  objc_storeStrong((id *)&self->_totalPaid, v54);
  v55 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  installmentsByDate = self->_installmentsByDate;
  self->_installmentsByDate = v55;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v57 = self->_allInstallments;
  uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v84 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v83 + 1) + 8 * j);
        unint64_t v63 = [v62 status];
        if (v63 <= 4 && ((1 << v63) & 0x1A) != 0)
        {
          v65 = [v62 dueDate];
          v66 = PKStartOfDay(v65);

          id v67 = [(NSMutableDictionary *)self->_installmentsByDate objectForKey:v66];
          if (!v67) {
            id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v67 addObject:v62];
          [(NSMutableDictionary *)self->_installmentsByDate setObject:v67 forKey:v66];
        }
      }
      uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v83 objects:v95 count:16];
    }
    while (v59);
  }
}

uint64_t __44__PKPayLaterInstallmentsMonth__updateValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 dueDate];
  v6 = [v4 dueDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)financingPlans
{
  return self->_financingPlans;
}

- (NSArray)paidInstallments
{
  return self->_paidInstallments;
}

- (NSArray)activeInstallments
{
  return self->_activeInstallments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInstallments, 0);
  objc_storeStrong((id *)&self->_paidInstallments, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_installmentsByDate, 0);
  objc_storeStrong((id *)&self->_financingPlanByInstallmentIdentifier, 0);
  objc_storeStrong((id *)&self->_allInstallments, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_totalPaid, 0);
  objc_storeStrong((id *)&self->_totalDue, 0);
}

@end