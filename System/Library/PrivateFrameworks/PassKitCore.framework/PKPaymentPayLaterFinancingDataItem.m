@interface PKPaymentPayLaterFinancingDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)requiresBillingAddress;
- (PKPayLaterFinancingOption)previouslySelectedFinancingOption;
- (PKPayLaterFinancingOption)selectedFinancingOption;
- (PKPayLaterProductAssessmentCollection)assessmentCollection;
- (id)billingAddress;
- (id)errors;
- (id)paymentContactFormatErrors;
- (int64_t)context;
@end

@implementation PKPaymentPayLaterFinancingDataItem

+ (int64_t)dataType
{
  return 14;
}

- (int64_t)context
{
  return 2;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPaymentPayLaterFinancingDataItem *)self isValidWithError:a3 errorStatus:0];
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v7 = [(PKPaymentDataItem *)self model];
  v8 = [v7 financingController];
  uint64_t v9 = [v8 loadingState];

  if (a3 && v9 == 2)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v42[0] = *MEMORY[0x1E4F28568];
    v11 = PKLocalizedCocoonString(&cfstr_ApplyGenericEr.isa, 0);
    v43[0] = v11;
    v42[1] = *MEMORY[0x1E4F28588];
    v12 = PKLocalizedCocoonString(&cfstr_ApplyGenericEr_0.isa, 0);
    v43[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    *a3 = [v10 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v13];

    goto LABEL_4;
  }
  v15 = [(PKPaymentPayLaterFinancingDataItem *)self assessmentCollection];

  if (!v15)
  {
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v16 = [(PKPaymentPayLaterFinancingDataItem *)self selectedFinancingOption];
  if (v16)
  {
  }
  else
  {
    v26 = [(PKPaymentPayLaterFinancingDataItem *)self previouslySelectedFinancingOption];

    if (v26)
    {
      if (!a3)
      {
LABEL_5:
        int64_t v14 = 8;
        if (!a4) {
          return (char)a3;
        }
        goto LABEL_19;
      }
      v27 = [(PKPaymentDataItem *)self model];
      v28 = [v27 financingController];
      v29 = [(PKPaymentPayLaterFinancingDataItem *)self previouslySelectedFinancingOption];
      v30 = objc_msgSend(v28, "dynamicContentPageItemForPageType:productType:optionIdentifier:", 7, objc_msgSend(v29, "productType"), 0);

      v31 = [v30 errorTitle];
      v32 = v31;
      if (v31)
      {
        id v33 = v31;
      }
      else
      {
        PKLocalizedCocoonString(&cfstr_InAppPaymentPl.isa, 0);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;

      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28588];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v36;
      v41[0] = v34;
      v41[1] = v34;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      *a3 = [v35 errorWithDomain:@"PKPassKitErrorDomain" code:-2000 userInfo:v37];

LABEL_4:
      LOBYTE(a3) = 0;
      goto LABEL_5;
    }
  }
  v17 = [(PKPaymentPayLaterFinancingDataItem *)self selectedFinancingOption];

  if (a3 && !v17)
  {
LABEL_16:
    v21 = (void *)MEMORY[0x1E4F28C58];
    v38[0] = *MEMORY[0x1E4F28568];
    v22 = PKLocalizedCocoonString(&cfstr_InAppPaymentMi.isa, 0);
    v39[0] = v22;
    v38[1] = *MEMORY[0x1E4F28588];
    v23 = PKLocalizedCocoonString(&cfstr_InAppPaymentMi_0.isa, 0);
    v39[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    *a3 = [v21 errorWithDomain:@"PKPassKitErrorDomain" code:-3014 userInfo:v24];

    goto LABEL_17;
  }
  if (!v17)
  {
LABEL_17:
    LOBYTE(a3) = 0;
    goto LABEL_18;
  }
  if (![(PKPaymentPayLaterFinancingDataItem *)self requiresBillingAddress])
  {
    int64_t v14 = 1;
    LOBYTE(a3) = 1;
    if (!a4) {
      return (char)a3;
    }
    goto LABEL_19;
  }
  v18 = objc_opt_class();
  v19 = [(PKPaymentDataItem *)self model];
  v20 = [v19 billingAddress];
  LOBYTE(a3) = [v18 validateBillingAddressForItem:self billingAddress:v20 outError:a3];

LABEL_18:
  int64_t v14 = 1;
  if (a4) {
LABEL_19:
  }
    *a4 = v14;
  return (char)a3;
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 selectedFinancingOption];

  return (PKPayLaterFinancingOption *)v3;
}

- (PKPayLaterFinancingOption)previouslySelectedFinancingOption
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 previouslySelectedFinancingOption];

  return (PKPayLaterFinancingOption *)v3;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 assessmentCollection];

  return (PKPayLaterProductAssessmentCollection *)v3;
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

@end