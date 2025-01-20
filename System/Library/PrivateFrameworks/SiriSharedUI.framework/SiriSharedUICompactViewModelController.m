@interface SiriSharedUICompactViewModelController
- (AFConversation)conversation;
- (AFConversation)previousConversation;
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)immersiveExperienceOn;
- (NSArray)storedTranscriptItems;
- (NSMutableDictionary)serverUtteranceConversationIds;
- (SiriSharedUICompactViewModel)viewModel;
- (SiriSharedUICompactViewModelChangeObserving)viewModelChangeObserver;
- (SiriSharedUICompactViewModelController)initWithConversation:(id)a3 delegate:(id)a4;
- (SiriSharedUICompactViewModelControllerDelegate)delegate;
- (id)_instrumentationManager;
- (id)_serverUtterancesToDisplayForConversation:(id)a3;
- (id)_userUtteranceForConversationItem:(id)a3;
- (int64_t)inputType;
- (unint64_t)_generateDiffFromViewModel:(id)a3 toViewModel:(id)a4;
- (void)_clearAdditionalContentTranscriptItems;
- (void)_notifyObserverOfViewModelChangeWithDiff:(unint64_t)a3;
- (void)_processInitialConversationItemsForConversation:(id)a3;
- (void)_processInsertedConversationItems:(id)a3 forConversation:(id)a4;
- (void)_processUpdatedConversationItemsAtIndexPaths:(id)a3;
- (void)conversationDidChangeWithTransaction:(id)a3;
- (void)inputTypeDidChange;
- (void)resetViewsAndClearASR:(BOOL)a3;
- (void)revealLatencyView;
- (void)revealUserUtterance:(id)a3 backingAceObject:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setImmersiveExperienceOn:(BOOL)a3;
- (void)setPreviousConversation:(id)a3;
- (void)setStoredTranscriptItems:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewModelChangeObserver:(id)a3;
- (void)updateCurrentRequestText:(id)a3;
- (void)updateLatencySummary:(id)a3;
@end

@implementation SiriSharedUICompactViewModelController

- (SiriSharedUICompactViewModelController)initWithConversation:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SiriSharedUICompactViewModelController;
  v9 = [(SiriSharedUICompactViewModelController *)&v15 init];
  if (v9)
  {
    v10 = objc_alloc_init(SiriSharedUICompactViewModel);
    viewModel = v9->_viewModel;
    v9->_viewModel = v10;

    objc_storeStrong((id *)&v9->_conversation, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    serverUtteranceConversationIds = v9->_serverUtteranceConversationIds;
    v9->_serverUtteranceConversationIds = v12;

    v9->_immersiveExperienceOn = 0;
    objc_storeWeak((id *)&v9->_delegate, v8);
    [(SiriSharedUICompactViewModelController *)v9 inputTypeDidChange];
    [(SiriSharedUICompactViewModelController *)v9 _processInitialConversationItemsForConversation:v7];
  }

  return v9;
}

- (void)setPreviousConversation:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_previousConversation, a3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SiriSharedUICompactViewModelController_setPreviousConversation___block_invoke;
  v7[3] = &unk_2640E3B60;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __66__SiriSharedUICompactViewModelController_setPreviousConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processInitialConversationItemsForConversation:*(void *)(a1 + 40)];
}

- (void)setViewModelChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_viewModelChangeObserver, a3);
  v4 = objc_alloc_init(SiriSharedUICompactViewModel);
  [(SiriSharedUICompactViewModelController *)self _notifyObserverOfViewModelChangeWithDiff:[(SiriSharedUICompactViewModelController *)self _generateDiffFromViewModel:v4 toViewModel:self->_viewModel]];
}

- (void)_notifyObserverOfViewModelChangeWithDiff:(unint64_t)a3
{
  if (a3)
  {
    id v5 = [(SiriSharedUICompactViewModelController *)self viewModelChangeObserver];
    id v6 = [(SiriSharedUICompactViewModelController *)self viewModel];
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      [v5 compactViewModelDidChange:v6 withDiff:a3];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__SiriSharedUICompactViewModelController__notifyObserverOfViewModelChangeWithDiff___block_invoke;
      block[3] = &unk_2640E3B88;
      id v8 = v5;
      id v9 = v6;
      unint64_t v10 = a3;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __83__SiriSharedUICompactViewModelController__notifyObserverOfViewModelChangeWithDiff___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) compactViewModelDidChange:*(void *)(a1 + 40) withDiff:*(void *)(a1 + 48)];
}

