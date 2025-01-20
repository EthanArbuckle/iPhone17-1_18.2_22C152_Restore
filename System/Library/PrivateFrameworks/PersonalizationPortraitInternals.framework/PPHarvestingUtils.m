@interface PPHarvestingUtils
+ (id)appBlocklist;
+ (id)contactHandlesForSearchableItem:(id)a3;
+ (id)scoredEntitiesFromMapsIntent:(id)a3;
+ (id)textContentFromSearchableItem:(id)a3;
@end

@implementation PPHarvestingUtils

+ (id)scoredEntitiesFromMapsIntent:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 backingStore];
  if (objc_opt_respondsToSelector())
  {
    v5 = v4;
    v6 = [v5 parameters];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 parameters];
      v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v83 = [v8 count];
        _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPNamedEntityPlugin: Maps intent parameter count: %tu", buf, 0xCu);
      }
      v67 = v5;
      v68 = v4;
      id v69 = v3;

      v75 = objc_opt_new();
      v10 = [MEMORY[0x1E4F1CA20] currentLocale];
      v76 = [v10 languageCode];

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (!v12)
      {
        v73 = 0;
        v74 = 0;
        v71 = 0;
        v72 = 0;
        v70 = 0;
        goto LABEL_48;
      }
      uint64_t v13 = v12;
      v73 = 0;
      v74 = 0;
      v71 = 0;
      v72 = 0;
      v70 = 0;
      uint64_t v14 = *(void *)v78;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v78 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v77 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
          {
            v25 = pp_default_log_handle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent property since it is missing role and/or payload", buf, 2u);
            }
            goto LABEL_21;
          }
          v17 = [v16 role];
          int v18 = [v17 isEqualToString:@"title"];

          if (v18) {
            goto LABEL_19;
          }
          v19 = [v16 role];
          int v20 = [v19 isEqualToString:@"Street"];

          if (v20)
          {
            v21 = [v16 payload];
            v22 = [v21 payloadStringValues];
            v23 = [v22 firstObject];
            v24 = [v23 value];

            if ([v24 length])
            {
              v25 = [objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v24 category:8 language:v76];
              v26 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v25 score:0.5];
              [v75 addObject:v26];

              v74 = v24;
LABEL_21:

              goto LABEL_22;
            }
            v74 = v24;
          }
          else
          {
            v27 = [v16 role];
            int v28 = [v27 isEqualToString:@"Name"];

            if (v28)
            {
LABEL_19:
              v29 = objc_msgSend(v16, "payload", v67);
              v30 = [v29 payloadStringValues];
              v31 = [v30 firstObject];
              v25 = [v31 value];

              if ([v25 length])
              {
                v32 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v25 category:3 language:v76];
                v33 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v32 score:0.5];
                [v75 addObject:v33];
              }
              goto LABEL_21;
            }
            v34 = [v16 role];
            int v35 = [v34 isEqualToString:@"City"];

            if (v35)
            {
              v36 = [v16 payload];
              v37 = [v36 payloadStringValues];
              v38 = [v37 firstObject];
              v39 = [v38 value];

              if ([v39 length])
              {
                v25 = [objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v39 category:9 language:v76];
                v40 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v25 score:0.5];
                [v75 addObject:v40];

                v73 = v39;
                goto LABEL_21;
              }
              v73 = v39;
            }
            else
            {
              v41 = [v16 role];
              int v42 = [v41 isEqualToString:@"ZIP"];

              if (v42)
              {
                v25 = [v16 payload];
                v43 = [v25 payloadStringValues];
                v44 = [v43 firstObject];
                uint64_t v45 = [v44 value];

                v72 = (void *)v45;
                goto LABEL_21;
              }
              v46 = [v16 role];
              int v47 = [v46 isEqualToString:@"State"];

              if (v47)
              {
                v48 = [v16 payload];
                v49 = [v48 payloadStringValues];
                v50 = [v49 firstObject];
                v51 = [v50 value];

                if ([v51 length])
                {
                  v25 = [objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v51 category:10 language:v76];
                  v52 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v25 score:0.5];
                  [v75 addObject:v52];

                  v71 = v51;
                  goto LABEL_21;
                }
                v71 = v51;
              }
              else
              {
                v53 = [v16 role];
                int v54 = [v53 isEqualToString:@"Country"];

                if (v54)
                {
                  v55 = [v16 payload];
                  v56 = [v55 payloadStringValues];
                  v57 = [v56 firstObject];
                  v58 = [v57 value];

                  if ([v58 length])
                  {
                    v59 = v58;
                    v25 = [objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v58 category:11 language:v76];
                    v60 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v25 score:0.5];
                    [v75 addObject:v60];

                    v70 = v59;
                    goto LABEL_21;
                  }
                  v70 = v58;
                }
              }
            }
          }
