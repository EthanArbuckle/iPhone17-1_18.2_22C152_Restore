@interface PKDemoTransactionGenerator
+ (id)_recordSpecificKeysForConfiguration:(id)a3;
+ (id)allMerchants;
+ (id)allPeople;
+ (id)demoMerchantForType:(int64_t)a3;
+ (id)itemIdentifierForAccountUser:(id)a3;
+ (id)itemIdentifierForPass:(id)a3;
+ (int64_t)randomDemoMerchant;
+ (void)demoTransactionsAndEventsForItemIdentifier:(id)a3 configuration:(id)a4 transactions:(id *)a5 events:(id *)a6;
+ (void)demoTransactionsAndEventsWithConfiguration:(id)a3 transactions:(id *)a4 events:(id *)a5;
+ (void)generateDemoFilesForPasses:(id)a3 accountUsers:(id)a4 peerPaymentPassSerialNumber:(id)a5;
+ (void)generateDemoFilesWithCompletion:(id)a3;
+ (void)insertTransactionAndEventsWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation PKDemoTransactionGenerator

+ (void)generateDemoFilesWithCompletion:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  v3 = +[PKPassLibrary sharedInstance];
  v4 = [v3 passesOfType:1];
  v5 = [v3 peerPaymentPassUniqueID];
  v34 = v3;
  v6 = [v3 passWithUniqueID:v5];
  v7 = [v6 paymentPass];

  v33 = v7;
  v30 = [v7 serialNumber];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v15 = [v14 associatedAccountServiceAccountIdentifier];

        if (v15)
        {
          v16 = [v14 associatedAccountServiceAccountIdentifier];
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v11);
  }
  v29 = v9;

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v18 = dispatch_group_create();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v8;
  uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        dispatch_group_enter(v18);
        v24 = +[PKAccountService sharedInstance];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke;
        v42[3] = &unk_1E56F2B80;
        id v43 = v17;
        v44 = v18;
        [v24 accountUsersForAccountWithIdentifier:v23 completion:v42];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v20);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_3;
  block[3] = &unk_1E56E43A8;
  id v37 = v29;
  id v38 = v17;
  id v39 = v30;
  id v40 = v31;
  id v41 = a1;
  id v25 = v31;
  id v26 = v30;
  id v27 = v17;
  id v28 = v29;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], block);
}

void __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8AB8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) unionSet:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

uint64_t __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)[*(id *)(a1 + 40) copy];
  [v2 generateDemoFilesForPasses:v3 accountUsers:v4 peerPaymentPassSerialNumber:*(void *)(a1 + 48)];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

+ (void)generateDemoFilesForPasses:(id)a3 accountUsers:(id)a4 peerPaymentPassSerialNumber:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  obunint64_t j = a3;
  id v48 = a4;
  id v50 = a5;
  uint64_t v8 = _demoDirectory();
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v9 removeItemAtPath:v8 error:0];

  uint64_t v10 = (void *)v8;
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:0];

  for (unint64_t i = 0; i != 18; ++i)
  {
    v13 = PKDemoMerchantToString(i);
    v14 = _demoMerchantToDictionary(i);
    v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v14 options:1 error:0];
    v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
    id v17 = [NSString stringWithFormat:@"%@.json", v13];
    v18 = [v10 stringByAppendingPathComponent:v17];

    [v16 writeToFile:v18 atomically:1 encoding:4 error:0];
  }
  long long v49 = v10;
  for (unint64_t j = 0; j != 10; ++j)
  {
    if (j > 9) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = off_1E56F2EA0[j];
    }
    uint64_t v21 = _demoPersonToDictionary(j);
    v22 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v21 options:1 error:0];
    uint64_t v23 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
    v24 = [NSString stringWithFormat:@"%@.json", v20];
    id v25 = [v10 stringByAppendingPathComponent:v24];

    [v23 writeToFile:v25 atomically:1 encoding:4 error:0];
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obja = obj;
  uint64_t v27 = [obja countByEnumeratingWithState:&v57 objects:v62 count:16];
  id v28 = v50;
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(obja);
        }
        v32 = *(void **)(*((void *)&v57 + 1) + 8 * k);
        if (([v32 isAppleBalancePass] & 1) == 0)
        {
          id v33 = [v32 serialNumber];
          id v34 = v28;
          if (v33 == v34)
          {
            int v35 = 1;
          }
          else
          {
            int v35 = 0;
            if (v28 && v33) {
              int v35 = [v33 isEqualToString:v34];
            }
          }

          v36 = [a1 itemIdentifierForPass:v32];
          id v37 = _demoTransactionArrayForItemIdentifier(v36, v35);
          [v26 addObjectsFromArray:v37];

          id v28 = v50;
        }
      }
      uint64_t v29 = [obja countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v29);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v38 = v48;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        id v43 = [a1 itemIdentifierForAccountUser:*(void *)(*((void *)&v53 + 1) + 8 * m)];
        v44 = _demoTransactionArrayForItemIdentifier(v43, 0);
        [v26 addObjectsFromArray:v44];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v40);
  }

  long long v45 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v26 options:1 error:0];
  long long v46 = (void *)[[NSString alloc] initWithData:v45 encoding:4];
  long long v47 = [v49 stringByAppendingPathComponent:@"StoreDemoTransactions.json"];
  [v46 writeToFile:v47 atomically:1 encoding:4 error:0];
}

