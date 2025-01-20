@interface NSArray(PKError)
+ (NSError)paymentBillingAddressInvalidErrorWithKey:()PKError localizedDescription:;
+ (NSError)paymentContactInvalidErrorWithContactField:()PKError localizedDescription:;
+ (NSError)paymentShippingAddressInvalidErrorWithKey:()PKError localizedDescription:;
+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:()PKError;
+ (id)pk_FilteredBillingErrorsForContactFields:()PKError errors:;
+ (id)pk_FilteredCardErrors:()PKError;
+ (id)pk_FilteredShippingErrorsForContactFields:()PKError errors:contactFieldOptional:;
+ (uint64_t)pk_FilteredShippingErrorsForContactFields:()PKError errors:;
@end

@implementation NSArray(PKError)

+ (NSError)paymentContactInvalidErrorWithContactField:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentContactInvalidErrorWithContactField:localizedDescription:](PKPaymentRequest, "paymentContactInvalidErrorWithContactField:localizedDescription:");
}

+ (NSError)paymentShippingAddressInvalidErrorWithKey:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentShippingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentShippingAddressInvalidErrorWithKey:localizedDescription:");
}

+ (NSError)paymentBillingAddressInvalidErrorWithKey:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:");
}

+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:()PKError
{
  return +[PKPaymentRequest paymentShippingAddressUnserviceableErrorWithLocalizedDescription:](PKPaymentRequest, "paymentShippingAddressUnserviceableErrorWithLocalizedDescription:");
}

+ (id)pk_FilteredBillingErrorsForContactFields:()PKError errors:
{
  id v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __68__NSArray_PKError__pk_FilteredBillingErrorsForContactFields_errors___block_invoke;
  v16 = &unk_1E56E7390;
  id v17 = v5;
  id v18 = v8;
  id v9 = v8;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:&v13];

  v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (uint64_t)pk_FilteredShippingErrorsForContactFields:()PKError errors:
{
  return objc_msgSend(a1, "pk_FilteredShippingErrorsForContactFields:errors:contactFieldOptional:", a3, a4, 0);
}

+ (id)pk_FilteredShippingErrorsForContactFields:()PKError errors:contactFieldOptional:
{
  id v7 = a3;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__NSArray_PKError__pk_FilteredShippingErrorsForContactFields_errors_contactFieldOptional___block_invoke;
  v15[3] = &unk_1E56E73B8;
  id v16 = v7;
  id v17 = v10;
  char v18 = a5;
  id v11 = v10;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:v15];

  uint64_t v13 = (void *)[v11 copy];
  return v13;
}

+ (id)pk_FilteredCardErrors:()PKError
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NSArray_PKError__pk_FilteredCardErrors___block_invoke;
  v9[3] = &unk_1E56E73E0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

@end