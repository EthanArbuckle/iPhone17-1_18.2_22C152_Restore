@interface PKPeerPaymentCardDataItem
+ (int64_t)dataType;
- (BOOL)_validateAccountResolutionsWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)_validateInsufficientBalanceWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)_validateTransferLimitsWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)shouldShowDisclosure;
- (PKPaymentPass)pass;
- (PKPeerPaymentQuote)quote;
- (int64_t)context;
@end

@implementation PKPeerPaymentCardDataItem

+ (int64_t)dataType
{
  return 2;
}

- (int64_t)context
{
  return 1;
}

- (PKPeerPaymentQuote)quote
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 peerPaymentQuote];

  return (PKPeerPaymentQuote *)v3;
}

- (PKPaymentPass)pass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  pass = self->_pass;
  if (!pass)
  {
    v4 = [(PKPaymentDataItem *)self model];
    v5 = [v4 library];

    v6 = [v5 peerPaymentPassUniqueID];
    v7 = [v5 passWithUniqueID:v6];
    v8 = [v7 paymentPass];
    v9 = self->_pass;
    self->_pass = v8;

    if (!self->_pass)
    {
      v10 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find peer payment pass with uniqueID: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    pass = self->_pass;
  }
  return pass;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPeerPaymentCardDataItem *)self isValidWithError:a3 errorStatus:0];
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  if (!-[PKPeerPaymentCardDataItem _validateAccountResolutionsWithError:errorStatus:](self, "_validateAccountResolutionsWithError:errorStatus:")|| ![(PKPeerPaymentCardDataItem *)self _validateTransferLimitsWithError:a3 errorStatus:a4])
  {
    return 0;
  }
  return [(PKPeerPaymentCardDataItem *)self _validateInsufficientBalanceWithError:a3 errorStatus:a4];
}

- (BOOL)_validateInsufficientBalanceWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v7 = [(PKPaymentDataItem *)self model];
  v8 = [v7 paymentRequest];

  v9 = [v8 accountServiceTransferRequest];
  v10 = v9;
  if (!v9 || [v9 transferType] != 2) {
    goto LABEL_6;
  }
  v11 = [(PKPaymentDataItem *)self model];
  int v12 = [v11 peerPaymentAccount];
  v13 = [v12 currentBalance];

  uint64_t v14 = [v13 currency];
  v15 = [v8 currencyCode];
  uint64_t v16 = [v14 caseInsensitiveCompare:v15];

  if (v16
    || ([v13 amount],
        v17 = objc_claimAutoreleasedReturnValue(),
        [v8 _transactionAmount],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v17 compare:v18],
        v18,
        v17,
        v19 != -1))
  {

LABEL_6:
    BOOL v20 = 1;
    goto LABEL_7;
  }
  if (a3)
  {
    v22 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr.isa, 0);
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v26[0] = *MEMORY[0x1E4F28568];
    v26[1] = v24;
    v27[0] = v22;
    v27[1] = v22;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    *a3 = [v23 errorWithDomain:@"PKPassKitErrorDomain" code:-3009 userInfo:v25];
  }
  if (a4) {
    *a4 = 5;
  }

  BOOL v20 = 0;
LABEL_7:

  return v20;
}

- (BOOL)_validateTransferLimitsWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v7 = [(PKPaymentDataItem *)self model];
  v8 = [v7 paymentRequest];

  v9 = [v8 accountServiceTransferRequest];
  v10 = v9;
  if (!v9) {
    goto LABEL_31;
  }
  v11 = [v9 account];
  unint64_t v12 = [v10 transferType];
  if (v12 < 2)
  {

LABEL_31:
    BOOL v31 = 1;
    goto LABEL_32;
  }
  if (v12 == 3)
  {
    uint64_t v13 = [v11 oneTimeWithdrawalWithAppleCashFeatureDescriptor];
  }
  else
  {
    if (v12 != 2)
    {
      uint64_t v14 = 0;
      goto LABEL_10;
    }
    uint64_t v13 = [v11 oneTimeDepositWithAppleCashFeatureDescriptor];
  }
  uint64_t v14 = (void *)v13;
