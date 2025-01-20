@interface PKBillPaymentSuggestedAmountController
+ (id)_transactionsRequestForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5;
+ (id)_transactionsRequestSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5;
+ (void)_transactionsTotalAmountForRequest:(id)a3 completion:(id)a4;
+ (void)approvedTransactionsSpendingTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6;
+ (void)approvedTransactionsSpendingTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6;
+ (void)approvedTransactionsTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6;
+ (void)approvedTransactionsTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6;
+ (void)currentStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4;
+ (void)defaultControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 completion:(id)a7;
+ (void)previousStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4;
- (BOOL)_allMandatoryValuesAreSameAmount;
- (BOOL)_calculateCurrentStatementIsLastMonthsStatement;
- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3;
- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3;
- (BOOL)_suggestedAmountListIsValidAfterPurgeIfNecessary:(id)a3;
- (NSArray)currentStatementSelectedSuggestedAmountEvents;
- (NSArray)previousStatementSelectedSuggestedAmountEvents;
- (NSDecimalNumber)currentStatementPaymentsSum;
- (NSDecimalNumber)currentStatementPurchasesSum;
- (NSDecimalNumber)previousStatementPaymentsSum;
- (NSDecimalNumber)previousStatementPurchasesSum;
- (NSDictionary)currentStatementMerchantCategoryTransactionSums;
- (NSDictionary)previousStatementMerchantCategoryTransactionSums;
- (PKAccount)account;
- (PKAccountServiceAccountResolutionConfiguration)configuration;
- (PKAccountUserCollection)accountUserCollection;
- (PKBillPaymentSuggestedAmountController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 currentStatementSelectedSuggestedAmountEvents:(id)a6 previousStatementSelectedSuggestedAmountEvents:(id)a7 currentStatementPaymentsSum:(id)a8 previousStatementPaymentsSum:(id)a9 currentStatementPurchasesSum:(id)a10 previousStatementPurchasesSum:(id)a11 currentStatementMerchantCategoryTransactionSums:(id)a12 previousStatementMerchantCategoryTransactionSums:(id)a13 configuration:(id)a14;
- (PKTransactionSource)transactionSource;
- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 suggestedAmountWithSameCategory:(id)a5;
- (id)_createDefaultAmountSuggestionListFromAccount;
- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4;
- (id)_messageForSuggestion:(id)a3;
- (id)_planCompletionTitleString;
- (id)_remainingStatementBalanceGapDescriptionText;
- (id)_remainingStatementBalanceGapTitleText;
- (id)_remainingStatementBalanceMessageString;
- (id)_remainingStatementBalanceTitleString;
- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 creditUtilization:(id)a4 lastPaymentCategory:(unint64_t)a5;
- (id)_titleForSuggestion:(id)a3;
- (id)differentialPrivacyFeaturesAsString;
- (id)generateAmountSuggestionListWithFinHealth:(BOOL)a3;
- (id)paymentRingInstrumentationRecordAsString;
- (void)_generateAmountSuggestionListUsingTransactionHistoryForList:(id)a3;
- (void)_initializeDifferentialPrivacy:(id)a3 accountSummary:(id)a4;
- (void)_initializePaymentRingInstrumentationRecord:(id)a3 accountSummary:(id)a4;
- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7;
- (void)_populatePriorityValuesForList:(id)a3;
- (void)_populateStringValuesForList:(id)a3;
- (void)_setDifferentialPrivacyFeature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)_zerothOrFirstMonthBillPaymentSuggestionsForList:(id)a3;
- (void)recordPaymentActionWithDifferentialPrivacy:(unint64_t)a3;
- (void)recordPaymentRingAction:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation PKBillPaymentSuggestedAmountController

+ (void)defaultControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = dispatch_group_create();
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__65;
  v86[4] = __Block_byref_object_dispose__65;
  id v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__65;
  v84[4] = __Block_byref_object_dispose__65;
  id v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__65;
  v82[4] = __Block_byref_object_dispose__65;
  id v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__65;
  v80[4] = __Block_byref_object_dispose__65;
  id v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__65;
  v78[4] = __Block_byref_object_dispose__65;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__65;
  v76[4] = __Block_byref_object_dispose__65;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__65;
  v74[4] = __Block_byref_object_dispose__65;
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__65;
  v72[4] = __Block_byref_object_dispose__65;
  v31 = v13;
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatch_group_enter(v17);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke;
  v69[3] = &unk_1E56F1318;
  v71 = v80;
  v18 = v17;
  v70 = v18;
  [a1 approvedTransactionsTotalForPreviousStatementForAccount:v12 transactionSource:v14 transactionType:10 completion:v69];
  dispatch_group_enter(v18);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_2;
  v66[3] = &unk_1E56F1318;
  v68 = v82;
  v19 = v18;
  v67 = v19;
  [a1 approvedTransactionsTotalSinceStatementForAccount:v12 transactionSource:v14 transactionType:10 completion:v66];
  dispatch_group_enter(v19);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_3;
  v63[3] = &unk_1E56F1318;
  v65 = v78;
  v20 = v19;
  v64 = v20;
  [a1 approvedTransactionsTotalSinceStatementForAccount:v12 transactionSource:v14 transactionType:0 completion:v63];
  dispatch_group_enter(v20);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_4;
  v60[3] = &unk_1E56F1318;
  v62 = v76;
  v21 = v20;
  v61 = v21;
  [a1 approvedTransactionsTotalForPreviousStatementForAccount:v12 transactionSource:v14 transactionType:0 completion:v60];
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (i && i != 6)
    {
      dispatch_group_enter(v21);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_5;
      v56[3] = &unk_1E56F1340;
      v58 = v74;
      uint64_t v59 = i;
      v23 = v21;
      v57 = v23;
      [a1 approvedTransactionsSpendingTotalSinceStatementForAccount:v12 transactionSource:v14 merchantCategory:i completion:v56];
      dispatch_group_enter(v23);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_6;
      v52[3] = &unk_1E56F1340;
      v54 = v72;
      uint64_t v55 = i;
      v53 = v23;
      [a1 approvedTransactionsSpendingTotalForPreviousStatementForAccount:v12 transactionSource:v14 merchantCategory:i completion:v52];
    }
  }
  dispatch_group_enter(v21);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_7;
  v49[3] = &unk_1E56DD778;
  v51 = v86;
  v24 = v21;
  v50 = v24;
  [a1 currentStatementSelectedSuggestedAmountEventsForAccount:v12 completion:v49];
  dispatch_group_enter(v24);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_8;
  v46[3] = &unk_1E56DD778;
  v48 = v84;
  v25 = v24;
  v47 = v25;
  [a1 previousStatementSelectedSuggestedAmountEventsForAccount:v12 completion:v46];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_9;
  block[3] = &unk_1E56F1368;
  id v33 = v12;
  id v34 = v31;
  v39 = v84;
  v40 = v82;
  v41 = v80;
  v42 = v78;
  v43 = v76;
  v44 = v74;
  v45 = v72;
  id v35 = v14;
  id v36 = v15;
  v38 = v86;
  id v37 = v16;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  id v29 = v31;
  id v30 = v12;
  dispatch_group_notify(v25, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v82, 8);

  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 amount];
  uint64_t v4 = objc_msgSend(v3, "pk_absoluteValue");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 amount];
  uint64_t v4 = objc_msgSend(v3, "pk_absoluteValue");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 amount];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 amount];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = [a2 amount];
  if (v5 && (objc_msgSend(v5, "pk_isZeroNumber") & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    [v3 setObject:v5 forKey:v4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = [a2 amount];
  if (v5 && (objc_msgSend(v5, "pk_isZeroNumber") & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    [v3 setObject:v5 forKey:v4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_9(void *a1)
{
  v2 = [[PKBillPaymentSuggestedAmountController alloc] initWithAccount:a1[4] accountUserCollection:a1[5] transactionSource:a1[6] currentStatementSelectedSuggestedAmountEvents:*(void *)(*(void *)(a1[9] + 8) + 40) previousStatementSelectedSuggestedAmountEvents:*(void *)(*(void *)(a1[10] + 8) + 40) currentStatementPaymentsSum:*(void *)(*(void *)(a1[11] + 8) + 40) previousStatementPaymentsSum:*(void *)(*(void *)(a1[12] + 8) + 40) currentStatementPurchasesSum:*(void *)(*(void *)(a1[13] + 8) + 40) previousStatementPurchasesSum:*(void *)(*(void *)(a1[14] + 8) + 40) currentStatementMerchantCategoryTransactionSums:*(void *)(*(void *)(a1[15] + 8) + 40) previousStatementMerchantCategoryTransactionSums:*(void *)(*(void *)(a1[16] + 8) + 40) configuration:a1[7]];
  (*(void (**)(void))(a1[8] + 16))();
}

+ (void)approvedTransactionsTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _transactionsRequestSinceStatementForAccount:a3 transactionSource:a4 transactionType:a5];
  [a1 _transactionsTotalAmountForRequest:v11 completion:v10];
}

+ (void)approvedTransactionsTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _transactionsRequestForPreviousStatementForAccount:a3 transactionSource:a4 transactionType:a5];
  [a1 _transactionsTotalAmountForRequest:v11 completion:v10];
}

+ (void)approvedTransactionsSpendingTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _transactionsRequestForPreviousStatementForAccount:a3 transactionSource:a4 transactionType:0];
  [v11 setMerchantCategory:a5];
  [a1 _transactionsTotalAmountForRequest:v11 completion:v10];
}

+ (void)approvedTransactionsSpendingTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _transactionsRequestSinceStatementForAccount:a3 transactionSource:a4 transactionType:0];
  [v11 setMerchantCategory:a5];
  [a1 _transactionsTotalAmountForRequest:v11 completion:v10];
}

+ (id)_transactionsRequestForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 creditDetails];
  id v10 = [v9 accountSummary];
  id v11 = [v10 currentStatement];

  id v12 = [v8 associatedPassUniqueID];
  id v13 = [v11 openingDate];
  id v14 = [v11 closingDate];
  id v15 = [v8 creditDetails];

  id v16 = [v15 currencyCode];

  v17 = 0;
  if (v13 && v14 && v12 && v16)
  {
    v17 = objc_alloc_init(PKPaymentTransactionRequest);
    v18 = [v7 transactionSourceIdentifiers];
    [(PKPaymentTransactionRequest *)v17 setTransactionSourceIdentifiers:v18];

    [(PKPaymentTransactionRequest *)v17 setStartStatusChangeDate:v13];
    [(PKPaymentTransactionRequest *)v17 setEndStatusChangeDate:v14];
    v19 = [NSNumber numberWithInteger:a5];
    v22[0] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(PKPaymentTransactionRequest *)v17 setTransactionTypes:v20];

    [(PKPaymentTransactionRequest *)v17 setTransactionStatuses:&unk_1EE22B270];
    [(PKPaymentTransactionRequest *)v17 setCurrencyCode:v16];
  }

  return v17;
}

+ (id)_transactionsRequestSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 creditDetails];
  id v10 = [v9 accountSummary];
  id v11 = [v10 balanceSummary];

  id v12 = [v8 associatedPassUniqueID];
  id v13 = [v11 openingDate];
  id v14 = [v11 closingDate];
  id v15 = [v8 creditDetails];

  id v16 = [v15 currencyCode];

  v17 = 0;
  if (v13 && v14 && v12 && v16)
  {
    v17 = objc_alloc_init(PKPaymentTransactionRequest);
    v18 = [v7 transactionSourceIdentifiers];
    [(PKPaymentTransactionRequest *)v17 setTransactionSourceIdentifiers:v18];

    [(PKPaymentTransactionRequest *)v17 setStartStatusChangeDate:v13];
    [(PKPaymentTransactionRequest *)v17 setEndStatusChangeDate:v14];
    v19 = [NSNumber numberWithInteger:a5];
    v22[0] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(PKPaymentTransactionRequest *)v17 setTransactionTypes:v20];

    [(PKPaymentTransactionRequest *)v17 setTransactionStatuses:&unk_1EE22B288];
    [(PKPaymentTransactionRequest *)v17 setCurrencyCode:v16];
  }

  return v17;
}

