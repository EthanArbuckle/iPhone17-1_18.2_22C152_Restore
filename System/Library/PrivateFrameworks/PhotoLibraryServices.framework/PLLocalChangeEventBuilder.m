@interface PLLocalChangeEventBuilder
+ (id)localEventFromTransaction:(id)a3;
+ (id)localEventWithBuilderBlock:(id)a3;
- (BOOL)_isCloudStateDeletedOnTombstone:(id)a3;
- (BOOL)_shouldRecordTransaction:(id)a3;
- (BOOL)isCoalescedEvent;
- (BOOL)isEmpty;
- (BOOL)isSyncChange;
- (BOOL)isUnknownMergeEvent;
- (Class)_cloudDeletableEntityFromChange:(id)a3;
- (PLLocalChangeEventBuilder)init;
- (id)_filteredUpdatedPropertiesFromChange:(id)a3;
- (id)buildLocalEvent;
- (id)recordChangedObjectIDBlockForChangeKey:(id)a3;
- (id)recordDeletedCloudGUIDBlockForChangeKey:(id)a3;
- (id)transactionFilter;
- (id)updatedPropertyFilter;
- (void)_recordCloudDeleteForChange:(id)a3;
- (void)_recordDeleteChange:(id)a3;
- (void)_recordInsertChange:(id)a3;
- (void)_recordUpdateChange:(id)a3;
- (void)recordAllTransactionsFromIterator:(id)a3;
- (void)recordChange:(id)a3;
- (void)recordDeletedCloudGUID:(id)a3 forType:(int64_t)a4;
- (void)recordDeletedObjectID:(id)a3;
- (void)recordInsertedObjectID:(id)a3;
- (void)recordTransaction:(id)a3;
- (void)recordTransactionsFromIterator:(id)a3 untilTest:(id)a4;
- (void)recordUpdatedAttributes:(unint64_t)a3 andRelationships:(unint64_t)a4 forObjectID:(id)a5;
- (void)recordUpdatedObjectID:(id)a3;
- (void)setCoalescedEvent:(BOOL)a3;
- (void)setSyncChange:(BOOL)a3;
- (void)setTransactionFilter:(id)a3;
- (void)setUnknownMergeEvent:(BOOL)a3;
- (void)setUpdatedPropertyFilter:(id)a3;
@end

@implementation PLLocalChangeEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPropertyFilter, 0);
  objc_storeStrong(&self->_transactionFilter, 0);
  objc_storeStrong((id *)&self->_lastTransactionNumber, 0);
  objc_storeStrong((id *)&self->_deletedSocialGroupCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscribedLibraryScopeCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedOwnedLibraryScopeCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedInternalResourceUUIDToResourceTypeMappings, 0);
  objc_storeStrong((id *)&self->_deletedUserFeedbackCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSuggestionCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscribedMomentShareCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedOwnedMomentShareCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedFaceCropCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedPersonCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedMemoryCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedAlbumCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedAssetCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_relationshipsByOID, 0);
  objc_storeStrong((id *)&self->_attributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
}

- (void)setUpdatedPropertyFilter:(id)a3
{
}

- (id)updatedPropertyFilter
{
  return self->_updatedPropertyFilter;
}

- (void)setTransactionFilter:(id)a3
{
}

