@interface UNSCNContactResolver
- (BOOL)_isSuggestedForContact:(id)a3;
- (BOOL)_isSuggestedForLabeledValue:(id)a3;
- (UNSCNContactResolver)init;
- (id)_fullnameForCNContact:(id)a3;
- (id)_matchForContact:(id)a3 matchingLabel:(id)a4 matchType:(unint64_t)a5;
- (id)_matchThatMatchesEmailAddress:(id)a3 forContact:(id)a4;
- (id)_matchThatMatchesSocialProfile:(id)a3 bundleIdentifier:(id)a4 forContact:(id)a5;
- (id)bestMatchForEmailAddress:(id)a3;
- (id)bestMatchForPhoneNumber:(id)a3;
- (id)bestMatchForPredicate:(id)a3 contactToMatch:(id)a4;
- (id)bestMatchForSocialProfile:(id)a3 bundleIdentifier:(id)a4;
- (id)bestMatchForUserIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)bestMatchForUsername:(id)a3 bundleIdentifier:(id)a4;
- (id)confirm:(BOOL)a3 match:(id)a4;
- (id)contactForIdentifier:(id)a3;
- (id)matchThatMatchesPhoneNumber:(id)a3 forContact:(id)a4;
- (id)resultForContactIdentifier:(id)a3;
- (id)resultForContactIdentifier:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 userIdentifier:(id)a6 username:(id)a7 bundleIdentifier:(id)a8;
@end

@implementation UNSCNContactResolver

- (UNSCNContactResolver)init
{
  v12[4] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)UNSCNContactResolver;
  v2 = [(UNSCNContactResolver *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    uint64_t v4 = *MEMORY[0x263EFE070];
    v12[0] = v3;
    v12[1] = v4;
    uint64_t v5 = *MEMORY[0x263EFE110];
    v12[2] = *MEMORY[0x263EFDF80];
    v12[3] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
    contactStoreSearchKeys = v2->_contactStoreSearchKeys;
    v2->_contactStoreSearchKeys = (NSArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFEA58] storeWithOptions:3];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v8;
  }
  return v2;
}

- (id)resultForContactIdentifier:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 userIdentifier:(id)a6 username:(id)a7 bundleIdentifier:(id)a8
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v59 = a6;
  id v17 = a7;
  id v60 = a8;
  v56 = [MEMORY[0x263EFF910] now];
  id v18 = objc_alloc_init(MEMORY[0x263F089D8]);
  v57 = v14;
  if ([v14 length])
  {
    v19 = [(UNSCNContactResolver *)self resultForContactIdentifier:v14];
    v20 = [NSString stringWithFormat:@"\tcontactIdentifier - %@: %@", v14, v19];
    [v18 appendString:v20];
  }
  else
  {
    v19 = 0;
  }
  v21 = v15;
  id v58 = v17;
  if (([v19 isStrongestMatch] & 1) == 0 && objc_msgSend(v16, "length"))
  {
    v22 = v16;
    v23 = [(UNSCNContactResolver *)self bestMatchForPhoneNumber:v16];
    unsigned int v24 = [v23 isStrongerMatchThanOtherMatch:v19];
    if (v24)
    {
      id v25 = v23;

      v19 = v25;
    }
    v26 = NSString;
    id v16 = v22;
    v27 = objc_msgSend(v22, "un_logDigest");
    v28 = [v26 stringWithFormat:@"\tphoneNumber - %@: %@ preferResult:%d", v27, v23, v24];
    [v18 appendString:v28];

    v21 = v15;
    id v17 = v58;
  }
  if (([v19 isStrongestMatch] & 1) == 0 && objc_msgSend(v21, "length"))
  {
    id v29 = v16;
    v30 = [(UNSCNContactResolver *)self bestMatchForEmailAddress:v21];
    unsigned int v31 = [v30 isStrongerMatchThanOtherMatch:v19];
    if (v31)
    {
      id v32 = v30;

      v19 = v32;
    }
    v33 = NSString;
    v34 = objc_msgSend(v21, "un_logDigest");
    v35 = [v33 stringWithFormat:@"\temailAddress - %@: %@ preferResult:%d", v34, v30, v31];
    [v18 appendString:v35];

    v21 = v15;
    id v16 = v29;
    id v17 = v58;
  }
  if (([v19 isStrongestMatch] & 1) == 0)
  {
    if ([v59 length])
    {
      id v36 = v16;
      v37 = [(UNSCNContactResolver *)self bestMatchForUserIdentifier:v59 bundleIdentifier:v60];
      unsigned int v38 = [v37 isStrongerMatchThanOtherMatch:v19];
      if (v38)
      {
        id v39 = v37;

        v19 = v39;
      }
      v40 = NSString;
      v41 = objc_msgSend(v59, "un_logDigest");
      v42 = [v40 stringWithFormat:@"\tuserIdentifier - %@: %@ preferResult:%d", v41, v37, v38];
      [v18 appendString:v42];

      v21 = v15;
      id v16 = v36;
    }
    id v17 = v58;
  }
  if (([v19 isStrongestMatch] & 1) == 0 && objc_msgSend(v17, "length"))
  {
    id v43 = v16;
    v44 = [(UNSCNContactResolver *)self bestMatchForUsername:v17 bundleIdentifier:v60];
    unsigned int v45 = [v44 isStrongerMatchThanOtherMatch:v19];
    if (v45)
    {
      id v46 = v44;

      v19 = v46;
    }
    v47 = NSString;
    v48 = objc_msgSend(v17, "un_logDigest");
    v49 = [v47 stringWithFormat:@"\tusername - %@: %@ preferResult:%d", v48, v44, v45];
    [v18 appendString:v49];

    id v17 = v58;
    v21 = v15;
    id v16 = v43;
  }
  if ([v19 isSuggestedContact])
  {
    v50 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260AF7000, v50, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver rejecting pure suggested contact. Not yet supported.", buf, 2u);
    }

    v19 = 0;
  }
  v51 = [MEMORY[0x263EFF910] now];
  [v51 timeIntervalSinceDate:v56];
  uint64_t v53 = v52;
  v54 = UNSLogCommunicationNotifications();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    uint64_t v62 = v53;
    __int16 v63 = 2112;
    v64 = v19;
    __int16 v65 = 2112;
    id v66 = v18;
    _os_log_impl(&dword_260AF7000, v54, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver found results in %{public}fms:\n\tFinal match:%@\n%@", buf, 0x20u);
  }

  return v19;
}

