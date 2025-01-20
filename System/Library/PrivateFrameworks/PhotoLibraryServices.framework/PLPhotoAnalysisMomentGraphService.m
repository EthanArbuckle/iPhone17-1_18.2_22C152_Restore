@interface PLPhotoAnalysisMomentGraphService
- (PLPhotoAnalysisMomentGraphService)initWithServiceProvider:(id)a3;
- (id)graphStatusWithError:(id *)a3;
- (id)requestAssetSearchKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 operationID:(id)a5 error:(id *)a6;
- (id)requestGraphSearchMetadataWithOptions:(id)a3 operationID:(id)a4 error:(id *)a5;
- (id)requestSearchIndexKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 operationID:(id)a5 error:(id *)a6;
- (id)requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 operationID:(id)a6 error:(id *)a7;
- (id)requestSynonymsDictionariesWithOperationID:(id)a3 error:(id *)a4;
- (id)requestZeroKeywordsWithOptions:(id)a3 operationID:(id)a4 error:(id *)a5;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchUnvalidatedPromptSuggestionsWithFetchLimit:(int64_t)a3 reply:(id)a4;
- (void)generateMagicSlotSuggestionsWithOptions:(id)a3 reply:(id)a4;
- (void)performGraphIncrementalUpdateWithOptions:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)performGraphRebuildWithOptions:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)performGraphSearchEntityRankingDonationWithOperationID:(id)a3 reply:(id)a4;
- (void)performLocalMemoryEnrichmentForMemoryCategory:(unint64_t)a3 reply:(id)a4;
- (void)performLocalMemoryEnrichmentForUUIDs:(id)a3 reply:(id)a4;
- (void)performLocalMemoryEventElectionWithElectionMode:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)performMemoryNodesRebuildForCategory:(unint64_t)a3 operationID:(id)a4 reply:(id)a5;
- (void)performPromptSuggestionCachingWithOperationID:(id)a3 reply:(id)a4;
- (void)requestContextInfoWithConfigurationAsData:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestExtendedTokenCollectionFromQueryTokensAsData:(id)a3 representativeMomentUUIDByAssetUUID:(id)a4 personOrPetUUIDsWithNegativeFeedback:(id)a5 operationID:(id)a6 reply:(id)a7;
- (void)requestGraphIsAvailableWithReply:(id)a3;
- (void)requestLocationRetrievalResultsWithQueryTokenAsData:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestMeaningsForMomentUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestPersonRelationshipByUUIDForPersonUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestPersonalEventAssetsForQueryTokenAsData:(id)a3 associatedPersonUUID:(id)a4 scopedAssetUUIDs:(id)a5 momentUUIDByAssetUUID:(id)a6 retrievalResultsByQueryTokenAsData:(id)a7 operationID:(id)a8 reply:(id)a9;
- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 momentUUIDByAssetUUID:(id)a4 extendedTokenCollectionAsData:(id)a5 configurationAsData:(id)a6 operationID:(id)a7 reply:(id)a8;
- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestPersonalTraitsForHighlightUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestPrewarmQueryAnnotatorForOriginatorPID:(int64_t)a3 operationID:(id)a4 reply:(id)a5;
- (void)requestQueryAnnotationForQuery:(id)a3 originatorPID:(int64_t)a4 operationID:(id)a5 reply:(id)a6;
@end

@implementation PLPhotoAnalysisMomentGraphService

- (void).cxx_destruct
{
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PLPhotoAnalysisMomentGraphService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v15[3] = &unk_1E58734E8;
  id v16 = v6;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PLPhotoAnalysisMomentGraphService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v13[3] = &unk_1E586F9A0;
  id v14 = v9;
  id v12 = v9;
  [v11 cancelOperationsWithIdentifiers:v10 reply:v13];
}

void __75__PLPhotoAnalysisMomentGraphService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__PLPhotoAnalysisMomentGraphService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateMagicSlotSuggestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsWithOptions_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E5874DE8;
  id v14 = v10;
  id v12 = v10;
  [v11 generateMagicSlotSuggestionsWithOptions:v8 reply:v13];
}

uint64_t __83__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestLocationRetrievalResultsWithQueryTokenAsData:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5861DC0;
  id v17 = v13;
  id v15 = v13;
  [v14 requestLocationRetrievalResultsWithQueryTokenAsData:v11 operationID:v10 reply:v16];
}

