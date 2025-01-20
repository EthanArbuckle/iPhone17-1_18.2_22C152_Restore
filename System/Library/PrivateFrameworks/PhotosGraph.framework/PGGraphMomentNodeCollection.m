@interface PGGraphMomentNodeCollection
+ (Class)nodeClass;
+ (id)_interestingForMemoriesSubsetFromMomentNodes:(id)a3 inGraph:(id)a4;
+ (id)momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:(id)a3 inGraph:(id)a4;
+ (id)momentNodeAsCollectionByMomentUUIDForMomentUUIDs:(id)a3 inGraph:(id)a4;
+ (id)momentNodeForUUID:(id)a3 inGraph:(id)a4;
+ (id)momentNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4;
+ (id)momentNodesForLocalDateInterval:(id)a3 inGraph:(id)a4;
+ (id)momentNodesForUUIDs:(id)a3 inGraph:(id)a4;
+ (id)momentNodesHappeningAtSensitiveLocationInGraph:(id)a3;
+ (id)momentNodesInGraph:(id)a3;
+ (id)momentNodesInUniversalDateInterval:(id)a3 inGraph:(id)a4;
+ (id)momentNodesInterestingForMemoriesInGraph:(id)a3;
+ (id)momentNodesInterestingWithAlternateJunkingInGraph:(id)a3;
+ (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3;
+ (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3;
- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3;
- (NSDateInterval)localDateInterval;
- (NSDateInterval)universalDateInterval;
- (NSDictionary)numberOfAssetsByMomentUUID;
- (NSSet)localIdentifiers;
- (NSSet)localStartDates;
- (NSSet)universalDateIntervals;
- (NSSet)universalEndDates;
- (NSSet)universalStartDates;
- (NSSet)uuids;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphAddressNodeCollection)preciseAddressNodes;
- (PGGraphAddressNodeCollection)remoteAddressNodes;
- (PGGraphBusinessNodeCollection)businessNodes;
- (PGGraphDateNodeCollection)dateNodes;
- (PGGraphEntityNetSceneNodeCollection)searchConfidenceEntityNetSceneNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphFeatureNodeCollection)featureNodes;
- (PGGraphFrequentLocationNodeCollection)frequentLocationNodes;
- (PGGraphHighlightNodeCollection)highlightNodes;
- (PGGraphHolidayNodeCollection)celebratedHolidayNodes;
- (PGGraphLocationCityNodeCollection)cityNodes;
- (PGGraphMeaningNodeCollection)alternativeMeaningNodes;
- (PGGraphMeaningNodeCollection)meaningNodes;
- (PGGraphMeaningNodeCollection)reliableMeaningNodes;
- (PGGraphMemoryNodeCollection)memoryNodes;
- (PGGraphMobilityNodeCollection)mobilityNodes;
- (PGGraphMomentNodeCollection)interestingForMemoriesSubset;
- (PGGraphMomentNodeCollection)interestingSubset;
- (PGGraphMomentNodeCollection)interestingWithAlternateJunkingSubset;
- (PGGraphMomentNodeCollection)nextMomentNodes;
- (PGGraphMomentNodeCollection)previousMomentNodes;
- (PGGraphMomentNodeCollection)smartInterestingSubset;
- (PGGraphMomentNodeCollection)subsetHappeningAtSensitiveLocation;
- (PGGraphMomentNodeCollection)subsetWithBothPrivateAndSharedAssets;
- (PGGraphMomentNodeCollection)subsetWithOnlyPrivateAssets;
- (PGGraphMomentNodeCollection)subsetWithOnlySharedAssets;
- (PGGraphMomentNodeCollection)subsetWithPrivateAssets;
- (PGGraphMomentNodeCollection)subsetWithSharedAssets;
- (PGGraphPOINodeCollection)improvedPOINodes;
- (PGGraphPOINodeCollection)poiNodes;
- (PGGraphPOINodeCollection)specialPOINodes;
- (PGGraphPartOfWeekNodeCollection)partOfWeekNodes;
- (PGGraphPersonNodeCollection)anniversaryPersonNodes;
- (PGGraphPersonNodeCollection)authorNodes;
- (PGGraphPersonNodeCollection)birthdayPersonNodes;
- (PGGraphPersonNodeCollection)consolidatedPersonNodes;
- (PGGraphPersonNodeCollection)consolidatedPersonNodesPresentInAssets;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphPersonNodeCollection)personNodesInProximity;
- (PGGraphPersonNodeCollection)presentPersonNodes;
- (PGGraphPetNodeCollection)petNodes;
- (PGGraphPublicEventNodeCollection)publicEventNodes;
- (PGGraphROINodeCollection)beachRoiNodes;
- (PGGraphROINodeCollection)mountainRoiNodes;
- (PGGraphROINodeCollection)natureRoiNodes;
- (PGGraphROINodeCollection)roiNodes;
- (PGGraphROINodeCollection)urbanRoiNodes;
- (PGGraphROINodeCollection)waterRoiNodes;
- (PGGraphSceneNodeCollection)highConfidenceSceneNodes;
- (PGGraphSceneNodeCollection)reliableSceneNodes;
- (PGGraphSceneNodeCollection)sceneNodes;
- (PGGraphSceneNodeCollection)searchConfidenceSceneNodes;
- (PGGraphSocialGroupNodeCollection)socialGroupNodes;
- (PGGraphWeekdayNodeCollection)weekdayNodes;
- (PGGraphWeekendNodeCollection)weekendNodes;
- (double)averageContentScore;
- (id)firstAndLastMomentNodes;
- (id)momentNodeAsCollectionByMomentUUID;
- (id)momentNodeByMomentUUID;
- (id)momentNodesWithContentScoreAbove:(double)a3;
- (id)momentNodesWithMinimumNumberOfExtendedCuratedAssets:(unint64_t)a3;
- (id)momentNodesWithMinimumNumberOfPersons:(unint64_t)a3;
- (id)momentUUIDByMomentNodeAsCollection;
- (id)personActivityMeaningNodes;
- (id)poiNodesForLabel:(id)a3;
- (id)subsetForLocalDateInterval:(id)a3;
- (id)subsetWithEnoughFacesProcessed;
- (id)subsetWithEnoughScenesProcessed;
- (id)subsetWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfAssetsInExtendedCuration;
- (unint64_t)numberOfAssetsWithPersons;
- (void)enumerateContentScoresUsingBlock:(id)a3;
- (void)enumerateLocalEndDatesUsingBlock:(id)a3;
- (void)enumerateLocalStartDatesUsingBlock:(id)a3;
- (void)enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4;
- (void)enumerateNumberOfAssetsInExtendedCurationUsingBlock:(id)a3;
- (void)enumerateUUIDsUsingBlock:(id)a3;
- (void)enumerateUniversalEndDatesUsingBlock:(id)a3;
- (void)enumerateUniversalStartDatesUsingBlock:(id)a3;
@end

