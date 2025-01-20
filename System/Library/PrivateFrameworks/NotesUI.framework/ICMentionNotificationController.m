@interface ICMentionNotificationController
+ (_NSRange)rangeOfMention:(id)a3;
+ (_NSRange)rangeOfParagraphForMention:(id)a3;
+ (_NSRange)rangeOfSentenceAfterMention:(id)a3;
+ (_NSRange)rangeOfSentenceBeforeMention:(id)a3;
+ (_NSRange)rangeOfSentenceForMention:(id)a3;
+ (_NSRange)rangeOfSnippetForMentions:(id)a3;
+ (id)coalesceMentions:(id)a3;
+ (id)noteTitleForMentions:(id)a3;
+ (id)pendingMentionsInContext:(id)a3 createdBeforeDate:(id)a4;
+ (id)predicateForMentionsInState:(int)a3 inContext:(id)a4;
+ (id)sameNoteMentionsFrom:(id)a3;
+ (id)senderNameForMentions:(id)a3;
+ (id)sharedController;
+ (id)snippetForMentions:(id)a3;
+ (void)triggerNotificationForMentionAttachments:(id)a3 context:(id)a4;
- (OS_dispatch_queue)notificationSerialQueue;
- (void)listenForReachabilityChange;
- (void)reachabilityChanged:(id)a3;
- (void)sendPendingNotifications;
- (void)sendPendingNotificationsCreatedBefore:(id)a3;
@end

@implementation ICMentionNotificationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __51__ICMentionNotificationController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(ICMentionNotificationController);
  sharedController_sharedController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (OS_dispatch_queue)notificationSerialQueue
{
  if (notificationSerialQueue_onceToken != -1) {
    dispatch_once(&notificationSerialQueue_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)notificationSerialQueue_queue;
  return (OS_dispatch_queue *)v2;
}

void __58__ICMentionNotificationController_notificationSerialQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.mentionNotificationQueue", v2);
  v1 = (void *)notificationSerialQueue_queue;
  notificationSerialQueue_queue = (uint64_t)v0;
}

- (void)listenForReachabilityChange
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F838C0];
  v5 = [MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection];
  [v3 addObserver:self selector:sel_reachabilityChanged_ name:v4 object:v5];

  [(ICMentionNotificationController *)self sendPendingNotifications];
}

- (void)reachabilityChanged:(id)a3
{
  uint64_t v4 = dispatch_get_global_queue(9, 0);
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICMentionNotificationController_reachabilityChanged___block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_after(v5, v4, block);
}

uint64_t __55__ICMentionNotificationController_reachabilityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendPendingNotifications];
}

- (void)sendPendingNotifications
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(ICMentionNotificationController *)self sendPendingNotificationsCreatedBefore:v3];
}

- (void)sendPendingNotificationsCreatedBefore:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(ICMentionNotificationController *)self notificationSerialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke;
  v7[3] = &unk_1E5FD91D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection];
  uint64_t v3 = [v2 currentReachabilityStatus];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F83428] sharedContext];
    dispatch_time_t v5 = [v4 workerManagedObjectContext];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2;
    v9[3] = &unk_1E5FD8FE8;
    id v10 = v5;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = v6;
    uint64_t v12 = v7;
    os_log_t v8 = v5;
    [v8 performBlockAndWait:v9];
  }
  else
  {
    os_log_t v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_cold_1();
    }
  }
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[ICMentionNotificationController pendingMentionsInContext:*(void *)(a1 + 32) createdBeforeDate:*(void *)(a1 + 40)];
  uint64_t v3 = os_log_create("com.apple.notes", "Mentions");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2_cold_1((uint64_t *)(a1 + 40), (uint64_t)v2, v3);
  }

  id v4 = +[ICMentionNotificationController coalesceMentions:v2];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v9;
          _os_log_debug_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_DEBUG, "Attempting to send notification for coalesced mentions: %@", buf, 0xCu);
        }

        [(id)objc_opt_class() triggerNotificationForMentionAttachments:v9 context:*(void *)(a1 + 32)];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v6);
  }
}

