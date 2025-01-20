@interface PKPaymentOptionsRecents
+ (PKPaymentOptionsRecents)defaultInstance;
+ (id)_coreRecentsKindForPreference:(id)a3;
- (BOOL)isMeCardCachingEnabled;
- (CNContact)meCard;
- (CRRecentContactsLibrary)recentContactsLibrary;
- (PKPaymentOptionsRecents)init;
- (id)_contactFromRecent:(id)a3 preference:(id)a4;
- (id)_contactsFromKeychainForPreference:(id)a3;
- (id)_defaultCRSearchQuery;
- (id)_keychainDataForKey:(id)a3;
- (id)_keychainKeyFromContactKey:(id)a3;
- (id)_labelsToPropertiesDictionaryForContact:(id)a3;
- (id)_meCardEntries:(id)a3 forContactKey:(id)a4 labelsToProperties:(id)a5;
- (id)_meCardEntries:(id)a3 forContactKeys:(id)a4 labelsToProperties:(id)a5;
- (id)_postalAddressLabeledValueFromRecent:(id)a3;
- (id)contactMetadataForContact:(id)a3 preference:(id)a4;
- (id)meCardEntriesForPreference:(id)a3;
- (id)postalAddressMetadataForContact:(id)a3;
- (id)recentsForPreference:(id)a3;
- (id)saveContactToCoreRecents:(id)a3 preference:(id)a4;
- (void)_addContactToKeychain:(id)a3 forPreference:(id)a4;
- (void)_coreRecentsContactsForPreference:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_deleteRecentContactFromKeychain:(id)a3 forPreference:(id)a4;
- (void)_deleteRecentContactsFromKeychainForContactKey:(id)a3;
- (void)_deleteRecentContactsFromKeychainForPreference:(id)a3;
- (void)_setKeychainData:(id)a3 forKey:(id)a4;
- (void)_updateRecentsWithContactsFromContactInformation:(id)a3 currentKeychainContacts:(id)a4 forContactKey:(id)a5;
- (void)dealloc;
- (void)deleteAllRecentsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)deleteRecent:(id)a3;
- (void)deleteRecentsForPreference:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)meCardEntriesForPreference:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)recentsForPreference:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)setMeCardCachingEnabled:(BOOL)a3;
- (void)setRecentContactsLibrary:(id)a3;
- (void)updateRecentsAndKeychainWithContactInformation:(id)a3;
@end

@implementation PKPaymentOptionsRecents

- (CNContact)meCard
{
  if ([(PKPaymentOptionsRecents *)self isMeCardCachingEnabled]
    && (v3 = self->_cachedMeContact) != 0)
  {
    v4 = v3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v6 = [MEMORY[0x1E4F1B8F8] pkPassbookRequiredKeys];
    v4 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:0];

    if ([(PKPaymentOptionsRecents *)self isMeCardCachingEnabled])
    {
      cachedMeContact = self->_cachedMeContact;
      p_cachedMeContact = &self->_cachedMeContact;
      if (!cachedMeContact)
      {
        if (v4) {
          objc_storeStrong((id *)p_cachedMeContact, v4);
        }
      }
    }
  }
  return v4;
}

+ (PKPaymentOptionsRecents)defaultInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PKPaymentOptionsRecents_defaultInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB403498 != -1) {
    dispatch_once(&qword_1EB403498, block);
  }
  v2 = (void *)_MergedGlobals_279;
  return (PKPaymentOptionsRecents *)v2;
}

void __42__PKPaymentOptionsRecents_defaultInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)_MergedGlobals_279;
  _MergedGlobals_279 = (uint64_t)v0;
}

- (PKPaymentOptionsRecents)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentOptionsRecents;
  v2 = [(PKPaymentOptionsRecents *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5CCE0] defaultInstance];
    recentContactsLibrary = v2->_recentContactsLibrary;
    v2->_recentContactsLibrary = (CRRecentContactsLibrary *)v3;

    id v5 = objc_alloc_init(PKPaymentOptionsSynchronization);
    optionsSynchronization = v2->_optionsSynchronization;
    v2->_optionsSynchronization = v5;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_meContactDidChangeNotificationObserver)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_meContactDidChangeNotificationObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentOptionsRecents;
  [(PKPaymentOptionsRecents *)&v4 dealloc];
}

- (id)postalAddressMetadataForContact:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 postalAddresses];
  v6 = [v5 firstObject];

  v7 = [v6 value];
  objc_super v8 = [v7 backwardsCompatibleDictionaryRepresentation];

  [v4 setObject:v8 forKey:@"postalAddress"];
  v9 = [v6 value];
  v10 = [v9 ISOCountryCode];
  if ([v10 caseInsensitiveCompare:@"cn"])
  {
  }
  else
  {
    int v11 = [v3 isKeyAvailable:*MEMORY[0x1E4F1AED0]];

    if (!v11) {
      goto LABEL_6;
    }
    v9 = [v3 note];
    [v4 setObject:v9 forKey:@"pkdistrict"];
  }

LABEL_6:
  v12 = (void *)[v4 copy];

  return v12;
}

