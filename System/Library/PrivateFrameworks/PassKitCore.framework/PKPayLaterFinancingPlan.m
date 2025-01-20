@interface PKPayLaterFinancingPlan
+ (BOOL)canMakePaymentsWithAccountState:(unint64_t)a3;
+ (BOOL)requiresGenericMessagingForAccount:(id)a3 financingPlans:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)activeFinancingPlanStates;
+ (id)aprStringForNumber:(id)a3;
+ (id)completedFinancingPlanStates;
+ (id)pendingFinancingPlanStates;
- (BOOL)installmentWasPaidEarly:(id)a3;
- (BOOL)isCancellable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterFinancingPlan:(id)a3;
- (BOOL)requiresGenericMessaging;
- (BOOL)updateReasonIsInitialDownload;
- (NSArray)disputes;
- (NSDate)lastUpdated;
- (NSString)accountIdentifier;
- (NSString)planIdentifier;
- (PKPayLaterFinancingPlan)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlan)initWithDictionary:(id)a3;
- (PKPayLaterFinancingPlanFundingSource)fundingSource;
- (PKPayLaterFinancingPlanScheduleSummary)scheduleSummary;
- (PKPayLaterFinancingPlanSummary)planSummary;
- (PKPayLaterFinancingPlanTermsDetails)termsDetails;
- (PKPayLaterMerchant)merchant;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayableLoanIdentifier;
- (id)disputeWithIdentifier:(id)a3;
- (id)fundingSourceName;
- (id)nextDueInstallmentAfterInstallmentIdentifier:(id)a3;
- (id)paymentSource;
- (id)refundPaymentsNotAssociatedWithDispute;
- (unint64_t)hash;
- (unint64_t)planChannel;
- (unint64_t)productType;
- (unint64_t)state;
- (unint64_t)stateReason;
- (unint64_t)updateReasons;
- (void)_loadPaymentSource;
- (void)addUpdateReasons:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)setDisputes:(id)a3;
- (void)setFundingSource:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setPlanChannel:(unint64_t)a3;
- (void)setPlanIdentifier:(id)a3;
- (void)setPlanSummary:(id)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setRequiresGenericMessaging:(BOOL)a3;
- (void)setScheduleSummary:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateReason:(unint64_t)a3;
- (void)setTermsDetails:(id)a3;
@end

@implementation PKPayLaterFinancingPlan

- (PKPayLaterFinancingPlan)initWithDictionary:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)PKPayLaterFinancingPlan;
  v5 = [(PKPayLaterFinancingPlan *)&v79 init];
  if (!v5) {
    goto LABEL_57;
  }
  uint64_t v6 = [v4 PKStringForKey:@"planIdentifier"];
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v6;

  v8 = [v4 PKStringForKey:@"productType"];
  v5->_productType = PKPayLaterAccountProductTypeFromString(v8);

  uint64_t v9 = [v4 PKDateForKey:@"lastUpdated"];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v9;

  v11 = [v4 PKStringForKey:@"state"];
  v5->_state = PKPayLaterFinancingPlanStateFromString(v11);

  v12 = [v4 PKStringForKey:@"planChannel"];
  v13 = v12;
  if (v12 == @"inApp") {
    goto LABEL_5;
  }
  if (!v12) {
    goto LABEL_12;
  }
  char v14 = [(__CFString *)v12 isEqualToString:@"inApp"];

  if (v14)
  {
LABEL_5:
    uint64_t v15 = 1;
    goto LABEL_13;
  }
  v16 = v13;
  if (v16 == @"web"
    || (v17 = v16,
        char v18 = [(__CFString *)v16 isEqualToString:@"web"],
        v17,
        (v18 & 1) != 0))
  {
    uint64_t v15 = 2;
    goto LABEL_13;
  }
  v19 = v17;
  if (v19 == @"inStore"
    || (v20 = v19,
        int v21 = [(__CFString *)v19 isEqualToString:@"inStore"],
        v20,
        v21))
  {
    uint64_t v15 = 3;
  }
  else
  {
LABEL_12:
    uint64_t v15 = 0;
  }
