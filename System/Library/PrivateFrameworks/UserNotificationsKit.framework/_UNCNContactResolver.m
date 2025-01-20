@interface _UNCNContactResolver
- (BOOL)_isSuggestedForContact:(id)a3;
- (BOOL)_isSuggestedForLabeledValue:(id)a3;
- (_UNCNContactResolver)init;
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

@implementation _UNCNContactResolver

- (_UNCNContactResolver)init
{
  v12[4] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)_UNCNContactResolver;
  v2 = [(_UNCNContactResolver *)&v11 init];
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
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v53 = a5;
  id v52 = a6;
  id v16 = a7;
  id v54 = a8;
  v51 = [MEMORY[0x263EFF910] now];
  id v17 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v14 length])
  {
    v18 = [(_UNCNContactResolver *)self resultForContactIdentifier:v14];
    v19 = [NSString stringWithFormat:@"\tcontactIdentifier - %@: %@", v14, v18];
    [v17 appendString:v19];
  }
  else
  {
    v18 = 0;
  }
  v20 = v15;
  if (([v18 isStrongestMatch] & 1) == 0 && objc_msgSend(v53, "length"))
  {
    v21 = [(_UNCNContactResolver *)self bestMatchForPhoneNumber:v53];
    unsigned int v22 = [v21 isStrongerMatchThanOtherMatch:v18];
    if (v22)
    {
      id v23 = v21;

      v18 = v23;
    }
    v24 = NSString;
    v25 = objc_msgSend(v53, "un_logDigest");
    v26 = [v24 stringWithFormat:@"\tphoneNumber - %@: %@ preferResult:%d", v25, v21, v22];
    [v17 appendString:v26];

    v20 = v15;
  }
  if (([v18 isStrongestMatch] & 1) == 0 && objc_msgSend(v20, "length"))
  {
    v27 = [(_UNCNContactResolver *)self bestMatchForEmailAddress:v20];
    unsigned int v28 = [v27 isStrongerMatchThanOtherMatch:v18];
    if (v28)
    {
      id v29 = v27;

      v18 = v29;
    }
    v30 = NSString;
    v31 = objc_msgSend(v20, "un_logDigest");
    v32 = [v30 stringWithFormat:@"\temailAddress - %@: %@ preferResult:%d", v31, v27, v28];
    [v17 appendString:v32];

    v20 = v15;
  }
  if (([v18 isStrongestMatch] & 1) == 0 && objc_msgSend(v52, "length"))
  {
    v33 = [(_UNCNContactResolver *)self bestMatchForUserIdentifier:v52 bundleIdentifier:v54];
    unsigned int v34 = [v33 isStrongerMatchThanOtherMatch:v18];
    if (v34)
    {
      id v35 = v33;

      v18 = v35;
    }
    v36 = NSString;
    v37 = objc_msgSend(v52, "un_logDigest");
    v38 = [v36 stringWithFormat:@"\tuserIdentifier - %@: %@ preferResult:%d", v37, v33, v34];
    [v17 appendString:v38];

    v20 = v15;
  }
  if (([v18 isStrongestMatch] & 1) == 0 && objc_msgSend(v16, "length"))
  {
    v39 = [(_UNCNContactResolver *)self bestMatchForUsername:v16 bundleIdentifier:v54];
    unsigned int v40 = [v39 isStrongerMatchThanOtherMatch:v18];
    if (v40)
    {
      id v41 = v39;

      v18 = v41;
    }
    v42 = NSString;
    v43 = objc_msgSend(v16, "un_logDigest");
    v44 = [v42 stringWithFormat:@"\tusername - %@: %@ preferResult:%d", v43, v39, v40];
    [v17 appendString:v44];

    v20 = v15;
  }
  if ([v18 isSuggestedContact])
  {
    v45 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22012C000, v45, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver rejecting pure suggested contact. Not yet supported.", buf, 2u);
    }

    v18 = 0;
  }
  v46 = [MEMORY[0x263EFF910] now];
  [v46 timeIntervalSinceDate:v51];
  uint64_t v48 = v47;
  v49 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    uint64_t v56 = v48;
    __int16 v57 = 2112;
    v58 = v18;
    __int16 v59 = 2112;
    id v60 = v17;
    _os_log_impl(&dword_22012C000, v49, OS_LOG_TYPE_DEFAULT, "_UNCNContactResolver found results in %{public}fms:\n\tFinal match:%@\n%@", buf, 0x20u);
  }

  return v18;
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
  v10 = [(_UNCNContactResolver *)self contactForIdentifier:v9];

  if (v10)
  {
    v73 = [v6 identifierOfMatchLabel];
    uint64_t v11 = [v6 matchType];
    int v12 = [v6 isSuggestedContact];
    if (v12)
    {
      id v13 = v10;
      id v14 = v13;
      if (v4)
      {
        int v71 = v12;
        id v15 = (void *)[v13 copyWithCuratingAllSuggestions];
        id v16 = (void *)[v15 mutableCopy];

        id v17 = objc_alloc_init(MEMORY[0x263EFEB58]);
LABEL_7:
        [v17 confirmSuggestion:v14];
LABEL_24:
        contactStore = self->_contactStore;
        id v75 = 0;
        [(CNContactStore *)contactStore executeSaveRequest:v17 error:&v75];
        id v20 = v75;
        v18 = 0;
        if (v20 || !v16) {
          goto LABEL_36;
        }
        id v21 = objc_alloc_init(MEMORY[0x263EFEB48]);
        unsigned int v22 = v21;
        if (v71) {
          [v21 addContact:v16 toContainerWithIdentifier:0];
        }
        else {
          [v21 updateContact:v16];
        }
        id v23 = self->_contactStore;
        id v74 = 0;
        -[CNContactStore executeSaveRequest:error:](v23, "executeSaveRequest:error:", v22, &v74, v8);
        id v20 = v74;
        if (v20)
        {
          v24 = (void *)NCUILogCommunicationNotifications;
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            v67 = v24;
            v68 = [v20 localizedDescription];
            *(_DWORD *)buf = 136446978;
            v89 = "-[_UNCNContactResolver confirm:match:]";
            __int16 v90 = 2114;
            v91 = v69;
            __int16 v92 = 2114;
            v93 = v68;
            __int16 v94 = 2114;
            id v95 = v6;
            _os_log_error_impl(&dword_22012C000, v67, OS_LOG_TYPE_ERROR, "%{public}s: Failed to %{public}@ match. Save request error %{public}@. Match:%{public}@", buf, 0x2Au);

            uint64_t v8 = v69;
            v18 = 0;
            goto LABEL_35;
          }
          v18 = 0;
        }
        else
        {
          v25 = [v16 identifier];
          v26 = [(_UNCNContactResolver *)self _fullnameForCNContact:v16];
          v18 = +[_UNCNContactResolverResult resultWithCNContactIdentifier:v25 cnContactFullname:v26 suggestedContact:0 matchType:0 matchTypeSuggested:0 identifierOfMatchLabel:0];

          v27 = NCUILogCommunicationNotifications;
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v89 = "-[_UNCNContactResolver confirm:match:]";
            __int16 v90 = 2114;
            uint64_t v8 = v69;
            v91 = v69;
            __int16 v92 = 2114;
            v93 = v18;
            _os_log_impl(&dword_22012C000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: Succeeded to %{public}@ match. New match or nil:%{public}@", buf, 0x20u);
LABEL_35:

LABEL_36:
LABEL_37:

            goto LABEL_38;
          }
        }
        uint64_t v8 = v69;
        goto LABEL_35;
      }
      id v17 = objc_alloc_init(MEMORY[0x263EFEB58]);
      id v16 = 0;
LABEL_23:
      [v17 rejectSuggestion:v14];
      int v71 = 0;
      goto LABEL_24;
    }
    if ([v6 isMatchTypeSuggested] && objc_msgSend(v73, "length"))
    {
      switch(v11)
      {
        case 0:
          if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
            -[_UNCNContactResolver confirm:match:].cold.4();
          }
          goto LABEL_18;
        case 1:
          int v71 = 0;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id obj = [v10 emailAddresses];
          uint64_t v30 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
          if (!v30) {
            goto LABEL_66;
          }
          uint64_t v31 = v30;
          v70 = v8;
          uint64_t v32 = *(void *)v81;
LABEL_41:
          uint64_t v33 = 0;
          while (1)
          {
            if (*(void *)v81 != v32) {
              objc_enumerationMutation(obj);
            }
            unsigned int v34 = *(void **)(*((void *)&v80 + 1) + 8 * v33);
            id v35 = objc_msgSend(v34, "identifier", v70);
            int v36 = [v35 isEqualToString:v73];

            if (v36) {
              break;
            }
            if (v31 == ++v33)
            {
              uint64_t v31 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
              if (v31) {
                goto LABEL_41;
              }
              goto LABEL_65;
            }
          }
          id v14 = v34;
          if (!v4) {
            goto LABEL_74;
          }
          id v16 = (void *)[v10 mutableCopy];
          v51 = [v10 emailAddresses];
          id v52 = (void *)[v51 mutableCopy];

          id v53 = objc_alloc(MEMORY[0x263EFEAD0]);
          id v54 = [v14 value];
          v55 = (void *)[v53 initWithLabel:0 value:v54];

          uint64_t v56 = v52;
          [v52 addObject:v55];
          [v16 setEmailAddresses:v52];
          goto LABEL_73;
        case 2:
          int v71 = 0;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id obj = [v10 phoneNumbers];
          uint64_t v37 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (!v37) {
            goto LABEL_66;
          }
          uint64_t v38 = v37;
          v70 = v8;
          uint64_t v39 = *(void *)v77;
          break;
        case 3:
          int v71 = 0;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id obj = [v10 socialProfiles];
          uint64_t v44 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
          if (!v44)
          {
LABEL_66:
            id v14 = 0;
            id v16 = 0;
            goto LABEL_75;
          }
          uint64_t v45 = v44;
          v70 = v8;
          uint64_t v46 = *(void *)v85;
LABEL_59:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v85 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v48 = *(void **)(*((void *)&v84 + 1) + 8 * v47);
            v49 = objc_msgSend(v48, "identifier", v70);
            int v50 = [v49 isEqualToString:v73];

            if (v50) {
              break;
            }
            if (v45 == ++v47)
            {
              uint64_t v45 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
              if (!v45) {
                goto LABEL_65;
              }
              goto LABEL_59;
            }
          }
          id v14 = v48;
          if (!v4) {
            goto LABEL_74;
          }
          id v16 = (void *)[v10 mutableCopy];
          uint64_t v61 = [v10 socialProfiles];
          v62 = (void *)[v61 mutableCopy];

          v63 = [v14 value];
          v55 = [v63 service];

          id v64 = objc_alloc(MEMORY[0x263EFEAD0]);
          v65 = [v14 value];
          v66 = (void *)[v64 initWithLabel:v55 value:v65];

          uint64_t v56 = v62;
          [v62 addObject:v66];
          [v16 setSocialProfiles:v62];

          goto LABEL_73;
        default:
          goto LABEL_18;
      }
