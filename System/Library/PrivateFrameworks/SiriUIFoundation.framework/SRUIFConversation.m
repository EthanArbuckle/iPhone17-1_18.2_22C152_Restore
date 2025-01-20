@interface SRUIFConversation
- (BOOL)_nodeContainsProvisionalItems:(id)a3;
- (BOOL)containsItemForAceViewWithIdentifier:(id)a3;
- (BOOL)containsItemWithIdentifier:(id)a3;
- (BOOL)hasItemWithIdentifier:(id)a3;
- (BOOL)isSynchronizedWithServer;
- (BOOL)itemAtIndexPathIsVirgin:(id)a3;
- (NSString)languageCode;
- (NSUUID)identifier;
- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4;
- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5;
- (SRUIFConversation)initWithLanguageCode:(id)a3;
- (SRUIFConversation)initWithPropertyListRepresentation:(id)a3;
- (SRUIFConversationDelegate)delegate;
- (SRUIFConversationStorable)lastRestoredItem;
- (SRUIFTreeNode)_rootNode;
- (id)_changePresentationStateForNodes:(id)a3;
- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5;
- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4;
- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4;
- (id)_itemAtIndexPath:(id)a3;
- (id)_nodeAtIndexPath:(id)a3;
- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3;
- (id)aceObjectForItemAtIndexPath:(id)a3;
- (id)additionalSpeechInterpretationsForRefId:(id)a3;
- (id)dialogPhaseForItemAtIndexPath:(id)a3;
- (id)identifierOfItemAtIndexPath:(id)a3;
- (id)indexPathForItemWithIdentifier:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemWithIdentifier:(id)a3;
- (id)itemsRelatedToIdentifier:(id)a3;
- (id)lastItem;
- (id)parentOfItemWithIdentifier:(id)a3;
- (id)propertyListRepresentation;
- (id)updatedUserUtteranceForRefId:(id)a3;
- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3;
- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3;
- (int64_t)presentationStateForItemAtIndexPath:(id)a3;
- (int64_t)typeForItemAtIndexPath:(id)a3;
- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6;
- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8;
- (void)_enumerateItemsUsingBlock:(id)a3;
- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4;
- (void)_removeNodes:(id)a3;
- (void)_setLastRestoredItem:(id)a3;
- (void)_setRootNode:(id)a3;
- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)addItemForMusicStartSessionCommand:(id)a3;
- (void)addItemForPartialResultCommand:(id)a3;
- (void)addItemForSpeechRecognizedCommand:(id)a3;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5;
- (void)addItemsForAddViewsCommand:(id)a3;
- (void)addItemsForShowHelpCommand:(id)a3;
- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)addSelectionResponse:(id)a3;
- (void)cancelItemWithIdentifier:(id)a3;
- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5;
- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5;
- (void)removeItemsAtIndexPaths:(id)a3;
- (void)removeItemsFollowingItemAtIndexPath:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3;
- (void)removeTransientItems;
- (void)setDelegate:(id)a3;
- (void)setSynchronizedWithServer:(BOOL)a3;
- (void)updateWithUpdateViewsCommand:(id)a3;
@end

@implementation SRUIFConversation

- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRUIFConversation;
  v11 = [(SRUIFConversation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_rootNode, a5);
    uint64_t v14 = [v9 copy];
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v14;

    v11->_synchronizedWithServer = 1;
  }

  return v11;
}

- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SRUIFTreeNode);
  id v9 = [(SRUIFConversation *)self initWithIdentifier:v7 languageCode:v6 rootNode:v8];

  return v9;
}

- (SRUIFConversation)initWithLanguageCode:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(SRUIFConversation *)self initWithIdentifier:v6 languageCode:v5];

  return v7;
}

- (id)_nodeAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFConversation *)self _rootNode];
  id v6 = [v5 nodeAtIndexPath:v4];

  return v6;
}

- (id)_itemAtIndexPath:(id)a3
{
  v3 = [(SRUIFConversation *)self _nodeAtIndexPath:a3];
  id v4 = [v3 item];

  return v4;
}

- (void)_removeNodes:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = [MEMORY[0x263EFF980] array];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __34__SRUIFConversation__removeNodes___block_invoke;
    v37[3] = &unk_264786220;
    id v25 = v5;
    id v38 = v25;
    v39 = self;
    v22 = self;
    id v24 = v6;
    id v40 = v24;
    id v23 = v7;
    id v41 = v23;
    id v8 = (void (**)(void, void))MEMORY[0x22A643DA0](v37);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          ((void (**)(void, void *))v8)[2](v8, v14);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __34__SRUIFConversation__removeNodes___block_invoke_2;
          v31[3] = &unk_264786248;
          v15 = v8;
          v31[4] = v14;
          id v32 = v15;
          [v14 enumerateDescendentNodesUsingBlock:v31];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v11);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) removeFromParentNode];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v18);
    }

    if ([v25 count])
    {
      v21 = [(SRUIFConversation *)v22 delegate];
      [v21 conversation:v22 didRemoveItemsWithIdentifiers:v25 atIndexPaths:v24 parentItemIdentifiers:v23];
    }
    id v4 = v26;
  }
}

