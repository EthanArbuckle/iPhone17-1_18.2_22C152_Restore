@interface MFSearchableIndexPersistence_iOS
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (id)_verificationDataFromMessage:(id)a3 messageIDTransactionIDDictionary:(id)a4;
- (id)additionalFilterClause;
- (id)allMailboxIdentifiersForMessage:(id)a3;
- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5;
- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4;
- (id)statistics;
- (id)urlForMessageID:(id)a3;
- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3;
- (unint64_t)signpostID;
- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8;
- (void)moveMessagesToCorrectProtectionClassWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4;
@end

@implementation MFSearchableIndexPersistence_iOS

- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  v4 = +[MFSearchableIndexItem_iOS searchableIndexItemsFromMessages:a3 type:a4];
  return v4;
}

- (id)additionalFilterClause
{
  return @"likely(deleted = '0')";
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MFSearchableIndexPersistence_iOS_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1) {
    dispatch_once(&signpostLog_onceToken_2, block);
  }
  v2 = (void *)signpostLog_log_2;
  return (OS_os_log *)v2;
}

- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  int v8 = _os_feature_enabled_impl();
  v9 = +[MFMailMessageLibrary defaultInstance];
  v10 = v9;
  if (v8) {
    unsigned int v11 = 1087559;
  }
  else {
    unsigned int v11 = 1087495;
  }
  if (v6) {
    v12 = @"searchable_rebuild.ROWID";
  }
  else {
    v12 = 0;
  }
  if (v6) {
    uint64_t v13 = v11 | 0x800000;
  }
  else {
    uint64_t v13 = v11;
  }
  v14 = [v9 indexableMessagesWhere:v7 sortedBy:v12 limit:a5 options:v13];

  return v14;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MFSearchableIndexPersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1) {
    dispatch_once(&log_onceToken_32, block);
  }
  v2 = (void *)log_log_32;
  return (OS_os_log *)v2;
}

- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  if (v15)
  {
    v17 = +[MFMailMessageLibrary defaultInstance];
    v18 = [v14 stringValue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke;
    v20[3] = &unk_1E5D40828;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    [v17 fileURLForAttachmentPersistentID:v22 messageID:v18 result:v20];
  }
  else
  {
    v19 = +[MFSearchableIndexPersistence_iOS log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v12;
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_fault_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_FAULT, "Encountered an attachment without a name for attachmentID:%@ attachmentPersistentID:%{public}@ messagePersistentID:%{public}@", buf, 0x20u);
    }

    (*((void (**)(id, void, uint64_t))v16 + 2))(v16, 0, 1);
  }
}

- (id)_verificationDataFromMessage:(id)a3 messageIDTransactionIDDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F60C20]);
  int v8 = [v5 persistentID];
  v9 = [v6 objectForKeyedSubscript:v8];
  [v7 setTransactionID:v9];

  v10 = [v5 subject];
  unsigned int v11 = [v10 subjectWithoutPrefix];
  [v7 setSubject:v11];

  id v12 = [v5 dateReceived];
  [v7 setDateReceived:v12];

  id v13 = [v5 to];
  id v14 = objc_msgSend(v13, "ef_compactMap:", &__block_literal_global_59);
  [v7 setToEmailAddresses:v14];

  return v7;
}

- (id)allMailboxIdentifiersForMessage:(id)a3
{
  v3 = [MEMORY[0x1E4F60C30] mailboxIdentifiersForMessage:a3];
  return v3;
}

- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = [v4 allKeys];
  v17 = [v16 componentsJoinedByString:@","];
  v18 = (void *)[[NSString alloc] initWithFormat:@"deleted = '0' AND messages.ROWID IN (%@)", v17];
  id v6 = +[MFMailMessageLibrary defaultInstance];
  id v7 = [v6 indexableMessagesWhere:v18 sortedBy:0 limit:0 options:38917];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
        id v13 = [(MFSearchableIndexPersistence_iOS *)self _verificationDataFromMessage:v12 messageIDTransactionIDDictionary:v4];
        id v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v12, "libraryID"));
        [v19 setObject:v13 forKeyedSubscript:v14];

        id v4 = v5;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v19;
}