LABEL_50:
      uint64_t v40 = 0;
      while (1)
      {
        if (*(void *)v77 != v39) {
          objc_enumerationMutation(obj);
        }
        id v41 = *(void **)(*((void *)&v76 + 1) + 8 * v40);
        v42 = objc_msgSend(v41, "identifier", v70);
        int v43 = [v42 isEqualToString:v73];

        if (v43) {
          break;
        }
        if (v38 == ++v40)
        {
          uint64_t v38 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (v38) {
            goto LABEL_50;
          }
LABEL_65:
          id v14 = 0;
          goto LABEL_74;
        }
      }
      id v14 = v41;
      if (!v4)
      {
LABEL_74:
        id v16 = 0;
        uint64_t v8 = v70;
        goto LABEL_75;
      }
      id v16 = (void *)[v10 mutableCopy];
      __int16 v57 = [v10 phoneNumbers];
      v58 = (void *)[v57 mutableCopy];

      id v59 = objc_alloc(MEMORY[0x263EFEAD0]);
      id v60 = [v14 value];
      v55 = (void *)[v59 initWithLabel:0 value:v60];

      uint64_t v56 = v58;
      [v58 addObject:v55];
      [v16 setPhoneNumbers:v58];
LABEL_73:
      uint64_t v8 = v70;

