@interface MFMessageChangeManager_iOS
- (BOOL)haveCompleteMIMEForMessage:(id)a3;
- (BOOL)mailboxIsAllMail:(id)a3;
- (BOOL)mailboxPartOfAllMail:(id)a3;
- (BOOL)persistNewMessages:(id)a3 mailboxURL:(id)a4 oldMessagesByNewMessage:(id)a5 fromSyncing:(BOOL)a6;
- (MFMailMessageLibrary)library;
- (MFMessageChangeManager_iOS)initWithLibrary:(id)a3 database:(id)a4 localActionPersistence:(id)a5 messagePersistence:(id)a6 serverMessagePersistenceFactory:(id)a7 readLaterPersistence:(id)a8 categoryPersistence:(id)a9 bimiManager:(id)a10 hookResponder:(id)a11 hookRegistry:(id)a12;
- (id)accountForMailboxURL:(id)a3;
- (id)addLabels:(id)a3 removeLabels:(id)a4 toMessagesInDatabase:(id)a5;
- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)applyFlagChange:(id)a3 toMessagesInDatabase:(id)a4;
- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)iterateMessagesInMailboxURLs:(id)a3 excludingMessages:(id)a4 batchSize:(unint64_t)a5 returnMessagesForFlagChange:(id)a6 handler:(id)a7;
- (id)messageForDatabaseID:(int64_t)a3;
- (id)messagesForRemoteIDs:(id)a3 mailboxURL:(id)a4;
- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4;
- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4;
- (int64_t)mailboxDatabaseIDForURL:(id)a3;
- (void)_recordFrecencyEventWithMailboxURL:(id)a3;
- (void)actionHasChangedAccount:(id)a3;
- (void)applyVIPStatus:(BOOL)a3 toMessagesInDatabase:(id)a4;
- (void)checkForNewActionsInMailboxID:(int64_t)a3;
- (void)deletePersistedMessages:(id)a3;
- (void)didFinishPersistenceDidAddMessages:(id)a3;
- (void)didReflectNewMessages:(id)a3;
- (void)messageWasAppended:(id)a3;
- (void)resetStatusCountsForMailboxWithURL:(id)a3;
- (void)setData:(id)a3 onMessage:(id)a4;
- (void)setLibrary:(id)a3;
- (void)setRemoteID:(id)a3 onMessageWithDatabaseID:(int64_t)a4;
- (void)willStartPersistenceDidAddMessages:(id)a3;
@end

@implementation MFMessageChangeManager_iOS

- (MFMessageChangeManager_iOS)initWithLibrary:(id)a3 database:(id)a4 localActionPersistence:(id)a5 messagePersistence:(id)a6 serverMessagePersistenceFactory:(id)a7 readLaterPersistence:(id)a8 categoryPersistence:(id)a9 bimiManager:(id)a10 hookResponder:(id)a11 hookRegistry:(id)a12
{
  id v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MFMessageChangeManager_iOS;
  v19 = [(EDMessageChangeManager *)&v22 initWithDatabase:a4 localActionPersistence:a5 messagePersistence:a6 serverMessagePersistenceFactory:a7 readLaterPersistence:a8 categoryPersistence:a9 bimiManager:a10 hookResponder:a11 hookRegistry:a12];
  v20 = v19;
  if (v19) {
    objc_storeWeak((id *)&v19->_library, v18);
  }

  return v20;
}

- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(MFMessageChangeManager_iOS *)self _recordFrecencyEventWithMailboxURL:v9];
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  v10 = [(EDMessageChangeManager *)&v12 moveMessages:v8 destinationMailboxURL:v9 userInitiated:v5];

  return v10;
}

- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(MFMessageChangeManager_iOS *)self _recordFrecencyEventWithMailboxURL:v9];
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  id v10 = [(EDMessageChangeManager *)&v12 copyMessages:v8 destinationMailboxURL:v9 userInitiated:v5];

  return v10;
}

- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(MFMessageChangeManager_iOS *)self _recordFrecencyEventWithMailboxURL:v9];
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  id v10 = [(EDMessageChangeManager *)&v12 addNewMessages:v8 mailboxURL:v9 userInitiated:v5];

  return v10;
}