+ (id)demoMerchantForType:(int64_t)a3
{
  uint64_t v3 = _demoMerchantToDictionary(a3);
  id v4 = _merchantFromDictionary(v3);

  return v4;
}

+ (void)demoTransactionsAndEventsForItemIdentifier:(id)a3 configuration:(id)a4 transactions:(id *)a5 events:(id *)a6
{
  v73[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = v12;
  if (v9)
  {
    long long v46 = a5;
    long long v47 = a6;
    id v48 = v11;
    long long v51 = v12;
    id v52 = v9;
    uint64_t v14 = _demoDirectory();
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v50 = (void *)v14;
    id v17 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
    uint64_t v18 = *MEMORY[0x1E4F1C628];
    v73[0] = *MEMORY[0x1E4F1C5F8];
    v73[1] = v18;
    v73[2] = *MEMORY[0x1E4F1C680];
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    uint64_t v20 = [v16 enumeratorAtURL:v17 includingPropertiesForKeys:v19 options:0 errorHandler:0];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obunint64_t j = v20;
    uint64_t v21 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
    long long v53 = v15;
    if (v21)
    {
      uint64_t v22 = v21;
      long long v54 = 0;
      uint64_t v23 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v69 != v23) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          id v26 = [v25 lastPathComponent];
          uint64_t v27 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v25];
          id v67 = 0;
          id v28 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v27 options:0 error:&v67];
          id v29 = v67;
          if (v26)
          {
            if ([v26 isEqual:@"StoreDemoTransactions.json"])
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v30 = v28;

                long long v54 = v30;
                id v15 = v53;
              }
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v15 setObject:v28 forKeyedSubscript:v26];
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v22);
    }
    else
    {
      long long v54 = 0;
    }

    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke;
    v63[3] = &unk_1E56F2BA8;
    id v34 = v33;
    id v64 = v34;
    id v35 = v31;
    id v65 = v35;
    id v36 = v32;
    id v37 = v15;
    id v38 = v36;
    id v66 = v36;
    [v37 enumerateKeysAndObjectsUsingBlock:v63];
    id v9 = v52;
    uint64_t v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"itemIdentifier == %@", v52];
    uint64_t v40 = [v54 filteredArrayUsingPredicate:v39];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke_2;
    v56[3] = &unk_1E56F2BD0;
    id v57 = v10;
    id v58 = v34;
    id v59 = v38;
    id v60 = v35;
    v13 = v51;
    id v41 = v51;
    id v61 = v41;
    id v62 = v48;
    id v42 = v48;
    id v49 = v35;
    id v43 = v38;
    id v44 = v34;
    [v40 enumerateObjectsUsingBlock:v56];
    long long v45 = _removeFutureTransactionsFromTransaction(v42);

    id v11 = (id)[v45 mutableCopy];
    if (v46) {
      *long long v46 = v11;
    }
    if (v47) {
      *long long v47 = v41;
    }
  }
}

void __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke(id *a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = [v9 objectForKeyedSubscript:@"counterpartHandle"];
  id v7 = [v5 stringByDeletingPathExtension];

  if (v6)
  {
    [a1[4] setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v8 = _merchantFromDictionary(v9);
    [a1[5] setObject:v8 forKeyedSubscript:v7];
    [a1[6] setObject:v9 forKeyedSubscript:v7];
  }
}

void __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke_2(void **a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F28C28];
  id v5 = [v3 objectForKeyedSubscript:@"amount"];
  id v6 = [v4 decimalNumberWithString:v5];

  id v7 = [v3 objectForKeyedSubscript:@"currencyCode"];
  uint64_t v8 = _dateFormatter();
  id v9 = [v3 objectForKeyedSubscript:@"date"];
  id v10 = [v8 dateFromString:v9];

  id v11 = _commonTransactionForAmount(v6, v7, v10, a1[4]);
  id v12 = [v3 objectForKeyedSubscript:@"counterpartIdentifier"];
  if (v12)
  {
    v13 = [a1[5] objectForKeyedSubscript:v12];
    _updateTransactionWithCounterpartData(v11, v13);
  }
  else
  {
    v13 = [v3 objectForKeyedSubscript:@"merchantIdentifier"];
    uint64_t v18 = [a1[6] objectForKeyedSubscript:v13];
    uint64_t v14 = [a1[7] objectForKeyedSubscript:v13];
    id v15 = a1[4];
    id v19 = 0;
    _updateTransactionWithMerchantData(v11, v18, v14, v15, &v19);
    v16 = v6;
    id v17 = v19;
    [a1[8] safelyAddObject:v17];

    id v6 = v16;
  }

  [a1[9] addObject:v11];
}