- (id)transactionFilter
{
  return self->_transactionFilter;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (BOOL)isUnknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setSyncChange:(BOOL)a3
{
  self->_syncChange = a3;
}

- (BOOL)isSyncChange
{
  return self->_syncChange;
}

- (void)setCoalescedEvent:(BOOL)a3
{
  self->_coalescedEvent = a3;
}

- (BOOL)isCoalescedEvent
{
  return self->_coalescedEvent;
}

- (id)buildLocalEvent
{
  if ([(PLLocalChangeEventBuilder *)self isEmpty])
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(NSMutableSet *)self->_insertedObjectIDs allObjects];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1BDF0]];

    v6 = [(NSMutableSet *)self->_updatedObjectIDs allObjects];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F1BFA0]];

    v7 = [(NSMutableSet *)self->_deletedObjectIDs allObjects];
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1BDB8]];

    v8 = (void *)[(NSMutableDictionary *)self->_attributesByOID copy];
    [v4 setObject:v8 forKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];

    v9 = (void *)[(NSMutableDictionary *)self->_relationshipsByOID copy];
    [v4 setObject:v9 forKeyedSubscript:@"PLUpdatedRelationshipsByObjectIDKey"];

    v10 = (void *)[(NSMutableArray *)self->_deletedAssetCloudGUIDs copy];
    [v4 setObject:v10 forKeyedSubscript:@"cloudAssetDeleteGUIDs"];

    v11 = (void *)[(NSMutableArray *)self->_deletedAlbumCloudGUIDs copy];
    [v4 setObject:v11 forKeyedSubscript:@"cloudAlbumDeleteGUIDs"];

    v12 = (void *)[(NSMutableArray *)self->_deletedMemoryCloudGUIDs copy];
    [v4 setObject:v12 forKeyedSubscript:@"cloudMemoryDeleteGUIDs"];

    v13 = (void *)[(NSMutableArray *)self->_deletedPersonCloudGUIDs copy];
    [v4 setObject:v13 forKeyedSubscript:@"cloudPersonDeleteGUIDs"];

    v14 = (void *)[(NSMutableArray *)self->_deletedFaceCropCloudGUIDs copy];
    [v4 setObject:v14 forKeyedSubscript:@"cloudFaceCropDeleteGUIDs"];

    v15 = (void *)[(NSMutableArray *)self->_deletedOwnedMomentShareCloudGUIDs copy];
    [v4 setObject:v15 forKeyedSubscript:@"cloudOwnedCMMDeleteGUIDs"];

    v16 = (void *)[(NSMutableArray *)self->_deletedSubscribedMomentShareCloudGUIDs copy];
    [v4 setObject:v16 forKeyedSubscript:@"cloudSubscribedCMMDeleteGUIDs"];

    v17 = (void *)[(NSMutableArray *)self->_deletedOwnedLibraryScopeCloudGUIDs copy];
    [v4 setObject:v17 forKeyedSubscript:@"cloudOwnedLibraryScopeDeleteGUIDs"];

    v18 = (void *)[(NSMutableArray *)self->_deletedSubscribedLibraryScopeCloudGUIDs copy];
    [v4 setObject:v18 forKeyedSubscript:@"cloudSubscribedLibraryScopeDeleteGUIDs"];

    v19 = (void *)[(NSMutableArray *)self->_deletedSuggestionCloudGUIDs copy];
    [v4 setObject:v19 forKeyedSubscript:@"cloudSuggestionDeleteGUIDs"];

    v20 = (void *)[(NSMutableArray *)self->_deletedUserFeedbackCloudGUIDs copy];
    [v4 setObject:v20 forKeyedSubscript:@"cloudUserFeedbackDeleteGUIDs"];

    v21 = (void *)[(NSMutableArray *)self->_deletedInternalResourceUUIDToResourceTypeMappings copy];
    [v4 setObject:v21 forKeyedSubscript:@"cloudInternalResourceUUIDToResourceTypeMappings"];

    v22 = (void *)[(NSMutableArray *)self->_deletedSocialGroupCloudGUIDs copy];
    [v4 setObject:v22 forKeyedSubscript:@"cloudSocialGroupDeleteGUIDs"];

    v23 = [NSNumber numberWithBool:self->_coalescedEvent];
    [v4 setObject:v23 forKeyedSubscript:@"coalescedEvent"];

    v24 = [NSNumber numberWithBool:self->_syncChange];
    [v4 setObject:v24 forKeyedSubscript:@"PLSyncChangeMarker"];

    v25 = [NSNumber numberWithBool:self->_unknownMergeEvent];
    [v4 setObject:v25 forKeyedSubscript:@"PLUnknownMergeEvent"];

    [v4 setObject:self->_lastTransactionNumber forKeyedSubscript:@"lastTransactionNumber"];
    v26 = [NSNumber numberWithInteger:self->_transactionCount];
    [v4 setObject:v26 forKeyedSubscript:@"transactionCount"];

    v27 = [NSNumber numberWithInteger:self->_changeCount];
    [v4 setObject:v27 forKeyedSubscript:@"changeCount"];

    v3 = (void *)[v4 copy];
  }
  return v3;
}

