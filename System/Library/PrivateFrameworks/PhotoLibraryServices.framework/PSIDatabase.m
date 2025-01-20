@interface PSIDatabase
+ (BOOL)_integrityCheckDatabase:(sqlite3 *)a3;
+ (id)searchDatabaseLog;
+ (sqlite3)_openDatabaseAtPath:(id)a3 options:(int64_t)a4;
+ (void)_dropDatabase:(sqlite3 *)a3 withCompletion:(id)a4;
+ (void)dropDatabaseAtPath:(id)a3 withCompletion:(id)a4;
- (BOOL)_inqVerifyTablesExistInDatabase;
- (BOOL)_prepareSearchIndexAtPath:(id)a3 options:(int64_t)a4;
- (BOOL)assetExistsWithUUID:(id)a3;
- (BOOL)isDatabaseCorrupted;
- (NSString)path;
- (OS_dispatch_queue)groupResultsQueue;
- (PLPhotoLibraryPathManager)pathManager;
- (PSIDatabase)initWithPathManager:(id)a3 options:(int64_t)a4;
- (PSITokenizer)tokenizer;
- (__CFArray)_inqNewAssetIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4;
- (__CFArray)_inqNewAssetIdsWithDateFilter:(id)a3;
- (__CFArray)_inqNewCollectionIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4;
- (__CFArray)_inqNewCollectionIdsWithDateFilter:(id)a3;
- (__CFArray)assetIdsWithDateFilter:(id)a3;
- (__CFArray)mostRecentSortedAssetIdsWithLimit:(unint64_t)a3;
- (__CFDictionary)_inqPrepareStatementsForOptions:(int64_t)a3 tokenizerName:(id)a4;
- (__CFSet)_inqNewGroupIdsForAssetId:(unint64_t)a3;
- (__CFSet)_inqNewGroupIdsForAssetIds:(__CFSet *)a3;
- (__CFSet)_inqNewGroupIdsForCollectionId:(unint64_t)a3;
- (__CFSet)_inqNewGroupIdsForCollectionIds:(__CFSet *)a3;
- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5;
- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 textIsSearchable:(BOOL)a4;
- (__CFSet)_inqNewGroupIdsWithCategories:(id)a3;
- (__CFSet)groupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5;
- (__CFSet)groupIdsWithCategories:(id)a3;
- (double)_inqScoreForGroupID:(unint64_t)a3;
- (double)_scoreForUserCategory:(unint64_t)a3;
- (id)_inqAssetIdsByGroupIdForAssetIds:(id)a3;
- (id)_inqAssetUUIDByAssetIdWithAssetIds:(id)a3;
- (id)_inqAssetUUIDsForAssetIds:(__CFArray *)a3 range:(_NSRange)a4 creationDateSorted:(BOOL)a5;
- (id)_inqAssetUUIDsForAssetIds:(__CFSet *)a3;
- (id)_inqAssetUUIDsForGroupID:(unint64_t)a3;
- (id)_inqCollectionIdsByGroupIdForCollectionIds:(id)a3;
- (id)_inqCollectionResultByCollectionIdWithCollectionIds:(id)a3;
- (id)_inqCollectionResultsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4;
- (id)_inqCollectionUUIDsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4;
- (id)_inqCollectionUUIDsForGroupID:(unint64_t)a3;
- (id)_inqContentStringForGroupId:(unint64_t)a3;
- (id)_inqDequeueGroupObjectWithId:(unint64_t)a3 isCachedGroup:(BOOL *)a4;
- (id)_inqFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 matchingPredicateBlock:(id)a6;
- (id)_inqGenerateGroupsInfoDictionaryFromText:(const char *)a3 identifier:(const char *)a4 category:(signed __int16)a5 score:(double)a6 groupId:(unint64_t)a7 includeUUIDs:(BOOL)a8;
- (id)_inqGroupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6;
- (id)_inqGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4;
- (id)_inqGroupWithFilenameStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 excludingGroupId:(unint64_t)a5 searchResultTypes:(unint64_t)a6;
- (id)_inqGroupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5;
- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 isFilenameStatement:(BOOL)a6 excludingGroupId:(unint64_t)a7 searchResultTypes:(unint64_t)a8;
- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6;
- (id)_inqGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7;
- (id)_inqNewSynonymTextsByOwningGroupIdWithGroupIds:(__CFSet *)a3;
- (id)_inqNonFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7;
- (id)_inqNumberOfAssetsByGroupIdMatchingGroupsWithIds:(id)a3;
- (id)_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds:(id)a3;
- (id)_inqOwningContentStringForGroupResult:(id)a3;
- (id)allAssetUUIDsForGroupsWithCategories:(id)a3;
- (id)allCollectionUUIDsWithCollectionType:(unint64_t)a3;
- (id)allCollections;
- (id)allGroupIds;
- (id)assetUUIDByAssetIdWithAssetIds:(id)a3;
- (id)assetUUIDsForAssetIDs:(__CFArray *)a3;
- (id)collectionResultByCollectionIdWithCollectionIds:(id)a3;
- (id)collectionUUIDsForCollectionIDs:(__CFArray *)a3;
- (id)dumpGroupsInfoForAssetUUID:(id)a3 indexCategories:(id)a4 includeUUIDs:(BOOL)a5;
- (id)dumpGroupsInfoWithIndexCategories:(id)a3 includeUUIDs:(BOOL)a4;
- (id)dumpLookupStringsWithIndexCategories:(id)a3;
- (id)fetchAssetUUIDsForDateFilter:(id)a3;
- (id)groupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6;
- (id)groupForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4;
- (id)groupForText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 resultTypes:(unint64_t)a6;
- (id)groupIdsInPrefixTable;
- (id)groupResultWithDateFilter:(id)a3 datedTokens:(id)a4;
- (id)groupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5;
- (id)groupsForSearchIndexCategories:(id)a3 searchResultTypes:(unint64_t)a4 dateFilter:(id)a5;
- (id)groupsForText:(id)a3 useWildcardSearchText:(BOOL)a4 leadingAnchored:(BOOL)a5 searchIndexCategories:(id)a6 searchResultTypes:(unint64_t)a7;
- (id)groupsFromGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5;
- (id)initForTestingWithOptions:(int64_t)a3;
- (id)meNodeIdentifier;
- (id)newQueryWithSearchText:(id)a3 queryTokens:(id)a4 useWildcardSearchText:(BOOL)a5 libraryScope:(unint64_t)a6;
- (id)newQueryWithSearchTextV2:(id)a3 queryTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardSearchText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 libraryScope:(unint64_t)a10 suggestionLimit:(unint64_t)a11;
- (id)newSuggestionsQueryForQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7;
- (id)searchResultV2WithDateFilter:(id)a3 scopedSearchIdentifiers:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6;
- (id)statementFromString:(id)a3;
- (id)suggestionWhitelistedScenes;
- (id)wordEmbeddingMatchesForToken:(id)a3;
- (int64_t)insertAsset:(id)a3;
- (int64_t)insertCollection:(id)a3;
- (int64_t)insertGroup:(id)a3;
- (int64_t)lastInsertedRowID;
- (int64_t)options;
- (sqlite3)databaseConnection;
- (sqlite3_stmt)_inqPrepareStatement:(const char *)a3;
- (sqlite3_stmt)prepareEmbeddingStatement:(int64_t)a3 modelTypes:(id)a4 assetUUID:(id)a5;
- (unint64_t)_inqAssetIdForUUID:(id)a3;
- (unint64_t)_inqAssetIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5;
- (unint64_t)_inqAssetIdWithAsset:(id)a3;
- (unint64_t)_inqCollectionIdForUUID:(id)a3;
- (unint64_t)_inqCollectionIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5;
- (unint64_t)_inqCollectionIdWithCollection:(id)a3;
- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4;
- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7;
- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 identifier:(id)a4 outOwningGroupId:(unint64_t *)a5 outScore:(double *)a6;
- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 normalizedString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7;
- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 owningGroupId:(unint64_t)a4 contentString:(id)a5 normalizedString:(id)a6 identifier:(id)a7 rankingScore:(double)a8 insertIfNeeded:(BOOL)a9 tokenOutput:(const tokenOutput_t *)a10 shouldUpdateOwningGroupId:(BOOL)a11 shouldUpdateRankingScore:(BOOL)a12;
- (unint64_t)_inqNumberOfAssetsMatchingGroupWithId:(unint64_t)a3;
- (unint64_t)_inqNumberOfCollectionsMatchingGroupWithId:(unint64_t)a3;
- (unint64_t)_inqUpdateGroupForText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningGroupId:(unint64_t)a6;
- (unint64_t)assetCountForLookupIdentifier:(id)a3;
- (unint64_t)countOfAssets;
- (void)_clearInitialSuggestions;
- (void)_executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5;
- (void)_executeQueryV2:(id)a3 resultsHandler:(id)a4;
- (void)_finalizeEverything;
- (void)_inSearchQueueAsync:(id)a3;
- (void)_ingRebuildPrefixTableIfNeeded;
- (void)_inqAsync:(id)a3;
- (void)_inqDeleteGroupsWithGraphCollectionsForPersonUUID:(id)a3;
- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 allowError:(int)a4 withStatementBlock:(id)a5;
- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withCancelableStatementBlock:(id)a4;
- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withStatementBlock:(id)a4;
- (void)_inqGetTokensFromString:(id)a3 category:(signed __int16)a4 tokenOutput:(tokenOutput_t *)a5;
- (void)_inqGroupIdsForAssetOrCollectionIds:(__CFArray *)a3 resultType:(unint64_t)a4 completion:(id)a5;
- (void)_inqPerformBatch:(id)a3;
- (void)_inqPrepareAndExecuteStatement:(const char *)a3;
- (void)_inqRecycleGroups;
- (void)_inqRemoveUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 isInBatch:(BOOL)a6;
- (void)_inqRemoveUUID:(id)a3 objectType:(unint64_t)a4 isInBatch:(BOOL)a5;
- (void)_inqRemoveUnusedGroups;
- (void)_inqSync:(id)a3;
- (void)_inqUpdateGATableWithGroupId:(unint64_t)a3 assetId:(unint64_t)a4;
- (void)_inqUpdateGCTableWithGroupId:(unint64_t)a3 collectionId:(unint64_t)a4;
- (void)_prepareTokenOutput:(tokenOutput_t *)a3 forIndexing:(BOOL)a4;
- (void)_processNextKeywordSuggestionsForQuery:(id)a3 groupResults:(id)a4 allowIdentifiers:(BOOL)a5;
- (void)_removeUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 completion:(id)a6;
- (void)_removeUUIDs:(id)a3 objectType:(unint64_t)a4 deferRemovingUnusedGroups:(BOOL)a5 completion:(id)a6;
- (void)_runWithMatchingIDs:(id)a3 block:(id)a4;
- (void)_sortedSearchIndexRowIdsFromUUIDs:(id)a3 searchResultType:(unint64_t)a4 completion:(id)a5;
- (void)addAsset:(id)a3 withCompletion:(id)a4;
- (void)addAssets:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5;
- (void)addAssets:(id)a3 withCompletion:(id)a4;
- (void)addCollection:(id)a3 withCompletion:(id)a4;
- (void)addCollections:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5;
- (void)addCollections:(id)a3 withCompletion:(id)a4;
- (void)assetIdsFromUUIDs:(id)a3 completion:(id)a4;
- (void)bindMatchingIds:(__CFArray *)a3 range:(_NSRange)a4;
- (void)bindMatchingIds:(__CFSet *)a3;
- (void)bindMatchingIds:(const int64_t *)a3 numberOfMatchingIds:(unint64_t)a4;
- (void)collectionIdsFromUUIDs:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4;
- (void)deleteGroupsWithGraphCollectionsForPersonUUIDs:(id)a3 withCompletion:(id)a4;
- (void)dropDatabaseWithCompletion:(id)a3;
- (void)executeFetchEmbeddingQuery:(id)a3 batchHandler:(id)a4;
- (void)executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5;
- (void)executeQueryV2:(id)a3 resultsHandler:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 withResultEnumerationBlock:(id)a4;
- (void)executeStatementFromString:(id)a3;
- (void)executeStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4;
- (void)exqExecuteStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4;
- (void)fetchAssetUUIDsForAssetIDs:(__CFArray *)a3 creationDateSorted:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4 withBatchHandler:(id)a5;
- (void)group:(id)a3 fetchOwningContentString:(BOOL)a4 assetIdRange:(_NSRange)a5 collectionIdRange:(_NSRange)a6 completionHandler:(id)a7;
- (void)groupsForAssetIds:(__CFArray *)a3 completion:(id)a4;
- (void)groupsForCollectionIds:(__CFArray *)a3 completion:(id)a4;
- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6;
- (void)linkAssetWithId:(int64_t)a3 toGroupWithId:(int64_t)a4;
- (void)linkCollectionWithId:(int64_t)a3 toGroupWithId:(int64_t)a4;
- (void)prepareForNumberOfMatchingIds:(unint64_t)a3;
- (void)removeAssetWithUUID:(id)a3 completion:(id)a4;
- (void)removeAssetsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeAssetsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5;
- (void)removeCategories:(id)a3 forAssetUUID:(id)a4 completion:(id)a5;
- (void)removeCollectionWithUUID:(id)a3 completion:(id)a4;
- (void)removeCollectionsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeCollectionsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5;
- (void)removeUnusedGroups;
- (void)resetGroupsCache;
- (void)unbindMatchingIds;
- (void)unprepareMatchingIds;
- (void)updateRankingScoreForGroups:(id)a3 withCompletion:(id)a4;
- (void)updateSearchMetadata;
@end

@implementation PSIDatabase

void __55__PSIDatabase_PSIQueryDelegate__assetUUIDsForAssetIDs___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count >= 1)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", *(void *)(a1 + 48), 0, Count, 0);
    v4 = (void *)v3;
    if (v3) {
      v5 = (void *)v3;
    }
    else {
      v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
  v6 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v8 = 134218240;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    CFIndex v11 = Count;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "PSI fetched %llu asset UUIDs for %ld assetIds.", (uint8_t *)&v8, 0x16u);
  }
}

void __60__PSIDatabase_groupForText_identifier_category_resultTypes___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = [*(id *)(a1 + 40) length];
    uint64_t v3 = *(void **)(a1 + 48);
    __int16 v4 = *(_WORD *)(a1 + 64);
    if (v2) {
      uint64_t v5 = [v3 _inqGroupIdForCategory:v4 contentString:*(void *)(a1 + 40) identifier:*(void *)(a1 + 32) outOwningGroupId:0 outScore:0];
    }
    else {
      uint64_t v5 = [v3 _inqGroupIdForCategory:v4 identifier:*(void *)(a1 + 32) outOwningGroupId:0 outScore:0];
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 48) _inqGroupIdForCategory:*(__int16 *)(a1 + 64) contentString:*(void *)(a1 + 40)];
  }
  v6 = (const void *)v5;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFSetAddValue(Mutable, v6);
  int v8 = [*(id *)(a1 + 48) _inqGroupsWithMatchingGroupIds:Mutable dateFilter:0 includeObjects:1 searchResultTypes:*(void *)(a1 + 72) matchingPredicateBlock:0];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  CFIndex v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  CFRelease(Mutable);
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7
{
  int v10 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroup");
  if (sqlite3_bind_int(Value, 1, v10) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  int v29 = 0;
  v15 = _newUTF8String(v12, &v29);
  if (sqlite3_bind_text(Value, 2, v15, v29, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  int v28 = 0;
  v16 = _newUTF8String(v13, &v28);
  if (sqlite3_bind_text(Value, 3, v16, v28, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__PSIDatabase__inqGroupIdForCategory_contentString_identifier_outOwningGroupId_outScore___block_invoke;
  v19[3] = &unk_1E5873AF0;
  v19[4] = &buf;
  v19[5] = &v24;
  v19[6] = &v20;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v19];
  if (a6) {
    *a6 = v25[3];
  }
  if (a7) {
    *a7 = v21[3];
  }
  if (v15) {
    free(v15);
  }
  if (v16) {
    free(v16);
  }
  unint64_t v17 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

- (id)_inqAssetUUIDsForAssetIds:(__CFArray *)a3 range:(_NSRange)a4 creationDateSorted:(BOOL)a5
{
  if (a4.length)
  {
    BOOL v5 = a5;
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    int v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4.length];
    -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
    if (v5) {
      CFIndex v11 = @"selectAssetIdsInDateSorted";
    }
    else {
      CFIndex v11 = @"selectAssetIdsIn";
    }
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, v11);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__PSIDatabase__inqAssetUUIDsForAssetIds_range_creationDateSorted___block_invoke;
    v16[3] = &unk_1E5873650;
    id v17 = v10;
    id v13 = v10;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v16];
    [(PSIIntArray *)self->_matchingIds unbind];
    v14 = (void *)[v13 copy];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v14;
}

- (id)_inqGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  CFIndex Count = CFSetGetCount(a3);
  if (Count)
  {
    BOOL v27 = v9;
    v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    if (+[PLSearchIndexConfiguration shouldIndexFilenames])
    {
      v16 = [(PSIDatabase *)self _inqFilenameGroupsWithMatchingGroupIds:a3 dateFilter:v12 searchResultTypes:a6 matchingPredicateBlock:v13];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v18 = CFSetGetCount(a3);
    MutableCopy = CFSetCreateMutableCopy(v17, v18, a3);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = v16;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          CFSetRemoveValue(MutableCopy, (const void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) groupId]);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v22);
    }

    v25 = [(PSIDatabase *)self _inqNonFilenameGroupsWithMatchingGroupIds:MutableCopy dateFilter:v12 includeObjects:v27 searchResultTypes:a6 matchingPredicateBlock:v13];
    CFRelease(MutableCopy);
    [v15 addObjectsFromArray:v25];
    [v15 addObjectsFromArray:v20];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)_inqNonFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  CFIndex Count = CFSetGetCount(a3);
  if (Count)
  {
    v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    [(PSIIntArray *)self->_matchingIds bindElements:a3];
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchNonFilenameGroupsForGroupIds");
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __124__PSIDatabase__inqNonFilenameGroupsWithMatchingGroupIds_dateFilter_includeObjects_searchResultTypes_matchingPredicateBlock___block_invoke;
    uint64_t v24 = &unk_1E5873BB8;
    v25 = self;
    BOOL v30 = a5;
    id v26 = v12;
    unint64_t v29 = a6;
    id v28 = v13;
    id v17 = v15;
    id v27 = v17;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:&v21];
    [(PSIIntArray *)self->_matchingIds unbind];
    CFIndex v18 = v27;
    id v19 = v17;
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __73__PSIDatabase__inqGroupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _inqGroupWithStatement:a2 dateFilter:*(void *)(a1 + 40) includeObjects:1 searchResultTypes:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __124__PSIDatabase__inqNonFilenameGroupsWithMatchingGroupIds_dateFilter_includeObjects_searchResultTypes_matchingPredicateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _inqGroupWithStatement:a2 dateFilter:*(void *)(a1 + 40) includeObjects:*(unsigned __int8 *)(a1 + 72) searchResultTypes:*(void *)(a1 + 64)];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v7 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3), uint64_t v3 = v7, v5)) {
    [*(id *)(a1 + 48) addObject:v3];
  }
  return MEMORY[0x1F4181820]();
}

- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6
{
  return [(PSIDatabase *)self _inqGroupWithStatement:a3 dateFilter:a4 includeObjects:a5 isFilenameStatement:0 excludingGroupId:0 searchResultTypes:a6];
}

- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 isFilenameStatement:(BOOL)a6 excludingGroupId:(unint64_t)a7 searchResultTypes:(unint64_t)a8
{
  char v8 = a8;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a4;
  sqlite3_int64 v15 = sqlite3_column_int64(a3, 0);
  if (v15 == a7)
  {
    v16 = 0;
    goto LABEL_18;
  }
  sqlite3_int64 v17 = v15;
  char v22 = 0;
  if (v14 || !v11)
  {
    v16 = objc_alloc_init(PSIGroup);
    [(PSIGroup *)v16 setGroupId:v17];
  }
  else
  {
    v16 = [(PSIDatabase *)self _inqDequeueGroupObjectWithId:v15 isCachedGroup:&v22];
    if (v22) {
      goto LABEL_18;
    }
  }
  if (v10) {
    [(PSIGroup *)v16 prepareFromFilenameStatement:a3];
  }
  else {
    [(PSIGroup *)v16 prepareFromStatement:a3];
  }
  uint64_t v18 = [(PSIGroup *)v16 groupIdForObjectLookup];
  if (PLSearchIndexCategoryIsSynonym([(PSIGroup *)v16 category]))
  {
    [(PSIDatabase *)self _inqScoreForGroupID:v18];
    -[PSIGroup setScore:](v16, "setScore:");
  }
  if (v11)
  {
    if (v8)
    {
      id v19 = [(PSIDatabase *)self _inqNewAssetIdsForGroupId:v18 dateFilter:v14];
      [(PSIGroup *)v16 setAssetIds:v19];
      CFRelease(v19);
    }
    if ((v8 & 2) != 0)
    {
      id v20 = [(PSIDatabase *)self _inqNewCollectionIdsForGroupId:v18 dateFilter:v14];
      [(PSIGroup *)v16 setCollectionIds:v20];
      CFRelease(v20);
    }
  }
LABEL_18:

  return v16;
}

- (__CFArray)_inqNewAssetIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  if (v6)
  {
    char v8 = [v6 singleDate];

    if (v8)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithSingleDateGA");
      BOOL v10 = [v6 singleDate];
      int v11 = sqlite3_bind_int64(Value, 1, [v10 int64RepresentationMask]);

      if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      id v12 = [v6 singleDate];
      int v13 = sqlite3_bind_int64(Value, 2, [v12 int64Representation]);

      if (v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = @"Failed to bind parameter";
        id v14 = MEMORY[0x1E4F14500];
LABEL_51:
        _os_log_error_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
    else
    {
      v16 = [v6 startDate];

      if (v16)
      {
        sqlite3_int64 v17 = [v6 endDate];

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v17)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartEndDatesGA");
          id v19 = [v6 startDate];
          int v20 = sqlite3_bind_int64(Value, 1, [v19 int64RepresentationMask]);

          if (v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v21 = [v6 startDate];
          int v22 = sqlite3_bind_int64(Value, 2, [v21 int64Representation]);

          if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v23 = [v6 endDate];
          int v24 = sqlite3_bind_int64(Value, 3, [v23 int64RepresentationMask]);

          if (v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          v25 = [v6 endDate];
          int v26 = sqlite3_bind_int64(Value, 4, [v25 int64Representation]);

          if (v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            id v14 = MEMORY[0x1E4F14500];
            goto LABEL_51;
          }
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartDateGA");
          long long v31 = [v6 startDate];
          int v32 = sqlite3_bind_int64(Value, 1, [v31 int64RepresentationMask]);

          if (v32 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v33 = [v6 startDate];
          int v34 = sqlite3_bind_int64(Value, 2, [v33 int64Representation]);

          if (v34 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v37 = @"Failed to bind parameter";
            id v14 = MEMORY[0x1E4F14500];
            goto LABEL_51;
          }
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithEndDateGA");
        id v27 = [v6 endDate];
        int v28 = sqlite3_bind_int64(Value, 1, [v27 int64RepresentationMask]);

        if (v28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v37 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        unint64_t v29 = [v6 endDate];
        int v30 = sqlite3_bind_int64(Value, 2, [v29 int64Representation]);

        if (v30 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v37 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v37 = @"Failed to bind parameter";
          id v14 = MEMORY[0x1E4F14500];
          goto LABEL_51;
        }
      }
    }
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGA");
    if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v37 = @"Failed to bind parameter";
      id v14 = MEMORY[0x1E4F14500];
      goto LABEL_51;
    }
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __52__PSIDatabase__inqNewAssetIdsForGroupId_dateFilter___block_invoke;
  v35[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v35[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v35];

  return Mutable;
}

- (id)_inqDequeueGroupObjectWithId:(unint64_t)a3 isCachedGroup:(BOOL *)a4
{
  CFDictionaryGetValue(self->_inqGroupObjectsById, (const void *)a3);
  uint64_t v7 = (PSIGroup *)objc_claimAutoreleasedReturnValue();
  char v8 = v7;
  if (v7)
  {
    [(PSIGroup *)v7 resetIntersectedIds];
    BOOL v9 = v8;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v9 = objc_alloc_init(PSIGroup);
  [(PSIGroup *)v9 setGroupId:a3];
  CFDictionarySetValue(self->_inqGroupObjectsById, (const void *)a3, v9);
  if (a4) {
LABEL_3:
  }
    *a4 = v8 != 0;
LABEL_4:
  return v9;
}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withStatementBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PSIDatabase__inqExecutePreparedStatement_withStatementBlock___block_invoke;
  v8[3] = &unk_1E5873BE0;
  id v9 = v6;
  id v7 = v6;
  [(PSIDatabase *)self _inqExecutePreparedStatement:a3 allowError:0 withStatementBlock:v8];
}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 allowError:(int)a4 withStatementBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v8 = (uint64_t (**)(id, sqlite3_stmt *))a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = (sqlite3_stmt *)@"Statement is nil";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }
  int v9 = 100;
  while (v9 == 100)
  {
    int v10 = sqlite3_step(a3);
    int v9 = v10;
    if (v8 && v10 == 100 && (v8[2](v8, a3) & 1) == 0) {
      goto LABEL_19;
    }
  }
  if (v9 != 101 && (!a4 || (v9 & a4) != a4))
  {
    int v11 = sqlite3_errmsg(self->_inqDatabase);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218498;
      id v14 = a3;
      __int16 v15 = 2080;
      v16 = v11;
      __int16 v17 = 1024;
      int v18 = v9;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", (uint8_t *)&v13, 0x1Cu);
    }
    if ((~v9 & 0xB) == 0)
    {
      id v12 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134218498;
        id v14 = a3;
        __int16 v15 = 2080;
        v16 = v11;
        __int16 v17 = 1026;
        int v18 = v9;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: \"%p\": %s (%{public}d).", (uint8_t *)&v13, 0x1Cu);
      }
    }
  }
LABEL_19:
  sqlite3_reset(a3);
}

uint64_t __63__PSIDatabase__inqExecutePreparedStatement_withStatementBlock___block_invoke(uint64_t a1)
{
  return 1;
}

void __52__PSIDatabase__inqNewAssetIdsForGroupId_dateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

void __45__PSIDatabase__inqNewAssetIdsWithDateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

void __66__PSIDatabase__inqAssetUUIDsForAssetIds_range_creationDateSorted___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
  id v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

void __89__PSIDatabase__inqGroupIdForCategory_contentString_identifier_outOwningGroupId_outScore___block_invoke(void *a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(void *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

sqlite3_int64 __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke_961(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __28__PSIDatabase_countOfAssets__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) _inqPrepareStatement:"SELECT COUNT(rowid) FROM assets"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PSIDatabase_countOfAssets__block_invoke_2;
  v4[3] = &unk_1E5873698;
  uint64_t v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v3 _inqExecutePreparedStatement:v2 withStatementBlock:v4];
  if (sqlite3_finalize(v2))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = @"Failed to finalize statement";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
  }
}

