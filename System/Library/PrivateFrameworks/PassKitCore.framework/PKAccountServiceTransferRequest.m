@interface PKAccountServiceTransferRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountServicePaymentRequest:(id)a3;
- (BOOL)supportsSplitPayment;
- (BOOL)userWasShownAPCTransferSpeed;
- (NSString)accountIdentifier;
- (NSURL)accountBaseURL;
- (PKAccount)account;
- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8;
- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8 paymentDate:(id)a9 objectSettings:(id)a10;
- (PKAccountServiceTransferRequest)initWithCoder:(id)a3;
- (PKBankAccountInformation)defaultBankAccount;
- (PKPaymentPass)peerPaymentPass;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (id)_bankAccountsForFundingSources:(id)a3;
- (id)paymentSummaryItemsWithFundingSources:(unint64_t)a3 bankAccount:(id)a4;
- (unint64_t)hash;
- (unint64_t)initialAction;
- (unint64_t)transferType;
- (void)encodeWithCoder:(id)a3;
- (void)paymentAmountsWithFundingSources:(unint64_t)a3 apc:(id *)a4 ach:(id *)a5;
- (void)setDefaultBankAccount:(id)a3;
- (void)setInitialAction:(unint64_t)a3;
- (void)setUserWasShownAPCTransferSpeed:(BOOL)a3;
@end

@implementation PKAccountServiceTransferRequest

- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8
{
  return [(PKAccountServiceTransferRequest *)self initWithAccount:a3 peerPaymentAccount:a4 peerPaymentPass:a5 transferType:a6 fundingSources:a7 currencyAmount:a8 paymentDate:0 objectSettings:0];
}

- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8 paymentDate:(id)a9 objectSettings:(id)a10
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  unint64_t v16 = (unint64_t)a4;
  unint64_t v17 = (unint64_t)a5;
  id v110 = a7;
  id v109 = a8;
  id v18 = a9;
  id v107 = a10;
  v115.receiver = self;
  v115.super_class = (Class)PKAccountServiceTransferRequest;
  v19 = [(PKPaymentRequest *)&v115 init];
  if (!v19)
  {
LABEL_116:
    v32 = v19;
    v26 = v108;
LABEL_117:
    v24 = v109;
    goto LABEL_118;
  }
  if (!(v16 | v17) && ![v110 count])
  {
    v31 = PKLogFacilityTypeGetObject(0xEuLL);
    v26 = v108;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Transfer request invalid: No peer payment or funding sources", buf, 2u);
    }

    v32 = 0;
    goto LABEL_117;
  }
  id v104 = (id)v17;
  v105 = (void *)v16;
  objc_storeStrong((id *)&v19->_account, a3);
  v19->_featureIdentifier = [(PKAccount *)v19->_account feature];
  uint64_t v20 = [(PKAccount *)v19->_account accountIdentifier];
  accountIdentifier = v19->_accountIdentifier;
  v19->_accountIdentifier = (NSString *)v20;

  uint64_t v22 = [(PKAccount *)v19->_account accountBaseURL];
  accountBaseURL = v19->_accountBaseURL;
  v19->_accountBaseURL = (NSURL *)v22;

  v19->_unint64_t transferType = a6;
  objc_storeStrong((id *)&v19->_currencyAmount, a8);
  objc_storeStrong((id *)&v19->_peerPaymentAccount, a4);
  objc_storeStrong((id *)&v19->_peerPaymentPass, a5);
  v19->_userWasShownAPCTransferSpeed = 0;
  [(PKPaymentRequest *)v19 setRequestType:2];
  [(PKPaymentRequest *)v19 setClientCallbackTimeout:65.0];
  v24 = v109;
  v25 = [v109 currency];
  [(PKPaymentRequest *)v19 setCurrencyCode:v25];

  [(PKPaymentRequest *)v19 setConfirmationStyle:9];
  v26 = v108;
  if (v18)
  {
    [(PKPaymentRequest *)v19 setPaymentDate:v18];
    uint64_t v27 = 2;
  }
  else
  {
    v28 = [MEMORY[0x1E4F1C9C8] date];
    [(PKPaymentRequest *)v19 setPaymentDate:v28];

    uint64_t v27 = 1;
  }
  [(PKPaymentRequest *)v19 setPaymentFrequency:v27];
  switch([v108 type])
  {
    case 0:
    case 2:
    case 3:
      v29 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = PKAccountTypeToString([v108 type]);
        *(_DWORD *)buf = 138412290;
        *(void *)v117 = v30;
        _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Transfer request invalid for account type %@", buf, 0xCu);
      }
      goto LABEL_107;
    case 1:
      v33 = [v108 creditDetails];
      v29 = [v33 productTimeZone];

      BOOL v34 = ([v107 settings] & 0x200) != 0 || objc_msgSend(v110, "count") == 0;
      v39 = [v108 schedulePaymentFeatureDescriptor];
      char v40 = [v39 paymentFundingSourceTypes];

      [(PKPaymentRequest *)v19 setDeviceSupportsPeerPaymentAccountPayment:PKPeerPaymentCanPerformAccountServicePayments(v105, (void *)v17)];
      uint64_t v41 = 0;
      if (!v18 && (v40 & 2) != 0) {
        uint64_t v41 = [(PKPaymentRequest *)v19 deviceSupportsPeerPaymentAccountPayment];
      }
      [(PKPaymentRequest *)v19 setAccountPaymentSupportsPeerPayment:v41];
      uint64_t v42 = v34 && [(PKPaymentRequest *)v19 accountPaymentSupportsPeerPayment];
      [(PKPaymentRequest *)v19 setAccountPaymentUsePeerPaymentBalance:v42];
      v43 = [(PKAccountServiceTransferRequest *)v19 _bankAccountsForFundingSources:v110];
      unint64_t v16 = (unint64_t)v105;
      if ([v43 count])
      {
        v44 = [v108 accountIdentifier];
        v45 = PKLastBankAccountIdentifierForAccountTransfer((uint64_t)v44);
        uint64_t v46 = [v45 length];
        v47 = v43;
        if (!v46)
        {
          uint64_t v48 = PKSharedCacheGetStringForKey(@"LastBankAccountIdentifier");

          v45 = (void *)v48;
        }
        if (![v45 length]) {
          goto LABEL_32;
        }
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke;
        v113[3] = &unk_1E56EC3B0;
        id v114 = v45;
        v49 = objc_msgSend(v43, "pk_firstObjectPassingTest:", v113);

        if (!v49)
        {
LABEL_32:
          v49 = [v47 firstObject];
        }
        if (!v46 && v49)
        {
          v50 = [v49 identifier];
          PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v44, v50);
        }
        [(PKAccountServiceTransferRequest *)v19 setDefaultBankAccount:v49];
        [(PKPaymentRequest *)v19 setBankAccounts:v47];

        v43 = v47;
        goto LABEL_111;
      }
      v51 = [v105 currentBalance];
      v52 = [v51 amount];
      v53 = [v109 amount];
      uint64_t v54 = [v52 compare:v53];

      if (v54 == -1)
      {
        v55 = v43;
        v56 = PKLogFacilityTypeGetObject(0xEuLL);
        unint64_t v17 = (unint64_t)v104;
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          v24 = v109;
          goto LABEL_106;
        }
        *(_WORD *)buf = 0;
        v57 = "Transfer request invalid - no bank accounts and cash cannot cover the full amount";
      }
      else
      {
        if ([(PKPaymentRequest *)v19 accountPaymentSupportsPeerPayment]) {
          goto LABEL_111;
        }
        v55 = v43;
        v56 = PKLogFacilityTypeGetObject(0xEuLL);
        unint64_t v17 = (unint64_t)v104;
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        *(_WORD *)buf = 0;
        v57 = "Transfer request invalid - no bank accounts and cash is not supported";
      }
      _os_log_impl(&dword_190E10000, v56, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
      goto LABEL_57;
    case 4:
      v35 = [v108 savingsDetails];
      v29 = [v35 productTimeZone];

      unint64_t transferType = v19->_transferType;
      if (transferType == 3)
      {
        char v38 = [v108 oneTimeWithdrawalFundingSourceTypes];
        v37 = (void *)v17;
      }
      else
      {
        v37 = (void *)v17;
        if (transferType == 2) {
          char v38 = [v108 oneTimeDepositFundingSourceTypes];
        }
        else {
          char v38 = 0;
        }
      }
      v43 = [v109 amount];
      char v102 = v38;
      if ((v38 & 1) == 0)
      {
        BOOL v58 = 0;
        goto LABEL_73;
      }
      if (a6 == 3)
      {
        v59 = [v108 oneTimeWithdrawalFeatureDescriptor];
      }
      else
      {
        if (a6 != 2)
        {
LABEL_53:
          v64 = 0;
          BOOL v58 = 0;
          goto LABEL_72;
        }
        v59 = [v108 oneTimeDepositFeatureDescriptor];
      }
      if (!v59) {
        goto LABEL_53;
      }
      v60 = v59;
      id v61 = [v59 minimumAmount];
      v99 = v60;
      if ([v43 compare:v61] == -1)
      {
        BOOL v58 = 0;
LABEL_70:

        goto LABEL_71;
      }
      v62 = [v60 maximumAmount];
      uint64_t v63 = [v43 compare:v62];

      if (v63 != 1)
      {
        v65 = [(PKAccountServiceTransferRequest *)v19 _bankAccountsForFundingSources:v110];
        uint64_t v66 = objc_msgSend(v65, "pk_firstObjectPassingTest:", &__block_literal_global_137);
        BOOL v58 = v66 != 0;
        v98 = (void *)v66;
        if (v66)
        {
          v97 = v65;
          BOOL v100 = v66 != 0;
          v96 = [v108 accountIdentifier];
          v67 = PKLastBankAccountIdentifierForAccountTransfer((uint64_t)v96);
          uint64_t v68 = [v67 length];
          if (!v68)
          {
            uint64_t v69 = PKSharedCacheGetStringForKey(@"LastBankAccountIdentifier");

            v67 = (void *)v69;
          }
          if (![v67 length]) {
            goto LABEL_64;
          }
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_2;
          v111[3] = &unk_1E56EC3B0;
          id v112 = v67;
          objc_msgSend(v97, "pk_firstObjectPassingTest:", v111);
          id v61 = (id)objc_claimAutoreleasedReturnValue();

          if (!v61) {
LABEL_64:
          }
            id v61 = v98;
          if (!v68)
          {
            v70 = [v61 identifier];
            PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v96, v70);
          }
          BOOL v58 = v100;
          v65 = v97;
        }
        else
        {
          id v61 = 0;
        }
        [(PKAccountServiceTransferRequest *)v19 setDefaultBankAccount:v61];
        [(PKPaymentRequest *)v19 setBankAccounts:v65];

        v37 = v104;
        goto LABEL_70;
      }
      BOOL v58 = 0;
      v37 = v104;