+ (void)_transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void))a4;
  if (v5)
  {
    if (v7)
    {
      v6 = objc_alloc_init(PKPaymentService);
      [(PKPaymentService *)v6 transactionsTotalAmountForRequest:v7 completion:v5];
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

+ (void)currentStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    id v7 = [v6 creditDetails];
    id v8 = [v7 accountSummary];
    v9 = [v8 currentStatement];

    id v10 = [v9 identifier];
    id v11 = [v6 accountIdentifier];

    if (v11 && v9 && v10)
    {
      id v12 = +[PKAccountService sharedInstance];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __109__PKBillPaymentSuggestedAmountController_currentStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke;
      v13[3] = &unk_1E56D90D8;
      id v14 = v5;
      [v12 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v11 withStatementIdentifier:v10 completion:v13];
    }
    else
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
    }
  }
}

uint64_t __109__PKBillPaymentSuggestedAmountController_currentStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)previousStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    id v7 = [v6 creditDetails];
    id v8 = [v7 accountSummary];
    v9 = [v8 currentStatement];

    id v10 = [v6 accountIdentifier];

    id v11 = [v9 openingDate];
    uint64_t v12 = [v9 closingDate];
    id v13 = (void *)v12;
    if (v11 && v12)
    {
      id v14 = +[PKAccountService sharedInstance];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __110__PKBillPaymentSuggestedAmountController_previousStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke;
      v15[3] = &unk_1E56D90D8;
      id v16 = v5;
      [v14 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v10 withStartDate:v11 endDate:v13 completion:v15];
    }
    else
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
    }
  }
}

uint64_t __110__PKBillPaymentSuggestedAmountController_previousStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKBillPaymentSuggestedAmountController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 currentStatementSelectedSuggestedAmountEvents:(id)a6 previousStatementSelectedSuggestedAmountEvents:(id)a7 currentStatementPaymentsSum:(id)a8 previousStatementPaymentsSum:(id)a9 currentStatementPurchasesSum:(id)a10 previousStatementPurchasesSum:(id)a11 currentStatementMerchantCategoryTransactionSums:(id)a12 previousStatementMerchantCategoryTransactionSums:(id)a13 configuration:(id)a14
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v76 = a4;
  id v90 = a4;
  id v89 = a5;
  id v77 = a6;
  id v88 = a6;
  id v78 = a7;
  id v19 = a7;
  id v80 = a8;
  id v87 = a8;
  id v86 = a9;
  id v85 = a10;
  id v84 = a11;
  id v20 = a12;
  id v21 = a13;
  id v83 = a14;
  v92.receiver = self;
  v92.super_class = (Class)PKBillPaymentSuggestedAmountController;
  v22 = [(PKBillPaymentSuggestedAmountController *)&v92 init];
  v23 = v22;
  if (!v22) {
    goto LABEL_35;
  }
  id v74 = v19;
  objc_storeStrong((id *)&v22->_account, a3);
  objc_storeStrong((id *)&v23->_accountUserCollection, v76);
  objc_storeStrong((id *)&v23->_transactionSource, a5);
  objc_storeStrong((id *)&v23->_currentStatementSelectedSuggestedAmountEvents, v77);
  objc_storeStrong((id *)&v23->_previousStatementSelectedSuggestedAmountEvents, v78);
  p_currentStatementPaymentsSum = &v23->_currentStatementPaymentsSum;
  objc_storeStrong((id *)&v23->_currentStatementPaymentsSum, v80);
  p_previousStatementPaymentsSum = &v23->_previousStatementPaymentsSum;
  objc_storeStrong((id *)&v23->_previousStatementPaymentsSum, a9);
  objc_storeStrong((id *)&v23->_currentStatementPurchasesSum, a10);
  objc_storeStrong((id *)&v23->_previousStatementPurchasesSum, a11);
  id v82 = v20;
  uint64_t v25 = [v20 copy];
  currentStatementMerchantCategoryTransactionSums = v23->_currentStatementMerchantCategoryTransactionSums;
  v23->_currentStatementMerchantCategoryTransactionSums = (NSDictionary *)v25;

  uint64_t v27 = [v21 copy];
  previousStatementMerchantCategoryTransactionSums = v23->_previousStatementMerchantCategoryTransactionSums;
  v23->_previousStatementMerchantCategoryTransactionSums = (NSDictionary *)v27;

  objc_storeStrong((id *)&v23->_configuration, a14);
  id v29 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = *p_previousStatementPaymentsSum;
    *(_DWORD *)buf = 138412290;
    v94 = v30;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementPaymentsSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *p_currentStatementPaymentsSum;
    *(_DWORD *)buf = 138412290;
    v94 = v31;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementPaymentsSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    previousStatementPurchasesSum = v23->_previousStatementPurchasesSum;
    *(_DWORD *)buf = 138412290;
    v94 = previousStatementPurchasesSum;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementPurchasesSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    currentStatementPurchasesSum = v23->_currentStatementPurchasesSum;
    *(_DWORD *)buf = 138412290;
    v94 = currentStatementPurchasesSum;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementPurchasesSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = v23->_currentStatementMerchantCategoryTransactionSums;
    *(_DWORD *)buf = 138412290;
    v94 = v34;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementMerchantCategoryTransactionSums: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = v23->_previousStatementMerchantCategoryTransactionSums;
    *(_DWORD *)buf = 138412290;
    v94 = v35;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementMerchantCategoryTransactionSums: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    currentStatementSelectedSuggestedAmountEvents = v23->_currentStatementSelectedSuggestedAmountEvents;
    *(_DWORD *)buf = 138412290;
    v94 = currentStatementSelectedSuggestedAmountEvents;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementSelectedSuggestedAmountEvents: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    previousStatementSelectedSuggestedAmountEvents = v23->_previousStatementSelectedSuggestedAmountEvents;
    *(_DWORD *)buf = 138412290;
    v94 = previousStatementSelectedSuggestedAmountEvents;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementSelectedSuggestedAmountEvents: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    configuration = v23->_configuration;
    *(_DWORD *)buf = 138412290;
    v94 = configuration;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using configuration: %@", buf, 0xCu);
  }

  v39 = [(PKAccount *)v23->_account creditDetails];
  v40 = [v39 productTimeZone];

  v41 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  monthAndDayFormatter = v23->_monthAndDayFormatter;
  v23->_monthAndDayFormatter = v41;

  [(NSDateFormatter *)v23->_monthAndDayFormatter setTimeZone:v40];
  [(NSDateFormatter *)v23->_monthAndDayFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
  v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  monthFormatter = v23->_monthFormatter;
  v23->_monthFormatter = v43;

  [(NSDateFormatter *)v23->_monthFormatter setTimeZone:v40];
  [(NSDateFormatter *)v23->_monthFormatter setLocalizedDateFormatFromTemplate:@"MMMM"];
  v45 = [(PKAccount *)v23->_account creditDetails];
  v46 = [v45 accountSummary];
  v47 = [v46 currentStatement];
  v48 = [v47 identifier];
  uint64_t v49 = [v48 length];

  char v50 = [(NSDecimalNumber *)v23->_previousStatementPaymentsSum pk_isPositiveNumber];
  v23->_isMonthZero = v49 == 0;
  char v51 = v50 ^ 1;
  if (!v49) {
    char v51 = 0;
  }
  v23->_isMonthOne = v51;
  v23->_numberOfActiveInstallments = [v45 numberOfActiveInstallments];
  v23->_numberOfActiveStatementedInstallments = [v45 numberOfActiveStatementedInstallments];
  uint64_t v52 = [(NSArray *)v23->_currentStatementSelectedSuggestedAmountEvents sortedArrayUsingComparator:&__block_literal_global_184];
  v53 = v23->_currentStatementSelectedSuggestedAmountEvents;
  v23->_currentStatementSelectedSuggestedAmountEvents = (NSArray *)v52;

  uint64_t v54 = [(NSArray *)v23->_previousStatementSelectedSuggestedAmountEvents sortedArrayUsingComparator:&__block_literal_global_37_0];
  uint64_t v55 = v23->_previousStatementSelectedSuggestedAmountEvents;
  v23->_previousStatementSelectedSuggestedAmountEvents = (NSArray *)v54;

  currentStatementPaymentsSum = v23->_currentStatementPaymentsSum;
  v57 = [MEMORY[0x1E4F28C28] zero];
  v58 = v57;
  if (!currentStatementPaymentsSum || !v57)
  {

    if (currentStatementPaymentsSum != v58) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  char v59 = [(NSDecimalNumber *)currentStatementPaymentsSum isEqual:v57];

  if (v59)
  {
LABEL_25:
    v60 = *p_currentStatementPaymentsSum;
    *p_currentStatementPaymentsSum = 0;
  }
LABEL_26:
  v61 = *p_previousStatementPaymentsSum;
  v62 = [MEMORY[0x1E4F28C28] zero];
  v63 = v62;
  if (!v61 || !v62)
  {

    BOOL v73 = v61 == v63;
    id v19 = v74;
    if (!v73) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v64 = [(NSDecimalNumber *)v61 isEqual:v62];

  id v19 = v74;
  if (v64)
  {
LABEL_29:
    v65 = *p_previousStatementPaymentsSum;
    *p_previousStatementPaymentsSum = 0;
  }
LABEL_30:
  uint64_t v66 = 144;
  if (!v23->_isMonthZero) {
    uint64_t v66 = 160;
  }
  objc_storeStrong((id *)&v23->_statementPurchasesSum, *(id *)((char *)&v23->super.isa + v66));
  uint64_t v67 = 184;
  if (!v23->_isMonthZero) {
    uint64_t v67 = 176;
  }
  uint64_t v68 = [*(id *)((char *)&v23->super.isa + v67) copy];
  merchantCategoryTransactionSums = v23->_merchantCategoryTransactionSums;
  v23->_merchantCategoryTransactionSums = (NSDictionary *)v68;

  v23->_currentStatementIsLastMonthsStatement = [(PKBillPaymentSuggestedAmountController *)v23 _calculateCurrentStatementIsLastMonthsStatement];
  [(PKBillPaymentSuggestedAmountController *)v23 _initializeDifferentialPrivacy:v19 accountSummary:v46];
  [(PKBillPaymentSuggestedAmountController *)v23 _initializePaymentRingInstrumentationRecord:v19 accountSummary:v46];
  v70 = (FHPaymentRingSuggestionController *)objc_alloc_init((Class)getFHPaymentRingSuggestionControllerClass[0]());
  fhController = v23->_fhController;
  v23->_fhController = v70;

  id v20 = v82;
LABEL_35:

  return v23;
}

uint64_t __418__PKBillPaymentSuggestedAmountController_initWithAccount_accountUserCollection_transactionSource_currentStatementSelectedSuggestedAmountEvents_previousStatementSelectedSuggestedAmountEvents_currentStatementPaymentsSum_previousStatementPaymentsSum_currentStatementPurchasesSum_previousStatementPurchasesSum_currentStatementMerchantCategoryTransactionSums_previousStatementMerchantCategoryTransactionSums_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 items];
  id v6 = [v5 allObjects];
  id v7 = [v6 firstObject];

  id v8 = [v4 items];

  v9 = [v8 allObjects];
  id v10 = [v9 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v11 = v10;
    uint64_t v12 = [v7 transactionDate];
    id v13 = [v11 transactionDate];

    uint64_t v14 = [v12 compare:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __418__PKBillPaymentSuggestedAmountController_initWithAccount_accountUserCollection_transactionSource_currentStatementSelectedSuggestedAmountEvents_previousStatementSelectedSuggestedAmountEvents_currentStatementPaymentsSum_previousStatementPaymentsSum_currentStatementPurchasesSum_previousStatementPurchasesSum_currentStatementMerchantCategoryTransactionSums_previousStatementMerchantCategoryTransactionSums_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 items];
  id v6 = [v5 allObjects];
  id v7 = [v6 firstObject];

  id v8 = [v4 items];

  v9 = [v8 allObjects];
  id v10 = [v9 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v11 = v10;
    uint64_t v12 = [v7 transactionDate];
    id v13 = [v11 transactionDate];

    uint64_t v14 = [v12 compare:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_createDefaultAmountSuggestionListFromAccount
{
  uint64_t v3 = [(PKAccount *)self->_account creditDetails];
  id v4 = [(PKAccount *)self->_account creditDetails];
  id v5 = [v4 accountSummary];

  id v6 = [v5 adjustedBalance];
  id v7 = [v5 currentBalance];
  id v30 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];
  uint64_t v27 = v7;
  if (v30)
  {
    uint64_t v8 = objc_msgSend(v7, "compare:", v6, v7);
    BOOL v29 = v8 == 1;
    if (v8 == 1) {
      v9 = v7;
    }
    else {
      v9 = v6;
    }
  }
  else
  {
    BOOL v29 = 0;
    v9 = v6;
  }
  id v10 = v9;
  id v11 = [PKBillPaymentSuggestedAmountList alloc];
  v31 = v3;
  uint64_t v12 = [v3 currencyCode];
  id v13 = [v5 remainingMinimumPayment];
  uint64_t v14 = [v5 remainingStatementBalance];
  if (v10)
  {
    id v15 = [(PKBillPaymentSuggestedAmountList *)v11 initWithCurrencyCode:v12 remainingMinimumPayment:v13 remainingStatementBalance:v14 currentBalance:v10];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C28] zero];
    id v15 = [(PKBillPaymentSuggestedAmountList *)v11 initWithCurrencyCode:v12 remainingMinimumPayment:v13 remainingStatementBalance:v14 currentBalance:v16];
  }
  v17 = [(PKBillPaymentSuggestedAmountList *)v15 minimumAmount];
  if (!v17
    || ([(PKBillPaymentSuggestedAmountList *)v15 maximumAmount],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v17 isEqual:v18],
        v18,
        v19))
  {
    id v20 = [(PKBillPaymentSuggestedAmountList *)v15 remainingStatementAmount];

    if (v20) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 18;
    }
    v22 = [PKBillPaymentSuggestedAmount alloc];
    v23 = [MEMORY[0x1E4F28C28] zero];
    v24 = [(PKBillPaymentSuggestedAmount *)v22 initWithAmount:v23 category:v21];

    [(PKBillPaymentSuggestedAmountList *)v15 setInitialSuggestedAmount:v24];
  }
  if (v29)
  {
    uint64_t v25 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v6 category:30];
    [(PKBillPaymentSuggestedAmountList *)v15 addSuggestedAmount:v25];
  }
  -[PKBillPaymentSuggestedAmountController _populateStringValuesForList:](self, "_populateStringValuesForList:", v15, v27);

  return v15;
}