uint64_t __107__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __107__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestQueryAnnotationForQuery:(id)a3 originatorPID:(int64_t)a4 operationID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  serviceProvider = self->_serviceProvider;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_operationID_reply___block_invoke;
  v20[3] = &unk_1E5874D70;
  id v15 = v10;
  id v21 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_operationID_reply___block_invoke_2;
  v18[3] = &unk_1E5861DC0;
  id v19 = v15;
  id v17 = v15;
  [v16 requestQueryAnnotationForQuery:v13 originatorPID:a4 operationID:v12 reply:v18];
}

uint64_t __100__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPrewarmQueryAnnotatorForOriginatorPID:(int64_t)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_operationID_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_operationID_reply___block_invoke_2;
  v15[3] = &unk_1E5874D70;
  id v16 = v12;
  id v14 = v12;
  [v13 requestPrewarmQueryAnnotatorForOriginatorPID:a3 operationID:v10 reply:v15];
}

uint64_t __100__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUnvalidatedPromptSuggestionsWithFetchLimit:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke;
  v13[3] = &unk_1E5874D70;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke_2;
  v11[3] = &unk_1E5861DC0;
  id v12 = v8;
  id v10 = v8;
  [v9 fetchUnvalidatedPromptSuggestionsWithFetchLimit:a3 reply:v11];
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPromptSuggestionCachingWithOperationID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithOperationID_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithOperationID_reply___block_invoke_2;
  v13[3] = &unk_1E5874D70;
  id v14 = v10;
  id v12 = v10;
  [v11 performPromptSuggestionCachingWithOperationID:v8 reply:v13];
}

uint64_t __89__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithOperationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithOperationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5869480;
  id v17 = v13;
  id v15 = v13;
  [v14 requestPersonalTraitsForAssetUUIDs:v11 operationID:v10 reply:v16];
}

uint64_t __90__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonalTraitsForHighlightUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5869480;
  id v17 = v13;
  id v15 = v13;
  [v14 requestPersonalTraitsForHighlightUUIDs:v11 operationID:v10 reply:v16];
}

uint64_t __94__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonRelationshipByUUIDForPersonUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__PLPhotoAnalysisMomentGraphService_requestPersonRelationshipByUUIDForPersonUUIDs_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__PLPhotoAnalysisMomentGraphService_requestPersonRelationshipByUUIDForPersonUUIDs_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D98;
  id v17 = v13;
  id v15 = v13;
  [v14 requestPersonRelationshipByUUIDForPersonUUIDs:v11 operationID:v10 reply:v16];
}

uint64_t __101__PLPhotoAnalysisMomentGraphService_requestPersonRelationshipByUUIDForPersonUUIDs_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__PLPhotoAnalysisMomentGraphService_requestPersonRelationshipByUUIDForPersonUUIDs_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonalEventAssetsForQueryTokenAsData:(id)a3 associatedPersonUUID:(id)a4 scopedAssetUUIDs:(id)a5 momentUUIDByAssetUUID:(id)a6 retrievalResultsByQueryTokenAsData:(id)a7 operationID:(id)a8 reply:(id)a9
{
  id v16 = a9;
  serviceProvider = self->_serviceProvider;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __196__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_operationID_reply___block_invoke;
  v30[3] = &unk_1E5874D70;
  id v25 = v16;
  id v31 = v25;
  v26 = [v24 remoteObjectProxyWithErrorHandler:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __196__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_operationID_reply___block_invoke_2;
  v28[3] = &unk_1E5861DC0;
  id v29 = v25;
  id v27 = v25;
  [v26 requestPersonalEventAssetsForQueryTokenAsData:v23 associatedPersonUUID:v22 scopedAssetUUIDs:v21 momentUUIDByAssetUUID:v20 retrievalResultsByQueryTokenAsData:v19 operationID:v18 reply:v28];
}

uint64_t __196__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __196__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 momentUUIDByAssetUUID:(id)a4 extendedTokenCollectionAsData:(id)a5 configurationAsData:(id)a6 operationID:(id)a7 reply:(id)a8
{
  id v14 = a8;
  serviceProvider = self->_serviceProvider;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __162__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_operationID_reply___block_invoke;
  v27[3] = &unk_1E5874D70;
  id v22 = v14;
  id v28 = v22;
  id v23 = [v21 remoteObjectProxyWithErrorHandler:v27];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __162__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_operationID_reply___block_invoke_2;
  v25[3] = &unk_1E5861DC0;
  id v26 = v22;
  id v24 = v22;
  [v23 requestPersonalTraitsForAssetUUIDs:v20 momentUUIDByAssetUUID:v19 extendedTokenCollectionAsData:v18 configurationAsData:v17 operationID:v16 reply:v25];
}

uint64_t __162__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __162__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMeaningsForMomentUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D98;
  id v17 = v13;
  id v15 = v13;
  [v14 requestMeaningsForMomentUUIDs:v11 operationID:v10 reply:v16];
}