- (BOOL)isEmpty
{
  return ![(NSMutableSet *)self->_insertedObjectIDs count]
      && ![(NSMutableSet *)self->_updatedObjectIDs count]
      && ![(NSMutableSet *)self->_deletedObjectIDs count]
      && ![(NSMutableDictionary *)self->_attributesByOID count]
      && ![(NSMutableDictionary *)self->_relationshipsByOID count]
      && ![(NSMutableArray *)self->_deletedAssetCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedAlbumCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedMemoryCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedPersonCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedFaceCropCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedOwnedMomentShareCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedSubscribedMomentShareCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedOwnedLibraryScopeCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedSubscribedLibraryScopeCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedSuggestionCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedUserFeedbackCloudGUIDs count]
      && ![(NSMutableArray *)self->_deletedInternalResourceUUIDToResourceTypeMappings count]
      && ![(NSMutableArray *)self->_deletedSocialGroupCloudGUIDs count];
}

- (id)recordDeletedCloudGUIDBlockForChangeKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"cloudAssetDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedAssetCloudGUIDs;
LABEL_27:
    v6 = deletedAssetCloudGUIDs;
    goto LABEL_28;
  }
  if ([v4 isEqualToString:@"cloudAlbumDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedAlbumCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudMemoryDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedMemoryCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudPersonDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedPersonCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudFaceCropDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedFaceCropCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudOwnedCMMDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedOwnedMomentShareCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudSubscribedCMMDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedSubscribedMomentShareCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudOwnedLibraryScopeDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedOwnedLibraryScopeCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudSubscribedLibraryScopeDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedSubscribedLibraryScopeCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudSuggestionDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedSuggestionCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudUserFeedbackDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedUserFeedbackCloudGUIDs;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudInternalResourceUUIDToResourceTypeMappings"])
  {
    deletedAssetCloudGUIDs = self->_deletedInternalResourceUUIDToResourceTypeMappings;
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"cloudSocialGroupDeleteGUIDs"])
  {
    deletedAssetCloudGUIDs = self->_deletedSocialGroupCloudGUIDs;
    goto LABEL_27;
  }
  v11 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to find cloud GUID array for change key: %@", buf, 0xCu);
  }

  v6 = 0;
LABEL_28:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PLLocalChangeEventBuilder_recordDeletedCloudGUIDBlockForChangeKey___block_invoke;
  v12[3] = &unk_1E5870818;
  v13 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x19F38D650](v12);
  v9 = (void *)MEMORY[0x19F38D650]();

  return v9;
}

uint64_t __69__PLLocalChangeEventBuilder_recordDeletedCloudGUIDBlockForChangeKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)recordChangedObjectIDBlockForChangeKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F1BDF0]])
  {
    insertedObjectIDs = self->_insertedObjectIDs;
LABEL_7:
    v6 = insertedObjectIDs;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F1BFA0]])
  {
    insertedObjectIDs = self->_updatedObjectIDs;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F1BDB8]])
  {
    insertedObjectIDs = self->_deletedObjectIDs;
    goto LABEL_7;
  }
  v11 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to find objectID array for change key: %@", buf, 0xCu);
  }

  v6 = 0;
LABEL_8:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PLLocalChangeEventBuilder_recordChangedObjectIDBlockForChangeKey___block_invoke;
  v12[3] = &unk_1E5870818;
  v13 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x19F38D650](v12);
  v9 = (void *)MEMORY[0x19F38D650]();

  return v9;
}

uint64_t __68__PLLocalChangeEventBuilder_recordChangedObjectIDBlockForChangeKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)_isCloudStateDeletedOnTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"cloudDeleteState"];
  BOOL v4 = (unsigned __int16)[v3 intValue] == 1;

  return v4;
}