- (__CFDictionary)_inqPrepareStatementsForOptions:(int64_t)a3 tokenizerName:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
  if ((v4 & 2) != 0)
  {
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS groups(category INT2, owning_groupid INT, content_string TEXT, normalized_string TEXT, lookup_identifier TEXT, score REAL, token_ranges_0 INT8, token_ranges_1 INT8, UNIQUE(category, owning_groupid, content_string, lookup_identifier, token_ranges_0, token_ranges_1))"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS assets(uuid_0 INT, uuid_1 INT, creationDate INT, UNIQUE(uuid_0, uuid_1))"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS ga(groupid INT, assetid INT, PRIMARY KEY(groupid, assetid))"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS collections(uuid_0 INT, uuid_1 INT, startDate INT, endDate INT, title TEXT, subtitle TEXT, type INT8, keyAssetUUIDPrivate TEXT, keyAssetUUIDShared TEXT, assetsCountPrivate INT32, assetsCountShared INT32, sortDate DOUBLE, UNIQUE(uuid_0, uuid_1))"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS gc(groupid INT, collectionid INT, PRIMARY KEY(groupid, collectionid))"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS tmp_used_groupids (groupid INTEGER PRIMARY KEY);"];
    [NSString stringWithFormat:@"CREATE VIRTUAL TABLE IF NOT EXISTS prefix USING fts5(content='groups', normalized_string, category UNINDEXED, tokenize = '%@')", v6];
    id v8 = objc_claimAutoreleasedReturnValue();
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", [v8 UTF8String]);
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TRIGGER IF NOT EXISTS trigger_groups_insert AFTER INSERT ON groups BEGIN INSERT INTO prefix(rowid, normalized_string, category) VALUES (new.rowid, new.normalized_string, new.category); END;"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TRIGGER IF NOT EXISTS trigger_groups_delete AFTER DELETE ON groups BEGIN INSERT INTO prefix(prefix, rowid, normalized_string, category) VALUES('delete', old.rowid, old.normalized_string, old.category); END;"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"DROP INDEX IF EXISTS group_pk"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"DROP TABLE IF EXISTS lookup"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS groupid_by_contentstring_category_lookupid_owner ON groups(content_string, category, lookup_identifier, owning_groupid)"];
    [NSString stringWithFormat:@"CREATE INDEX IF NOT EXISTS groupid_by_normalized_string_category_lookupid_owner ON groups(normalized_string, category, lookup_identifier, owning_groupid) WHERE category = %lu OR category = %lu", 1203, 1204];
    id v9 = objc_claimAutoreleasedReturnValue();
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", [v9 UTF8String]);
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS asset_pk ON assets(uuid_0, uuid_1)"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS ga_assetid ON ga(assetid, groupid)"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS ga_groupid ON ga(groupid);"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS collection_pk ON collections(uuid_0, uuid_1)"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS gc_collectionid ON gc(collectionid)"];
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE INDEX IF NOT EXISTS gc_groupid ON gc(groupid);"];
    int v10 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO groups VALUES(?, ?, ?, ?, ?, ?, ?, ?)"];
    if (v10) {
      CFDictionarySetValue(Mutable, @"insertGroup", v10);
    }
    int v11 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM groups WHERE rowid IN matchingIds"];
    if (v11) {
      CFDictionarySetValue(Mutable, @"deleteGroupsWithIds", v11);
    }
    id v12 = [(PSIDatabase *)self _inqPrepareStatement:"UPDATE groups SET owning_groupid = ? WHERE rowid = ?"];
    if (v12) {
      CFDictionarySetValue(Mutable, @"updateGroupOwningGroupId", v12);
    }
    int v13 = [(PSIDatabase *)self _inqPrepareStatement:"UPDATE groups SET score = ? WHERE rowid = ?"];
    if (v13) {
      CFDictionarySetValue(Mutable, @"updateGroupRankingScore", v13);
    }
    id v14 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, content_string FROM groups");
    if (v14) {
      CFDictionarySetValue(Mutable, @"selectAllGroups", v14);
    }
    __int16 v15 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND normalized_string = ? AND lookup_identifier = ? LIMIT 1");
    if (v15) {
      CFDictionarySetValue(Mutable, @"selectGroupWithNormalizedStr", v15);
    }
    v16 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM groups WHERE lookup_identifier = ?"];
    if (v16) {
      CFDictionarySetValue(Mutable, @"selectGroupsForLookupId", v16);
    }
    __int16 v17 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT groupid FROM gc WHERE groupid IN matchingIds"];
    if (v17) {
      CFDictionarySetValue(Mutable, @"selectGroupIdsInGCWithGroupIdsStatement", v17);
    }
    int v18 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO assets(uuid_0, uuid_1, creationDate) VALUES(?, ?, ?)"];
    if (v18) {
      CFDictionarySetValue(Mutable, @"insertAsset", v18);
    }
    uint64_t v19 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM assets WHERE rowid = ?"];
    if (v19) {
      CFDictionarySetValue(Mutable, @"deleteAsset", v19);
    }
    int v20 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE uuid_0 = ? AND uuid_1 = ?"];
    if (v20) {
      CFDictionarySetValue(Mutable, @"selectAsset", v20);
    }
    uint64_t v21 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO ga VALUES(?, ?)"];
    if (v21) {
      CFDictionarySetValue(Mutable, @"insertGA", v21);
    }
    int v22 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM ga WHERE assetid = ?"];
    if (v22) {
      CFDictionarySetValue(Mutable, @"deleteGA", v22);
    }
    uint64_t v23 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT groupid FROM ga WHERE assetid = ?"];
    if (v23) {
      CFDictionarySetValue(Mutable, @"selectGAInv", v23);
    }
    int v24 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO collections(uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
    if (v24) {
      CFDictionarySetValue(Mutable, @"insertCollection", v24);
    }
    v25 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM collections WHERE rowid = ?"];
    if (v25) {
      CFDictionarySetValue(Mutable, @"deleteCollection", v25);
    }
    int v26 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE uuid_0 = ? AND uuid_1 = ?"];
    if (v26) {
      CFDictionarySetValue(Mutable, @"selectCollectionForUUID", v26);
    }
    id v27 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1, type FROM collections");
    if (v27) {
      CFDictionarySetValue(Mutable, @"listCollections", v27);
    }
    int v28 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO gc VALUES(?, ?)"];
    if (v28) {
      CFDictionarySetValue(Mutable, @"insertGC", v28);
    }
    unint64_t v29 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM gc WHERE collectionid = ?"];
    if (v29) {
      CFDictionarySetValue(Mutable, @"deleteGC", v29);
    }
    int v30 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT groupid FROM gc WHERE collectionid = ?"];
    if (v30) {
      CFDictionarySetValue(Mutable, @"selectGCInv", v30);
    }
    long long v31 = [(PSIDatabase *)self statementFromString:@"SELECT rowid FROM groups"];
    inqIdsOfAllGroupsStatement = self->_inqIdsOfAllGroupsStatement;
    self->_inqIdsOfAllGroupsStatement = v31;

    [(PSIDatabase *)self statementFromString:@"SELECT rowid FROM prefix where normalized_string != \"\""];
    uint64_t v33 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqIdsOfAllGroupsInPrefixStatement = self->_inqIdsOfAllGroupsInPrefixStatement;
    self->_inqIdsOfAllGroupsInPrefixStatement = v33;

    v35 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM tmp_used_groupids;"];
    if (v35) {
      CFDictionarySetValue(Mutable, @"deleteUnusedGroupsAndLookups_1", v35);
    }
    v36 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT OR IGNORE INTO tmp_used_groupids SELECT groupid FROM ga UNION SELECT groupid FROM gc;"];
    if (v36) {
      CFDictionarySetValue(Mutable, @"deleteUnusedGroupsAndLookups_2", v36);
    }
    v37 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT OR IGNORE INTO tmp_used_groupids SELECT ROWID FROM groups WHERE owning_groupid IN (SELECT ROWID FROM tmp_used_groupids);"];
    if (v37) {
      CFDictionarySetValue(Mutable, @"deleteUnusedGroupsAndLookups_3", v37);
    }
    uint64_t v38 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM groups where ROWID NOT IN (SELECT groupid FROM tmp_used_groupids);"];
    if (v38) {
      CFDictionarySetValue(Mutable, @"deleteUnusedGroupsAndLookups_4", v38);
    }
    [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"CREATE TABLE IF NOT EXISTS embeddings (id INTEGER PRIMARY KEY, type INT, assetUUID TEXT, vector BLOB, UNIQUE(type, assetUUID, vector))"];
    v39 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM ga where ROWID IN (SELECT ga.rowid FROM ga JOIN groups ON ga.groupid = groups.rowid WHERE ga.assetid = ? AND groups.category IN matchingIds);"];
    if (v39) {
      CFDictionarySetValue(Mutable, @"deleteGAForSelectedGroupsCategories", v39);
    }
    v40 = [(PSIDatabase *)self _inqPrepareStatement:"DELETE FROM gc where ROWID IN (SELECT gc.rowid FROM gc JOIN groups ON gc.groupid = groups.rowid WHERE gc.collectionid = ? AND groups.category IN matchingIds);"];
    if (v40) {
      CFDictionarySetValue(Mutable, @"deleteGCForSelectedGroupsCategories", v40);
    }
  }
  if (v4)
  {
    v41 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM prefix WHERE normalized_string MATCH ?"];
    if (v41) {
      CFDictionarySetValue(Mutable, @"selectPrefix", v41);
    }
    v42 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM groups WHERE lookup_identifier = ?"];
    if (v42) {
      CFDictionarySetValue(Mutable, @"selectLookupGroupId", v42);
    }
    v43 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM groups WHERE owning_groupid = 0 AND lookup_identifier = ? LIMIT 1"];
    if (v43) {
      CFDictionarySetValue(Mutable, @"selectLookupGroupIdLimit1", v43);
    }
    v44 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT content_string FROM groups WHERE rowid = ?"];
    if (v44) {
      CFDictionarySetValue(Mutable, @"selectGroupAlt", v44);
    }
    v45 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds ORDER BY creationDate");
    if (v45) {
      CFDictionarySetValue(Mutable, @"selectAssetIdsInDateSorted", v45);
    }
    v46 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets ORDER BY creationDate DESC LIMIT ?"];
    if (v46) {
      CFDictionarySetValue(Mutable, @"selectAssetIdsDateSortedDescWithLimit", v46);
    }
    v47 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate FROM collections WHERE rowid IN matchingIds");
    if (v47) {
      CFDictionarySetValue(Mutable, @"selectCollectionIn", v47);
    }
    v48 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM collections WHERE rowid IN matchingIds");
    if (v48) {
      CFDictionarySetValue(Mutable, @"selectCollectionIdsIn", v48);
    }
    v49 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid = ?");
    if (v49) {
      CFDictionarySetValue(Mutable, @"fetchGroupForGroupId", v49);
    }
    v50 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid IN matchingIds");
    if (v50) {
      CFDictionarySetValue(Mutable, @"fetchGroupsForGroupIds", v50);
    }
    v51 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM groups WHERE content_string = ? AND category = ? LIMIT 1"];
    if (v51) {
      CFDictionarySetValue(Mutable, @"fetchGroupsForTextAndCategory", v51);
    }
    [NSString stringWithFormat:@"SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid IN matchingIds AND category != %lu", 2100];
    id v52 = objc_claimAutoreleasedReturnValue();
    v53 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v52 UTF8String]);
    if (v53) {
      CFDictionarySetValue(Mutable, @"fetchNonFilenameGroupsForGroupIds", v53);
    }

    v54 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections"];
    if (v54) {
      CFDictionarySetValue(Mutable, @"selectCollection", v54);
    }
    v55 = [NSString stringWithFormat:@"SELECT groups.rowid, content_string, normalized_string, token_ranges_0, token_ranges_1, assetid FROM groups                                                 JOIN ga ON groups.rowid == ga.groupid                                                 WHERE groups.rowid IN matchingIds AND groups.category == %lu", 2100];
    v56 = [NSString stringWithFormat:@"SELECT groups.rowid, content_string, normalized_string, token_ranges_0, token_ranges_1, assetid FROM groups                                                               JOIN ga ON groups.rowid == ga.groupid                                                               JOIN assets ON ga.assetid == assets.rowid                                                               WHERE groups.rowid IN matchingIds AND groups.category == %lu", 2100];
    id v57 = v55;
    v58 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v57 UTF8String]);
    if (v58) {
      CFDictionarySetValue(Mutable, @"fetchFilenameGroupsForGroupIds", v58);
    }
    [v56 stringByAppendingString:@" AND creationDate & ? == ?"];
    id v59 = objc_claimAutoreleasedReturnValue();
    v60 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v59 UTF8String]);
    if (v60) {
      CFDictionarySetValue(Mutable, @"fetchFilenameGroupsForGroupIdsWithSingleDate", v60);
    }

    [v56 stringByAppendingString:@" AND creationDate & ? >= ?"];
    id v61 = objc_claimAutoreleasedReturnValue();
    v62 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v61 UTF8String]);
    if (v62) {
      CFDictionarySetValue(Mutable, @"fetchFilenameGroupsForGroupIdsWithStartDate", v62);
    }

    [v56 stringByAppendingString:@" AND creationDate & ? <= ?"];
    id v63 = objc_claimAutoreleasedReturnValue();
    v64 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v63 UTF8String]);
    if (v64) {
      CFDictionarySetValue(Mutable, @"fetchFilenameGroupsForGroupIdsWithEndDate", v64);
    }

    [v56 stringByAppendingString:@" AND creationDate & ? >= ? AND creationDate & ? <= ?"];
    id v65 = objc_claimAutoreleasedReturnValue();
    v66 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v65 UTF8String]);
    if (v66) {
      CFDictionarySetValue(Mutable, @"fetchFilenameGroupsForGroupIdsWithStartEndDates", v66);
    }

    v67 = [(PSIDatabase *)self statementFromString:@"SELECT groupid, assetid FROM ga WHERE assetid IN matchingIds"];
    inqAssetIdsByGroupIdForAssetIdsStatement = self->_inqAssetIdsByGroupIdForAssetIdsStatement;
    self->_inqAssetIdsByGroupIdForAssetIdsStatement = v67;

    v69 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT groupid FROM gc WHERE collectionid IN matchingIds"];
    if (v69) {
      CFDictionarySetValue(Mutable, @"selectGroupIdsInGCWithCollectionIds", v69);
    }
    v70 = [(PSIDatabase *)self statementFromString:@"SELECT groupid, collectionid FROM gc WHERE collectionid IN matchingIds"];
    inqCollectionIdsByGroupIdForCollectionIdsStatement = self->_inqCollectionIdsByGroupIdForCollectionIdsStatement;
    self->_inqCollectionIdsByGroupIdForCollectionIdsStatement = v70;

    [(PSIDatabase *)self statementFromString:@"SELECT count(*) from ga WHERE groupid = ?"];
    v72 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfAssetsMatchingGroupWithIdStatement = self->_inqNumberOfAssetsMatchingGroupWithIdStatement;
    self->_inqNumberOfAssetsMatchingGroupWithIdStatement = v72;

    v74 = [(PSIDatabase *)self statementFromString:@"SELECT count(*), groupid from ga WHERE groupid IN matchingIds GROUP BY groupid"];
    inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
    self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = v74;

    [(PSIDatabase *)self statementFromString:@"SELECT count(*) from gc WHERE groupid = ?"];
    v76 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfCollectionsMatchingGroupWithIdStatement = self->_inqNumberOfCollectionsMatchingGroupWithIdStatement;
    self->_inqNumberOfCollectionsMatchingGroupWithIdStatement = v76;

    v78 = [(PSIDatabase *)self statementFromString:@"SELECT count(*), groupid from gc WHERE groupid IN matchingIds GROUP BY groupid"];
    inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
    self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = v78;

    v80 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT category, owning_groupid, content_string FROM groups WHERE owning_groupid IN matchingIds");
    if (v80) {
      CFDictionarySetValue(Mutable, @"selectSynonymInfoWithOwningGroupIds", v80);
    }
    v81 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, uuid_0, uuid_1 FROM assets ORDER BY rowid");
    if (v81) {
      CFDictionarySetValue(Mutable, @"kSelectAssetIds", v81);
    }
    v82 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, uuid_0, uuid_1 FROM collections ORDER BY rowid");
    if (v82) {
      CFDictionarySetValue(Mutable, @"kSelectCollectionIds", v82);
    }
  }
  v83 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND lookup_identifier = ? LIMIT 1");
  if (v83) {
    CFDictionarySetValue(Mutable, @"selectGroupWithLookupId", v83);
  }
  v84 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND content_string = ? AND lookup_identifier = ? LIMIT 1");
  if (v84) {
    CFDictionarySetValue(Mutable, @"selectGroup", v84);
  }
  v85 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT groupid FROM ga WHERE assetid IN matchingIds"];
  if (v85) {
    CFDictionarySetValue(Mutable, @"selectGroupIdsInGAWithAssetIds", v85);
  }
  v86 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? == ? ORDER BY rowid"];
  if (v86) {
    CFDictionarySetValue(Mutable, @"selectWithSingleDateAsset", v86);
  }
  v87 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? >= ? ORDER BY rowid"];
  if (v87) {
    CFDictionarySetValue(Mutable, @"selectWithStartDateAsset", v87);
  }
  v88 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? <= ? ORDER BY rowid"];
  if (v88) {
    CFDictionarySetValue(Mutable, @"selectWithEndDateAsset", v88);
  }
  v89 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? >= ? AND creationDate & ? <= ? ORDER BY rowid"];
  if (v89) {
    CFDictionarySetValue(Mutable, @"selectWithStartEndDatesAsset", v89);
  }
  v90 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT assetid FROM ga WHERE groupid = ? ORDER BY assetid"];
  if (v90) {
    CFDictionarySetValue(Mutable, @"selectGA", v90);
  }
  v91 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? == ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid"];
  if (v91) {
    CFDictionarySetValue(Mutable, @"selectWithSingleDateGA", v91);
  }
  v92 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? >= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid"];
  if (v92) {
    CFDictionarySetValue(Mutable, @"selectWithStartDateGA", v92);
  }
  v93 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? <= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid"];
  if (v93) {
    CFDictionarySetValue(Mutable, @"selectWithEndDateGA", v93);
  }
  v94 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM assets WHERE creationDate & ? >= ? AND creationDate & ? <= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid"];
  if (v94) {
    CFDictionarySetValue(Mutable, @"selectWithStartEndDatesGA", v94);
  }
  v95 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE startDate & ? <= ? AND endDate & ? >= ? ORDER BY rowid"];
  if (v95) {
    CFDictionarySetValue(Mutable, @"selectWithSingleDateCollection", v95);
  }
  v96 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE endDate & ? >= ? ORDER BY rowid"];
  if (v96) {
    CFDictionarySetValue(Mutable, @"selectWithStartDateCollection", v96);
  }
  v97 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE startDate & ? <= ? ORDER BY rowid"];
  if (v97) {
    CFDictionarySetValue(Mutable, @"selectWithEndDateCollection", v97);
  }
  v98 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE endDate & ? >= ? AND startDate & ? <= ? ORDER BY rowid"];
  if (v98) {
    CFDictionarySetValue(Mutable, @"selectWithStartEndDatesCollection", v98);
  }
  v99 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT collectionid FROM gc WHERE groupid = ? ORDER BY collectionid"];
  if (v99) {
    CFDictionarySetValue(Mutable, @"selectGC", v99);
  }
  v100 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE startDate & ? <= ? AND endDate & ? >= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid"];
  if (v100) {
    CFDictionarySetValue(Mutable, @"selectWithSingleDateGC", v100);
  }
  v101 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE endDate & ? >= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid"];
  if (v101) {
    CFDictionarySetValue(Mutable, @"selectWithStartDateGC", v101);
  }
  v102 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE startDate & ? <= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid"];
  if (v102) {
    CFDictionarySetValue(Mutable, @"selectWithEndDateGC", v102);
  }
  v103 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM collections WHERE endDate & ? >= ? AND startDate & ? <= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid"];
  if (v103) {
    CFDictionarySetValue(Mutable, @"selectWithStartEndDatesGC", v103);
  }
  v104 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds");
  if (v104) {
    CFDictionarySetValue(Mutable, @"selectAssetIdsIn", v104);
  }
  v105 = [(PSIDatabase *)self statementFromString:@"SELECT rowid, uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds"];
  assetUUIDByAssetIdWithAssetIdsStatement = self->_assetUUIDByAssetIdWithAssetIdsStatement;
  self->_assetUUIDByAssetIdWithAssetIdsStatement = v105;

  v107 = [(PSIDatabase *)self statementFromString:@"SELECT rowid, uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate FROM collections WHERE rowid IN matchingIds"];
  collectionResultByCollectionIdWithCollectionIdsStatement = self->_collectionResultByCollectionIdWithCollectionIdsStatement;
  self->_collectionResultByCollectionIdWithCollectionIdsStatement = v107;

  v109 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT rowid FROM groups WHERE category IN matchingIds"];
  if (v109) {
    CFDictionarySetValue(Mutable, @"selectGroupsWithCategories", v109);
  }
  v110 = [(PSIDatabase *)self _inqPrepareStatement:"SELECT score FROM groups WHERE rowid = ? LIMIT 1"];
  if (v110) {
    CFDictionarySetValue(Mutable, @"selectRankingScoreForGroupId", v110);
  }

  return Mutable;
}

- (sqlite3_stmt)_inqPrepareStatement:(const char *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_inqDatabase, a3, -1, &ppStmt, 0);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = sqlite3_errmsg(self->_inqDatabase);
    if (!ppStmt)
    {
      id v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        id v12 = a3;
        __int16 v13 = 2080;
        id v14 = v8;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to prepare \"%s\": %s (%d).", buf, 0x1Cu);
      }
    }
  }
  return ppStmt;
}

- (id)statementFromString:(id)a3
{
  uint64_t v3 = -[PSIStatement initWithSQLite3Stmt:]([PSIStatement alloc], "initWithSQLite3Stmt:", -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [a3 UTF8String]));
  return v3;
}

uint64_t __38__PSIDatabase_assetIdsWithDateFilter___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqNewAssetIdsWithDateFilter:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (__CFArray)_inqNewAssetIdsWithDateFilter:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    int v6 = [v4 singleDate];

    if (v6)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithSingleDateAsset");
      id v8 = [v4 singleDate];
      int v9 = sqlite3_bind_int64(Value, 1, [v8 int64RepresentationMask]);

      if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v36 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      int v10 = [v4 singleDate];
      int v11 = sqlite3_bind_int64(Value, 2, [v10 int64Representation]);

      if (!v11 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)long long buf = 138412290;
      v36 = @"Failed to bind parameter";
      v25 = MEMORY[0x1E4F14500];
    }
    else
    {
      id v14 = [v4 startDate];

      if (v14)
      {
        __int16 v15 = [v4 endDate];

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v15)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartEndDatesAsset");
          uint64_t v17 = [v4 startDate];
          int v18 = sqlite3_bind_int64(Value, 1, [v17 int64RepresentationMask]);

          if (v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v36 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v19 = [v4 startDate];
          int v20 = sqlite3_bind_int64(Value, 2, [v19 int64Representation]);

          if (v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v36 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v21 = [v4 endDate];
          int v22 = sqlite3_bind_int64(Value, 3, [v21 int64RepresentationMask]);

          if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v36 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v23 = [v4 endDate];
          int v24 = sqlite3_bind_int64(Value, 4, [v23 int64Representation]);

          if (!v24 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          *(_DWORD *)long long buf = 138412290;
          v36 = @"Failed to bind parameter";
          v25 = MEMORY[0x1E4F14500];
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartDateAsset");
          int v30 = [v4 startDate];
          int v31 = sqlite3_bind_int64(Value, 1, [v30 int64RepresentationMask]);

          if (v31 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v36 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          int v32 = [v4 startDate];
          int v33 = sqlite3_bind_int64(Value, 2, [v32 int64Representation]);

          if (!v33 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          *(_DWORD *)long long buf = 138412290;
          v36 = @"Failed to bind parameter";
          v25 = MEMORY[0x1E4F14500];
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithEndDateAsset");
        int v26 = [v4 endDate];
        int v27 = sqlite3_bind_int64(Value, 1, [v26 int64RepresentationMask]);

        if (v27 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v36 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        int v28 = [v4 endDate];
        int v29 = sqlite3_bind_int64(Value, 2, [v28 int64Representation]);

        if (!v29 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        *(_DWORD *)long long buf = 138412290;
        v36 = @"Failed to bind parameter";
        v25 = MEMORY[0x1E4F14500];
      }
    }
    _os_log_error_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
LABEL_8:
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __45__PSIDatabase__inqNewAssetIdsWithDateFilter___block_invoke;
    v34[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v34[4] = Mutable;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v34];
    goto LABEL_12;
  }
  id v12 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "This should not get called with a nil dateFilter", buf, 2u);
  }

  Mutable = 0;
LABEL_12:

  return Mutable;
}

- (id)groupForText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 resultTypes:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 length])
  {
    if (!a5)
    {
      id v12 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = [v11 length];
  id v12 = 0;
  if (a5 && v13)
  {
LABEL_6:
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__107175;
    int v26 = __Block_byref_object_dispose__107176;
    id v27 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__PSIDatabase_groupForText_identifier_category_resultTypes___block_invoke;
    v15[3] = &unk_1E5874728;
    id v16 = v11;
    id v17 = v10;
    int v18 = self;
    uint64_t v19 = &v22;
    unint64_t v20 = a5;
    unint64_t v21 = a6;
    [(PSIDatabase *)self _inqSync:v15];
    id v12 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
LABEL_7:

  return v12;
}

- (id)newQueryWithSearchTextV2:(id)a3 queryTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardSearchText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 libraryScope:(unint64_t)a10 suggestionLimit:(unint64_t)a11
{
  BOOL v22 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOBYTE(v21) = a9;
  uint64_t v19 = [[PSIQuery alloc] initWithQueryTokensV2:v17 searchText:v18 scopedSearchIdentifiers:v16 searchResultTypes:a6 searchSuggestionType:a7 useWildcardText:v22 enableExactMatchPrioritization:v21 delegate:self libraryScope:a10 suggestionLimit:a11];

  return v19;
}

- (PSITokenizer)tokenizer
{
  return self->_tokenizer;
}

- (__CFArray)assetIdsWithDateFilter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PSIDatabase_assetIdsWithDateFilter___block_invoke;
  v9[3] = &unk_1E5875340;
  id v11 = &v12;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(PSIDatabase *)self _inqSync:v9];
  int v6 = (const void *)v13[3];
  if (v6) {
    uint64_t v7 = (__CFArray *)CFAutorelease(v6);
  }
  else {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)countOfAssets
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PSIDatabase_countOfAssets__block_invoke;
  v4[3] = &unk_1E5875E68;
  v4[4] = self;
  void v4[5] = &v5;
  [(PSIDatabase *)self _inqSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)assetUUIDsForAssetIDs:(__CFArray *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((self->_options & 1) != 0
      || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)long long buf = 138412290,
          *(void *)&uint8_t buf[4] = @"expect searchable",
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
          (self->_options & 1) != 0))
    {
      if (self->_databaseIsValid)
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v14 = __Block_byref_object_copy__107175;
        uint64_t v15 = __Block_byref_object_dispose__107176;
        id v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __55__PSIDatabase_PSIQueryDelegate__assetUUIDsForAssetIDs___block_invoke;
        v12[3] = &unk_1E5873ED8;
        v12[5] = buf;
        v12[6] = a3;
        v12[4] = self;
        [(PSIDatabase *)self _inqSync:v12];
        uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)&buf[8] + 40)];
        _Block_object_dispose(buf, 8);

        goto LABEL_19;
      }
    }
    int v6 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid) {
        uint64_t v7 = @"valid";
      }
      else {
        uint64_t v7 = @"invalid";
      }
      uint64_t v8 = @"yes";
      if ((self->_options & 1) == 0) {
        uint64_t v8 = @"no";
      }
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to fetch asset UUIDs for assetIds. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x16u);
    }

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    id v10 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "No assetIds provided to assetUUIDsForAssetIDs", buf, 2u);
    }

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v5 = (void *)v9;
LABEL_19:
  return v5;
}

- (id)groupForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4
{
  id v7 = a3;
  if (![v7 length])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PSIDatabase.m", 5240, @"Invalid parameter not satisfying: %@", @"lookupIdentifier.length > 0" object file lineNumber description];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unint64_t v20 = __Block_byref_object_copy__107175;
  uint64_t v21 = __Block_byref_object_dispose__107176;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke;
  v12[3] = &unk_1E5873DC0;
  id v8 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  uint64_t v15 = &v17;
  unint64_t v16 = a4;
  [(PSIDatabase *)self _inqSync:v12];
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)_inqSync:(id)a3
{
}

void __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  unint64_t v2 = _newUTF8String(*(void **)(a1 + 32), &v10);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 24), @"selectLookupGroupIdLimit1");
  if (sqlite3_bind_text(Value, 1, v2, v10, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke_961;
  v9[3] = &unk_1E5873698;
  v9[4] = &buf;
  [v4 _inqExecutePreparedStatement:Value withStatementBlock:v9];
  uint64_t v5 = *(void *)(*((void *)&buf + 1) + 24);
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) _inqGroupWithMatchingGroupId:v5 dateFilter:0 searchResultTypes:*(void *)(a1 + 56)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  if (v2) {
    free(v2);
  }
  _Block_object_dispose(&buf, 8);
}

- (id)_inqGroupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unint64_t v20 = __Block_byref_object_copy__107175;
  uint64_t v21 = __Block_byref_object_dispose__107176;
  id v22 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchGroupForGroupId");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v24 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PSIDatabase__inqGroupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke;
  v13[3] = &unk_1E5873B40;
  uint64_t v15 = &v17;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  unint64_t v16 = a5;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __49__PSIDatabase__prepareSearchIndexAtPath_options___block_invoke(uint64_t a1)
{
  unint64_t v2 = +[PSITokenizer ftsTokenizerName];
  if ([*(id *)(*(void *)(a1 + 32) + 176) registerFTS5TokenizerForDatabase:*(void *)(*(void *)(a1 + 32) + 8)])
  {
    uint64_t v3 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Failed to create fts custom tokenizer, falling back to ascii", v7, 2u);
    }

    unint64_t v2 = @"ascii";
  }
  id v4 = [[PSIIntArray alloc] initWithLabel:@"matchingIds" database:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _inqPrepareStatementsForOptions:*(void *)(a1 + 48) tokenizerName:v2];
}

uint64_t __46__PSIDatabase__inqVerifyTablesExistInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64AtColumn:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 1;
  return result;
}

- (void)executeStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PSIDatabase *)self statementFromString:a3];
  [(PSIDatabase *)self executeStatement:v7 withResultEnumerationBlock:v6];

  [v7 finalizze];
}

- (void)executeStatement:(id)a3 withResultEnumerationBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, id, uint8_t *))a4;
  id v8 = (sqlite3_stmt *)[(__CFString *)v6 stmt];
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = @"Statement is nil";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  do
  {
    while (1)
    {
      int v9 = sqlite3_step(v8);
      if (!v7 || v9 != 100) {
        break;
      }
      buf[0] = 0;
      v7[2](v7, v6, buf);
      if (buf[0]) {
        goto LABEL_9;
      }
    }
  }
  while (v9 == 100);
LABEL_9:
  int v10 = sqlite3_reset(v8);
  if (v10)
  {
    int v11 = v10;
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to reset statement: %s", sqlite3_errmsg(self->_inqDatabase));
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v12;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if ((~v11 & 0xB) == 0)
    {
      uint64_t v13 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 1026;
        int v19 = v11;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: %@: %@ (%{public}d).", buf, 0x1Cu);
      }
    }
  }
}

- (PSIDatabase)initWithPathManager:(id)a3 options:(int64_t)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PSIDatabase;
  id v8 = [(PSIDatabase *)&v24 init];
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = [v7 searchIndexDatabaseFilePath];
  path = v8->_path;
  v8->_path = (NSString *)v9;

  objc_storeStrong((id *)&v8->_pathManager, a3);
  if ((unint64_t)a4 <= 1) {
    a4 = 1;
  }
  int v11 = [PLSearchMetadataStore alloc];
  uint64_t v12 = [v7 searchIndexMetadataStoreFilePath];
  uint64_t v13 = [(PLSearchMetadataStore *)v11 initWithPath:v12];

  inqSearchMetadataStore = v8->_inqSearchMetadataStore;
  v8->_inqSearchMetadataStore = v13;
  uint64_t v15 = v13;

  __int16 v16 = [(PLSearchMetadataStore *)v15 currentSearchMetadata];
  uint64_t v17 = [v16 copy];
  inqSearchMetadata = v8->_inqSearchMetadata;
  v8->_inqSearchMetadata = (NSDictionary *)v17;

  BOOL v19 = [(PSIDatabase *)v8 _prepareSearchIndexAtPath:v8->_path options:a4];
  v8->_databaseIsValid = v19;
  if (!v19)
  {
    uint64_t v21 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to establish database connection, aborting initialization", (uint8_t *)v23, 2u);
    }

    uint64_t v20 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v20 = v8;
  }

  return v20;
}

- (BOOL)_prepareSearchIndexAtPath:(id)a3 options:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_options = a4;
  id v7 = +[PLSearchIndexConfiguration locale];
  id v8 = [[PSITokenizer alloc] initWithLocale:v7 useCache:a4 & 1];
  tokenizer = self->_tokenizer;
  self->_tokenizer = v8;

  int v10 = (sqlite3 *)[(id)objc_opt_class() _openDatabaseAtPath:self->_path options:a4];
  self->_inqDatabase = v10;
  if (!v10)
  {
LABEL_7:
    uint64_t v12 = self->_tokenizer;
    self->_tokenizer = 0;

    goto LABEL_8;
  }
  if (sqlite3_busy_timeout(v10, 500))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"Failed to set busy timeout";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
    }
    inqDatabase = self->_inqDatabase;
    if (inqDatabase)
    {
      sqlite3_close(inqDatabase);
      self->_inqDatabase = 0;
    }
    goto LABEL_7;
  }
  if ((a4 & 3) == 1 && ![(PSIDatabase *)self _inqVerifyTablesExistInDatabase])
  {
    uint64_t v23 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "Search Index does not contain any tables", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__PSIDatabase__prepareSearchIndexAtPath_options___block_invoke;
    v24[3] = &unk_1E5873ED8;
    v24[4] = self;
    v24[5] = &buf;
    v24[6] = a4;
    [(PSIDatabase *)self _inqPerformBatch:v24];
    self->_inqPreparedStatements = *(__CFDictionary **)(*((void *)&buf + 1) + 24);
    uint64_t v15 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.groupResults", 0);
    groupResultsQueue = self->_groupResultsQueue;
    self->_groupResultsQueue = v15;

    if ((a4 & 2) != 0)
    {
      __int16 v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      BOOL v19 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.serial", v18);
      serialQueue = self->_serialQueue;
      self->_serialQueue = v19;
    }
    else
    {
      uint64_t v17 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.serial", 0);
      __int16 v18 = self->_serialQueue;
      self->_serialQueue = v17;
    }

    if (a4)
    {
      uint64_t v21 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.search", 0);
      searchQueue = self->_searchQueue;
      self->_searchQueue = v21;
    }
    _Block_object_dispose(&buf, 8);
    if (self->_inqDatabase && self->_inqPreparedStatements)
    {
      self->_inqGroupObjectsById = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
      BOOL v13 = 1;
      goto LABEL_9;
    }
  }
LABEL_8:
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)_inqVerifyTablesExistInDatabase
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PSIDatabase__inqVerifyTablesExistInDatabase__block_invoke;
  v4[3] = &unk_1E58734C0;
  v4[4] = &v5;
  [(PSIDatabase *)self executeStatementFromString:@"SELECT count(*) from sqlite_master where type = 'table' and name = 'prefix'" withResultEnumerationBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_inqPrepareAndExecuteStatement:(const char *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:");
  for (int i = 100; i == 100; int i = sqlite3_step(v5))
    ;
  if (i != 101)
  {
    uint64_t v7 = sqlite3_errmsg(self->_inqDatabase);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      int v10 = a3;
      __int16 v11 = 2080;
      uint64_t v12 = v7;
      __int16 v13 = 1024;
      int v14 = i;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to execute \"%s\": %s (%d).", (uint8_t *)&v9, 0x1Cu);
    }
    if ((~i & 0xB) == 0)
    {
      char v8 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        int v10 = a3;
        __int16 v11 = 2080;
        uint64_t v12 = v7;
        __int16 v13 = 1026;
        int v14 = i;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: \"%s\": %s (%{public}d).", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
  if (v5 && sqlite3_finalize(v5) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    int v10 = (const char *)@"Failed to finalize statement";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_inqPerformBatch:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"BEGIN TRANSACTION"];
  v4[2](v4);

  [(PSIDatabase *)self _inqPrepareAndExecuteStatement:"END TRANSACTION"];
}

+ (sqlite3)_openDatabaseAtPath:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((v4 & 2) != 0)
  {
    int v6 = [MEMORY[0x1E4F8B9C0] dataProtectionOpenFlagForPath:v5] | 0x8002;
  }
  else if (v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"file:%@?readonly_shm=1", v5];

    int v6 = 32769;
    id v5 = (id)v7;
  }
  else
  {
    int v6 = 0x8000;
  }
  ppDb = 0;
  id v8 = v5;
  int v9 = (const char *)[v8 fileSystemRepresentation];
  int v10 = sqlite3_open_v2(v9, &ppDb, v6, 0);
  __int16 v11 = ppDb;
  if (!v10)
  {
LABEL_17:
    if (v11)
    {
      errmsg = 0;
      if (sqlite3_exec(v11, "PRAGMA journal_mode = WAL", 0, 0, &errmsg))
      {
        uint64_t v12 = PLSearchBackendPSIDatabaseGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136446210;
          __int16 v18 = (__CFString *)errmsg;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Failed to set sqlite3 WAL mode: %{public}s", buf, 0xCu);
        }

        sqlite3_free(errmsg);
      }
    }
    goto LABEL_22;
  }
  if (ppDb)
  {
    if (sqlite3_close(ppDb) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v18 = @"Couldn't close db";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    ppDb = 0;
  }
  if ((v4 & 2) != 0)
  {
    if (sqlite3_open_v2(v9, &ppDb, v6 | 4, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v18 = @"Failed to open db";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      goto LABEL_22;
    }
    __int16 v11 = ppDb;
    goto LABEL_17;
  }
LABEL_22:
  __int16 v13 = ppDb;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputNormalizedTokens, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputTokens, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputString, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_inqSearchMetadata, 0);
  objc_storeStrong((id *)&self->_inqSearchMetadataStore, 0);
  objc_storeStrong((id *)&self->_groupResultsQueue, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_inqIdsOfAllGroupsInPrefixStatement, 0);
  objc_storeStrong((id *)&self->_inqIdsOfAllGroupsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfCollectionsMatchingGroupWithIdStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfAssetsMatchingGroupWithIdStatement, 0);
  objc_storeStrong((id *)&self->_inqCollectionIdsByGroupIdForCollectionIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqAssetIdsByGroupIdForAssetIdsStatement, 0);
  objc_storeStrong((id *)&self->_collectionResultByCollectionIdWithCollectionIdsStatement, 0);
  objc_storeStrong((id *)&self->_assetUUIDByAssetIdWithAssetIdsStatement, 0);
  objc_storeStrong((id *)&self->_matchingIds, 0);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (int64_t)options
{
  return self->_options;
}

- (NSString)path
{
  return self->_path;
}

- (void)_clearInitialSuggestions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = [(PSIDatabase *)self pathManager];
  id v10 = 0;
  BOOL v3 = +[PLInitialSuggestionsStorageManager deleteInitialSuggestionsForPathManager:v2 error:&v10];
  id v4 = v10;

  id v5 = PLSearchBackendPSIDatabaseGetLog();
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      uint64_t v7 = "Successfully deleted initial suggestions following index drop: %@";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    uint64_t v7 = "Failed to delete initial suggestions following index drop: %@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (id)groupsForText:(id)a3 useWildcardSearchText:(BOOL)a4 leadingAnchored:(BOOL)a5 searchIndexCategories:(id)a6 searchResultTypes:(unint64_t)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  uint64_t v13 = [a3 lowercaseString];
  int v14 = +[PSITokenizer fts5StringFromString:v13 useWildcard:v9 leadingAnchored:v8];

  uint64_t v15 = [(PSIDatabase *)self groupIdsMatchingString:v14 categories:v12 textIsSearchable:1];

  __int16 v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
  uint64_t v17 = [(PSIDatabase *)self groupArraysFromGroupIdSets:v16 dateFilter:0 searchResultTypes:a7 progressBlock:&__block_literal_global_642];
  __int16 v18 = [v17 firstObject];

  return v18;
}

