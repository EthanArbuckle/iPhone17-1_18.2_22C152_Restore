@interface CKShareParticipant(IC)
+ (id)ic_displayableNames:()IC maximumNamesCount:;
+ (id)ic_mentionableNamesCache;
+ (id)ic_participantFallbackNameForUserRecordName:()IC note:;
+ (id)ic_participantNameOrFallbackForUserRecordName:()IC note:;
+ (id)ic_participantsWithDisplayableNames:()IC maximumNamesCount:;
+ (id)ic_shortParticipantNameOrFallbackForUserRecordName:()IC note:;
+ (uint64_t)ic_mentionTokensPerParticipant;
+ (uint64_t)ic_nonCurrentUserParticipants:()IC;
- (id)ic_activityStreamDisplayName;
- (id)ic_cachedDisplayNameFromContacts;
- (id)ic_emailAddress;
- (id)ic_mentionTokens;
- (id)ic_mentionTokensFromContacts;
- (id)ic_mentionableNamesFromContacts;
- (id)ic_participantName;
- (id)ic_participantNameMatchingString:()IC returnFullName:;
- (id)ic_phoneNumber;
- (id)ic_shortParticipantName;
- (id)ic_userRecordNameInNote:()IC;
@end

@implementation CKShareParticipant(IC)

+ (id)ic_mentionableNamesCache
{
  if (ic_mentionableNamesCache_token != -1) {
    dispatch_once(&ic_mentionableNamesCache_token, &__block_literal_global_54);
  }
  v0 = (void *)ic_mentionableNamesCache_sMentionableNamesCache;
  return v0;
}

- (id)ic_participantName
{
  v2 = [a1 userIdentity];
  v3 = [v2 nameComponents];

  if (!v3)
  {
LABEL_6:
    v6 = objc_msgSend(a1, "ic_emailAddress");
    if ([v6 length]) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }

    goto LABEL_10;
  }
  v4 = objc_msgSend(v3, "ic_localizedNameWithDefaultFormattingStyle");
  objc_msgSend(v4, "ic_trimmedString");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (![v5 length])
  {

    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_6;
  }
LABEL_10:

  return v5;
}

- (id)ic_shortParticipantName
{
  v1 = [a1 userIdentity];
  v2 = [v1 nameComponents];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v2 style:1 options:0];
    v4 = objc_msgSend(v3, "ic_trimmedString");
    if ([v4 length]) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)ic_emailAddress
{
  v1 = [a1 userIdentity];
  v2 = [v1 lookupInfo];
  v3 = [v2 emailAddress];
  v4 = objc_msgSend(v3, "ic_trimmedString");

  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)ic_phoneNumber
{
  v1 = [a1 userIdentity];
  v2 = [v1 lookupInfo];
  v3 = [v2 phoneNumber];
  v4 = objc_msgSend(v3, "ic_trimmedString");

  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)ic_participantFallbackNameForUserRecordName:()IC note:
{
  id v5 = a3;
  id v6 = [a4 account];
  v7 = [v6 userRecordName];
  char v8 = objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", v7);

  if (v8) {
    v9 = @"Me";
  }
  else {
    v9 = @"Somebody";
  }
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v9 value:v9 table:0 allowSiri:1];

  return v10;
}

+ (id)ic_participantNameOrFallbackForUserRecordName:()IC note:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 participantForUserID:v5];
  char v8 = objc_msgSend(v7, "ic_participantName");
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1A3B0], "ic_participantFallbackNameForUserRecordName:note:", v5, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)ic_shortParticipantNameOrFallbackForUserRecordName:()IC note:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 participantForUserID:v5];
  char v8 = objc_msgSend(v7, "ic_shortParticipantName");
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1A3B0], "ic_participantFallbackNameForUserRecordName:note:", v5, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)ic_displayableNames:()IC maximumNamesCount:
{
  v1 = objc_msgSend(a1, "ic_participantsWithDisplayableNames:maximumNamesCount:");
  v2 = objc_msgSend(v1, "ic_compactMap:", &__block_literal_global_18);

  return v2;
}

+ (id)ic_participantsWithDisplayableNames:()IC maximumNamesCount:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (objc_msgSend(v6, "count", (void)v16) >= a4) {
        break;
      }
      if (([v12 isCurrentUser] & 1) == 0)
      {
        v13 = objc_msgSend(v12, "ic_participantName");

        if (v13) {
          objc_msgSend(v6, "ic_addNonNilObject:", v12);
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v14 = (void *)[v6 copy];
  return v14;
}

+ (uint64_t)ic_nonCurrentUserParticipants:()IC
{
  return objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_51_0);
}