- (id)statistics
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v4 = [(MFSearchableIndexPersistence_iOS *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SEARCH INDEX STATISTICS", "Starting database queries for search index statistics", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v32 = buf;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__18;
  v35 = __Block_byref_object_dispose__18;
  id v36 = (id)0xAAAAAAAAAAAAAAAALL;
  id v36 = (id)objc_opt_new();
  id v5 = [(EDSearchableIndexPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[MFSearchableIndexPersistence_iOS statistics]"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke;
  v30[3] = &unk_1E5D3CC20;
  v30[4] = self;
  v30[5] = buf;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v30);

  id v7 = +[MFSearchableIndexPersistence_iOS signpostLog];
  os_signpost_id_t v8 = [(MFSearchableIndexPersistence_iOS *)self signpostID];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SEARCH INDEX STATISTICS", "Finished database queries for search index statistics", v37, 2u);
  }

  uint64_t v9 = +[MFMailMessageLibrary defaultInstance];
  uint64_t v10 = [v9 persistence];
  unsigned int v11 = [v10 searchableIndexManager];
  id v12 = [v11 scheduler];

  uint64_t v13 = [v12 isIndexingEnabledForTaskType:*MEMORY[0x1E4F60990]];
  id v14 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v15 = *MEMORY[0x1E4F60988];
  char v16 = [v12 isIndexingEnabledForActivityType:*MEMORY[0x1E4F60988]];
  v17 = (void *)MEMORY[0x1E4F60980];
  BOOL v18 = (v16 & 1) == 0
     && (([v12 isIndexingEnabledForActivityType:*MEMORY[0x1E4F60980]] | v13) & 1) == 0
     && [v12 budgetedItemCountRemaining] < 1;
  id v19 = [v14 numberWithInt:v18];
  [*((id *)v32 + 5) setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F5FFB8]];

  long long v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v12, "isIndexingEnabledForActivityType:", *v17));
  [*((id *)v32 + 5) setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F5FFE0]];

  long long v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v12, "isIndexingEnabledForActivityType:", v15));
  [*((id *)v32 + 5) setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F5FFF0]];

  long long v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
  [*((id *)v32 + 5) setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F5FFE8]];

  long long v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v12, "budgetedItemCountRemaining"));
  [*((id *)v32 + 5) setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F5FFA8]];

  id v24 = (void *)MEMORY[0x1E4F28ED0];
  [v12 budgetedTimeRemaining];
  uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
  [*((id *)v32 + 5) setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F5FFB0]];

  v26 = +[MFSearchableIndexPersistence_iOS log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *((void *)v32 + 5);
    *(_DWORD *)v37 = 138412290;
    uint64_t v38 = v27;
    _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "Generated search indexing statistics: %@", v37, 0xCu);
  }

  __int16 v28 = (void *)[*((id *)v32 + 5) copy];
  _Block_object_dispose(buf, 8);

  return v28;
}

- (id)urlForMessageID:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = +[MFMailMessageLibrary defaultInstance];
  id v5 = [v4 messageWithMessageID:v3 options:0 inMailbox:0];
  id v6 = [v4 dataPathForMessage:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];

  return v7;
}

- (void)moveMessagesToCorrectProtectionClassWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  id v36 = +[MFMailMessageLibrary defaultInstance];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(EDSearchableIndexPersistence *)self selectMessageIDsFromBacklogWithBatchSize:a3];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v10 = [v9 stringValue];
        unsigned int v11 = [v36 messageWithMessageID:v10 options:0 inMailbox:0];

        id v12 = [MEMORY[0x1E4F60C30] accountIdentifierForMessage:v11];
        [v34 addObject:v12];
        uint64_t v13 = [v9 stringValue];
        id v14 = [(MFSearchableIndexPersistence_iOS *)self urlForMessageID:v13];

        [v35 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v6);
  }

  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v30 = v34;
  uint64_t v15 = [v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v30);
        }
        BOOL v18 = +[MailAccount accountWithUniqueId:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        id v19 = (void *)MEMORY[0x1E4F1CB10];
        long long v20 = [v36 messageBasePathForAccount:v18];
        long long v21 = [v19 fileURLWithPath:v20 isDirectory:1];

        [v33 addObject:v21];
      }
      uint64_t v15 = [v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v15);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = v33;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8 * k);
        uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __104__MFSearchableIndexPersistence_iOS_moveMessagesToCorrectProtectionClassWithBatchSize_protectionHandler___block_invoke;
        v37[3] = &unk_1E5D40878;
        id v38 = v35;
        __int16 v28 = objc_msgSend(v27, "mf_verifyProtectionClassesForFilesInDirectory:usingBlock:", v26, v37);
        [v32 addEntriesFromDictionary:v28];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v23);
  }

  [v29 enqueueMovingFileProtections:v32];
}

@end