@implementation PGGraphMomentNodeCollection

- (NSSet)universalDateIntervals
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMomentNodeCollection_universalDateIntervals__block_invoke;
  v6[3] = &unk_1E68EDD40;
  id v4 = v3;
  id v7 = v4;
  [(MAElementCollection *)self enumerateIdentifiersAsCollectionsWithBlock:v6];

  return (NSSet *)v4;
}

void __53__PGGraphMomentNodeCollection_universalDateIntervals__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 universalDateInterval];
  [*(id *)(a1 + 32) addObject:v4];
}

- (PGGraphMomentNodeCollection)subsetHappeningAtSensitiveLocation
{
  id v3 = +[PGGraphMomentNode filterHappeningAtSensitiveLocation];
  id v4 = [(MANodeCollection *)self nodesMatchingFilter:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithOnlyPrivateAssets
{
  id v3 = +[PGGraphMomentNode momentWithOnlyPrivateAssetsOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithOnlySharedAssets
{
  id v3 = +[PGGraphMomentNode momentWithOnlySharedAssetsOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithBothPrivateAndSharedAssets
{
  id v3 = +[PGGraphMomentNode momentWithPrivateAndSharedAssetsOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithPrivateAssets
{
  id v3 = +[PGGraphMomentNode momentWithPrivateAssetsOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithSharedAssets
{
  id v3 = +[PGGraphMomentNode momentWithSharedAssetsOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (id)subsetForLocalDateInterval:(id)a3
{
  id v4 = +[PGGraphMomentNode filterWithLocalDateInterval:a3];
  v5 = [v4 relation];
  v6 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v5];

  return v6;
}

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(PGGraphMomentNodeCollection *)self preciseAddressNodes];
    v6 = [v4 homeOrWorkNodes];
    id v7 = [v6 addressNodes];
    char v8 = [v5 intersectsCollection:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)subsetWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3
{
  id v4 = +[PGGraphMomentNode filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:a3];
  v5 = [v4 relation];
  v6 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v5];

  return v6;
}

- (id)momentNodesWithMinimumNumberOfExtendedCuratedAssets:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = +[PGGraphMomentNode filter];
  v14 = @"extc";
  id v6 = objc_alloc(MEMORY[0x1E4F71E28]);
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = (void *)[v6 initWithComparator:6 value:v7];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [v5 filterBySettingProperties:v9];

  v11 = [v10 relation];
  v12 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v11];

  return v12;
}

- (id)momentNodesWithMinimumNumberOfPersons:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = +[PGGraphMomentNode filter];
  v14 = @"tnop";
  id v6 = objc_alloc(MEMORY[0x1E4F71E28]);
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = (void *)[v6 initWithComparator:6 value:v7];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [v5 filterBySettingProperties:v9];

  v11 = [v10 relation];
  v12 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v11];

  return v12;
}

- (id)momentNodesWithContentScoreAbove:(double)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = +[PGGraphMomentNode filter];
  v14 = @"cntsc";
  id v6 = objc_alloc(MEMORY[0x1E4F71E28]);
  id v7 = [NSNumber numberWithDouble:a3];
  char v8 = (void *)[v6 initWithComparator:5 value:v7];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [v5 filterBySettingProperties:v9];

  v11 = [v10 relation];
  v12 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v11];

  return v12;
}

- (id)subsetWithEnoughFacesProcessed
{
  id v3 = +[PGGraphMomentNode filterEnoughFacesProcessed];
  id v4 = [(MANodeCollection *)self nodesMatchingFilter:v3];

  return v4;
}

- (id)subsetWithEnoughScenesProcessed
{
  id v3 = +[PGGraphMomentNode filterEnoughScenesProcessed];
  id v4 = [(MANodeCollection *)self nodesMatchingFilter:v3];

  return v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (id)momentNodeByMomentUUID
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMomentNodeCollection_momentNodeByMomentUUID__block_invoke;
  v6[3] = &unk_1E68EF578;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return v4;
}

void __53__PGGraphMomentNodeCollection_momentNodeByMomentUUID__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)momentUUIDByMomentNodeAsCollection
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PGGraphMomentNodeCollection_momentUUIDByMomentNodeAsCollection__block_invoke;
  v8[3] = &unk_1E68EDD18;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"lclid" withBlock:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __65__PGGraphMomentNodeCollection_momentUUIDByMomentNodeAsCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [PGGraphMomentNodeCollection alloc];
  id v7 = [*(id *)(a1 + 32) graph];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
  id v9 = [(MAElementCollection *)v6 initWithGraph:v7 elementIdentifiers:v8];

  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v9];
}