- (id)generateAmountSuggestionListWithFinHealth:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKBillPaymentSuggestedAmountController *)self _createDefaultAmountSuggestionListFromAccount];
  if (v3)
  {
    v48 = [(PKAccount *)self->_account creditDetails];
    v45 = [v48 accountSummary];
    id v6 = [v45 remainingStatementBalance];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C28] zero];
    }
    v47 = v8;

    uint64_t v49 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v10 = self->_previousStatementSelectedSuggestedAmountEvents;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v54 + 1) + 8 * i) items];
          id v16 = [v15 allObjects];
          v17 = [v16 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v49 addObject:v17];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v12);
    }

    fhController = self->_fhController;
    account = self->_account;
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    currentStatementPaymentsSum = self->_currentStatementPaymentsSum;
    statementPurchasesSum = self->_statementPurchasesSum;
    merchantCategoryTransactionSums = self->_merchantCategoryTransactionSums;
    v24 = (void *)[v49 copy];
    LOWORD(v44) = *(_WORD *)&self->_isMonthZero;
    uint64_t v25 = -[FHPaymentRingSuggestionController generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymentsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSuggestedAmountData:isMonthZero:isMonthOne:](fhController, "generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymentsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSuggestedAmountData:isMonthZero:isMonthOne:", account, previousStatementPaymentsSum, currentStatementPaymentsSum, statementPurchasesSum, merchantCategoryTransactionSums, v24, v44);

    id v26 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v25 description];
      *(_DWORD *)buf = 138412290;
      v60 = v27;
      _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Suggestions calculated from FinHealth %@", buf, 0xCu);
    }
    v46 = v26;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v28 = v25;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          if (!self->_isMonthZero && !self->_isMonthOne && ([v48 isInMonthOfMerge] & 1) == 0)
          {
            id v34 = [v33 amount];
            uint64_t v35 = [v34 compare:v47];

            if (v35 != -1) {
              continue;
            }
          }
          [v5 addSuggestedAmount:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v30);
    }

    if (v49 && [v49 count])
    {
      id v36 = [v49 lastObject];
      unint64_t v37 = [v36 suggestedAmountCategory];

      uint64_t v38 = PKBillPaymentSuggestedAmountCategoryToPaymentRingInstrumentation(v37);
      paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
      v40 = [NSNumber numberWithUnsignedInteger:v38];
      v41 = _MergedGlobals_182();
      [(NSMutableDictionary *)paymentRingInstrumentationRecord setObject:v40 forKey:v41];
    }
    v9 = v46;
  }
  else
  {
    [(PKBillPaymentSuggestedAmountController *)self _generateAmountSuggestionListUsingTransactionHistoryForList:v5];
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v5;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List from transaction history API: %@", buf, 0xCu);
  }

  [(PKBillPaymentSuggestedAmountController *)self _populatePriorityValuesForList:v5];
  if ([(PKBillPaymentSuggestedAmountController *)self _suggestedAmountListIsValidAfterPurgeIfNecessary:v5])
  {
    v42 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List Error for transaction history API. Using fallback suggestions.", buf, 2u);
    }

    v42 = [(PKBillPaymentSuggestedAmountController *)self _createDefaultAmountSuggestionListFromAccount];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v42;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount fallback list: %@", buf, 0xCu);
    }

    if (![(PKBillPaymentSuggestedAmountController *)self _suggestedAmountListIsValidAfterPurgeIfNecessary:v42])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List Error. Default suggestions are not valid! Please file a radar.", buf, 2u);
      }
    }
  }
  [(PKBillPaymentSuggestedAmountController *)self _populateStringValuesForList:v42];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v42;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Final Bill Payment Suggested Amount List with titles and descriptions %@", buf, 0xCu);
  }

  return v42;
}

- (void)_generateAmountSuggestionListUsingTransactionHistoryForList:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v84 = [(PKAccount *)self->_account creditDetails];
  id v85 = [v84 accountSummary];
  id v81 = [v85 currentStatement];
  id v6 = [v85 remainingStatementBalance];
  id v7 = [v85 remainingMinimumPayment];
  id v8 = v7;
  if (v7)
  {
    id v78 = v7;
  }
  else
  {
    id v78 = [MEMORY[0x1E4F28C28] zero];
  }

  id v82 = [v85 creditLimit];
  id v83 = [v81 statementBalance];
  id v80 = [v85 remainingStatementBalanceForInterestCalculation];
  if (v6)
  {
    v9 = [MEMORY[0x1E4F28C28] zero];
    BOOL v10 = [v6 compare:v9] == 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  id v79 = [MEMORY[0x1E4F28C28] zero];
  if (v83)
  {
    if (v82)
    {
      uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
      char v12 = [v82 isEqualToNumber:v11];

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = [v83 decimalNumberByDividingBy:v82];

        id v79 = (void *)v13;
      }
    }
  }
  if ([v84 isInMonthOfMerge] && objc_msgSend(v80, "pk_isPositiveNumber"))
  {
    uint64_t v14 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v80 category:31];
    [v5 safelyAddObject:v14];
    [v4 addSuggestedAmount:v14];

    goto LABEL_17;
  }
  if (self->_isMonthZero
    || self->_isMonthOne
    || (previousStatementPaymentsSum = self->_previousStatementPaymentsSum) == 0
    || ([MEMORY[0x1E4F28C28] zero], (id v16 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v17 = [(NSDecimalNumber *)previousStatementPaymentsSum isEqual:v16],
        v16,
        (v17 & 1) != 0))
  {
    [(PKBillPaymentSuggestedAmountController *)self _zerothOrFirstMonthBillPaymentSuggestionsForList:v4];
    goto LABEL_17;
  }
  if ([(PKBillPaymentSuggestedAmountController *)self _allMandatoryValuesAreSameAmount])
  {
    goto LABEL_17;
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__65;
  v106 = __Block_byref_object_dispose__65;
  id v107 = 0;
  if (v10)
  {
    previousStatementSelectedSuggestedAmountEvents = self->_previousStatementSelectedSuggestedAmountEvents;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __102__PKBillPaymentSuggestedAmountController__generateAmountSuggestionListUsingTransactionHistoryForList___block_invoke;
    v98[3] = &unk_1E56F13B0;
    v100 = &v108;
    v98[4] = self;
    id v99 = v6;
    v101 = &v102;
    [(NSArray *)previousStatementSelectedSuggestedAmountEvents enumerateObjectsUsingBlock:v98];

    uint64_t v19 = v109[3];
  }
  else
  {
    uint64_t v19 = 18;
    uint64_t v111 = 18;
  }
  self->_isOnPlanCompletion = v19 == 13;
  if (self->_previousStatementPaymentsSum && !self->_isOnPaymentPlan)
  {
    id v20 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:self->_previousStatementPaymentsSum category:2];
    [v5 safelyAddObject:v20];
  }
  else
  {
    id v20 = 0;
  }
  statementPurchasesSum = self->_statementPurchasesSum;
  if (!statementPurchasesSum
    || ([MEMORY[0x1E4F28C28] zero], (v22 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v23 = [(NSDecimalNumber *)statementPurchasesSum isEqual:v22], v22, (v23 & 1) != 0))
  {
    v24 = v20;
  }
  else
  {
    uint64_t v25 = self->_statementPurchasesSum;
    v24 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v25 category:5];

    [v5 safelyAddObject:v24];
  }
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  id v26 = [v4 minimumSuggestedAmount];
  id v77 = [v26 amount];

  id v94 = 0;
  id v95 = 0;
  [(PKBillPaymentSuggestedAmountController *)self _minimumMerchcantCategoriesAboveMinimumAmount:v77 minMerchantCategory1:&v97 minMerchantCategory2:&v96 minMerchantCategorySum1:&v95 minMerchantCategorySum2:&v94];
  id v27 = v95;
  id v74 = v94;
  v69 = v27;
  if (self->_previousStatementPaymentsSum)
  {
    if (v27)
    {
      id v28 = objc_msgSend(v27, "decimalNumberByAdding:");
      if ([v28 compare:self->_statementPurchasesSum] == -1)
      {
        uint64_t v29 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v28 category:3];

        [(PKBillPaymentSuggestedAmount *)v29 setMerchantCategory:v97];
        [v5 safelyAddObject:v29];
      }
      else
      {
        uint64_t v29 = v24;
      }
    }
    else
    {
      uint64_t v29 = v24;
    }
    if (v74)
    {
      uint64_t v30 = [v74 decimalNumberByAdding:self->_previousStatementPaymentsSum];
      if ([v30 compare:self->_statementPurchasesSum] == -1)
      {
        v24 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v30 category:4];

        [(PKBillPaymentSuggestedAmount *)v24 setMerchantCategory:v96];
        [v5 safelyAddObject:v24];
      }
      else
      {
        v24 = v29;
      }
    }
    else
    {
      v24 = v29;
    }
  }
  if (v83 && self->_statementPurchasesSum && v79)
  {
    uint64_t v31 = [(PKBillPaymentSuggestedAmountController *)self _suggestedAmountsForPayOffDateForStatementBalance:v83 creditUtilization:v79 lastPaymentCategory:v109[3]];

    [v5 safelyAddObject:v31];
    v24 = (PKBillPaymentSuggestedAmount *)v31;
  }
  if (self->_isOnPaymentPlan)
  {
    uint64_t v32 = [(id)v103[5] suggestedAmountCategory];
    uint64_t v33 = v109[3];
  }
  else
  {
    uint64_t v33 = v109[3];
    uint64_t v32 = v33;
  }
  uint64_t v68 = [v4 suggestedAmountWithCategory:v33];
  id v76 = [(PKBillPaymentSuggestedAmountController *)self _calculateThresholdForLastPaymentCategory:v32 statementBalance:v83 suggestedAmountWithSameCategory:v68];
  id v75 = [(PKBillPaymentSuggestedAmountController *)self _filterSuggestions:v5 belowThreshold:v76];

  if (!v83) {
    goto LABEL_64;
  }
  if (self->_statementPurchasesSum
    && (!objc_msgSend(v83, "compare:") || objc_msgSend(v83, "compare:", self->_statementPurchasesSum) == -1)
    && [v82 compare:v83] == 1)
  {
    id v34 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
    v70 = [v83 decimalNumberByDividingBy:v34];
    uint64_t v35 = [v83 decimalNumberBySubtracting:v70];
    id v36 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
    unint64_t v37 = [v83 decimalNumberByDividingBy:v36];
    uint64_t v38 = [v82 decimalNumberBySubtracting:v37];
    uint64_t v67 = [v35 decimalNumberByDividingBy:v38];

    v39 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.33"];
    LODWORD(v34) = [v67 compare:v39] == -1;

    if (v34)
    {
      BOOL v73 = [PKBillPaymentSuggestedAmount alloc];
      v42 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
      v43 = [v83 decimalNumberByDividingBy:v42];
      uint64_t v44 = [v83 decimalNumberBySubtracting:v43];
      v45 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"3"];
      uint64_t v66 = [v44 decimalNumberByDividingBy:v45];
      v46 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
      v65 = [v83 decimalNumberByDividingBy:v46];
      v47 = [v66 decimalNumberByAdding:v65];
      v72 = [(PKBillPaymentSuggestedAmount *)v73 initWithAmount:v47 category:23];
    }
    else
    {
      v40 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.67"];
      BOOL v41 = [v67 compare:v40] == -1;

      v71 = [PKBillPaymentSuggestedAmount alloc];
      [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
      if (v41) {
        v42 = {;
      }
        v43 = [v83 decimalNumberByDividingBy:v42];
        uint64_t v44 = [v83 decimalNumberBySubtracting:v43];
        v45 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"6"];
        uint64_t v66 = [v44 decimalNumberByDividingBy:v45];
        v46 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
        v65 = [v83 decimalNumberByDividingBy:v46];
        v47 = [v66 decimalNumberByAdding:v65];
        v72 = [(PKBillPaymentSuggestedAmount *)v71 initWithAmount:v47 category:24];
      }
      else {
        v42 = {;
      }
        v43 = [v83 decimalNumberByDividingBy:v42];
        uint64_t v44 = [v83 decimalNumberBySubtracting:v43];
        v45 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"9"];
        uint64_t v66 = [v44 decimalNumberByDividingBy:v45];
        v46 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
        v65 = [v83 decimalNumberByDividingBy:v46];
        v47 = [v66 decimalNumberByAdding:v65];
        v72 = [(PKBillPaymentSuggestedAmount *)v71 initWithAmount:v47 category:25];
      }
    }

    [v75 safelyAddObject:v72];
    goto LABEL_65;
  }
  if (v78
    && ![(PKBillPaymentSuggestedAmountController *)self _categoryIsPaymentPlan:v109[3]])
  {
    v61 = [PKBillPaymentSuggestedAmount alloc];
    uint64_t v62 = [v83 decimalNumberByAdding:v78];
    v63 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
    char v64 = [v62 decimalNumberByDividingBy:v63];
    v72 = [(PKBillPaymentSuggestedAmount *)v61 initWithAmount:v64 category:29];

    [v75 safelyAddObject:v72];
  }
  else
  {
LABEL_64:
    v72 = v24;
  }