- (id)contactMetadataForContact:(id)a3 preference:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v47 = v5;
  objc_super v8 = [v5 nameComponents];
  v9 = [v8 givenName];

  if (v9)
  {
    v10 = [v8 givenName];
    [v7 setObject:v10 forKey:@"givenName"];
  }
  int v11 = [v8 familyName];

  if (v11)
  {
    v12 = [v8 familyName];
    [v7 setObject:v12 forKey:@"familyName"];
  }
  v13 = [v8 phoneticRepresentation];
  v14 = [v13 givenName];

  if (v14)
  {
    v15 = [v13 givenName];
    [v7 setObject:v15 forKey:@"phoneticGivenName"];
  }
  v16 = [v13 familyName];

  if (v16)
  {
    v17 = [v13 familyName];
    [v7 setObject:v17 forKey:@"phoneticFamilyName"];
  }
  v18 = [v6 contactKey];
  uint64_t v19 = *MEMORY[0x1E4F1AF10];
  int v20 = [v18 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v20)
  {
    v21 = [(PKPaymentOptionsRecents *)self postalAddressMetadataForContact:v47];
    [v7 addEntriesFromDictionary:v21];
  }
  v22 = [v6 contactKeys];
  unint64_t v23 = [v22 count];

  if (v23 >= 2)
  {
    v44 = v13;
    v45 = v8;
    v24 = (void *)MEMORY[0x1E4F1CAA0];
    v25 = [v6 contactKeys];
    id v46 = v6;
    v26 = [v6 contactKeys];
    v27 = objc_msgSend(v24, "orderedSetWithOrderedSet:range:copyItems:", v25, 1, objc_msgSend(v26, "count") - 1, 0);

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
    v30 = v47;
    if (!v29) {
      goto LABEL_30;
    }
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v52;
    uint64_t v33 = *MEMORY[0x1E4F1ADC8];
    uint64_t v48 = *MEMORY[0x1E4F1AEE0];
    v49 = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(v28);
        }
        v35 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v35 isEqualToString:v19])
        {
          v36 = [(PKPaymentOptionsRecents *)self postalAddressMetadataForContact:v30];
          [v7 addEntriesFromDictionary:v36];
        }
        else if ([v35 isEqualToString:v33])
        {
          v37 = [v30 emailAddresses];
          v38 = [v37 firstObject];
          v36 = [v38 value];

          if (!v36) {
            goto LABEL_26;
          }
          v7 = v49;
          [v49 setObject:v36 forKey:@"emailAddresses"];
        }
        else
        {
          if (![v35 isEqualToString:v48]) {
            continue;
          }
          v39 = [v30 phoneNumbers];
          v40 = [v39 firstObject];
          v41 = [v40 value];
          v36 = [v41 stringValue];

          if (!v36)
          {
            v30 = v47;
LABEL_26:
            v7 = v49;
            goto LABEL_27;
          }
          v7 = v49;
          [v49 setObject:v36 forKey:@"phoneNumbers"];
          v30 = v47;
        }
LABEL_27:
      }
      uint64_t v31 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (!v31)
      {
LABEL_30:

        objc_super v8 = v45;
        id v6 = v46;
        v13 = v44;
        break;
      }
    }
  }
  if ([v47 recentFromContactInformation]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"contactFromContactInformation"];
  }
  v42 = (void *)[v7 copy];

  return v42;
}

- (id)saveContactToCoreRecents:(id)a3 preference:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 contactKey];
  if (![(PKPaymentOptionsSynchronization *)self->_optionsSynchronization shouldSyncToCloud])
  {
    v16 = objc_alloc_init(PKRecentContact);
    -[PKRecentContact setContactID:](v16, "setContactID:", [v6 hash]);
    [(PKPaymentOptionsRecents *)self _addContactToKeychain:v6 forPreference:v7];
    v15 = 0;
    v17 = 0;
    goto LABEL_31;
  }
  v49 = [(PKPaymentOptionsRecents *)self contactMetadataForContact:v6 preference:v7];
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    v9 = [v6 postalAddresses];
    v10 = [v9 firstObject];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1BA88]);
    uint64_t v48 = v10;
    v12 = [v10 value];
    v13 = [v11 stringFromPostalAddress:v12];

    v14 = [v6 pkFullName];
    v15 = [v13 stringByAppendingString:v14];

LABEL_10:
    if (v15) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (![v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    if (![v8 isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      v17 = 0;
      goto LABEL_27;
    }
    int v20 = [v6 phoneNumbers];
    v21 = [v20 firstObject];

    uint64_t v48 = v21;
    id v11 = [v21 value];
    v15 = [v11 stringValue];
    goto LABEL_10;
  }
  v18 = [v6 emailAddresses];
  uint64_t v19 = [v18 firstObject];

  uint64_t v48 = v19;
  v15 = [v19 value];
  if (!v15)
  {
LABEL_7:
    v17 = v48;
LABEL_27:
    v41 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Couldn't turn address into a single string for storage", buf, 2u);
    }
    v15 = 0;
    v16 = 0;
    goto LABEL_30;
  }
LABEL_11:
  [NSNumber numberWithDouble:*MEMORY[0x1E4F5CCA0]];
  uint64_t v23 = v22 = v7;
  v24 = (void *)MEMORY[0x1E4F5CCE0];
  v25 = [v48 label];
  id v46 = v22;
  v26 = +[PKPaymentOptionsRecents _coreRecentsKindForPreference:v22];
  v27 = [MEMORY[0x1E4F1C9C8] date];
  id v28 = (void *)[v49 copy];
  v47 = v23;
  uint64_t v29 = [v24 recentEventForAddress:v15 displayName:v25 kind:v26 date:v27 weight:v23 metadata:v28 options:1];

  if (v29)
  {
    v44 = v8;
    id v45 = v6;
    recentContactsLibrary = self->_recentContactsLibrary;
    v43 = v29;
    v56[0] = v29;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    [(CRRecentContactsLibrary *)recentContactsLibrary recordContactEvents:v31 recentsDomain:*MEMORY[0x1E4F5CCD0] sendingAddress:0 completion:&__block_literal_global_204];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v7 = v46;
    uint64_t v32 = [(PKPaymentOptionsRecents *)self recentsForPreference:v46];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      v16 = 0;
      uint64_t v35 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v38 = [v37 recentContact];
          int v39 = [v38 hasFullTextMatch:v15];

          if (v39)
          {
            uint64_t v40 = [v37 recentContact];

            v16 = (PKRecentContact *)v40;
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v34);
    }
    else
    {
      v16 = 0;
    }

    objc_super v8 = v44;
    id v6 = v45;
    uint64_t v29 = v43;
  }
  else
  {
    v16 = 0;
    id v7 = v46;
  }

  v41 = v47;
  v17 = v48;