- (id)momentNodeAsCollectionByMomentUUID
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PGGraphMomentNodeCollection_momentNodeAsCollectionByMomentUUID__block_invoke;
  v8[3] = &unk_1E68EDD18;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"lclid" withBlock:v8];
  id v5 = v9;
  id v6 = v4;

  return v6;
}

void __65__PGGraphMomentNodeCollection_momentNodeAsCollectionByMomentUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [PGGraphMomentNodeCollection alloc];
  id v7 = [*(id *)(a1 + 32) graph];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
  id v9 = [(MAElementCollection *)v6 initWithGraph:v7 elementIdentifiers:v8];

  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
}

- (double)averageContentScore
{
  uint64_t v7 = 0;
  char v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphMomentNodeCollection_averageContentScore__block_invoke;
  v6[3] = &unk_1E68EFA90;
  void v6[4] = &v7;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"cntsc" withBlock:v6];
  unint64_t v3 = [(MAElementCollection *)self count];
  double v4 = v8[3];
  if (v3)
  {
    double v4 = v4 / (double)v3;
    v8[3] = v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __50__PGGraphMomentNodeCollection_averageContentScore__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

- (unint64_t)numberOfAssetsWithPersons
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PGGraphMomentNodeCollection_numberOfAssetsWithPersons__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"nawp" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__PGGraphMomentNodeCollection_numberOfAssetsWithPersons__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (unint64_t)numberOfAssets
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PGGraphMomentNodeCollection_numberOfAssets__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"cnt" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__PGGraphMomentNodeCollection_numberOfAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (void)enumerateNumberOfAssetsInExtendedCurationUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PGGraphMomentNodeCollection_enumerateNumberOfAssetsInExtendedCurationUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDCF0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"extc" withBlock:v6];
}

