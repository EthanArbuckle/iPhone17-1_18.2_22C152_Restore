@interface PDSDaemonListener
- (BOOL)bypassClientIDCheck;
- (NSArray)clientIDs;
- (PDSDaemonListener)initWithClientIDs:(id)a3 entryStore:(id)a4 userTracker:(id)a5;
- (PDSDaemonListener)initWithEntryStore:(id)a3 userTracker:(id)a4;
- (PDSEntryStore)entryStore;
- (PDSUserTracker)userTracker;
- (void)activeUsersWithClientID:(id)a3 withCompletion:(id)a4;
- (void)batchUpdateEntries:(id)a3 forClientID:(id)a4 withCompletion:(id)a5;
- (void)entriesForClientID:(id)a3 withCompletion:(id)a4;
- (void)entriesForUser:(id)a3 clientID:(id)a4 withCompletion:(id)a5;
- (void)removeAllEntriesForUser:(id)a3 withClientID:(id)a4 withCompletion:(id)a5;
- (void)setClientIDs:(id)a3;
- (void)setEntryStore:(id)a3;
- (void)setUserTracker:(id)a3;
- (void)storeEntries:(id)a3 deleteEntries:(id)a4 withCompletion:(id)a5;
- (void)usersWithClientID:(id)a3 withCompletion:(id)a4;
@end

@implementation PDSDaemonListener

- (PDSDaemonListener)initWithEntryStore:(id)a3 userTracker:(id)a4
{
  result = [(PDSDaemonListener *)self initWithClientIDs:&unk_26D3D4470 entryStore:a3 userTracker:a4];
  if (result) {
    result->_bypassClientIDCheck = 1;
  }
  return result;
}

- (PDSDaemonListener)initWithClientIDs:(id)a3 entryStore:(id)a4 userTracker:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PDSDaemonListener.m", 35, @"Invalid parameter not satisfying: %@", @"clientIDs" object file lineNumber description];
  }
  if ([v10 count])
  {
    if (v11) {
      goto LABEL_5;
    }
LABEL_10:
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PDSDaemonListener.m", 37, @"Invalid parameter not satisfying: %@", @"entryStore" object file lineNumber description];

    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PDSDaemonListener.m", 36, @"Invalid parameter not satisfying: %@", @"clientIDs.count > 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_10;
  }
LABEL_5:
  if (v12) {
    goto LABEL_6;
  }
LABEL_11:
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PDSDaemonListener.m", 38, @"Invalid parameter not satisfying: %@", @"userTracker" object file lineNumber description];

LABEL_6:
  v20.receiver = self;
  v20.super_class = (Class)PDSDaemonListener;
  v13 = [(PDSDaemonListener *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clientIDs, a3);
    objc_storeStrong((id *)&v14->_entryStore, a4);
    objc_storeStrong((id *)&v14->_userTracker, a5);
    v14->_bypassClientIDCheck = 0;
  }

  return v14;
}