void __34__SRUIFConversation__removeNodes___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 item];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = [v14 parentNode];
    id v7 = [*(id *)(a1 + 40) _rootNode];
    if (v6 == v7)
    {
      id v9 = [MEMORY[0x263EFF9D0] null];
    }
    else
    {
      id v8 = [v6 item];
      id v9 = [v8 identifier];
    }
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v3 identifier];
      [v10 addObject:v11];

      uint64_t v12 = *(void **)(a1 + 48);
      v13 = [v14 absoluteIndexPath];
      [v12 addObject:v13];

      [*(id *)(a1 + 56) addObject:v9];
    }
  }
}

uint64_t __34__SRUIFConversation__removeNodes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__1;
  long long v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  if ([(SRUIFConversation *)self _nodeContainsProvisionalItems:v8]) {
    char v11 = [v10 isConfirmedDialogPhase];
  }
  else {
    char v11 = 0;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke;
  v21[3] = &unk_264786270;
  char v23 = v11;
  id v12 = v9;
  id v22 = v12;
  v13 = (void *)MEMORY[0x22A643DA0](v21);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2;
  v17[3] = &unk_264786298;
  char v20 = v11;
  id v14 = v13;
  id v18 = v14;
  uint64_t v19 = &v24;
  [v8 enumerateChildNodesWithOptions:2 usingBlock:v17];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dialogPhase];
  uint64_t v5 = [v3 presentationState];
  id v6 = [v3 aceObject];

  int v7 = [v4 isExpository];
  int v8 = v7;
  if (v5 == 2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
  }
  if (([v4 isConfirmationDialogPhase] & 1) != 0
    || [v4 isClarificationDialogPhase])
  {
    int v9 = objc_msgSend(*(id *)(a1 + 32), "af_isUtterance") ^ 1;
  }
  else
  {
    int v9 = 1;
  }
  id v10 = [*(id *)(a1 + 32) encodedClassName];
  char v11 = [v6 encodedClassName];
  if ([v10 isEqualToString:v11])
  {
    id v12 = [*(id *)(a1 + 32) groupIdentifier];
    v13 = [v6 groupIdentifier];
    unsigned int v14 = [v12 isEqualToString:v13];
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v9 & v8 & v14;
}

void __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v7 = [v11 item];
  int v8 = v7;
  if (*(unsigned char *)(a1 + 48)
    || ([v7 dialogPhase],
        int v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isUserRequestDialogPhase],
        v9,
        (v10 & 1) == 0))
  {
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = 1;
LABEL_6:
}

- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v6 = a4;
  int v7 = (NSObject **)MEMORY[0x263F28348];
  if (!v6)
  {
    id v6 = +[SRUIFDialogPhase completionDialogPhase];
    int v8 = *v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[SRUIFConversation _processInsertions:inDialogPhase:]";
      __int16 v61 = 2112;
      id v62 = v6;
      _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s No dialog phase provided for conversation insertions; defaulting to %@",
        buf,
        0x16u);
    }
  }
  if (([v6 isConfirmationDialogPhase] & 1) != 0
    || [v6 isClarificationDialogPhase])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v37 = v9;
  v39 = [MEMORY[0x263EFF9B0] orderedSet];
  char v10 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v36 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v34 = [MEMORY[0x263EFF9B0] orderedSet];
  id v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke;
  v56[3] = &unk_2647862C0;
  id v12 = self;
  v56[4] = self;
  id v13 = v11;
  id v57 = v13;
  [v40 enumerateObjectsUsingBlock:v56];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v38 = v13;
  obuint64_t j = [v13 keyEnumerator];
  uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v53;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
        uint64_t v19 = [v38 objectForKey:v18];
        char v20 = objc_msgSend(v40, "sruif_arrayByMappingWithBlock:", &__block_literal_global_2);
        if (([v6 isExpository] & 1) == 0
          && ([v6 isConfirmedDialogPhase] & 1) == 0
          && (([v20 containsObject:&unk_26D9B5F98] & 1) != 0
           || ([v20 containsObject:&unk_26D9B5FB0] & 1) != 0
           || [v20 containsObject:&unk_26D9B5FC8])
          && [(SRUIFConversation *)v12 _nodeContainsProvisionalItems:v18])
        {
          if (([v6 isConfirmationDialogPhase] & 1) != 0
            || [v6 isClarificationDialogPhase])
          {
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_18;
            v50[3] = &unk_264786308;
            id v51 = v36;
            [v18 enumerateChildNodesUsingBlock:v50];
            v21 = &v51;
          }
          else
          {
            if ([v6 isSummaryDialogPhase]) {
              goto LABEL_23;
            }
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v48[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2_19;
            v48[3] = &unk_264786308;
            id v49 = v34;
            [v18 enumerateChildNodesWithOptions:2 usingBlock:v48];
            v21 = &v49;
          }
        }
LABEL_23:
        if (([v20 containsObject:&unk_26D9B5F98] & 1) != 0
          || [v20 containsObject:&unk_26D9B5FB0])
        {
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_3;
          v46[3] = &unk_264786308;
          id v47 = v36;
          [v18 enumerateChildNodesUsingBlock:v46];
        }
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_4;
        v41[3] = &unk_264786330;
        v41[4] = v12;
        v41[5] = v18;
        id v42 = v6;
        uint64_t v45 = v37;
        id v43 = v10;
        id v44 = v39;
        [v19 enumerateObjectsUsingBlock:v41];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      uint64_t v15 = v22;
    }
    while (v22);
  }

  if ([v10 count])
  {
    char v23 = [v10 array];
    uint64_t v24 = +[SRUIFTreeNode absoluteIndexPathsForTreeNodes:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }
  if ([v39 count])
  {
    id v25 = [v39 array];
    uint64_t v26 = +[SRUIFTreeNode absoluteIndexPathsForTreeNodes:v25];
  }
  else
  {
    uint64_t v26 = 0;
  }
  long long v27 = v12;
  if ([v34 count])
  {
    long long v28 = [v34 array];
    id v29 = [(SRUIFConversation *)v27 _changePresentationStateForNodes:v28];
  }
  else
  {
    id v29 = 0;
  }
  [(SRUIFConversation *)v27 notifyDelegateOfUpdates:v24 inserts:v26 presentationChanges:v29];
  if ([v36 count])
  {
    long long v30 = [v36 array];
    [(SRUIFConversation *)v27 _removeNodes:v30];
  }
  v31 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v32 = v31;
    long long v33 = [(SRUIFConversation *)v27 _rootNode];
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRUIFConversation _processInsertions:inDialogPhase:]";
    __int16 v61 = 2112;
    id v62 = v33;
    _os_log_impl(&dword_225FBA000, v32, OS_LOG_TYPE_DEFAULT, "%s rootNode=%@", buf, 0x16u);
  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 indexPath];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 indexPathByRemovingLastIndex];
  id v6 = [v4 _nodeAtIndexPath:v5];

  int v7 = [*(id *)(a1 + 40) objectForKey:v6];
  if (!v7)
  {
    int v7 = [MEMORY[0x263EFF980] array];
    [*(id *)(a1 + 40) setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

uint64_t __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 conversationItemType];
  return [v2 numberWithInteger:v3];
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_18(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 item];
  if ([v3 presentationState] == 2)
  {
    id v4 = [v3 aceObject];
    char v5 = objc_msgSend(v4, "af_isUtterance");

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2_19(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 item];
  int v7 = [v6 dialogPhase];
  if ([v7 isConfirmationDialogPhase])
  {
    id v8 = [v6 aceObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if ([v6 presentationState] == 2)
      {
        [v6 setPresentationState:3];
        [*(id *)(a1 + 32) addObject:v10];
      }
      *a4 = 1;
    }
  }
  else
  {
  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 item];
  if ([v3 isTransient]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 indexPath];
  char v5 = [v3 aceObject];
  uint64_t v6 = [v3 conversationItemType];
  int v7 = [v3 aceCommandIdentifier];
  uint64_t v8 = [v3 isTransient];
  uint64_t v9 = [v3 isSupplemental];
  uint64_t v10 = [v3 isImmersiveExperience];

  id v11 = [*(id *)(a1 + 32) _childOfNode:*(void *)(a1 + 40) withItemWhichCanBeUpdatedWithAceObject:v5 inDialogPhase:*(void *)(a1 + 48)];
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke_4";
    __int16 v34 = 2112;
    long long v35 = v5;
    _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_INFO, "%s ACE object: %@", buf, 0x16u);
  }
  if (v11)
  {
    id v13 = [v11 item];
    uint64_t v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      long long v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke";
      __int16 v34 = 2112;
      long long v35 = v15;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      __int16 v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_225FBA000, v14, OS_LOG_TYPE_DEFAULT, "%s %@: updating item %@ at %@ from ACE object.", buf, 0x2Au);
    }
    [(SRUIFTreeNode *)v13 setAceObject:v5];
    [(SRUIFTreeNode *)v13 setDialogPhase:*(void *)(a1 + 48)];
    [(SRUIFTreeNode *)v13 setPresentationState:*(void *)(a1 + 72)];
    [(SRUIFTreeNode *)v13 setAceCommandIdentifier:v7];
    [(SRUIFTreeNode *)v13 setTransient:v8];
    [(SRUIFTreeNode *)v13 setSupplemental:v9];
    [(SRUIFTreeNode *)v13 setImmersiveExperience:v10];
    [*(id *)(a1 + 56) addObject:v11];
  }
  else
  {
    id v13 = objc_alloc_init(SRUIFTreeNode);
    [*(id *)(a1 + 40) addChildNode:v13];
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    id v18 = [SRUIFMutableConversationItem alloc];
    uint64_t v30 = *(void *)(a1 + 48);
    v31 = v7;
    uint64_t v19 = *(void *)(a1 + 72);
    char v20 = objc_alloc_init(SRUIFDataStore);
    char v21 = v9;
    uint64_t v22 = v20;
    id v29 = v20;
    BYTE2(v28) = v10;
    BYTE1(v28) = v21;
    LOBYTE(v28) = v8;
    char v23 = v18;
    id v4 = v17;
    char v5 = v16;
    uint64_t v24 = v19;
    int v7 = v31;
    id v25 = -[SRUIFMutableConversationItem initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v23, "initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v6, v16, v30, v24, v31, 1, v28, v29);

    [(SRUIFTreeNode *)v13 setItem:v25];
    uint64_t v26 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      long long v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke";
      __int16 v34 = 2112;
      long long v35 = v27;
      __int16 v36 = 2112;
      uint64_t v37 = (SRUIFTreeNode *)v25;
      __int16 v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_225FBA000, v26, OS_LOG_TYPE_DEFAULT, "%s %@: adding new item %@ at %@ for ACE object.", buf, 0x2Au);
    }
    [*(id *)(a1 + 64) addObject:v13];

    id v11 = 0;
  }
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8
{
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void *)MEMORY[0x263EFF980];
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v18, "count"));
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  id v25 = __134__SRUIFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience___block_invoke;
  uint64_t v26 = &unk_264786358;
  id v27 = v15;
  id v28 = v19;
  id v29 = v14;
  BOOL v30 = a7;
  BOOL v31 = a8;
  id v20 = v14;
  id v21 = v19;
  id v22 = v15;
  [v18 enumerateObjectsUsingBlock:&v23];

  -[SRUIFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v21, v17, v23, v24, v25, v26);
}