- (id)confirm:(BOOL)a3 match:(id)a4
{
  BOOL v4 = a3;
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = @"reject";
  if (v4) {
    v7 = @"confirm";
  }
  uint64_t v8 = v7;
  v9 = [v6 cnContactIdentifier];
  v10 = [(UNSCNContactResolver *)self contactForIdentifier:v9];

  if (v10)
  {
    objc_super v11 = [v6 identifierOfMatchLabel];
    uint64_t v12 = [v6 matchType];
    int v13 = [v6 isSuggestedContact];
    if (v13)
    {
      v73 = v10;
      id v14 = v10;
      id v15 = v14;
      if (v4)
      {
        int v71 = v13;
        id v16 = (void *)[v14 copyWithCuratingAllSuggestions];
        id v17 = (void *)[v16 mutableCopy];

        id v18 = objc_alloc_init(MEMORY[0x263EFEB58]);
LABEL_7:
        [v18 confirmSuggestion:v15];
LABEL_25:
        contactStore = self->_contactStore;
        id v75 = 0;
        [(CNContactStore *)contactStore executeSaveRequest:v18 error:&v75];
        v21 = v75;
        v19 = 0;
        if (v21 || !v17) {
          goto LABEL_37;
        }
        id v23 = objc_alloc_init(MEMORY[0x263EFEB48]);
        unsigned int v24 = v23;
        if (v71) {
          [v23 addContact:v17 toContainerWithIdentifier:0];
        }
        else {
          [v23 updateContact:v17];
        }
        v69 = v8;
        id v25 = self->_contactStore;
        id v74 = 0;
        [(CNContactStore *)v25 executeSaveRequest:v24 error:&v74];
        v21 = v74;
        if (v21)
        {
          v26 = UNSLogCommunicationNotifications();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v67 = [v21 localizedDescription];
            *(_DWORD *)buf = 136446978;
            v89 = "-[UNSCNContactResolver confirm:match:]";
            __int16 v90 = 2114;
            v91 = v69;
            __int16 v92 = 2114;
            v93 = v67;
            __int16 v94 = 2114;
            id v95 = v6;
            _os_log_error_impl(&dword_260AF7000, v26, OS_LOG_TYPE_ERROR, "%{public}s: Failed to %{public}@ match. Save request error %{public}@. Match:%{public}@", buf, 0x2Au);

            uint64_t v8 = v69;
            v19 = 0;
            goto LABEL_36;
          }
          v19 = 0;
        }
        else
        {
          v27 = [v17 identifier];
          v28 = [(UNSCNContactResolver *)self _fullnameForCNContact:v17];
          v19 = +[UNSCNContactResolverResult resultWithCNContactIdentifier:v27 cnContactFullname:v28 suggestedContact:0 matchType:0 matchTypeSuggested:0 identifierOfMatchLabel:0];

          v26 = UNSLogCommunicationNotifications();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v89 = "-[UNSCNContactResolver confirm:match:]";
            __int16 v90 = 2114;
            uint64_t v8 = v69;
            v91 = v69;
            __int16 v92 = 2114;
            v93 = v19;
            _os_log_impl(&dword_260AF7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: Succeeded to %{public}@ match. New match or nil:%{public}@", buf, 0x20u);
LABEL_36:

LABEL_37:
            v10 = v73;
LABEL_38:

            goto LABEL_39;
          }
        }
        uint64_t v8 = v69;
        goto LABEL_36;
      }
      id v18 = objc_alloc_init(MEMORY[0x263EFEB58]);
      id v17 = 0;
LABEL_24:
      [v18 rejectSuggestion:v15];
      int v71 = 0;
      goto LABEL_25;
    }
    if ([v6 isMatchTypeSuggested] && -[NSObject length](v11, "length"))
    {
      v73 = v10;
      switch(v12)
      {
        case 0:
          v20 = UNSLogCommunicationNotifications();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[UNSCNContactResolver confirm:match:].cold.4();
          }
          goto LABEL_18;
        case 1:
          int v71 = 0;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id obj = [v10 emailAddresses];
          uint64_t v31 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
          if (!v31) {
            goto LABEL_67;
          }
          uint64_t v32 = v31;
          v70 = v8;
          uint64_t v33 = *(void *)v81;
LABEL_42:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v81 != v33) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v80 + 1) + 8 * v34);
            id v36 = [v35 identifier];
            int v37 = [v36 isEqualToString:v11];

            if (v37) {
              break;
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
              if (v32) {
                goto LABEL_42;
              }
              goto LABEL_66;
            }
          }
          id v15 = v35;
          if (!v4) {
            goto LABEL_75;
          }
          v10 = v73;
          id v17 = (void *)[v73 mutableCopy];
          uint64_t v52 = [v73 emailAddresses];
          uint64_t v53 = (void *)[v52 mutableCopy];

          id v54 = objc_alloc(MEMORY[0x263EFEAD0]);
          v55 = [v15 value];
          v56 = (void *)[v54 initWithLabel:0 value:v55];

          v57 = v53;
          [v53 addObject:v56];
          [v17 setEmailAddresses:v53];
          goto LABEL_74;
        case 2:
          int v71 = 0;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id obj = [v10 phoneNumbers];
          uint64_t v38 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (!v38) {
            goto LABEL_67;
          }
          uint64_t v39 = v38;
          v70 = v8;
          uint64_t v40 = *(void *)v77;
          break;
        case 3:
          int v71 = 0;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id obj = [v10 socialProfiles];
          uint64_t v45 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
          if (!v45)
          {
LABEL_67:
            id v15 = 0;
            id v17 = 0;
            goto LABEL_76;
          }
          uint64_t v46 = v45;
          v70 = v8;
          uint64_t v47 = *(void *)v85;