+ (uint64_t)ic_mentionTokensPerParticipant
{
  return 4;
}

- (id)ic_mentionTokens
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend((id)objc_opt_class(), "ic_mentionTokensPerParticipant"));
  v3 = [a1 userIdentity];
  v4 = [v3 nameComponents];
  id v5 = [v4 givenName];
  id v6 = objc_msgSend(v5, "ic_tokenSafeText");

  objc_msgSend(v2, "ic_addNonEmptyString:", v6);
  id v7 = [a1 userIdentity];
  uint64_t v8 = [v7 nameComponents];
  uint64_t v9 = [v8 familyName];
  uint64_t v10 = objc_msgSend(v9, "ic_tokenSafeText");

  objc_msgSend(v2, "ic_addNonEmptyString:", v10);
  uint64_t v11 = [a1 userIdentity];
  v12 = [v11 nameComponents];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v12 style:4 options:0];
    if ((objc_msgSend(v13, "ic_containsWhitespaceCharacters") & 1) == 0)
    {
      v14 = objc_msgSend(v13, "ic_tokenSafeText");
      objc_msgSend(v2, "ic_addNonEmptyString:", v14);
    }
    v15 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v12 style:0 options:0];

    long long v16 = objc_msgSend(v15, "ic_tokenSafeText");
    objc_msgSend(v2, "ic_addNonEmptyString:", v16);
  }
  long long v17 = (void *)[v2 copy];

  return v17;
}

- (id)ic_mentionTokensFromContacts
{
  v1 = objc_msgSend(a1, "ic_mentionableNamesFromContacts");
  v2 = objc_msgSend(v1, "ic_compactMap:", &__block_literal_global_58);

  return v2;
}

- (id)ic_mentionableNamesFromContacts
{
  v64[6] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"![NSThread isMainThread]" functionName:"-[CKShareParticipant(IC) ic_mentionableNamesFromContacts]" simulateCrash:1 showAlert:0 format:@"Unexpected call from main thread"];
  }
  v2 = objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v3 = [v2 objectForKey:a1];

  if (!v3)
  {
    v3 = objc_alloc_init(ICShareParticipantCacheEntry);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = objc_msgSend(a1, "ic_emailAddress");
    id v7 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v8 = *MEMORY[0x1E4F1ADF0];
    v64[0] = *MEMORY[0x1E4F1AFA8];
    v64[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AEC0];
    v64[2] = *MEMORY[0x1E4F1ADE0];
    v64[3] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1AEE0];
    v64[4] = *MEMORY[0x1E4F1AED8];
    v64[5] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:6];
    v48 = v7;
    v49 = a1;
    v46 = v6;
    v47 = (void *)v11;
    if ([v6 length])
    {
      v12 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
      id v60 = 0;
      v13 = [v7 unifiedContactsMatchingPredicate:v12 keysToFetch:v11 error:&v60];
      id v50 = v60;
      if (v50)
      {
        v14 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v50;
          _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Error fetching contacts via email: %@", buf, 0xCu);
        }
      }
      a1 = v49;
    }
    else
    {
      id v50 = 0;
      v13 = 0;
    }
    if (![v13 count])
    {
      v15 = objc_msgSend(a1, "ic_phoneNumber");
      if ([v15 length])
      {
        long long v16 = (void *)MEMORY[0x1E4F1B8F8];
        long long v17 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v15];
        long long v18 = [v16 predicateForContactsMatchingPhoneNumber:v17];

        id v59 = v50;
        uint64_t v19 = [v48 unifiedContactsMatchingPredicate:v18 keysToFetch:v47 error:&v59];
        id v20 = v59;

        if (v20)
        {
          uint64_t v21 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v63 = v20;
            _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_INFO, "Error fetching contacts via phone number: %@", buf, 0xCu);
          }
        }
        v13 = (void *)v19;
        id v50 = v20;
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v13;
    uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (!v22)
    {
LABEL_46:

      v44 = objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
      [v44 setObject:v3 forKey:v49];

      v4 = (void *)[v5 copy];
      goto LABEL_47;
    }
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    unint64_t v25 = 0x1E4F28000uLL;
    uint64_t v51 = *(void *)v56;
