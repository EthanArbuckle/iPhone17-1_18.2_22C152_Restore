@interface INPerson(TelephonyUtilities)
+ (id)tu_personMatchingHandle:()TelephonyUtilities contactsDataSource:isoCountryCodes:;
- (id)tu_allContactIdentifiers;
- (id)tu_contactsMatchingIdentifiers:()TelephonyUtilities contactsDataSource:identifierToContactCache:;
- (id)tu_handlesMatchingPersonWithContactsDataSource:()TelephonyUtilities identifierToContactCache:;
- (id)tu_matchingINPersonHandlesByContactIdentifier;
- (id)tu_personWithFormattedHandleForISOCountryCodes:()TelephonyUtilities;
@end

@implementation INPerson(TelephonyUtilities)

- (id)tu_allContactIdentifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  v3 = [a1 contactIdentifier];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [a1 contactIdentifier];
    [v2 addObject:v5];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(a1, "siriMatches", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 contactIdentifier];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          v14 = [v11 contactIdentifier];
          [v2 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [v2 array];

  return v15;
}

- (id)tu_matchingINPersonHandlesByContactIdentifier
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(a1, "siriMatches", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [v8 contactIdentifier];
        if ([v9 length])
        {
          v10 = [v8 personHandle];

          if (!v10) {
            continue;
          }
          v11 = [v8 contactIdentifier];
          id v9 = [v2 objectForKeyedSubscript:v11];

          if (!v9)
          {
            id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
            v12 = [v8 contactIdentifier];
            [v2 setObject:v9 forKeyedSubscript:v12];
          }
          uint64_t v13 = [v8 personHandle];
          [v9 addObject:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v2 copy];
  return v14;
}

- (id)tu_personWithFormattedHandleForISOCountryCodes:()TelephonyUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 personHandle];
  uint64_t v6 = [v5 value];
  if ([v5 type] == 2
    || ![v5 type] && objc_msgSend(v6, "_appearsToBePhoneNumber"))
  {
    uint64_t v7 = (void *)MEMORY[0x263EFEB28];
    uint64_t v8 = [v4 firstObject];
    id v9 = [v7 phoneNumberWithDigits:v6 countryCode:v8];
    v10 = [v9 formattedStringValue];

    [v5 setValue:v10 forKey:@"value"];
  }
  v11 = (void *)[a1 mutableCopy];
  [v11 setPersonHandle:v5];

  return v11;
}

