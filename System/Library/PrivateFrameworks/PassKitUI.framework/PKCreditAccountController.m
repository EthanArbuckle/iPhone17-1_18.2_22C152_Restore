@interface PKCreditAccountController
+ (BOOL)_shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:(id)a3;
+ (BOOL)_shouldDisplayBalanceForAccount:(id)a3;
+ (BOOL)_shouldDisplayTransactionsForAccount:(id)a3;
+ (BOOL)shouldDisplayAccountInformationForTransactionSourceCollection:(id)a3 withAccount:(id)a4;
+ (BOOL)shouldDisplayScheduledPaymentsWithAccount:(id)a3 andPass:(id)a4;
+ (BOOL)shouldDisplayTransactionsForTransactionSourceCollection:(id)a3 withAccount:(id)a4;
+ (BOOL)shouldShowCardNumbersWithAccount:(id)a3 andPass:(id)a4;
+ (id)relevantScheduledPaymentFromScheduledPayments:(id)a3 account:(id)a4;
+ (unint64_t)paymentEducationStateForAccount:(id)a3 mostRecentTransactions:(id)a4 pendingPayments:(id)a5 upcomingScheduledPayments:(id)a6;
+ (void)resolutionToReceiveCashbackForAccount:(id)a3 accountUser:(id)a4 withPeerPaymentAccount:(id)a5 completion:(id)a6;
@end

@implementation PKCreditAccountController

+ (void)resolutionToReceiveCashbackForAccount:(id)a3 accountUser:(id)a4 withPeerPaymentAccount:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    v13 = [v9 creditDetails];
    v14 = v13;
    if (v9 && v13)
    {
      uint64_t v15 = [v13 rewardsDestination];
      v16 = [MEMORY[0x1E4F84270] sharedInstance];
      v17 = objc_opt_new();
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__4;
      v44[4] = __Block_byref_object_dispose__4;
      id v45 = 0;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke;
      v41[3] = &unk_1E59CDD98;
      id v18 = v16;
      id v42 = v18;
      v43 = v44;
      [v17 addOperation:v41];
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__4;
      v39[4] = __Block_byref_object_dispose__4;
      id v40 = 0;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_3;
      v33[3] = &unk_1E59CDDE8;
      id v23 = v18;
      id v34 = v23;
      uint64_t v38 = v15;
      id v19 = v9;
      id v35 = v19;
      id v20 = v10;
      id v36 = v20;
      v37 = v39;
      [v17 addOperation:v33];
      v21 = [MEMORY[0x1E4F1CA98] null];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_5;
      v24[3] = &unk_1E59CDE10;
      id v25 = v14;
      id v26 = v20;
      id v27 = v19;
      v30 = v39;
      v31 = v44;
      id v28 = v11;
      uint64_t v32 = v15;
      id v29 = v12;
      id v22 = (id)[v17 evaluateWithInput:v21 completion:v24];

      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v44, 8);
    }
    else
    {
      (*((void (**)(id, void, void, void, void))v12 + 2))(v12, 0, 0, 0, 0);
    }
  }
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_2;
  v12[3] = &unk_1E59CC7B0;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 defaultAccountForFeature:5 completion:v12];
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 64);
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) accountIdentifier];
  id v11 = [*(id *)(a1 + 48) altDSID];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_4;
  v15[3] = &unk_1E59CDDC0;
  uint64_t v12 = *(void *)(a1 + 56);
  id v17 = v7;
  uint64_t v18 = v12;
  id v16 = v6;
  id v13 = v6;
  id v14 = v7;
  [v9 lastRedemptionEventToDestination:v8 forAccountIdentifier:v10 altDSID:v11 completion:v15];
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accountSummary];
  v3 = *(void **)(a1 + 40);
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = [v3 altDSID];
  v5 = [v2 accountUserActivityForAccountUserAltDSID:v4];
  id v6 = [v5 rewardsBalance];

  if (!v6)
  {
LABEL_3:
    id v6 = [v2 rewardsBalance];
  }
  int v7 = objc_msgSend(v6, "pk_isPositiveNumber");
  if ([*(id *)(a1 + 48) accessLevel] != 1)
  {
    uint64_t v14 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v8)
  {
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  id v9 = [v8 items];
  id v10 = [v9 anyObject];

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      int v29 = 138412290;
      uint64_t v30 = v16;
      id v17 = "Redemption allowed, malformed last event %@";
LABEL_15:
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v29, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  id v11 = [v10 status];
  uint64_t v12 = v11;
  if (v11 != @"success")
  {
    if (v11)
    {
      int v13 = [(__CFString *)v11 isEqualToString:@"success"];

      if (v13) {
        goto LABEL_11;
      }

      if (!v7)
      {
LABEL_17:
        uint64_t v14 = 2;
        goto LABEL_18;
      }
    }
    else if ((v7 & 1) == 0)
    {
      goto LABEL_17;
    }
    uint64_t v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      int v29 = 138412290;
      uint64_t v30 = v28;
      id v17 = "Redemption allowed, user has pending rewards and last redemption was not successful %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
LABEL_11:

  uint64_t v14 = 1;
LABEL_18:

LABEL_20:
  uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v18) {
    BOOL v19 = [v18 state] == 1;
  }
  else {
    BOOL v19 = 0;
  }
  id v20 = *(void **)(a1 + 56);
  if (v20)
  {
    if ([v20 stage] != 1) {
      goto LABEL_32;
    }
    BOOL v21 = [*(id *)(a1 + 56) state] != 1;
  }
  else
  {
    BOOL v21 = 0;
  }
  if (((v7 ^ 1 | v19) & 1) == 0 && !v21)
  {
    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Redemption allowed, user has pending rewards and Cash and Savings accounts not set up or ineligible", (uint8_t *)&v29, 2u);
    }
  }