LABEL_23:
    uint64_t v26 = 0;
    uint64_t v52 = v23;
    while (1)
    {
      if (*(void *)v56 != v24) {
        objc_enumerationMutation(obj);
      }
      v27 = *(void **)(*((void *)&v55 + 1) + 8 * v26);
      uint64_t v28 = [v27 contactType];
      if (v28 == 1) {
        break;
      }
      if (!v28)
      {
        v29 = [v27 givenName];
        v30 = objc_msgSend(v29, "ic_trimmedString");

        if ([v30 length])
        {
          [v5 addObject:v30];
          [(ICShareParticipantCacheEntry *)v3 setGivenName:v30];
        }
        v31 = [v27 familyName];
        v32 = objc_msgSend(v31, "ic_trimmedString");

        if ([v32 length])
        {
          [v5 addObject:v32];
          [(ICShareParticipantCacheEntry *)v3 setFamilyName:v32];
        }
        v33 = [v27 nickname];
        v34 = objc_msgSend(v33, "ic_trimmedString");

        if ([v34 length])
        {
          [v5 addObject:v34];
          [(ICShareParticipantCacheEntry *)v3 setNickname:v34];
        }
        v54 = v34;
        id v35 = objc_alloc_init(MEMORY[0x1E4F28F30]);
        [v35 setGivenName:v30];
        [v35 setFamilyName:v32];
        v36 = objc_msgSend(v35, "ic_localizedNameWithDefaultFormattingStyle");
        v37 = objc_msgSend(v36, "ic_trimmedString");

        if ([v37 length])
        {
          [v5 addObject:v37];
          [(ICShareParticipantCacheEntry *)v3 setDisplayName:v37];
        }
        v38 = [*(id *)(v25 + 3896) localizedStringFromPersonNameComponents:v35 style:4 options:0];
        if ([v38 length])
        {
          [v5 addObject:v38];
          [(ICShareParticipantCacheEntry *)v3 setInitials:v38];
        }
        id v39 = v5;
        [*(id *)(v25 + 3896) localizedStringFromPersonNameComponents:v35 style:1 options:0];
        v41 = v40 = v3;
        v42 = objc_msgSend(v41, "ic_trimmedString");

        v3 = v40;
        if ([v42 length]) {
          [(ICShareParticipantCacheEntry *)v40 setActivityStreamDisplayName:v42];
        }

        id v5 = v39;
        uint64_t v24 = v51;
        uint64_t v23 = v52;
        unint64_t v25 = 0x1E4F28000;
LABEL_43:
      }
      if (v23 == ++v26)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (!v23) {
          goto LABEL_46;
        }
        goto LABEL_23;
      }
    }
    v43 = [v27 organizationName];
    v30 = objc_msgSend(v43, "ic_trimmedString");

    if ([v30 length])
    {
      [v5 addObject:v30];
      [(ICShareParticipantCacheEntry *)v3 setDisplayName:v30];
    }
    goto LABEL_43;
  }
  v4 = [(ICShareParticipantCacheEntry *)v3 names];
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((names) != nil)", "-[CKShareParticipant(IC) ic_mentionableNamesFromContacts]", 1, 0, @"Expected non-nil value for '%s'", "names");
  }
LABEL_47:

  return v4;
}

- (id)ic_cachedDisplayNameFromContacts
{
  objc_opt_class();
  v2 = objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v3 = [v2 objectForKey:a1];
  v4 = ICCheckedDynamicCast();
  id v5 = [v4 displayName];

  return v5;
}

