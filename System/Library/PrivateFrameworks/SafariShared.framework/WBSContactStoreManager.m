@interface WBSContactStoreManager
+ (WBSContactStoreManager)sharedContactStoreManager;
- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (CNContactStore)contactStore;
- (WBSContactStoreManager)init;
- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)contactForHandle:(id)a3 error:(id *)a4;
- (id)defaultContainerIdentifier;
- (id)temporaryContactForIdentity:(id)a3;
- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation WBSContactStoreManager

+ (WBSContactStoreManager)sharedContactStoreManager
{
  if (sharedContactStoreManager_onceToken != -1) {
    dispatch_once(&sharedContactStoreManager_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)sharedContactStoreManager_contactStore;
  return (WBSContactStoreManager *)v2;
}

void __51__WBSContactStoreManager_sharedContactStoreManager__block_invoke()
{
  v0 = objc_alloc_init(WBSContactStoreManager);
  v1 = (void *)sharedContactStoreManager_contactStore;
  sharedContactStoreManager_contactStore = (uint64_t)v0;
}

- (WBSContactStoreManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSContactStoreManager;
  v2 = [(WBSContactStoreManager *)&v7 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = v2;
  }

  return v2;
}

- (id)contactForHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    objc_super v7 = objc_msgSend(MEMORY[0x1E4F1B8F8], "safari_imageViewDescriptors");
    v8 = (void *)[v7 mutableCopy];

    v9 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    [v8 addObject:v9];

    char v10 = [v6 containsString:@"@"];
    v11 = (void *)MEMORY[0x1E4F1B8F8];
    if (v10)
    {
      v12 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v6];
      v12 = [v11 predicateForContactsMatchingPhoneNumber:v14];
    }
    v15 = [(CNContactStore *)self->_contactStore unifiedContactsMatchingPredicate:v12 keysToFetch:v8 error:a4];
    v13 = objc_msgSend(v15, "safari_firstObjectPassingTest:", &__block_literal_global_8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL __49__WBSContactStoreManager_contactForHandle_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "safari_fullName");
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)temporaryContactForIdentity:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_temporaryContacts)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    temporaryContacts = self->_temporaryContacts;
    self->_temporaryContacts = v5;
  }
  objc_super v7 = [v4 userRecordID];

  if (!v7
    || (v8 = self->_temporaryContacts,
        [v4 userRecordID],
        v9 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9],
        char v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v12 = [v4 nameComponents];
    [v12 overrideComponentsInContact:v11];

    v13 = [v4 lookupInfo];
    v14 = [v13 emailAddress];
    if (v14)
    {
      v15 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B6F8] value:v14];
      v28[0] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [v11 setEmailAddresses:v16];
    }
    v17 = [v13 phoneNumber];
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E4F1BA20];
      uint64_t v19 = *MEMORY[0x1E4F1B758];
      v20 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v17];
      v21 = [v18 labeledValueWithLabel:v19 value:v20];
      v27 = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      [v11 setPhoneNumbers:v22];
    }
    char v10 = (void *)[v11 copy];
    v23 = [v4 userRecordID];

    if (v23)
    {
      v24 = self->_temporaryContacts;
      v25 = [v4 userRecordID];
      [(NSMutableDictionary *)v24 setObject:v10 forKeyedSubscript:v25];
    }
  }

  return v10;
}

- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return [(CNContactStore *)self->_contactStore unifiedContactWithIdentifier:a3 keysToFetch:a4 error:a5];
}

- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return (id)[(CNContactStore *)self->_contactStore _ios_meContactWithKeysToFetch:a3 error:a4];
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  return [(CNContactStore *)self->_contactStore enumerateContactsWithFetchRequest:a3 error:a4 usingBlock:a5];
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return [(CNContactStore *)self->_contactStore unifiedContactsMatchingPredicate:a3 keysToFetch:a4 error:a5];
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
}

- (id)defaultContainerIdentifier
{
  return [(CNContactStore *)self->_contactStore defaultContainerIdentifier];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_temporaryContacts, 0);
}

@end