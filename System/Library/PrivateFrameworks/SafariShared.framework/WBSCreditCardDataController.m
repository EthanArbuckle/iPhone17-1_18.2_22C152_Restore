@interface WBSCreditCardDataController
+ (BOOL)hasCreditCardData;
+ (id)creditCardComparatorForSortingInSettings;
+ (void)hasCreditCardData;
- (BOOL)_shouldOfferVirtualCards;
- (BOOL)_shouldReplaceExistingCard:(id)a3 withImportedCard:(id)a4;
- (BOOL)authenticationRequiredForVirtualCard:(id)a3;
- (BOOL)hasUsedNonVirtualCard;
- (BOOL)isCreditCardDataSaved:(id)a3;
- (BOOL)shouldAddCardWithNumber:(id)a3;
- (BOOL)shouldNeverSaveCardWithNumber:(id)a3;
- (BOOL)test_shouldReplaceExistingCard:(id)a3 withImportedCard:(id)a4;
- (NSArray)creditCardData;
- (NSCache)artworkCache;
- (NSString)messageForUnavailableVirtualCardAlert;
- (NSString)titleForUnavailableVirtualCardAlert;
- (WBSCreditCardDataController)init;
- (id)_creditCardData;
- (id)_deduplicatedVirtualCardDataArray:(id)a3 andCreditCardDataArray:(id)a4;
- (id)_neverSavedCreditCardSuffixFromCard:(id)a3;
- (id)_neverSavedCreditCardSuffixFromCardNumber:(id)a3;
- (id)_uniqueCardNameForCardName:(id)a3;
- (id)_virtualCardDataFromPKVirtualCards:(id)a3;
- (id)defaultNameForCardOfType:(unint64_t)a3 cardholderName:(id)a4;
- (id)existingCardWithNumber:(id)a3;
- (id)fieldsToObscureWhenFillingCreditCard:(id)a3 formMetadata:(id)a4;
- (id)fieldsToObscureWhenFillingSingleCreditCardData:(id)a3 formFieldValues:(id)a4;
- (id)savableCreditCardDataInForm:(id)a3;
- (id)urlToListOfCardsInWallet;
- (unint64_t)numberOfCreditCardsToBeExported;
- (unint64_t)virtualCardFieldsToRequest;
- (void)_creditCardDataDidChange;
- (void)_removeNeverSaveCreditCardData:(id)a3;
- (void)_sortCreditCardDataArray:(id)a3;
- (void)clearCreditCardData;
- (void)exportCreditCardDataToFileWithURL:(id)a3;
- (void)finishWithCompletionHandler:(id)a3;
- (void)getCardDetailsForVirtualCards:(id)a3 externalizedContext:(id)a4 blockToUpdateCardDetails:(id)a5;
- (void)getCreditCardDataToFill:(id)a3 host:(id)a4 externalizedContext:(id)a5 completionHandler:(id)a6;
- (void)getCreditCardDataWithCompletionHandler:(id)a3;
- (void)getVirtualCardCredentialsWithExternalizedContext:(id)a3 shouldIncludeVPANCards:(BOOL)a4 completionHandler:(id)a5;
- (void)getVirtualCardsWithCompletionHandler:(id)a3;
- (void)importCreditCardDataWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8;
- (void)isVirtualCard:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4 completion:(id)a5;
- (void)markCreditCardDataAsMostRecentlyUsed:(id)a3;
- (void)neverSaveCreditCardData:(id)a3;
- (void)processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:(id)a3 blockToUpdateCardDetails:(id)a4;
- (void)removeCreditCardData:(id)a3;
- (void)replaceCreditCardData:(id)a3 withCard:(id)a4;
- (void)saveCreditCardData:(id)a3 completionHandler:(id)a4;
- (void)saveCreditCardDataIfAllowed:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)sendCardholderNameEnteredInFormToWalletIfNecessary:(id)a3 lastFilledVirtualCardData:(id)a4;
- (void)setArtworkCache:(id)a3;
- (void)setHasUsedNonVirtualCard;
- (void)tellWalletThatExistingCardWasFilledInForm:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4;
- (void)tellWalletThatNewCardWasSaved:(id)a3;
@end

@implementation WBSCreditCardDataController

- (WBSCreditCardDataController)init
{
  v24.receiver = self;
  v24.super_class = (Class)WBSCreditCardDataController;
  v2 = [(WBSCreditCardDataController *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SafariShared.WBSCreditCardDataController", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    creditCardDataKeychainReferences = v2->_creditCardDataKeychainReferences;
    v2->_creditCardDataKeychainReferences = (NSMapTable *)v6;

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v8 = (void *)getPKVirtualCardManagerClass(void)::softClass;
    uint64_t v33 = getPKVirtualCardManagerClass(void)::softClass;
    if (!getPKVirtualCardManagerClass(void)::softClass)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = ___ZL28getPKVirtualCardManagerClassv_block_invoke;
      v28 = &unk_1E5C9A2F8;
      v29 = &v30;
      PassKitCoreLibraryCore(0);
      Class Class = objc_getClass("PKVirtualCardManager");
      *(void *)(v29[1] + 24) = Class;
      getPKVirtualCardManagerClass(void)::softClass Class = *(void *)(v29[1] + 24);
      v8 = (void *)v31[3];
    }
    v10 = v8;
    _Block_object_dispose(&v30, 8);
    v11 = (PKVirtualCardManager *)objc_alloc_init(v10);
    virtualCardManager = v2->_virtualCardManager;
    v2->_virtualCardManager = v11;

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v13 = (void *)getPKSafariCardNotificationManagerClass(void)::softClass;
    uint64_t v33 = getPKSafariCardNotificationManagerClass(void)::softClass;
    if (!getPKSafariCardNotificationManagerClass(void)::softClass)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = ___ZL39getPKSafariCardNotificationManagerClassv_block_invoke;
      v28 = &unk_1E5C9A2F8;
      v29 = &v30;
      PassKitCoreLibraryCore(0);
      Class v14 = objc_getClass("PKSafariCardNotificationManager");
      *(void *)(v29[1] + 24) = v14;
      getPKSafariCardNotificationManagerClass(void)::softClass Class = *(void *)(v29[1] + 24);
      v13 = (void *)v31[3];
    }
    v15 = v13;
    _Block_object_dispose(&v30, 8);
    v16 = (PKSafariCardNotificationManager *)objc_alloc_init(v15);
    virtualCardNotificationManager = v2->_virtualCardNotificationManager;
    v2->_virtualCardNotificationManager = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    queueOfVirtualCardsToFetchDetailsFor = v2->_queueOfVirtualCardsToFetchDetailsFor;
    v2->_queueOfVirtualCardsToFetchDetailsFor = (NSMutableArray *)v18;

    v20 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    artworkCache = v2->_artworkCache;
    v2->_artworkCache = v20;

    v22 = v2;
  }

  return v2;
}

