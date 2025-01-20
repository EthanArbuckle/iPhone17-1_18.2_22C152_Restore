@interface TUCollaborationManager
- (BOOL)isCollaborationLocallyInitiatedForConversation:(id)a3;
- (BOOL)isIpad;
- (NSMutableDictionary)collaborationStateByIdentifier;
- (NSMutableDictionary)conversationsByHighlightIdentifier;
- (NSMutableDictionary)highlightsByIdentifier;
- (NSMutableDictionary)originatingParticipantByHighlightIdentifier;
- (NSMutableSet)pendingHighlightIdentifiers;
- (NSString)pendingCollaborationToAdd;
- (OS_dispatch_queue)queue;
- (TUCollaborationManager)initWithCollaborationProvider:(id)a3;
- (TUCollaborationManager)initWithCollaborationProvider:(id)a3 featureFlags:(id)a4 deviceSupport:(id)a5;
- (TUCollaborationManagerDelegate)delegate;
- (TUCollaborationProvider)collaborationProvider;
- (TUConversation)pendingConversationToAdd;
- (TUFeatureFlags)featureFlags;
- (id)collaborationForConversation:(id)a3;
- (int64_t)collaborationStateForConversation:(id)a3;
- (void)associateCollaborationWithNewConversation:(id)a3;
- (void)collaborationsDidChange:(id)a3;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)notifyDelegateOfHighlightChanged:(id)a3 onConversation:(id)a4;
- (void)participant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7;
- (void)participant:(id)a3 reAddedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5;
- (void)participant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5;
- (void)queueCollaborationIdentifierForCollaboration:(id)a3 toConversation:(id)a4;
- (void)setCollaborationState:(int64_t)a3 forCollaborationIdentifier:(id)a4;
- (void)setConversationsByHighlightIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightsByIdentifier:(id)a3;
- (void)setOriginatingParticipantByHighlightIdentifier:(id)a3;
- (void)setPendingCollaborationToAdd:(id)a3;
- (void)setPendingConversationToAdd:(id)a3;
- (void)setPendingHighlightIdentifiers:(id)a3;
- (void)startTrackingCollaborationIfNecessaryAndNotifyDelegate:(id)a3 forConversation:(id)a4;
- (void)stopTrackingHighlightForConversation:(id)a3;
- (void)vendNoticeForCollaboration:(id)a3 participant:(id)a4 forConversation:(id)a5 type:(int64_t)a6;
@end

@implementation TUCollaborationManager

- (TUCollaborationManager)initWithCollaborationProvider:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getFTDeviceSupportClass_softClass;
  uint64_t v15 = getFTDeviceSupportClass_softClass;
  if (!getFTDeviceSupportClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getFTDeviceSupportClass_block_invoke;
    v11[3] = &unk_1E58E5F90;
    v11[4] = &v12;
    __getFTDeviceSupportClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = [v6 sharedInstance];
  v8 = objc_alloc_init(TUFeatureFlags);
  v9 = [(TUCollaborationManager *)self initWithCollaborationProvider:v4 featureFlags:v8 deviceSupport:v7];

  return v9;
}

- (TUCollaborationManager)initWithCollaborationProvider:(id)a3 featureFlags:(id)a4 deviceSupport:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TUCollaborationManager;
  uint64_t v12 = [(TUCollaborationManager *)&v26 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.telephonyutilities.collaborationmanager", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_featureFlags, a4);
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    pendingHighlightIdentifiers = v12->_pendingHighlightIdentifiers;
    v12->_pendingHighlightIdentifiers = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    originatingParticipantByHighlightIdentifier = v12->_originatingParticipantByHighlightIdentifier;
    v12->_originatingParticipantByHighlightIdentifier = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    highlightsByIdentifier = v12->_highlightsByIdentifier;
    v12->_highlightsByIdentifier = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    conversationsByHighlightIdentifier = v12->_conversationsByHighlightIdentifier;
    v12->_conversationsByHighlightIdentifier = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    collaborationStateByIdentifier = v12->_collaborationStateByIdentifier;
    v12->_collaborationStateByIdentifier = (NSMutableDictionary *)v23;

    objc_storeStrong((id *)&v12->_collaborationProvider, a3);
    v12->_isIpad = [v11 deviceType] == 4;
    [v9 setDelegate:v12];
  }

  return v12;
}