void __134__SRUIFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectAtIndex:a3];
  int v7 = *(void **)(a1 + 40);
  uint64_t v8 = -[SRUIFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:]([SRUIFConversationInsertion alloc], "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:", 3, v6, *(void *)(a1 + 48), [v6 isTransient], *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), v9);

  [v7 addObject:v8];
}

- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4
{
  id v6 = a4;
  int v7 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  uint64_t v8 = [(SRUIFConversation *)self indexPathForItemWithIdentifier:v6];
  int64_t v9 = [(SRUIFConversation *)self numberOfChildrenForItemAtIndexPath:v8];
  if (a3 >= 1)
  {
    int64_t v10 = v9;
    int64_t v11 = v9 + a3;
    do
    {
      id v12 = [v8 indexPathByAddingIndex:v10];
      [v7 addObject:v12];

      ++v10;
    }
    while (v10 < v11);
  }

  return v7;
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6
{
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  -[SRUIFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", [v17 count], v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  [(SRUIFConversation *)self _addItemsForAceViews:v17 withDialogPhase:v16 fromCommandWithIdentifier:v15 atIndexPaths:v18 isSupplemental:v9 isImmersiveExperience:v8];
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
}

- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5
{
}

- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5
{
}

- (void)addItemsForAddViewsCommand:(id)a3
{
  id v4 = a3;
  char v5 = [v4 dialogPhase];
  id v10 = +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:v5];

  id v6 = [v4 views];
  int v7 = [v4 aceId];
  uint64_t v8 = [v4 supplemental];
  uint64_t v9 = [v4 immersiveExperience];

  [(SRUIFConversation *)self _addItemsForAceViews:v6 withDialogPhase:v10 fromCommandWithIdentifier:v7 asChildrenOfItemWithIdentifier:0 isSupplemental:v8 isImmersiveExperience:v9];
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = -[SRUIFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", [v15 count], v13);

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __113__SRUIFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke;
  v20[3] = &unk_264786380;
  id v22 = v12;
  int64_t v23 = a4;
  id v21 = v16;
  id v17 = v12;
  id v18 = v16;
  uint64_t v19 = objc_msgSend(v15, "sruif_arrayByMappingWithBlock:", v20);

  [(SRUIFConversation *)self _processInsertions:v19 inDialogPhase:v14];
}

SRUIFConversationInsertion *__113__SRUIFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke(void *a1, void *a2, uint64_t a3)
{
  char v5 = (void *)a1[4];
  id v6 = a2;
  int v7 = [v5 objectAtIndex:a3];
  uint64_t v8 = [[SRUIFConversationInsertion alloc] initWithConversationItemType:a1[6] aceObject:v6 aceCommandIdentifier:a1[5] transient:0 supplemental:0 immersiveExperience:0 indexPath:v7];

  return v8;
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
}

- (void)addItemForSpeechRecognizedCommand:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263EFF980] array];
  id v6 = [v4 refId];
  int v7 = [(SRUIFConversation *)self _rootNode];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__SRUIFConversation_addItemForSpeechRecognizedCommand___block_invoke;
  v14[3] = &unk_2647863A8;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  [v7 enumerateDescendentNodesUsingBlock:v14];

  if ([v10 count])
  {
    [(SRUIFConversation *)self notifyDelegateOfUpdates:v10 inserts:0 presentationChanges:0];
  }
  else
  {
    v18[0] = v9;
    int64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v12 = [v9 aceId];
    id v13 = +[SRUIFDialogPhase userRequestDialogPhase];
    [(SRUIFConversation *)self _addItemsForAceObjects:v11 type:1 aceCommandIdentifier:v12 dialogPhase:v13 asChildrenOfItemWithIdentifier:0];
  }
}

