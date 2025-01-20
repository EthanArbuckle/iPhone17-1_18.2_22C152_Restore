@interface PKPaymentPaymentOfferDataItem
+ (int64_t)dataType;
- (BOOL)_loadingDetailsAreValid:(id)a3 error:(id *)a4 errorStatus:(int64_t *)a5;
- (BOOL)_selectedPaymentOfferIsValidWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)requiresBillingAddress;
- (PKSelectedPaymentOffer)selectedPaymentOffer;
- (id)_errorLoadingPaymentOffersWithUnderlyingError:(id)a3;
- (id)_noPaymentOfferSelectedError;
- (id)_selectedPaymentOfferInvalid;
- (id)billingAddress;
- (id)errors;
- (id)paymentContactFormatErrors;
- (int64_t)context;
@end

@implementation PKPaymentPaymentOfferDataItem

+ (int64_t)dataType
{
  return 17;
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPaymentPaymentOfferDataItem *)self isValidWithError:a3 errorStatus:0];
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  int64_t v18 = 1;
  v7 = [(PKPaymentDataItem *)self model];
  v8 = [v7 paymentOffersController];

  v9 = [(PKPaymentDataItem *)self model];
  uint64_t v10 = [v9 fundingMode];

  if (v10 != 2) {
    goto LABEL_7;
  }
  v11 = [v8 selectedOfferDetails];
  if (![v11 requiresUserAction])
  {
    BOOL v12 = [(PKPaymentPaymentOfferDataItem *)self _selectedPaymentOfferIsValidWithError:a3 errorStatus:&v18];

    if (!v12) {
      goto LABEL_10;
    }
LABEL_7:
    if ([(PKPaymentPaymentOfferDataItem *)self requiresBillingAddress])
    {
      v13 = objc_opt_class();
      v14 = [(PKPaymentDataItem *)self model];
      v15 = [v14 billingAddress];
      char v16 = [v13 validateBillingAddressForItem:self billingAddress:v15 outError:a3];

      if (!a4) {
        goto LABEL_12;
      }
    }
    else
    {
      char v16 = 1;
      if (!a4) {
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
  int64_t v18 = 13;
  if (a3)
  {
    *a3 = [(PKPaymentPaymentOfferDataItem *)self _selectedPaymentOfferInvalid];
  }

LABEL_10:
  char v16 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v18;
LABEL_12:

  return v16;
}

- (BOOL)_selectedPaymentOfferIsValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  v7 = [(PKPaymentPaymentOfferDataItem *)self selectedPaymentOffer];
  v8 = [(PKPaymentDataItem *)self model];
  uint64_t v9 = [v8 fundingMode];

  BOOL v10 = 1;
  if (v9 == 2 && v7)
  {
    int64_t v17 = 1;
    v11 = [(PKPaymentDataItem *)self model];
    BOOL v12 = [v11 paymentOffersController];

    v13 = [v7 criteriaIdentifier];
    v14 = [v7 passUniqueID];
    v15 = [v12 loadingDetailsForPaymentOffersForCriteriaIdentifier:v13 passUniqueID:v14];

    BOOL v10 = [(PKPaymentPaymentOfferDataItem *)self _loadingDetailsAreValid:v15 error:a3 errorStatus:&v17];
    if (a4) {
      *a4 = v17;
    }
  }
  return v10;
}

- (BOOL)_loadingDetailsAreValid:(id)a3 error:(id *)a4 errorStatus:(int64_t *)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (!v8)
  {
    BOOL v12 = 1;
    goto LABEL_14;
  }
  uint64_t v10 = [v8 state];
  if (!v10)
  {
    if (a4)
    {
      [(PKPaymentPaymentOfferDataItem *)self _noPaymentOfferSelectedError];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
    int64_t v13 = 10;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v10 == 1)
  {
    BOOL v12 = 0;
    int64_t v13 = 11;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v10 != 2)
  {
    int64_t v13 = 1;
    BOOL v12 = 1;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    v11 = [v9 error];
    *a4 = [(PKPaymentPaymentOfferDataItem *)self _errorLoadingPaymentOffersWithUnderlyingError:v11];
  }
  BOOL v12 = 0;
  int64_t v13 = 12;
  if (a5) {
LABEL_13:
  }
    *a5 = v13;
LABEL_14:

  return v12;
}

- (PKSelectedPaymentOffer)selectedPaymentOffer
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 selectedPaymentOffer];

  return (PKSelectedPaymentOffer *)v3;
}

- (BOOL)requiresBillingAddress
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentRequest];
  v4 = [v3 requiredBillingContactFields];
  char v5 = [v4 containsObject:@"post"];

  return v5;
}

- (id)billingAddress
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 billingAddress];

  return v3;
}

- (id)errors
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"post";
  v9[1] = @"name";
  v9[2] = @"phoneticName";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  char v5 = [(PKPaymentDataItem *)self model];
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
  char v5 = [(PKPaymentDataItem *)self model];
  v6 = [v5 paymentContactFormatErrors];
  v7 = objc_msgSend(v3, "pk_FilteredBillingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (id)_noPaymentOfferSelectedError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = PKLocalizedPaymentOffersString(&cfstr_InAppPaymentOf.isa, 0);
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28588];
  v8[0] = *MEMORY[0x1E4F28568];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v2;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v6 = [v3 errorWithDomain:@"PKPassKitErrorDomain" code:-9002 userInfo:v5];

  return v6;
}

- (id)_selectedPaymentOfferInvalid
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = PKLocalizedPaymentOffersString(&cfstr_InAppPaymentOf.isa, 0);
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28588];
  v8[0] = *MEMORY[0x1E4F28568];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v2;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v6 = [v3 errorWithDomain:@"PKPassKitErrorDomain" code:-9004 userInfo:v5];

  return v6;
}

- (id)_errorLoadingPaymentOffersWithUnderlyingError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKLocalizedPaymentOffersString(&cfstr_InAppPaymentOf_0.isa, 0);
  char v5 = v4;
  if (v3)
  {
    v6 = [v3 localizedFailureReason];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      PKTitleForDisplayableError(v3);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v8;

    uint64_t v10 = [v3 localizedRecoverySuggestion];
  }
  else
  {
    id v9 = v4;
    uint64_t v10 = 0;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  if (v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v5;
  }
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  [v11 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  int64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-9003 userInfo:v11];

  return v13;
}

@end