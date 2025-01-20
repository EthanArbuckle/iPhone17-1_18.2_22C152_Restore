@interface PKPayLaterFinancingPlanGenerator
+ (id)_appleCashPaymentSource;
+ (id)_appleCashPlanSource;
+ (id)_bankOfAmericaDebitPaymentSource;
+ (id)_bankOfAmericaDebitPlanSource;
+ (id)_bankOfTheWestACHPaymentSource;
+ (id)_bankOfTheWestACHPlanSource;
+ (id)_bestBuyMerchant;
+ (id)_boilerPlateAccount;
+ (id)_chaseDebitPaymentSource;
+ (id)_chaseDebitPlanSource;
+ (id)_createInstallmentsWithDueDates:(id)a3 installmentAmountWithInterest:(id)a4 currency:(id)a5 planIdentifier:(id)a6;
+ (id)_currentBalanceForPlanWithTotalAmount:(id)a3 installments:(id)a4;
+ (id)_disputesForPayments:(id)a3 paymentIdentifiersForDispute:(id)a4 planIdentifier:(id)a5;
+ (id)_installmentAmountWithInterestForAPR:(id)a3 totalPrincipal:(id)a4 installmentCount:(int64_t)a5;
+ (id)_installmentDueDatesForInstallmentCount:(int64_t)a3 productType:(unint64_t)a4 transactionDate:(id)a5;
+ (id)_installmentsWithPayments:(id)a3 planIdentifier:(id)a4 productType:(unint64_t)a5 installmentDueDates:(id)a6 installmentAmountWithInterest:(id)a7 currency:(id)a8 disputes:(id)a9;
+ (id)_interestPaidToDateForInstallments:(id)a3 installmentInterest:(id)a4;
+ (id)_macysMerchant;
+ (id)_maximumNumber:(id)a3 number2:(id)a4;
+ (id)_minimumNumber:(id)a3 number2:(id)a4;
+ (id)_nextDateWithProductType:(unint64_t)a3 referenceDate:(id)a4;
+ (id)_nextDueAmountForFinancingPlans:(id)a3;
+ (id)_nikeMerchant;
+ (id)_paymentFundingSourceFromPlanFundingSource:(id)a3;
+ (id)_paymentsForConfigs:(id)a3 installmentDueDates:(id)a4 planIdentifier:(id)a5 transactionDate:(id)a6 installmentAmountWithInterest:(id)a7 installmentAmountWithoutInterest:(id)a8 installmentInterest:(id)a9 totalAmountWithInterest:(id)a10 totalAmountWithoutInterest:(id)a11 totalInterest:(id)a12 currency:(id)a13 ignoreFutureDates:(BOOL)a14 paymentIdentifiersForDispute:(id *)a15;
+ (id)_principalPaidToDateForInstallments:(id)a3 installmentAmountWithoutInterest:(id)a4;
+ (id)_saksMerchant;
+ (id)_termsDetailsForPlanIdentifier:(id)a3;
+ (id)_testMerchant;
+ (id)_wellsFargoACHPaymentSource;
+ (id)_wellsFargoACHPlanSource;
+ (id)financingPlanWithConfiguration:(id)a3;
+ (id)generatePayLaterAccountForFinancingPlans:(id)a3;
+ (id)maximumAPRForProductType:(unint64_t)a3;
+ (id)maximumPrincipalAmountForProductType:(unint64_t)a3;
+ (id)minimumAPRForProductType:(unint64_t)a3;
+ (id)minimumPrincipalAmountForProductType:(unint64_t)a3;
+ (id)payLaterFinancingPlanFundingSourcesForOptions:(unint64_t)a3;
+ (id)payLaterMerchantForType:(unint64_t)a3;
+ (id)payLaterPaymentFundingSourcesForOptions:(unint64_t)a3;
+ (int64_t)maximumInstallmentCountForProductType:(unint64_t)a3;
+ (int64_t)minimumInstallmentCountForProductType:(unint64_t)a3;
+ (void)_calculateCurrentBalanceForFinancingPlans:(id)a3 currentBalance:(id *)a4 bnplCurrentBalance:(id *)a5 loanCurrentBalance:(id *)a6 amountPaid:(id *)a7 bnplAmountPaid:(id *)a8 loanAmountPaid:(id *)a9 totalFinanced:(id *)a10 bnplTotalFinanced:(id *)a11 loanTotalFinanced:(id *)a12;
+ (void)_processCreditRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 disputes:(id)a6 currency:(id)a7;
+ (void)_processLoanAdjustmentWithPayment:(id)a3 installmentIndex:(int64_t)a4 installments:(id)a5 disputes:(id)a6 currency:(id)a7;
+ (void)_processRefundRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 currency:(id)a6;
+ (void)deleteMockAccountWithCompletion:(id)a3;
+ (void)insertAndUpdateAccountWithAdditionalFinancingPlans:(id)a3 completion:(id)a4;
+ (void)insertAndUpdateAccountWithNewPlanType:(unint64_t)a3 installmentCount:(int64_t)a4 principalAmount:(id)a5 apr:(id)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 completion:(id)a9;
@end

@implementation PKPayLaterFinancingPlanGenerator

+ (id)payLaterMerchantForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v5 = objc_alloc_init(PKPayLaterMerchant);
      goto LABEL_11;
    case 1uLL:
      objc_msgSend(a1, "_testMerchant", v3);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2uLL:
      objc_msgSend(a1, "_bestBuyMerchant", v3);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3uLL:
      objc_msgSend(a1, "_nikeMerchant", v3);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      objc_msgSend(a1, "_saksMerchant", v3);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5uLL:
      objc_msgSend(a1, "_macysMerchant", v3);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)_testMerchant
{
  v2 = objc_alloc_init(PKPayLaterMerchant);
  [(PKPayLaterMerchant *)v2 setRawName:@"Test Merchant"];
  return v2;
}

+ (id)_bestBuyMerchant
{
  v2 = objc_alloc_init(PKPayLaterMerchant);
  [(PKPayLaterMerchant *)v2 setMerchantCategoryCode:5732];
  [(PKPayLaterMerchant *)v2 setMerchantCategory:2];
  [(PKPayLaterMerchant *)v2 setIndustryCategory:@"Electronics Stores"];
  [(PKPayLaterMerchant *)v2 setRawName:@"BEST BUY #986"];
  return v2;
}

+ (id)_nikeMerchant
{
  v2 = objc_alloc_init(PKPayLaterMerchant);
  [(PKPayLaterMerchant *)v2 setMerchantCategoryCode:5655];
  [(PKPayLaterMerchant *)v2 setMerchantCategory:2];
  [(PKPayLaterMerchant *)v2 setIndustryCategory:@"Sports and Riding Apparel Stores"];
  [(PKPayLaterMerchant *)v2 setRawName:@"NIKE STORE SF"];
  return v2;
}

+ (id)_saksMerchant
{
  v2 = objc_alloc_init(PKPayLaterMerchant);
  [(PKPayLaterMerchant *)v2 setMerchantCategoryCode:5311];
  [(PKPayLaterMerchant *)v2 setMerchantCategory:2];
  [(PKPayLaterMerchant *)v2 setIndustryCategory:@"DEPARTMENT STORES"];
  [(PKPayLaterMerchant *)v2 setRawName:@"SAKS FIFTH AVENUE #835"];
  return v2;
}

+ (id)_macysMerchant
{
  v2 = objc_alloc_init(PKPayLaterMerchant);
  [(PKPayLaterMerchant *)v2 setMerchantCategoryCode:5311];
  [(PKPayLaterMerchant *)v2 setMerchantCategory:2];
  [(PKPayLaterMerchant *)v2 setIndustryCategory:@"DEPARTMENT STORES"];
  [(PKPayLaterMerchant *)v2 setRawName:@"MACY'S    4333 LA JOLL"];
  return v2;
}

+ (id)minimumPrincipalAmountForProductType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      a1 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"50"];
    }
  }
  else
  {
    a1 = [MEMORY[0x1E4F28C28] zero];
  }
  return a1;
}

+ (id)maximumPrincipalAmountForProductType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      a1 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"1000"];
    }
  }
  else
  {
    a1 = [MEMORY[0x1E4F28C28] zero];
  }
  return a1;
}

+ (id)minimumAPRForProductType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C28], "zero", v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)maximumAPRForProductType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C28], "zero", v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (int64_t)minimumInstallmentCountForProductType:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (int64_t)maximumInstallmentCountForProductType:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (id)financingPlanWithConfiguration:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v99 = [v3 productType];
  uint64_t v4 = [v3 installmentCount];
  uint64_t v81 = [v3 daysSinceTransactionStart];
  v103 = v3;
  v5 = [v3 currency];
  v6 = (void *)MEMORY[0x1E4F28C28];
  uint64_t v105 = v4;
  v7 = [NSNumber numberWithInteger:v4];
  v8 = v7;
  if (v7)
  {
    [v7 decimalValue];
  }
  else
  {
    v112[0] = 0;
    v112[1] = 0;
    int v113 = 0;
  }
  v96 = [v6 decimalNumberWithDecimal:v112];

  v9 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0"];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v10 = [v103 payments];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v108 objects:v114 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v109;
LABEL_6:
    uint64_t v14 = 0;
    while (2)
    {
      if (*(void *)v109 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v108 + 1) + 8 * v14);
      switch([v15 paymentType])
      {
        case 2:
        case 3:
          goto LABEL_12;
        case 4:
        case 6:
          goto LABEL_10;
        case 7:
          unint64_t v18 = [v15 paymentSubtype];
          if (v18 < 4)
          {
LABEL_12:
            v16 = [v15 amount];
            uint64_t v17 = [(NSDecimalNumber *)v9 decimalNumberBySubtracting:v16];
            goto LABEL_13;
          }
          if (v18 == 4)
          {
LABEL_10:
            v16 = [v15 amount];
            uint64_t v17 = [(NSDecimalNumber *)v9 decimalNumberByAdding:v16];
LABEL_13:
            v19 = (NSDecimalNumber *)v17;

            v9 = v19;
          }
LABEL_14:
          if (v12 != ++v14) {
            continue;
          }
          uint64_t v20 = [v10 countByEnumeratingWithState:&v108 objects:v114 count:16];
          uint64_t v12 = v20;
          if (!v20) {
            goto LABEL_19;
          }
          goto LABEL_6;
        default:
          goto LABEL_14;
      }
    }
  }
