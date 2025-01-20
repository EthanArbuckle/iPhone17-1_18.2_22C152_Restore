@interface NNMKSyncPersistenceHandler
- (NNMKBatchRequestHandler)batchRequestHandler;
- (NNMKDeviceRegistryHolder)delegate;
- (NNMKSyncController)syncController;
- (NNMKSyncSessionController)sessionController;
- (NNMKSyncStateManager)syncStateManager;
- (id)addAccountAuthenticationStatusRequest:(double)a3;
- (id)addMessageContent:(id)a3 forMessage:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6;
- (id)addMessages:(id)a3 containsNewMessages:(BOOL)a4 mailbox:(id)a5;
- (id)addMessagesToResend:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5;
- (id)addMoreConversationSpecificMessages:(id)a3 conversationId:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6;
- (id)addMoreMessages:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5;
- (id)addStandaloneAccountIdentity:(id)a3;
- (id)currentDeviceRegistry;
- (id)deleteMessagesWithIds:(id)a3 mailbox:(id)a4;
- (id)persistAccounts:(id)a3;
- (id)protoMessageFromMessage:(id)a3;
- (id)updateMailboxListForAccount:(id)a3 mailboxListChanged:(BOOL *)a4;
- (id)updateMessagesFromConversation:(id)a3 withState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6;
- (id)updateMessagesStatus:(id)a3 mailbox:(id)a4;
- (void)_createDefaultMailbox:(id)a3;
- (void)setBatchRequestHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionController:(id)a3;
- (void)setSyncController:(id)a3;
- (void)setSyncStateManager:(id)a3;
@end

@implementation NNMKSyncPersistenceHandler

- (id)persistAccounts:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(NNMKProtoInitialAccountsSync);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v6 = v4;
  uint64_t v63 = [v6 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (v63)
  {
    uint64_t v60 = *(void *)v78;
    v7 = &__logCategories;
    v8 = &dword_23D3DF000;
    v61 = v6;
    v62 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(v6);
        }
        uint64_t v65 = v9;
        v10 = *(void **)(*((void *)&v77 + 1) + 8 * v9);
        v11 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
        v12 = [v10 accountId];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setAccountId:v12];

        v13 = [v10 displayName];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setDisplayName:v13];

        -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v11, "setShouldArchive:", [v10 shouldArchive]);
        v14 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v11, "setFullSyncVersion:", [v14 fullSyncVersion]);

        v15 = [v10 username];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setUsername:v15];

        v16 = [v10 localId];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setLocalId:v16];

        v17 = [v10 parentAccountIdentifier];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setParentId:v17];

        v18 = [v10 defaultEmailAddress];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setDefaultEmail:v18];

        v19 = [v10 typeIdentifier];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setTypeIdentifier:v19];

        v20 = [v10 emailAddressToken];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setEmailAddressToken:v20];

        v21 = [v10 pccEmailAddress];
        [(NNMKProtoAccountAdditionOrUpdate *)v11 setPccEmailAddress:v21];

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v22 = [v10 emailAddresses];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v73 objects:v90 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v74 != v25) {
                objc_enumerationMutation(v22);
              }
              -[NNMKProtoAccountAdditionOrUpdate addEmail:](v11, "addEmail:", *(void *)(*((void *)&v73 + 1) + 8 * i), v60);
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v73 objects:v90 count:16];
          }
          while (v24);
        }

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v64 = v10;
        v27 = [v10 mailboxes];
        uint64_t v68 = [v27 countByEnumeratingWithState:&v69 objects:v89 count:16];
        if (v68)
        {
          uint64_t v28 = *(void *)v70;
          v67 = v11;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v70 != v28) {
                objc_enumerationMutation(v27);
              }
              id v30 = *(id *)(*((void *)&v69 + 1) + 8 * j);
              v31 = [(NNMKSyncPersistenceHandler *)self syncController];
              char v32 = [v31 canSyncMailbox:v30];

              v33 = v7[1];
              BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
              if (v32)
              {
                if (v34)
                {
                  log = v33;
                  v35 = [v30 mailboxId];
                  uint64_t v36 = [v30 type];
                  uint64_t v37 = v28;
                  v38 = v27;
                  v39 = self;
                  v40 = v8;
                  v41 = v7;
                  uint64_t v42 = [v30 filterType];
                  unsigned int v43 = [v30 syncEnabled];
                  *(_DWORD *)buf = 138544130;
                  v82 = v35;
                  __int16 v83 = 2048;
                  uint64_t v84 = v36;
                  __int16 v85 = 2048;
                  uint64_t v86 = v42;
                  v7 = v41;
                  v8 = v40;
                  self = v39;
                  v27 = v38;
                  uint64_t v28 = v37;
                  __int16 v87 = 2048;
                  uint64_t v88 = v43;
                  _os_log_impl(v8, log, OS_LOG_TYPE_DEFAULT, "Mailbox received. (Mailbox id: %{public}@, Type: %lu, Filter: %lu, Sync enabled: %lu)", buf, 0x2Au);
                }
                v44 = [(NNMKSyncPersistenceHandler *)self delegate];
                char v45 = [v44 pairedDeviceSupportsMultipleMailboxes];

                if ((v45 & 1) == 0)
                {
                  v46 = (void *)[v30 copy];

                  [v46 setSyncActive:0];
                  [v46 setSyncEnabled:0];
                  id v30 = v46;
                }
                v47 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
                [v47 addOrUpdateMailbox:v30];

                v48 = +[NNMKProtoMailbox protoMailboxFromMailbox:v30];
                v11 = v67;
                [(NNMKProtoAccountAdditionOrUpdate *)v67 addMailboxes:v48];
              }
              else
              {
                if (!v34) {
                  goto LABEL_27;
                }
                v48 = v33;
                v49 = [v30 mailboxId];
                uint64_t v50 = [v30 type];
                *(_DWORD *)buf = 138543618;
                v82 = v49;
                __int16 v83 = 2048;
                uint64_t v84 = v50;
                _os_log_impl(v8, v48, OS_LOG_TYPE_DEFAULT, "Mailbox will not be synced. (Id: %{public}@, Type: %lu)", buf, 0x16u);
              }
LABEL_27:
            }
            uint64_t v68 = [v27 countByEnumeratingWithState:&v69 objects:v89 count:16];
          }
          while (v68);
        }

        v5 = v62;
        [(NNMKProtoInitialAccountsSync *)v62 addInitialAccount:v11];
        v51 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        v52 = [[NNMKSyncedAccount alloc] initWithAccount:v64];
        [v51 addOrUpdateSyncedAccount:v52];

        uint64_t v9 = v65 + 1;
        id v6 = v61;
      }
      while (v65 + 1 != v63);
      uint64_t v63 = [v61 countByEnumeratingWithState:&v77 objects:v91 count:16];
    }
    while (v63);
  }

  v53 = [(NNMKSyncPersistenceHandler *)self delegate];
  char v54 = [v53 pairedDeviceSupportsMultipleMailboxes];

  if ((v54 & 1) == 0) {
    [(NNMKSyncPersistenceHandler *)self _createDefaultMailbox:v6];
  }
  v55 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  -[NNMKProtoInitialAccountsSync setFullSyncVersion:](v5, "setFullSyncVersion:", [v55 fullSyncVersion]);

  v56 = (void *)MEMORY[0x263F08910];
  v57 = [MEMORY[0x263EFF910] date];
  v58 = [v56 archivedDataWithRootObject:v57 requiringSecureCoding:1 error:0];
  [(NNMKProtoInitialAccountsSync *)v5 setDateSynced:v58];

  return v5;
}

- (void)_createDefaultMailbox:(id)a3
{
  id v4 = a3;
  v5 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Creating default mailbox because device does not support multiple mailboxes", v17, 2u);
  }
  id v6 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  v7 = [v6 mailboxWithId:@"-1"];

  if (!v7)
  {
    v7 = objc_alloc_init(NNMKMailbox);
    [(NNMKMailbox *)v7 setMailboxId:@"-1"];
  }
  v8 = [[NNMKMailboxSelection alloc] initWithAccounts:v4];
  uint64_t v9 = [(NNMKMailboxSelection *)v8 mailboxesWithAllMessagesSyncEnabled];
  uint64_t v10 = [v9 count];

  if (v10 == 1)
  {
    v11 = [(NNMKMailboxSelection *)v8 mailboxesWithAllMessagesSyncEnabled];
    v12 = [v11 firstObject];

    -[NNMKMailbox setType:](v7, "setType:", [v12 type]);
    -[NNMKMailbox setFilterType:](v7, "setFilterType:", [v12 filterType]);
    v13 = [v12 accountId];
    [(NNMKMailbox *)v7 setAccountId:v13];

    v14 = [v12 url];
    [(NNMKMailbox *)v7 setUrl:v14];

    v15 = [v12 customName];
    [(NNMKMailbox *)v7 setCustomName:v15];
  }
  else
  {
    [(NNMKMailbox *)v7 setFilterType:[(NNMKMailboxSelection *)v8 aggregatedMailboxesFilterTypes]];
    [(NNMKMailbox *)v7 setType:1];
    [(NNMKMailbox *)v7 resetURL];
  }
  [(NNMKMailbox *)v7 setSyncEnabled:1];
  v16 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v16 addOrUpdateMailbox:v7];
}