LABEL_75:
      if (v14)
      {
        id v17 = objc_alloc_init(MEMORY[0x263EFEB58]);
        if (v4) {
          goto LABEL_7;
        }
        goto LABEL_23;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
        -[_UNCNContactResolver confirm:match:]();
      }
LABEL_18:
      id v16 = 0;
    }
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
      -[_UNCNContactResolver confirm:match:]();
    }
    id v14 = 0;
    v18 = 0;
    goto LABEL_37;
  }
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
    -[_UNCNContactResolver confirm:match:]();
  }
  id v14 = 0;
  id v16 = 0;
  v18 = 0;
LABEL_38:
  id v28 = v18;

  return v28;
}

- (id)resultForContactIdentifier:(id)a3
{
  BOOL v4 = [(_UNCNContactResolver *)self contactForIdentifier:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    v7 = [(_UNCNContactResolver *)self _fullnameForCNContact:v5];
    uint64_t v8 = +[_UNCNContactResolverResult resultWithCNContactIdentifier:v6 cnContactFullname:v7 suggestedContact:[(_UNCNContactResolver *)self _isSuggestedForContact:v5] matchType:0 matchTypeSuggested:0 identifierOfMatchLabel:0];
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
  v11[2] = __48___UNCNContactResolver_bestMatchForPhoneNumber___block_invoke;
  v11[3] = &unk_264559F68;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [(_UNCNContactResolver *)self bestMatchForPredicate:v7 contactToMatch:v11];

  return v9;
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
    unsigned int v22 = self;
    id v23 = v7;
    v24 = 0;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 value];
        id v15 = [v14 lastFourDigits];
        id v16 = [v6 lastFourDigits];
        if ([v15 isEqualToString:v16])
        {
          int v17 = [v14 isLikePhoneNumber:v6];

          if (v17)
          {
            id v18 = v13;

            if (![(_UNCNContactResolver *)v22 _isSuggestedForContact:v23]
              && ![(_UNCNContactResolver *)v22 _isSuggestedForLabeledValue:v18])
            {

              v24 = v18;
              goto LABEL_16;
            }
            v24 = v18;
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
      id v20 = [(_UNCNContactResolver *)v22 _matchForContact:v23 matchingLabel:v24 matchType:2];
    }
    else
    {
      id v20 = 0;
      id v7 = v23;
    }
  }
  else
  {

    v19 = 0;
    id v20 = 0;
  }

  return v20;
}