- (id)groupsForSearchIndexCategories:(id)a3 searchResultTypes:(unint64_t)a4 dateFilter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__107175;
  uint64_t v23 = __Block_byref_object_dispose__107176;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PSIDatabase_groupsForSearchIndexCategories_searchResultTypes_dateFilter___block_invoke;
  v14[3] = &unk_1E58743C0;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  uint64_t v17 = &v19;
  id v11 = v9;
  id v16 = v11;
  unint64_t v18 = a4;
  [(PSIDatabase *)self _inqSync:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __75__PSIDatabase_groupsForSearchIndexCategories_searchResultTypes_dateFilter___block_invoke(uint64_t a1)
{
  char v2 = (const void *)[*(id *)(a1 + 32) _inqNewGroupIdsWithCategories:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _inqGroupsWithMatchingGroupIds:v2 dateFilter:*(void *)(a1 + 48) includeObjects:1 searchResultTypes:*(void *)(a1 + 64) matchingPredicateBlock:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  CFRelease(v2);
}

- (__CFSet)groupIdsWithCategories:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PSIDatabase_groupIdsWithCategories___block_invoke;
  v8[3] = &unk_1E5875340;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PSIDatabase *)self _inqSync:v8];
  int v6 = (__CFSet *)CFAutorelease((CFTypeRef)v12[3]);

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __38__PSIDatabase_groupIdsWithCategories___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqNewGroupIdsWithCategories:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (__CFArray)mostRecentSortedAssetIdsWithLimit:(unint64_t)a3
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  int v6 = Mutable;
  if (a3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke;
    v8[3] = &unk_1E5873C08;
    v8[6] = a3;
    v8[7] = Mutable;
    void v8[4] = self;
    void v8[5] = &v9;
    [(PSIDatabase *)self _inqSync:v8];
    int v6 = (__CFArray *)v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

void __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), @"selectAssetIdsDateSortedDescWithLimit");
  if (sqlite3_bind_int64(Value, 1, *(void *)(a1 + 48)) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v7 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke_639;
  v5[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v5[4] = *(void *)(a1 + 56);
  [v3 _inqExecutePreparedStatement:Value withStatementBlock:v5];
  CFArrayRef v4 = *(const __CFArray **)(a1 + 56);
  v9.NSUInteger length = CFArrayGetCount(v4);
  v9.NSUInteger location = 0;
  CFArraySortValues(v4, v9, (CFComparatorFunction)PSIRowIDCompare_107184, 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFArrayCreateCopy(0, *(CFArrayRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke_639(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayRef v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

- (void)collectionIdsFromUUIDs:(id)a3 completion:(id)a4
{
}

- (void)assetIdsFromUUIDs:(id)a3 completion:(id)a4
{
}

- (id)_inqCollectionUUIDsForGroupID:(unint64_t)a3
{
  CFArrayRef v4 = [(PSIDatabase *)self _inqNewCollectionIdsForGroupId:a3 dateFilter:0];
  id v5 = -[PSIDatabase _inqCollectionUUIDsForCollectionIds:range:](self, "_inqCollectionUUIDsForCollectionIds:range:", v4, 0, CFArrayGetCount(v4));
  CFRelease(v4);
  return v5;
}

- (id)_inqAssetUUIDsForGroupID:(unint64_t)a3
{
  CFArrayRef v4 = [(PSIDatabase *)self _inqNewAssetIdsForGroupId:a3 dateFilter:0];
  id v5 = -[PSIDatabase _inqAssetUUIDsForAssetIds:range:creationDateSorted:](self, "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", v4, 0, CFArrayGetCount(v4), 0);
  CFRelease(v4);
  return v5;
}

- (id)fetchAssetUUIDsForDateFilter:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__107175;
  id v15 = __Block_byref_object_dispose__107176;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PSIDatabase_fetchAssetUUIDsForDateFilter___block_invoke;
  v8[3] = &unk_1E5875340;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(PSIDatabase *)self _inqSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__PSIDatabase_fetchAssetUUIDsForDateFilter___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)[*(id *)(a1 + 32) _inqNewAssetIdsWithDateFilter:*(void *)(a1 + 40)];
  CFMutableArrayRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFIndex Count = CFArrayGetCount(v2);
  if (Count)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
      CFSetAddValue(Mutable, ValueAtIndex);
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) _inqAssetUUIDsForAssetIds:Mutable];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  CFRelease(v2);
  CFRelease(Mutable);
}

uint64_t __28__PSIDatabase_countOfAssets__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

- (sqlite3_stmt)prepareEmbeddingStatement:(int64_t)a3 modelTypes:(id)a4 assetUUID:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = @"SELECT type, assetUUID, vector";
  if (a3 != 1) {
    id v10 = 0;
  }
  if (a3) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = @"DELETE";
  }
  if ([v8 count])
  {
    uint64_t v12 = -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", @" FROM embeddings WHERE type IN (");
    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v12 stringByAppendingString:@"?, "];

        ++v13;
        uint64_t v12 = v14;
      }
      while ([v8 count] > v13);
    }
    else
    {
      uint64_t v14 = v12;
    }
    unint64_t v18 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 2);

    id v16 = [v18 stringByAppendingString:@""]);

    if (!v9) {
      goto LABEL_17;
    }
    uint64_t v17 = [v16 stringByAppendingString:@" AND assetUUID = ?"];
    goto LABEL_16;
  }
  id v15 = [(__CFString *)v11 stringByAppendingString:@" FROM embeddings"];
  id v16 = v15;
  if (v9)
  {
    uint64_t v17 = [v15 stringByAppendingString:@" WHERE assetUUID = ?"];
LABEL_16:
    uint64_t v19 = (void *)v17;

    id v16 = v19;
  }
LABEL_17:
  uint64_t v20 = [v16 stringByAppendingString:@";"];

  id v21 = v20;
  id v22 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v21 UTF8String]);
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__PSIDatabase_prepareEmbeddingStatement_modelTypes_assetUUID___block_invoke;
  v27[3] = &unk_1E58736C0;
  v27[5] = &v28;
  v27[6] = v22;
  v27[4] = &v32;
  [v8 enumerateIndexesUsingBlock:v27];
  if (v9)
  {
    int v23 = *((_DWORD *)v29 + 6);
    id v24 = v9;
    int v25 = sqlite3_bind_text(v22, v23, (const char *)[v24 UTF8String], objc_msgSend(v24, "length"), 0);
    *((_DWORD *)v33 + 6) = v25;
    if (v25)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v37 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v22;
}

void __62__PSIDatabase_prepareEmbeddingStatement_modelTypes_assetUUID___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    id v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)fetchEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4 withBatchHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((self->_options & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    unint64_t v13 = @"expect searchable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v11 = [[PSIQuery alloc] initWithEmbeddingModelTypes:v8 assetUUID:v9 delegate:self];
  [(PSIQuery *)v11 runFetchEmbeddingQueryWitBatchHandler:v10];
}

- (void)deleteEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke;
  v10[3] = &unk_1E5873A50;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PSIDatabase *)self _inqAsync:v10];
}

void __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke_2;
  v3[3] = &unk_1E5873A50;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _inqPerformBatch:v3];
}

void __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) prepareEmbeddingStatement:0 modelTypes:*(void *)(a1 + 40) assetUUID:*(void *)(a1 + 48)];
  int v3 = sqlite3_step(v2);
  if (v3 != 101)
  {
    int v4 = v3;
    id v5 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218498;
      id v8 = (__CFString *)v2;
      __int16 v9 = 2080;
      id v10 = v5;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (sqlite3_finalize(v2) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = @"Failed to finalize statement";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Embeddings cleared successfully", (uint8_t *)&v7, 2u);
  }
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke;
  v16[3] = &unk_1E5873600;
  void v16[4] = self;
  id v17 = v10;
  id v19 = v12;
  unint64_t v20 = a4;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(PSIDatabase *)self _inqAsync:v16];
}

void __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58735D8;
  v11[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v12 = v3;
  uint64_t v14 = v4;
  id v13 = *(id *)(a1 + 48);
  [v2 _inqPerformBatch:v11];
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v5, v6, v7, v8, v9);
  }
}

void __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "INSERT INTO embeddings(type, assetUUID, vector) VALUES (?, ?, ?);");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    *(void *)&long long v3 = 134218498;
    long long v25 = v3;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        uint64_t v5 = v2;
        uint64_t v6 = v1;
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        int n = 8 * objc_msgSend(v7, "count", v25);
        uint64_t v8 = (char *)malloc_type_malloc(n, 0x9F5410EFuLL);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          int v12 = 0;
          uint64_t v13 = *(void *)v31;
          do
          {
            uint64_t v14 = 0;
            int v15 = v12;
            id v16 = &v8[8 * v12];
            do
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v30 + 1) + 8 * v14) doubleValue];
              *(void *)&v16[8 * v14++] = v17;
            }
            while (v11 != v14);
            int v12 = v15 + v14;
            uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v44 count:16];
          }
          while (v11);
        }

        uint64_t v1 = v6;
        int v18 = *(_DWORD *)(v6 + 56);
        CFArrayRef v2 = v5;
        int v19 = sqlite3_bind_int(v5, 1, v18);
        unint64_t v20 = MEMORY[0x1E4F14500];
        if (v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v39 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_text(v5, 2, (const char *)[*(id *)(v1 + 48) UTF8String], objc_msgSend(*(id *)(v1 + 48), "length"), 0)&& os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v39 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_blob(v5, 3, v8, n, MEMORY[0x1E4F14838]) && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v39 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        int v21 = sqlite3_step(v5);
        if (v21 != 101)
        {
          int v22 = v21;
          uint64_t v23 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(v1 + 32) + 8));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v25;
            v39 = (__CFString *)v2;
            __int16 v40 = 2080;
            v41 = v23;
            __int16 v42 = 1024;
            int v43 = v22;
            _os_log_error_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", buf, 0x1Cu);
          }
        }
        if (sqlite3_reset(v2) && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v39 = @"Failed to reset statement";
          _os_log_error_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v28);
  }

  if (sqlite3_finalize(v2) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    v39 = @"Failed to finalize statement";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  id v24 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "Embeddings inserted successfully", buf, 2u);
  }
}

- (id)newSuggestionsQueryForQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7
{
  id v12 = a3;
  uint64_t v13 = [[PSIQuery alloc] initWithQueryText:v12 suggestionType:a4 suggestionLimit:a5 resultTypes:a6 delegate:self libraryScope:a7];

  return v13;
}

- (sqlite3)databaseConnection
{
  return self->_inqDatabase;
}

- (void)_runWithMatchingIDs:(id)a3 block:(id)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v7 = (void (**)(void))a4;
  id v8 = a3;
  CFMutableSetRef Mutable = CFSetCreateMutable(v6, 0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__PSIDatabase__runWithMatchingIDs_block___block_invoke;
  v11[3] = &unk_1E58739B0;
  CFMutableSetRef v12 = Mutable;
  uint64_t v10 = Mutable;
  [v8 enumerateIndexesUsingBlock:v11];

  [(PSIIntArray *)self->_matchingIds bindElements:v10];
  v7[2](v7);

  [(PSIIntArray *)self->_matchingIds unbind];
}

uint64_t __41__PSIDatabase__runWithMatchingIDs_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withCancelableStatementBlock:(id)a4
{
}

- (id)_inqCollectionIdsByGroupIdForCollectionIds:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  CFAllocatorRef v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  inqCollectionIdsByGroupIdForCollectionIdsStatement = self->_inqCollectionIdsByGroupIdForCollectionIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PSIDatabase__inqCollectionIdsByGroupIdForCollectionIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:inqCollectionIdsByGroupIdForCollectionIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __58__PSIDatabase__inqCollectionIdsByGroupIdForCollectionIds___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 int64AtColumn:0];
  uint64_t v4 = [v7 int64AtColumn:1];
  id v5 = [NSNumber numberWithUnsignedLongLong:v3];
  CFMutableSetRef Mutable = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!Mutable)
  {
    CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    [*(id *)(a1 + 32) setObject:Mutable forKeyedSubscript:v5];
  }
  [Mutable addObject:v4];
}

- (__CFSet)_inqNewGroupIdsForCollectionIds:(__CFSet *)a3
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  [(PSIIntArray *)self->_matchingIds bindElements:a3];
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupIdsInGCWithCollectionIds");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PSIDatabase__inqNewGroupIdsForCollectionIds___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v8[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  [(PSIIntArray *)self->_matchingIds unbind];
  return Mutable;
}

void __47__PSIDatabase__inqNewGroupIdsForCollectionIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (__CFSet)_inqNewGroupIdsForCollectionId:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGCInv");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PSIDatabase__inqNewGroupIdsForCollectionId___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v8[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  return Mutable;
}

void __46__PSIDatabase__inqNewGroupIdsForCollectionId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (id)_inqAssetIdsByGroupIdForAssetIds:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  CFAllocatorRef v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  inqAssetIdsByGroupIdForAssetIdsStatement = self->_inqAssetIdsByGroupIdForAssetIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PSIDatabase__inqAssetIdsByGroupIdForAssetIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:inqAssetIdsByGroupIdForAssetIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __48__PSIDatabase__inqAssetIdsByGroupIdForAssetIds___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 int64AtColumn:0];
  uint64_t v4 = [v7 int64AtColumn:1];
  id v5 = [NSNumber numberWithUnsignedLongLong:v3];
  CFMutableSetRef Mutable = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!Mutable)
  {
    CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    [*(id *)(a1 + 32) setObject:Mutable forKeyedSubscript:v5];
  }
  [Mutable addObject:v4];
}

- (__CFSet)_inqNewGroupIdsForAssetIds:(__CFSet *)a3
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  [(PSIIntArray *)self->_matchingIds bindElements:a3];
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupIdsInGAWithAssetIds");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PSIDatabase__inqNewGroupIdsForAssetIds___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v8[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  [(PSIIntArray *)self->_matchingIds unbind];
  return Mutable;
}

void __42__PSIDatabase__inqNewGroupIdsForAssetIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (__CFSet)_inqNewGroupIdsForAssetId:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGAInv");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PSIDatabase__inqNewGroupIdsForAssetId___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v8[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  return Mutable;
}

void __41__PSIDatabase__inqNewGroupIdsForAssetId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (__CFArray)_inqNewCollectionIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  if (v6)
  {
    id v8 = [v6 singleDate];

    if (v8)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithSingleDateGC");
      uint64_t v10 = [v6 singleDate];
      int v11 = sqlite3_bind_int64(Value, 1, [v10 int64RepresentationMask]);

      if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      CFMutableSetRef v12 = [v6 singleDate];
      int v13 = sqlite3_bind_int64(Value, 2, [v12 int64Representation]);

      if (v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      uint64_t v14 = [v6 singleDate];
      int v15 = sqlite3_bind_int64(Value, 3, [v14 int64RepresentationMask]);

      if (v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      id v16 = [v6 singleDate];
      int v17 = sqlite3_bind_int64(Value, 4, [v16 int64Representation]);

      if (v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = @"Failed to bind parameter";
        int v18 = MEMORY[0x1E4F14500];
LABEL_57:
        _os_log_error_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v20 = [v6 startDate];

      if (v20)
      {
        int v21 = [v6 endDate];

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v21)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartEndDatesGC");
          uint64_t v23 = [v6 startDate];
          int v24 = sqlite3_bind_int64(Value, 1, [v23 int64RepresentationMask]);

          if (v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          long long v25 = [v6 startDate];
          int v26 = sqlite3_bind_int64(Value, 2, [v25 int64Representation]);

          if (v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v27 = [v6 endDate];
          int v28 = sqlite3_bind_int64(Value, 3, [v27 int64RepresentationMask]);

          if (v28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          int v29 = [v6 endDate];
          int v30 = sqlite3_bind_int64(Value, 4, [v29 int64Representation]);

          if (v30 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            int v18 = MEMORY[0x1E4F14500];
            goto LABEL_57;
          }
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartDateGC");
          long long v35 = [v6 startDate];
          int v36 = sqlite3_bind_int64(Value, 1, [v35 int64RepresentationMask]);

          if (v36 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          long long v37 = [v6 startDate];
          int v38 = sqlite3_bind_int64(Value, 2, [v37 int64Representation]);

          if (v38 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = @"Failed to bind parameter";
            int v18 = MEMORY[0x1E4F14500];
            goto LABEL_57;
          }
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithEndDateGC");
        long long v31 = [v6 endDate];
        int v32 = sqlite3_bind_int64(Value, 1, [v31 int64RepresentationMask]);

        if (v32 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v41 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        long long v33 = [v6 endDate];
        int v34 = sqlite3_bind_int64(Value, 2, [v33 int64Representation]);

        if (v34 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v41 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v41 = @"Failed to bind parameter";
          int v18 = MEMORY[0x1E4F14500];
          goto LABEL_57;
        }
      }
    }
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGC");
    if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v41 = @"Failed to bind parameter";
      int v18 = MEMORY[0x1E4F14500];
      goto LABEL_57;
    }
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __57__PSIDatabase__inqNewCollectionIdsForGroupId_dateFilter___block_invoke;
  v39[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v39[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v39];

  return Mutable;
}

void __57__PSIDatabase__inqNewCollectionIdsForGroupId_dateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

- (__CFArray)_inqNewCollectionIdsWithDateFilter:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    id v6 = [v4 singleDate];

    if (v6)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithSingleDateCollection");
      id v8 = [v4 singleDate];
      int v9 = sqlite3_bind_int64(Value, 1, [v8 int64RepresentationMask]);

      if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      uint64_t v10 = [v4 singleDate];
      int v11 = sqlite3_bind_int64(Value, 2, [v10 int64Representation]);

      if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      CFMutableSetRef v12 = [v4 singleDate];
      int v13 = sqlite3_bind_int64(Value, 3, [v12 int64RepresentationMask]);

      if (v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      uint64_t v14 = [v4 singleDate];
      int v15 = sqlite3_bind_int64(Value, 4, [v14 int64Representation]);

      if (!v15 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)long long buf = 138412290;
      __int16 v40 = @"Failed to bind parameter";
      int v29 = MEMORY[0x1E4F14500];
    }
    else
    {
      int v18 = [v4 startDate];

      if (v18)
      {
        int v19 = [v4 endDate];

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v19)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartEndDatesCollection");
          int v21 = [v4 startDate];
          int v22 = sqlite3_bind_int64(Value, 1, [v21 int64RepresentationMask]);

          if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            __int16 v40 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v23 = [v4 startDate];
          int v24 = sqlite3_bind_int64(Value, 2, [v23 int64Representation]);

          if (v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            __int16 v40 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          long long v25 = [v4 endDate];
          int v26 = sqlite3_bind_int64(Value, 3, [v25 int64RepresentationMask]);

          if (v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            __int16 v40 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          uint64_t v27 = [v4 endDate];
          int v28 = sqlite3_bind_int64(Value, 4, [v27 int64Representation]);

          if (!v28 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)long long buf = 138412290;
          __int16 v40 = @"Failed to bind parameter";
          int v29 = MEMORY[0x1E4F14500];
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, @"selectWithStartDateCollection");
          int v34 = [v4 startDate];
          int v35 = sqlite3_bind_int64(Value, 1, [v34 int64RepresentationMask]);

          if (v35 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            __int16 v40 = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          int v36 = [v4 startDate];
          int v37 = sqlite3_bind_int64(Value, 2, [v36 int64Representation]);

          if (!v37 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)long long buf = 138412290;
          __int16 v40 = @"Failed to bind parameter";
          int v29 = MEMORY[0x1E4F14500];
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectWithEndDateCollection");
        int v30 = [v4 endDate];
        int v31 = sqlite3_bind_int64(Value, 1, [v30 int64RepresentationMask]);

        if (v31 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          __int16 v40 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        int v32 = [v4 endDate];
        int v33 = sqlite3_bind_int64(Value, 2, [v32 int64Representation]);

        if (!v33 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = @"Failed to bind parameter";
        int v29 = MEMORY[0x1E4F14500];
      }
    }
    _os_log_error_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
LABEL_14:
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__PSIDatabase__inqNewCollectionIdsWithDateFilter___block_invoke;
    v38[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v38[4] = Mutable;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v38];
    goto LABEL_18;
  }
  id v16 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "This should not get called with a nil dateFilter", buf, 2u);
  }

  CFMutableSetRef Mutable = 0;
LABEL_18:

  return Mutable;
}

void __50__PSIDatabase__inqNewCollectionIdsWithDateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  id v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

- (id)_inqNewSynonymTextsByOwningGroupIdWithGroupIds:(__CFSet *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:CFSetGetCount(a3)];
  [(PSIIntArray *)self->_matchingIds bindElements:a3];
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectSynonymInfoWithOwningGroupIds");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PSIDatabase__inqNewSynonymTextsByOwningGroupIdWithGroupIds___block_invoke;
  v9[3] = &unk_1E5873650;
  id v7 = v5;
  id v10 = v7;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v9];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v7;
}

void __62__PSIDatabase__inqNewSynonymTextsByOwningGroupIdWithGroupIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  __int16 v4 = sqlite3_column_int(a2, 0);
  if (PLSearchIndexCategoryIsSynonym(v4))
  {
    sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
    id v8 = (id)objc_msgSend([NSString alloc], "initWithCString:encoding:", sqlite3_column_text(a2, 2), 4);
    id v6 = [NSNumber numberWithUnsignedLongLong:v5];
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = objc_opt_new();
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
    }
    [v7 addObject:v8];
  }
}

- (id)_inqFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 matchingPredicateBlock:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  CFIndex Count = CFSetGetCount(a3);
  if (!Count)
  {
    id v26 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_29;
  }
  int v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
  [(PSIIntArray *)self->_matchingIds bindElements:a3];
  if (v10)
  {
    uint64_t v14 = [v10 startDate];
    if (v14
      && ([v10 endDate],
          int v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchFilenameGroupsForGroupIdsWithStartEndDates");
      int v17 = [v10 startDate];
      int v18 = sqlite3_bind_int64(Value, 1, [v17 int64RepresentationMask]);

      if (v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      int v19 = [v10 startDate];
      int v20 = sqlite3_bind_int64(Value, 2, [v19 int64Representation]);

      if (v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      int v21 = [v10 endDate];
      int v22 = sqlite3_bind_int64(Value, 3, [v21 int64RepresentationMask]);

      if (v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v23 = [v10 endDate];
      int v24 = sqlite3_bind_int64(Value, 4, [v23 int64Representation]);

      if (!v24 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
      long long v25 = MEMORY[0x1E4F14500];
    }
    else
    {
      uint64_t v27 = [v10 startDate];

      if (v27)
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchFilenameGroupsForGroupIdsWithStartDate");
        int v28 = [v10 startDate];
        int v29 = sqlite3_bind_int64(Value, 1, [v28 int64RepresentationMask]);

        if (v29 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
        }
        int v30 = [v10 startDate];
        int v31 = sqlite3_bind_int64(Value, 2, [v30 int64Representation]);

        if (!v31 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
        long long v25 = MEMORY[0x1E4F14500];
      }
      else
      {
        int v38 = [v10 endDate];

        if (v38)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchFilenameGroupsForGroupIdsWithEndDate");
          v39 = [v10 endDate];
          int v40 = sqlite3_bind_int64(Value, 1, [v39 int64RepresentationMask]);

          if (v40 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v41 = [v10 endDate];
          int v42 = sqlite3_bind_int64(Value, 2, [v41 int64Representation]);

          if (!v42 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
          long long v25 = MEMORY[0x1E4F14500];
        }
        else
        {
          Value = [v10 singleDate];

          if (!Value) {
            goto LABEL_26;
          }
          Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchFilenameGroupsForGroupIdsWithSingleDate");
          int v43 = [v10 singleDate];
          int v44 = sqlite3_bind_int64(Value, 1, [v43 int64RepresentationMask]);

          if (v44 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
            _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
          }
          v45 = [v10 singleDate];
          int v46 = sqlite3_bind_int64(Value, 2, [v45 int64Representation]);

          if (!v46 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
          long long v25 = MEMORY[0x1E4F14500];
        }
      }
    }
    _os_log_error_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchFilenameGroupsForGroupIds");
  }
LABEL_26:
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke;
  v61[3] = &unk_1E5873B68;
  id v63 = v11;
  id v32 = v13;
  id v62 = v32;
  int v33 = (void *)MEMORY[0x19F38D650](v61);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__107175;
  v67 = __Block_byref_object_dispose__107176;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke_2;
  v50 = &unk_1E5873B90;
  v51 = self;
  id v52 = v10;
  p_long long buf = &buf;
  unint64_t v56 = a5;
  id v34 = v33;
  id v53 = v34;
  v55 = &v57;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:&v47];
  uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
  if (v35)
  {
    (*((void (**)(id, uint64_t, uint64_t))v34 + 2))(v34, v35, v58[3]);
    CFRelease((CFTypeRef)v58[3]);
  }
  [(PSIIntArray *)self->_matchingIds unbind];
  int v36 = v53;
  id v26 = v32;

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&buf, 8);

LABEL_29:
  return v26;
}

void __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [v7 setAssetIds:a3];
  CFArrayRef v5 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  [v7 setCollectionIds:v5];
  CFRelease(v5);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v7)) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_inqGroupWithFilenameStatement:dateFilter:excludingGroupId:searchResultTypes:", a2, *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "groupId"), *(void *)(a1 + 72));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v4 + 40))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v4 + 40), obj);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  CFArrayRef v5 = (const void *)sqlite3_column_int64(a2, 5);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v5);
}

- (void)_inqUpdateGCTableWithGroupId:(unint64_t)a3 collectionId:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"insertGC");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value allowError:19 withStatementBlock:0];
  id v8 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134349312;
    id v10 = (__CFString *)a4;
    __int16 v11 = 2050;
    unint64_t v12 = a3;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Inserted collectionId %{public}lld in GC table for groupId %{public}lld", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_inqUpdateGATableWithGroupId:(unint64_t)a3 assetId:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"insertGA");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value allowError:19 withStatementBlock:0];
  id v8 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134349312;
    id v10 = (__CFString *)a4;
    __int16 v11 = 2050;
    unint64_t v12 = a3;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Inserted assetId %{public}lld in GA table for groupId %{public}lld", (uint8_t *)&v9, 0x16u);
  }
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 owningGroupId:(unint64_t)a4 contentString:(id)a5 normalizedString:(id)a6 identifier:(id)a7 rankingScore:(double)a8 insertIfNeeded:(BOOL)a9 tokenOutput:(const tokenOutput_t *)a10 shouldUpdateOwningGroupId:(BOOL)a11 shouldUpdateRankingScore:(BOOL)a12
{
  BOOL v12 = a9;
  uint64_t v17 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  double v42 = 0.0;
  uint64_t v43 = 0;
  if (a12)
  {
    sqlite3_int64 insert_rowid = [(PSIDatabase *)self _inqGroupIdForCategory:v17 contentString:v19 identifier:v21 outOwningGroupId:&v43 outScore:&v42];
    if (!insert_rowid) {
      sqlite3_int64 insert_rowid = [(PSIDatabase *)self _inqGroupIdForCategory:v17 identifier:v21 outOwningGroupId:&v43 outScore:&v42];
    }
    BOOL v23 = insert_rowid == 0;
    if (insert_rowid && v42 != a8)
    {
      int v24 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = insert_rowid;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a8;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "Setting ranking score for group id: %llu to score: %f", buf, 0x16u);
      }

      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"updateGroupRankingScore");
      if (sqlite3_bind_double(Value, 1, a8) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 2, insert_rowid) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:0];
      goto LABEL_64;
    }
  }
  else
  {
    if ((unsigned __int16)(v17 - 1203) > 1u) {
      unint64_t v26 = [(PSIDatabase *)self _inqGroupIdForCategory:v17 contentString:v19 identifier:v21 outOwningGroupId:&v43 outScore:&v42];
    }
    else {
      unint64_t v26 = [(PSIDatabase *)self _inqGroupIdForCategory:v17 normalizedString:v20 identifier:v21 outOwningGroupId:&v43 outScore:&v42];
    }
    sqlite3_int64 insert_rowid = v26;
    BOOL v23 = v26 == 0;
  }
  if (v23 || v43 == a4)
  {
    if (v23 && v12)
    {
      int v40 = 0;
      int v29 = _newUTF8String(v19, &v40);
      int v39 = 0;
      int v30 = _newUTF8String(v20, &v39);
      int v38 = 0;
      int v31 = _newUTF8String(v21, &v38);
      var6 = a10->var6;
      if (a10->var8 >= a10->var7) {
        int64_t var7 = a10->var7;
      }
      else {
        int64_t var7 = a10->var8;
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      +[PSIGroup getCompressedRanges:buf fromTokenRanges:var6 count:var7];
      id v34 = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"insertGroup");
      if (sqlite3_bind_int(v34, 1, v17) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 2, a4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 3, v29, v40, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 4, v30, v39, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 5, v31, v38, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_double(v34, 6, a8) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 7, *(sqlite3_int64 *)buf)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 8, *(sqlite3_int64 *)&buf[8])
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        v45 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      [(PSIDatabase *)self _inqExecutePreparedStatement:v34 withStatementBlock:0];
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
      uint64_t v35 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int v44 = 134217984;
        v45 = (__CFString *)insert_rowid;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEBUG, "Inserting groupID: %llu", v44, 0xCu);
      }

      if (v29) {
        free(v29);
      }
      if (v30) {
        free(v30);
      }
      if (v31) {
        free(v31);
      }
    }
  }
  else
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __185__PSIDatabase__inqGroupIdForCategory_owningGroupId_contentString_normalizedString_identifier_rankingScore_insertIfNeeded_tokenOutput_shouldUpdateOwningGroupId_shouldUpdateRankingScore___block_invoke;
    v41[3] = &unk_1E5873B18;
    v41[4] = self;
    uint64_t v27 = MEMORY[0x19F38D650](v41);
    int v28 = (void *)v27;
    if (a11)
    {
      (*(void (**)(uint64_t, sqlite3_int64, unint64_t))(v27 + 16))(v27, insert_rowid, a4);
    }
    else if (v43)
    {
      (*(void (**)(uint64_t, sqlite3_int64, void))(v27 + 16))(v27, insert_rowid, 0);
      int v36 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134349314;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Dropping previous owningGroupId (%{public}llu) for keyword with different owning categories. ContentString: %@", buf, 0x16u);
      }
    }
  }
LABEL_64:

  return insert_rowid;
}