- (unint64_t)_generateDiffFromViewModel:(id)a3 toViewModel:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = [v6 resultTranscriptItems];
  id v9 = [v5 resultTranscriptItems];
  char v10 = [v8 isEqualToArray:v9];

  if (v10)
  {
    unint64_t v11 = 0;
  }
  else
  {
    [v7 addObject:@"resultTranscriptItems"];
    unint64_t v11 = 1;
  }
  v12 = [v6 conversationTranscriptItems];
  v13 = [v5 conversationTranscriptItems];
  char v14 = [v12 isEqualToArray:v13];

  if ((v14 & 1) == 0)
  {
    v11 |= 2uLL;
    [v7 addObject:@"conversationTranscriptItems"];
  }
  objc_super v15 = [v6 additionalPlatterTranscriptItems];
  v16 = [v5 additionalPlatterTranscriptItems];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v17);
        }
        v20 += [*(id *)(*((void *)&v52 + 1) + 8 * i) count];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }
  v47 = v7;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v23 = v16;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v64 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = 0;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v23);
        }
        v26 += [*(id *)(*((void *)&v48 + 1) + 8 * j) count];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v64 count:16];
    }
    while (v25);
    BOOL v29 = v26 == 0;
  }
  else
  {
    BOOL v29 = 1;
  }

  if (!v20 && v29 || ([v17 isEqualToArray:v23] & 1) != 0)
  {
    v30 = v47;
  }
  else
  {
    v11 |= 0x20uLL;
    v30 = v47;
    [v47 addObject:@"additionalPlatterTranscriptItems"];
  }
  v31 = [v6 serverUtterances];
  v32 = [v5 serverUtterances];
  char v33 = [v31 isEqualToArray:v32];

  if ((v33 & 1) == 0)
  {
    v11 |= 4uLL;
    [v30 addObject:@"serverUtterances"];
  }
  v34 = [v6 speechRecognitionHypothesis];
  v35 = [v5 speechRecognitionHypothesis];

  if (v34 != v35)
  {
    v11 |= 8uLL;
    [v30 addObject:@"speechRecognitionHypothesis"];
  }
  v36 = [v6 latencyViewModel];
  v37 = [v5 latencyViewModel];
  int v38 = [v36 viewShouldUpdateFromOldModel:v37];

  if (v38)
  {
    v11 |= 0x40uLL;
    [v30 addObject:@"latencyViewModel"];
  }
  uint64_t v39 = [v6 inputType];
  if (v39 != [v5 inputType])
  {
    v11 |= 0x10uLL;
    [v30 addObject:@"inputType"];
  }
  uint64_t v40 = [v30 count];
  v41 = *MEMORY[0x263F28348];
  BOOL v42 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      *(_DWORD *)buf = 136315906;
      v57 = "-[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:]";
      __int16 v58 = 2112;
      v59 = v30;
      __int16 v60 = 2112;
      id v61 = v5;
      __int16 v62 = 2112;
      id v63 = v6;
      v43 = "%s #viewModelDiff %@ differs between original %@ and updated %@";
      v44 = v41;
      uint32_t v45 = 42;
LABEL_42:
      _os_log_impl(&dword_20C9D5000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
    }
  }
  else if (v42)
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:]";
    v43 = "%s #viewModelDiff no difference between viewModels";
    v44 = v41;
    uint32_t v45 = 12;
    goto LABEL_42;
  }

  return v11;
}

- (void)setViewModel:(id)a3
{
  viewModel = self->_viewModel;
  id v5 = a3;
  unint64_t v6 = [(SiriSharedUICompactViewModelController *)self _generateDiffFromViewModel:viewModel toViewModel:v5];
  id v7 = (SiriSharedUICompactViewModel *)[v5 copy];

  id v8 = self->_viewModel;
  self->_viewModel = v7;

  [(SiriSharedUICompactViewModelController *)self _notifyObserverOfViewModelChangeWithDiff:v6];
}

- (void)_processInitialConversationItemsForConversation:(id)a3
{
  id v7 = a3;
  if ([v7 numberOfChildrenForItemWithIdentifier:0] >= 1)
  {
    v4 = [v7 lastItem];
    id v5 = [v4 identifier];
    unint64_t v6 = objc_msgSend(v7, "sruif_itemsRelatedToIdentifier:", v5);

    [(SiriSharedUICompactViewModelController *)self _processInsertedConversationItems:v6 forConversation:v7];
  }
}

