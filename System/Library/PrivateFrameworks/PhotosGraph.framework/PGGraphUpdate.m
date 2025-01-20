@interface PGGraphUpdate
- (BOOL)didProcessNodes;
- (BOOL)didSocialGroupsChanges;
- (BOOL)hasAnythingToDo;
- (BOOL)hasDeletedHighlightNodes;
- (BOOL)hasDeletedMomentNodes;
- (BOOL)hasDeletedPersonNodes;
- (BOOL)hasDeletedSocialGroupNodes;
- (BOOL)hasHighlightDayGroupsToInsert;
- (BOOL)hasHighlightsToDelete;
- (BOOL)hasHighlightsToInsert;
- (BOOL)hasHighlightsToUpdate;
- (BOOL)hasIncrementalChanges;
- (BOOL)hasInsertedHighlightNodes;
- (BOOL)hasInsertedMomentNodes;
- (BOOL)hasInsertedSocialGroupNodes;
- (BOOL)hasMomentsToDelete;
- (BOOL)hasMomentsToInsert;
- (BOOL)hasMomentsToUpdate;
- (BOOL)hasPersonsToDelete;
- (BOOL)hasPersonsToInsert;
- (BOOL)hasPersonsToUpdate;
- (BOOL)hasSocialGroupsToDelete;
- (BOOL)hasSocialGroupsToInsert;
- (BOOL)hasSocialGroupsToUpdate;
- (BOOL)hasUpdatedHighlightNodes;
- (BOOL)hasUpdatedMomentNodes;
- (BOOL)hasUpdatedPersonNodes;
- (BOOL)hasUpdatedPersonNodesUnrelatedToMomentChange;
- (BOOL)hasUpdatedSocialGroupNodes;
- (BOOL)isResumingFullAnalysis;
- (BOOL)isSignificant;
- (NSDictionary)registeredLocationOfInterestVisitsToResolveByMomentUUID;
- (NSDictionary)registeredResolvableItemsByBusinessItemMuid;
- (NSMutableArray)inputChanges;
- (NSMutableDictionary)highlightByHighlightUUID;
- (NSMutableDictionary)highlightsToInsertByHighlightKind;
- (NSMutableDictionary)momentByMomentUUID;
- (NSMutableDictionary)updateHighlightNodesByUpdateType;
- (NSMutableDictionary)updateMomentNodesByUpdateType;
- (NSMutableSet)deletedHighlightUUIDsForValidityCheck;
- (NSMutableSet)deletedMomentUUIDsForValidityCheck;
- (NSMutableSet)uuidsOfDeletedHighlights;
- (NSSet)additionalLocationsToPrefetch;
- (NSSet)consolidatedChanges;
- (NSSet)contactIdentifiersOfPersonsToUpdate;
- (NSSet)highlightDayGroupsToIngest;
- (NSSet)highlightDaysToIngest;
- (NSSet)identifiersForMemoriesRelatedToDeletedMoments;
- (NSSet)identifiersForMomentRelatedToDeletedPersons;
- (NSSet)identifiersForMomentRelatedToUpdatedPersons;
- (NSSet)insertedAndUpdatedPersonNodes;
- (NSSet)insertedHighlightDayGroupNodes;
- (NSSet)insertedHighlightNodes;
- (NSSet)insertedMomentNodes;
- (NSSet)localIdentifiersOfPersonsToDelete;
- (NSSet)localIdentifiersOfPersonsToInsert;
- (NSSet)localIdentifiersOfPersonsToUpdate;
- (NSSet)momentsToIngest;
- (NSSet)updatedPersonNodesUnrelatedToMomentChange;
- (NSSet)uuidsOfHighlightsToDelete;
- (NSSet)uuidsOfHighlightsToInsert;
- (NSSet)uuidsOfHighlightsToUpdate;
- (NSSet)uuidsOfMomentsToDelete;
- (NSSet)uuidsOfMomentsToInsert;
- (NSSet)uuidsOfMomentsToUpdate;
- (NSSet)uuidsOfSocialGroupsToDelete;
- (NSSet)uuidsOfSocialGroupsToInsert;
- (NSSet)uuidsOfSocialGroupsToUpdate;
- (NSString)description;
- (PGGraphUpdate)initWithPhotoLibrary:(id)a3;
- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4;
- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4 changeStreamToken:(id)a5;
- (PGGraphUpdateRelatedDetails)relatedDetails;
- (PHPersistentChangeToken)changeStreamToken;
- (id)_fetchMomentsWithUUIDs:(id)a3;
- (id)_fetchedHighlightsWithHighlightUUIDs:(id)a3;
- (id)cachedDataModelObjectForGraphChange:(id)a3;
- (id)highlightForHighlightUUID:(id)a3;
- (id)highlightsToProcessForKind:(unsigned __int16)a3 withHighlightUpdateTypes:(unint64_t)a4 includeHighlightsToIngest:(BOOL)a5;
- (id)initForChangeStreamResetInPhotoLibrary:(id)a3 updateType:(int64_t)a4;
- (id)momentNodesToProcessInGraph:(id)a3 forMomentUpdateTypes:(unint64_t)a4 includeInsertedNodes:(BOOL)a5;
- (id)momentsToProcessForMomentUpdateTypes:(unint64_t)a3 includeMomentsToIngest:(BOOL)a4;
- (int64_t)updateType;
- (unint64_t)momentUpdateTypes;
- (unint64_t)numberOfConsolidatedChanges;
- (void)_consolidate;
- (void)_consolidateIfNeeded;
- (void)_registerHighlights:(id)a3;
- (void)_registerMoments:(id)a3;
- (void)_unregisterHighlightsForHighlightUUIDs:(id)a3;
- (void)_unregisterMomentsForMomentUUIDs:(id)a3;
- (void)addChange:(id)a3;
- (void)addChanges:(id)a3;
- (void)clearInsertedAndUpdatedPersonNodes;
- (void)clearUpdatedPersonNodesUnrelatedToMomentChange;
- (void)enumerateConsolidatedChanges:(id)a3;
- (void)prepareForPostProcessingWithGraph:(id)a3;
- (void)registerInsertedAndUpdatedPersonNodes:(id)a3;
- (void)registerLocationOfInterestVisitToResolve:(id)a3 forMomentUUID:(id)a4;
- (void)registerPublicEventNode:(id)a3 withConsolidatedAddress:(id)a4 toResolveBusinessItemMuid:(unint64_t)a5;
- (void)registerUpdatedPersonNodesUnrelatedToMomentChange:(id)a3;
- (void)setAdditionalLocationsToPrefetch:(id)a3;
- (void)setHasDeletedHighlightNodes:(BOOL)a3;
- (void)setHasDeletedMomentNodes:(BOOL)a3;
- (void)setHasDeletedPersonNodes:(BOOL)a3;
- (void)setHasUpdatedPersonNodes:(BOOL)a3;
- (void)setInsertedHighlightDayGroupNodes:(id)a3;
- (void)setInsertedHighlightNodes:(id)a3;
- (void)setInsertedMomentNodes:(id)a3;
- (void)setIsResumingFullAnalysis:(BOOL)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)updatedHighlightNode:(id)a3 forUpdateChangeType:(unint64_t)a4;
- (void)updatedMomentNode:(id)a3 forUpdateChangeType:(unint64_t)a4;
@end

