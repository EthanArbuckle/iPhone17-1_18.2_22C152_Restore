@interface ICModernSearchIndexerDataSource
- (BOOL)isFolderWithServerShareChanged:(id)a3;
- (BOOL)isPaperKitOrSynapseAttachment:(id)a3;
- (ICModernSearchIndexerDataSource)initWithPersistentContainer:(id)a3;
- (ICPersistentContainer)persistentContainer;
- (id)addNotesFromSubtree:(id)a3;
- (id)additionalItemsForObject:(id)a3;
- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3;
- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3;
- (id)dataSourceIdentifier;
- (id)newManagedObjectContext;
- (id)persistentStoreCoordinator;
- (id)searchableItemForSynapseContentItem:(id)a3 note:(id)a4 attachment:(id)a5;
- (id)searchableItemResultForObject:(id)a3;
- (id)synapseItemsForObject:(id)a3;
- (unint64_t)indexingPriority;
- (void)contextWillSave:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation ICModernSearchIndexerDataSource

- (id)dataSourceIdentifier
{
  return @"Modern";
}

- (ICModernSearchIndexerDataSource)initWithPersistentContainer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICModernSearchIndexerDataSource;
  v5 = [(ICBaseSearchIndexerDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_persistentContainer, v4);
  }

  return v6;
}

- (unint64_t)indexingPriority
{
  return 2;
}

- (ICPersistentContainer)persistentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentContainer);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    v5 = +[ICNoteContext sharedContext];
    id v4 = [v5 persistentContainer];
  }
  return (ICPersistentContainer *)v4;
}

- (id)persistentStoreCoordinator
{
  v2 = [(ICModernSearchIndexerDataSource *)self persistentContainer];
  v3 = [v2 persistentStoreCoordinator];

  return v3;
}

- (id)newManagedObjectContext
{
  v2 = [(ICModernSearchIndexerDataSource *)self persistentContainer];
  v3 = +[ICNoteContext workerManagedObjectContextForContainer:v2];

  return v3;
}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (ICVerboseSearchLogging())
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICModernSearchIndexerDataSource allIndexableObjectIDsInReversedReindexingOrderWithContext:]((uint64_t)self, v5);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke;
  v9[3] = &unk_1E64A5958;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v6 performBlockAndWait:v9];
  v7 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (ICVerboseSearchLogging())
  {
    v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_7(a1, v2);
    }
  }
  v3 = +[ICCloudSyncingObject predicateForVisibleObjects];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v33[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v6 = +[ICAccount ic_objectIDsMatchingPredicate:v3 sortDescriptors:v5 context:*(void *)(a1 + 40)];

  if (ICVerboseSearchLogging())
  {
    v7 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_6();
    }
  }
  objc_super v8 = +[ICFolder predicateForVisibleObjects];
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateForLastTitleModification" ascending:1];
  v32 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v11 = +[ICFolder ic_objectIDsMatchingPredicate:v8 sortDescriptors:v10 context:*(void *)(a1 + 40)];

  if (ICVerboseSearchLogging())
  {
    uint64_t v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_5();
    }
  }
  v13 = +[ICCloudSyncingObject predicateForVisibleObjects];
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v31 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v16 = +[ICHashtag ic_objectIDsMatchingPredicate:v13 sortDescriptors:v15 context:*(void *)(a1 + 40)];

  if (ICVerboseSearchLogging())
  {
    id v17 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_4();
    }
  }
  v18 = +[ICNote predicateForSearchableNotesInContext:*(void *)(a1 + 40)];
  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:1];
  v30 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v21 = +[ICNote ic_objectIDsMatchingPredicate:v18 sortDescriptors:v20 context:*(void *)(a1 + 40)];

  if (ICVerboseSearchLogging())
  {
    v22 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3();
    }
  }
  v23 = +[ICAttachment predicateForSearchableAttachmentsInContext:*(void *)(a1 + 40)];
  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:1];
  v29 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v26 = +[ICAttachment ic_objectIDsMatchingPredicate:v23 sortDescriptors:v25 context:*(void *)(a1 + 40)];

  if (ICVerboseSearchLogging())
  {
    v27 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2();
    }
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v26);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v21);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v16);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v11);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v6);
  if (ICVerboseSearchLogging())
  {
    v28 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1();
    }
  }
}

