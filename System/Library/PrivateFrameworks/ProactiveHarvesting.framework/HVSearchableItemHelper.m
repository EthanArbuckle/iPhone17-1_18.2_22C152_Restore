@interface HVSearchableItemHelper
+ (BOOL)mailItemIsFromSupportedAccount:(id)a3;
+ (BOOL)mailItemIsInDrafts:(id)a3;
+ (BOOL)mailItemIsInDrafts:(id)a3 mailboxIdentifiers:(id)a4;
+ (BOOL)mailItemIsInSent:(id)a3;
+ (BOOL)mailItemIsInSent:(id)a3 mailboxIdentifiers:(id)a4;
+ (BOOL)mailItemIsInTrash:(id)a3;
+ (BOOL)mailItemIsInTrash:(id)a3 mailboxIdentifiers:(id)a4;
+ (BOOL)mailItemIsRecent:(id)a3;
+ (BOOL)mailItemIsRecent:(id)a3 emailHeaders:(id)a4;
+ (BOOL)mailItemIsSPAM:(id)a3;
+ (BOOL)mailItemIsSPAM:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5;
+ (BOOL)mailItemIsTooBig:(id)a3;
+ (BOOL)mailItemIsValid:(id)a3;
+ (BOOL)mailItemIsValid:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5;
+ (BOOL)searchableItemIsEmpty:(id)a3;
+ (BOOL)searchableItemIsOutgoing:(id)a3;
+ (id)deserializeAttributes:(id)a3;
+ (id)deserializeAttributes:(id)a3 andBody:(id)a4;
+ (id)deserializeAttributesAndBody:(id)a3;
+ (id)htmlContentDataNoCopyRetainingBackingBuffer:(id)a3;
+ (id)mailItemMessageIdHeaderValues:(id)a3;
+ (id)messageIdHeaderValuesFromHeaders:(id)a3;
+ (id)sanitizeHandles:(id)a3;
+ (id)serializeAttributesAndBody:(id)a3;
+ (id)textContentNoCopyRetainingBackingBuffer:(id)a3;
@end

@implementation HVSearchableItemHelper

+ (BOOL)mailItemIsValid:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 bundleID];

  if (!v10)
  {
    v13 = hv_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v8 uniqueIdentifier];
      int v19 = 138543362;
      v20 = v14;
      v15 = "Item %{public}@ is malformed - no bundleID";
LABEL_14:
      _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0xCu);
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(a4) = 0;
    goto LABEL_17;
  }
  if (!a4)
  {
    v13 = hv_default_log_handle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v14 = [v8 uniqueIdentifier];
    int v19 = 138543362;
    v20 = v14;
    v15 = "Item %{public}@ not valid - no value for emailHeaders";
    goto LABEL_14;
  }
  v11 = [a1 mailItemMessageIdHeaderValues:v8];

  if (!v11)
  {
    v13 = hv_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v8 uniqueIdentifier];
      int v19 = 138543362;
      v20 = v14;
      v15 = "Item %{public}@ not valid - no message-id header";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  v12 = [v8 attributeSet];
  v13 = [v12 accountIdentifier];

  if (!v13)
  {
    v14 = hv_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v8 uniqueIdentifier];
      int v19 = 138543362;
      v20 = v17;
      v18 = "Item %{public}@ is malformed - no source";
LABEL_22:
      _os_log_impl(&dword_226C41000, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v19, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v9 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = hv_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v8 uniqueIdentifier];
      int v19 = 138543362;
      v20 = v17;
      v18 = "Item %{public}@ is malformed - mailbox list is present but is not an array";
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  LOBYTE(a4) = 1;
LABEL_17:

  return (char)a4;
}

+ (id)mailItemMessageIdHeaderValues:(id)a3
{
  v4 = [a3 attributeSet];
  v5 = [v4 emailHeaders];

  if (v5)
  {
    v6 = [a1 messageIdHeaderValuesFromHeaders:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)messageIdHeaderValuesFromHeaders:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)MEMORY[0x22A6667F0]();
  v5 = [v3 objectForKeyedSubscript:@"message-id"];
  if (!v5)
  {
    v5 = [v3 objectForKeyedSubscript:@"Message-id"];
    if (!v5)
    {
      v5 = [v3 objectForKeyedSubscript:@"Message-Id"];
      if (!v5)
      {
        v5 = [v3 objectForKeyedSubscript:@"MESSAGE-ID"];
        if (!v5)
        {
          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          id v6 = v3;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v14;
            while (2)
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v14 != v9) {
                  objc_enumerationMutation(v6);
                }
                v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
                if (objc_msgSend(v11, "length", (void)v13) == 10
                  && ![v11 caseInsensitiveCompare:@"message-id"])
                {
                  v5 = [v6 objectForKeyedSubscript:v11];
                  goto LABEL_16;
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
          v5 = 0;
LABEL_16:
        }
      }
    }
  }

  return v5;
}