- (id)updateMailboxListForAccount:(id)a3 mailboxListChanged:(BOOL *)a4
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(NNMKSyncPersistenceHandler *)self delegate];
  char v8 = [v7 pairedDeviceSupportsMultipleMailboxes];

  if (v8)
  {
    long long v79 = a4;
    __int16 v85 = self;
    uint64_t v9 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
    long long v80 = v6;
    uint64_t v10 = [v6 accountId];
    v11 = [v9 mailboxesForAccountId:v10];

    v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    obuint64_t j = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v98 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          v18 = [v17 mailboxId];
          [v12 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
      }
      while (v14);
    }

    v19 = (void *)MEMORY[0x263EFF980];
    v20 = [v80 mailboxes];
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    __int16 v87 = [v80 mailboxes];
    uint64_t v21 = [v87 countByEnumeratingWithState:&v93 objects:v110 count:16];
    v82 = v12;
    if (v21)
    {
      uint64_t v22 = v21;
      char v84 = 0;
      uint64_t v23 = *(void *)v94;
      uint64_t v24 = v85;
      uint64_t v81 = *(void *)v94;
      do
      {
        uint64_t v25 = 0;
        uint64_t v83 = v22;
        do
        {
          if (*(void *)v94 != v23) {
            objc_enumerationMutation(v87);
          }
          v26 = *(void **)(*((void *)&v93 + 1) + 8 * v25);
          v27 = [(NNMKSyncPersistenceHandler *)v24 syncController];
          char v28 = [v27 canSyncMailbox:v26];

          if (v28)
          {
            v29 = [v26 mailboxId];
            id v30 = [v12 objectForKeyedSubscript:v29];

            v31 = [v26 mailboxId];
            [v12 removeObjectForKey:v31];

            if (v30)
            {
              char v32 = [v30 customName];
              v33 = [v26 customName];
              int v34 = [v32 isEqualToString:v33];

              int v35 = [v30 syncEnabled];
              unsigned int v36 = [v26 syncEnabled];
              uint64_t v37 = [v26 url];
              if (v37)
              {
                v38 = [v26 url];
                v39 = [v30 url];
                unsigned int v40 = [v38 isEqual:v39] ^ 1;
              }
              else
              {
                v38 = [v30 url];
                unsigned int v40 = v38 != 0;
              }
              uint64_t v50 = v34 ^ 1u;
              v51 = (void *)(v35 ^ v36);

              if (((v50 | v51) & 1) != 0 || v40)
              {
                v52 = (void *)qword_26AC21850;
                if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
                {
                  v53 = v52;
                  char v54 = [v26 mailboxId];
                  *(_DWORD *)buf = 138544130;
                  v103 = v54;
                  __int16 v104 = 2048;
                  uint64_t v105 = v50;
                  __int16 v106 = 2048;
                  v107 = v51;
                  __int16 v108 = 2048;
                  uint64_t v109 = v40;
                  _os_log_impl(&dword_23D3DF000, v53, OS_LOG_TYPE_DEFAULT, "Mailbox updated. (Id: %{public}@, customNameChanged: %lu, syncEnabledChanged: %lu, urlChanged: %lu)", buf, 0x2Au);
                }
                if (v40)
                {
                  v55 = (void *)qword_26AC21850;
                  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
                  {
                    v56 = v55;
                    v57 = [v26 mailboxId];
                    v58 = [v30 url];
                    v59 = [v58 absoluteString];
                    uint64_t v60 = [v26 url];
                    v61 = [v60 absoluteString];
                    *(_DWORD *)buf = 138543874;
                    v103 = v57;
                    __int16 v104 = 2114;
                    uint64_t v105 = (uint64_t)v59;
                    __int16 v106 = 2114;
                    v107 = v61;
                    _os_log_impl(&dword_23D3DF000, v56, OS_LOG_TYPE_DEFAULT, "Mailbox URL changed. (Id: %{public}@, old URL: %{public}@, new URL: %{public}@)", buf, 0x20u);
                  }
                }
                v62 = [v26 customName];
                [v30 setCustomName:v62];

                objc_msgSend(v30, "setSyncEnabled:", objc_msgSend(v26, "syncEnabled"));
                uint64_t v63 = [v26 url];
                [v30 setUrl:v63];

                v64 = [(NNMKSyncPersistenceHandler *)v85 currentDeviceRegistry];
                [v64 addOrUpdateMailbox:v30];

                char v84 = 1;
              }
              uint64_t v65 = +[NNMKProtoMailbox protoMailboxFromMailbox:v30];
              [v86 addObject:v65];

              uint64_t v24 = v85;
              uint64_t v23 = v81;
              v12 = v82;
              uint64_t v22 = v83;
            }
            else
            {
              char v45 = [(NNMKSyncPersistenceHandler *)v24 currentDeviceRegistry];
              [v45 addOrUpdateMailbox:v26];

              v46 = +[NNMKProtoMailbox protoMailboxFromMailbox:v26];
              [v86 addObject:v46];

              v47 = (void *)qword_26AC21850;
              if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
              {
                v48 = v47;
                v49 = [v26 mailboxId];
                *(_DWORD *)buf = 138543362;
                v103 = v49;
                _os_log_impl(&dword_23D3DF000, v48, OS_LOG_TYPE_DEFAULT, "Mailbox added. (Id: %{public}@)", buf, 0xCu);
              }
              char v84 = 1;
            }
          }
          else
          {
            v41 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v42 = v41;
              unsigned int v43 = [v26 mailboxId];
              uint64_t v44 = [v26 type];
              *(_DWORD *)buf = 138543618;
              v103 = v43;
              __int16 v104 = 2048;
              uint64_t v105 = v44;
              _os_log_impl(&dword_23D3DF000, v42, OS_LOG_TYPE_DEFAULT, "Mailbox will not be synced. (Id: %{public}@, Type: %lu)", buf, 0x16u);
            }
          }
          ++v25;
        }
        while (v22 != v25);
        uint64_t v22 = [v87 countByEnumeratingWithState:&v93 objects:v110 count:16];
      }
      while (v22);
    }
    else
    {
      char v84 = 0;
      uint64_t v24 = v85;
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v66 = [v12 allValues];
    uint64_t v67 = [v66 countByEnumeratingWithState:&v89 objects:v101 count:16];
    char v68 = v84;
    if (v67)
    {
      uint64_t v69 = v67;
      uint64_t v70 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v90 != v70) {
            objc_enumerationMutation(v66);
          }
          long long v72 = *(void **)(*((void *)&v89 + 1) + 8 * j);
          long long v73 = [(NNMKSyncPersistenceHandler *)v24 currentDeviceRegistry];
          long long v74 = [v72 mailboxId];
          [v73 deleteMailboxWithId:v74];

          long long v75 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            long long v76 = v75;
            long long v77 = [v72 mailboxId];
            *(_DWORD *)buf = 138543362;
            v103 = v77;
            _os_log_impl(&dword_23D3DF000, v76, OS_LOG_TYPE_DEFAULT, "Mailbox deleted. (Id: %{public}@)", buf, 0xCu);
          }
        }
        uint64_t v69 = [v66 countByEnumeratingWithState:&v89 objects:v101 count:16];
      }
      while (v69);
      char v68 = 1;
      v12 = v82;
    }

    id v6 = v80;
    if (v79) {
      *long long v79 = v68 & 1;
    }
  }
  else
  {
    id v86 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v86;
}

- (id)addStandaloneAccountIdentity:(id)a3
{
  id v4 = a3;
  v5 = [v4 username];
  if (![v5 length]) {
    goto LABEL_9;
  }
  id v6 = [v4 token];
  if (![v6 length])
  {

LABEL_9:
    goto LABEL_10;
  }
  v7 = [v4 refreshToken];

  if (v7)
  {
    char v8 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
    uint64_t v9 = [v4 username];
    uint64_t v10 = [v8 accountIdForUsername:v9];

    if (!v10)
    {
      v11 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
      v12 = [v4 username];
      uint64_t v13 = [v11 syncedAccountForAccountWithId:v12];

      uint64_t v10 = [v13 accountId];
    }
    if ([v10 length])
    {
      uint64_t v14 = [(NNMKSyncPersistenceHandler *)self sessionController];
      [v14 updateStandaloneState:1 forAccountId:v10];

      uint64_t v15 = objc_alloc_init(NNMKProtoStandaloneAccountIdentity);
      v16 = [v4 username];
      [(NNMKProtoStandaloneAccountIdentity *)v15 setUsername:v16];

      v17 = [v4 displayName];
      [(NNMKProtoStandaloneAccountIdentity *)v15 setDisplayName:v17];

      v18 = [v4 token];
      [(NNMKProtoStandaloneAccountIdentity *)v15 setToken:v18];

      v19 = [v4 refreshToken];
      [(NNMKProtoStandaloneAccountIdentity *)v15 setRefreshToken:v19];

      -[NNMKProtoStandaloneAccountIdentity setIdentityType:](v15, "setIdentityType:", [v4 identityType]);
      v20 = [v4 accountId];
      [(NNMKProtoStandaloneAccountIdentity *)v15 setAccountIdentifier:v20];
    }
    else
    {
      uint64_t v22 = (void *)qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
        -[NNMKSyncPersistenceHandler addStandaloneAccountIdentity:](v22, v4);
      }
      uint64_t v15 = 0;
    }

    goto LABEL_17;
  }