LABEL_30:

LABEL_31:
  return v16;
}

void __63__PKPaymentOptionsRecents_saveContactToCoreRecents_preference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentOptionsRecents: Failed to save contact to CoreRecents with error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)recentsForPreference:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__78;
  int v20 = __Block_byref_object_dispose__78;
  id v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__PKPaymentOptionsRecents_recentsForPreference___block_invoke;
  v12[3] = &unk_1E56F3D10;
  id v6 = v4;
  id v13 = v6;
  v15 = &v16;
  id v7 = v5;
  v14 = v7;
  [(PKPaymentOptionsRecents *)self recentsForPreference:v6 queue:0 completion:v12];
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_error_impl(&dword_190E10000, v9, OS_LOG_TYPE_ERROR, "Timed out awaiting recents for preference: %@", buf, 0xCu);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __48__PKPaymentOptionsRecents_recentsForPreference___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "PKPaymentOptionsRecents: Failed to get recents from CoreRecents for preference: %@ with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)recentsForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKPaymentOptionsSynchronization *)self->_optionsSynchronization shouldSyncToCloud])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__PKPaymentOptionsRecents_recentsForPreference_queue_completion___block_invoke;
    v12[3] = &unk_1E56EF1D0;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    [(PKPaymentOptionsRecents *)self _coreRecentsContactsForPreference:v13 queue:v9 completion:v12];
  }
  else
  {
    uint64_t v11 = [(PKPaymentOptionsRecents *)self _contactsFromKeychainForPreference:v8];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v11, 0);
  }
}

void __65__PKPaymentOptionsRecents_recentsForPreference_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if (!v6)
  {
    unint64_t v8 = [v5 count];
    if (v8 >= 6)
    {
      id v9 = objc_msgSend(v5, "subarrayWithRange:", 5, v8 - 5);
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      id v26 = 0;
      [v10 removeRecentContacts:v9 error:&v26];
      id v11 = v26;
      uint64_t v12 = objc_msgSend(v5, "subarrayWithRange:", 0, 5);

      id v13 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v9 count];
        id v15 = objc_opt_class();
        *(_DWORD *)buf = 67109634;
        int v29 = v14;
        __int16 v30 = 2112;
        uint64_t v31 = v15;
        __int16 v32 = 2112;
        id v33 = v11;
        id v16 = v15;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Culled %d recents for preference %@ with error: %@", buf, 0x1Cu);
      }
      id v5 = (id)v12;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v5;
    uint64_t v17 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v5);
          }
          id v21 = objc_msgSend(*(id *)(a1 + 32), "_contactFromRecent:preference:", *(void *)(*((void *)&v22 + 1) + 8 * v20), *(void *)(a1 + 40), (void)v22);
          [v7 safelyAddObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteRecentsForPreference:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  optionsSynchronization = self->_optionsSynchronization;
  id v11 = a3;
  if ([(PKPaymentOptionsSynchronization *)optionsSynchronization shouldSyncToCloud])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__PKPaymentOptionsRecents_deleteRecentsForPreference_callbackQueue_completion___block_invoke;
    v12[3] = &unk_1E56D90B0;
    void v12[4] = self;
    id v13 = v9;
    [(PKPaymentOptionsRecents *)self _coreRecentsContactsForPreference:v11 queue:v8 completion:v12];
  }
  else
  {
    [(PKPaymentOptionsRecents *)self _deleteRecentContactsFromKeychainForPreference:v11];

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __79__PKPaymentOptionsRecents_deleteRecentsForPreference_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    if ([v5 count])
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 40);
      id v10 = 0;
      [v8 removeRecentContacts:v5 error:&v10];
      id v7 = v10;
    }
    else
    {
      id v7 = 0;
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
  }
}

- (void)deleteRecent:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKPaymentOptionsRecents *)self _deleteRecentContactFromKeychain:v4 forPreference:0];
    }
    else
    {
      recentContactsLibrary = self->_recentContactsLibrary;
      v12[0] = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      id v9 = 0;
      [(CRRecentContactsLibrary *)recentContactsLibrary removeRecentContacts:v6 error:&v9];
      id v7 = v9;

      if (v7)
      {
        id v8 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v7;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentOptionsRecents: Failed to remove contact from CoreRecents with error: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)_postalAddressLabeledValueFromRecent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];
  id v5 = [v4 objectForKey:@"postalAddress"];
  id v6 = [MEMORY[0x1E4F1BA80] backwardsCompatiblePostalAddressDictionary:v5];

  id v7 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v6];
  id v8 = (void *)[v7 mutableCopy];

  PKCorrectCountryCodeIfNecessaryForPostalAddress(v8);
  objc_claimAutoreleasedReturnValue();

  id v9 = (void *)MEMORY[0x1E4F1BA20];
  id v10 = [v3 displayName];

  id v11 = (void *)[v8 copy];
  uint64_t v12 = [v9 labeledValueWithLabel:v10 value:v11];

  return v12;
}