- (id)tu_handlesMatchingPersonWithContactsDataSource:()TelephonyUtilities identifierToContactCache:
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = IntentHandlerDefaultLog();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25DA54000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handlesMatchingPerson", "", buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = [a1 personHandle];
  v14 = [v13 value];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    long long v16 = [MEMORY[0x263F7E248] handleWithPerson:a1];
    [v12 addObject:v16];
  }
  else
  {
    uint64_t v52 = objc_msgSend(a1, "tu_allContactIdentifiers");
    id v53 = v7;
    id v54 = v6;
    long long v17 = objc_msgSend(a1, "tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:");
    long long v18 = [a1 personHandle];
    unint64_t v19 = [v18 type];

    long long v72 = 0u;
    long long v73 = 0u;
    BOOL v20 = (v19 & 1) == 0 && v19 < 3;
    BOOL v60 = v20;
    long long v70 = 0uLL;
    long long v71 = 0uLL;
    obuint64_t j = v17;
    uint64_t v61 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v61)
    {
      unsigned int v59 = (v19 < 3) & (3u >> (v19 & 7));
      uint64_t v58 = *(void *)v71;
      v55 = a1;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (v60)
          {
            v23 = [a1 personHandle];
            v24 = [v23 label];
            v57 = v22;
            v25 = objc_msgSend(v22, "tu_phoneNumbersMatchingPersonHandleLabel:", v24);

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v26 = v25;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v76 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v67;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v67 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v66 + 1) + 8 * j);
                  id v32 = objc_alloc(MEMORY[0x263F7E248]);
                  v33 = [v31 value];
                  v34 = [v33 stringValue];
                  v35 = (void *)[v32 initWithType:2 value:v34];

                  [v12 addObject:v35];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v66 objects:v76 count:16];
              }
              while (v28);
            }

            a1 = v55;
            uint64_t v22 = v57;
          }
          if (v59)
          {
            v36 = [a1 personHandle];
            v37 = [v36 label];
            v38 = objc_msgSend(v22, "tu_emailAddressesMatchingPersonHandleLabel:", v37);

            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v39 = v38;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v63;
              do
              {
                for (uint64_t k = 0; k != v41; ++k)
                {
                  if (*(void *)v63 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = *(void **)(*((void *)&v62 + 1) + 8 * k);
                  id v45 = objc_alloc(MEMORY[0x263F7E248]);
                  v46 = [v44 value];
                  v47 = (void *)[v45 initWithType:3 value:v46];

                  [v12 addObject:v47];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
              }
              while (v41);
            }
          }
        }
        uint64_t v61 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v61);
    }

    id v7 = v53;
    id v6 = v54;
    long long v16 = (void *)v52;
  }

  v48 = IntentHandlerDefaultLog();
  v49 = v48;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25DA54000, v49, OS_SIGNPOST_INTERVAL_END, v9, "handlesMatchingPerson", "", buf, 2u);
  }

  v50 = (void *)[v12 copy];
  return v50;
}

- (id)tu_contactsMatchingIdentifiers:()TelephonyUtilities contactsDataSource:identifierToContactCache:
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v53 = v8;
    v10 = IntentHandlerDefaultLog();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    id v12 = IntentHandlerDefaultLog();
    uint64_t v13 = v12;
    unint64_t v51 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25DA54000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "contactsMatchingIdentifiers", "", buf, 2u);
    }
    os_signpost_id_t spid = v11;

    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v52 = v7;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v60 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          uint64_t v22 = [v9 objectForKey:v21];
          if (v22)
          {
            v23 = v15;
            v24 = v22;
          }
          else
          {
            v23 = v14;
            v24 = v21;
          }
          [v23 addObject:v24];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v18);
    }

    id v8 = v53;
    if ([v14 count])
    {
      v25 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v16;
        _os_log_impl(&dword_25DA54000, v25, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store matching identifiers: %@", buf, 0xCu);
      }

      uint64_t v26 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v14];
      uint64_t v27 = *MEMORY[0x263EFDF80];
      v64[0] = *MEMORY[0x263EFE070];
      v64[1] = v27;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
      v48 = uint64_t v58 = 0;
      v49 = (void *)v26;
      uint64_t v28 = objc_msgSend(v53, "unifiedContactsMatchingPredicate:keysToFetch:error:", v26);
      id v29 = 0;
      if (v29)
      {
        v30 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[INPerson(TelephonyUtilities) tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:]((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v37 = v28;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v55 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            v43 = [v42 identifier];
            [v9 setObject:v42 forKey:v43];

            [v15 addObject:v42];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v39);
      }

      id v8 = v53;
    }
    v44 = IntentHandlerDefaultLog();
    id v45 = v44;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25DA54000, v45, OS_SIGNPOST_INTERVAL_END, spid, "contactsMatchingIdentifiers", "", buf, 2u);
    }

    v46 = (void *)[v15 copy];
    id v7 = v52;
  }
  else
  {
    v46 = (void *)MEMORY[0x263EFFA68];
  }

  return v46;
}

