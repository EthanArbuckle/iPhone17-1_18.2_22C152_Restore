@interface MFMessagePersistence_iOS
+ (OS_os_log)log;
- (MFMessagePersistence_iOS)initWithMailboxPersistence:(id)a3 database:(id)a4 userProfileProvider:(id)a5 blockedSenderManager:(id)a6 vipReader:(id)a7 hookRegistry:(id)a8 library:(id)a9;
- (MFMessageSummaryLoaderProvider)summaryLoaderProvider;
- (id)_libraryMessageForMessageObjectID:(id)a3 preferNonOutgoingMessages:(BOOL)a4;
- (id)_requestSummaryForLibraryMessage:(id)a3;
- (id)baseMessageForOutgoingMessage:(id)a3 isDraft:(BOOL)a4;
- (id)cachedDatabaseIDsDictionaryForGlobalMessageIDs:(id)a3;
- (id)collectStatistics;
- (id)createContextForIteration;
- (id)enabledAccountMailboxesExpression;
- (id)expressionForFilteringUnavailableMessages;
- (id)expressionForFindingOnlyJournaledMessages;
- (id)flagsForLegacyFlags:(int64_t)a3 numberOfAttachments:(int64_t *)a4;
- (id)fullDataIfAvailableForMessage:(id)a3;
- (id)library;
- (id)libraryMessageForMessageObjectID:(id)a3;
- (id)messageIDsWithBasePaths:(id)a3;
- (id)persistedMessageForSQLRow:(id)a3 connection:(id)a4 iterationContext:(id)a5;
- (id)requestContentForMessageObjectID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7;
- (id)requestSummaryForMessageObjectID:(id)a3;
- (int64_t)globalIDForMessageWithDatabaseID:(int64_t)a3 mailboxScope:(id *)a4;
- (void)generateSummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)setContentProtectionForAttachmentFile:(id)a3;
- (void)setSummaryLoaderProvider:(id)a3;
@end

@implementation MFMessagePersistence_iOS

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MFMessagePersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1) {
    dispatch_once(&log_onceToken_24, block);
  }
  v2 = (void *)log_log_24;
  return (OS_os_log *)v2;
}

- (MFMessagePersistence_iOS)initWithMailboxPersistence:(id)a3 database:(id)a4 userProfileProvider:(id)a5 blockedSenderManager:(id)a6 vipReader:(id)a7 hookRegistry:(id)a8 library:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)MFMessagePersistence_iOS;
  v22 = [(MFMessagePersistence_iOS *)&v39 initWithMailboxPersistence:v15 database:v16 hookRegistry:v20 userProfileProvider:v17 blockedSenderManager:v18 vipReader:v19 gmailLabelPersistence:0];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_library, v21);
    v24 = [[MFMailMessageLibraryQueryTransformer alloc] initWithMessagePersistence:v23];
    queryTransformer = v23->_queryTransformer;
    v23->_queryTransformer = v24;

    uint64_t v26 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.messagePersistence.contentLoad.network" qualityOfService:17];
    networkContentLoadScheduler = v23->_networkContentLoadScheduler;
    v23->_networkContentLoadScheduler = (EFScheduler *)v26;

    uint64_t v28 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.messagePersistence.contentLoad.offline" qualityOfService:-1];
    offlineContentLoadScheduler = v23->_offlineContentLoadScheduler;
    v23->_offlineContentLoadScheduler = (EFScheduler *)v28;

    v23->_summaryLock._os_unfair_lock_opaque = 0;
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    summaryLoaders = v23->_summaryLoaders;
    v23->_summaryLoaders = v30;

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:500];
    obsoleteGlobalMessageIDToDatabaseIDMap = v23->_obsoleteGlobalMessageIDToDatabaseIDMap;
    v23->_obsoleteGlobalMessageIDToDatabaseIDMap = (EFLazyCache *)v32;

    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v36 = dispatch_queue_create("SummaryLoaderQueue", v35);
    requestSummaryQueue = v23->_requestSummaryQueue;
    v23->_requestSummaryQueue = (OS_dispatch_queue *)v36;

    [v20 registerMessageChangeHookResponder:v23];
  }

  return v23;
}