LABEL_19:

  v21 = [v103 totalPrincipal];
  v94 = [(NSDecimalNumber *)v21 decimalNumberByAdding:v9];
  v104 = [v103 apr];
  v22 = [a1 _installmentAmountWithInterestForAPR:v104 totalPrincipal:v21 installmentCount:v4];
  v102 = [(NSDecimalNumber *)v22 decimalNumberByMultiplyingBy:v96];
  v95 = v21;
  v101 = [(NSDecimalNumber *)v21 decimalNumberByDividingBy:v96];
  v91 = [v101 decimalNumberByMultiplyingBy:v96];
  v100 = [(NSDecimalNumber *)v22 decimalNumberBySubtracting:v101];
  v106 = [v100 decimalNumberByMultiplyingBy:v96];
  v23 = NSString;
  v24 = PKPayLaterAccountProductTypeToString(v99);
  v25 = [MEMORY[0x1E4F29128] UUID];
  v26 = [v25 UUIDString];
  v83 = [v23 stringWithFormat:@"%@-%@", v24, v26];

  v27 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v28 = [v27 dateByAddingTimeInterval:(double)v81 * -86400.0];

  uint64_t v29 = [a1 _installmentDueDatesForInstallmentCount:v4 productType:v99 transactionDate:v28];
  v30 = [v103 payments];
  id v107 = 0;
  LOBYTE(v75) = [v103 ignoreFuturePayments];
  v90 = (void *)v28;
  v31 = [a1 _paymentsForConfigs:v30 installmentDueDates:v29 planIdentifier:v83 transactionDate:v28 installmentAmountWithInterest:v22 installmentAmountWithoutInterest:v101 installmentInterest:v100 totalAmountWithInterest:v102 totalAmountWithoutInterest:v91 totalInterest:v106 currency:v5 ignoreFutureDates:v75 paymentIdentifiersForDispute:&v107];
  id v32 = v107;

  v79 = v32;
  v89 = [a1 _disputesForPayments:v31 paymentIdentifiersForDispute:v32 planIdentifier:v83];
  v97 = v31;
  v80 = (void *)v29;
  v92 = v22;
  v33 = [a1 _installmentsWithPayments:v31 planIdentifier:v83 productType:v99 installmentDueDates:v29 installmentAmountWithInterest:v22 currency:v5 disputes:v89];
  v88 = objc_msgSend(v33, "pk_firstObjectPassingTest:", &__block_literal_global_66);
  uint64_t v34 = objc_msgSend(v33, "pk_firstObjectPassingTest:", &__block_literal_global_28_1);
  v77 = [a1 _installmentAmountWithInterestForAPR:v104 totalPrincipal:v94 installmentCount:v105];
  v35 = [v77 decimalNumberByMultiplyingBy:v96];
  v36 = [a1 _currentBalanceForPlanWithTotalAmount:v35 installments:v33];
  v76 = v35;
  v87 = [v35 decimalNumberBySubtracting:v36];
  v86 = [a1 _principalPaidToDateForInstallments:v33 installmentAmountWithoutInterest:v101];
  v85 = [a1 _interestPaidToDateForInstallments:v33 installmentInterest:v100];
  v37 = -[NSDecimalNumber decimalNumberBySubtracting:](v106, "decimalNumberBySubtracting:");
  v98 = v36;
  v84 = [(NSDecimalNumber *)v36 decimalNumberBySubtracting:v37];

  v78 = (void *)v34;
  if (v81 >= 31 && ![v31 count])
  {
    char v41 = 1;
    uint64_t v42 = 3;
    uint64_t v38 = 5;
LABEL_29:
    char v82 = v41;

    v33 = 0;
    v97 = 0;
    uint64_t v39 = v38;
    uint64_t v38 = v42;
    goto LABEL_30;
  }
  if (!v34)
  {
    unint64_t v40 = 0x1E4F1C000;
    if ([(NSDecimalNumber *)v36 pk_isZeroNumber])
    {
      char v82 = 0;
      uint64_t v38 = 3;
      uint64_t v39 = 6;
      goto LABEL_31;
    }
    char v41 = 0;
    uint64_t v38 = 2;
    if ([v31 count])
    {
      uint64_t v39 = 1;
      char v82 = 0;
      goto LABEL_31;
    }
    uint64_t v42 = 2;
    goto LABEL_29;
  }
  char v82 = 0;
  uint64_t v38 = 2;
  uint64_t v39 = 4;
LABEL_30:
  unint64_t v40 = 0x1E4F1C000uLL;
LABEL_31:
  v43 = objc_alloc_init(PKPayLaterFinancingPlan);
  [(PKPayLaterFinancingPlan *)v43 setPlanIdentifier:v83];
  [(PKPayLaterFinancingPlan *)v43 setProductType:v99];
  v44 = [*(id *)(v40 + 2504) date];
  [(PKPayLaterFinancingPlan *)v43 setLastUpdated:v44];

  [(PKPayLaterFinancingPlan *)v43 setState:v39];
  [(PKPayLaterFinancingPlan *)v43 setStateReason:v38];
  [(PKPayLaterFinancingPlan *)v43 setPlanChannel:1];
  v45 = objc_alloc_init(PKPayLaterFinancingPlanSummary);
  [(PKPayLaterFinancingPlanSummary *)v45 setApr:v104];
  -[PKPayLaterFinancingPlanSummary setHasAPR:](v45, "setHasAPR:", objc_msgSend(v104, "pk_isPositiveNumber"));
  [(PKPayLaterFinancingPlanSummary *)v45 setInstallmentCount:v105];
  v46 = [(NSDecimalNumber *)v95 decimalNumberByAdding:v9];
  v47 = [v46 decimalNumberByAdding:v106];

  v48 = PKCurrencyAmountCreate(v47, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setTotalAmount:v48];

  v49 = PKCurrencyAmountCreate(v102, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setInitialAmount:v49];

  v50 = PKCurrencyAmountCreate(v98, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setCurrentBalance:v50];

  v51 = PKCurrencyAmountCreate(v84, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setPayoffAmount:v51];

  v52 = PKCurrencyAmountCreate(v87, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setPaymentAmountToDate:v52];

  v53 = PKCurrencyAmountCreate(v106, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setTotalInterest:v53];

  v54 = PKCurrencyAmountCreate(v92, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setInstallmentAmount:v54];

  v55 = PKCurrencyAmountCreate(v95, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setTotalPrincipal:v55];

  v56 = PKCurrencyAmountCreate(v9, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setTotalAdjustments:v56];

  v57 = PKCurrencyAmountCreate(v86, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setPrincipalPaidToDate:v57];

  v58 = PKCurrencyAmountCreate(v85, v5, 0);
  [(PKPayLaterFinancingPlanSummary *)v45 setInterestPaidToDate:v58];

  v59 = [NSNumber numberWithUnsignedInt:arc4random_uniform(0x270Fu)];
  v60 = [v59 stringValue];
  [(PKPayLaterFinancingPlanSummary *)v45 setPanSuffix:v60];

  [(PKPayLaterFinancingPlanSummary *)v45 setTransactionDate:v90];
  v61 = [v33 firstObject];
  v62 = [v61 dueDate];
  [(PKPayLaterFinancingPlanSummary *)v45 setStartInstallmentDate:v62];

  v63 = [v88 dueDate];
  [(PKPayLaterFinancingPlanSummary *)v45 setNextInstallmentDueDate:v63];

  v64 = [v33 lastObject];
  v65 = [v64 dueDate];
  [(PKPayLaterFinancingPlanSummary *)v45 setEndInstallmentDate:v65];

  if (v82)
  {
    v66 = [*(id *)(v40 + 2504) date];
    [(PKPayLaterFinancingPlanSummary *)v45 setCancellationDate:v66];
  }
  else
  {
    [(PKPayLaterFinancingPlanSummary *)v45 setCancellationDate:0];
  }
  [(PKPayLaterFinancingPlan *)v43 setPlanSummary:v45];
  [(PKPayLaterFinancingPlan *)v43 setDisputes:v89];
  v67 = objc_msgSend(a1, "payLaterMerchantForType:", objc_msgSend(v103, "merchant"));
  [(PKPayLaterFinancingPlan *)v43 setMerchant:v67];

  v68 = objc_msgSend(a1, "payLaterFinancingPlanFundingSourcesForOptions:", objc_msgSend(v103, "fundingSources"));
  v69 = [v68 firstObject];
  [(PKPayLaterFinancingPlan *)v43 setFundingSource:v69];

  v70 = [(PKPayLaterFinancingPlan *)v43 fundingSource];
  objc_msgSend(v70, "setAutoPayment:", objc_msgSend(v103, "autoPayment"));

  v71 = [a1 _termsDetailsForPlanIdentifier:v83];
  [(PKPayLaterFinancingPlan *)v43 setTermsDetails:v71];

  v72 = objc_alloc_init(PKPayLaterFinancingPlanScheduleSummary);
  [(PKPayLaterFinancingPlanScheduleSummary *)v72 setInstallments:v33];
  [(PKPayLaterFinancingPlanScheduleSummary *)v72 setPayments:v97];
  -[PKPayLaterFinancingPlanScheduleSummary setScheduleSummaryReason:](v72, "setScheduleSummaryReason:", [v103 scheduleSummaryReason]);
  [(PKPayLaterFinancingPlan *)v43 setScheduleSummary:v72];
  v73 = v43;

  return v73;
}

BOOL __67__PKPayLaterFinancingPlanGenerator_financingPlanWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 status] == 1 || objc_msgSend(v2, "status") == 4;

  return v3;
}

BOOL __67__PKPayLaterFinancingPlanGenerator_financingPlanWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