- (void)storeEntries:(id)a3 deleteEntries:(id)a4 withCompletion:(id)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    v59 = v10;
    if ([(PDSDaemonListener *)self bypassClientIDCheck]) {
      goto LABEL_4;
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v40 = v8;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v79;
LABEL_37:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v79 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v78 + 1) + 8 * v44);
        v46 = [(PDSDaemonListener *)self clientIDs];
        v47 = [v45 clientID];
        int v48 = [v46 containsObject:v47];

        if (!v48) {
          break;
        }
        if (v42 == ++v44)
        {
          uint64_t v42 = [v40 countByEnumeratingWithState:&v78 objects:v86 count:16];
          if (v42) {
            goto LABEL_37;
          }
          goto LABEL_43;
        }
      }
    }
    else
    {
LABEL_43:

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v40 = v9;
      uint64_t v49 = [v40 countByEnumeratingWithState:&v74 objects:v85 count:16];
      if (!v49)
      {
LABEL_51:

LABEL_4:
        if ([v8 count] && objc_msgSend(v9, "count"))
        {
          id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v12 = v8;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v70 objects:v84 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v71;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v71 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = [*(id *)(*((void *)&v70 + 1) + 8 * i) registration];
                [v11 addObject:v17];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v70 objects:v84 count:16];
            }
            while (v14);
          }

          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v18 = v9;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v83 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v67;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v67 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(*((void *)&v66 + 1) + 8 * j) registration];
                char v24 = [v11 containsObject:v23];

                if (v24)
                {

                  v57 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-305 userInfo:0];
                  id v10 = v59;
                  v59[2](v59, v57);

                  goto LABEL_58;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v66 objects:v83 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
        }
        id v58 = v9;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v25 = v8;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v62 objects:v82 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v63;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v63 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v62 + 1) + 8 * k);
              if (objc_msgSend(v30, "state", v58) == 1)
              {
                v31 = [(PDSDaemonListener *)self userTracker];
                v32 = [v30 user];
                id v61 = 0;
                char v33 = [v31 validUser:v32 withError:&v61];
                id v34 = v61;

                if ((v33 & 1) == 0)
                {
                  id v10 = v59;
                  v59[2](v59, v34);

                  id v9 = v58;
                  goto LABEL_58;
                }
              }
              else
              {
                id v34 = 0;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v62 objects:v82 count:16];
          }
          while (v27);
        }

        v35 = [(PDSDaemonListener *)self entryStore];
        id v60 = 0;
        id v9 = v58;
        [v35 storeEntries:v25 deleteEntries:v58 withError:&v60];
        id v36 = v60;

        if (v36)
        {
          v37 = (void *)MEMORY[0x263F087E8];
          v38 = [v36 domain];
          v39 = objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, objc_msgSend(v36, "code"), 0);
        }
        else
        {
          v39 = 0;
        }
        id v10 = v59;
        v59[2](v59, v39);

        goto LABEL_57;
      }
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v75;
LABEL_45:
      uint64_t v52 = 0;
      while (1)
      {
        if (*(void *)v75 != v51) {
          objc_enumerationMutation(v40);
        }
        v53 = *(void **)(*((void *)&v74 + 1) + 8 * v52);
        v54 = [(PDSDaemonListener *)self clientIDs];
        v55 = [v53 clientID];
        int v56 = [v54 containsObject:v55];

        if (!v56) {
          break;
        }
        if (v50 == ++v52)
        {
          uint64_t v50 = [v40 countByEnumeratingWithState:&v74 objects:v85 count:16];
          if (v50) {
            goto LABEL_45;
          }
          goto LABEL_51;
        }
      }
    }
    id v10 = v59;

    id v36 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    v10[2](v10, v36);
LABEL_57:

    goto LABEL_58;
  }
  v10[2](v10, 0);
LABEL_58:
}

- (void)batchUpdateEntries:(id)a3 forClientID:(id)a4 withCompletion:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v54 = v9;
  id v53 = a5;
  if (![(PDSDaemonListener *)self bypassClientIDCheck])
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v71;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v17 = [(PDSDaemonListener *)self clientIDs];
          id v18 = [v16 clientID];
          int v19 = [v17 containsObject:v18];

          if (!v19)
          {

            v31 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
            int v48 = v53;
            (*((void (**)(id, void *))v53 + 2))(v53, v31);
            goto LABEL_46;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v70 objects:v77 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v67;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        uint64_t v26 = [(PDSDaemonListener *)self userTracker];
        uint64_t v27 = [v25 user];
        id v65 = 0;
        char v28 = [v26 validUser:v27 withError:&v65];
        id v29 = v65;

        if ((v28 & 1) == 0)
        {
          int v48 = v53;
          (*((void (**)(id, id))v53 + 2))(v53, v29);

          v31 = v20;
          goto LABEL_46;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v30 = [(PDSDaemonListener *)self entryStore];
  v31 = [v30 entriesWithClientID:v54];

  if ([v31 count])
  {
    uint64_t v52 = v10;
    id v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v33 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v34 = v31;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v60 + 1) + 8 * k);
          if ((objc_msgSend(v20, "containsObject:", v39, v52) & 1) == 0) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v60 objects:v75 count:16];
      }
      while (v36);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v40 = v20;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v56 + 1) + 8 * m);
          if ((objc_msgSend(v34, "containsObject:", v45, v52) & 1) == 0) {
            [v32 addObject:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v74 count:16];
      }
      while (v42);
    }

    v46 = [(PDSDaemonListener *)self entryStore];
    id v55 = 0;
    [v46 storeEntries:v32 deleteEntries:v33 withError:&v55];
    id v47 = v55;

    id v10 = v52;
  }
  else
  {
    id v32 = [(PDSDaemonListener *)self entryStore];
    id v64 = 0;
    [v32 storeEntries:v20 deleteEntries:0 withError:&v64];
    id v47 = v64;
  }

  int v48 = v53;
  if (v47)
  {
    uint64_t v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = [v47 domain];
    uint64_t v51 = objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, objc_msgSend(v47, "code"), 0);
  }
  else
  {
    uint64_t v51 = 0;
  }
  (*((void (**)(id, void *))v53 + 2))(v53, v51);