- (id)messageIDsWithBasePaths:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = @"global_message_id";
  v26[1] = @"mailbox";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v7 = [v6 componentsJoinedByString:@","];

  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v9 = [MEMORY[0x1E4F60E78] column:v7];
  v10 = (void *)[v8 initWithResult:v9 table:@"messages"];

  v11 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  v12 = [v11 in:v4];
  [v10 setWhere:v12];

  v13 = [(MFMessagePersistence_iOS *)self database];
  v14 = [NSString stringWithUTF8String:"-[MFMessagePersistence_iOS messageIDsWithBasePaths:]"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke;
  v21[3] = &unk_1E5D3CBF8;
  id v15 = v10;
  id v22 = v15;
  v23 = self;
  id v16 = v5;
  id v24 = v16;
  id v17 = v4;
  id v25 = v17;
  objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v21);

  id v18 = v25;
  id v19 = v16;

  return v19;
}

- (id)baseMessageForOutgoingMessage:(id)a3 isDraft:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 messageData];
  v6 = +[MFMessage messageWithRFC822Data:v5];

  if (v4)
  {
    [v6 markAsViewed];
    objc_msgSend(v6, "setMessageFlags:", objc_msgSend(v6, "messageFlags") | 0x40);
    v7 = [v6 senders];
    id v8 = [v7 firstObject];
    v9 = +[MailAccount accountContainingEmailAddress:v8];

    v10 = [v9 mailboxUidOfType:5 createIfNeeded:1];
    v11 = [v9 storeForMailboxUid:v10];
    [v11 openSynchronously];
  }
  return v6;
}

- (id)expressionForFindingOnlyJournaledMessages
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MFMessagePersistence_iOS;
  v2 = [(MFMessagePersistence_iOS *)&v13 expressionForFilteringUnavailableMessages];
  v3 = (void *)MEMORY[0x1E4F60EA8];
  BOOL v4 = (void *)MEMORY[0x1E4F60E78];
  id v5 = [MEMORY[0x1E4F60B40] messagesTableName];
  v6 = [v4 table:v5 column:@"journaled"];
  v7 = [v6 equalTo:&unk_1EFF514C8];
  id v8 = [v3 unlikely:v7];

  v9 = (void *)MEMORY[0x1E4F60E48];
  v14[0] = v2;
  v14[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v9 combined:v10];

  return v11;
}

- (id)expressionForFilteringUnavailableMessages
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MFMessagePersistence_iOS;
  v2 = [(MFMessagePersistence_iOS *)&v13 expressionForFilteringUnavailableMessages];
  v3 = (void *)MEMORY[0x1E4F60EA8];
  BOOL v4 = (void *)MEMORY[0x1E4F60E78];
  id v5 = [MEMORY[0x1E4F60B40] messagesTableName];
  v6 = [v4 table:v5 column:@"journaled"];
  v7 = [v6 equalTo:&unk_1EFF514E0];
  id v8 = [v3 likely:v7];

  v9 = (void *)MEMORY[0x1E4F60E48];
  v14[0] = v2;
  v14[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v9 combined:v10];

  return v11;
}