LABEL_60:
          uint64_t v48 = 0;
          while (1)
          {
            if (*(void *)v85 != v47) {
              objc_enumerationMutation(obj);
            }
            v49 = *(void **)(*((void *)&v84 + 1) + 8 * v48);
            v50 = [v49 identifier];
            int v51 = [v50 isEqualToString:v11];

            if (v51) {
              break;
            }
            if (v46 == ++v48)
            {
              uint64_t v46 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
              if (!v46) {
                goto LABEL_66;
              }
              goto LABEL_60;
            }
          }
          id v15 = v49;
          if (!v4) {
            goto LABEL_75;
          }
          v10 = v73;
          id v17 = (void *)[v73 mutableCopy];
          uint64_t v62 = [v73 socialProfiles];
          v68 = (void *)[v62 mutableCopy];

          __int16 v63 = [v15 value];
          v56 = [v63 service];

          id v64 = objc_alloc(MEMORY[0x263EFEAD0]);
          __int16 v65 = [v15 value];
          id v66 = (void *)[v64 initWithLabel:v56 value:v65];

          v57 = v68;
          [v68 addObject:v66];
          [v17 setSocialProfiles:v68];

          goto LABEL_74;
        default:
          goto LABEL_19;
      }
LABEL_51:
      uint64_t v41 = 0;
      while (1)
      {
        if (*(void *)v77 != v40) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v76 + 1) + 8 * v41);
        id v43 = [v42 identifier];
        int v44 = [v43 isEqualToString:v11];

        if (v44) {
          break;
        }
        if (v39 == ++v41)
        {
          uint64_t v39 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (v39) {
            goto LABEL_51;
          }
LABEL_66:
          id v15 = 0;
          goto LABEL_75;
        }
      }
      id v15 = v42;
      if (!v4)
      {
LABEL_75:
        id v17 = 0;
        uint64_t v8 = v70;
        v10 = v73;
        goto LABEL_76;
      }
      v10 = v73;
      id v17 = (void *)[v73 mutableCopy];
      id v58 = [v73 phoneNumbers];
      id v59 = (void *)[v58 mutableCopy];

      id v60 = objc_alloc(MEMORY[0x263EFEAD0]);
      v61 = [v15 value];
      v56 = (void *)[v60 initWithLabel:0 value:v61];

      v57 = v59;
      [v59 addObject:v56];
      [v17 setPhoneNumbers:v59];
