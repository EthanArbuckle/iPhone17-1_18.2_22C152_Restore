@interface NSArray
@end

@implementation NSArray

uint64_t __55__NSArray_PKArrayAdditions__pk_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__NSArray_PKArrayAdditions__pk_createArrayByRemovingObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__NSArray_PKArrayAdditions__pk_countObjectsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __58__NSArray_PKArrayAdditions__pk_containsObjectPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

void __68__NSArray_PKError__pk_FilteredBillingErrorsForContactFields_errors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:@"PKPaymentErrorDomain"])
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v5 = [v3 code];

  if (v5 == 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v16 = a1;
    id v4 = *(id *)(a1 + 32);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v11 = [v3 userInfo];
          v12 = [v11 objectForKey:@"PKPaymentErrorContactField"];
          if ([v12 isEqualToString:v10])
          {

LABEL_14:
            [*(id *)(v16 + 40) addObject:v3];
            goto LABEL_15;
          }
          v13 = [v3 userInfo];
          v14 = [v13 objectForKey:@"PKPaymentErrorPostalAddress"];
          int v15 = [v14 isEqualToString:v10];

          if (v15) {
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    goto LABEL_15;
  }
LABEL_16:
}

void __90__NSArray_PKError__pk_FilteredShippingErrorsForContactFields_errors_contactFieldOptional___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"PKPaymentErrorDomain"];

  if (!v5)
  {
    v12 = [v3 domain];
    int v13 = [v12 isEqualToString:@"PKDisbursementErrorDomain"];

    if (!v13 || [v3 code] != 2) {
      goto LABEL_41;
    }
    v14 = [v3 userInfo];
    id v7 = [v14 objectForKey:@"PKDisbursementErrorContactField"];

    if (*(unsigned char *)(a1 + 48) && !v7) {
      goto LABEL_28;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
LABEL_19:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend(v7, "isEqualToString:", *(void *)(*((void *)&v25 + 1) + 8 * v19), (void)v25))goto LABEL_38; {
        if (v17 == ++v19)
        }
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v17) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v6 = [v3 code];
  if (v6 == 1)
  {
    long long v20 = [v3 userInfo];
    id v7 = [v20 objectForKey:@"PKPaymentErrorContactField"];

    if (*(unsigned char *)(a1 + 48) && !v7) {
      goto LABEL_28;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v21 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
LABEL_31:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v15);
        }
        if ([v7 isEqualToString:*(void *)(*((void *)&v29 + 1) + 8 * v24)]) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v22) {
            goto LABEL_31;
          }
          goto LABEL_39;
        }
      }
LABEL_38:
      [*(id *)(a1 + 40) addObject:v3];
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (v6 == 3)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (!v8)
    {
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v7);
      }
      if ([*(id *)(*((void *)&v33 + 1) + 8 * v11) isEqualToString:@"post"]) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v9) {
          goto LABEL_6;
        }
        goto LABEL_40;
      }
    }
LABEL_28:
    [*(id *)(a1 + 40) addObject:v3];
    goto LABEL_40;
  }
LABEL_41:
}

void __42__NSArray_PKError__pk_FilteredCardErrors___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 domain];
  int v4 = [v3 isEqualToString:@"PKPaymentErrorDomain"];

  if (v4 && [v5 code] == -1001) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

id __57__NSArray_PKEnhancedMerchantAdditions__deepCopyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];
  return v2;
}

id __73__NSArray_PKEnhancedMerchantAdditions__nonZeroUnsignedLongLongArrayValue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 nonZeroUnsignedLongLongNSNumberValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      if ([v4 unsignedLongLongValue]) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
      id v3 = v5;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

id __56__NSArray_PKEnhancedMerchantAdditions__stringArrayValue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

@end