+ (void)demoTransactionsAndEventsWithConfiguration:(id)a3 transactions:(id *)a4 events:(id *)a5
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v5 transactionCount];
  unint64_t v8 = [v5 demoPerson];
  uint64_t v9 = [v5 demoMerchant];
  if (v7 >= 1)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E4F28000uLL;
    while (1)
    {
      id v12 = [*(id *)(v11 + 3112) decimalNumberWithMantissa:arc4random_uniform(0x2710u) exponent:4294967294 isNegative:0];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = _commonTransactionForAmount(v12, @"USD", v13, v5);
      if ((v8 & 0x8000000000000000) == 0) {
        break;
      }
      if ((v10 & 0x8000000000000000) == 0)
      {
        id v15 = _demoMerchantToDictionary(v10);
        id v26 = _merchantFromDictionary(v15);
        id v27 = 0;
        _updateTransactionWithMerchantData(v14, v15, v26, v5, &v27);
        unint64_t v16 = v8;
        id v17 = v5;
        id v18 = v6;
        uint64_t v19 = v10;
        id v20 = v27;
        [v25 safelyAddObject:v20];

        uint64_t v10 = v19;
        id v6 = v18;
        id v5 = v17;
        unint64_t v8 = v16;
        unint64_t v11 = 0x1E4F28000;

        goto LABEL_7;
      }
LABEL_8:
      [v6 safelyAddObject:v14];

      if (!--v7) {
        goto LABEL_9;
      }
    }
    id v15 = _demoPersonToDictionary(v8);
    _updateTransactionWithCounterpartData(v14, v15);
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:
  uint64_t v21 = _removeFutureTransactionsFromTransaction(v6);
  uint64_t v22 = (void *)[v21 mutableCopy];

  if (a4) {
    *a4 = v22;
  }
  if (a5) {
    *a5 = v25;
  }
}

+ (id)itemIdentifierForPass:(id)a3
{
  id v3 = [a3 paymentPass];
  id v4 = [v3 serialNumber];

  return v4;
}

+ (id)itemIdentifierForAccountUser:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 accountIdentifier];
  id v6 = [v4 altDSID];

  uint64_t v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return v7;
}