- (void)_recordFrecencyEventWithMailboxURL:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v4];
    if (v5)
    {
      v6 = [(MFMessageChangeManager_iOS *)self library];
      v7 = [v6 mailboxFrecencyController];
      v9[0] = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v7 recordEventWithMailboxIDs:v8];
    }
  }
}

- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MFMessageChangeManager_iOS;
  id v4 = [(EDMessageChangeManager *)&v6 reflectNewMessages:a3 mailboxURL:a4];
  return v4;
}

- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4
{
  id v5 = a3;
  objc_super v6 = +[MailAccount accountWithURL:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v5, "ef_filter:", &__block_literal_global_44);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)persistNewMessages:(id)a3 mailboxURL:(id)a4 oldMessagesByNewMessage:(id)a5 fromSyncing:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v33 = a5;
  v13 = [v11 firstObject];
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if ((a5 & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"MFMessageChangeManager_iOS.m", 107, @"Invalid parameter not satisfying: %@", @"[messages.firstObject isKindOfClass:[MFMessage class]]" object file lineNumber description];
  }
  id v14 = v11;
  v15 = [v12 absoluteString];
  v16 = +[MailAccount mailboxUidFromActiveAccountsForURL:v15];

  if (a6)
  {
    i = 0;
  }
  else
  {
    uint64_t v18 = [v14 count];
    for (i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18]; v18; --v18)
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [i addObject:v19];
    }
  }
  BOOL v20 = [(EDMessageChangeManager *)self mailboxURLIsInRemoteAccount:v12];
  BOOL v21 = [v16 mailboxType] == 6;
  objc_super v22 = [v14 firstObject];
  v23 = [v22 mailbox];
  v24 = [v23 URL];

  if (v20) {
    char v25 = ![(EDMessageChangeManager *)self mailboxURL:v24 isInSameAccountAsMailboxURL:v12];
  }
  else {
    char v25 = 0;
  }
  v26 = objc_opt_new();
  v27 = [(MFMessageChangeManager_iOS *)self library];
  id v28 = (id)[v27 addMessages:v14 withMailbox:v16 newMessagesByOldMessage:v26 remoteIDs:i setFlags:0 addPOPUIDs:0 dataSectionsByMessage:0 generationWindow:0];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __96__MFMessageChangeManager_iOS_persistNewMessages_mailboxURL_oldMessagesByNewMessage_fromSyncing___block_invoke;
  v34[3] = &unk_1E5D3F7C8;
  id v29 = v33;
  char v37 = v25;
  BOOL v38 = v21;
  id v35 = v29;
  v36 = self;
  [v26 enumerateKeysAndObjectsUsingBlock:v34];
  BOOL v30 = [v26 count] != 0;

  return v30;
}

- (void)deletePersistedMessages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "ef_objectsPassingTest:", &__block_literal_global_37);
  if ([v5 count])
  {
    objc_super v6 = [MEMORY[0x1E4F60B28] log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Deleting persisted messages: %@", buf, 0xCu);
    }

    id v7 = [(MFMessageChangeManager_iOS *)self library];
    [v7 compactMessages:v5 permanently:1 notifyPersistence:0];

    id v8 = objc_msgSend(v5, "ef_groupBy:", &__block_literal_global_43);
    id v9 = [(MFMessageChangeManager_iOS *)self library];
    id v10 = [v8 allKeys];
    id v11 = [v9 mailboxURLsForIDs:v10];

    id v12 = [MEMORY[0x1E4F60B28] log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "Persisted messages were deleted { %@ }", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_45;
    v14[3] = &unk_1E5D3F810;
    id v13 = v11;
    id v15 = v13;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

- (BOOL)haveCompleteMIMEForMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = 0;
    id v5 = [(MFMessageChangeManager_iOS *)self library];
    char v6 = [v5 areMessageContentsLocallyAvailable:v4 fullContentsAvailble:&v9];

    if (v9) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)mailboxDatabaseIDForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMessageChangeManager_iOS *)self library];
  char v6 = [v4 absoluteString];
  int64_t v7 = [v5 mailboxIDForURLString:v6 createIfNecessary:1];

  return v7;
}

- (void)setRemoteID:(id)a3 onMessageWithDatabaseID:(int64_t)a4
{
  id v8 = a3;
  char v6 = [(MFMessageChangeManager_iOS *)self library];
  int64_t v7 = [v6 messageWithLibraryID:a4 options:7346239 inMailbox:0];

  [v7 setRemoteID:v8];
  [v7 commit];
}