void __55__SRUIFConversation_addItemForSpeechRecognizedCommand___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 item];
  id v4 = [v3 aceObject];
  char v5 = [v4 refId];
  if ([v5 isEqualToString:a1[4]])
  {
    uint64_t v6 = [v3 type];

    if (v6 != 2) {
      goto LABEL_6;
    }
    [v3 setAceObject:a1[5]];
    [v3 setType:1];
    int v7 = (void *)a1[6];
    id v4 = [v8 absoluteIndexPath];
    [v7 addObject:v4];
  }
  else
  {
  }
LABEL_6:
}

- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    if (!additionalInterpretationsForRefId)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v10 = self->_additionalInterpretationsForRefId;
      self->_additionalInterpretationsForRefId = v9;

      additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    }
    id v11 = [(NSMutableDictionary *)additionalInterpretationsForRefId objectForKey:v7];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(NSMutableDictionary *)self->_additionalInterpretationsForRefId setValue:v11 forKey:v7];
    }
    [v11 addObject:v6];
    id v12 = [MEMORY[0x263EFF980] array];
    id v13 = [(SRUIFConversation *)self _rootNode];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __61__SRUIFConversation_addAdditionalSpeechInterpretation_refId___block_invoke;
    uint64_t v19 = &unk_2647863D0;
    id v20 = v7;
    id v14 = v12;
    id v21 = v14;
    [v13 enumerateDescendentNodesUsingBlock:&v16];

    if (objc_msgSend(v14, "count", v16, v17, v18, v19)) {
      [(SRUIFConversation *)self notifyDelegateOfUpdates:v14 inserts:0 presentationChanges:0];
    }
  }
  else
  {
    id v15 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFConversation addAdditionalSpeechInterpretation:refId:](v15);
    }
  }
}

void __61__SRUIFConversation_addAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 item];
  id v4 = [v3 aceObject];
  char v5 = [v4 refId];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v9 absoluteIndexPath];
    [v7 addObject:v8];
  }
}

- (id)additionalSpeechInterpretationsForRefId:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_additionalInterpretationsForRefId objectForKey:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_updatedUserUtteranceForRefId)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updatedUserUtteranceForRefId = self->_updatedUserUtteranceForRefId;
    self->_updatedUserUtteranceForRefId = v10;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x263F286C8]) initWithPhrases:v13 utterances:v8];
  [(NSMutableDictionary *)self->_updatedUserUtteranceForRefId setObject:v12 forKey:v9];
}

- (id)updatedUserUtteranceForRefId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_updatedUserUtteranceForRefId objectForKey:a3];
}

- (void)addItemForPartialResultCommand:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263EFF980] array];
  int v6 = [v4 refId];
  id v7 = [(SRUIFConversation *)self _rootNode];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__SRUIFConversation_addItemForPartialResultCommand___block_invoke;
  v14[3] = &unk_2647863A8;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  [v7 enumerateDescendentNodesUsingBlock:v14];

  if ([v10 count])
  {
    [(SRUIFConversation *)self notifyDelegateOfUpdates:v10 inserts:0 presentationChanges:0];
  }
  else
  {
    v18[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v12 = [v9 aceId];
    id v13 = +[SRUIFDialogPhase userRequestDialogPhase];
    [(SRUIFConversation *)self _addItemsForAceObjects:v11 type:2 aceCommandIdentifier:v12 dialogPhase:v13 asChildrenOfItemWithIdentifier:0];
  }
}

void __52__SRUIFConversation_addItemForPartialResultCommand___block_invoke(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 item];
  if ([v3 type] == 2)
  {
    id v4 = [v3 aceObject];
    char v5 = [v4 refId];
    int v6 = [v5 isEqualToString:a1[4]];

    if (v6)
    {
      [v3 setAceObject:a1[5]];
      id v7 = (void *)a1[6];
      id v8 = [v9 absoluteIndexPath];
      [v7 addObject:v8];
    }
  }
}

- (void)addItemsForShowHelpCommand:(id)a3
{
  id v19 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  char v5 = [(SRUIFConversation *)self _indexPathsForAddingItemsWithCount:2 asChildrenOfItemWithIdentifier:0];
  int v6 = (void *)[v5 mutableCopy];

  id v7 = [v19 text];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F64EF0]);
    [v8 setText:v7];
    id v9 = [v19 speakableText];
    [v8 setSpeakableText:v9];

    id v10 = [v6 firstObject];
    [v6 removeObjectAtIndex:0];
    id v11 = [SRUIFConversationInsertion alloc];
    id v12 = [v19 aceId];
    id v13 = [(SRUIFConversationInsertion *)v11 initWithConversationItemType:3 aceObject:v8 aceCommandIdentifier:v12 transient:0 supplemental:0 immersiveExperience:0 indexPath:v10];
    [v4 addObject:v13];
  }
  id v14 = [SRUIFConversationInsertion alloc];
  id v15 = [v19 aceId];
  id v16 = [v6 firstObject];
  id v17 = [(SRUIFConversationInsertion *)v14 initWithConversationItemType:4 aceObject:v19 aceCommandIdentifier:v15 transient:0 supplemental:0 immersiveExperience:0 indexPath:v16];
  [v4 addObject:v17];

  id v18 = +[SRUIFDialogPhase completionDialogPhase];
  [(SRUIFConversation *)self _processInsertions:v4 inDialogPhase:v18];
}