+ (id)allMerchants
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; i != 18; ++i)
  {
    id v4 = PKDemoMerchantToString(i);
    [v2 addObject:v4];
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

+ (id)allPeople
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; i != 10; ++i)
  {
    if (i > 9) {
      id v4 = 0;
    }
    else {
      id v4 = off_1E56F2EA0[i];
    }
    [v2 addObject:v4];
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

+ (void)insertTransactionAndEventsWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  uint64_t v7 = objc_alloc_init(PKPaymentService);
  id v50 = objc_alloc_init(PKCloudStoreService);
  if ([v6 codingType]) {
    uint64_t v8 = [v6 codingType];
  }
  else {
    uint64_t v8 = 2;
  }
  dispatch_group_t v9 = dispatch_group_create();
  uint64_t v10 = [v6 transactions];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke;
  v70[3] = &unk_1E56F2C20;
  unint64_t v11 = v9;
  long long v71 = v11;
  id v12 = v6;
  id v72 = v12;
  long long v47 = v7;
  v73 = v47;
  [v10 enumerateObjectsUsingBlock:v70];
  id v49 = [v12 accountEvents];
  long long v51 = v12;
  if ([v49 count])
  {
    v13 = objc_alloc_init(PKAccountService);
    uint64_t v14 = [v12 accountIdentifier];
    id v15 = v14;
    long long v45 = v10;
    id v46 = a1;
    if (v14)
    {
      id v16 = v14;
      id v17 = v49;
    }
    else
    {
      id v17 = v49;
      id v18 = [v49 firstObject];
      id v16 = [v18 accountIdentifier];
    }
    dispatch_group_enter(v11);
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_3;
    v68[3] = &unk_1E56DB8E8;
    id v20 = v11;
    long long v69 = v20;
    id v43 = v16;
    id v44 = v13;
    [(PKAccountService *)v13 insertEvents:v19 withAccountidentifier:v16 completion:v68];

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [[PKCloudStoreUploadItemConfiguration alloc] initWithItem:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          [(PKCloudStoreUploadItemConfiguration *)v27 setCodingType:v8];
          [v21 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v24);
    }

    dispatch_group_enter(v20);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_4;
    v62[3] = &unk_1E56F2C48;
    uint64_t v63 = v20;
    [(PKCloudStoreService *)v50 updateCloudStoreWithLocalItemsWithConfigurations:v21 completion:v62];

    id v12 = v51;
    uint64_t v10 = v45;
    a1 = v46;
  }
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v29 = [a1 _recordSpecificKeysForConfiguration:v12];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v30 = v10;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v59 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [[PKCloudStoreUploadItemConfiguration alloc] initWithItem:*(void *)(*((void *)&v58 + 1) + 8 * j) recordSpecificKeys:v29];
        [(PKCloudStoreUploadItemConfiguration *)v35 setCodingType:v8];
        [v28 addObject:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v32);
  }

  dispatch_group_enter(v11);
  if ((unint64_t)[v30 count] <= 0x32) {
    int64_t v36 = 1000000000;
  }
  else {
    int64_t v36 = 10;
  }
  dispatch_time_t v37 = dispatch_time(0, v36);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_5;
  block[3] = &unk_1E56D8AB8;
  long long v55 = v50;
  id v56 = v28;
  id v57 = v11;
  id v38 = v11;
  id v39 = v28;
  uint64_t v40 = v50;
  id v41 = MEMORY[0x1E4F14428];
  dispatch_after(v37, MEMORY[0x1E4F14428], block);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_7;
  v52[3] = &unk_1E56D8360;
  id v53 = v48;
  id v42 = v48;
  dispatch_group_notify(v38, v41, v52);
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) transactionSourceIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 transactionSourceIdentifier];
  }
  uint64_t v7 = v6;

  uint64_t v8 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_2;
  v9[3] = &unk_1E56F2BF8;
  id v10 = *(id *)(a1 + 32);
  [v8 insertOrUpdatePaymentTransaction:v3 forTransactionSourceIdentifier:v7 completion:v9];
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_4(uint64_t a1)
{
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_6;
  v3[3] = &unk_1E56F2C48;
  id v4 = *(id *)(a1 + 48);
  [v1 updateCloudStoreWithLocalItemsWithConfigurations:v2 completion:v3];
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_6(uint64_t a1)
{
}

uint64_t __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)_recordSpecificKeysForConfiguration:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 paymentPass];
  uint64_t v7 = [v4 accountIdentifier];
  unint64_t v8 = [v4 accountType];

  dispatch_group_t v9 = [v6 serialNumber];
  id v10 = [v6 passTypeIdentifier];
  unint64_t v11 = [v6 primaryAccountIdentifier];
  id v12 = [v6 devicePrimaryPaymentApplication];
  v13 = [v12 dpanIdentifier];

  uint64_t v14 = +[PKSecureElement primarySecureElementIdentifier];
  if (!v7)
  {
    if ([v6 hasAssociatedPeerPaymentAccount])
    {
      id v15 = +[PKPeerPaymentService sharedInstance];
      id v16 = [v15 account];
      uint64_t v7 = [v16 identifier];

      unint64_t v8 = 1;
    }
    else
    {
      uint64_t v7 = [v6 associatedAccountServiceAccountIdentifier];

      if (v7)
      {
        uint64_t v7 = [v6 associatedAccountServiceAccountIdentifier];
        unint64_t v8 = 2;
      }
    }
  }
  if ([v7 length])
  {
    id v17 = &PKCloudTransactionAccountIdentifierKey;
    id v18 = v7;
LABEL_12:
    [v5 setObject:v18 forKey:*v17];
    goto LABEL_13;
  }
  if ([v9 length]) {
    [v5 setObject:v9 forKey:@"passSerialNumber"];
  }
  if ([v10 length])
  {
    id v17 = &PKCloudTransactionPassTypeIdentifierKey;
    id v18 = v10;
    goto LABEL_12;
  }
LABEL_13:
  if ([v11 length]) {
    [v5 setObject:v11 forKey:@"fpanIdentifier"];
  }
  if ([v13 length]) {
    [v5 setObject:v13 forKey:@"dpanIdentifier"];
  }
  if (v14) {
    [v5 setObject:v14 forKey:@"originDeviceID"];
  }
  uint64_t v19 = PKPaymentTransactionAccountTypeToString(v8);
  [v5 setObject:v19 forKey:@"feature"];

  [v5 setObject:&unk_1EE22C560 forKey:@"cloudVersion"];
  id v20 = (void *)[v5 copy];

  return v20;
}

+ (int64_t)randomDemoMerchant
{
  return arc4random() % 0x12;
}

@end