@implementation PGGraphUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedHighlightDayGroupNodes, 0);
  objc_storeStrong((id *)&self->_insertedHighlightNodes, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToInsert, 0);
  objc_storeStrong((id *)&self->_relatedDetails, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToInsert, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersOfPersonsToUpdate, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToUpdate, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToDelete, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToInsert, 0);
  objc_storeStrong((id *)&self->_uuidsOfDeletedHighlights, 0);
  objc_storeStrong((id *)&self->_highlightsToInsertByHighlightKind, 0);
  objc_storeStrong((id *)&self->_highlightByHighlightUUID, 0);
  objc_storeStrong((id *)&self->_updatedPersonNodesUnrelatedToMomentChange, 0);
  objc_storeStrong((id *)&self->_insertedAndUpdatedPersonNodes, 0);
  objc_storeStrong((id *)&self->_additionalLocationsToPrefetch, 0);
  objc_storeStrong((id *)&self->_insertedMomentNodes, 0);
  objc_storeStrong((id *)&self->_momentsToIngest, 0);
  objc_storeStrong((id *)&self->_deletedHighlightUUIDsForValidityCheck, 0);
  objc_storeStrong((id *)&self->_deletedMomentUUIDsForValidityCheck, 0);
  objc_storeStrong((id *)&self->_momentByMomentUUID, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToInsert, 0);
  objc_storeStrong((id *)&self->_updateHighlightNodesByUpdateType, 0);
  objc_storeStrong((id *)&self->_updateMomentNodesByUpdateType, 0);
  objc_storeStrong((id *)&self->_consolidatedChanges, 0);
  objc_storeStrong((id *)&self->_inputChanges, 0);
  objc_storeStrong((id *)&self->_changeStreamToken, 0);
  objc_storeStrong((id *)&self->_registeredResolvableItemsByBusinessItemMuid, 0);
  objc_storeStrong((id *)&self->_registeredLocationOfInterestVisitsToResolveByMomentUUID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setInsertedHighlightDayGroupNodes:(id)a3
{
}

- (NSSet)insertedHighlightDayGroupNodes
{
  return self->_insertedHighlightDayGroupNodes;
}

- (void)setInsertedHighlightNodes:(id)a3
{
}

- (NSSet)insertedHighlightNodes
{
  return self->_insertedHighlightNodes;
}

- (NSSet)uuidsOfHighlightsToUpdate
{
  return self->_uuidsOfHighlightsToUpdate;
}

- (BOOL)hasUpdatedSocialGroupNodes
{
  return self->_hasUpdatedSocialGroupNodes;
}

- (BOOL)hasDeletedSocialGroupNodes
{
  return self->_hasDeletedSocialGroupNodes;
}

- (BOOL)hasInsertedSocialGroupNodes
{
  return self->_hasInsertedSocialGroupNodes;
}

- (void)setHasDeletedPersonNodes:(BOOL)a3
{
  self->_hasDeletedPersonNodes = a3;
}

- (BOOL)hasDeletedPersonNodes
{
  return self->_hasDeletedPersonNodes;
}

- (PGGraphUpdateRelatedDetails)relatedDetails
{
  return self->_relatedDetails;
}

- (NSSet)uuidsOfSocialGroupsToUpdate
{
  return self->_uuidsOfSocialGroupsToUpdate;
}

- (NSSet)uuidsOfSocialGroupsToDelete
{
  return self->_uuidsOfSocialGroupsToDelete;
}

- (NSSet)uuidsOfSocialGroupsToInsert
{
  return self->_uuidsOfSocialGroupsToInsert;
}

- (NSMutableSet)uuidsOfDeletedHighlights
{
  return self->_uuidsOfDeletedHighlights;
}

- (NSMutableDictionary)highlightsToInsertByHighlightKind
{
  return self->_highlightsToInsertByHighlightKind;
}

- (NSMutableDictionary)highlightByHighlightUUID
{
  return self->_highlightByHighlightUUID;
}

- (NSSet)updatedPersonNodesUnrelatedToMomentChange
{
  return self->_updatedPersonNodesUnrelatedToMomentChange;
}

- (NSSet)insertedAndUpdatedPersonNodes
{
  return self->_insertedAndUpdatedPersonNodes;
}

- (void)setAdditionalLocationsToPrefetch:(id)a3
{
}

- (NSSet)additionalLocationsToPrefetch
{
  return self->_additionalLocationsToPrefetch;
}

- (void)setInsertedMomentNodes:(id)a3
{
}

- (NSSet)insertedMomentNodes
{
  return self->_insertedMomentNodes;
}

- (void)setHasUpdatedPersonNodes:(BOOL)a3
{
  self->_hasUpdatedPersonNodes = a3;
}

- (void)setHasDeletedHighlightNodes:(BOOL)a3
{
  self->_hasDeletedHighlightNodes = a3;
}

- (BOOL)hasDeletedHighlightNodes
{
  return self->_hasDeletedHighlightNodes;
}

- (void)setHasDeletedMomentNodes:(BOOL)a3
{
  self->_hasDeletedMomentNodes = a3;
}

- (BOOL)hasDeletedMomentNodes
{
  return self->_hasDeletedMomentNodes;
}

- (NSMutableSet)deletedHighlightUUIDsForValidityCheck
{
  return self->_deletedHighlightUUIDsForValidityCheck;
}

- (NSMutableSet)deletedMomentUUIDsForValidityCheck
{
  return self->_deletedMomentUUIDsForValidityCheck;
}

- (NSMutableDictionary)momentByMomentUUID
{
  return self->_momentByMomentUUID;
}

- (void)setIsResumingFullAnalysis:(BOOL)a3
{
  self->_isResumingFullAnalysis = a3;
}

- (BOOL)isResumingFullAnalysis
{
  return self->_isResumingFullAnalysis;
}

- (NSDictionary)registeredResolvableItemsByBusinessItemMuid
{
  return &self->_registeredResolvableItemsByBusinessItemMuid->super;
}

- (NSDictionary)registeredLocationOfInterestVisitsToResolveByMomentUUID
{
  return &self->_registeredLocationOfInterestVisitsToResolveByMomentUUID->super;
}

- (NSMutableDictionary)updateHighlightNodesByUpdateType
{
  return self->_updateHighlightNodesByUpdateType;
}

- (NSMutableDictionary)updateMomentNodesByUpdateType
{
  return self->_updateMomentNodesByUpdateType;
}

- (NSSet)consolidatedChanges
{
  return self->_consolidatedChanges;
}

- (NSMutableArray)inputChanges
{
  return self->_inputChanges;
}

- (void)setUpdateType:(int64_t)a3
{
  self->_updateType = a3;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (PHPersistentChangeToken)changeStreamToken
{
  return self->_changeStreamToken;
}

- (BOOL)hasIncrementalChanges
{
  return self->_hasIncrementalChanges;
}

- (NSSet)identifiersForMemoriesRelatedToDeletedMoments
{
  v2 = [(PGGraphUpdate *)self relatedDetails];
  v3 = [v2 identifiersForMemoriesRelatedToDeletedMoments];

  return (NSSet *)v3;
}

- (NSSet)identifiersForMomentRelatedToDeletedPersons
{
  v2 = [(PGGraphUpdate *)self relatedDetails];
  v3 = [v2 identifiersForMomentRelatedToDeletedPersons];

  return (NSSet *)v3;
}

- (NSSet)identifiersForMomentRelatedToUpdatedPersons
{
  v2 = [(PGGraphUpdate *)self relatedDetails];
  v3 = [v2 identifiersForMomentRelatedToUpdatedPersons];

  return (NSSet *)v3;
}

- (id)highlightsToProcessForKind:(unsigned __int16)a3 withHighlightUpdateTypes:(unint64_t)a4 includeHighlightsToIngest:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = a3;
  v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __95__PGGraphUpdate_highlightsToProcessForKind_withHighlightUpdateTypes_includeHighlightsToIngest___block_invoke;
  v24 = &unk_1E68EB328;
  unint64_t v27 = a4;
  v25 = self;
  __int16 v28 = v7;
  id v10 = v9;
  id v26 = v10;
  [(PGGraphUpdate *)self enumerateConsolidatedChanges:&v21];
  if (v5)
  {
    highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", v7, v21, v22, v23, v24, v25);
    v13 = [(NSMutableDictionary *)highlightsToInsertByHighlightKind objectForKeyedSubscript:v12];

    if ([v13 count]) {
      [v10 unionSet:v13];
    }
  }
  if ([(PGGraphUpdate *)self isResumingFullAnalysis]
    && [(PGGraphUpdate *)self updateType] == 4)
  {
    v14 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    if (v7) {
      uint64_t v15 = 1000000304;
    }
    else {
      uint64_t v15 = 1000000301;
    }
    v16 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:v15 options:v14];
    [(PGGraphUpdate *)self _registerHighlights:v16];
    v17 = [v16 fetchedObjects];
    [v10 addObjectsFromArray:v17];
  }
  v18 = v26;
  id v19 = v10;

  return v19;
}

