@interface INPerson
+ (id)tu_personMatchingHandle:(id)a3 contactsDataSource:(id)a4 isoCountryCodes:(id)a5;
- (BOOL)usesScoreBasedEncoding;
- (id)extractRecommendation;
- (id)tu_allContactIdentifiers;
- (id)tu_contactsMatchingIdentifiers:(id)a3 contactsDataSource:(id)a4 identifierToContactCache:(id)a5;
- (id)tu_handlesMatchingPersonWithContactsDataSource:(id)a3 identifierToContactCache:(id)a4;
- (id)tu_matchingINPersonHandlesByContactIdentifier;
- (id)tu_personWithFormattedHandleForISOCountryCodes:(id)a3;
@end

@implementation INPerson

- (id)tu_allContactIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  v4 = [(INPerson *)self contactIdentifier];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [(INPerson *)self contactIdentifier];
    [v3 addObject:v6];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [(INPerson *)self siriMatches];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 contactIdentifier];
        id v14 = [v13 length];

        if (v14)
        {
          v15 = [v12 contactIdentifier];
          [v3 addObject:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v16 = [v3 array];

  return v16;
}

- (id)tu_matchingINPersonHandlesByContactIdentifier
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(INPerson *)self siriMatches];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 contactIdentifier];
        if ([v10 length])
        {
          v11 = [v9 personHandle];

          if (!v11) {
            continue;
          }
          v12 = [v9 contactIdentifier];
          id v10 = [v3 objectForKeyedSubscript:v12];

          if (!v10)
          {
            id v10 = objc_alloc_init((Class)NSMutableArray);
            v13 = [v9 contactIdentifier];
            [v3 setObject:v10 forKeyedSubscript:v13];
          }
          id v14 = [v9 personHandle];
          [v10 addObject:v14];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v15 = [v3 copy];

  return v15;
}

- (id)tu_personWithFormattedHandleForISOCountryCodes:(id)a3
{
  id v4 = a3;
  id v5 = [(INPerson *)self personHandle];
  id v6 = [v5 value];
  if ([v5 type] == (id)2
    || ![v5 type] && objc_msgSend(v6, "_appearsToBePhoneNumber"))
  {
    uint64_t v7 = [v4 firstObject];
    id v8 = +[CNPhoneNumber phoneNumberWithDigits:v6 countryCode:v7];
    id v9 = [v8 formattedStringValue];

    [v5 setValue:v9 forKey:@"value"];
  }
  id v10 = [(INPerson *)self mutableCopy];
  [v10 setPersonHandle:v5];

  return v10;
}

- (id)tu_handlesMatchingPersonWithContactsDataSource:(id)a3 identifierToContactCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handlesMatchingPerson", "", buf, 2u);
  }

  id v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = [(INPerson *)self personHandle];
  id v14 = [v13 value];
  id v15 = [v14 length];

  if (v15)
  {
    v16 = +[TUHandle handleWithPerson:self];
    [v12 addObject:v16];
  }
  else
  {
    uint64_t v52 = [(INPerson *)self tu_allContactIdentifiers];
    id v53 = v7;
    id v54 = v6;
    long long v17 = -[INPerson tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:](self, "tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:");
    long long v18 = [(INPerson *)self personHandle];
    unint64_t v19 = (unint64_t)[v18 type];

    long long v72 = 0u;
    long long v73 = 0u;
    BOOL v20 = (v19 & 1) == 0 && v19 < 3;
    BOOL v60 = v20;
    long long v70 = 0uLL;
    long long v71 = 0uLL;
    id obj = v17;
    id v61 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v61)
    {
      unsigned int v59 = (v19 < 3) & (3u >> (v19 & 7));
      uint64_t v58 = *(void *)v71;
      v55 = self;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (v60)
          {
            v23 = [(INPerson *)self personHandle];
            v24 = [v23 label];
            v57 = v22;
            v25 = objc_msgSend(v22, "tu_phoneNumbersMatchingPersonHandleLabel:", v24);

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v26 = v25;
            id v27 = [v26 countByEnumeratingWithState:&v66 objects:v76 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v67;
              do
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v67 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
                  id v32 = objc_alloc((Class)TUHandle);
                  v33 = [v31 value];
                  v34 = [v33 stringValue];
                  id v35 = [v32 initWithType:2 value:v34];

                  [v12 addObject:v35];
                }
                id v28 = [v26 countByEnumeratingWithState:&v66 objects:v76 count:16];
              }
              while (v28);
            }

            self = v55;
            v22 = v57;
          }
          if (v59)
          {
            v36 = [(INPerson *)self personHandle];
            v37 = [v36 label];
            v38 = objc_msgSend(v22, "tu_emailAddressesMatchingPersonHandleLabel:", v37);

            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v39 = v38;
            id v40 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v63;
              do
              {
                for (k = 0; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v63 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = *(void **)(*((void *)&v62 + 1) + 8 * (void)k);
                  id v45 = objc_alloc((Class)TUHandle);
                  v46 = [v44 value];
                  id v47 = [v45 initWithType:3 value:v46];

                  [v12 addObject:v47];
                }
                id v41 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
              }
              while (v41);
            }
          }
        }
        id v61 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v61);
    }

    id v7 = v53;
    id v6 = v54;
    v16 = (void *)v52;
  }

  v48 = IntentHandlerDefaultLog();
  v49 = v48;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v9, "handlesMatchingPerson", "", buf, 2u);
  }

  id v50 = [v12 copy];

  return v50;
}