uint64_t __83__PGGraphMomentNodeCollection_enumerateNumberOfAssetsInExtendedCurationUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateContentScoresUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphMomentNodeCollection_enumerateContentScoresUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"cntsc" withBlock:v6];
}

uint64_t __64__PGGraphMomentNodeCollection_enumerateContentScoresUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDateInterval)localDateInterval
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__60764;
  v22 = __Block_byref_object_dispose__60765;
  id v23 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke;
  v17[3] = &unk_1E68EDCA0;
  v17[4] = &v18;
  [(PGGraphMomentNodeCollection *)self enumerateLocalStartDatesUsingBlock:v17];
  unint64_t v3 = (void *)v19[5];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  LOBYTE(v3) = [v3 isEqualToDate:v4];

  if (v3)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__60764;
    v15 = __Block_byref_object_dispose__60765;
    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke_2;
    v10[3] = &unk_1E68EDCA0;
    v10[4] = &v11;
    [(PGGraphMomentNodeCollection *)self enumerateLocalEndDatesUsingBlock:v10];
    id v6 = (void *)v12[5];
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    LOBYTE(v6) = [v6 isEqualToDate:v7];

    if ((v6 & 1) != 0 || [(id)v19[5] compare:v12[5]] == 1)
    {
      id v5 = 0;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v5 = (void *)[v8 initWithStartDate:v19[5] endDate:v12[5]];
    }
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v18, 8);

  return (NSDateInterval *)v5;
}

void __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "earlierDate:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "laterDate:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __114__PGGraphMomentNodeCollection_enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending_usingBlock___block_invoke;
  v8[3] = &unk_1E68EDCC8;
  id v9 = v6;
  id v7 = v6;
  [(MANodeCollection *)self enumerateNodesAsCollectionsSortedByDoublePropertyForName:@"utcs" ascending:v4 usingBlock:v8];
}

uint64_t __114__PGGraphMomentNodeCollection_enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateLocalEndDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphMomentNodeCollection_enumerateLocalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"tze" withBlock:v6];
}

void __64__PGGraphMomentNodeCollection_enumerateLocalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateLocalStartDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PGGraphMomentNodeCollection_enumerateLocalStartDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"tzs" withBlock:v6];
}