+ (id)_installmentsWithPayments:(id)a3 planIdentifier:(id)a4 productType:(unint64_t)a5 installmentDueDates:(id)a6 installmentAmountWithInterest:(id)a7 currency:(id)a8 disputes:(id)a9
{
  id v14 = a3;
  v15 = (NSString *)a8;
  id v78 = a9;
  id v84 = a1;
  v86 = v15;
  v16 = [a1 _createInstallmentsWithDueDates:a6 installmentAmountWithInterest:a7 currency:v15 planIdentifier:a4];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v16 count])
  {
    unint64_t v18 = 0;
    do
    {
      v19 = [NSNumber numberWithInteger:v18];
      [v17 addObject:v19];

      ++v18;
    }
    while (v18 < [v16 count]);
  }
  uint64_t v81 = v16;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v87 = v20;
  if ([v14 count])
  {
    unint64_t v22 = 0;
    do
    {
      v23 = [NSNumber numberWithInteger:v22];
      [v20 addObject:v23];

      v24 = [v14 objectAtIndexedSubscript:v22];
      v25 = [v24 amount];
      v26 = [v25 amount];
      v27 = objc_msgSend(v26, "pk_absoluteValue");
      uint64_t v28 = [v24 paymentIdentifier];
      [v21 safelySetObject:v27 forKey:v28];

      id v20 = v87;
      ++v22;
    }
    while (v22 < [v14 count]);
  }
  uint64_t v29 = v21;
  v30 = v81;
  if ([v17 count])
  {
    v76 = v89;
    id v77 = v14;
    v79 = v17;
    v83 = v21;
    while (objc_msgSend(v20, "count", v76))
    {
      v31 = [v20 objectAtIndexedSubscript:0];
      uint64_t v32 = [v31 integerValue];

      v33 = [v14 objectAtIndexedSubscript:v32];
      uint64_t v34 = [v33 paymentIdentifier];
      v35 = [v29 objectForKey:v34];
      switch([v33 type])
      {
        case 0:
          goto LABEL_36;
        case 1:
        case 5:
          uint64_t v82 = v32;
          v85 = v34;
          v36 = [v17 firstObject];
          uint64_t v37 = [v36 integerValue];
          BOOL v38 = 0;
          goto LABEL_18;
        case 2:
          uint64_t v82 = v32;
          v85 = v34;
          v36 = [v17 lastObject];
          uint64_t v37 = [v36 integerValue];
          BOOL v38 = 1;
          goto LABEL_18;
        case 3:
          uint64_t v82 = v32;
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v89[0] = __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke;
          v89[1] = &unk_1E56E2418;
          id v39 = v33;
          id v90 = v39;
          unint64_t v40 = objc_msgSend(v78, "pk_firstObjectPassingTest:", v88);
          BOOL v38 = v40 != 0;
          if (v40)
          {
            v85 = v34;
            char v41 = [v79 lastObject];
            uint64_t v37 = [v41 integerValue];
          }
          else
          {
            uint64_t v70 = [v39 subtype];
            if ((unint64_t)(v70 - 2) < 3) {
              goto LABEL_45;
            }
            if (!v70)
            {
              uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_44;
            }
            if (v70 == 1)
            {
              v71 = [v79 firstObject];
              uint64_t v72 = [v71 integerValue];

LABEL_44:
              [v84 _processLoanAdjustmentWithPayment:v39 installmentIndex:v72 installments:v81 disputes:v78 currency:v86];
LABEL_45:
              v73 = [NSNumber numberWithInteger:v82];
              [v20 removeObject:v73];

              uint64_t v42 = v90;
              id v17 = v79;
              v30 = v81;
              goto LABEL_37;
            }
            v85 = v34;
            uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
          }

          v36 = v90;
          v30 = v81;
LABEL_18:

LABEL_19:
          uint64_t v42 = [v30 objectAtIndexedSubscript:v37];
          v43 = [v42 currentBalance];
          v44 = [v43 amount];

          v45 = [v42 appliedPayments];
          v46 = (void *)[v45 mutableCopy];
          v47 = v46;
          uint64_t v80 = v37;
          if (v46) {
            id v48 = v46;
          }
          else {
            id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v49 = v48;

          v50 = objc_alloc_init(PKPayLaterAppliedPayment);
          v51 = [v84 _minimumNumber:v35 number2:v44];
          v52 = [v33 paymentIdentifier];
          [(PKPayLaterAppliedPayment *)v50 setPaymentIdentifier:v52];

          v53 = PKCurrencyAmountCreate(v51, v86, 0);
          [(PKPayLaterAppliedPayment *)v50 setAmountApplied:v53];

          [v49 addObject:v50];
          v54 = (void *)[v49 copy];
          [v42 setAppliedPayments:v54];

          if (v38)
          {
            v55 = [v42 totalAmount];
            v56 = [v55 amount];

            v57 = [v56 decimalNumberBySubtracting:v51];
            v58 = PKCurrencyAmountCreate(v57, v86, 0);
            [v42 setTotalAmount:v58];
          }
          v59 = [v35 decimalNumberBySubtracting:v51];

          [v83 setObject:v59 forKey:v85];
          v60 = v44;
          v61 = v60;
          if ([v33 type] != 5)
          {
            v62 = [MEMORY[0x1E4F28C28] zero];
            v63 = [(NSDecimalNumber *)v60 decimalNumberBySubtracting:v51];
            v61 = [v84 _maximumNumber:v62 number2:v63];
          }
          v64 = PKCurrencyAmountCreate(v61, v86, 0);
          [v42 setCurrentBalance:v64];

          v65 = [v42 currentBalance];
          v66 = [v65 amount];
          if (objc_msgSend(v66, "pk_isZeroNumber")) {
            uint64_t v67 = 3;
          }
          else {
            uint64_t v67 = [v42 status];
          }
          [v42 setStatus:v67];

          if (!v59 || objc_msgSend(v59, "pk_isZeroNumber"))
          {
            v68 = [NSNumber numberWithInteger:v82];
            [v87 removeObject:v68];
          }
          id v17 = v79;
          if ([v42 status] == 3)
          {
            v69 = [NSNumber numberWithInteger:v80];
            [v79 removeObject:v69];
          }
          v35 = v59;
          id v14 = v77;
          v30 = v81;
          id v20 = v87;
          uint64_t v29 = v83;
          uint64_t v34 = v85;
LABEL_37:

          if (![v17 count]) {
            goto LABEL_47;
          }
          break;
        case 4:
          [v84 _processCreditRevokedWithPayment:v33 installments:v30 payments:v14 disputes:v78 currency:v86];
          goto LABEL_36;
        case 6:
        case 7:
          [v84 _processLoanAdjustmentWithPayment:v33 installmentIndex:0x7FFFFFFFFFFFFFFFLL installments:v30 disputes:v78 currency:v86];
LABEL_36:
          uint64_t v42 = [NSNumber numberWithInteger:v32];
          [v20 removeObject:v42];
          goto LABEL_37;
        default:
          uint64_t v82 = v32;
          v85 = v34;
          BOOL v38 = 0;
          uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_19;
      }
    }
  }
LABEL_47:
  v74 = (void *)[v30 copy];

  return v74;
}

uint64_t __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke_2;
  v6[3] = &unk_1E56E30D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 paymentIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) paymentIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

+ (void)_processCreditRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 disputes:(id)a6 currency:(id)a7
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v76 = a5;
  id v13 = a6;
  uint64_t v70 = (NSString *)a7;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke;
  v86[3] = &unk_1E56E2418;
  id v77 = v11;
  id v87 = v77;
  id v14 = objc_msgSend(v13, "pk_firstObjectPassingTest:", v86);
  v15 = v14;
  if (!v14) {
    goto LABEL_46;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v16 = [v14 appliedPayments];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v17)
  {
    uint64_t v29 = v16;
    goto LABEL_45;
  }
  uint64_t v18 = v17;
  v66 = v15;
  id v67 = v13;
  v68 = v12;
  uint64_t v19 = *(void *)v83;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v83 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = [*(id *)(*((void *)&v82 + 1) + 8 * i) paymentIdentifier];
      unint64_t v22 = [v77 paymentIdentifier];
      id v23 = v21;
      id v24 = v22;
      if (v23 == v24)
      {

        goto LABEL_17;
      }
      v25 = v24;
      if (v23) {
        BOOL v26 = v24 == 0;
      }
      else {
        BOOL v26 = 1;
      }
      if (v26)
      {
      }
      else
      {
        char v27 = [v23 isEqualToString:v24];

        if (v27) {
          goto LABEL_17;
        }
      }
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_3;
      v80[3] = &unk_1E56E3100;
      id v28 = v23;
      id v81 = v28;
      uint64_t v29 = objc_msgSend(v76, "pk_firstObjectPassingTest:", v80);

      if (v29)
      {

        v71 = [v29 paymentIdentifier];
        v30 = [v77 amount];
        v31 = [v30 amount];
        uint64_t v32 = objc_msgSend(v31, "pk_absoluteValue");

        id v12 = v68;
        uint64_t v33 = [v68 count];
        if (v33 - 1 >= 0)
        {
          uint64_t v34 = v33;
          while (1)
          {
            v35 = [v12 objectAtIndexedSubscript:--v34];
            v36 = [v35 appliedPayments];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_4;
            v78[3] = &unk_1E56E30D8;
            id v79 = v71;
            uint64_t v37 = objc_msgSend(v36, "pk_firstObjectPassingTest:", v78);

            if (v37)
            {
              BOOL v38 = [v35 appliedPayments];
              id v39 = (void *)[v38 mutableCopy];
              unint64_t v40 = v39;
              uint64_t v75 = v34;
              if (v39) {
                id v41 = v39;
              }
              else {
                id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              v43 = v41;

              v74 = v37;
              v44 = [v37 amountApplied];
              v45 = [v44 amount];
              v46 = [a1 _minimumNumber:v32 number2:v45];

              v47 = objc_alloc_init(PKPayLaterAppliedPayment);
              id v48 = [v77 paymentIdentifier];
              [(PKPayLaterAppliedPayment *)v47 setPaymentIdentifier:v48];

              v49 = PKCurrencyAmountCreate(v46, v70, 0);
              [(PKPayLaterAppliedPayment *)v47 setAmountApplied:v49];

              [v43 addObject:v47];
              v73 = v43;
              v50 = (void *)[v43 copy];
              [v35 setAppliedPayments:v50];

              v51 = [v35 totalAmount];
              v52 = [v51 amount];

              uint64_t v72 = v52;
              v53 = [v52 decimalNumberByAdding:v46];
              v54 = PKCurrencyAmountCreate(v53, v70, 0);
              [v35 setTotalAmount:v54];

              uint64_t v42 = [v32 decimalNumberBySubtracting:v46];

              v55 = [v35 currentBalance];
              v56 = [v55 amount];
              v57 = [v56 decimalNumberByAdding:v46];

              v58 = PKCurrencyAmountCreate(v57, v70, 0);
              [v35 setCurrentBalance:v58];

              v59 = [MEMORY[0x1E4F1C9C8] date];
              v60 = [v35 dueDate];
              uint64_t v61 = [v59 compare:v60];

              if (v61 == 1)
              {
                uint64_t v62 = 4;
              }
              else
              {
                v63 = [v35 currentBalance];
                v64 = [v63 amount];
                if (objc_msgSend(v64, "pk_isPositiveNumber")) {
                  uint64_t v62 = 1;
                }
                else {
                  uint64_t v62 = [v35 status];
                }
              }
              [v35 setStatus:v62];
              if (v42)
              {
                if (objc_msgSend(v42, "pk_isZeroNumber")) {
                  int v65 = 4;
                }
                else {
                  int v65 = 0;
                }
              }
              else
              {
                int v65 = 4;
              }

              id v12 = v68;
              uint64_t v34 = v75;
              if (v65) {
                goto LABEL_43;
              }
            }
            else
            {

              uint64_t v42 = v32;
            }
            uint64_t v32 = v42;
            if (v34 <= 0) {
              goto LABEL_43;
            }
          }
        }
        uint64_t v42 = v32;
LABEL_43:

        goto LABEL_44;
      }
LABEL_17:
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v18) {
      continue;
    }
    break;
  }
  uint64_t v29 = v16;
  id v12 = v68;
LABEL_44:
  v15 = v66;
  id v13 = v67;
LABEL_45:

LABEL_46:
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_2;
  v6[3] = &unk_1E56E30D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 paymentIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) paymentIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

BOOL __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 paymentIdentifier];
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 != v7)
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
    }
    else
    {
      int v10 = [v6 isEqualToString:v7];

      if (v10) {
        goto LABEL_10;
      }
    }
    BOOL v11 = 0;
    goto LABEL_12;
  }

LABEL_10:
  BOOL v11 = [v3 type] == 2;
LABEL_12:

  return v11;
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