- (void)queueCollaborationIdentifierForCollaboration:(id)a3 toConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUCollaborationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__TUCollaborationManager_queueCollaborationIdentifierForCollaboration_toConversation___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __86__TUCollaborationManager_queueCollaborationIdentifierForCollaboration_toConversation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) featureFlags];
  int v3 = [v2 gelatoEnabled];

  if (v3)
  {
    [*(id *)(a1 + 32) setPendingCollaborationToAdd:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(void **)(a1 + 32);
    [v5 setPendingConversationToAdd:v4];
  }
}

- (BOOL)isCollaborationLocallyInitiatedForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(TUCollaborationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__TUCollaborationManager_isCollaborationLocallyInitiatedForConversation___block_invoke;
  block[3] = &unk_1E58E65E0;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __73__TUCollaborationManager_isCollaborationLocallyInitiatedForConversation___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) originatingParticipantByHighlightIdentifier];
  v2 = [*(id *)(a1 + 40) highlightIdentifiers];
  int v3 = [v2 anyObject];
  id v4 = [v8 objectForKeyedSubscript:v3];
  v5 = [v4 handle];
  id v6 = [*(id *)(a1 + 40) localMember];
  id v7 = [v6 handle];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isEquivalentToHandle:v7];
}

- (void)collaborationsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(TUCollaborationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TUCollaborationManager_collaborationsDidChange___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__TUCollaborationManager_collaborationsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) featureFlags];
  int v3 = [v2 gelatoEnabled];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) pendingCollaborationToAdd];

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) collaborationProvider];
      id v6 = [*(id *)(a1 + 32) pendingCollaborationToAdd];
      id v7 = [v5 collaborationHighlightForIdentifier:v6];

      if (v7)
      {
        id v8 = TUDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v7;
          _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Pending collaboration fulfilled: %@", buf, 0xCu);
        }

        id v9 = [*(id *)(a1 + 32) delegate];
        id v10 = [*(id *)(a1 + 32) pendingConversationToAdd];
        [v9 addCollaboration:v7 forConversation:v10];

        [*(id *)(a1 + 32) setPendingCollaborationToAdd:0];
        [*(id *)(a1 + 32) setPendingConversationToAdd:0];
      }
    }
    uint64_t v11 = [*(id *)(a1 + 32) highlightsByIdentifier];
    id v12 = (void *)[v11 copy];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v65;
      *(void *)&long long v14 = 138412290;
      long long v58 = v14;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v65 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "collaborationHighlightForIdentifier:", v18, v58);
          v20 = [obj objectForKeyedSubscript:v18];
          uint64_t v21 = TUDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v70 = v19;
            __int16 v71 = 2112;
            v72 = v20;
            _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "highlight: %@ oldHighlight: %@", buf, 0x16u);
          }

          v22 = [*(id *)(a1 + 32) conversationsByHighlightIdentifier];
          uint64_t v23 = [v22 objectForKeyedSubscript:v18];

          v24 = [*(id *)(a1 + 32) originatingParticipantByHighlightIdentifier];
          v25 = [v24 objectForKeyedSubscript:v18];

          if (!v19)
          {
            v29 = TUDefaultLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v58;
              v70 = v18;
              _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "highlight with identifier: %@ removed from SWY", buf, 0xCu);
            }

            v30 = [*(id *)(a1 + 32) originatingParticipantByHighlightIdentifier];
            [v30 setObject:0 forKeyedSubscript:v18];

            v31 = [*(id *)(a1 + 32) highlightsByIdentifier];
            [v31 setObject:0 forKeyedSubscript:v18];

            v32 = [*(id *)(a1 + 32) pendingHighlightIdentifiers];
            [v32 addObject:v18];

            [*(id *)(a1 + 32) notifyDelegateOfHighlightChanged:0 onConversation:v23];
            v33 = *(void **)(a1 + 32);
            v34 = v20;
            v35 = v25;
            v36 = v23;
            uint64_t v37 = 16;
            goto LABEL_27;
          }
          if (!v20)
          {
            v38 = TUDefaultLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v58;
              v70 = v18;
              _os_log_fault_impl(&dword_19C496000, v38, OS_LOG_TYPE_FAULT, "highlight with identifier: %@ added to SWY - should not be possible to hit this case", buf, 0xCu);
            }

            v39 = [*(id *)(a1 + 32) highlightsByIdentifier];
            [v39 setObject:v19 forKeyedSubscript:v18];

            v40 = [*(id *)(a1 + 32) pendingHighlightIdentifiers];
            [v40 removeObject:v18];

            [*(id *)(a1 + 32) notifyDelegateOfHighlightChanged:v19 onConversation:v23];
            v33 = *(void **)(a1 + 32);
            v34 = v19;
            v35 = v25;
            v36 = v23;
            uint64_t v37 = 15;