void __66__PGGraphMomentNodeCollection_enumerateLocalStartDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)localStartDates
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphMomentNodeCollection_localStartDates__block_invoke;
  v6[3] = &unk_1E68EFB38;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNodeCollection *)self enumerateLocalStartDatesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __46__PGGraphMomentNodeCollection_localStartDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSSet)universalEndDates
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphMomentNodeCollection_universalEndDates__block_invoke;
  v6[3] = &unk_1E68EFB38;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNodeCollection *)self enumerateUniversalEndDatesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __48__PGGraphMomentNodeCollection_universalEndDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSSet)universalStartDates
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphMomentNodeCollection_universalStartDates__block_invoke;
  v6[3] = &unk_1E68EFB38;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNodeCollection *)self enumerateUniversalStartDatesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __50__PGGraphMomentNodeCollection_universalStartDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSDateInterval)universalDateInterval
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__60764;
  v22 = __Block_byref_object_dispose__60765;
  id v23 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke;
  v17[3] = &unk_1E68EDCA0;
  v17[4] = &v18;
  [(PGGraphMomentNodeCollection *)self enumerateUniversalStartDatesUsingBlock:v17];
  uint64_t v3 = (void *)v19[5];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  LOBYTE(v3) = [v3 isEqualToDate:v4];

  if (v3)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__60764;
    v15 = __Block_byref_object_dispose__60765;
    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke_2;
    v10[3] = &unk_1E68EDCA0;
    v10[4] = &v11;
    [(PGGraphMomentNodeCollection *)self enumerateUniversalEndDatesUsingBlock:v10];
    id v6 = (void *)v12[5];
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    LOBYTE(v6) = [v6 isEqualToDate:v7];

    if ((v6 & 1) != 0 || [(id)v19[5] compare:v12[5]] == 1)
    {
      id v5 = 0;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v5 = (void *)[v8 initWithStartDate:v19[5] endDate:v12[5]];
    }
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v18, 8);

  return (NSDateInterval *)v5;
}

void __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "earlierDate:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "laterDate:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphMomentNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"utce" withBlock:v6];
}

void __68__PGGraphMomentNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateUniversalStartDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PGGraphMomentNodeCollection_enumerateUniversalStartDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"utcs" withBlock:v6];
}

void __70__PGGraphMomentNodeCollection_enumerateUniversalStartDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)firstAndLastMomentNodes
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__60764;
  id v16 = __Block_byref_object_dispose__60765;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__60764;
  uint64_t v10 = __Block_byref_object_dispose__60765;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PGGraphMomentNodeCollection_firstAndLastMomentNodes__block_invoke;
  v5[3] = &unk_1E68EDC78;
  v5[4] = &v12;
  v5[5] = &v6;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v5];
  if (v13[5] && (uint64_t v2 = v7[5]) != 0)
  {
    v18[0] = v13[5];
    v18[1] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v3;
}

void __54__PGGraphMomentNodeCollection_firstAndLastMomentNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = v3;
  if (*(void *)(v4 + 40))
  {
    uint64_t v5 = objc_msgSend(v3, "earlierMomentNode:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = v3;
    id v7 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v8;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v9 + 40))
  {
    uint64_t v10 = objc_msgSend(v14, "laterMomentNode:");
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    id v13 = v14;
    uint64_t v12 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v13;
  }
}

- (NSSet)uuids
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphMomentNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"lclid" withBlock:v6];

  return (NSSet *)v4;
}

void __36__PGGraphMomentNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (NSSet)localIdentifiers
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphMomentNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNodeCollection *)self enumerateUUIDsUsingBlock:v6];

  return (NSSet *)v4;
}

void __47__PGGraphMomentNodeCollection_localIdentifiers__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F391A0], "localIdentifierWithUUID:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 length]) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

- (void)enumerateUUIDsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphMomentNodeCollection_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"lclid" withBlock:v6];
}