+ (void)_processRefundRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 currency:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v50 = (NSString *)a6;
  id v12 = objc_msgSend(v11, "pk_firstObjectPassingTest:", &__block_literal_global_39);
  if (v12)
  {
    v45 = v12;
    id v46 = v11;
    v51 = [v12 paymentIdentifier];
    id v13 = [v9 amount];
    id v14 = [v13 amount];
    v15 = objc_msgSend(v14, "pk_absoluteValue");

    uint64_t v16 = [v10 count];
    if (v16 - 1 >= 0)
    {
      uint64_t v17 = v16;
      id v47 = v10;
      id v48 = v9;
      while (1)
      {
        uint64_t v18 = [v10 objectAtIndexedSubscript:--v17];
        uint64_t v19 = [v18 appliedPayments];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke_2;
        v53[3] = &unk_1E56E30D8;
        id v54 = v51;
        id v20 = objc_msgSend(v19, "pk_firstObjectPassingTest:", v53);

        if (v20)
        {
          id v21 = [v18 appliedPayments];
          unint64_t v22 = (void *)[v21 mutableCopy];
          id v23 = v22;
          if (v22) {
            id v24 = v22;
          }
          else {
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          BOOL v26 = v24;

          char v27 = [v20 amountApplied];
          id v28 = [v27 amount];
          uint64_t v29 = [a1 _minimumNumber:v15 number2:v28];

          v30 = objc_alloc_init(PKPayLaterAppliedPayment);
          v31 = [v9 paymentIdentifier];
          [(PKPayLaterAppliedPayment *)v30 setPaymentIdentifier:v31];

          uint64_t v32 = PKCurrencyAmountCreate(v29, v50, 0);
          [(PKPayLaterAppliedPayment *)v30 setAmountApplied:v32];

          [v26 addObject:v30];
          v52 = v26;
          uint64_t v33 = (void *)[v26 copy];
          [v18 setAppliedPayments:v33];

          v25 = [v15 decimalNumberBySubtracting:v29];

          uint64_t v34 = [v18 currentBalance];
          v35 = [v34 amount];
          v36 = [v35 decimalNumberByAdding:v29];

          uint64_t v37 = PKCurrencyAmountCreate(v36, v50, 0);
          [v18 setCurrentBalance:v37];

          BOOL v38 = [MEMORY[0x1E4F1C9C8] date];
          id v39 = [v18 dueDate];
          uint64_t v40 = [v38 compare:v39];

          if (v40 == 1)
          {
            uint64_t v41 = 4;
          }
          else
          {
            uint64_t v42 = [v18 currentBalance];
            v43 = [v42 amount];
            if (objc_msgSend(v43, "pk_isPositiveNumber")) {
              uint64_t v41 = 1;
            }
            else {
              uint64_t v41 = [v18 status];
            }
          }
          [v18 setStatus:v41];
          id v9 = v48;
          if (v25)
          {
            if (objc_msgSend(v25, "pk_isZeroNumber")) {
              int v44 = 2;
            }
            else {
              int v44 = 0;
            }
          }
          else
          {
            int v44 = 2;
          }
          id v10 = v47;

          if (v44) {
            goto LABEL_24;
          }
        }
        else
        {

          v25 = v15;
        }
        v15 = v25;
        if (v17 <= 0) {
          goto LABEL_24;
        }
      }
    }
    v25 = v15;
LABEL_24:

    id v12 = v45;
    id v11 = v46;
  }
}

BOOL __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

uint64_t __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

+ (void)_processLoanAdjustmentWithPayment:(id)a3 installmentIndex:(int64_t)a4 installments:(id)a5 disputes:(id)a6 currency:(id)a7
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v79 = (NSString *)a7;
  uint64_t v75 = v11;
  if (v11)
  {
    id v72 = v13;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = objc_msgSend(v12, "pk_objectsPassingTest:", &__block_literal_global_43_0);
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v16 = [v12 objectAtIndexedSubscript:a4];
      id v14 = [v15 arrayWithObject:v16];
    }
    uint64_t v17 = [v11 amount];
    uint64_t v18 = [v17 amount];

    v71 = v18;
    [v18 floatValue];
    float v20 = v19;
    unint64_t v21 = [v14 count];
    unint64_t v22 = (void *)MEMORY[0x1E4F28C28];
    id v23 = [NSNumber numberWithDouble:(float)(v20 / (float)v21)];
    id v24 = v23;
    if (v23)
    {
      [v23 decimalValue];
    }
    else
    {
      v87[0] = 0;
      v87[1] = 0;
      int v88 = 0;
    }
    id v73 = v12;
    long long v82 = [v22 decimalNumberWithDecimal:v87];

    unint64_t v25 = 0x1E4F28000uLL;
    BOOL v26 = [MEMORY[0x1E4F28C28] zero];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id obj = v14;
    uint64_t v78 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v78)
    {
      uint64_t v77 = *(void *)v84;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v84 != v77) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(void **)(*((void *)&v83 + 1) + 8 * v27);
          uint64_t v29 = [v28 totalAmount];
          v30 = [v29 amount];
          v31 = [v30 decimalNumberByAdding:v82];

          uint64_t v80 = v29;
          if (![(NSDecimalNumber *)v31 pk_isPositiveNumber])
          {
            uint64_t v37 = [v29 amount];
            BOOL v38 = [v28 currentBalance];
            id v39 = [v38 amount];
            uint64_t v40 = [v37 decimalNumberBySubtracting:v39];
            goto LABEL_17;
          }
          uint64_t v32 = PKCurrencyAmountCreate(v31, v79, 0);
          [v28 setTotalAmount:v32];

          uint64_t v33 = [v28 appliedPayments];

          if (v33)
          {
            uint64_t v34 = [v29 amount];
            v35 = [v28 currentBalance];
            v36 = [v35 amount];
            uint64_t v37 = [v34 decimalNumberBySubtracting:v36];

            BOOL v38 = [v37 decimalNumberBySubtracting:v31];
            id v39 = [*(id *)(v25 + 3112) zero];
            uint64_t v40 = [a1 _maximumNumber:v38 number2:v39];
LABEL_17:
            uint64_t v41 = (void *)v40;

            BOOL v26 = v41;
          }
          uint64_t v42 = [v28 currentBalance];
          v43 = [v42 amount];

          int v44 = [v43 decimalNumberByAdding:v82];
          v45 = v79;
          if (([(NSDecimalNumber *)v44 pk_isNegativeNumber] & 1) != 0
            || [(NSDecimalNumber *)v44 pk_isZeroNumber])
          {
            id v46 = v43;
          }
          else
          {
            if (![(NSDecimalNumber *)v44 pk_isPositiveNumber])
            {
              id v81 = v26;
              goto LABEL_30;
            }
            v52 = [*(id *)(v25 + 3112) zero];
            uint64_t v53 = [v26 compare:v52];

            if (v53 != -1)
            {
              id v81 = v26;
              v45 = v79;
              goto LABEL_30;
            }
            id v46 = [a1 _minimumNumber:v44 number2:v26];
            uint64_t v69 = [v26 decimalNumberBySubtracting:v46];

            BOOL v26 = (void *)v69;
            v45 = v79;
          }
          id v81 = v26;
          if (v46)
          {
            id v47 = v45;
            id v48 = [v28 appliedPayments];
            v49 = (void *)[v48 mutableCopy];
            v50 = v49;
            if (v49) {
              id v51 = v49;
            }
            else {
              id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            id v54 = v51;

            v55 = objc_alloc_init(PKPayLaterAppliedPayment);
            v56 = [v75 paymentIdentifier];
            [(PKPayLaterAppliedPayment *)v55 setPaymentIdentifier:v56];

            v57 = PKCurrencyAmountCreate(v46, v47, 0);
            [(PKPayLaterAppliedPayment *)v55 setAmountApplied:v57];

            [v54 addObject:v55];
            v58 = (void *)[v54 copy];
            [v28 setAppliedPayments:v58];

            uint64_t v59 = [v43 decimalNumberBySubtracting:v46];

            v45 = v47;
            int v44 = (NSDecimalNumber *)v59;
            unint64_t v25 = 0x1E4F28000;
          }
LABEL_30:
          v60 = PKCurrencyAmountCreate(v44, v45, 0);
          [v28 setCurrentBalance:v60];

          uint64_t v61 = [*(id *)(v25 + 3112) zero];
          uint64_t v62 = [(NSDecimalNumber *)v44 compare:v61];

          if (!v62) {
            [v28 setStatus:3];
          }
          v63 = [MEMORY[0x1E4F1C9C8] date];
          v64 = [v28 dueDate];
          uint64_t v65 = [v63 compare:v64];

          if (v65 == 1)
          {
            uint64_t v66 = 4;
          }
          else
          {
            id v67 = [v28 currentBalance];
            v68 = [v67 amount];
            if (objc_msgSend(v68, "pk_isPositiveNumber")) {
              uint64_t v66 = 1;
            }
            else {
              uint64_t v66 = [v28 status];
            }
          }
          [v28 setStatus:v66];

          ++v27;
          BOOL v26 = v81;
        }
        while (v78 != v27);
        uint64_t v70 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
        uint64_t v78 = v70;
      }
      while (v70);
    }

    id v13 = v72;
    id v12 = v73;
  }
}

BOOL __118__PKPayLaterFinancingPlanGenerator__processLoanAdjustmentWithPayment_installmentIndex_installments_disputes_currency___block_invoke(uint64_t a1, void *a2)
{
  return [a2 status] != 3;
}

+ (id)_paymentsForConfigs:(id)a3 installmentDueDates:(id)a4 planIdentifier:(id)a5 transactionDate:(id)a6 installmentAmountWithInterest:(id)a7 installmentAmountWithoutInterest:(id)a8 installmentInterest:(id)a9 totalAmountWithInterest:(id)a10 totalAmountWithoutInterest:(id)a11 totalInterest:(id)a12 currency:(id)a13 ignoreFutureDates:(BOOL)a14 paymentIdentifiersForDispute:(id *)a15
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v108 = a5;
  id v107 = a6;
  id v122 = a7;
  id v120 = a8;
  id v119 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  unint64_t v25 = (NSString *)a13;
  id v26 = v22;
  id v27 = v23;
  id v28 = v24;
  id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v109 = v28;
  long long v110 = v27;
  v124 = v27;
  v126 = v28;
  long long v111 = v26;
  uint64_t v29 = v26;
  v123 = v21;
  if ([v20 count])
  {
    v30 = v21;
    uint64_t v31 = 0;
    uint64_t v29 = v111;
    v124 = v27;
    v126 = v28;
    id v118 = v20;
    while (1)
    {
      uint64_t v32 = [v20 objectAtIndexedSubscript:v31];
      unint64_t v33 = [v32 relativeToInstallmentNumber];
      uint64_t v34 = [v32 daysPriorToRelativeInstallmentNumber];
      if ((v33 & 0x8000000000000000) != 0) {
        goto LABEL_51;
      }
      uint64_t v35 = v34;
      if (v33 >= [v30 count]) {
        goto LABEL_51;
      }
      uint64_t v131 = v35;
      v36 = v29;
      uint64_t v37 = [v32 amount];
      BOOL v38 = (void *)v37;
      id v39 = v122;
      if (v37) {
        id v39 = (void *)v37;
      }
      uint64_t v40 = v39;

      uint64_t v41 = (NSDecimalNumber *)v120;
      uint64_t v42 = (NSDecimalNumber *)v119;
      if ([v32 payOffRestOfLoanBalance]) {
        break;
      }
      v136 = v40;
      v133 = v42;
      if ([v32 installmentAmountMultiple] >= 2)
      {
        id v47 = (void *)MEMORY[0x1E4F28C28];
        id v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "installmentAmountMultiple"));
        v49 = v48;
        v50 = v41;
        if (v48)
        {
          [v48 decimalValue];
        }
        else
        {
          v143[0] = 0;
          v143[1] = 0;
          int v144 = 0;
        }
        uint64_t v54 = [v47 decimalNumberWithDecimal:v143];

        v128 = [v122 decimalNumberByMultiplyingBy:v54];

        uint64_t v55 = [(NSDecimalNumber *)v50 decimalNumberByMultiplyingBy:v54];
        v56 = v50;
        v45 = (NSDecimalNumber *)v55;

        id v46 = [(NSDecimalNumber *)v133 decimalNumberByMultiplyingBy:v54];

        v43 = (void *)v54;
        int v44 = v36;
        goto LABEL_15;
      }
      id v51 = v41;
      v52 = v123;
      int v44 = v36;
      uint64_t v53 = v131;