LABEL_65:
  if (self->_currentStatementPaymentsSum)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v48 = v75;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v90 objects:v113 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v91 != v50) {
            objc_enumerationMutation(v48);
          }
          long long v52 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          long long v53 = [v52 amount];
          long long v54 = [v53 decimalNumberBySubtracting:self->_currentStatementPaymentsSum];
          [v52 setAmount:v54];
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v90 objects:v113 count:16];
      }
      while (v49);
    }
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v5 = v75;
  uint64_t v55 = [v5 countByEnumeratingWithState:&v86 objects:v112 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v87 != v56) {
          objc_enumerationMutation(v5);
        }
        v58 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        char v59 = [v58 amount];
        BOOL v60 = [v59 compare:v6] == -1;

        if (v60) {
          [v4 addSuggestedAmount:v58];
        }
      }
      uint64_t v55 = [v5 countByEnumeratingWithState:&v86 objects:v112 count:16];
    }
    while (v55);
  }

  [(PKBillPaymentSuggestedAmountController *)self _setDifferentialPrivacyFeature:PKBillPaymentCategoryToDifferentialFeature(v109[3]) atIndex:2];
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
LABEL_17:
}

void __102__PKBillPaymentSuggestedAmountController__generateAmountSuggestionListUsingTransactionHistoryForList___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 items];
  id v7 = [v6 allObjects];
  obuint64_t j = [v7 lastObject];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = obj;
  if (isKindOfClass)
  {
    id v10 = obj;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 suggestedAmountCategory];
    if (objc_msgSend(*(id *)(a1 + 32), "_categoryIsPaymentPlan:", objc_msgSend(v10, "suggestedAmountCategory")))
    {
      uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 168);
      if (v11)
      {
        if ([v11 compare:*(void *)(a1 + 40)] == -1)
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
          *a4 = 1;
        }
      }
    }

    v9 = obj;
  }
}

- (void)_zerothOrFirstMonthBillPaymentSuggestionsForList:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 accountSummary];
  id v7 = [v6 currentStatement];
  id v8 = [v6 creditLimit];
  v9 = [v6 adjustedBalance];
  id v10 = [v6 remainingMinimumPayment];
  uint64_t v11 = v10;
  unint64_t v12 = 0x1E4F28000uLL;
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C28] zero];
  }
  id v84 = v13;

  uint64_t v14 = [v6 remainingStatementBalance];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C28] zero];
  }
  id v83 = v16;

  char v17 = [v7 minimumDue];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28C28] zero];
  }
  long long v86 = v19;

  id v20 = [v7 statementBalance];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28C28] zero];
  }
  long long v90 = v22;

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [MEMORY[0x1E4F28C28] zero];
  v89 = long long v88 = v23;
  if (v9 && v8)
  {
    v24 = [MEMORY[0x1E4F28C28] zero];
    char v25 = [v8 isEqualToNumber:v24];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = [v9 decimalNumberByDividingBy:v8];

      long long v89 = (void *)v26;
    }
    id v23 = v88;
  }
  long long v87 = [MEMORY[0x1E4F28C28] zero];
  if (v90 && v8)
  {
    id v27 = [MEMORY[0x1E4F28C28] zero];
    char v28 = [v8 isEqualToNumber:v27];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = [v90 decimalNumberByDividingBy:v8];

      long long v87 = (void *)v29;
    }
    id v23 = v88;
  }
  if (![(PKBillPaymentSuggestedAmountController *)self _allMandatoryValuesAreSameAmount])
  {
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    id v95 = 0;
    id v96 = 0;
    [(PKBillPaymentSuggestedAmountController *)self _minimumMerchcantCategoriesAboveMinimumAmount:v84 minMerchantCategory1:&v98 minMerchantCategory2:&v97 minMerchantCategorySum1:&v96 minMerchantCategorySum2:&v95];
    id v30 = v96;
    id v82 = v95;
    id v76 = v30;
    if (v30)
    {
      uint64_t v31 = [v30 decimalNumberByAdding:v86];
      uint64_t v32 = v31;
      if (self->_isMonthZero
        || (self->_isMonthOne || !self->_previousStatementPaymentsSum) && [v31 compare:v83] == -1)
      {
        uint64_t v33 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v32 category:3];
        [(PKBillPaymentSuggestedAmount *)v33 setMerchantCategory:v98];
        id v34 = v33;
        unint64_t v12 = 0x1E4F28000;
      }
      else
      {
        id v34 = 0;
      }
      id v85 = v34;
      objc_msgSend(v23, "safelyAddObject:");
    }
    else
    {
      id v85 = 0;
    }
    if (v82)
    {
      uint64_t v35 = [v82 decimalNumberByAdding:v86];
      id v36 = v35;
      if (self->_isMonthZero
        || (self->_isMonthOne || !self->_previousStatementPaymentsSum) && [v35 compare:v83] == -1)
      {
        unint64_t v37 = v9;
        uint64_t v38 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v36 category:4];

        [(PKBillPaymentSuggestedAmount *)v38 setMerchantCategory:v97];
        v39 = v38;
        v9 = v37;
      }
      else
      {
        v39 = v85;
      }
      id v23 = v88;
      id v85 = v39;
      objc_msgSend(v88, "safelyAddObject:");
    }
    id v79 = v6;
    id v80 = v5;
    id v77 = v8;
    id v78 = v7;
    id v81 = v9;
    if (v9 && self->_isMonthZero && v89)
    {
      v40 = [*(id *)(v12 + 3112) decimalNumberWithString:@"0.33"];
      uint64_t v41 = [v89 compare:v40];

      if (v41 == -1)
      {
        uint64_t v62 = [PKBillPaymentSuggestedAmount alloc];
        v46 = [*(id *)(v12 + 3112) decimalNumberWithString:@"3"];
        v47 = [v81 decimalNumberByDividingBy:v46];
        id v48 = v62;
        uint64_t v49 = v47;
        uint64_t v50 = 20;
      }
      else
      {
        v42 = [*(id *)(v12 + 3112) decimalNumberWithString:@"0.67"];
        uint64_t v43 = [v89 compare:v42];

        uint64_t v44 = [PKBillPaymentSuggestedAmount alloc];
        v45 = *(void **)(v12 + 3112);
        if (v43 == -1)
        {
          v46 = [v45 decimalNumberWithString:@"6"];
          v47 = [v81 decimalNumberByDividingBy:v46];
          id v48 = v44;
          uint64_t v49 = v47;
          uint64_t v50 = 21;
        }
        else
        {
          v46 = [v45 decimalNumberWithString:@"9"];
          v47 = [v81 decimalNumberByDividingBy:v46];
          id v48 = v44;
          uint64_t v49 = v47;
          uint64_t v50 = 22;
        }
      }
      char v64 = [(PKBillPaymentSuggestedAmount *)v48 initWithAmount:v49 category:v50];
    }
    else
    {
      if ((!v90 || !self->_isMonthOne || !v87) && self->_previousStatementPaymentsSum) {
        goto LABEL_63;
      }
      long long v51 = [*(id *)(v12 + 3112) decimalNumberWithString:@"0.33"];
      uint64_t v52 = [v87 compare:v51];

      if (v52 == -1)
      {
        v63 = [PKBillPaymentSuggestedAmount alloc];
        long long v57 = [*(id *)(v12 + 3112) decimalNumberWithString:@"3"];
        v58 = [v90 decimalNumberByDividingBy:v57];
        char v59 = v63;
        BOOL v60 = v58;
        uint64_t v61 = 26;
      }
      else
      {
        long long v53 = [*(id *)(v12 + 3112) decimalNumberWithString:@"0.67"];
        uint64_t v54 = [v87 compare:v53];

        uint64_t v55 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v56 = *(void **)(v12 + 3112);
        if (v54 == -1)
        {
          long long v57 = [v56 decimalNumberWithString:@"6"];
          v58 = [v90 decimalNumberByDividingBy:v57];
          char v59 = v55;
          BOOL v60 = v58;
          uint64_t v61 = 27;
        }
        else
        {
          long long v57 = [v56 decimalNumberWithString:@"9"];
          v58 = [v90 decimalNumberByDividingBy:v57];
          char v59 = v55;
          BOOL v60 = v58;
          uint64_t v61 = 28;
        }
      }
      char v64 = [(PKBillPaymentSuggestedAmount *)v59 initWithAmount:v60 category:v61];

      v65 = [(PKBillPaymentSuggestedAmount *)v64 amount];
      uint64_t v66 = [v65 compare:v83];

      id v85 = v64;
      id v23 = v88;
      if (v66 != -1) {
        goto LABEL_63;
      }
    }
    [v23 safelyAddObject:v64];
    id v85 = v64;