LABEL_10:
  uint64_t v21 = qword_26AC21860;
  if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
    -[NNMKSyncPersistenceHandler addStandaloneAccountIdentity:](v21);
  }
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

- (id)addAccountAuthenticationStatusRequest:(double)a3
{
  id v4 = objc_alloc_init(NNMKProtoAccountAuthenticationStatusRequest);
  [(NNMKProtoAccountAuthenticationStatusRequest *)v4 setRequestTime:a3];
  return v4;
}

- (id)addMessages:(id)a3 containsNewMessages:(BOOL)a4 mailbox:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  v11 = [(NNMKSyncPersistenceHandler *)self syncController];
  v12 = [v11 filterMessages:v8 byAlreadySynced:1 byMailbox:v9];

  uint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_6];

  if ([v13 count])
  {
    long long v97 = v8;
    uint64_t v14 = [v13 firstObject];
    uint64_t v15 = v14;
    unsigned int v102 = v6;
    if (!v6) {
      goto LABEL_4;
    }
    v16 = [v14 dateReceived];
    v17 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
    [v9 mailboxId];
    v19 = v18 = v15;
    [v17 oldestDateReceivedForMailboxId:v19];
    uint64_t v21 = v20 = v9;
    uint64_t v22 = [v16 compare:v21];

    id v9 = v20;
    uint64_t v6 = v102;

    uint64_t v15 = v18;
    if (v22 == -1)
    {
      long long v89 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        long long v90 = v89;
        uint64_t v91 = [v97 count];
        long long v92 = [v18 dateReceived];
        *(_DWORD *)buf = 134218242;
        uint64_t v111 = v91;
        __int16 v112 = 2114;
        v113 = v92;
        _os_log_impl(&dword_23D3DF000, v90, OS_LOG_TYPE_DEFAULT, "Dropping messages. Receiving an old batch of messages from MobileMail. Ignoring so we don't create a gap between the current messages we have and the old batch. (Count: %lu, Newest message received date: %{public}@", buf, 0x16u);

        uint64_t v15 = v18;
      }
      [v10 setReceivedOldMessages:1];
      id v8 = v97;
    }
    else
    {
LABEL_4:
      uint64_t v23 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
      [v23 beginUpdates];

      long long v99 = objc_alloc_init(NNMKProtoMessageAdditions);
      v101 = objc_alloc_init(NNMKProtoMessageAdditions);
      uint64_t v24 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
      uint64_t v25 = [v9 mailboxId];
      v26 = [v24 oldestDateReceivedForMailboxId:v25];

      if (!v26)
      {
        uint64_t v27 = [v13 count];
        if ((unint64_t)(v27 - 1) >= 0x13) {
          uint64_t v28 = 19;
        }
        else {
          uint64_t v28 = v27 - 1;
        }
        v29 = [v13 objectAtIndexedSubscript:v28];
        v26 = [v29 dateReceived];
        id v30 = [MEMORY[0x263F08910] archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
        [(NNMKProtoMessageAdditions *)v99 setDateForRequestingMoreMessages:v30];

        v31 = [MEMORY[0x263F08910] archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
        [(NNMKProtoMessageAdditions *)v101 setDateForRequestingMoreMessages:v31];

        char v32 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          [v29 dateReceived];
          v35 = int v34 = v15;
          *(_DWORD *)buf = 138543362;
          uint64_t v111 = (uint64_t)v35;
          _os_log_impl(&dword_23D3DF000, v33, OS_LOG_TYPE_DEFAULT, "New received messages changed date cap (New date: %{public}@).", buf, 0xCu);

          uint64_t v15 = v34;
        }
      }
      unint64_t v36 = [v13 count];
      uint64_t v37 = [(NNMKSyncPersistenceHandler *)self syncController];
      v38 = [v37 filterMessages:v13 receivedBeforeDate:v26];

      if ([v38 count] < v36) {
        [v10 setReceivedOldMessages:1];
      }
      uint64_t v39 = [v38 count];
      unsigned int v40 = v101;
      v41 = v38;
      id v8 = v97;
      if (v39)
      {
        long long v94 = v15;
        long long v95 = v9;
        long long v96 = v10;
        long long v98 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v41, "count"));
        long long v100 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v41, "count"));
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v93 = v41;
        obuint64_t j = v41;
        uint64_t v105 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
        if (!v105) {
          goto LABEL_35;
        }
        uint64_t v104 = *(void *)v107;
        while (1)
        {
          for (uint64_t i = 0; i != v105; ++i)
          {
            if (*(void *)v107 != v104) {
              objc_enumerationMutation(obj);
            }
            unsigned int v43 = v26;
            uint64_t v44 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            char v45 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              v47 = [v44 messageId];
              v48 = [v44 accountId];
              v49 = [v44 dateReceived];
              uint64_t v50 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v44 status]);
              v51 = [v44 messageIdHeader];
              *(_DWORD *)buf = 138544386;
              uint64_t v111 = (uint64_t)v47;
              __int16 v112 = 2114;
              v113 = v48;
              __int16 v114 = 2114;
              v115 = v49;
              __int16 v116 = 2112;
              v117 = v50;
              __int16 v118 = 2114;
              v119 = v51;
              _os_log_impl(&dword_23D3DF000, v46, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: New)", buf, 0x34u);

              uint64_t v6 = v102;
            }
            v52 = [NNMKSyncedMessage alloc];
            v53 = [(NNMKSyncPersistenceHandler *)self delegate];
            char v54 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v52, "initWithMessage:useDefaultMailbox:", v44, [v53 pairedDeviceSupportsMultipleMailboxes] ^ 1);

            [(NNMKSyncedMessage *)v54 setUsedProtectedChannelForMessageSync:0];
            v55 = [(NNMKSyncPersistenceHandler *)self sessionController];
            if ([v55 deviceInStandalone])
            {
              v56 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
              v57 = [v44 accountId];
              BOOL v58 = [v56 accountSourceTypeForAccountId:v57] == 0;
            }
            else
            {
              BOOL v58 = 1;
            }

            if (v6)
            {
              v59 = [(NNMKSyncPersistenceHandler *)self syncStateManager];
              int v60 = [v59 willPresentNotificationForMessage:v44];

              if (v60)
              {
                v61 = [(NNMKSyncPersistenceHandler *)self protoMessageFromMessage:v44];
                [(NNMKProtoMessageAdditions *)v99 addMessageAddition:v61];

                v62 = [v44 messageId];
                [v98 addObject:v62];
                uint64_t v63 = 1;
LABEL_29:

                [(NNMKSyncedMessage *)v54 setUsedNotificationPriorityForMessageSync:v63];
                uint64_t v65 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
                [v65 addOrUpdateSyncedMessage:v54];

                v66 = [(NNMKSyncPersistenceHandler *)self sessionController];
                uint64_t v67 = [v66 messageIdsToIgnoreStatusUpdates];
                char v68 = [v44 messageId];
                [v67 removeObject:v68];

                uint64_t v69 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
                [v69 handleMessageAdded:v44];
                goto LABEL_32;
              }
            }
            if (v58)
            {
              v64 = [(NNMKSyncPersistenceHandler *)self protoMessageFromMessage:v44];
              [(NNMKProtoMessageAdditions *)v101 addMessageAddition:v64];

              v62 = [v44 messageId];
              [v100 addObject:v62];
              uint64_t v63 = 0;
              goto LABEL_29;
            }
            uint64_t v70 = (void *)qword_26AC21850;
            if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_33;
            }
            uint64_t v69 = v70;
            long long v71 = [v44 accountId];
            long long v72 = [v44 messageId];
            *(_DWORD *)buf = 138543618;
            uint64_t v111 = (uint64_t)v71;
            __int16 v112 = 2114;
            v113 = v72;
            _os_log_impl(&dword_23D3DF000, v69, OS_LOG_TYPE_DEFAULT, "Dropping message added because account source type does not allow sync. Account Id: %{public}@, Message Id: %{public}@", buf, 0x16u);