LABEL_16:
      v57 = v52;
      v129 = [v52 objectAtIndexedSubscript:v33];
      v58 = [v129 dateByAddingTimeInterval:(double)v53 * -86400.0];
      uint64_t v59 = PKStartOfDay(v58);

      uint64_t v60 = [v59 dateByAddingTimeInterval:(double)(60 * v31)];

      uint64_t v61 = [MEMORY[0x1E4F1C9C8] date];
      v132 = (void *)v60;
      uint64_t v62 = [v61 compare:v60];

      if (v62 != -1 || !a14)
      {
        uint64_t v64 = [v32 paymentType];
        uint64_t v65 = [v32 paymentSubtype];
        v63 = v133;
        if ((unint64_t)(v64 - 2) < 2 || v64 == 7 && (unint64_t)(v65 - 1) < 3)
        {
          uint64_t v66 = v136;
        }
        else
        {
          uint64_t v66 = v136;
          uint64_t v67 = [v44 decimalNumberBySubtracting:v136];

          int v44 = (void *)v67;
        }
        uint64_t v117 = [v124 decimalNumberBySubtracting:v51];

        uint64_t v116 = [v126 decimalNumberBySubtracting:v133];

        v130 = v44;
        if ([v44 compare:v66] != -1)
        {
          v30 = v57;
          goto LABEL_28;
        }
        v30 = v57;
        if (v31 + 1 == [v20 count])
        {
          v68 = [(NSDecimalNumber *)v136 decimalNumberBySubtracting:v130];
        }
        else
        {
LABEL_28:
          v68 = 0;
        }
        uint64_t v125 = [v32 fundingSources];
        uint64_t v69 = objc_alloc_init(PKPayLaterPayment);
        uint64_t v70 = objc_msgSend(NSString, "stringWithFormat:", @"tempID-%ld", v31);
        [(PKPayLaterPayment *)v69 setPaymentIdentifier:v70];

        -[PKPayLaterPayment setType:](v69, "setType:", [v32 paymentType]);
        -[PKPayLaterPayment setSubtype:](v69, "setSubtype:", [v32 paymentSubtype]);
        [(PKPayLaterPayment *)v69 setPostedDate:v132];
        uint64_t v71 = [(PKPayLaterPayment *)v69 type];
        v127 = v69;
        uint64_t v72 = [(PKPayLaterPayment *)v69 subtype];
        if ((unint64_t)(v71 - 2) < 2 || v71 == 7 && (unint64_t)(v72 - 1) <= 2)
        {
          uint64_t v73 = [(NSDecimalNumber *)v136 pk_negativeValue];

          v74 = (NSDecimalNumber *)v73;
        }
        else
        {
          v74 = v136;
        }
        v136 = v74;
        uint64_t v75 = PKCurrencyAmountCreate(v74, v25, 0);
        [(PKPayLaterPayment *)v69 setAmount:v75];

        id v76 = PKCurrencyAmountCreate(v133, v25, 0);
        [(PKPayLaterPayment *)v69 setInterestPaid:v76];

        uint64_t v77 = PKCurrencyAmountCreate(v51, v25, 0);
        [(PKPayLaterPayment *)v69 setPrincipalPaid:v77];

        uint64_t v78 = [a1 payLaterPaymentFundingSourcesForOptions:v125];
        id v79 = v78;
        uint64_t v29 = v130;
        v121 = v78;
        if (v78 && v68)
        {
          uint64_t v80 = (void *)MEMORY[0x1E4F28C28];
          id v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
          long long v82 = v81;
          v114 = v51;
          if (v81)
          {
            [v81 decimalValue];
          }
          else
          {
            v141[0] = 0;
            v141[1] = 0;
            int v142 = 0;
          }
          uint64_t v83 = [v80 decimalNumberWithDecimal:v141];

          v112 = (void *)v83;
          int v113 = v68;
          long long v84 = [v68 decimalNumberByDividingBy:v83];
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          id v85 = v121;
          uint64_t v86 = [v85 countByEnumeratingWithState:&v137 objects:v145 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v138;
            do
            {
              for (uint64_t i = 0; i != v87; ++i)
              {
                if (*(void *)v138 != v88) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v90 = *(void **)(*((void *)&v137 + 1) + 8 * i);
                v91 = PKCurrencyAmountCreate(v84, v25, 0);
                [v90 setRefundAmount:v91];
              }
              uint64_t v87 = [v85 countByEnumeratingWithState:&v137 objects:v145 count:16];
            }
            while (v87);
          }

          id v20 = v118;
          v30 = v123;
          uint64_t v29 = v130;
          v63 = v133;
          v68 = v113;
          id v51 = v114;
          id v79 = v121;
        }
        v92 = v127;
        [(PKPayLaterPayment *)v127 setFundingSources:v79];
        [(PKPayLaterPayment *)v127 setAssociatedTransactionPaymentHash:(unint64_t)@"pay-later-plan-payment-apple-cash-payment-hash" & (v125 << 61 >> 63)];
        [v135 safelyAddObject:v127];
        if ([v32 forDispute])
        {
          [(PKPayLaterPayment *)v127 paymentIdentifier];
          v93 = v51;
          v95 = v94 = v68;
          [v134 addObject:v95];

          v68 = v94;
          id v51 = v93;
          v92 = v127;
        }

        v124 = (void *)v117;
        v126 = (void *)v116;
        goto LABEL_50;
      }
      v63 = v133;
      uint64_t v29 = v44;
      v30 = v57;
LABEL_50:

LABEL_51:
      if (++v31 >= (unint64_t)[v20 count]) {
        goto LABEL_52;
      }
    }
    v43 = v42;
    int v44 = v36;
    v128 = v36;

    v45 = v124;
    id v46 = v126;
LABEL_15:
    uint64_t v53 = v131;

    v133 = v46;
    id v51 = v45;
    v136 = v128;
    v52 = v123;
    id v20 = v118;
    goto LABEL_16;
  }
LABEL_52:
  v96 = v135;
  [v135 sortUsingComparator:&__block_literal_global_50];
  v97 = v134;
  if ([v135 count])
  {
    unint64_t v98 = 0;
    do
    {
      uint64_t v99 = [v96 objectAtIndexedSubscript:v98];
      v100 = [v99 paymentIdentifier];
      v101 = [NSString stringWithFormat:@"payment-%ld-planID-%@", v98, v108];
      [v99 setPaymentIdentifier:v101];

      uint64_t v102 = [v97 indexOfObject:v100];
      if (v102 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v103 = v102;
        v104 = [v99 paymentIdentifier];
        [v134 replaceObjectAtIndex:v103 withObject:v104];

        v97 = v134;
      }

      ++v98;
      v96 = v135;
    }
    while (v98 < [v135 count]);
  }
  if (a15) {
    *a15 = (id)[v97 copy];
  }
  uint64_t v105 = (void *)[v96 copy];

  return v105;
}

uint64_t __311__PKPayLaterFinancingPlanGenerator__paymentsForConfigs_installmentDueDates_planIdentifier_transactionDate_installmentAmountWithInterest_installmentAmountWithoutInterest_installmentInterest_totalAmountWithInterest_totalAmountWithoutInterest_totalInterest_currency_ignoreFutureDates_paymentIdentifiersForDispute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 postedDate];
  id v6 = [v4 postedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_disputesForPayments:(id)a3 paymentIdentifiersForDispute:(id)a4 planIdentifier:(id)a5
{
  id v7 = a3;
  id v64 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_56_0);
  uint64_t v59 = v7;
  id v10 = objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_58);
  uint64_t v11 = (uint64_t)fmax((double)(unint64_t)[v9 count], (double)(unint64_t)objc_msgSend(v10, "count"));
  unint64_t v12 = 0x1E4F1C000uLL;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = off_1E56D5000;
  unint64_t v15 = 0x1E4F29000;
  uint64_t v16 = off_1E56D5000;
  uint64_t v62 = v11;
  v63 = v10;
  id v65 = v8;
  uint64_t v66 = v13;
  uint64_t v60 = v9;
  if (v11 >= 1)
  {
    unint64_t v17 = 0;
    while (1)
    {
      if (v17 >= [v9 count])
      {
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = [v9 objectAtIndexedSubscript:v17];
      }
      if (v17 >= [v10 count])
      {
        float v19 = 0;
      }
      else
      {
        float v19 = [v10 objectAtIndexedSubscript:v17];
      }
      id v20 = objc_alloc_init(PKPayLaterFinancingPlanDispute);
      if (v18)
      {
        if (!v19) {
          break;
        }
      }
      if (v18 && v19)
      {
        uint64_t v61 = [v19 amount];
        id v22 = [v61 amount];
        id v23 = objc_msgSend(v22, "pk_absoluteValue");
        id v24 = [v18 amount];
        unint64_t v25 = [v24 amount];
        id v26 = objc_msgSend(v25, "pk_absoluteValue");
        uint64_t v27 = [v23 compare:v26];

        unint64_t v12 = 0x1E4F1C000uLL;
        id v9 = v60;

        id v8 = v65;
        if (v27) {
          uint64_t v21 = 5;
        }
        else {
          uint64_t v21 = 4;
        }
        goto LABEL_17;
      }
LABEL_20:

      ++v17;
      id v10 = v63;
      unint64_t v15 = 0x1E4F29000uLL;
      if (v62 == v17) {
        goto LABEL_21;
      }
    }
    uint64_t v21 = 1;
LABEL_17:
    id v28 = [NSString stringWithFormat:@"dispute-%ld-loanID-%@", v17, v8];
    [(PKPayLaterFinancingPlanDispute *)v20 setIdentifier:v28];

    [(PKPayLaterFinancingPlanDispute *)v20 setState:v21];
    uint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
    v30 = [v29 dateByAddingTimeInterval:604800.0];
    [(PKPayLaterFinancingPlanDispute *)v20 setDeadlineDate:v30];

    [(PKPayLaterFinancingPlanDispute *)v20 setEmailAddress:@"example@apple.com"];
    uint64_t v31 = [v18 postedDate];
    [(PKPayLaterFinancingPlanDispute *)v20 setOpenDate:v31];

    uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
    [(PKPayLaterFinancingPlanDispute *)v20 setLastUpdated:v32];

    id v33 = objc_alloc_init(*(Class *)(v12 + 2632));
    uint64_t v16 = off_1E56D5000;
    uint64_t v34 = objc_alloc_init(PKPayLaterAppliedPayment);
    uint64_t v35 = [v18 amount];
    [(PKPayLaterAppliedPayment *)v34 setAmountApplied:v35];

    v36 = [v18 paymentIdentifier];
    [(PKPayLaterAppliedPayment *)v34 setPaymentIdentifier:v36];

    [v33 safelyAddObject:v34];
    if (v19)
    {
      uint64_t v37 = objc_alloc_init(PKPayLaterAppliedPayment);
      BOOL v38 = [v19 amount];
      [(PKPayLaterAppliedPayment *)v37 setAmountApplied:v38];

      id v39 = [v19 paymentIdentifier];
      [(PKPayLaterAppliedPayment *)v37 setPaymentIdentifier:v39];

      [v33 safelyAddObject:v37];
    }
    uint64_t v40 = (void *)[v33 copy];
    [(PKPayLaterFinancingPlanDispute *)v20 setAppliedPayments:v40];

    id v13 = v66;
    [v66 addObject:v20];

    unint64_t v12 = 0x1E4F1C000;
    id v14 = off_1E56D5000;
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v41 = v64;
  if ([v64 count])
  {
    unint64_t v42 = 0;
    do
    {
      unint64_t v43 = [v13 count] + v42;
      int v44 = [v41 objectAtIndexedSubscript:v42];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_3;
      v67[3] = &unk_1E56E3100;
      id v68 = v44;
      id v45 = v44;
      id v46 = objc_msgSend(v59, "pk_firstObjectPassingTest:", v67);
      id v47 = objc_alloc_init(v14[268]);
      id v48 = [*(id *)(v15 + 24) stringWithFormat:@"dispute-%ld-loanID-%@", v43, v8];
      [v47 setIdentifier:v48];

      [v47 setState:3];
      v49 = [v46 postedDate];
      v50 = [v49 dateByAddingTimeInterval:-604800.0];
      [v47 setOpenDate:v50];

      uint64_t v41 = v64;
      id v51 = [MEMORY[0x1E4F1C9C8] date];
      [v47 setLastUpdated:v51];

      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v53 = objc_alloc_init(v16[250]);
      uint64_t v54 = [v46 amount];
      [v53 setAmountApplied:v54];

      uint64_t v55 = [v46 paymentIdentifier];
      [v53 setPaymentIdentifier:v55];

      [v52 safelyAddObject:v53];
      v56 = (void *)[v52 copy];
      [v47 setAppliedPayments:v56];

      id v13 = v66;
      [v66 addObject:v47];

      id v8 = v65;
      unint64_t v15 = 0x1E4F29000;

      id v14 = off_1E56D5000;
      ++v42;
    }
    while (v42 < [v64 count]);
  }
  if ([v13 count]) {
    v57 = (void *)[v13 copy];
  }
  else {
    v57 = 0;
  }

  return v57;
}