+ (BOOL)mailItemIsTooBig:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 attributeSet];
  v5 = [v4 HTMLContentDataNoCopy];
  unint64_t v6 = [v5 length];

  if (v6 > 0xC8000)
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v3 uniqueIdentifier];
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is too big", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6 > 0xC8000;
}

+ (BOOL)mailItemIsRecent:(id)a3 emailHeaders:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 attributeSet];
  uint64_t v8 = [v7 contentCreationDate];

  if (!v8)
  {
    uint64_t v9 = hv_default_log_handle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    long long v16 = [v5 uniqueIdentifier];
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "No contentCreationDate on searchable item with id: %{public}@", buf, 0xCu);
LABEL_8:

    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    int v10 = [v9 dateByAddingTimeInterval:-31536000.0];
    [v8 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    if (v12 < v13)
    {
      long long v14 = hv_default_log_handle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:
        BOOL v17 = 0;
LABEL_32:

        goto LABEL_33;
      }
      long long v15 = [v5 uniqueIdentifier];
      *(_DWORD *)buf = 138544130;
      v41 = v15;
      __int16 v42 = 2114;
      v43 = v8;
      __int16 v44 = 2114;
      v45 = v9;
      __int16 v46 = 2114;
      v47 = v10;
      _os_log_impl(&dword_226C41000, v14, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is older than a year (creationDate: %{public}@, now: %{public}@, cutoff: %{public}@)", buf, 0x2Au);
LABEL_28:

      goto LABEL_29;
    }
    long long v14 = [v9 dateByAddingTimeInterval:-2592000.0];
    [v8 timeIntervalSince1970];
    double v19 = v18;
    [v14 timeIntervalSince1970];
    if (v19 < v20)
    {
      uint64_t v21 = @"list-id";
      if (v6)
      {
        v22 = [v6 objectForKey:@"list-id"];

        if (!v22)
        {
          v34 = v14;
          v35 = v10;
          context = (void *)MEMORY[0x22A6667F0]();
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          v23 = [v6 allKeys];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:buf count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v37;
            while (2)
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                v29 = (void *)MEMORY[0x22A6667F0]();
                uint64_t v30 = [v28 caseInsensitiveCompare:@"list-id"];
                if (!v30)
                {

                  long long v14 = v34;
                  int v10 = v35;
                  goto LABEL_26;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:buf count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          BOOL v17 = 1;
          long long v14 = v34;
          int v10 = v35;
          goto LABEL_32;
        }

LABEL_26:
        long long v15 = hv_default_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [v5 uniqueIdentifier];
          *(_DWORD *)buf = 138544130;
          v41 = v31;
          __int16 v42 = 2114;
          v43 = v8;
          __int16 v44 = 2114;
          v45 = v9;
          __int16 v46 = 2114;
          v47 = v14;
          _os_log_impl(&dword_226C41000, v15, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is a group message older than a month (creationDate: %{public}@, now: %{public}@, cutoff: %{public}@)", buf, 0x2Au);
        }
        goto LABEL_28;
      }
    }
    BOOL v17 = 1;
    goto LABEL_32;
  }
  uint64_t v9 = hv_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    long long v16 = [v5 uniqueIdentifier];
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    _os_log_fault_impl(&dword_226C41000, v9, OS_LOG_TYPE_FAULT, "Invalid contentCreationDate on searchable item %{public}@ sent", buf, 0xCu);
    goto LABEL_8;
  }
LABEL_10:
  BOOL v17 = 0;
LABEL_33:

  return v17;
}

+ (BOOL)mailItemIsInTrash:(id)a3 mailboxIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [a4 containsObject:*MEMORY[0x263F01CA0]];
  if (v6)
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 uniqueIdentifier];
      int v10 = 138543362;
      double v11 = v8;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ in trash mailbox", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6;
}

+ (BOOL)mailItemIsInDrafts:(id)a3 mailboxIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [a4 containsObject:*MEMORY[0x263F01C80]];
  if (v6)
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 uniqueIdentifier];
      int v10 = 138543362;
      double v11 = v8;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is in draft mailbox", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6;
}

+ (BOOL)mailItemIsFromSupportedAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 attributeSet];
  id v5 = [v4 accountType];

  if (!v5)
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v3 uniqueIdentifier];
      int v10 = 138543362;
      double v11 = v8;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ missing account type", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_8;
  }
  if (([v5 isEqual:*MEMORY[0x263F01BA0]] & 1) != 0
    || ([v5 isEqual:*MEMORY[0x263F01BA8]] & 1) != 0)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }
  char v6 = [v5 isEqual:*MEMORY[0x263F01B98]];
LABEL_9:

  return v6;
}

+ (BOOL)mailItemIsSPAM:(id)a3 emailHeaders:(id)a4 mailboxIdentifiers:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 containsObject:*MEMORY[0x263F01C90]])
  {
    int v10 = hv_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v7 uniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      uint64_t v12 = "Item %{public}@ spam - in junk mailbox";
LABEL_45:
      _os_log_impl(&dword_226C41000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

      goto LABEL_46;
    }
    goto LABEL_46;
  }
  if (!v8)
  {
    int v10 = hv_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v7 uniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      uint64_t v12 = "invalid item %{public}@ - email headers are nil";
      goto LABEL_45;
    }
LABEL_46:
    BOOL v41 = 1;
    goto LABEL_47;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v10 = hv_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v7 uniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      v72 = v11;
      uint64_t v12 = "invalid item %{public}@ - email headers are not a dictionary";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  int v10 = v8;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (!v13)
  {
    BOOL v41 = 0;
    goto LABEL_47;
  }
  uint64_t v14 = v13;
  id v56 = v9;
  id v57 = v8;
  v58 = v7;
  uint64_t v15 = *(void *)v68;