+ (void)triggerNotificationForMentionAttachments:(id)a3 context:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = [v7 tokenContentIdentifier];
  uint64_t v9 = [v7 note];
  id v10 = [v9 folder];
  long long v11 = [v10 account];
  long long v12 = [v11 identifier];

  v88 = (void *)v8;
  long long v13 = [v9 participantForUserID:v8];
  long long v14 = [v7 serverShareCheckingParent];
  v15 = [v14 recordID];
  uint64_t v16 = [v15 recordName];

  v17 = [v14 owner];
  v82 = objc_msgSend(v17, "ic_userRecordNameInNote:", v9);

  uint64_t v18 = [v9 recordID];
  v87 = [v18 recordName];

  v19 = [v7 recordID];
  v83 = [v19 recordName];

  v86 = (void *)v16;
  v81 = v14;
  if (!v16 || !v87 || !v88)
  {
    v26 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      +[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]();
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v21 = v5;
    uint64_t v27 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v106 != v29) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v105 + 1) + 8 * i) setMentionNotificationState:3];
        }
        uint64_t v28 = [v21 countByEnumeratingWithState:&v105 objects:v120 count:16];
      }
      while (v28);
    }
    goto LABEL_24;
  }
  if ([v13 isCurrentUser])
  {
    v20 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]();
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v21 = v5;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v101 objects:v119 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v102 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v101 + 1) + 8 * j) setMentionNotificationState:3];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v101 objects:v119 count:16];
      }
      while (v23);
    }
LABEL_24:

    objc_msgSend(v6, "ic_save");
    goto LABEL_48;
  }
  v75 = v13;
  v76 = v12;
  v77 = v9;
  v78 = v7;
  v79 = v6;
  id v80 = v5;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v98 = 0u;
  long long v97 = 0u;
  obuint64_t j = v5;
  uint64_t v31 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v98;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v98 != v33) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v97 + 1) + 8 * k);
        v36 = [v35 tokenContentIdentifier];
        char v37 = [v88 isEqualToString:v36];

        if ((v37 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E4F836F8];
          v39 = [v35 tokenContentIdentifier];
          [v38 handleFailedAssertWithCondition:"[recipientUserId isEqualToString:mention.tokenContentIdentifier]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, @"Mismatch triggering coalesced mention notification to %@, expecting %@", v39, v88 functionName simulateCrash showAlert format];
        }
        v40 = [v35 serverShareCheckingParent];
        v41 = [v40 recordID];
        v42 = [v41 recordName];
        char v43 = [v86 isEqualToString:v42];

        if ((v43 & 1) == 0)
        {
          v44 = (void *)MEMORY[0x1E4F836F8];
          v45 = [v35 serverShareCheckingParent];
          v46 = [v45 recordID];
          v47 = [v46 recordName];
          [v44 handleFailedAssertWithCondition:"[shareRecordName isEqualToString:mention.serverShareCheckingParent.recordID.recordName]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, @"Mismatch triggering coalesced mention notification for %@, expecting %@", v47, v86 functionName simulateCrash showAlert format];
        }
        v48 = [v35 note];
        v49 = [v48 recordID];
        v50 = [v49 recordName];
        char v51 = [v87 isEqualToString:v50];

        if ((v51 & 1) == 0)
        {
          v52 = (void *)MEMORY[0x1E4F836F8];
          v53 = [v35 note];
          v54 = [v53 recordID];
          v55 = [v54 recordName];
          [v52 handleFailedAssertWithCondition:"[noteRecordName isEqualToString:mention.note.recordID.recordName]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, @"Mismatch triggering coalesced mention notification for note %@, expecting %@", v55, v87 functionName simulateCrash showAlert format];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
    }
    while (v32);
  }

  uint64_t v56 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v83];
  v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v74 = (void *)v56;
  [v57 postNotificationName:@"ICMentionNotificationControllerWillSendNotification" object:v56];

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v58 = obj;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v93 objects:v117 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v94;
    id obja = v58;
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v94 != v61) {
          objc_enumerationMutation(v58);
        }
        v63 = *(void **)(*((void *)&v93 + 1) + 8 * m);
        [v63 setMentionNotificationState:2];
        objc_msgSend(v63, "setMentionNotificationAttemptCount:", objc_msgSend(v63, "mentionNotificationAttemptCount") + 1);
        v64 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          int v65 = [v63 mentionNotificationAttemptCount];
          v66 = [MEMORY[0x1E4F83310] sharedConfiguration];
          uint64_t v67 = [v66 mentionNotificationMaxRetries];
          v68 = objc_msgSend(v63, "ic_loggingIdentifier");
          *(_DWORD *)buf = 67109890;
          int v110 = v65;
          __int16 v111 = 2048;
          uint64_t v112 = v67;
          __int16 v113 = 2112;
          v114 = v88;
          __int16 v115 = 2112;
          v116 = v68;
          _os_log_debug_impl(&dword_1B08EB000, v64, OS_LOG_TYPE_DEBUG, "Attempt (%d/%lu) to send notification to participant (%@) for mention: %@", buf, 0x26u);

          id v58 = obja;
        }
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v93 objects:v117 count:16];
    }
    while (v60);
  }

  id v6 = v79;
  objc_msgSend(v79, "ic_save");
  v69 = [(id)objc_opt_class() senderNameForMentions:v58];
  v70 = [(id)objc_opt_class() noteTitleForMentions:v58];
  v71 = [(id)objc_opt_class() snippetForMentions:v58];
  v72 = [MEMORY[0x1E4F83320] sharedController];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke;
  v89[3] = &unk_1E5FDD868;
  id v90 = v79;
  id v91 = v58;
  id v92 = v74;
  id v73 = v74;
  long long v12 = v76;
  [v72 sendMentionNotificationToParticipant:v88 inlineAttachmentRecordName:v83 shareRecordName:v86 shareOwnerUserId:v82 accountId:v76 noteRecordName:v87 senderName:v69 noteTitle:v70 mentionSnippet:v71 callback:v89];

  id v5 = v80;
  uint64_t v9 = v77;
  uint64_t v7 = v78;
  long long v13 = v75;