- (void)conversationDidChangeWithTransaction:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 updatedItemIndexPaths];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  id v7 = v6;

  id v8 = [v3 insertedItemIndexPaths];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  unint64_t v11 = v10;

  v12 = [(SiriSharedUICompactViewModelController *)self conversation];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
  id v45 = v13;
  BOOL v42 = v11;
  id v43 = v3;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v52;
    uint64_t v44 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [v12 itemAtIndexPath:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        if ([v18 type] == 3)
        {
          uint64_t v19 = [v18 aceObject];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_20;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
            uint64_t v21 = [v12 identifier];
            v22 = [v20 objectForKey:v21];
            [v18 identifier];
            v24 = uint64_t v23 = v15;
            int v25 = [v22 containsObject:v24];

            uint64_t v15 = v23;
            uint64_t v16 = v44;

            id v13 = v45;
            if (!v25)
            {
LABEL_20:

              char v26 = 1;
              goto LABEL_21;
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    char v26 = 0;
LABEL_21:
    unint64_t v11 = v42;
    id v3 = v43;
  }
  else
  {
    char v26 = 0;
  }

  if (![v11 count] && (v26 & 1) == 0)
  {
    uint64_t v27 = self;
    id v28 = v13;
LABEL_31:
    [(SiriSharedUICompactViewModelController *)v27 _processUpdatedConversationItemsAtIndexPaths:v28];
    goto LABEL_45;
  }
  if ([v11 count] == 1)
  {
    BOOL v29 = [v11 objectAtIndexedSubscript:0];
    v30 = [v12 itemAtIndexPath:v29];
    uint64_t v31 = [v30 type];

    if (v31 == 1)
    {
      v32 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v58 = "-[SiriSharedUICompactViewModelController conversationDidChangeWithTransaction:]";
        _os_log_impl(&dword_20C9D5000, v32, OS_LOG_TYPE_DEFAULT, "%s The only item added to the conversation is an SASSpeechRecognized. Treating as an update", buf, 0xCu);
      }
      uint64_t v27 = self;
      id v28 = v11;
      goto LABEL_31;
    }
  }
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v34 = [v13 arrayByAddingObjectsFromArray:v11];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        uint64_t v40 = [v12 itemAtIndexPath:v39];
        if ([v40 type] == 2)
        {
          uint64_t v55 = v39;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
          [(SiriSharedUICompactViewModelController *)self _processUpdatedConversationItemsAtIndexPaths:v41];
        }
        else
        {
          [v33 addObject:v40];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v36);
  }

  if ([v33 count]) {
    [(SiriSharedUICompactViewModelController *)self _processInsertedConversationItems:v33 forConversation:v12];
  }

  unint64_t v11 = v42;
  id v3 = v43;
  id v13 = v45;
LABEL_45:
}

- (void)_processUpdatedConversationItemsAtIndexPaths:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SiriSharedUICompactViewModelController *)self conversation];
  BOOL v47 = [(SiriSharedUICompactViewModelController *)self alwaysShowRecognizedSpeech];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v43 = 0;
    char v41 = 0;
    unint64_t v9 = 0;
    id v45 = v6;
    uint64_t v46 = *(void *)v49;
    uint64_t v40 = 0;
    uint64_t v44 = self;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = [v5 itemAtIndexPath:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        if ([v11 type] == 1 || objc_msgSend(v11, "type") == 2)
        {
          if (v9)
          {
            v12 = *MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT)) {
              [(SiriSharedUICompactViewModelController *)v56 _processUpdatedConversationItemsAtIndexPaths:v12];
            }
          }
          if ([MEMORY[0x263F286B8] isSAEEnabled]) {
            BOOL v13 = [v11 type] == 1;
          }
          else {
            BOOL v13 = 0;
          }
          if (v47 || v13)
          {
            id v14 = objc_alloc(MEMORY[0x263F754D8]);
            uint64_t v15 = [(SiriSharedUICompactViewModelController *)self _userUtteranceForConversationItem:v11];
            uint64_t v16 = [v11 aceObject];
            uint64_t v17 = objc_msgSend(v14, "initWithUserUtterance:backingAceObject:isFinal:", v15, v16, objc_msgSend(v11, "type") == 1);

            self = v44;
            uint64_t v18 = [(SiriSharedUICompactViewModelController *)v44 viewModel];
            uint64_t v19 = [v18 speechRecognitionHypothesis];
            if ([v19 isFinal])
            {
              BOOL v20 = 1;
            }
            else
            {
              uint64_t v27 = [(SiriSharedUICompactViewModelController *)v44 viewModel];
              id v28 = [v27 speechRecognitionHypothesis];
              BOOL v20 = v28 == 0;
            }
            char v43 = v20;
            id v6 = v45;
            if (v20 && !v47) {
              char v43 = [MEMORY[0x263F286B8] isSAEEnabled];
            }
          }
          else
          {
            uint64_t v17 = v9;
          }
          if ([MEMORY[0x263F286B8] isSAEEnabled] && objc_msgSend(v11, "type") == 1)
          {
            BOOL v29 = [(SiriSharedUICompactViewModelController *)self _userUtteranceForConversationItem:v11];
            uint64_t v30 = [v29 bestTextInterpretation];

            uint64_t v40 = v30;
            id v6 = v45;
          }
          unint64_t v9 = v17;
        }
        else
        {
          uint64_t v21 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
          v22 = [v5 identifier];
          uint64_t v23 = [v21 objectForKey:v22];
          uint64_t v24 = [v11 identifier];
          int v25 = v5;
          char v26 = [v23 containsObject:v24];

          id v6 = v45;
          v41 |= v26;
          id v5 = v25;
          self = v44;
        }
        uint64_t v31 = [v11 identifier];
        [v6 addObject:v31];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v8);
  }
  else
  {
    char v43 = 0;
    char v41 = 0;
    uint64_t v40 = 0;
    unint64_t v9 = 0;
  }

  if ([v6 count])
  {
    v32 = [(SiriSharedUICompactViewModelController *)self delegate];
    [v32 compactViewModelController:self didProcessConversationItemsWithIdentifiers:v6];
  }
  if (((v9 | v40) != 0) | v41 & 1)
  {
    id v33 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v34 = @"updating existing viewModel with new hypothesis.";
      if (v43) {
        v34 = @"clearing previous content from viewModel since this hypothesis .";
      }
      *(_DWORD *)buf = 136315394;
      long long v53 = "-[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:]";
      __int16 v54 = 2112;
      uint64_t v55 = v34;
      _os_log_impl(&dword_20C9D5000, v33, OS_LOG_TYPE_DEFAULT, "%s #compact speechRecognitionHypothesis updated, %@", buf, 0x16u);
    }
    uint64_t v35 = [(SiriSharedUICompactViewModelController *)self viewModel];
    uint64_t v36 = v35;
    if (v43)
    {
      uint64_t v37 = (void *)[v35 copyWithConversationTranscriptItems:MEMORY[0x263EFFA68] serverUtterances:MEMORY[0x263EFFA68] speechRecognitionHypothesis:v9 latencyViewUtterance:v40];

      uint64_t v36 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
      int v38 = [v5 identifier];
      uint64_t v39 = [v36 objectForKey:v38];
      [v39 removeAllObjects];
    }
    else
    {
      int v38 = [(SiriSharedUICompactViewModelController *)self _serverUtterancesToDisplayForConversation:v5];
      uint64_t v37 = (void *)[v36 copyWithServerUtterances:v38 speechRecognitionHypothesis:v9 latencyViewUtterance:v40];
    }

    [(SiriSharedUICompactViewModelController *)self setViewModel:v37];
  }
}