LABEL_46:
}

- (void)removeAllEntriesForUser:(id)a3 withClientID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(PDSDaemonListener *)self bypassClientIDCheck]
    || ([(PDSDaemonListener *)self clientIDs],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 containsObject:v9],
        v11,
        (v12 & 1) != 0))
  {
    uint64_t v13 = [(PDSDaemonListener *)self entryStore];
    id v18 = 0;
    [v13 updateEntryState:2 forUser:v8 clientID:v9 withError:&v18];
    id v14 = v18;

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      v16 = [v14 domain];
      v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend(v14, "code"), 0);
    }
    else
    {
      v17 = 0;
    }
    v10[2](v10, v17);
  }
  else
  {
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    v10[2](v10, v14);
  }
}

- (void)activeUsersWithClientID:(id)a3 withCompletion:(id)a4
{
  id v14 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if ([(PDSDaemonListener *)self bypassClientIDCheck]
    || ([(PDSDaemonListener *)self clientIDs],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:v14],
        v7,
        (v8 & 1) != 0))
  {
    int v9 = [v14 isEqualToString:*MEMORY[0x263F5BA20]];
    id v10 = [(PDSDaemonListener *)self entryStore];
    id v11 = v10;
    if (v9) {
      [v10 activeUsers];
    }
    else {
    char v12 = [v10 activeUsersWithClientID:v14];
    }

    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = (void *)MEMORY[0x263EFFA68];
    }
    v6[2](v6, v13, 0);
  }
  else
  {
    char v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }
}

- (void)usersWithClientID:(id)a3 withCompletion:(id)a4
{
  id v14 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if ([(PDSDaemonListener *)self bypassClientIDCheck]
    || ([(PDSDaemonListener *)self clientIDs],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:v14],
        v7,
        (v8 & 1) != 0))
  {
    int v9 = [v14 isEqualToString:*MEMORY[0x263F5BA20]];
    id v10 = [(PDSDaemonListener *)self entryStore];
    id v11 = v10;
    if (v9) {
      [v10 users];
    }
    else {
    char v12 = [v10 usersWithClientID:v14];
    }

    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = (void *)MEMORY[0x263EFFA68];
    }
    v6[2](v6, v13, 0);
  }
  else
  {
    char v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }
}

- (void)entriesForUser:(id)a3 clientID:(id)a4 withCompletion:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void *, void))a5;
  if ([(PDSDaemonListener *)self bypassClientIDCheck]
    || ([(PDSDaemonListener *)self clientIDs],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 containsObject:v8],
        v10,
        (v11 & 1) != 0))
  {
    int v12 = [v8 isEqualToString:*MEMORY[0x263F5BA20]];
    uint64_t v13 = [(PDSDaemonListener *)self entryStore];
    id v14 = v13;
    if (v12) {
      [v13 entriesForUser:v16];
    }
    else {
    uint64_t v15 = [v13 entriesForUser:v16 withClientID:v8];
    }

    v9[2](v9, v15, 0);
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v15);
  }
}

- (void)entriesForClientID:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if ([(PDSDaemonListener *)self bypassClientIDCheck]
    || ([(PDSDaemonListener *)self clientIDs],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:v13],
        v7,
        (v8 & 1) != 0))
  {
    int v9 = [v13 isEqualToString:*MEMORY[0x263F5BA20]];
    id v10 = [(PDSDaemonListener *)self entryStore];
    char v11 = v10;
    if (v9) {
      [v10 entries];
    }
    else {
    int v12 = [v10 entriesWithClientID:v13];
    }

    v6[2](v6, v12, 0);
  }
  else
  {
    int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-303 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v12);
  }
}

- (BOOL)bypassClientIDCheck
{
  return self->_bypassClientIDCheck;
}

- (NSArray)clientIDs
{
  return self->_clientIDs;
}

- (void)setClientIDs:(id)a3
{
}

- (PDSEntryStore)entryStore
{
  return self->_entryStore;
}

- (void)setEntryStore:(id)a3
{
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_storeStrong((id *)&self->_entryStore, 0);
  objc_storeStrong((id *)&self->_clientIDs, 0);
}

@end