LABEL_63:
    uint64_t v67 = self->_currentStatementPaymentsSum;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v68 = v23;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v91 objects:v99 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v92 != v71) {
            objc_enumerationMutation(v68);
          }
          BOOL v73 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if (v67)
          {
            id v74 = [*(id *)(*((void *)&v91 + 1) + 8 * i) amount];
            if (!-[PKBillPaymentSuggestedAmountController _categoryIsCurrentBalanceType:](self, "_categoryIsCurrentBalanceType:", [v73 category]))
            {
              id v75 = [v74 decimalNumberBySubtracting:v67];
              [v73 setAmount:v75];
            }
          }
          [v4 addSuggestedAmount:v73];
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v91 objects:v99 count:16];
      }
      while (v70);
    }

    id v6 = v79;
    id v5 = v80;
    id v8 = v77;
    id v7 = v78;
    v9 = v81;
    id v23 = v88;
  }
}

- (void)_populateStringValuesForList:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKAccount *)self->_account feature];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v6 = [v4 sortedSuggestedAmounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v63 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if (self->_isOnPlanCompletion && [*(id *)(*((void *)&v62 + 1) + 8 * i) category] == 18)
        {
          unint64_t v12 = [(PKBillPaymentSuggestedAmountController *)self _planCompletionTitleString];
          [v11 setTitle:v12];

          uint64_t v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_MESSAGE", v5, 0, v13, v14, v15, v16, v17, v62);
        }
        else
        {
          id v19 = [(PKBillPaymentSuggestedAmountController *)self _titleForSuggestion:v11];
          [v11 setTitle:v19];

          uint64_t v18 = [(PKBillPaymentSuggestedAmountController *)self _messageForSuggestion:v11];
        }
        id v20 = (void *)v18;
        [v11 setMessage:v18];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v8);
  }

  uint64_t v21 = [v4 suggestedAmountWithCategory:1];
  uint64_t v22 = [v4 initialSuggestedAmount];
  id v23 = (void *)v22;
  if (v21)
  {
    v24 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    id v30 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_GAP_TITLE", v5, 0, v25, v26, v27, v28, v29, v62);
    [(PKBillPaymentSuggestedAmountMessage *)v24 setTitle:v30];

    id v36 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_GAP_MESSAGE", v5, 0, v31, v32, v33, v34, v35, v62);
    [(PKBillPaymentSuggestedAmountMessage *)v24 setMessage:v36];

    [v4 addSuggestedAmountGapMessage:v24 forStartSuggestedAmount:v21];
  }
  else
  {
    if (!v22) {
      goto LABEL_20;
    }
    unint64_t v37 = [v4 remainingStatementAmount];

    if (v37)
    {
      uint64_t v43 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NO_REMAINING_MINIMUM_GAP_TITLE", v5, 0, v38, v39, v40, v41, v42, v62);
      [v23 setTitle:v43];

      PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NO_REMAINING_MINIMUM_GAP_MESSAGE", v5, 0, v44, v45, v46, v47, v48, v62);
    }
    else
    {
      uint64_t v49 = [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceGapTitleText];
      [v23 setTitle:v49];

      [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceGapDescriptionText];
    }
    v24 = (PKBillPaymentSuggestedAmountMessage *)objc_claimAutoreleasedReturnValue();
    [v23 setMessage:v24];
  }

LABEL_20:
  uint64_t v50 = [v4 suggestedAmountWithCategory:18];
  if (v50)
  {
    long long v51 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    uint64_t v52 = [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceGapTitleText];
    [(PKBillPaymentSuggestedAmountMessage *)v51 setTitle:v52];

    long long v53 = [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceGapDescriptionText];
    [(PKBillPaymentSuggestedAmountMessage *)v51 setMessage:v53];

    [v4 addSuggestedAmountGapMessage:v51 forStartSuggestedAmount:v50];
  }
  uint64_t v54 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];
  if (v54)
  {
    uint64_t v55 = [v4 suggestedAmountWithCategory:30];
    if (!v55)
    {
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v56 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    int64_t numberOfActiveInstallments = self->_numberOfActiveInstallments;
    if (numberOfActiveInstallments == 1)
    {
      v58 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_GAP_ONE_INSTALLMENT_TITLE";
    }
    else
    {
      if (numberOfActiveInstallments < 2)
      {
LABEL_30:
        uint64_t v61 = PKLocalizedBeekmanString(&cfstr_AccountService_117.isa, 0);
        [(PKBillPaymentSuggestedAmountMessage *)v56 setMessage:v61];

        [v4 addSuggestedAmountGapMessage:v56 forStartSuggestedAmount:v55];
        goto LABEL_31;
      }
      v58 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_GAP_MULTI_INSTALLMENT_TITLE";
    }
    uint64_t v59 = PKLocalizedBeekmanString(&v58->isa, 0);
    if (v59)
    {
      BOOL v60 = (void *)v59;
      [(PKBillPaymentSuggestedAmountMessage *)v56 setTitle:v59];
    }
    goto LABEL_30;
  }
LABEL_32:
}

- (void)_populatePriorityValuesForList:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(a3, "sortedSuggestedAmounts", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v10 = [v9 category];
        if (v10 <= 0x1E && ((1 << v10) & 0x400C0002) != 0) {
          [v9 setPriority:1000];
        }
        if ([(PKBillPaymentSuggestedAmountController *)self _categoryIsPaymentPlan:v10]) {
          [v9 setPriority:850];
        }
        BOOL v12 = [(PKBillPaymentSuggestedAmountController *)self _categoryIsCurrentBalanceType:v10];
        if (v10 - 27 < 2
          || v12
          || ((uint64_t v13 = [v9 category], v10 != 3) ? (v14 = v13 == 26) : (v14 = 1),
              v14 || [v9 category] == 4))
        {
          [v9 setPriority:700];
        }
        switch(v10)
        {
          case 2uLL:
            uint64_t v15 = 550;
            break;
          case 0x1DuLL:
            uint64_t v15 = 250;
            break;
          case 5uLL:
            uint64_t v15 = 400;
            break;
          default:
            continue;
        }
        [v9 setPriority:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (BOOL)_allMandatoryValuesAreSameAmount
{
  v2 = [(PKAccount *)self->_account creditDetails];
  BOOL v3 = [v2 accountSummary];

  id v4 = [v3 adjustedBalance];
  uint64_t v5 = [v3 remainingStatementBalance];
  uint64_t v6 = [v3 remainingMinimumPayment];
  uint64_t v7 = [MEMORY[0x1E4F28C28] zero];
  if (v4 && [v4 compare:v7] == -1)
  {
    id v8 = v7;

    id v4 = v8;
  }
  if (v5 && [v5 compare:v7] == -1)
  {
    id v11 = v7;

    uint64_t v5 = v11;
    if (!v6) {
      goto LABEL_15;
    }
  }
  else if (!v6)
  {
    goto LABEL_15;
  }
  if ([v6 compare:v7] == -1)
  {
    id v9 = v7;

    uint64_t v6 = v9;
  }
  char v10 = 0;
  if (v4 && v5 && v6)
  {
    if ([v4 isEqual:v5])
    {
      char v10 = [v5 isEqual:v6];
      goto LABEL_16;
    }
LABEL_15:
    char v10 = 0;
  }
LABEL_16:

  return v10;
}

- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = v12;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__65;
  uint64_t v31 = __Block_byref_object_dispose__65;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__65;
  uint64_t v25 = __Block_byref_object_dispose__65;
  id v26 = 0;
  if (v12)
  {
    merchantCategoryTransactionSums = self->_merchantCategoryTransactionSums;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __178__PKBillPaymentSuggestedAmountController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2___block_invoke;
    v15[3] = &unk_1E56F13D8;
    id v16 = v12;
    long long v17 = &v27;
    long long v18 = &v37;
    long long v19 = &v21;
    id v20 = &v33;
    [(NSDictionary *)merchantCategoryTransactionSums enumerateKeysAndObjectsUsingBlock:v15];
  }
  if (a4) {
    *a4 = v38[3];
  }
  if (a5) {
    *a5 = v34[3];
  }
  if (a6) {
    *a6 = (id) v28[5];
  }
  if (a7) {
    *a7 = (id) v22[5];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __178__PKBillPaymentSuggestedAmountController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2___block_invoke(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 compare:a1[4]] == 1)
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    if (!v8)
    {
LABEL_8:
      objc_storeStrong(v7, a3);
      uint64_t v12 = [v14 integerValue];
      uint64_t v13 = a1[6];
LABEL_11:
      *(void *)(*(void *)(v13 + 8) + 24) = v12;
      goto LABEL_12;
    }
    uint64_t v9 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    char v10 = (id *)(v9 + 40);
    if (!v11)
    {
LABEL_10:
      objc_storeStrong(v10, a3);
      uint64_t v12 = [v14 integerValue];
      uint64_t v13 = a1[8];
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "compare:") == -1
      || [v5 compare:*(void *)(*(void *)(a1[7] + 8) + 40)] == -1)
    {
      if ([*(id *)(*(void *)(a1[5] + 8) + 40) compare:*(void *)(*(void *)(a1[7] + 8) + 40)] != -1)
      {
        uint64_t v7 = (id *)(*(void *)(a1[5] + 8) + 40);
        goto LABEL_8;
      }
      char v10 = (id *)(*(void *)(a1[7] + 8) + 40);
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 creditUtilization:(id)a4 lastPaymentCategory:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  uint64_t v11 = 0;
  if (v8 && v9 && self->_statementPurchasesSum)
  {
    switch(a5)
    {
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        uint64_t v12 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"8"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v12;
        long long v18 = v16;
        uint64_t v19 = 7;
        goto LABEL_18;
      case 7uLL:
        uint64_t v22 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"7"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v22;
        long long v18 = v16;
        uint64_t v19 = 8;
        goto LABEL_18;
      case 8uLL:
        uint64_t v23 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"6"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v23;
        long long v18 = v16;
        uint64_t v19 = 9;
        goto LABEL_18;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        id v20 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"5"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v20;
        long long v18 = v16;
        uint64_t v19 = 10;
        goto LABEL_18;
      case 0xAuLL:
        v24 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"4"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v24;
        long long v18 = v16;
        uint64_t v19 = 11;
        goto LABEL_18;
      case 0xBuLL:
        uint64_t v25 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"3"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v25;
        long long v18 = v16;
        uint64_t v19 = 12;
        goto LABEL_18;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        uint64_t v21 = [PKBillPaymentSuggestedAmount alloc];
        uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"2"];
        uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
        id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
        long long v17 = v21;
        long long v18 = v16;
        uint64_t v19 = 13;
        goto LABEL_18;
      case 0xDuLL:
        uint64_t v11 = [[PKBillPaymentSuggestedAmount alloc] initWithAmount:v8 category:17];
        break;
      default:
        id v26 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.33"];
        uint64_t v27 = [v10 compare:v26];

        if (v27 == -1)
        {
          uint64_t v31 = [PKBillPaymentSuggestedAmount alloc];
          uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
          id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"3"];
          uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
          id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
          long long v17 = v31;
          long long v18 = v16;
          uint64_t v19 = 16;
        }
        else
        {
          uint64_t v28 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.67"];
          uint64_t v29 = [v10 compare:v28];

          id v30 = [PKBillPaymentSuggestedAmount alloc];
          uint64_t v13 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
          if (v29 == -1)
          {
            id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"6"];
            uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
            id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
            long long v17 = v30;
            long long v18 = v16;
            uint64_t v19 = 15;
          }
          else
          {
            id v14 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"9"];
            uint64_t v15 = [v13 decimalNumberByDividingBy:v14];
            id v16 = [v15 decimalNumberByAdding:self->_statementPurchasesSum];
            long long v17 = v30;
            long long v18 = v16;
            uint64_t v19 = 14;
          }
        }
LABEL_18:
        uint64_t v11 = [(PKBillPaymentSuggestedAmount *)v17 initWithAmount:v18 category:v19];

        break;
    }
  }

  return v11;
}

- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 suggestedAmountWithSameCategory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
  if (previousStatementPaymentsSum)
  {
    uint64_t v11 = previousStatementPaymentsSum;
    switch(a3)
    {
      case 0uLL:
        uint64_t v15 = self->_previousStatementPaymentsSum;
        goto LABEL_20;
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"8";
        goto LABEL_14;
      case 7uLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"7";
        goto LABEL_14;
      case 8uLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"6";
        goto LABEL_14;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"5";
        goto LABEL_14;
      case 0xAuLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"4";
        goto LABEL_14;
      case 0xBuLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"3";
        goto LABEL_14;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        uint64_t v12 = [v8 decimalNumberBySubtracting:self->_statementPurchasesSum];
        uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
        id v14 = @"2";
LABEL_14:
        long long v18 = [v13 decimalNumberWithString:v14];
        uint64_t v19 = [(NSDecimalNumber *)v12 decimalNumberByDividingBy:v18];
        uint64_t v20 = [v19 decimalNumberByAdding:self->_statementPurchasesSum];

        uint64_t v11 = v12;
        goto LABEL_15;
      case 0xDuLL:
        uint64_t v15 = (NSDecimalNumber *)v8;
        goto LABEL_20;
      default:
        id v16 = [v9 amount];
        uint64_t v17 = [v16 compare:self->_previousStatementPaymentsSum];

        if (v17 != 1) {
          break;
        }
        uint64_t v15 = [v9 amount];
LABEL_20:
        uint64_t v20 = (uint64_t)v15;
LABEL_15:

        uint64_t v11 = (NSDecimalNumber *)v20;
        break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_suggestedAmountListIsValidAfterPurgeIfNecessary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (__CFString *)a3;
  unint64_t v12 = 0;
  int v4 = [(__CFString *)v3 isValidWithUnableReason:&v12];
  id v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    uint64_t v7 = PKBillPaymentSuggestedAmountListUnableReasonToString(v12);
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list is valid %@ with unable reason: \"%@\"", buf, 0x16u);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list: %@", buf, 0xCu);
  }

  if (v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Trying to purge any invalid suggestion amounts from list...", buf, 2u);
    }

    [(__CFString *)v3 attemptToPurgeInvalidSuggestedAmounts];
    int v8 = [(__CFString *)v3 isValidWithUnableReason:&v12];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      char v10 = PKBillPaymentSuggestedAmountListUnableReasonToString(v12);
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list is valid %@ with unable reason: \"%@\"", buf, 0x16u);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "New generated bill payment suggested amount list: %@", buf, 0xCu);
    }
  }
  return v8;
}

- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3
{
  return (a3 < 0x1A) & (0x383FFC0u >> a3);
}

- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3
{
  return a3 - 20 < 3;
}

- (id)_titleForSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 category];
  uint64_t v6 = [(PKAccount *)self->_account feature];
  uint64_t v7 = [(PKAccount *)self->_account creditDetails];
  int v8 = [v7 accountSummary];
  id v9 = [v8 currentStatement];
  __int16 v15 = [v8 balanceSummary];
  if (self->_currentStatementIsLastMonthsStatement)
  {
    id v16 = [v9 closingDate];
  }
  else
  {
    id v16 = 0;
  }
  switch(v5)
  {
    case 1:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_TITLE";
      goto LABEL_54;
    case 2:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_TITLE";
      goto LABEL_54;
    case 3:
      uint64_t v19 = [v4 merchantCategory];
      id v32 = PKLocalizedBillPaymentStringFromMerchantCategory(v19, v20, v21, v22, v23, v24, v25, v26);
      if (self->_isMonthZero)
      {
        uint64_t v33 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ZERO_TITLE";
        goto LABEL_74;
      }
      BOOL isMonthOne = self->_isMonthOne;
      BOOL v73 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ONE_TITLE";
      id v74 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_TITLE";
      goto LABEL_71;
    case 4:
      uint64_t v34 = [v4 merchantCategory];
      id v32 = PKLocalizedBillPaymentStringFromMerchantCategory(v34, v35, v36, v37, v38, v39, v40, v41);
      if (self->_isMonthZero)
      {
        uint64_t v33 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ZERO_TITLE";
      }
      else
      {
        BOOL isMonthOne = self->_isMonthOne;
        BOOL v73 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ONE_TITLE";
        id v74 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_TITLE";
LABEL_71:
        if (isMonthOne) {
          uint64_t v33 = v73;
        }
        else {
          uint64_t v33 = v74;
        }
      }
LABEL_74:
      long long v18 = PKLocalizedFeatureString(v33, v6, @"%@", v27, v28, v29, v30, v31, (uint64_t)v32);
      goto LABEL_129;
    case 5:
      if (v16)
      {
        uint64_t v42 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v16];
        if (v42)
        {
          uint64_t v43 = (void *)v42;
          long long v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_TITLE", v6, @"%@", v10, v11, v12, v13, v14, v42);
          goto LABEL_124;
        }
      }
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_NO_DATE_TITLE";
LABEL_54:
      uint64_t v44 = PKLocalizedFeatureString(v17, v6, 0, v10, v11, v12, v13, v14, v105);
LABEL_55:
      long long v18 = (void *)v44;
      goto LABEL_56;
    case 6:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_TITLE";
      goto LABEL_54;
    case 7:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_EIGHT_MONTHS_TITLE";
      goto LABEL_54;
    case 8:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SEVEN_MONTHS_TITLE";
      goto LABEL_54;
    case 9:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_TITLE";
      goto LABEL_54;
    case 10:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FIVE_MONTHS_TITLE";
      goto LABEL_54;
    case 11:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FOUR_MONTHS_TITLE";
      goto LABEL_54;
    case 12:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_TITLE";
      goto LABEL_54;
    case 13:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_TWO_MONTHS_TITLE";
      goto LABEL_54;
    case 14:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FROM_UTILIZATION_TITLE";
      goto LABEL_54;
    case 15:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FROM_UTILIZATION_TITLE";
      goto LABEL_54;
    case 16:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FROM_UTILIZATION_TITLE";
      goto LABEL_54;
    case 17:
      uint64_t v44 = [(PKBillPaymentSuggestedAmountController *)self _planCompletionTitleString];
      goto LABEL_55;
    case 18:
      uint64_t v44 = [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceTitleString];
      goto LABEL_55;
    case 19:
      int v45 = [v8 inGrace];
      uint64_t v46 = [v15 pendingPurchases];
      id v107 = (void *)v46;
      int v112 = v45;
      if (v46)
      {
        uint64_t v47 = (void *)v46;
        uint64_t v48 = [MEMORY[0x1E4F28C28] zero];
        BOOL v109 = [v47 compare:v48] == 1;
      }
      else
      {
        BOOL v109 = 0;
      }
      int64_t numberOfActiveInstallments = self->_numberOfActiveInstallments;
      id v76 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];

      if (v112)
      {
        BOOL v83 = numberOfActiveInstallments < 1 || v76 == 0;
        if (v109)
        {
          if (v83)
          {
            id v84 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING";
LABEL_106:
            uint64_t v98 = PKLocalizedFeatureString(v84, v6, 0, v77, v78, v79, v80, v81, v105);
LABEL_113:
            long long v18 = (void *)v98;
            id v32 = v107;
            goto LABEL_129;
          }
          uint64_t v97 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_TITLE_PENDING_INSTALLMENT";
LABEL_112:
          uint64_t v98 = PKLocalizedBeekmanString(&v97->isa, 0);
          goto LABEL_113;
        }
        if (v83)
        {
LABEL_105:
          id v84 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE";
          goto LABEL_106;
        }
LABEL_104:
        uint64_t v97 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_TITLE_INSTALLMENT";
        goto LABEL_112;
      }
      uint64_t v115 = numberOfActiveInstallments;
      if (!v109)
      {
        if (numberOfActiveInstallments < 1 || !v76) {
          goto LABEL_105;
        }
        goto LABEL_104;
      }
      id v85 = [v8 remainingStatementBalance];
      uint64_t v86 = [v8 adjustedBalance];
      uint64_t v111 = v85;
      v106 = (void *)v86;
      if (!v85 || !v86)
      {
        id v32 = v107;
        if (v115 < 1 || !v76) {
          goto LABEL_120;
        }
        goto LABEL_116;
      }
      int v92 = [v85 isEqual:v86];
      BOOL v94 = v115 < 1 || v76 == 0;
      if (!v92 || !v94)
      {
        id v32 = v107;
        if (v94)
        {
LABEL_120:
          uint64_t v104 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING_REVOLVER";
          goto LABEL_126;
        }
LABEL_116:
        uint64_t v101 = PKLocalizedBeekmanString(&cfstr_AccountService_119.isa, 0);
        goto LABEL_127;
      }
      id v32 = v107;
      if (v16)
      {
        uint64_t v95 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v16];
        if (v95)
        {
          id v96 = (void *)v95;
          long long v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE", v6, @"%@", v87, v88, v89, v90, v91, v95);

          goto LABEL_128;
        }
      }
      uint64_t v104 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE";
LABEL_126:
      uint64_t v101 = PKLocalizedFeatureString(v104, v6, 0, v87, v88, v89, v90, v91, v105);
LABEL_127:
      long long v18 = (void *)v101;
LABEL_128:

LABEL_129:
LABEL_56:

      return v18;
    case 20:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_TITLE";
      goto LABEL_54;
    case 21:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_TITLE";
      goto LABEL_54;
    case 22:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_TITLE";
      goto LABEL_54;
    case 23:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_TITLE";
      goto LABEL_54;
    case 24:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_TITLE";
      goto LABEL_54;
    case 25:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_TITLE";
      goto LABEL_54;
    case 26:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_STATEMENT_BALANCE_TITLE";
      goto LABEL_54;
    case 27:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_STATEMENT_BALANCE_TITLE";
      goto LABEL_54;
    case 28:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_STATEMENT_BALANCE_TITLE";
      goto LABEL_54;
    case 29:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_TITLE";
      goto LABEL_54;
    case 30:
      int v49 = [v8 inGrace];
      uint64_t v50 = [v15 pendingPurchases];
      uint64_t v110 = v50;
      int v113 = v49;
      if (v50)
      {
        long long v51 = [MEMORY[0x1E4F28C28] zero];
        LODWORD(v50) = [v50 compare:v51] == 1;
      }
      int64_t v108 = self->_numberOfActiveInstallments;
      uint64_t v52 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];

      if (v113)
      {
        if (v50)
        {
          if (v108 >= 1 && v52)
          {
            uint64_t v58 = PKLocalizedBeekmanString(&cfstr_AccountService_126.isa, 0);
LABEL_68:
            long long v18 = (void *)v58;
            uint64_t v43 = v110;
            goto LABEL_124;
          }
          uint64_t v71 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING";
LABEL_67:
          uint64_t v58 = PKLocalizedFeatureString(v71, v6, 0, v53, v54, v55, v56, v57, v105);
          goto LABEL_68;
        }
      }
      else if (v50)
      {
        BOOL v60 = [v8 remainingStatementBalance];
        uint64_t v61 = [v8 adjustedBalance];
        uint64_t v67 = v61;
        if (v60 && v61 && (v114 = (void *)v61, v68 = [v60 isEqual:v61], uint64_t v67 = (uint64_t)v114, v68))
        {
          if (v16
            && ([(NSDateFormatter *)self->_monthFormatter stringFromDate:v16],
                (uint64_t v69 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v70 = (void *)v69;
            long long v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE", v6, @"%@", v62, v63, v64, v65, v66, v69);
          }
          else
          {
            long long v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE", v6, 0, v62, v63, v64, v65, v66, v105);
          }
          uint64_t v43 = v110;
          v103 = v114;
        }
        else
        {
          if (v108 >= 1 && v52)
          {
            id v99 = (void *)v67;
            uint64_t v100 = PKLocalizedBeekmanString(&cfstr_AccountService_126.isa, 0);
          }
          else
          {
            uint64_t v102 = v6;
            id v99 = (void *)v67;
            uint64_t v100 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING_REVOLVER", v102, 0, v62, v63, v64, v65, v66, v105);
          }
          v103 = v99;
          long long v18 = (void *)v100;
          uint64_t v43 = v110;
        }

LABEL_124:
        goto LABEL_56;
      }
      uint64_t v71 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE";
      goto LABEL_67;
    case 31:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_COMBINED_BALANCE_TITLE";
      goto LABEL_54;
    case 32:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_VERY_EXPENSIVE_PURCHASE_TITLE";
      goto LABEL_54;
    case 33:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECURRING_EXPENSES_TITLE";
      goto LABEL_54;
    case 34:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOP_MERCHANT_TITLE";
      goto LABEL_54;
    case 35:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECENT_TRIP_TITLE";
      goto LABEL_54;
    case 36:
      uint64_t v17 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PEAK_SPEND_DAY_TITLE";
      goto LABEL_54;
    default:
      long long v18 = 0;
      goto LABEL_56;
  }
}