- (id)tu_contactsMatchingIdentifiers:(id)a3 contactsDataSource:(id)a4 identifierToContactCache:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    uint64_t v52 = v8;
    id v10 = IntentHandlerDefaultLog();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    id v12 = IntentHandlerDefaultLog();
    v13 = v12;
    unint64_t v50 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "contactsMatchingIdentifiers", "", buf, 2u);
    }
    os_signpost_id_t spid = v11;

    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v15 = objc_alloc_init((Class)NSMutableArray);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v51 = v7;
    id v16 = v7;
    id v17 = [v16 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v59;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v22 = [v9 objectForKey:v21];
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
        id v18 = [v16 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v18);
    }

    id v8 = v52;
    if ([v14 count])
    {
      v25 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v16;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store matching identifiers: %@", buf, 0xCu);
      }

      uint64_t v26 = +[CNContact predicateForContactsWithIdentifiers:v14];
      v63[0] = CNContactPhoneNumbersKey;
      v63[1] = CNContactEmailAddressesKey;
      +[NSArray arrayWithObjects:v63 count:2];
      id v47 = v57 = 0;
      v48 = (void *)v26;
      id v27 = objc_msgSend(v52, "unifiedContactsMatchingPredicate:keysToFetch:error:", v26);
      id v28 = 0;
      if (v28)
      {
        uint64_t v29 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100030B64((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v36 = v27;
      id v37 = [v36 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v54;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(v36);
            }
            id v41 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            uint64_t v42 = [v41 identifier];
            [v9 setObject:v41 forKey:v42];

            [v15 addObject:v41];
          }
          id v38 = [v36 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v38);
      }

      id v8 = v52;
    }
    v43 = IntentHandlerDefaultLog();
    v44 = v43;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, spid, "contactsMatchingIdentifiers", "", buf, 2u);
    }

    id v45 = [v15 copy];
    id v7 = v51;
  }
  else
  {
    id v45 = &__NSArray0__struct;
  }

  return v45;
}

+ (id)tu_personMatchingHandle:(id)a3 contactsDataSource:(id)a4 isoCountryCodes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = IntentHandlerDefaultLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = IntentHandlerDefaultLog();
  v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "personMatchingHandle", "", buf, 2u);
  }

  id v15 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store matching handle: %@", buf, 0xCu);
  }

  id v16 = [v7 type];
  if (v16 == (id)1)
  {
    id v17 = [v7 value];
    unsigned int v18 = [v17 _appearsToBePhoneNumber];

    if (!v18)
    {
      v22 = [v7 value];
      unsigned int v23 = [v22 _appearsToBeEmail];

      if (!v23)
      {
LABEL_23:
        long long v21 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100030BD0((uint64_t)v7, v21, v37, v38, v39, v40, v41, v42);
        }
        id v43 = 0;
        goto LABEL_37;
      }
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v19 = [v7 value];
    BOOL v20 = +[CNPhoneNumber phoneNumberWithStringValue:v19];
    long long v21 = +[CNContact predicateForContactsMatchingPhoneNumber:v20];

    goto LABEL_14;
  }
  if (v16 == (id)2) {
    goto LABEL_11;
  }
  if (v16 != (id)3) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v19 = [v7 value];
  long long v21 = +[CNContact predicateForContactsMatchingEmailAddress:v19];