- (id)_contactFromRecent:(id)a3 preference:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 metadata];
  id v8 = [v6 contactKey];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = *MEMORY[0x1E4F1AF10];
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    if (v7)
    {
      id v11 = [(PKPaymentOptionsRecents *)self _postalAddressLabeledValueFromRecent:v5];
      uint64_t v12 = v9;
      id v13 = v11;
      uint64_t v14 = v10;
LABEL_8:
      [v12 setObject:v13 forKey:v14];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F1AEE0];
    if ([v8 isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      id v16 = (void *)MEMORY[0x1E4F1BA70];
      uint64_t v17 = [v5 address];
      id v11 = [v16 phoneNumberWithStringValue:v17];

      uint64_t v18 = (void *)MEMORY[0x1E4F1BA20];
      uint64_t v19 = [v5 displayName];
      uint64_t v20 = [v18 labeledValueWithLabel:v19 value:v11];

      [v9 setObject:v20 forKey:v15];
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v21 = *MEMORY[0x1E4F1ADC8];
    if ([v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      long long v22 = (void *)MEMORY[0x1E4F1BA20];
      long long v23 = [v5 displayName];
      long long v24 = [v5 address];
      id v11 = [v22 labeledValueWithLabel:v23 value:v24];

      uint64_t v12 = v9;
      id v13 = v11;
      uint64_t v14 = v21;
      goto LABEL_8;
    }
  }
LABEL_10:
  long long v25 = [v6 contactKeys];
  unint64_t v26 = [v25 count];

  v63 = v5;
  if (v26 < 2) {
    goto LABEL_29;
  }
  v61 = v8;
  v27 = (void *)MEMORY[0x1E4F1CAA0];
  id v28 = [v6 contactKeys];
  id v62 = v6;
  int v29 = [v6 contactKeys];
  __int16 v30 = objc_msgSend(v27, "orderedSetWithOrderedSet:range:copyItems:", v28, 1, objc_msgSend(v29, "count") - 1, 0);

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (!v32) {
    goto LABEL_28;
  }
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)v69;
  uint64_t v35 = *MEMORY[0x1E4F1ADC8];
  v64 = v7;
  uint64_t v65 = *MEMORY[0x1E4F1AEE0];
  v66 = v9;
  do
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v69 != v34) {
        objc_enumerationMutation(v31);
      }
      v37 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      if ([v37 isEqualToString:v10])
      {
        v38 = [(PKPaymentOptionsRecents *)self _postalAddressLabeledValueFromRecent:v5];
        [v9 setObject:v38 forKey:v10];
      }
      else if ([v37 isEqualToString:v35])
      {
        v38 = [v7 objectForKey:@"emailAddresses"];
        if (v38)
        {
          int v39 = (void *)MEMORY[0x1E4F1BA20];
          uint64_t v40 = [v5 displayName];
          v41 = [v39 labeledValueWithLabel:v40 value:v38];

          id v7 = v64;
          [v66 setObject:v41 forKey:v35];
LABEL_24:

          id v9 = v66;
        }
      }
      else
      {
        if (![v37 isEqualToString:v65]) {
          continue;
        }
        v38 = [v7 objectForKey:@"phoneNumbers"];
        if (v38)
        {
          v41 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v38];
          v42 = (void *)MEMORY[0x1E4F1BA20];
          v43 = [v5 displayName];
          v44 = [v42 labeledValueWithLabel:v43 value:v41];

          id v5 = v63;
          [v66 setObject:v44 forKey:v65];

          id v7 = v64;
          goto LABEL_24;
        }
      }
    }
    uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v72 count:16];
  }
  while (v33);
LABEL_28:

  id v8 = v61;
  id v6 = v62;
LABEL_29:
  id v45 = [v9 keysOfEntriesPassingTest:&__block_literal_global_84_0];
  id v46 = [v45 allObjects];
  [v9 removeObjectsForKeys:v46];

  v47 = [v9 allKeys];
  uint64_t v48 = v9;
  uint64_t v49 = [v47 count];

  if (v49)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    long long v51 = [v7 PKStringForKey:@"givenName"];
    [v50 setGivenName:v51];

    long long v52 = [v7 PKStringForKey:@"familyName"];
    [v50 setFamilyName:v52];

    id v53 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    long long v54 = [v7 PKStringForKey:@"phoneticGivenName"];
    [v53 setGivenName:v54];

    v55 = [v7 PKStringForKey:@"phoneticFamilyName"];
    [v53 setFamilyName:v55];

    [v50 setPhoneticRepresentation:v53];
    [MEMORY[0x1E4F1B8F8] pkContactWithNameComponents:v50 labeledValues:v48];
    v57 = uint64_t v56 = v7;
  }
  else
  {
    uint64_t v56 = v7;
    v57 = 0;
  }
  v58 = [v56 valueForKey:@"contactFromContactInformation"];
  uint64_t v59 = [v58 BOOLValue];

  [v57 setRecentFromContactInformation:v59];
  [v57 setRecentContact:v63];
  [v57 setContactSource:3];

  return v57;
}

