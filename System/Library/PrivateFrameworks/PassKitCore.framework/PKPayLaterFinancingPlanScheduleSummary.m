@interface PKPayLaterFinancingPlanScheduleSummary
+ (BOOL)supportsSecureCoding;
+ (id)totalAmountForInstallments:(id)a3 fallbackAmount:(id)a4;
+ (id)totalDueForInstallments:(id)a3 fallbackAmount:(id)a4;
+ (id)totalPaidForInstallments:(id)a3 fallbackAmount:(id)a4;
- (BOOL)hasPaymentsOrInstallmentsAfterInstallmentDueDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterScheduleSummary:(id)a3;
- (BOOL)paymentIdentifierDidPayoffFinancingPlan:(id)a3;
- (NSArray)installments;
- (NSArray)payments;
- (PKPayLaterFinancingPlanScheduleSummary)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlanScheduleSummary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyAmountOfPaymentIdentifierAffectingOtherInstallments:(id)a3 relativeInstallmentIdentifier:(id)a4 installmentsAreInOrder:(BOOL *)a5 countOfInstallments:(int64_t *)a6;
- (id)description;
- (id)dictionaryRepresentation;
- (id)firstInstallmentIdentifierAffectedByPaymentIdentifier:(id)a3;
- (id)installmentsAffectedByPaymentIdentifier:(id)a3;
- (id)lastPayment;
- (id)nextDueInstallment;
- (id)paymentsAfterInstallmentDueDate:(id)a3;
- (id)paymentsOfType:(unint64_t)a3;
- (id)paymentsWithIdentifier:(id)a3;
- (id)relevantInstallmentsFromDueDateStart:(id)a3 dueDateEnd:(id)a4 statues:(id)a5;
- (id)relevantInstallmentsFromPayoffDateStart:(id)a3 payoffDateEnd:(id)a4 statues:(id)a5;
- (int64_t)countOfInstallmentsAffectedByPaymentIdentifier:(id)a3;
- (int64_t)installmentNumberForInstallmentIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)scheduleSummaryReason;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallments:(id)a3;
- (void)setPayments:(id)a3;
- (void)setScheduleSummaryReason:(unint64_t)a3;
@end

@implementation PKPayLaterFinancingPlanScheduleSummary