LABEL_48:
}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2;
  v6[3] = &unk_1E5FDA5F8;
  id v4 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v9 = a1[4];
  id v10 = a1[6];
  id v5 = v3;
  [v4 performBlock:v6];
}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    id v20 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = os_log_create("com.apple.notes", "Mentions");
        id v10 = v9;
        if (!v8)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2_cold_1(v25, v7, &v26, v10);
          }

          long long v14 = v7;
          uint64_t v15 = 2;
          goto LABEL_14;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = objc_msgSend(v7, "ic_loggingIdentifier");
          v17 = *(void **)(a1 + 40);
          uint64_t v18 = [v17 userInfo];
          *(_DWORD *)buf = 138412802;
          uint64_t v28 = v16;
          __int16 v29 = 2112;
          v30 = v17;
          id v2 = v20;
          __int16 v31 = 2112;
          uint64_t v32 = v18;
          _os_log_error_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_ERROR, "Failed to send mention (%@) notification: %@ (userInfo=%@)", buf, 0x20u);
        }
        int v11 = [v7 mentionNotificationAttemptCount];
        long long v12 = [MEMORY[0x1E4F83310] sharedConfiguration];
        unint64_t v13 = [v12 mentionNotificationMaxRetries];

        long long v14 = v7;
        if (v13 > v11)
        {
          uint64_t v15 = 1;
LABEL_14:
          [v14 setMentionNotificationState:v15];
          continue;
        }
        [v7 setMentionNotificationState:3];
        [MEMORY[0x1E4F837E8] postBasicEvent:4];
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Unrecoverable failure sending mention notification"];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 48), "ic_save");
  v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:@"ICMentionNotificationControllerDidSendNotification" object:*(void *)(a1 + 56)];
}