+ (BOOL)hasCreditCardData
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v2 BOOLForKey:@"WBSDebugIgnoreCardsFromKeychain"])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = *MEMORY[0x1E4F3B878];
    v11[0] = *MEMORY[0x1E4F3B550];
    v11[1] = v4;
    v12[0] = @"com.apple.safari.credit-cards";
    v12[1] = MEMORY[0x1E4F1CC38];
    uint64_t v5 = *MEMORY[0x1E4F3B988];
    uint64_t v6 = *MEMORY[0x1E4F3B850];
    v11[2] = *MEMORY[0x1E4F3B978];
    v11[3] = v6;
    v12[2] = v5;
    v12[3] = @"SafariCreditCardEntries";
    v11[4] = *MEMORY[0x1E4F3BB80];
    v12[4] = *MEMORY[0x1E4F3BB90];
    CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
    OSStatus v8 = SecItemCopyMatching(v7, 0);
    BOOL v3 = v8 == 0;
    if (v8 != -25300)
    {
      if (v8)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[WBSCreditCardDataController hasCreditCardData]();
        }
      }
    }
  }
  return v3;
}

- (id)_creditCardData
{
  v32[7] = *MEMORY[0x1E4F143B8];
  v22 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v22 BOOLForKey:@"WBSDebugIgnoreCardsFromKeychain"])
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  uint64_t v2 = *MEMORY[0x1E4F3B878];
  v31[0] = *MEMORY[0x1E4F3B550];
  v31[1] = v2;
  v32[0] = @"com.apple.safari.credit-cards";
  v32[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F3B988];
  uint64_t v4 = *MEMORY[0x1E4F3B850];
  v31[2] = *MEMORY[0x1E4F3B978];
  v31[3] = v4;
  v32[2] = v3;
  v32[3] = @"SafariCreditCardEntries";
  uint64_t v5 = *MEMORY[0x1E4F3BB88];
  uint64_t v6 = *MEMORY[0x1E4F3BC78];
  v31[4] = *MEMORY[0x1E4F3BB80];
  v31[5] = v6;
  v32[4] = v5;
  v32[5] = MEMORY[0x1E4F1CC38];
  v31[6] = *MEMORY[0x1E4F3BC70];
  v32[6] = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];
  CFTypeRef result = 0;
  CFDictionaryRef v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  OSStatus v7 = SecItemCopyMatching(v21, &result);
  if (v7 != -25300)
  {
    if (!v7)
    {
      OSStatus v8 = (void *)result;
      id v24 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        uint64_t v12 = *MEMORY[0x1E4F3BD40];
        uint64_t v13 = *MEMORY[0x1E4F3BD38];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v16 = [v15 objectForKeyedSubscript:v12];
            v17 = [v15 objectForKeyedSubscript:v13];
            if (v17)
            {
              uint64_t v18 = [[WBSCreditCardData alloc] initWithKeychainRepresentation:v17];
              if (v18)
              {
                [(NSMapTable *)self->_creditCardDataKeychainReferences setObject:v16 forKey:v18];
                [v24 addObject:v18];
              }
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v10);
      }

      [(WBSCreditCardDataController *)self _sortCreditCardDataArray:v24];
      goto LABEL_20;
    }
    v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[WBSCreditCardDataController hasCreditCardData]();
    }
  }
  id v24 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:

LABEL_21:
  return v24;
}

+ (id)creditCardComparatorForSortingInSettings
{
  return &__block_literal_global_34;
}

uint64_t __71__WBSCreditCardDataController_creditCardComparatorForSortingInSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 cardName];
  OSStatus v7 = [v5 cardName];
  uint64_t v8 = [v6 caseInsensitiveCompare:v7];

  if (!v8)
  {
    id v9 = [v4 cardholderName];
    uint64_t v10 = [v5 cardholderName];
    uint64_t v8 = [v9 caseInsensitiveCompare:v10];

    if (!v8)
    {
      uint64_t v11 = [v4 cardNumber];
      WBSCreditCardTypeFromNumber();
      uint64_t v12 = WBSCreditCardTypeLocalizedName();

      uint64_t v13 = [v5 cardNumber];
      WBSCreditCardTypeFromNumber();
      Class v14 = WBSCreditCardTypeLocalizedName();

      uint64_t v8 = [v12 compare:v14];
      if (!v8)
      {
        v15 = [v4 cardNumber];
        v16 = [v5 cardNumber];
        uint64_t v8 = [v15 compare:v16];
      }
    }
  }

  return v8;
}