- (Class)_cloudDeletableEntityFromChange:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 changedObjectID];
  v5 = [v4 entity];
  v6 = [v5 managedObjectClassName];

  Class v7 = NSClassFromString(v6);
  if ([(objc_class *)v7 conformsToProtocol:&unk_1EEC022E8])
  {
    v8 = v7;
  }
  else if ([(objc_class *)v7 isEqual:objc_opt_class()])
  {
    v9 = [v3 tombstone];
    v10 = [v9 objectForKeyedSubscript:@"primaryLabelCode"];
    if ([v10 intValue] == 1000)
    {
      objc_opt_class();
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_recordCloudDeleteForChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLLocalChangeEventBuilder *)self _cloudDeletableEntityFromChange:v4];
  if (v5)
  {
    v6 = v5;
    Class v7 = [v4 tombstone];
    if ([(PLLocalChangeEventBuilder *)self _isCloudStateDeletedOnTombstone:v7])
    {
      v8 = [(objc_class *)v6 cloudUUIDKeyForDeletion];
      v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        uint64_t v10 = [(objc_class *)v6 cloudDeletionTypeForTombstone:v7];
        v11 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(v4, "_pl_prettyDescription");
          int v16 = 138543874;
          v17 = v9;
          __int16 v18 = 2050;
          uint64_t v19 = v10;
          __int16 v20 = 2114;
          v21 = v12;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Recording cloud GUID for deletion %{public}@ [type: %{public}ld, %{public}@]", (uint8_t *)&v16, 0x20u);
        }
        [(PLLocalChangeEventBuilder *)self recordDeletedCloudGUID:v9 forType:v10];
      }
      else
      {
        v14 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = objc_msgSend(v4, "_pl_prettyDescription");
          int v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Not recording cloud delete change because cloud GUID is nil: %{public}@", (uint8_t *)&v16, 0xCu);
        }
        v9 = 0;
      }
    }
    else
    {
      v9 = PLPersistentHistoryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_msgSend(v4, "_pl_prettyDescription");
        int v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Not recording cloud delete change because its state is not deleted: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    goto LABEL_14;
  }
  Class v7 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v4, "_pl_prettyDescription");
    int v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Not recording cloud delete change because entity is not cloud deletable: %{public}@", (uint8_t *)&v16, 0xCu);
LABEL_14:
  }
}

- (void)_recordDeleteChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 changedObjectID];
  char v6 = [(NSMutableSet *)self->_insertedObjectIDs containsObject:v5];
  [(NSMutableSet *)self->_insertedObjectIDs removeObject:v5];
  [(NSMutableSet *)self->_updatedObjectIDs removeObject:v5];
  if (v6)
  {
    Class v7 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(v4, "_pl_prettyDescription");
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Not recording delete change because it was recorded as an insert: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [(PLLocalChangeEventBuilder *)self recordDeletedObjectID:v5];
  }
  [(PLLocalChangeEventBuilder *)self _recordCloudDeleteForChange:v4];
}

- (id)_filteredUpdatedPropertiesFromChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 updatedProperties];
  v5 = v4;
  if (self->_updatedPropertyFilter)
  {
    char v6 = objc_msgSend(v4, "_pl_filter:");

    Class v7 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = PLDescriptionForUpdateProperties(v6);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Filtered updated properties: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    char v6 = v4;
  }
  return v6;
}

- (void)_recordUpdateChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 changedObjectID];
  if ([(NSMutableSet *)self->_insertedObjectIDs containsObject:v5])
  {
    char v6 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      Class v7 = objc_msgSend(v4, "_pl_prettyDescription");
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Not recording update change because it was recorded as an insert: %@", (uint8_t *)&v10, 0xCu);
LABEL_8:
    }
  }
  else
  {
    char v6 = [(PLLocalChangeEventBuilder *)self _filteredUpdatedPropertiesFromChange:v4];
    if (![v6 count])
    {
      Class v7 = PLPersistentHistoryGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v9 = objc_msgSend(v4, "_pl_prettyDescription");
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Not recording update change because all properties were filtered out: %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_8;
    }
    [(PLLocalChangeEventBuilder *)self recordUpdatedObjectID:v5];
    v8 = [v4 updatedProperties];
    +[PLPropertyIndexMapping recordChangedProperties:v8 forObjectID:v5 inAttributesByOID:self->_attributesByOID relationshipsByOID:self->_relationshipsByOID];
  }
}

- (void)_recordInsertChange:(id)a3
{
  id v4 = [a3 changedObjectID];
  [(PLLocalChangeEventBuilder *)self recordInsertedObjectID:v4];
}

- (void)recordChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    char v6 = objc_msgSend(v4, "_pl_prettyDescription");
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Record change: %@", (uint8_t *)&v8, 0xCu);
  }
  ++self->_changeCount;
  uint64_t v7 = [v4 changeType];
  switch(v7)
  {
    case 2:
      [(PLLocalChangeEventBuilder *)self _recordDeleteChange:v4];
      break;
    case 1:
      [(PLLocalChangeEventBuilder *)self _recordUpdateChange:v4];
      break;
    case 0:
      [(PLLocalChangeEventBuilder *)self _recordInsertChange:v4];
      break;
  }
}

