@interface MFMessagePersistence
@end

@implementation MFMessagePersistence

void __31__MFMessagePersistence_iOS_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;
}

uint64_t __49__MFMessagePersistence_iOS_defaultLibraryOptions__block_invoke()
{
  defaultLibraryOptions_defaultLibraryOptions = 7342143;
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    defaultLibraryOptions_defaultLibraryOptions |= 0x200020u;
  }
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    defaultLibraryOptions_defaultLibraryOptions |= 0x400000u;
  }
  return result;
}

uint64_t __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_2;
  v17[3] = &unk_1E5D3CDB0;
  uint64_t v4 = a1[4];
  v5 = (void *)a1[6];
  v17[4] = a1[5];
  id v18 = v5;
  id v16 = 0;
  [a2 executeSelectStatement:v4 withBlock:v17 error:&v16];
  id v6 = v16;
  if (v6)
  {
    v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_cold_1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[7];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Found attachment basepaths for messages %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

void __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 objectForKeyedSubscript:@"global_message_id"];
  uint64_t v4 = [v3 numberValue];

  v5 = [v15 objectForKeyedSubscript:@"mailbox"];
  id v6 = [v5 numberValue];

  v7 = (void *)MEMORY[0x1E4F1CB10];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v9 = objc_msgSend(WeakRetained, "urlForMailboxID:", objc_msgSend(v6, "longLongValue"));
  uint64_t v10 = [v7 URLWithString:v9];

  uint64_t v11 = +[MailAccount accountWithURL:v10];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = [v11 defaultPath];
  uint64_t v14 = [v12 URLWithString:v13];

  [*(id *)(a1 + 40) setObject:v14 forKey:v4];
}

void __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = [*(id *)(a1 + 32) summary];
    if (v6)
    {
    }
    else if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
    {
      [*(id *)(a1 + 48) generateSummaryForMessage:*(void *)(a1 + 32) downloadIfNecessary:1];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = [v5 securityInformation];
    uint64_t v8 = [v7 smimeError];
    if (v8 || ([v5 hasMoreContent] & 1) != 0)
    {
      int v9 = *(unsigned __int8 *)(a1 + 120);

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
LABEL_13:
    uint64_t v21 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "Skipping the retry for message content with network", buf, 2u);
    }

    [*(id *)(a1 + 96) setCompletedUnitCount:2];
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    goto LABEL_16;
  }
  if (!*(unsigned char *)(a1 + 120)) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v10 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 32) requestedRepresentation];
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Retrying the request %{public}@ content for message %{public}@ with network", buf, 0x16u);
  }
  uint64_t v13 = *(void **)(a1 + 48);
  if (v13) {
    uint64_t v13 = (void *)v13[20];
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 40);
  v17 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  v19 = [v17 messageTransformer];
  uint64_t v20 = +[MFMessageContentRequest onScheduler:v14 requestID:v15 requestContentForObjectID:v16 messagePersistence:v17 legacyMessage:v18 messageTransformer:v19 mailDropAttachmentGenerator:*(void *)(a1 + 64) listUnsubscribeHandler:*(void *)(a1 + 72) clientIdentifier:*(void *)(a1 + 80) options:*(void *)(a1 + 32) delegate:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 104)];

  [*(id *)(a1 + 96) addChild:v20 withPendingUnitCount:1];
LABEL_16:
}

uint64_t __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_68(uint64_t a1, void *a2)
{
  return [a2 setNetworkUsage:0];
}

void __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) summaryLoaderProvider];
  id v3 = [v2 messageSummaryLoaderForMessage:*(void *)(a1 + 40)];

  uint64_t v4 = [v3 requestSummaryImmediatelyFromDownloadedMessage:*(void *)(a1 + 40) downloadIfNecessary:*(unsigned __int8 *)(a1 + 48)];
  if (v4)
  {
    [*(id *)(a1 + 40) setSummary:v4];
    id v5 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
      id v7 = [*(id *)(a1 + 40) messageID];
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      _os_log_debug_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEBUG, "Generated summary (length=%{publid}@) for: %@ (summaryLoader=%p)", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    id v5 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 40) messageID];
      __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke_cold_1(v8, (uint64_t)v3, (uint8_t *)&v9, v5);
    }
  }
}

uint64_t __88__MFMessagePersistence_iOS__libraryMessageForMessageObjectID_preferNonOutgoingMessages___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mailbox];
  uint64_t v3 = [v2 isOutgoingMailboxUid] ^ 1;

  return v3;
}

uint64_t __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [(id)objc_opt_class() messagesTableName];
  id v6 = (void *)[v4 initWithResultColumn:@"global_message_id" table:v5];

  id v7 = (void *)MEMORY[0x1E4F60D08];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v8 = [v6 join:@"mailboxes" sourceColumn:@"mailbox" targetColumn:*MEMORY[0x1E4F60D08]];
    [v8 addResultColumn:@"url"];
  }
  int v9 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v10 = [(id)objc_opt_class() messagesTableName];
  __int16 v11 = [v9 table:v10 column:*v7];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 56)];
  __int16 v13 = [v11 equalTo:v12];
  [v6 setWhere:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke_2;
  v16[3] = &unk_1E5D40250;
  char v18 = *(unsigned char *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 40);
  uint64_t v14 = [v3 executeSelectStatement:v6 withBlock:v16 error:0];

  return v14;
}

void __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [v8 objectAtIndexedSubscript:1];
    uint64_t v5 = [v4 stringValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

id __106__MFMessagePersistence_iOS_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)MEMORY[0x1E4F28ED0];
  v2 = [*(id *)(a1 + 32) persistedMessageID];
  id v3 = objc_msgSend(v1, "numberWithLongLong:", objc_msgSend(v2, "databaseID"));

  return v3;
}

uint64_t __45__MFMessagePersistence_iOS_collectStatistics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 protectedDatabaseAttached];
  [*(id *)(a1 + 32) setProtectedDataAvailable:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MFMessagePersistence_iOS_collectStatistics__block_invoke_2;
  aBlock[3] = &unk_1E5D402C8;
  id v5 = v3;
  id v11 = v5;
  uint64_t v6 = (uint64_t (**)(void *, __CFString *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "setMessageData:", v6[2](v6, @"SELECT COUNT(*) FROM message_data"));
  objc_msgSend(*(id *)(a1 + 32), "setMessageDataDeleted:", v6[2](v6, @"SELECT COUNT(*) FROM message_data_deleted"));
  objc_msgSend(*(id *)(a1 + 32), "setMessagesMarkedAsJournaled:", v6[2](v6, @"SELECT COUNT(*) FROM messages WHERE journaled = '1'"));
  objc_msgSend(*(id *)(a1 + 32), "setMailboxesNeedingReconcilication:", v6[2](v6, @"SELECT COUNT(*) FROM mailboxes WHERE reconcile = '1'"));
  if (v4) {
    objc_msgSend(*(id *)(a1 + 32), "setProtectedMessageData:", v6[2](v6, @"SELECT COUNT(*) FROM protected_message_data"));
  }
  id v7 = EMLogSearchableIndexStatus();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "Persistence statistics: %{public}@", buf, 0xCu);
  }

  return 1;
}

uint64_t __45__MFMessagePersistence_iOS_collectStatistics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) preparedStatementForQueryString:v3];
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    if (sqlite3_step(v5) == 100) {
      uint64_t v6 = sqlite3_column_int(v5, 0);
    }
    else {
      uint64_t v6 = 0;
    }
    sqlite3_reset(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to generate summary for %@ (summaryLoader=%p)", buf, 0x16u);
}

@end