uint64_t __185__PSIDatabase__inqGroupIdForCategory_owningGroupId_contentString_normalizedString_identifier_rankingScore_insertIfNeeded_tokenOutput_shouldUpdateOwningGroupId_shouldUpdateRankingScore___block_invoke(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218240;
    id v10 = (__CFString *)a2;
    __int16 v11 = 2048;
    sqlite3_int64 v12 = a3;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Setting owning group id for group id: %llu, owningGroupID: %llu", (uint8_t *)&v9, 0x16u);
  }

  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), @"updateGroupOwningGroupId");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a2) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqExecutePreparedStatement:Value withStatementBlock:0];
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 identifier:(id)a4 outOwningGroupId:(unint64_t *)a5 outScore:(double *)a6
{
  int v8 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupWithLookupId");
  if (sqlite3_bind_int(Value, 1, v8) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  int v24 = 0;
  sqlite3_int64 v12 = _newUTF8String(v10, &v24);
  if (sqlite3_bind_text(Value, 2, v12, v24, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PSIDatabase__inqGroupIdForCategory_identifier_outOwningGroupId_outScore___block_invoke;
  v15[3] = &unk_1E5873AF0;
  void v15[4] = &buf;
  v15[5] = &v20;
  v15[6] = &v16;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v15];
  if (a5) {
    *a5 = v21[3];
  }
  if (a6) {
    *a6 = v17[3];
  }
  if (v12) {
    free(v12);
  }
  unint64_t v13 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __75__PSIDatabase__inqGroupIdForCategory_identifier_outOwningGroupId_outScore___block_invoke(void *a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(void *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 normalizedString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7
{
  int v10 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupWithNormalizedStr");
  if (sqlite3_bind_int(Value, 1, v10) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  int v29 = 0;
  int v15 = _newUTF8String(v12, &v29);
  if (sqlite3_bind_text(Value, 2, v15, v29, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  int v28 = 0;
  uint64_t v16 = _newUTF8String(v13, &v28);
  if (sqlite3_bind_text(Value, 3, v16, v28, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  id v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__PSIDatabase__inqGroupIdForCategory_normalizedString_identifier_outOwningGroupId_outScore___block_invoke;
  v19[3] = &unk_1E5873AF0;
  v19[4] = &buf;
  v19[5] = &v24;
  v19[6] = &v20;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v19];
  if (a6) {
    *a6 = v25[3];
  }
  if (a7) {
    *a7 = v21[3];
  }
  if (v15) {
    free(v15);
  }
  if (v16) {
    free(v16);
  }
  unint64_t v17 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

void __92__PSIDatabase__inqGroupIdForCategory_normalizedString_identifier_outOwningGroupId_outScore___block_invoke(void *a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(void *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4
{
  int v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"fetchGroupsForTextAndCategory");
  int v12 = 0;
  int v8 = _newUTF8String(v6, &v12);
  if (sqlite3_bind_text(Value, 1, v8, v12, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, v4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PSIDatabase__inqGroupIdForCategory_contentString___block_invoke;
  v11[3] = &unk_1E5873698;
  void v11[4] = &buf;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v11];
  if (v8) {
    free(v8);
  }
  unint64_t v9 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);

  return v9;
}

sqlite3_int64 __52__PSIDatabase__inqGroupIdForCategory_contentString___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inqCollectionIdWithCollection:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFArrayRef v5 = [v4 uuid];
  sqlite3_int64 v34 = 0;
  sqlite3_int64 v35 = 0;
  sqlite3_int64 insert_rowid = [(PSIDatabase *)self _inqCollectionIdForUUID:v5 uuid_0:&v35 uuid_1:&v34];
  if (!insert_rowid)
  {
    id v7 = [v4 keyAssetPrivate];
    int v8 = [v7 uuid];

    unint64_t v9 = [v4 keyAssetShared];
    int v10 = [v9 uuid];

    if (![v8 length] && !objc_msgSend(v10, "length"))
    {
      uint64_t v26 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v29 = [v4 uuid];
        *(_DWORD *)long long buf = 138543362;
        int v37 = v29;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "No key asset for collection UUID: %{public}@", buf, 0xCu);
      }
      sqlite3_int64 insert_rowid = 0;
      goto LABEL_58;
    }
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"insertCollection");
    if (sqlite3_bind_int64(Value, 1, v35) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v34) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    int v12 = [v4 startDate];
    int v13 = sqlite3_bind_int64(Value, 3, [v12 int64Representation]);

    if (v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    uint64_t v14 = [v4 endDate];
    int v15 = sqlite3_bind_int64(Value, 4, [v14 int64Representation]);

    if (v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    uint64_t v32 = [v4 title];
    int v33 = 0;
    uint64_t v16 = [v4 title];
    unint64_t v17 = _newUTF8String(v16, &v33);

    if (sqlite3_bind_text(Value, 5, v17, v33, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    uint64_t v18 = objc_msgSend(v4, "subtitle", v17);
    uint64_t v31 = v18;
    if (v18)
    {
      uint64_t v19 = _newUTF8String(v18, &v33);
      if (!sqlite3_bind_text(Value, 6, v19, v33, 0)) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if (!sqlite3_bind_null(Value, 6)) {
        goto LABEL_25;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
LABEL_25:
    if (sqlite3_bind_int(Value, 7, [v4 type])
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if ([v8 length])
    {
      uint64_t v20 = _newUTF8String(v8, &v33);
      if (!sqlite3_bind_text(Value, 8, v20, v33, 0)) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v20 = 0;
      if (!sqlite3_bind_null(Value, 8)) {
        goto LABEL_34;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
LABEL_34:
    if ([v10 length])
    {
      id v21 = _newUTF8String(v10, &v33);
      if (!sqlite3_bind_text(Value, 9, v21, v33, 0))
      {
LABEL_40:
        if (sqlite3_bind_int(Value, 10, [v4 assetsCountPrivate])
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          int v37 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        uint64_t v22 = v10;
        if (sqlite3_bind_int(Value, 11, [v4 assetsCountShared])
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          int v37 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        uint64_t v23 = [v4 sortDate];
        [v23 timeIntervalSinceReferenceDate];
        double v25 = v24;

        if (sqlite3_bind_double(Value, 12, v25) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          int v37 = @"Failed to bind parameter";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:0];
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
        free(v30);
        int v10 = v22;
        if (v20) {
          free(v20);
        }
        uint64_t v26 = v32;
        if (v21) {
          free(v21);
        }
        if (v19) {
          free(v19);
        }
        uint64_t v27 = PLSearchBackendPSIDatabaseGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138544386;
          int v37 = v5;
          __int16 v38 = 2112;
          uint64_t v39 = v32;
          __int16 v40 = 2114;
          uint64_t v41 = v8;
          __int16 v42 = 2114;
          uint64_t v43 = v22;
          __int16 v44 = 2050;
          sqlite3_int64 v45 = insert_rowid;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Inserted collection with UUID %{public}@, title \"%@\", keyAssetUUIDPrivate %{public}@, keyAssetUUIDShared: %{public}@, at collectionId: %{public}lld", buf, 0x34u);
        }

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      id v21 = 0;
      if (!sqlite3_bind_null(Value, 9)) {
        goto LABEL_40;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v37 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    goto LABEL_40;
  }
LABEL_59:

  return insert_rowid;
}

- (unint64_t)_inqCollectionIdForUUID:(id)a3
{
  return [(PSIDatabase *)self _inqCollectionIdForUUID:a3 uuid_0:0 uuid_1:0];
}

- (unint64_t)_inqCollectionIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a3;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  sqlite3_int64 v14 = 0;
  sqlite3_int64 v15 = 0;
  if (PLStringUUIDComponents(v8, &v15, &v14))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectCollectionForUUID");
    if (sqlite3_bind_int64(Value, 1, v15) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v14) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PSIDatabase__inqCollectionIdForUUID_uuid_0_uuid_1___block_invoke;
    v13[3] = &unk_1E5873698;
    v13[4] = &v16;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v13];
  }
  else
  {
    int v10 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v21 = v8;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Collection has an invalid UUID: %{public}@", buf, 0xCu);
    }
  }
  if (a4) {
    *a4 = v15;
  }
  if (a5) {
    *a5 = v14;
  }
  unint64_t v11 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v11;
}

sqlite3_int64 __53__PSIDatabase__inqCollectionIdForUUID_uuid_0_uuid_1___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inqAssetIdWithAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFArrayRef v5 = [v4 uuid];
  sqlite3_int64 v12 = 0;
  sqlite3_int64 v13 = 0;
  sqlite3_int64 insert_rowid = [(PSIDatabase *)self _inqAssetIdForUUID:v5 uuid_0:&v13 uuid_1:&v12];
  if (!insert_rowid)
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"insertAsset");
    if (sqlite3_bind_int64(Value, 1, v13) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      sqlite3_int64 v15 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v12) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      sqlite3_int64 v15 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    int v8 = [v4 creationDate];
    int v9 = sqlite3_bind_int64(Value, 3, [v8 int64Representation]);

    if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      sqlite3_int64 v15 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:0];
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
    int v10 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543618;
      sqlite3_int64 v15 = v5;
      __int16 v16 = 2050;
      sqlite3_int64 v17 = insert_rowid;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Inserted asset with UUID %{public}@ at assetId: %{public}lld", buf, 0x16u);
    }
  }
  return insert_rowid;
}

- (unint64_t)_inqAssetIdForUUID:(id)a3
{
  return [(PSIDatabase *)self _inqAssetIdForUUID:a3 uuid_0:0 uuid_1:0];
}

- (unint64_t)_inqAssetIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a3;
  uint64_t v16 = 0;
  sqlite3_int64 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  sqlite3_int64 v14 = 0;
  sqlite3_int64 v15 = 0;
  if (PLStringUUIDComponents(v8, &v15, &v14))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectAsset");
    if (sqlite3_bind_int64(Value, 1, v15) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v14) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__PSIDatabase__inqAssetIdForUUID_uuid_0_uuid_1___block_invoke;
    v13[3] = &unk_1E5873698;
    v13[4] = &v16;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v13];
  }
  else
  {
    int v10 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v21 = v8;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Asset has an invalid UUID: %{public}@", buf, 0xCu);
    }
  }
  if (a4) {
    *a4 = v15;
  }
  if (a5) {
    *a5 = v14;
  }
  unint64_t v11 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v11;
}

sqlite3_int64 __48__PSIDatabase__inqAssetIdForUUID_uuid_0_uuid_1___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_inqDeleteGroupsWithGraphCollectionsForPersonUUID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFArrayRef v5 = (__CFString *)a3;
  if (!v5)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PSIDatabase.m", 3245, @"Invalid parameter not satisfying: %@", @"personUUID" object file lineNumber description];
  }
  int v23 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFSetRef v8 = CFSetCreateMutable(v6, 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupsForLookupId");
  int v10 = _newUTF8String(v5, &v23);
  if (sqlite3_bind_text(Value, 1, v10, v23, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    double v25 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke;
  v22[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v22[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v22];
  CFIndex Count = CFSetGetCount(Mutable);
  sqlite3_int64 v12 = PLSearchBackendPSIDatabaseGetLog();
  sqlite3_int64 v13 = v12;
  if (Count < 1)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)long long buf = 138543362;
    double v25 = v5;
    sqlite3_int64 v17 = "Search Indexing: Failed to find groups corresponding to person with UUID: %{public}@. Unable to remove any sta"
          "le groups for rename.";
    uint64_t v18 = v13;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134349314;
    double v25 = (__CFString *)Count;
    __int16 v26 = 2114;
    uint64_t v27 = v5;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Search Indexing: Found %{public}lu groups corresponding to person with UUID: %{public}@", buf, 0x16u);
  }

  [(PSIIntArray *)self->_matchingIds bindElements:Mutable];
  sqlite3_int64 v14 = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupIdsInGCWithGroupIdsStatement");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke_597;
  v21[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v21[4] = v8;
  [(PSIDatabase *)self _inqExecutePreparedStatement:v14 withStatementBlock:v21];
  [(PSIIntArray *)self->_matchingIds unbind];
  CFIndex v15 = CFSetGetCount(v8);
  sqlite3_int64 v13 = PLSearchBackendPSIDatabaseGetLog();
  BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v15 < 1)
  {
    if (!v16) {
      goto LABEL_19;
    }
    *(_DWORD *)long long buf = 138543362;
    double v25 = v5;
    sqlite3_int64 v17 = "Search Indexing: did not find groups in the GC table corresponding to person with UUID: %{public}@";
    uint64_t v18 = v13;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
    _os_log_impl(&dword_19B3C7000, v18, v19, v17, buf, 0xCu);
LABEL_19:

    if (!v10) {
      goto LABEL_21;
    }
LABEL_20:
    free(v10);
    goto LABEL_21;
  }
  if (v16)
  {
    *(_DWORD *)long long buf = 134349314;
    double v25 = (__CFString *)v15;
    __int16 v26 = 2114;
    uint64_t v27 = v5;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Search Indexing: Found %{public}lu groups for person with UUID: %{public}@ to remove in GC table.", buf, 0x16u);
  }

  [(PSIIntArray *)self->_matchingIds bindElements:v8];
  [(PSIDatabase *)self _inqExecutePreparedStatement:CFDictionaryGetValue(self->_inqPreparedStatements, @"deleteGroupsWithIds") withStatementBlock:0];
  [(PSIIntArray *)self->_matchingIds unbind];
  if (v10) {
    goto LABEL_20;
  }
LABEL_21:
  CFRelease(Mutable);
  CFRelease(v8);
}

void __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  id v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

void __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke_597(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const void *)sqlite3_column_int64(a2, 0);
  id v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (void)_inqRemoveUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 isInBatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  if (self->_inqDatabase)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke;
    v15[3] = &unk_1E5873AC8;
    unint64_t v18 = a5;
    void v15[4] = self;
    id v16 = v11;
    SEL v19 = a2;
    id v17 = v12;
    uint64_t v13 = MEMORY[0x19F38D650](v15);
    sqlite3_int64 v14 = (void *)v13;
    if (v6) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else {
      [(PSIDatabase *)self _inqPerformBatch:v13];
    }
  }
}

void __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) _inqCollectionIdForUUID:*(void *)(a1 + 40)];
      if (!v3) {
        return;
      }
    }
    else
    {
      if (v2) {
        return;
      }
      uint64_t v3 = [*(id *)(a1 + 32) _inqAssetIdForUUID:*(void *)(a1 + 40)];
      if (!v3) {
        return;
      }
    }
    id v4 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke_2;
    v8[3] = &unk_1E5875E90;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    void v8[4] = v4;
    void v8[5] = v6;
    v8[6] = v3;
    [v4 _runWithMatchingIDs:v5 block:v8];
    return;
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 32), @"PSIDatabase.m", 3222, @"Group not supported by %s", "-[PSIDatabase _inqRemoveUUID:categories:objectType:isInBatch:]_block_invoke");
}

uint64_t __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = @"deleteGCForSelectedGroupsCategories";
  }
  else {
    uint64_t v2 = @"deleteGAForSelectedGroupsCategories";
  }
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), v2);
  if (sqlite3_bind_int64(Value, 1, *(void *)(a1 + 48)) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    uint64_t v6 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqExecutePreparedStatement:Value withStatementBlock:0];
}

- (void)_inqRemoveUnusedGroups
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Removing unused groups", (uint8_t *)&v10, 2u);
  }

  if (self->_inqDatabase)
  {
    id v4 = [(id)objc_opt_class() searchDatabaseLog];
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    uint64_t v6 = v4;
    uint64_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SearchDatabase - removeUnusedGroups", "", (uint8_t *)&v10, 2u);
    }

    [(PSIDatabase *)self _inqExecutePreparedStatement:CFDictionaryGetValue(self->_inqPreparedStatements, @"deleteUnusedGroupsAndLookups_1") withStatementBlock:0];
    [(PSIDatabase *)self _inqExecutePreparedStatement:CFDictionaryGetValue(self->_inqPreparedStatements, @"deleteUnusedGroupsAndLookups_2") withStatementBlock:0];
    [(PSIDatabase *)self _inqExecutePreparedStatement:CFDictionaryGetValue(self->_inqPreparedStatements, @"deleteUnusedGroupsAndLookups_3") withStatementBlock:0];
    [(PSIDatabase *)self _inqExecutePreparedStatement:CFDictionaryGetValue(self->_inqPreparedStatements, @"deleteUnusedGroupsAndLookups_4") withStatementBlock:0];
    CFSetRef v8 = v7;
    int v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v5, "SearchDatabase - removeUnusedGroups", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    int v9 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446210;
      id v11 = "-[PSIDatabase _inqRemoveUnusedGroups]";
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_inqRemoveUUID:(id)a3 objectType:(unint64_t)a4 isInBatch:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (self->_inqDatabase)
  {
    int v10 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = @"collection";
      if (!a4) {
        id v11 = @"asset";
      }
      *(_DWORD *)long long buf = 138543618;
      int v23 = v11;
      __int16 v24 = 2114;
      id v25 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Removing %{public}@ with UUID: %{public}@", buf, 0x16u);
    }

    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __51__PSIDatabase__inqRemoveUUID_objectType_isInBatch___block_invoke;
    id v17 = &unk_1E5873AA0;
    unint64_t v20 = a4;
    unint64_t v18 = self;
    id v19 = v9;
    SEL v21 = a2;
    uint64_t v12 = MEMORY[0x19F38D650](&v14);
    uint64_t v13 = (void *)v12;
    if (v5) {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
    else {
      -[PSIDatabase _inqPerformBatch:](self, "_inqPerformBatch:", v12, v14, v15, v16, v17, v18);
    }
  }
}

void __51__PSIDatabase__inqRemoveUUID_objectType_isInBatch___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"PSIDatabase.m", 3158, @"Group not supported by %s", "-[PSIDatabase _inqRemoveUUID:objectType:isInBatch:]_block_invoke");
  }
  else
  {
    if (v2 == 1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) _inqCollectionIdForUUID:*(void *)(a1 + 40)];
    }
    else
    {
      if (v2) {
        return;
      }
      uint64_t v3 = [*(id *)(a1 + 32) _inqAssetIdForUUID:*(void *)(a1 + 40)];
    }
    sqlite3_int64 v4 = v3;
    if (v3)
    {
      if (*(void *)(a1 + 48)) {
        BOOL v5 = @"deleteCollection";
      }
      else {
        BOOL v5 = @"deleteAsset";
      }
      Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), v5);
      if (sqlite3_bind_int64(Value, 1, v4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _inqExecutePreparedStatement:Value withStatementBlock:0];
      uint64_t v7 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        if (*(void *)(a1 + 48)) {
          CFSetRef v8 = @"collection";
        }
        else {
          CFSetRef v8 = @"asset";
        }
        *(_DWORD *)long long buf = 138543618;
        uint64_t v15 = v8;
        __int16 v16 = 2050;
        sqlite3_int64 v17 = v4;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Deleted %{public}@ with id: %{public}lld", buf, 0x16u);
      }

      if (*(void *)(a1 + 48)) {
        id v9 = @"deleteGC";
      }
      else {
        id v9 = @"deleteGA";
      }
      int v10 = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), v9);
      if (sqlite3_bind_int64(v10, 1, v4) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = @"Failed to bind parameter";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _inqExecutePreparedStatement:v10 withStatementBlock:0];
      id v11 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        if (*(void *)(a1 + 48)) {
          uint64_t v12 = @"collection from GC";
        }
        else {
          uint64_t v12 = @"asset from GA";
        }
        *(_DWORD *)long long buf = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2050;
        sqlite3_int64 v17 = v4;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Deleted %{public}@ table: %{public}lld", buf, 0x16u);
      }
    }
  }
}

- (unint64_t)_inqUpdateGroupForText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningGroupId:(unint64_t)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    uint64_t v12 = [(PSITokenizer *)self->_tokenizer normalizeString:v10];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  if ([v12 length]) {
    [(PSIDatabase *)self _inqGetTokensFromString:v12 category:v7 tokenOutput:v16];
  }
  LOWORD(v15) = PLSearchIndexCategoryIsSynonym((int)v7);
  unint64_t v13 = -[PSIDatabase _inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:](self, "_inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:", v7, a6, v10, v12, v11, 1, 0.0, v16, v15);

  return v13;
}

- (void)_inqGetTokensFromString:(id)a3 category:(signed __int16)a4 tokenOutput:(tokenOutput_t *)a5
{
  if (a4 == 2100) {
    uint64_t v7 = 12;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  [(PSIDatabase *)self _prepareTokenOutput:a5 forIndexing:1];
  [(PSITokenizer *)self->_tokenizer tokenizeString:v8 withOptions:v7 tokenOutput:a5];
}

- (void)_prepareTokenOutput:(tokenOutput_t *)a3 forIndexing:(BOOL)a4
{
  if (a4)
  {
    tokenizerOutputString = self->_tokenizerOutputString;
    if (tokenizerOutputString) {
      uint64_t v7 = tokenizerOutputString;
    }
    else {
      uint64_t v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    }
    id v10 = self->_tokenizerOutputString;
    self->_tokenizerOutputString = v7;

    -[NSMutableString deleteCharactersInRange:](self->_tokenizerOutputString, "deleteCharactersInRange:", 0, [(NSMutableString *)self->_tokenizerOutputString length]);
    a3->var0 = self->_tokenizerOutputString;
    *(_OWORD *)&a3->var1 = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    a3->var5 = 0;
    a3->var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_tokenizerOutputRanges;
  }
  else
  {
    tokenizerOutputTokens = self->_tokenizerOutputTokens;
    if (tokenizerOutputTokens) {
      id v9 = tokenizerOutputTokens;
    }
    else {
      id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v11 = self->_tokenizerOutputTokens;
    self->_tokenizerOutputTokens = v9;

    [(NSMutableArray *)self->_tokenizerOutputTokens removeAllObjects];
    tokenizerOutputNormalizedTokens = self->_tokenizerOutputNormalizedTokens;
    if (tokenizerOutputNormalizedTokens) {
      unint64_t v13 = tokenizerOutputNormalizedTokens;
    }
    else {
      unint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v14 = self->_tokenizerOutputNormalizedTokens;
    self->_tokenizerOutputNormalizedTokens = v13;

    [(NSMutableArray *)self->_tokenizerOutputNormalizedTokens removeAllObjects];
    int8x16_t v15 = *(int8x16_t *)&self->_tokenizerOutputTokens;
    a3->var0 = 0;
    *(int8x16_t *)&a3->var1 = vextq_s8(v15, v15, 8uLL);
    a3->var3 = 0;
    a3->var4 = 0;
    a3->var5 = 0;
    a3->var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_tokenizerOutputRanges;
  }
  *(_OWORD *)&a3->int64_t var7 = xmmword_19BA9A0A0;
}

- (void)_inqRecycleGroups
{
}

- (BOOL)assetExistsWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PSIDatabase_assetExistsWithUUID___block_invoke;
  v7[3] = &unk_1E5875340;
  id v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(PSIDatabase *)self _inqSync:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __35__PSIDatabase_assetExistsWithUUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqAssetIdForUUID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

- (void)_sortedSearchIndexRowIdsFromUUIDs:(id)a3 searchResultType:(unint64_t)a4 completion:(id)a5
{
  char v6 = a4;
  char v9 = ~(_BYTE)a4;
  id v10 = a3;
  id v11 = (void (**)(id, CFMutableArrayRef, id))a5;
  if ((v9 & 3) == 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PSIDatabase.m", 3022, @"Invalid parameter not satisfying: %@", @"!wantsAssetsAndCollections" object file lineNumber description];
  }
  char v12 = v6 & 1;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke;
  v18[3] = &unk_1E58743E8;
  char v22 = v12;
  v18[4] = self;
  id v19 = v10;
  id v20 = v14;
  CFMutableArrayRef v21 = Mutable;
  id v15 = v14;
  id v16 = v10;
  [(PSIDatabase *)self _inqSync:v18];
  v11[2](v11, Mutable, v15);
}

void __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  CFDictionaryRef v3 = *(const __CFDictionary **)(*(void *)(a1 + 32) + 24);
  if (v2) {
    id v4 = @"kSelectAssetIds";
  }
  else {
    id v4 = @"kSelectCollectionIds";
  }
  Value = CFDictionaryGetValue(v3, v4);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke_2;
  v10[3] = &unk_1E5873A78;
  char v13 = v19;
  id v14 = v18;
  id v15 = v17;
  char v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v9 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v16 = v8;
  id v12 = v9;
  [v6 _inqExecutePreparedStatement:Value withStatementBlock:v10];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
}

void __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = sqlite3_column_int64(a2, 2);
  id v4 = (void *)PLStringNewFromUUIDComponents(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  if (v4)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v8 = v4;
      int v5 = [*(id *)(a1 + 32) containsObject:v4];
      id v4 = v8;
      if (v5)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 72), *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
        char v6 = *(void **)(a1 + 40);
        id v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        [v6 setObject:v8 forKeyedSubscript:v7];

        id v4 = v8;
      }
    }
  }
}

- (id)_inqGenerateGroupsInfoDictionaryFromText:(const char *)a3 identifier:(const char *)a4 category:(signed __int16)a5 score:(double)a6 groupId:(unint64_t)a7 includeUUIDs:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = a5;
  v30[8] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [[NSString alloc] initWithCString:a3 encoding:4];
  uint64_t v15 = [[NSString alloc] initWithCString:a4 encoding:4];
  uint64_t v16 = PLDebugStringForSearchIndexCategory((int)v11);
  if (v8)
  {
    uint64_t v17 = [(PSIDatabase *)self _inqAssetUUIDsForGroupID:a7];
    uint64_t v18 = [(PSIDatabase *)self _inqCollectionUUIDsForGroupID:a7];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
  }
  v29[0] = @"text";
  v29[1] = @"lookup_identifier";
  uint64_t v28 = (void *)v14;
  v30[0] = v14;
  v30[1] = v15;
  v29[2] = @"category";
  id v19 = [NSNumber numberWithShort:v11];
  v30[2] = v19;
  v29[3] = @"category_humanReadable";
  id v20 = v16;
  if (!v16)
  {
    id v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[3] = v20;
  v29[4] = @"score";
  CFMutableArrayRef v21 = objc_msgSend(NSNumber, "numberWithDouble:", a6, v15);
  v30[4] = v21;
  v29[5] = @"group_id";
  char v22 = [NSNumber numberWithUnsignedLongLong:a7];
  v30[5] = v22;
  v29[6] = @"assetUUIDs";
  int v23 = v17;
  if (!v17)
  {
    int v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v23;
  v29[7] = @"collectionUUIDs";
  __int16 v24 = v18;
  if (!v18)
  {
    __int16 v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[7] = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
  if (v18)
  {
    if (v17) {
      goto LABEL_12;
    }
  }
  else
  {

    if (v17) {
      goto LABEL_12;
    }
  }

LABEL_12:
  if (!v16) {

  }
  return v25;
}

- (unint64_t)assetCountForLookupIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 containsString:@","])
  {
    int v5 = [[PSIQueryToken alloc] initWithIdentifier:v4 userCategory:0];
    v14[0] = v5;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v7 = [MEMORY[0x1E4F1CAD0] set];
    LOBYTE(v13) = 0;
    id v8 = [(PSIDatabase *)self newQueryWithSearchTextV2:&stru_1EEB2EB80 queryTokens:v6 scopedSearchIdentifiers:v7 searchResultTypes:1 searchSuggestionType:0 useWildcardSearchText:0 enableExactMatchPrioritization:v13 libraryScope:0 suggestionLimit:0];

    char v9 = [v8 runLookupIdentifierQuery];
    id v10 = [v9 assetUUIDs];
    CFIndex Count = [v10 count];
  }
  else
  {
    int v5 = [(PSIDatabase *)self groupForLookupIdentifier:v4 searchResultTypes:1];
    if ([(PSIQueryToken *)v5 assetIds]) {
      CFIndex Count = CFArrayGetCount((CFArrayRef)[(PSIQueryToken *)v5 assetIds]);
    }
    else {
      CFIndex Count = 0;
    }
  }

  return Count;
}

- (id)dumpLookupStringsWithIndexCategories:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke;
  v11[3] = &unk_1E5873A50;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PSIDatabase *)self _inqSync:v11];
  id v8 = [v6 allObjects];
  char v9 = [v8 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  return v9;
}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT lookup_identifier from groups WHERE category IN (?");
    if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
    {
      unint64_t v3 = 1;
      do
      {
        [v2 appendString:@", ?"];
        ++v3;
      }
      while (v3 < [*(id *)(a1 + 32) count]);
    }
    [v2 appendString:@""]);
  }
  else
  {
    int v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SELECT lookup_identifier from groups"];
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = v2;
  id v6 = (sqlite3_stmt *)objc_msgSend(v4, "_inqPrepareStatement:", objc_msgSend(v5, "UTF8String"));
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 1;
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_2;
  v12[3] = &unk_1E58736C0;
  v12[5] = v13;
  v12[6] = v6;
  void v12[4] = &v15;
  [v7 enumerateIndexesUsingBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_541;
  v10[3] = &unk_1E5873650;
  id v8 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v8 _inqExecutePreparedStatement:v6 withStatementBlock:v10];
  int v9 = sqlite3_finalize(v6);
  *((_DWORD *)v16 + 6) = v9;
  if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = @"Failed to finalize statement";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    id v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_541(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (id)objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(a2, 0));
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)dumpGroupsInfoForAssetUUID:(id)a3 indexCategories:(id)a4 includeUUIDs:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (PLStringUUIDComponents(v8, &v26, &v25))
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke;
    int v18 = &unk_1E5873A28;
    id v19 = self;
    uint64_t v22 = v26;
    uint64_t v23 = v25;
    id v20 = v9;
    BOOL v24 = a5;
    id v11 = v10;
    id v21 = v11;
    [(PSIDatabase *)self _inqSync:&v15];
    id v12 = objc_msgSend(v11, "allObjects", v15, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v13 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v28 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Invalid asset UUID %{public}@", buf, 0xCu);
    }

    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  int v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) _inqPrepareStatement:"SELECT rowid FROM assets WHERE uuid_0 = ? AND uuid_1 = ?"];
  sqlite3_bind_int64(v2, 1, *(void *)(a1 + 56));
  sqlite3_bind_int64(v2, 2, *(void *)(a1 + 64));
  id v3 = *(void **)(a1 + 32);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2;
  v49[3] = &unk_1E5873698;
  v49[4] = &v50;
  [v3 _inqExecutePreparedStatement:v2 withStatementBlock:v49];
  sqlite3_finalize(v2);
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  uint64_t v5 = (sqlite3_stmt *)[*(id *)(a1 + 32) _inqPrepareStatement:"SELECT groupid FROM ga WHERE assetid = ?"];
  sqlite3_bind_int64(v5, 1, v51[3]);
  id v6 = *(void **)(a1 + 32);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3;
  v48[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v48[4] = Mutable;
  [v6 _inqExecutePreparedStatement:v5 withStatementBlock:v48];
  sqlite3_finalize(v5);
  [*(id *)(*(void *)(a1 + 32) + 32) bindElements:Mutable];
  id v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v8 = *(void **)(a1 + 40);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_4;
  v46[3] = &unk_1E58739B0;
  id v9 = v7;
  id v47 = v9;
  [v8 enumerateIndexesUsingBlock:v46];
  if ([v9 count])
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE rowid IN matchingIds AND category IN (?");
    for (unint64_t i = 1; i < [v9 count]; ++i)
      [v10 appendString:@", ?"];
    [v10 appendString:@""]);
    id v12 = *(void **)(a1 + 32);
    id v13 = v10;
    int v14 = (sqlite3_stmt *)objc_msgSend(v12, "_inqPrepareStatement:", objc_msgSend(v13, "UTF8String"));
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    int v45 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    int v41 = 1;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_5;
    v37[3] = &unk_1E58736C0;
    v37[5] = &v38;
    v37[6] = v14;
    v37[4] = &v42;
    [v9 enumerateIndexesUsingBlock:v37];
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    int v14 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "SELECT normalized_string, lookup_identifier, category, rowid, score FROM groups WHERE rowid IN matchingIds");
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v16 = *(void **)(a1 + 32);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_528;
  v33[3] = &unk_1E58739D8;
  v33[4] = v16;
  char v36 = *(unsigned char *)(a1 + 72);
  id v34 = *(id *)(a1 + 48);
  id v17 = v15;
  id v35 = v17;
  [v16 _inqExecutePreparedStatement:v14 withStatementBlock:v33];
  sqlite3_finalize(v14);
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2_529;
  v30[3] = &unk_1E5873A00;
  id v31 = *(id *)(a1 + 40);
  id v19 = v18;
  id v32 = v19;
  [v17 enumerateIndexesUsingBlock:v30];
  if ([v19 count])
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE owning_groupid IN matchingIds AND category IN (?");
    for (unint64_t j = 1; j < [v19 count]; ++j)
      [v20 appendString:@", ?"];
    [v20 appendString:@""]);
    uint64_t v22 = *(void **)(a1 + 32);
    id v23 = v20;
    BOOL v24 = (sqlite3_stmt *)objc_msgSend(v22, "_inqPrepareStatement:", objc_msgSend(v23, "UTF8String"));
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    int v45 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    int v41 = 1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3_533;
    v29[3] = &unk_1E58736C0;
    v29[5] = &v38;
    v29[6] = v24;
    v29[4] = &v42;
    [v19 enumerateIndexesUsingBlock:v29];
    uint64_t v25 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_534;
    v26[3] = &unk_1E5873960;
    v26[4] = v25;
    char v28 = *(unsigned char *)(a1 + 72);
    id v27 = *(id *)(a1 + 48);
    [v25 _inqExecutePreparedStatement:v24 withStatementBlock:v26];
    sqlite3_finalize(v24);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
  }
  CFRelease(Mutable);
  [*(id *)(*(void *)(a1 + 32) + 32) unbind];

  _Block_object_dispose(&v50, 8);
}

sqlite3_int64 __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const void *)sqlite3_column_int64(a2, 0);
  id v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

uint64_t __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = PLSearchIndexCategoryIsSynonym(a2);
  if (result)
  {
    uint64_t v5 = PLSearchIndexParentCategoryForCategory(a2);
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:v5];
  }
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    id v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_528(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_text(a2, 1);
  __int16 v6 = sqlite3_column_int(a2, 2);
  sqlite3_int64 v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 56), sqlite3_column_double(a2, 4));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v8];
  [*(id *)(a1 + 48) addIndex:v6];
}

uint64_t __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2_529(uint64_t a1, uint64_t a2)
{
  uint64_t result = PLSearchIndexSynonymCategoryForCategory(a2);
  if (result)
  {
    uint64_t v4 = result;
    if (![*(id *)(a1 + 32) count]
      || (uint64_t result = [*(id *)(a1 + 32) containsIndex:v4], result))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      return [v5 addIndex:v4];
    }
  }
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3_533(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_534(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_text(a2, 1);
  __int16 v6 = sqlite3_column_int(a2, 2);
  sqlite3_int64 v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 48), sqlite3_column_double(a2, 4));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v8];
}

- (id)dumpGroupsInfoWithIndexCategories:(id)a3 includeUUIDs:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke;
  void v13[3] = &unk_1E5873988;
  id v14 = v6;
  id v15 = self;
  BOOL v17 = a4;
  id v8 = v7;
  id v16 = v8;
  id v9 = v6;
  [(PSIDatabase *)self _inqSync:v13];
  id v10 = v16;
  id v11 = v8;

  return v11;
}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE category IN (?");
    if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
    {
      unint64_t v3 = 1;
      do
      {
        [v2 appendString:@", ?"];
        ++v3;
      }
      while (v3 < [*(id *)(a1 + 32) count]);
    }
    [v2 appendString:@""]);
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = (sqlite3_stmt *)objc_msgSend(v4, "_inqPrepareStatement:", objc_msgSend(v5, "UTF8String"));
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    int v14 = 1;
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_2;
    v12[3] = &unk_1E58736C0;
    v12[5] = v13;
    v12[6] = v6;
    void v12[4] = &buf;
    [v7 enumerateIndexesUsingBlock:v12];
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v6 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 40), "_inqPrepareStatement:", "SELECT normalized_string, lookup_identifier, category, rowid, score from groups");
  }
  id v8 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_523;
  v9[3] = &unk_1E5873960;
  void v9[4] = v8;
  char v11 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v8 _inqExecutePreparedStatement:v6 withStatementBlock:v9];
  if (sqlite3_finalize(v6) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"Failed to finalize statement";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_523(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_text(a2, 1);
  __int16 v6 = sqlite3_column_int(a2, 2);
  sqlite3_int64 v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 48), sqlite3_column_double(a2, 4));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v8];
}

- (double)_scoreForUserCategory:(unint64_t)a3
{
  double result = 1.0;
  if (a3 - 1 <= 0x25) {
    return dbl_19BA9EE80[a3 - 1];
  }
  return result;
}