- (BOOL)_shouldRecordTransaction:(id)a3
{
  transactionFilter = (uint64_t (**)(id, id))self->_transactionFilter;
  if (transactionFilter) {
    return transactionFilter[2](transactionFilter, a3);
  }
  else {
    return 1;
  }
}

- (void)recordTransaction:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  BOOL v4 = -[PLLocalChangeEventBuilder _shouldRecordTransaction:](self, "_shouldRecordTransaction:");
  v5 = PLPersistentHistoryGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v19, "_pl_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Record transaction: %@", buf, 0xCu);
    }
    ++self->_transactionCount;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = [v19 changes];
    uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x19F38D3B0]();
          v14 = [v12 changedObjectID];
          if (v14)
          {
            [(PLLocalChangeEventBuilder *)self recordChange:v12];
          }
          else
          {
            id v15 = PLBackendGetLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              int v16 = objc_msgSend(v12, "_pl_prettyDescription");
              v17 = objc_msgSend(v19, "_pl_prettyDescriptionWithIndent:", 1);
              *(_DWORD *)buf = 138412546;
              v25 = v16;
              __int16 v26 = 2112;
              v27 = v17;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_FAULT, "PLLocalChangeEventBuilder: changedObjectID is nil\n%@%@", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }
  }
  else if (v6)
  {
    __int16 v18 = objc_msgSend(v19, "_pl_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Not recording transaction due to filter: %@", buf, 0xCu);
  }
}

- (void)recordTransactionsFromIterator:(id)a3 untilTest:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v6 count];
    uint64_t v10 = (void *)MEMORY[0x19F38D650](v7);
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Record transactions from iterator with count: %lu, test: %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke;
  v17[3] = &unk_1E58647E0;
  id v11 = v6;
  id v18 = v11;
  id v19 = self;
  id v20 = v7;
  id v12 = v7;
  [v11 enumerateRemainingTransactionsWithBlock:v17];
  v13 = [v11 lastIteratedToken];
  v14 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = (uint64_t)v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Last iterated token: %@", buf, 0xCu);
  }

  id v15 = +[PLPersistentHistoryUtilities transactionNumberFromToken:v13];
  lastTransactionNumber = self->_lastTransactionNumber;
  self->_lastTransactionNumber = v15;
}

void __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke_2;
  v11[3] = &unk_1E5875E18;
  v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v7 = v5;
  [v6 performBlockAndWait:v11];

  *a3 = (*(uint64_t (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9, v10);
}

uint64_t __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordTransaction:*(void *)(a1 + 40)];
}

- (void)recordAllTransactionsFromIterator:(id)a3
{
}

uint64_t __63__PLLocalChangeEventBuilder_recordAllTransactionsFromIterator___block_invoke()
{
  return 0;
}

- (void)recordUpdatedAttributes:(unint64_t)a3 andRelationships:(unint64_t)a4 forObjectID:(id)a5
{
  uint64_t v8 = NSNumber;
  id v9 = a5;
  uint64_t v10 = [v8 numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)self->_attributesByOID setObject:v10 forKeyedSubscript:v9];

  id v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)self->_relationshipsByOID setObject:v11 forKeyedSubscript:v9];
}

- (void)recordDeletedCloudGUID:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) <= 0xC)
  {
    id v7 = v6;
    [(NSMutableDictionary *)(&self->_relationshipsByOID)[a4] addObject:v6];
    id v6 = v7;
  }
}

- (void)recordDeletedObjectID:(id)a3
{
}

- (void)recordUpdatedObjectID:(id)a3
{
  id v15 = a3;
  [(NSMutableSet *)self->_updatedObjectIDs addObject:v15];
  BOOL v4 = [v15 entity];
  id v5 = [v4 name];
  id v6 = +[PLLimitedLibraryFetchFilter entityName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F8B998] sharedInstance];
    uint64_t v9 = [v8 photosAccessAllowedWithScope:7];

    if (v9 == 4)
    {
      self->_unknownMergeEvent = 1;
      uint64_t v10 = [v15 persistentStore];
      id v11 = [v10 URL];
      id v12 = [MEMORY[0x1E4F8B988] libraryURLFromDatabaseURL:v11];
      v13 = +[PLPhotoLibraryBundleController sharedBundleController];
      v14 = [v13 bundleForLibraryURL:v12];

      [v14 resetClientSandboxExtensionCache];
    }
  }
}