- (id)ic_participantNameMatchingString:()IC returnFullName:
{
  id v5 = a3;
  uint64_t v75 = 0;
  v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__12;
  v79 = __Block_byref_object_dispose__12;
  id v80 = 0;
  id v6 = objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  id v7 = [v6 objectForKey:a1];

  uint64_t v8 = objc_msgSend(v5, "ic_tokenSafeText");
  if ([v8 length])
  {
    uint64_t v9 = [a1 userIdentity];
    uint64_t v10 = [v9 nameComponents];

    uint64_t v11 = [a1 userIdentity];
    v12 = [v11 nameComponents];
    id v60 = [v12 givenName];

    v13 = [a1 userIdentity];
    v14 = [v13 nameComponents];
    id v59 = [v14 familyName];

    long long v58 = (void *)v10;
    id v63 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v10 style:0 options:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke;
    aBlock[3] = &unk_1E64A59E8;
    id v15 = v8;
    char v74 = a4;
    id v72 = v15;
    v73 = &v75;
    v61 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
    if (v7)
    {
      long long v16 = v8;
      id v17 = v5;
      long long v18 = [v7 initials];
      uint64_t v19 = [v7 givenName];
      id v20 = [v7 familyName];
      uint64_t v21 = [v7 displayName];
      v61[2](v61, v18, v19, v20, v21);

      id v5 = v17;
      uint64_t v8 = v16;
    }
    if (!v76[5])
    {
      uint64_t v22 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v58 style:4 options:0];
      v61[2](v61, v22, v60, v59, v63);

      if (!v76[5])
      {
        long long v57 = v8;
        uint64_t v67 = 0;
        v68 = &v67;
        uint64_t v69 = 0x2020000000;
        uint64_t v70 = 0;
        uint64_t v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
        id v56 = v5;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke_2;
        v64[3] = &unk_1E64A5A10;
        id v24 = v23;
        id v65 = v24;
        v66 = &v67;
        unint64_t v25 = (void (**)(void *, void *))_Block_copy(v64);
        uint64_t v26 = [v7 givenName];
        v25[2](v25, v26);

        v27 = [v7 familyName];
        v25[2](v25, v27);

        uint64_t v28 = [v7 nickname];
        v25[2](v25, v28);

        v29 = [v7 displayName];
        v25[2](v25, v29);

        objc_msgSend(v24, "ic_addNonNilObject:", v60);
        v30 = [a1 userIdentity];
        v31 = [v30 nameComponents];
        v32 = [v31 familyName];
        objc_msgSend(v24, "ic_addNonNilObject:", v32);

        objc_msgSend(v24, "ic_addNonNilObject:", v63);
        long long v55 = v25;
        unint64_t v33 = 0;
        id v34 = 0;
        while (v33 < [v24 count])
        {
          if (v33 >= v68[3])
          {
            id v35 = v63;
          }
          else
          {
            id v35 = [v7 displayName];
          }
          v36 = v35;
          v37 = [v24 objectAtIndexedSubscript:v33];
          v38 = objc_msgSend(v37, "ic_tokenSafeText");
          char v39 = [v38 isEqualToString:v15];

          if (v39)
          {
            if (a4) {
              v43 = v36;
            }
            else {
              v43 = v37;
            }
            objc_storeStrong(v76 + 5, v43);

            break;
          }
          if (!v34)
          {
            v40 = objc_msgSend(v37, "ic_tokenSafeText");
            int v41 = [v40 hasPrefix:v15];

            if (v41)
            {
              if (a4) {
                v42 = v36;
              }
              else {
                v42 = v37;
              }
              id v34 = v42;
            }
            else
            {
              id v34 = 0;
            }
          }

          ++v33;
        }
        if (!v76[5]) {
          objc_storeStrong(v76 + 5, v34);
        }

        _Block_object_dispose(&v67, 8);
        id v5 = v56;
        uint64_t v8 = v57;
      }
    }
  }
  id v44 = v76[5];
  if (!v44 || ![v44 length])
  {
    uint64_t v45 = objc_msgSend(a1, "ic_shortParticipantName");
    id v46 = v76[5];
    v76[5] = (id)v45;

    v47 = [v7 givenName];
    uint64_t v48 = [v47 length];

    if (v48)
    {
      v49 = NSString;
      id v50 = [v7 givenName];
      uint64_t v51 = [v7 familyName];
      uint64_t v52 = objc_msgSend(v49, "ic_shortNameFromGivenName:familyName:", v50, v51);

      if ([v52 length]) {
        objc_storeStrong(v76 + 5, v52);
      }
    }
  }
  id v53 = v76[5];

  _Block_object_dispose(&v75, 8);
  return v53;
}

- (id)ic_activityStreamDisplayName
{
  objc_opt_class();
  v2 = objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v3 = [v2 objectForKey:a1];
  v4 = ICCheckedDynamicCast();

  id v5 = [v4 activityStreamDisplayName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = objc_msgSend(a1, "ic_shortParticipantName");
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Somebody" value:@"Somebody" table:0 allowSiri:1];
    }
    id v7 = v10;
  }
  return v7;
}

- (id)ic_userRecordNameInNote:()IC
{
  id v4 = a3;
  id v5 = [a1 userIdentity];
  id v6 = [v5 userRecordID];
  id v7 = [v6 recordName];

  if ([v7 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    uint64_t v8 = [v4 account];
    uint64_t v9 = [v8 userRecordName];

    id v7 = (void *)v9;
  }

  return v7;
}

@end