+ (id)coalesceMentions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v28 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v28)
  {
    uint64_t v6 = *(void *)v33;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v9 = [v8 note];
        id v10 = [v9 identifier];

        int v11 = [v8 tokenContentIdentifier];
        if (v10 && ([v10 length] ? (BOOL v12 = v11 == 0) : (BOOL v12 = 1), !v12 && objc_msgSend(v11, "length")))
        {
          unint64_t v13 = [v10 stringByAppendingString:v11];
          if (!v13) {
            objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteParticipantParentKey) != nil)", "+[ICMentionNotificationController coalesceMentions:]", 1, 0, @"Expected non-nil value for '%s'", "noteParticipantParentKey");
          }
          long long v14 = [v8 parentAttachment];
          uint64_t v15 = [v14 identifier];

          if (v15)
          {
            uint64_t v16 = [v8 parentAttachment];
            v17 = [v16 identifier];
            [v13 stringByAppendingString:v17];
            id v18 = v5;
            uint64_t v20 = v19 = v4;

            unint64_t v13 = v20;
            id v4 = v19;
            id v5 = v18;
            uint64_t v6 = v27;
          }
          id v21 = [v4 objectForKeyedSubscript:v13];
          if (!v21)
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v4 setObject:v21 forKeyedSubscript:v13];
          }
          objc_msgSend(v21, "ic_addNonNilObject:", v8);
        }
        else
        {
          unint64_t v13 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            char v37 = v11;
            __int16 v38 = 2112;
            v39 = v10;
            _os_log_error_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_ERROR, "Coalesce mentions skipping mention of %@ in note %@", buf, 0x16u);
          }
        }
      }
      uint64_t v28 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v28);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__ICMentionNotificationController_coalesceMentions___block_invoke;
  v29[3] = &unk_1E5FDD8B8;
  id v30 = v25;
  id v31 = a1;
  id v22 = v25;
  [v4 enumerateKeysAndObjectsUsingBlock:v29];
  long long v23 = (void *)[v22 copy];

  return v23;
}

void __52__ICMentionNotificationController_coalesceMentions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v32 = [v3 firstObject];
  id v4 = [v32 parentAttachment];
  long long v33 = v3;
  if (v4)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          int v11 = [v10 parentAttachment];
          BOOL v12 = [v11 identifier];
          unint64_t v13 = [v4 identifier];

          if (v12 != v13)
          {
            long long v14 = (void *)MEMORY[0x1E4F836F8];
            uint64_t v15 = [v10 parentAttachment];
            uint64_t v16 = [v15 identifier];
            v17 = [v4 identifier];
            [v14 handleFailedAssertWithCondition:"mentionInParent.parentAttachment.identifier == parent.identifier", "+[ICMentionNotificationController coalesceMentions:]_block_invoke", 1, 0, @"Error trying to coalesce mentions by parent attachment got %@, expected %@", v16, v17 functionName simulateCrash showAlert format];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }

    id v18 = *(void **)(a1 + 32);
    id v19 = (void *)[v5 copy];
    [v18 addObject:v19];
  }
  else
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v3;
    uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          id v25 = *(void **)(a1 + 40);
          uint64_t v47 = v24;
          uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
          uint64_t v27 = [v25 rangeOfSnippetForMentions:v26];
          uint64_t v29 = v28;

          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v27, v29);
            id v31 = [v35 objectForKeyedSubscript:v30];
            if (!v31)
            {
              id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v35 setObject:v31 forKeyedSubscript:v30];
            }
            [v31 addObject:v24];
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v21);
    }

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __52__ICMentionNotificationController_coalesceMentions___block_invoke_2;
    v37[3] = &unk_1E5FDD890;
    id v38 = *(id *)(a1 + 32);
    id v19 = v35;
    [v35 enumerateKeysAndObjectsUsingBlock:v37];
  }
}

void __52__ICMentionNotificationController_coalesceMentions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)[a3 copy];
  [v3 addObject:v4];
}

+ (id)sameNoteMentionsFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 note];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ICMentionNotificationController_sameNoteMentionsFrom___block_invoke;
  v9[3] = &unk_1E5FDD8E0;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(v3, "ic_compactMap:", v9);

  return v7;
}