LABEL_71:
      v24 = v109;
      v64 = v99;
LABEL_72:

LABEL_73:
      if (PKPeerPaymentNeedsResolutionToPerformAccountServicePayments((void *)v16, v37)) {
        LOBYTE(v71) = 0;
      }
      else {
        int v71 = PKPeerPaymentCanPerformAccountServicePayments((void *)v16, v37) ^ 1;
      }
      if ((v102 & 2) != 0 && (v71 & 1) == 0)
      {
        v72 = [(id)v16 currentBalance];
        v73 = [v72 amount];

        unint64_t v74 = v19->_transferType;
        v103 = v73;
        if (v74 == 2)
        {
          BOOL v101 = v58;
          v79 = [v73 decimalNumberBySubtracting:v43];
          v80 = [MEMORY[0x1E4F28C28] zero];
          BOOL v77 = [v79 compare:v80] != -1;

          v78 = [v108 oneTimeDepositWithAppleCashFeatureDescriptor];
        }
        else
        {
          if (v74 != 3)
          {
            BOOL v83 = 0;
            BOOL v77 = 1;
LABEL_90:
            BOOL v84 = a6 != 2 || [v103 compare:v43] != -1;
            int v85 = v58 & PKAccountServiceTransferPrefersBank();
            int v86 = v77 && v83;
            v87 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110144;
              *(_DWORD *)v117 = 1;
              *(_WORD *)&v117[4] = 1024;
              *(_DWORD *)&v117[6] = 1;
              __int16 v118 = 1024;
              int v119 = v86;
              __int16 v120 = 1024;
              BOOL v121 = v84;
              __int16 v122 = 1024;
              int v123 = v85 ^ 1;
              _os_log_impl(&dword_190E10000, v87, OS_LOG_TYPE_DEFAULT, "Should use peer payment for transfer request? Supports peer payment: %d, device can show peer payment: %d, satisfies cash limits %d, cash balance is sufficient %d, user doesn't prefer bank: %d", buf, 0x20u);
            }

            if (v86) {
              uint64_t v88 = v84 & (v85 ^ 1u);
            }
            else {
              uint64_t v88 = 0;
            }
            [(PKPaymentRequest *)v19 setAccountPaymentUsePeerPaymentBalance:v88];
            [(PKPaymentRequest *)v19 setAccountPaymentSupportsPeerPayment:1];
            [(PKPaymentRequest *)v19 setDeviceSupportsPeerPaymentAccountPayment:1];

            unint64_t v16 = (unint64_t)v105;
            v24 = v109;
            goto LABEL_99;
          }
          BOOL v101 = v58;
          v75 = [v43 decimalNumberByAdding:v73];
          v76 = [(id)v16 maximumBalance];
          BOOL v77 = [v75 compare:v76] != 1;

          v78 = [v108 oneTimeWithdrawalWithAppleCashFeatureDescriptor];
        }
        if (v78)
        {
          v81 = [v78 minimumAmount];
          if ([v43 compare:v81] == -1)
          {
            BOOL v83 = 0;
          }
          else
          {
            v82 = [v78 maximumAmount];
            BOOL v83 = [v43 compare:v82] != 1;
          }
        }
        else
        {
          BOOL v83 = 0;
        }
        BOOL v58 = v101;
        goto LABEL_90;
      }
