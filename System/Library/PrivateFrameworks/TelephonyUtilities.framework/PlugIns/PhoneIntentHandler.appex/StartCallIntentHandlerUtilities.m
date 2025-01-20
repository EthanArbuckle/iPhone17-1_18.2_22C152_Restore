@interface StartCallIntentHandlerUtilities
+ (BOOL)contactsShareHandleValue:(id)a3;
+ (id)contactWithMostHandles:(id)a3;
+ (id)inPersonFromContact:(id)a3 handleValue:(id)a4 handleType:(int64_t)a5 handleLabel:(id)a6;
+ (id)sortContacts:(id)a3 withIdentifiers:(id)a4;
+ (void)populatePersonsByTUHandleFrom:(id)a3 personsByTUHandle:(id)a4 tuHandleOrderedSet:(id)a5;
@end

@implementation StartCallIntentHandlerUtilities

+ (id)sortContacts:(id)a3 withIdentifiers:(id)a4
{
  id v42 = a3;
  id v5 = a4;
  v6 = IntentHandlerDefaultLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = IntentHandlerDefaultLog();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "sortMatchingContactsWithIdentifiers", "", buf, 2u);
  }

  if (v42)
  {
    os_signpost_id_t spid = v7;
    unint64_t v37 = v7 - 1;
    v40 = objc_alloc_init((Class)NSMutableArray);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v38 = v5;
    id obj = v5;
    id v10 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v41 = *(void *)v52;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v14 = v42;
          id v15 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v48;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v48 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
                v20 = [v19 identifier];
                unsigned int v21 = [v13 isEqualToString:v20];

                if (v21)
                {
                  [v40 addObject:v19];
                  goto LABEL_20;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        id v11 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v11);
    }

    v22 = v40;
    id v23 = [v40 count];
    if (v23 != [v42 count])
    {
      id v24 = objc_alloc_init((Class)NSMutableSet);
      [v24 addObjectsFromArray:v40];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v25 = v42;
      id v26 = [v25 countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v44;
        do
        {
          for (k = 0; k != v27; k = (char *)k + 1)
          {
            if (*(void *)v44 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * (void)k);
            if (([v24 containsObject:v30] & 1) == 0) {
              [v40 addObject:v30];
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v43 objects:v56 count:16];
        }
        while (v27);
      }
    }
    v31 = IntentHandlerDefaultLog();
    v32 = v31;
    if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, spid, "sortMatchingContactsWithIdentifiers", "", buf, 2u);
    }

    id v33 = [v40 copy];
    id v5 = v38;
  }
  else
  {
    v34 = IntentHandlerDefaultLog();
    v22 = v34;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v7, "sortMatchingContactsWithIdentifiers", "", buf, 2u);
    }
    id v33 = &__NSArray0__struct;
  }

  return v33;
}

+ (id)inPersonFromContact:(id)a3 handleValue:(id)a4 handleType:(int64_t)a5 handleLabel:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)INPersonHandle) initWithValue:v10 type:a5 label:v9];

  v13 = +[CNContactFormatter stringFromContact:v11 style:0];
  id v14 = +[NSPersonNameComponents componentsForContact:v11];
  id v15 = objc_alloc((Class)INPerson);
  id v16 = [v11 identifier];
  LOBYTE(v20) = 0;
  id v17 = [v15 initWithPersonHandle:v12 nameComponents:v14 displayName:v13 image:0 contactIdentifier:v16 customIdentifier:0 isMe:v20];

  v18 = [v11 phonemeData];

  [v17 setPhonemeData:v18];

  return v17;
}

+ (BOOL)contactsShareHandleValue:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v38 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v35 = v3;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v37 = *(void *)v52;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(obj);
          }
          os_signpost_id_t v7 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v8 = objc_alloc_init((Class)NSMutableSet);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v9 = [v7 phoneNumbers];
          id v10 = [v9 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v48;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * (void)j), "value", v35);
                id v15 = [v14 unformattedInternationalStringValue];

                [v8 addObject:v15];
              }
              id v11 = [v9 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }
            while (v11);
          }

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v16 = [v7 emailAddresses];
          id v17 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v44;
            do
            {
              for (k = 0; k != v18; k = (char *)k + 1)
              {
                if (*(void *)v44 != v19) {
                  objc_enumerationMutation(v16);
                }
                unsigned int v21 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)k), "value", v35);
                v22 = [v21 lowercaseString];
                [v8 addObject:v22];
              }
              id v18 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }
            while (v18);
          }

          id v23 = [v8 copy];
          [v38 setObject:v23 forKey:v7];
        }
        id v5 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v5);
    }

    id v24 = objc_alloc((Class)NSMutableSet);
    id v25 = [v38 allValues];
    id v26 = [v25 firstObject];
    id v27 = [v24 initWithSet:v26];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v28 = [v38 allValues];
    id v29 = [v28 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (m = 0; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(v27, "intersectSet:", *(void *)(*((void *)&v39 + 1) + 8 * (void)m), v35);
        }
        id v30 = [v28 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v30);
    }

    BOOL v33 = [v27 count] != 0;
    id v3 = v35;
  }
  else
  {
    BOOL v33 = 1;
  }

  return v33;
}

+ (id)contactWithMostHandles:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 emailAddresses];
  v6 = (char *)[v5 count];
  os_signpost_id_t v7 = [v4 phoneNumbers];
  id v8 = [v7 count];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = &v6[(void)v8];
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "emailAddresses", (void)v22);
        id v17 = (char *)[v16 count];
        id v18 = [v15 phoneNumbers];
        uint64_t v19 = &v17[(void)[v18 count]];

        if (v19 > v12)
        {
          id v20 = v15;

          uint64_t v12 = v19;
          id v4 = v20;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v4;
}

+ (void)populatePersonsByTUHandleFrom:(id)a3 personsByTUHandle:(id)a4 tuHandleOrderedSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v15 = +[TUHandle handleWithPerson:v14];
        if (v15)
        {
          [v9 addObject:v15];
          id v16 = [v8 objectForKeyedSubscript:v15];
          if (!v16)
          {
            id v16 = objc_alloc_init((Class)NSMutableArray);
            [v8 setObject:v16 forKeyedSubscript:v15];
          }
          [v16 addObject:v14];
        }
      }
      id v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

@end