- (void)_sortCreditCardDataArray:(id)a3
{
}

uint64_t __56__WBSCreditCardDataController__sortCreditCardDataArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isCardBalanceZeroOrNegative];
  if (v6 == [v5 isCardBalanceZeroOrNegative])
  {
    uint64_t v8 = [v4 lastUsedDate];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v11 = v10;

    uint64_t v12 = [v5 lastUsedDate];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v15 = v14;

    uint64_t v7 = [v15 compare:v11];
  }
  else if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)_deduplicatedVirtualCardDataArray:(id)a3 andCreditCardDataArray:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v20 = a4;
  id v24 = v5;
  if ([v5 count])
  {
    if ([v20 count])
    {
      CFDictionaryRef v21 = (void *)[v5 mutableCopy];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      obuint64_t j = v20;
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v6)
      {
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v9 = [v8 cardNumber];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v10 = v24;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v26;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v26 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * j) virtualCard];
                  char v15 = [v14 isEqualToSafariEntryWithPrimaryAccountNumber:v9 expirationDate:0];

                  if (v15)
                  {

                    goto LABEL_18;
                  }
                }
                uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }

            [v21 addObject:v8];
LABEL_18:
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v6);
      }

      v16 = v24;
      id v17 = v21;
      uint64_t v18 = obj;
    }
    else
    {
      v16 = 0;
      uint64_t v18 = v20;
      id v17 = v5;
    }
    id v20 = v17;
  }
  else
  {
    uint64_t v18 = 0;
    v16 = v5;
  }

  return v20;
}

- (NSArray)creditCardData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__WBSCreditCardDataController_creditCardData__block_invoke;
  v5[3] = &unk_1E5C8E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__WBSCreditCardDataController_creditCardData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _creditCardData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)authenticationRequiredForVirtualCard:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 requiresAuthentication];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)urlToListOfCardsInWallet
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(PKVirtualCardManager *)self->_virtualCardManager urlToListOfCards];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (unint64_t)virtualCardFieldsToRequest
{
  return 0;
}

- (BOOL)_shouldOfferVirtualCards
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:@"WBSDebugIgnoreCardsFromWallet"] ^ 1;

  return v3;
}

- (id)_virtualCardDataFromPKVirtualCards:(id)a3
{
  char v4 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_39);
  id v5 = (void *)[v4 mutableCopy];

  [(WBSCreditCardDataController *)self _sortCreditCardDataArray:v5];
  return v5;
}

WBSCreditCardData *__66__WBSCreditCardDataController__virtualCardDataFromPKVirtualCards___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [[WBSCreditCardData alloc] initWithVirtualCard:v2];

  return v3;
}

- (void)getCreditCardDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(WBSCreditCardDataController *)self _shouldOfferVirtualCards])
  {
    objc_initWeak(&location, self);
    qos_class_t v5 = qos_class_self();
    virtualCardManager = self->_virtualCardManager;
    unint64_t v7 = [(WBSCreditCardDataController *)self virtualCardFieldsToRequest];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5C9A388;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    qos_class_t v15 = v5;
    [(PKVirtualCardManager *)virtualCardManager activeVirtualCardsWithOptions:v7 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E5C8C660;
    v10[4] = self;
    id v11 = v4;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v10);
    dispatch_async(internalQueue, v9);
  }
}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    qos_class_t v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v3 count];
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Number of active virtual cards is %lu", buf, 0xCu);
    }

    uint64_t v6 = WeakRetained[2];
    dispatch_qos_class_t v7 = *(_DWORD *)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_40;
    block[3] = &unk_1E5C8D730;
    block[4] = WeakRetained;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v7, 0, block);
    dispatch_async(v6, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_40(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) allObjects];
  id v8 = [v2 _virtualCardDataFromPKVirtualCards:v3];

  id v4 = *(void **)(a1 + 32);
  qos_class_t v5 = [v4 _creditCardData];
  uint64_t v6 = [v4 _deduplicatedVirtualCardDataArray:v8 andCreditCardDataArray:v5];

  if ([*(id *)(a1 + 32) hasUsedNonVirtualCard])
  {
    dispatch_qos_class_t v7 = (void *)[v6 mutableCopy];
    [*(id *)(a1 + 32) _sortCreditCardDataArray:v7];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _creditCardData];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)getVirtualCardsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(WBSCreditCardDataController *)self _shouldOfferVirtualCards])
  {
    objc_initWeak(location, self);
    virtualCardManager = self->_virtualCardManager;
    unint64_t v6 = [(WBSCreditCardDataController *)self virtualCardFieldsToRequest];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__WBSCreditCardDataController_getVirtualCardsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5C9A3B0;
    objc_copyWeak(&v10, location);
    id v9 = v4;
    [(PKVirtualCardManager *)virtualCardManager activeVirtualCardsWithOptions:v6 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else
  {
    dispatch_qos_class_t v7 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Should not offer virtual cards", (uint8_t *)location, 2u);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __68__WBSCreditCardDataController_getVirtualCardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Number of active virtual cards is %lu", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v6 = [v3 allObjects];
  dispatch_qos_class_t v7 = [WeakRetained _virtualCardDataFromPKVirtualCards:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:(id)a3 blockToUpdateCardDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMutableArray *)self->_queueOfVirtualCardsToFetchDetailsFor firstObject];
  [(NSMutableArray *)self->_queueOfVirtualCardsToFetchDetailsFor removeObjectAtIndex:0];
  virtualCardManager = self->_virtualCardManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke;
  v13[3] = &unk_1E5C9A400;
  id v10 = v7;
  id v17 = v10;
  id v11 = v8;
  id v14 = v11;
  qos_class_t v15 = self;
  id v12 = v6;
  id v16 = v12;
  [(PKVirtualCardManager *)virtualCardManager credentialsForVirtualCard:v11 authorization:v12 options:3 merchantHost:0 completion:v13];
}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_2;
  v18[3] = &unk_1E5C9A400;
  id v22 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v19 = v7;
  uint64_t v20 = v8;
  id v21 = v9;
  id v10 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v18);
  id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v12 = [v11 BOOLForKey:@"WBSDebugSimulateSlowFetchOfWalletCardDetails"];

  if (v12)
  {
    dispatch_time_t v13 = dispatch_time(0, 1250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_43;
    block[3] = &unk_1E5C8D578;
    id v17 = v10;
    id v15 = v5;
    id v16 = v6;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
  else
  {
    ((void (**)(void, id, id))v10)[2](v10, v5, v6);
  }
}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3;
  v12[3] = &unk_1E5C9A3D8;
  id v13 = v6;
  id v14 = v5;
  id v18 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

unsigned char *__123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    id v2 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v3 = [[WBSCreditCardData alloc] initWithVirtualCardCredentials:*(void *)(a1 + 40) virtualCard:*(void *)(a1 + 48)];
    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 56) + 40) count];
  CFTypeRef result = *(unsigned char **)(a1 + 56);
  if (v4) {
    return (unsigned char *)[result processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:*(void *)(a1 + 64) blockToUpdateCardDetails:*(void *)(a1 + 72)];
  }
  result[48] = 0;
  return result;
}