LABEL_32:
LABEL_33:

            v26 = v43;
          }
          uint64_t v105 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
          if (!v105)
          {
LABEL_35:

            id v9 = v95;
            if ([(NNMKProtoMessageAdditions *)v99 messageAdditionsCount])
            {
              long long v73 = [v95 mailboxId];
              [(NNMKProtoMessageAdditions *)v99 setMailboxId:v73];

              long long v74 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
              long long v75 = [v95 mailboxId];
              -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v99, "setMailboxSyncVersion:", [v74 syncVersionForMailboxId:v75]);

              [(NNMKProtoMessageAdditions *)v99 setMessagesAreNew:v6];
              long long v76 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
              -[NNMKProtoMessageAdditions setFullSyncVersion:](v99, "setFullSyncVersion:", [v76 fullSyncVersion]);

              long long v77 = (void *)MEMORY[0x263F08910];
              long long v78 = [MEMORY[0x263EFF910] date];
              long long v79 = [v77 archivedDataWithRootObject:v78 requiringSecureCoding:1 error:0];
              [(NNMKProtoMessageAdditions *)v99 setDateSynced:v79];
            }
            unsigned int v40 = v101;
            uint64_t v10 = v96;
            id v8 = v97;
            uint64_t v15 = v94;
            if ([(NNMKProtoMessageAdditions *)v101 messageAdditionsCount])
            {
              long long v80 = [v95 mailboxId];
              [(NNMKProtoMessageAdditions *)v101 setMailboxId:v80];

              uint64_t v81 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
              v82 = [v95 mailboxId];
              -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v101, "setMailboxSyncVersion:", [v81 syncVersionForMailboxId:v82]);

              [(NNMKProtoMessageAdditions *)v101 setMessagesAreNew:v6];
              uint64_t v83 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
              -[NNMKProtoMessageAdditions setFullSyncVersion:](v101, "setFullSyncVersion:", [v83 fullSyncVersion]);

              char v84 = (void *)MEMORY[0x263F08910];
              __int16 v85 = [MEMORY[0x263EFF910] date];
              id v86 = [v84 archivedDataWithRootObject:v85 requiringSecureCoding:1 error:0];
              [(NNMKProtoMessageAdditions *)v101 setDateSynced:v86];

              unsigned int v40 = v101;
            }
            [v96 setMessageIdsWithNotificationPriority:v98];
            [v96 setMessageIdsWithDefaultPriority:v100];
            [v96 setProtoMessagesWithNotificationPriority:v99];
            [v96 setProtoMessagesWithDefaultPriority:v40];

            v41 = v93;
            break;
          }
        }
      }
      __int16 v87 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
      [v87 endUpdates];

      uint64_t v13 = v41;
    }
  }
  return v10;
}

uint64_t __70__NNMKSyncPersistenceHandler_addMessages_containsNewMessages_mailbox___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 dateReceived];
  uint64_t v6 = [v4 dateReceived];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)addMoreMessages:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v10 beginUpdates];

  v11 = objc_alloc_init(NNMKProtoMoreMessages);
  v12 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  -[NNMKProtoMoreMessages setFullSyncVersion:](v11, "setFullSyncVersion:", [v12 fullSyncVersion]);

  uint64_t v13 = (void *)MEMORY[0x263F08910];
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
  [(NNMKProtoMoreMessages *)v11 setDateSynced:v15];

  v16 = [v9 mailboxId];
  [(NNMKProtoMoreMessages *)v11 setMailboxId:v16];

  v17 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  char v45 = v9;
  v18 = [v9 mailboxId];
  -[NNMKProtoMoreMessages setMailboxSyncVersion:](v11, "setMailboxSyncVersion:", [v17 syncVersionForMailboxId:v18]);

  if ([v8 count])
  {
    v19 = [v8 lastObject];
    id v20 = [v19 dateReceived];
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x263F08910] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
      [(NNMKProtoMoreMessages *)v11 setDateForRequestingMoreMessages:v21];
    }
  }
  uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v8;
  uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v51)
  {
    uint64_t v23 = *(void *)v53;
    uint64_t v24 = &__logCategories;
    unsigned int v49 = v5;
    v47 = v11;
    v48 = self;
    uint64_t v46 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v27 = v24[1];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = v27;
          v29 = [v26 messageId];
          id v30 = [v26 accountId];
          v31 = [v26 dateReceived];
          char v32 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v26 status]);
          [v26 messageIdHeader];
          v33 = v24;
          v35 = int v34 = v22;
          *(_DWORD *)buf = 138544386;
          v57 = v29;
          __int16 v58 = 2114;
          v59 = v30;
          __int16 v60 = 2114;
          v61 = v31;
          __int16 v62 = 2112;
          uint64_t v63 = v32;
          __int16 v64 = 2114;
          uint64_t v65 = v35;
          _os_log_impl(&dword_23D3DF000, v28, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #LOAD_MORE_MESSAGES)", buf, 0x34u);

          uint64_t v22 = v34;
          uint64_t v24 = v33;

          uint64_t v23 = v46;
          v11 = v47;
          self = v48;

          uint64_t v5 = v49;
        }
        unint64_t v36 = [(NNMKSyncPersistenceHandler *)self protoMessageFromMessage:v26];
        [(NNMKProtoMoreMessages *)v11 addAddedMessage:v36];

        uint64_t v37 = [NNMKSyncedMessage alloc];
        v38 = [(NNMKSyncPersistenceHandler *)self delegate];
        uint64_t v39 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v37, "initWithMessage:useDefaultMailbox:", v26, [v38 pairedDeviceSupportsMultipleMailboxes] ^ 1);

        [(NNMKSyncedMessage *)v39 setUsedProtectedChannelForMessageSync:v5];
        unsigned int v40 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
        [v40 handleMessageAdded:v26];

        v41 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        [v41 addOrUpdateSyncedMessage:v39];

        uint64_t v42 = [v26 messageId];
        [v22 addObject:v42];
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    }
    while (v51);
  }

  unsigned int v43 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v43 endUpdates];

  return v11;
}

- (id)addMoreConversationSpecificMessages:(id)a3 conversationId:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v13 beginUpdates];

  uint64_t v14 = objc_alloc_init(NNMKProtoMoreMessagesForConversation);
  uint64_t v15 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  -[NNMKProtoMoreMessagesForConversation setFullSyncVersion:](v14, "setFullSyncVersion:", [v15 fullSyncVersion]);

  v16 = (void *)MEMORY[0x263F08910];
  v17 = [MEMORY[0x263EFF910] date];
  v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
  [(NNMKProtoMoreMessagesForConversation *)v14 setDateSynced:v18];

  char v45 = v11;
  [(NNMKProtoMoreMessagesForConversation *)v14 setConversationId:v11];
  v19 = [v12 mailboxId];
  [(NNMKProtoMoreMessagesForConversation *)v14 setMailboxId:v19];

  id v20 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  uint64_t v44 = v12;
  uint64_t v21 = [v12 mailboxId];
  -[NNMKProtoMoreMessagesForConversation setMailboxSyncVersion:](v14, "setMailboxSyncVersion:", [v20 syncVersionForMailboxId:v21]);

  uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v10;
  uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v50)
  {
    uint64_t v23 = *(void *)v52;
    v47 = v14;
    v48 = self;
    unsigned int v46 = v6;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v26 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = v26;
          uint64_t v28 = [v25 messageId];
          v29 = [v25 accountId];
          [v25 dateReceived];
          v31 = uint64_t v30 = v23;
          char v32 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v25 status]);
          [v25 messageIdHeader];
          int v34 = v33 = v22;
          *(_DWORD *)buf = 138544386;
          v56 = v28;
          __int16 v57 = 2114;
          __int16 v58 = v29;
          __int16 v59 = 2114;
          __int16 v60 = v31;
          __int16 v61 = 2112;
          __int16 v62 = v32;
          __int16 v63 = 2114;
          __int16 v64 = v34;
          _os_log_impl(&dword_23D3DF000, v27, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #LOAD_MORE_MESSAGES for Conversation)", buf, 0x34u);

          uint64_t v22 = v33;
          uint64_t v23 = v30;

          uint64_t v6 = v46;
          uint64_t v14 = v47;
          self = v48;
        }
        int v35 = [(NNMKSyncPersistenceHandler *)self protoMessageFromMessage:v25];
        [(NNMKProtoMoreMessagesForConversation *)v14 addAddedMessage:v35];

        unint64_t v36 = [NNMKSyncedMessage alloc];
        uint64_t v37 = [(NNMKSyncPersistenceHandler *)self delegate];
        v38 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v36, "initWithMessage:useDefaultMailbox:", v25, [v37 pairedDeviceSupportsMultipleMailboxes] ^ 1);

        [(NNMKSyncedMessage *)v38 setUsedProtectedChannelForMessageSync:v6];
        uint64_t v39 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
        [v39 handleMessageAdded:v25];

        unsigned int v40 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        [v40 addOrUpdateSyncedMessage:v38];

        v41 = [v25 messageId];
        [v22 addObject:v41];
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v50);
  }

  uint64_t v42 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v42 endUpdates];

  return v14;
}