LABEL_32:
  if (*(void *)(a1 + 88) != 3 && *(void *)(a1 + 56))
  {
    id v23 = [MEMORY[0x1E4F84898] sharedInstance];
    v24 = [*(id *)(a1 + 56) associatedPassUniqueID];
    id v25 = [v23 passWithUniqueID:v24];
    id v26 = [v25 paymentPass];

    uint64_t v27 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    if ((unint64_t)(v27 - 1) >= 4 && !v27 && v14 == 2) {
      [*(id *)(a1 + 56) stage];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

+ (BOOL)shouldDisplayAccountInformationForTransactionSourceCollection:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 paymentPass];
  id v9 = [v8 devicePrimaryPaymentApplication];

  if ([v7 feature] == 2 && objc_msgSend(v7, "isClosedAndChargedOff") && !v9)
  {
    char v10 = [a1 _shouldDisplayBalanceForAccount:v7];
  }
  else
  {
    if (![a1 _shouldDisplayBalanceForAccount:v7])
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    char v10 = [a1 _shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:v6];
  }
  BOOL v11 = v10;
LABEL_9:

  return v11;
}

+ (BOOL)shouldDisplayTransactionsForTransactionSourceCollection:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  if ([a1 _shouldDisplayTransactionsForAccount:a4]) {
    char v7 = [a1 _shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:v6];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)_shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:(id)a3
{
  v3 = [a3 paymentPass];
  id v4 = [v3 devicePrimaryPaymentApplication];

  if (v4)
  {
    unint64_t v5 = [v4 state];
    if (v5 <= 0xF) {
      unsigned int v6 = (0x867Eu >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)_shouldDisplayBalanceForAccount:(id)a3
{
  id v3 = a3;
  if ([v3 blockAllAccountAccess])
  {
    BOOL v4 = 0;
  }
  else
  {
    unint64_t v5 = [v3 creditDetails];
    if (v5 && (unint64_t v6 = [v3 state], v6 <= 5) && ((1 << v6) & 0x29) == 0)
    {
      if (((1 << v6) & 6) != 0)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v8 = [v3 creditDetails];
        id v9 = [v8 accountSummary];
        char v10 = [v9 currentBalance];

        BOOL v4 = 0;
        if ([v3 supportsSchedulePayment] && v10)
        {
          BOOL v11 = [MEMORY[0x1E4F28C28] zero];
          BOOL v4 = [v10 compare:v11] != 0;
        }
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)_shouldDisplayTransactionsForAccount:(id)a3
{
  id v3 = a3;
  if ([v3 blockAllAccountAccess])
  {
    BOOL v4 = 0;
  }
  else
  {
    unint64_t v5 = [v3 creditDetails];
    if (v5 && (unint64_t v6 = [v3 state], v6 <= 5) && ((1 << v6) & 0x29) == 0)
    {
      if (((1 << v6) & 6) != 0)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v8 = [v3 creditDetails];
        id v9 = [v8 accountSummary];
        char v10 = [v9 currentBalance];

        if (v10)
        {
          BOOL v11 = [MEMORY[0x1E4F28C28] zero];
          BOOL v4 = [v10 compare:v11] != 0;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (id)relevantScheduledPaymentFromScheduledPayments:(id)a3 account:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  char v10 = [v5 creditDetails];
  BOOL v11 = [v10 productTimeZone];
  [v9 setTimeZone:v11];

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  v33 = [v9 components:28 fromDate:v12];
  id v34 = v9;
  int v13 = [v9 dateFromComponents:v33];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __83__PKCreditAccountController_relevantScheduledPaymentFromScheduledPayments_account___block_invoke;
  v40[3] = &unk_1E59CDE38;
  id v32 = v5;
  id v41 = v32;
  uint64_t v14 = objc_msgSend(v7, "pk_objectsPassingTest:", v40);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        BOOL v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v22 = [v21 scheduleDetails];
        unint64_t v23 = [v22 frequency];

        v24 = [v21 scheduleDetails];
        id v25 = [v24 scheduledDate];

        if (v23 >= 2
          && ([v25 compare:v13] == 1 || !objc_msgSend(v25, "compare:", v13))
          && (!v18 || v17 && [v25 compare:v17] == -1))
        {
          id v26 = v21;

          uint64_t v27 = [v26 scheduleDetails];
          uint64_t v28 = [v27 scheduledDate];

          id v17 = (void *)v28;
          uint64_t v18 = v26;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v16);
  }
  else
  {
    id v17 = 0;
    uint64_t v18 = 0;
  }

  int v29 = v41;
  id v30 = v18;

  return v30;
}

uint64_t __83__PKCreditAccountController_relevantScheduledPaymentFromScheduledPayments_account___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOnHoldForAccount:*(void *)(a1 + 32)] ^ 1;
}

+ (unint64_t)paymentEducationStateForAccount:(id)a3 mostRecentTransactions:(id)a4 pendingPayments:(id)a5 upcomingScheduledPayments:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 creditDetails];
  uint64_t v15 = [v14 accountSummary];
  uint64_t v75 = [v15 remainingStatementBalance];
  uint64_t v76 = [v15 remainingMinimumPayment];
  v85 = [v15 adjustedBalance];
  v77 = [v15 pastDueAmount];
  uint64_t v68 = [v15 cyclesPastDue];
  uint64_t v70 = [v15 paymentDueDate];
  v71 = v14;
  v84 = [v14 createdDate];
  v83 = [v11 firstObject];
  v82 = [v83 transactionDate];
  id v16 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v86 = (void *)[v16 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v72 = v13;
  uint64_t v74 = [a1 relevantScheduledPaymentFromScheduledPayments:v13 account:v10];
  v80 = [MEMORY[0x1E4F1C9C8] date];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __126__PKCreditAccountController_paymentEducationStateForAccount_mostRecentTransactions_pendingPayments_upcomingScheduledPayments___block_invoke;
  v91[3] = &unk_1E59CDE60;
  id v81 = v15;
  id v92 = v81;
  v73 = v11;
  v79 = objc_msgSend(v11, "pk_objectsPassingTest:", v91);
  id v17 = [MEMORY[0x1E4F28C28] zero];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v88;
    do
    {
      uint64_t v22 = 0;
      unint64_t v23 = v17;
      do
      {
        if (*(void *)v88 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = [*(id *)(*((void *)&v87 + 1) + 8 * v22) currencyAmount];
        id v25 = [v24 amount];
        id v17 = [v23 decimalNumberByAdding:v25];

        ++v22;
        unint64_t v23 = v17;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v87 objects:v93 count:16];
    }
    while (v20);
  }
  v78 = v10;

  if (v82)
  {
    id v26 = v86;
    uint64_t v27 = v80;
    uint64_t v28 = [v86 components:128 fromDate:v82 toDate:v80 options:0];
    uint64_t v29 = [v28 second];

    id v30 = (void *)v75;
    id v32 = v83;
    uint64_t v31 = v84;
    if (v83) {
      goto LABEL_10;
    }
LABEL_16:
    BOOL v65 = 0;
    id v34 = (void *)v76;
    if (!v31) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v29 = 0;
  id v30 = (void *)v75;
  id v32 = v83;
  uint64_t v31 = v84;
  id v26 = v86;
  uint64_t v27 = v80;
  if (!v83) {
    goto LABEL_16;
  }
LABEL_10:
  v33 = [v32 transactionDate];
  if ([v27 compare:v33] == 1)
  {
    id v34 = (void *)v76;
    BOOL v65 = [v32 transactionType] == 10
       && ([v32 transactionStatus] == 1 || !objc_msgSend(v32, "transactionStatus"))
       && v29 < 61;
  }
  else
  {
    BOOL v65 = 0;
    id v34 = (void *)v76;
  }

  id v26 = v86;
  if (!v31) {
    goto LABEL_23;
  }
LABEL_21:
  if ([v26 isDate:v31 equalToDate:v27 toUnitGranularity:8])
  {
    int v35 = [v26 isDate:v31 equalToDate:v27 toUnitGranularity:4] ^ 1;
    goto LABEL_24;
  }
LABEL_23:
  LOBYTE(v35) = 1;
LABEL_24:
  char v67 = v35;
  long long v36 = v30;
  if (v30)
  {
    long long v37 = [v30 decimalNumberBySubtracting:v17];
    long long v38 = [MEMORY[0x1E4F28C28] zero];
    BOOL v64 = [v37 compare:v38] != 1;
  }
  else
  {
    BOOL v64 = 1;
  }
  if (v85)
  {
    long long v39 = [MEMORY[0x1E4F28C28] zero];
    BOOL v66 = [v85 compare:v39] == 1;

    if (v34)
    {
LABEL_29:
      id v40 = [v34 decimalNumberBySubtracting:v17];
      id v41 = [MEMORY[0x1E4F28C28] zero];
      BOOL v62 = [v40 compare:v41] == 1;

      goto LABEL_32;
    }
  }
  else
  {
    BOOL v66 = 0;
    if (v34) {
      goto LABEL_29;
    }
  }
  BOOL v62 = 0;
LABEL_32:
  id v42 = v77;
  if (v68 <= 0)
  {
    if (v77)
    {
      uint64_t v43 = [MEMORY[0x1E4F28C28] zero];
      BOOL v69 = [v77 compare:v43] == 1;

      id v42 = v77;
    }
    else
    {
      BOOL v69 = 0;
    }
  }
  else
  {
    BOOL v69 = 1;
  }
  if ([v78 state] == 4) {
    BOOL v44 = [v78 stateReason] == 1 || objc_msgSend(v78, "stateReason") == 8;
  }
  else {
    BOOL v44 = 0;
  }
  uint64_t v63 = [v79 count];
  uint64_t v45 = [v78 state];
  v46 = [v81 currentStatement];
  v47 = v46;
  if (v46)
  {
    v48 = [v46 openingDate];
    if (v48)
    {
      v49 = [v47 closingDate];
      if (v49)
      {
        v50 = [v47 statementBalance];
        if (v50)
        {
          v51 = [v47 paymentDueDate];
          BOOL v52 = v51 != 0;
        }
        else
        {
          BOOL v52 = 0;
        }

        long long v36 = (void *)v75;
      }
      else
      {
        BOOL v52 = 0;
      }

      id v42 = v77;
    }
    else
    {
      BOOL v52 = 0;
    }

    id v34 = (void *)v76;
  }
  else
  {
    BOOL v52 = 0;
  }
  char v53 = v67;
  if (v45 != 1) {
    char v53 = 1;
  }
  if ((v53 & 1) == 0)
  {
    v54 = v36;
    if (v74) {
      unint64_t v56 = 9;
    }
    else {
      unint64_t v56 = v66;
    }
    goto LABEL_78;
  }
  if (!v66)
  {
    v54 = v36;
    unint64_t v56 = 2;
LABEL_78:
    v57 = (void *)v70;
    v58 = (void *)v74;
    goto LABEL_79;
  }
  v54 = v36;
  uint64_t v55 = 9;
  if (v65) {
    uint64_t v55 = 7;
  }
  if (v69 || v44) {
    unint64_t v56 = 6;
  }
  else {
    unint64_t v56 = v55;
  }
  if (v69 || v44 || v65) {
    goto LABEL_78;
  }
  v57 = (void *)v70;
  v58 = (void *)v74;
  if (!v74)
  {
    int v59 = !v52;
    if (v63) {
      int v59 = 1;
    }
    if (!v70) {
      int v59 = 1;
    }
    if ((v59 | v64) == 1)
    {
      BOOL v60 = v62;
      if (!v70) {
        BOOL v60 = 0;
      }
      if (v60)
      {
        unint64_t v56 = 4;
      }
      else if (!v52 || v64)
      {
        unint64_t v56 = 8;
      }
      else
      {
        unint64_t v56 = 5;
      }
    }
    else
    {
      unint64_t v56 = 3;
    }
    v58 = 0;
  }
LABEL_79:

  return v56;
}

BOOL __126__PKCreditAccountController_paymentEducationStateForAccount_mostRecentTransactions_pendingPayments_upcomingScheduledPayments___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 balanceSummary];
  id v5 = [v4 openingDate];

  unint64_t v6 = [v3 transactionDate];
  uint64_t v7 = [v6 compare:v5];

  uint64_t v8 = [v3 transactionType];
  BOOL v10 = v8 == 10 && v7 == 1;

  return v10;
}

+ (BOOL)shouldDisplayScheduledPaymentsWithAccount:(id)a3 andPass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v6];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v7];
  if (v5)
  {
    id v9 = [v5 creditDetails];
    if (v9)
    {
      BOOL v10 = [v6 associatedAccountServiceAccountIdentifier];
      BOOL v11 = [v10 length]
         && [v5 supportsShowAccountSummary]
         && +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:v8 withAccount:v5];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldShowCardNumbersWithAccount:(id)a3 andPass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 creditDetails];
  if (v7 && (unint64_t)([v5 state] - 1) <= 1)
  {
    if (([v5 supportsShowVirtualCard] & 1) != 0
      || ([v5 supportsRequestPhysicalCard] & 1) != 0)
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v10 = [v6 deviceAccountNumberSuffix];
      BOOL v8 = [v10 length] != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end