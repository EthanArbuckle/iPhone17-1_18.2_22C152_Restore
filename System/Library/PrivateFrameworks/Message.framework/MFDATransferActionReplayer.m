@interface MFDATransferActionReplayer
- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3;
- (BOOL)downloadFailed;
- (BOOL)isRecoverableError:(id)a3;
- (MFDAMessageStore)store;
- (id)appendItem:(id)a3 mailboxURL:(id)a4;
- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4;
- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4;
- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4;
- (id)replayActionUsingStore:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation MFDATransferActionReplayer

- (id)replayActionUsingStore:(id)a3
{
  id v4 = a3;
  [(MFDATransferActionReplayer *)self setStore:v4];
  v5 = [(ECTransferActionReplayer *)self replayAction];

  return v5;
}

- (id)appendItem:(id)a3 mailboxURL:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MFDATransferActionReplayer *)self store];
  v7 = [v6 account];
  v8 = [(ECLocalActionReplayer *)self action];
  v9 = [v8 mailboxURL];
  v10 = [v9 absoluteString];
  v11 = [v7 mailboxUidForURL:v10];

  if ([v11 type] == 3)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F60918]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke;
    v46[3] = &unk_1E5D3E460;
    id v47 = v5;
    v13 = (void *)[v12 initWithBuilder:v46];
    id v14 = v47;
  }
  else if ([v11 type] == 5)
  {
    v15 = [v11 folderID];
    v16 = [v7 syncAnchorForFolderID:v15 mailbox:0];

    if (!v16) {
      [v6 fetchNumMessages:0 preservingUID:0 options:0];
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v48[0] = v5;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    v35 = (void *)[v18 initWithArray:v19];

    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20 = [v5 destinationMessage];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [MFDAMessageStoreSaveDraftRequest alloc];
      v22 = [v11 folderID];
      v23 = [(MFDAMessageStoreSaveDraftRequest *)v21 initWithMessage:v20 mailbox:v22];

      v24 = objc_opt_new();
      [v7 addRequest:v23 consumer:v24 mailbox:v11];
      if ([v24 success])
      {
        [v17 addObject:v5];
        [v35 removeObject:v5];
        id v25 = objc_alloc(MEMORY[0x1E4F608D8]);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_3;
        v41[3] = &unk_1E5D3E488;
        id v42 = v20;
        id v43 = v24;
        v26 = (void *)[v25 initWithServerMessageBuilder:v41];
        [v34 addObject:v26];

        v27 = 0;
      }
      else
      {
        v27 = [v24 error];
      }
    }
    else
    {
      v27 = 0;
    }
    id v29 = objc_alloc(MEMORY[0x1E4F60918]);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_4;
    v36[3] = &unk_1E5D3E4B0;
    id v14 = v17;
    id v37 = v14;
    id v30 = v35;
    id v38 = v30;
    id v31 = v34;
    id v39 = v31;
    id v40 = v27;
    id v32 = v27;
    v13 = (void *)[v29 initWithBuilder:v36];
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F60918]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_2;
    v44[3] = &unk_1E5D3E460;
    id v45 = v5;
    v13 = (void *)[v28 initWithBuilder:v44];
    id v14 = v45;
  }

  return v13;
}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setCompletedItems:v4];
}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v6[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setFailedItems:v4];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F60628] code:1 userInfo:0];
  [v3 setError:v5];
}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) persistentID];
  [v5 setMessagePersistentID:v3];

  id v4 = [*(id *)(a1 + 40) serverId];
  [v5 setRemoteID:v4];
}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:3];
  [v4 setCompletedItems:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) allObjects];
  [v4 setFailedItems:v3];

  [v4 setCreatedServerMessages:*(void *)(a1 + 48)];
  [v4 setError:*(void *)(a1 + 56)];
}

- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v18 = [(ECLocalActionReplayer *)self action];
  id v4 = [(MFDATransferActionReplayer *)self store];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_30];
  v6 = [v18 itemsToDelete];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 sourceRemoteID];
        if (v13
          || ([v12 sourceMessage],
              id v14 = objc_claimAutoreleasedReturnValue(),
              [v14 remoteID],
              v13 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  v15 = MFExchangeLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v7;
    _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Deleting source messages from transfer: %{public}@", buf, 0xCu);
  }

  uint64_t v19 = 0;
  char v16 = [v4 replayFlagChange:v5 forRemoteIDs:v7 error:&v19 completed:0];

  return v16;
}

uint64_t __68__MFDATransferActionReplayer_deleteSourceMessagesFromTransferItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesDeletedTo:1];
}

- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"MFDATransferActionReplayer.m" lineNumber:116 description:@"Copy is not supported for DA accounts"];

  return 0;
}

- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  v66 = [(MFDATransferActionReplayer *)self store];
  v70 = [v66 account];
  v68 = [(ECLocalActionReplayer *)self action];
  v61 = [v68 itemsToCopy];
  uint64_t v5 = [v61 count];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
  uint64_t v62 = v5;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v7 = v61;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v92 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        id v12 = [v11 sourceRemoteID];
        if (v12
          || ([v11 sourceMessage],
              v13 = objc_claimAutoreleasedReturnValue(),
              [v13 remoteID],
              id v12 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12))
        {
          [v6 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v8);
  }

  id v14 = [v68 sourceMailboxURL];
  v15 = [v14 absoluteString];
  v69 = [v70 mailboxUidForURL:v15];

  char v16 = [v69 folderID];
  id v17 = [v68 destinationMailboxURL];
  id v18 = [v17 absoluteString];
  v67 = [v70 mailboxUidForURL:v18];

  uint64_t v19 = [v67 folderID];
  long long v20 = [v69 account];
  if (v20 == v70)
  {
    long long v21 = [v67 account];
    BOOL v24 = v21 == v70 && v16 != 0 && v19 != 0;

    if (v24)
    {
      id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v71 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v62];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v25 = v6;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v87 objects:v101 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v88;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v88 != v27) {
              objc_enumerationMutation(v25);
            }
            id v29 = (void *)[objc_alloc(MEMORY[0x1E4F5E868]) initMoveRequestWithMessage:*(void *)(*((void *)&v87 + 1) + 8 * j) fromFolder:v16 toFolder:v19];
            if (v29) {
              [v71 addObject:v29];
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v87 objects:v101 count:16];
        }
        while (v26);
      }

      if ([v71 count])
      {
        id v60 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v63 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v62];
        id v30 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        id v31 = [v25 allKeys];
        v59 = (void *)[v30 initWithArray:v31];

        id v32 = [[MFDAMoveResponseConsumer alloc] initWithSourceRemoteIDs:v59 destinationRemoteIDsBySourceRemoteIDs:v63 failures:v60];
        v33 = [v70 accountConduit];
        [v33 performMoveRequests:v71 consumer:v32];

        [(MFDAMailAccountConsumer *)v32 waitUntilDone];
        id v34 = +[MFActivityMonitor currentMonitor];
        v35 = [(MFDAMoveResponseConsumer *)v32 error];
        [v34 setError:v35];

        uint64_t v36 = [(MFDAMoveResponseConsumer *)v32 statusCode];
        if ([(MFDAMailAccountConsumer *)v32 shouldRetryRequest])
        {
          id v37 = 0;
        }
        else
        {
          v48 = objc_opt_new();
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke;
          v81[3] = &unk_1E5D3E4F8;
          id v82 = v60;
          id v49 = v64;
          id v83 = v49;
          id v84 = v63;
          id v58 = v65;
          id v85 = v58;
          id v50 = v48;
          id v86 = v50;
          [v25 enumerateKeysAndObjectsUsingBlock:v81];
          v51 = DALoggingwithCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v96 = v58;
            __int16 v97 = 2112;
            id v98 = v49;
            __int16 v99 = 2048;
            uint64_t v100 = v36;
            _os_log_impl(&dword_1A7EFF000, v51, OS_LOG_TYPE_INFO, "Transfer action completed with successful items: %@. Failed items: %@. StatusCode: %lu", buf, 0x20u);
          }

          v52 = v32;
          if ([v49 count] && v36 == 15)
          {
            v53 = DALoggingwithCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7EFF000, v53, OS_LOG_TYPE_DEFAULT, "Transfer failed with Invalid Source Error. Moving the messages locally", buf, 2u);
            }

            [v58 addObjectsFromArray:v49];
            [v49 removeAllObjects];
            v54 = +[MFActivityMonitor currentMonitor];
            [v54 setError:0];

            v52 = v32;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F60918]);
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_23;
          v76[3] = &unk_1E5D3E4B0;
          id v77 = v58;
          id v56 = v50;
          id v78 = v56;
          id v79 = v49;
          v80 = v52;
          id v37 = (void *)[v55 initWithBuilder:v76];
        }
        id v47 = v60;
      }
      else
      {
        id v46 = objc_alloc(MEMORY[0x1E4F60918]);
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2_24;
        v74[3] = &unk_1E5D3E460;
        id v75 = v7;
        id v37 = (void *)[v46 initWithBuilder:v74];
        id v47 = v75;
      }

      goto LABEL_53;
    }
  }
  else
  {
  }
  uint64_t v38 = [v69 account];
  id v39 = +[LocalAccount localAccount];
  if ((void *)v38 != v39)
  {
    id v65 = (id)v38;
    id v37 = 0;

LABEL_53:
    goto LABEL_54;
  }
  id v40 = [v67 account];
  if (v40 != v70)
  {
    id v65 = (id)v38;

    id v37 = 0;
    v41 = (void *)v38;
LABEL_41:

    goto LABEL_53;
  }
  id v42 = (void *)v38;
  BOOL v43 = [v67 type] == 3;

  if (v43)
  {
    objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_28);
    id v65 = (id)objc_claimAutoreleasedReturnValue();
    v44 = [v70 library];
    [v44 compactMessages:v65];

    id v45 = objc_alloc(MEMORY[0x1E4F60918]);
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_4;
    v72[3] = &unk_1E5D3E460;
    id v73 = v7;
    id v37 = (void *)[v45 initWithBuilder:v72];
    v41 = v73;
    goto LABEL_41;
  }
  id v37 = 0;