LABEL_27:
            [v33 vendNoticeForCollaboration:v34 participant:v35 forConversation:v36 type:v37];
            goto LABEL_28;
          }
          if (([v19 isEqual:v20] & 1) == 0)
          {
            objc_super v26 = TUDefaultLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v19;
              __int16 v71 = 2112;
              v72 = v18;
              _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "highlight: %@ with identifier: %@ changed", buf, 0x16u);
            }

            v27 = [*(id *)(a1 + 32) highlightsByIdentifier];
            [v27 setObject:v19 forKeyedSubscript:v18];

            v28 = [*(id *)(a1 + 32) pendingHighlightIdentifiers];
            [v28 removeObject:v18];
          }
LABEL_28:
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v15);
    }

    v41 = [*(id *)(a1 + 32) pendingHighlightIdentifiers];
    v42 = (void *)[v41 copy];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v43 = v42;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v61 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          v49 = [*(id *)(a1 + 40) collaborationHighlightForIdentifier:v48];
          v50 = [*(id *)(a1 + 32) conversationsByHighlightIdentifier];
          v51 = [v50 objectForKeyedSubscript:v48];

          v52 = [*(id *)(a1 + 32) originatingParticipantByHighlightIdentifier];
          v53 = [v52 objectForKeyedSubscript:v48];

          if (v49) {
            BOOL v54 = v51 == 0;
          }
          else {
            BOOL v54 = 1;
          }
          if (!v54)
          {
            v55 = TUDefaultLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v49;
              __int16 v71 = 2112;
              v72 = v48;
              _os_log_impl(&dword_19C496000, v55, OS_LOG_TYPE_DEFAULT, "highlight: %@ with identifier: %@ added to SWY from pending", buf, 0x16u);
            }

            v56 = [*(id *)(a1 + 32) highlightsByIdentifier];
            [v56 setObject:v49 forKeyedSubscript:v48];

            v57 = [*(id *)(a1 + 32) pendingHighlightIdentifiers];
            [v57 removeObject:v48];

            [*(id *)(a1 + 32) startTrackingCollaborationIfNecessaryAndNotifyDelegate:v49 forConversation:v51];
            [*(id *)(a1 + 32) vendNoticeForCollaboration:v49 participant:v53 forConversation:v51 type:15];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v45);
    }
  }
}

- (void)vendNoticeForCollaboration:(id)a3 participant:(id)a4 forConversation:(id)a5 type:(int64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(TUCollaborationManager *)self queue];
  dispatch_assert_queue_V2(v13);

  long long v14 = [(TUCollaborationManager *)self featureFlags];
  int v15 = [v14 gelatoEnabled];

  if (v15)
  {
    if ([v12 avMode] == 1)
    {
      uint64_t v16 = TUDefaultLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [v10 identifier];
      int v22 = 138412290;
      uint64_t v23 = v17;
      _os_log_impl(&dword_19C496000, v16, OS_LOG_TYPE_DEFAULT, "Not posting a notice for collaboration: %@ since the conversation is avModeAudio", (uint8_t *)&v22, 0xCu);
    }
    else
    {
      v18 = [TUCollaborationNotice alloc];
      uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [(TUCollaborationNotice *)v18 initWithUUID:v19];

      [v16 setSessionEventType:a6];
      [v16 setCollaboration:v10];
      v20 = TUDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v10 collaborationIdentifier];
        int v22 = 138412802;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        v25 = v21;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Vending notice: %@ for collaboration: %@, for participant: %@", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v17 = [(TUCollaborationManager *)self delegate];
      [v17 conversation:v12 participant:v11 addedCollaborationNotice:v16];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)notifyDelegateOfHighlightChanged:(id)a3 onConversation:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(TUCollaborationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(TUCollaborationManager *)self featureFlags];
  int v9 = [v8 gelatoEnabled];

  if (v9)
  {
    id v10 = [(TUCollaborationManager *)self delegate];
    [v10 collaborationChanged:v11 forConversation:v6 collaborationState:-1];
  }
}