- (id)requestContentForMessageObjectID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v67 = a5;
  id v62 = a6;
  v63 = (void (**)(id, void, id))a7;
  v66 = v12;
  objc_super v13 = [(MFMessagePersistence_iOS *)self _libraryMessageForMessageObjectID:v12 preferNonOutgoingMessages:1];
  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = [v67 cacheBehavior];
  if (v14 == 1)
  {
    v29 = [v13 messageStore];
    [v29 flushCacheForMessage:v13];
  }
  else if (v14 == 2)
  {
    id v15 = [v13 messageStore];
    [v15 flushCacheForMessage:v13];

    id v16 = -[MFMessagePersistence_iOS library]((id *)&self->super.super.isa);
    id v17 = [v16 dataDirectoryURLForMessage:v13];

    id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v18 removeItemAtURL:v17 error:0];

    uint64_t v19 = [(MFMessagePersistence_iOS *)self _libraryMessageForMessageObjectID:v12 preferNonOutgoingMessages:1];

    objc_super v13 = (void *)v19;
    if (!v19)
    {
LABEL_5:
      id v20 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MFMessagePersistence_iOS requestContentForMessageObjectID:requestID:options:delegate:completionHandler:]((uint64_t)v12, v20, v21, v22, v23, v24, v25, v26);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", v12);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = 0;
      v63[2](v63, 0, v27);
      goto LABEL_17;
    }
  }
  v30 = EMLogCategoryMessageLoading();
  v58 = v13;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v67 requestedRepresentation];
    uint64_t v32 = objc_msgSend(v13, "ef_publicDescription");
    *(_DWORD *)buf = 138543874;
    v87 = v31;
    __int16 v88 = 2114;
    v89 = v32;
    __int16 v90 = 2114;
    id v91 = v12;
    _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "requesting %{public}@ content for message %{public}@ (%{public}@)", buf, 0x20u);
  }
  v57 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:2];
  BOOL v33 = [v67 networkUsage] != 0;
  v34 = [MEMORY[0x1E4F29268] currentConnection];
  v35 = EFBundleIdentifierForXPCConnection();
  dispatch_queue_t v36 = v35;
  if (v35)
  {
    id v56 = v35;
  }
  else
  {
    v37 = NSString;
    v38 = [MEMORY[0x1E4F29268] currentConnection];
    objc_msgSend(v37, "stringWithFormat:", @"client_%d", objc_msgSend(v38, "processIdentifier"));
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v55 = objc_alloc_init(MEMORY[0x1E4F60AF8]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  objc_super v39 = [WeakRetained persistence];
  v40 = [v39 listUnsubscribeHandler];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5D40198;
  id v41 = v58;
  id v82 = v41;
  id v42 = v57;
  id v83 = v42;
  v84 = self;
  v85 = v63;
  v43 = _Block_copy(aBlock);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_2;
  v68[3] = &unk_1E5D401C0;
  BOOL v80 = v33;
  id v44 = v67;
  id v69 = v44;
  id v45 = v66;
  id v70 = v45;
  v71 = self;
  unint64_t v79 = a4;
  id v27 = v41;
  id v72 = v27;
  id v60 = v55;
  id v73 = v60;
  id v65 = v40;
  id v74 = v65;
  id v59 = v56;
  id v75 = v59;
  id v46 = v62;
  id v76 = v46;
  id v54 = v43;
  id v78 = v54;
  id v47 = v42;
  id v77 = v47;
  v61 = _Block_copy(v68);
  v48 = (void *)[v44 copyWithBuilder:&__block_literal_global_71];
  if (self) {
    offlineContentLoadScheduler = self->_offlineContentLoadScheduler;
  }
  else {
    offlineContentLoadScheduler = 0;
  }
  v50 = offlineContentLoadScheduler;
  v51 = [(MFMessagePersistence_iOS *)self messageTransformer];
  v52 = +[MFMessageContentRequest onScheduler:v50 requestID:a4 requestContentForObjectID:v45 messagePersistence:self legacyMessage:v27 messageTransformer:v51 mailDropAttachmentGenerator:v60 listUnsubscribeHandler:v65 clientIdentifier:v59 options:v48 delegate:v46 completionHandler:v61];

  [v47 addChild:v52 withPendingUnitCount:1];
  id v28 = v47;

LABEL_17:
  return v28;
}

- (id)library
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)generateSummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 messageID];
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Requesting summary immediately for: %@ (download? %{BOOL}d)", buf, 0x12u);
  }
  if (self) {
    requestSummaryQueue = self->_requestSummaryQueue;
  }
  else {
    requestSummaryQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke;
  block[3] = &unk_1E5D40208;
  block[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  dispatch_async(requestSummaryQueue, block);
}

- (id)requestSummaryForMessageObjectID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFMessagePersistence_iOS *)self libraryMessageForMessageObjectID:v4];
  if (v5)
  {
    id v6 = [(MFMessagePersistence_iOS *)self _requestSummaryForLibraryMessage:v5];
  }
  else
  {
    v7 = +[MFMessagePersistence_iOS log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "Cannot create summary loader. No Library Message for object ID: %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)_requestSummaryForLibraryMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMessagePersistence_iOS *)self summaryLoaderProvider];
  id v6 = [v5 messageSummaryLoaderForMessage:v4];

  id v7 = (id)[v6 requestSummary];
  return v6;
}

- (id)libraryMessageForMessageObjectID:(id)a3
{
  v3 = [(MFMessagePersistence_iOS *)self _libraryMessageForMessageObjectID:a3 preferNonOutgoingMessages:0];
  return v3;
}

- (id)_libraryMessageForMessageObjectID:(id)a3 preferNonOutgoingMessages:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = [(MFMessagePersistence_iOS *)self persistedMessagesForMessageObjectIDs:v7 requireProtectedData:0 temporarilyUnavailableMessageObjectIDs:0];

  if (!v4
    || (objc_msgSend(v8, "ef_firstObjectPassingTest:", &__block_literal_global_79),
        (int v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v9 = [v8 firstObject];
  }
  id v10 = [v9 mailbox];
  uint64_t v11 = [v10 store];
  [v9 setMessageStore:v11];

  return v9;
}

- (id)enabledAccountMailboxesExpression
{
  v2 = -[MFMessagePersistence_iOS library]((id *)&self->super.super.isa);
  v3 = [v2 enabledAccountMailboxesExpression];

  return v3;
}

- (id)cachedDatabaseIDsDictionaryForGlobalMessageIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = -[EFLazyCache cachedObjectForKey:](self->_obsoleteGlobalMessageIDToDatabaseIDMap, "cachedObjectForKey:", v10, (void)v13);
        if (v11) {
          [v5 setObject:v10 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)setContentProtectionForAttachmentFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  id v10 = 0;
  char v6 = objc_msgSend(v4, "mf_protectFileAtPath:withClass:error:", v5, 2, &v10);
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = +[MFMessagePersistence_iOS log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v3 path];
      -[MFMessagePersistence_iOS setContentProtectionForAttachmentFile:](v9, (uint64_t)v7, buf, v8);
    }
  }
}