id __56__ICMentionNotificationController_sameNoteMentionsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 note];
  if (v4 == *(void **)(a1 + 32)) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)senderNameForMentions:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sameNoteMentionsFrom:v4];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count];

  if (v6 != v7)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ICMentionNotificationController senderNameForMentions:]();
    }
  }
  id v9 = [v5 firstObject];
  id v10 = [v9 note];

  if (!v10) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"note" functionName:"+[ICMentionNotificationController senderNameForMentions:]" simulateCrash:1 showAlert:0 format:@"Tried to get a sender name for mentions without a note"];
  }
  int v11 = [v10 serverShareCheckingParent];
  if (!v11) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"share" functionName:"+[ICMentionNotificationController senderNameForMentions:]" simulateCrash:1 showAlert:0 format:@"Tried to a sender name for a note without a share"];
  }
  BOOL v12 = [v11 currentUserParticipant];
  objc_msgSend(v12, "ic_shortParticipantName");
  unint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v14 = v13;
  if (!v13) {
    unint64_t v13 = &stru_1F0973378;
  }
  uint64_t v15 = v13;

  return v15;
}

+ (id)noteTitleForMentions:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sameNoteMentionsFrom:v4];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count];

  if (v6 != v7)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ICMentionNotificationController senderNameForMentions:]();
    }
  }
  id v9 = [v5 firstObject];
  id v10 = [v9 note];

  if (!v10) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"note" functionName:"+[ICMentionNotificationController noteTitleForMentions:]" simulateCrash:1 showAlert:0 format:@"Tried to get title for mentions without a note"];
  }
  int v11 = [v10 title];
  BOOL v12 = v11;
  if (!v11) {
    int v11 = &stru_1F0973378;
  }
  unint64_t v13 = v11;

  return v13;
}

+ (id)snippetForMentions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if (![v4 count])
  {
    int v11 = &stru_1F0973378;
    goto LABEL_10;
  }
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = [v6 note];

  uint64_t v8 = [v5 parentAttachment];
  id v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F832A0], "mentionNotificationSnippetForAttachmentType:", objc_msgSend(v8, "attachmentType"));
    objc_msgSend(v10, "ic_trimmedString");
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v12 = [a1 rangeOfSnippetForMentions:v4];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    uint64_t v16 = [v7 attributedString];
    id v10 = objc_msgSend(v16, "attributedSubstringFromRange:", v14, v15);

    v17 = [v7 managedObjectContext];
    id v18 = objc_msgSend(v10, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v17, &__block_literal_global_78);

    id v19 = [v18 string];
    objc_msgSend(v19, "ic_trimmedString");
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  int v11 = &stru_1F0973378;
LABEL_9:

LABEL_10:
  return v11;
}

id __54__ICMentionNotificationController_snippetForMentions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