- (id)_messageForSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKAccount *)self->_account feature];
  uint64_t v6 = [v4 category];
  uint64_t v7 = [(PKAccount *)self->_account creditDetails];
  int v8 = [v7 accountSummary];
  id v9 = [v8 balanceSummary];
  uint64_t v10 = [v8 currentStatement];
  id v16 = v10;
  if (self->_currentStatementIsLastMonthsStatement)
  {
    uint64_t v17 = [v10 closingDate];
  }
  else
  {
    uint64_t v17 = 0;
  }
  switch(v6)
  {
    case 0:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NONE_MESSAGE";
      goto LABEL_77;
    case 1:
      uint64_t v19 = [v8 pastDueAmount];
      if ([v8 cyclesPastDue] > 0
        || v19
        && ([MEMORY[0x1E4F28C28] zero],
            id v75 = objc_claimAutoreleasedReturnValue(),
            uint64_t v111 = v19,
            uint64_t v76 = [v19 compare:v75],
            v75,
            BOOL v57 = v76 == 1,
            uint64_t v19 = v111,
            v57))
      {
        if (v17)
        {
          uint64_t v20 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        }
        else
        {
          uint64_t v20 = 0;
        }
        if ([v20 length]) {
          PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_PAST_DUE_MESSAGE", v5, @"%@", v87, v88, v89, v90, v91, (uint64_t)v20);
        }
        else {
        uint64_t v46 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_PAST_DUE_NO_DATE_MESSAGE", v5, 0, v87, v88, v89, v90, v91, v103);
        }
      }
      else
      {
        int64_t numberOfActiveStatementedInstallments = self->_numberOfActiveStatementedInstallments;
        if (numberOfActiveStatementedInstallments == 1)
        {
          uint64_t v78 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_ONE_INSTALLMENT_MESSAGE";
LABEL_131:
          uint64_t v84 = PKLocalizedBeekmanString(&v78->isa, 0);
          goto LABEL_105;
        }
        if (numberOfActiveStatementedInstallments >= 2)
        {
          uint64_t v78 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_MULTI_INSTALLMENT_MESSAGE";
          goto LABEL_131;
        }
        uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_MESSAGE";
LABEL_143:
        uint64_t v83 = v5;
        id v82 = 0;
LABEL_104:
        uint64_t v84 = PKLocalizedFeatureString(v22, v83, v82, v11, v12, v13, v14, v15, v103);
LABEL_105:
        uint64_t v46 = (void *)v84;
      }
LABEL_106:

      goto LABEL_79;
    case 2:
      if (v17)
      {
        uint64_t v21 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v21)
        {
          uint64_t v19 = (void *)v21;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_MESSAGE";
          goto LABEL_103;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_NO_DATE_MESSAGE";
      goto LABEL_77;
    case 3:
      uint64_t v23 = [v4 merchantCategory];
      uint64_t v19 = PKLocalizedBillPaymentStringFromMerchantCategory(v23, v24, v25, v26, v27, v28, v29, v30);
      if (self->_isMonthZero)
      {
        uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ZERO_MESSAGE";
        goto LABEL_103;
      }
      BOOL isMonthOne = self->_isMonthOne;
      uint64_t v80 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ONE_MESSAGE";
      uint64_t v81 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MESSAGE";
      goto LABEL_100;
    case 4:
      uint64_t v31 = [v4 merchantCategory];
      uint64_t v19 = PKLocalizedBillPaymentStringFromMerchantCategory(v31, v32, v33, v34, v35, v36, v37, v38);
      if (self->_isMonthZero)
      {
        uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ZERO_MESSAGE";
      }
      else
      {
        BOOL isMonthOne = self->_isMonthOne;
        uint64_t v80 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ONE_MESSAGE";
        uint64_t v81 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MESSAGE";
LABEL_100:
        if (isMonthOne) {
          uint64_t v22 = v80;
        }
        else {
          uint64_t v22 = v81;
        }
      }
      goto LABEL_103;
    case 5:
      if (v17)
      {
        uint64_t v39 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v39)
        {
          uint64_t v19 = (void *)v39;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_MESSAGE";
          goto LABEL_103;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_MESSAGE_NO_DATE";
      goto LABEL_77;
    case 6:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_MESSAGE";
      goto LABEL_77;
    case 7:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_EIGHT_MONTHS_MESSAGE";
      goto LABEL_77;
    case 8:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SEVEN_MONTHS_MESSAGE";
      goto LABEL_77;
    case 9:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_MESSAGE";
      goto LABEL_77;
    case 10:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FIVE_MONTHS_MESSAGE";
      goto LABEL_77;
    case 11:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FOUR_MONTHS_MESSAGE";
      goto LABEL_77;
    case 12:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_MESSAGE";
      goto LABEL_77;
    case 13:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_TWO_MONTHS_MESSAGE";
      goto LABEL_77;
    case 14:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FROM_UTILIZATION_MESSAGE";
      goto LABEL_77;
    case 15:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FROM_UTILIZATION_MESSAGE";
      goto LABEL_77;
    case 16:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FROM_UTILIZATION_MESSAGE";
      goto LABEL_77;
    case 17:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_MESSAGE";
      goto LABEL_77;
    case 18:
      uint64_t v40 = [(PKBillPaymentSuggestedAmountController *)self _remainingStatementBalanceMessageString];
      goto LABEL_78;
    case 19:
      int v47 = [v8 inGrace];
      uint64_t v48 = [v9 pendingPurchases];
      v106 = v48;
      int v109 = v47;
      if (v48)
      {
        int v49 = [MEMORY[0x1E4F28C28] zero];
        LODWORD(v48) = [v48 compare:v49] == 1;
      }
      int64_t numberOfActiveInstallments = self->_numberOfActiveInstallments;
      long long v51 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];

      if (v109)
      {
        BOOL v57 = numberOfActiveInstallments < 1 || v51 == 0;
        char v58 = v57;
        if (v48)
        {
          if (v58)
          {
            uint64_t v59 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR_PENDING";
LABEL_138:
            uint64_t v101 = PKLocalizedFeatureString(v59, v5, 0, v52, v53, v54, v55, v56, v103);
            goto LABEL_139;
          }
        }
        else if (v58)
        {
          uint64_t v59 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR";
          goto LABEL_138;
        }
LABEL_128:
        uint64_t v101 = PKLocalizedBeekmanString(&cfstr_AccountService_168.isa, 0);
LABEL_139:
        uint64_t v46 = (void *)v101;
        goto LABEL_148;
      }
      if (!v48)
      {
        if (numberOfActiveInstallments < 1 || !v51)
        {
          uint64_t v59 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER";
          goto LABEL_138;
        }
        goto LABEL_128;
      }
      uint64_t v63 = [v8 remainingStatementBalance];
      uint64_t v64 = [v8 adjustedBalance];
      uint64_t v110 = (void *)v63;
      if (!v63 || !v64)
      {
        uint64_t v70 = (void *)v64;
        if (numberOfActiveInstallments < 1 || !v51) {
          goto LABEL_145;
        }
        goto LABEL_136;
      }
      uint64_t v70 = (void *)v64;
      int v71 = [v110 isEqual:v64];
      BOOL v73 = numberOfActiveInstallments < 1 || v51 == 0;
      if (!v71 || !v73)
      {
        if (v73)
        {
LABEL_145:
          id v74 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING";
          goto LABEL_146;
        }
LABEL_136:
        uint64_t v102 = PKLocalizedBeekmanString(&cfstr_AccountService_168.isa, 0);
        goto LABEL_147;
      }
      id v74 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING_STATMENT_BALANCE_SAME";
LABEL_146:
      uint64_t v102 = PKLocalizedFeatureString(v74, v5, 0, v65, v66, v67, v68, v69, v103);
LABEL_147:
      uint64_t v46 = (void *)v102;

LABEL_148:
LABEL_79:

      return v46;
    case 20:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_MESSAGE";
      goto LABEL_77;
    case 21:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_MESSAGE";
      goto LABEL_77;
    case 22:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_MESSAGE";
      goto LABEL_77;
    case 23:
      if (v17)
      {
        uint64_t v60 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v60)
        {
          uint64_t v19 = (void *)v60;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE";
          goto LABEL_103;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_MESSAGE";
      goto LABEL_77;
    case 24:
      if (v17)
      {
        uint64_t v41 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v41)
        {
          uint64_t v19 = (void *)v41;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE";
          goto LABEL_103;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_MESSAGE";
      goto LABEL_77;
    case 25:
      if (v17)
      {
        uint64_t v42 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v42)
        {
          uint64_t v19 = (void *)v42;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE";
          goto LABEL_103;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_MESSAGE";
      goto LABEL_77;
    case 26:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_STATEMENT_BALANCE_MESSAGE";
      goto LABEL_77;
    case 27:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_STATEMENT_BALANCE_MESSAGE";
      goto LABEL_77;
    case 28:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_STATEMENT_BALANCE_MESSAGE";
      goto LABEL_77;
    case 29:
      if (v17)
      {
        uint64_t v61 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v17];
        if (v61)
        {
          uint64_t v19 = (void *)v61;
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_DATE_MESSAGE";
LABEL_103:
          uint64_t v103 = (uint64_t)v19;
          id v82 = @"%@";
          uint64_t v83 = v5;
          goto LABEL_104;
        }
      }
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_MESSAGE";
LABEL_77:
      uint64_t v40 = PKLocalizedFeatureString(v18, v5, 0, v11, v12, v13, v14, v15, v103);
LABEL_78:
      uint64_t v46 = (void *)v40;
      goto LABEL_79;
    case 30:
      int v105 = [v8 inGrace];
      uint64_t v43 = [v9 pendingPurchases];
      int64_t v108 = (void *)v43;
      if (v43)
      {
        uint64_t v44 = (void *)v43;
        int v45 = [MEMORY[0x1E4F28C28] zero];
        BOOL v104 = [v44 compare:v45] == 1;
      }
      else
      {
        BOOL v104 = 0;
      }
      int64_t v85 = self->_numberOfActiveInstallments;
      uint64_t v86 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];

      uint64_t v46 = 0;
      if (v85 < 1)
      {
        uint64_t v19 = v108;
        goto LABEL_106;
      }
      uint64_t v19 = v108;
      if (!v86) {
        goto LABEL_106;
      }
      if (v105)
      {
        if (v104) {
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR_PENDING";
        }
        else {
          uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR";
        }
        goto LABEL_143;
      }
      if (!v104)
      {
        uint64_t v22 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER";
        goto LABEL_143;
      }
      int v92 = [v8 remainingStatementBalance];
      uint64_t v93 = [v8 adjustedBalance];
      id v99 = (void *)v93;
      id v107 = v92;
      if (v92 && v93 && ([v92 isEqual:v93] & 1) != 0) {
        uint64_t v100 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING_STATMENT_BALANCE_SAME";
      }
      else {
        uint64_t v100 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING";
      }
      uint64_t v46 = PKLocalizedFeatureString(v100, v5, 0, v94, v95, v96, v97, v98, v103);

      goto LABEL_106;
    case 31:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_COMBINED_BALANCE_MESSAGE";
      goto LABEL_77;
    case 32:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_VERY_EXPENSIVE_PURCHASE_MESSAGE";
      goto LABEL_77;
    case 33:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECURRING_EXPENSES_MESSAGE";
      goto LABEL_77;
    case 34:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOP_MERCHANT_MESSAGE";
      goto LABEL_77;
    case 35:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECENT_TRIP_MESSAGE";
      goto LABEL_77;
    case 36:
      long long v18 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PEAK_SPEND_DAY_MESSAGE";
      goto LABEL_77;
    default:
      uint64_t v46 = 0;
      goto LABEL_79;
  }
}

- (id)_remainingStatementBalanceTitleString
{
  uint64_t v3 = [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 accountSummary];
  uint64_t v6 = [v5 currentStatement];
  uint64_t v12 = v6;
  if (self->_currentStatementIsLastMonthsStatement)
  {
    uint64_t v13 = [v6 closingDate];
    if (v13)
    {
      uint64_t v14 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v13];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        id v16 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE", v3, @"%@", v7, v8, v9, v10, v11, v14);

        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v16 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE", v3, 0, v7, v8, v9, v10, v11, v18);
LABEL_7:

  return v16;
}

- (id)_remainingStatementBalanceMessageString
{
  uint64_t v3 = [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 accountSummary];
  if ([v5 inGrace]) {
    uint64_t v11 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_MESSAGE_TRANSACTOR";
  }
  else {
    uint64_t v11 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_MESSAGE_REVOLVER";
  }
  uint64_t v12 = PKLocalizedFeatureString(v11, v3, 0, v6, v7, v8, v9, v10, v14);

  return v12;
}

- (id)_remainingStatementBalanceGapTitleText
{
  uint64_t v3 = [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 accountSummary];
  uint64_t v6 = [v5 currentStatement];
  uint64_t v12 = v6;
  if (v6 && ([v6 identifier], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13)) {
    uint64_t v14 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_TITLE";
  }
  else {
    uint64_t v14 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_TITLE_NO_STATEMENT";
  }
  uint64_t v15 = PKLocalizedFeatureString(v14, v3, 0, v7, v8, v9, v10, v11, v17);

  return v15;
}

- (id)_remainingStatementBalanceGapDescriptionText
{
  uint64_t v3 = [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 accountSummary];
  uint64_t v6 = [v5 currentStatement];
  uint64_t v12 = v6;
  if (v6 && ([v6 identifier], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13)) {
    uint64_t v14 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_MESSAGE";
  }
  else {
    uint64_t v14 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_MESSAGE_NO_STATEMENT";
  }
  uint64_t v15 = PKLocalizedFeatureString(v14, v3, 0, v7, v8, v9, v10, v11, v17);

  return v15;
}

- (id)_planCompletionTitleString
{
  uint64_t v3 = [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 accountSummary];
  uint64_t v6 = [v5 currentStatement];
  uint64_t v12 = v6;
  if (self->_currentStatementIsLastMonthsStatement)
  {
    uint64_t v13 = [v6 closingDate];
    if (v13)
    {
      uint64_t v14 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v13];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        id v16 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_DATE_TITLE", v3, @"%@", v7, v8, v9, v10, v11, v14);

        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v16 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_TITLE", v3, 0, v7, v8, v9, v10, v11, v18);
LABEL_7:

  return v16;
}

- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[v5 copy];
  uint64_t v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts Threshold set: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts before threshold: %@", buf, 0xCu);
  }

  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__PKBillPaymentSuggestedAmountController__filterSuggestions_belowThreshold___block_invoke;
    v12[3] = &unk_1E56F1400;
    id v13 = v6;
    uint64_t v9 = objc_msgSend(v5, "pk_objectsPassingTest:", v12);

    uint64_t v7 = (void *)v9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts after threshold: %@", buf, 0xCu);
  }

  uint64_t v10 = (void *)[v7 mutableCopy];
  return v10;
}