uint64_t __57__PKPaymentOptionsRecents__contactFromRecent_preference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 value];
  if (v4)
  {
    id v5 = [v3 value];
    id v6 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)deleteAllRecentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKPaymentOptionsSynchronization *)self->_optionsSynchronization shouldSyncToCloud])
  {
    id v8 = [(PKPaymentOptionsRecents *)self _defaultCRSearchQuery];
    [v8 setSearchPredicate:0];
    recentContactsLibrary = self->_recentContactsLibrary;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaymentOptionsRecents_deleteAllRecentsWithCallbackQueue_completion___block_invoke;
    v10[3] = &unk_1E56D90B0;
    v10[4] = self;
    id v11 = v7;
    [(CRRecentContactsLibrary *)recentContactsLibrary performRecentsSearch:v8 queue:v6 completion:v10];
  }
  else
  {
    [(PKPaymentOptionsRecents *)self _deleteRecentContactsFromKeychainForContactKey:*MEMORY[0x1E4F1ADC8]];
    [(PKPaymentOptionsRecents *)self _deleteRecentContactsFromKeychainForContactKey:*MEMORY[0x1E4F1AEE0]];
    [(PKPaymentOptionsRecents *)self _deleteRecentContactsFromKeychainForContactKey:*MEMORY[0x1E4F1AF10]];
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __72__PKPaymentOptionsRecents_deleteAllRecentsWithCallbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    if ([v5 count])
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 40);
      id v10 = 0;
      [v8 removeRecentContacts:v5 error:&v10];
      id v7 = v10;
    }
    else
    {
      id v7 = 0;
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
  }
}

- (id)meCardEntriesForPreference:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__78;
  id v16 = __Block_byref_object_dispose__78;
  id v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PKPaymentOptionsRecents_meCardEntriesForPreference___block_invoke;
  v9[3] = &unk_1E56DD778;
  id v11 = &v12;
  id v6 = v5;
  id v10 = v6;
  [(PKPaymentOptionsRecents *)self meCardEntriesForPreference:v4 queue:0 completion:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__PKPaymentOptionsRecents_meCardEntriesForPreference___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)meCardEntriesForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C978] array];
  if (v9)
  {
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
  }
  id v13 = v12;
  uint64_t v14 = [(PKPaymentOptionsRecents *)self meCard];
  if (v14)
  {
    uint64_t v15 = [(PKPaymentOptionsRecents *)self _labelsToPropertiesDictionaryForContact:v14];
    id v16 = [v8 contactKeys];
    unint64_t v17 = [v16 count];

    if (v17 < 2)
    {
      uint64_t v18 = [v8 contactKey];
      [(PKPaymentOptionsRecents *)self _meCardEntries:v14 forContactKey:v18 labelsToProperties:v15];
    }
    else
    {
      uint64_t v18 = [v8 contactKeys];
      [(PKPaymentOptionsRecents *)self _meCardEntries:v14 forContactKeys:v18 labelsToProperties:v15];
    uint64_t v19 = };

    if (![v19 count])
    {
      uint64_t v20 = [v8 contactKeys];
      int v21 = [v20 containsObject:*MEMORY[0x1E4F1ADE0]];

      if (v21)
      {
        long long v22 = (void *)MEMORY[0x1E4F1B8F8];
        long long v23 = [v14 nameComponents];
        long long v24 = [v22 pkContactWithNameComponents:v23 labeledValues:MEMORY[0x1E4F1CC08]];

        [v24 setContactSource:1];
        v34[0] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];

        uint64_t v19 = (void *)v25;
      }
    }

    id v11 = v19;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__PKPaymentOptionsRecents_meCardEntriesForPreference_queue_completion___block_invoke;
  v29[3] = &unk_1E56D83D8;
  id v30 = v11;
  id v31 = v10;
  unint64_t v26 = v29;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_19;
  block[3] = &unk_1E56D8360;
  id v33 = v26;
  id v27 = v11;
  id v28 = v10;
  dispatch_async(v13, block);
}

uint64_t __71__PKPaymentOptionsRecents_meCardEntriesForPreference_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_meCardEntries:(id)a3 forContactKeys:(id)a4 labelsToProperties:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v35 = a4;
  id v7 = a5;
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v34 = v7;
  id obj = [v7 allKeys];
  uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v36)
  {
    uint64_t v33 = *(void *)v46;
    uint64_t v8 = *MEMORY[0x1E4F1AF10];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v9;
        id v10 = [v34 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * v9)];
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v12 = v35;
        uint64_t v40 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v40)
        {
          v38 = v10;
          uint64_t v39 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v42 != v39) {
                objc_enumerationMutation(v12);
              }
              uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              uint64_t v15 = [v10 objectForKeyedSubscript:v14];
              id v16 = v15;
              if (v15)
              {
                unint64_t v17 = [v15 firstObject];
                uint64_t v18 = [v17 value];
                if ([v14 isEqualToString:v8]
                  && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  uint64_t v19 = (void *)[v18 mutableCopy];
                  PKCorrectCountryCodeIfNecessaryForPostalAddress(v19);
                  objc_claimAutoreleasedReturnValue();

                  [v17 labeledValueBySettingValue:v19];
                  v21 = uint64_t v20 = v8;
                  [v11 setObject:v21 forKeyedSubscript:v14];

                  uint64_t v8 = v20;
                  id v10 = v38;
                }
                else
                {
                  [v11 setObject:v17 forKeyedSubscript:v14];
                }
              }
            }
            uint64_t v40 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v40);
        }

        long long v22 = [v11 allKeys];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          long long v24 = (void *)MEMORY[0x1E4F1B8F8];
          uint64_t v25 = [v32 nameComponents];
          unint64_t v26 = (void *)[v11 copy];
          id v27 = [v24 pkContactWithNameComponents:v25 labeledValues:v26];

          [v27 setContactSource:1];
          [v31 addObject:v27];
        }
        uint64_t v9 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v36);
  }

  id v28 = (void *)[v31 copy];
  return v28;
}