LABEL_14:

  if (!v21) {
    goto LABEL_23;
  }
  v61[0] = CNContactPhoneNumbersKey;
  v61[1] = CNContactEmailAddressesKey;
  v24 = +[NSPersonNameComponents descriptorForUsedKeys];
  v61[2] = v24;
  uint64_t v25 = +[NSArray arrayWithObjects:v61 count:3];

  id v59 = v8;
  id v60 = 0;
  long long v58 = (void *)v25;
  uint64_t v26 = [v8 unifiedContactsMatchingPredicate:v21 keysToFetch:v25 error:&v60];
  id v27 = v60;
  if (v27)
  {
    id v28 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100030B64((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  if (![v26 count])
  {
    uint64_t v35 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v36 = "No contacts match handle";
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  if ((unint64_t)[v26 count] >= 2)
  {
    uint64_t v35 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v36 = "[WARN] Multiple contacts match handle, using the first one arbitrarily";
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 2u);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
LABEL_30:
  os_signpost_id_t spid = v11;
  v44 = [v26 firstObject];
  id v45 = v44;
  uint64_t v57 = v27;
  if (v44)
  {
    id v46 = v9;
    id v47 = objc_msgSend(v44, "tu_personHandleMatchingHandle:isoCountryCodes:", v7, v9);
    v48 = +[NSPersonNameComponents componentsForContact:v45];
  }
  else
  {
    id v49 = objc_alloc((Class)INPersonHandle);
    id v46 = v9;
    id v47 = objc_msgSend(v49, "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:", v7, v9);

    v48 = 0;
  }
  id v50 = objc_alloc((Class)INPerson);
  id v51 = [v45 identifier];
  LOBYTE(v55) = 0;
  id v43 = [v50 initWithPersonHandle:v47 nameComponents:v48 displayName:0 image:0 contactIdentifier:v51 customIdentifier:0 isMe:v55];

  uint64_t v52 = IntentHandlerDefaultLog();
  long long v53 = v52;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_END, spid, "personMatchingHandle", "", buf, 2u);
  }

  id v8 = v59;
  id v9 = v46;
LABEL_37:

  return v43;
}

- (BOOL)usesScoreBasedEncoding
{
  id v3 = [(INPerson *)self scoredAlternatives];
  if ([v3 count])
  {
    id v4 = [(INPerson *)self scoredAlternatives];
    id v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v5 score];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)extractRecommendation
{
  if ([(INPerson *)self usesScoreBasedEncoding])
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v5 = [(INPerson *)self scoredAlternatives];
    id v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v41;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          os_signpost_id_t v11 = [v10 person];
          id v12 = [v11 contactIdentifier];

          if ([v12 length])
          {
            [v4 addObject:v12];
            v13 = [v3 valueForKey:v12];
            unint64_t v14 = [v10 score];
            id v15 = v14;
            if (v14)
            {
              id v16 = v14;
            }
            else
            {
              id v16 = +[NSNumber numberWithFloat:0.0];
            }
            id v17 = v16;

            if (!v13 || [v17 compare:v13] == (id)1) {
              [v3 setValue:v17 forKey:v12];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v7);
    }

    id v18 = [v3 copy];
    uint64_t v19 = [v4 array];

    if ([v19 count])
    {
      if ([v18 count] == (id)1)
      {
        BOOL v20 = [v18 allValues];
        long long v21 = [v20 firstObject];

        [v21 floatValue];
        if (v22 >= 0.7) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 2;
        }
      }
      else
      {
        uint64_t v23 = 3;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    v24 = [(INPerson *)self contactIdentifier];
    id v25 = [v24 length];

    if (v25)
    {
      uint64_t v26 = [(INPerson *)self contactIdentifier];
      id v45 = v26;
      uint64_t v23 = 1;
      uint64_t v19 = +[NSArray arrayWithObjects:&v45 count:1];

      goto LABEL_31;
    }
    id v27 = [(INPerson *)self siriMatches];
    if ([v27 count] == (id)1)
    {
      id v28 = [(INPerson *)self siriMatches];
      uint64_t v29 = [v28 firstObject];
      uint64_t v30 = [v29 contactIdentifier];

      if (v30)
      {
        uint64_t v31 = [(INPerson *)self siriMatches];
        uint64_t v32 = [v31 firstObject];
        uint64_t v33 = [v32 contactIdentifier];
        v44 = v33;
        uint64_t v19 = +[NSArray arrayWithObjects:&v44 count:1];

        uint64_t v23 = 2;
        goto LABEL_31;
      }
    }
    else
    {
    }
    id v36 = [(INPerson *)self siriMatches];
    id v37 = [v36 count];

    if ((unint64_t)v37 < 2)
    {
      uint64_t v23 = 0;
      uint64_t v19 = &__NSArray0__struct;
    }
    else
    {
      uint64_t v38 = [(INPerson *)self siriMatches];
      uint64_t v39 = NSStringFromSelector("contactIdentifier");
      uint64_t v19 = [v38 valueForKey:v39];

      uint64_t v23 = 3;
    }
  }
LABEL_31:
  uint64_t v34 = [[SiriMatchRecommendation alloc] initWithType:v23 contactIdentifiers:v19];

  return v34;
}

@end