- (void)addItemForMusicStartSessionCommand:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v9 count:1];
  id v7 = objc_msgSend(v5, "aceId", v9, v10);
  id v8 = +[SRUIFDialogPhase reflectionDialogPhase];

  [(SRUIFConversation *)self _addItemsForAceObjects:v6 type:5 aceCommandIdentifier:v7 dialogPhase:v8 asChildrenOfItemWithIdentifier:0];
}

- (void)addSelectionResponse:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v8 count:1];
  id v7 = +[SRUIFDialogPhase userRequestDialogPhase];

  [(SRUIFConversation *)self addItemsForAceViews:v6 withDialogPhase:v7 asChildrenOfItemWithIdentifier:0];
}

- (void)updateWithUpdateViewsCommand:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v4;
  obuint64_t j = [v4 views];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        id v11 = [(SRUIFConversation *)self _rootNode];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __50__SRUIFConversation_updateWithUpdateViewsCommand___block_invoke;
        v14[3] = &unk_2647863D0;
        void v14[4] = v10;
        id v15 = v5;
        [v11 enumerateDescendentNodesUsingBlock:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(SRUIFConversation *)self notifyDelegateOfUpdates:v5 inserts:0 presentationChanges:0];
}

void __50__SRUIFConversation_updateWithUpdateViewsCommand___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 item];
  if ([v3 type] == 3)
  {
    id v4 = [v3 aceObject];
    id v5 = [v4 viewId];
    uint64_t v6 = [*(id *)(a1 + 32) viewId];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      [v3 setAceObject:*(void *)(a1 + 32)];
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v10 absoluteIndexPath];
      [v8 addObject:v9];
    }
  }
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SRUIFConversation *)self removeItemsAtIndexPaths:v5];
}

- (void)removeItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[SRUIFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SRUIFConversation *)self _removeNodes:v5];
}

- (void)removeItemsFollowingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = objc_msgSend(v4, "indexAtPosition:", objc_msgSend(v4, "length") - 1);
    uint64_t v7 = [v4 indexPathByRemovingLastIndex];
    uint64_t v8 = [(SRUIFConversation *)self _nodeAtIndexPath:v7];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __57__SRUIFConversation_removeItemsFollowingItemAtIndexPath___block_invoke;
    long long v13 = &unk_2647863F8;
    id v14 = v5;
    uint64_t v15 = v6;
    id v9 = v5;
    [v8 enumerateChildNodesWithOptions:2 usingBlock:&v10];
    -[SRUIFConversation _removeNodes:](self, "_removeNodes:", v9, v10, v11, v12, v13);
  }
}

uint64_t __57__SRUIFConversation_removeItemsFollowingItemAtIndexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) < a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  *a4 = 1;
  return result;
}

- (void)removeTransientItems
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SRUIFConversation *)self _rootNode];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SRUIFConversation_removeTransientItems__block_invoke;
  v6[3] = &unk_264786420;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateDescendentNodesUsingBlock:v6];

  [(SRUIFConversation *)self _removeNodes:v5];
}

void __41__SRUIFConversation_removeTransientItems__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 item];
  if ([v3 isTransient]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)cancelItemWithIdentifier:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = [(SRUIFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:0];
  id v5 = [(SRUIFConversation *)self _itemAtIndexPath:v4];
  if ([v5 presentationState] != 3)
  {
    [v5 setPresentationState:3];
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [(SRUIFConversation *)self notifyDelegateOfUpdates:0 inserts:0 presentationChanges:v6];
  }
}

- (BOOL)containsItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(SRUIFConversation *)self _rootNode];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SRUIFConversation_containsItemWithIdentifier___block_invoke;
  v8[3] = &unk_264786448;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 enumerateDescendentNodesUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __48__SRUIFConversation_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = [a2 item];
  id v5 = [v7 identifier];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)identifierOfItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  id v4 = [v3 identifier];

  return v4;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  return [(SRUIFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:0];
}

- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  long long v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  if (v5)
  {
    int v6 = [(SRUIFConversation *)self _rootNode];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__SRUIFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke;
    v11[3] = &unk_264786448;
    id v12 = v5;
    uint64_t v13 = &v14;
    [v6 enumerateDescendentNodesUsingBlock:v11];

    id v7 = v12;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F088C8]);
    id v7 = (void *)v15[5];
    v15[5] = (uint64_t)v8;
  }

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __71__SRUIFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  id v5 = [v11 item];
  int v6 = *(void **)(a1 + 32);
  id v7 = [v5 identifier];
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    uint64_t v8 = [v11 absoluteIndexPath];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a3 = 1;
  }
}