- (void)recordInsertedObjectID:(id)a3
{
}

- (PLLocalChangeEventBuilder)init
{
  v41.receiver = self;
  v41.super_class = (Class)PLLocalChangeEventBuilder;
  v2 = [(PLLocalChangeEventBuilder *)&v41 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    insertedObjectIDs = v2->_insertedObjectIDs;
    v2->_insertedObjectIDs = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedObjectIDs = v2->_updatedObjectIDs;
    v2->_updatedObjectIDs = v5;

    int v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedObjectIDs = v2->_deletedObjectIDs;
    v2->_deletedObjectIDs = v7;

    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedAssetCloudGUIDs = v2->_deletedAssetCloudGUIDs;
    v2->_deletedAssetCloudGUIDs = v9;

    id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedAlbumCloudGUIDs = v2->_deletedAlbumCloudGUIDs;
    v2->_deletedAlbumCloudGUIDs = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedMemoryCloudGUIDs = v2->_deletedMemoryCloudGUIDs;
    v2->_deletedMemoryCloudGUIDs = v13;

    id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedPersonCloudGUIDs = v2->_deletedPersonCloudGUIDs;
    v2->_deletedPersonCloudGUIDs = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedFaceCropCloudGUIDs = v2->_deletedFaceCropCloudGUIDs;
    v2->_deletedFaceCropCloudGUIDs = v17;

    id v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedOwnedMomentShareCloudGUIDs = v2->_deletedOwnedMomentShareCloudGUIDs;
    v2->_deletedOwnedMomentShareCloudGUIDs = v19;

    long long v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedSubscribedMomentShareCloudGUIDs = v2->_deletedSubscribedMomentShareCloudGUIDs;
    v2->_deletedSubscribedMomentShareCloudGUIDs = v21;

    __int16 v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedSuggestionCloudGUIDs = v2->_deletedSuggestionCloudGUIDs;
    v2->_deletedSuggestionCloudGUIDs = v23;

    uint64_t v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedUserFeedbackCloudGUIDs = v2->_deletedUserFeedbackCloudGUIDs;
    v2->_deletedUserFeedbackCloudGUIDs = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedInternalResourceUUIDToResourceTypeMappings = v2->_deletedInternalResourceUUIDToResourceTypeMappings;
    v2->_deletedInternalResourceUUIDToResourceTypeMappings = v27;

    uint64_t v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedOwnedLibraryScopeCloudGUIDs = v2->_deletedOwnedLibraryScopeCloudGUIDs;
    v2->_deletedOwnedLibraryScopeCloudGUIDs = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedSubscribedLibraryScopeCloudGUIDs = v2->_deletedSubscribedLibraryScopeCloudGUIDs;
    v2->_deletedSubscribedLibraryScopeCloudGUIDs = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedSocialGroupCloudGUIDs = v2->_deletedSocialGroupCloudGUIDs;
    v2->_deletedSocialGroupCloudGUIDs = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributesByOID = v2->_attributesByOID;
    v2->_attributesByOID = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationshipsByOID = v2->_relationshipsByOID;
    v2->_relationshipsByOID = v37;

    v39 = v2;
  }

  return v2;
}

+ (id)localEventFromTransaction:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLLocalChangeEventBuilder_localEventFromTransaction___block_invoke;
  v8[3] = &unk_1E586D758;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 localEventWithBuilderBlock:v8];

  return v6;
}

uint64_t __55__PLLocalChangeEventBuilder_localEventFromTransaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordTransaction:*(void *)(a1 + 32)];
}

+ (id)localEventWithBuilderBlock:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  id v4 = pl_result_with_autoreleasepool();

  return v4;
}

id __56__PLLocalChangeEventBuilder_localEventWithBuilderBlock___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(PLLocalChangeEventBuilder);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = [(PLLocalChangeEventBuilder *)v2 buildLocalEvent];

  return v3;
}

@end