uint64_t __85__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestExtendedTokenCollectionFromQueryTokensAsData:(id)a3 representativeMomentUUIDByAssetUUID:(id)a4 personOrPetUUIDsWithNegativeFeedback:(id)a5 operationID:(id)a6 reply:(id)a7
{
  id v12 = a7;
  serviceProvider = self->_serviceProvider;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __180__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionFromQueryTokensAsData_representativeMomentUUIDByAssetUUID_personOrPetUUIDsWithNegativeFeedback_operationID_reply___block_invoke;
  v24[3] = &unk_1E5874D70;
  id v19 = v12;
  id v25 = v19;
  id v20 = [v18 remoteObjectProxyWithErrorHandler:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __180__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionFromQueryTokensAsData_representativeMomentUUIDByAssetUUID_personOrPetUUIDsWithNegativeFeedback_operationID_reply___block_invoke_2;
  v22[3] = &unk_1E5861DC0;
  id v23 = v19;
  id v21 = v19;
  [v20 requestExtendedTokenCollectionFromQueryTokensAsData:v17 representativeMomentUUIDByAssetUUID:v16 personOrPetUUIDsWithNegativeFeedback:v15 operationID:v14 reply:v22];
}

uint64_t __180__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionFromQueryTokensAsData_representativeMomentUUIDByAssetUUID_personOrPetUUIDsWithNegativeFeedback_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __180__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionFromQueryTokensAsData_representativeMomentUUIDByAssetUUID_personOrPetUUIDsWithNegativeFeedback_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestContextInfoWithConfigurationAsData:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5861DC0;
  id v17 = v13;
  id v15 = v13;
  [v14 requestContextInfoWithConfigurationAsData:v11 operationID:v10 reply:v16];
}

uint64_t __97__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performGraphSearchEntityRankingDonationWithOperationID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithOperationID_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithOperationID_reply___block_invoke_2;
  v13[3] = &unk_1E5874D70;
  id v14 = v10;
  id v12 = v10;
  [v11 performGraphSearchEntityRankingDonationWithOperationID:v8 reply:v13];
}