- (void)setData:(id)a3 onMessage:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MFMessageChangeManager_iOS.m", 197, @"Invalid parameter not satisfying: %@", @"[message isKindOfClass:[MFLibraryMessage class]]" object file lineNumber description];
  }
  id v8 = [v7 mailbox];
  char v9 = [v8 URL];
  BOOL v10 = [(EDMessageChangeManager *)self mailboxURLIsInRemoteAccount:v9];

  id v11 = [(MFMessageChangeManager_iOS *)self library];
  if (v10) {
    [v11 setData:v13 forMessageToAppend:v7];
  }
  else {
    [v11 setData:v13 forMessage:v7 isPartial:0];
  }
}

- (void)checkForNewActionsInMailboxID:(int64_t)a3
{
  id v4 = [(MFMessageChangeManager_iOS *)self library];
  id v6 = [v4 urlForMailboxID:a3];

  id v5 = +[MailAccount accountWithURLString:v6];
  [v5 newActionsAdded];
}

- (void)actionHasChangedAccount:(id)a3
{
  id v5 = a3;
  v3 = [v5 mailboxURL];
  id v4 = +[MailAccount accountWithURL:v3];

  [v4 addNewAction:v5];
}

- (void)didReflectNewMessages:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MFMessageChangeManager_iOS;
  id v13 = a3;
  -[EDMessageChangeManager didReflectNewMessages:](&v19, sel_didReflectNewMessages_);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v13;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v10 = [v9 mailbox];
        if ([v10 type] == 7)
        {
          id v11 = [v4 objectForKeyedSubscript:v10];
          id v12 = v11;
          if (v11)
          {
            [v11 addObject:v9];
          }
          else
          {
            id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke;
  v14[3] = &unk_1E5D3F898;
  void v14[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v14];
}

- (void)messageWasAppended:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMessageChangeManager_iOS *)self library];
  [v4 increaseProtectionOnFileForMessage:v5];
}

- (void)resetStatusCountsForMailboxWithURL:(id)a3
{
  id v6 = [a3 absoluteString];
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:");
  if (([v4 shouldUseNonDeletedForUnreadCount] & 1) == 0)
  {
    id v5 = [(MFMessageChangeManager_iOS *)self library];
    [v5 setLastSyncAndMostRecentStatusCount:*MEMORY[0x1E4F5FD20] forMailbox:v6];
  }
}

- (id)applyFlagChange:(id)a3 toMessagesInDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 firstObject];
  id v8 = [v7 messageStore];

  char v9 = MFFlagChangeDictionaryForFlagChange(v5);
  BOOL v10 = [v8 setFlagsLocallyFromDictionary:v9 forMessages:v6];

  return v10;
}

- (void)applyVIPStatus:(BOOL)a3 toMessagesInDatabase:(id)a4
{
  BOOL v4 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MFMessageChangeManager_iOS *)self library];
  id v11 = @"MessageSenderIsVIP";
  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];
  v12[0] = v8;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = (id)[v7 setFlagsFromDictionary:v9 forMessages:v6];
}

- (id)addLabels:(id)a3 removeLabels:(id)a4 toMessagesInDatabase:(id)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)messageForDatabaseID:(int64_t)a3
{
  BOOL v4 = [(MFMessageChangeManager_iOS *)self library];
  id v5 = [v4 messageWithLibraryID:a3 options:7346239 inMailbox:0];

  return v5;
}

- (id)messagesForRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFMessageChangeManager_iOS *)self library];
  char v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  id v10 = [v7 absoluteString];
  id v11 = (void *)[v8 copyMessagesWithRemoteIDs:v9 options:7346239 inRemoteMailbox:v10];

  return v11;
}