- (id)_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  __int16 v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PSIDatabase__inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __69__PSIDatabase__inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64AtColumn:0];
  uint64_t v5 = [v3 int64AtColumn:1];

  id v8 = [NSNumber numberWithLongLong:v4];
  __int16 v6 = *(void **)(a1 + 32);
  sqlite3_int64 v7 = [NSNumber numberWithLongLong:v5];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (unint64_t)_inqNumberOfCollectionsMatchingGroupWithId:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  [(PSIStatement *)self->_inqNumberOfCollectionsMatchingGroupWithIdStatement bindInt64:a3 atIndex:1];
  inqNumberOfCollectionsMatchingGroupWithIdStatement = self->_inqNumberOfCollectionsMatchingGroupWithIdStatement;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PSIDatabase__inqNumberOfCollectionsMatchingGroupWithId___block_invoke;
  v7[3] = &unk_1E58734C0;
  v7[4] = &v8;
  [(PSIDatabase *)self executeStatement:inqNumberOfCollectionsMatchingGroupWithIdStatement withResultEnumerationBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __58__PSIDatabase__inqNumberOfCollectionsMatchingGroupWithId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64AtColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_inqNumberOfAssetsByGroupIdMatchingGroupsWithIds:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  __int16 v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PSIDatabase__inqNumberOfAssetsByGroupIdMatchingGroupsWithIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __64__PSIDatabase__inqNumberOfAssetsByGroupIdMatchingGroupsWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64AtColumn:0];
  uint64_t v5 = [v3 int64AtColumn:1];

  id v8 = [NSNumber numberWithLongLong:v4];
  __int16 v6 = *(void **)(a1 + 32);
  sqlite3_int64 v7 = [NSNumber numberWithLongLong:v5];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (unint64_t)_inqNumberOfAssetsMatchingGroupWithId:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  [(PSIStatement *)self->_inqNumberOfAssetsMatchingGroupWithIdStatement bindInt64:a3 atIndex:1];
  inqNumberOfAssetsMatchingGroupWithIdStatement = self->_inqNumberOfAssetsMatchingGroupWithIdStatement;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PSIDatabase__inqNumberOfAssetsMatchingGroupWithId___block_invoke;
  v7[3] = &unk_1E58734C0;
  v7[4] = &v8;
  [(PSIDatabase *)self executeStatement:inqNumberOfAssetsMatchingGroupWithIdStatement withResultEnumerationBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __53__PSIDatabase__inqNumberOfAssetsMatchingGroupWithId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64AtColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_processNextKeywordSuggestionsForQuery:(id)a3 groupResults:(id)a4 allowIdentifiers:(BOOL)a5
{
  uint64_t v474 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v229 = v6;
  id v276 = (id)[v6 numberOfNextKeywordSuggestionToProcess];
  if (v276)
  {
    uint64_t v448 = 0;
    v449 = &v448;
    uint64_t v450 = 0x3032000000;
    v451 = __Block_byref_object_copy__107175;
    v452 = __Block_byref_object_dispose__107176;
    id v453 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v444 = 0;
    v445 = &v444;
    uint64_t v446 = 0x2020000000;
    uint64_t v447 = 0;
    uint64_t v440 = 0;
    v441 = &v440;
    uint64_t v442 = 0x2020000000;
    uint64_t v443 = 0;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFMutableSetRef v11 = CFSetCreateMutable(v9, 0, 0);
    CFMutableSetRef v12 = CFSetCreateMutable(v9, 0, 0);
    id v13 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v436 = 0;
    v437 = &v436;
    uint64_t v438 = 0x2020000000;
    char v439 = 0;
    uint64_t v432 = 0;
    v433 = &v432;
    uint64_t v434 = 0x2020000000;
    uint64_t v435 = 0;
    uint64_t v428 = 0;
    v429 = (double *)&v428;
    uint64_t v430 = 0x2020000000;
    CFAbsoluteTime Current = 0.0;
    v220 = v7;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    int v14 = [(id)objc_opt_class() searchDatabaseLog];
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    uint64_t v16 = v14;
    int v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SearchDatabase - processNextKeywordSuggestions - nextKeywordExtract", "", (uint8_t *)&buf, 2u);
    }

    v416[0] = MEMORY[0x1E4F143A8];
    v416[1] = 3221225472;
    v416[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke;
    v416[3] = &unk_1E5873730;
    v423 = &v448;
    v416[4] = self;
    id v417 = v220;
    id v250 = v8;
    id v418 = v250;
    v424 = &v436;
    id v219 = v13;
    id v419 = v219;
    v425 = &v432;
    v426 = &v444;
    v427 = &v440;
    v228 = Mutable;
    v420 = v228;
    v222 = v11;
    v421 = v222;
    v223 = v12;
    v422 = v223;
    [(PSIDatabase *)self _inqSync:v416];
    uint64_t v18 = v17;
    id v19 = v18;
    log = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v20 = os_signpost_enabled(v18);
      id v19 = log;
      if (v20)
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, log, OS_SIGNPOST_INTERVAL_END, v15, "SearchDatabase - processNextKeywordSuggestions - nextKeywordExtract", "", (uint8_t *)&buf, 2u);
        id v19 = log;
      }
    }

    id v21 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent() - v429[3];
      LODWORD(buf) = 134349056;
      *(CFAbsoluteTime *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Next Keyword Extraction. Took %{public}f seconds.", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v23 = [(__CFSet *)v228 count];
    unint64_t v253 = [(__CFSet *)v222 count];
    unint64_t v263 = [(__CFSet *)v223 count];
    unint64_t v24 = [(__CFSet *)v228 count];
    if (v24 <= 0x31 && v263 <= 9)
    {
      [v229 setNextKeywordSuggestions:MEMORY[0x1E4F1CBF0]];
LABEL_287:

      _Block_object_dispose(&v428, 8);
      _Block_object_dispose(&v432, 8);
      _Block_object_dispose(&v436, 8);

      _Block_object_dispose(&v440, 8);
      _Block_object_dispose(&v444, 8);

      _Block_object_dispose(&v448, 8);
      id v7 = v220;
      goto LABEL_288;
    }
    unint64_t v241 = v24;
    CFMutableSetRef v218 = CFSetCreateMutable(v9, 0, 0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v470 = 0x3032000000;
    v471 = __Block_byref_object_copy__107175;
    v472 = __Block_byref_object_dispose__107176;
    id v473 = 0;
    uint64_t v410 = 0;
    v411 = &v410;
    uint64_t v412 = 0x3032000000;
    v413 = __Block_byref_object_copy__107175;
    v414 = __Block_byref_object_dispose__107176;
    id v415 = 0;
    uint64_t v404 = 0;
    v405 = &v404;
    uint64_t v406 = 0x3032000000;
    v407 = __Block_byref_object_copy__107175;
    v408 = __Block_byref_object_dispose__107176;
    id v409 = 0;
    if (v23 | v263)
    {
      v392[0] = MEMORY[0x1E4F143A8];
      v392[1] = 3221225472;
      v392[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_480;
      v392[3] = &unk_1E5873758;
      uint64_t v402 = v23;
      v398 = &v428;
      p_long long buf = &buf;
      v393 = log;
      v394 = self;
      v395 = v228;
      unint64_t v403 = v263;
      v396 = v218;
      v400 = &v410;
      v397 = v223;
      v401 = &v404;
      [(PSIDatabase *)self _inqSync:v392];
    }
    if (v23 == v253)
    {
      id v259 = *(id *)(*((void *)&buf + 1) + 40);
      uint64_t v25 = v218;
    }
    else
    {
      uint64_t v26 = (void *)[(__CFSet *)v218 mutableCopy];
      id v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count"));
      char v28 = *(void **)(*((void *)&buf + 1) + 40);
      v387[0] = MEMORY[0x1E4F143A8];
      v387[1] = 3221225472;
      v387[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_481;
      v387[3] = &unk_1E5873780;
      v388 = v222;
      id v29 = v27;
      id v389 = v29;
      v391 = &v410;
      uint64_t v25 = v26;
      v390 = v25;
      [v28 enumerateKeysAndObjectsUsingBlock:v387];
      id v259 = v29;
    }
    if (![(__CFSet *)v25 count])
    {
      [v229 setNextKeywordSuggestions:MEMORY[0x1E4F1CBF0]];
      goto LABEL_286;
    }
    v212 = v25;
    v386[0] = MEMORY[0x1E4F143A8];
    v386[1] = 3221225472;
    v386[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2;
    v386[3] = &unk_1E58737D0;
    v386[4] = self;
    v208 = (void *)MEMORY[0x19F38D650](v386);
    int v30 = (void *)[(__CFSet *)v222 mutableCopy];
    [v30 unionSet:v223];
    v207 = v30;
    v429[3] = CFAbsoluteTimeGetCurrent();
    os_signpost_id_t v31 = os_signpost_id_generate(log);
    id v32 = log;
    int v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v380 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupArrays", "", v380, 2u);
    }

    *(void *)v380 = 0;
    v381 = v380;
    uint64_t v382 = 0x3032000000;
    v383 = __Block_byref_object_copy__107175;
    v384 = __Block_byref_object_dispose__107176;
    id v385 = 0;
    uint64_t v374 = 0;
    v375 = &v374;
    uint64_t v376 = 0x3032000000;
    v377 = __Block_byref_object_copy__107175;
    v378 = __Block_byref_object_dispose__107176;
    id v379 = 0;
    uint64_t v368 = 0;
    v369 = &v368;
    uint64_t v370 = 0x3032000000;
    v371 = __Block_byref_object_copy__107175;
    v372 = __Block_byref_object_dispose__107176;
    id v373 = 0;
    v362[0] = MEMORY[0x1E4F143A8];
    v362[1] = 3221225472;
    v362[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_484;
    v362[3] = &unk_1E58737F8;
    v365 = v380;
    v362[4] = self;
    v363 = v218;
    v366 = &v374;
    v268 = v212;
    v364 = v268;
    v367 = &v368;
    [(PSIDatabase *)self _inqSync:v362];
    id v34 = v33;
    id v35 = v34;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      LOWORD(v460) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v35, OS_SIGNPOST_INTERVAL_END, v31, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupArrays", "", (uint8_t *)&v460, 2u);
    }

    char v36 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v37 = CFAbsoluteTimeGetCurrent() - v429[3];
      LODWORD(v460) = 134349056;
      *(CFAbsoluteTime *)((char *)&v460 + 4) = v37;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Next Keyword GroupArrays. Took %{public}f seconds.", (uint8_t *)&v460, 0xCu);
    }

    id v38 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v39 = [(id)v449[5] objectForKeyedSubscript:@"SceneWhitelist"];
    v216 = (void *)[v38 initWithArray:v39];

    v209 = [(id)v449[5] objectForKeyedSubscript:@"MePersonUUID"];
    v247 = [MEMORY[0x1E4F1CA60] dictionary];
    v429[3] = CFAbsoluteTimeGetCurrent();
    os_signpost_id_t v40 = os_signpost_id_generate(v35);
    int v41 = v35;
    uint64_t v42 = v41;
    unint64_t v243 = v40 - 1;
    v248 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v43 = os_signpost_enabled(v41);
      uint64_t v42 = v248;
      if (v43)
      {
        LOWORD(v460) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v248, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SearchDatabase - processNextKeywordSuggestions - nextKeywordOverlap", "", (uint8_t *)&v460, 2u);
        uint64_t v42 = v248;
      }
    }
    os_signpost_id_t spid = v40;

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*((id *)v381 + 5), "count"));
    id v245 = (id)objc_claimAutoreleasedReturnValue();
    long long v361 = 0u;
    long long v360 = 0u;
    long long v359 = 0u;
    long long v358 = 0u;
    id obj = *((id *)v381 + 5);
    uint64_t v44 = [obj countByEnumeratingWithState:&v358 objects:v468 count:16];
    if (!v44)
    {
      v217 = 0;
      unint64_t v278 = 0;
      os_log_t v281 = 0;
      goto LABEL_101;
    }
    v217 = 0;
    unint64_t v278 = 0;
    os_log_t v281 = 0;
    double v45 = 1.4 / (double)(unint64_t)v276;
    double v46 = v45 * (double)v253;
    double v47 = v45 * (double)v263;
    uint64_t v48 = *(void *)v359;
LABEL_32:
    uint64_t v49 = 0;
    while (1)
    {
      if (*(void *)v359 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v50 = *(void **)(*((void *)&v358 + 1) + 8 * v49);
      uint64_t v51 = [v50 groupId];
      if (a5) {
        break;
      }
      int v17 = [v50 contentString];
      if ([v17 length]) {
        break;
      }
      uint64_t v53 = v17;
LABEL_53:

LABEL_54:
      if (v44 == ++v49)
      {
        uint64_t v73 = [obj countByEnumeratingWithState:&v358 objects:v468 count:16];
        uint64_t v44 = v73;
        if (!v73)
        {
LABEL_101:

          v74 = v248;
          v75 = v74;
          if (v243 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v74))
          {
            LOWORD(v460) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v75, OS_SIGNPOST_INTERVAL_END, spid, "SearchDatabase - processNextKeywordSuggestions - nextKeywordOverlap", "", (uint8_t *)&v460, 2u);
          }
          obja = v75;

          v76 = PLSearchBackendPSIDatabaseGetLog();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            CFAbsoluteTime v77 = CFAbsoluteTimeGetCurrent() - v429[3];
            LODWORD(v460) = 134349056;
            *(CFAbsoluteTime *)((char *)&v460 + 4) = v77;
            _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_INFO, "Next Keyword Overlap. Took %{public}f seconds.", (uint8_t *)&v460, 0xCu);
          }

          long long v356 = 0u;
          long long v355 = 0u;
          long long v354 = 0u;
          long long v353 = 0u;
          id v78 = v245;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v353 objects:v467 count:16];
          if (v79)
          {
            uint64_t v80 = *(void *)v354;
            do
            {
              for (uint64_t i = 0; i != v79; ++i)
              {
                if (*(void *)v354 != v80) {
                  objc_enumerationMutation(v78);
                }
                v82 = *(void **)(*((void *)&v353 + 1) + 8 * i);
                v83 = NSNumber;
                v84 = [v82 group];
                v85 = objc_msgSend(v83, "numberWithUnsignedLongLong:", objc_msgSend(v84, "groupId"));

                v86 = [v259 objectForKeyedSubscript:v85];
                unint64_t v87 = [v86 count];

                v88 = [(id)v411[5] objectForKeyedSubscript:v85];
                unint64_t v89 = [v88 count];

                if (v281) {
                  double v90 = (double)v87 * 0.4 / (double)(unint64_t)v281 + 0.0;
                }
                else {
                  double v90 = 0.0;
                }
                if (v278) {
                  double v90 = (double)v89 * 0.5 / (double)v278 + v90;
                }
                [v82 score];
                [v82 setScore:v91 + v90 * 0.1];
              }
              uint64_t v79 = [v78 countByEnumeratingWithState:&v353 objects:v467 count:16];
            }
            while (v79);
          }

          v92 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
          v466 = v92;
          v215 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v466 count:1];

          [v78 sortUsingDescriptors:v215];
          v93 = [MEMORY[0x1E4F1CA60] dictionary];
          v349[0] = MEMORY[0x1E4F143A8];
          v349[1] = 3221225472;
          v349[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_499;
          v349[3] = &unk_1E5873848;
          id v206 = v93;
          id v350 = v206;
          id v266 = v259;
          id v351 = v266;
          v352 = &v410;
          v242 = (void (**)(void, void))MEMORY[0x19F38D650](v349);
          os_log_t v249 = [MEMORY[0x1E4F28E60] indexSet];
          v235 = [MEMORY[0x1E4F1CA48] array];
          spida = [MEMORY[0x1E4F1CA60] dictionary];
          v429[3] = CFAbsoluteTimeGetCurrent();
          os_signpost_id_t v94 = os_signpost_id_generate(v75);
          v95 = obja;
          v96 = v95;
          unint64_t v239 = v94 - 1;
          if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
          {
            LOWORD(v460) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v94, "SearchDatabase - processNextKeywordSuggestions - nextKeywordIntersections", "", (uint8_t *)&v460, 2u);
          }
          os_signpost_id_t v231 = v94;
          v233 = v96;

          v258 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v348 = 0u;
          long long v347 = 0u;
          long long v346 = 0u;
          long long v345 = 0u;
          id v97 = v78;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v345 objects:v465 count:16];
          v279 = v97;
          if (v98)
          {
            uint64_t v99 = *(void *)v346;
            do
            {
              os_log_t v282 = (os_log_t)v98;
              for (os_log_t j = 0; j != v282; os_log_t j = (os_log_t)((char *)j + 1))
              {
                if (*(void *)v346 != v99) {
                  objc_enumerationMutation(v97);
                }
                v101 = *(void **)(*((void *)&v345 + 1) + 8 * (void)j);
                v102 = [v101 group];
                int v103 = [v102 category];
                uint64_t v104 = v103;
                uint64_t v105 = PLSearchUserCategoryForCategory(v103);
                if ((v103 & 0xFFFFFFFE) != 0x44C) {
                  goto LABEL_128;
                }
                uint64_t v106 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v102, "groupId"));
                v107 = [v266 objectForKeyedSubscript:v106];

                v108 = [v247 objectForKeyedSubscript:v107];
                LOBYTE(v106) = [v102 isEqual:v108];

                if (v106)
                {
LABEL_128:
                  v109 = [NSNumber numberWithUnsignedInteger:v105];
                  v110 = [v258 objectForKeyedSubscript:v109];
                  if ([v110 count] < (unint64_t)v276)
                  {
                    uint64_t v111 = [v102 groupId];
                    if (([v249 containsIndex:v111] & 1) == 0)
                    {
                      [v249 addIndex:v111];
                      id objb = [v102 contentString];
                      uint64_t v112 = PLSearchUserCategoryForCategory((int)[v102 category]);
                      v269 = PLSearchedCategoriesForUserCategory(v112);
                      if ([objb length])
                      {
                        v113 = [spida objectForKeyedSubscript:objb];
                        id v114 = v113;
                        if (v113)
                        {
                          if (([v113 containsIndexes:v269] & 1) != 0
                            || ((0x7FFFFC10FEuLL >> v105) & 1) == 0
                            && !PLExclusiveCategoriesIsSupersetOfSearchedCategories(v114))
                          {
                            goto LABEL_151;
                          }
                        }
                        else
                        {
                          id v114 = [MEMORY[0x1E4F28E60] indexSet];
                          [spida setObject:v114 forKeyedSubscript:objb];
                        }
                        [v114 addIndexes:v269];
                      }
                      v115 = ((void (**)(void, void *))v242)[2](v242, v102);
                      uint64_t v116 = [v115 count];
                      uint64_t v341 = 0;
                      v342 = &v341;
                      uint64_t v343 = 0x2020000000;
                      char v344 = 1;
                      *(void *)&long long v460 = 0;
                      *((void *)&v460 + 1) = &v460;
                      uint64_t v461 = 0x3032000000;
                      v462 = __Block_byref_object_copy__107175;
                      v463 = __Block_byref_object_dispose__107176;
                      id v464 = 0;
                      uint64_t v335 = 0;
                      v336 = &v335;
                      uint64_t v337 = 0x3032000000;
                      v338 = __Block_byref_object_copy__107175;
                      v339 = __Block_byref_object_dispose__107176;
                      id v340 = &unk_1EEBF0A28;
                      v324[0] = MEMORY[0x1E4F143A8];
                      v324[1] = 3221225472;
                      v324[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_502;
                      v324[3] = &unk_1E5873870;
                      v328 = v242;
                      uint64_t v332 = v104;
                      uint64_t v333 = v105;
                      uint64_t v334 = v116;
                      id v114 = v115;
                      v329 = &v341;
                      v330 = &v460;
                      id v325 = v114;
                      v326 = v101;
                      v331 = &v335;
                      id v327 = v235;
                      [v258 enumerateKeysAndObjectsUsingBlock:v324];
                      if (*((unsigned char *)v342 + 24))
                      {
                        if (*(void *)(*((void *)&v460 + 1) + 40))
                        {
                          [v101 score];
                          double v118 = v117;
                          [*(id *)(*((void *)&v460 + 1) + 40) score];
                          if (v118 >= v119) {
                            double v119 = v118;
                          }
                          [v101 setScore:v119];
                          v120 = [v258 objectForKeyedSubscript:v336[5]];
                          [v120 removeObject:*(void *)(*((void *)&v460 + 1) + 40)];
                        }
                        v121 = [v258 objectForKeyedSubscript:v109];
                        if (!v121)
                        {
                          v121 = [MEMORY[0x1E4F1CA48] array];
                          [v258 setObject:v121 forKeyedSubscript:v109];
                        }
                        if (v105 != 8
                          || (unint64_t)[v121 count] < 2
                          || *(void *)(*((void *)&v460 + 1) + 40))
                        {
                          [v121 addObject:v101];
                        }
                      }
                      _Block_object_dispose(&v335, 8);

                      _Block_object_dispose(&v460, 8);
                      _Block_object_dispose(&v341, 8);
LABEL_151:
                    }
                  }
                }
                id v97 = v279;
              }
              uint64_t v98 = [v279 countByEnumeratingWithState:&v345 objects:v465 count:16];
            }
            while (v98);
          }

          v122 = v233;
          v123 = v122;
          if (v239 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v122))
          {
            LOWORD(v460) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v123, OS_SIGNPOST_INTERVAL_END, v231, "SearchDatabase - processNextKeywordSuggestions - nextKeywordIntersections", "", (uint8_t *)&v460, 2u);
          }

          v124 = PLSearchBackendPSIDatabaseGetLog();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            CFAbsoluteTime v125 = CFAbsoluteTimeGetCurrent() - v429[3];
            LODWORD(v460) = 134349056;
            *(CFAbsoluteTime *)((char *)&v460 + 4) = v125;
            _os_log_impl(&dword_19B3C7000, v124, OS_LOG_TYPE_INFO, "Next Keyword Intersections. Took %{public}f seconds.", (uint8_t *)&v460, 0xCu);
          }

          v429[3] = CFAbsoluteTimeGetCurrent();
          os_signpost_id_t v126 = os_signpost_id_generate(v123);
          v127 = v123;
          v128 = v127;
          v129 = (void *)(v126 - 1);
          if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
          {
            LOWORD(v460) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v128, OS_SIGNPOST_INTERVAL_BEGIN, v126, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDiversity", "", (uint8_t *)&v460, 2u);
          }

          [v279 removeAllObjects];
          v322[0] = MEMORY[0x1E4F143A8];
          v322[1] = 3221225472;
          v322[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_504;
          v322[3] = &unk_1E5873898;
          id v130 = v279;
          id v323 = v130;
          [v258 enumerateKeysAndObjectsUsingBlock:v322];
          v131 = v128;
          v132 = v131;
          v283 = v131;
          if ((unint64_t)v129 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            BOOL v133 = os_signpost_enabled(v131);
            v132 = v283;
            if (v133)
            {
              LOWORD(v460) = 0;
              _os_signpost_emit_with_name_impl(&dword_19B3C7000, v283, OS_SIGNPOST_INTERVAL_END, v126, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDiversity", "", (uint8_t *)&v460, 2u);
              v132 = v283;
            }
          }

          v134 = PLSearchBackendPSIDatabaseGetLog();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
          {
            CFAbsoluteTime v135 = CFAbsoluteTimeGetCurrent() - v429[3];
            LODWORD(v460) = 134349056;
            *(CFAbsoluteTime *)((char *)&v460 + 4) = v135;
            _os_log_impl(&dword_19B3C7000, v134, OS_LOG_TYPE_INFO, "Next Keyword Diversity. Took %{public}f seconds.", (uint8_t *)&v460, 0xCu);
          }

          [v130 sortUsingDescriptors:v215];
          v244 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v276];
          v280 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v276];
          v136 = [v229 socialGroupExtendedAssetIds];
          if ([v136 count])
          {
            BOOL v137 = 1;
          }
          else
          {
            v138 = [v229 socialGroupExtendedCollectionIds];
            BOOL v137 = [v138 count] != 0;
          }
          v317[0] = MEMORY[0x1E4F143A8];
          v317[1] = 3221225472;
          v317[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2_509;
          v317[3] = &unk_1E58738C0;
          BOOL v321 = v137;
          v319 = &buf;
          v139 = &v410;
          id v204 = v229;
          id v318 = v204;
          v320 = &v410;
          v232 = (void (**)(void, void, void))MEMORY[0x19F38D650](v317);
          v316[0] = MEMORY[0x1E4F143A8];
          v316[1] = 3221225472;
          v316[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3_511;
          v316[3] = &unk_1E58738E8;
          v316[4] = &buf;
          v316[5] = &v410;
          v234 = (void (**)(void, void, void))MEMORY[0x19F38D650](v316);
          v240 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v276];
          long long v314 = 0u;
          long long v315 = 0u;
          long long v312 = 0u;
          long long v313 = 0u;
          id v227 = v130;
          uint64_t v140 = [v227 countByEnumeratingWithState:&v312 objects:v459 count:16];
          if (v140)
          {
            uint64_t v141 = *(void *)v313;
            while (2)
            {
              for (uint64_t k = 0; k != v140; ++k)
              {
                if (*(void *)v313 != v141) {
                  objc_enumerationMutation(v227);
                }
                v129 = [*(id *)(*((void *)&v312 + 1) + 8 * k) group];
                v143 = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_505(v129);
                ((void (**)(void, void *, void *))v232)[2](v232, v143, v129);
                if (!v137
                  || [v129 category] != 1300
                  || [v143 assetCount]
                  || [v143 collectionCount])
                {
                  [v240 addObject:v143];
                  [v244 addObject:v129];
                  v144 = [v129 contentString];
                  v145 = v144;
                  if (!v144)
                  {
                    v139 = [v129 lookupIdentifier];
                    v145 = v139;
                  }
                  [v280 addObject:v145];
                  if (!v144) {

                  }
                  if ([v240 count] >= (unint64_t)v276)
                  {

                    goto LABEL_189;
                  }
                }
              }
              uint64_t v140 = [v227 countByEnumeratingWithState:&v312 objects:v459 count:16];
              if (v140) {
                continue;
              }
              break;
            }
          }
LABEL_189:

          v146 = v240;
          if ([v240 count] < (unint64_t)v276)
          {
            long long v310 = 0u;
            long long v311 = 0u;
            long long v308 = 0u;
            long long v309 = 0u;
            id v147 = v235;
            uint64_t v148 = [v147 countByEnumeratingWithState:&v308 objects:v458 count:16];
            if (v148)
            {
              uint64_t v149 = *(void *)v309;
              while (2)
              {
                for (uint64_t m = 0; m != v148; ++m)
                {
                  if (*(void *)v309 != v149) {
                    objc_enumerationMutation(v147);
                  }
                  v151 = *(void **)(*((void *)&v308 + 1) + 8 * m);
                  v152 = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_505(v151);
                  ((void (**)(void, void *, void *))v232)[2](v232, v152, v151);
                  if (!v137
                    || [v151 category] != 1300
                    || [v152 assetCount]
                    || [v152 collectionCount])
                  {
                    [v240 addObject:v152];
                    [v244 addObject:v151];
                    v153 = [v151 contentString];
                    v154 = v153;
                    if (!v153)
                    {
                      v129 = [v151 lookupIdentifier];
                      v154 = v129;
                    }
                    [v280 addObject:v154];
                    if (!v153) {

                    }
                    if ([v240 count] >= (unint64_t)v276)
                    {

                      goto LABEL_208;
                    }
                  }
                }
                uint64_t v148 = [v147 countByEnumeratingWithState:&v308 objects:v458 count:16];
                if (v148) {
                  continue;
                }
                break;
              }
            }
LABEL_208:

            v146 = v240;
          }
          if ([v146 count] < (unint64_t)v276 && v217)
          {
            v155 = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_505(v217);
            ((void (**)(void, void *, void *))v232)[2](v232, v155, v217);
            [v244 addObject:v217];
            v156 = [v217 contentString];
            v157 = v156;
            if (!v156)
            {
              v157 = [v217 lookupIdentifier];
            }
            [v280 addObject:v157];
            if (!v156) {

            }
            [v240 addObject:v155];
          }
          v429[3] = CFAbsoluteTimeGetCurrent();
          os_signpost_id_t v158 = os_signpost_id_generate(v283);
          v159 = v283;
          v160 = v159;
          unint64_t v202 = v158 - 1;
          v211 = v159;
          if (v158 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            BOOL v161 = os_signpost_enabled(v159);
            v160 = v211;
            if (v161)
            {
              LOWORD(v460) = 0;
              _os_signpost_emit_with_name_impl(&dword_19B3C7000, v211, OS_SIGNPOST_INTERVAL_BEGIN, v158, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDeduping", "", (uint8_t *)&v460, 2u);
              v160 = v211;
            }
          }
          os_signpost_id_t v201 = v158;

          long long v306 = 0u;
          long long v307 = 0u;
          long long v304 = 0u;
          long long v305 = 0u;
          id v246 = *((id *)v381 + 5);
          uint64_t v162 = [v246 countByEnumeratingWithState:&v304 objects:v457 count:16];
          if (v162)
          {
            uint64_t v252 = *(void *)v305;
            do
            {
              id objc = 0;
              id v254 = (id)v162;
              do
              {
                if (*(void *)v305 != v252) {
                  objc_enumerationMutation(v246);
                }
                v163 = *(void **)(*((void *)&v304 + 1) + 8 * (void)objc);
                v164 = objc_msgSend(v163, "contentString", v201);
                v165 = v164;
                if (a5 || [v164 length])
                {
                  uint64_t v166 = (int)[v163 category];
                  uint64_t v167 = PLSearchUserCategoryForCategory(v166);
                  if (((0x7FFFFC10FEuLL >> v167) & 1) == 0)
                  {
                    if (v165)
                    {
                      v168 = v165;
                    }
                    else
                    {
                      v169 = [v163 lookupIdentifier];

                      v168 = v169;
                    }
                    os_log_t v284 = v168;
                    if (objc_msgSend(v280, "containsObject:")) {
                      goto LABEL_266;
                    }
                    int IsUserControlled = PLSearchIndexCategoryIsUserControlled(v166);
                    uint64_t v270 = v167;
                    if (IsUserControlled)
                    {
                      long long v302 = 0u;
                      long long v303 = 0u;
                      long long v300 = 0u;
                      long long v301 = 0u;
                      id v277 = v280;
                      uint64_t v171 = [v277 countByEnumeratingWithState:&v300 objects:v456 count:16];
                      if (v171)
                      {
                        uint64_t v172 = *(void *)v301;
                        while (2)
                        {
                          for (uint64_t n = 0; n != v171; ++n)
                          {
                            if (*(void *)v301 != v172) {
                              objc_enumerationMutation(v277);
                            }
                            v174 = *(void **)(*((void *)&v300 + 1) + 8 * n);
                            if ([v284 containsString:v174])
                            {
                              uint64_t v167 = v270;
LABEL_265:
                              v186 = v174;

                              os_log_t v284 = v186;
                              goto LABEL_266;
                            }
                          }
                          uint64_t v171 = [v277 countByEnumeratingWithState:&v300 objects:v456 count:16];
                          if (v171) {
                            continue;
                          }
                          break;
                        }
                      }

                      uint64_t v167 = v270;
                    }
                    long long v298 = 0u;
                    long long v299 = 0u;
                    long long v296 = 0u;
                    long long v297 = 0u;
                    v175 = (void *)v405[5];
                    v176 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v163, "groupId"));
                    id v277 = [v175 objectForKeyedSubscript:v176];

                    uint64_t v177 = [v277 countByEnumeratingWithState:&v296 objects:v455 count:16];
                    if (v177)
                    {
                      char v262 = 0;
                      uint64_t v178 = *(void *)v297;
                      v267 = v163;
                      int v265 = IsUserControlled;
                      v264 = v165;
                      do
                      {
                        for (iuint64_t i = 0; ii != v177; ++ii)
                        {
                          if (*(void *)v297 != v178) {
                            objc_enumerationMutation(v277);
                          }
                          v174 = *(void **)(*((void *)&v296 + 1) + 8 * ii);
                          if (IsUserControlled)
                          {
                            long long v294 = 0u;
                            long long v295 = 0u;
                            long long v292 = 0u;
                            long long v293 = 0u;
                            id v180 = v280;
                            uint64_t v181 = [v180 countByEnumeratingWithState:&v292 objects:v454 count:16];
                            if (v181)
                            {
                              uint64_t v182 = *(void *)v293;
                              while (2)
                              {
                                for (jos_log_t j = 0; jj != v181; ++jj)
                                {
                                  if (*(void *)v293 != v182) {
                                    objc_enumerationMutation(v180);
                                  }
                                  v184 = *(void **)(*((void *)&v292 + 1) + 8 * jj);
                                  if ([v174 containsString:v184])
                                  {
                                    v185 = v184;

                                    v165 = v264;
                                    v163 = v267;
                                    uint64_t v167 = v270;
                                    int IsUserControlled = v265;
                                    char v262 = 1;
                                    os_log_t v284 = v185;
                                    goto LABEL_259;
                                  }
                                }
                                uint64_t v181 = [v180 countByEnumeratingWithState:&v292 objects:v454 count:16];
                                if (v181) {
                                  continue;
                                }
                                break;
                              }
                              v165 = v264;
                              v163 = v267;
                              uint64_t v167 = v270;
                              int IsUserControlled = v265;
                            }
LABEL_259:
                          }
                          else if ([v280 containsObject:*(void *)(*((void *)&v296 + 1) + 8 * ii)])
                          {
                            goto LABEL_265;
                          }
                        }
                        uint64_t v177 = [v277 countByEnumeratingWithState:&v296 objects:v455 count:16];
                      }
                      while (v177);

                      if ((v262 & 1) == 0) {
                        goto LABEL_277;
                      }
LABEL_266:
                      uint64_t v187 = [v280 indexOfObject:v284];
                      v188 = [v244 objectAtIndex:v187];
                      if (v188 != v163)
                      {
                        id v277 = v188;
                        uint64_t v189 = PLSearchUserCategoryForCategory((int)[v188 category]);
                        if (((0x7FFFFC10FEuLL >> v189) & 1) == 0)
                        {
                          v190 = [v240 objectAtIndex:v187];
                          if (v167 == v189 || v189 == 0)
                          {
                            ((void (**)(void, void *, void *))v234)[2](v234, v190, v163);
                          }
                          else
                          {
                            v192 = PLSearchedCategoriesForUserCategory(v167);
                            v193 = PLSearchedCategoriesForUserCategory(v189);
                            v287[0] = MEMORY[0x1E4F143A8];
                            v287[1] = 3221225472;
                            v287[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_512;
                            v287[3] = &unk_1E5873910;
                            id v194 = v193;
                            id v288 = v194;
                            id v289 = v190;
                            v195 = v234;
                            v290 = v163;
                            id v291 = v195;
                            [v192 enumerateRangesUsingBlock:v287];
                          }
                        }
                        goto LABEL_276;
                      }
                    }
                    else
                    {
LABEL_276:
                    }
LABEL_277:
                  }
                }

                id objc = (char *)objc + 1;
              }
              while (objc != v254);
              uint64_t v162 = [v246 countByEnumeratingWithState:&v304 objects:v457 count:16];
            }
            while (v162);
          }

          v196 = v211;
          v197 = v196;
          if (v202 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v196))
          {
            LOWORD(v460) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v197, OS_SIGNPOST_INTERVAL_END, v201, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDeduping", "", (uint8_t *)&v460, 2u);
          }

          v198 = PLSearchBackendPSIDatabaseGetLog();
          if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
          {
            CFAbsoluteTime v199 = CFAbsoluteTimeGetCurrent() - v429[3];
            LODWORD(v460) = 134349056;
            *(CFAbsoluteTime *)((char *)&v460 + 4) = v199;
            _os_log_impl(&dword_19B3C7000, v198, OS_LOG_TYPE_INFO, "Next Keyword Deduping. Took %{public}f seconds.", (uint8_t *)&v460, 0xCu);
          }

          v285[0] = MEMORY[0x1E4F143A8];
          v285[1] = 3221225472;
          v285[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_514;
          v285[3] = &unk_1E5873938;
          v285[4] = self;
          id v200 = v208;
          id v286 = v200;
          [v240 sortWithOptions:16 usingComparator:v285];
          [v204 setNextKeywordSuggestions:v240];

          _Block_object_dispose(&v368, 8);
          _Block_object_dispose(&v374, 8);

          _Block_object_dispose(v380, 8);
          uint64_t v25 = v212;
LABEL_286:

          _Block_object_dispose(&v404, 8);
          _Block_object_dispose(&v410, 8);

          _Block_object_dispose(&buf, 8);
          goto LABEL_287;
        }
        goto LABEL_32;
      }
    }
    char v52 = [v250 containsIndex:v51];
    if (!a5) {

    }
    if ((v52 & 1) != 0 || ![(__CFSet *)v268 containsObject:v51]) {
      goto LABEL_54;
    }
    uint64_t v53 = [NSNumber numberWithUnsignedLongLong:v51];
    v54 = [v259 objectForKeyedSubscript:v53];
    v55 = [(id)v411[5] objectForKeyedSubscript:v53];
    int v56 = [v50 category];
    int v57 = v56;
    if ((unsigned __int16)v56 > 0x577u)
    {
      if ((unsigned __int16)v56 > 0x709u)
      {
        if ((unsigned __int16)v56 == 1802 || (unsigned __int16)v56 == 2100) {
          goto LABEL_52;
        }
      }
      else if ((unsigned __int16)v56 - 1400 < 2 || (unsigned __int16)v56 == 1701)
      {
        goto LABEL_52;
      }
    }
    else if ((unsigned __int16)v56 - 1200 < 5)
    {
      goto LABEL_52;
    }
    if (PLSearchIndexCategoryIsSynonym(v56)) {
      goto LABEL_52;
    }
    if (v57 == 1500)
    {
      uint64_t v260 = [v50 contentString];
      v58 = [(id)v260 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
      v255 = [v58 capitalizedString];

      LOBYTE(v260) = [v216 containsObject:v255];
      if ((v260 & 1) == 0) {
        goto LABEL_52;
      }
      BOOL v261 = 0;
    }
    else
    {
      BOOL v261 = v57 == 1600;
      if (v57 == 11 || (unsigned __int16)v57 == 13) {
        goto LABEL_52;
      }
      if ((unsigned __int16)v57 != 1600)
      {
LABEL_63:
        uint64_t v60 = [(id)v375[5] objectForKeyedSubscript:v53];
        unint64_t v257 = [v60 unsignedIntegerValue];

        id v61 = [(id)v369[5] objectForKeyedSubscript:v53];
        unint64_t v251 = [v61 unsignedIntegerValue];

        if ((unint64_t)v281 <= v257) {
          id v62 = v257;
        }
        else {
          id v62 = v281;
        }
        unint64_t v63 = v278;
        if (v278 <= v251) {
          unint64_t v63 = v251;
        }
        unint64_t v278 = v63;
        os_log_t v281 = v62;
        unint64_t v64 = [v55 count];
        if (v64 >= v441[3]) {
          goto LABEL_52;
        }
        unint64_t v238 = [v54 count];
        if (v238 + v64 >= v441[3] || *((unsigned char *)v437 + 24) && v238 >= v445[3] && (v57 & 0xFFFFFFFE) == 0x44C) {
          goto LABEL_52;
        }
        if (v263 == v64 && (v241 < 0x32 || v253 - v238 < 0x18)) {
          goto LABEL_52;
        }
        if ((v57 & 0xFFFFFFFFFFFFFFFELL) != 0x514
          || ([v50 lookupIdentifier],
              id v224 = (id)objc_claimAutoreleasedReturnValue(),
              int v213 = [v209 isEqualToString:v224],
              v224,
              !v213))
        {
          unsigned int v214 = v57 & 0xFFFFFFFE;
          if (v54 && v214 == 1100)
          {
            os_log_t v210 = [v247 objectForKeyedSubscript:v54];
            id v225 = [v50 contentString];
            unint64_t v205 = [v225 length];
            v203 = [v210 contentString];
            LOBYTE(v205) = v205 > [v203 length];

            if ((v205 & 1) == 0)
            {

              goto LABEL_52;
            }
            [v247 setObject:v50 forKeyedSubscript:v54];
          }
          *(void *)&long long v460 = 0;
          *((void *)&v460 + 1) = &v460;
          uint64_t v461 = 0x2020000000;
          v462 = 0;
          v357[0] = MEMORY[0x1E4F143A8];
          v357[1] = 3221225472;
          v357[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_492;
          v357[3] = &unk_1E5873820;
          v357[4] = &v460;
          v226 = (void (**)(id, unint64_t, unint64_t, unint64_t, double, double))MEMORY[0x19F38D650](v357);
          double v66 = v46;
          v226[2](v226, v257, v253, v238, v46, 0.4);
          v226[2](v226, v251, v263, v64, v47, 0.5);
          double v67 = *(double *)(*((void *)&v460 + 1) + 24) / 0.9;
          *(double *)(*((void *)&v460 + 1) + 24) = v67;
          double v68 = 0.75;
          if (!v261)
          {
            if ((unint64_t)(v57 - 1) > 0xD)
            {
              double v68 = 0.7;
              if (v214 != 1500)
              {
                [(PSIDatabase *)self _scoreForUserCategory:PLSearchUserCategoryForCategory(v57)];
                double v68 = v71;
                double v67 = *(double *)(*((void *)&v460 + 1) + 24);
              }
            }
            else
            {
              unint64_t v70 = v433[3];
              if (v70 <= v57)
              {
                double v68 = 0.2;
              }
              else
              {
                double v68 = 0.25;
                if (v57 != 2)
                {
                  if ((v57 & 0xFFFFFFFB) == 3)
                  {
                    double v68 = 0.45;
                  }
                  else
                  {
                    unint64_t v72 = v70 - 1;
                    if (v70 - 1 >= v57) {
                      unint64_t v72 = v57;
                    }
                    double v68 = (1.0 - (double)(v72 - 1) / (double)(v70 - 2)) * 0.2 + 1.4;
                  }
                }
              }
            }
          }
          uint64_t v69 = [[PSIRankedGroup alloc] initWithGroup:v50 score:v68 * 0.25 + v67 * 0.65];
          [v245 addObject:v69];

          double v46 = v66;
          _Block_object_dispose(&v460, 8);
          goto LABEL_52;
        }
        id v65 = v50;

        v217 = v65;
LABEL_52:

        goto LABEL_53;
      }
    }
    uint64_t v59 = [v50 contentString];
    char v256 = [v219 containsObject:v59];

    if (v256) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }
LABEL_288:
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v38 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) objectForKeyedSubscript:@"BlacklistedMeaningsByMeaning"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v46;
    unint64_t v5 = 14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        char v36 = v7;
        uint64_t v37 = v6;
        id v39 = [v7 groups];
        uint64_t v8 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v40 = *(void *)v42;
          char v10 = 1;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v42 != v40) {
                objc_enumerationMutation(v39);
              }
              CFMutableSetRef v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v12, "groupId"));
              int v13 = [v12 category];
              char v14 = PLSearchIndexGraphOnlyCategoriesContainsCategory(v13);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= v13 == 1102;
              if ((v13 & 0xFFFFFFFE) == 0x578)
              {

                goto LABEL_43;
              }
              char v15 = v14;
              if (v5 > v13 && (unint64_t)(v13 - 1) < 0xE) {
                unint64_t v5 = v13;
              }
              if ((v13 & 0xFFFFFFFE) == 0x640)
              {
                int v17 = [v12 contentString];
                uint64_t v18 = [v38 objectForKeyedSubscript:v17];

                if (v18) {
                  [*(id *)(a1 + 56) addObjectsFromArray:v18];
                }
              }
              uint64_t v19 = [v12 owningGroupId];
              if (v19)
              {
                uint64_t v20 = v19;
                do
                {
                  if ([*(id *)(a1 + 48) containsIndex:v20]) {
                    break;
                  }
                  id v21 = *(void **)(a1 + 32);
                  CFAbsoluteTime v22 = [v12 dateFilter];
                  uint64_t v23 = [v21 _inqGroupWithMatchingGroupId:v20 dateFilter:v22 searchResultTypes:3];

                  uint64_t v20 = [v23 owningGroupId];
                }
                while (v20);
              }
              v10 &= v15;
            }
            uint64_t v9 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        else
        {
          char v10 = 1;
        }

        uint64_t v24 = *(void *)(*(void *)(a1 + 104) + 8);
        if (!v5 || v5 > *(void *)(v24 + 24)) {
          *(void *)(v24 + 24) = v5;
        }
        unint64_t v25 = [v36 assetMatchCount];
        uint64_t v26 = [v36 collectionMatchCount];
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)(*(void *)(a1 + 112) + 8);
        unint64_t v29 = *(void *)(v28 + 24);
        if (v29 <= v25) {
          unint64_t v29 = v25;
        }
        *(void *)(v28 + 24) = v29;
        uint64_t v30 = *(void *)(*(void *)(a1 + 120) + 8);
        unint64_t v31 = *(void *)(v30 + 24);
        if (v31 <= v26 + v25) {
          unint64_t v31 = v26 + v25;
        }
        *(void *)(v30 + 24) = v31;
        objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", objc_msgSend(v36, "assetIds"));
        if (v27) {
          char v32 = v10;
        }
        else {
          char v32 = 0;
        }
        if ((v32 & 1) == 0) {
          objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", objc_msgSend(v36, "assetIds"));
        }
        objc_msgSend(*(id *)(a1 + 80), "addObjectsFromArray:", objc_msgSend(v36, "collectionIds"));