- (void)_processInsertedConversationItems:(id)a3 forConversation:(id)a4
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v125 = a4;
  [(SiriSharedUICompactViewModelController *)self _clearAdditionalContentTranscriptItems];
  v127 = [MEMORY[0x263EFF980] array];
  id v133 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v154 objects:v167 count:16];
  v130 = self;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v155;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v155 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v154 + 1) + 8 * i) isSupplemental])
        {
          int v124 = 1;
          v12 = v7;
          BOOL v13 = v125;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v154 objects:v167 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v12 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
  BOOL v13 = v125;
  id v14 = [v125 identifier];
  uint64_t v15 = [v12 objectForKey:v14];
  [v15 removeAllObjects];

  int v124 = 0;
LABEL_11:

  v126 = [MEMORY[0x263EFF980] array];
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v150 objects:v166 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v151;
    uint64_t v20 = *MEMORY[0x263F65108];
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v151 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = [*(id *)(*((void *)&v150 + 1) + 8 * j) aceObject];
        uint64_t v23 = [v22 propertyForKey:v20];

        if (v23 && [v23 BOOLValue])
        {

          int v123 = 1;
          goto LABEL_22;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v150 objects:v166 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    int v123 = 0;
LABEL_22:
    BOOL v13 = v125;
  }
  else
  {
    int v123 = 0;
  }

  p_isa = (id *)&v130->super.isa;
  if (!SiriSharedUIDeviceIsPad()
    && (SiriSharedUIDeviceIsMac() & 1) == 0
    && ![(SiriSharedUICompactViewModelController *)v130 immersiveExperienceOn])
  {
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v146 objects:v165 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v147;
      while (2)
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v147 != v28) {
            objc_enumerationMutation(v25);
          }
          if ([*(id *)(*((void *)&v146 + 1) + 8 * k) isImmersiveExperience])
          {

            p_isa = (id *)&v130->super.isa;
            uint64_t v30 = [(SiriSharedUICompactViewModelController *)v130 delegate];
            [v30 immersiveExperienceRequestedForViewModelController:v130];

            [(SiriSharedUICompactViewModelController *)v130 setImmersiveExperienceOn:1];
            BOOL v13 = v125;
            goto LABEL_37;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v146 objects:v165 count:16];
        BOOL v13 = v125;
        if (v27) {
          continue;
        }
        break;
      }
    }

    p_isa = (id *)&v130->super.isa;
  }