LABEL_74:
      uint64_t v8 = v70;

LABEL_76:
      if (v15)
      {
        id v18 = objc_alloc_init(MEMORY[0x263EFEB58]);
        if (v4) {
          goto LABEL_7;
        }
        goto LABEL_24;
      }
    }
    else
    {
      v20 = UNSLogCommunicationNotifications();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[UNSCNContactResolver confirm:match:]();
      }
LABEL_18:

LABEL_19:
      id v17 = 0;
    }
    v21 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[UNSCNContactResolver confirm:match:]();
    }
    id v15 = 0;
    v19 = 0;
    goto LABEL_38;
  }
  objc_super v11 = UNSLogCommunicationNotifications();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[UNSCNContactResolver confirm:match:]();
  }
  id v15 = 0;
  id v17 = 0;
  v19 = 0;
LABEL_39:

  id v29 = v19;
  return v29;
}

- (id)resultForContactIdentifier:(id)a3
{
  BOOL v4 = [(UNSCNContactResolver *)self contactForIdentifier:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    v7 = [(UNSCNContactResolver *)self _fullnameForCNContact:v5];
    uint64_t v8 = +[UNSCNContactResolverResult resultWithCNContactIdentifier:v6 cnContactFullname:v7 suggestedContact:[(UNSCNContactResolver *)self _isSuggestedForContact:v5] matchType:0 matchTypeSuggested:0 identifierOfMatchLabel:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)bestMatchForPhoneNumber:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFEB28];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithStringValue:v5];

  v7 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__UNSCNContactResolver_bestMatchForPhoneNumber___block_invoke;
  v11[3] = &unk_26556D9C8;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [(UNSCNContactResolver *)self bestMatchForPredicate:v7 contactToMatch:v11];

  return v9;
}

uint64_t __48__UNSCNContactResolver_bestMatchForPhoneNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchThatMatchesPhoneNumber:*(void *)(a1 + 40) forContact:a2];
}

- (id)matchThatMatchesPhoneNumber:(id)a3 forContact:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [v7 phoneNumbers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v22 = self;
    id v23 = v7;
    unsigned int v24 = 0;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 value];
        id v15 = [v14 lastFourDigits];
        id v16 = [v6 lastFourDigits];
        if ([v15 isEqualToString:v16])
        {
          int v17 = [v14 isLikePhoneNumber:v6];

          if (v17)
          {
            id v18 = v13;

            if (![(UNSCNContactResolver *)v22 _isSuggestedForContact:v23]
              && ![(UNSCNContactResolver *)v22 _isSuggestedForLabeledValue:v18])
            {

              unsigned int v24 = v18;
              goto LABEL_16;
            }
            unsigned int v24 = v18;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_16:

    v19 = v24;
    if (v24)
    {
      id v7 = v23;
      v20 = [(UNSCNContactResolver *)v22 _matchForContact:v23 matchingLabel:v24 matchType:2];
    }
    else
    {
      v20 = 0;
      id v7 = v23;
    }
  }
  else
  {

    v19 = 0;
    v20 = 0;
  }

  return v20;
}