LABEL_8:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v68 != v15) {
      objc_enumerationMutation(v10);
    }
    BOOL v17 = *(void **)(*((void *)&v67 + 1) + 8 * v16);
    double v18 = (void *)MEMORY[0x22A6667F0]();
    double v19 = [v17 lowercaseString];
    if ([v19 isEqualToString:@"x-spam-level"])
    {
      double v20 = [v10 objectForKeyedSubscript:v17];
      uint64_t v21 = [v20 firstObject];

      if ([v21 hasPrefix:@"*****"])
      {
        v43 = hv_default_log_handle();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_61;
        }
        v45 = [v58 uniqueIdentifier];
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        __int16 v46 = "Item %{public}@ spam - spam assasin header";
        goto LABEL_60;
      }
      goto LABEL_19;
    }
    if ([v19 isEqualToString:@"x-ms-exchange-organization-pcl"])
    {
      v22 = [v10 objectForKeyedSubscript:v17];
      uint64_t v21 = [v22 firstObject];

      if ([v21 integerValue] >= 4)
      {
        v43 = hv_default_log_handle();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_61;
        }
        v45 = [v58 uniqueIdentifier];
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        __int16 v46 = "Item %{public}@ spam - exchange pcl header";
        goto LABEL_60;
      }
      goto LABEL_19;
    }
    if ([v19 isEqualToString:@"x-ms-exchange-organization-scl"])
    {
      v23 = [v10 objectForKeyedSubscript:v17];
      uint64_t v21 = [v23 firstObject];

      if ([v21 integerValue] >= 5)
      {
        v43 = hv_default_log_handle();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
LABEL_61:

          id v9 = v56;
          goto LABEL_62;
        }
        v45 = [v58 uniqueIdentifier];
        *(_DWORD *)buf = 138543362;
        v72 = v45;
        __int16 v46 = "Item %{public}@ spam - exchange scl header";
LABEL_60:
        _os_log_impl(&dword_226C41000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

        goto LABEL_61;
      }
LABEL_19:

      goto LABEL_20;
    }
    if (![v19 isEqualToString:@"x-tm-as-result"])
    {
      if ([v19 isEqualToString:@"x-proofpoint-spam-details"])
      {
        context = (void *)MEMORY[0x22A6667F0]();
        uint64_t v30 = [v10 objectForKeyedSubscript:v17];
        v31 = [v30 firstObject];

        v32 = context;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v54 = v31;
        id obj = [v31 componentsSeparatedByString:@" "];
        uint64_t v60 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
        if (v60)
        {
          uint64_t v62 = *(void *)v64;
          uint64_t v53 = v15;
          while (2)
          {
            for (uint64_t i = 0; i != v60; ++i)
            {
              if (*(void *)v64 != v62) {
                objc_enumerationMutation(obj);
              }
              v34 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              v35 = (void *)MEMORY[0x22A6667F0]();
              if (([v34 isEqualToString:@"rule=spam"] & 1) != 0
                || [v34 isEqualToString:@"rule=probablespam"])
              {
                v47 = hv_default_log_handle();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v48 = [v58 uniqueIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v72 = v48;
                  __int16 v73 = 2112;
                  v74 = v34;
                  _os_log_impl(&dword_226C41000, v47, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - has x-proofpoint-spam-details rule match: %@", buf, 0x16u);
                }
                goto LABEL_57;
              }
              if (([v34 hasPrefix:@"spamscore="] & 1) != 0
                || [v34 hasPrefix:@"phishscore="])
              {
                uint64_t v36 = [v34 rangeOfString:@"=" options:2];
                long long v38 = [v34 substringFromIndex:v36 + v37];
                uint64_t v39 = [v38 integerValue];

                if (v39 >= 80)
                {
                  v47 = hv_default_log_handle();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    v50 = [v58 uniqueIdentifier];
                    *(_DWORD *)buf = 138543618;
                    v72 = v50;
                    __int16 v73 = 2112;
                    v74 = v34;
                    _os_log_impl(&dword_226C41000, v47, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - has x-proofpoint-spam-details rule match: %@", buf, 0x16u);
                  }
LABEL_57:
                  id v9 = v56;

                  goto LABEL_62;
                }
              }
            }
            uint64_t v15 = v53;
            v32 = context;
            uint64_t v60 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
            if (v60) {
              continue;
            }
            break;
          }
        }
      }
      goto LABEL_20;
    }
    v61 = v18;
    uint64_t v24 = v14;
    uint64_t v25 = v15;
    uint64_t v26 = [v10 objectForKeyedSubscript:v17];
    v27 = [v26 firstObject];

    v28 = [v27 lowercaseString];
    int v29 = [v28 hasPrefix:@"yes"];

    if (v29) {
      break;
    }

    uint64_t v15 = v25;
    uint64_t v14 = v24;
    double v18 = v61;
LABEL_20:

    if (++v16 == v14)
    {
      uint64_t v40 = [v10 countByEnumeratingWithState:&v67 objects:v76 count:16];
      uint64_t v14 = v40;
      if (!v40)
      {
        BOOL v41 = 0;
        id v8 = v57;
        id v7 = v58;
        id v9 = v56;
        goto LABEL_47;
      }
      goto LABEL_8;
    }
  }
  v51 = hv_default_log_handle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = [v58 uniqueIdentifier];
    *(_DWORD *)buf = 138543362;
    v72 = v52;
    _os_log_impl(&dword_226C41000, v51, OS_LOG_TYPE_DEFAULT, "Item %{public}@ spam - trend micro header", buf, 0xCu);
  }
  id v9 = v56;
  double v18 = v61;
LABEL_62:

  BOOL v41 = 1;
  id v8 = v57;
  id v7 = v58;
LABEL_47:

  return v41;
}

+ (id)sanitizeHandles:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_164);
}

uint64_t __42__HVSearchableItemHelper_sanitizeHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)deserializeAttributesAndBody:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSetData];
  char v6 = [v4 htmlContentData];

  id v7 = [a1 deserializeAttributes:v5 andBody:v6];

  return v7;
}

+ (id)deserializeAttributes:(id)a3 andBody:(id)a4
{
  id v6 = a4;
  id v7 = [a1 deserializeAttributes:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 uniqueIdentifier];
    int v10 = [v8 domainIdentifier];
    double v11 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v9 domainIdentifier:v10 attributeSet:v8];
    uint64_t v12 = v11;
    if (v6)
    {
      uint64_t v13 = [v11 attributeSet];
      [v13 setHTMLContentData:v6];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)deserializeAttributes:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F02A48];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithData:v4];

  id v6 = [v5 decode];

  return v6;
}

+ (id)serializeAttributesAndBody:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x22A6667F0]();
  id v5 = objc_opt_new();
  id v6 = [v3 attributeSet];
  [v5 encodeObject:v6];

  id v7 = [HVSearchableItemSerializedAttributes alloc];
  id v8 = [v5 data];
  id v9 = [v3 attributeSet];
  int v10 = [v9 HTMLContentDataNoCopy];
  double v11 = [(HVSearchableItemSerializedAttributes *)v7 initWithAttributeSetData:v8 attributeSetCoder:v5 htmlContentData:v10];

  return v11;
}

