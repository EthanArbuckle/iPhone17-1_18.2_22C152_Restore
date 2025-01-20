@interface CNContactStore(TUSearchUtilities)
- (id)contactForDestinationId:()TUSearchUtilities;
- (id)contactForDestinationId:()TUSearchUtilities keysToFetch:;
- (id)contactForIdentifier:()TUSearchUtilities;
- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:;
- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:usingCache:;
@end

@implementation CNContactStore(TUSearchUtilities)

- (id)contactForIdentifier:()TUSearchUtilities
{
  uint64_t v4 = contactForIdentifier__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&contactForIdentifier__onceToken, &__block_literal_global_33);
  }
  v6 = [MEMORY[0x1E4F1B8F8] keysToFetchForFaceTime];
  v7 = [a1 contactForIdentifier:v5 keysToFetch:v6 usingCache:contactForIdentifier__identifierToContactCache];

  return v7;
}

- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:usingCache:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 objectForKey:v8];
  if (!v11)
  {
    v11 = [a1 contactForIdentifier:v8 keysToFetch:v9];
    if (v11) {
      [v10 setObject:v11 forKey:v8];
    }
  }

  return v11;
}

- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v12 = 0;
    id v8 = [a1 unifiedContactWithIdentifier:v6 keysToFetch:v7 error:&v12];
    id v9 = v12;
    if (v9)
    {
      id v10 = TUDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Error trying to fetch backing contact for identifier %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  return v8;
}

- (id)contactForDestinationId:()TUSearchUtilities
{
  id v4 = a3;
  if (contactForDestinationId__onceToken != -1) {
    dispatch_once(&contactForDestinationId__onceToken, &__block_literal_global_37);
  }
  id v5 = [(id)contactForDestinationId__destinationIDToContactCache objectForKey:v4];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1B8F8] keysToFetchForFaceTime];
    id v5 = [a1 contactForDestinationId:v4 keysToFetch:v6];

    if (v5) {
      [(id)contactForDestinationId__destinationIDToContactCache setObject:v5 forKey:v4];
    }
  }
  id v7 = [MEMORY[0x1E4F1B8F8] keysToFetchForFaceTime];
  id v8 = [a1 contactForDestinationId:v4 keysToFetch:v7];

  return v8;
}

- (id)contactForDestinationId:()TUSearchUtilities keysToFetch:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TUHandle normalizedHandleWithDestinationID:v6];
  id v9 = [v8 value];

  if (v9)
  {
    if ([v6 _appearsToBePhoneNumber])
    {
      id v10 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v9];
      if (v10)
      {
        v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v10];
        id v12 = TUDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v11;
          _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Looking up contacts matching predicate %@", buf, 0xCu);
        }

        v13 = [v7 arrayByAddingObject:*MEMORY[0x1E4F1AEE0]];
        id v25 = 0;
        id v14 = [a1 unifiedContactsMatchingPredicate:v11 keysToFetch:v13 error:&v25];
        id v15 = v25;

        if (v14 && [v14 count])
        {
          id v16 = TUDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_impl(&dword_19C496000, v16, OS_LOG_TYPE_DEFAULT, "Found matching contacts %@, using first object", buf, 0xCu);
          }

          uint64_t v17 = [v14 firstObject];
        }
        else
        {
          v22 = TUDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:]();
          }

          uint64_t v17 = 0;
        }

        goto LABEL_32;
      }
      v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:]((uint64_t)v9, v11);
      }
      id v15 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v9];
      v18 = TUDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "Looking up contacts matching predicate %@", buf, 0xCu);
      }

      v19 = [v7 arrayByAddingObject:*MEMORY[0x1E4F1ADC8]];
      id v24 = 0;
      v11 = [a1 unifiedContactsMatchingPredicate:v10 keysToFetch:v19 error:&v24];
      id v15 = v24;

      if (v11 && [v11 count])
      {
        v20 = TUDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v11;
          _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Found matching contacts %@, using first object", buf, 0xCu);
        }

        uint64_t v17 = [v11 firstObject];
        goto LABEL_32;
      }
      v21 = TUDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:]();
      }
    }
    uint64_t v17 = 0;
LABEL_32:

    goto LABEL_33;
  }
  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:]((uint64_t)v6, v10);
  }
  id v15 = 0;
  uint64_t v17 = 0;
LABEL_33:

  return v17;
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not normalize destination ID %@ to perform contacts lookup", (uint8_t *)&v2, 0xCu);
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber using the normalized destination identifier '%@'.", (uint8_t *)&v2, 0xCu);
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "No contacts found matching predicate %@ error: %@");
}

@end