- (id)addMessagesToResend:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v10 beginUpdates];

  v41 = objc_alloc_init(NNMKAdditionResult);
  char v45 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v11 = objc_alloc_init(NNMKProtoMessageAdditions);
  [(NNMKProtoMessageAdditions *)v11 setMessagesAreNew:0];
  id v12 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  -[NNMKProtoMessageAdditions setFullSyncVersion:](v11, "setFullSyncVersion:", [v12 fullSyncVersion]);

  uint64_t v13 = (void *)MEMORY[0x263F08910];
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
  [(NNMKProtoMessageAdditions *)v11 setDateSynced:v15];

  v16 = [v9 mailboxId];
  [(NNMKProtoMessageAdditions *)v11 setMailboxId:v16];

  v17 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  uint64_t v42 = v9;
  v18 = [v9 mailboxId];
  -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v11, "setMailboxSyncVersion:", [v17 syncVersionForMailboxId:v18]);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v8;
  uint64_t v47 = [v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
  unint64_t v20 = 0;
  if (v47)
  {
    uint64_t v46 = *(void *)v49;
    unsigned int v43 = v11;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(v19);
        }
        uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v23 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        uint64_t v24 = [v22 messageId];
        uint64_t v25 = [v23 syncedMessageForMessageWithId:v24];

        if (v25 && [v25 resendRequested])
        {
          if (!v20) {
            unint64_t v20 = [v25 resendInterval];
          }
          objc_msgSend(v22, "setIsThreadSpecific:", objc_msgSend(v25, "isThreadSpecific"));
          objc_msgSend(v22, "setIsSpecialMailboxSpecific:", objc_msgSend(v25, "isSpecialMailboxSpecific"));
          unint64_t v26 = [v25 resendInterval];
          if (v26 < v20) {
            unint64_t v20 = v26;
          }
          objc_msgSend(v25, "setStatus:", objc_msgSend(v22, "status"));
          [v25 setResendRequested:0];
          [v25 setResendInterval:0];
          [v25 setUsedProtectedChannelForMessageSync:v5];
          [v25 setUsedNotificationPriorityForMessageSync:0];
          uint64_t v27 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
          [v27 addOrUpdateSyncedMessage:v25];

          uint64_t v28 = [v22 messageId];
          [v45 addObject:v28];

          objc_msgSend(v22, "setStatusVersion:", objc_msgSend(v25, "statusVersion"));
          v29 = [(NNMKSyncPersistenceHandler *)self protoMessageFromMessage:v22];
          [(NNMKProtoMessageAdditions *)v11 addMessageAddition:v29];

          uint64_t v30 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            v31 = v30;
            char v32 = [v22 messageId];
            [v22 dateReceived];
            unint64_t v44 = v20;
            id v33 = v19;
            int v34 = self;
            unint64_t v36 = v35 = v5;
            uint64_t v37 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v22 status]);
            uint64_t v38 = [v22 statusVersion];
            *(_DWORD *)buf = 138544130;
            long long v53 = v32;
            __int16 v54 = 2114;
            long long v55 = v36;
            __int16 v56 = 2112;
            __int16 v57 = v37;
            __int16 v58 = 2048;
            uint64_t v59 = v38;
            _os_log_impl(&dword_23D3DF000, v31, OS_LOG_TYPE_DEFAULT, "Message being RESENT (Id: %{public}@ - Date Received: %{public}@ - Status: %@ - StatusVersion: %lu).", buf, 0x2Au);

            BOOL v5 = v35;
            self = v34;
            id v19 = v33;
            unint64_t v20 = v44;

            id v11 = v43;
          }
        }
      }
      uint64_t v47 = [v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v47);
  }

  uint64_t v39 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v39 endUpdates];

  [(NNMKAdditionResult *)v41 setProtoMessagesWithDefaultPriority:v11];
  [(NNMKAdditionResult *)v41 setMessageIdsWithDefaultPriority:v45];
  [(NNMKAdditionResult *)v41 setResendInterval:v20];

  return v41;
}

- (id)updateMessagesStatus:(id)a3 mailbox:(id)a4
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v8 beginUpdates];

  char v84 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  uint64_t v83 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  v82 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  uint64_t v81 = [MEMORY[0x263EFF980] array];
  long long v80 = [MEMORY[0x263EFF980] array];
  long long v79 = [MEMORY[0x263EFF980] array];
  id v86 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  __int16 v85 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v88 = *(void *)v94;
    *(void *)&long long v10 = 138544130;
    long long v78 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v94 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v14 = [(NNMKSyncPersistenceHandler *)self sessionController];
        uint64_t v15 = [v14 messageIdsToIgnoreStatusUpdates];
        v16 = [v13 messageId];
        int v17 = [v15 containsObject:v16];

        if (v17)
        {
          v18 = (void *)qword_26AC21850;
          if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          id v19 = v18;
          unint64_t v20 = [v13 messageId];
          uint64_t v21 = [v13 dateReceived];
          uint64_t v22 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v13 status]);
          *(_DWORD *)buf = 138543874;
          long long v98 = v20;
          __int16 v99 = 2114;
          long long v100 = v21;
          __int16 v101 = 2112;
          unsigned int v102 = v22;
          _os_log_impl(&dword_23D3DF000, v19, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but updates are being ignored for it. Dropping... (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);
        }
        else
        {
          uint64_t v23 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
          uint64_t v24 = [v13 messageId];
          id v19 = [v23 syncedMessageForMessageWithId:v24];

          uint64_t v25 = [(NNMKSyncPersistenceHandler *)self syncController];
          char v26 = 0;
          if ([v25 shouldAddsDeletesMessagesByStatusUpdatesForMailbox:v7] && v19)
          {
            uint64_t v27 = [(NNMKSyncPersistenceHandler *)self syncController];
            if (objc_msgSend(v27, "isValidMessageStatus:forMailbox:", -[NSObject status](v19, "status"), v7))
            {
              char v26 = 0;
            }
            else
            {
              uint64_t v28 = [(NNMKSyncPersistenceHandler *)self syncController];
              char v26 = objc_msgSend(v28, "isValidMessageStatus:forMailbox:", objc_msgSend(v13, "status"), v7);
            }
          }

          if (!v19 || (v26 & 1) != 0)
          {
            id v33 = [(NNMKSyncPersistenceHandler *)self syncController];
            if ([v33 shouldAddsDeletesMessagesByStatusUpdatesForMailbox:v7])
            {
              int v34 = [(NNMKSyncPersistenceHandler *)self syncController];
              int v35 = [v34 canSyncMessage:v13 forMailbox:v7];

              if (v35)
              {
                unint64_t v36 = (void *)qword_26AC21850;
                if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = [v13 messageId];
                  uint64_t v39 = [v13 dateReceived];
                  unsigned int v40 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v13 status]);
                  *(_DWORD *)buf = 138543874;
                  long long v98 = v38;
                  __int16 v99 = 2114;
                  long long v100 = v39;
                  __int16 v101 = 2112;
                  unsigned int v102 = v40;
                  _os_log_impl(&dword_23D3DF000, v37, OS_LOG_TYPE_DEFAULT, "Received Message Status UPDATE, but it still hadn't been synced or it is about to be removed on the client. Will try to re-add message if not too old. (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);
                }
                v41 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
                uint64_t v42 = [v13 messageId];
                unsigned int v43 = [v7 mailboxId];
                [v41 handleMessageDeleted:v42 mailboxId:v43];

                unint64_t v44 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
                char v45 = [v13 messageId];
                [v44 removeSyncedMessageForMessageWithId:v45];

                [v86 addObject:v13];
                goto LABEL_42;
              }
            }
            else
            {
            }
            uint64_t v46 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v47 = v46;
              long long v48 = [v13 messageId];
              long long v49 = [v13 dateReceived];
              long long v50 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v13 status]);
              *(_DWORD *)buf = v78;
              long long v98 = v48;
              __int16 v99 = 2114;
              long long v100 = v49;
              __int16 v101 = 2112;
              unsigned int v102 = v50;
              __int16 v103 = 2114;
              uint64_t v104 = v19;
              _os_log_debug_impl(&dword_23D3DF000, &v47->super.super, OS_LOG_TYPE_DEBUG, "Dropping Message Status UPDATE. Message is not being tracked. (Id: %{public}@ - Date Received: %{public}@ - Status: %@ - MessageSynced: %{public}@).", buf, 0x2Au);