void __56__PGGraphMomentNodeCollection_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSDictionary)numberOfAssetsByMomentUUID
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke;
  v14[3] = &unk_1E68F1988;
  id v4 = v3;
  id v15 = v4;
  [(PGGraphMomentNodeCollection *)self enumerateUUIDsUsingBlock:v14];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke_2;
  v11[3] = &unk_1E68EDC28;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"cnt" withBlock:v11];
  id v8 = v13;
  uint64_t v9 = (NSDictionary *)v6;

  return v9;
}

void __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v7];
}

void __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v8];
  }
  else
  {
    uint64_t v10 = +[PGLogging sharedLogging];
    uint64_t v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      uint64_t v13 = a2;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[PGGraphMomentNodeCollection] No UUID for node with element identifier %lu.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PGGraphMomentNodeCollection_numberOfAssetsInExtendedCuration__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"extc" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __63__PGGraphMomentNodeCollection_numberOfAssetsInExtendedCuration__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (PGGraphMobilityNodeCollection)mobilityNodes
{
  id v3 = +[PGGraphMomentNode mobilityOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMobilityNodeCollection *)v4;
}

- (PGGraphFrequentLocationNodeCollection)frequentLocationNodes
{
  id v3 = +[PGGraphMomentNode frequentLocationOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphFrequentLocationNodeCollection *)v4;
}

- (PGGraphHolidayNodeCollection)celebratedHolidayNodes
{
  id v3 = +[PGGraphMomentNode celebratedHolidayOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHolidayNodeCollection *)v4;
}

- (id)poiNodesForLabel:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F71F18];
  id v5 = a3;
  id v6 = +[PGGraphMomentNode poiOfMoment];
  v13[0] = v6;
  uint64_t v7 = +[PGGraphPOINode filterWithLabel:v5];

  uint64_t v8 = [v7 relation];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v10 = [v4 chain:v9];

  uint64_t v11 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v10];

  return v11;
}

- (PGGraphEntityNetSceneNodeCollection)searchConfidenceEntityNetSceneNodes
{
  id v3 = +[PGGraphSceneEdge searchConfidenceAssetsFilter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphEntityNetSceneNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)searchConfidenceSceneNodes
{
  id v3 = +[PGGraphSceneEdge searchConfidenceAssetsFilter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)smartInterestingSubset
{
  id v3 = +[PGGraphMomentNode smartInterestingFilter];
  id v4 = [v3 relation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingForMemoriesSubset
{
  id v3 = objc_opt_class();
  id v4 = [(MAElementCollection *)self graph];
  id v5 = [v3 _interestingForMemoriesSubsetFromMomentNodes:self inGraph:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingWithAlternateJunkingSubset
{
  id v3 = +[PGGraphMomentNode interestingWithAlternateJunkingFilter];
  id v4 = [v3 relation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingSubset
{
  id v3 = +[PGGraphMomentNode interestingFilter];
  id v4 = [v3 relation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)highConfidenceSceneNodes
{
  id v3 = +[PGGraphSceneEdge highConfidenceAssetsFilter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)reliableSceneNodes
{
  id v3 = +[PGGraphSceneEdge isReliableFilter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  id v3 = +[PGGraphSceneEdge filter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphROINodeCollection)waterRoiNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphMomentNode roiOfMoment];
  v11[0] = v4;
  id v5 = +[PGGraphROINode waterFilter];
  id v6 = [v5 relation];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 chain:v7];

  uint64_t v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)urbanRoiNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphMomentNode roiOfMoment];
  v11[0] = v4;
  id v5 = +[PGGraphROINode urbanFilter];
  id v6 = [v5 relation];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 chain:v7];

  uint64_t v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)natureRoiNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphMomentNode roiOfMoment];
  v11[0] = v4;
  id v5 = +[PGGraphROINode natureFilter];
  id v6 = [v5 relation];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 chain:v7];

  uint64_t v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)mountainRoiNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphMomentNode roiOfMoment];
  v11[0] = v4;
  id v5 = +[PGGraphROINode mountainFilter];
  id v6 = [v5 relation];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 chain:v7];

  uint64_t v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)beachRoiNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphMomentNode roiOfMoment];
  v11[0] = v4;
  id v5 = +[PGGraphROINode beachFilter];
  id v6 = [v5 relation];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 chain:v7];

  uint64_t v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)roiNodes
{
  id v3 = +[PGGraphMomentNode roiOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphROINodeCollection *)v4;
}