void __95__PGGraphUpdate_highlightsToProcessForKind_withHighlightUpdateTypes_includeHighlightsToIngest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 type] == 9)
  {
    id v4 = v3;
    if ((*(void *)(a1 + 48) & [v4 updateTypes]) != 0)
    {
      BOOL v5 = [v4 highlightUUID];
      v6 = [*(id *)(a1 + 32) highlightForHighlightUUID:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        if ([v6 kind] == *(unsigned __int16 *)(a1 + 56)) {
          [*(id *)(a1 + 40) addObject:v7];
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v8 = 138412546;
        v9 = v5;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Consolidate can't find highlight UUID (%@) for change %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (id)_fetchedHighlightsWithHighlightUUIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)MEMORY[0x1D25FED50]();
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [(NSMutableDictionary *)self->_highlightByHighlightUUID objectForKeyedSubscript:v13];
        if (v14)
        {
          uint64_t v15 = v5;
          v16 = v14;
        }
        else
        {
          uint64_t v15 = v7;
          v16 = v13;
        }
        [v15 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v17 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v7];
    [v17 setInternalPredicate:v18];

    id v19 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v17];
    [(PGGraphUpdate *)self _registerHighlights:v19];
    v20 = [v19 fetchedObjects];
    [v5 addObjectsFromArray:v20];
  }

  return v5;
}

- (id)highlightForHighlightUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_highlightByHighlightUUID objectForKeyedSubscript:a3];
}

- (void)_unregisterHighlightsForHighlightUUIDs:(id)a3
{
  highlightByHighlightUUID = self->_highlightByHighlightUUID;
  id v6 = a3;
  BOOL v5 = [v6 allObjects];
  [(NSMutableDictionary *)highlightByHighlightUUID removeObjectsForKeys:v5];

  [(NSMutableSet *)self->_deletedHighlightUUIDsForValidityCheck unionSet:v6];
}

- (void)_registerHighlights:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v9 uuid];
        [(NSMutableDictionary *)self->_highlightByHighlightUUID setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)hasHighlightDayGroupsToInsert
{
  v2 = [(PGGraphUpdate *)self highlightDayGroupsToIngest];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSSet)highlightDayGroupsToIngest
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
  return (NSSet *)[(NSMutableDictionary *)highlightsToInsertByHighlightKind objectForKeyedSubscript:&unk_1F28D2448];
}

- (NSSet)highlightDaysToIngest
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
  return (NSSet *)[(NSMutableDictionary *)highlightsToInsertByHighlightKind objectForKeyedSubscript:&unk_1F28D2430];
}

- (BOOL)hasHighlightsToUpdate
{
  return [(NSSet *)self->_uuidsOfHighlightsToUpdate count] != 0;
}

- (BOOL)hasHighlightsToDelete
{
  return [(NSSet *)self->_uuidsOfHighlightsToDelete count] != 0;
}

- (BOOL)hasHighlightsToInsert
{
  return [(NSSet *)self->_uuidsOfHighlightsToInsert count] != 0;
}

- (NSSet)uuidsOfHighlightsToDelete
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  uuidsOfHighlightsToDelete = self->_uuidsOfHighlightsToDelete;
  return uuidsOfHighlightsToDelete;
}

- (NSSet)uuidsOfHighlightsToInsert
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  uuidsOfHighlightsToInsert = self->_uuidsOfHighlightsToInsert;
  return uuidsOfHighlightsToInsert;
}

- (void)clearUpdatedPersonNodesUnrelatedToMomentChange
{
  BOOL v3 = [MEMORY[0x1E4F1CAD0] set];
  updatedPersonNodesUnrelatedToMomentChange = self->_updatedPersonNodesUnrelatedToMomentChange;
  self->_updatedPersonNodesUnrelatedToMomentChange = v3;
}

- (void)clearInsertedAndUpdatedPersonNodes
{
  BOOL v3 = [MEMORY[0x1E4F1CAD0] set];
  insertedAndUpdatedPersonNodes = self->_insertedAndUpdatedPersonNodes;
  self->_insertedAndUpdatedPersonNodes = v3;
}

