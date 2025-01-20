@interface MomentGraphService
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchUnvalidatedPromptSuggestionsWithFetchLimit:(int64_t)a3 reply:(id)a4;
- (void)generateMagicSlotSuggestionsWithOptions:(NSDictionary *)a3 reply:(id)a4;
- (void)performGraphIncrementalUpdateWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)performGraphRebuildWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)performGraphSearchEntityRankingDonationWithOperationID:(NSString *)a3 reply:(id)a4;
- (void)performLocalMemoryEnrichmentForMemoryCategory:(int64_t)a3 reply:(id)a4;
- (void)performLocalMemoryEnrichmentForUUIDs:(id)a3 reply:(id)a4;
- (void)performLocalMemoryEventElectionWithElectionMode:(NSString *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)performMemoryNodesRebuildForCategory:(int64_t)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)performPromptSuggestionCachingWithOperationID:(NSString *)a3 reply:(id)a4;
- (void)requestAssetSearchKeywordsForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)requestContextInfoWithConfigurationAsData:(NSData *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestExtendedTokenCollectionFromQueryTokensAsData:(NSData *)a3 representativeMomentUUIDByAssetUUID:(NSDictionary *)a4 personOrPetUUIDsWithNegativeFeedback:(NSSet *)a5 operationID:(NSString *)a6 reply:(id)a7;
- (void)requestGraphIsAvailableWithReply:(id)a3;
- (void)requestGraphSearchMetadataWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestGraphStatusWithReply:(id)a3;
- (void)requestLocationRetrievalResultsWithQueryTokenAsData:(NSData *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestMeaningsForMomentUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestPersonRelationshipByUUIDForPersonUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestPersonalEventAssetsForQueryTokenAsData:(NSData *)a3 associatedPersonUUID:(NSString *)a4 scopedAssetUUIDs:(NSSet *)a5 momentUUIDByAssetUUID:(NSDictionary *)a6 retrievalResultsByQueryTokenAsData:(NSData *)a7 operationID:(NSString *)a8 reply:(id)a9;
- (void)requestPersonalTraitsForAssetUUIDs:(NSArray *)a3 momentUUIDByAssetUUID:(NSDictionary *)a4 extendedTokenCollectionAsData:(NSData *)a5 configurationAsData:(NSData *)a6 operationID:(NSString *)a7 reply:(id)a8;
- (void)requestPersonalTraitsForAssetUUIDs:(NSArray *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestPersonalTraitsForHighlightUUIDs:(NSArray *)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestPrewarmQueryAnnotatorForOriginatorPID:(int64_t)a3 operationID:(NSString *)a4 reply:(id)a5;
- (void)requestQueryAnnotationForQuery:(NSString *)a3 originatorPID:(int64_t)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)requestSearchIndexKeywordsForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 operationID:(NSString *)a6 reply:(id)a7;
- (void)requestSynonymsDictionariesWithOperationID:(NSString *)a3 reply:(id)a4;
- (void)requestZeroKeywordsWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5;
@end

@implementation MomentGraphService

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_1D2425570();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1D2218734;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = v10;
  v14[6] = sub_1D221873C;
  v14[7] = v12;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1D21F6270((uint64_t)v8, (uint64_t)&unk_1EA683B10, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)performGraphRebuildWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683AF8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683B00;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683B08, (uint64_t)v16);
  swift_release();
}

- (void)performGraphIncrementalUpdateWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683AD8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683AE0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683AE8, (uint64_t)v16);
  swift_release();
}

- (void)performMemoryNodesRebuildForCategory:(int64_t)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683AB8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683AC0;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683AC8, (uint64_t)v16);
  swift_release();
}

- (void)performLocalMemoryEventElectionWithElectionMode:(NSString *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683A98;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683AA0;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683AA8, (uint64_t)v16);
  swift_release();
}

- (void)performLocalMemoryEnrichmentForUUIDs:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1D2425570();
  _Block_copy(v5);
  swift_retain();
  sub_1D22EDF1C(v6, (uint64_t)self, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)performLocalMemoryEnrichmentForMemoryCategory:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_retain();
  sub_1D22EE114(a3, (uint64_t)self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

- (void)requestGraphStatusWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA683A78;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA683A80;
  v12[5] = v11;
  swift_retain();
  sub_1D2319190((uint64_t)v7, (uint64_t)&unk_1EA683A88, (uint64_t)v12);
  swift_release();
}

- (void)requestGraphIsAvailableWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA683A58;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA683A60;
  v12[5] = v11;
  swift_retain();
  sub_1D2319190((uint64_t)v7, (uint64_t)&unk_1EA683A68, (uint64_t)v12);
  swift_release();
}

- (void)generateMagicSlotSuggestionsWithOptions:(NSDictionary *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA683A38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA683A40;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA683A48, (uint64_t)v14);
  swift_release();
}

- (void)requestZeroKeywordsWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683A18;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683A20;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683A28, (uint64_t)v16);
  swift_release();
}