uint64_t __98__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithOperationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithOperationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 operationID:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__194;
  v30 = __Block_byref_object_dispose__195;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__194;
  id v24 = __Block_byref_object_dispose__195;
  id v25 = 0;
  id v14 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __141__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_operationID_error___block_invoke;
  v19[3] = &unk_1E5874CF8;
  v19[4] = &v20;
  id v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __141__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_operationID_error___block_invoke_2;
  v18[3] = &unk_1E5874D48;
  void v18[4] = &v26;
  v18[5] = &v20;
  [v15 requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:v12 ofType:a4 isFullAnalysis:v9 operationID:v13 reply:v18];

  if (a7) {
    *a7 = (id) v21[5];
  }
  id v16 = (id)v27[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __141__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __141__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetSearchKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 operationID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__194;
  uint64_t v28 = __Block_byref_object_dispose__195;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__194;
  uint64_t v22 = __Block_byref_object_dispose__195;
  id v23 = 0;
  id v12 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v18;
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke_2;
  v16[3] = &unk_1E5874D48;
  void v16[4] = &v24;
  v16[5] = &v18;
  [v13 requestAssetSearchKeywordsForAssetCollectionUUIDs:v10 ofType:a4 operationID:v11 reply:v16];

  if (a6) {
    *a6 = (id) v19[5];
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __112__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __112__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSearchIndexKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 operationID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__194;
  uint64_t v28 = __Block_byref_object_dispose__195;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__194;
  uint64_t v22 = __Block_byref_object_dispose__195;
  id v23 = 0;
  id v12 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v18;
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke_2;
  v16[3] = &unk_1E5874D48;
  void v16[4] = &v24;
  v16[5] = &v18;
  [v13 requestSearchIndexKeywordsForAssetCollectionUUIDs:v10 ofType:a4 operationID:v11 reply:v16];

  if (a6) {
    *a6 = (id) v19[5];
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __112__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __112__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGraphSearchMetadataWithOptions:(id)a3 operationID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__194;
  uint64_t v26 = __Block_byref_object_dispose__195;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__194;
  uint64_t v20 = __Block_byref_object_dispose__195;
  id v21 = 0;
  id v10 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_operationID_error___block_invoke;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v16;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_operationID_error___block_invoke_2;
  v14[3] = &unk_1E5874D48;
  v14[4] = &v22;
  v14[5] = &v16;
  [v11 requestGraphSearchMetadataWithOptions:v8 operationID:v9 reply:v14];

  if (a5) {
    *a5 = (id) v17[5];
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __93__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __93__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSynonymsDictionariesWithOperationID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__194;
  id v23 = __Block_byref_object_dispose__195;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__194;
  id v17 = __Block_byref_object_dispose__195;
  id v18 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithOperationID_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  v12[4] = &v13;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithOperationID_error___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v8 requestSynonymsDictionariesWithOperationID:v6 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __86__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithOperationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __86__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithOperationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestZeroKeywordsWithOptions:(id)a3 operationID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__194;
  uint64_t v26 = __Block_byref_object_dispose__195;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__194;
  uint64_t v20 = __Block_byref_object_dispose__195;
  id v21 = 0;
  id v10 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_operationID_error___block_invoke;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v16;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_operationID_error___block_invoke_2;
  v14[3] = &unk_1E5874D48;
  v14[4] = &v22;
  v14[5] = &v16;
  [v11 requestZeroKeywordsWithOptions:v8 operationID:v9 reply:v14];

  if (a5) {
    *a5 = (id) v17[5];
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __86__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __86__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestGraphIsAvailableWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PLPhotoAnalysisMomentGraphService_requestGraphIsAvailableWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PLPhotoAnalysisMomentGraphService_requestGraphIsAvailableWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DC0;
  id v10 = v6;
  id v8 = v6;
  [v7 requestGraphIsAvailableWithReply:v9];
}

uint64_t __70__PLPhotoAnalysisMomentGraphService_requestGraphIsAvailableWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__PLPhotoAnalysisMomentGraphService_requestGraphIsAvailableWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)graphStatusWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__194;
  id v21 = __Block_byref_object_dispose__195;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__194;
  uint64_t v15 = __Block_byref_object_dispose__195;
  id v16 = 0;
  id v4 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v11;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke_2;
  v9[3] = &unk_1E5874D48;
  void v9[4] = &v17;
  v9[5] = &v11;
  [v5 requestGraphStatusWithReply:v9];

  if (a3) {
    *a3 = (id) v12[5];
  }
  if (v18[5])
  {
    id v6 = [PLPhotosKnowledgeGraphAvailabilityStatus alloc];
    uint64_t v7 = [(PLPhotosKnowledgeGraphAvailabilityStatus *)v6 initWithDictionary:v18[5]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)performLocalMemoryEnrichmentForMemoryCategory:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider momentGraphService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke;
  v13[3] = &unk_1E5874D70;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke_2;
  v11[3] = &unk_1E5869480;
  id v12 = v8;
  id v10 = v8;
  [v9 performLocalMemoryEnrichmentForMemoryCategory:a3 reply:v11];
}

uint64_t __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performLocalMemoryEnrichmentForUUIDs:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke_2;
  v13[3] = &unk_1E5869480;
  id v14 = v10;
  id v12 = v10;
  [v11 performLocalMemoryEnrichmentForUUIDs:v8 reply:v13];
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performLocalMemoryEventElectionWithElectionMode:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D70;
  id v17 = v13;
  id v15 = v13;
  [v14 performLocalMemoryEventElectionWithElectionMode:v11 operationID:v10 reply:v16];
}

uint64_t __103__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performMemoryNodesRebuildForCategory:(unint64_t)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_operationID_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_operationID_reply___block_invoke_2;
  v15[3] = &unk_1E5874D70;
  id v16 = v12;
  id v14 = v12;
  [v13 performMemoryNodesRebuildForCategory:a3 operationID:v10 reply:v15];
}

uint64_t __92__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performGraphIncrementalUpdateWithOptions:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D70;
  id v17 = v13;
  id v15 = v13;
  [v14 performGraphIncrementalUpdateWithOptions:v11 operationID:v10 reply:v16];
}

uint64_t __96__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performGraphRebuildWithOptions:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider momentGraphService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D70;
  id v17 = v13;
  id v15 = v13;
  [v14 performGraphRebuildWithOptions:v11 operationID:v10 reply:v16];
}

uint64_t __86__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PLPhotoAnalysisMomentGraphService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisMomentGraphService;
  id v6 = [(PLPhotoAnalysisMomentGraphService *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v7;
}

@end