- (PGGraphPOINodeCollection)specialPOINodes
{
  id v3 = +[PGGraphMomentNode specialPOIOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphPOINodeCollection)improvedPOINodes
{
  id v3 = +[PGGraphMomentNode improvedPOIOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphPOINodeCollection)poiNodes
{
  id v3 = +[PGGraphMomentNode poiOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  id v3 = +[PGGraphMomentNode featureOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphFeatureNodeCollection *)v4;
}

- (PGGraphBusinessNodeCollection)businessNodes
{
  id v3 = +[PGGraphMomentNode businessOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphBusinessNodeCollection *)v4;
}

- (PGGraphPublicEventNodeCollection)publicEventNodes
{
  id v3 = +[PGGraphMomentNode publicEventOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPublicEventNodeCollection *)v4;
}

- (id)personActivityMeaningNodes
{
  id v3 = +[PGGraphMomentNode personActivityMeaningOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (PGGraphMeaningNodeCollection)reliableMeaningNodes
{
  id v3 = +[PGGraphMomentNode reliableMeaningOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)alternativeMeaningNodes
{
  id v3 = +[PGGraphMomentNode alternativeMeaningOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  id v3 = +[PGGraphMomentNode meaningOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphWeekendNodeCollection)weekendNodes
{
  id v3 = +[PGGraphMomentNode weekendOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphWeekendNodeCollection *)v4;
}

- (PGGraphWeekdayNodeCollection)weekdayNodes
{
  id v3 = +[PGGraphMomentNode weekdayOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphWeekdayNodeCollection *)v4;
}

- (PGGraphMemoryNodeCollection)memoryNodes
{
  id v3 = +[PGGraphMomentNode memoryOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMemoryNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)presentPersonNodes
{
  id v3 = +[PGGraphMomentNode personPhysicallyPresentInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)authorNodes
{
  id v3 = +[PGGraphMomentNode authorOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPartOfWeekNodeCollection)partOfWeekNodes
{
  id v3 = +[PGGraphPartOfWeekEdge filter];
  id v4 = [v3 outRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphPartOfWeekNodeCollection *)v5;
}

- (PGGraphPetNodeCollection)petNodes
{
  id v3 = +[PGGraphMomentNode petPresentInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPetNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)highlightNodes
{
  id v3 = +[PGGraphMomentNode highlightOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphLocationCityNodeCollection)cityNodes
{
  id v3 = +[PGGraphMomentNode cityOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCityNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)anniversaryPersonNodes
{
  id v3 = +[PGGraphMomentNode anniversaryPersonInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)birthdayPersonNodes
{
  id v3 = +[PGGraphMomentNode birthdayPersonInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodesInProximity
{
  id v3 = +[PGGraphMomentNode personInProximityInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)consolidatedPersonNodesPresentInAssets
{
  id v3 = +[PGGraphMomentNode consolidatedPersonPresentInAssets];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)consolidatedPersonNodes
{
  id v3 = +[PGGraphMomentNode consolidatedPersonInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodes
{
  id v3 = +[PGGraphMomentNode personInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)remoteAddressNodes
{
  id v3 = +[PGGraphMomentNode remoteAddressOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  id v3 = +[PGGraphMomentNode preciseAddressOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  id v3 = +[PGGraphMomentNode addressOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphDateNodeCollection)dateNodes
{
  id v3 = +[PGGraphMomentNode dateOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphDateNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)nextMomentNodes
{
  id v3 = +[PGGraphMomentNode nextMomentOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)previousMomentNodes
{
  id v3 = +[PGGraphMomentNode previousMomentOfMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  id v3 = +[PGGraphMomentNode socialGroupInMoment];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphSocialGroupNodeCollection *)v4;
}

+ (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphMomentNode filterEnoughFacesProcessed];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphMomentNode filterEnoughScenesProcessed];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)momentNodesInterestingForMemoriesInGraph:(id)a3
{
  return (id)[a1 _interestingForMemoriesSubsetFromMomentNodes:0 inGraph:a3];
}

+ (id)momentNodesInGraph:(id)a3
{
  id v4 = a3;
  id v5 = [a1 filter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)momentNodesInterestingWithAlternateJunkingInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphMomentNode interestingWithAlternateJunkingFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)momentNodesHappeningAtSensitiveLocationInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphMomentNode filterHappeningAtSensitiveLocation];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:(id)a3 inGraph:(id)a4
{
  id v4 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:a3 inGraph:a4];
  id v5 = [v4 momentNodeAsCollectionByMomentUUID];

  return v5;
}

+ (id)momentNodeAsCollectionByMomentUUIDForMomentUUIDs:(id)a3 inGraph:(id)a4
{
  id v4 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:a3 inGraph:a4];
  id v5 = [v4 momentNodeAsCollectionByMomentUUID];

  return v5;
}

+ (id)momentNodeForUUID:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphMomentNode filterWithUUID:a3];
  uint64_t v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)momentNodesInUniversalDateInterval:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphMomentNode filterWithUniversalDateInterval:a3];
  uint64_t v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)momentNodesForLocalDateInterval:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphMomentNode filterWithLocalDateInterval:a3];
  uint64_t v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)momentNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphMomentNode filterWithUUIDs:a3];
  uint64_t v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)momentNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphMomentNode filterWithUUIDs:a3];
  uint64_t v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)_interestingForMemoriesSubsetFromMomentNodes:(id)a3 inGraph:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PGGraphMomentNode filter];
  v32[0] = @"intngaj";
  v32[1] = @"spr";
  v33[0] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:6 value:&unk_1F28D5848];
  v33[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  uint64_t v11 = [v8 filterBySettingProperties:v10];

  if (v6) {
    [v6 nodesMatchingFilter:v11];
  }
  else {
  int v12 = [a1 nodesMatchingFilter:v11 inGraph:v7];
  }
  if ([v12 count])
  {
    uint64_t v13 = +[PGGraphNodeCollection nodesInGraph:v7];
    uint64_t v14 = [v7 meNodeCollection];
    id v15 = [v14 homeOrWorkNodes];
    id v16 = [v15 addressNodes];

    id v17 = [v13 momentNodes];
    uint64_t v18 = [v16 momentNodes];
    v19 = [v17 collectionByFormingUnionWith:v18];

    uint64_t v20 = [v12 collectionByIntersecting:v19];
    v21 = [v12 collectionBySubtracting:v19];
    if ([v20 count])
    {
      v22 = +[PGGraphNodeCollection nodesInGraph:v7];
      [v22 momentNodes];
      id v29 = v6;
      v24 = id v23 = v13;

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __84__PGGraphMomentNodeCollection__interestingForMemoriesSubsetFromMomentNodes_inGraph___block_invoke;
      v30[3] = &unk_1E68EEE18;
      id v31 = v24;
      id v25 = v24;
      uint64_t v26 = [v20 filteredCollectionUsingBlock:v30];

      uint64_t v13 = v23;
      id v6 = v29;
      uint64_t v20 = (void *)v26;
    }
    id v27 = [v21 collectionByFormingUnionWith:v20];
  }
  else
  {
    id v27 = v12;
  }

  return v27;
}

BOOL __84__PGGraphMomentNodeCollection__interestingForMemoriesSubsetFromMomentNodes_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsCollection:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = (unint64_t)fmax(ceil((double)(unint64_t)[v3 numberOfAssets] * 0.1), 10.0);
    BOOL v4 = [v3 numberOfAssetsWithPersons] >= v5;
  }

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end