- (void)requestSynonymsDictionariesWithOperationID:(NSString *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA6839F8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA683A00;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA683A08, (uint64_t)v14);
  swift_release();
}

- (void)requestGraphSearchMetadataWithOptions:(NSDictionary *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6839D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6839E0;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA6839E8, (uint64_t)v16);
  swift_release();
}

- (void)requestSearchIndexKeywordsForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA6839B8;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA6839C0;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA6839C8, (uint64_t)v18);
  swift_release();
}

- (void)requestAssetSearchKeywordsForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA683998;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA6839A0;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA6839A8, (uint64_t)v18);
  swift_release();
}

- (void)requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:(NSArray *)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 operationID:(NSString *)a6 reply:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA683978;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EA683980;
  v20[5] = v19;
  uint64_t v21 = a3;
  v22 = a6;
  swift_retain();
  sub_1D2319190((uint64_t)v15, (uint64_t)&unk_1EA683988, (uint64_t)v20);
  swift_release();
}

- (void)performGraphSearchEntityRankingDonationWithOperationID:(NSString *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA683958;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA683960;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA683968, (uint64_t)v14);
  swift_release();
}

- (void)requestContextInfoWithConfigurationAsData:(NSData *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683938;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683940;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683948, (uint64_t)v16);
  swift_release();
}

- (void)requestExtendedTokenCollectionFromQueryTokensAsData:(NSData *)a3 representativeMomentUUIDByAssetUUID:(NSDictionary *)a4 personOrPetUUIDsWithNegativeFeedback:(NSSet *)a5 operationID:(NSString *)a6 reply:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA683918;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EA683920;
  v20[5] = v19;
  uint64_t v21 = a3;
  v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  swift_retain();
  sub_1D2319190((uint64_t)v15, (uint64_t)&unk_1EA683928, (uint64_t)v20);
  swift_release();
}

- (void)requestMeaningsForMomentUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6838F8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683900;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683908, (uint64_t)v16);
  swift_release();
}

- (void)requestPersonalTraitsForAssetUUIDs:(NSArray *)a3 momentUUIDByAssetUUID:(NSDictionary *)a4 extendedTokenCollectionAsData:(NSData *)a5 configurationAsData:(NSData *)a6 operationID:(NSString *)a7 reply:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EA6838D8;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA6838E0;
  v22[5] = v21;
  uint64_t v23 = a3;
  v24 = a4;
  uint64_t v25 = a5;
  v26 = a6;
  v27 = a7;
  swift_retain();
  sub_1D2319190((uint64_t)v17, (uint64_t)&unk_1EA6838E8, (uint64_t)v22);
  swift_release();
}

- (void)requestPersonalEventAssetsForQueryTokenAsData:(NSData *)a3 associatedPersonUUID:(NSString *)a4 scopedAssetUUIDs:(NSSet *)a5 momentUUIDByAssetUUID:(NSDictionary *)a6 retrievalResultsByQueryTokenAsData:(NSData *)a7 operationID:(NSString *)a8 reply:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a9);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  uint64_t v21 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA6838B8;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA6838C0;
  v23[5] = v22;
  v24 = a3;
  uint64_t v25 = a4;
  v26 = a5;
  v27 = a6;
  uint64_t v28 = a7;
  v29 = a8;
  swift_retain();
  sub_1D2319190((uint64_t)v18, (uint64_t)&unk_1EA6838C8, (uint64_t)v23);
  swift_release();
}

- (void)requestLocationRetrievalResultsWithQueryTokenAsData:(NSData *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683898;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6838A0;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA6838A8, (uint64_t)v16);
  swift_release();
}

- (void)requestPersonRelationshipByUUIDForPersonUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683878;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683880;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683888, (uint64_t)v16);
  swift_release();
}

- (void)requestPrewarmQueryAnnotatorForOriginatorPID:(int64_t)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683858;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683860;
  v16[5] = v15;
  uint64_t v17 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683868, (uint64_t)v16);
  swift_release();
}

- (void)requestQueryAnnotationForQuery:(NSString *)a3 originatorPID:(int64_t)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA683838;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA683840;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA683848, (uint64_t)v18);
  swift_release();
}

- (void)requestPersonalTraitsForAssetUUIDs:(NSArray *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA683818;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA683820;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683828, (uint64_t)v16);
  swift_release();
}

- (void)requestPersonalTraitsForHighlightUUIDs:(NSArray *)a3 operationID:(NSString *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6837F0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6837F8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA683800, (uint64_t)v16);
  swift_release();
}

- (void)performPromptSuggestionCachingWithOperationID:(NSString *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA6837D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA6837D8;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA6837E0, (uint64_t)v14);
  swift_release();
}

- (void)fetchUnvalidatedPromptSuggestionsWithFetchLimit:(int64_t)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA6837B0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA681AE8;
  v14[5] = v13;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA6837C0, (uint64_t)v14);
  swift_release();
}

@end