- (PKPayLaterFinancingPlanScheduleSummary)initWithDictionary:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)PKPayLaterFinancingPlanScheduleSummary;
  v5 = [(PKPayLaterFinancingPlanScheduleSummary *)&v66 init];
  if (v5)
  {
    v6 = [v4 PKArrayForKey:@"installments"];
    if ([v6 count])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v8 = v6;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v68 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v63;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v63 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [[PKPayLaterInstallment alloc] initWithDictionary:*(void *)(*((void *)&v62 + 1) + 8 * v13)];
            [v7 safelyAddObject:v14];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v68 count:16];
        }
        while (v11);
      }

      uint64_t v15 = [v7 copy];
      installments = v5->_installments;
      v5->_installments = (NSArray *)v15;

      v6 = v8;
    }
    v17 = [v4 PKArrayForKey:@"payments"];
    if ([v17 count])
    {
      v57 = v6;
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v19 = v17;
      id v20 = v17;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v59;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v59 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = [[PKPayLaterPayment alloc] initWithDictionary:*(void *)(*((void *)&v58 + 1) + 8 * v24)];
            [v18 safelyAddObject:v25];

            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v22);
      }

      uint64_t v26 = [v18 copy];
      payments = v5->_payments;
      v5->_payments = (NSArray *)v26;

      v6 = v57;
      v17 = v19;
    }
    v28 = [v4 PKStringForKey:@"scheduleSummaryReason"];
    v29 = v28;
    if (v28 == @"disasterRecovery") {
      goto LABEL_23;
    }
    if (v28)
    {
      char v30 = [(__CFString *)v28 isEqualToString:@"disasterRecovery"];

      if (v30)
      {
LABEL_23:
        uint64_t v31 = 1;
LABEL_49:

        v5->_scheduleSummaryReason = v31;
        goto LABEL_50;
      }
      v32 = v29;
      if (v32 == @"activeMilitary"
        || (v33 = v32,
            char v34 = [(__CFString *)v32 isEqualToString:@"activeMilitary"],
            v33,
            (v34 & 1) != 0))
      {
        uint64_t v31 = 2;
        goto LABEL_49;
      }
      v35 = v33;
      if (v35 == @"hardshipBenefitorPlan"
        || (v36 = v35,
            char v37 = [(__CFString *)v35 isEqualToString:@"hardshipBenefitorPlan"],
            v36,
            (v37 & 1) != 0))
      {
        uint64_t v31 = 3;
        goto LABEL_49;
      }
      v38 = v36;
      if (v38 == @"overPayment"
        || (v39 = v38,
            char v40 = [(__CFString *)v38 isEqualToString:@"overPayment"],
            v39,
            (v40 & 1) != 0))
      {
        uint64_t v31 = 4;
        goto LABEL_49;
      }
      v41 = v39;
      if (v41 == @"earlyPayment"
        || (v42 = v41,
            char v43 = [(__CFString *)v41 isEqualToString:@"earlyPayment"],
            v42,
            (v43 & 1) != 0))
      {
        uint64_t v31 = 5;
        goto LABEL_49;
      }
      v44 = v42;
      if (v44 == @"RAPDeferral"
        || (v45 = v44,
            char v46 = [(__CFString *)v44 isEqualToString:@"RAPDeferral"],
            v45,
            (v46 & 1) != 0))
      {
        uint64_t v31 = 7;
        goto LABEL_49;
      }
      v47 = v45;
      if (v47 == @"interestCreditLateCapture"
        || (v48 = v47,
            char v49 = [(__CFString *)v47 isEqualToString:@"interestCreditLateCapture"],
            v48,
            (v49 & 1) != 0))
      {
        uint64_t v31 = 8;
        goto LABEL_49;
      }
      v50 = v48;
      if (v50 == @"latePayment"
        || (v51 = v50,
            char v52 = [(__CFString *)v50 isEqualToString:@"latePayment"],
            v51,
            (v52 & 1) != 0))
      {
        uint64_t v31 = 6;
        goto LABEL_49;
      }
      v53 = v51;
      if (v53 == @"paymentReversal"
        || (v54 = v53,
            int v55 = [(__CFString *)v53 isEqualToString:@"paymentReversal"],
            v54,
            v55))
      {
        uint64_t v31 = 9;
        goto LABEL_49;
      }
    }
    uint64_t v31 = 0;
    goto LABEL_49;
  }
LABEL_50:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_installments pk_arrayBySafelyApplyingBlock:&__block_literal_global_134];
  [v3 setObject:v4 forKeyedSubscript:@"installments"];

  v5 = [(NSArray *)self->_payments pk_arrayBySafelyApplyingBlock:&__block_literal_global_25];
  [v3 setObject:v5 forKeyedSubscript:@"payments"];

  unint64_t v6 = self->_scheduleSummaryReason - 1;
  if (v6 > 8) {
    id v7 = @"unknown";
  }
  else {
    id v7 = off_1E56EC220[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"scheduleSummaryReason"];
  v8 = (void *)[v3 copy];

  return v8;
}

uint64_t __66__PKPayLaterFinancingPlanScheduleSummary_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __66__PKPayLaterFinancingPlanScheduleSummary_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)lastPayment
{
  v2 = [(NSArray *)self->_payments sortedArrayUsingComparator:&__block_literal_global_28_4];
  id v3 = [v2 lastObject];

  return v3;
}

uint64_t __53__PKPayLaterFinancingPlanScheduleSummary_lastPayment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 postedDate];
  unint64_t v6 = [v4 postedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)paymentsOfType:(unint64_t)a3
{
  payments = self->_payments;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PKPayLaterFinancingPlanScheduleSummary_paymentsOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e34_B32__0__PKPayLaterPayment_8Q16_B24l;
  v6[4] = a3;
  id v4 = [(NSArray *)payments pk_objectsPassingTest:v6];
  return v4;
}

BOOL __57__PKPayLaterFinancingPlanScheduleSummary_paymentsOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)paymentsWithIdentifier:(id)a3
{
  id v4 = a3;
  payments = self->_payments;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKPayLaterFinancingPlanScheduleSummary_paymentsWithIdentifier___block_invoke;
  v9[3] = &unk_1E56E3100;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)payments pk_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __65__PKPayLaterFinancingPlanScheduleSummary_paymentsWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (int64_t)countOfInstallmentsAffectedByPaymentIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_installments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) payments];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __89__PKPayLaterFinancingPlanScheduleSummary_countOfInstallmentsAffectedByPaymentIdentifier___block_invoke;
        v13[3] = &unk_1E56E23F0;
        id v14 = v4;
        v8 += objc_msgSend(v11, "pk_countObjectsPassingTest:", v13);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