- (void)registerUpdatedPersonNodesUnrelatedToMomentChange:(id)a3
{
  updatedPersonNodesUnrelatedToMomentChange = self->_updatedPersonNodesUnrelatedToMomentChange;
  if (updatedPersonNodesUnrelatedToMomentChange)
  {
    uint64_t v5 = [(NSSet *)updatedPersonNodesUnrelatedToMomentChange setByAddingObjectsFromSet:a3];
  }
  else
  {
    uint64_t v5 = (NSSet *)[a3 copy];
  }
  uint64_t v6 = self->_updatedPersonNodesUnrelatedToMomentChange;
  self->_updatedPersonNodesUnrelatedToMomentChange = v5;
}

- (void)registerInsertedAndUpdatedPersonNodes:(id)a3
{
  insertedAndUpdatedPersonNodes = self->_insertedAndUpdatedPersonNodes;
  if (insertedAndUpdatedPersonNodes)
  {
    uint64_t v5 = [(NSSet *)insertedAndUpdatedPersonNodes setByAddingObjectsFromSet:a3];
  }
  else
  {
    uint64_t v5 = (NSSet *)[a3 copy];
  }
  uint64_t v6 = self->_insertedAndUpdatedPersonNodes;
  self->_insertedAndUpdatedPersonNodes = v5;
}

- (void)registerPublicEventNode:(id)a3 withConsolidatedAddress:(id)a4 toResolveBusinessItemMuid:(unint64_t)a5
{
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v13 = [v8 numberWithUnsignedLongLong:a5];
  long long v11 = [[PGResolvablePublicEventBusinessItem alloc] initWithPublicEventNode:v10 consolidatedAddress:v9 businessItemMuid:a5];

  long long v12 = [(NSMutableDictionary *)self->_registeredResolvableItemsByBusinessItemMuid objectForKeyedSubscript:v13];
  if (!v12)
  {
    long long v12 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_registeredResolvableItemsByBusinessItemMuid setObject:v12 forKeyedSubscript:v13];
  }
  [v12 addObject:v11];
}

- (void)registerLocationOfInterestVisitToResolve:(id)a3 forMomentUUID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_registeredLocationOfInterestVisitsToResolveByMomentUUID objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_registeredLocationOfInterestVisitsToResolveByMomentUUID setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (id)momentNodesToProcessInGraph:(id)a3 forMomentUpdateTypes:(unint64_t)a4 includeInsertedNodes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(PGGraphUpdate *)self isResumingFullAnalysis])
  {
    id v9 = [v8 momentNodes];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v11 = v10;
    if (v5) {
      [v10 unionSet:self->_insertedMomentNodes];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v12 = self->_updateMomentNodesByUpdateType;
    uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v17, "unsignedIntegerValue", (void)v20) & a4) != 0)
          {
            v18 = [(NSMutableDictionary *)self->_updateMomentNodesByUpdateType objectForKeyedSubscript:v17];
            [v11 addObjectsFromArray:v18];
          }
        }
        uint64_t v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    id v9 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v11 graph:v8];
  }

  return v9;
}

- (id)momentsToProcessForMomentUpdateTypes:(unint64_t)a3 includeMomentsToIngest:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->_consolidatedChanges && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - expected GraphUpdate instance to be consolidated before this method is called.", buf, 2u);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    id v8 = [(PGGraphUpdate *)self momentsToIngest];
    [v7 unionSet:v8];
  }
  id v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __77__PGGraphUpdate_momentsToProcessForMomentUpdateTypes_includeMomentsToIngest___block_invoke;
  long long v23 = &unk_1E68EB300;
  unint64_t v27 = a3;
  long long v24 = self;
  id v10 = v7;
  id v25 = v10;
  id v11 = v9;
  id v26 = v11;
  [(PGGraphUpdate *)self enumerateConsolidatedChanges:&v20];
  if (objc_msgSend(v11, "count", v20, v21, v22, v23, v24))
  {
    long long v12 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v13 = (void *)MEMORY[0x1E4F391A0];
    uint64_t v14 = [v11 allObjects];
    uint64_t v15 = [v13 fetchAssetCollectionsWithLocalIdentifiers:v14 options:v12];

LABEL_8:
    [(PGGraphUpdate *)self _registerMoments:v15];
    uint64_t v16 = [v15 fetchedObjects];
    [v10 addObjectsFromArray:v16];

    goto LABEL_12;
  }
  if ([(PGGraphUpdate *)self isResumingFullAnalysis]
    && [(PGGraphUpdate *)self updateType] == 4)
  {
    long long v12 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v15 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v12];
    goto LABEL_8;
  }
LABEL_12:
  v17 = v26;
  id v18 = v10;

  return v18;
}

