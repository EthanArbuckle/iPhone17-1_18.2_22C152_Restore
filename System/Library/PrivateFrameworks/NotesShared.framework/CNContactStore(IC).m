@interface CNContactStore(IC)
- (id)ic_contactForEmailAddressString:()IC keysToFetch:;
- (id)ic_contactForHandleString:()IC keysToFetch:;
- (id)ic_contatForPhoneNumberString:()IC keysToFetch:;
- (id)ic_existingOrNewContactFromParticipant:()IC keysToFetch:;
@end

@implementation CNContactStore(IC)

- (id)ic_existingOrNewContactFromParticipant:()IC keysToFetch:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 userIdentity];
  v9 = [v8 lookupInfo];
  v10 = [v9 emailAddress];

  if (v10)
  {
    v11 = objc_msgSend(a1, "ic_contactForEmailAddressString:keysToFetch:", v10, v7);
  }
  else
  {
    v11 = 0;
  }
  v12 = [v6 userIdentity];
  v13 = [v12 lookupInfo];
  v14 = [v13 phoneNumber];

  if (!v11 && v14)
  {
    v11 = objc_msgSend(a1, "ic_contatForPhoneNumberString:keysToFetch:", v14, v7);
  }
  if (!v11)
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CNContactStore(IC) ic_existingOrNewContactFromParticipant:keysToFetch:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v11 = objc_msgSend(MEMORY[0x1E4F1B8F8], "ic_contactFromParticipant:", v6);
  }

  return v11;
}

- (id)ic_contactForEmailAddressString:()IC keysToFetch:
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    v11 = 0;
    goto LABEL_12;
  }
  v8 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
  id v21 = 0;
  v9 = [a1 unifiedContactsMatchingPredicate:v8 keysToFetch:v7 error:&v21];
  v10 = v21;
  v11 = [v9 firstObject];

  if (v10)
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNContactStore(IC) ic_contactForEmailAddressString:keysToFetch:]((uint64_t)v10, v12);
    }
  }
  else if (v11)
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CNContactStore(IC) ic_contactForEmailAddressString:keysToFetch:](v10, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (id)ic_contatForPhoneNumberString:()IC keysToFetch:
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v6]) == 0)
  {
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  v9 = (void *)v8;
  v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v8];
  id v23 = 0;
  v11 = [a1 unifiedContactsMatchingPredicate:v10 keysToFetch:v7 error:&v23];
  v12 = v23;
  uint64_t v13 = [v11 firstObject];

  if (v12)
  {
    uint64_t v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CNContactStore(IC) ic_contatForPhoneNumberString:keysToFetch:]((uint64_t)v12, v14);
    }
  }
  else if (v13)
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CNContactStore(IC) ic_contatForPhoneNumberString:keysToFetch:](v12, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_12;
  }

  uint64_t v13 = 0;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)ic_contactForHandleString:()IC keysToFetch:
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || (objc_msgSend(a1, "ic_contactForEmailAddressString:keysToFetch:", v6, v7),
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v8 = objc_msgSend(a1, "ic_contatForPhoneNumberString:keysToFetch:", v6, v7);
  }

  return v8;
}

- (void)ic_existingOrNewContactFromParticipant:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)ic_contactForEmailAddressString:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)ic_contactForEmailAddressString:()IC keysToFetch:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot fetch contact for participant by email address {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)ic_contatForPhoneNumberString:()IC keysToFetch:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)ic_contatForPhoneNumberString:()IC keysToFetch:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot fetch contact for participant by phone number {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end