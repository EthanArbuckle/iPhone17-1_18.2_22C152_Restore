@interface _PSContactResolver
+ (id)handlesForContactFavorites;
+ (id)normalizedHandlesDictionaryFromHandles:(id)a3;
- (CNContactStore)contactStore;
- (NSArray)keysToFetch;
- (_PSContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4;
- (id)allEmailAndPhoneNumberHandlesForContact:(id)a3;
- (id)contactWithIdentifier:(id)a3;
- (id)resolveContact:(id)a3;
- (id)resolveContactFromINPerson:(id)a3;
- (id)resolveContactIdentifier:(id)a3;
- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3;
- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3 pickFirstOfMultiple:(BOOL)a4;
@end

@implementation _PSContactResolver

- (_PSContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSContactResolver;
  v9 = [(_PSContactResolver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_keysToFetch, a4);
  }

  return v10;
}

- (id)contactWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(_PSContactResolver *)self contactStore];
  v6 = [(_PSContactResolver *)self keysToFetch];
  id v7 = [v5 unifiedContactWithIdentifier:v4 keysToFetch:v6 error:0];

  return v7;
}

- (id)resolveContactFromINPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 contactIdentifier];

  if (!v5
    || ([v4 contactIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(_PSContactResolver *)self contactWithIdentifier:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = [v4 personHandle];
    v9 = [v8 value];

    if (v9)
    {
      v10 = [v4 personHandle];
      v11 = [v10 value];
      id v7 = [(_PSContactResolver *)self resolveContactIfPossibleFromContactIdentifierString:v11];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)allEmailAndPhoneNumberHandlesForContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 phoneNumbers];
  v5 = [v4 valueForKey:@"value"];

  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "unformattedInternationalStringValue", (void)v18);

        if (v13)
        {
          v14 = [v12 unformattedInternationalStringValue];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v15 = [v3 emailAddresses];
  v16 = [v15 valueForKey:@"value"];

  [v6 addObjectsFromArray:v16];

  return v6;
}

- (id)resolveContactIdentifier:(id)a3
{
  v31[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  if (!getuid()) {
    goto LABEL_15;
  }
  v5 = [v4 identifier];

  if (!v5) {
    goto LABEL_15;
  }
  v6 = [v4 identifier];
  int v7 = [v6 containsString:@"@"];

  id CNContactClass_2 = getCNContactClass_2();
  if (v7)
  {
    uint64_t v9 = [v4 identifier];
    uint64_t v10 = [CNContactClass_2 predicateForContactsMatchingEmailAddress:v9];
  }
  else
  {
    id CNPhoneNumberClass = getCNPhoneNumberClass();
    uint64_t v9 = [v4 identifier];
    objc_super v12 = [CNPhoneNumberClass phoneNumberWithStringValue:v9];
    uint64_t v10 = [CNContactClass_2 predicateForContactsMatchingPhoneNumber:v12];
  }
  if (!v10)
  {
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  v13 = [(_PSContactResolver *)self contactStore];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v14 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_3;
  uint64_t v30 = getCNContactIdentifierKeySymbolLoc_ptr_3;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_3)
  {
    v25[1] = (id)MEMORY[0x1E4F143A8];
    v25[2] = (id)3221225472;
    v25[3] = __getCNContactIdentifierKeySymbolLoc_block_invoke_3;
    v25[4] = &unk_1E5ADE858;
    v26 = &v27;
    v15 = (void *)ContactsLibrary_2();
    v28[3] = (uint64_t)dlsym(v15, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr_3 = *(void *)(v26[1] + 24);
    v14 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v14)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  v31[0] = *v14;
  v16 = (void *)MEMORY[0x1E4F1C978];
  id v17 = v31[0];
  long long v18 = [v16 arrayWithObjects:v31 count:1];
  v25[0] = 0;
  long long v19 = [v13 unifiedContactsMatchingPredicate:v10 keysToFetch:v18 error:v25];
  id v20 = v25[0];

  if (v20)
  {
    long long v21 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      _PSResolveContactWithPredicate_cold_1((uint64_t)v20, v21);
    }

    goto LABEL_21;
  }
  if ([v19 count] != 1)
  {
LABEL_21:
    v22 = 0;
    v24 = v19;
    goto LABEL_22;
  }
  v24 = [v19 firstObject];
  v22 = [v24 identifier];
  id v20 = v19;
LABEL_22:

LABEL_16:

  return v22;
}

- (id)resolveContact:(id)a3
{
  if (a3)
  {
    id v4 = [a3 identifier];
    v5 = [(_PSContactResolver *)self resolveContactIfPossibleFromContactIdentifierString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3
{
  return [(_PSContactResolver *)self resolveContactIfPossibleFromContactIdentifierString:a3 pickFirstOfMultiple:0];
}

- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3 pickFirstOfMultiple:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if (!v6)
  {
    v14 = 0;
    goto LABEL_9;
  }
  int v8 = [v6 containsString:@"@"];
  id CNContactClass_2 = getCNContactClass_2();
  uint64_t v10 = CNContactClass_2;
  if (!v8)
  {
    v15 = [getCNPhoneNumberClass() phoneNumberWithStringValue:v7];
    v11 = [v10 predicateForContactsMatchingPhoneNumber:v15];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v11 = [CNContactClass_2 predicateForContactsMatchingEmailAddress:v7];
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  objc_super v12 = [(_PSContactResolver *)self contactStore];
  v13 = [(_PSContactResolver *)self keysToFetch];
  v14 = _PSResolveContactWithPredicate(v11, v12, v13, v4);

LABEL_8:
LABEL_9:

  return v14;
}

+ (id)normalizedHandlesDictionaryFromHandles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "containsString:", @"@", (void)v14))
        {
          [v4 setObject:v10 forKeyedSubscript:v10];
        }
        else
        {
          v11 = [getCNPhoneNumberClass() phoneNumberWithStringValue:v10];
          objc_super v12 = [v11 unformattedInternationalStringValue];
          if ([v12 length]) {
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)handlesForContactFavorites
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B3A8] sharedInstance];
  id v3 = [v2 favoriteContactEntries];

  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [v8 contactProperty];
        uint64_t v10 = [v9 key];

        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        v11 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr_1;
        uint64_t v36 = getCNContactPhoneNumbersKeySymbolLoc_ptr_1;
        if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_1)
        {
          uint64_t v28 = MEMORY[0x1E4F143A8];
          uint64_t v29 = 3221225472;
          uint64_t v30 = __getCNContactPhoneNumbersKeySymbolLoc_block_invoke_1;
          v31 = &unk_1E5ADE858;
          v32 = &v33;
          objc_super v12 = (void *)ContactsLibrary_2();
          v13 = dlsym(v12, "CNContactPhoneNumbersKey");
          *(void *)(v32[1] + 24) = v13;
          getCNContactPhoneNumbersKeySymbolLoc_ptr_1 = *(void *)(v32[1] + 24);
          v11 = (void *)v34[3];
        }
        _Block_object_dispose(&v33, 8);
        if (!v11)
        {
LABEL_25:
          -[_PSBlockedHandlesCache beginSyncingWithTU]();
          __break(1u);
        }
        if ([v10 isEqualToString:*v11])
        {
          long long v14 = [v8 contactProperty];
          long long v15 = [v14 value];

          uint64_t v16 = [v15 unformattedInternationalStringValue];
LABEL_16:
          id v20 = (void *)v16;

          goto LABEL_18;
        }
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        long long v17 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr_1;
        uint64_t v36 = getCNContactEmailAddressesKeySymbolLoc_ptr_1;
        if (!getCNContactEmailAddressesKeySymbolLoc_ptr_1)
        {
          uint64_t v28 = MEMORY[0x1E4F143A8];
          uint64_t v29 = 3221225472;
          uint64_t v30 = __getCNContactEmailAddressesKeySymbolLoc_block_invoke_1;
          v31 = &unk_1E5ADE858;
          v32 = &v33;
          long long v18 = (void *)ContactsLibrary_2();
          uint64_t v19 = dlsym(v18, "CNContactEmailAddressesKey");
          *(void *)(v32[1] + 24) = v19;
          getCNContactEmailAddressesKeySymbolLoc_ptr_1 = *(void *)(v32[1] + 24);
          long long v17 = (void *)v34[3];
        }
        _Block_object_dispose(&v33, 8);
        if (!v17) {
          goto LABEL_25;
        }
        if ([v10 isEqualToString:*v17])
        {
          long long v15 = [v8 contactProperty];
          uint64_t v16 = [v15 value];
          goto LABEL_16;
        }
        id v20 = 0;
LABEL_18:
        if ([v20 length]) {
          [v4 addObject:v20];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v5);
  }

  long long v21 = (void *)[v4 copy];

  return v21;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end