void __77__PGGraphUpdate_momentsToProcessForMomentUpdateTypes_includeMomentsToIngest___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  BOOL v3 = [v11 type] == 3;
  BOOL v4 = v11;
  if (v3)
  {
    id v5 = v11;
    if ((*(void *)(a1 + 56) & [v5 updateTypes]) != 0)
    {
      id v6 = [v5 momentUUID];
      uint64_t v7 = [*(id *)(a1 + 32) momentByMomentUUID];
      id v8 = [v7 objectForKeyedSubscript:v6];

      if (v8)
      {
        [*(id *)(a1 + 40) addObject:v8];
      }
      else
      {
        id v9 = *(void **)(a1 + 48);
        id v10 = [MEMORY[0x1E4F391A0] localIdentifierWithUUID:v6];
        [v9 addObject:v10];
      }
    }

    BOOL v4 = v11;
  }
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __28__PGGraphUpdate_description__block_invoke;
  v41[3] = &unk_1E68EB2D8;
  id v4 = v3;
  id v42 = v4;
  [(PGGraphUpdate *)self enumerateConsolidatedChanges:v41];
  if ([(NSSet *)self->_consolidatedChanges count])
  {
    uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"[%@]", v4];

    id v4 = (id)v5;
  }
  id v6 = [(PGGraphUpdate *)self localIdentifiersOfPersonsToDelete];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(PGGraphUpdate *)self localIdentifiersOfPersonsToDelete];
    [v4 appendFormat:@"\nPersons to delete:\n%@", v8];
  }
  id v9 = [(PGGraphUpdate *)self localIdentifiersOfPersonsToInsert];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [(PGGraphUpdate *)self localIdentifiersOfPersonsToInsert];
    [v4 appendFormat:@"\nPersons to insert:\n%@", v11];
  }
  long long v12 = [(PGGraphUpdate *)self uuidsOfHighlightsToDelete];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = [(PGGraphUpdate *)self uuidsOfHighlightsToDelete];
    [v4 appendFormat:@"\nHighlights to delete:\n%@", v14];
  }
  uint64_t v15 = [(PGGraphUpdate *)self uuidsOfHighlightsToInsert];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    v17 = [(PGGraphUpdate *)self uuidsOfHighlightsToInsert];
    [v4 appendFormat:@"\nHighlights to insert:\n%@", v17];
  }
  id v18 = [(PGGraphUpdate *)self uuidsOfMomentsToDelete];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = [(PGGraphUpdate *)self uuidsOfMomentsToDelete];
    [v4 appendFormat:@"\nMoments to delete:\n%@", v20];
  }
  uint64_t v21 = [(PGGraphUpdate *)self uuidsOfMomentsToInsert];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    long long v23 = [(PGGraphUpdate *)self uuidsOfMomentsToInsert];
    [v4 appendFormat:@"\nMoments to insert:\n%@", v23];
  }
  if ([(PGGraphUpdate *)self hasAnythingToDo])
  {
    long long v24 = objc_msgSend(NSString, "stringWithFormat:", @"- [Moment]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n", -[NSSet count](self->_momentsToIngest, "count"), -[NSSet count](self->_uuidsOfMomentsToDelete, "count"), -[NSSet count](self->_uuidsOfMomentsToUpdate, "count"));
    id v25 = NSString;
    id v26 = [(NSMutableDictionary *)self->_highlightsToInsertByHighlightKind objectForKeyedSubscript:&unk_1F28D2430];
    unint64_t v27 = objc_msgSend(v25, "stringWithFormat:", @"- [Highlight]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n", objc_msgSend(v26, "count"), -[NSSet count](self->_uuidsOfHighlightsToDelete, "count"), -[NSSet count](self->_uuidsOfHighlightsToUpdate, "count"));

    __int16 v28 = objc_msgSend(NSString, "stringWithFormat:", @"- [Person]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n", -[NSSet count](self->_localIdentifiersOfPersonsToInsert, "count"), -[NSSet count](self->_localIdentifiersOfPersonsToDelete, "count"), -[NSSet count](self->_contactIdentifiersOfPersonsToUpdate, "count")+ -[NSSet count](self->_localIdentifiersOfPersonsToUpdate, "count"));
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"- [SocialGroup]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n", -[NSSet count](self->_uuidsOfSocialGroupsToInsert, "count"), -[NSSet count](self->_uuidsOfSocialGroupsToDelete, "count"), -[NSSet count](self->_uuidsOfSocialGroupsToUpdate, "count"));
    v30 = [NSString stringWithFormat:@"%@%@%@%@", v24, v27, v28, v29];
  }
  else
  {
    v30 = &stru_1F283BC78;
  }
  v31 = [(PGGraphUpdate *)self consolidatedChanges];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Consolidate changes: %ld\n", -[NSSet count](self->_consolidatedChanges, "count"));
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = &stru_1F283BC78;
  }
  v34 = NSString;
  v40.receiver = self;
  v40.super_class = (Class)PGGraphUpdate;
  v35 = [(PGGraphUpdate *)&v40 description];
  if ([(PGGraphUpdate *)self isResumingFullAnalysis]) {
    v36 = @"YES";
  }
  else {
    v36 = @"NO";
  }
  if ([(PGGraphUpdate *)self hasAnythingToDo]) {
    v37 = @"YES";
  }
  else {
    v37 = @"NO";
  }
  v38 = [v34 stringWithFormat:@"%@\nResuming full analysis: %@\nHas anything to do: %@\n%@%@%@", v35, v36, v37, v33, v30, v4];

  return (NSString *)v38;
}

uint64_t __28__PGGraphUpdate_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\n\t[%@]", a2];
}

- (void)updatedHighlightNode:(id)a3 forUpdateChangeType:(unint64_t)a4
{
  id v12 = a3;
  id v6 = self->_updateHighlightNodesByUpdateType;
  objc_sync_enter(v6);
  updateHighlightNodesByUpdateType = self->_updateHighlightNodesByUpdateType;
  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)updateHighlightNodesByUpdateType objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = self->_updateHighlightNodesByUpdateType;
    id v11 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  [v9 addObject:v12];

  objc_sync_exit(v6);
}

- (void)updatedMomentNode:(id)a3 forUpdateChangeType:(unint64_t)a4
{
  id v12 = a3;
  id v6 = self->_updateMomentNodesByUpdateType;
  objc_sync_enter(v6);
  updateMomentNodesByUpdateType = self->_updateMomentNodesByUpdateType;
  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)updateMomentNodesByUpdateType objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = self->_updateMomentNodesByUpdateType;
    id v11 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  [v9 addObject:v12];

  objc_sync_exit(v6);
}

- (void)enumerateConsolidatedChanges:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_consolidatedChanges;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)numberOfConsolidatedChanges
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  consolidatedChanges = self->_consolidatedChanges;
  return [(NSSet *)consolidatedChanges count];
}

- (void)_consolidateIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_consolidatedChanges) {
    [(PGGraphUpdate *)obj _consolidate];
  }
  objc_sync_exit(obj);
}

- (id)_fetchMomentsWithUUIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = (void *)MEMORY[0x1D25FED50]();
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v14 = [(NSMutableDictionary *)self->_momentByMomentUUID objectForKeyedSubscript:v13];
        if (v14)
        {
          uint64_t v15 = v5;
          uint64_t v16 = v14;
        }
        else
        {
          uint64_t v15 = v7;
          uint64_t v16 = v13;
        }
        [v15 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v17 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v7];
    [v17 setInternalPredicate:v18];

    uint64_t v19 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v17];
    [(PGGraphUpdate *)self _registerMoments:v19];
    uint64_t v20 = [v19 fetchedObjects];
    [v5 addObjectsFromArray:v20];
  }

  return v5;
}

- (void)_consolidate
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v76 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v77 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v78 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v6 = self->_inputChanges;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v90 objects:v95 count:16];
  id v75 = v4;
  v84 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v73 = 0;
    uint64_t v9 = *(void *)v91;