- (id)iterateMessagesInMailboxURLs:(id)a3 excludingMessages:(id)a4 batchSize:(unint64_t)a5 returnMessagesForFlagChange:(id)a6 handler:(id)a7
{
  unint64_t v45 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v48 = a4;
  id v52 = a6;
  id v49 = a7;
  v51 = v10;
  v50 = objc_opt_new();
  if ([v10 count] == 1)
  {
    id v11 = [v10 firstObject];
    id v12 = [v11 absoluteString];
    id v13 = +[MFMessageCriterion criterionForMailboxURL:v12];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_super v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          BOOL v20 = objc_msgSend(v19, "absoluteString", v45);
          uint64_t v21 = +[MFMessageCriterion criterionForMailboxURL:v20];

          if (v21)
          {
            [v14 addObject:v21];
          }
          else
          {
            objc_super v22 = [MEMORY[0x1E4F60B28] log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              v23 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v19);
              -[MFMessageChangeManager_iOS iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:](v23, buf, &v65, v22);
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v16);
    }

    id v13 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v14];
  }
  v24 = objc_msgSend(MEMORY[0x1E4F608B8], "setRead", v45);
  int v25 = [v52 isEqual:v24];

  if (v25)
  {
    uint64_t v26 = +[MFMessageCriterion unreadMessageCriterion];
  }
  else
  {
    v27 = [MEMORY[0x1E4F608B8] clearRead];
    int v28 = [v52 isEqual:v27];

    if ((v28 & 1) == 0)
    {
      id v29 = [MEMORY[0x1E4F608B8] clearRead];
      char v30 = [v52 isEqual:v29];

      if ((v30 & 1) == 0)
      {
        v31 = [MEMORY[0x1E4F608B8] clearRead];
        int v32 = [v52 isEqual:v31];

        if (!v32)
        {
          id v33 = 0;
          goto LABEL_24;
        }
      }
    }
    uint64_t v26 = +[MFMessageCriterion readMessageCriterion];
  }
  id v33 = (void *)v26;
  if (v26)
  {
    v63[0] = v13;
    v63[1] = v26;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    uint64_t v35 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v34];

    id v13 = (void *)v35;
  }
LABEL_24:
  v36 = objc_opt_new();
  char v37 = [(MFMessageChangeManager_iOS *)self library];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __123__MFMessageChangeManager_iOS_iterateMessagesInMailboxURLs_excludingMessages_batchSize_returnMessagesForFlagChange_handler___block_invoke;
  v53[3] = &unk_1E5D3F8C0;
  id v38 = v48;
  id v54 = v38;
  id v39 = v50;
  id v55 = v39;
  id v40 = v36;
  id v56 = v40;
  uint64_t v58 = v46;
  v41 = (void (**)(id, id))v49;
  v57 = v41;
  [v37 iterateMessagesMatchingCriterion:v13 options:7346367 handler:v53];

  if ([v40 count]) {
    v41[2](v41, v40);
  }
  v42 = v57;
  id v43 = v39;

  return v43;
}

- (id)accountForMailboxURL:(id)a3
{
  v3 = [a3 absoluteString];
  BOOL v4 = +[MailAccount accountWithURLString:v3];

  return v4;
}

- (BOOL)mailboxIsAllMail:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 absoluteString];
  id v5 = +[MailAccount accountWithURL:v3];
  id v6 = +[MailAccount mailboxUidFromActiveAccountsForURL:v4];
  id v7 = [v5 baseAccount];
  if ([v7 isGmailAccount]) {
    BOOL v8 = [v6 type] == 2;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)mailboxPartOfAllMail:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 absoluteString];
  id v5 = +[MailAccount accountWithURL:v3];
  id v6 = +[MailAccount mailboxUidFromActiveAccountsForURL:v4];
  uint64_t v7 = [v6 type];
  BOOL v8 = [v5 baseAccount];
  char v9 = [v8 isGmailAccount];
  if ((unint64_t)(v7 - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)willStartPersistenceDidAddMessages:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageChangeManager_iOS;
  [(EDMessageChangeManager *)&v6 willStartPersistenceDidAddMessages:v4];
  id v5 = [(MFMessageChangeManager_iOS *)self library];
  [v5 willStartPersistenceDidAddMessages:v4];
}

- (void)didFinishPersistenceDidAddMessages:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageChangeManager_iOS;
  [(EDMessageChangeManager *)&v6 didFinishPersistenceDidAddMessages:v4];
  id v5 = [(MFMessageChangeManager_iOS *)self library];
  [v5 didFinishPersistenceDidAddMessages:v4];
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)iterateMessagesInMailboxURLs:(void *)a3 excludingMessages:(os_log_t)log batchSize:returnMessagesForFlagChange:handler:.cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "messagesInMailboxURLCriterion is nil for mailboxURL %{public}@", buf, 0xCu);
}

@end