LABEL_13:

  v5->_planChannel = v15;
  v22 = [v4 PKStringForKey:@"stateReason"];
  v23 = v22;
  if (v22 != @"currentUnsettled")
  {
    if (v22)
    {
      char v24 = [(__CFString *)v22 isEqualToString:@"currentUnsettled"];

      if (v24) {
        goto LABEL_16;
      }
      v26 = v23;
      if (v26 == @"currentSettled"
        || (v27 = v26,
            char v28 = [(__CFString *)v26 isEqualToString:@"currentSettled"],
            v27,
            (v28 & 1) != 0))
      {
        uint64_t v25 = 2;
        goto LABEL_39;
      }
      v29 = v27;
      if (v29 == @"paidOffZero"
        || (v30 = v29,
            char v31 = [(__CFString *)v29 isEqualToString:@"paidOffZero"],
            v30,
            (v31 & 1) != 0))
      {
        uint64_t v25 = 3;
        goto LABEL_39;
      }
      v32 = v30;
      if (v32 == @"paidOffCredit"
        || (v33 = v32,
            char v34 = [(__CFString *)v32 isEqualToString:@"paidOffCredit"],
            v33,
            (v34 & 1) != 0))
      {
        uint64_t v25 = 4;
        goto LABEL_39;
      }
      v35 = v33;
      if (v35 == @"chargedOff"
        || (v36 = v35,
            char v37 = [(__CFString *)v35 isEqualToString:@"chargedOff"],
            v36,
            (v37 & 1) != 0))
      {
        uint64_t v25 = 5;
        goto LABEL_39;
      }
      v38 = v36;
      if (v38 == @"unresolvedDispute"
        || (v39 = v38,
            char v40 = [(__CFString *)v38 isEqualToString:@"unresolvedDispute"],
            v39,
            (v40 & 1) != 0))
      {
        uint64_t v25 = 6;
        goto LABEL_39;
      }
      v41 = v39;
      if (v41 == @"fraudSuspected"
        || (v42 = v41,
            char v43 = [(__CFString *)v41 isEqualToString:@"fraudSuspected"],
            v42,
            (v43 & 1) != 0))
      {
        uint64_t v25 = 7;
        goto LABEL_39;
      }
      v44 = v42;
      if (v44 == @"fraudConfirmed"
        || (v45 = v44,
            int v46 = [(__CFString *)v44 isEqualToString:@"fraudConfirmed"],
            v45,
            v46))
      {
        uint64_t v25 = 8;
        goto LABEL_39;
      }
    }
    uint64_t v25 = 0;
    goto LABEL_39;
  }
LABEL_16:
  uint64_t v25 = 1;
LABEL_39:

  v5->_stateReason = v25;
  v5->_requiresGenericMessaging = [v4 PKBoolForKey:@"requiresGenericMessaging"];
  v5->_cancellable = [v4 PKBoolForKey:@"cancellable"];
  v47 = [v4 PKDictionaryForKey:@"planSummary"];
  if (v47)
  {
    v48 = [[PKPayLaterFinancingPlanSummary alloc] initWithDictionary:v47];
    planSummary = v5->_planSummary;
    v5->_planSummary = v48;
  }
  v50 = [v4 PKDictionaryForKey:@"scheduleSummary"];
  if (v50)
  {
    v51 = [[PKPayLaterFinancingPlanScheduleSummary alloc] initWithDictionary:v50];
    scheduleSummary = v5->_scheduleSummary;
    v5->_scheduleSummary = v51;
  }
  v53 = [v4 PKDictionaryForKey:@"merchantSummary"];
  v54 = [[PKPayLaterMerchant alloc] initWithDictionary:v53];
  merchant = v5->_merchant;
  v5->_merchant = v54;

  v56 = [v4 PKArrayForKey:@"disputes"];
  if ([v56 count])
  {
    v73 = v50;
    v74 = v47;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v58 = v56;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v76 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [[PKPayLaterFinancingPlanDispute alloc] initWithDictionary:*(void *)(*((void *)&v75 + 1) + 8 * i)];
          [v57 safelyAddObject:v63];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v75 objects:v80 count:16];
      }
      while (v60);
    }

    uint64_t v64 = [v57 copy];
    disputes = v5->_disputes;
    v5->_disputes = (NSArray *)v64;

    v50 = v73;
    v47 = v74;
  }
  v66 = [v4 PKDictionaryForKey:@"fundingSource"];
  if ([v66 count])
  {
    v67 = [[PKPayLaterFinancingPlanFundingSource alloc] initWithDictionary:v66];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = v67;
  }
  v69 = [v4 PKDictionaryForKey:@"termsDetails"];
  if ([v69 count])
  {
    v70 = [[PKPayLaterFinancingPlanTermsDetails alloc] initWithDictionary:v69];
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = v70;
  }