LABEL_3:
    uint64_t v10 = 0;
    while (2)
    {
      if (*(void *)v91 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v90 + 1) + 8 * v10);
      switch([v11 type])
      {
        case 0:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown change type in graph update", buf, 2u);
          }
          goto LABEL_38;
        case 1:
          id v23 = v11;
          long long v13 = [v23 momentUUIDs];
          long long v24 = [v13 allObjects];
          [v84 removeObjectsForKeys:v24];

          [v3 unionSet:v13];
          long long v25 = [v23 moments];

          [(PGGraphUpdate *)self _registerMoments:v25];
          goto LABEL_24;
        case 2:
          id v15 = [v11 momentUUIDs];
          [v79 unionSet:v15];
          uint64_t v16 = [v15 allObjects];
          [v5 removeObjectsForKeys:v16];

          [(PGGraphUpdate *)self _unregisterMomentsForMomentUUIDs:v15];
          goto LABEL_33;
        case 3:
          id v15 = v11;
          id v26 = [v15 momentUUID];
          if (([v3 containsObject:v26] & 1) != 0
            || ([v79 containsObject:v26] & 1) != 0)
          {
            goto LABEL_32;
          }
          id v27 = [v5 objectForKeyedSubscript:v26];
          if (!v27)
          {
            id v27 = v15;
            [v84 setObject:v27 forKeyedSubscript:v26];
            [obj addObject:v26];
          }
          [v27 mergeChange:v15];
          v73 |= [v15 updateTypes];
          goto LABEL_31;
        case 5:
          id v15 = [v11 personLocalIdentifiers];
          [v82 unionSet:v15];
          id v26 = [v15 allObjects];
          [v5 removeObjectsForKeys:v26];
          goto LABEL_32;
        case 6:
          id v17 = v11;
          id v18 = [v17 personLocalIdentifier];
          uint64_t v19 = [v17 contactIdentifier];
          if ([v18 length])
          {
            if ([v82 containsObject:v18]) {
              goto LABEL_45;
            }
            id v20 = [v5 objectForKeyedSubscript:v18];
            if (!v20)
            {
              id v20 = v17;
              [v84 setObject:v20 forKeyedSubscript:v18];
              uint64_t v21 = v71;
              long long v22 = v18;
LABEL_43:
              [v21 addObject:v22];
            }
          }
          else
          {
            if (![v19 length]) {
              goto LABEL_45;
            }
            id v20 = [v72 objectForKeyedSubscript:v19];
            if (!v20)
            {
              id v20 = v17;
              [v72 setObject:v20 forKeyedSubscript:v19];
              uint64_t v21 = v69;
              long long v22 = v19;
              goto LABEL_43;
            }
          }
          [v20 mergeChange:v17];

          id v5 = v84;
LABEL_45:

          id v4 = v75;
LABEL_38:
          if (v8 != ++v10) {
            continue;
          }
          uint64_t v31 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v90 objects:v95 count:16];
          uint64_t v8 = v31;
          if (!v31) {
            goto LABEL_49;
          }
          goto LABEL_3;
        case 7:
          id v28 = v11;
          long long v13 = [v28 highlightUUIDs];
          v29 = [v13 allObjects];
          [v84 removeObjectsForKeys:v29];

          [v4 unionSet:v13];
          long long v25 = [v28 highlights];

          [(PGGraphUpdate *)self _registerHighlights:v25];
LABEL_24:

          id v5 = v84;
          goto LABEL_37;
        case 8:
          id v15 = [v11 highlightUUIDs];
          [v81 unionSet:v15];
          v30 = [v15 allObjects];
          [v5 removeObjectsForKeys:v30];

          [(PGGraphUpdate *)self _unregisterHighlightsForHighlightUUIDs:v15];
          goto LABEL_33;
        case 9:
          id v15 = v11;
          id v26 = [v15 highlightUUID];
          if (([v4 containsObject:v26] & 1) != 0
            || ([v81 containsObject:v26] & 1) != 0)
          {
            goto LABEL_32;
          }
          id v27 = [v5 objectForKeyedSubscript:v26];
          if (!v27)
          {
            id v27 = v15;
            [v84 setObject:v27 forKeyedSubscript:v26];
            [v68 addObject:v26];
          }
          [v27 mergeChange:v15];
LABEL_31:

          id v5 = v84;
LABEL_32:

LABEL_33:
          goto LABEL_38;
        case 10:
          id v12 = v11;
          long long v13 = [v12 socialGroupUUIDs];
          char v14 = v76;
          goto LABEL_35;
        case 11:
          id v12 = v11;
          long long v13 = [v12 socialGroupUUIDs];
          char v14 = v77;
LABEL_35:
          [(NSSet *)v14 unionSet:v13];
          goto LABEL_36;
        case 12:
          id v12 = v11;
          long long v13 = [v12 socialGroupUUID];
          [(NSSet *)v78 addObject:v13];
LABEL_36:

LABEL_37:
          goto LABEL_38;
        default:
          goto LABEL_38;
      }
    }
  }
  unint64_t v73 = 0;
LABEL_49:

  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    v33 = (void *)MEMORY[0x1E4F1C978];
    v34 = [v5 allValues];
    v35 = [v33 arrayWithArray:v34];
    [v32 addObjectsFromArray:v35];
  }
  v36 = v72;
  v37 = v68;
  if ([v72 count])
  {
    v38 = (void *)MEMORY[0x1E4F1C978];
    v39 = [v72 allValues];
    objc_super v40 = [v38 arrayWithArray:v39];
    [v32 addObjectsFromArray:v40];
  }
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v32, v32);
  v41 = (NSSet *)objc_claimAutoreleasedReturnValue();
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = v41;

  v43 = (void *)[v79 mutableCopy];
  [v43 minusSet:v3];
  [v3 minusSet:v79];
  id v44 = v43;

  objc_storeStrong((id *)&self->_uuidsOfMomentsToInsert, v3);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToDelete, v43);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToUpdate, obj);
  self->_momentUpdateTypes = v73;
  if ([v3 count]) {
    [(PGGraphUpdate *)self _fetchMomentsWithUUIDs:v3];
  }
  else {
  v45 = [MEMORY[0x1E4F1CAD0] set];
  }
  momentsToIngest = self->_momentsToIngest;
  self->_momentsToIngest = v45;

  if (obj && [obj count]) {
    id v47 = [(PGGraphUpdate *)self _fetchMomentsWithUUIDs:obj];
  }
  v48 = (void *)[v82 mutableCopy];
  [v48 minusSet:v67];
  [v67 minusSet:v82];
  id v80 = v48;

  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToInsert, v67);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToDelete, v48);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToUpdate, v71);
  objc_storeStrong((id *)&self->_contactIdentifiersOfPersonsToUpdate, v69);
  [(PGGraphUpdate *)self clearInsertedAndUpdatedPersonNodes];
  [(PGGraphUpdate *)self clearUpdatedPersonNodesUnrelatedToMomentChange];
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToInsert, v4);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToDelete, v81);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToUpdate, v68);
  if ([v4 count])
  {
    id v74 = v44;
    id v83 = v3;
    v49 = [(PGGraphUpdate *)self _fetchedHighlightsWithHighlightUUIDs:v4];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v86 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
          v56 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v54, "kind"));
          v57 = [(NSMutableDictionary *)highlightsToInsertByHighlightKind objectForKeyedSubscript:v56];

          if (!v57)
          {
            v57 = [MEMORY[0x1E4F1CA80] set];
            v58 = self->_highlightsToInsertByHighlightKind;
            v59 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v54, "kind"));
            [(NSMutableDictionary *)v58 setObject:v57 forKeyedSubscript:v59];
          }
          [v57 addObject:v54];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v51);
    }

    id v3 = v83;
    id v5 = v84;
    id v44 = v74;
    id v4 = v75;
    v37 = v68;
    v36 = v72;
  }
  if (v37 && [v37 count]) {
    id v60 = [(PGGraphUpdate *)self _fetchedHighlightsWithHighlightUUIDs:v37];
  }
  uuidsOfSocialGroupsToInsert = self->_uuidsOfSocialGroupsToInsert;
  self->_uuidsOfSocialGroupsToInsert = v76;
  v62 = v76;

  uuidsOfSocialGroupsToDelete = self->_uuidsOfSocialGroupsToDelete;
  self->_uuidsOfSocialGroupsToDelete = v77;
  v64 = v77;

  uuidsOfSocialGroupsToUpdate = self->_uuidsOfSocialGroupsToUpdate;
  self->_uuidsOfSocialGroupsToUpdate = v78;
}