+ (_NSRange)rangeOfSnippetForMentions:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 sameNoteMentionsFrom:v4];
  uint64_t v6 = [v5 count];
  if (v6 != [v4 count])
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ICMentionNotificationController senderNameForMentions:]();
    }
  }
  uint64_t v8 = [v5 firstObject];
  id v9 = [v8 note];

  if (!v9)
  {
    NSUInteger v30 = 0;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_93;
  }
  v81 = v9;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v102 count:16];
  v82 = v10;
  v77 = v5;
  id v79 = v4;
  if (!v11)
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v12 = v11;
  NSUInteger length = 0;
  uint64_t v14 = *(void *)v96;
  uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v96 != v14) {
        objc_enumerationMutation(v10);
      }
      NSUInteger v17 = objc_msgSend(a1, "rangeOfParagraphForMention:", *(void *)(*((void *)&v95 + 1) + 8 * i), v77, v79);
      v19.uint64_t location = v17;
      v19.NSUInteger length = v18;
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          continue;
        }
        v104.uint64_t location = location;
        v104.NSUInteger length = length;
        NSRange v19 = NSUnionRange(v104, v19);
      }
      uint64_t location = v19.location;
      NSUInteger length = v19.length;
      if (v19.length > 0xC8) {
        goto LABEL_19;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v95 objects:v102 count:16];
  }
  while (v12);

  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_20:
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (!v21)
    {
      NSUInteger length = 0;
      uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_34;
    }
    uint64_t v22 = v21;
    NSUInteger v23 = 0;
    uint64_t v24 = *(void *)v92;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v92 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = objc_msgSend(a1, "rangeOfSentenceForMention:", *(void *)(*((void *)&v91 + 1) + 8 * j), v77, v79);
        uint64_t location = v27;
        NSUInteger length = v28;
        if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
          v105.uint64_t location = v25;
          v105.NSUInteger length = v23;
          v111.uint64_t location = location;
          v111.NSUInteger length = length;
          NSRange v29 = NSUnionRange(v105, v111);
          uint64_t location = v29.location;
          NSUInteger length = v29.length;
        }
        NSUInteger v25 = location;
        NSUInteger v23 = length;
        if (length > 0xC8) {
          goto LABEL_34;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v91 objects:v101 count:16];
      NSUInteger length = v23;
      uint64_t location = v25;
      if (!v22)
      {
LABEL_34:

        id v10 = v82;
        break;
      }
    }
  }
  BOOL v32 = length > 0xC8 || location == 0x7FFFFFFFFFFFFFFFLL;
  id v9 = v81;
  if (!v32) {
    goto LABEL_55;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v33 = v10;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v87 objects:v100 count:16];
  uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  if (!v34)
  {
    NSUInteger length = 0;
    id v10 = v82;
    goto LABEL_54;
  }
  uint64_t v35 = v34;
  NSUInteger length = 0;
  uint64_t v36 = *(void *)v88;
  NSUInteger v37 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t k = 0; k != v35; ++k)
    {
      if (*(void *)v88 != v36) {
        objc_enumerationMutation(v33);
      }
      NSUInteger v39 = objc_msgSend(a1, "rangeOfMention:", *(void *)(*((void *)&v87 + 1) + 8 * k), v77, v79);
      v41.uint64_t location = v39;
      v41.NSUInteger length = v40;
      if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger length = v40;
        NSUInteger v37 = v39;
      }
      else if (v39 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v106.uint64_t location = v37;
        v106.NSUInteger length = length;
        NSRange v42 = NSUnionRange(v106, v41);
        NSUInteger v37 = v42.location;
        NSUInteger length = v42.length;
      }
    }
    uint64_t v35 = [v33 countByEnumeratingWithState:&v87 objects:v100 count:16];
  }
  while (v35);

  uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  id v10 = v82;
  if (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v33 = [v81 attributedString];
    v112.NSUInteger length = [v33 length];
    v107.uint64_t location = v37;
    v107.NSUInteger length = 200;
    v112.uint64_t location = 0;
    NSRange v43 = NSIntersectionRange(v107, v112);
    uint64_t location = v43.location;
    NSUInteger length = v43.length;
LABEL_54:
  }
LABEL_55:
  long long v44 = objc_msgSend(v81, "attributedString", v77, v79);
  long long v45 = [v44 string];
  int v46 = objc_msgSend(v45, "ic_rangeIsValid:", location, length);

  if (v46) {
    BOOL v47 = location == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v47 = 1;
  }
  if (v47
    && ([v10 firstObject],
        v48 = objc_claimAutoreleasedReturnValue(),
        uint64_t location = [a1 rangeOfMention:v48],
        NSUInteger length = v49,
        v48,
        location == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v50 = 0;
    uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    char v51 = [v81 attributedString];
    v52 = [v51 string];
    uint64_t v50 = objc_msgSend(v52, "substringWithRange:", location, length);
  }
  v53 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v54 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v53 formUnionWithCharacterSet:v54];

  v55 = [v50 stringByTrimmingCharactersInSet:v53];
  uint64_t v56 = [v55 length];

  if (v56 == 1)
  {
    v57 = [v82 firstObject];
    NSUInteger v58 = [a1 rangeOfSentenceBeforeMention:v57];
    NSUInteger v60 = v59;
    v113.uint64_t location = [a1 rangeOfSentenceAfterMention:v57];
    v113.NSUInteger length = v61;
    v108.uint64_t location = v58;
    v108.NSUInteger length = v60;
    NSRange v62 = NSUnionRange(v108, v113);
    uint64_t location = v62.location;
    if (v62.length >= 0xC8) {
      NSUInteger length = 200;
    }
    else {
      NSUInteger length = v62.length;
    }
  }
  if (length > 0xC8 || location == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v63 = v82;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      NSUInteger length = 0;
      uint64_t v66 = *(void *)v84;
      uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t m = 0; m != v65; ++m)
        {
          if (*(void *)v84 != v66) {
            objc_enumerationMutation(v63);
          }
          NSUInteger v68 = [a1 rangeOfMention:*(void *)(*((void *)&v83 + 1) + 8 * m)];
          v70.uint64_t location = v68;
          v70.NSUInteger length = v69;
          if (location == 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger length = v69;
            uint64_t location = v68;
          }
          else if (v68 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v109.uint64_t location = location;
            v109.NSUInteger length = length;
            NSRange v71 = NSUnionRange(v109, v70);
            uint64_t location = v71.location;
            NSUInteger length = v71.length;
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v83 objects:v99 count:16];
      }
      while (v65);
    }
    else
    {
      NSUInteger length = 0;
      uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    }

    if (length >= 0xC8) {
      NSUInteger length = 200;
    }
    id v9 = v81;
  }
  v72 = [v9 attributedString];
  id v73 = [v72 string];
  int v74 = objc_msgSend(v73, "ic_rangeIsValid:", location, length);
  if (v74) {
    uint64_t v31 = location;
  }
  else {
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v74) {
    NSUInteger v30 = length;
  }
  else {
    NSUInteger v30 = 0;
  }

  id v5 = v78;
  id v4 = v80;