LABEL_43:
        uint64_t v6 = v37 + 1;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v35);
  }
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_480(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 104))
  {
    *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    uint64_t v3 = *(id *)(a1 + 32);
    uint64_t v4 = v3;
    if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForAssetIds", "", buf, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 40) _inqAssetIdsByGroupIdForAssetIds:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) keyEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v10);
    }

    int v13 = *(id *)(a1 + 32);
    char v14 = v13;
    if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v2, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForAssetIds", "", buf, 2u);
    }

    char v15 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)long long buf = 134349056;
      CFAbsoluteTime v45 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Next Keyword GroupIds for AssetIds. Took %{public}f seconds.", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 112))
  {
    *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    os_signpost_id_t v17 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    uint64_t v18 = *(id *)(a1 + 32);
    uint64_t v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForCollectionIds", "", buf, 2u);
    }

    uint64_t v20 = [*(id *)(a1 + 40) _inqCollectionIdsByGroupIdForCollectionIds:*(void *)(a1 + 64)];
    uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
    CFAbsoluteTime v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v23 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "keyEnumerator", 0);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * j), "unsignedIntegerValue"));
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v25);
    }

    uint64_t v28 = *(id *)(a1 + 32);
    unint64_t v29 = v28;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v17, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForCollectionIds", "", buf, 2u);
    }

    uint64_t v30 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v31 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)long long buf = 134349056;
      CFAbsoluteTime v45 = v31;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_INFO, "Next Keyword GroupIds for CollectionIds. Took %{public}f seconds.", buf, 0xCu);
    }
  }
  uint64_t v32 = [*(id *)(a1 + 40) _inqNewSynonymTextsByOwningGroupIdWithGroupIds:*(void *)(a1 + 56)];
  uint64_t v33 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_481(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  CFMutableSetRef MutableCopy = CFSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v5 count], (CFSetRef)v5);
  [(__CFSet *)MutableCopy intersectSet:*(void *)(a1 + 32)];
  if ([(__CFSet *)MutableCopy count])
  {
    [*(id *)(a1 + 40) setObject:MutableCopy forKeyedSubscript:v9];
  }
  else
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v9];
    uint64_t v8 = [v7 count];

    if (!v8) {
      objc_msgSend(*(id *)(a1 + 48), "removeObject:", objc_msgSend(v9, "unsignedIntegerValue"));
    }
  }
}

id __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3;
  v6[3] = &unk_1E58737A8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v3 enumerateIndexesUsingBlock:v6];
  uint64_t v4 = [NSNumber numberWithDouble:v8[3]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_484(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqGroupsWithMatchingGroupIds:*(void *)(a1 + 40) dateFilter:0 includeObjects:0 searchResultTypes:3 matchingPredicateBlock:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) _inqNumberOfAssetsByGroupIdMatchingGroupsWithIds:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) _inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds:*(void *)(a1 + 48)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

double __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_492(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, double result, double a6)
{
  if (a2 && a3)
  {
    double v6 = (double)a4;
    if ((double)a4 <= result) {
      double v7 = v6 / result;
    }
    else {
      double v7 = 1.0 - (v6 - result) / ((double)a3 - result);
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t result = *(double *)(v8 + 24) + v7 * a6;
    *(double *)(v8 + 24) = result;
  }
  return result;
}

id __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_499(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a2, "groupId"));
  CFMutableSetRef Mutable = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!Mutable)
  {
    CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    [Mutable unionSet:v5];

    double v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v3];
    [Mutable unionSet:v6];

    [*(id *)(a1 + 32) setObject:Mutable forKeyedSubscript:v3];
  }

  return Mutable;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_502(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a3;
  uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v37) {
    goto LABEL_43;
  }
  uint64_t v36 = *(void *)v39;
  while (2)
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v39 != v36) {
        objc_enumerationMutation(obj);
      }
      double v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      uint64_t v8 = [v7 group];
      uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      unint64_t v10 = [v9 count];
      int v11 = [v8 category];
      unint64_t v12 = v11;
      uint64_t v13 = *(void *)(a1 + 88);
      unint64_t v14 = v13 - 1;
      unint64_t v15 = v11 - 1;
      BOOL v17 = (unint64_t)(v13 - 1) < 0xE && v15 < 0xE;
      BOOL v18 = 1;
      if (v13 != v11 && !v17)
      {
        uint64_t v19 = *(void *)(a1 + 96);
        BOOL v18 = v19 == PLSearchUserCategoryForCategory(v11);
      }
      unint64_t v20 = *(void *)(a1 + 104);
      if (v10 >= v20) {
        unint64_t v21 = *(void *)(a1 + 104);
      }
      else {
        unint64_t v21 = v10;
      }
      double v22 = (double)v21;
      if (v10 > v20) {
        unint64_t v20 = v10;
      }
      if ((double)v20 * 0.8 <= v22 || v18)
      {
        id v34 = v7;
        uint64_t v24 = (void *)[*(id *)(a1 + 32) mutableCopy];
        [v24 intersectSet:v9];
        if (v22 * 0.8 > (double)(unint64_t)[v24 count])
        {

          goto LABEL_26;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
        unint64_t v25 = *(void *)(a1 + 88);
        BOOL v27 = v25 == 1000 && v12 == 2;
        if (v25 == 2 || v27 || v14 > 0xD || v15 > 0xD)
        {
          if (v27 || !v18)
          {
            uint64_t v28 = a4;
            if (!v27) {
              goto LABEL_42;
            }
          }
          else
          {
            uint64_t v28 = a4;
            if (*(void *)(a1 + 104) <= v10) {
              goto LABEL_42;
            }
          }
        }
        else
        {
          uint64_t v28 = a4;
          if (v25 >= v12 || floor((double)v10 * 0.95) > (double)*(unint64_t *)(a1 + 104)) {
            goto LABEL_42;
          }
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v34);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a2);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_42:
        unint64_t v29 = *(void **)(a1 + 48);
        uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) group];
        [v29 addObject:v30];

        *uint64_t v28 = 1;
        goto LABEL_43;
      }
LABEL_26:
    }
    uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v37) {
      continue;
    }
    break;
  }
LABEL_43:
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_504(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 1.0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (v8 != 1.0)
        {
          [*(id *)(*((void *)&v12 + 1) + 8 * v9) score];
          [v10 setScore:v8 * v11];
        }
        [*(id *)(a1 + 32) addObject:v10];
        double v8 = v8 * 0.8;
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2_509(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "groupId"));
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v7 = [v5 category] == 1300;
  }
  else {
    BOOL v7 = 0;
  }
  double v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v6];
  uint64_t v9 = (void *)[v8 mutableCopy];
  if (v7)
  {
    unint64_t v10 = [*(id *)(a1 + 32) socialGroupExtendedAssetIds];
    [v9 minusSet:v10];
  }
  [v14 setAssetIds:v9];
  double v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v6];
  long long v12 = (void *)[v11 mutableCopy];
  if (v7)
  {
    long long v13 = [*(id *)(a1 + 32) socialGroupExtendedCollectionIds];
    [v12 minusSet:v13];
  }
  [v14 setCollectionIds:v12];
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3_511(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(a3, "groupId"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];
  double v8 = [v6 assetIds];
  [v8 unionSet:v7];

  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v11];
  unint64_t v10 = [v6 collectionIds];

  [v10 unionSet:v9];
}

PSIQueryToken *__84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_505(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 contentString];
  uint64_t v3 = PLSearchUserCategoryForCategory((int)[v1 category]);
  uint64_t v4 = [v2 length];
  id v5 = [PSIQueryToken alloc];
  id v6 = v5;
  if (v4)
  {
    BOOL v7 = [(PSIQueryToken *)v5 initWithText:v2 userCategory:v3 matchType:2];
  }
  else
  {
    double v8 = [v1 lookupIdentifier];
    BOOL v7 = [(PSIQueryToken *)v6 initWithIdentifier:v8 userCategory:v3];
  }
  return v7;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_512(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3);
  if (result)
  {
    [*(id *)(a1 + 40) setUserCategory:0];
    [*(id *)(a1 + 40) setSearchedCategories:0];
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    *a4 = 1;
  }
  return result;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_514(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = NSNumber;
  objc_msgSend(*(id *)(a1 + 32), "_scoreForUserCategory:", objc_msgSend(v5, "userCategory"));
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = NSNumber;
  objc_msgSend(*(id *)(a1 + 32), "_scoreForUserCategory:", objc_msgSend(v6, "userCategory"));
  unint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = v10;
  if (!v10) {
    unint64_t v10 = &unk_1EEBF0A40;
  }
  if (v8) {
    long long v12 = v8;
  }
  else {
    long long v12 = &unk_1EEBF0A40;
  }
  uint64_t v13 = [v10 compare:v12];
  if (!v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    long long v15 = [v6 searchedCategories];
    CFAbsoluteTime v16 = (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    uint64_t v17 = *(void *)(a1 + 40);
    BOOL v18 = [v5 searchedCategories];
    uint64_t v19 = (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
    uint64_t v13 = [v16 compare:v19];
  }
  return v13;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _scoreForUserCategory:PLSearchUserCategoryForCategory(a2)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
  return result;
}

- (id)collectionResultByCollectionIdWithCollectionIds:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__107175;
  long long v15 = __Block_byref_object_dispose__107176;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PSIDatabase_collectionResultByCollectionIdWithCollectionIds___block_invoke;
  v8[3] = &unk_1E5875340;
  unint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PSIDatabase *)self _inqSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __63__PSIDatabase_collectionResultByCollectionIdWithCollectionIds___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqCollectionResultByCollectionIdWithCollectionIds:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_inqCollectionResultByCollectionIdWithCollectionIds:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  collectionResultByCollectionIdWithCollectionIdsStatement = self->_collectionResultByCollectionIdWithCollectionIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PSIDatabase__inqCollectionResultByCollectionIdWithCollectionIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:collectionResultByCollectionIdWithCollectionIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __67__PSIDatabase__inqCollectionResultByCollectionIdWithCollectionIds___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v25 = [v2 int64AtColumn:0];
  uint64_t v3 = [v2 int64AtColumn:1];
  uint64_t v4 = [v2 int64AtColumn:2];
  uint64_t v5 = [v2 int64AtColumn:3];
  uint64_t v24 = [v2 int64AtColumn:4];
  uint64_t v6 = [v2 textAtColumn:5];
  BOOL v7 = (void *)v6;
  id v8 = &stru_1EEB2EB80;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v9 = v8;

  id v27 = [v2 textAtColumn:6];
  uint64_t v10 = [v2 int64AtColumn:7];
  id v11 = [v2 textAtColumn:8];
  long long v12 = [v2 textAtColumn:9];
  uint64_t v13 = [v2 int64AtColumn:10];
  uint64_t v14 = [v2 int64AtColumn:11];
  [v2 doubleAtColumn:12];
  double v16 = v15;

  uint64_t v17 = (void *)PLStringNewFromUUIDComponents(v3, v4);
  BOOL v18 = [[PSIDate alloc] initWithInt64Representation:v5];
  uint64_t v19 = [[PSIDate alloc] initWithInt64Representation:v24];
  unint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v16];
  unint64_t v21 = [[PSICollectionResult alloc] initWithUUID:v17 startDate:v18 endDate:v19 title:v9 subtitle:v27 keyAssetUUIDPrivate:v11 keyAssetUUIDShared:v12 type:v10 assetsCountPrivate:v13 assetsCountShared:v14 sortDate:v20];

  double v22 = *(void **)(a1 + 32);
  uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v25];
  [v22 setObject:v21 forKeyedSubscript:v23];
}

- (id)assetUUIDByAssetIdWithAssetIds:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__107175;
  double v15 = __Block_byref_object_dispose__107176;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PSIDatabase_assetUUIDByAssetIdWithAssetIds___block_invoke;
  v8[3] = &unk_1E5875340;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PSIDatabase *)self _inqSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __46__PSIDatabase_assetUUIDByAssetIdWithAssetIds___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqAssetUUIDByAssetIdWithAssetIds:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_inqAssetUUIDByAssetIdWithAssetIds:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  [(PSIIntArray *)self->_matchingIds bindElements:v5];

  assetUUIDByAssetIdWithAssetIdsStatement = self->_assetUUIDByAssetIdWithAssetIdsStatement;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PSIDatabase__inqAssetUUIDByAssetIdWithAssetIds___block_invoke;
  v10[3] = &unk_1E5873708;
  id v8 = v6;
  id v11 = v8;
  [(PSIDatabase *)self executeStatement:assetUUIDByAssetIdWithAssetIdsStatement withResultEnumerationBlock:v10];
  [(PSIIntArray *)self->_matchingIds unbind];

  return v8;
}

void __50__PSIDatabase__inqAssetUUIDByAssetIdWithAssetIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64AtColumn:0];
  uint64_t v5 = [v3 int64AtColumn:1];
  uint64_t v6 = [v3 int64AtColumn:2];

  id v9 = (id)PLStringNewFromUUIDComponents(v5, v6);
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedLongLong:v4];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (id)_inqGroupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v30 = a4;
  uint64_t v10 = (void (**)(id, unsigned char *, double))a6;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        unint64_t Count = CFSetGetCount(*(CFSetRef *)(*((void *)&v36 + 1) + 8 * i));
        if (Count > v15) {
          unint64_t v15 = Count;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  [(PSIIntArray *)self->_matchingIds prepareForNumberOfElements:v15];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v25 = (void *)MEMORY[0x19F38D3B0]();
        if (v10)
        {
          char v31 = 0;
          v10[2](v10, &v31, 0.5);
          if (v31)
          {
            goto LABEL_23;
          }
        }
        uint64_t v26 = [(PSIDatabase *)self _inqGroupsWithMatchingGroupIds:v24 dateFilter:v30 includeObjects:1 searchResultTypes:a5 matchingPredicateBlock:0];
        [v11 addObject:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  [(PSIIntArray *)self->_matchingIds unprepare];
  id v27 = (void *)[v11 copy];

  return v27;
}

- (double)_inqScoreForGroupID:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectRankingScoreForGroupId");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PSIDatabase__inqScoreForGroupID___block_invoke;
  v8[3] = &unk_1E5873698;
  void v8[4] = &v9;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __35__PSIDatabase__inqScoreForGroupID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_double(a2, 0);
}

- (id)_inqGroupWithFilenameStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 excludingGroupId:(unint64_t)a5 searchResultTypes:(unint64_t)a6
{
  return [(PSIDatabase *)self _inqGroupWithStatement:a3 dateFilter:a4 includeObjects:0 isFilenameStatement:1 excludingGroupId:a5 searchResultTypes:a6];
}

- (__CFSet)_inqNewGroupIdsWithCategories:(id)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v5 = a3;
  CFMutableSetRef Mutable = CFSetCreateMutable(v4, 0, 0);
  CFIndex v7 = [v5 count];
  CFMutableArrayRef v8 = CFArrayCreateMutable(v4, v7, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke;
  v12[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
  void v12[4] = v8;
  [v5 enumerateIndexesUsingBlock:v12];

  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", v8, 0, v7);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupsWithCategories");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke_2;
  v11[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v11[4] = Mutable;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v11];
  [(PSIIntArray *)self->_matchingIds unbind];
  CFRelease(v8);
  return Mutable;
}

void __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke(uint64_t a1, const void *a2)
{
}

void __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFAllocatorRef v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v30 = 0;
  uint64_t v10 = _newUTF8String(v8, &v30);
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  if (v9)
  {
    if (v5) {
      uint64_t v12 = CFSTR("SELECT rowid FROM prefix WHERE normalized_string MATCH ? AND category IN (?");
    }
    else {
      uint64_t v12 = CFSTR("SELECT rowid FROM groups WHERE lookup_identifier = ? AND category IN (?");
    }
    uint64_t v13 = [MEMORY[0x1E4F28E78] stringWithFormat:v12];
    for (unint64_t i = 1; i < [v9 count]; ++i)
      [v13 appendString:@", ?"];
    [v13 appendString:@""]);
    id v15 = v13;
    uint64_t v16 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", [v15 UTF8String]);
    *(void *)&long long v33 = 0;
    *((void *)&v33 + 1) = &v33;
    uint64_t v34 = 0x2020000000;
    int v35 = 2;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_2;
    v24[3] = &unk_1E58736C0;
    v24[5] = &v33;
    v24[6] = v16;
    v24[4] = &v26;
    [v9 enumerateIndexesUsingBlock:v24];
    int v17 = sqlite3_bind_text(v16, 1, v10, v30, 0);
    *((_DWORD *)v27 + 6) = v17;
    if (v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v32 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_469;
    v23[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v23[4] = Mutable;
    [(PSIDatabase *)self _inqExecutePreparedStatement:v16 withStatementBlock:v23];
    int v18 = sqlite3_finalize(v16);
    *((_DWORD *)v27 + 6) = v18;
    if (v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v32 = @"Failed to finalize statement";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (v5) {
      id v19 = @"selectPrefix";
    }
    else {
      id v19 = @"selectLookupGroupId";
    }
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, v19);
    int v21 = sqlite3_bind_text(Value, 1, v10, v30, 0);
    *((_DWORD *)v27 + 6) = v21;
    if (v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v33) = 138412290;
      *(void *)((char *)&v33 + 4) = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v33, 0xCu);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke;
    v25[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v25[4] = Mutable;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v25];
  }
  if (v10) {
    free(v10);
  }
  _Block_object_dispose(&v26, 8);

  return Mutable;
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFAllocatorRef v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    CFAllocatorRef v4 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_469(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFAllocatorRef v4 = *(__CFSet **)(a1 + 32);
  CFSetAddValue(v4, v3);
}

- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 textIsSearchable:(BOOL)a4
{
  return [(PSIDatabase *)self _inqNewGroupIdsMatchingString:a3 categories:0 textIsSearchable:a4];
}

- (id)_inqGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PSIGroupResult alloc] initWithQueue:self->_groupResultsQueue];
  [(PSIGroupResult *)v8 setDelegate:self];
  id v9 = [[PSIGroupResultGroupSnapshot alloc] initWithDateFilter:v6 datedTokens:v7];

  v16[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(PSIGroupResult *)v8 setGroups:v10];

  uint64_t v11 = [(PSIDatabase *)self _inqNewAssetIdsWithDateFilter:v6];
  if (v11)
  {
    uint64_t v12 = v11;
    [(PSIGroupResult *)v8 setAssetIds:v11];
    CFRelease(v12);
  }
  uint64_t v13 = [(PSIDatabase *)self _inqNewCollectionIdsWithDateFilter:v6];
  if (v13)
  {
    uint64_t v14 = v13;
    [(PSIGroupResult *)v8 setCollectionIds:v13];
    CFRelease(v14);
  }

  return v8;
}

- (id)_inqContentStringForGroupId:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__107175;
  uint64_t v13 = __Block_byref_object_dispose__107176;
  id v14 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, @"selectGroupAlt");
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PSIDatabase__inqContentStringForGroupId___block_invoke;
  v8[3] = &unk_1E5873698;
  void v8[4] = &v9;
  [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __43__PSIDatabase__inqContentStringForGroupId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = sqlite3_column_text(a2, 0);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = [[NSString alloc] initWithCString:v3 encoding:4];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)allCollections
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__107175;
  uint64_t v12 = __Block_byref_object_dispose__107176;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PSIDatabase_allCollections__block_invoke;
  v7[3] = &unk_1E5873ED8;
  void v7[5] = &v8;
  v7[6] = Mutable;
  v7[4] = self;
  [(PSIDatabase *)self _inqSync:v7];
  CFRelease(Mutable);
  uint64_t v4 = (void *)v9[5];
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__PSIDatabase_allCollections__block_invoke(uint64_t a1)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), @"selectCollection");
  int v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PSIDatabase_allCollections__block_invoke_2;
  v7[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = *(void *)(a1 + 48);
  [v3 _inqExecutePreparedStatement:Value withStatementBlock:v7];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_inqCollectionResultsForCollectionIds:range:", *(void *)(a1 + 48), 0, CFArrayGetCount(*(CFArrayRef *)(a1 + 48)));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __29__PSIDatabase_allCollections__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = (const void *)sqlite3_column_int64(a2, 0);
  uint64_t v4 = *(__CFArray **)(a1 + 32);
  CFArrayAppendValue(v4, v3);
}

- (id)_inqCollectionResultsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4.length];
    -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectCollectionIn");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PSIDatabase__inqCollectionResultsForCollectionIds_range___block_invoke;
    v15[3] = &unk_1E5873650;
    id v10 = v8;
    id v16 = v10;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v15];
    [(PSIIntArray *)self->_matchingIds unbind];
    unint64_t v11 = [v10 count];
    NSUInteger v12 = length - v11;
    if (length > v11)
    {
      id v13 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134349312;
        NSUInteger v18 = v12;
        __int16 v19 = 2050;
        NSUInteger v20 = length;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Couldn't fetch %{public}lu collections of %{public}lu collectionIds.", buf, 0x16u);
      }
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

void __59__PSIDatabase__inqCollectionResultsForCollectionIds_range___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 1);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 2);
  sqlite3_int64 v6 = sqlite3_column_int64(a2, 3);
  id v7 = sqlite3_column_text(a2, 4);
  uint64_t v8 = sqlite3_column_text(a2, 5);
  int v21 = sqlite3_column_int(a2, 6);
  uint64_t v9 = (unsigned __int8 *)sqlite3_column_text(a2, 7);
  id v10 = sqlite3_column_text(a2, 8);
  int v20 = sqlite3_column_int(a2, 9);
  int v11 = sqlite3_column_int(a2, 10);
  double v12 = sqlite3_column_double(a2, 11);
  id v23 = (id)PLStringNewFromUUIDComponents(v3, v4);
  id v13 = [[PSIDate alloc] initWithInt64Representation:v5];
  id v14 = [[PSIDate alloc] initWithInt64Representation:v6];
  id v15 = (void *)[[NSString alloc] initWithCString:v7 encoding:4];
  if (v8) {
    id v16 = (void *)[[NSString alloc] initWithCString:v8 encoding:4];
  }
  else {
    id v16 = 0;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v12];
  if (v9) {
    uint64_t v9 = (unsigned __int8 *)[[NSString alloc] initWithCString:v9 encoding:4];
  }
  if (v10) {
    NSUInteger v18 = (void *)[[NSString alloc] initWithCString:v10 encoding:4];
  }
  else {
    NSUInteger v18 = 0;
  }
  __int16 v19 = [[PSICollectionResult alloc] initWithUUID:v23 startDate:v13 endDate:v14 title:v15 subtitle:v16 keyAssetUUIDPrivate:v9 keyAssetUUIDShared:v18 type:v21 assetsCountPrivate:v20 assetsCountShared:v11 sortDate:v17];
  [*(id *)(a1 + 32) addObject:v19];
}

- (id)_inqAssetUUIDsForAssetIds:(__CFSet *)a3
{
  CFIndex Count = CFSetGetCount(a3);
  if (Count)
  {
    sqlite3_int64 v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    [(PSIIntArray *)self->_matchingIds bindElements:a3];
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectAssetIdsIn");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__PSIDatabase__inqAssetUUIDsForAssetIds___block_invoke;
    v10[3] = &unk_1E5873650;
    id v8 = v6;
    id v11 = v8;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v10];
    [(PSIIntArray *)self->_matchingIds unbind];
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

void __41__PSIDatabase__inqAssetUUIDsForAssetIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
  id v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)_inqCollectionUUIDsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4.length];
    -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectCollectionIdsIn");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PSIDatabase__inqCollectionUUIDsForCollectionIds_range___block_invoke;
    void v13[3] = &unk_1E5873650;
    id v14 = v8;
    id v10 = v8;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v13];
    [(PSIIntArray *)self->_matchingIds unbind];
    id v11 = (void *)[v10 copy];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

void __57__PSIDatabase__inqCollectionUUIDsForCollectionIds_range___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
  id v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)_inqOwningContentStringForGroupResult:(id)a3
{
  id v4 = a3;
  sqlite3_int64 v5 = [v4 groups];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 groups];
    id v8 = [v7 lastObject];

    if ((unint64_t)((int)[v8 category] - 1) > 0xD)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = -[PSIDatabase _inqContentStringForGroupId:](self, "_inqContentStringForGroupId:", [v8 owningGroupId]);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)newQueryWithSearchText:(id)a3 queryTokens:(id)a4 useWildcardSearchText:(BOOL)a5 libraryScope:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ((self->_options & 1) != 0
    || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
    && (int v14 = 138412290,
        id v15 = @"expect searchable",
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu),
        (self->_options & 1) != 0))
  {
    double v12 = [[PSIQuery alloc] initWithQueryTokens:v11 searchText:v10 useWildcardText:v7 delegate:self libraryScope:a6];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)allAssetUUIDsForGroupsWithCategories:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (LODWORD(buf) = 138412290,
         *(void *)((char *)&buf + 4) = @"expect writable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x3032000000;
    double v12 = __Block_byref_object_copy__107175;
    id v13 = __Block_byref_object_dispose__107176;
    id v14 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PSIDatabase_allAssetUUIDsForGroupsWithCategories___block_invoke;
    v7[3] = &unk_1E5875340;
    v7[4] = self;
    id v8 = v4;
    p_long long buf = &buf;
    [(PSIDatabase *)self _inqSync:v7];
    id v5 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

void __52__PSIDatabase_allAssetUUIDsForGroupsWithCategories___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _inqNewGroupIdsWithCategories:*(void *)(a1 + 40)];
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_inqNewAssetIdsForGroupId:dateFilter:", *(void *)(*((void *)&v13 + 1) + 8 * v8), 0, (void)v13);
        [(__CFSet *)Mutable addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [*(id *)(a1 + 32) _inqAssetUUIDsForAssetIds:Mutable];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)allCollectionUUIDsWithCollectionType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)long long buf = 138412290,
         long long v13 = @"expect writable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"listCollections");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PSIDatabase_allCollectionUUIDsWithCollectionType___block_invoke;
    v9[3] = &unk_1E5873628;
    unint64_t v11 = a3;
    id v7 = v5;
    id v10 = v7;
    [(PSIDatabase *)self _inqExecutePreparedStatement:Value withStatementBlock:v9];
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

void __52__PSIDatabase_allCollectionUUIDsWithCollectionType___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  if (*(void *)(a1 + 40) == sqlite3_column_int(a2, 2))
  {
    sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
    sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
    id v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (void)deleteGroupsWithGraphCollectionsForPersonUUIDs:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(void))a4;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)long long buf = 138412290,
         uint64_t v14 = @"expect writable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid
    && [(__CFString *)v6 count])
  {
    uint64_t v8 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Search Indexing: Deleting groups with Knowledge Graph collections for renamed persons with UUIDs: %{public}@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke;
    v10[3] = &unk_1E5874868;
    void v10[4] = self;
    unint64_t v11 = v6;
    double v12 = v7;
    [(PSIDatabase *)self _inqAsync:v10];
  }
  else
  {
    uint64_t v9 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Search Indexing: Unable to delete groups with Knowledge Graph collections for renamed persons with UUIDs: %{public}@", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

void __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke_2;
  v8[3] = &unk_1E5875E18;
  void v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  [v2 _inqPerformBatch:v8];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v3, v4, v5, v6);
  }
}

void __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() searchDatabaseLog];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  uint64_t v4 = v2;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SearchDatabase - deleteGroupsForPersonRename", "", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 32), "_inqDeleteGroupsWithGraphCollectionsForPersonUUID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  unint64_t v11 = v5;
  double v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v3, "SearchDatabase - deleteGroupsForPersonRename", "", buf, 2u);
  }
}

- (void)removeUnusedGroups
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__PSIDatabase_removeUnusedGroups__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PSIDatabase *)self _inqSync:v2];
}

uint64_t __33__PSIDatabase_removeUnusedGroups__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__PSIDatabase_removeUnusedGroups__block_invoke_2;
  v3[3] = &unk_1E5875CE0;
  v3[4] = v1;
  return [v1 _inqPerformBatch:v3];
}

uint64_t __33__PSIDatabase_removeUnusedGroups__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqRemoveUnusedGroups];
}

- (void)_removeUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  double v12 = (void (**)(void))a6;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)long long buf = 138412290,
         uint64_t v19 = @"expect writable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke;
    void v13[3] = &unk_1E5873600;
    void v13[4] = self;
    id v14 = v10;
    id v15 = v11;
    unint64_t v17 = a5;
    long long v16 = v12;
    [(PSIDatabase *)self _inqAsync:v13];
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke_2;
  v11[3] = &unk_1E58735D8;
  void v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v13 = v3;
  uint64_t v14 = v4;
  [v2 _inqPerformBatch:v11];
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v5, v6, v7, v8, v9);
  }
}

uint64_t __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqRemoveUUID:*(void *)(a1 + 40) categories:*(void *)(a1 + 48) objectType:*(void *)(a1 + 56) isInBatch:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _inqRemoveUnusedGroups];
}

- (void)removeCategories:(id)a3 forAssetUUID:(id)a4 completion:(id)a5
{
}

- (void)_removeUUIDs:(id)a3 objectType:(unint64_t)a4 deferRemovingUnusedGroups:(BOOL)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  uint64_t v12 = [v10 count];
  if ((self->_options & 2) != 0 && self->_databaseIsValid && v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke;
    void v13[3] = &unk_1E58735B0;
    void v13[4] = self;
    id v15 = v11;
    id v14 = v10;
    unint64_t v16 = a4;
    BOOL v17 = a5;
    [(PSIDatabase *)self _inqAsync:v13];
  }
  else if (v11)
  {
    v11[2](v11);
  }
}