LABEL_57:

  return v5;
}

+ (id)aprStringForNumber:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNumberStyle:3];
  [v5 setMinimumFractionDigits:0];
  [v5 setMaximumFractionDigits:2];
  uint64_t v6 = [v5 stringFromNumber:v4];

  return v6;
}

- (id)displayableLoanIdentifier
{
  v2 = self->_planIdentifier;
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

    if (v3)
    {
      id v4 = [(NSString *)v2 componentsSeparatedByString:@"-"];
      uint64_t v5 = [v4 lastObject];

      v2 = (NSString *)v5;
    }
  }
  return v2;
}

+ (BOOL)requiresGenericMessagingForAccount:(id)a3 financingPlans:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 payLaterDetails];
  char v7 = [v6 requiresGenericMessaging];

  v8 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_55);

  if (v8) {
    return 1;
  }
  else {
    return v7;
  }
}

uint64_t __77__PKPayLaterFinancingPlan_requiresGenericMessagingForAccount_financingPlans___block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresGenericMessaging];
}

+ (BOOL)canMakePaymentsWithAccountState:(unint64_t)a3
{
  return (a3 < 6) & (6u >> a3);
}

- (BOOL)installmentWasPaidEarly:(id)a3
{
  id v4 = a3;
  if ([v4 status] == 3)
  {
    id v5 = [v4 payments];
    uint64_t v6 = [v5 lastObject];

    unint64_t v7 = [v6 type];
    if (v7 <= 7)
    {
      if (((1 << v7) & 0xF3) == 0)
      {
        BOOL v10 = 1;
LABEL_16:

        goto LABEL_17;
      }
      v8 = [(PKPayLaterFinancingPlanScheduleSummary *)self->_scheduleSummary installments];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__PKPayLaterFinancingPlan_installmentWasPaidEarly___block_invoke;
      v18[3] = &unk_1E56E23C8;
      id v19 = v4;
      uint64_t v9 = [v8 indexOfObjectPassingTest:v18];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
      }
      else
      {
        uint64_t v11 = v9;
        uint64_t v12 = [v6 postedDate];
        v13 = (void *)v12;
        BOOL v10 = 0;
        int v14 = 1;
        if (v11 >= 1 && v12)
        {
          uint64_t v15 = [v8 objectAtIndexedSubscript:v11 - 1];
          v16 = [v15 dueDate];
          if (v16)
          {
            int v14 = 0;
            BOOL v10 = [v13 compare:v16] == -1;
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        if (!v14) {
          goto LABEL_16;
        }
      }
    }
    BOOL v10 = 0;
    goto LABEL_16;
  }
  BOOL v10 = 0;
LABEL_17:

  return v10;
}

uint64_t __51__PKPayLaterFinancingPlan_installmentWasPaidEarly___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 installmentIdentifier];
  id v4 = [*(id *)(a1 + 32) installmentIdentifier];
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
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

- (id)nextDueInstallmentAfterInstallmentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayLaterFinancingPlanScheduleSummary *)self->_scheduleSummary installments];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterFinancingPlan_nextDueInstallmentAfterInstallmentIdentifier___block_invoke;
  v13[3] = &unk_1E56E23C8;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v13];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = v7; i < [v5 count]; ++i)
    {
      uint64_t v9 = [v5 objectAtIndexedSubscript:i];
      unint64_t v10 = [v9 status];
      if (v10 > 4 || ((1 << v10) & 0x16) == 0)
      {
      }
      else if (v9)
      {
        goto LABEL_12;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __72__PKPayLaterFinancingPlan_nextDueInstallmentAfterInstallmentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 installmentIdentifier];
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

+ (id)activeFinancingPlanStates
{
  if (qword_1EB402CB8 != -1) {
    dispatch_once(&qword_1EB402CB8, &__block_literal_global_112);
  }
  v2 = (void *)_MergedGlobals_213;
  return v2;
}

void __52__PKPayLaterFinancingPlan_activeFinancingPlanStates__block_invoke()
{
  v0 = (void *)_MergedGlobals_213;
  _MergedGlobals_213 = (uint64_t)&unk_1EE22AD60;
}

+ (id)completedFinancingPlanStates
{
  if (qword_1EB402CC8 != -1) {
    dispatch_once(&qword_1EB402CC8, &__block_literal_global_123);
  }
  v2 = (void *)qword_1EB402CC0;
  return v2;
}

void __55__PKPayLaterFinancingPlan_completedFinancingPlanStates__block_invoke()
{
  v0 = (void *)qword_1EB402CC0;
  qword_1EB402CC0 = (uint64_t)&unk_1EE22AD78;
}

+ (id)pendingFinancingPlanStates
{
  if (qword_1EB402CD8 != -1) {
    dispatch_once(&qword_1EB402CD8, &__block_literal_global_132_1);
  }
  v2 = (void *)qword_1EB402CD0;
  return v2;
}

void __53__PKPayLaterFinancingPlan_pendingFinancingPlanStates__block_invoke()
{
  v0 = (void *)qword_1EB402CD0;
  qword_1EB402CD0 = (uint64_t)&unk_1EE22AD90;
}

- (id)paymentSource
{
  paymentSource = self->_paymentSource;
  if (!paymentSource)
  {
    [(PKPayLaterFinancingPlan *)self _loadPaymentSource];
    paymentSource = self->_paymentSource;
  }
  id v4 = paymentSource;
  return v4;
}

- (id)fundingSourceName
{
  fundingSourceName = self->_fundingSourceName;
  if (!fundingSourceName)
  {
    [(PKPayLaterFinancingPlan *)self _loadPaymentSource];
    fundingSourceName = self->_fundingSourceName;
  }
  id v4 = fundingSourceName;
  return v4;
}

- (void)_loadPaymentSource
{
  id v32 = +[PKPassLibrary sharedInstance];
  v3 = [(PKPayLaterFinancingPlan *)self fundingSource];
  id v4 = [v3 details];
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    uint64_t v7 = v4;
    unint64_t v10 = [(PKAccountPaymentFundingSource *)v7 dpanIdentifier];
    uint64_t v15 = [(PKAccountPaymentFundingSource *)v7 fpanIdentifier];
    v16 = [v32 passWithDPANIdentifier:v10];
    v17 = [v16 paymentPass];

    if (!v17)
    {
      char v18 = [v32 passWithFPANIdentifier:v15];
      v17 = [v18 paymentPass];
    }
    id v19 = [v17 organizationName];
    v20 = v19;
    if (v19)
    {
      int v21 = v19;
      fundingSourceName = self->_fundingSourceName;
      self->_fundingSourceName = v21;
    }
    else
    {
      v23 = [(PKAccountPaymentFundingSource *)v7 cardName];
      fundingSourceName = v23;
      if (v23)
      {
        char v24 = v23;
      }
      else
      {
        char v24 = [(PKAccountPaymentFundingSource *)v7 cardName];
      }
      uint64_t v25 = self->_fundingSourceName;
      self->_fundingSourceName = v24;
    }
    uint64_t v26 = [v17 devicePrimaryPaymentApplication];
    v27 = (void *)v26;
    if (v17 && v26)
    {
      char v28 = [[PKPayLaterPassPaymentSource alloc] initWithPaymentPass:v17 paymentApplication:v26];
    }
    else
    {
      v29 = [v3 displayName];
      v30 = self->_fundingSourceName;
      self->_fundingSourceName = v29;

      char v28 = [[PKPayLaterUnavailablePassPaymentSource alloc] initWithFundingSource:v3];
    }
    paymentSource = self->_paymentSource;
    self->_paymentSource = &v28->super;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_18;
    }
    id v6 = v4;
    uint64_t v7 = [[PKAccountPaymentFundingSource alloc] initWithType:1];
    uint64_t v8 = [v3 identifier];
    [(PKAccountPaymentFundingSource *)v7 setIdentifier:v8];

    uint64_t v9 = [v6 accountNumberSuffix];
    [(PKAccountPaymentFundingSource *)v7 setAccountSuffix:v9];

    unint64_t v10 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
    uint64_t v11 = [v6 bankName];
    [(PKAccountPaymentFundingDetailsBankAccount *)v10 setName:v11];

    [(PKAccountPaymentFundingSource *)v7 setFundingDetails:v10];
    uint64_t v12 = [v6 bankName];

    v13 = self->_fundingSourceName;
    self->_fundingSourceName = v12;

    id v14 = [[PKPayLaterBankPaymentSource alloc] initWithAccountPaymentFundingSource:v7];
    uint64_t v15 = self->_paymentSource;
    self->_paymentSource = &v14->super;
  }