LABEL_93:

  NSUInteger v75 = v31;
  NSUInteger v76 = v30;
  result.NSUInteger length = v76;
  result.uint64_t location = v75;
  return result;
}

+ (_NSRange)rangeOfMention:(id)a3
{
  id v3 = a3;
  id v4 = [v3 note];
  id v5 = [v4 attributedString];

  uint64_t v16 = 0;
  NSUInteger v17 = &v16;
  uint64_t v18 = 0x3010000000;
  NSRange v19 = &unk_1B0BF84BB;
  long long v20 = xmmword_1B0B987A0;
  uint64_t v6 = [v5 length];
  uint64_t v7 = *MEMORY[0x1E4F83248];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__ICMentionNotificationController_rangeOfMention___block_invoke;
  v13[3] = &unk_1E5FDA768;
  id v8 = v3;
  id v14 = v8;
  uint64_t v15 = &v16;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
  NSUInteger v9 = v17[4];
  NSUInteger v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.uint64_t location = v11;
  return result;
}

uint64_t __50__ICMentionNotificationController_rangeOfMention___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v16 = a2;
  uint64_t v9 = [v16 conformsToProtocol:&unk_1F09A5DB0];
  if (v9)
  {
    id v10 = v16;
    if ([MEMORY[0x1E4F834B0] isInlineAttachment:v10])
    {
      NSUInteger v11 = [*(id *)(a1 + 32) identifier];
      NSUInteger v12 = [v10 attachmentIdentifier];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        *(void *)(v14 + 32) = a3;
        *(void *)(v14 + 40) = a4;
        *a5 = 1;
      }
    }
  }
  return MEMORY[0x1F41817F8](v9);
}

+ (_NSRange)rangeOfParagraphForMention:(id)a3
{
  id v4 = a3;
  id v5 = [v4 note];
  uint64_t v6 = [v5 attributedString];

  uint64_t v7 = [a1 rangeOfMention:v4];
  uint64_t v9 = v8;

  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = 0;
  }
  else
  {
    NSUInteger v12 = [v6 string];
    uint64_t v10 = objc_msgSend(v12, "paragraphRangeForRange:", v7, v9);
    NSUInteger v11 = v13;
  }
  NSUInteger v14 = v10;
  NSUInteger v15 = v11;
  result.NSUInteger length = v15;
  result.uint64_t location = v14;
  return result;
}

+ (_NSRange)rangeOfSentenceForMention:(id)a3
{
  id v4 = a3;
  id v5 = [v4 note];
  uint64_t v6 = [v5 attributedString];

  uint64_t v7 = [a1 rangeOfMention:v4];
  uint64_t v9 = v8;

  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = 0;
  }
  else
  {
    NSUInteger v12 = [v6 string];
    uint64_t v10 = objc_msgSend(v12, "ic_sentenceRangeForRange:", v7, v9);
    NSUInteger v11 = v13;
  }
  NSUInteger v14 = v10;
  NSUInteger v15 = v11;
  result.NSUInteger length = v15;
  result.uint64_t location = v14;
  return result;
}