void __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke_441;
    v11[3] = &unk_1E5873588;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v12 = v3;
    uint64_t v13 = v4;
    uint64_t v14 = *(void *)(a1 + 56);
    char v15 = *(unsigned char *)(a1 + 64);
    [v2 _inqPerformBatch:v11];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7);
    }
  }
  else
  {
    uint64_t v9 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      BOOL v17 = "-[PSIDatabase _removeUUIDs:objectType:deferRemovingUnusedGroups:completion:]_block_invoke";
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
}

void __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke_441(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_inqRemoveUUID:objectType:isInBatch:", *(void *)(*((void *)&v7 + 1) + 8 * i), *(void *)(a1 + 48), 1, (void)v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 40) _inqRemoveUnusedGroups];
  }
}

- (void)removeCollectionsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5
{
}

- (void)removeCollectionsWithUUIDs:(id)a3 completion:(id)a4
{
}

- (void)removeCollectionWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PSIDatabase removeCollectionsWithUUIDs:completion:](self, "removeCollectionsWithUUIDs:completion:", v9, v7, v10, v11);
}

- (void)removeAssetsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5
{
}

- (void)removeAssetsWithUUIDs:(id)a3 completion:(id)a4
{
}

- (void)removeAssetWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PSIDatabase removeAssetsWithUUIDs:completion:](self, "removeAssetsWithUUIDs:completion:", v9, v7, v10, v11);
}

- (void)addCollections:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  long long v9 = (void (**)(void))a5;
  id v10 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    BOOL v17 = v8;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Adding collections: %@", buf, 0xCu);
  }

  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    BOOL v17 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  uint64_t v11 = [(__CFString *)v8 count];
  if ((self->_options & 2) != 0 && self->_databaseIsValid && v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke;
    v12[3] = &unk_1E5873CA8;
    void v12[4] = self;
    uint64_t v14 = v9;
    uint64_t v13 = v8;
    BOOL v15 = a4;
    [(PSIDatabase *)self _inqAsync:v12];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_439;
    v6[3] = &unk_1E5874318;
    v6[4] = v2;
    id v7 = *(id *)(a1 + 40);
    char v8 = *(unsigned char *)(a1 + 56);
    [v2 _inqPerformBatch:v6];
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    uint64_t v4 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      id v10 = "-[PSIDatabase addCollections:deferRemovingUnusedGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_439(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v51 = [[PSIGroupCache alloc] initWithDelegate:*(void *)(a1 + 32)];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v72 = 0;
  uint64_t v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v54 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v2)
  {
    uint64_t v41 = *(void *)v69;
    *(void *)&long long v3 = 138543362;
    long long v39 = v3;
    do
    {
      uint64_t v48 = 0;
      uint64_t v42 = v2;
      do
      {
        if (*(void *)v69 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v68 + 1) + 8 * v48);
        context = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v5 = [v4 uuid];
        uint64_t v6 = [v4 title];
        uint64_t v47 = [v4 keyAssetPrivate];
        [v4 keyAssetShared];
        v45 = uint64_t v53 = v4;
        uint64_t v43 = v5;
        long long v44 = v6;
        if ([v5 length] && (!objc_msgSend(v6, "length") ? (BOOL v7 = 1) : (BOOL v7 = (v47 | v45) == 0), !v7))
        {
          char v52 = [v4 tokens];
          if (v52 && v6)
          {
            [*(id *)(v54 + 32) _inqRemoveUUID:v5 objectType:1 isInBatch:1];
            uint64_t v10 = [*(id *)(v54 + 32) _inqCollectionIdWithCollection:v4];
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            char v8 = v52;
            uint64_t v11 = [v52 reverseObjectEnumerator];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v79 count:16];
            if (v12)
            {
              uint64_t v13 = 0;
              LOWORD(v14) = 0;
              uint64_t v15 = *(void *)v65;
              id v49 = v11;
              do
              {
                uint64_t v16 = 0;
                unsigned __int16 v17 = v14;
                do
                {
                  if (*(void *)v65 != v15) {
                    objc_enumerationMutation(v49);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v64 + 1) + 8 * v16);
                  uint64_t v19 = objc_msgSend(v18, "text", v39);
                  uint64_t v20 = [v18 identifier];
                  int v14 = [v18 category];
                  int v21 = [v18 owningCategory];
                  if ((unsigned __int16)v21 == v17) {
                    uint64_t v22 = v13;
                  }
                  else {
                    uint64_t v22 = 0;
                  }
                  if (v21) {
                    uint64_t v23 = v22;
                  }
                  else {
                    uint64_t v23 = 0;
                  }
                  uint64_t v13 = [(PSIGroupCache *)v51 idOfGroupWithText:v19 identifier:v20 category:v14 owningGroupId:v23];
                  [*(id *)(v54 + 32) _inqUpdateGCTableWithGroupId:v13 collectionId:v10];
                  __int16 v24 = PLSearchIndexSynonymCategoryForCategory(v14);
                  v59[0] = MEMORY[0x1E4F143A8];
                  v59[1] = 3221225472;
                  v59[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_440;
                  v59[3] = &unk_1E5873560;
                  __int16 v63 = v24;
                  uint64_t v62 = v13;
                  id v60 = v50;
                  id v61 = &v72;
                  [v53 enumerateSynonymsForOriginalContentString:v19 orOriginalLookupIdentifier:v20 handler:v59];

                  char v8 = v52;
                  ++v16;
                  unsigned __int16 v17 = v14;
                }
                while (v12 != v16);
                uint64_t v11 = v49;
                uint64_t v12 = [v49 countByEnumeratingWithState:&v64 objects:v79 count:16];
              }
              while (v12);
            }
          }
          else
          {
            char v8 = v52;
          }
        }
        else
        {
          char v8 = PLSearchBackendPSIDatabaseGetLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            long long v9 = [v4 uuid];
            *(_DWORD *)long long buf = v39;
            *(void *)id v78 = v9;
            _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Missing required search attributes to index Collection UUID: %{public}@", buf, 0xCu);
          }
        }

        ++v48;
      }
      while (v48 != v42);
      uint64_t v2 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v2);
  }

  uint64_t v25 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v26 = [(PSIGroupCache *)v51 numberOfGroupsQueried];
    int v27 = [(PSIGroupCache *)v51 numberOfGroupsChecked];
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)id v78 = v26;
    *(_WORD *)&v78[4] = 1026;
    *(_DWORD *)&v78[6] = v27;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "Search Indexing: Queried %{public}d groups for %{public}d groups checked.", buf, 0xEu);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v28 = v50;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v76 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        long long v33 = *(void **)(v54 + 32);
        uint64_t v34 = objc_msgSend(v32, "text", v39);
        int v35 = [v32 identifier];
        objc_msgSend(v33, "_inqUpdateGroupForText:identifier:category:owningGroupId:", v34, v35, (__int16)objc_msgSend(v32, "category"), objc_msgSend(v32, "owningGroupId"));
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v76 count:16];
    }
    while (v29);
  }

  uint64_t v36 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    int v37 = [v28 count];
    uint64_t v38 = v73[3];
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)id v78 = v37;
    *(_WORD *)&v78[4] = 1026;
    *(_DWORD *)&v78[6] = v38;
    _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Search Indexing: Registered %{public}d synonyms for %{public}d synonyms encountered.", buf, 0xEu);
  }

  if (!*(unsigned char *)(v54 + 48)) {
    [*(id *)(v54 + 32) _inqRemoveUnusedGroups];
  }
  _Block_object_dispose(&v72, 8);
}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_440(uint64_t a1, void *a2, int a3, void *a4)
{
  if (*(unsigned __int16 *)(a1 + 56) == (unsigned __int16)a3)
  {
    id v7 = a4;
    id v8 = a2;
    long long v9 = [[PSISynonym alloc] initWithText:v8 category:a3 owningGroupId:*(void *)(a1 + 48) identifier:v7];

    [*(id *)(a1 + 32) addObject:v9];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)addCollections:(id)a3 withCompletion:(id)a4
{
}

- (void)addCollection:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PSIDatabase addCollections:withCompletion:](self, "addCollections:withCompletion:", v9, v7, v10, v11);
}

- (void)addAssets:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  long long v9 = (void (**)(void))a5;
  id v10 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v8;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Adding assets: %@", buf, 0xCu);
  }

  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  uint64_t v11 = [(__CFString *)v8 count];
  if ((self->_options & 2) == 0) {
    goto LABEL_7;
  }
  if (self->_databaseIsValid && v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke;
    v14[3] = &unk_1E5873CA8;
    v14[4] = self;
    uint64_t v16 = v9;
    uint64_t v15 = v8;
    BOOL v17 = a4;
    [(PSIDatabase *)self _inqAsync:v14];

    goto LABEL_19;
  }
  if (!self->_databaseIsValid)
  {
LABEL_7:
    uint64_t v12 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid) {
        uint64_t v13 = @"the database is not writable";
      }
      else {
        uint64_t v13 = @"the database is invalid";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Detected invalid state, unable to add assets because %@", buf, 0xCu);
    }
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_19:
}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_429;
    v6[3] = &unk_1E5874318;
    v6[4] = v2;
    id v7 = *(id *)(a1 + 40);
    char v8 = *(unsigned char *)(a1 + 56);
    [v2 _inqPerformBatch:v6];
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    uint64_t v4 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      id v10 = "-[PSIDatabase addAssets:deferRemovingUnusedGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_429(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v53 = [[PSIGroupCache alloc] initWithDelegate:*(void *)(a1 + 32)];
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v55 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v2)
  {
    uint64_t v43 = *(void *)v71;
    *(void *)&long long v3 = 138412290;
    long long v41 = v3;
    do
    {
      uint64_t v48 = 0;
      uint64_t v44 = v2;
      do
      {
        if (*(void *)v71 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v70 + 1) + 8 * v48);
        context = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v5 = [v4 uuid];
        BOOL v6 = v5 == 0;

        if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = v41;
          *(void *)uint64_t v80 = @"expect uuid";
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        uint64_t v47 = objc_msgSend(v4, "uuid", v41);
        uint64_t v7 = v55;
        char v8 = [v4 tokens];
        if (v8)
        {
          if ([v4 isUpdate])
          {
            long long v9 = v8;
            id v10 = PLSearchIndexCategoriesForAssetPropertySet([v4 propertySets]);
            [*(id *)(v55 + 32) _inqRemoveUUID:v47 categories:v10 objectType:0 isInBatch:1];

            uint64_t v7 = v55;
            char v8 = v9;
          }
          else
          {
            [*(id *)(v55 + 32) _inqRemoveUUID:v47 objectType:0 isInBatch:1];
          }
          uint64_t v54 = [*(id *)(v7 + 32) _inqAssetIdWithAsset:v4];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v45 = v8;
          uint64_t v11 = [v8 reverseObjectEnumerator];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v81 count:16];
          if (v12)
          {
            LOWORD(v13) = 0;
            uint64_t v14 = 0;
            uint64_t v15 = *(void *)v67;
            id v50 = v11;
            do
            {
              uint64_t v16 = 0;
              unsigned __int16 v17 = v13;
              do
              {
                if (*(void *)v67 != v15) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
                uint64_t v19 = [v18 text];
                uint64_t v20 = [v18 identifier];
                int v13 = [v18 category];
                int v21 = [v18 owningCategory];
                if ((unsigned __int16)v21 == v17) {
                  uint64_t v22 = v14;
                }
                else {
                  uint64_t v22 = 0;
                }
                if (v21) {
                  uint64_t v23 = v22;
                }
                else {
                  uint64_t v23 = 0;
                }
                uint64_t v14 = [(PSIGroupCache *)v53 idOfGroupWithText:v19 identifier:v20 category:v13 owningGroupId:v23];
                [*(id *)(v55 + 32) _inqUpdateGATableWithGroupId:v14 assetId:v54];
                if ([v19 length] && (PLSearchIndexCategoryMaskForCategory(v13) & 0x13A4234C04) != 0)
                {
                  [v49 addObject:v19];
                  id v24 = [v51 objectForKeyedSubscript:v19];
                  if (!v24)
                  {
                    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                    [v51 setObject:v24 forKeyedSubscript:v19];
                  }
                }
                else
                {
                  id v24 = 0;
                }
                __int16 v25 = PLSearchIndexSynonymCategoryForCategory(v13);
                v60[0] = MEMORY[0x1E4F143A8];
                v60[1] = 3221225472;
                v60[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_436;
                v60[3] = &unk_1E5873538;
                __int16 v65 = v25;
                uint64_t v64 = v14;
                id v61 = v52;
                id v26 = v24;
                id v62 = v26;
                __int16 v63 = &v74;
                [v4 enumerateSynonymsForOriginalContentString:v19 orOriginalLookupIdentifier:v20 handler:v60];

                ++v16;
                unsigned __int16 v17 = v13;
              }
              while (v12 != v16);
              uint64_t v11 = v50;
              uint64_t v12 = [v50 countByEnumeratingWithState:&v66 objects:v81 count:16];
            }
            while (v12);
          }

          char v8 = v45;
        }

        ++v48;
      }
      while (v48 != v44);
      uint64_t v2 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v2);
  }

  int v27 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    int v28 = [(PSIGroupCache *)v53 numberOfGroupsQueried];
    int v29 = [(PSIGroupCache *)v53 numberOfGroupsChecked];
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)uint64_t v80 = v28;
    *(_WORD *)&v80[4] = 1026;
    *(_DWORD *)&v80[6] = v29;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "Search Indexing: Queried %{public}d groups for %{public}d group checks.", buf, 0xEu);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v30 = v52;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v78 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v57 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        int v35 = *(void **)(v55 + 32);
        uint64_t v36 = [v34 text];
        int v37 = [v34 identifier];
        objc_msgSend(v35, "_inqUpdateGroupForText:identifier:category:owningGroupId:", v36, v37, (__int16)objc_msgSend(v34, "category"), objc_msgSend(v34, "owningGroupId"));
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v78 count:16];
    }
    while (v31);
  }

  uint64_t v38 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    int v39 = [v30 count];
    uint64_t v40 = v75[3];
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)uint64_t v80 = v39;
    *(_WORD *)&v80[4] = 1026;
    *(_DWORD *)&v80[6] = v40;
    _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_INFO, "Search Indexing: Registered %{public}d synonyms for %{public}d synonyms encountered.", buf, 0xEu);
  }

  if (!*(unsigned char *)(v55 + 48)) {
    [*(id *)(v55 + 32) _inqRemoveUnusedGroups];
  }
  _Block_object_dispose(&v74, 8);
}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_436(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  if (*(unsigned __int16 *)(a1 + 64) == (unsigned __int16)a3)
  {
    id v11 = v7;
    id v8 = a4;
    long long v9 = [[PSISynonym alloc] initWithText:v11 category:a3 owningGroupId:*(void *)(a1 + 56) identifier:v8];

    [*(id *)(a1 + 32) addObject:v9];
    id v10 = *(void **)(a1 + 40);
    if (v10) {
      [v10 addObject:v11];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

    id v7 = v11;
  }
}

- (void)addAssets:(id)a3 withCompletion:(id)a4
{
}

- (void)addAsset:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PSIDatabase addAssets:withCompletion:](self, "addAssets:withCompletion:", v9, v7, v10, v11);
}

- (void)updateRankingScoreForGroups:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"expect writable";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  uint64_t v8 = [v6 count];
  if ((self->_options & 2) != 0 && self->_databaseIsValid && (long long v9 = (__CFString *)v8) != 0)
  {
    id v10 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "PSI Ranking Update: Updating group rankings for %ld groups. Groups: %@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke;
    v11[3] = &unk_1E5873510;
    void v11[4] = self;
    int v13 = v7;
    id v12 = v6;
    uint64_t v14 = v9;
    [(PSIDatabase *)self _inqAsync:v11];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke_421;
    v8[3] = &unk_1E5875E40;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v9 = v3;
    uint64_t v10 = v4;
    uint64_t v11 = *(void *)(a1 + 56);
    [v2 _inqPerformBatch:v8];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
  else
  {
    id v6 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      int v13 = "-[PSIDatabase updateRankingScoreForGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

void __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke_421(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v2) {
    goto LABEL_15;
  }
  uint64_t v3 = v2;
  id v18 = 0;
  uint64_t v4 = *(void *)v21;
  id obj = v1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v21 != v4) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v6 category];
      uint64_t v9 = [v6 owningGroupId];
      uint64_t v10 = [v6 contentString];
      uint64_t v11 = [v6 normalizedString];
      id v12 = [v6 lookupIdentifier];
      [v6 score];
      LOWORD(v16) = 256;
      uint64_t v13 = objc_msgSend(v7, "_inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:", v8, v9, v10, v11, v12, 0, 0, v16);

      if (!v13)
      {
        uint64_t v14 = PLSearchBackendPSIDatabaseGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          __int16 v25 = v6;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "PSI Ranking Update: Failed to find group for ranking score update: %@", buf, 0xCu);
        }
        ++v18;
      }
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  }
  while (v3);

  if (v18)
  {
    id v1 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 134218240;
      __int16 v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = v15;
      _os_log_impl(&dword_19B3C7000, v1, OS_LOG_TYPE_ERROR, "PSI Ranking Update: Failed to update ranking score for %ld of %ld groups.", buf, 0x16u);
    }
LABEL_15:
  }
}

- (void)_ingRebuildPrefixTableIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Running database prefix table integrity check", (uint8_t *)&v15, 2u);
  }

  uint64_t v4 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO prefix(prefix) VALUES('integrity-check')"];
  int v5 = sqlite3_step(v4);
  sqlite3_finalize(v4);
  id v6 = PLSearchBackendPSIDatabaseGetLog();
  uint64_t v7 = v6;
  if (v5 == 267)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Database corruption detected in the prefix table.", (uint8_t *)&v15, 2u);
    }

    uint64_t v8 = [(PSIDatabase *)self _inqPrepareStatement:"INSERT INTO prefix(prefix) VALUES('rebuild')"];
    int v9 = sqlite3_step(v8);
    sqlite3_finalize(v8);
    uint64_t v7 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = @"error";
      if (v9 == 101) {
        uint64_t v10 = @"success";
      }
      int v15 = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 1026;
      int v18 = v9;
      uint64_t v11 = "Completed prefix table rebuild: %{public}@. Result code: %{public}d";
      id v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 18;
      goto LABEL_12;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    uint64_t v11 = "Prefix table integrity check successful";
    id v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 2;
LABEL_12:
    _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v15, v14);
  }
}

- (BOOL)isDatabaseCorrupted
{
  uint64_t v3 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Running database integrity quick check", buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v8 = buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PSIDatabase_isDatabaseCorrupted__block_invoke;
  v6[3] = &unk_1E5875E68;
  v6[4] = self;
  void v6[5] = buf;
  [(PSIDatabase *)self _inqSync:v6];
  uint8_t v4 = v8[24];
  _Block_object_dispose(buf, 8);
  return v4;
}

void __34__PSIDatabase_isDatabaseCorrupted__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)objc_opt_class() _integrityCheckDatabase:*(void *)(*(void *)(a1 + 32) + 8)] ^ 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v2 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint8_t v4 = 0;
        _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Database corruption detected during integrity quick check.", v4, 2u);
      }
    }
    else
    {
      uint64_t v3 = *(void **)(a1 + 32);
      [v3 _ingRebuildPrefixTableIfNeeded];
    }
  }
}

- (void)dropDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Dropping database", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke;
  v11[3] = &unk_1E58734E8;
  void v11[4] = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)MEMORY[0x19F38D650](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E58742F0;
  void v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(PSIDatabase *)self _inqAsync:v9];
}

void __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _clearInitialSuggestions];
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    [v2 _finalizeEverything];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    return [v3 _dropDatabase:v5 withCompletion:v4];
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

- (void)updateSearchMetadata
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__PSIDatabase_updateSearchMetadata__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PSIDatabase *)self _inqSync:v2];
}

void __35__PSIDatabase_updateSearchMetadata__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 152) currentSearchMetadata];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = v2;
}

- (void)_inSearchQueueAsync:(id)a3
{
}

- (void)_inqAsync:(id)a3
{
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_inqDatabase)
  {
    [(PSIDatabase *)self _finalizeEverything];
    uint64_t v3 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Closing sqlite3 database", buf, 2u);
    }

    int v4 = sqlite3_close(self->_inqDatabase);
    self->_inqDatabase = 0;
    if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = @"Couldn't close db";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
  }
  inqGroupObjectsById = self->_inqGroupObjectsById;
  if (inqGroupObjectsById) {
    CFRelease(inqGroupObjectsById);
  }
  v6.receiver = self;
  v6.super_class = (Class)PSIDatabase;
  [(PSIDatabase *)&v6 dealloc];
}

- (void)_finalizeEverything
{
  if (self->_inqDatabase)
  {
    inqPreparedStatements = self->_inqPreparedStatements;
    if (inqPreparedStatements)
    {
      CFDictionaryApplyFunction(inqPreparedStatements, (CFDictionaryApplierFunction)finalizeSqliteStatementInDictionary, 0);
      CFRelease(self->_inqPreparedStatements);
      self->_inqPreparedStatements = 0;
    }
    [(PSIStatement *)self->_assetUUIDByAssetIdWithAssetIdsStatement finalizze];
    [(PSIStatement *)self->_collectionResultByCollectionIdWithCollectionIdsStatement finalizze];
    [(PSIStatement *)self->_inqAssetIdsByGroupIdForAssetIdsStatement finalizze];
    [(PSIStatement *)self->_inqCollectionIdsByGroupIdForCollectionIdsStatement finalizze];
    [(PSIStatement *)self->_inqNumberOfAssetsMatchingGroupWithIdStatement finalizze];
    [(PSIStatement *)self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement finalizze];
    [(PSIStatement *)self->_inqNumberOfCollectionsMatchingGroupWithIdStatement finalizze];
    [(PSIStatement *)self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement finalizze];
    [(PSIStatement *)self->_inqIdsOfAllGroupsStatement finalizze];
    inqIdsOfAllGroupsInPrefixStatement = self->_inqIdsOfAllGroupsInPrefixStatement;
    [(PSIStatement *)inqIdsOfAllGroupsInPrefixStatement finalizze];
  }
}

+ (id)searchDatabaseLog
{
  if (searchDatabaseLog_onceToken != -1) {
    dispatch_once(&searchDatabaseLog_onceToken, &__block_literal_global_607);
  }
  uint64_t v2 = (void *)searchDatabaseLog_searchDatabaseLog;
  return v2;
}

void __32__PSIDatabase_searchDatabaseLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.search", "SearchDatabase");
  id v1 = (void *)searchDatabaseLog_searchDatabaseLog;
  searchDatabaseLog_searchDatabaseLog = (uint64_t)v0;
}

+ (BOOL)_integrityCheckDatabase:(sqlite3 *)a3
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, "pragma quick_check", -1, &ppStmt, 0)) {
    return 0;
  }
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    BOOL v3 = v4 == 100;
    if (v4 != 100) {
      break;
    }
    id v5 = sqlite3_column_text(ppStmt, 0);
    if (v5)
    {
      if (!strcmp((const char *)v5, "ok")) {
        break;
      }
    }
  }
  sqlite3_finalize(ppStmt);
  return v3;
}

+ (void)_dropDatabase:(sqlite3 *)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v17 = @"expect db connection";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  objc_super v6 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Closed Search Index sqlite database.", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  *(_DWORD *)long long buf = 129;
  uint64_t v8 = sqlite3_file_control(a3, 0, 101, buf);
  if (v8) {
    objc_msgSend(v7, "appendFormat:", @"Failed to truncate database: %s (%d). ", sqlite3_errmsg(a3), v8);
  }
  uint64_t v9 = sqlite3_close(a3);
  int v10 = v9;
  if (v9) {
    objc_msgSend(v7, "appendFormat:", @"Failed to close database: %s (%d).", sqlite3_errstr(v9), v9);
  }
  if (!(v10 | v8))
  {
    os_log_type_t v13 = 0;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  id v15 = v7;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  os_log_type_t v13 = [v11 errorWithDomain:@"com.apple.photos.search" code:-1 userInfo:v12];

  if (v5) {
LABEL_12:
  }
    v5[2](v5, v13);
LABEL_13:
}

+ (void)dropDatabaseAtPath:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  uint64_t v6 = [a1 _openDatabaseAtPath:a3 options:2];
  if (v6)
  {
    [a1 _dropDatabase:v6 withCompletion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (id)groupIdsInPrefixTable
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke;
  v8[3] = &unk_1E5875E18;
  void v8[4] = self;
  int v4 = Mutable;
  uint64_t v9 = v4;
  [(PSIDatabase *)self _inqSync:v8];
  id v5 = v9;
  uint64_t v6 = v4;

  return v6;
}

void __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[14];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke_2;
  v3[3] = &unk_1E5873708;
  id v4 = *(id *)(a1 + 40);
  [v1 executeStatement:v2 withResultEnumerationBlock:v3];
}

void __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v3, "int64AtColumn:", 0));
}

- (void)exqExecuteStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PSIDatabase_UnitTesting__exqExecuteStatementFromString_withResultEnumerationBlock___block_invoke;
  v10[3] = &unk_1E5874868;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PSIDatabase *)self _inqSync:v10];
}

uint64_t __85__PSIDatabase_UnitTesting__exqExecuteStatementFromString_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeStatementFromString:*(void *)(a1 + 40) withResultEnumerationBlock:*(void *)(a1 + 48)];
}

- (id)allGroupIds
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke;
  v8[3] = &unk_1E5875E18;
  void v8[4] = self;
  id v4 = Mutable;
  id v9 = v4;
  [(PSIDatabase *)self _inqSync:v8];
  id v5 = v9;
  id v6 = v4;

  return v6;
}

void __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[13];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke_2;
  v3[3] = &unk_1E5873708;
  id v4 = *(id *)(a1 + 40);
  [v1 executeStatement:v2 withResultEnumerationBlock:v3];
}

void __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v3, "int64AtColumn:", 0));
}

- (void)linkCollectionWithId:(int64_t)a3 toGroupWithId:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PSIDatabase_UnitTesting__linkCollectionWithId_toGroupWithId___block_invoke;
  v4[3] = &unk_1E5875E90;
  v4[4] = self;
  void v4[5] = a4;
  void v4[6] = a3;
  [(PSIDatabase *)self _inqSync:v4];
}

uint64_t __63__PSIDatabase_UnitTesting__linkCollectionWithId_toGroupWithId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqUpdateGCTableWithGroupId:*(void *)(a1 + 40) collectionId:*(void *)(a1 + 48)];
}

- (void)linkAssetWithId:(int64_t)a3 toGroupWithId:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PSIDatabase_UnitTesting__linkAssetWithId_toGroupWithId___block_invoke;
  v4[3] = &unk_1E5875E90;
  v4[4] = self;
  void v4[5] = a4;
  void v4[6] = a3;
  [(PSIDatabase *)self _inqSync:v4];
}

uint64_t __58__PSIDatabase_UnitTesting__linkAssetWithId_toGroupWithId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqUpdateGATableWithGroupId:*(void *)(a1 + 40) assetId:*(void *)(a1 + 48)];
}

- (int64_t)insertGroup:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  os_log_type_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PSIDatabase_UnitTesting__insertGroup___block_invoke;
  v8[3] = &unk_1E5875340;
  id v5 = v4;
  id v9 = v5;
  int v10 = self;
  id v11 = &v12;
  [(PSIDatabase *)self _inqSync:v8];
  int64_t v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __40__PSIDatabase_UnitTesting__insertGroup___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v14 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) contentString];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) contentString];
    id v4 = _newUTF8String(v3, &v14);
  }
  else
  {
    id v4 = 0;
  }

  int v13 = 0;
  id v5 = [*(id *)(a1 + 32) normalizedString];
  if (v5)
  {
    int64_t v6 = [*(id *)(a1 + 32) normalizedString];
    id v7 = _newUTF8String(v6, &v13);
  }
  else
  {
    id v7 = 0;
  }

  int v12 = 0;
  id v8 = [*(id *)(a1 + 32) lookupIdentifier];
  id v9 = v8;
  if (v8) {
    int v10 = _newUTF8String(v8, &v12);
  }
  else {
    int v10 = 0;
  }
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 24), @"insertGroup");
  if (sqlite3_bind_int(Value, 1, [*(id *)(a1 + 32) category])
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, [*(id *)(a1 + 32) owningGroupId])
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 3, v4, v14, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 4, v7, v13, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 5, v10, v12, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = @"Failed to bind parameter";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) _inqExecutePreparedStatement:Value withStatementBlock:0];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
  if (v4) {
    free(v4);
  }
  if (v7) {
    free(v7);
  }
  if (v10) {
    free(v10);
  }
}

- (int64_t)insertCollection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PSIDatabase_UnitTesting__insertCollection___block_invoke;
  v8[3] = &unk_1E5875340;
  int v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PSIDatabase *)self _inqSync:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __45__PSIDatabase_UnitTesting__insertCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqCollectionIdWithCollection:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)insertAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PSIDatabase_UnitTesting__insertAsset___block_invoke;
  v8[3] = &unk_1E5875340;
  int v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PSIDatabase *)self _inqSync:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __40__PSIDatabase_UnitTesting__insertAsset___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqAssetIdWithAsset:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)initForTestingWithOptions:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PSIDatabase;
  id v4 = [(PSIDatabase *)&v11 init];
  id v5 = v4;
  if (v4
    && ((path = v4->_path, v4->_path = (NSString *)@":memory:", path, (unint64_t)a3 <= 1)
      ? (int64_t v7 = 1)
      : (int64_t v7 = a3),
        BOOL v8 = [(PSIDatabase *)v5 _prepareSearchIndexAtPath:v5->_path options:v7],
        v5->_databaseIsValid = v8,
        !v8))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (int64_t)lastInsertedRowID
{
  return sqlite3_last_insert_rowid(self->_inqDatabase);
}

- (void)unbindMatchingIds
{
}

- (void)bindMatchingIds:(const int64_t *)a3 numberOfMatchingIds:(unint64_t)a4
{
}

- (void)bindMatchingIds:(__CFArray *)a3 range:(_NSRange)a4
{
}

- (void)bindMatchingIds:(__CFSet *)a3
{
}

- (void)unprepareMatchingIds
{
}

- (void)prepareForNumberOfMatchingIds:(unint64_t)a3
{
}

- (void)executeStatement:(id)a3
{
}

- (void)executeStatementFromString:(id)a3
{
  id v4 = [(PSIDatabase *)self statementFromString:a3];
  [(PSIDatabase *)self executeStatement:v4];
  [v4 finalizze];
}

- (void)executeFetchEmbeddingQuery:(id)a3 batchHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke;
  v10[3] = &unk_1E5874868;
  id v11 = v6;
  int v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PSIDatabase *)self _inqSync:v10];
}

void __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) modelTypes];
    id v4 = [*(id *)(a1 + 32) queryAssetUUID];
    id v5 = (sqlite3_stmt *)[v2 prepareEmbeddingStatement:1 modelTypes:v3 assetUUID:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    int v19 = 0;
    id v7 = *(void **)(a1 + 40);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke_2;
    id v13 = &unk_1E5873F00;
    id v14 = *(id *)(a1 + 32);
    uint64_t v17 = v18;
    id v8 = v6;
    id v15 = v8;
    id v16 = *(id *)(a1 + 48);
    [v7 _inqExecutePreparedStatement:v5 withCancelableStatementBlock:&v10];
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled", v10, v11, v12, v13) & 1) == 0)
    {
      if ([v8 count]) {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      if (v5 && sqlite3_finalize(v5) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v21 = @"Failed to finalize statement";
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      id v9 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Embeddings fetched successfully", buf, 2u);
      }
    }
    _Block_object_dispose(v18, 8);
  }
}

uint64_t __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = [*(id *)(a1 + 32) isCanceled];
  if ((v4 & 1) == 0)
  {
    int v5 = sqlite3_column_int(a2, 0);
    id v6 = objc_msgSend([NSString alloc], "initWithCString:encoding:", sqlite3_column_text(a2, 1), 4);
    id v7 = (double *)sqlite3_column_blob(a2, 2);
    int v8 = sqlite3_column_bytes(a2, 2);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)v8 >> 3];
    if (v8 >= 8)
    {
      if (v8 >> 3 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = (v8 >> 3);
      }
      do
      {
        double v11 = *v7++;
        int v12 = [NSNumber numberWithDouble:v11];
        [v9 addObject:v12];

        --v10;
      }
      while (v10);
    }
    id v13 = [[PLEmbeddingCompareObject alloc] initWithAssetUUID:v6 vector:v9];
    [(PLEmbeddingCompareObject *)v13 setModelType:v5];
    [*(id *)(a1 + 40) addObject:v13];
    if (__ROR8__(0x8F5C28F5C28F5C29 * *(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 1) < 0x51EB851EB851EB9uLL)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 40) removeAllObjects];
    }
  }
  return v4 ^ 1u;
}

- (id)collectionUUIDsForCollectionIDs:(__CFArray *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v16 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "No collectionIds provided to collectionUUIDsForCollectionIDs", buf, 2u);
    }

    goto LABEL_21;
  }
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)long long buf = 138412290,
         uint64_t v22 = @"expect searchable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    id v13 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid) {
        id v14 = @"valid";
      }
      else {
        id v14 = @"invalid";
      }
      id v15 = @"yes";
      if ((self->_options & 1) == 0) {
        id v15 = @"no";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Unable to fetch collection UUIDs for collectionIds. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  CFIndex Count = CFArrayGetCount(a3);
  if (!Count)
  {
LABEL_21:
    int v12 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_22;
  }
  CFIndex v6 = Count;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:Count];
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, @"selectCollectionIdsIn");
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, 0, v6);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke;
  void v18[3] = &unk_1E5875E40;
  void v18[4] = self;
  long long v20 = Value;
  id v9 = v7;
  id v19 = v9;
  [(PSIDatabase *)self _inqSync:v18];
  [(PSIIntArray *)self->_matchingIds unbind];
  uint64_t v10 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v22 = (__CFString *)v11;
    __int16 v23 = 2048;
    id v24 = (__CFString *)v6;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Fetched %llu collection UUIDs for %ld collectionIds.", buf, 0x16u);
  }

  int v12 = (void *)[v9 copy];
LABEL_22:
  return v12;
}

void __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke_2;
  v3[3] = &unk_1E5873650;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _inqExecutePreparedStatement:v1 withStatementBlock:v3];
}