- (int64_t)globalIDForMessageWithDatabaseID:(int64_t)a3 mailboxScope:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = a4 != 0;
  uint64_t v32 = 0;
  BOOL v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__17;
  v30 = __Block_byref_object_dispose__17;
  id v31 = 0;
  uint64_t v8 = [(MFMessagePersistence_iOS *)self database];
  int v9 = [NSString stringWithUTF8String:"-[MFMessagePersistence_iOS globalIDForMessageWithDatabaseID:mailboxScope:]"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke;
  v24[3] = &unk_1E5D40278;
  BOOL v25 = v7;
  v24[4] = self;
  v24[5] = &v32;
  v24[6] = &v26;
  v24[7] = a3;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v24);

  if (a4)
  {
    if (v33[3])
    {
      if (v27[5])
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1CB10]);
        uint64_t v11 = (void *)[v10 initWithString:v27[5]];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v11];
        long long v13 = (void *)MEMORY[0x1E4F60318];
        v36[0] = v12;
        long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        *a4 = [v13 mailboxScopeForMailboxObjectIDs:v14 forExclusion:0];
      }
      else
      {
        *a4 = [MEMORY[0x1E4F60318] noMailboxesScope];
        long long v15 = +[MFMessagePersistence_iOS log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MFMessagePersistence_iOS globalIDForMessageWithDatabaseID:mailboxScope:](a3, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }
    else
    {
      *a4 = 0;
    }
  }
  int64_t v22 = v33[3];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