LABEL_99:
      if ([(PKPaymentRequest *)v19 accountPaymentSupportsPeerPayment]) {
        BOOL v89 = [(PKPaymentRequest *)v19 deviceSupportsPeerPaymentAccountPayment];
      }
      else {
        BOOL v89 = 0;
      }
      v90 = [(PKPaymentRequest *)v19 bankAccounts];
      uint64_t v91 = [v90 count];

      if (v89 || v91)
      {
        if (v89 && !v91) {
          [(PKPaymentRequest *)v19 setAccountPaymentUsePeerPaymentBalance:1];
        }
LABEL_111:

LABEL_112:
        [(PKPaymentRequest *)v19 setPaymentTimeZone:v29];
        if ([(PKPaymentRequest *)v19 accountPaymentUsePeerPaymentBalance]) {
          uint64_t v92 = 3;
        }
        else {
          uint64_t v92 = 1;
        }
        v93 = [(PKAccountServiceTransferRequest *)v19 defaultBankAccount];
        v94 = [(PKAccountServiceTransferRequest *)v19 paymentSummaryItemsWithFundingSources:v92 bankAccount:v93];
        [(PKPaymentRequest *)v19 setPaymentSummaryItems:v94];

        unint64_t v17 = (unint64_t)v104;
        goto LABEL_116;
      }
      v55 = v43;
      v56 = PKLogFacilityTypeGetObject(0xEuLL);
      unint64_t v17 = (unint64_t)v104;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v56, OS_LOG_TYPE_DEFAULT, "Transfer request invalid: No bank account, and account does not support peer payment", buf, 2u);
      }
LABEL_106:

LABEL_107:
      v32 = 0;
LABEL_118:

      return v32;
    default:
      v29 = 0;
      goto LABEL_112;
  }
}

uint64_t __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
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

BOOL __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 status] == 1;
}

BOOL __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      BOOL v10 = 0;
      goto LABEL_10;
    }
    int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_9;
    }
  }
  BOOL v10 = [v3 status] == 1;
LABEL_10:

  return v10;
}

- (BOOL)supportsSplitPayment
{
  return self->_transferType == 1;
}