LABEL_37:
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  obuint64_t j = v16;
  uint64_t v31 = [obj countByEnumeratingWithState:&v142 objects:v164 count:16];
  if (!v31)
  {
    v128 = 0;
    goto LABEL_71;
  }
  uint64_t v32 = v31;
  v128 = 0;
  uint64_t v131 = *(void *)v143;
  v122 = &v161;
  while (2)
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v143 != v131) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v142 + 1) + 8 * v33);
      uint64_t v35 = objc_msgSend(v34, "aceObject", v122);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v36 = [p_isa delegate];
        int v37 = [v36 siriDeviceLockedForViewModelController:p_isa];

        if (v37)
        {
          uint64_t v57 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v163 = "-[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:]";
            _os_log_impl(&dword_20C9D5000, v57, OS_LOG_TYPE_DEFAULT, "%s Not displaying SAABPersonPicker since device is passcode locked", buf, 0xCu);
          }

          goto LABEL_71;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v38 = [p_isa serverUtteranceConversationIds];
        uint64_t v39 = [v13 identifier];
        uint64_t v40 = [v38 objectForKey:v39];

        if (!v40)
        {
          char v41 = [p_isa serverUtteranceConversationIds];
          id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
          char v43 = [v13 identifier];
          [v41 setObject:v42 forKey:v43];
        }
        uint64_t v44 = [p_isa serverUtteranceConversationIds];
        id v45 = [v13 identifier];
        uint64_t v46 = [v44 objectForKey:v45];
        BOOL v47 = [v34 identifier];
        [v46 addObject:v47];
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v34 presentationState] != 3)
      {
        long long v52 = [p_isa delegate];
        uint64_t v44 = [v52 compactViewModelController:p_isa requestsTranscriptItemForAceObject:v35];

        long long v53 = [v44 viewController];
        [v53 setAceObject:v35];

        __int16 v54 = [v44 viewController];
        [v54 wasAddedToTranscript];

        [v127 addObject:v44];
        [v126 addObject:v44];
        id v45 = [v44 viewController];
        if (objc_opt_respondsToSelector()) {
          [v45 configureForConversationStorable:v34];
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_50;
        }
        uint64_t v46 = [p_isa _instrumentationManager];
        BOOL v47 = [v46 currentInstrumentationTurnContext];
        uint64_t v55 = [v47 turnIdentifier];
        [v45 setInstrumentationTurnIdentifier:v55];

        BOOL v13 = v125;
LABEL_48:

        p_isa = (id *)&v130->super.isa;
        goto LABEL_49;
      }
      if ([v34 type] == 1)
      {
        if (v128)
        {
          long long v48 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT)) {
            -[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:](v160, v122, v48);
          }
        }
        if ([p_isa alwaysShowRecognizedSpeech])
        {
          id v49 = objc_alloc(MEMORY[0x263F754D8]);
          uint64_t v44 = [p_isa _userUtteranceForConversationItem:v34];
          id v45 = [v34 aceObject];
          uint64_t v50 = [v49 initWithUserUtterance:v44 backingAceObject:v45 isFinal:1];
          uint64_t v46 = v128;
          v128 = (void *)v50;
LABEL_49:

LABEL_50:
        }
      }
      long long v51 = [v34 identifier];
      [v133 addObject:v51];

      ++v33;
    }
    while (v32 != v33);
    uint64_t v56 = [obj countByEnumeratingWithState:&v142 objects:v164 count:16];
    uint64_t v32 = v56;
    if (v56) {
      continue;
    }
    break;
  }