LABEL_41:
            }
          }
          else
          {
            uint64_t v29 = [v19 status];
            if (v29 != [v13 status])
            {
              long long v51 = [(NNMKSyncPersistenceHandler *)self syncController];
              int v52 = objc_msgSend(v51, "isValidMessageStatus:forMailbox:", objc_msgSend(v13, "status"), v7);

              long long v53 = (void *)qword_26AC21850;
              BOOL v54 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
              if (v52)
              {
                if (v54)
                {
                  long long v55 = v53;
                  __int16 v56 = [v13 messageId];
                  __int16 v57 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v13 status]);
                  __int16 v58 = [v13 dateReceived];
                  *(_DWORD *)buf = 138543874;
                  long long v98 = v56;
                  __int16 v99 = 2112;
                  long long v100 = v57;
                  __int16 v101 = 2114;
                  unsigned int v102 = v58;
                  _os_log_impl(&dword_23D3DF000, v55, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED (Id: %{public}@ - Status: %@ - Date Received: %{public}@ - Source: MobileMail).", buf, 0x20u);
                }
                [v19 setStatusVersion:[v19 statusVersion] + 1];
                -[NSObject setStatus:](v19, "setStatus:", [v13 status]);
                uint64_t v47 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
                uint64_t v59 = [(NNMKSyncPersistenceHandler *)self syncController];
                __int16 v60 = [v13 messageId];
                uint64_t v61 = [v59 watchMessageIdFromMessageId:v60];
                [(NNMKProtoMessageStatusUpdate *)v47 setMessageId:v61];

                -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v47, "setUpdatedStatus:", [v13 status]);
                [(NNMKProtoMessageStatusUpdate *)v47 setStatusVersion:[v19 statusVersion]];
                if ([v19 usedProtectedChannelForMessageSync])
                {
                  [(NNMKProtoMessageStatusUpdates *)v84 addMessageStatusUpdate:v47];
                  __int16 v62 = [v13 messageId];
                  [v81 addObject:v62];
                }
                if ([v19 usedNotificationPriorityForMessageSync])
                {
                  [(NNMKProtoMessageStatusUpdates *)v83 addMessageStatusUpdate:v47];
                  __int16 v63 = [v13 messageId];
                  __int16 v64 = v80;
                }
                else
                {
                  [(NNMKProtoMessageStatusUpdates *)v82 addMessageStatusUpdate:v47];
                  __int16 v63 = [v13 messageId];
                  __int16 v64 = v79;
                }
                [v64 addObject:v63];

                uint64_t v70 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
                [v70 addOrUpdateSyncedMessage:v19];

                goto LABEL_41;
              }
              if (v54)
              {
                uint64_t v65 = v53;
                uint64_t v66 = [v13 messageId];
                uint64_t v67 = [v13 dateReceived];
                char v68 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v13 status]);
                *(_DWORD *)buf = 138543874;
                long long v98 = v66;
                __int16 v99 = 2114;
                long long v100 = v67;
                __int16 v101 = 2112;
                unsigned int v102 = v68;
                _os_log_impl(&dword_23D3DF000, v65, OS_LOG_TYPE_DEFAULT, "Removing message that does not belong to current mailbox due to status change. (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);
              }
              uint64_t v69 = [v13 messageId];
              [v85 addObject:v69];

              v31 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
              [v31 handleMessageAdded:v13];
              goto LABEL_38;
            }
            uint64_t v30 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              v31 = v30;
              char v32 = [v13 messageId];
              *(_DWORD *)buf = 138543362;
              long long v98 = v32;
              _os_log_impl(&dword_23D3DF000, v31, OS_LOG_TYPE_DEFAULT, "Dropping Message Status UPDATE because status did not change. %{public}@", buf, 0xCu);

LABEL_38:
            }
          }
        }
LABEL_42:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
    }
    while (v11);
  }

  long long v71 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v71 endUpdates];

  long long v72 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  long long v73 = [v7 mailboxId];
  int v74 = [v72 syncVersionForMailboxId:v73];

  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __59__NNMKSyncPersistenceHandler_updateMessagesStatus_mailbox___block_invoke;
  v90[3] = &unk_264E9A6F8;
  v90[4] = self;
  id v91 = v7;
  int v92 = v74;
  id v89 = v7;
  long long v75 = (void (**)(void, void))MEMORY[0x23ED00AC0](v90);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v84);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v83);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v82);
  long long v76 = objc_opt_new();
  [v76 setProtoMessageUpdatesWithNotificationPriority:v83];
  [v76 setProtoMessageUpdatesWithDefaultPriority:v82];
  [v76 setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:v84];
  [v76 setMessageIdsWithNotificationPriority:v80];
  [v76 setMessageIdsWithDefaultPriority:v79];
  [v76 setMessageIdsWithDefaultPriorityAndProtectedChannel:v81];
  [v76 setMessagesToAdd:v86];
  [v76 setMessageIdsToDelete:v85];

  return v76;
}

void __59__NNMKSyncPersistenceHandler_updateMessagesStatus_mailbox___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 messageStatusUpdatesCount])
  {
    v3 = [*(id *)(a1 + 32) currentDeviceRegistry];
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    id v4 = (void *)MEMORY[0x263F08910];
    BOOL v5 = [MEMORY[0x263EFF910] date];
    id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [v8 setDateSynced:v6];

    id v7 = [*(id *)(a1 + 40) mailboxId];
    [v8 setMailboxId:v7];

    [v8 setMailboxSyncVersion:*(unsigned int *)(a1 + 48)];
  }
}

- (id)deleteMessagesWithIds:(id)a3 mailbox:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v8 beginUpdates];

  unsigned int v43 = objc_alloc_init(NNMKProtoMessageDeletions);
  long long v48 = objc_alloc_init(NNMKProtoMessageDeletions);
  uint64_t v47 = objc_alloc_init(NNMKProtoMessageDeletions);
  uint64_t v42 = [MEMORY[0x263EFF980] array];
  uint64_t v46 = [MEMORY[0x263EFF980] array];
  char v45 = [MEMORY[0x263EFF980] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    uint64_t v40 = 138543362;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v14 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
        uint64_t v15 = [v14 syncedMessageForMessageWithId:v13];

        if (v15)
        {
          v16 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v40;
            uint64_t v57 = v13;
            _os_log_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_DEFAULT, "Message DELETED (Id: %{public}@).", buf, 0xCu);
          }
          int v17 = objc_alloc_init(NNMKProtoMessageDeletion);
          v18 = [(NNMKSyncPersistenceHandler *)self syncController];
          id v19 = [v18 watchMessageIdFromMessageId:v13];
          [(NNMKProtoMessageDeletion *)v17 setMessageId:v19];

          if ([v15 usedProtectedChannelForMessageSync])
          {
            [(NNMKProtoMessageDeletions *)v43 addMessageDeletion:v17];
            [v42 addObject:v13];
          }
          int v20 = [v15 usedNotificationPriorityForMessageSync];
          BOOL v21 = v20 == 0;
          if (v20) {
            uint64_t v22 = v48;
          }
          else {
            uint64_t v22 = v47;
          }
          if (v21) {
            uint64_t v23 = v45;
          }
          else {
            uint64_t v23 = v46;
          }
          [(NNMKProtoMessageDeletions *)v22 addMessageDeletion:v17];
          [v23 addObject:v13];
          uint64_t v24 = [(NNMKSyncPersistenceHandler *)self batchRequestHandler];
          uint64_t v25 = [v7 mailboxId];
          [v24 handleMessageDeleted:v13 mailboxId:v25];

          char v26 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
          uint64_t v27 = [v7 mailboxId];
          [v26 insertDeletedMessageId:v13 mailboxId:v27];

          uint64_t v28 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
          [v28 removeSyncedMessageForMessageWithId:v13];

          uint64_t v29 = [(NNMKSyncPersistenceHandler *)self sessionController];
          uint64_t v30 = [v29 notificationPayloadAcks];
          [v30 removeObjectForKey:v13];
        }
        v31 = [(NNMKSyncPersistenceHandler *)self sessionController];
        char v32 = [v31 messageIdsToIgnoreStatusUpdates];
        [v32 removeObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v10);
  }

  id v33 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  int v34 = [v7 mailboxId];
  int v35 = [v33 syncVersionForMailboxId:v34];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __60__NNMKSyncPersistenceHandler_deleteMessagesWithIds_mailbox___block_invoke;
  v49[3] = &unk_264E9A720;
  v49[4] = self;
  id v50 = v7;
  int v51 = v35;
  id v41 = v7;
  unint64_t v36 = (void (**)(void, void))MEMORY[0x23ED00AC0](v49);
  ((void (**)(void, NNMKProtoMessageDeletions *))v36)[2](v36, v43);
  ((void (**)(void, NNMKProtoMessageDeletions *))v36)[2](v36, v48);
  ((void (**)(void, NNMKProtoMessageDeletions *))v36)[2](v36, v47);
  uint64_t v37 = objc_alloc_init(NNMKDeletionResult);
  [(NNMKDeletionResult *)v37 setProtectedProtobuf:v43];
  [(NNMKDeletionResult *)v37 setProtectedMessageIds:v42];
  [(NNMKDeletionResult *)v37 setUnprotectedNotificationProtobuf:v48];
  [(NNMKDeletionResult *)v37 setUnprotectedNotificationMessageIds:v46];
  [(NNMKDeletionResult *)v37 setUnprotectedDefaultProtobuf:v47];
  [(NNMKDeletionResult *)v37 setUnprotectedDefaultMessageIds:v45];
  uint64_t v38 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v38 endUpdates];

  return v37;
}

void __60__NNMKSyncPersistenceHandler_deleteMessagesWithIds_mailbox___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 messageDeletionsCount])
  {
    v3 = [*(id *)(a1 + 32) currentDeviceRegistry];
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    id v4 = (void *)MEMORY[0x263F08910];
    BOOL v5 = [MEMORY[0x263EFF910] date];
    id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [v8 setDateSynced:v6];

    id v7 = [*(id *)(a1 + 40) mailboxId];
    [v8 setMailboxId:v7];

    [v8 setMailboxSyncVersion:*(unsigned int *)(a1 + 48)];
  }
}

