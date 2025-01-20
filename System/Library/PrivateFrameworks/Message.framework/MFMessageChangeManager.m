@interface MFMessageChangeManager
@end

@implementation MFMessageChangeManager

uint64_t __69__MFMessageChangeManager_iOS_messagesToJournalForMessages_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isSearchResultWithBogusRemoteId] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

void __96__MFMessageChangeManager_iOS_persistNewMessages_mailboxURL_oldMessagesByNewMessage_fromSyncing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
  {
    char v9 = 0;
    v7 = [v5 messageDataIsComplete:&v9 downloadIfNecessary:0];
    if (v7 && v9)
    {
      v8 = [*(id *)(a1 + 40) library];
      [v8 setData:v7 forMessageToAppend:v6];
    }
  }
}

uint64_t __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v2, "mailboxID"));

  return v3;
}

void __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v6 = [v5 absoluteString];
  v7 = +[MailAccount mailboxUidFromActiveAccountsForURL:v6];

  v8 = [v7 store];
  [v8 messagesWereDeleted:v9];
}

void __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v45 = a3;
  v40 = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F60310]);
  id v6 = [v4 URL];
  uint64_t v7 = [v5 initWithURL:v6];

  v8 = (void *)MEMORY[0x1E4F60318];
  v41 = (void *)v7;
  v66[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
  v43 = [v8 mailboxScopeForMailboxObjectIDs:v9 forExclusion:0];

  v10 = [*(id *)(a1 + 32) messagePersistence];
  v44 = [v10 messagesForPersistedMessages:v45 mailboxScope:v43];

  v42 = objc_msgSend(v44, "ef_compactMap:", &__block_literal_global_55);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v45;
  uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v11, "updateSubjectFromEncryptedContent", v40))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
          v13 = [v11 subject];
          v14 = [v13 subjectWithoutPrefix];
          [WeakRetained updateUnprefixedSubjectTo:v14 forMessage:v11];
        }
        uint64_t v15 = [v11 signatureInfo];
        v16 = (void *)v15;
        if (v15)
        {
          v49 = (void *)v15;
          id v17 = objc_alloc(MEMORY[0x1E4F601F0]);
          v18 = [v16 smimeCapabilities];
          v19 = [v16 signingDate];
          if (v18) {
            v20 = v18;
          }
          else {
            v20 = (void *)MEMORY[0x1E4F1CBF0];
          }
          v21 = (void *)[v17 initWithCapabilities:v20 date:v19];

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v22 = [v49 addresses];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v22);
                }
                v26 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                v27 = [*(id *)(a1 + 32) messagePersistence];
                id v28 = v26;
                v29 = [v28 emailAddressValue];
                v30 = [v29 simpleAddress];
                v31 = v30;
                if (v30)
                {
                  id v32 = v30;
                }
                else
                {
                  id v32 = [v28 stringValue];
                }
                v33 = v32;

                [v27 setMetadata:v21 forAddress:v33];
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v64 count:16];
            }
            while (v23);
          }

          v16 = v49;
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v48);
  }

  v34 = [MEMORY[0x1E4F5B6B8] keyPathForRecentEmails];
  v35 = (void *)[v42 copy];
  v36 = [MEMORY[0x1E4F5B6A8] userContext];
  [v36 setObject:v35 forKeyedSubscript:v34];

  v37 = [MEMORY[0x1E4F60B28] log];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = [v44 count];
    v39 = objc_msgSend(v41, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    uint64_t v61 = v38;
    __int16 v62 = 2114;
    v63 = v39;
    _os_log_impl(&dword_1A7EFF000, v37, OS_LOG_TYPE_DEFAULT, "Notifying CoreDuet about %lu new messages in %{public}@", buf, 0x16u);
  }
}

id __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_2(uint64_t a1, void *a2)
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v2 objectID];
  id v5 = [v4 serializedRepresentation];
  id v6 = [MEMORY[0x1E4F5B6B8] identifierKey];
  [v3 setObject:v5 forKeyedSubscript:v6];

  uint64_t v7 = [MEMORY[0x1E4F5B6B8] incomingKey];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];

  v8 = [v2 subject];
  id v9 = [v8 subjectWithoutPrefix];
  v10 = [MEMORY[0x1E4F5B6B8] subjectKey];
  [v3 setObject:v9 forKeyedSubscript:v10];

  v11 = [v2 senderAddress];
  v12 = [v11 emailAddressValue];
  v13 = [v12 simpleAddress];
  v14 = [MEMORY[0x1E4F5B6B8] senderKey];
  [v3 setObject:v13 forKeyedSubscript:v14];

  uint64_t v15 = [v2 toList];
  v16 = objc_msgSend(v15, "ef_compactMap:", &__block_literal_global_62);
  v30[0] = v16;
  id v17 = [v2 ccList];
  v18 = objc_msgSend(v17, "ef_compactMap:", &__block_literal_global_62);
  v30[1] = v18;
  v19 = [v2 bccList];
  v20 = objc_msgSend(v19, "ef_compactMap:", &__block_literal_global_62);
  v30[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v22 = objc_msgSend(v21, "ef_uniquifyWithComparator:", &__block_literal_global_65);

  uint64_t v23 = [MEMORY[0x1E4F5B6B8] recipientsKey];
  [v3 setObject:v22 forKeyedSubscript:v23];

  uint64_t v24 = [v2 mailboxes];
  v25 = [v24 firstObject];
  v26 = [v25 accountIdentifier];
  v27 = [v26 representedObjectID];
  id v28 = [MEMORY[0x1E4F5B6B8] accountIdentifierKey];
  [v3 setObject:v27 forKeyedSubscript:v28];

  return v3;
}

id __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 emailAddressValue];
  id v3 = [v2 simpleAddress];

  return v3;
}

uint64_t __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __123__MFMessageChangeManager_iOS_iterateMessagesInMailboxURLs_excludingMessages_batchSize_returnMessagesForFlagChange_handler___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = [v12 mailbox];
    id v4 = [v3 URL];

    id v5 = [v4 scheme];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F5FC38]];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
      unsigned int v8 = [v12 uid];
      if (!v7 || v8 < [v7 intValue])
      {
        id v9 = [v12 remoteID];
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v4];
      }
    }
    [*(id *)(a1 + 48) addObject:v12];
    if ([*(id *)(a1 + 48) count] == *(void *)(a1 + 64))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      v11 = (void *)[*(id *)(a1 + 48) copy];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      [*(id *)(a1 + 48) removeAllObjects];
    }
  }
}

@end