- (void)stopTrackingHighlightForConversation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TUCollaborationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 highlightIdentifiers];

  id v7 = [v6 anyObject];

  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to stop tracking highlight for conversation with collaboration Identifier: %@", (uint8_t *)&v14, 0xCu);
  }

  if (v7)
  {
    int v9 = [(TUCollaborationManager *)self pendingHighlightIdentifiers];
    [v9 removeObject:v7];

    id v10 = [(TUCollaborationManager *)self originatingParticipantByHighlightIdentifier];
    [v10 removeObjectForKey:v7];

    id v11 = [(TUCollaborationManager *)self highlightsByIdentifier];
    [v11 removeObjectForKey:v7];

    id v12 = [(TUCollaborationManager *)self conversationsByHighlightIdentifier];
    [v12 removeObjectForKey:v7];

    uint64_t v13 = [(TUCollaborationManager *)self collaborationStateByIdentifier];
    [v13 removeObjectForKey:v7];
  }
}

- (id)collaborationForConversation:(id)a3
{
  id v4 = a3;
  v5 = [(TUCollaborationManager *)self featureFlags];
  int v6 = [v5 gelatoEnabled];

  if (v6)
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__8;
    v18 = __Block_byref_object_dispose__8;
    id v19 = 0;
    id v7 = [(TUCollaborationManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TUCollaborationManager_collaborationForConversation___block_invoke;
    block[3] = &unk_1E58E74A0;
    id v12 = self;
    uint64_t v13 = &v14;
    id v11 = v4;
    dispatch_sync(v7, block);

    id v8 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __55__TUCollaborationManager_collaborationForConversation___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) highlightIdentifiers];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) highlightIdentifiers];
    v5 = [v4 anyObject];

    int v6 = [*(id *)(a1 + 40) pendingHighlightIdentifiers];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      id v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v18 = 138412546;
        id v19 = v5;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Highlight identifier: %@ is currently pending for conversation: %@", (uint8_t *)&v18, 0x16u);
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
    else
    {
      uint64_t v14 = [*(id *)(a1 + 40) collaborationProvider];
      uint64_t v15 = [v14 collaborationHighlightForIdentifier:v5];
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
}

- (int64_t)collaborationStateForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  v5 = [(TUCollaborationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TUCollaborationManager_collaborationStateForConversation___block_invoke;
  block[3] = &unk_1E58E74C8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__TUCollaborationManager_collaborationStateForConversation___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) featureFlags];
  int v3 = [v2 gelatoEnabled];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) highlightIdentifiers];
    v5 = [v4 anyObject];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) collaborationStateByIdentifier];
      int64_t v7 = [v6 objectForKeyedSubscript:v5];

      if (v7)
      {
        id v8 = [*(id *)(a1 + 32) collaborationStateByIdentifier];
        uint64_t v9 = [v8 objectForKeyedSubscript:v5];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (int)[v9 intValue];
      }
    }
    id v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Collaboration state for conversation is %ld", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)associateCollaborationWithNewConversation:(id)a3
{
  id v4 = a3;
  v5 = [(TUCollaborationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__TUCollaborationManager_associateCollaborationWithNewConversation___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__TUCollaborationManager_associateCollaborationWithNewConversation___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) highlightIdentifiers];
    id v4 = [v3 anyObject];
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v35 = v4;
    __int16 v36 = 2112;
    uint64_t v37 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Conversation created with collaboration identifier: %@ conversation: %@", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 40) featureFlags];
  int v7 = [v6 gelatoEnabled];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) highlightIdentifiers];
    uint64_t v9 = [v8 anyObject];

    id v10 = [*(id *)(a1 + 40) collaborationProvider];
    uint64_t v11 = [v10 collaborationHighlightForIdentifier:v9];

    if (v11)
    {
      int v12 = TUDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "collaboration found: %@ ", buf, 0xCu);
      }

      uint64_t v13 = [*(id *)(a1 + 40) highlightsByIdentifier];
      [v13 setObject:v11 forKeyedSubscript:v9];

      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 40) conversationsByHighlightIdentifier];
      [v15 setObject:v14 forKeyedSubscript:v9];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v16 = [*(id *)(a1 + 32) activeRemoteParticipants];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        uint64_t v28 = v9;
        uint64_t v18 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v17; uint64_t i = ((char *)i + 1))
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v16);
            }
            __int16 v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v21 = [v20 handle];
            uint64_t v22 = [*(id *)(a1 + 32) initiator];
            int v23 = [v21 isEqualToHandle:v22];

            if (v23)
            {
              uint64_t v17 = v20;
              goto LABEL_17;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v17) {
            continue;
          }
          break;
        }