+ (_NSRange)rangeOfSentenceBeforeMention:(id)a3
{
  id v4 = a3;
  id v5 = [v4 note];
  uint64_t v6 = [v5 attributedString];
  uint64_t v7 = [v6 string];

  NSUInteger v8 = [a1 rangeOfMention:v4];
  NSUInteger v10 = v9;
  NSUInteger v11 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  NSUInteger v12 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v11 formUnionWithCharacterSet:v12];

  NSUInteger v13 = v8;
  do
  {
    if (!v13) {
      break;
    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    --v13;
  }
  while ((objc_msgSend(v11, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v13)) & 1) != 0);
  v20.uint64_t location = v13;
  v20.NSUInteger length = v10;
  v22.uint64_t location = v8;
  v22.NSUInteger length = v10;
  NSRange v14 = NSUnionRange(v20, v22);
  uint64_t v15 = objc_msgSend(v7, "ic_sentenceRangeForRange:", v14.location, v14.length);
  NSUInteger v17 = v16;

  NSUInteger v18 = v15;
  NSUInteger v19 = v17;
  result.NSUInteger length = v19;
  result.uint64_t location = v18;
  return result;
}

+ (_NSRange)rangeOfSentenceAfterMention:(id)a3
{
  id v4 = a3;
  id v5 = [v4 note];
  uint64_t v6 = [v5 attributedString];
  uint64_t v7 = [v6 string];

  NSUInteger v8 = [a1 rangeOfMention:v4];
  NSUInteger v10 = v9;
  NSUInteger v11 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  NSUInteger v12 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v11 formUnionWithCharacterSet:v12];

  NSUInteger v13 = v8;
  while (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)[v7 length] >= 2
      && v13 < [v7 length] - 2
      && (objc_msgSend(v11, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", ++v13)) & 1) != 0)
    {
      continue;
    }
    goto LABEL_8;
  }
  NSUInteger v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:
  v20.uint64_t location = v13;
  v20.NSUInteger length = v10;
  v22.uint64_t location = v8;
  v22.NSUInteger length = v10;
  NSRange v14 = NSUnionRange(v20, v22);
  uint64_t v15 = objc_msgSend(v7, "ic_sentenceRangeForRange:", v14.location, v14.length);
  NSUInteger v17 = v16;

  NSUInteger v18 = v15;
  NSUInteger v19 = v17;
  result.NSUInteger length = v19;
  result.uint64_t location = v18;
  return result;
}

+ (id)predicateForMentionsInState:(int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F833A0] predicateForMentionsInContext:a4];
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [NSNumber numberWithInt:v4];
  NSUInteger v8 = [v6 predicateWithFormat:@"mentionNotificationState == %@", v7];

  NSUInteger v9 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v5;
  v13[1] = v8;
  NSUInteger v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  NSUInteger v11 = [v9 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)pendingMentionsInContext:(id)a3 createdBeforeDate:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [a1 predicateForMentionsInState:1 inContext:v7];
  NSUInteger v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate <= %@", v6];

  NSUInteger v10 = (void *)MEMORY[0x1E4F833A0];
  NSUInteger v11 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v8;
  v16[1] = v9;
  NSUInteger v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  NSUInteger v13 = [v11 andPredicateWithSubpredicates:v12];
  NSRange v14 = objc_msgSend(v10, "ic_objectsMatchingPredicate:context:", v13, v7);

  return v14;
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not sending pending notifications because the internet is not reachable", v2, v3, v4, v5, v6);
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Pending mentions before %@: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)triggerNotificationForMentionAttachments:context:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Setting mention notification state to failed because the user mentioned theirself", v2, v3, v4, v5, v6);
}

+ (void)triggerNotificationForMentionAttachments:context:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Setting mention notification state to failed because the note is no longer shared or the recipient is invalid", v2, v3, v4, v5, v6);
}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend(a2, "ic_loggingIdentifier");
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B08EB000, a4, OS_LOG_TYPE_DEBUG, "Successfully sent notification for mention: %@", a1, 0xCu);
}

+ (void)senderNameForMentions:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "notificationSnippetForMentions passed mentions from more than one note", v2, v3, v4, v5, v6);
}

@end