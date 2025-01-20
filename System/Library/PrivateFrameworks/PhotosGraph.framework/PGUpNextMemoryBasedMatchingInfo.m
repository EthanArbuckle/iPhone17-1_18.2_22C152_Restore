@interface PGUpNextMemoryBasedMatchingInfo
+ (id)matchingInfosWithMemoryNodes:(id)a3;
- (BOOL)_implIsTripMemory;
- (NSString)debugInfo;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMemoryNodeCollection)memoryNodeAsCollection;
- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3;
- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4;
- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4 personNodes:(id)a5 sceneNodes:(id)a6 meaningNodes:(id)a7 isTripMemory:(BOOL)a8 representativeLocation:(id)a9 representativeDate:(id)a10 memoryFeatureNodes:(id)a11;
- (unint64_t)nodeIdentifier;
@end

@implementation PGUpNextMemoryBasedMatchingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
}

- (PGGraphMemoryNodeCollection)memoryNodeAsCollection
{
  return self->_memoryNodeAsCollection;
}

- (NSString)debugInfo
{
  v2 = NSString;
  v3 = [(PGGraphMemoryNodeCollection *)self->_memoryNodeAsCollection uniqueMemoryIdentifiers];
  v4 = [v3 anyObject];
  v5 = [v2 stringWithFormat:@"Memory unique identifier %@", v4];

  return (NSString *)v5;
}

- (BOOL)_implIsTripMemory
{
  v2 = [(MANodeCollection *)self->_memoryNodeAsCollection labels];
  v3 = +[PGGraphBuilder memoryLabelForCategory:19];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  memoryFeatureNodes = self->_memoryFeatureNodes;
  if (!memoryFeatureNodes)
  {
    char v4 = [(PGGraphMemoryNodeCollection *)self->_memoryNodeAsCollection featureNodes];
    v5 = [(MAElementCollection *)self->_memoryNodeAsCollection graph];
    v6 = +[PGGraphNodeCollection nodesInGraph:v5];
    v7 = [v4 collectionBySubtracting:v6];

    v8 = self->_memoryFeatureNodes;
    self->_memoryFeatureNodes = v7;

    memoryFeatureNodes = self->_memoryFeatureNodes;
  }
  return memoryFeatureNodes;
}

- (unint64_t)nodeIdentifier
{
  v2 = [(MAElementCollection *)self->_memoryNodeAsCollection elementIdentifiers];
  unint64_t v3 = [v2 firstElement];

  return v3;
}

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  v8 = [(PGUpNextMomentCollectionBasedMatchingInfo *)&v11 initWithMomentNodes:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_memoryNodeAsCollection, a3);
  }

  return v9;
}

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4 personNodes:(id)a5 sceneNodes:(id)a6 meaningNodes:(id)a7 isTripMemory:(BOOL)a8 representativeLocation:(id)a9 representativeDate:(id)a10 memoryFeatureNodes:(id)a11
{
  BOOL v11 = a8;
  id v22 = a3;
  id v21 = a11;
  v23.receiver = self;
  v23.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  v18 = [(PGUpNextMomentCollectionBasedMatchingInfo *)&v23 initWithMomentNodes:a4 personNodes:a5 sceneNodes:a6 meaningNodes:a7 isTripMemory:v11 representativeLocation:a9 representativeDate:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_memoryNodeAsCollection, a3);
    objc_storeStrong((id *)&v19->_memoryFeatureNodes, a11);
  }

  return v19;
}

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3
{
  id v5 = a3;
  v6 = [v5 momentNodes];
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  id v7 = [(PGUpNextMomentCollectionBasedMatchingInfo *)&v9 initWithMomentNodes:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_memoryNodeAsCollection, a3);
  }

  return v7;
}