BOOL __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

BOOL __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

uint64_t __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

+ (id)_createInstallmentsWithDueDates:(id)a3 installmentAmountWithInterest:(id)a4 currency:(id)a5 planIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = (NSDecimalNumber *)a4;
  uint64_t v11 = (NSString *)a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v9 count])
  {
    unint64_t v14 = 0;
    do
    {
      unint64_t v15 = [v9 objectAtIndexedSubscript:v14];
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v17 = [v16 compare:v15];

      uint64_t v18 = objc_alloc_init(PKPayLaterInstallment);
      float v19 = v18;
      if (v17 == 1) {
        uint64_t v20 = 4;
      }
      else {
        uint64_t v20 = 1;
      }
      [(PKPayLaterInstallment *)v18 setStatus:v20];
      [(PKPayLaterInstallment *)v19 setDueDate:v15];
      [(PKPayLaterInstallment *)v19 setPlanIdentifier:v12];
      uint64_t v21 = [NSString stringWithFormat:@"intallment-%ld-planID-%@", v14, v12];
      [(PKPayLaterInstallment *)v19 setInstallmentIdentifier:v21];

      id v22 = PKCurrencyAmountCreate(v10, v11, 0);
      [(PKPayLaterInstallment *)v19 setTotalAmount:v22];

      id v23 = PKCurrencyAmountCreate(v10, v11, 0);
      [(PKPayLaterInstallment *)v19 setCurrentBalance:v23];

      [v13 addObject:v19];
      ++v14;
    }
    while (v14 < [v9 count]);
  }
  [v13 sortUsingComparator:&__block_literal_global_72_0];
  id v24 = (void *)[v13 copy];

  return v24;
}

uint64_t __122__PKPayLaterFinancingPlanGenerator__createInstallmentsWithDueDates_installmentAmountWithInterest_currency_planIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dueDate];
  id v6 = [v4 dueDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_currentBalanceForPlanWithTotalAmount:(id)a3 installments:(id)a4
{
  id v22 = a1;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  id v24 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      id v12 = v7;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        unint64_t v14 = objc_msgSend(v13, "totalAmount", v22);
        unint64_t v15 = [v14 amount];
        uint64_t v16 = [v13 currentBalance];
        uint64_t v17 = [v16 amount];
        uint64_t v18 = [v15 decimalNumberBySubtracting:v17];

        id v7 = [v12 decimalNumberBySubtracting:v18];

        ++v11;
        id v12 = v7;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
  float v19 = objc_msgSend(MEMORY[0x1E4F28C28], "zero", v22);
  uint64_t v20 = [v23 _maximumNumber:v7 number2:v19];

  return v20;
}

+ (id)_installmentDueDatesForInstallmentCount:(int64_t)a3 productType:(unint64_t)a4 transactionDate:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = PKEndOfDayWithTimeZone(v8, 0);
  [v9 safelyAddObject:v10];

  if (a3 >= 2)
  {
    uint64_t v11 = 0;
    int64_t v12 = a3 - 1;
    do
    {
      id v13 = [v9 objectAtIndexedSubscript:v11];
      unint64_t v14 = [a1 _nextDateWithProductType:a4 referenceDate:v13];
      [v9 safelyAddObject:v14];

      ++v11;
    }
    while (v12 != v11);
  }
  unint64_t v15 = (void *)[v9 copy];

  return v15;
}

+ (id)_principalPaidToDateForInstallments:(id)a3 installmentAmountWithoutInterest:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28C28] zero];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      int64_t v12 = v7;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        unint64_t v14 = [v13 totalAmount];
        unint64_t v15 = [v14 amount];
        uint64_t v16 = [v13 currentBalance];
        uint64_t v17 = [v16 amount];
        uint64_t v18 = [v15 decimalNumberBySubtracting:v17];

        float v19 = [a1 _minimumNumber:v6 number2:v18];
        id v7 = [v12 decimalNumberByAdding:v19];

        ++v11;
        int64_t v12 = v7;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)_interestPaidToDateForInstallments:(id)a3 installmentInterest:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28C28] zero];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "status", (void)v15) == 3)
        {
          uint64_t v13 = [v7 decimalNumberByAdding:v6];

          id v7 = (void *)v13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_nextDateWithProductType:(unint64_t)a3 referenceDate:(id)a4
{
  if (a3 == 1)
  {
    id v6 = objc_msgSend(a4, "dateByAddingTimeInterval:", 1209600.0, v4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_termsDetailsForPlanIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(PKPayLaterFinancingPlanTermsDetails);
  uint64_t v5 = [NSString stringWithFormat:@"installmentAgreementIdentifier-%@", v3];

  [(PKPayLaterFinancingPlanTermsDetails *)v4 setInstallmentAgreementIdentifier:v5];
  return v4;
}

+ (id)_minimumNumber:(id)a3 number2:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 compare:v5] == 1) {
    id v7 = v5;
  }
  else {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

+ (id)_maximumNumber:(id)a3 number2:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 compare:v5] == 1) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (id)_installmentAmountWithInterestForAPR:(id)a3 totalPrincipal:(id)a4 installmentCount:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && !objc_msgSend(v7, "pk_isZeroNumber"))
  {
    [v7 floatValue];
    double v13 = v12;
    [v8 floatValue];
    double v15 = v14;
    double v16 = pow(v13 / 12.0 + 1.0, (double)a5);
    if (v16 == 1.0) {
      double v17 = v15 / (double)a5;
    }
    else {
      double v17 = v13 / 12.0 * (v16 * v15) / (v16 + -1.0);
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F28C28];
    uint64_t v21 = [NSNumber numberWithDouble:v17];
    uint64_t v11 = v21;
    if (v21)
    {
      [v21 decimalValue];
    }
    else
    {
      v23[0] = 0;
      v23[1] = 0;
      int v24 = 0;
    }
    float v19 = [v20 decimalNumberWithDecimal:v23];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C28];
    uint64_t v10 = [NSNumber numberWithInteger:a5];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 decimalValue];
    }
    else
    {
      v25[0] = 0;
      v25[1] = 0;
      int v26 = 0;
    }
    long long v18 = [v9 decimalNumberWithDecimal:v25];
    float v19 = [v8 decimalNumberByDividingBy:v18];
  }
  return v19;
}

+ (id)payLaterFinancingPlanFundingSourcesForOptions:(unint64_t)a3
{
  char v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    uint64_t v10 = [a1 _bankOfAmericaDebitPlanSource];
    [v5 addObject:v10];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v11 = [a1 _chaseDebitPlanSource];
  [v5 addObject:v11];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  float v12 = [a1 _appleCashPlanSource];
  [v5 addObject:v12];

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  double v13 = [a1 _wellsFargoACHPlanSource];
  [v5 addObject:v13];

  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    id v6 = [a1 _bankOfTheWestACHPlanSource];
    [v5 addObject:v6];
  }
LABEL_7:
  if ([v5 count]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

+ (id)payLaterPaymentFundingSourcesForOptions:(unint64_t)a3
{
  char v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    uint64_t v10 = [a1 _bankOfAmericaDebitPaymentSource];
    [v5 addObject:v10];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v11 = [a1 _chaseDebitPaymentSource];
  [v5 addObject:v11];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  float v12 = [a1 _appleCashPaymentSource];
  [v5 addObject:v12];

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  double v13 = [a1 _wellsFargoACHPaymentSource];
  [v5 addObject:v13];

  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    id v6 = [a1 _bankOfTheWestACHPaymentSource];
    [v5 addObject:v6];
  }
LABEL_7:
  if ([v5 count]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

+ (id)_bankOfAmericaDebitPlanSource
{
  id v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  [(PKPayLaterFinancingPlanFundingSource *)v2 setIdentifier:@"bank-of-america-debit"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setType:1];
  char v3 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setType:1];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardName:@"Bank of America Visa Debit Card"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardNetwork:4];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardSuffix:@"4923"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardType:1];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setDpanIdentifier:@"DNITHE302132306071944346"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setFpanIdentifier:@"V-5820240768500153262398"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setDetails:v3];

  return v2;
}

+ (id)_appleCashPlanSource
{
  id v2 = +[PKPeerPaymentService sharedInstance];
  char v3 = [v2 account];

  uint64_t v4 = +[PKPassLibrary sharedInstance];
  id v5 = [v3 associatedPassUniqueID];
  id v6 = [v4 passWithUniqueID:v5];
  id v7 = [v6 paymentPass];

  id v8 = [v7 devicePrimaryPaymentApplication];
  uint64_t v9 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  [(PKPayLaterFinancingPlanFundingSource *)v9 setIdentifier:@"peer-payment-account"];
  [(PKPayLaterFinancingPlanFundingSource *)v9 setType:1];
  uint64_t v10 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  [(PKPayLaterFundingSourcePaymentPassDetails *)v10 setType:1];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v10 setCardName:@"Apple Cash"];
  -[PKPayLaterFundingSourcePaymentPassDetails setCardNetwork:](v10, "setCardNetwork:", [v8 paymentNetworkIdentifier]);
  [(PKPayLaterFundingSourcePaymentPassDetails *)v10 setCardType:1];
  uint64_t v11 = [v8 dpanIdentifier];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v10 setDpanIdentifier:v11];

  float v12 = [v7 primaryAccountIdentifier];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v10 setFpanIdentifier:v12];

  [(PKPayLaterFinancingPlanFundingSource *)v9 setDetails:v10];
  return v9;
}

+ (id)_chaseDebitPlanSource
{
  id v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  [(PKPayLaterFinancingPlanFundingSource *)v2 setIdentifier:@"chase-debit"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setType:1];
  char v3 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setType:1];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardName:@"Chase Debit Card"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardNetwork:4];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardSuffix:@"9842"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setCardType:1];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setDpanIdentifier:@"dpan-id-chase-debit"];
  [(PKPayLaterFundingSourcePaymentPassDetails *)v3 setFpanIdentifier:@"dpan-id-chase-debit"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setDetails:v3];

  return v2;
}