LABEL_54:

  return v37;
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] containsObject:v5])
  {
    [a1[5] addObject:v6];
  }
  else
  {
    id v7 = [a1[6] objectForKeyedSubscript:v5];
    if (v7)
    {
      [a1[7] addObject:v6];
      id v8 = objc_alloc(MEMORY[0x1E4F608D8]);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2;
      v15 = &unk_1E5D3E488;
      char v16 = v6;
      id v17 = v7;
      uint64_t v9 = (void *)[v8 initWithServerMessageBuilder:&v12];
      objc_msgSend(a1[8], "addObject:", v9, v12, v13, v14, v15);

      uint64_t v10 = v16;
    }
    else
    {
      uint64_t v10 = DALoggingwithCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v6 destinationMessage];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "message %@ was successfully transferred, but we don't have a new remote ID for it", buf, 0xCu);
      }
    }
  }
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) destinationMessage];
  id v4 = [v3 persistentID];
  [v5 setMessagePersistentID:v4];

  [v5 setRemoteID:*(void *)(a1 + 40)];
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_23(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:3];
  [v4 setCompletedItems:*(void *)(a1 + 32)];
  [v4 setCreatedServerMessages:*(void *)(a1 + 40)];
  [v4 setFailedItems:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 56) error];
  [v4 setError:v3];
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:3];
  [v3 setFailedItems:*(void *)(a1 + 32)];
}

id __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 sourceMessage];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:3];
  [v3 setCompletedItems:*(void *)(a1 + 32)];
}

- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5 = a3;
  id v6 = [(MFDATransferActionReplayer *)self store];
  id v7 = [v6 fetchBodyDataForRemoteID:v5];

  return v7;
}

- (BOOL)downloadFailed
{
  id v3 = [(ECLocalActionReplayer *)self error];
  if (v3) {
    BOOL v4 = ![(MFDATransferActionReplayer *)self isRecoverableError:v3];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isRecoverableError:(id)a3
{
  id v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F5E920]] ^ 1;

  return v4;
}

- (MFDAMessageStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end