- (id)updateMessagesFromConversation:(id)a3 withState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6
{
  BOOL v7 = a5;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v48 = a6;
  uint64_t v11 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v11 beginUpdates];

  uint64_t v47 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  uint64_t v46 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  char v45 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  unint64_t v44 = [MEMORY[0x263EFF980] array];
  unsigned int v43 = [MEMORY[0x263EFF980] array];
  uint64_t v42 = [MEMORY[0x263EFF980] array];
  id v12 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  uint64_t v40 = v10;
  uint64_t v13 = [v12 syncedMessagesForConversationWithId:v10];

  id v41 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v56;
    char v17 = a4 != 128 || v7;
    char v50 = v17;
    uint64_t v49 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ((([v19 status] & a4) == 0) == v7)
        {
          if ((v50 & 1) != 0 || [v48 filterType] != 32)
          {
            objc_msgSend(v19, "setStatusVersion:", objc_msgSend(v19, "statusVersion") + 1);
            uint64_t v21 = [v19 status];
            BOOL v22 = v7;
            if (v7) {
              unint64_t v23 = v21 | a4;
            }
            else {
              unint64_t v23 = v21 ^ a4;
            }
            [v19 setStatus:v23];
            int v20 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
            uint64_t v24 = self;
            uint64_t v25 = [(NNMKSyncPersistenceHandler *)self syncController];
            char v26 = [v19 messageId];
            uint64_t v27 = [v25 watchMessageIdFromMessageId:v26];
            [(NNMKProtoMessageStatusUpdate *)v20 setMessageId:v27];

            -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v20, "setUpdatedStatus:", [v19 status]);
            -[NNMKProtoMessageStatusUpdate setStatusVersion:](v20, "setStatusVersion:", [v19 statusVersion]);
            if ([v19 usedProtectedChannelForMessageSync])
            {
              [(NNMKProtoMessageStatusUpdates *)v47 addMessageStatusUpdate:v20];
              uint64_t v28 = [v19 messageId];
              [v44 addObject:v28];
            }
            if ([v19 usedNotificationPriorityForMessageSync])
            {
              [(NNMKProtoMessageStatusUpdates *)v46 addMessageStatusUpdate:v20];
              uint64_t v29 = [v19 messageId];
              uint64_t v30 = v43;
            }
            else
            {
              [(NNMKProtoMessageStatusUpdates *)v45 addMessageStatusUpdate:v20];
              uint64_t v29 = [v19 messageId];
              uint64_t v30 = v42;
            }
            [v30 addObject:v29];
            self = v24;
            BOOL v7 = v22;

            v31 = [(NNMKSyncPersistenceHandler *)v24 currentDeviceRegistry];
            [v31 addOrUpdateSyncedMessage:v19];

            uint64_t v16 = v49;
          }
          else
          {
            int v20 = [v19 messageId];
            [v41 addObject:v20];
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v15);
  }

  char v32 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  [v32 endUpdates];

  id v33 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  int v34 = [v48 mailboxId];
  int v35 = [v33 syncVersionForMailboxId:v34];

  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __87__NNMKSyncPersistenceHandler_updateMessagesFromConversation_withState_include_mailbox___block_invoke;
  v52[3] = &unk_264E9A6F8;
  v52[4] = self;
  id v53 = v48;
  int v54 = v35;
  id v36 = v48;
  uint64_t v37 = (void (**)(void, void))MEMORY[0x23ED00AC0](v52);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v47);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v46);
  ((void (**)(void, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v45);
  uint64_t v38 = objc_opt_new();
  [v38 setProtoMessageUpdatesWithNotificationPriority:v46];
  [v38 setProtoMessageUpdatesWithDefaultPriority:v45];
  [v38 setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:v47];
  [v38 setMessageIdsWithNotificationPriority:v43];
  [v38 setMessageIdsWithDefaultPriority:v42];
  [v38 setMessageIdsWithDefaultPriorityAndProtectedChannel:v44];
  [v38 setMessageIdsToDelete:v41];

  return v38;
}

void __87__NNMKSyncPersistenceHandler_updateMessagesFromConversation_withState_include_mailbox___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 messageStatusUpdatesCount])
  {
    v3 = [*(id *)(a1 + 32) currentDeviceRegistry];
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    id v4 = (void *)MEMORY[0x263F08910];
    BOOL v5 = [MEMORY[0x263EFF910] date];
    id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [v8 setDateSynced:v6];

    BOOL v7 = [*(id *)(a1 + 40) mailboxId];
    [v8 setMailboxId:v7];

    [v8 setMailboxSyncVersion:*(unsigned int *)(a1 + 48)];
  }
}

- (id)addMessageContent:(id)a3 forMessage:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(NNMKMessageContentResult);
  __int16 v101 = self;
  uint64_t v11 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  id v12 = [v8 messageId];
  uint64_t v13 = [v11 syncedMessageForMessageWithId:v12];

  int v14 = [v13 usedNotificationPriorityForMessageSync];
  int v15 = [v13 contentRequestedByUser];
  if ((v15 & 1) == 0)
  {
    if (v14) {
      uint64_t v16 = [v13 contentSyncedUsingNotificationPriority];
    }
    else {
      uint64_t v16 = [v13 contentSynced];
    }
    [(NNMKMessageContentResult *)v10 setAlreadySyncedWithCurrentPriority:v16];
  }
  [(NNMKMessageContentResult *)v10 setMessageDoesNotExist:v13 == 0];
  if (!v13 || [(NNMKMessageContentResult *)v10 alreadySyncedWithCurrentPriority]) {
    goto LABEL_71;
  }
  int v92 = v15;
  char v17 = [(NNMKSyncPersistenceHandler *)v101 currentDeviceRegistry];
  [v17 beginUpdates];

  if ([v8 mainAlternativeValid])
  {
    v18 = [v9 preview];
  }
  else
  {
    int v19 = [v8 hasTextData];
    v18 = [v9 preview];
    if (!v19) {
      goto LABEL_15;
    }
  }
  if ((unint64_t)[v18 length] >= 0x65)
  {
    int v20 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
      -[NNMKSyncPersistenceHandler addMessageContent:forMessage:mailbox:isProtectedData:](v20);
    }
    uint64_t v21 = [v18 substringToIndex:100];

    v18 = (void *)v21;
  }
