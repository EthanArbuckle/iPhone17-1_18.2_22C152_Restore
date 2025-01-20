@interface MFSearchableIndexPersistence
@end

@implementation MFSearchableIndexPersistence

void __39__MFSearchableIndexPersistence_iOS_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;
}

void __47__MFSearchableIndexPersistence_iOS_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;
}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v23 = +[MFSearchableIndexPersistence_iOS log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_2();
    }
    goto LABEL_12;
  }
  if (!v6)
  {
    v23 = +[MFSearchableIndexPersistence_iOS log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_1();
    }
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  v26 = +[EDSearchableIndexItem mailboxIdentifiersForMessage:v6];
  v25 = [MEMORY[0x1E4F60C30] domainIdentifierForMessage:v7];
  v24 = [MEMORY[0x1E4F60C30] accountIdentifierForMessage:v7];
  v8 = [v7 senders];
  v9 = [v8 firstObject];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [v7 to];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [v7 to];
    [v10 addObjectsFromArray:v13];
  }
  v14 = [v7 cc];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [v7 cc];
    [v10 addObjectsFromArray:v16];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F60C10]);
  uint64_t v18 = *(void *)(a1 + 56);
  v19 = [v7 messageIDHeader];
  v20 = [v7 dateReceived];
  v21 = [v7 dateSent];
  v22 = (void *)[v17 initWithAttachmentFileURL:v5 name:v18 domainIdentifier:v25 accountIdentifier:v24 mailboxIdentifiers:v26 messageIDHeader:v19 senderAddress:v9 recipientAddresses:v10 dateReceived:v20 dateSent:v21];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_13:
}

id __98__MFSearchableIndexPersistence_iOS__verificationDataFromMessage_messageIDTransactionIDDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F605B0] rawAddressFromFullAddress:a2];
  return v2;
}

uint64_t __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke_2;
  aBlock[3] = &unk_1E5D40850;
  id v4 = v3;
  id v29 = v4;
  id v5 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  id v6 = +[MFMailMessageLibrary defaultInstance];
  v7 = [v6 activeMailboxesClause];

  v8 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v9 = [*(id *)(a1 + 32) signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SEARCH INDEX STATISTICS", "Starting database query for messages to index", buf, 2u);
  }

  id v10 = [NSString stringWithFormat:@"SELECT COUNT(*) AS indexable_messages, SUM(CASE WHEN messages.searchable_message IS NULL THEN 1 ELSE 0 END) AS messages_to_index, SUM(CASE WHEN messages.searchable_message IS NOT NULL then 1 ELSE 0 END) as indexed_messages, SUM(CASE WHEN searchable_messages.message_body_indexed then 1 ELSE 0 END) as message_bodies_indexed  FROM messages       LEFT OUTER JOIN searchable_messages ON messages.searchable_message = searchable_messages.ROWID WHERE deleted = '0' %@", v7];
  id v11 = [v4 preparedStatementForQueryString:v10];
  uint64_t v12 = (sqlite3_stmt *)[v11 compiled];

  if (v12)
  {
    if (sqlite3_step(v12) == 100)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", sqlite3_column_int(v12, 0));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F5FFC8]];

      v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", sqlite3_column_int(v12, 1));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F60040]];

      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", sqlite3_column_int(v12, 2));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F60030]];

      v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", sqlite3_column_int(v12, 3));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F60000]];
    }
    sqlite3_reset(v12);
  }
  else
  {
    memset(buf, 170, sizeof(buf));
    *(_DWORD *)&buf[32] = 0;
    *(void *)v32 = 0xE00000001;
    int v33 = 1;
    pid_t v34 = getpid();
    size_t v30 = 648;
    if (!sysctl(v32, 4u, buf, &v30, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0) {
      __debugbreak();
    }
  }
  id v17 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v18 = [*(id *)(a1 + 32) signpostID];
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v17, OS_SIGNPOST_INTERVAL_END, v18, "SEARCH INDEX STATISTICS", "Finished database query for messages to index", buf, 2u);
  }

  v19 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v20 = [*(id *)(a1 + 32) signpostID];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SEARCH INDEX STATISTICS", "Starting database query for messages to reindex", buf, 2u);
  }

  v21 = v5[2](v5, @"SELECT COUNT(*) FROM searchable_rebuild");
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F60048]];

  v22 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v23 = [*(id *)(a1 + 32) signpostID];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v22, OS_SIGNPOST_INTERVAL_END, v23, "SEARCH INDEX STATISTICS", "Finished database query for messages to reindex", buf, 2u);
  }

  if ([v4 protectedDatabaseAttached])
  {
    v24 = v5[2](v5, @"SELECT COUNT(*) FROM message_attachments WHERE message_attachments.attachment IS NOT NULL");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F5FFC0]];

    v25 = v5[2](v5, @"SELECT COUNT(*) FROM searchable_attachments");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F5FF98]];

    v26 = v5[2](v5, @"SELECT COUNT(*) FROM message_attachments LEFT OUTER JOIN searchable_attachments ON (message_attachments.ROWID = searchable_attachments.attachment_id) WHERE searchable_attachments.attachment_id IS NULL AND message_attachments.attachment IS NOT NULL");;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F5FFA0]];
  }
  return 1;
}

id __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke_2(uint64_t a1, void *a2)
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
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];

  return v7;
}

id __104__MFSearchableIndexPersistence_iOS_moveMessagesToCorrectProtectionClassWithBatchSize_protectionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"emlx"];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) containsObject:v3];
    v7 = (id *)MEMORY[0x1E4F1C588];
    if (!v6) {
      v7 = (id *)MEMORY[0x1E4F1C578];
    }
    id v8 = *v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_7();
  _os_log_fault_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_FAULT, "Encountered a reference to a non-existent message in the attachments table for attachmentID:%{public}@ attachmentPersistentID:%{public}@ messageID:%{public}@ name:%@", v1, 0x2Au);
}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "Unable to retrieve a fileURL for a message in the attachments table for attachmentID:%{public}@ attachmentPersistentID:%{public}@ messageID:%{public}@ name:%@", v1, 0x2Au);
}

@end