uint64_t __89__PKPayLaterFinancingPlanScheduleSummary_countOfInstallmentsAffectedByPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)installmentsAffectedByPaymentIdentifier:(id)a3
{
  id v4 = a3;
  installments = self->_installments;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke;
  v9[3] = &unk_1E56E23C8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)installments pk_objectsPassingTest:v9];

  return v7;
}

uint64_t __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke_2;
  v6[3] = &unk_1E56E30D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 paymentIdentifier];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (BOOL)paymentIdentifierDidPayoffFinancingPlan:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPayLaterFinancingPlanScheduleSummary *)self paymentsWithIdentifier:v4];

  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_installments;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "paymentIdentitiferContributedToInstallment:", v4, (void)v17))
          {
            if (!v9) {
              id v9 = v12;
            }
            if ([v12 status] != 3
              || ([v12 payments],
                  uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v14 = [v13 count],
                  v13,
                  v14 != 1))
            {
LABEL_17:

              BOOL v15 = 0;
              goto LABEL_21;
            }
          }
          else if (v9)
          {
            goto LABEL_17;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = 0;
    }

    BOOL v15 = v9 != 0;
LABEL_21:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)firstInstallmentIdentifierAffectedByPaymentIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_installments;
  id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "paymentIdentitiferContributedToInstallment:", v4, (void)v11))
        {
          id v6 = [v9 installmentIdentifier];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasPaymentsOrInstallmentsAfterInstallmentDueDate:(id)a3
{
  id v4 = a3;
  payments = self->_payments;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke;
  v12[3] = &unk_1E56E3100;
  id v6 = v4;
  id v13 = v6;
  if ([(NSArray *)payments pk_containsObjectPassingTest:v12])
  {
    char v7 = 1;
  }
  else
  {
    installments = self->_installments;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke_2;
    v10[3] = &unk_1E56EC1D8;
    id v11 = v6;
    char v7 = [(NSArray *)installments pk_containsObjectPassingTest:v10];
  }
  return v7;
}

BOOL __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 postedDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

BOOL __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 dueDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

- (id)paymentsAfterInstallmentDueDate:(id)a3
{
  id v4 = a3;
  payments = self->_payments;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke;
  v10[3] = &unk_1E56E23F0;
  id v11 = v4;
  id v6 = v4;
  char v7 = [(NSArray *)payments pk_objectsPassingTest:v10];
  uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_35];

  return v8;
}

BOOL __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 postedDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

uint64_t __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 postedDate];
  id v6 = [v4 postedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)currencyAmountOfPaymentIdentifierAffectingOtherInstallments:(id)a3 relativeInstallmentIdentifier:(id)a4 installmentsAreInOrder:(BOOL *)a5 countOfInstallments:(int64_t *)a6
{
  id v37 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v34 = a6;
  v36 = a5;
  long long v12 = 0;
  if ([(NSArray *)self->_installments count])
  {
    for (unint64_t i = 0; i < [(NSArray *)self->_installments count]; ++i)
    {
      long long v14 = -[NSArray objectAtIndexedSubscript:](self->_installments, "objectAtIndexedSubscript:", i, v34);
      BOOL v15 = [v14 installmentIdentifier];
      id v16 = v10;
      id v17 = v15;
      if (v17 == v16)
      {
      }
      else
      {
        long long v18 = v17;
        if (v10 && v17)
        {
          char v19 = [v16 isEqualToString:v17];

          if (v19) {
            goto LABEL_16;
          }
        }
        else
        {
        }
        long long v20 = [v14 appliedPayments];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __175__PKPayLaterFinancingPlanScheduleSummary_currencyAmountOfPaymentIdentifierAffectingOtherInstallments_relativeInstallmentIdentifier_installmentsAreInOrder_countOfInstallments___block_invoke;
        v38[3] = &unk_1E56E30D8;
        id v39 = v37;
        uint64_t v21 = objc_msgSend(v20, "pk_firstObjectPassingTest:", v38);

        if (v21)
        {
          uint64_t v22 = [NSNumber numberWithInteger:i];
          [v11 addObject:v22];

          uint64_t v23 = [v21 amountApplied];
          uint64_t v24 = (void *)v23;
          if (v12)
          {
            uint64_t v25 = [v12 currencyAmountByAddingCurrencyAmount:v23];

            long long v12 = (void *)v25;
          }
          else
          {
            long long v12 = (void *)v23;
          }
        }

        id v16 = v39;
      }

LABEL_16:
    }
  }
  int64_t v26 = -[PKPayLaterFinancingPlanScheduleSummary installmentNumberForInstallmentIdentifier:](self, "installmentNumberForInstallmentIdentifier:", v10, v34);
  if ([v11 count])
  {
    unint64_t v27 = 0;
    int64_t v28 = v26 + 1;
    v29 = v35;
    do
    {
      char v30 = [v11 objectAtIndexedSubscript:v27];
      uint64_t v31 = [v30 integerValue];

      BOOL v32 = v28 + v27 == v31;
      if (v28 + v27 != v31) {
        break;
      }
      ++v27;
    }
    while (v27 < [v11 count]);
  }
  else
  {
    BOOL v32 = 1;
    v29 = v35;
  }
  if (v36) {
    BOOL *v36 = v32;
  }
  if (v29) {
    void *v29 = [v11 count];
  }

  return v12;
}