- (id)bestMatchForEmailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v4 groupIdentifiers:0 limitToOneResult:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__UNSCNContactResolver_bestMatchForEmailAddress___block_invoke;
  v9[3] = &unk_26556D9C8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(UNSCNContactResolver *)self bestMatchForPredicate:v5 contactToMatch:v9];

  return v7;
}

uint64_t __49__UNSCNContactResolver_bestMatchForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _matchThatMatchesEmailAddress:*(void *)(a1 + 40) forContact:a2];
}

- (id)_matchThatMatchesEmailAddress:(id)a3 forContact:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = objc_msgSend(v7, "emailAddresses", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 value];
        if (![v15 caseInsensitiveCompare:v6])
        {
          id v16 = v14;

          if (![(UNSCNContactResolver *)self _isSuggestedForContact:v7]
            && ![(UNSCNContactResolver *)self _isSuggestedForLabeledValue:v16])
          {

            uint64_t v11 = v16;
            goto LABEL_14;
          }
          uint64_t v11 = v16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_14:

    if (v11)
    {
      int v17 = [(UNSCNContactResolver *)self _matchForContact:v7 matchingLabel:v11 matchType:1];
      goto LABEL_18;
    }
  }
  else
  {

    uint64_t v11 = 0;
  }
  int v17 = 0;
LABEL_18:

  return v17;
}

- (id)bestMatchForUsername:(id)a3 bundleIdentifier:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263EFEB20];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setUsername:v8];

  v13[0] = v7;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v9 setBundleIdentifiers:v10];

  uint64_t v11 = [(UNSCNContactResolver *)self bestMatchForSocialProfile:v9 bundleIdentifier:v7];

  return v11;
}

- (id)bestMatchForUserIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263EFEB20];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setUserIdentifier:v8];

  v13[0] = v7;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v9 setBundleIdentifiers:v10];

  uint64_t v11 = [(UNSCNContactResolver *)self bestMatchForSocialProfile:v9 bundleIdentifier:v7];

  return v11;
}

- (id)bestMatchForSocialProfile:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingSocialProfile:v6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __67__UNSCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke;
  v13[3] = &unk_26556D9F0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(UNSCNContactResolver *)self bestMatchForPredicate:v8 contactToMatch:v13];

  return v11;
}

uint64_t __67__UNSCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _matchThatMatchesSocialProfile:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48) forContact:a2];
}

- (id)_matchThatMatchesSocialProfile:(id)a3 bundleIdentifier:(id)a4 forContact:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v37 = a4;
  id v7 = a5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = [v7 socialProfiles];
  uint64_t v30 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v30)
  {
    id v9 = 0;
    id obj = v8;
    uint64_t v29 = *(void *)v45;
    id v10 = v32;
    id v34 = v7;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v11;
        uint64_t v33 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
        uint64_t v12 = objc_msgSend(v33, "value", obj);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v36 = [v12 bundleIdentifiers];
        uint64_t v39 = [v36 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v39)
        {
          uint64_t v38 = *(void *)v41;
          int v13 = v9;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v41 != v38) {
                objc_enumerationMutation(v36);
              }
              int v15 = [*(id *)(*((void *)&v40 + 1) + 8 * i) isEqual:v37];
              id v16 = [v12 username];
              if ([v16 length])
              {
                int v17 = [v10 username];
                if ([v17 length])
                {
                  id v18 = [v12 username];
                  long long v19 = [v10 username];
                  int v20 = [v18 isEqualToString:v19];
                }
                else
                {
                  int v20 = 0;
                }
              }
              else
              {
                int v20 = 0;
              }

              long long v21 = [v12 userIdentifier];
              if ([v21 length])
              {
                long long v22 = [v10 userIdentifier];
                if ([v22 length])
                {
                  id v23 = [v12 userIdentifier];
                  uint64_t v24 = [v10 userIdentifier];
                  int v25 = [v23 isEqualToString:v24];

                  id v10 = v32;
                }
                else
                {
                  int v25 = 0;
                }
              }
              else
              {
                int v25 = 0;
              }

              if ((v15 & (v20 | v25)) == 1)
              {
                id v9 = v33;

                if ([(UNSCNContactResolver *)self _isSuggestedForContact:v34])
                {
                  int v13 = v9;
                }
                else
                {
                  int v13 = v9;
                  if (![(UNSCNContactResolver *)self _isSuggestedForLabeledValue:v9]) {
                    goto LABEL_29;
                  }
                }
              }
            }
            id v9 = v13;
            uint64_t v39 = [v36 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v39);
        }