LABEL_17:
        uint64_t v9 = v28;
      }

      if ([*(id *)(a1 + 32) state] == 3)
      {
        if ([*(id *)(a1 + 40) isIpad]) {
          [*(id *)(a1 + 40) vendNoticeForCollaboration:v11 participant:v17 forConversation:*(void *)(a1 + 32) type:15];
        }
      }
      [*(id *)(a1 + 40) notifyDelegateOfHighlightChanged:v11 onConversation:*(void *)(a1 + 32)];
    }
    else
    {
      __int16 v24 = [*(id *)(a1 + 40) pendingHighlightIdentifiers];
      [v24 addObject:v9];

      uint64_t v25 = *(void *)(a1 + 32);
      __int16 v26 = [*(id *)(a1 + 40) conversationsByHighlightIdentifier];
      [v26 setObject:v25 forKeyedSubscript:v9];

      uint64_t v17 = TUDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [*(id *)(a1 + 40) pendingHighlightIdentifiers];
        *(_DWORD *)buf = 138412290;
        v35 = v27;
        _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Highlight not found: %@ ", buf, 0xCu);
      }
    }

    [*(id *)(a1 + 40) startTrackingCollaborationIfNecessaryAndNotifyDelegate:v11 forConversation:*(void *)(a1 + 32)];
  }
}

- (void)participant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(TUCollaborationManager *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __121__TUCollaborationManager_participant_addedHighlightToConversation_highlightIdentifier_oldHighlightIdentifier_isFirstAdd___block_invoke;
  v21[3] = &unk_1E58E74F0;
  id v22 = v12;
  id v23 = v14;
  id v24 = v13;
  uint64_t v25 = self;
  BOOL v27 = a7;
  id v26 = v15;
  id v17 = v15;
  id v18 = v13;
  id v19 = v14;
  id v20 = v12;
  dispatch_async(v16, v21);
}