LABEL_71:

  if ([v126 count]) {
    objc_storeStrong(p_isa + 8, v126);
  }
  if ([v133 count])
  {
    __int16 v58 = [p_isa delegate];
    [v58 compactViewModelController:p_isa didProcessConversationItemsWithIdentifiers:v133];
  }
  uint64_t v59 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v127 count]) {
    goto LABEL_77;
  }
  uint64_t v60 = [(SiriSharedUICompactViewModelController *)v130 serverUtteranceConversationIds];
  id v61 = [v125 identifier];
  __int16 v62 = [v60 objectForKey:v61];
  uint64_t v63 = [v62 count];

  if (v63)
  {
LABEL_77:
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v64 = v127;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v138 objects:v159 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v139;
      do
      {
        for (uint64_t m = 0; m != v66; ++m)
        {
          if (*(void *)v139 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = *(void **)(*((void *)&v138 + 1) + 8 * m);
          uint64_t v70 = [v69 platterCategory];
          v71 = [NSNumber numberWithInteger:v70];
          v72 = [v59 objectForKey:v71];

          if (!v72)
          {
            v73 = [MEMORY[0x263EFF980] array];
            [v59 setObject:v73 forKey:v71];
          }
          v74 = [v59 objectForKeyedSubscript:v71];
          [v74 addObject:v69];
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v138 objects:v159 count:16];
      }
      while (v66);
    }
  }
  v75 = [MEMORY[0x263EFF980] array];
  v76 = [MEMORY[0x263EFF980] array];
  v77 = [v59 objectForKeyedSubscript:&unk_26C1AE5F0];

  if (v77)
  {
    uint64_t v78 = [v59 objectForKeyedSubscript:&unk_26C1AE5F0];

    [v59 removeObjectForKey:&unk_26C1AE5F0];
    v76 = (void *)v78;
  }
  v79 = [v59 objectForKeyedSubscript:&unk_26C1AE608];

  if (v79)
  {
    uint64_t v80 = [v59 objectForKeyedSubscript:&unk_26C1AE608];

    [v59 removeObjectForKey:&unk_26C1AE608];
    v75 = (void *)v80;
  }
  v81 = v130;
  v82 = [MEMORY[0x263EFF980] array];
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v83 = v59;
  uint64_t v84 = [v83 countByEnumeratingWithState:&v134 objects:v158 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v135;
    do
    {
      for (uint64_t n = 0; n != v85; ++n)
      {
        if (*(void *)v135 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = [v83 objectForKey:*(void *)(*((void *)&v134 + 1) + 8 * n)];
        [v82 addObject:v88];
      }
      uint64_t v85 = [v83 countByEnumeratingWithState:&v134 objects:v158 count:16];
    }
    while (v85);
  }

  if (!v128)
  {
    v89 = [(SiriSharedUICompactViewModelController *)v130 viewModel];
    v128 = [v89 speechRecognitionHypothesis];
  }
  if (v124)
  {
    v90 = [(SiriSharedUICompactViewModelController *)v130 viewModel];
    v91 = [v90 resultTranscriptItems];
    v92 = [v91 arrayByAddingObjectsFromArray:v75];
    uint64_t v93 = [v92 mutableCopy];

    v94 = [(SiriSharedUICompactViewModelController *)v130 viewModel];
    v95 = [v94 conversationTranscriptItems];
    v96 = [v95 arrayByAddingObjectsFromArray:v76];
    uint64_t v97 = [v96 mutableCopy];

    uint64_t v98 = [v82 count];
    v99 = [(SiriSharedUICompactViewModelController *)v130 viewModel];
    v100 = [v99 additionalPlatterTranscriptItems];
    uint64_t v101 = [v100 count];

    if (v98 == v101 && [v82 count])
    {
      v132 = (void *)v97;
      unint64_t v102 = 0;
      v81 = v130;
      do
      {
        v103 = [(SiriSharedUICompactViewModelController *)v81 viewModel];
        v104 = [v103 additionalPlatterTranscriptItems];
        v105 = [v104 objectAtIndexedSubscript:v102];
        v106 = [v82 objectAtIndexedSubscript:v102];
        v107 = (void *)[v106 mutableCopy];
        v108 = [v105 arrayByAddingObjectsFromArray:v107];
        [v82 setObject:v108 atIndexedSubscript:v102];

        v81 = v130;
        ++v102;
      }
      while ([v82 count] > v102);
      v75 = (void *)v93;
      v76 = v132;
    }
    else
    {
      v75 = (void *)v93;
      v76 = (void *)v97;
      v81 = v130;
    }
  }
  else if (v123 && ![v75 count])
  {
    int v109 = [MEMORY[0x263F286B8] isSAEEnabled];
    v110 = [(SiriSharedUICompactViewModelController *)v130 viewModel];
    v111 = v110;
    if (v109)
    {
      v112 = [(NSArray *)v110 conversationTranscriptItems];

      uint64_t v113 = [(NSArray *)v112 count];
      storedTranscriptItems = v112;
      if (!v113) {
        storedTranscriptItems = v130->_storedTranscriptItems;
      }
      v115 = v76;
      v76 = (void *)[(NSArray *)storedTranscriptItems mutableCopy];
    }
    else
    {
      v115 = [(NSArray *)v110 resultTranscriptItems];
      uint64_t v116 = [v115 mutableCopy];

      v112 = v111;
      v75 = (void *)v116;
    }
  }
  uint64_t v117 = [(SiriSharedUICompactViewModelController *)v81 inputType];
  v118 = [SiriSharedUICompactViewModel alloc];
  [(SiriSharedUICompactViewModelController *)v81 _serverUtterancesToDisplayForConversation:v125];
  v120 = v119 = v81;
  v121 = [(SiriSharedUICompactViewModel *)v118 initWithInputType:v117 resultTranscriptItems:v75 conversationTranscriptItems:v76 additionalPlatterTranscriptItems:v82 serverUtterances:v120 speechRecognitionHypothesis:v128];

  [(SiriSharedUICompactViewModelController *)v119 setViewModel:v121];
}