- (void)_unregisterMomentsForMomentUUIDs:(id)a3
{
  momentByMomentUUID = self->_momentByMomentUUID;
  id v6 = a3;
  id v5 = [v6 allObjects];
  [(NSMutableDictionary *)momentByMomentUUID removeObjectsForKeys:v5];

  [(NSMutableSet *)self->_deletedMomentUUIDsForValidityCheck unionSet:v6];
}

- (void)_registerMoments:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v9 uuid];
        [(NSMutableDictionary *)self->_momentByMomentUUID setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)prepareForPostProcessingWithGraph:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PGGraphUpdate *)self isResumingFullAnalysis])
  {
    uint64_t v5 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v6 = [(PGGraphUpdate *)self momentsToIngest];
    uint64_t v7 = +[PGGraphNodeCollection nodesInGraph:v4];
    uint64_t v8 = [v7 uuids];

    uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    uint64_t v10 = [v6 count];
    if (v10 != [v9 count])
    {
      long long v24 = v5;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v25 + 1) + 8 * v15) uuid];
            [v9 removeObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      uint64_t v5 = v24;
      if ([v9 count])
      {
        id v17 = (void *)MEMORY[0x1E4F1CA80];
        id v18 = [(PGGraphUpdate *)self _fetchMomentsWithUUIDs:v9];
        uint64_t v19 = [v17 setWithSet:v18];

        [(NSSet *)v19 unionSet:v11];
        momentsToIngest = self->_momentsToIngest;
        self->_momentsToIngest = v19;
        uint64_t v21 = v19;

        long long v22 = [MEMORY[0x1E4F1CA80] setWithSet:self->_uuidsOfMomentsToInsert];
        [(NSSet *)v22 unionSet:v9];
        uuidsOfMomentsToInsert = self->_uuidsOfMomentsToInsert;
        self->_uuidsOfMomentsToInsert = v22;
      }
    }
  }
}

- (void)addChanges:(id)a3
{
  [(NSMutableArray *)self->_inputChanges addObjectsFromArray:a3];
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = 0;
}

- (void)addChange:(id)a3
{
  [(NSMutableArray *)self->_inputChanges addObject:a3];
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = 0;
}

- (BOOL)didSocialGroupsChanges
{
  if ([(PGGraphUpdate *)self hasSocialGroupsToDelete]
    || [(PGGraphUpdate *)self hasSocialGroupsToInsert])
  {
    return 1;
  }
  return [(PGGraphUpdate *)self hasSocialGroupsToUpdate];
}

- (BOOL)hasUpdatedHighlightNodes
{
  return [(NSMutableDictionary *)self->_updateHighlightNodesByUpdateType count] != 0;
}

- (BOOL)hasInsertedHighlightNodes
{
  return [(NSSet *)self->_insertedHighlightNodes count] != 0;
}

- (BOOL)hasUpdatedMomentNodes
{
  return [(NSMutableDictionary *)self->_updateMomentNodesByUpdateType count] != 0;
}

- (BOOL)hasInsertedMomentNodes
{
  return [(NSSet *)self->_insertedMomentNodes count] != 0;
}

- (BOOL)didProcessNodes
{
  BOOL v3 = [(PGGraphUpdate *)self hasDeletedMomentNodes]
    || [(PGGraphUpdate *)self hasInsertedMomentNodes]
    || [(PGGraphUpdate *)self hasUpdatedMomentNodes];
  BOOL v4 = [(PGGraphUpdate *)self hasDeletedHighlightNodes]
    || [(PGGraphUpdate *)self hasInsertedHighlightNodes]
    || [(PGGraphUpdate *)self hasUpdatedHighlightNodes];
  BOOL v5 = [(PGGraphUpdate *)self hasDeletedPersonNodes]
    || [(PGGraphUpdate *)self hasUpdatedPersonNodes];
  return v3 || v5 || v4;
}

- (NSSet)momentsToIngest
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  momentsToIngest = self->_momentsToIngest;
  return momentsToIngest;
}

- (unint64_t)momentUpdateTypes
{
  return self->_momentUpdateTypes;
}

- (BOOL)hasSocialGroupsToUpdate
{
  return [(NSSet *)self->_uuidsOfSocialGroupsToUpdate count] != 0;
}

- (BOOL)hasSocialGroupsToDelete
{
  return [(NSSet *)self->_uuidsOfSocialGroupsToDelete count] != 0;
}

- (BOOL)hasSocialGroupsToInsert
{
  return [(NSSet *)self->_uuidsOfSocialGroupsToInsert count] != 0;
}

- (BOOL)hasUpdatedPersonNodesUnrelatedToMomentChange
{
  v2 = [(PGGraphUpdate *)self updatedPersonNodesUnrelatedToMomentChange];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasUpdatedPersonNodes
{
  v2 = [(PGGraphUpdate *)self insertedAndUpdatedPersonNodes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasPersonsToUpdate
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = [(NSSet *)self->_localIdentifiersOfPersonsToUpdate count];
  return v3 + [(NSSet *)self->_contactIdentifiersOfPersonsToUpdate count] != 0;
}

- (BOOL)hasPersonsToDelete
{
  return [(NSSet *)self->_localIdentifiersOfPersonsToDelete count] != 0;
}

- (BOOL)hasPersonsToInsert
{
  return [(NSSet *)self->_localIdentifiersOfPersonsToInsert count] != 0;
}

- (BOOL)hasMomentsToUpdate
{
  return [(NSSet *)self->_uuidsOfMomentsToUpdate count] != 0;
}

- (BOOL)hasMomentsToDelete
{
  return [(NSSet *)self->_uuidsOfMomentsToDelete count] != 0;
}

- (BOOL)hasMomentsToInsert
{
  return [(NSSet *)self->_uuidsOfMomentsToInsert count] != 0;
}

- (NSSet)contactIdentifiersOfPersonsToUpdate
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  contactIdentifiersOfPersonsToUpdate = self->_contactIdentifiersOfPersonsToUpdate;
  return (NSSet *)[v3 setWithSet:contactIdentifiersOfPersonsToUpdate];
}

- (NSSet)localIdentifiersOfPersonsToUpdate
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  localIdentifiersOfPersonsToUpdate = self->_localIdentifiersOfPersonsToUpdate;
  return (NSSet *)[v3 setWithSet:localIdentifiersOfPersonsToUpdate];
}