uint64_t __175__PKPayLaterFinancingPlanScheduleSummary_currencyAmountOfPaymentIdentifierAffectingOtherInstallments_relativeInstallmentIdentifier_installmentsAreInOrder_countOfInstallments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)nextDueInstallment
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_installments;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v8 = objc_msgSend(v7, "status", (void)v12);
        if (v8 <= 4 && ((1 << v8) & 0x16) != 0)
        {
          id v10 = v7;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v10 = 0;
    }
    while (v4);
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:

  return v10;
}

- (int64_t)installmentNumberForInstallmentIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_installments count])
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_installments objectAtIndexedSubscript:v5];
      uint64_t v7 = [v6 installmentIdentifier];
      id v8 = v4;
      id v9 = v7;
      if (v9 == v8) {
        break;
      }
      id v10 = v9;
      if (v4 && v9)
      {
        char v11 = [v8 isEqualToString:v9];

        if (v11) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      if (++v5 >= [(NSArray *)self->_installments count]) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v5;
}

- (id)relevantInstallmentsFromDueDateStart:(id)a3 dueDateEnd:(id)a4 statues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  installments = self->_installments;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromDueDateStart_dueDateEnd_statues___block_invoke;
  v17[3] = &unk_1E56EC200;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  long long v15 = [(NSArray *)installments pk_objectsPassingTest:v17];

  return v15;
}

BOOL __98__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromDueDateStart_dueDateEnd_statues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dueDate];
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = NSNumber;
  uint64_t v7 = [v3 status];

  id v8 = [v6 numberWithUnsignedInteger:v7];
  if ([v5 containsObject:v8]) {
    BOOL IsBetweenDates = PKDateIsBetweenDates(v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  }
  else {
    BOOL IsBetweenDates = 0;
  }

  return IsBetweenDates;
}

- (id)relevantInstallmentsFromPayoffDateStart:(id)a3 payoffDateEnd:(id)a4 statues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  installments = self->_installments;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromPayoffDateStart_payoffDateEnd_statues___block_invoke;
  v17[3] = &unk_1E56EC200;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  long long v15 = [(NSArray *)installments pk_objectsPassingTest:v17];

  return v15;
}

BOOL __104__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromPayoffDateStart_payoffDateEnd_statues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 payoffDate];
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = NSNumber;
  uint64_t v7 = [v3 status];

  id v8 = [v6 numberWithUnsignedInteger:v7];
  if ([v5 containsObject:v8]) {
    BOOL IsBetweenDates = PKDateIsBetweenDates(v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  }
  else {
    BOOL IsBetweenDates = 0;
  }

  return IsBetweenDates;
}

+ (id)totalPaidForInstallments:(id)a3 fallbackAmount:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((unint64_t)([v12 status] - 1) <= 3)
        {
          id v13 = [v12 amountPaid];
          if (v13)
          {
            if (!v9)
            {
              id v14 = [MEMORY[0x1E4F28C28] zero];
              long long v15 = [v13 currency];
              id v9 = PKCurrencyAmountCreate(v14, v15, 0);
            }
            uint64_t v16 = [v13 currencyAmountByAddingCurrencyAmount:v9];

            id v9 = (void *)v16;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  if (v9) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = v6;
  }
  id v18 = v17;

  return v18;
}

