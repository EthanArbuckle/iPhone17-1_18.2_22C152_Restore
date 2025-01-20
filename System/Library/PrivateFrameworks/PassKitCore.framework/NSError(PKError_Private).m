@interface NSError(PKError_Private)
- (id)pk_paymentErrorWithLocalizedDescription;
@end

@implementation NSError(PKError_Private)

- (id)pk_paymentErrorWithLocalizedDescription
{
  v2 = [a1 domain];
  if (([v2 isEqualToString:@"PKPaymentErrorDomain"] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v3 = [a1 localizedDescription];
  if (!v3)
  {

    goto LABEL_8;
  }
  v4 = (void *)v3;
  v5 = [a1 localizedDescription];
  uint64_t v6 = [v5 length];

  if (v6)
  {
LABEL_6:
    id v7 = a1;
    goto LABEL_34;
  }
LABEL_8:
  v8 = [a1 userInfo];
  v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [a1 code] - 1;
  v11 = @"IN_APP_PAYMENT_COUPON_CODE_INVALID";
  switch(v10)
  {
    case 0:
    case 1:
      if ([a1 code] == 2
        && ([v9 objectForKey:@"PKPaymentErrorContactField"],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        v14 = &PKContactFieldPostalAddress;
      }
      else
      {
        v13 = [v9 objectForKey:@"PKPaymentErrorContactField"];

        if (v13) {
          goto LABEL_19;
        }
        v14 = (const PKContactField *)&PKContactFieldContactInfo;
      }
      [v9 setObject:*v14 forKey:@"PKPaymentErrorContactField"];
LABEL_19:
      v16 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v17 = [v16 isEqualToString:@"phone"];

      if (v17)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_PHONE";
        goto LABEL_31;
      }
      v18 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v19 = [v18 isEqualToString:@"email"];

      if (v19)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_EMAIL";
        goto LABEL_31;
      }
      v20 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v21 = [v20 isEqualToString:@"post"];

      if (v21)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_ADDRESS";
        goto LABEL_31;
      }
      v22 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v23 = [v22 isEqualToString:@"name"];

      if (v23)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_NAME";
        goto LABEL_31;
      }
      v24 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v25 = [v24 isEqualToString:@"phoneticName"];

      if (v25)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_PHONETIC_NAME";
        goto LABEL_31;
      }
      v26 = [v9 objectForKey:@"PKPaymentErrorContactField"];
      char v27 = [v26 isEqualToString:@"contactInfo"];

      if (v27)
      {
        v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_CONTACT";
        goto LABEL_31;
      }
LABEL_33:
      v30 = (void *)MEMORY[0x1E4F28C58];
      v31 = [a1 domain];
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, objc_msgSend(a1, "code"), v9);
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      v15 = [v9 objectForKey:@"PKPaymentErrorContactField"];

      if (!v15) {
        [v9 setObject:@"post" forKey:@"PKPaymentErrorContactField"];
      }
      v11 = @"IN_APP_PAYMENT_CONTACT_ITEM_ADDRESS_UNSUPPORTED";
      goto LABEL_31;
    case 3:
      goto LABEL_31;
    case 4:
      v11 = @"IN_APP_PAYMENT_COUPON_CODE_EXPIRED";
LABEL_31:
      uint64_t v28 = PKLocalizedPaymentString(&v11->isa, 0);
      if (v28)
      {
        v29 = (void *)v28;
        [v9 setObject:v28 forKey:*MEMORY[0x1E4F28568]];
      }
      goto LABEL_33;
    default:
      goto LABEL_33;
  }
LABEL_34:
  return v7;
}

@end