LABEL_18:
}

- (BOOL)updateReasonIsInitialDownload
{
  return self->_updateReasons & 1;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (id)refundPaymentsNotAssociatedWithDispute
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v20 = self;
  id v4 = self->_disputes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        unint64_t v10 = objc_msgSend(v9, "appliedPayments", v20);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v23 + 1) + 8 * j) paymentIdentifier];
              objc_msgSend(v3, "pk_safelyAddObject:", v15);
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  v16 = [(PKPayLaterFinancingPlanScheduleSummary *)v20->_scheduleSummary payments];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PKPayLaterFinancingPlan_refundPaymentsNotAssociatedWithDispute__block_invoke;
  v21[3] = &unk_1E56E23F0;
  id v22 = v3;
  id v17 = v3;
  char v18 = objc_msgSend(v16, "pk_objectsPassingTest:", v21);

  return v18;
}

uint64_t __65__PKPayLaterFinancingPlan_refundPaymentsNotAssociatedWithDispute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3)
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = [v3 paymentIdentifier];
      uint64_t v6 = [v4 containsObject:v5] ^ 1;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)disputeWithIdentifier:(id)a3
{
  id v4 = a3;
  disputes = self->_disputes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PKPayLaterFinancingPlan_disputeWithIdentifier___block_invoke;
  v9[3] = &unk_1E56E2418;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)disputes pk_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __49__PKPayLaterFinancingPlan_disputeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
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

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingPlan *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFinancingPlan *)self isEqualToPayLaterFinancingPlan:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlan:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_50;
  }
  BOOL v6 = (void *)v4[4];
  BOOL v7 = self->_planIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
    {
LABEL_52:

      goto LABEL_53;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_53;
    }
  }
  if (self->_productType == v5[5])
  {
    lastUpdated = self->_lastUpdated;
    uint64_t v12 = (NSDate *)v5[6];
    if (lastUpdated && v12)
    {
      if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
        goto LABEL_50;
      }
    }
    else if (lastUpdated != v12)
    {
      goto LABEL_50;
    }
    if (self->_state != v5[7] || self->_planChannel != v5[9] || self->_stateReason != v5[8]) {
      goto LABEL_50;
    }
    planSummary = self->_planSummary;
    id v14 = (PKPayLaterFinancingPlanSummary *)v5[10];
    if (planSummary && v14)
    {
      if (!-[PKPayLaterFinancingPlanSummary isEqual:](planSummary, "isEqual:")) {
        goto LABEL_50;
      }
    }
    else if (planSummary != v14)
    {
      goto LABEL_50;
    }
    merchant = self->_merchant;
    v16 = (PKPayLaterMerchant *)v5[13];
    if (merchant && v16)
    {
      if (!-[PKPayLaterMerchant isEqual:](merchant, "isEqual:")) {
        goto LABEL_50;
      }
    }
    else if (merchant != v16)
    {
      goto LABEL_50;
    }
    scheduleSummary = self->_scheduleSummary;
    char v18 = (PKPayLaterFinancingPlanScheduleSummary *)v5[11];
    if (scheduleSummary && v18)
    {
      if (!-[PKPayLaterFinancingPlanScheduleSummary isEqual:](scheduleSummary, "isEqual:")) {
        goto LABEL_50;
      }
    }
    else if (scheduleSummary != v18)
    {
      goto LABEL_50;
    }
    disputes = self->_disputes;
    v20 = (NSArray *)v5[12];
    if (disputes && v20)
    {
      if ((-[NSArray isEqual:](disputes, "isEqual:") & 1) == 0) {
        goto LABEL_50;
      }
    }
    else if (disputes != v20)
    {
      goto LABEL_50;
    }
    fundingSource = self->_fundingSource;
    id v22 = (PKPayLaterFinancingPlanFundingSource *)v5[14];
    if (fundingSource && v22)
    {
      if (!-[PKPayLaterFinancingPlanFundingSource isEqual:](fundingSource, "isEqual:")) {
        goto LABEL_50;
      }
    }
    else if (fundingSource != v22)
    {
      goto LABEL_50;
    }
    termsDetails = self->_termsDetails;
    long long v24 = (PKPayLaterFinancingPlanTermsDetails *)v5[15];
    if (termsDetails && v24)
    {
      if (-[PKPayLaterFinancingPlanTermsDetails isEqual:](termsDetails, "isEqual:")) {
        goto LABEL_45;
      }
    }
    else if (termsDetails == v24)
    {
LABEL_45:
      accountIdentifier = self->_accountIdentifier;
      long long v26 = (void *)v5[16];
      BOOL v7 = accountIdentifier;
      long long v27 = v26;
      if (v7 == v27)
      {
        LOBYTE(v10) = 1;
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = v27;
        LOBYTE(v10) = 0;
        if (v7 && v27) {
          LOBYTE(v10) = [(NSString *)v7 isEqualToString:v27];
        }
      }
      goto LABEL_52;
    }
  }
