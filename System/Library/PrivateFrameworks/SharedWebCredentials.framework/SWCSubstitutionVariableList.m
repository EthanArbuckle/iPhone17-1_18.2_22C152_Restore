@interface SWCSubstitutionVariableList
@end

@implementation SWCSubstitutionVariableList

void __68___SWCSubstitutionVariableList_cheapBuiltInSubstitutionVariableList__block_invoke(uint64_t a1)
{
  context = (void *)MEMORY[0x1AD1157F0]();
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  for (uint64_t i = 0; i != 24; i += 4)
  {
    v2 = (void *)MEMORY[0x1AD1157F0]();
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v4 = v3;
    v5 = (&off_1E5E51828)[i + 2];
    int v6 = *v5;
    if (*v5) {
      char v7 = 4;
    }
    else {
      char v7 = 2;
    }
    [v3 appendBytes:(&off_1E5E51828)[i] length:(&off_1E5E51828)[i + 1]];
    [v4 appendBytes:"" length:1];
    if (v6)
    {
      [v4 appendBytes:v5 length:(&off_1E5E51828)[i + 3]];
      [v4 appendBytes:"" length:1];
    }
    [v4 appendBytes:"" length:1];
    size_t v8 = [v4 length];
    v9 = malloc_type_malloc(v8 + 1, 0x7326AFD7uLL);
    v10 = v9;
    if (v9)
    {
      unsigned char *v9 = v7;
      id v11 = v4;
      memcpy(v10 + 1, (const void *)[v11 bytes], v8);

      [v18 appendBytes:v10 length:v8 + 1];
      free(v10);
    }
    else
    {
    }
  }
  if (qword_1EB67B048 != -1) {
    dispatch_once(&qword_1EB67B048, &__block_literal_global_250);
  }
  [v18 appendBytes:&byte_1EB67B019 length:SWCSubstitutionVariable::getSize((SWCSubstitutionVariable *)&byte_1EB67B019)];
  id Instance = class_createInstance(*(Class *)(a1 + 32), [v18 length]);
  v13 = (void *)qword_1EB67B020;
  qword_1EB67B020 = (uint64_t)Instance;

  uint64_t v14 = qword_1EB67B020;
  id v15 = v18;
  memcpy((void *)(v14 + 8), (const void *)[v15 bytes], objc_msgSend(v15, "length"));
}

void __72___SWCSubstitutionVariableList_expensiveBuiltInSubstitutionVariableList__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD1157F0]();
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        size_t v8 = [v7 uppercaseString];
        [v2 addObject:v8];

        v9 = [v7 lowercaseString];
        [v2 addObject:v9];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v4);
  }

  v10 = [v2 array];
  [v1 setObject:v10 forKeyedSubscript:@"region"];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = [MEMORY[0x1E4F1CA20] ISOLanguageCodes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v17 = [v16 uppercaseString];
        [v11 addObject:v17];

        id v18 = [v16 lowercaseString];
        [v11 addObject:v18];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v13);
  }

  v19 = [v11 array];
  [v1 setObject:v19 forKeyedSubscript:@"lang"];

  v20 = *(void **)(a1 + 32);
  v34 = @"substitutionVariables";
  id v35 = v1;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  uint64_t v22 = [v20 substitutionVariableListWithDictionary:v21];
  v23 = (void *)qword_1EB67B030;
  qword_1EB67B030 = v22;
}

void __71___SWCSubstitutionVariableList_substitutionVariableListWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1AD1157F0]();
  if (_NSIsNSString())
  {
    v54[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];

    id v3 = (id)v4;
  }
  if (_NSIsNSString() && _NSIsNSArray())
  {
    long long v26 = v3;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if ([v3 containsObject:&stru_1F0342F60]) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    if ([v26 count])
    {
      long long v41 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
      id v6 = v26;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v52 count:16];
      char v25 = v5 | 4;
      if (v7)
      {
        uint64_t v8 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v39 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (!_NSIsNSString()
              || [v10 length] != 1
              || [v10 characterAtIndex:0] > 0x7F)
            {
              char v25 = v5;
              goto LABEL_22;
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
    else
    {
      char v25 = v5;
    }
    SWCGetFastUTF8String<1024ul>((uint64_t)v50, a2, v53);
    if (v51)
    {
      [v30 appendBytes:v50[0] length:v50[1]];
      [v30 appendBytes:"" length:1];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v26;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v35;
      int v16 = v25 & 4;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
          if (_NSIsNSString())
          {
            if ([v18 length])
            {
              SWCGetFastUTF8String<1024ul>((uint64_t)&v31, v18, v53);
              if (v33)
              {
                v20 = v31;
                uint64_t v19 = v32;
                if (std::string_view::find[abi:nn180100](v31, v32) == -1)
                {
                  [v30 appendBytes:v20 length:v19];
                  if ((v25 & 4) == 0) {
                    [v30 appendBytes:"" length:1];
                  }
                }
                else
                {
                  if (qword_1EB67B058 != -1) {
                    dispatch_once(&qword_1EB67B058, &__block_literal_global_273);
                  }
                  v21 = (id)qword_1EB67B050;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v22 = SWCGetNSStringFromStringViewNoCopy(&v31);
                    *(_DWORD *)buf = 136446978;
                    v43 = "$(";
                    __int16 v44 = 2112;
                    v45 = a2;
                    __int16 v46 = 2082;
                    v47 = &SWCSubstitutionVariable::Suffix;
                    __int16 v48 = 2112;
                    v49 = v22;
                    _os_log_impl(&dword_1ABCD7000, v21, OS_LOG_TYPE_INFO, "Substitution variable %{public}s%@%{public}s referenced another substitution variable: \"%@\". Ignoring.", buf, 0x2Au);
                  }
                }
              }
            }
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v50 count:16];
      }
      while (v14);
    }
    else
    {
      int v16 = v25 & 4;
    }

    if (v16) {
      [v30 appendBytes:"" length:1];
    }
    [v30 appendBytes:"" length:1];
    size_t v23 = [v30 length];
    size_t v11 = v23 + 1;
    v24 = malloc_type_malloc(v23 + 1, 0x31DE64E3uLL);
    v12 = v24;
    if (v24)
    {
      unsigned char *v24 = v25;
      memcpy(v24 + 1, (const void *)[v30 bytes], v23);
    }
    else
    {
      size_t v11 = 0;
    }

    id v3 = v26;
  }
  else
  {
    size_t v11 = 0;
    v12 = 0;
  }

  if (v12)
  {
    [*(id *)(a1 + 32) appendBytes:v12 length:v11];
    free(v12);
  }
}

@end