uint64_t __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_43(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getVirtualCardCredentialsWithExternalizedContext:(id)a3 shouldIncludeVPANCards:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a5;
  if ([(WBSCreditCardDataController *)self _shouldOfferVirtualCards])
  {
    objc_initWeak(&location, self);
    virtualCardManager = self->_virtualCardManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke;
    v9[3] = &unk_1E5C9A448;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    BOOL v12 = a4;
    [(PKVirtualCardManager *)virtualCardManager activeVirtualCardsWithOptions:1 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = v3;
  if (WeakRetained)
  {
    id v5 = [v3 allObjects];
    if (!*(unsigned char *)(a1 + 48))
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Filtering out VPAN enabled cards from Safari UI because Touch ID is not available", buf, 2u);
      }
      uint64_t v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_47);

      id v5 = (void *)v7;
    }
    if ([v5 count])
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = [[WBSCreditCardData alloc] initWithVirtualCard:*(void *)(*((void *)&v15 + 1) + 8 * i)];
            [v8 addObject:v13];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v10);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

BOOL __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke_44(uint64_t a1, void *a2)
{
  return [a2 type] != 2;
}

- (void)getCardDetailsForVirtualCards:(id)a3 externalizedContext:(id)a4 blockToUpdateCardDetails:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  [(NSMutableArray *)self->_queueOfVirtualCardsToFetchDetailsFor addObjectsFromArray:v10];
  if (!self->_isQueueOfVirtualCardsToFetchDetailsForBeingProcessed)
  {
    self->_isQueueOfVirtualCardsToFetchDetailsForBeingProcessed = 1;
    [(WBSCreditCardDataController *)self processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:v8 blockToUpdateCardDetails:v9];
  }
}

- (void)getCreditCardDataToFill:(id)a3 host:(id)a4 externalizedContext:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 virtualCard];
  if (v14)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke;
    v19[3] = &unk_1E5C9A470;
    id v21 = v13;
    id v15 = v14;
    id v20 = v15;
    long long v16 = (void *)MEMORY[0x1AD0C4F80](v19);
    long long v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl(&dword_1A6B5F000, v17, OS_LOG_TYPE_INFO, "Fetching credentials for virtual card", v18, 2u);
    }
    [(PKVirtualCardManager *)self->_virtualCardManager credentialsForVirtualCard:v15 authorization:v12 options:[(WBSCreditCardDataController *)self virtualCardFieldsToRequest] merchantHost:v11 completion:v16];
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }
}

void __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5C9A470;
  id v17 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  uint64_t v7 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v15);
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v9 = [v8 BOOLForKey:@"WBSDebugSimulateSlowFetchOfWalletCardDetails"];

  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 1250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_48;
    block[3] = &unk_1E5C8D578;
    id v14 = v7;
    id v12 = v5;
    id v13 = v6;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
  else
  {
    ((void (**)(void, id, id))v7)[2](v7, v5, v6);
  }
}

void __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [[WBSCreditCardData alloc] initWithVirtualCardCredentials:v5 virtualCard:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_48(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)titleForUnavailableVirtualCardAlert
{
  return (NSString *)_WBSLocalizedString();
}

- (NSString)messageForUnavailableVirtualCardAlert
{
  return (NSString *)_WBSLocalizedString();
}

- (BOOL)shouldNeverSaveCardWithNumber:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 4)
  {
    id v6 = [(WBSCreditCardDataController *)self _neverSavedCreditCardSuffixFromCardNumber:v4];
    char v5 = WBSKeychainItemExists();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)existingCardWithNumber:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = [(WBSCreditCardDataController *)self creditCardData];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        dispatch_time_t v10 = [v9 cardNumber];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldAddCardWithNumber:(id)a3
{
  id v4 = a3;
  if ([(WBSCreditCardDataController *)self shouldNeverSaveCardWithNumber:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(WBSCreditCardDataController *)self existingCardWithNumber:v4];
    BOOL v5 = v6 == 0;
  }
  return v5;
}