+ (id)_wellsFargoACHPlanSource
{
  id v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  [(PKPayLaterFinancingPlanFundingSource *)v2 setIdentifier:@"wells-fargo-ACH"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setType:2];
  char v3 = objc_alloc_init(PKPayLaterFundingSourceBankDetails);
  [(PKPayLaterFundingSourceBankDetails *)v3 setType:2];
  [(PKPayLaterFundingSourceBankDetails *)v3 setBankName:@"Wells Fargo Bank"];
  [(PKPayLaterFundingSourceBankDetails *)v3 setAccountNumberSuffix:@"5547"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setDetails:v3];

  return v2;
}

+ (id)_bankOfTheWestACHPlanSource
{
  id v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  [(PKPayLaterFinancingPlanFundingSource *)v2 setIdentifier:@"bank-of-west-ACH"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setType:2];
  char v3 = objc_alloc_init(PKPayLaterFundingSourceBankDetails);
  [(PKPayLaterFundingSourceBankDetails *)v3 setType:2];
  [(PKPayLaterFundingSourceBankDetails *)v3 setBankName:@"Bank of the West"];
  [(PKPayLaterFundingSourceBankDetails *)v3 setAccountNumberSuffix:@"8452"];
  [(PKPayLaterFinancingPlanFundingSource *)v2 setDetails:v3];

  return v2;
}

+ (id)_bankOfAmericaDebitPaymentSource
{
  char v3 = [a1 _bankOfAmericaDebitPlanSource];
  uint64_t v4 = [a1 _paymentFundingSourceFromPlanFundingSource:v3];

  return v4;
}

+ (id)_appleCashPaymentSource
{
  char v3 = [a1 _appleCashPlanSource];
  uint64_t v4 = [a1 _paymentFundingSourceFromPlanFundingSource:v3];

  return v4;
}

+ (id)_chaseDebitPaymentSource
{
  char v3 = [a1 _chaseDebitPlanSource];
  uint64_t v4 = [a1 _paymentFundingSourceFromPlanFundingSource:v3];

  return v4;
}

+ (id)_wellsFargoACHPaymentSource
{
  char v3 = [a1 _wellsFargoACHPlanSource];
  uint64_t v4 = [a1 _paymentFundingSourceFromPlanFundingSource:v3];

  return v4;
}

+ (id)_bankOfTheWestACHPaymentSource
{
  char v3 = [a1 _bankOfAmericaDebitPlanSource];
  uint64_t v4 = [a1 _paymentFundingSourceFromPlanFundingSource:v3];

  return v4;
}

+ (id)_paymentFundingSourceFromPlanFundingSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(PKPayLaterPaymentFundingSource);
  id v5 = [v3 identifier];
  [(PKPayLaterPaymentFundingSource *)v4 setIdentifier:v5];

  -[PKPayLaterPaymentFundingSource setType:](v4, "setType:", [v3 type]);
  id v6 = [v3 details];

  [(PKPayLaterPaymentFundingSource *)v4 setDetails:v6];
  return v4;
}

+ (id)generatePayLaterAccountForFinancingPlans:(id)a3
{
  id v4 = a3;
  id v26 = [a1 _boilerPlateAccount];
  id v5 = [v26 payLaterDetails];
  id v34 = 0;
  id v35 = 0;
  id v33 = 0;
  id v31 = 0;
  id v32 = 0;
  id v29 = 0;
  id v30 = 0;
  id v27 = 0;
  id v28 = 0;
  [a1 _calculateCurrentBalanceForFinancingPlans:v4 currentBalance:&v35 bnplCurrentBalance:&v34 loanCurrentBalance:&v33 amountPaid:&v32 bnplAmountPaid:&v31 loanAmountPaid:&v30 totalFinanced:&v29 bnplTotalFinanced:&v28 loanTotalFinanced:&v27];
  long long v23 = (NSDecimalNumber *)v35;
  id v6 = (NSDecimalNumber *)v34;
  id v25 = v33;
  id v7 = (NSDecimalNumber *)v32;
  id v8 = (NSDecimalNumber *)v31;
  id v24 = v30;
  uint64_t v9 = (NSDecimalNumber *)v29;
  uint64_t v10 = (NSDecimalNumber *)v28;
  id v22 = v27;
  uint64_t v11 = [a1 _nextDueAmountForFinancingPlans:v4];

  float v12 = PKCurrencyAmountCreate(v23, &cfstr_Usd.isa, 0);
  [v5 setCurrentBalance:v12];

  double v13 = PKCurrencyAmountCreate(v9, &cfstr_Usd.isa, 0);
  [v5 setTotalFinanced:v13];

  float v14 = PKCurrencyAmountCreate(v7, &cfstr_Usd.isa, 0);
  [v5 setAmountPaid:v14];

  double v15 = PKCurrencyAmountCreate(v11, &cfstr_Usd.isa, 0);
  [v5 setNextDueAmount:v15];

  double v16 = [v5 productForProductType:1];
  double v17 = [v16 productDetails];

  long long v18 = PKCurrencyAmountCreate(v6, &cfstr_Usd.isa, 0);
  [v17 setCurrentBalance:v18];

  float v19 = PKCurrencyAmountCreate(v10, &cfstr_Usd.isa, 0);
  [v17 setTotalFinanced:v19];

  uint64_t v20 = PKCurrencyAmountCreate(v8, &cfstr_Usd.isa, 0);

  [v17 setAmountPaid:v20];
  return v26;
}

+ (void)insertAndUpdateAccountWithNewPlanType:(unint64_t)a3 installmentCount:(int64_t)a4 principalAmount:(id)a5 apr:(id)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 completion:(id)a9
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a9;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a4 >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      long long v18 = +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:v17];
      [v16 addObject:v18];

      ++v17;
    }
    while (a4 != v17);
  }
  float v19 = +[PKPayLaterFinancingPlanGeneratorConfiguration configurationWithProductType:a3 apr:v14 totalPrincipal:v13 installmentCount:a4 daysSinceTransactionStart:a7 merchant:a8 fundingSources:1 payments:v16];
  [v19 setIgnoreFuturePayments:1];
  uint64_t v20 = +[PKPayLaterFinancingPlanGenerator financingPlanWithConfiguration:v19];
  v24[0] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [a1 insertAndUpdateAccountWithAdditionalFinancingPlans:v21 completion:v15];
}

+ (void)insertAndUpdateAccountWithAdditionalFinancingPlans:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  uint64_t v9 = +[PKAccountService sharedInstance];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__69;
  v41[4] = __Block_byref_object_dispose__69;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__69;
  v39[4] = __Block_byref_object_dispose__69;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__69;
  v37[4] = __Block_byref_object_dispose__69;
  id v38 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__69;
  v35[4] = __Block_byref_object_dispose__69;
  id v36 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke;
  v32[3] = &unk_1E56E0F18;
  id v10 = v9;
  id v33 = v10;
  id v34 = v37;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v32];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_4;
  v27[3] = &unk_1E56F1DB0;
  id v30 = v37;
  id v31 = a1;
  id v29 = v41;
  id v11 = v10;
  id v28 = v11;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v27];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_7;
  v22[3] = &unk_1E56F1DD8;
  id v12 = v11;
  id v23 = v12;
  id v24 = v37;
  id v25 = v41;
  id v26 = v35;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v22];
  id v13 = [MEMORY[0x1E4F1CA98] null];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_10;
  v16[3] = &unk_1E56F1E00;
  long long v18 = v41;
  float v19 = v39;
  uint64_t v20 = v37;
  uint64_t v21 = v35;
  id v14 = v7;
  id v17 = v14;
  id v15 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v13 completion:v16];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PKAccountServicePayLaterFinancingPlanQuery alloc] initWithAccountIdentifier:@"pay-later-account-001" queryItems:32];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_2;
  v13[3] = &unk_1E56F1D60;
  id v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 financingPlansWithQuery:v8 completion:v13];
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_3;
  block[3] = &unk_1E56EBD20;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) relevantFinancingPlans];
  [v2 addObjectsFromArray:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 56) generatePayLaterAccountForFinancingPlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v12 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(v11 + 8) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_5;
  v16[3] = &unk_1E56F1D88;
  id v18 = v7;
  uint64_t v19 = v11;
  id v17 = v6;
  id v14 = v6;
  id v15 = v7;
  [v12 insertOrUpdateLocalAccount:v13 completion:v16];
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_6;
  block[3] = &unk_1E56EBD20;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_7(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 40);
  long long v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_8;
  v14[3] = &unk_1E56E99F0;
  uint64_t v11 = a1[7];
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v8 insertOrUpdateLocalFinancingPlans:v9 accountIdentifier:v10 completion:v14];
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_9;
  block[3] = &unk_1E56EBD20;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_9(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_10(void *a1, uint64_t a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v8 = [*(id *)(*(void *)(a1[7] + 8) + 40) count];
    if (v8 == [*(id *)(*(void *)(a1[8] + 8) + 40) count]) {
      goto LABEL_6;
    }
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"Could not add financing plans";
    long long v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = &v19;
    id v12 = &v18;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Could not form pay later account";
    long long v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = (__CFString **)v21;
    id v12 = &v20;
  }
  id v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  uint64_t v14 = [v9 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];
  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_6:
  uint64_t v17 = a1[4];
  if (v17) {
    (*(void (**)(uint64_t, void, void, void))(v17 + 16))(v17, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
}

+ (void)deleteMockAccountWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[PKAccountService sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E56D8388;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteLocalAccountWithIdentifier:@"pay-later-account-001" completion:v6];
}

void __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (void)_calculateCurrentBalanceForFinancingPlans:(id)a3 currentBalance:(id *)a4 bnplCurrentBalance:(id *)a5 loanCurrentBalance:(id *)a6 amountPaid:(id *)a7 bnplAmountPaid:(id *)a8 loanAmountPaid:(id *)a9 totalFinanced:(id *)a10 bnplTotalFinanced:(id *)a11 loanTotalFinanced:(id *)a12
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = [MEMORY[0x1E4F28C28] zero];
  id v46 = [MEMORY[0x1E4F28C28] zero];
  id v41 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v14 = [MEMORY[0x1E4F28C28] zero];
  id v45 = [MEMORY[0x1E4F28C28] zero];
  id v40 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v15 = [MEMORY[0x1E4F28C28] zero];
  id v44 = [MEMORY[0x1E4F28C28] zero];
  id v37 = [MEMORY[0x1E4F28C28] zero];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v12;
  uint64_t v47 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v47)
  {
    uint64_t v43 = *(void *)v50;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v15;
      uint64_t v18 = v14;
      uint64_t v19 = v13;
      do
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
        uint64_t v21 = [v20 planSummary];
        id v22 = [v21 currentBalance];
        id v23 = [v22 amount];

        id v24 = [v20 planSummary];
        id v25 = [v24 paymentAmountToDate];
        id v26 = [v25 amount];

        id v27 = [v20 planSummary];
        id v28 = [v27 totalAmount];
        id v29 = [v28 amount];

        id v48 = [v19 decimalNumberByAdding:v23];

        uint64_t v14 = [v18 decimalNumberByAdding:v26];

        uint64_t v30 = [v17 decimalNumberByAdding:v29];

        if ([v20 productType] == 1)
        {
          uint64_t v31 = [v46 decimalNumberByAdding:v23];

          uint64_t v32 = [v45 decimalNumberByAdding:v26];

          uint64_t v33 = [v44 decimalNumberByAdding:v29];

          id v44 = (id)v33;
          id v45 = (id)v32;
          id v46 = (id)v31;
        }

        ++v16;
        uint64_t v17 = (void *)v30;
        uint64_t v18 = v14;
        id v13 = v48;
        uint64_t v19 = v48;
      }
      while (v47 != v16);
      uint64_t v15 = (void *)v30;
      uint64_t v47 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v47);
  }

  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v46;
  }
  if (a6) {
    *a6 = v41;
  }
  if (a7) {
    *a7 = v14;
  }
  if (a8) {
    *a8 = v45;
  }
  if (a9) {
    *a9 = v40;
  }
  if (a10) {
    *a10 = v15;
  }
  if (a11) {
    *a11 = v44;
  }
  if (a12) {
    *a12 = v37;
  }
}