LABEL_15:
  long long v96 = v10;
  long long v93 = v18;
  long long v90 = [v18 dataUsingEncoding:10];
  uint64_t v22 = [v90 compressedData];
  unint64_t v23 = objc_alloc_init(NNMKProtoMessageContentSync);
  uint64_t v24 = [(NNMKSyncPersistenceHandler *)v101 currentDeviceRegistry];
  -[NNMKProtoMessageContentSync setFullSyncVersion:](v23, "setFullSyncVersion:", [v24 fullSyncVersion]);

  uint64_t v25 = (void *)MEMORY[0x263F08910];
  char v26 = [MEMORY[0x263EFF910] date];
  uint64_t v27 = [v25 archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
  [(NNMKProtoMessageContentSync *)v23 setDateSynced:v27];

  uint64_t v28 = [(NNMKSyncPersistenceHandler *)v101 syncController];
  uint64_t v29 = [v8 messageId];
  uint64_t v30 = [v28 watchMessageIdFromMessageId:v29];
  [(NNMKProtoMessageContentSync *)v23 setMessageId:v30];

  v31 = [v9 mailboxId];
  [(NNMKProtoMessageContentSync *)v23 setMailboxId:v31];

  -[NNMKProtoMessageContentSync setMainAlternativeValid:](v23, "setMainAlternativeValid:", [v8 mainAlternativeValid]);
  id v89 = (void *)v22;
  [(NNMKProtoMessageContentSync *)v23 setPreview:v22];
  long long v100 = v23;
  -[NNMKProtoMessageContentSync setPartiallyLoaded:](v23, "setPartiallyLoaded:", [v8 partiallyLoaded]);
  char v32 = [(NNMKSyncPersistenceHandler *)v101 currentDeviceRegistry];
  id v33 = [v32 supportsWebKit];

  long long v94 = v13;
  uint64_t v88 = v33;
  if (v33)
  {
    int v34 = [v33 BOOLValue];
    char v35 = [v33 BOOLValue] ^ 1;
    if (!v34) {
      goto LABEL_20;
    }
  }
  else
  {
    char v35 = 1;
  }
  if (![(NNMKProtoMessageContentSync *)v100 mainAlternativeValid])
  {
    id v36 = v9;
    uint64_t v37 = [v8 htmlContentData];
    uint64_t v38 = [v37 compressedData];

    uint64_t v39 = [v8 htmlContentData];
    if ((unint64_t)[v39 length] >> 21)
    {
    }
    else
    {
      if (([v38 length] & 0xFFFFFFFFFFF00000) != 0) {
        char v40 = v14;
      }
      else {
        char v40 = 0;
      }

      if ((v40 & 1) == 0)
      {
        id v41 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = v41;
          unsigned int v43 = [v8 messageId];
          unint64_t v44 = [v8 htmlContentData];
          *(_DWORD *)buf = 138543874;
          long long v108 = v43;
          __int16 v109 = 2048;
          uint64_t v110 = [v44 length];
          __int16 v111 = 2048;
          uint64_t v112 = [v38 length];
          _os_log_impl(&dword_23D3DF000, v42, OS_LOG_TYPE_INFO, "Message content will sync html content. %{public}@ - size: %lu - compressed: %lu", buf, 0x20u);
        }
        [(NNMKProtoMessageContentSync *)v100 setHtmlContentData:v38];
        uint64_t v98 = [v38 length];

        id v9 = v36;
        if (v35) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
    char v45 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = v45;
      uint64_t v47 = [v8 messageId];
      id v48 = [v8 htmlContentData];
      *(_DWORD *)buf = 138543874;
      long long v108 = v47;
      __int16 v109 = 2048;
      uint64_t v110 = [v48 length];
      __int16 v111 = 2048;
      uint64_t v112 = [v38 length];
      _os_log_impl(&dword_23D3DF000, v46, OS_LOG_TYPE_DEFAULT, "Html Message content size is too large. It will sync text attribute instead. %{public}@ - size: %lu - compressed %lu", buf, 0x20u);
    }
    uint64_t v98 = 0;
    id v9 = v36;
    goto LABEL_36;
  }
LABEL_20:
  uint64_t v98 = 0;
  if (v35) {
    goto LABEL_36;
  }
LABEL_21:
  if ([(NNMKProtoMessageContentSync *)v100 mainAlternativeValid])
  {
LABEL_36:
    uint64_t v49 = [v8 textData];
    unint64_t v50 = [v49 length];

    if (v50 >> 21)
    {
      uint64_t v60 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = v60;
        __int16 v62 = [v8 messageId];
        __int16 v63 = [v8 textData];
        uint64_t v64 = [v63 length];
        *(_DWORD *)buf = 138543618;
        long long v108 = v62;
        __int16 v109 = 2048;
        uint64_t v110 = v64;
        _os_log_impl(&dword_23D3DF000, v61, OS_LOG_TYPE_DEFAULT, "Message content too large won't sync. %{public}@ - size: %lu)", buf, 0x16u);
      }
      [(NNMKProtoMessageContentSync *)v100 setMainAlternativeValid:0];
    }
    else
    {
      int v51 = [v8 textData];
      long long v52 = [v51 compressedData];

      id v53 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
      {
        int v54 = v53;
        long long v55 = [v8 messageId];
        long long v56 = [v8 htmlContentData];
        int v57 = v14;
        uint64_t v58 = [v56 length];
        uint64_t v59 = [v52 length];
        *(_DWORD *)buf = 138543874;
        long long v108 = v55;
        __int16 v109 = 2048;
        uint64_t v110 = v58;
        int v14 = v57;
        __int16 v111 = 2048;
        uint64_t v112 = v59;
        _os_log_impl(&dword_23D3DF000, v54, OS_LOG_TYPE_INFO, "Message content will sync text attribute. %{public}@ - size: %lu - compressed %lu", buf, 0x20u);
      }
      [(NNMKProtoMessageContentSync *)v100 setText:v52];
      uint64_t v98 = [v52 length];
    }
  }
  int v91 = v14;
  if (v14)
  {
    uint64_t v65 = [(NNMKSyncPersistenceHandler *)v101 protoMessageFromMessage:v9];
    [(NNMKProtoMessageContentSync *)v100 setNotificationMessage:v65];
  }
  id v95 = v9;
  __int16 v99 = [MEMORY[0x263EFF9C0] set];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v97 = v8;
  uint64_t v66 = [v8 attachments];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v103 != v69) {
          objc_enumerationMutation(v66);
        }
        long long v71 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        long long v72 = [v71 contentId];

        if (v72)
        {
          long long v73 = objc_alloc_init(NNMKProtoAttachmentMetadata);
          int v74 = [v71 fileName];
          [(NNMKProtoAttachmentMetadata *)v73 setFileName:v74];

          -[NNMKProtoAttachmentMetadata setFileSize:](v73, "setFileSize:", [v71 fileSize]);
          -[NNMKProtoAttachmentMetadata setType:](v73, "setType:", [v71 type]);
          long long v75 = [(NNMKSyncPersistenceHandler *)v101 syncController];
          long long v76 = [v71 contentId];
          long long v77 = [v75 watchAttachmentContentIdFromContentId:v76];
          [(NNMKProtoAttachmentMetadata *)v73 setContentId:v77];

          long long v78 = [v71 mimePartNumber];
          [(NNMKProtoAttachmentMetadata *)v73 setMimePartNumber:v78];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v79 = v71;
            if ([v79 renderOnClient])
            {
              long long v80 = [v79 contentId];
              [v99 addObject:v80];
            }
            -[NNMKProtoAttachmentMetadata setRenderOnClient:](v73, "setRenderOnClient:", [v79 renderOnClient]);
            [v79 imageSize];
            *(float *)&double v81 = v81;
            [(NNMKProtoAttachmentMetadata *)v73 setImageWidth:v81];
            [v79 imageSize];
            *(float *)&double v83 = v82;
            [(NNMKProtoAttachmentMetadata *)v73 setImageHeight:v83];
LABEL_57:
          }
          else if ([v71 isActionable])
          {
            id v79 = [v71 contentId];
            [v99 addObject:v79];
            goto LABEL_57;
          }
          [(NNMKProtoMessageContentSync *)v100 addAttachment:v73];

          continue;
        }
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v102 objects:v106 count:16];
    }
    while (v68);
  }

  uint64_t v13 = v94;
  if (![v94 contentSynced] || objc_msgSend(v94, "contentRequestedByUser")) {
    [v94 setAttachmentsContentIdsNotYetSynced:v99];
  }
  if (v91) {
    [v94 setContentSyncedUsingNotificationPriority:1];
  }
  id v9 = v95;
  if (v92) {
    [v94 setContentSyncedBecauseUserRequested:1];
  }
  [v94 setContentSynced:1];
  uint64_t v84 = [v94 contentResendInterval];
  [v94 setContentResendInterval:0];
  id v8 = v97;
  if ([v94 isContentCompletelySynced]) {
    [v94 setContentRequestedByUser:0];
  }
  __int16 v85 = [(NNMKSyncPersistenceHandler *)v101 currentDeviceRegistry];
  [v85 addOrUpdateSyncedMessage:v94];

  id v86 = [(NNMKSyncPersistenceHandler *)v101 currentDeviceRegistry];
  [v86 endUpdates];

  id v10 = v96;
  [(NNMKMessageContentResult *)v96 setProtoMessageContentSync:v100];
  [(NNMKMessageContentResult *)v96 setResendInterval:v84];
  [(NNMKMessageContentResult *)v96 setCompressedTextDataLength:v98];
  -[NNMKMessageContentResult setIsContentCompletelySynced:](v96, "setIsContentCompletelySynced:", [v94 isContentCompletelySynced]);
  -[NNMKMessageContentResult setIsNotificationPriority:](v96, "setIsNotificationPriority:", [v94 contentSyncedUsingNotificationPriority]);
  -[NNMKMessageContentResult setIsUserRequest:](v96, "setIsUserRequest:", [v94 contentSyncedBecauseUserRequested]);

LABEL_71:
  return v10;
}

- (id)protoMessageFromMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NNMKSyncPersistenceHandler *)self currentDeviceRegistry];
  uint64_t v6 = [v5 organizeByThread];
  BOOL v7 = [(NNMKSyncPersistenceHandler *)self delegate];
  uint64_t v8 = [v7 pairedDeviceSupportsMultipleMailboxes] ^ 1;
  id v9 = [(NNMKSyncPersistenceHandler *)self delegate];
  id v10 = +[NNMKProtoMessage protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:](NNMKProtoMessage, "protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:", v4, v6, v8, [v9 pairedDeviceSupportsStandaloneMode]);

  return v10;
}

- (id)currentDeviceRegistry
{
  v2 = [(NNMKSyncPersistenceHandler *)self delegate];
  v3 = [v2 currentDeviceRegistry];

  return v3;
}

- (NNMKDeviceRegistryHolder)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKDeviceRegistryHolder *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NNMKSyncStateManager)syncStateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncStateManager);
  return (NNMKSyncStateManager *)WeakRetained;
}

- (void)setSyncStateManager:(id)a3
{
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (NNMKBatchRequestHandler)batchRequestHandler
{
  return self->_batchRequestHandler;
}

- (void)setBatchRequestHandler:(id)a3
{
}

- (NNMKSyncSessionController)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_batchRequestHandler, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_syncStateManager);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addStandaloneAccountIdentity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Username, token or refreshToken is empty. Standalone account information won't be synced.", v1, 2u);
}

- (void)addStandaloneAccountIdentity:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 username];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "No account for username. Standalone account information won't be synced. %@", (uint8_t *)&v5, 0xCu);
}

- (void)addMessageContent:(os_log_t)log forMessage:mailbox:isProtectedData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEBUG, "Clipping message preview because text or main alternative is available", v1, 2u);
}

@end