+ (id)tu_personMatchingHandle:()TelephonyUtilities contactsDataSource:isoCountryCodes:
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = IntentHandlerDefaultLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = IntentHandlerDefaultLog();
  uint64_t v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25DA54000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "personMatchingHandle", "", buf, 2u);
  }

  id v15 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v7;
    _os_log_impl(&dword_25DA54000, v15, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store matching handle: %@", buf, 0xCu);
  }

  uint64_t v16 = [v7 type];
  if (v16 == 1)
  {
    uint64_t v17 = [v7 value];
    int v18 = [v17 _appearsToBePhoneNumber];

    if (!v18)
    {
      v24 = [v7 value];
      int v25 = [v24 _appearsToBeEmail];

      if (!v25)
      {
LABEL_23:
        v23 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          +[INPerson(TelephonyUtilities) tu_personMatchingHandle:contactsDataSource:isoCountryCodes:]((uint64_t)v7, v23, v41, v42, v43, v44, v45, v46);
        }
        v47 = 0;
        goto LABEL_37;
      }
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v19 = (void *)MEMORY[0x263EFE9F8];
    BOOL v20 = (void *)MEMORY[0x263EFEB28];
    uint64_t v21 = [v7 value];
    uint64_t v22 = [v20 phoneNumberWithStringValue:v21];
    v23 = [v19 predicateForContactsMatchingPhoneNumber:v22];

    goto LABEL_14;
  }
  if (v16 == 2) {
    goto LABEL_11;
  }
  if (v16 != 3) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v26 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v21 = [v7 value];
  v23 = [v26 predicateForContactsMatchingEmailAddress:v21];
LABEL_14:

  if (!v23) {
    goto LABEL_23;
  }
  uint64_t v27 = *MEMORY[0x263EFDF80];
  v65[0] = *MEMORY[0x263EFE070];
  v65[1] = v27;
  uint64_t v28 = [MEMORY[0x263F08A68] descriptorForUsedKeys];
  v65[2] = v28;
  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];

  id v63 = v8;
  id v64 = 0;
  long long v62 = (void *)v29;
  v30 = [v8 unifiedContactsMatchingPredicate:v23 keysToFetch:v29 error:&v64];
  id v31 = v64;
  if (v31)
  {
    uint64_t v32 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[INPerson(TelephonyUtilities) tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:]((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  if (![v30 count])
  {
    uint64_t v39 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v40 = "No contacts match handle";
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  if ((unint64_t)[v30 count] >= 2)
  {
    uint64_t v39 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v40 = "[WARN] Multiple contacts match handle, using the first one arbitrarily";
LABEL_28:
      _os_log_impl(&dword_25DA54000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
LABEL_30:
  os_signpost_id_t spid = v11;
  v48 = [v30 firstObject];
  v49 = v48;
  long long v61 = v31;
  if (v48)
  {
    id v50 = v9;
    unint64_t v51 = objc_msgSend(v48, "tu_personHandleMatchingHandle:isoCountryCodes:", v7, v9);
    id v52 = [MEMORY[0x263F08A68] componentsForContact:v49];
  }
  else
  {
    id v53 = objc_alloc(MEMORY[0x263F0FD20]);
    id v50 = v9;
    unint64_t v51 = objc_msgSend(v53, "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:", v7, v9);

    id v52 = 0;
  }
  id v54 = objc_alloc(MEMORY[0x263F0FD18]);
  long long v55 = [v49 identifier];
  LOBYTE(v59) = 0;
  v47 = (void *)[v54 initWithPersonHandle:v51 nameComponents:v52 displayName:0 image:0 contactIdentifier:v55 customIdentifier:0 isMe:v59];

  long long v56 = IntentHandlerDefaultLog();
  long long v57 = v56;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25DA54000, v57, OS_SIGNPOST_INTERVAL_END, spid, "personMatchingHandle", "", buf, 2u);
  }

  id v8 = v63;
  id v9 = v50;
LABEL_37:

  return v47;
}

- (void)tu_contactsMatchingIdentifiers:()TelephonyUtilities contactsDataSource:identifierToContactCache:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)tu_personMatchingHandle:()TelephonyUtilities contactsDataSource:isoCountryCodes:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end