LABEL_29:

        id v7 = v34;
        if (![(UNSCNContactResolver *)self _isSuggestedForContact:v34]
          && v9
          && ![(UNSCNContactResolver *)self _isSuggestedForLabeledValue:v9])
        {

          goto LABEL_37;
        }

        uint64_t v11 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v30) {
        continue;
      }
      break;
    }

    if (!v9)
    {
      long long v26 = 0;
      goto LABEL_39;
    }
LABEL_37:
    long long v26 = [(UNSCNContactResolver *)self _matchForContact:v34 matchingLabel:v9 matchType:3];
  }
  else
  {

    id v9 = 0;
    long long v26 = 0;
    id v10 = v32;
  }
LABEL_39:

  return v26;
}

- (id)bestMatchForPredicate:(id)a3 contactToMatch:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  contactStore = self->_contactStore;
  contactStoreSearchKeys = self->_contactStoreSearchKeys;
  id v29 = 0;
  uint64_t v24 = v6;
  id v10 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v6 keysToFetch:contactStoreSearchKeys error:&v29];
  id v11 = v29;
  if (v11)
  {
    uint64_t v12 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[UNSCNContactResolver bestMatchForPredicate:contactToMatch:](v11, v12);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v26;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v26 != v17) {
        objc_enumerationMutation(v13);
      }
      long long v19 = v7[2](v7, *(void *)(*((void *)&v25 + 1) + 8 * v18));
      int v20 = v19;
      if (v19 && [v19 isStrongerMatchThanOtherMatch:v16])
      {
        id v21 = v20;

        id v16 = v21;
      }
      char v22 = [v16 isStrongestMatch];

      if (v22) {
        break;
      }
      if (v15 == ++v18)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v15) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)contactForIdentifier:(id)a3
{
  id v4 = a3;
  contactStore = self->_contactStore;
  contactStoreSearchKeys = self->_contactStoreSearchKeys;
  id v11 = 0;
  id v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v4 keysToFetch:contactStoreSearchKeys error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[UNSCNContactResolver contactForIdentifier:]();
    }
  }

  return v7;
}

- (id)_fullnameForCNContact:(id)a3
{
  return (id)[MEMORY[0x263EFEA20] stringFromContact:a3 style:0];
}

- (id)_matchForContact:(id)a3 matchingLabel:(id)a4 matchType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 identifier];
  id v11 = [(UNSCNContactResolver *)self _fullnameForCNContact:v9];
  BOOL v12 = [(UNSCNContactResolver *)self _isSuggestedForContact:v9];

  BOOL v13 = [(UNSCNContactResolver *)self _isSuggestedForLabeledValue:v8];
  uint64_t v14 = [v8 identifier];

  uint64_t v15 = +[UNSCNContactResolverResult resultWithCNContactIdentifier:v10 cnContactFullname:v11 suggestedContact:v12 matchType:a5 matchTypeSuggested:v13 identifierOfMatchLabel:v14];

  return v15;
}

- (BOOL)_isSuggestedForContact:(id)a3
{
  return [a3 isSuggested];
}

- (BOOL)_isSuggestedForLabeledValue:(id)a3
{
  return [a3 isSuggested];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreSearchKeys, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)confirm:match:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_260AF7000, v0, v1, "%{public}s: Unable to find suggested contact to %{public}@ match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.2()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_260AF7000, v0, v1, "%{public}s: Could not create save request for %{public}@ match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.3()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_260AF7000, v0, v1, "%{public}s: Nothing to %{public}@ on match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.4()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_260AF7000, v0, v1, "%{public}s: Cannot %{public}@ contact match on contact identifier. Contact identifiers can't be suggested. Match:%{public}@", v2);
}

- (void)bestMatchForPredicate:(void *)a1 contactToMatch:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [a1 localizedDescription];
  int v4 = 136446466;
  id v5 = "-[UNSCNContactResolver bestMatchForPredicate:contactToMatch:]";
  __int16 v6 = 2114;
  id v7 = v3;
  _os_log_error_impl(&dword_260AF7000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Error querying for contacts based on predicate. Error:%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)contactForIdentifier:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_260AF7000, v0, v1, "%{public}s: Error querying for contact based on identifier:%{public}@ error:%{public}@", v2);
}

@end