- (id)bestMatchForEmailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v4 groupIdentifiers:0 limitToOneResult:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49___UNCNContactResolver_bestMatchForEmailAddress___block_invoke;
  v9[3] = &unk_264559F68;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(_UNCNContactResolver *)self bestMatchForPredicate:v5 contactToMatch:v9];

  return v7;
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

          if (![(_UNCNContactResolver *)self _isSuggestedForContact:v7]
            && ![(_UNCNContactResolver *)self _isSuggestedForLabeledValue:v16])
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
      int v17 = [(_UNCNContactResolver *)self _matchForContact:v7 matchingLabel:v11 matchType:1];
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

  uint64_t v11 = [(_UNCNContactResolver *)self bestMatchForSocialProfile:v9 bundleIdentifier:v7];

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

  uint64_t v11 = [(_UNCNContactResolver *)self bestMatchForSocialProfile:v9 bundleIdentifier:v7];

  return v11;
}

- (id)bestMatchForSocialProfile:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingSocialProfile:v6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __67___UNCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke;
  v13[3] = &unk_264559F90;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(_UNCNContactResolver *)self bestMatchForPredicate:v8 contactToMatch:v13];

  return v11;
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
          id v13 = v9;
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

                if ([(_UNCNContactResolver *)self _isSuggestedForContact:v34])
                {
                  id v13 = v9;
                }
                else
                {
                  id v13 = v9;
                  if (![(_UNCNContactResolver *)self _isSuggestedForLabeledValue:v9]) {
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
        if (![(_UNCNContactResolver *)self _isSuggestedForContact:v34]
          && v9
          && ![(_UNCNContactResolver *)self _isSuggestedForLabeledValue:v9])
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
    long long v26 = [(_UNCNContactResolver *)self _matchForContact:v34 matchingLabel:v9 matchType:3];
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
    uint64_t v12 = (void *)NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
      -[_UNCNContactResolver bestMatchForPredicate:contactToMatch:](v12, v11);
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
LABEL_6:
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
          goto LABEL_6;
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
  id v10 = 0;
  id v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v4 keysToFetch:contactStoreSearchKeys error:&v10];
  id v8 = v10;
  if (v8 && os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
    -[_UNCNContactResolver contactForIdentifier:]();
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
  id v11 = [(_UNCNContactResolver *)self _fullnameForCNContact:v9];
  BOOL v12 = [(_UNCNContactResolver *)self _isSuggestedForContact:v9];

  BOOL v13 = [(_UNCNContactResolver *)self _isSuggestedForLabeledValue:v8];
  uint64_t v14 = [v8 identifier];

  uint64_t v15 = +[_UNCNContactResolverResult resultWithCNContactIdentifier:v10 cnContactFullname:v11 suggestedContact:v12 matchType:a5 matchTypeSuggested:v13 identifierOfMatchLabel:v14];

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
  OUTLINED_FUNCTION_1_0(&dword_22012C000, v0, v1, "%{public}s: Unable to find suggested contact to %{public}@ match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.2()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22012C000, v0, v1, "%{public}s: Could not create save request for %{public}@ match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.3()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22012C000, v0, v1, "%{public}s: Nothing to %{public}@ on match. Match:%{public}@", v2);
}

- (void)confirm:match:.cold.4()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22012C000, v0, v1, "%{public}s: Cannot %{public}@ contact match on contact identifier. Contact identifiers can't be suggested. Match:%{public}@", v2);
}

- (void)bestMatchForPredicate:(void *)a1 contactToMatch:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 localizedDescription];
  int v5 = 136446466;
  id v6 = "-[_UNCNContactResolver bestMatchForPredicate:contactToMatch:]";
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_error_impl(&dword_22012C000, v3, OS_LOG_TYPE_ERROR, "%{public}s: Error querying for contacts based on predicate. Error:%{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)contactForIdentifier:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22012C000, v0, v1, "%{public}s: Error querying for contact based on identifier:%{public}@ error:%{public}@", v2);
}

@end