- (BOOL)hasItemWithIdentifier:(id)a3
{
  id v3 = [(SRUIFConversation *)self _indexPathForItemWithIdentifier:a3 ignoreNonExistent:1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)itemWithIdentifier:(id)a3
{
  BOOL v4 = [(SRUIFConversation *)self indexPathForItemWithIdentifier:a3];
  id v5 = [(SRUIFConversation *)self itemAtIndexPath:v4];

  return v5;
}

- (id)parentOfItemWithIdentifier:(id)a3
{
  BOOL v4 = [(SRUIFConversation *)self indexPathForItemWithIdentifier:a3];
  id v5 = [v4 indexPathByRemovingLastIndex];
  int v6 = [(SRUIFConversation *)self _itemAtIndexPath:v5];

  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (id)lastItem
{
  id v3 = objc_alloc_init(MEMORY[0x263F088C8]);
  uint64_t v4 = [(SRUIFConversation *)self numberOfChildrenForItemAtIndexPath:v3];

  if (v4 < 1)
  {
    int v6 = 0;
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F088C8]) initWithIndex:v4 - 1];
    int v6 = [(SRUIFConversation *)self _itemAtIndexPath:v5];
  }
  return v6;
}

- (int64_t)typeForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 type];

  return v4;
}

- (id)dialogPhaseForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 dialogPhase];

  return v4;
}

- (id)aceObjectForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 aceObject];

  return v4;
}

- (int64_t)presentationStateForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 presentationState];

  return v4;
}

- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3
{
  int64_t v4 = [(SRUIFConversation *)self indexPathForItemWithIdentifier:a3];
  int64_t v5 = [(SRUIFConversation *)self numberOfChildrenForItemAtIndexPath:v4];

  return v5;
}

- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _nodeAtIndexPath:a3];
  int64_t v4 = [v3 numberOfChildNodes];

  return v4;
}

- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  int64_t v4 = [v3 aceCommandIdentifier];

  return v4;
}

- (BOOL)itemAtIndexPathIsVirgin:(id)a3
{
  id v3 = [(SRUIFConversation *)self _itemAtIndexPath:a3];
  char v4 = [v3 isVirgin];

  return v4;
}

- (id)itemsRelatedToIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_alloc_init(MEMORY[0x263F088C8]);
  int64_t v7 = [(SRUIFConversation *)self numberOfChildrenForItemAtIndexPath:v6];

  long long v18 = v4;
  uint64_t v8 = [(SRUIFConversation *)self itemWithIdentifier:v4];
  uint64_t v9 = [v8 aceObject];
  uint64_t v10 = [v9 refId];

  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v12 = [MEMORY[0x263F088C8] indexPathWithIndex:i];
      uint64_t v13 = [(SRUIFConversation *)self itemAtIndexPath:v12];

      uint64_t v14 = [v13 aceObject];
      uint64_t v15 = [v14 refId];
      int v16 = [v15 isEqualToString:v10];

      if (v16) {
        [v5 addObject:v13];
      }
    }
  }

  return v5;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SRUIFConversation *)self _rootNode];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __47__SRUIFConversation__enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_264786470;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateDescendentNodesUsingBlock:v7];
}

void __47__SRUIFConversation__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 item];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (BOOL)containsItemForAceViewWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __58__SRUIFConversation_containsItemForAceViewWithIdentifier___block_invoke;
  v7[3] = &unk_264786498;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SRUIFConversation *)self _enumerateItemsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __58__SRUIFConversation_containsItemForAceViewWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  BOOL v5 = [v10 type] == 3;
  id v6 = v10;
  if (v5)
  {
    int64_t v7 = [v10 aceObject];
    id v8 = [v7 viewId];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    id v6 = v10;
  }
}

- (BOOL)_nodeContainsProvisionalItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SRUIFConversation__nodeContainsProvisionalItems___block_invoke;
  v6[3] = &unk_2647864C0;
  void v6[4] = &v7;
  [v3 enumerateChildNodesWithOptions:2 usingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__SRUIFConversation__nodeContainsProvisionalItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 item];
  if ([v6 presentationState] == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)_changePresentationStateForNodes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = [MEMORY[0x263EFF980] array];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "parentNode", (void)v14);

          if (v11)
          {
            uint64_t v12 = [v10 absoluteIndexPath];
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)propertyListRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26D9B5FE0 forKey:@"Version"];
  char v4 = [(SRUIFConversation *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"Identifier"];

  uint64_t v6 = [(SRUIFConversation *)self languageCode];
  [v3 setObject:v6 forKey:@"LanguageCode"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SRUIFConversation isSynchronizedWithServer](self, "isSynchronizedWithServer"));
  [v3 setObject:v7 forKey:@"SynchronizedWithServer"];

  uint64_t v8 = objc_alloc_init(SRUIFTreeNodePropertyListSerialization);
  uint64_t v9 = [(SRUIFConversation *)self _rootNode];
  char v10 = [(SRUIFTreeNodePropertyListSerialization *)v8 propertyListWithTreeNode:v9 itemPropertyListCreation:&__block_literal_global_51];

  [v3 setObject:v10 forKey:@"RootNode"];
  return v3;
}

uint64_t __47__SRUIFConversation_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 propertyListRepresentation];
}