+ (id)matchingInfosWithMemoryNodes:(id)a3
{
  v78[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 graph];
  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = (void *)MEMORY[0x1E4F71E88];
  v6 = +[PGGraphMemoryNode momentOfMemory];
  id v7 = self;
  v60 = [v5 adjacencyWithSources:v3 relation:v6 targetsClass:v7];

  v8 = [v60 targets];
  objc_super v9 = (void *)MEMORY[0x1E4F71E88];
  v10 = +[PGGraphMomentNode personExcludingMeInMoment];
  BOOL v11 = self;
  v55 = [v9 adjacencyWithSources:v8 relation:v10 targetsClass:v11];

  v12 = (void *)MEMORY[0x1E4F71E88];
  v13 = +[PGGraphMomentNode sceneOfMoment];
  v14 = self;
  v53 = [v12 adjacencyWithSources:v8 relation:v13 targetsClass:v14];

  v15 = (void *)MEMORY[0x1E4F71E88];
  v16 = +[PGGraphMomentNode meaningOfMoment];
  v17 = self;
  v18 = [v15 adjacencyWithSources:v8 relation:v16 targetsClass:v17];

  v19 = @"Gathering";
  v78[0] = @"Gathering";
  v20 = @"HolidayEvent";
  v78[1] = @"HolidayEvent";
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];

  v56 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v59 inGraph:v4];
  v52 = [v18 subtractingTargetsWith:v56];

  id v21 = (void *)MEMORY[0x1E4F71E88];
  id v22 = +[PGGraphMomentNode addressOfMoment];
  objc_super v23 = self;
  v24 = [v21 adjacencyWithSources:v8 relation:v22 targetsClass:v23];

  v25 = (void *)MEMORY[0x1E4F71E88];
  v26 = +[PGGraphMemoryNode featureOfMemory];
  v27 = self;
  v28 = [v25 adjacencyWithSources:v3 relation:v26 targetsClass:v27];

  v54 = (void *)v4;
  v29 = +[PGGraphNodeCollection nodesInGraph:v4];
  v30 = [v29 featureNodeCollection];
  v31 = [v28 subtractingTargetsWith:v30];

  v32 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:19 inGraph:v4];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v34 = [v24 targets];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke;
  v76[3] = &unk_1E68EFB10;
  id v35 = v33;
  id v77 = v35;
  [v34 enumerateNodesUsingBlock:v76];

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_2;
  v74[3] = &unk_1E68EFB38;
  id v37 = v36;
  id v75 = v37;
  [v8 enumerateUniversalStartDatesUsingBlock:v74];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_3;
  v72[3] = &unk_1E68EFB38;
  id v39 = v38;
  id v73 = v39;
  [v8 enumerateUniversalEndDatesUsingBlock:v72];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_4;
  v61[3] = &unk_1E68EFB88;
  id v62 = v55;
  id v63 = v53;
  id v64 = v52;
  id v65 = v24;
  id v66 = v35;
  id v67 = v32;
  id v68 = v37;
  id v69 = v39;
  id v70 = v31;
  id v40 = v57;
  id v71 = v40;
  id v58 = v31;
  id v41 = v39;
  id v42 = v37;
  id v51 = v32;
  id v50 = v35;
  id v49 = v24;
  id v43 = v52;
  id v44 = v53;
  id v45 = v55;
  [v60 enumerateTargetsBySourceWithBlock:v61];
  v46 = v71;
  id v47 = v40;

  return v47;
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 location];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  uint64_t v6 = [v3 identifier];

  id v7 = [v5 numberWithUnsignedInteger:v6];
  [v4 setObject:v8 forKeyedSubscript:v7];
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v7];
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v7];
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] intersectingSourcesWith:v6];
  uint64_t v8 = [a1[5] intersectingSourcesWith:v6];
  uint64_t v9 = [a1[6] intersectingSourcesWith:v6];
  v10 = [a1[7] targetsForSources:v6];
  v30 = +[PGUpNextMomentCollectionBasedMatchingInfo representativePersonNodesForPersonNodesByMomentNode:v7];
  v29 = +[PGUpNextMomentCollectionBasedMatchingInfo representativeSceneNodesForSceneNodesByMomentNode:v8];
  v27 = (void *)v9;
  v28 = +[PGUpNextMomentCollectionBasedMatchingInfo representativeMeaningNodesForEligibleMeaningNodesByMomentNode:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26 = v10;
  v12 = [v10 elementIdentifiers];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_5;
  v48[3] = &unk_1E68EFDD8;
  id v49 = a1[8];
  id v13 = v11;
  id v50 = v13;
  [v12 enumerateIdentifiersWithBlock:v48];

  v14 = [a1[9] elementIdentifiers];
  v15 = [v5 elementIdentifiers];
  uint64_t v16 = objc_msgSend(v14, "containsIdentifier:", objc_msgSend(v15, "firstElement"));

  v17 = +[PGUpNextMomentCollectionBasedMatchingInfo representativeLocationForLocations:v13];
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__69598;
  v46 = __Block_byref_object_dispose__69599;
  id v47 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__69598;
  id v40 = __Block_byref_object_dispose__69599;
  id v41 = [MEMORY[0x1E4F1C9C8] distantPast];
  v18 = [v6 elementIdentifiers];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_141;
  v31[3] = &unk_1E68EFB60;
  v34 = &v42;
  id v32 = a1[10];
  id v35 = &v36;
  id v33 = a1[11];
  [v18 enumerateIdentifiersWithBlock:v31];
  v25 = (void *)v8;

  id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
  v20 = (void *)[v19 initWithStartDate:v43[5] endDate:v37[5]];
  id v21 = (void *)v7;
  id v22 = +[PGUpNextMomentCollectionBasedMatchingInfo representativeDateForMomentNodesUniversalDateInterval:v20];
  objc_super v23 = [a1[12] targetsForSources:v5];
  v24 = [[PGUpNextMemoryBasedMatchingInfo alloc] initWithMemoryNodeAsCollection:v5 momentNodes:v6 personNodes:v30 sceneNodes:v29 meaningNodes:v28 isTripMemory:v16 representativeLocation:v17 representativeDate:v22 memoryFeatureNodes:v23];
  [a1[13] addObject:v24];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v3 objectForKeyedSubscript:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v5 = v6;
  }
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_141(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v5 = (void *)a1[4];
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v4 earlierDate:v7];
  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
  v12 = (void *)a1[5];
  id v17 = [NSNumber numberWithUnsignedInteger:a2];
  id v13 = [v12 objectForKeyedSubscript:v17];
  uint64_t v14 = [v11 laterDate:v13];
  uint64_t v15 = *(void *)(a1[7] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

@end