LABEL_22:
          ++v15;
        }
        while (v13 != v15);
        uint64_t v61 = [v11 countByEnumeratingWithState:&v77 objects:v81 count:16];
        uint64_t v13 = v61;
        if (!v61)
        {
LABEL_48:

          v63 = +[PPNamedEntitySupport fullAddressForStreetAddress:v74 city:v73 state:v71 postalCode:v72 country:v70];
          v4 = v68;
          if ([v63 length])
          {
            v64 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v63 category:12 language:v76];
            v65 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v64 score:0.5];
            [v75 addObject:v65];
          }
          id v62 = v75;

          id v3 = v69;
          v5 = v67;
          goto LABEL_51;
        }
      }
    }
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent since the parameters do not look like an array", buf, 2u);
    }
    id v62 = (id)MEMORY[0x1E4F1CBF0];
LABEL_51:
  }
  else
  {
    v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent since it isn't a generic intent with parameters", buf, 2u);
    }
    id v62 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v62;
}

+ (id)textContentFromSearchableItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 attributeSet];

  if (!v4)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v5 = (void *)*MEMORY[0x1E4F8A0E8];
  v6 = [v3 bundleID];
  if ([v5 isEqualToString:v6])
  {
    v7 = (void *)*MEMORY[0x1E4F937F0];
    v8 = [v3 attributeSet];
    v9 = [v8 textContentDataSource];
    LODWORD(v7) = [v7 isEqualToString:v9];

    if (v7)
    {
      v10 = [v3 attributeSet];
      v11 = [v10 title];

      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F8A0E0];
  uint64_t v13 = [v3 bundleID];
  LODWORD(v12) = [v12 isEqualToString:v13];

  if (v12)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = [v3 attributeSet];
    v16 = [v15 title];
    v17 = [v3 attributeSet];
    uint64_t v18 = [v17 comment];
LABEL_16:
    v26 = (void *)v18;
    v11 = (void *)[v14 initWithFormat:@"%@\n\n%@", v16, v18];

    goto LABEL_25;
  }
  v19 = (void *)*MEMORY[0x1E4F8A0A8];
  int v20 = [v3 bundleID];
  LODWORD(v19) = [v19 isEqualToString:v20];

  if (!v19)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = [v3 attributeSet];
    v16 = [v15 title];
    v17 = [v3 attributeSet];
    uint64_t v18 = [v17 textContentNoCopy];
    goto LABEL_16;
  }
  uint64_t v21 = MEMORY[0x1CB79D060]();
  v22 = [v3 attributeSet];
  v23 = [v22 attributeForKey:@"com_apple_mobilesms_lpTitle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v23 firstObject];

    v23 = (void *)v24;
  }
  if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v25 = v23;
  }
  else {
    v25 = &stru_1F253DF18;
  }
  v27 = [v3 attributeSet];
  int v28 = [v27 attributeForKey:@"com_apple_mobilesms_lpDescription"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v28 firstObject];

    int v28 = (void *)v29;
  }
  context = (void *)v21;
  if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v30 = v28;
  }
  else {
    v30 = &stru_1F253DF18;
  }
  id v31 = [NSString alloc];
  v32 = [v3 attributeSet];
  v33 = [v32 title];
  v34 = [v3 attributeSet];
  int v35 = [v34 textContentNoCopy];
  v11 = (void *)[v31 initWithFormat:@"%@\n\n%@\n\n%@\n\n%@", v33, v35, v25, v30];

LABEL_25:

  return v11;
}

+ (id)contactHandlesForSearchableItem:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v5 = [v3 attributeSet];
  v6 = [v5 authors];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v13 = (void *)MEMORY[0x1E4F93790];
        id v14 = [v11 handles];
        uint64_t v15 = [v13 sanitizeHandles:v14];
        [v4 addObjectsFromArray:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v16 = [v3 attributeSet];
  v17 = [v16 primaryRecipients];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        v23 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v24 = (void *)MEMORY[0x1E4F93790];
        v25 = [v22 handles];
        v26 = [v24 sanitizeHandles:v25];
        [v4 addObjectsFromArray:v26];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v27 = objc_msgSend(v3, "attributeSet", 0);
  int v28 = [v27 additionalRecipients];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v39 + 1) + 8 * k);
        v34 = (void *)MEMORY[0x1CB79D060]();
        int v35 = (void *)MEMORY[0x1E4F93790];
        v36 = [v33 handles];
        v37 = [v35 sanitizeHandles:v36];
        [v4 addObjectsFromArray:v37];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v30);
  }

  return v4;
}

+ (id)appBlocklist
{
  if (appBlocklist_onceToken != -1) {
    dispatch_once(&appBlocklist_onceToken, &__block_literal_global_4516);
  }
  v2 = (void *)appBlocklist_blocklist;
  return v2;
}

void __33__PPHarvestingUtils_appBlocklist__block_invoke()
{
  v0 = +[PPConnectionsParameters sharedInstance];
  uint64_t v1 = [v0 donationBlockedApps];
  v2 = (void *)v1;
  id v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v1) {
    id v3 = (void *)v1;
  }
  id v4 = v3;

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  v6 = (void *)appBlocklist_blocklist;
  appBlocklist_blocklist = v5;
}

@end