- (id)_uniqueCardNameForCardName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v6 = [(WBSCreditCardDataController *)self creditCardData];
  uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(WBSCreditCardDataController *)self creditCardData];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) cardName];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  if ([v7 containsObject:v4])
  {
    uint64_t v13 = 2;
    do
    {
      long long v14 = NSString;
      long long v15 = _WBSLocalizedString();
      long long v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v4, v13);

      int v17 = [v7 containsObject:v16];
      char v18 = v17;
      if (v17) {
        id v19 = v16;
      }
      else {
        id v19 = 0;
      }

      uint64_t v13 = (v13 + 1);
    }
    while ((v18 & 1) != 0);
  }
  else
  {
    long long v16 = v4;
  }

  return v16;
}

- (id)defaultNameForCardOfType:(unint64_t)a3 cardholderName:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    id v6 = NSString;
    uint64_t v7 = _WBSLocalizedString();
    id v8 = WBSCreditCardTypeLocalizedNameForGeneratingCardNames();
    uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5, v8);
  }
  else
  {
    uint64_t v9 = WBSCreditCardTypeLocalizedNameForGeneratingCardNames();
  }
  uint64_t v10 = [(WBSCreditCardDataController *)self _uniqueCardNameForCardName:v9];

  return v10;
}

- (id)savableCreditCardDataInForm:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  v48 = [v40 controls];
  uint64_t v3 = [v48 count];
  if (!v3)
  {
    v49 = 0;
    v43 = 0;
    id v5 = 0;
    goto LABEL_62;
  }
  unint64_t v46 = v3;
  id v4 = 0;
  id v5 = 0;
  v49 = 0;
  v43 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    id v8 = [v48 objectAtIndexedSubscript:v7];
    uint64_t v9 = [v8 value];
    if ([(__CFString *)v9 length])
    {
      if (v5 || ![v8 looksLikeCreditCardCardholderField])
      {
        if (v4 || ![v8 looksLikeCreditCardNumberField])
        {
          if (v45 == 0x7FFFFFFFFFFFFFFFLL && [v8 looksLikeDayField])
          {
            uint64_t v45 = [(__CFString *)v9 integerValue];
          }
          else if (v44 == 0x7FFFFFFFFFFFFFFFLL && [v8 looksLikeMonthField])
          {
            uint64_t v44 = [(__CFString *)v9 integerValue];
          }
          else if (v42 == 0x7FFFFFFFFFFFFFFFLL && [v8 looksLikeYearField])
          {
            uint64_t v42 = [(__CFString *)v9 integerValue];
          }
          else if (v49 || ![v8 looksLikeCreditCardCompositeExpirationDateField])
          {
            if (!v43)
            {
              if ([v8 looksLikeCreditCardSecurityCodeField])
              {
                uint64_t v9 = v9;
                v43 = v9;
              }
              else
              {
                v43 = 0;
              }
            }
          }
          else
          {
            uint64_t v9 = v9;
            v49 = v9;
          }
        }
        else
        {
          v41 = +[WBSFormDataController continuingFieldsInFormControls:v48 startingAtIndex:v7 textFieldsOnly:1 ignorePositioning:0];
          if ((unint64_t)[v41 count] >= 2)
          {
            uint64_t v10 = [MEMORY[0x1E4F28E78] stringWithCapacity:16];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v11 = v41;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v55;
              while (2)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v55 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  long long v15 = [*(id *)(*((void *)&v54 + 1) + 8 * i) value];
                  if (![v15 length])
                  {

                    goto LABEL_35;
                  }
                  [v10 appendString:v15];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
LABEL_35:

            long long v16 = v10;
            uint64_t v17 = [v11 count];

            unint64_t v7 = v7 + v17 - 1;
            uint64_t v9 = v16;
          }
          uint64_t v6 = WBSCreditCardTypeFromNumber();
          char v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          char v19 = [v18 BOOLForKey:@"DebugSkipCreditCardValidation"];

          if (v6) {
            char v20 = 1;
          }
          else {
            char v20 = v19;
          }
          if (v20) {
            id v4 = v9;
          }
          else {
            id v4 = 0;
          }
        }
      }
      else
      {
        uint64_t v9 = v9;
        id v5 = v9;
      }
    }

    ++v7;
  }
  while (v7 < v46);
  if (!v4)
  {
LABEL_62:
    long long v30 = 0;
    goto LABEL_66;
  }
  if (v5) {
    goto LABEL_65;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v21 = v48;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (!v22)
  {
LABEL_60:

    goto LABEL_64;
  }
  uint64_t v23 = *(void *)v51;
  uint64_t v47 = *MEMORY[0x1E4F98068];
LABEL_49:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v51 != v23) {
      objc_enumerationMutation(v21);
    }
    long long v25 = *(void **)(*((void *)&v50 + 1) + 8 * v24);
    if (([v25 isTextField] & 1) == 0) {
      goto LABEL_58;
    }
    uint64_t v26 = +[WBSFormDataController specifierForControl:v25];
    long long v27 = v26;
    if (v26)
    {
      long long v28 = [v26 property];
      char v29 = [v28 isEqualToString:v47];

      if (v29) {
        break;
      }
    }
LABEL_57:

LABEL_58:
    if (v22 == ++v24)
    {
      uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v22) {
        goto LABEL_49;
      }
      goto LABEL_60;
    }
  }
  id v5 = [v25 value];
  if (![(__CFString *)v5 length])
  {

    goto LABEL_57;
  }

  if (v5) {
    goto LABEL_65;
  }
LABEL_64:
  id v5 = &stru_1EFBE3CF8;
