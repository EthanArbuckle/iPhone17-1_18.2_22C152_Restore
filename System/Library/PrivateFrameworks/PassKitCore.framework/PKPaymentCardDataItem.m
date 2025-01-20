@interface PKPaymentCardDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)requiresBillingAddress;
- (BOOL)shouldShowCardArt;
- (BOOL)showPeerPaymentBalance;
- (CNContact)billingAddress;
- (PKCurrencyAmount)peerPaymentBalance;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)pass;
- (id)errors;
- (id)paymentContactFormatErrors;
- (int64_t)context;
- (int64_t)status;
- (void)setPeerPaymentBalance:(id)a3;
- (void)setShowPeerPaymentBalance:(BOOL)a3;
@end

@implementation PKPaymentCardDataItem

+ (int64_t)dataType
{
  return 3;
}

- (int64_t)context
{
  return 1;
}

- (id)errors
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"post";
  v9[1] = @"name";
  v9[2] = @"phoneticName";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v5 = [(PKPaymentDataItem *)self model];
  v6 = [v5 paymentErrors];
  v7 = objc_msgSend(v3, "pk_FilteredBillingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (id)paymentContactFormatErrors
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"post";
  v9[1] = @"name";
  v9[2] = @"phoneticName";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v5 = [(PKPaymentDataItem *)self model];
  v6 = [v5 paymentContactFormatErrors];
  v7 = objc_msgSend(v3, "pk_FilteredBillingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (PKPaymentPass)pass
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 pass];

  return (PKPaymentPass *)v3;
}

- (PKPaymentApplication)paymentApplication
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentApplication];

  return (PKPaymentApplication *)v3;
}

- (CNContact)billingAddress
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 billingAddress];

  return (CNContact *)v3;
}

- (BOOL)requiresBillingAddress
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentRequest];
  v4 = [v3 requiredBillingContactFields];
  char v5 = [v4 containsObject:@"post"];

  return v5;
}

- (int64_t)status
{
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [(PKPaymentCardDataItem *)self pass];
  int64_t v5 = [v3 _statusForPass:v4];

  return v5;
}

- (BOOL)shouldShowCardArt
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentRequest];

  if (![v3 isPeerPaymentRequest]) {
    goto LABEL_4;
  }
  v4 = [v3 peerPaymentRequest];
  int64_t v5 = [v4 peerPaymentQuote];
  v6 = [v5 firstQuoteItemOfType:4];

  if (v6) {
    BOOL v7 = 0;
  }
  else {
LABEL_4:
  }
    BOOL v7 = 1;

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(PKPaymentCardDataItem *)self pass];
  if (v5)
  {
  }
  else
  {
    v6 = [(PKPaymentDataItem *)self model];
    int v7 = [v6 supportsEmptyPass];

    if (v7)
    {
      if (a3)
      {
        v8 = [(PKPaymentDataItem *)self model];
        v9 = [v8 unavailablePasses];
        v10 = objc_msgSend(v9, "pk_firstObjectPassingTest:", &__block_literal_global_12);

        if (v10) {
          uint64_t v11 = -3013;
        }
        else {
          uint64_t v11 = -3012;
        }
        if (v10) {
          v12 = @"IN_APP_PAYMENT_ERROR_TRY_DIFFERENT_PAYMENT_CARD";
        }
        else {
          v12 = @"IN_APP_PAYMENT_ERROR_ADD_PAYMENT_CARD";
        }
        v13 = PKLocalizedPaymentString(&v12->isa, 0);
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F28588];
        v34[0] = *MEMORY[0x1E4F28568];
        v34[1] = v15;
        v35[0] = v13;
        v35[1] = v13;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
        *a3 = [v14 errorWithDomain:@"PKPassKitErrorDomain" code:v11 userInfo:v16];

        goto LABEL_18;
      }
      return 0;
    }
  }
  if ([(PKPaymentCardDataItem *)self requiresBillingAddress])
  {
    v17 = objc_opt_class();
    v18 = [(PKPaymentDataItem *)self model];
    v19 = [v18 billingAddress];
    char v20 = [v17 validateBillingAddressForItem:self billingAddress:v19 outError:a3];
  }
  else
  {
    char v20 = 1;
  }
  if ([(PKPaymentCardDataItem *)self status] == 4)
  {
    if (a3)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      v32[0] = *MEMORY[0x1E4F28568];
      v10 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_5.isa, 0);
      v33[0] = v10;
      v32[1] = *MEMORY[0x1E4F28588];
      v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_6.isa, 0);
      v33[1] = v13;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      *a3 = [v21 errorWithDomain:@"PKPassKitErrorDomain" code:-3001 userInfo:v22];

      goto LABEL_18;
    }
    return 0;
  }
  if ([(PKPaymentCardDataItem *)self status] == 5)
  {
    v23 = [(PKPaymentDataItem *)self model];
    v24 = [v23 pass];
    int v25 = [v24 hasAssociatedPeerPaymentAccount];

    if (v25)
    {
      uint64_t v26 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr.isa, 0);
      v10 = (void *)v26;
      if (!a3) {
        goto LABEL_19;
      }
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28588];
      v30[0] = *MEMORY[0x1E4F28568];
      v30[1] = v28;
      v31[0] = v26;
      v31[1] = v26;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
      *a3 = [v27 errorWithDomain:@"PKPassKitErrorDomain" code:-3009 userInfo:v13];
LABEL_18:

LABEL_19:
      return 0;
    }
  }
  return v20;
}

BOOL __42__PKPaymentCardDataItem_isValidWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasAssociatedPeerPaymentAccount])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 deviceInAppPaymentApplications];
    BOOL v3 = [v4 count] != 0;
  }
  return v3;
}

- (BOOL)showPeerPaymentBalance
{
  return self->_showPeerPaymentBalance;
}

- (void)setShowPeerPaymentBalance:(BOOL)a3
{
  self->_showPeerPaymentBalance = a3;
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end