BOOL __76__PKBillPaymentSuggestedAmountController__filterSuggestions_belowThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 amount];
  unint64_t v4 = [v3 compare:*(void *)(a1 + 32)];

  return v4 < 2;
}

- (BOOL)_calculateCurrentStatementIsLastMonthsStatement
{
  uint64_t v26 = [(PKAccount *)self->_account creditDetails];
  uint64_t v3 = [v26 accountSummary];
  unint64_t v4 = [v3 balanceSummary];
  uint64_t v25 = v3;
  id v5 = [v3 currentStatement];
  id v6 = [v5 openingDate];
  uint64_t v7 = [v5 closingDate];
  uint64_t v8 = PKDatesMidpoint(v6, v7);

  uint64_t v9 = [v4 openingDate];
  uint64_t v10 = [v4 closingDate];
  uint64_t v11 = PKDatesMidpoint(v9, v10);

  id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v13 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v14 = [(PKAccount *)self->_account creditDetails];
  id v15 = [v14 productTimeZone];
  [v13 setTimeZone:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v16 setMonth:-1];
  uint64_t v17 = [v13 dateByAddingComponents:v16 toDate:v11 options:0];
  uint64_t v18 = [v13 components:12 fromDate:v17];
  uint64_t v19 = (void *)v8;
  uint64_t v20 = [v13 components:12 fromDate:v8];
  uint64_t v21 = [v18 month];
  if (v21 == [v20 month])
  {
    uint64_t v22 = [v18 year];
    BOOL v23 = v22 == [v20 year];
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)_initializeDifferentialPrivacy:(id)a3 accountSummary:(id)a4
{
  id v14 = a4;
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
  self->_differentialPrivacyFeatures = v6;

  uint64_t v8 = 6;
  do
  {
    uint64_t v9 = self->_differentialPrivacyFeatures;
    uint64_t v10 = PKBillPaymentDifferentialPrivacyFeatureToString(0);
    [(NSMutableArray *)v9 addObject:v10];

    --v8;
  }
  while (v8);
  if ([v14 inGrace])
  {
    uint64_t v11 = 1;
  }
  else
  {
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    if (previousStatementPaymentsSum
      && ([(NSDecimalNumber *)previousStatementPaymentsSum pk_isPositiveNumber] & 1) != 0)
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 3;
    }
  }
  [(PKBillPaymentSuggestedAmountController *)self _setDifferentialPrivacyFeature:v11 atIndex:0];
  if (a3) {
    uint64_t v13 = 13;
  }
  else {
    uint64_t v13 = 14;
  }
  [(PKBillPaymentSuggestedAmountController *)self _setDifferentialPrivacyFeature:v13 atIndex:1];
}

- (void)_initializePaymentRingInstrumentationRecord:(id)a3 accountSummary:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(v6);
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  self->_paymentRingInstrumentationRecord = v8;

  uint64_t v10 = self->_paymentRingInstrumentationRecord;
  uint64_t v11 = _MergedGlobals_182();
  [(NSMutableDictionary *)v10 setObject:&unk_1EE22C3B0 forKey:v11];

  id v12 = self->_paymentRingInstrumentationRecord;
  uint64_t v13 = off_1EB4024D8();
  [(NSMutableDictionary *)v12 setObject:&unk_1EE22C3C8 forKey:v13];

  LODWORD(v12) = [v7 inGrace];
  if (v12)
  {
    id v14 = self->_paymentRingInstrumentationRecord;
    id v15 = off_1EB4024E0();
    id v16 = &unk_1EE22C3E0;
  }
  else
  {
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    if (previousStatementPaymentsSum
      && [(NSDecimalNumber *)previousStatementPaymentsSum pk_isPositiveNumber])
    {
      id v14 = self->_paymentRingInstrumentationRecord;
      id v15 = off_1EB4024E0();
      id v16 = &unk_1EE22C3F8;
    }
    else
    {
      id v14 = self->_paymentRingInstrumentationRecord;
      id v15 = off_1EB4024E0();
      id v16 = &unk_1EE22C410;
    }
  }
  [(NSMutableDictionary *)v14 setObject:v16 forKey:v15];

  uint64_t v18 = self->_paymentRingInstrumentationRecord;
  uint64_t v19 = off_1EB4024E8();
  id v21 = (id)v19;
  if (a3) {
    uint64_t v20 = &unk_1EE22C3C8;
  }
  else {
    uint64_t v20 = &unk_1EE22C3E0;
  }
  [(NSMutableDictionary *)v18 setObject:v20 forKey:v19];
}

- (void)_setDifferentialPrivacyFeature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ([(NSMutableArray *)self->_differentialPrivacyFeatures count] > a4)
  {
    differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
    PKBillPaymentDifferentialPrivacyFeatureToString(a3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)differentialPrivacyFeatures replaceObjectAtIndex:a4 withObject:v8];
  }
}

- (void)recordPaymentActionWithDifferentialPrivacy:(unint64_t)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
  id v5 = PKBillPaymentDifferentialPrivacyButtonActionToString(a3);
  [(NSMutableArray *)differentialPrivacyFeatures replaceObjectAtIndex:3 withObject:v5];

  id v6 = [(PKBillPaymentSuggestedAmountController *)self differentialPrivacyFeaturesAsString];
  id v7 = (_DPStringRecorder *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:@"com.apple.wallet.suggestions"];
  differentialPrivacyRecorder = self->_differentialPrivacyRecorder;
  self->_differentialPrivacyRecorder = v7;

  uint64_t v9 = self->_differentialPrivacyRecorder;
  v16[0] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  int v11 = [(_DPStringRecorder *)v9 record:v10];

  id v12 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"Fail";
    if (v11) {
      uint64_t v13 = @"Success";
    }
    int v14 = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "DifferentialPrivacy recorder status : %{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)recordPaymentRingAction:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = off_1EB4024D8();
  [(NSMutableDictionary *)paymentRingInstrumentationRecord setObject:v5 forKey:v6];

  [(FHPaymentRingSuggestionController *)self->_fhController recordPaymentRingAction:self->_paymentRingInstrumentationRecord];
  id v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_paymentRingInstrumentationRecord;
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Payment action recorded: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (id)differentialPrivacyFeaturesAsString
{
  return (id)[(NSMutableArray *)self->_differentialPrivacyFeatures componentsJoinedByString:@","];
}

- (id)paymentRingInstrumentationRecordAsString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  id v5 = off_1EB4024E0();
  id v6 = [(NSMutableDictionary *)paymentRingInstrumentationRecord objectForKey:v5];
  id v7 = [v6 stringValue];
  [v3 addObject:v7];

  id v8 = self->_paymentRingInstrumentationRecord;
  int v9 = off_1EB4024E8();
  uint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];
  uint64_t v11 = [v10 stringValue];
  [v3 addObject:v11];

  id v12 = self->_paymentRingInstrumentationRecord;
  uint64_t v13 = _MergedGlobals_182();
  int v14 = [(NSMutableDictionary *)v12 objectForKey:v13];
  id v15 = [v14 stringValue];
  [v3 addObject:v15];

  id v16 = self->_paymentRingInstrumentationRecord;
  uint64_t v17 = off_1EB4024D8();
  uint64_t v18 = [(NSMutableDictionary *)v16 objectForKey:v17];
  uint64_t v19 = [v18 stringValue];
  [v3 addObject:v19];

  uint64_t v20 = [v3 componentsJoinedByString:@","];

  return v20;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (PKTransactionSource)transactionSource
{
  return self->_transactionSource;
}

- (NSArray)currentStatementSelectedSuggestedAmountEvents
{
  return self->_currentStatementSelectedSuggestedAmountEvents;
}

- (NSArray)previousStatementSelectedSuggestedAmountEvents
{
  return self->_previousStatementSelectedSuggestedAmountEvents;
}

- (NSDecimalNumber)currentStatementPurchasesSum
{
  return self->_currentStatementPurchasesSum;
}

- (NSDecimalNumber)currentStatementPaymentsSum
{
  return self->_currentStatementPaymentsSum;
}

- (NSDecimalNumber)previousStatementPurchasesSum
{
  return self->_previousStatementPurchasesSum;
}

- (NSDecimalNumber)previousStatementPaymentsSum
{
  return self->_previousStatementPaymentsSum;
}

- (NSDictionary)previousStatementMerchantCategoryTransactionSums
{
  return self->_previousStatementMerchantCategoryTransactionSums;
}

- (NSDictionary)currentStatementMerchantCategoryTransactionSums
{
  return self->_currentStatementMerchantCategoryTransactionSums;
}

- (PKAccountServiceAccountResolutionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatementMerchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_previousStatementMerchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_previousStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_previousStatementSelectedSuggestedAmountEvents, 0);
  objc_storeStrong((id *)&self->_currentStatementSelectedSuggestedAmountEvents, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fhController, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyRecorder, 0);
  objc_storeStrong((id *)&self->_paymentRingInstrumentationRecord, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyFeatures, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_merchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_statementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthAndDayFormatter, 0);
}

@end