- (id)_meCardEntries:(id)a3 forContactKey:(id)a4 labelsToProperties:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [v8 allKeys];
    uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v29)
    {
      uint64_t v27 = *(void *)v40;
      uint64_t v9 = *MEMORY[0x1E4F1AF10];
      id v28 = v8;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = v10;
          id v30 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * v10)];
          id v32 = [v30 objectForKeyedSubscript:v7];
          if (v32)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v11 = [v32 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v36 != v13) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
                  unint64_t v17 = [v15 value];
                  if ([v7 isEqualToString:v9]
                    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    uint64_t v18 = (void *)[v17 mutableCopy];
                    PKCorrectCountryCodeIfNecessaryForPostalAddress(v18);
                    objc_claimAutoreleasedReturnValue();

                    uint64_t v19 = [v15 labeledValueBySettingValue:v18];
                    [v16 setObject:v19 forKeyedSubscript:v7];
                  }
                  else
                  {
                    [v16 setObject:v15 forKeyedSubscript:v7];
                  }
                  uint64_t v20 = (void *)MEMORY[0x1E4F1B8F8];
                  int v21 = [v34 nameComponents];
                  long long v22 = (void *)[v16 copy];
                  uint64_t v23 = [v20 pkContactWithNameComponents:v21 labeledValues:v22];

                  [v23 setContactSource:1];
                  [v33 addObject:v23];
                }
                uint64_t v12 = [v32 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v12);
            }
          }

          uint64_t v10 = v31 + 1;
          id v8 = v28;
        }
        while (v31 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v29);
    }

    long long v24 = (void *)[v33 copy];
  }
  else
  {
    long long v24 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (void)setMeCardCachingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke;
  aBlock[3] = &unk_1E56DD818;
  objc_copyWeak(&v15, &location);
  dispatch_semaphore_t v5 = (void (**)(void))_Block_copy(aBlock);
  if (self->_meCardCachingEnabled != v3)
  {
    if (self->_meCardCachingEnabled)
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self->_meContactDidChangeNotificationObserver];

      meContactDidChangeNotificationObserver = self->_meContactDidChangeNotificationObserver;
      self->_meContactDidChangeNotificationObserver = 0;
    }
    self->_meCardCachingEnabled = v3;
    if (v3)
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = *MEMORY[0x1E4F1AF88];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke_2;
      v12[3] = &unk_1E56F3D58;
      uint64_t v13 = v5;
      uint64_t v10 = [v8 addObserverForName:v9 object:0 queue:0 usingBlock:v12];
      uint64_t v11 = self->_meContactDidChangeNotificationObserver;
      self->_meContactDidChangeNotificationObserver = v10;
    }
    else
    {
      v5[2](v5);
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    BOOL v3 = WeakRetained;

    WeakRetained = v3;
  }
}

uint64_t __51__PKPaymentOptionsRecents_setMeCardCachingEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateRecentsAndKeychainWithContactInformation:(id)a3
{
  id v4 = a3;
  id v11 = +[PKContactInformation contactInformationFromKeychain];
  dispatch_semaphore_t v5 = [v4 postalAddresses];
  id v6 = [v11 postalAddresses];
  [(PKPaymentOptionsRecents *)self _updateRecentsWithContactsFromContactInformation:v5 currentKeychainContacts:v6 forContactKey:*MEMORY[0x1E4F1AF10]];

  id v7 = [v4 emailAddresses];
  id v8 = [v11 emailAddresses];
  [(PKPaymentOptionsRecents *)self _updateRecentsWithContactsFromContactInformation:v7 currentKeychainContacts:v8 forContactKey:*MEMORY[0x1E4F1ADC8]];

  uint64_t v9 = [v4 phoneNumbers];
  uint64_t v10 = [v11 phoneNumbers];
  [(PKPaymentOptionsRecents *)self _updateRecentsWithContactsFromContactInformation:v9 currentKeychainContacts:v10 forContactKey:*MEMORY[0x1E4F1AEE0]];

  +[PKContactInformation saveContactInformationToKeychain:v4];
}