+ (id)totalDueForInstallments:(id)a3 fallbackAmount:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = [v12 status];
        if (v13 == 4 || v13 == 1)
        {
          long long v15 = [v12 currentBalance];
          if (v15)
          {
            if (!v9)
            {
              uint64_t v16 = [MEMORY[0x1E4F28C28] zero];
              uint64_t v17 = [v15 currency];
              id v9 = PKCurrencyAmountCreate(v16, v17, 0);
            }
            uint64_t v18 = [v15 currencyAmountByAddingCurrencyAmount:v9];

            id v9 = (void *)v18;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  if (v9) {
    id v19 = v9;
  }
  else {
    id v19 = v6;
  }
  id v20 = v19;

  return v20;
}

+ (id)totalAmountForInstallments:(id)a3 fallbackAmount:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v12 = [v11 status];
        if (v12 <= 4 && ((1 << v12) & 0x1A) != 0)
        {
          id v14 = [v11 totalAmount];
          if (v14)
          {
            if (!v8)
            {
              long long v15 = [MEMORY[0x1E4F28C28] zero];
              uint64_t v16 = [v14 currency];
              uint64_t v8 = PKCurrencyAmountCreate(v15, v16, 0);
            }
            uint64_t v17 = [v14 currencyAmountByAddingCurrencyAmount:v8];

            uint64_t v8 = (void *)v17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8) {
    uint64_t v18 = v8;
  }
  else {
    uint64_t v18 = v21;
  }
  id v19 = v18;

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingPlanScheduleSummary *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFinancingPlanScheduleSummary *)self isEqualToPayLaterScheduleSummary:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterScheduleSummary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  installments = self->_installments;
  BOOL v6 = (NSArray *)v4[1];
  if (installments) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (installments != v6) {
      goto LABEL_15;
    }
  }
  else if ((-[NSArray isEqual:](installments, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  payments = self->_payments;
  uint64_t v9 = (NSArray *)v4[2];
  if (!payments || !v9)
  {
    if (payments == v9) {
      goto LABEL_13;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v10 = self->_scheduleSummaryReason == v4[3];
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_installments];
  [v3 safelyAddObject:self->_payments];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_scheduleSummaryReason - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = self->_scheduleSummaryReason - 1;
  if (v4 > 8) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EC220[v4];
  }
  [v3 appendFormat:@"scheduleSummaryReason: '%@'; ", v5];
  [v3 appendFormat:@"installments: '%@'; ", self->_installments];
  [v3 appendFormat:@"payments: '%@'; ", self->_payments];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanScheduleSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterFinancingPlanScheduleSummary;
  unint64_t v5 = [(PKPayLaterFinancingPlanScheduleSummary *)&v17 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"installments"];
    installments = v5->_installments;
    v5->_installments = (NSArray *)v9;

    char v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSArray *)v14;

    v5->_scheduleSummaryReason = [v4 decodeIntegerForKey:@"scheduleSummaryReason"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  installments = self->_installments;
  id v5 = a3;
  [v5 encodeObject:installments forKey:@"installments"];
  [v5 encodeObject:self->_payments forKey:@"payments"];
  [v5 encodeInteger:self->_scheduleSummaryReason forKey:@"scheduleSummaryReason"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingPlanScheduleSummary allocWithZone:](PKPayLaterFinancingPlanScheduleSummary, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_installments copyWithZone:a3];
  installments = v5->_installments;
  v5->_installments = (NSArray *)v6;

  uint64_t v8 = [(NSArray *)self->_payments copyWithZone:a3];
  payments = v5->_payments;
  v5->_payments = (NSArray *)v8;

  v5->_scheduleSummaryReason = self->_scheduleSummaryReason;
  return v5;
}

- (NSArray)installments
{
  return self->_installments;
}

- (void)setInstallments:(id)a3
{
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (unint64_t)scheduleSummaryReason
{
  return self->_scheduleSummaryReason;
}

- (void)setScheduleSummaryReason:(unint64_t)a3
{
  self->_scheduleSummaryReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_installments, 0);
}

@end