- (void)paymentAmountsWithFundingSources:(unint64_t)a3 apc:(id *)a4 ach:(id *)a5
{
  char v7 = a3;
  id v13 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  if ((v7 & 2) == 0)
  {
    *a5 = v13;
    goto LABEL_10;
  }
  int v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
  BOOL v10 = [v9 amount];

  if ([v10 compare:v13] == -1)
  {
    if (![(PKAccountServiceTransferRequest *)self supportsSplitPayment])
    {
      id v12 = *a4;
      goto LABEL_9;
    }
    v11 = v10;
  }
  else
  {
    v11 = v13;
  }
  id v12 = v11;
  *a4 = v12;
LABEL_9:
  *a5 = [v13 decimalNumberBySubtracting:v12];

LABEL_10:
}

- (id)paymentSummaryItemsWithFundingSources:(unint64_t)a3 bankAccount:(id)a4
{
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t transferType = self->_transferType;
  if (transferType != 3)
  {
    if (transferType == 2)
    {
      if ([(PKAccount *)self->_account type] == 4)
      {
        v29 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DEPOSIT_SAVINGS_TOTAL", self->_featureIdentifier, 0, v37, v38, v39, v40, v41, v48);
        goto LABEL_19;
      }
    }
    else if (transferType == 1)
    {
      id v49 = 0;
      id v50 = 0;
      [(PKAccountServiceTransferRequest *)self paymentAmountsWithFundingSources:a3 apc:&v50 ach:&v49];
      id v9 = v50;
      id v15 = v49;
      if (v9)
      {
        unint64_t v16 = [MEMORY[0x1E4F28C28] zero];
        if ([v16 compare:v9] == -1 && v15)
        {
          unint64_t v17 = [MEMORY[0x1E4F28C28] zero];
          uint64_t v18 = [v17 compare:v15];

          if (!v6 || v18 != -1) {
            goto LABEL_11;
          }
          unint64_t v16 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM", self->_featureIdentifier, 0, v10, v11, v12, v13, v14, v48);
          unint64_t featureIdentifier = self->_featureIdentifier;
          uint64_t v20 = [v6 bankName];
          v26 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT", featureIdentifier, @"%@", v21, v22, v23, v24, v25, (uint64_t)v20);

          uint64_t v27 = +[PKPaymentSummaryItem summaryItemWithLabel:v26 amount:v15];
          v28 = +[PKPaymentSummaryItem summaryItemWithLabel:v16 amount:v9];
          [v7 safelyAddObject:v28];
          [v7 safelyAddObject:v27];
        }
      }
LABEL_11:
      v29 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ITEM_TOTAL", self->_featureIdentifier, 0, v10, v11, v12, v13, v14, v48);

      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([(PKAccount *)self->_account type] != 4)
  {
LABEL_18:
    v29 = 0;
    goto LABEL_19;
  }
  v35 = [v6 bankName];
  if ((a3 & 2) != 0)
  {
    uint64_t v36 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_WITHDRAW_APPLE_CASH_TITLE", self->_featureIdentifier, 0, v30, v31, v32, v33, v34, v48);

    v35 = (void *)v36;
  }
  v29 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_WITHDRAW_TOTAL_FMT", self->_featureIdentifier, @"%@", v30, v31, v32, v33, v34, (uint64_t)v35);

LABEL_19:
  uint64_t v42 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  v43 = v42;
  if (v42)
  {
    id v44 = v42;
  }
  else
  {
    id v44 = [MEMORY[0x1E4F28C28] zero];
  }
  v45 = v44;

  uint64_t v46 = +[PKPaymentSummaryItem summaryItemWithLabel:v29 amount:v45];
  [v7 addObject:v46];

  return v7;
}

- (id)_bankAccountsForFundingSources:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bankAccountRepresentation", (void)v13);
          [v4 safelyAddObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  uint64_t v11 = objc_msgSend(v4, "copy", (void)v13);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountServiceTransferRequest *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountServiceTransferRequest *)self isEqualToAccountServicePaymentRequest:v5];

  return v6;
}