- (void)contextWillSave:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ICModernSearchIndexerDataSource;
  [(ICBaseSearchIndexerDataSource *)&v26 contextWillSave:v4];
  v5 = [v4 object];
  id v6 = [v5 persistentStoreCoordinator];
  v7 = [(ICModernSearchIndexerDataSource *)self persistentStoreCoordinator];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [v5 updatedObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v21 = self;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v14 changedValues];
            v16 = [v15 objectForKeyedSubscript:@"didChooseToMigrate"];

            if (v16)
            {
              char v17 = 0;
              goto LABEL_13;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      char v17 = 1;
LABEL_13:
      self = v21;
    }
    else
    {
      char v17 = 1;
    }

    char v18 = ICUseCoreDataCoreSpotlightIntegration();
    if ((v17 & 1) == 0 && (v18 & 1) == 0)
    {
      v19 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ICModernSearchIndexerDataSource contextWillSave:](v19);
      }

      [(ICBaseSearchIndexerDataSource *)self setNeedsReindexing:1];
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 postNotificationName:*MEMORY[0x1E4F836B8] object:self];
    }
  }
}

- (id)searchableItemForSynapseContentItem:(id)a3 note:(id)a4 attachment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 isDeletedOrInTrash] & 1) != 0 || !objc_msgSend(v8, "isSystemPaper"))
  {
    v16 = 0;
  }
  else
  {
    uint64_t v10 = [v9 metadata];
    if (v10)
    {
      uint64_t v11 = [v9 metadata];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"is_synthetic_synapse_item"];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        uint64_t v14 = NSString;
        v15 = [v9 identifier];
        uint64_t v10 = [v14 stringWithFormat:@"sy_%@", v15];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    char v17 = (void *)MEMORY[0x1E4FA9270];
    char v18 = [v8 identifier];
    v19 = [v9 searchIndexingIdentifier];
    v20 = [v9 searchDomainIdentifier];
    v16 = [v17 searchableItemLinkingContentItem:v7 toContainerIdentifier:v18 uniqueIdentifier:v10 relatedIdentifier:v19 domainIdentifier:v20];
  }
  return v16;
}

- (id)searchableItemResultForObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICModernSearchIndexerDataSource;
  v5 = [(ICBaseSearchIndexerDataSource *)&v15 searchableItemResultForObject:v4];
  id v6 = [v5 searchableItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 managedObjectContext];
    id v8 = [v4 objectID];
    id v9 = [v7 objectWithID:v8];

    uint64_t v10 = [v9 lastOpenedDate];
    uint64_t v11 = [v6 attributeSet];
    [v11 setLastUsedDate:v10];
  }
  uint64_t v12 = [(ICModernSearchIndexerDataSource *)self additionalItemsForObject:v4];
  id v13 = objc_alloc_init(MEMORY[0x1E4F837C0]);
  [v13 setSearchableItem:v6];
  [v13 setAdditionalSearchableItems:v12];

  return v13;
}

- (BOOL)isPaperKitOrSynapseAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = ICDynamicCast();

  if (v4)
  {
    if ([v4 attachmentType] == 13)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v6 = [v4 synapseData];
      BOOL v5 = v6 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)synapseItemsForObject:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 managedObjectContext];
    BOOL v5 = [v3 objectID];
    id v6 = [v4 objectWithID:v5];

    id v7 = [v6 synapseData];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FA9238]);
      id v9 = [v6 synapseData];
      id v28 = 0;
      uint64_t v10 = (void *)[v8 initWithData:v9 error:&v28];
      id v11 = v28;

      if (v11)
      {
        uint64_t v12 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ICModernSearchIndexerDataSource synapseItemsForObject:]((uint64_t)v11, v12);
        }

        id v13 = 0;
      }
      else
      {
        v30[0] = v10;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      }
    }
    else if ([v6 attachmentType] == 8)
    {
      uint64_t v14 = [v6 URL];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4FA9238]);
        v16 = [v6 title];
        uint64_t v17 = *MEMORY[0x1E4FA9288];
        char v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Web" value:@"Web" table:0 allowSiri:1];
        v19 = [v6 URL];
        v20 = (void *)[v15 initWithDisplayTitle:v16 sourceIdentifier:v17 sourceName:v18 itemURL:v19 identifier:0];

        v21 = [v6 metadata];
        long long v22 = v21;
        if (!v21) {
          v21 = (void *)MEMORY[0x1E4F1CC08];
        }
        long long v23 = (void *)[v21 mutableCopy];

        [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is_synthetic_synapse_item"];
        long long v24 = (void *)[v23 copy];
        [v6 setMetadata:v24];

        v29 = v20;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      }
      else
      {
        objc_super v26 = (void *)MEMORY[0x1E4F836F8];
        v27 = objc_msgSend(v6, "ic_loggingIdentifier");
        [v26 handleFailedAssertWithCondition:"__objc_no", "-[ICModernSearchIndexerDataSource synapseItemsForObject:]", 1, 0, @"attachment %@ was of type ICAttachmentTypeWeb, but didn't have a URL or synapse data. Not providing any SYContentItems for this. ", v27 functionName simulateCrash showAlert format];

        id v13 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else if ([v6 attachmentType] == 13)
    {
      id v13 = +[ICPaperSynapseContentItemProvider contentItemsForAttachment:v6];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICModernSearchIndexerDataSource *)self synapseItemsForObject:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
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
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "itemIdentifier", (void)v14);
          id v11 = [v10 UUIDString];
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v12 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)additionalItemsForObject:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICModernSearchIndexerDataSource *)self synapseItemsForObject:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 managedObjectContext];
      id v41 = v4;
      uint64_t v7 = [v4 objectID];
      uint64_t v8 = [v6 objectWithID:v7];

      id v9 = [v8 note];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v40 = v5;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v51 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = -[ICModernSearchIndexerDataSource searchableItemForSynapseContentItem:note:attachment:](self, "searchableItemForSynapseContentItem:note:attachment:", *(void *)(*((void *)&v50 + 1) + 8 * i), v9, v8, v40);
            objc_msgSend(v10, "ic_addNonNilObject:", v16);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v13);
      }

      long long v17 = (void *)[v10 copy];
LABEL_30:

      id v5 = v40;
      id v4 = v41;
      goto LABEL_31;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v17 = 0;
    goto LABEL_32;
  }
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();
  if (([v8 isHiddenFromIndexing] & 1) == 0)
  {
    v40 = v5;
    id v41 = v4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    char v18 = [v8 inlineAttachments];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v47;
      v42 = (void *)*MEMORY[0x1E4F444F8];
      v43 = v18;
      uint64_t v44 = *(void *)v47;
      v45 = v8;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v47 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          if (objc_msgSend(v23, "attachmentType", v40) == 3)
          {
            long long v24 = [v23 tokenContentIdentifier];
            if (v24)
            {
              long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v24];
              uint64_t v26 = [v25 scheme];
              if (v26)
              {
                v27 = (void *)v26;
                id v28 = [v25 scheme];
                char v29 = ICIsNotesURLScheme(v28);

                uint64_t v21 = v44;
                if ((v29 & 1) == 0)
                {
                  id v30 = objc_alloc(MEMORY[0x1E4F23850]);
                  v31 = [v42 identifier];
                  v32 = (void *)[v30 initWithItemContentType:v31];

                  objc_msgSend(v32, "setIc_dataSourceIdentifier:", @"Modern");
                  objc_msgSend(v32, "setIc_searchResultType:", 2);
                  v33 = [v45 account];
                  v34 = [v33 identifier];
                  [v32 setDomainIdentifier:v34];

                  objc_msgSend(v32, "ic_setURLString:", v24);
                  id v35 = objc_alloc_init(MEMORY[0x1E4F23840]);
                  [v35 setAttributeSet:v32];
                  v36 = [v23 objectID];
                  v37 = [v36 URIRepresentation];
                  v38 = [v37 absoluteString];

                  uint64_t v21 = v44;
                  [v35 setUniqueIdentifier:v38];
                  [v9 addObject:v35];

                  char v18 = v43;
                }
              }

              uint64_t v8 = v45;
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v20);
    }

    long long v17 = (void *)[v9 copy];
    goto LABEL_30;
  }
  long long v17 = 0;
LABEL_31:

LABEL_32:
  return v17;
}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 changedValues];
    id v5 = [v4 allKeys];
    char v6 = [v5 containsObject:@"serverShareData"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)addNotesFromSubtree:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__11;
  long long v17 = __Block_byref_object_dispose__11;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICModernSearchIndexerDataSource_addNotesFromSubtree___block_invoke;
  v9[3] = &unk_1E64A5958;
  id v5 = v3;
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  [v6 performBlockAndWait:v9];
  uint64_t v7 = (void *)[(id)v14[5] copy];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __55__ICModernSearchIndexerDataSource_addNotesFromSubtree___block_invoke(void *a1)
{
  v60[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:a1[4]];
  if ([v2 count])
  {
    id v4 = @"ICNote";
    unint64_t v5 = 0x1E4F1C000uLL;
    id v6 = &off_1E64A3000;
    *(void *)&long long v3 = 138412546;
    long long v35 = v3;
    do
    {
      uint64_t v7 = objc_msgSend(v2, "lastObject", v35);
      [v2 removeLastObject];
      uint64_t v8 = [objc_alloc(*(Class *)(v5 + 208)) initWithEntityName:v4];
      uint64_t v9 = [v6[203] predicateForNotesInFolder:v7];
      uint64_t v10 = +[ICCloudSyncingObject predicateForVisibleObjects];
      id v11 = (void *)MEMORY[0x1E4F28BA0];
      v40 = (void *)v10;
      id v41 = (void *)v9;
      v60[0] = v9;
      v60[1] = v10;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      uint64_t v13 = v11;
      uint64_t v14 = (void *)v8;
      uint64_t v15 = [v13 andPredicateWithSubpredicates:v12];

      v39 = (void *)v15;
      [v14 setPredicate:v15];
      [v14 setResultType:1];
      long long v16 = (void *)a1[5];
      id v53 = 0;
      long long v17 = [v16 executeFetchRequest:v14 error:&v53];
      id v42 = v53;
      v38 = v17;
      if (v42)
      {
        id v18 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          uint64_t v57 = v7;
          __int16 v58 = 2112;
          id v59 = v42;
          _os_log_error_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_ERROR, "Error fetching notes of the folder %@. %@", buf, 0x16u);
        }
      }
      else
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          v36 = v14;
          uint64_t v21 = v4;
          uint64_t v22 = v7;
          uint64_t v23 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v50 != v23) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v20);
          uint64_t v7 = v22;
          id v4 = v21;
          uint64_t v14 = v36;
        }
      }

      long long v25 = (void *)[objc_alloc(*(Class *)(v5 + 208)) initWithEntityName:@"ICFolder"];
      v43 = (void *)v7;
      uint64_t v26 = [v6[203] predicateForFoldersInFolder:v7];
      [v25 setPredicate:v26];
      v27 = (void *)a1[5];
      id v48 = 0;
      id v28 = [v27 executeFetchRequest:v14 error:&v48];
      id v29 = v48;
      if (v29)
      {
        id v30 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          uint64_t v57 = (uint64_t)v43;
          __int16 v58 = 2112;
          id v59 = v29;
          _os_log_error_impl(&dword_1C3A61000, v30, OS_LOG_TYPE_ERROR, "Error fetching folders of the folder %@. %@", buf, 0x16u);
        }
      }
      else
      {
        v37 = v14;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v30 = v28;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v45 != v33) {
                objc_enumerationMutation(v30);
              }
              [v2 addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }
          while (v32);
          id v4 = @"ICNote";
        }
        uint64_t v14 = v37;
      }

      unint64_t v5 = 0x1E4F1C000;
      id v6 = &off_1E64A3000;
    }
    while ([v2 count]);
  }
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)allIndexableObjectIDsInReversedReindexingOrderWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "allIndexableObjectIDsInReversedReindexingOrderWithContext: will performBlockAndWait for data source %@", (uint8_t *)&v2, 0xCu);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  [*(id *)(*(void *)(*(void *)v0 + 8) + 40) count];
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v1, v2, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu indexableObjectIDs: %@", v3, v4, v5, v6, 2u);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(v0, v1);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu attachment IDs: %@", v4, v5, v6, v7, v8);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(v0, v1);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu note IDs: %@", v4, v5, v6, v7, v8);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(v0, v1);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu tag IDs: %@", v4, v5, v6, v7, v8);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(v0, v1);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu folder IDs: %@", v4, v5, v6, v7, v8);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_5(v0, v1);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu account IDs: %@", v4, v5, v6, v7, v8);
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "allIndexableObjectIDsInReversedReindexingOrderWithContext: will retrieve accountObjectIDs, folderObjectIDs, tagObjectIDs, noteObjectIDs, and attachmentObjectIDs for data source %@", (uint8_t *)&v3, 0xCu);
}

- (void)contextWillSave:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "A modern account's migration state changed, so let's re-index everything.", v1, 2u);
}

- (void)synapseItemsForObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Encountered error while trying to deserialize synapse content item: %@", (uint8_t *)&v2, 0xCu);
}

@end