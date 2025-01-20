@interface CNContactStore(TUHandle)
- (id)tu_contactsByHandleForHandles:()TUHandle keyDescriptors:error:;
@end

@implementation CNContactStore(TUHandle)

- (id)tu_contactsByHandleForHandles:()TUHandle keyDescriptors:error:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v6;
  uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        v10 = objc_msgSend(MEMORY[0x1E4F1B8F8], "tu_contactHandlesForHandle:", v9);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v52 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8 * j);
              v16 = [v7 objectForKeyedSubscript:v15];
              if (v16)
              {
                v17 = v16;
                [v16 addObject:v9];
              }
              else
              {
                v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
                [v7 setObject:v17 forKeyedSubscript:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v12);
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v41);
  }

  v18 = [v7 allKeys];
  v19 = objc_msgSend(a1, "tu_contactsByContactHandleForContactHandles:keyDescriptors:error:", v18, v33, a5);

  if (v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v35 = [v19 allKeys];
    uint64_t v40 = [v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v40)
    {
      uint64_t v38 = *(void *)v48;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v42 = v21;
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * v21);
          v23 = [v7 objectForKeyedSubscript:v22];
          v24 = v23;
          if (v23)
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v44;
              do
              {
                for (uint64_t k = 0; k != v26; ++k)
                {
                  if (*(void *)v44 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * k);
                  v30 = [v19 objectForKeyedSubscript:v22];
                  [v20 setObject:v30 forKeyedSubscript:v29];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
              }
              while (v26);
            }
          }

          uint64_t v21 = v42 + 1;
        }
        while (v42 + 1 != v40);
        uint64_t v40 = [v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v40);
    }
  }
  else
  {
    id v20 = 0;
  }
  v31 = (void *)[v20 copy];

  return v31;
}

@end