- (id)_userUtteranceForConversationItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 1)
  {
    id v4 = [v3 aceObject];
    id v5 = [v4 recognition];
    id v6 = [v4 refId];
    id v7 = [v4 sessionId];
    uint64_t v8 = objc_msgSend(v5, "af_userUtteranceValueWithRefId:sessionId:", v6, v7);

LABEL_5:
    goto LABEL_7;
  }
  if ([v3 type] == 2)
  {
    id v4 = [v3 aceObject];
    uint64_t v8 = objc_msgSend(v4, "af_userUtteranceValue");
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)_serverUtterancesToDisplayForConversation:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v39 = self;
  id v5 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKey:v6];
  uint64_t v8 = (void *)[v7 copy];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v41;
    BOOL v13 = (os_log_t *)MEMORY[0x263F28348];
    *(void *)&long long v10 = 136315650;
    long long v35 = v10;
    do
    {
      uint64_t v14 = 0;
      uint64_t v37 = v11;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        id v16 = objc_msgSend(v4, "itemWithIdentifier:", v15, v35);
        uint64_t v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 aceObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            uint64_t v20 = [v19 text];

            if (v20) {
              [v36 addObject:v19];
            }
            uint64_t v18 = v19;
          }
          else
          {
            uint64_t v25 = v12;
            uint64_t v26 = v13;
            os_log_t v27 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = v27;
              BOOL v29 = [v15 UUIDString];
              uint64_t v30 = (objc_class *)objc_opt_class();
              uint64_t v31 = NSStringFromClass(v30);
              *(_DWORD *)buf = v35;
              id v45 = "-[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:]";
              __int16 v46 = 2112;
              BOOL v47 = v29;
              __int16 v48 = 2112;
              id v49 = v31;
              _os_log_impl(&dword_20C9D5000, v28, OS_LOG_TYPE_DEFAULT, "%s #compact Removing %@ because it is no longer an SAUIAssistantUtteranceView. New type: %@", buf, 0x20u);
            }
            id v19 = [(SiriSharedUICompactViewModelController *)v39 serverUtteranceConversationIds];
            uint64_t v32 = [v4 identifier];
            uint64_t v33 = [v19 objectForKey:v32];
            [v33 removeObject:v15];

            BOOL v13 = v26;
            uint64_t v12 = v25;
            uint64_t v11 = v37;
          }
        }
        else
        {
          os_log_t v21 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            uint64_t v23 = [v15 UUIDString];
            *(_DWORD *)buf = 136315394;
            id v45 = "-[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:]";
            __int16 v46 = 2112;
            BOOL v47 = v23;
            _os_log_impl(&dword_20C9D5000, v22, OS_LOG_TYPE_DEFAULT, "%s #compact Removing %@ because it is no longer in the conversation", buf, 0x16u);
          }
          uint64_t v18 = [(SiriSharedUICompactViewModelController *)v39 serverUtteranceConversationIds];
          id v19 = [v4 identifier];
          uint64_t v24 = [v18 objectForKey:v19];
          [v24 removeObject:v15];
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v11);
  }

  return v36;
}

- (void)_clearAdditionalContentTranscriptItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = +[SiriSharedUITranscriptItem additionalContentViewPlatterCategories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = [MEMORY[0x263EFF8C0] array];
      [v3 addObject:v8];

      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  uint64_t v9 = (void *)[v3 copy];
  long long v10 = [(SiriSharedUICompactViewModelController *)self viewModel];
  uint64_t v11 = (void *)[v10 copyWithAdditionalPlatterTranscriptItems:v9];

  [(SiriSharedUICompactViewModelController *)self setViewModel:v11];
}

- (int64_t)inputType
{
  id v3 = [(SiriSharedUICompactViewModelController *)self delegate];
  int64_t v4 = [v3 inputTypeForCompactViewModelController:self];

  return v4;
}

- (void)inputTypeDidChange
{
  int64_t v3 = [(SiriSharedUICompactViewModelController *)self inputType];
  int64_t v4 = [(SiriSharedUICompactViewModelController *)self viewModel];
  id v5 = (id)[v4 copyWithInputType:v3];

  [(SiriSharedUICompactViewModelController *)self setViewModel:v5];
}

- (void)revealUserUtterance:(id)a3 backingAceObject:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F754D8];
  id v7 = a4;
  id v8 = a3;
  id v11 = (id)[[v6 alloc] initWithUserUtterance:v8 backingAceObject:v7 isFinal:1];

  uint64_t v9 = [(SiriSharedUICompactViewModelController *)self viewModel];
  long long v10 = (void *)[v9 copyWithSpeechRecognitionHypothesis:v11];
  [(SiriSharedUICompactViewModelController *)self setViewModel:v10];
}