- (void)_updateRecentsWithContactsFromContactInformation:(id)a3 currentKeychainContacts:(id)a4 forContactKey:(id)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v52 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v58 = v8;
  id v53 = (id)[v8 mutableCopy];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v15 = v58;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v76 objects:v90 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v77;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v77 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v76 + 1) + 8 * v19);
            if (objc_msgSend(v20, "isEqualIgnoringIdentifiers:", v14, v52)) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = [v15 countByEnumeratingWithState:&v76 objects:v90 count:16];
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v21 = v20;

          if (!v21) {
            goto LABEL_19;
          }
          [v53 removeObject:v21];
          long long v22 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v21 description];
            uint64_t v24 = [v23 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v89 = v24;
            _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Not adding contact info to CoreRecents as it exists in KeyChain:\n%s\n", buf, 0xCu);
          }
        }
        else
        {
LABEL_14:

LABEL_19:
          objc_msgSend(v9, "addObject:", v14, v52);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
    }
    while (v11);
  }

  uint64_t v25 = objc_alloc_init(PKPaymentPreferenceContact);
  [(PKPaymentPreferenceContact *)v25 setContactKey:v52];
  v57 = v25;
  unint64_t v26 = [(PKPaymentOptionsRecents *)self recentsForPreference:v25];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v55 = v9;
  uint64_t v27 = [v55 countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v73 != v29) {
          objc_enumerationMutation(v55);
        }
        uint64_t v31 = *(void **)(*((void *)&v72 + 1) + 8 * j);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v32 = v26;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v86 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v69;
LABEL_29:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v69 != v35) {
              objc_enumerationMutation(v32);
            }
            long long v37 = *(void **)(*((void *)&v68 + 1) + 8 * v36);
            if (objc_msgSend(v37, "isEqualIgnoringIdentifiers:", v31, v52)) {
              break;
            }
            if (v34 == ++v36)
            {
              uint64_t v34 = [v32 countByEnumeratingWithState:&v68 objects:v86 count:16];
              if (v34) {
                goto LABEL_29;
              }
              goto LABEL_35;
            }
          }
          id v38 = v37;

          if (v38) {
            goto LABEL_38;
          }
        }
        else
        {
LABEL_35:
        }
        objc_msgSend(v31, "setRecentFromContactInformation:", 1, v52);
        id v39 = [(PKPaymentOptionsRecents *)self saveContactToCoreRecents:v31 preference:v57];
        id v38 = 0;
LABEL_38:
      }
      uint64_t v28 = [v55 countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v28);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v54 = v53;
  uint64_t v40 = [v54 countByEnumeratingWithState:&v64 objects:v85 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(v54);
        }
        uint64_t v44 = *(void *)(*((void *)&v64 + 1) + 8 * k);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v45 = v26;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v60 objects:v84 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v61;
          while (2)
          {
            for (uint64_t m = 0; m != v47; ++m)
            {
              if (*(void *)v61 != v48) {
                objc_enumerationMutation(v45);
              }
              id v50 = *(void **)(*((void *)&v60 + 1) + 8 * m);
              if (objc_msgSend(v50, "isEqualIgnoringIdentifiers:", v44, v52))
              {
                uint64_t v51 = [v50 recentContact];
                [(PKPaymentOptionsRecents *)self deleteRecent:v51];

                goto LABEL_55;
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v60 objects:v84 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }
LABEL_55:
      }
      uint64_t v41 = [v54 countByEnumeratingWithState:&v64 objects:v85 count:16];
    }
    while (v41);
  }
}

- (id)_labelsToPropertiesDictionaryForContact:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = *MEMORY[0x1E4F1AEE0];
  v34[0] = *MEMORY[0x1E4F1AF10];
  v34[1] = v4;
  void v34[2] = *MEMORY[0x1E4F1ADC8];
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v5;
        uint64_t v6 = *(void *)(*((void *)&v29 + 1) + 8 * v5);
        id v7 = [v22 valueForKey:v6];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v13 = [v12 label];

              if (v13)
              {
                uint64_t v14 = [v12 label];
                id v15 = [v3 objectForKey:v14];

                if (!v15)
                {
                  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
                  uint64_t v16 = [v12 label];
                  [v3 setObject:v15 forKey:v16];
                }
                uint64_t v17 = [v15 objectForKeyedSubscript:v6];
                if (!v17)
                {
                  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
                  [v15 setObject:v17 forKey:v6];
                }
                [v17 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v23);
  }

  uint64_t v18 = (void *)[v3 copy];
  return v18;
}

+ (id)_coreRecentsKindForPreference:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 contactKey];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v5)
  {
    uint64_t v6 = (id *)MEMORY[0x1E4F5CC78];
LABEL_7:
    id v11 = *v6;
    goto LABEL_8;
  }
  id v7 = [v3 contactKey];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v8)
  {
    uint64_t v6 = (id *)MEMORY[0x1E4F5CC60];
    goto LABEL_7;
  }
  uint64_t v9 = [v3 contactKey];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v10)
  {
    uint64_t v6 = (id *)MEMORY[0x1E4F5CC80];
    goto LABEL_7;
  }
  id v11 = 0;
LABEL_8:

  return v11;
}

- (void)_coreRecentsContactsForPreference:(id)a3 queue:(id)a4 completion:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)MEMORY[0x1E4F5CCF0];
  id v11 = a3;
  uint64_t v12 = [v10 frecencyComparator];
  uint64_t v13 = [(PKPaymentOptionsRecents *)self _defaultCRSearchQuery];
  uint64_t v14 = +[PKPaymentOptionsRecents _coreRecentsKindForPreference:v11];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F5CCE8];
    uint64_t v16 = *MEMORY[0x1E4F5CC98];
    v19[0] = v14;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v18 = [v15 predicateForKey:v16 inCollection:v17];
    [v13 setSearchPredicate:v18];

    [v13 setComparator:v12];
    [(CRRecentContactsLibrary *)self->_recentContactsLibrary performRecentsSearch:v13 queue:v8 completion:v9];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (id)_defaultCRSearchQuery
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F5CCF0]);
  v5[0] = *MEMORY[0x1E4F5CCD0];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setDomains:v3];

  return v2;
}