- (id)createContextForIteration
{
  v2 = objc_opt_new();
  return v2;
}

- (id)persistedMessageForSQLRow:(id)a3 connection:(id)a4 iterationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = -[MFMessagePersistence_iOS library]((id *)&self->super.super.isa);
  if (self)
  {
    if (defaultLibraryOptions_onceToken != -1) {
      dispatch_once(&defaultLibraryOptions_onceToken, &__block_literal_global_50);
    }
    self = (MFMessagePersistence_iOS *)defaultLibraryOptions_defaultLibraryOptions;
  }
  uint64_t v12 = objc_msgSend(v11, "_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:", v8, self, mach_absolute_time(), v9, objc_msgSend(v9, "protectedDatabaseAttached"), v10);

  long long v13 = [v12 mailbox];
  long long v14 = [v13 store];
  [v12 setMessageStore:v14];

  return v12;
}

- (id)flagsForLegacyFlags:(int64_t)a3 numberOfAttachments:(int64_t *)a4
{
  if ((unsigned __int16)a3 >> 10 == 63) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = (unsigned __int16)a3 >> 10;
  }
  *a4 = v4;
  return MFFlagsObjectForFlags(a3);
}

- (id)fullDataIfAvailableForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFMessagePersistence_iOS.m" lineNumber:373 description:@"Unexpected message class"];
  }
  char v10 = 0;
  char v6 = [v5 messageDataIsComplete:&v10 downloadIfNecessary:0];
  BOOL v7 = v6;
  if (!v10)
  {

    BOOL v7 = 0;
  }

  return v7;
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v8 = a5;
  obsoleteGlobalMessageIDToDatabaseIDMap = self->_obsoleteGlobalMessageIDToDatabaseIDMap;
  char v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __106__MFMessagePersistence_iOS_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
  v13[3] = &unk_1E5D402A0;
  id v11 = v8;
  id v14 = v11;
  id v12 = (id)[(EFLazyCache *)obsoleteGlobalMessageIDToDatabaseIDMap objectForKey:v10 generator:v13];
}

- (id)collectStatistics
{
  id v3 = objc_alloc_init(MFMessagePersistenceStatistics_iOS);
  v10.receiver = self;
  v10.super_class = (Class)MFMessagePersistence_iOS;
  [(MFMessagePersistence_iOS *)&v10 collectStatisticsWithStatistics:v3];
  int64_t v4 = [(MFMessagePersistence_iOS *)self database];
  id v5 = [NSString stringWithUTF8String:"-[MFMessagePersistence_iOS collectStatistics]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MFMessagePersistence_iOS_collectStatistics__block_invoke;
  v8[3] = &unk_1E5D3D068;
  char v6 = v3;
  id v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

- (MFMessageSummaryLoaderProvider)summaryLoaderProvider
{
  return self->_summaryLoaderProvider;
}

- (void)setSummaryLoaderProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSummaryQueue, 0);
  objc_storeStrong((id *)&self->_offlineContentLoadScheduler, 0);
  objc_storeStrong((id *)&self->_networkContentLoadScheduler, 0);
  objc_storeStrong((id *)&self->_queryTransformer, 0);
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_summaryLoaderProvider, 0);
  objc_storeStrong((id *)&self->_obsoleteGlobalMessageIDToDatabaseIDMap, 0);
  objc_storeStrong((id *)&self->_summaryLoaders, 0);
}

- (void)requestContentForMessageObjectID:(uint64_t)a3 requestID:(uint64_t)a4 options:(uint64_t)a5 delegate:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentProtectionForAttachmentFile:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Error setting the protection class on \"%@\": %@", buf, 0x16u);
}

- (void)globalIDForMessageWithDatabaseID:(uint64_t)a3 mailboxScope:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end