LABEL_10:
  v15 = [(PKPaymentDataItem *)self model];
  uint64_t v16 = [v15 peerPaymentAccount];
  v17 = [v16 currentBalance];
  v18 = [v17 currency];

  uint64_t v19 = [v8 currencyCode];
  uint64_t v20 = [v18 caseInsensitiveCompare:v19];

  int v21 = 1;
  if (v14 && !v20)
  {
    v22 = [v8 _transactionAmount];
    v23 = [v14 minimumAmount];
    uint64_t v24 = [v14 maximumAmount];
    if (v23 && [v22 compare:v23] == -1)
    {
      if (a3)
      {
        uint64_t v29 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa, 0);
        v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28588];
        v41[0] = *MEMORY[0x1E4F28568];
        v41[1] = v30;
        v38 = (void *)v29;
        v42[0] = v29;
        v42[1] = v29;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
        *a3 = [v36 errorWithDomain:@"PKPassKitErrorDomain" code:-3016 userInfo:v34];
      }
      if (a4)
      {
        v27 = v22;
        int64_t v28 = 7;
        goto LABEL_25;
      }
    }
    else
    {
      if (!v24 || [v22 compare:v24] != 1)
      {
        v27 = v22;
        int v21 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (a3)
      {
        uint64_t v25 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_1.isa, 0);
        v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28588];
        v39[0] = *MEMORY[0x1E4F28568];
        v39[1] = v26;
        v37 = (void *)v25;
        v40[0] = v25;
        v40[1] = v25;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
        *a3 = [v35 errorWithDomain:@"PKPassKitErrorDomain" code:-3015 userInfo:v33];
      }
      if (a4)
      {
        v27 = v22;
        int64_t v28 = 6;
LABEL_25:
        *a4 = v28;
LABEL_27:
        int v21 = 1;
        goto LABEL_28;
      }
    }
    v27 = v22;
    goto LABEL_27;
  }
LABEL_29:

  if (!v21) {
    goto LABEL_31;
  }
  BOOL v31 = 0;
LABEL_32:

  return v31;
}

- (BOOL)_validateAccountResolutionsWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v6 = [(PKPaymentDataItem *)self model];
  v7 = [v6 paymentRequest];
  v8 = [v7 accountServiceTransferRequest];
  if ((unint64_t)[v8 transferType] >= 2)
  {
    v10 = [v6 peerPaymentAccount];
    v11 = [v6 peerPaymentPass];
    unint64_t v12 = v11;
    char v9 = 1;
    if (v10 && v11)
    {
      int v13 = PKPeerPaymentNeedsResolutionToPerformAccountServicePayments(v10, v11);
      if (v13)
      {
        if (a3)
        {
          uint64_t v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_2.isa, 0);
          v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v15 = *MEMORY[0x1E4F28588];
          v19[0] = *MEMORY[0x1E4F28568];
          v19[1] = v15;
          v20[0] = v14;
          v20[1] = v14;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
          *a3 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:-3017 userInfo:v16];
        }
        if (a4) {
          *a4 = 9;
        }
      }
      char v9 = v13 ^ 1;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)shouldShowDisclosure
{
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [v3 paymentRequest];

  uint64_t v5 = [v4 requestType];
  if ([v4 isPeerPaymentRequest])
  {
    v6 = [(PKPeerPaymentCardDataItem *)self quote];
    v7 = [v6 firstQuoteItemOfType:2];
    if (v7)
    {
      v8 = [v6 firstQuoteItemOfType:1];
      int v9 = v8 == 0;
    }
    else
    {
      int v9 = 0;
    }

    v10 = [(PKPaymentDataItem *)self model];
    if ([v10 supportsPreservePeerPaymentBalance])
    {
      uint64_t v13 = [v6 recipient];
      if (v13)
      {
        v11 = (void *)v13;
      }
      else
      {
        uint64_t v14 = [v4 peerPaymentRequest];
        v9 &= [v14 hasUndeterminedRecipient];

        v11 = 0;
      }
      goto LABEL_19;
    }
LABEL_13:
    LOBYTE(v9) = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (v5 == 2)
  {
    v6 = [v4 paymentSummaryItems];
    if ([v6 count] == 1)
    {
      v10 = [(PKPaymentDataItem *)self model];
      v11 = [v10 itemForType:9];
      LOBYTE(v9) = v11 == 0;
      goto LABEL_19;
    }
LABEL_17:
    LOBYTE(v9) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (v5 == 11)
  {
    v6 = [v4 paymentSummaryItems];
    if ([v6 count] == 1)
    {
      v10 = [v4 bankAccounts];
      if (![v10 count]) {
        goto LABEL_13;
      }
      v11 = [(PKPaymentDataItem *)self model];
      unint64_t v12 = [v11 itemForType:9];
      LOBYTE(v9) = v12 == 0;

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_22:

  return v9;
}

- (void).cxx_destruct
{
}

@end