LABEL_65:
  long long v30 = WBSNormalizedCreditCardNumber();

  if ([(WBSCreditCardDataController *)self shouldNeverSaveCardWithNumber:v30])
  {
LABEL_66:
    long long v31 = 0;
  }
  else
  {
    uint64_t v33 = [(WBSCreditCardDataController *)self defaultNameForCardOfType:v6 cardholderName:v5];
    v34 = WBSExpirationDateWithDayMonthYear();
    if (!v34 && v49)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v35 setDateFormat:@"MM/yy"];
      v36 = WBSLocaleForCreditCardExpirationDate();
      [v35 setLocale:v36];

      v34 = [v35 dateFromString:v49];
    }
    v37 = [[WBSCreditCardData alloc] initWithCardName:v33 number:v30 cardholderName:v5 expirationDate:v34 securityCode:v43];
    v38 = [MEMORY[0x1E4F1C9C8] date];
    long long v31 = [(WBSCreditCardData *)v37 creditCardDataByUpdatingLastUsedDate:v38];
  }
  return v31;
}

- (void)removeCreditCardData:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSCreditCardDataController_removeCreditCardData___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __52__WBSCreditCardDataController_removeCreditCardData___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = *MEMORY[0x1E4F3BD40];
  v6[0] = v2;
  CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  if (SecItemDelete(v3))
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1();
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _creditCardDataDidChange];
}

- (void)replaceCreditCardData:(id)a3 withCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke;
  block[3] = &unk_1E5C8D840;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    CFDictionaryRef v3 = [*(id *)(a1 + 48) keychainRepresentationByMigratingExistingKeychainData:*(void *)(a1 + 40)];
    uint64_t v8 = *MEMORY[0x1E4F3BD40];
    v9[0] = v2;
    CFDictionaryRef v4 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = *MEMORY[0x1E4F3BD38];
    id v7 = v3;
    if (SecItemUpdate(v4, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1]))
    {
      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke_cold_1();
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _creditCardDataDidChange];
  }
}

- (void)markCreditCardDataAsMostRecentlyUsed:(id)a3
{
  id v7 = a3;
  CFDictionaryRef v4 = [v7 virtualCard];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setLastAutoFilledBySafariWithCompletion:&__block_literal_global_74];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = [v7 creditCardDataByUpdatingLastUsedDate:v6];

    [(WBSCreditCardDataController *)self replaceCreditCardData:v7 withCard:v5];
    [(WBSCreditCardDataController *)self setHasUsedNonVirtualCard];
  }
}

void __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    CFDictionaryRef v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke_cold_1();
    }
  }
}

- (void)saveCreditCardData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSCreditCardDataController_saveCreditCardData_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __68__WBSCreditCardDataController_saveCreditCardData_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F29128] UUID];
  CFDictionaryRef v3 = [v2 UUIDString];

  CFDictionaryRef v4 = [*(id *)(a1 + 32) keychainRepresentationForNewCard];
  uint64_t v5 = NSString;
  id v6 = _WBSLocalizedString();
  id v7 = [*(id *)(a1 + 32) cardName];
  uint64_t v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

  id v9 = _WBSLocalizedString();
  WBSSetKeychainPassword();
  id v10 = 0;
  if (v10) {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v10 forKey:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) _removeNeverSaveCreditCardData:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _creditCardDataDidChange];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

- (void)saveCreditCardDataIfAllowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 cardNumber];
  BOOL v6 = [(WBSCreditCardDataController *)self shouldAddCardWithNumber:v5];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__WBSCreditCardDataController_saveCreditCardDataIfAllowed___block_invoke;
    v7[3] = &unk_1E5C8D980;
    v7[4] = self;
    id v8 = v4;
    [(WBSCreditCardDataController *)self saveCreditCardData:v8 completionHandler:v7];
  }
}

uint64_t __59__WBSCreditCardDataController_saveCreditCardDataIfAllowed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tellWalletThatNewCardWasSaved:*(void *)(a1 + 40)];
}

- (BOOL)isCreditCardDataSaved:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSCreditCardDataController_isCreditCardDataSaved___block_invoke;
  block[3] = &unk_1E5C9A498;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __53__WBSCreditCardDataController_isCreditCardDataSaved___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

- (id)_neverSavedCreditCardSuffixFromCard:(id)a3
{
  id v4 = [a3 cardNumber];
  uint64_t v5 = [(WBSCreditCardDataController *)self _neverSavedCreditCardSuffixFromCardNumber:v4];

  return v5;
}

- (id)_neverSavedCreditCardSuffixFromCardNumber:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 4);

  return v4;
}

- (void)_removeNeverSaveCreditCardData:(id)a3
{
  id v7 = a3;
  id v4 = [v7 cardNumber];
  unint64_t v5 = [v4 length];

  if (v5 >= 4)
  {
    id v6 = [(WBSCreditCardDataController *)self _neverSavedCreditCardSuffixFromCard:v7];
    WBSRemoveKeychainPasswordIfExists();
  }
}

- (void)neverSaveCreditCardData:(id)a3
{
  id v6 = [(WBSCreditCardDataController *)self _neverSavedCreditCardSuffixFromCard:a3];
  id v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  unint64_t v5 = [MEMORY[0x1E4F1C9B8] data];
  WBSSetKeychainPassword();
}

- (void)_creditCardDataDidChange
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"com.apple.SafariShared.CreditCardAutoFillDataChangedNotification" object:0];
}