+ (id)_nextDueAmountForFinancingPlans:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28C28] zero];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v26;
  do
  {
    uint64_t v10 = 0;
    uint64_t v24 = v7;
    do
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = [*(id *)(*((void *)&v25 + 1) + 8 * v10) scheduleSummary];
      id v12 = [v11 nextDueInstallment];

      if (v12)
      {
        id v13 = [v12 dueDate];
        uint64_t v14 = PKDateIgnoringSmallerUnitsWithTimeZone(v13, 16, 1);

        uint64_t v15 = [v12 currentBalance];
        uint64_t v16 = [v15 amount];

        if (v8)
        {
          if ([v14 compare:v8] != -1)
          {
            if (![v14 compare:v8])
            {
              id v17 = [v4 decimalNumberByAdding:v16];
              goto LABEL_12;
            }
LABEL_15:

            goto LABEL_16;
          }
          uint64_t v19 = v9;
          uint64_t v20 = v4;
          id v21 = v5;
          id v22 = v14;

          id v18 = v16;
          id v8 = v22;
          id v5 = v21;
          id v4 = v20;
          uint64_t v9 = v19;
          uint64_t v7 = v24;
        }
        else
        {
          id v8 = v14;
          id v17 = v16;
LABEL_12:
          id v18 = v17;
        }

        id v4 = v18;
        goto LABEL_15;
      }
LABEL_16:

      ++v10;
    }
    while (v7 != v10);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);
LABEL_20:

  return v4;
}

+ (id)_boilerPlateAccount
{
  id v2 = PKAccountServiceOverrideURL();
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://example.apple.com/fps"];
  }
  id v5 = v4;

  uint64_t v6 = [v5 URLByAppendingPathComponent:@"v1"];
  uint64_t v7 = [v6 URLByAppendingPathComponent:@"accounts"];
  uint64_t v55 = [v7 URLByAppendingPathComponent:@"pay-later-account-001"];

  id v8 = objc_alloc_init(PKAccount);
  [(PKAccount *)v8 setAccountIdentifier:@"pay-later-account-001"];
  v56 = v5;
  [(PKAccount *)v8 setAccountBaseURL:v5];
  uint64_t v9 = [v5 URLByAppendingPathComponent:@"paymentservices"];
  [(PKAccount *)v8 setPaymentServicesBaseURL:v9];

  [(PKAccount *)v8 setPaymentServicesBaseURL:v55];
  [(PKAccount *)v8 setFeature:3];
  [(PKAccount *)v8 setType:2];
  [(PKAccount *)v8 setState:1];
  [(PKAccount *)v8 setStateReason:0];
  [(PKAccount *)v8 setAccessLevel:1];
  uint64_t v54 = objc_alloc_init(PKAccountFetchPeriods);
  [(PKAccountFetchPeriods *)v54 setFinancingPlansFetchPeriod:86400.0];
  [(PKAccountFetchPeriods *)v54 setAccountFetchPeriod:76400.0];
  [(PKAccountFetchPeriods *)v54 setFundingSourcesFetchPeriod:66400.0];
  long long v49 = v8;
  [(PKAccount *)v8 setFetchPeriods:v54];
  id v53 = objc_alloc_init(PKAccountAdditionalPushTopics);
  [(PKAccountAdditionalPushTopics *)v53 setFinancingPlans:@"financingPlans"];
  [(PKAccountAdditionalPushTopics *)v53 setFundingSources:@"fundingSources"];
  [(PKAccountAdditionalPushTopics *)v53 setAccount:@"accountPushTopic"];
  long long v52 = objc_alloc_init(PKPayLaterAccountFeatureDescriptor);
  [(PKAccountFeatureDescriptor *)v52 setIdentifier:@"showNotifications"];
  long long v51 = objc_alloc_init(PKPayLaterAccountFeatureDescriptor);
  [(PKAccountFeatureDescriptor *)v51 setIdentifier:@"provisioningAllowed"];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v52, v51, 0);
  [(PKAccount *)v8 setSupportedFeatures:v10];

  uint64_t v11 = objc_alloc_init(PKPayLaterAccountDetails);
  [(PKPayLaterAccountDetails *)v11 setCountryCode:@"US"];
  [(PKPayLaterAccountDetails *)v11 setAssociatedPassSerialNumber:@"wallettest.cocoon.serialnumber"];
  [(PKPayLaterAccountDetails *)v11 setAssociatedPassTypeIdentifier:@"paymentpass.com.apple.wallet.dev"];
  [(PKPayLaterAccountDetails *)v11 setCardNetwork:3];
  [(PKPayLaterAccountDetails *)v11 setAvailableLanguages:&unk_1EE22B2A0];
  [(PKPayLaterAccountDetails *)v11 setRequiresGenericMessaging:0];
  long long v50 = objc_alloc_init(PKPayLaterAccountTermsDetails);
  [(PKPayLaterAccountTermsDetails *)v50 setTermsIdentifier:@"cocoon-terms-financing-option-identifier"];
  [(PKPayLaterAccountTermsDetails *)v50 setTermsAcceptanceRequired:0];
  [(PKPayLaterAccountDetails *)v11 setTermsDetails:v50];
  id v12 = objc_alloc_init(PKPayLaterAccountUserInfo);
  id v48 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v48 setText:@"kabeles@icloud.com"];
  [(PKPayLaterAccountUserInfoValue *)v48 setOdiAttribute:@"emailAddress"];
  [(PKPayLaterAccountUserInfo *)v12 setEmailAddress:v48];
  uint64_t v47 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v47 setText:@"Katie"];
  [(PKPayLaterAccountUserInfoValue *)v47 setOdiAttribute:@"firstName"];
  [(PKPayLaterAccountUserInfo *)v12 setFirstName:v47];
  id v46 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v46 setText:@"Abeles"];
  [(PKPayLaterAccountUserInfoValue *)v46 setOdiAttribute:@"lastName"];
  [(PKPayLaterAccountUserInfo *)v12 setLastName:v46];
  id v13 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  id v45 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v14 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v45 setCalendar:v14];

  [v45 setDateFormat:@"yyyy-MM-dd"];
  [v45 dateFromString:@"1993-19-03"];
  id v44 = v43 = v13;
  [(PKPayLaterAccountUserInfoValue *)v13 setDate:v44];
  [(PKPayLaterAccountUserInfoValue *)v13 setOdiAttribute:@"dateOfBirth"];
  [(PKPayLaterAccountUserInfo *)v12 setDateOfBirth:v13];
  id v42 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v42 setText:@"(574)-555-0164"];
  [(PKPayLaterAccountUserInfoValue *)v42 setOdiAttribute:@"phoneNumber"];
  [(PKPayLaterAccountUserInfo *)v12 setPhoneNumber:v42];
  id v41 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v41 setText:@"311 Sharon Lane"];
  [(PKPayLaterAccountUserInfoValue *)v41 setOdiAttribute:@"street1"];
  [(PKPayLaterAccountUserInfo *)v12 setStreet1:v41];
  id v40 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v40 setText:&stru_1EE0F5368];
  [(PKPayLaterAccountUserInfoValue *)v40 setOdiAttribute:@"street2"];
  [(PKPayLaterAccountUserInfo *)v12 setStreet2:v40];
  id v39 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v39 setText:@"South Bend"];
  [(PKPayLaterAccountUserInfoValue *)v39 setOdiAttribute:@"city"];
  [(PKPayLaterAccountUserInfo *)v12 setCity:v39];
  uint64_t v15 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v15 setText:@"IN"];
  [(PKPayLaterAccountUserInfoValue *)v15 setOdiAttribute:@"state"];
  [(PKPayLaterAccountUserInfo *)v12 setState:v15];
  uint64_t v16 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v16 setText:@"46601"];
  [(PKPayLaterAccountUserInfoValue *)v16 setOdiAttribute:@"postalCode"];
  [(PKPayLaterAccountUserInfo *)v12 setPostalCode:v16];
  id v38 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  [(PKPayLaterAccountUserInfoValue *)v16 setHasHiddenValue:1];
  [(PKPayLaterAccountUserInfo *)v12 setSsn:v38];
  id v17 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  id v18 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"100000"];
  uint64_t v19 = PKCurrencyAmountCreate(v18, &cfstr_Usd.isa, 0);
  id v37 = v17;
  [(PKPayLaterAccountUserInfoValue *)v17 setCurrencyAmount:v19];

  [(PKPayLaterAccountUserInfoValue *)v15 setOdiAttribute:@"yearlyIncome"];
  [(PKPayLaterAccountUserInfo *)v12 setYearlyIncome:v17];
  [(PKPayLaterAccountDetails *)v11 setUserInfo:v12];
  id v36 = objc_alloc_init(PKPayLaterAccountProduct);
  [(PKPayLaterAccountProduct *)v36 setProductType:1];
  uint64_t v20 = objc_alloc_init(PKPayLaterAccountProductDetails);
  id v21 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
  [(PKPayLaterAccountProductDetails *)v20 setProductTimeZone:v21];

  id v22 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"50"];
  id v23 = PKCurrencyAmountCreate(v22, &cfstr_Usd.isa, 0);
  [(PKPayLaterAccountProductDetails *)v20 setMinimumSinglePurchaseAmount:v23];

  uint64_t v24 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"1000"];
  long long v25 = PKCurrencyAmountCreate(v24, &cfstr_Usd.isa, 0);
  [(PKPayLaterAccountProductDetails *)v20 setMaximumSinglePurchaseAmount:v25];

  long long v26 = objc_alloc_init(PKPayLaterAccountProduct);
  [(PKPayLaterAccountProduct *)v26 setProductType:1];
  long long v27 = objc_alloc_init(PKPayLaterAccountProductDetails);
  long long v28 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
  [(PKPayLaterAccountProductDetails *)v27 setProductTimeZone:v28];

  id v29 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"300"];
  uint64_t v30 = PKCurrencyAmountCreate(v29, &cfstr_Usd.isa, 0);
  [(PKPayLaterAccountProductDetails *)v27 setMinimumSinglePurchaseAmount:v30];

  uint64_t v31 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"10000"];
  uint64_t v32 = PKCurrencyAmountCreate(v31, &cfstr_Usd.isa, 0);
  [(PKPayLaterAccountProductDetails *)v27 setMaximumSinglePurchaseAmount:v32];

  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v36, v26, 0);
  [(PKPayLaterAccountDetails *)v11 setProducts:v33];

  id v34 = [[PKAccountDetails alloc] initWithPayLaterDetails:v11];
  [(PKAccount *)v49 setDetails:v34];

  return v49;
}

@end