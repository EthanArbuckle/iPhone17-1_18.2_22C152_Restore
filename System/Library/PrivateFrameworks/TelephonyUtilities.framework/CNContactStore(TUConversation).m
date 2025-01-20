@interface CNContactStore(TUConversation)
- (id)tu_contactsByConversationMemberForConversationMembers:()TUConversation keyDescriptors:error:;
- (id)tu_contactsByRemoteConversationMemberForConversations:()TUConversation keyDescriptors:error:;
@end

@implementation CNContactStore(TUConversation)

- (id)tu_contactsByConversationMemberForConversationMembers:()TUConversation keyDescriptors:error:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v6;
  uint64_t v44 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F1B8F8];
        v11 = [v9 handle];
        v12 = objc_msgSend(v10, "tu_contactHandlesForHandle:", v11);

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v55 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * j);
              v19 = [v7 objectForKeyedSubscript:v18];
              if (v19)
              {
                v20 = v19;
                [v19 addObject:v9];
              }
              else
              {
                v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
                [v7 setObject:v20 forKeyedSubscript:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v15);
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v44);
  }

  v21 = [v7 allKeys];
  v22 = objc_msgSend(a1, "tu_contactsByContactHandleForContactHandles:keyDescriptors:error:", v21, v36, a5);

  if (v22)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v38 = [v22 allKeys];
    uint64_t v43 = [v38 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v43)
    {
      uint64_t v41 = *(void *)v51;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v51 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v45 = v24;
          uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * v24);
          v26 = [v7 objectForKeyedSubscript:v25];
          v27 = v26;
          if (v26)
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v62 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v47;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v47 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8 * k);
                  v33 = [v22 objectForKeyedSubscript:v25];
                  [v23 setObject:v33 forKeyedSubscript:v32];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v62 count:16];
              }
              while (v29);
            }
          }

          uint64_t v24 = v45 + 1;
        }
        while (v45 + 1 != v43);
        uint64_t v43 = [v38 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v43);
    }
  }
  else
  {
    id v23 = 0;
  }
  v34 = (void *)[v23 copy];

  return v34;
}

- (id)tu_contactsByRemoteConversationMemberForConversations:()TUConversation keyDescriptors:error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "remoteMembers", (void)v21);
        v17 = [v16 allObjects];
        [v10 addObjectsFromArray:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [v10 allObjects];
  v19 = objc_msgSend(a1, "tu_contactsByConversationMemberForConversationMembers:keyDescriptors:error:", v18, v9, a5);

  return v19;
}

@end