- (SRUIFConversation)initWithPropertyListRepresentation:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(SRUIFDictionarySchema);
  uint64_t v6 = +[SRUIFCoercion stringToUUIDCoercion];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Identifier"];

  uint64_t v7 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Version"];

  uint64_t v8 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v8 forKey:@"LanguageCode"];

  uint64_t v9 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v9 forKey:@"SynchronizedWithServer"];

  char v10 = [[SRUIFCoercion alloc] initWithBlock:&__block_literal_global_57];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v10 forKey:@"RootNode"];

  id v27 = 0;
  id v11 = [(SRUIFDictionarySchema *)v5 coerceObject:v4 error:&v27];
  id v12 = v27;
  if (!v11)
  {
    uint64_t v24 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SRUIFConversation *)v24 initWithPropertyListRepresentation:(uint64_t)v4];
    }
    goto LABEL_10;
  }
  char v13 = [v11 objectForKey:@"Version"];
  uint64_t v14 = [v13 integerValue];

  if (v14 != 1)
  {
    id v25 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFConversation initWithPropertyListRepresentation:](v14, v25);
    }
LABEL_10:
    int64_t v23 = 0;
    goto LABEL_11;
  }
  long long v15 = [v11 objectForKey:@"Identifier"];
  long long v16 = [v11 objectForKey:@"LanguageCode"];
  long long v17 = [v11 objectForKey:@"SynchronizedWithServer"];
  uint64_t v18 = [v17 BOOLValue];

  uint64_t v19 = [v11 objectForKey:@"RootNode"];
  self = [(SRUIFConversation *)self initWithIdentifier:v15 languageCode:v16 rootNode:v19];
  [(SRUIFConversation *)self setSynchronizedWithServer:v18];
  id v20 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    id v22 = [(SRUIFConversation *)self _rootNode];
    *(_DWORD *)buf = 136315394;
    id v29 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
    __int16 v30 = 2112;
    BOOL v31 = v22;
    _os_log_impl(&dword_225FBA000, v21, OS_LOG_TYPE_DEFAULT, "%s rootNode=%@", buf, 0x16u);
  }
  int64_t v23 = self;
LABEL_11:

  return v23;
}

id __56__SRUIFConversation_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = objc_alloc_init(SRUIFTreeNodePropertyListSerialization);
  uint64_t v6 = [(SRUIFTreeNodePropertyListSerialization *)v5 treeNodeWithPropertyList:v4 error:a3 itemCreation:&__block_literal_global_59];

  return v6;
}

SRUIFMutableConversationItem *__56__SRUIFConversation_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SRUIFMutableConversationItem alloc] initWithPropertyListRepresentation:v2];

  return v3;
}

- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v23 count])
  {
    char v10 = [(SRUIFConversation *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(SRUIFConversation *)self delegate];
      [v12 conversation:self didUpdateItemsAtIndexPaths:v23];
    }
  }
  if ([v8 count])
  {
    char v13 = [(SRUIFConversation *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      long long v15 = [(SRUIFConversation *)self delegate];
      [v15 conversation:self didInsertItemsAtIndexPaths:v8];
    }
  }
  if ([v9 count])
  {
    long long v16 = [(SRUIFConversation *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(SRUIFConversation *)self delegate];
      [v18 conversation:self presentationStateDidChangeForItemsAtIndexPaths:v9];
    }
  }
  if ([v23 count] || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    uint64_t v19 = [[SRUIFConversationTransaction alloc] initWithUpdatedItemIndexPaths:v23 insertedItemIndexPaths:v8 presentationStateChangedItemIndexPaths:v9];
    id v20 = [(SRUIFConversation *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(SRUIFConversation *)self delegate];
      [v22 conversation:self didChangeWithTransaction:v19];
    }
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)isSynchronizedWithServer
{
  return self->_synchronizedWithServer;
}

- (void)setSynchronizedWithServer:(BOOL)a3
{
  self->_synchronizedWithServer = a3;
}

- (SRUIFConversationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFConversationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SRUIFTreeNode)_rootNode
{
  return self->_rootNode;
}

- (void)_setRootNode:(id)a3
{
}

- (SRUIFConversationStorable)lastRestoredItem
{
  return self->_lastRestoredItem;
}

- (void)_setLastRestoredItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRestoredItem, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updatedUserUtteranceForRefId, 0);
  objc_storeStrong((id *)&self->_additionalInterpretationsForRefId, 0);
}

- (void)addAdditionalSpeechInterpretation:(os_log_t)log refId:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[SRUIFConversation addAdditionalSpeechInterpretation:refId:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Unable to add additional speech interpretation, invalid refId", (uint8_t *)&v1, 0xCu);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [a2 localizedFailureReason];
  int v7 = 136315650;
  id v8 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
  __int16 v9 = 2112;
  char v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_225FBA000, v5, OS_LOG_TYPE_ERROR, "%s passed invalid property list (%@): %{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
  __int16 v4 = 2050;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s Unable to create conversation from property list with version %{public}ld", (uint8_t *)&v2, 0x16u);
}

@end