- (id)_keychainKeyFromContactKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    uint64_t v4 = @"PKRecentPhonesKeychainKey";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    uint64_t v4 = @"PKRecentEmailsKeychainKey";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    uint64_t v4 = @"PKRecentAddressKeychainKey";
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_keychainDataForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PKKeychainItemWrapper alloc] initWithIdentifier:v3 accessGroup:@"com.apple.PassbookUIService" serviceName:@"com.apple.passkit" type:0 invisible:0];

  char v5 = [(PKKeychainItemWrapper *)v4 objectForKey:*MEMORY[0x1E4F3BD38]];

  return v5;
}

- (void)_setKeychainData:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PKKeychainItemWrapper alloc] initWithIdentifier:v5 accessGroup:@"com.apple.PassbookUIService" serviceName:@"com.apple.passkit" type:0 invisible:0];

  [(PKKeychainItemWrapper *)v7 setObject:v6 forKey:*MEMORY[0x1E4F3BD38]];
}

- (void)_addContactToKeychain:(id)a3 forPreference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentOptionsRecents *)self _contactsFromKeychainForPreference:v6];
  id v12 = (id)[v8 mutableCopy];

  [v12 addObject:v7];
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  int v10 = [v6 contactKey];

  id v11 = [(PKPaymentOptionsRecents *)self _keychainKeyFromContactKey:v10];

  [(PKPaymentOptionsRecents *)self _setKeychainData:v9 forKey:v11];
}

- (void)_deleteRecentContactFromKeychain:(id)a3 forPreference:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = v6;
  if (v6)
  {
    id v7 = [v6 contactKey];
    v42[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F1AEE0];
    v41[0] = *MEMORY[0x1E4F1ADC8];
    v41[1] = v9;
    v41[2] = *MEMORY[0x1E4F1AF10];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v12 = objc_alloc_init(PKPaymentPreferenceContact);
        [(PKPaymentPreferenceContact *)v12 setContactKey:v11];
        uint64_t v13 = [(PKPaymentOptionsRecents *)self _contactsFromKeychainForPreference:v12];
        uint64_t v14 = (void *)[v13 mutableCopy];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v32;
LABEL_11:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
            uint64_t v21 = [v20 hash];
            if (v21 == [v5 contactID]) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v17) {
                goto LABEL_11;
              }
              goto LABEL_17;
            }
          }
          id v22 = v20;

          if (!v22) {
            goto LABEL_19;
          }
          uint64_t v23 = objc_msgSend(v15, "pk_arrayByRemovingObject:", v22);

          uint64_t v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v23 requiringSecureCoding:1 error:0];
          if (v24)
          {
            long long v25 = [(PKPaymentOptionsRecents *)self _keychainKeyFromContactKey:v11];
            [(PKPaymentOptionsRecents *)self _setKeychainData:v24 forKey:v25];
          }
          goto LABEL_25;
        }
LABEL_17:

LABEL_19:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }
LABEL_25:
}

- (void)_deleteRecentContactsFromKeychainForPreference:(id)a3
{
  id v4 = [a3 contactKey];
  [(PKPaymentOptionsRecents *)self _deleteRecentContactsFromKeychainForContactKey:v4];
}

- (void)_deleteRecentContactsFromKeychainForContactKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DB0];
  id v5 = a3;
  id v7 = [v4 archivedDataWithRootObject:MEMORY[0x1E4F1CBF0] requiringSecureCoding:1 error:0];
  id v6 = [(PKPaymentOptionsRecents *)self _keychainKeyFromContactKey:v5];

  [(PKPaymentOptionsRecents *)self _setKeychainData:v7 forKey:v6];
}

- (id)_contactsFromKeychainForPreference:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 contactKey];
  id v5 = [(PKPaymentOptionsRecents *)self _keychainKeyFromContactKey:v4];
  id v6 = [(PKPaymentOptionsRecents *)self _keychainDataForKey:v5];
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  int v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  id v27 = 0;
  uint64_t v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v27];
  id v12 = v27;

  if (v12)
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v12;
      _os_log_error_impl(&dword_190E10000, v13, OS_LOG_TYPE_ERROR, "PKPaymentOptionsRecents: error trying to read contact data from keychain. %{public}@.", buf, 0xCu);
    }
  }
  if (!v11)
  {
LABEL_7:
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:MEMORY[0x1E4F1CBF0] requiringSecureCoding:1 error:0];
    [(PKPaymentOptionsRecents *)self _setKeychainData:v14 forKey:v5];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v21 = objc_alloc_init(PKRecentContact);
        -[PKRecentContact setContactID:](v21, "setContactID:", [v20 hash]);
        [v20 setRecentContact:v21];
        [v20 setContactSource:3];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  return v15;
}

- (BOOL)isMeCardCachingEnabled
{
  return self->_meCardCachingEnabled;
}

- (CRRecentContactsLibrary)recentContactsLibrary
{
  return self->_recentContactsLibrary;
}

- (void)setRecentContactsLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentContactsLibrary, 0);
  objc_storeStrong((id *)&self->_optionsSynchronization, 0);
  objc_storeStrong((id *)&self->_meContactDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_cachedMeContact, 0);
}

@end