- (void)clearCreditCardData
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSCreditCardDataController_clearCreditCardData__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __50__WBSCreditCardDataController_clearCreditCardData__block_invoke(uint64_t a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3B878];
  v7[0] = *MEMORY[0x1E4F3B550];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  v8[0] = @"com.apple.safari.credit-cards";
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F3B850];
  v7[2] = *MEMORY[0x1E4F3B978];
  v7[3] = v4;
  v8[2] = *MEMORY[0x1E4F3B988];
  v8[3] = @"SafariCreditCardEntries";
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  if (SecItemDelete(v5))
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _creditCardDataDidChange];
}

- (void)savePendingChangesBeforeTermination
{
}

- (BOOL)hasUsedNonVirtualCard
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"UserHasUsedNonVirtualCardPreference"];

  return v3;
}

- (void)setHasUsedNonVirtualCard
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:1 forKey:@"UserHasUsedNonVirtualCardPreference"];
}

- (void)isVirtualCard:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL))a5;
  BOOL v11 = [(WBSCreditCardDataController *)self _shouldOfferVirtualCards];
  if (!v11)
  {
    char v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_INFO, "isVirtualCard: not offering virtual cards", buf, 2u);
    }
    goto LABEL_14;
  }
  id v12 = [v8 virtualCard];

  if (v12)
  {
LABEL_14:
    v10[2](v10, v11);
    goto LABEL_15;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
        char v18 = [v8 cardNumber];
        LODWORD(v17) = [v18 isEqual:v17];

        if (v17)
        {
          v10[2](v10, 1);
          goto LABEL_17;
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  virtualCardManager = self->_virtualCardManager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__WBSCreditCardDataController_isVirtualCard_previouslyFilledVirtualCardNumbers_completion___block_invoke;
  v21[3] = &unk_1E5C9A4C0;
  id v22 = v8;
  uint64_t v23 = v10;
  [(PKVirtualCardManager *)virtualCardManager activeVirtualCardsWithOptions:1 completion:v21];

  id v13 = v22;
LABEL_17:

LABEL_15:
}

void __91__WBSCreditCardDataController_isVirtualCard_previouslyFilledVirtualCardNumbers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) cardNumber];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "isEqualToSafariEntryWithPrimaryAccountNumber:expirationDate:", v4, 0, (void)v13))
        {
          BOOL v11 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = [v5 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v18 = v12;
            _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "isVirtualCard: compared card against %zu virtual cards and found a match.", buf, 0xCu);
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "isVirtualCard: compared card against %zu virtual cards but found no match.", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

- (void)sendCardholderNameEnteredInFormToWalletIfNecessary:(id)a3 lastFilledVirtualCardData:(id)a4
{
  id v14 = a3;
  id v5 = [a4 virtualCard];
  uint64_t v6 = v5;
  if (v5 && [v5 type] == 2)
  {
    uint64_t v7 = [v6 billingAddress];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1B910];
      id v9 = [v6 billingAddress];
      uint64_t v10 = [v8 stringFromContact:v9 style:0];
    }
    else
    {
      uint64_t v10 = 0;
    }

    BOOL v11 = [v14 cardholderName];
    if ([v11 length])
    {
      uint64_t v12 = [v14 cardholderName];
      char v13 = [v12 isEqualToString:v10];

      if (v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      BOOL v11 = [v14 cardholderName];
      [v6 setContactNameEnteredInSafari:v11 completion:&__block_literal_global_94_0];
    }

    goto LABEL_10;
  }
LABEL_11:
}

void __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke_cold_1();
    }
  }
}

- (void)tellWalletThatExistingCardWasFilledInForm:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__WBSCreditCardDataController_tellWalletThatExistingCardWasFilledInForm_previouslyFilledVirtualCardNumbers___block_invoke;
  v8[3] = &unk_1E5C9A4E8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WBSCreditCardDataController *)self isVirtualCard:v7 previouslyFilledVirtualCardNumbers:a4 completion:v8];
}

void __108__WBSCreditCardDataController_tellWalletThatExistingCardWasFilledInForm_previouslyFilledVirtualCardNumbers___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
    id v3 = [*(id *)(a1 + 40) dictionaryRepresentation];
    objc_msgSend(v2, "userDidPerformAction:withCard:", 1);
  }
}

- (void)tellWalletThatNewCardWasSaved:(id)a3
{
  virtualCardNotificationManager = self->_virtualCardNotificationManager;
  id v4 = [a3 dictionaryRepresentation];
  -[PKSafariCardNotificationManager userDidPerformAction:withCard:](virtualCardNotificationManager, "userDidPerformAction:withCard:", 0);
}