void __121__TUCollaborationManager_participant_addedHighlightToConversation_highlightIdentifier_oldHighlightIdentifier_isFirstAdd___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v39 = 138412802;
    v40 = v3;
    __int16 v41 = 2112;
    uint64_t v42 = v4;
    __int16 v43 = 2112;
    uint64_t v44 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ added highlightIdentifier: %@ to conversation: %@", (uint8_t *)&v39, 0x20u);
  }

  id v6 = [*(id *)(a1 + 56) featureFlags];
  int v7 = [v6 gelatoEnabled];

  if (v7)
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      [*(id *)(a1 + 56) participant:*(void *)(a1 + 32) reAddedHighlightToConversation:*(void *)(a1 + 48) highlightIdentifier:*(void *)(a1 + 40)];
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 56) originatingParticipantByHighlightIdentifier];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

    if (*(void *)(a1 + 64))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:")) {
        return;
      }
      id v10 = TUDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void **)(a1 + 64);
        uint64_t v12 = *(void *)(a1 + 40);
        int v39 = 138412546;
        v40 = v11;
        __int16 v41 = 2112;
        uint64_t v42 = v12;
        _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Changed collaborations from oldIdentifier: %@ to %@", (uint8_t *)&v39, 0x16u);
      }

      id v13 = [*(id *)(a1 + 56) originatingParticipantByHighlightIdentifier];
      [v13 removeObjectForKey:*(void *)(a1 + 64)];

      id v14 = [*(id *)(a1 + 56) conversationsByHighlightIdentifier];
      [v14 removeObjectForKey:*(void *)(a1 + 64)];

      id v15 = [*(id *)(a1 + 56) highlightsByIdentifier];
      [v15 removeObjectForKey:*(void *)(a1 + 64)];

      uint64_t v16 = [*(id *)(a1 + 56) pendingHighlightIdentifiers];
      [v16 removeObject:*(void *)(a1 + 64)];

      uint64_t v17 = *(void *)(a1 + 48);
      id v18 = [*(id *)(a1 + 56) conversationsByHighlightIdentifier];
      [v18 setObject:v17 forKeyedSubscript:*(void *)(a1 + 40)];

      id v19 = [*(id *)(a1 + 56) collaborationProvider];
      id v20 = [v19 collaborationHighlightForIdentifier:*(void *)(a1 + 40)];

      uint64_t v21 = *(void **)(a1 + 56);
      if (v20)
      {
        id v22 = [v21 highlightsByIdentifier];
        [v22 setObject:v20 forKeyedSubscript:*(void *)(a1 + 40)];

        id v23 = *(void **)(a1 + 56);
        id v24 = [v23 originatingParticipantByHighlightIdentifier];
        uint64_t v25 = [v24 objectForKeyedSubscript:*(void *)(a1 + 40)];
        [v23 vendNoticeForCollaboration:v20 participant:v25 forConversation:*(void *)(a1 + 48) type:15];
      }
      else
      {
        id v24 = [v21 pendingHighlightIdentifiers];
        [v24 addObject:*(void *)(a1 + 40)];
      }
    }
    else
    {
      id v26 = [*(id *)(a1 + 56) collaborationProvider];
      id v20 = [v26 collaborationHighlightForIdentifier:*(void *)(a1 + 40)];

      if (v20)
      {
        BOOL v27 = TUDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void **)(a1 + 40);
          int v39 = 138412290;
          v40 = v28;
          _os_log_impl(&dword_19C496000, v27, OS_LOG_TYPE_DEFAULT, "Highlight found: %@ ", (uint8_t *)&v39, 0xCu);
        }

        long long v29 = [*(id *)(a1 + 56) highlightsByIdentifier];
        [v29 setObject:v20 forKeyedSubscript:*(void *)(a1 + 40)];

        uint64_t v30 = *(void *)(a1 + 48);
        long long v31 = [*(id *)(a1 + 56) conversationsByHighlightIdentifier];
        [v31 setObject:v30 forKeyedSubscript:*(void *)(a1 + 40)];

        long long v32 = *(void **)(a1 + 56);
        v33 = [v32 originatingParticipantByHighlightIdentifier];
        v34 = [v33 objectForKeyedSubscript:*(void *)(a1 + 40)];
        [v32 vendNoticeForCollaboration:v20 participant:v34 forConversation:*(void *)(a1 + 48) type:15];

        [*(id *)(a1 + 56) notifyDelegateOfHighlightChanged:v20 onConversation:*(void *)(a1 + 48)];
        goto LABEL_20;
      }
      v35 = [*(id *)(a1 + 56) pendingHighlightIdentifiers];
      [v35 addObject:*(void *)(a1 + 40)];

      uint64_t v36 = *(void *)(a1 + 48);
      uint64_t v37 = [*(id *)(a1 + 56) conversationsByHighlightIdentifier];
      [v37 setObject:v36 forKeyedSubscript:*(void *)(a1 + 40)];

      id v24 = TUDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [*(id *)(a1 + 56) pendingHighlightIdentifiers];
        int v39 = 138412290;
        v40 = v38;
        _os_log_impl(&dword_19C496000, v24, OS_LOG_TYPE_DEFAULT, "Highlight not found: %@ ", (uint8_t *)&v39, 0xCu);
      }
    }

LABEL_20:
    [*(id *)(a1 + 56) startTrackingCollaborationIfNecessaryAndNotifyDelegate:v20 forConversation:*(void *)(a1 + 48)];
  }
}