void __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
  id v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)searchResultV2WithDateFilter:(id)a3 scopedSearchIdentifiers:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6
{
  int v7 = a5;
  v50[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PSIDatabase.m", 5488, @"Invalid parameter not satisfying: %@", @"dateFilter" object file lineNumber description];
  }
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  uint64_t v34 = __119__PSIDatabase_PSIQueryDelegate__searchResultV2WithDateFilter_scopedSearchIdentifiers_searchResultTypes_suggestionType___block_invoke;
  int v35 = &unk_1E5873EB0;
  char v40 = v7 & 1;
  uint64_t v38 = &v46;
  uint64_t v36 = self;
  id v13 = v11;
  id v37 = v13;
  int v39 = &v42;
  BOOL v41 = (v7 & 2) != 0;
  [(PSIDatabase *)self _inqSync:&v32];
  if (v7)
  {
    id v15 = [(PSIDatabase *)self assetUUIDsForAssetIDs:v47[3]];
    id v14 = (void *)[v15 mutableCopy];
  }
  else
  {
    id v14 = 0;
  }
  if ((v7 & 2) != 0)
  {
    uint64_t v17 = [(PSIDatabase *)self collectionUUIDsForCollectionIDs:v43[3]];
    id v16 = (void *)[v17 mutableCopy];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v18 = (const void *)v47[3];
  if (v18) {
    CFRelease(v18);
  }
  id v19 = (const void *)v43[3];
  if (v19) {
    CFRelease(v19);
  }
  if ([v12 count])
  {
    [v14 intersectsSet:v12];
    [v16 intersectsSet:v12];
  }
  if ((~v7 & 3) != 0)
  {
    if (v7)
    {
      if ([v14 count]) {
        goto LABEL_21;
      }
      goto LABEL_23;
    }
    if ((v7 & 2) == 0) {
      goto LABEL_23;
    }
  }
  else if ([v14 count])
  {
LABEL_21:
    long long v20 = [PLSearchSuggestionComponent alloc];
    long long v21 = [v13 displayString];
    uint64_t v22 = [v14 count];
    uint64_t v23 = [v16 count];
    id v24 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v20, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v21, 0, 0, v22, v23, 1102, 0.0, 0, a6, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v32, v33, v34, v35,
            v36);

    uint64_t v25 = [PLSearchResultV2 alloc];
    __int16 v26 = [v14 allObjects];
    uint64_t v27 = [v16 allObjects];
    v50[0] = v24;
    int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    uint64_t v29 = [(PLSearchResultV2 *)v25 initWithAssetUUIDs:v26 collectionUUIDs:v27 suggestions:v28];

    goto LABEL_24;
  }
  if ([v16 count]) {
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v29 = 0;
LABEL_24:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v29;
}

uint64_t __119__PSIDatabase_PSIQueryDelegate__searchResultV2WithDateFilter_scopedSearchIdentifiers_searchResultTypes_suggestionType___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v2 = [*(id *)(a1 + 32) _inqNewAssetIdsWithDateFilter:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  if (*(unsigned char *)(a1 + 65)) {
    uint64_t result = [*(id *)(a1 + 32) _inqNewCollectionIdsWithDateFilter:*(void *)(a1 + 40)];
  }
  else {
    uint64_t result = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)_inqGroupIdsForAssetOrCollectionIds:(__CFArray *)a3 resultType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  if (!a3)
  {
    id v19 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      long long v20 = "Unexpected NULL PSI identifiers passed to _inqGroupIdsForAssetOrCollectionIds";
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    }
LABEL_11:

    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    goto LABEL_12;
  }
  if (!a4)
  {
    id v19 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      long long v20 = "Result type was not specified in _inqGroupIdsForAssetOrCollectionIds";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  CFIndex Count = CFArrayGetCount(a3);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, 0, Count);
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFMutableSetRef v13 = Mutable;
  uint64_t v14 = 64;
  if (a4 == 1) {
    uint64_t v14 = 56;
  }
  id v15 = *(Class *)((char *)&self->super.isa + v14);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__PSIDatabase_PSIQueryDelegate___inqGroupIdsForAssetOrCollectionIds_resultType_completion___block_invoke;
  v21[3] = &unk_1E5873E88;
  id v23 = v10;
  CFMutableSetRef v24 = Mutable;
  id v22 = v11;
  id v16 = v10;
  id v17 = v11;
  id v18 = v15;
  [(PSIDatabase *)self executeStatement:v18 withResultEnumerationBlock:v21];
  [(PSIIntArray *)self->_matchingIds unbind];
  (*((void (**)(id, CFMutableSetRef, id, id))v8 + 2))(v8, v13, v16, v17);

LABEL_12:
}

void __91__PSIDatabase_PSIQueryDelegate___inqGroupIdsForAssetOrCollectionIds_resultType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (const void *)[v9 int64AtColumn:0];
  uint64_t v4 = [v9 int64AtColumn:1];
  sqlite3_int64 v5 = [NSNumber numberWithUnsignedLongLong:v3];
  CFMutableSetRef Mutable = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!Mutable)
  {
    CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    [*(id *)(a1 + 32) setObject:Mutable forKeyedSubscript:v5];
  }
  [Mutable addObject:v4];
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), v3);
  int v7 = *(void **)(a1 + 40);
  id v8 = [NSNumber numberWithUnsignedLongLong:v3];
  [v7 addObject:v8];
}

- (void)groupsForCollectionIds:(__CFArray *)a3 completion:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    id v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unexpected NULL collectionIds passed to groupsForCollectionIds", buf, 2u);
    }

    goto LABEL_10;
  }
  if (!CFArrayGetCount(a3))
  {
LABEL_10:
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
    goto LABEL_11;
  }
  *(void *)long long buf = 0;
  id v17 = buf;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__107175;
  long long v20 = __Block_byref_object_dispose__107176;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  CFMutableSetRef v13 = __Block_byref_object_copy__107175;
  uint64_t v14 = __Block_byref_object_dispose__107176;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke;
  v9[3] = &unk_1E5873E60;
  void v9[4] = self;
  void v9[5] = buf;
  v9[6] = &v10;
  v9[7] = a3;
  [(PSIDatabase *)self _inqSync:v9];
  if (*((void *)v17 + 5)) {
    uint64_t v7 = *((void *)v17 + 5);
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v7, v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(buf, 8);
LABEL_11:
}

uint64_t __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke_2;
  v3[3] = &unk_1E5873E38;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 48);
  return [(id)v4 _inqGroupIdsForAssetOrCollectionIds:v1 resultType:2 completion:v3];
}

void __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke_2(uint64_t a1, const void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    uint64_t v25 = a3;
    id v26 = v8;
    uint64_t v10 = [*(id *)(a1 + 32) _inqGroupsWithMatchingGroupIds:a2 dateFilter:0 includeObjects:0 searchResultTypes:2 matchingPredicateBlock:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v24 = a1;
    id v13 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId", v24));
          long long v20 = [v9 objectForKeyedSubscript:v19];
          uint64_t v21 = [v20 count];

          if (v21)
          {
            id v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            id v23 = [v9 objectForKeyedSubscript:v22];

            v33.NSUInteger length = CFArrayGetCount((CFArrayRef)v23);
            v33.NSUInteger location = 0;
            CFArraySortValues((CFMutableArrayRef)v23, v33, (CFComparatorFunction)PSIRowIDCompare_107184, 0);
            [v18 setCollectionIds:v23];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(v24 + 48) + 8) + 40), v25);
    CFRelease(a2);
    id v8 = v26;
  }
}

- (void)groupsForAssetIds:(__CFArray *)a3 completion:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    uint64_t v7 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unexpected NULL assetIds passed to groupsForAssetIds", buf, 2u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
  }
  if (!CFArrayGetCount(a3)) {
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
  }
  *(void *)long long buf = 0;
  id v17 = buf;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__107175;
  long long v20 = __Block_byref_object_dispose__107176;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__107175;
  uint64_t v14 = __Block_byref_object_dispose__107176;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke;
  v9[3] = &unk_1E5873E60;
  void v9[4] = self;
  void v9[5] = buf;
  v9[6] = &v10;
  v9[7] = a3;
  [(PSIDatabase *)self _inqSync:v9];
  if (*((void *)v17 + 5)) {
    uint64_t v8 = *((void *)v17 + 5);
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v8, v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(buf, 8);
}

uint64_t __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke_2;
  v3[3] = &unk_1E5873E38;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 48);
  return [(id)v4 _inqGroupIdsForAssetOrCollectionIds:v1 resultType:1 completion:v3];
}

void __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke_2(uint64_t a1, const void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    uint64_t v25 = a3;
    id v26 = v8;
    uint64_t v10 = [*(id *)(a1 + 32) _inqGroupsWithMatchingGroupIds:a2 dateFilter:0 includeObjects:0 searchResultTypes:1 matchingPredicateBlock:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v24 = a1;
    id v13 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId", v24));
          long long v20 = [v9 objectForKeyedSubscript:v19];
          uint64_t v21 = [v20 count];

          if (v21)
          {
            id v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            id v23 = [v9 objectForKeyedSubscript:v22];

            v33.NSUInteger length = CFArrayGetCount((CFArrayRef)v23);
            v33.NSUInteger location = 0;
            CFArraySortValues((CFMutableArrayRef)v23, v33, (CFComparatorFunction)PSIRowIDCompare_107184, 0);
            [v18 setAssetIds:v23];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(v24 + 48) + 8) + 40), v25);
    CFRelease(a2);
    id v8 = v26;
  }
}

- (void)fetchAssetUUIDsForAssetIDs:(__CFArray *)a3 creationDateSorted:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void))a5;
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)long long buf = 138412290,
         uint64_t v15 = @"expect searchable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    v8[2](v8, 0);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PSIDatabase_PSIQueryDelegate__fetchAssetUUIDsForAssetIDs_creationDateSorted_completionHandler___block_invoke;
  v10[3] = &unk_1E5873E10;
  id v11 = v8;
  uint64_t v12 = a3;
  BOOL v13 = a4;
  void v10[4] = self;
  id v9 = v8;
  [(PSIDatabase *)self _inqAsync:v10];
}

void __97__PSIDatabase_PSIQueryDelegate__fetchAssetUUIDsForAssetIDs_creationDateSorted_completionHandler___block_invoke(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", *(void *)(a1 + 48), 0, Count, *(unsigned __int8 *)(a1 + 56));
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)group:(id)a3 fetchOwningContentString:(BOOL)a4 assetIdRange:(_NSRange)a5 collectionIdRange:(_NSRange)a6 completionHandler:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v9 = a5.length;
  NSUInteger v10 = a5.location;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)long long buf = 138412290,
         long long v27 = @"expect searchable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    (*((void (**)(id, void, void, void))v14 + 2))(v14, 0, 0, 0);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__PSIDatabase_PSIQueryDelegate__group_fetchOwningContentString_assetIdRange_collectionIdRange_completionHandler___block_invoke;
  v17[3] = &unk_1E5873DE8;
  NSUInteger v22 = v9;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  id v18 = v13;
  id v19 = self;
  BOOL v25 = a4;
  id v20 = v14;
  NSUInteger v21 = v10;
  id v15 = v14;
  id v16 = v13;
  [(PSIDatabase *)self _inqAsync:v17];
}

void __113__PSIDatabase_PSIQueryDelegate__group_fetchOwningContentString_assetIdRange_collectionIdRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetIds];
  uint64_t v3 = [*(id *)(a1 + 32) collectionIds];
  unint64_t v4 = *(void *)(a1 + 64);
  unint64_t v5 = *(void *)(a1 + 80);
  if (v4 <= v5) {
    uint64_t v6 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 64);
  }
  [*(id *)(*(void *)(a1 + 40) + 32) prepareForNumberOfElements:v6];
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", v2, *(void *)(a1 + 56), *(void *)(a1 + 64), 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_6:
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_inqCollectionResultsForCollectionIds:range:", v3, *(void *)(a1 + 72), *(void *)(a1 + 80));
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = 0;
    if (v5) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:
  [*(id *)(*(void *)(a1 + 40) + 32) unprepare];
  if (*(unsigned char *)(a1 + 88))
  {
    id v8 = [*(id *)(a1 + 40) _inqOwningContentStringForGroupResult:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)suggestionWhitelistedScenes
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__107175;
  id v9 = __Block_byref_object_dispose__107176;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PSIDatabase_PSIQueryDelegate__suggestionWhitelistedScenes__block_invoke;
  v4[3] = &unk_1E5875E68;
  v4[4] = self;
  void v4[5] = &v5;
  [(PSIDatabase *)self _inqSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __60__PSIDatabase_PSIQueryDelegate__suggestionWhitelistedScenes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:@"SceneWhitelist"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)meNodeIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__107175;
  id v9 = __Block_byref_object_dispose__107176;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PSIDatabase_PSIQueryDelegate__meNodeIdentifier__block_invoke;
  v4[3] = &unk_1E5875E68;
  v4[4] = self;
  void v4[5] = &v5;
  [(PSIDatabase *)self _inqSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __49__PSIDatabase_PSIQueryDelegate__meNodeIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:@"MePersonUUID"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)wordEmbeddingMatchesForToken:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)groupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__107175;
  id v20 = __Block_byref_object_dispose__107176;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PSIDatabase_PSIQueryDelegate__groupResultWithDateFilter_datedTokens___block_invoke;
  v12[3] = &unk_1E5875368;
  id v15 = &v16;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(PSIDatabase *)self _inqSync:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __71__PSIDatabase_PSIQueryDelegate__groupResultWithDateFilter_datedTokens___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqGroupResultWithDateFilter:*(void *)(a1 + 40) datedTokens:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)groupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__107175;
  id v21 = __Block_byref_object_dispose__107176;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PSIDatabase_PSIQueryDelegate__groupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke;
  v12[3] = &unk_1E5873D70;
  id v14 = &v17;
  unint64_t v15 = a3;
  void v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  unint64_t v16 = a5;
  [(PSIDatabase *)self _inqSync:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __87__PSIDatabase_PSIQueryDelegate__groupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqGroupWithMatchingGroupId:*(void *)(a1 + 56) dateFilter:*(void *)(a1 + 40) searchResultTypes:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (__CFSet)groupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __84__PSIDatabase_PSIQueryDelegate__groupIdsMatchingString_categories_textIsSearchable___block_invoke;
  v14[3] = &unk_1E5873D98;
  uint64_t v17 = &v19;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  BOOL v18 = a5;
  [(PSIDatabase *)self _inqSync:v14];
  uint64_t v12 = (__CFSet *)CFAutorelease((CFTypeRef)v20[3]);

  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __84__PSIDatabase_PSIQueryDelegate__groupIdsMatchingString_categories_textIsSearchable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqNewGroupIdsMatchingString:*(void *)(a1 + 40) categories:*(void *)(a1 + 48) textIsSearchable:*(unsigned __int8 *)(a1 + 64)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)groupsFromGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__107175;
  uint64_t v21 = __Block_byref_object_dispose__107176;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PSIDatabase_PSIQueryDelegate__groupsFromGroupIds_dateFilter_searchResultTypes___block_invoke;
  v12[3] = &unk_1E5873D70;
  id v14 = &v17;
  id v15 = a3;
  void v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  unint64_t v16 = a5;
  [(PSIDatabase *)self _inqSync:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __81__PSIDatabase_PSIQueryDelegate__groupsFromGroupIds_dateFilter_searchResultTypes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqGroupsWithMatchingGroupIds:*(void *)(a1 + 56) dateFilter:*(void *)(a1 + 40) includeObjects:1 searchResultTypes:*(void *)(a1 + 64) matchingPredicateBlock:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)groupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__107175;
  uint64_t v28 = __Block_byref_object_dispose__107176;
  id v29 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__PSIDatabase_PSIQueryDelegate__groupArraysFromGroupIdSets_dateFilter_searchResultTypes_progressBlock___block_invoke;
  void v18[3] = &unk_1E5873D48;
  id v22 = &v24;
  void v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  unint64_t v23 = a5;
  id v15 = v12;
  id v21 = v15;
  [(PSIDatabase *)self _inqSync:v18];
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

void __103__PSIDatabase_PSIQueryDelegate__groupArraysFromGroupIdSets_dateFilter_searchResultTypes_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqGroupArraysFromGroupIdSets:*(void *)(a1 + 40) dateFilter:*(void *)(a1 + 48) searchResultTypes:*(void *)(a1 + 72) progressBlock:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v75 = (void (**)(id, void))a5;
  id v9 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Begin query execution: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v76 = [v8 searchText];
  uint64_t v74 = [v8 queryTokens];
  if ([v76 length] || objc_msgSend(v74, "count"))
  {
    id v10 = [(id)objc_opt_class() searchDatabaseLog];
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    id v12 = v10;
    id v13 = v12;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      [v8 bootstrap];
      id v15 = v13;
    }
    else
    {
      if (os_signpost_enabled(v12))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SearchIndex - executeQuery - queryBootstrap", "", (uint8_t *)&buf, 2u);
      }

      [v8 bootstrap];
      id v14 = v13;
      if (os_signpost_enabled(v14))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v11, "SearchIndex - executeQuery - queryBootstrap", "", (uint8_t *)&buf, 2u);
      }
    }

    id v16 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Process implicit tokenization: %@", (uint8_t *)&buf, 0xCu);
    }

    os_signpost_id_t v17 = os_signpost_id_generate(v13);
    BOOL v18 = v13;
    id v19 = v18;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      [v8 processImplicitTokenization];
      id v21 = v19;
    }
    else
    {
      if (os_signpost_enabled(v18))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchIndex - executeQuery - queryProcessImplicitTokenization", "", (uint8_t *)&buf, 2u);
      }

      [v8 processImplicitTokenization];
      id v20 = v19;
      if (os_signpost_enabled(v20))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v17, "SearchIndex - executeQuery - queryProcessImplicitTokenization", "", (uint8_t *)&buf, 2u);
      }
    }

    os_signpost_id_t v22 = os_signpost_id_generate(v19);
    unint64_t v23 = MEMORY[0x1E4F14500];
    id v24 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Photos Search PSIDatabase: process dates: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v25 = v19;
    uint64_t v26 = v25;
    if (v22 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      [v8 processDates];
      uint64_t v28 = v26;
    }
    else
    {
      if (os_signpost_enabled(v25))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SearchIndex - executeQuery - queryProcessDates", "", (uint8_t *)&buf, 2u);
      }

      [v8 processDates];
      long long v27 = v26;
      if (os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v27, OS_SIGNPOST_INTERVAL_END, v22, "SearchIndex - executeQuery - queryProcessDates", "", (uint8_t *)&buf, 2u);
      }
    }

    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_signpost_id_t v30 = os_signpost_id_generate(v26);
    uint64_t v31 = v26;
    uint64_t v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SearchIndex - executeQuery - queryEnumerateParses", "", (uint8_t *)&buf, 2u);
    }

    int v33 = [v8 implicitTokenizationIncludeBaseParseResults];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    if (v33) {
      uint64_t v34 = 6;
    }
    else {
      uint64_t v34 = 7;
    }
    uint64_t v114 = 0x3010000000;
    v115 = &unk_19BBAE189;
    long long v116 = xmmword_19BA99FE0;
    uint64_t v104 = 0;
    uint64_t v105 = &v104;
    uint64_t v106 = 0x3010000000;
    v107 = &unk_19BBAE189;
    long long v108 = xmmword_19BA99FE0;
    v102[0] = 0;
    v102[1] = v102;
    v102[2] = 0x2020000000;
    char v103 = 0;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke;
    v98[3] = &unk_1E5873C30;
    v100 = &v104;
    id v35 = v8;
    id v99 = v35;
    v101 = v102;
    [v35 enumerateParsesWithMode:2 usingBlock:v98];
    uint64_t v36 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v109 = 138412290;
      CFAbsoluteTime v110 = *(double *)&v35;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Enumerate parses for query: %@", v109, 0xCu);
    }

    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_953;
    v89[3] = &unk_1E5873CD0;
    p_long long buf = &buf;
    id v37 = v35;
    id v90 = v37;
    os_signpost_id_t v94 = v102;
    v95 = &v104;
    uint64_t v96 = v34;
    uint64_t v38 = v32;
    double v91 = v38;
    BOOL v97 = a4;
    id v39 = v29;
    id v92 = v39;
    [v37 enumerateParsesWithMode:1 usingBlock:v89];
    if ([v39 count])
    {
      if (*(void *)(*((void *)&buf + 1) + 40) == v105[5] && *(void *)(*((void *)&buf + 1) + 32) == v105[4]) {
        uint64_t v41 = 4;
      }
      else {
        uint64_t v41 = 6;
      }
    }
    else
    {
      uint64_t v41 = 6;
    }
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_954;
    v83[3] = &unk_1E5873CF8;
    uint64_t v42 = v38;
    v84 = v42;
    id v43 = v37;
    id v85 = v43;
    BOOL v88 = a4;
    id v44 = v39;
    id v86 = v44;
    uint64_t v87 = v41;
    [v43 enumerateParsesWithMode:v41 usingBlock:v83];
    uint64_t v45 = v42;
    uint64_t v46 = v45;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v46, OS_SIGNPOST_INTERVAL_END, v30, "SearchIndex - executeQuery - queryEnumerateParses", "", v109, 2u);
    }

    if ([v43 isCanceled])
    {
      uint64_t v47 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        CFAbsoluteTime v110 = *(double *)&v43;
        _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution", v109, 0xCu);
      }
    }
    else
    {
      char v48 = [v43 wordEmbeddingMode];
      __int16 v49 = [v43 wordEmbeddingMode];
      if ((v48 & 3) == 0 || (v49 & 0x100) != 0 && [v44 count]) {
        goto LABEL_66;
      }
      id v50 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        CFAbsoluteTime v110 = *(double *)&v43;
        _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_INFO, "Generating word embeddings for query: %@", v109, 0xCu);
      }

      id v51 = [(id)objc_opt_class() searchDatabaseLog];
      os_signpost_id_t v52 = os_signpost_id_generate(v51);
      uint64_t v53 = v51;
      uint64_t v54 = v53;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SearchDatabase - WordEmbeddings", "", v109, 2u);
      }

      [v43 processWordEmbeddings];
      if (([v43 isCanceled] & 1) == 0)
      {
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_955;
        v79[3] = &unk_1E5873D20;
        id v55 = v43;
        id v80 = v55;
        BOOL v82 = a4;
        id v81 = v44;
        [v55 enumerateParsesWithMode:8 usingBlock:v79];
        if (([v55 isCanceled] & 1) == 0) {
          [v55 computeSuggestions];
        }
      }
      long long v56 = v54;
      uint64_t v47 = v56;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v47, OS_SIGNPOST_INTERVAL_END, v52, "SearchDatabase - WordEmbeddings", "", v109, 2u);
      }
    }
LABEL_66:
    if ([v43 isCanceled])
    {
      long long v57 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        CFAbsoluteTime v110 = *(double *)&v43;
        _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution.", v109, 0xCu);
      }
    }
    else
    {
      id v78 = 0;
      +[PSIPostProcessor postProcessGroupResults:v44 dedupedGroupResults:&v78 query:v43];
      long long v58 = v78;
      long long v57 = v58;
      if (v58) {
        long long v59 = v58;
      }
      else {
        long long v59 = MEMORY[0x1E4F1CBF0];
      }
      [v43 setDedupedGroupResults:v59];
    }

    if (([v43 isCanceled] & 1) == 0 && objc_msgSend(v43, "numberOfNextKeywordSuggestionToProcess"))
    {
      id v60 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        CFAbsoluteTime v110 = *(double *)&v43;
        _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_INFO, "Generating next token suggestions for query: %@", v109, 0xCu);
      }

      id v61 = [(id)objc_opt_class() searchDatabaseLog];
      os_signpost_id_t v62 = os_signpost_id_generate(v61);
      __int16 v63 = v61;
      uint64_t v64 = v63;
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "SearchDatabase - NextKeywordSuggestions", "", v109, 2u);
      }

      double Current = CFAbsoluteTimeGetCurrent();
      [(PSIDatabase *)self _processNextKeywordSuggestionsForQuery:v43 groupResults:v44 allowIdentifiers:0];
      long long v66 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTime v67 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)v109 = 134349056;
        CFAbsoluteTime v110 = v67 - Current;
        _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_INFO, "Next Keyword Suggestions. Took %{public}f seconds.", v109, 0xCu);
      }

      long long v68 = v64;
      long long v69 = v68;
      if (v62 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v68))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v69, OS_SIGNPOST_INTERVAL_END, v62, "SearchDatabase - NextKeywordSuggestions", "", v109, 2u);
      }
    }
    if ([v43 isCanceled])
    {
      long long v70 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        CFAbsoluteTime v110 = *(double *)&v43;
        _os_log_impl(&dword_19B3C7000, v70, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution.", v109, 0xCu);
      }

      v75[2](v75, MEMORY[0x1E4F1CBF0]);
    }
    else
    {
      long long v71 = PLSearchBackendPSIDatabaseGetLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = [v44 count];
        *(_DWORD *)v109 = 138412546;
        CFAbsoluteTime v110 = *(double *)&v43;
        __int16 v111 = 2050;
        uint64_t v112 = v72;
        _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_INFO, "Query: %@ was executed with %{public}lu group results.", v109, 0x16u);
      }

      ((void (**)(id, id))v75)[2](v75, v44);
    }
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_957;
    v77[3] = &unk_1E5875CE0;
    v77[4] = self;
    [(PSIDatabase *)self _inqSync:v77];

    _Block_object_dispose(v102, 8);
    _Block_object_dispose(&v104, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_94;
  }
  long long v73 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_INFO, "Query is empty, returning from execution: %@", (uint8_t *)&buf, 0xCu);
  }

  v75[2](v75, MEMORY[0x1E4F1CBF0]);
LABEL_94:
}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() searchTextExtendedRangeForParse:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v9;
  unint64_t v10 = [v6 numberOfTokens];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10 > 6;
  *a4 = 1;
}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_953(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() searchTextExtendedRangeForParse:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    || (*(unsigned char *)(a1 + 80) & 1) != 0
    || ((uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8),
         uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8),
         uint64_t v13 = *(void *)(v10 + 32),
         uint64_t v12 = *(void *)(v10 + 40),
         uint64_t v15 = *(void *)(v11 + 32),
         uint64_t v14 = *(void *)(v11 + 40),
         v13 == v15)
      ? (BOOL v16 = v12 == v14)
      : (BOOL v16 = 0),
        v16))
  {
    os_signpost_id_t v17 = os_signpost_id_generate(*(os_log_t *)(a1 + 40));
    BOOL v18 = *(id *)(a1 + 40);
    id v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchIndex - executeQuery - queryProcessParse", "", (uint8_t *)&v26, 2u);
    }

    id v20 = [*(id *)(a1 + 32) processParse:v6 disableWildcardMatchesForUserControlledCategories:*(unsigned __int8 *)(a1 + 88)];
    id v21 = *(id *)(a1 + 40);
    os_signpost_id_t v22 = v21;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v17, "SearchIndex - executeQuery - queryProcessParse", "", (uint8_t *)&v26, 2u);
    }

    [*(id *)(a1 + 48) addObjectsFromArray:v20];
    unint64_t v23 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = [*(id *)(a1 + 48) count];
      int v26 = 138412546;
      uint64_t v27 = v24;
      __int16 v28 = 2050;
      uint64_t v29 = v25;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "Enumerate parses with mode base parse for query: %@ generated group results: %{public}lu", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    *a4 = 1;
  }
}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_954(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  os_signpost_id_t v5 = os_signpost_id_generate(v3);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SearchIndex - executeQuery - queryProcessParse", "", (uint8_t *)&v15, 2u);
  }

  uint64_t v8 = [*(id *)(a1 + 40) processParse:v4 disableWildcardMatchesForUserControlledCategories:*(unsigned __int8 *)(a1 + 64)];

  uint64_t v9 = *(id *)(a1 + 32);
  uint64_t v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v5, "SearchIndex - executeQuery - queryProcessParse", "", (uint8_t *)&v15, 2u);
  }

  [*(id *)(a1 + 48) addObjectsFromArray:v8];
  uint64_t v11 = PLSearchBackendPSIDatabaseGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 48) count];
    int v15 = 134349570;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2050;
    uint64_t v20 = v14;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Enumerate parses with mode %{public}lu for query: %@ generated group results: %{public}lu", (uint8_t *)&v15, 0x20u);
  }
}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_955(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) processParse:a2 disableWildcardMatchesForUserControlledCategories:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) addObjectsFromArray:v6];
  *a4 = [*(id *)(a1 + 32) isCanceled];
}

uint64_t __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_957(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqRecycleGroups];
}

- (void)executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (__CFString *)a3;
  id v8 = a5;
  if (((self->_options & 1) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)long long buf = 138412290,
         uint64_t v16 = @"expect searchable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) != 0))
    && self->_databaseIsValid)
  {
    uint64_t v13 = v7;
    id v14 = v8;
    pl_dispatch_sync();
  }
  else
  {
    uint64_t v9 = PLSearchBackendPSIDatabaseGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid) {
        uint64_t v10 = @"valid";
      }
      else {
        uint64_t v10 = @"invalid";
      }
      int64_t options = self->_options;
      *(_DWORD *)long long buf = 138412802;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      if (options) {
        uint64_t v12 = @"yes";
      }
      else {
        uint64_t v12 = @"no";
      }
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to execute search query: %@. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0]);
  }
}

uint64_t __111__PSIDatabase_PSIQueryDelegate__executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeQuery:*(void *)(a1 + 40) disableWildcardMatchesForUserControlledCategories:*(unsigned __int8 *)(a1 + 56) resultsHandler:*(void *)(a1 + 48)];
}

- (void)_executeQueryV2:(id)a3 resultsHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Begin query execution: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = [v6 searchText];
  uint64_t v10 = [v6 queryTokens];
  if ([v9 length] || objc_msgSend(v10, "count"))
  {
    [v6 bootstrap];
    [v6 processImplicitTokenization];
    [v6 processDates];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x3032000000;
    long long v58 = __Block_byref_object_copy__107175;
    long long v59 = __Block_byref_object_dispose__107176;
    id v60 = 0;
    uint64_t v47 = 0;
    char v48 = &v47;
    if ([v6 implicitTokenizationIncludeBaseParseResults]) {
      uint64_t v11 = 6;
    }
    else {
      uint64_t v11 = 7;
    }
    uint64_t v49 = 0x3010000000;
    id v50 = &unk_19BBAE189;
    long long v51 = xmmword_19BA99FE0;
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x3010000000;
    uint64_t v45 = &unk_19BBAE189;
    long long v46 = xmmword_19BA99FE0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke;
    v36[3] = &unk_1E5873C30;
    uint64_t v38 = &v42;
    id v12 = v6;
    id v37 = v12;
    id v39 = v40;
    [v12 enumerateParsesWithMode:2 usingBlock:v36];
    uint64_t v13 = [v12 queryBeginParsingTime];
    [v13 timeIntervalSinceNow];
    [v12 setElapsedTimeQueryParsing:0.0 - v14];

    int v15 = [MEMORY[0x1E4F1C9C8] now];
    [v12 setQueryBeginResultGenerationAndIntersectionsTime:v15];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_2;
    v29[3] = &unk_1E5873C58;
    uint64_t v31 = &v47;
    id v16 = v12;
    id v30 = v16;
    uint64_t v32 = v40;
    int v33 = &v42;
    p_long long buf = &buf;
    uint64_t v35 = v11;
    [v16 enumerateParsesWithMode:1 usingBlock:v29];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      if (v48[5] == v43[5] && v48[4] == v43[4]) {
        uint64_t v18 = 4;
      }
      else {
        uint64_t v18 = 6;
      }
    }
    else
    {
      uint64_t v18 = 6;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_949;
    v25[3] = &unk_1E5873C80;
    id v19 = v16;
    id v26 = v19;
    uint64_t v27 = &buf;
    uint64_t v28 = v18;
    [v19 enumerateParsesWithMode:v18 usingBlock:v25];
    if ([v19 isCanceled])
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v21 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)os_signpost_id_t v52 = 138412546;
        id v53 = v19;
        __int16 v54 = 2112;
        uint64_t v55 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Query: %@ was executed with search result %@.", v52, 0x16u);
      }

      uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    }
    v7[2](v7, v20);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_950;
    v24[3] = &unk_1E5875CE0;
    v24[4] = self;
    [(PSIDatabase *)self _inqSync:v24];

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    unint64_t v23 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "Query is empty, returning from execution: %@", (uint8_t *)&buf, 0xCu);
    }

    v7[2](v7, 0);
  }
}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() searchTextExtendedRangeForParse:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v9;
  unint64_t v10 = [v6 numberOfTokens];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10 > 6;
  *a4 = 1;
}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() searchTextExtendedRangeForParse:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (*(unsigned char *)(a1 + 72) & 1) != 0
    || ((uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8),
         uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8),
         uint64_t v13 = *(void *)(v10 + 32),
         uint64_t v12 = *(void *)(v10 + 40),
         uint64_t v15 = *(void *)(v11 + 32),
         uint64_t v14 = *(void *)(v11 + 40),
         v13 == v15)
      ? (BOOL v16 = v12 == v14)
      : (BOOL v16 = 0),
        v16))
  {
    __int16 v17 = [*(id *)(a1 + 32) processParseV2:v6];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v21 = *(void **)(v18 + 40);
    id v19 = (id *)(v18 + 40);
    uint64_t v20 = v21;
    if (v21) {
      [v20 mergeWithSearchResult:v17];
    }
    else {
      objc_storeStrong(v19, v17);
    }
    uint64_t v22 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v25 = 138412546;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Enumerate parses with mode base parse for query: %@ generated search result: %@", (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    *a4 = 1;
  }
}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_949(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) processParseV2:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  os_signpost_id_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    [v6 mergeWithSearchResult:v3];
  }
  else {
    objc_storeStrong(v5, v3);
  }
  uint64_t v8 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v12 = 134218498;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Enumerate parses with mode: %llu for query: %@ generated search result: %@", (uint8_t *)&v12, 0x20u);
  }
}

uint64_t __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_950(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqRecycleGroups];
}

- (void)executeQueryV2:(id)a3 resultsHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  [(__CFString *)v6 setQueryBeginParsingTime:v8];

  if (((self->_options & 1) != 0
     || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)long long buf = 138412290,
         __int16 v16 = @"expect searchable",
         _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) != 0))
    && self->_databaseIsValid)
  {
    uint64_t v13 = v6;
    id v14 = v7;
    pl_dispatch_sync();
  }
  else
  {
    uint64_t v9 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid) {
        uint64_t v10 = @"valid";
      }
      else {
        uint64_t v10 = @"invalid";
      }
      int64_t options = self->_options;
      *(_DWORD *)long long buf = 138412802;
      __int16 v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      if (options) {
        int v12 = @"yes";
      }
      else {
        int v12 = @"no";
      }
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to execute search query: %@. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __63__PSIDatabase_PSIQueryDelegate__executeQueryV2_resultsHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeQueryV2:*(void *)(a1 + 40) resultsHandler:*(void *)(a1 + 48)];
}

- (void)resetGroupsCache
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PSIDatabase_PSIQueryDelegate__resetGroupsCache__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PSIDatabase *)self _inqSync:v2];
}

uint64_t __49__PSIDatabase_PSIQueryDelegate__resetGroupsCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqRecycleGroups];
}

- (OS_dispatch_queue)groupResultsQueue
{
  return self->_groupResultsQueue;
}

@end