LABEL_50:
  LOBYTE(v10) = 0;
LABEL_53:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_planIdentifier];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_planSummary];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_scheduleSummary];
  [v3 safelyAddObject:self->_disputes];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_fundingSource];
  [v3 safelyAddObject:self->_termsDetails];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_productType - v4 + 32 * v4;
  unint64_t v6 = self->_state - v5 + 32 * v5;
  unint64_t v7 = self->_planChannel - v6 + 32 * v6;
  unint64_t v8 = self->_stateReason - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"purchaseIdentifier: '%@'; ", self->_planIdentifier];
  uint64_t v4 = PKPayLaterAccountProductTypeToString(self->_productType);
  [v3 appendFormat:@"productType: '%@'; ", v4];

  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  unint64_t v5 = self->_state - 1;
  if (v5 > 7) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56E2458[v5];
  }
  [v3 appendFormat:@"state: '%@'; ", v6];
  unint64_t v7 = self->_planChannel - 1;
  if (v7 > 2) {
    unint64_t v8 = @"unknown";
  }
  else {
    unint64_t v8 = off_1E56E2498[v7];
  }
  [v3 appendFormat:@"planChannel: '%@'; ", v8];
  unint64_t v9 = self->_stateReason - 1;
  if (v9 > 7) {
    BOOL v10 = @"unknown";
  }
  else {
    BOOL v10 = off_1E56E24B0[v9];
  }
  [v3 appendFormat:@"stateReason: '%@'; ", v10];
  if (self->_requiresGenericMessaging) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  [v3 appendFormat:@"requiresGenericMessaging: '%@'; ", v11];
  if (self->_cancellable) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  [v3 appendFormat:@"cancellable: '%@'; ", v12];
  [v3 appendFormat:@"purchaseSummary: '%@'; ", self->_planSummary];
  [v3 appendFormat:@"merchant: '%@'; ", self->_merchant];
  [v3 appendFormat:@"scheduleSummary: '%@'; ", self->_scheduleSummary];
  [v3 appendFormat:@"disputes: '%@'; ", self->_disputes];
  [v3 appendFormat:@"fundingSources: '%@'; ", self->_fundingSource];
  [v3 appendFormat:@"termsDetails: '%@'; ", self->_termsDetails];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_planIdentifier forKeyedSubscript:@"planIdentifier"];
  uint64_t v4 = PKPayLaterAccountProductTypeToString(self->_productType);
  [v3 setObject:v4 forKeyedSubscript:@"productType"];

  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    unint64_t v6 = PKISO8601DateStringFromDate(lastUpdated);
    [v3 setObject:v6 forKeyedSubscript:@"lastUpdated"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"lastUpdated"];
  }
  unint64_t v7 = self->_state - 1;
  if (v7 > 7) {
    unint64_t v8 = @"unknown";
  }
  else {
    unint64_t v8 = off_1E56E2458[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"state"];
  unint64_t v9 = self->_planChannel - 1;
  if (v9 > 2) {
    BOOL v10 = @"unknown";
  }
  else {
    BOOL v10 = off_1E56E2498[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"planChannel"];
  unint64_t v11 = self->_stateReason - 1;
  if (v11 > 7) {
    uint64_t v12 = @"unknown";
  }
  else {
    uint64_t v12 = off_1E56E24B0[v11];
  }
  [v3 setObject:v12 forKeyedSubscript:@"stateReason"];
  uint64_t v13 = [NSNumber numberWithBool:self->_requiresGenericMessaging];
  [v3 setObject:v13 forKeyedSubscript:@"requiresGenericMessaging"];

  id v14 = [NSNumber numberWithBool:self->_cancellable];
  [v3 setObject:v14 forKeyedSubscript:@"cancellable"];

  uint64_t v15 = [(PKPayLaterFinancingPlanSummary *)self->_planSummary dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"planSummary"];

  v16 = [(PKPayLaterFinancingPlanScheduleSummary *)self->_scheduleSummary dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"scheduleSummary"];

  id v17 = [(PKPayLaterMerchant *)self->_merchant dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"merchantSummary"];

  char v18 = [(NSArray *)self->_disputes pk_arrayBySafelyApplyingBlock:&__block_literal_global_207_0];
  [v3 setObject:v18 forKeyedSubscript:@"disputes"];

  id v19 = [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"fundingSource"];

  v20 = [(PKPayLaterFinancingPlanTermsDetails *)self->_termsDetails dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"termsDetails"];

  int v21 = (void *)[v3 copy];
  return v21;
}

uint64_t __51__PKPayLaterFinancingPlan_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPayLaterFinancingPlan;
  unint64_t v5 = [(PKPayLaterFinancingPlan *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planIdentifier"];
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v6;

    v5->_productType = [v4 decodeIntegerForKey:@"productType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_planChannel = [v4 decodeIntegerForKey:@"planChannel"];
    v5->_stateReason = [v4 decodeIntegerForKey:@"stateReason"];
    v5->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
    v5->_cancellable = [v4 decodeBoolForKey:@"cancellable"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planSummary"];
    planSummary = v5->_planSummary;
    v5->_planSummary = (PKPayLaterFinancingPlanSummary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantSummary"];
    merchant = v5->_merchant;
    v5->_merchant = (PKPayLaterMerchant *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSource"];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPayLaterFinancingPlanFundingSource *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDetails"];
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterFinancingPlanTermsDetails *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleSummary"];
    scheduleSummary = v5->_scheduleSummary;
    v5->_scheduleSummary = (PKPayLaterFinancingPlanScheduleSummary *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    id v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"disputes"];
    disputes = v5->_disputes;
    v5->_disputes = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v25;

    v5->_updateReasons = [v4 decodeIntegerForKey:@"updateReasons"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  planIdentifier = self->_planIdentifier;
  id v5 = a3;
  [v5 encodeObject:planIdentifier forKey:@"planIdentifier"];
  [v5 encodeInteger:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_planChannel forKey:@"planChannel"];
  [v5 encodeInteger:self->_stateReason forKey:@"stateReason"];
  [v5 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
  [v5 encodeBool:self->_cancellable forKey:@"cancellable"];
  [v5 encodeObject:self->_planSummary forKey:@"planSummary"];
  [v5 encodeObject:self->_merchant forKey:@"merchantSummary"];
  [v5 encodeObject:self->_scheduleSummary forKey:@"scheduleSummary"];
  [v5 encodeObject:self->_disputes forKey:@"disputes"];
  [v5 encodeObject:self->_fundingSource forKey:@"fundingSource"];
  [v5 encodeObject:self->_termsDetails forKey:@"termsDetails"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_updateReasons forKey:@"updateReasons"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingPlan allocWithZone:](PKPayLaterFinancingPlan, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_planIdentifier copyWithZone:a3];
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v6;

  v5->_productType = self->_productType;
  uint64_t v8 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v8;

  v5->_state = self->_state;
  v5->_planChannel = self->_planChannel;
  v5->_stateReason = self->_stateReason;
  uint64_t v10 = [(PKPayLaterFinancingPlanSummary *)self->_planSummary copyWithZone:a3];
  planSummary = v5->_planSummary;
  v5->_planSummary = v10;

  uint64_t v12 = [(PKPayLaterMerchant *)self->_merchant copyWithZone:a3];
  merchant = v5->_merchant;
  v5->_merchant = v12;

  uint64_t v14 = [(PKPayLaterFinancingPlanScheduleSummary *)self->_scheduleSummary copyWithZone:a3];
  scheduleSummary = v5->_scheduleSummary;
  v5->_scheduleSummary = v14;

  uint64_t v16 = [(NSArray *)self->_disputes copyWithZone:a3];
  disputes = v5->_disputes;
  v5->_disputes = (NSArray *)v16;

  uint64_t v18 = [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource copyWithZone:a3];
  fundingSource = v5->_fundingSource;
  v5->_fundingSource = v18;

  v20 = [(PKPayLaterFinancingPlanTermsDetails *)self->_termsDetails copyWithZone:a3];
  termsDetails = v5->_termsDetails;
  v5->_termsDetails = v20;

  uint64_t v22 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v22;

  return v5;
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (unint64_t)planChannel
{
  return self->_planChannel;
}

- (void)setPlanChannel:(unint64_t)a3
{
  self->_planChannel = a3;
}

- (BOOL)requiresGenericMessaging
{
  return self->_requiresGenericMessaging;
}

- (void)setRequiresGenericMessaging:(BOOL)a3
{
  self->_requiresGenericMessaging = a3;
}

- (BOOL)isCancellable
{
  return self->_cancellable;
}

- (void)setCancellable:(BOOL)a3
{
  self->_cancellable = a3;
}

- (PKPayLaterFinancingPlanSummary)planSummary
{
  return self->_planSummary;
}

- (void)setPlanSummary:(id)a3
{
}

- (PKPayLaterFinancingPlanScheduleSummary)scheduleSummary
{
  return self->_scheduleSummary;
}

- (void)setScheduleSummary:(id)a3
{
}

- (NSArray)disputes
{
  return self->_disputes;
}

- (void)setDisputes:(id)a3
{
}

- (PKPayLaterMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
}

- (PKPayLaterFinancingPlanTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_disputes, 0);
  objc_storeStrong((id *)&self->_scheduleSummary, 0);
  objc_storeStrong((id *)&self->_planSummary, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_fundingSourceName, 0);
  objc_storeStrong((id *)&self->_paymentSource, 0);
}

@end