- (void)participant:(id)a3 reAddedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUCollaborationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__TUCollaborationManager_participant_reAddedHighlightToConversation_highlightIdentifier___block_invoke;
  v15[3] = &unk_1E58E63D8;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v19 = self;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __89__TUCollaborationManager_participant_reAddedHighlightToConversation_highlightIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v15 = 138412802;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ readded highlightIdentifier: %@ to conversation: %@", (uint8_t *)&v15, 0x20u);
  }

  id v6 = [*(id *)(a1 + 56) featureFlags];
  int v7 = [v6 gelatoEnabled];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 56) originatingParticipantByHighlightIdentifier];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

    id v10 = [*(id *)(a1 + 56) collaborationProvider];
    uint64_t v11 = [v10 collaborationHighlightForIdentifier:*(void *)(a1 + 40)];

    id v12 = *(void **)(a1 + 56);
    id v13 = [v12 originatingParticipantByHighlightIdentifier];
    id v14 = [v13 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v12 vendNoticeForCollaboration:v11 participant:v14 forConversation:*(void *)(a1 + 48) type:15];
  }
}

- (void)participant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUCollaborationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__TUCollaborationManager_participant_removedHighlightFromConversation_highlightIdentifier___block_invoke;
  v15[3] = &unk_1E58E63D8;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  __int16 v19 = self;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __91__TUCollaborationManager_participant_removedHighlightFromConversation_highlightIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v16 = 138412802;
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ removed highlightIdentifier: %@ from conversation: %@", (uint8_t *)&v16, 0x20u);
  }

  id v6 = [*(id *)(a1 + 56) featureFlags];
  int v7 = [v6 gelatoEnabled];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 56) highlightsByIdentifier];
    id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

    id v10 = [*(id *)(a1 + 56) originatingParticipantByHighlightIdentifier];
    [v10 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v11 = [*(id *)(a1 + 56) pendingHighlightIdentifiers];
    [v11 removeObject:*(void *)(a1 + 40)];

    id v12 = [*(id *)(a1 + 56) highlightsByIdentifier];
    [v12 removeObjectForKey:*(void *)(a1 + 40)];

    id v13 = [*(id *)(a1 + 56) conversationsByHighlightIdentifier];
    [v13 removeObjectForKey:*(void *)(a1 + 40)];

    id v14 = [*(id *)(a1 + 56) collaborationStateByIdentifier];
    [v14 removeObjectForKey:*(void *)(a1 + 40)];

    int v15 = [*(id *)(a1 + 56) delegate];
    [v15 collaborationChanged:0 forConversation:*(void *)(a1 + 48) collaborationState:0];

    if (v9) {
      [*(id *)(a1 + 56) vendNoticeForCollaboration:v9 participant:*(void *)(a1 + 32) forConversation:*(void *)(a1 + 48) type:16];
    }
  }
}

- (void)setCollaborationState:(int64_t)a3 forCollaborationIdentifier:(id)a4
{
  id v6 = a4;
  int v7 = [(TUCollaborationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__TUCollaborationManager_setCollaborationState_forCollaborationIdentifier___block_invoke;
  block[3] = &unk_1E58E68F0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __75__TUCollaborationManager_setCollaborationState_forCollaborationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v4 = [*(id *)(a1 + 32) featureFlags];
  int v5 = [v4 gelatoEnabled];

  if (!v5) {
    return;
  }
  id v18 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) collaborationStateByIdentifier];
  int v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v7
    || ([*(id *)(a1 + 32) collaborationStateByIdentifier],
        v1 = objc_claimAutoreleasedReturnValue(),
        [v1 objectForKeyedSubscript:*(void *)(a1 + 40)],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v18 isEqualToNumber:v2]))
  {
    id v8 = [*(id *)(a1 + 32) collaborationStateByIdentifier];
    id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v7)
    {
    }
    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v10 = [*(id *)(a1 + 32) collaborationStateByIdentifier];
  [v10 setObject:v18 forKeyedSubscript:*(void *)(a1 + 40)];

  int64_t v11 = [*(id *)(a1 + 32) conversationsByHighlightIdentifier];
  id v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) delegate];
    id v14 = [*(id *)(a1 + 32) highlightsByIdentifier];
    int v15 = [v14 objectForKeyedSubscript:*(void *)(a1 + 40)];
    int v16 = [*(id *)(a1 + 32) conversationsByHighlightIdentifier];
    uint64_t v17 = [v16 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v13 collaborationChanged:v15 forConversation:v17 collaborationState:*(void *)(a1 + 48)];
  }
