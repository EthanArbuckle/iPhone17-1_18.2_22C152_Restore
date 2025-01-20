@interface PKPaymentShippingContactDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)email;
- (NSString)name;
- (NSString)phone;
- (id)errors;
- (id)errorsForContactFields:(id)a3;
- (id)paymentContactFormatErrors;
- (id)requiredContactFields;
- (int64_t)context;
@end

@implementation PKPaymentShippingContactDataItem

+ (int64_t)dataType
{
  return 7;
}

- (int64_t)context
{
  return 3;
}

- (id)errors
{
  v3 = [(PKPaymentShippingContactDataItem *)self requiredContactFields];
  v4 = [v3 arrayByAddingObject:@"contactInfo"];

  v5 = [(PKPaymentShippingContactDataItem *)self errorsForContactFields:v4];

  return v5;
}

- (id)requiredContactFields
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [v3 paymentRequest];
  v5 = [v4 requiredShippingContactFields];
  v6 = [v5 allObjects];

  v7 = [(PKPaymentDataItem *)self model];
  v8 = [v7 paymentRequest];
  int v9 = [v8 isShippingEditable];

  if ([v6 containsObject:@"post"])
  {
    v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"post"];
    if (v9)
    {
      v14[0] = @"name";
      v14[1] = @"phoneticName";
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      [v10 addObjectsFromArray:v11];
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = objc_msgSend(v6, "pk_arrayByRemovingObjectsInArray:", v10);

  return v12;
}

- (id)errorsForContactFields:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [(PKPaymentDataItem *)self model];
  v7 = [v6 paymentErrors];
  v8 = objc_msgSend(v4, "pk_FilteredShippingErrorsForContactFields:errors:", v5, v7);

  return v8;
}

- (id)paymentContactFormatErrors
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"phone";
  v9[1] = @"email";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v5 = [(PKPaymentDataItem *)self model];
  v6 = [v5 paymentContactFormatErrors];
  v7 = objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (NSString)email
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 shippingEmail];
  v4 = [v3 emailAddresses];
  id v5 = [v4 firstObject];

  v6 = [v5 value];

  return (NSString *)v6;
}

- (NSString)phone
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 shippingPhone];
  v4 = [v3 phoneNumbers];
  id v5 = [v4 firstObject];

  v6 = [v5 value];
  v7 = [v6 pkFormattedStringValue];

  return (NSString *)v7;
}