- (id)fieldsToObscureWhenFillingCreditCard:(id)a3 formMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isVirtualCard])
  {
    id v7 = [v6 controls];
    uint64_t v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_98);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __81__WBSCreditCardDataController_fieldsToObscureWhenFillingCreditCard_formMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 looksLikeCreditCardNumberField] & 1) != 0
    || [v2 looksLikeCreditCardSecurityCodeField])
  {
    id v3 = [v2 uniqueID];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)fieldsToObscureWhenFillingSingleCreditCardData:(id)a3 formFieldValues:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isVirtualCard] & 1) != 0 && (!objc_msgSend(v5, "type") || objc_msgSend(v5, "type") == 1))
  {
    id v7 = [v6 allKeys];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)exportCreditCardDataToFileWithURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v36 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F97E80]) initWithURL:v23 error:&v36];
  id v5 = v36;
  long long v24 = v5;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    long long v26 = [v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v8 = +[WBSCreditCardDataController creditCardDataController];
    obuint64_t j = [v8 creditCardData];

    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v27 = *(void *)v33;
      uint64_t v30 = v4;
      do
      {
        uint64_t v10 = 0;
        uint64_t v28 = v9;
        do
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
          uint64_t v12 = [v11 expirationDate];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            long long v15 = 0;
          }
          else
          {
            id v14 = [v11 expirationDate];
            long long v15 = [v26 components:12 fromDate:v14];
          }
          long long v31 = [v11 cardNumber];
          long long v16 = [v11 cardName];
          uint64_t v17 = [v11 cardholderName];
          uint64_t v18 = [v15 month];
          if (v18)
          {
            char v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "month"));
            char v19 = v29;
          }
          else
          {
            char v19 = 0;
          }
          uint64_t v20 = [v15 year];
          if (v20)
          {
            id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "year"));
            id v21 = v3;
          }
          else
          {
            id v21 = 0;
          }
          id v22 = [v11 lastUsedDate];
          [v30 addEntryWithCardNumber:v31 cardName:v16 cardholderName:v17 cardExpirationMonth:v19 cardExpirationYear:v21 lastUsedDate:v22];

          id v4 = v30;
          if (v20) {

          }
          if (v18) {
          ++v10;
          }
        }
        while (v28 != v10);
        uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    [v4 finishWithCompletionHandler:0];
  }
  else
  {
    long long v26 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v24, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSCreditCardDataController exportCreditCardDataToFileWithURL:]();
    }
  }
}

- (unint64_t)numberOfCreditCardsToBeExported
{
  id v2 = +[WBSCreditCardDataController creditCardDataController];
  id v3 = [v2 creditCardData];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)importCreditCardDataWithCardNumber:(id)a3 cardName:(id)a4 cardholderName:(id)a5 cardExpirationMonth:(id)a6 cardExpirationYear:(id)a7 lastUsedDate:(id)a8
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  char v19 = 0;
  if (v16 && v17)
  {
    [v16 integerValue];
    [v17 integerValue];
    char v19 = WBSExpirationDateWithDayMonthYear();
  }
  uint64_t v20 = [[WBSCreditCardData alloc] initWithCardName:v14 number:v25 cardholderName:v15 expirationDate:v19];
  id v21 = v20;
  if (v18)
  {
    uint64_t v22 = [(WBSCreditCardData *)v20 creditCardDataByUpdatingLastUsedDate:v18];

    id v21 = (void *)v22;
  }
  id v23 = [v21 cardNumber];
  long long v24 = [(WBSCreditCardDataController *)self existingCardWithNumber:v23];

  if (v24)
  {
    if ([(WBSCreditCardDataController *)self _shouldReplaceExistingCard:v24 withImportedCard:v21])
    {
      [(WBSCreditCardDataController *)self replaceCreditCardData:v24 withCard:v21];
    }
  }
  else
  {
    [(WBSCreditCardDataController *)self saveCreditCardDataIfAllowed:v21];
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
}

- (BOOL)_shouldReplaceExistingCard:(id)a3 withImportedCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToImportedCard:v7]) {
    goto LABEL_15;
  }
  uint64_t v8 = [v7 expirationDate];
  if (!v8)
  {
    unint64_t v4 = [v6 expirationDate];
    if (!v4) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = [v7 expirationDate];
  uint64_t v10 = [v6 expirationDate];
  char v11 = [v9 isEqualToDate:v10];

  if (v8)
  {

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_12;
    }
  }
  uint64_t v12 = [v7 expirationDate];
  BOOL v13 = [v6 expirationDate];
  uint64_t v14 = [v12 compare:v13];

  id v15 = [v7 expirationDate];

  BOOL v16 = 0;
  if (v15)
  {
    if (v14 != -1)
    {
      id v17 = [v6 expirationDate];

      BOOL v16 = 1;
      if (v17)
      {
        if (v14 != 1)
        {
LABEL_12:
          id v18 = [v7 lastUsedDate];
          if (v18)
          {
            char v19 = [v6 lastUsedDate];
            if (v19)
            {
              uint64_t v20 = [v7 lastUsedDate];
              id v21 = [v6 lastUsedDate];
              uint64_t v22 = [v20 compare:v21];

              if (v22 != 1) {
                goto LABEL_15;
              }
            }
            else
            {
            }
            BOOL v16 = 1;
            goto LABEL_16;
          }
LABEL_15:
          BOOL v16 = 0;
        }
      }
    }
  }
LABEL_16:

  return v16;
}

- (BOOL)test_shouldReplaceExistingCard:(id)a3 withImportedCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ([MEMORY[0x1E4F97EA0] isInternalInstall] & 1) != 0
    && [(WBSCreditCardDataController *)self _shouldReplaceExistingCard:v6 withImportedCard:v7];

  return v8;
}

- (NSCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_queueOfVirtualCardsToFetchDetailsFor, 0);
  objc_storeStrong((id *)&self->_virtualCardNotificationManager, 0);
  objc_storeStrong((id *)&self->_virtualCardManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_creditCardDataKeychainReferences, 0);
}

+ (void)hasCreditCardData
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7(&dword_1A6B5F000, v0, v1, "SecItemCopyMatching failed with error %d", v2, v3, v4, v5, v6);
}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to retrieve credentials for a virtual card with error: %{public}@", v5);
}

void __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7(&dword_1A6B5F000, v0, v1, "SecItemDelete failed with error %d", v2, v3, v4, v5, v6);
}

void __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7(&dword_1A6B5F000, v0, v1, "SecItemUpdate failed with error %d", v2, v3, v4, v5, v6);
}

void __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update last used date on virtual card %{public}@", v5);
}

void __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Wallet failed to save the cardholder name for a card: %{public}@", v5);
}

- (void)exportCreditCardDataToFileWithURL:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error exporting credit cards: %{public}@", v5);
}

@end