- (BOOL)isEqualToAccountServicePaymentRequest:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_33;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKAccountServiceTransferRequest;
  if (![(PKPaymentRequest *)&v21 isEqual:v4]) {
    goto LABEL_33;
  }
  id v5 = (void *)v4[71];
  BOOL v6 = self->_accountIdentifier;
  uint64_t v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {

      goto LABEL_33;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_33;
    }
  }
  accountBaseURL = self->_accountBaseURL;
  uint64_t v12 = (NSURL *)v4[72];
  if (accountBaseURL) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (accountBaseURL != v12) {
      goto LABEL_33;
    }
  }
  else
  {
    char v14 = -[NSURL isEqual:](accountBaseURL, "isEqual:");
    if ((v14 & 1) == 0) {
      goto LABEL_33;
    }
  }
  defaultBankAccount = self->_defaultBankAccount;
  long long v16 = (PKBankAccountInformation *)v4[73];
  if (defaultBankAccount && v16)
  {
    if ((-[PKBankAccountInformation isEqual:](defaultBankAccount, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (defaultBankAccount != v16)
  {
    goto LABEL_33;
  }
  account = self->_account;
  uint64_t v18 = (PKAccount *)v4[74];
  if (!account || !v18)
  {
    if (account == v18) {
      goto LABEL_30;
    }
LABEL_33:
    BOOL v19 = 0;
    goto LABEL_34;
  }
  if (!-[PKAccount isEqual:](account, "isEqual:")) {
    goto LABEL_33;
  }
LABEL_30:
  if (self->_transferType != v4[75] || self->_initialAction != v4[78]) {
    goto LABEL_33;
  }
  BOOL v19 = self->_userWasShownAPCTransferSpeed == *((unsigned __int8 *)v4 + 560);
LABEL_34:

  return v19;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_accountBaseURL];
  [v3 safelyAddObject:self->_defaultBankAccount];
  [v3 safelyAddObject:self->_account];
  v10.receiver = self;
  v10.super_class = (Class)PKAccountServiceTransferRequest;
  id v4 = [(PKAccountServiceTransferRequest *)&v10 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_transferType - v5 + 32 * v5;
  unint64_t v7 = self->_initialAction - v6 + 32 * v6;
  unint64_t v8 = self->_userWasShownAPCTransferSpeed - v7 + 32 * v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServiceTransferRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountServiceTransferRequest;
  uint64_t v5 = [(PKPaymentRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountBaseURL"];
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultBankAccount"];
    defaultBankAccount = v5->_defaultBankAccount;
    v5->_defaultBankAccount = (PKBankAccountInformation *)v10;

    v5->_unint64_t transferType = [v4 decodeIntegerForKey:@"transferType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (PKAccount *)v12;

    v5->_initialAction = [v4 decodeIntegerForKey:@"initialAction"];
    v5->_userWasShownAPCTransferSpeed = [v4 decodeBoolForKey:@"userWasShownAPCTransferSpeed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountServiceTransferRequest;
  id v4 = a3;
  [(PKPaymentRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, @"accountIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountBaseURL forKey:@"accountBaseURL"];
  [v4 encodeObject:self->_defaultBankAccount forKey:@"defaultBankAccount"];
  [v4 encodeInteger:self->_transferType forKey:@"transferType"];
  [v4 encodeObject:self->_account forKey:@"account"];
  [v4 encodeInteger:self->_initialAction forKey:@"initialAction"];
  [v4 encodeBool:self->_userWasShownAPCTransferSpeed forKey:@"userWasShownAPCTransferSpeed"];
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (PKBankAccountInformation)defaultBankAccount
{
  return self->_defaultBankAccount;
}

- (void)setDefaultBankAccount:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)transferType
{
  return self->_transferType;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (unint64_t)initialAction
{
  return self->_initialAction;
}

- (void)setInitialAction:(unint64_t)a3
{
  self->_initialAction = a3;
}

- (BOOL)userWasShownAPCTransferSpeed
{
  return self->_userWasShownAPCTransferSpeed;
}

- (void)setUserWasShownAPCTransferSpeed:(BOOL)a3
{
  self->_userWasShownAPCTransferSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_defaultBankAccount, 0);
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end