- (NSString)name
{
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [(PKPaymentDataItem *)self model];
  id v5 = [v4 paymentRequest];
  char v6 = [v5 isShippingEditable];

  v7 = [v3 paymentRequest];
  v8 = [v7 requiredShippingContactFields];
  int v9 = [v8 containsObject:@"post"];

  if (v9 && (v6 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = [v3 shippingName];
    v12 = [v3 paymentRequest];
    v13 = [v12 requiredShippingContactFields];
    int v14 = [v13 containsObject:@"phoneticName"];

    if (v14) {
      [v11 pkFullAndPhoneticName];
    }
    else {
    v10 = [v11 pkFullName];
    }
  }
  return (NSString *)v10;
}

- (BOOL)isValidWithError:(id *)a3
{
  v72[3] = *MEMORY[0x1E4F143B8];
  id v5 = [(PKPaymentDataItem *)self model];
  char v6 = [v5 paymentRequest];
  v69 = [v6 requiredShippingContactFields];

  v7 = [(PKPaymentShippingContactDataItem *)self errors];
  v63 = a3;
  if ([v7 count])
  {
    v8 = [(PKPaymentShippingContactDataItem *)self errors];
    int v9 = [v8 firstObject];

    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v10 = [(PKPaymentShippingContactDataItem *)self paymentContactFormatErrors];
  int v9 = [v10 firstObject];

LABEL_6:
  v11 = [(PKPaymentDataItem *)self model];
  v12 = [v11 paymentRequest];
  uint64_t v13 = [v12 requestType];

  int v14 = [v9 userInfo];
  v15 = v14;
  v16 = &PKDisbursementErrorContactFieldUserInfoKey;
  if (v13 != 10) {
    v16 = &PKPaymentErrorContactFieldUserInfoKey;
  }
  v70 = [v14 objectForKey:*v16];

  v17 = [(PKPaymentDataItem *)self model];
  v18 = [v17 shippingPhone];

  if (v18)
  {
    v19 = [v18 phoneNumbers];
    BOOL v64 = [v19 count] != 0;
  }
  else
  {
    BOOL v64 = 0;
  }
  v20 = [(PKPaymentDataItem *)self model];
  v21 = [v20 shippingEmail];

  v67 = v18;
  v68 = v9;
  v66 = v21;
  if (v21)
  {
    v22 = [v21 emailAddresses];
    BOOL v62 = [v22 count] != 0;
  }
  else
  {
    BOOL v62 = 0;
  }
  v23 = [(PKPaymentDataItem *)self model];
  v24 = [v23 shippingName];

  v25 = [v24 pkFullName];
  uint64_t v60 = [v25 length];

  v65 = v24;
  v26 = [v24 pkPhoneticName];
  uint64_t v58 = [v26 length];

  v27 = [(PKPaymentDataItem *)self model];
  v28 = [v27 paymentRequest];
  int v61 = [v28 isShippingEditable];

  LODWORD(v28) = [v70 isEqualToString:@"phone"];
  int v29 = [v69 containsObject:@"phone"];
  char v30 = [v70 isEqualToString:@"email"];
  int v31 = [v69 containsObject:@"email"];
  char v32 = [v70 isEqualToString:@"name"];
  int v59 = [v69 containsObject:@"name"];
  char v33 = [v70 isEqualToString:@"phoneticName"];
  char v34 = [v69 containsObject:@"phoneticName"];
  char v35 = v29;
  int v36 = [v69 containsObject:@"post"];
  if (v28 || ((v29 ^ 1 | v64) & 1) == 0)
  {
    uint64_t v39 = !v64;
    if (v64) {
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON";
    }
    else {
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON";
    }
    if (v64) {
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_INCOMPLETE";
    }
    else {
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_REQUIRED";
    }
    uint64_t v40 = -3004;
LABEL_36:
    v38 = v63;
    if (!v63)
    {
LABEL_38:
      BOOL v48 = 0;
      goto LABEL_39;
    }
LABEL_37:
    v43 = (void *)MEMORY[0x1E4F28C58];
    v71[0] = *MEMORY[0x1E4F28568];
    v44 = PKLocalizedPaymentString(&v41->isa, 0, v58);
    v72[0] = v44;
    v71[1] = *MEMORY[0x1E4F28588];
    v45 = PKLocalizedPaymentString(&v42->isa, 0);
    v72[1] = v45;
    v71[2] = @"PKPaymentErrorIsFieldEmpty";
    v46 = [NSNumber numberWithBool:v39];
    v72[2] = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
    id *v38 = [v43 errorWithDomain:@"PKPassKitErrorDomain" code:v40 userInfo:v47];

    goto LABEL_38;
  }
  if ((v30 & 1) != 0 || ((v31 ^ 1 | v62) & 1) == 0)
  {
    uint64_t v39 = !v62;
    if (v62) {
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON";
    }
    else {
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON";
    }
    if (v62) {
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_INCOMPLETE";
    }
    else {
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_REQUIRED";
    }
    uint64_t v40 = -3005;
    goto LABEL_36;
  }
  int v37 = v36 & v61;
  if (v32)
  {
    v38 = v63;
    if ((v37 & 1) == 0)
    {
      if (v60)
      {
LABEL_21:
        uint64_t v39 = 0;
        uint64_t v40 = -3006;
        v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_NAME_INCOMPLETE";
        goto LABEL_64;
      }
LABEL_55:
      uint64_t v40 = -3006;
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_NAME_REQUIRED";
      uint64_t v39 = 1;
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON";
      if (!v38) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    goto LABEL_48;
  }
  int v50 = v59 ^ 1;
  if (v60) {
    int v50 = 1;
  }
  v38 = v63;
  if (((v50 | v37) & 1) == 0) {
    goto LABEL_55;
  }
  if ((v33 & 1) == 0)
  {
    char v51 = v34 ^ 1;
    if (v58) {
      char v51 = 1;
    }
    LOBYTE(v37) = v51 | v37;
  }
  if ((v37 & 1) == 0)
  {
    v55 = [(PKPaymentDataItem *)self model];
    v56 = [v55 shippingName];
    v57 = [v56 pkPhoneticName];

    if (v57 && [v57 length])
    {
      uint64_t v39 = 0;
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_INCOMPLETE";
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON";
    }
    else
    {
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_REQUIRED";
      uint64_t v39 = 1;
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON";
    }

    uint64_t v40 = -3007;
    if (!v63) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_48:
  if ([(PKPaymentDataItem *)self isRejected]
    || ([v70 isEqualToString:@"contactInfo"] & 1) != 0
    || (v41 = 0, BOOL v48 = 1, v68) && !v70)
  {
    char v52 = v34;
    v53 = [(PKPaymentShippingContactDataItem *)self requiredContactFields];
    uint64_t v54 = [v53 count];

    if (v54 != 1)
    {
      v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON";
      PKLocalizedPaymentString(&cfstr_InAppPaymentSh_0.isa, 0);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = 0;
      uint64_t v40 = -3010;
      if (!v38) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    if (v35)
    {
      uint64_t v39 = 0;
      uint64_t v40 = -3004;
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_INCOMPLETE";
    }
    else if (v31)
    {
      uint64_t v39 = 0;
      uint64_t v40 = -3005;
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_INCOMPLETE";
    }
    else
    {
      if (v59) {
        goto LABEL_21;
      }
      if ((v52 & 1) == 0)
      {
        v41 = 0;
        BOOL v48 = 1;
        goto LABEL_39;
      }
      uint64_t v39 = 0;
      uint64_t v40 = -3007;
      v41 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_INCOMPLETE";
    }
LABEL_64:
    v42 = @"IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON";
    if (!v38) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_39:

  return v48;
}

@end