- (NSSet)localIdentifiersOfPersonsToDelete
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  localIdentifiersOfPersonsToDelete = self->_localIdentifiersOfPersonsToDelete;
  return (NSSet *)[v3 setWithSet:localIdentifiersOfPersonsToDelete];
}

- (NSSet)localIdentifiersOfPersonsToInsert
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  localIdentifiersOfPersonsToInsert = self->_localIdentifiersOfPersonsToInsert;
  return (NSSet *)[v3 setWithSet:localIdentifiersOfPersonsToInsert];
}

- (NSSet)uuidsOfMomentsToUpdate
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  uuidsOfMomentsToUpdate = self->_uuidsOfMomentsToUpdate;
  return (NSSet *)[v3 setWithSet:uuidsOfMomentsToUpdate];
}

- (NSSet)uuidsOfMomentsToDelete
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  uuidsOfMomentsToDelete = self->_uuidsOfMomentsToDelete;
  return (NSSet *)[v3 setWithSet:uuidsOfMomentsToDelete];
}

- (NSSet)uuidsOfMomentsToInsert
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CAD0];
  uuidsOfMomentsToInsert = self->_uuidsOfMomentsToInsert;
  return (NSSet *)[v3 setWithSet:uuidsOfMomentsToInsert];
}

- (BOOL)isSignificant
{
  return 1;
}

- (BOOL)hasAnythingToDo
{
  [(PGGraphUpdate *)self _consolidateIfNeeded];
  BOOL v3 = [(PGGraphUpdate *)self hasMomentsToInsert]
    || [(PGGraphUpdate *)self hasMomentsToDelete]
    || [(PGGraphUpdate *)self hasMomentsToUpdate];
  BOOL v4 = [(PGGraphUpdate *)self hasHighlightsToInsert]
    || [(PGGraphUpdate *)self hasHighlightsToDelete]
    || [(PGGraphUpdate *)self hasHighlightsToUpdate];
  BOOL v5 = [(PGGraphUpdate *)self hasPersonsToDelete]
    || [(PGGraphUpdate *)self hasPersonsToInsert]
    || [(PGGraphUpdate *)self hasPersonsToUpdate];
  BOOL v6 = [(PGGraphUpdate *)self hasSocialGroupsToDelete]
    || [(PGGraphUpdate *)self hasSocialGroupsToInsert]
    || [(PGGraphUpdate *)self hasSocialGroupsToUpdate];
  return v4 || v3 || v5 || v6;
}

- (id)cachedDataModelObjectForGraphChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 9)
  {
    BOOL v6 = [v4 highlightUUID];
    uint64_t v7 = 192;
    goto LABEL_5;
  }
  if (v5 == 3)
  {
    BOOL v6 = [v4 momentUUID];
    uint64_t v7 = 120;
LABEL_5:
    uint64_t v8 = [*(id *)((char *)&self->super.isa + v7) objectForKeyedSubscript:v6];

    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4
{
  return [(PGGraphUpdate *)self initWithPhotoLibrary:a3 updateType:a4 changeStreamToken:0];
}

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3
{
  return [(PGGraphUpdate *)self initWithPhotoLibrary:a3 updateType:0];
}

- (id)initForChangeStreamResetInPhotoLibrary:(id)a3 updateType:(int64_t)a4
{
  id result = [(PGGraphUpdate *)self initWithPhotoLibrary:a3 updateType:a4 changeStreamToken:0];
  if (result) {
    *((unsigned char *)result + 32) = 0;
  }
  return result;
}

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4 changeStreamToken:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)PGGraphUpdate;
  id v11 = [(PGGraphUpdate *)&v46 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    v12->_updateType = a4;
    objc_storeStrong((id *)&v12->_changeStreamToken, a5);
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inputChanges = v12->_inputChanges;
    v12->_inputChanges = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    momentByMomentUUID = v12->_momentByMomentUUID;
    v12->_momentByMomentUUID = v15;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updateMomentNodesByUpdateType = v12->_updateMomentNodesByUpdateType;
    v12->_updateMomentNodesByUpdateType = v17;

    uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updateHighlightNodesByUpdateType = v12->_updateHighlightNodesByUpdateType;
    v12->_updateHighlightNodesByUpdateType = v19;

    uint64_t v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedMomentUUIDsForValidityCheck = v12->_deletedMomentUUIDsForValidityCheck;
    v12->_deletedMomentUUIDsForValidityCheck = v21;

    id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedHighlightUUIDsForValidityCheck = v12->_deletedHighlightUUIDsForValidityCheck;
    v12->_deletedHighlightUUIDsForValidityCheck = v23;

    long long v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredLocationOfInterestVisitsToResolveByMomentUUID = v12->_registeredLocationOfInterestVisitsToResolveByMomentUUID;
    v12->_registeredLocationOfInterestVisitsToResolveByMomentUUID = v25;

    long long v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredResolvableItemsByBusinessItemMuid = v12->_registeredResolvableItemsByBusinessItemMuid;
    v12->_registeredResolvableItemsByBusinessItemMuid = v27;

    v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    localIdentifiersOfPersonsToUpdate = v12->_localIdentifiersOfPersonsToUpdate;
    v12->_localIdentifiersOfPersonsToUpdate = v29;

    uint64_t v31 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    localIdentifiersOfPersonsToDelete = v12->_localIdentifiersOfPersonsToDelete;
    v12->_localIdentifiersOfPersonsToDelete = v31;

    v33 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    localIdentifiersOfPersonsToInsert = v12->_localIdentifiersOfPersonsToInsert;
    v12->_localIdentifiersOfPersonsToInsert = v33;

    v35 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    contactIdentifiersOfPersonsToUpdate = v12->_contactIdentifiersOfPersonsToUpdate;
    v12->_contactIdentifiersOfPersonsToUpdate = v35;

    v37 = objc_alloc_init(PGGraphUpdateRelatedDetails);
    relatedDetails = v12->_relatedDetails;
    v12->_relatedDetails = v37;

    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    highlightByHighlightUUID = v12->_highlightByHighlightUUID;
    v12->_highlightByHighlightUUID = v39;

    v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    highlightsToInsertByHighlightKind = v12->_highlightsToInsertByHighlightKind;
    v12->_highlightsToInsertByHighlightKind = v41;

    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uuidsOfDeletedHighlights = v12->_uuidsOfDeletedHighlights;
    v12->_uuidsOfDeletedHighlights = v43;

    v12->_hasIncrementalChanges = 1;
    if (a4 == 3) {
      *(_WORD *)&v12->_hasIncrementalChanges = 256;
    }
  }

  return v12;
}

@end