LABEL_11:
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(TUCollaborationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__TUCollaborationManager_conversationManager_stateChangedForConversation___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __74__TUCollaborationManager_conversationManager_stateChangedForConversation___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) featureFlags];
  int v3 = [v2 gelatoEnabled];

  if (v3 && [*(id *)(a1 + 32) isIpad] && objc_msgSend(*(id *)(a1 + 40), "state") == 3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "activeRemoteParticipants", 0);
    id v5 = (id)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v9 = [v8 handle];
          id v10 = [*(id *)(a1 + 40) initiator];
          int v11 = [v9 isEqualToHandle:v10];

          if (v11)
          {
            id v5 = v8;
            goto LABEL_14;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    id v12 = [*(id *)(a1 + 32) collaborationProvider];
    id v13 = [*(id *)(a1 + 40) highlightIdentifiers];
    id v14 = [v13 anyObject];
    int v15 = [v12 collaborationHighlightForIdentifier:v14];

    [*(id *)(a1 + 32) vendNoticeForCollaboration:v15 participant:v5 forConversation:*(void *)(a1 + 40) type:15];
  }
}

- (void)startTrackingCollaborationIfNecessaryAndNotifyDelegate:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUCollaborationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(TUCollaborationManager *)self featureFlags];
  int v10 = [v9 gelatoEnabled];

  if (v10)
  {
    int v11 = [(TUCollaborationManager *)self delegate];
    id v12 = v11;
    if (v6)
    {
      objc_initWeak(&location, self);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      long long v19 = __97__TUCollaborationManager_startTrackingCollaborationIfNecessaryAndNotifyDelegate_forConversation___block_invoke;
      __int16 v20 = &unk_1E58E7518;
      objc_copyWeak(&v25, &location);
      uint64_t v21 = self;
      id v13 = v6;
      id v22 = v13;
      id v14 = v12;
      id v23 = v14;
      id v15 = v7;
      id v24 = v15;
      long long v16 = _Block_copy(&v17);
      objc_msgSend(v14, "startTrackingCollaboration:forConversation:completionHandler:", v13, v15, v16, v17, v18, v19, v20, v21);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      [v11 collaborationChanged:0 forConversation:v7 collaborationState:-1];
    }
  }
}

void __97__TUCollaborationManager_startTrackingCollaborationIfNecessaryAndNotifyDelegate_forConversation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = a2;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Collaboration state for conversation document state %ld", (uint8_t *)&v10, 0xCu);
  }

  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) collaborationIdentifier];
      [v8 setCollaborationState:a2 forCollaborationIdentifier:v9];

      [*(id *)(a1 + 48) collaborationChanged:*(void *)(a1 + 40) forConversation:*(void *)(a1 + 56) collaborationState:a2];
    }
  }
}

- (TUCollaborationProvider)collaborationProvider
{
  return self->_collaborationProvider;
}

- (TUCollaborationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUCollaborationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)pendingHighlightIdentifiers
{
  return self->_pendingHighlightIdentifiers;
}

- (void)setPendingHighlightIdentifiers:(id)a3
{
}

- (NSMutableDictionary)originatingParticipantByHighlightIdentifier
{
  return self->_originatingParticipantByHighlightIdentifier;
}

- (void)setOriginatingParticipantByHighlightIdentifier:(id)a3
{
}

- (NSMutableDictionary)highlightsByIdentifier
{
  return self->_highlightsByIdentifier;
}

- (void)setHighlightsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)conversationsByHighlightIdentifier
{
  return self->_conversationsByHighlightIdentifier;
}

- (void)setConversationsByHighlightIdentifier:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isIpad
{
  return self->_isIpad;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)collaborationStateByIdentifier
{
  return self->_collaborationStateByIdentifier;
}

- (NSString)pendingCollaborationToAdd
{
  return self->_pendingCollaborationToAdd;
}

- (void)setPendingCollaborationToAdd:(id)a3
{
}

- (TUConversation)pendingConversationToAdd
{
  return self->_pendingConversationToAdd;
}

- (void)setPendingConversationToAdd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConversationToAdd, 0);
  objc_storeStrong((id *)&self->_pendingCollaborationToAdd, 0);
  objc_storeStrong((id *)&self->_collaborationStateByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_conversationsByHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_highlightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingParticipantByHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingHighlightIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_collaborationProvider, 0);
}

@end