- (void)resetViewsAndClearASR:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    long long v10 = "-[SiriSharedUICompactViewModelController resetViewsAndClearASR:]";
    _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #suppressSnippet: Reset previous view except for ASR.", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = objc_alloc_init(SiriSharedUICompactViewModel);
  if (!a3)
  {
    id v7 = [(SiriSharedUICompactViewModel *)self->_viewModel speechRecognitionHypothesis];
    uint64_t v8 = [(SiriSharedUICompactViewModel *)v6 copyWithSpeechRecognitionHypothesis:v7];

    uint64_t v6 = (SiriSharedUICompactViewModel *)v8;
  }
  [(SiriSharedUICompactViewModelController *)self setViewModel:v6];
}

- (void)revealLatencyView
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SiriSharedUICompactViewModelController revealLatencyView]";
  _os_log_debug_impl(&dword_20C9D5000, log, OS_LOG_TYPE_DEBUG, "%s Attempting to display latency view", (uint8_t *)&v1, 0xCu);
}

- (void)updateLatencySummary:(id)a3
{
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[SiriSharedUICompactViewModelController updateLatencySummary:]((uint64_t)v4, v5);
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F286C8]) initWithString:v4 correctionIdentifier:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F754D8]) initWithUserUtterance:v6 backingAceObject:0 isFinal:0];
  uint64_t v8 = [(SiriSharedUICompactViewModelController *)self viewModel];
  int v9 = (void *)[v8 copyWithSpeechRecognitionHypothesis:v7];
  [(SiriSharedUICompactViewModelController *)self setViewModel:v9];
}

- (void)updateCurrentRequestText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F286C8];
  id v5 = a3;
  id v13 = (id)[[v4 alloc] initWithString:v5 correctionIdentifier:0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F754D8]) initWithUserUtterance:v13 backingAceObject:0 isFinal:1];
  id v7 = [(SiriSharedUICompactViewModelController *)self viewModel];
  uint64_t v8 = (void *)[v7 copyWithConversationTranscriptItems:MEMORY[0x263EFFA68] serverUtterances:MEMORY[0x263EFFA68] speechRecognitionHypothesis:v6 latencyViewUtterance:0];

  int v9 = [(SiriSharedUICompactViewModelController *)self serverUtteranceConversationIds];
  long long v10 = [(SiriSharedUICompactViewModelController *)self conversation];
  uint64_t v11 = [v10 identifier];
  long long v12 = [v9 objectForKey:v11];
  [v12 removeAllObjects];

  [(SiriSharedUICompactViewModelController *)self setViewModel:v8];
}

- (BOOL)alwaysShowRecognizedSpeech
{
  v2 = self;
  uint64_t v3 = [(SiriSharedUICompactViewModelController *)self delegate];
  LOBYTE(v2) = [v3 compactViewModelControllerShouldAlwaysShowRecognizedSpeech:v2];

  return (char)v2;
}

- (id)_instrumentationManager
{
  return (id)[MEMORY[0x263F754A8] sharedManager];
}

- (SiriSharedUICompactViewModelChangeObserving)viewModelChangeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModelChangeObserver);
  return (SiriSharedUICompactViewModelChangeObserving *)WeakRetained;
}

- (SiriSharedUICompactViewModelControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactViewModelControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AFConversation)previousConversation
{
  return self->_previousConversation;
}

- (SiriSharedUICompactViewModel)viewModel
{
  return self->_viewModel;
}

- (AFConversation)conversation
{
  return self->_conversation;
}

- (BOOL)immersiveExperienceOn
{
  return self->_immersiveExperienceOn;
}

- (void)setImmersiveExperienceOn:(BOOL)a3
{
  self->_immersiveExperienceOuint64_t n = a3;
}

- (NSMutableDictionary)serverUtteranceConversationIds
{
  return self->_serverUtteranceConversationIds;
}

- (NSArray)storedTranscriptItems
{
  return self->_storedTranscriptItems;
}

- (void)setStoredTranscriptItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedTranscriptItems, 0);
  objc_storeStrong((id *)&self->_serverUtteranceConversationIds, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_previousConversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewModelChangeObserver);
}

- (void)_processUpdatedConversationItemsAtIndexPaths:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:]";
  _os_log_fault_impl(&dword_20C9D5000, log, OS_LOG_TYPE_FAULT, "%s #compact The conversation updated multiple speech conversation items, but the compact presentation can only show one at a time. The user will only see the last recognition in the list of presented items.", buf, 0xCu);
}

- (void)_processInsertedConversationItems:(os_log_t)log forConversation:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:]";
  _os_log_fault_impl(&dword_20C9D5000, log, OS_LOG_TYPE_FAULT, "%s #compact Conversation inserted multiple recognized speech conversation items, but the compact presentation can only show one at a time. The user will only see the last recognition in the list of presented items.", buf, 0xCu);
}

- (void)updateLatencySummary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SiriSharedUICompactViewModelController updateLatencySummary:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_20C9D5000, a2, OS_LOG_TYPE_DEBUG, "%s Updating latency summary to %@", (uint8_t *)&v2, 0x16u);
}

@end