+ (id)htmlContentDataNoCopyRetainingBackingBuffer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x22A6667F0]();
  id v5 = [v3 attributeSet];
  id v6 = [v5 HTMLContentDataNoCopy];

  if (v6)
  {
    if ((unint64_t)[v6 length] < 0xC9)
    {
      id v7 = [v3 attributeSet];
      id v8 = [v7 HTMLContentData];

      goto LABEL_6;
    }
    objc_setAssociatedObject(v6, sel_htmlContentDataNoCopyRetainingBackingBuffer_, v3, (void *)1);
  }
  id v8 = v6;
LABEL_6:

  return v8;
}

+ (id)textContentNoCopyRetainingBackingBuffer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x22A6667F0]();
  id v5 = [v3 attributeSet];
  id v6 = [v5 textContentNoCopy];

  if (v6)
  {
    if ((unint64_t)[(__CFString *)v6 length] < 0xC9)
    {
      id v7 = [v3 attributeSet];
      id v8 = [v7 textContent];

      goto LABEL_7;
    }
    if (CFStringGetCharactersPtr(v6))
    {
      objc_setAssociatedObject(v6, sel_textContentNoCopyRetainingBackingBuffer_, v3, (void *)1);
      [(__CFString *)v6 _pas_setRetainsConmingledBackingStore:1];
    }
  }
  id v8 = v6;
LABEL_7:

  return v8;
}

+ (BOOL)mailItemIsInTrash:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 mailboxIdentifiers];
  LOBYTE(a1) = [a1 mailItemIsInTrash:v4 mailboxIdentifiers:v6];

  return (char)a1;
}

+ (BOOL)mailItemIsInSent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 mailboxIdentifiers];
  LOBYTE(a1) = [a1 mailItemIsInSent:v4 mailboxIdentifiers:v6];

  return (char)a1;
}

+ (BOOL)mailItemIsInDrafts:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 mailboxIdentifiers];
  LOBYTE(a1) = [a1 mailItemIsInDrafts:v4 mailboxIdentifiers:v6];

  return (char)a1;
}

+ (BOOL)mailItemIsSPAM:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 emailHeaders];
  id v7 = [v4 attributeSet];
  id v8 = [v7 mailboxIdentifiers];
  LOBYTE(a1) = [a1 mailItemIsSPAM:v4 emailHeaders:v6 mailboxIdentifiers:v8];

  return (char)a1;
}

+ (BOOL)mailItemIsValid:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 emailHeaders];
  id v7 = [v4 attributeSet];
  id v8 = [v7 mailboxIdentifiers];
  LOBYTE(a1) = [a1 mailItemIsValid:v4 emailHeaders:v6 mailboxIdentifiers:v8];

  return (char)a1;
}

+ (BOOL)mailItemIsRecent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributeSet];
  id v6 = [v5 emailHeaders];
  LOBYTE(a1) = [a1 mailItemIsRecent:v4 emailHeaders:v6];

  return (char)a1;
}

+ (BOOL)searchableItemIsOutgoing:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  id v5 = [v3 attributeSet];
  id v6 = [v5 accountHandles];
  id v7 = (void *)[v4 initWithArray:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = objc_msgSend(v3, "attributeSet", 0);
  id v9 = [v8 authorAddresses];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        if ([v7 containsObject:*(void *)(*((void *)&v16 + 1) + 8 * i)])
        {
          LODWORD(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v13 = hv_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v3 uniqueIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, "searchableItemIsOutgoing %{public}@: %d", buf, 0x12u);
  }
  return v10;
}

+ (BOOL)searchableItemIsEmpty:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 attributeSet];
  id v5 = [v4 HTMLContentDataNoCopy];
  if (v5)
  {

LABEL_4:
    BOOL v7 = 0;
    goto LABEL_5;
  }
  id v6 = [v4 textContentNoCopy];

  if (v6) {
    goto LABEL_4;
  }
  id v9 = hv_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v3 uniqueIdentifier];
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "Item %{public}@ is empty", (uint8_t *)&v11, 0xCu);
  }
  BOOL v7 = 1;
LABEL_5:

  return v7;
}

+ (BOOL)mailItemIsInSent:(id)a3 mailboxIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [a4 containsObject:*MEMORY[0x263F01C98]];
  if (v6)
  {
    BOOL v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 uniqueIdentifier];
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Item %{public}@ in sent mailbox", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6;
}

@end