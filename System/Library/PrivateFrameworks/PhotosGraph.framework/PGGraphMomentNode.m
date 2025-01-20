@interface PGGraphMomentNode
+ (MANodeFilter)filterEncodedCLIPFeatureVectorNotEmpty;
+ (MARelation)addressOfMoment;
+ (MARelation)anniversaryPersonInMoment;
+ (MARelation)authorOfMoment;
+ (MARelation)birthdayPersonInMoment;
+ (MARelation)businessOfMoment;
+ (MARelation)celebratedHolidayOfMoment;
+ (MARelation)cityOfMoment;
+ (MARelation)consolidatedPersonInMoment;
+ (MARelation)consolidatedPersonPresentInAssets;
+ (MARelation)dateOfMoment;
+ (MARelation)featureOfMoment;
+ (MARelation)frequentLocationOfMoment;
+ (MARelation)highlightOfMoment;
+ (MARelation)meaningHierarchyOfMoment;
+ (MARelation)meaningOfMoment;
+ (MARelation)memoryOfMoment;
+ (MARelation)mobilityOfMoment;
+ (MARelation)momentWithOnlyPrivateAssetsOfMoment;
+ (MARelation)momentWithOnlySharedAssetsOfMoment;
+ (MARelation)momentWithPrivateAndSharedAssetsOfMoment;
+ (MARelation)momentWithPrivateAssetsOfMoment;
+ (MARelation)momentWithSharedAssetsOfMoment;
+ (MARelation)nextMomentOfMoment;
+ (MARelation)partOfDayOfMoment;
+ (MARelation)personActivityMeaningOfMoment;
+ (MARelation)personExcludingMeInMoment;
+ (MARelation)personInMoment;
+ (MARelation)personInProximityInMoment;
+ (MARelation)personPhysicallyPresentInMoment;
+ (MARelation)petPresentInMoment;
+ (MARelation)poiOfMoment;
+ (MARelation)poiWithNonzeroConfidenceOfMoment;
+ (MARelation)preciseAddressOfMoment;
+ (MARelation)previousMomentOfMoment;
+ (MARelation)publicEventOfMoment;
+ (MARelation)reliableSceneOfMoment;
+ (MARelation)remoteAddressOfMoment;
+ (MARelation)roiOfMoment;
+ (MARelation)roiWithNonzeroConfidenceOfMoment;
+ (MARelation)sceneOfMoment;
+ (MARelation)significantPartOfDayOfMoment;
+ (MARelation)socialGroupInMoment;
+ (MARelation)weekdayOfMoment;
+ (MARelation)weekendOfMoment;
+ (id)alternativeMeaningOfMoment;
+ (id)contentBasedPropertiesWithMoment:(id)a3;
+ (id)contentScoreSortDescriptors;
+ (id)filter;
+ (id)filterEnoughFacesProcessed;
+ (id)filterEnoughScenesProcessed;
+ (id)filterHappeningAtSensitiveLocation;
+ (id)filterWithLocalDateInterval:(id)a3;
+ (id)filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3;
+ (id)filterWithUUID:(id)a3;
+ (id)filterWithUUIDs:(id)a3;
+ (id)filterWithUniversalDateInterval:(id)a3;
+ (id)firstAndLastMomentNodesInMomentNodes:(id)a3;
+ (id)improvedPOIOfMoment;
+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)interestingFilter;
+ (id)interestingWithAlternateJunkingFilter;
+ (id)pathFromMoment;
+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3;
+ (id)pathToMoment;
+ (id)pathToTargetNodeDomain:(unsigned __int16)a3;
+ (id)poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3;
+ (id)propertiesWithMoment:(id)a3;
+ (id)reliableMeaningOfMoment;
+ (id)roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3;
+ (id)significantPartOfDayOfMomentWithHasLegacyWeights:(BOOL)a3;
+ (id)smartInterestingFilter;
+ (id)specialPOIOfMoment;
+ (id)timeBasedPropertiesWithMoment:(id)a3;
+ (int64_t)breakoutOfRoutineTypeWithNeighborScore:(double)a3;
+ (void)setLocalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setLocalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setNumberOfAssets:(unint64_t)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setUniversalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setUniversalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)containsBetterScoringAsset;
- (BOOL)containsNonJunkAssets;
- (BOOL)endsBeforeLocalDate:(id)a3;
- (BOOL)happensAtFrequentLocation;
- (BOOL)happensAtSensitiveLocation;
- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3;
- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3;
- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3;
- (BOOL)hasAddressNodes;
- (BOOL)hasAssetsWithInterestingScenes;
- (BOOL)hasEnoughFacesProcessed;
- (BOOL)hasEnoughScenesProcessed;
- (BOOL)hasHigherThanImprovedAssets;
- (BOOL)hasLocation;
- (BOOL)hasMeanings;
- (BOOL)hasPeopleCountingMe:(BOOL)a3;
- (BOOL)hasPersonNodes;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isAggregation;
- (BOOL)isInteresting;
- (BOOL)isInterestingForMemories;
- (BOOL)isInterestingWithAlternateJunking;
- (BOOL)isLongTrip;
- (BOOL)isMeaningful;
- (BOOL)isPartOfTrip;
- (BOOL)isShortTrip;
- (BOOL)isSmartInteresting;
- (BOOL)isTrip;
- (BOOL)isWeekend;
- (BOOL)petIsPresent;
- (BOOL)startsAfterLocalDate:(id)a3;
- (CLLocationCoordinate2D)bestLocationCoordinate;
- (MAFloatVector)clipFeatureVector;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSDictionary)jsonDescription;
- (NSSet)frequentLocationNodes;
- (NSString)UUID;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localIdentifier;
- (NSString)name;
- (NSString)uuid;
- (PGGraphHighlightGroupNode)highlightGroupNode;
- (PGGraphHighlightNode)highlightNode;
- (PGGraphMomentNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphMomentNode)nextMomentNode;
- (PGGraphMomentNode)previousMomentNode;
- (PGGraphMomentNodeCollection)collection;
- (double)behavioralScore;
- (double)contentScore;
- (double)facesProcessedRatio;
- (double)graphScore;
- (double)inhabitationScore;
- (double)meaningScore;
- (double)scenesProcessedRatio;
- (double)timestampUTCEnd;
- (double)timestampUTCStart;
- (double)weightForMoment:(id)a3;
- (id)addressEdges;
- (id)addressNodes;
- (id)alternativeMeaningLabels;
- (id)alternativeMeaningLabelsIncludingParents;
- (id)alternativeMeaningNodes;
- (id)anniversaryPersonNodes;
- (id)associatedNodesForRemoval;
- (id)bestAddressNode;
- (id)birthdayPersonNodes;
- (id)businessNodes;
- (id)celebratedHolidayNodes;
- (id)changingPropertiesWithProperties:(id)a3;
- (id)cityNodes;
- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3;
- (id)consolidatedPersonNodes;
- (id)consolidatedPersonNodesPresentInAssets;
- (id)countryNodes;
- (id)dateNodes;
- (id)debugDictionaryWithServiceManager:(id)a3;
- (id)earlierMomentNode:(id)a3;
- (id)eventEnrichmentSortedMomentNodes;
- (id)eventSortedMomentNodes;
- (id)fetchAssetCollectionInPhotoLibrary:(id)a3;
- (id)holidayNodes;
- (id)initFromMoment:(id)a3;
- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4;
- (id)label;
- (id)lastWeekendMoments;
- (id)laterMomentNode:(id)a3;
- (id)meaningLabels;
- (id)meaningLabelsIncludingParents;
- (id)meaningNodes;
- (id)naturalLanguageFeatures;
- (id)personNodes;
- (id)personNodesInProximity;
- (id)petNodes;
- (id)poiNodes;
- (id)preciseAddressEdges;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)publicEventNodes;
- (id)reliableMeaningLabels;
- (id)remoteAddressEdges;
- (id)roiNodes;
- (id)sameMonthMoments;
- (id)sameWeekendMoments;
- (id)seasonNodes;
- (id)socialGroupNodes;
- (id)weekendNode;
- (int64_t)_compareToMomentNode:(id)a3 withSortDescriptors:(id)a4;
- (unint64_t)_partsOfDayWithThreshold:(double)a3;
- (unint64_t)featureType;
- (unint64_t)locationMobilityType;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfAssetsInExtendedCuration;
- (unint64_t)numberOfAssetsWithPersons;
- (unint64_t)numberOfRegularGemAssets;
- (unint64_t)numberOfShinyGemAssets;
- (unint64_t)partsOfDay;
- (unint64_t)significantPartsOfDay;
- (unint64_t)totalNumberOfPersons;
- (unsigned)domain;
- (unsigned)sharingComposition;
- (void)_enumeratePartsOfDayWithThreshold:(double)a3 usingBlock:(id)a4;
- (void)enumerateAddressEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateAlternativeMeaningEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateBusinessEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateBusinessNodesUsingBlock:(id)a3;
- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3;
- (void)enumerateConsolidatedAddressesUsingBlock:(id)a3;
- (void)enumerateDateEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateDateNodesUsingBlock:(id)a3;
- (void)enumerateFrequentLocationNodesUsingBlock:(id)a3;
- (void)enumerateHighlightNodesUsingBlock:(id)a3;
- (void)enumerateMeaningEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateMeaningEdgesAndNodesWithDomain:(unsigned __int16)a3 block:(id)a4;
- (void)enumerateMeaningNodesUsingBlock:(id)a3;
- (void)enumerateMeaningfulEventsUsingBlock:(id)a3;
- (void)enumeratePOIEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePOINodesUsingBlock:(id)a3;
- (void)enumeratePartOfDayEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePartsOfDayUsingBlock:(id)a3;
- (void)enumeratePersonEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePersonNodesUsingBlock:(id)a3;
- (void)enumeratePetNodesUsingBlock:(id)a3;
- (void)enumeratePreciseAddressEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePreciseAddressNodesUsingBlock:(id)a3;
- (void)enumeratePublicEventEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePublicEventNodesUsingBlock:(id)a3;
- (void)enumerateROIEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateROINodesUsingBlock:(id)a3;
- (void)enumerateReliableMeaningNodesUsingBlock:(id)a3;
- (void)enumerateRemoteAddressNodesUsingBlock:(id)a3;
- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateSceneNodesUsingBlock:(id)a3;
- (void)enumerateSignificantPartsOfDayUsingBlock:(id)a3;
- (void)enumerateSocialGroupEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateSocialGroupNodesUsingBlock:(id)a3;
- (void)setLocalProperties:(id)a3;
@end

@implementation PGGraphMomentNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_encodedCLIPFeatureVector, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (BOOL)happensAtSensitiveLocation
{
  return self->_happensAtSensitiveLocation;
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  return self->_numberOfAssetsInExtendedCuration;
}

- (double)facesProcessedRatio
{
  return self->_facesProcessedRatio;
}

- (double)scenesProcessedRatio
{
  return self->_scenesProcessedRatio;
}

- (unint64_t)totalNumberOfPersons
{
  return *((unsigned __int16 *)self + 37);
}

- (double)timestampUTCEnd
{
  return self->_universalEndTimestamp;
}

- (double)timestampUTCStart
{
  return self->_universalStartTimestamp;
}

- (BOOL)isSmartInteresting
{
  return (*((unsigned __int8 *)self + 84) >> 6) & 1;
}

- (BOOL)isInterestingWithAlternateJunking
{
  return (*((unsigned __int8 *)self + 84) >> 5) & 1;
}

- (BOOL)isInteresting
{
  return (*((unsigned __int8 *)self + 84) >> 4) & 1;
}

- (double)behavioralScore
{
  return self->_behavioralScore;
}

- (double)contentScore
{
  return self->_contentScore;
}

- (unint64_t)numberOfShinyGemAssets
{
  return *((unsigned int *)self + 19);
}

- (unint64_t)numberOfRegularGemAssets
{
  return *((unsigned int *)self + 20);
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 17);
}

- (unint64_t)numberOfAssetsWithPersons
{
  return *((unsigned int *)self + 16);
}

- (BOOL)containsNonJunkAssets
{
  return (*((unsigned __int8 *)self + 84) >> 3) & 1;
}

- (BOOL)containsBetterScoringAsset
{
  return (*((unsigned __int8 *)self + 84) >> 2) & 1;
}

- (BOOL)hasAssetsWithInterestingScenes
{
  return (*((unsigned __int8 *)self + 84) >> 1) & 1;
}

- (BOOL)hasHigherThanImprovedAssets
{
  return *((unsigned char *)self + 84) & 1;
}

- (double)inhabitationScore
{
  return self->_inhabitationScore;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphMomentNode *)self localIdentifier];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 11;
}

- (BOOL)petIsPresent
{
  v2 = [(PGGraphMomentNode *)self collection];
  v3 = [v2 petNodes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(PGGraphMomentNode *)self collection];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke;
  aBlock[3] = &unk_1E68EDB58;
  id v5 = v3;
  id v42 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  v7 = [v4 addressNodes];
  v6[2](v6, v7);

  v8 = [v4 remoteAddressNodes];
  v6[2](v6, v8);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_3;
  v39[3] = &unk_1E68ED880;
  id v9 = v5;
  id v40 = v9;
  [(PGGraphMomentNode *)self enumerateDateNodesUsingBlock:v39];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_4;
  v37[3] = &unk_1E68ED8F8;
  id v10 = v9;
  id v38 = v10;
  [(PGGraphMomentNode *)self enumerateBusinessNodesUsingBlock:v37];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_5;
  v35[3] = &unk_1E68ED920;
  id v11 = v10;
  id v36 = v11;
  [(PGGraphMomentNode *)self enumeratePublicEventNodesUsingBlock:v35];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_6;
  v33[3] = &unk_1E68ED8A8;
  id v12 = v11;
  id v34 = v12;
  [(PGGraphMomentNode *)self enumeratePOINodesUsingBlock:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_7;
  v31[3] = &unk_1E68ED8D0;
  id v13 = v12;
  id v32 = v13;
  [(PGGraphMomentNode *)self enumerateROINodesUsingBlock:v31];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_8;
  v29[3] = &unk_1E68EDB80;
  id v14 = v13;
  id v30 = v14;
  [(PGGraphMomentNode *)self enumerateSceneNodesUsingBlock:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_9;
  v27[3] = &unk_1E68EDBA8;
  id v15 = v14;
  id v28 = v15;
  [(PGGraphMomentNode *)self enumerateFrequentLocationNodesUsingBlock:v27];
  v16 = [(PGGraphMomentNode *)self collection];
  v17 = [v16 personNodes];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_10;
  v25[3] = &unk_1E68EF528;
  id v18 = v15;
  id v26 = v18;
  [v17 enumerateNodesUsingBlock:v25];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_11;
  v23[3] = &unk_1E68EDBF8;
  v23[4] = self;
  id v19 = v18;
  id v24 = v19;
  v20 = (void (**)(void *, __CFString *, uint64_t))_Block_copy(v23);
  v20[2](v20, @"MOBILITY", 203);
  v20[2](v20, @"PARTOFDAY", 400);
  v20[2](v20, @"PARTOFWEEK", 400);
  id v21 = v19;

  return v21;
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_2;
  v3[3] = &unk_1E68EDB30;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateIdentifiersAsCollectionsWithBlock:v3];
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"DATE" domain:400] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"BUSINESS" domain:503] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"PUBLIC_EVENT" domain:900] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"POI" domain:501] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"ROI" domain:502] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"SCENE" domain:600] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"IN" domain:204] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_10(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 collection];
  id v4 = [v3 momentNodes];
  uint64_t v5 = [v4 count];

  if (v5 == 1) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_12;
  v8[3] = &unk_1E68EDBD0;
  id v9 = v5;
  __int16 v11 = a3;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateNeighborNodesThroughEdgesWithLabel:v7 domain:a3 usingBlock:v8];
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:*(void *)(a1 + 32) domain:*(unsigned __int16 *)(a1 + 48)] == 1) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 momentNodes];
  if ([v4 count] == 1)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 anyNode];
    [v5 addObject:v6];
  }
}

- (id)sameMonthMoments
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = (void *)MEMORY[0x1E4F76C68];
  id v5 = [(PGGraphMomentNode *)self localStartDate];
  id v6 = [v4 components:12 fromDate:v5];

  id v7 = [(MANode *)self graph];
  v8 = +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", [v6 year], v7);
  id v9 = +[PGGraphMonthNodeCollection monthNodesForMonth:inGraph:](PGGraphMonthNodeCollection, "monthNodesForMonth:inGraph:", [v6 month], v7);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__PGGraphMomentNode_sameMonthMoments__block_invoke;
  v16[3] = &unk_1E68EDB08;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v10 = v3;
  id v19 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = (void (**)(void *, void))_Block_copy(v16);
  v13[2](v13, 0);
  v13[2](v13, 1);
  id v14 = v10;

  return v14;
}

void __37__PGGraphMomentNode_sameMonthMoments__block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) collection];
  while (1)
  {
    id v5 = (void *)MEMORY[0x1D25FED50]();
    if (a2) {
      [v4 nextMomentNodes];
    }
    else {
    id v6 = [v4 previousMomentNodes];
    }

    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v7 = [v6 dateNodes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__PGGraphMomentNode_sameMonthMoments__block_invoke_2;
    v10[3] = &unk_1E68EDAE0;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v13 = &v14;
    [v7 enumerateIdentifiersAsCollectionsWithBlock:v10];

    if (!*((unsigned char *)v15 + 24)) {
      break;
    }
    v8 = *(void **)(a1 + 56);
    id v9 = [v6 anyNode];
    [v8 addObject:v9];

    _Block_object_dispose(&v14, 8);
    id v4 = v6;
    if (![v6 count]) {
      goto LABEL_9;
    }
  }

  _Block_object_dispose(&v14, 8);
LABEL_9:
}

void __37__PGGraphMomentNode_sameMonthMoments__block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  id v6 = [v8 monthNodes];
  if ([v6 isEqual:a1[4]])
  {
    id v7 = [v8 yearNodes];
    if ([v7 isEqual:a1[5]])
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)sameWeekendMoments
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if ([(PGGraphMomentNode *)self isWeekend])
  {
    v45 = v3;
    id v4 = [(MANode *)self graph];
    id v5 = [v4 localDatesForMomentNode:self];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (!v6) {
      goto LABEL_51;
    }
    uint64_t v7 = v6;
    v44 = self;
    id v8 = 0;
    uint64_t v9 = *(void *)v57;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v54 = 0;
        double v55 = 0.0;
        objc_msgSend(MEMORY[0x1E4F76C80], "closestWeekendLocalStartDate:interval:afterDate:", &v54, &v55, v12, v44);
        id v13 = v54;
        uint64_t v14 = v13;
        if (!v8 || v55 < v10)
        {
          id v15 = v13;

          double v10 = v55;
          id v8 = v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v7);
    uint64_t v16 = v44;
    if (v8)
    {
      char v17 = [v8 dateByAddingTimeInterval:v10];
      id v18 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v8];

      id v19 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v17];

      uint64_t v20 = [(PGGraphMomentNode *)v44 previousMomentNode];
      if (v20)
      {
        id v21 = (void *)v20;
        do
        {
          v22 = [v4 localDatesForMomentNode:v21];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v23 = v22;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v61 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v51;
            char v27 = 1;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v51 != v26) {
                  objc_enumerationMutation(v23);
                }
                if ([*(id *)(*((void *)&v50 + 1) + 8 * j) compare:v18] == -1)
                {
                  char v27 = 0;
                }
                else if ([v21 isWeekend])
                {
                  [v45 addObject:v21];
                  goto LABEL_28;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v50 objects:v61 count:16];
            }
            while (v25);
          }
          else
          {
            char v27 = 1;
          }
LABEL_28:

          v29 = [v21 previousMomentNode];

          if ((v27 & 1) == 0) {
            break;
          }
          id v21 = v29;
        }
        while (v29);

        uint64_t v16 = v44;
      }
      uint64_t v30 = [(PGGraphMomentNode *)v16 nextMomentNode];
      if (v30)
      {
        v31 = (void *)v30;
        do
        {
          id v32 = [v4 localDatesForMomentNode:v31];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v33 = v32;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v60 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            char v36 = 0;
            uint64_t v37 = *(void *)v47;
            while (2)
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v47 != v37) {
                  objc_enumerationMutation(v33);
                }
                if ([*(id *)(*((void *)&v46 + 1) + 8 * k) compare:v19] != 1)
                {
                  if ([v31 isWeekend])
                  {
                    [v45 addObject:v31];
                    char v36 = 1;
                    goto LABEL_46;
                  }
                  char v36 = 1;
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v60 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v36 = 0;
          }
LABEL_46:

          v39 = [v31 nextMomentNode];

          if ((v36 & 1) == 0) {
            break;
          }
          v31 = v39;
        }
        while (v39);
      }
      id v3 = v45;
      id v40 = v45;
    }
    else
    {
LABEL_51:
      id v42 = v3;
    }
  }
  else
  {
    id v41 = v3;
  }

  return v3;
}

- (id)lastWeekendMoments
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(MANode *)self graph];
  id v5 = [v4 localDatesForMomentNode:self];
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v31[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  if ([v8 count])
  {
    uint64_t v9 = [v8 firstObject];
    *(void *)buf = 0;
    uint64_t v28 = 0;
    [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v28 interval:buf options:4 afterDate:v9];
    double v10 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v28];
    uint64_t v11 = [(PGGraphMomentNode *)self previousMomentNode];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v23 = v9;
      do
      {
        id v13 = [v4 localDatesForMomentNode:v12];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          char v18 = 1;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v24 + 1) + 8 * i) compare:v10] == -1)
              {
                char v18 = 0;
              }
              else if ([v12 isWeekend])
              {
                [v3 addObject:v12];
                goto LABEL_17;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }
          while (v16);
        }
        else
        {
          char v18 = 1;
        }
LABEL_17:

        uint64_t v20 = [v12 previousMomentNode];

        if ((v18 & 1) == 0) {
          break;
        }
        uint64_t v12 = v20;
      }
      while (v20);

      uint64_t v9 = v23;
    }
  }
  else
  {
    id v21 = +[PGLogging sharedLogging];
    uint64_t v9 = [v21 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = self;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "No date node for moment node %@", buf, 0xCu);
    }
  }

  return v3;
}

- (id)weekendNode
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 weekendNodes];
  id v4 = [v3 anyNode];

  return v4;
}

- (BOOL)isWeekend
{
  v2 = [(PGGraphMomentNode *)self weekendNode];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(PGGraphMomentNode *)self domain] == a3)
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:self];
  }
  else if (v3 == 102)
  {
    uint64_t v6 = [(PGGraphMomentNode *)self highlightNode];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    }
    else
    {
      double v10 = +[PGLogging sharedLogging];
      uint64_t v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = self;
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Moment node has no highlight node: %@", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v5 = (void *)v7;
  }
  else
  {
    id v8 = +[PGLogging sharedLogging];
    uint64_t v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 67109120;
      LODWORD(v14) = v3;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Unsupported target domain: %u", (uint8_t *)&v13, 8u);
    }

    id v5 = 0;
  }
  return v5;
}

- (double)weightForMoment:(id)a3
{
  return 1.0;
}

- (id)fetchAssetCollectionInPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(MANode *)self graph];
  uint64_t v6 = [v5 momentForMomentNode:self inPhotoLibrary:v4];

  return v6;
}

- (id)anniversaryPersonNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  int v3 = [v2 anniversaryPersonNodes];

  return v3;
}

- (id)birthdayPersonNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  int v3 = [v2 birthdayPersonNodes];

  return v3;
}

- (id)reliableMeaningLabels
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PGGraphMomentNode_reliableMeaningLabels__block_invoke;
  v6[3] = &unk_1E68EDAB8;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateReliableMeaningNodesUsingBlock:v6];

  return v4;
}

void __42__PGGraphMomentNode_reliableMeaningLabels__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 label];
  [v2 addObject:v3];
}

- (NSString)uuid
{
  return self->_localIdentifier;
}

- (id)eventEnrichmentSortedMomentNodes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)naturalLanguageFeatures
{
  id v3 = [PGTextFeatureGenerator alloc];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:self];
  id v5 = [(MANode *)self graph];
  uint64_t v6 = [(PGTextFeatureGenerator *)v3 initWithMomentNodes:v4 graph:v5];

  id v7 = [(PGTextFeatureGenerator *)v6 naturalLanguageFeatures];

  return v7;
}

- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4
{
  v47[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  id v32 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  if ((a3 & 2) != 0)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [(PGGraphMomentNode *)self localStartDate];
    int v13 = [v11 stringWithFormat:@"[EventStart] %@", v12];

    id v14 = NSString;
    uint64_t v15 = [(PGGraphMomentNode *)self localEndDate];
    uint64_t v16 = [v14 stringWithFormat:@"[EventEnd] %@", v15];

    [v7 addObject:v13];
    [v7 addObject:v16];
  }
  uint64_t v17 = (void *)&unk_1D1F4E000;
  if (a3)
  {
    char v18 = [(MANode *)self graph];
    id v19 = +[PGGraphNodeCollection nodesInGraph:v18];
    uint64_t v20 = [v19 anyNode];

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke;
    v42[3] = &unk_1E68ED998;
    id v43 = v6;
    id v44 = v20;
    id v21 = v33;
    id v45 = v21;
    id v22 = v20;
    [(PGGraphMomentNode *)self enumeratePersonEdgesAndNodesUsingBlock:v42];
    id v23 = objc_msgSend(NSString, "stringWithFormat:", @"[All Persons] %lu", -[PGGraphMomentNode totalNumberOfPersons](self, "totalNumberOfPersons"));
    [v21 addObject:v23];

    uint64_t v17 = &unk_1D1F4E000;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = v17[290];
  v34[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_2;
  v34[3] = &unk_1E68EDA90;
  id v40 = v10;
  unint64_t v41 = a3;
  id v35 = v6;
  id v36 = v32;
  id v37 = v7;
  id v38 = v8;
  id v39 = v9;
  id v24 = v10;
  id v25 = v9;
  id v26 = v8;
  id v27 = v7;
  id v28 = v32;
  id v29 = v6;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v34];
  v46[0] = &unk_1F28D2910;
  v46[1] = &unk_1F28D2928;
  v47[0] = v33;
  v47[1] = v28;
  v46[2] = &unk_1F28D2940;
  v46[3] = &unk_1F28D2958;
  v47[2] = v27;
  v47[3] = v26;
  v46[4] = &unk_1F28D2970;
  v46[5] = &unk_1F28D2988;
  v47[4] = v25;
  v47[5] = v24;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:6];

  return v30;
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (!v7 || [v7 containsObject:v6])
  {
    id v8 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v9 = [v6 keywordDescription];
    double v10 = [v8 stringWithString:v9];

    if (*(void *)(a1 + 40) && (objc_msgSend(v6, "isEqualToNode:") & 1) == 0)
    {
      uint64_t v11 = [v6 collection];
      uint64_t v12 = [v11 relationshipEdges];
      int v13 = [v12 labels];

      if ([v13 count])
      {
        id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
        v19[0] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        uint64_t v16 = [v13 sortedArrayUsingDescriptors:v15];

        uint64_t v17 = [v16 componentsJoinedByString:@"/"];
        [v10 appendFormat:@" - %@ -", v17];
      }
    }
    [v5 importance];
    objc_msgSend(v10, "appendFormat:", @" (%0.2f)", v18);
    [*(id *)(a1 + 48) addObject:v10];
  }
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_3;
  aBlock[3] = &unk_1E68ED9C0;
  id v7 = v6;
  id v57 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = *(void **)(a1 + 32);
  if (!v9 || [v9 containsObject:v7])
  {
    if ([v5 domain] == 200 && (*(unsigned char *)(a1 + 80) & 4) != 0)
    {
      [v5 relevance];
      uint64_t v14 = v13;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_4;
      v54[3] = &unk_1E68ED9E8;
      v55[1] = v13;
      uint64_t v12 = (id *)v55;
      v55[0] = *(id *)(a1 + 40);
      id v15 = v7;
      [v15 enumerateOutEdgesUsingBlock:v54];
      uint64_t v16 = [v15 collection];
      uint64_t v17 = [v16 homeWorkNodes];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_5;
      v51[3] = &unk_1E68EDA38;
      uint64_t v53 = v14;
      id v52 = *(id *)(a1 + 40);
      [v17 enumerateNodesUsingBlock:v51];

      goto LABEL_10;
    }
    if ([v5 domain] == 400 && (*(unsigned char *)(a1 + 80) & 2) != 0)
    {
      double v10 = *(void **)(a1 + 48);
      uint64_t v11 = [v7 keywordDescription];
      [v10 addObject:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_7;
        v49[3] = &unk_1E68EDA60;
        uint64_t v12 = &v50;
        id v50 = *(id *)(a1 + 48);
        [v7 enumerateHolidayEdgesAndNodesUsingBlock:v49];
LABEL_10:
      }
    }
  }
  if ([v5 domain] == 301 && (*(unsigned char *)(a1 + 80) & 8) != 0)
  {
    id v23 = [v5 label];
    if ([v23 isEqualToString:@"BIRTHDAY"]
      || [v23 isEqualToString:@"BIRTHDAY"])
    {
      id v33 = *(void **)(a1 + 56);
      [v5 confidence];
      uint64_t v34 = v8[2](v8);
      [v33 addObject:v34];
    }
    goto LABEL_37;
  }
  if ([v5 domain] == 401 && (*(unsigned char *)(a1 + 80) & 8) != 0)
  {
    id v32 = *(void **)(a1 + 56);
    goto LABEL_32;
  }
  int v18 = [v5 domain];
  uint64_t v19 = *(void *)(a1 + 80);
  if (v18 == 700 && (v19 & 8) != 0)
  {
    uint64_t v20 = *(void **)(a1 + 56);
    id v21 = NSString;
    id v22 = v5;
    id v23 = [v22 label];
    id v24 = [v23 capitalizedString];
    id v25 = [v7 label];
    [v22 confidence];
    uint64_t v27 = v26;
    int v28 = [v22 isReliable];

    id v29 = @"Unreliable";
    if (v28) {
      id v29 = @"Reliable";
    }
    uint64_t v30 = [v21 stringWithFormat:@"[%@] %@ (%.2f, %@)", v24, v25, v27, v29];
    [v20 addObject:v30];

    goto LABEL_37;
  }
  int v31 = [v5 domain];
  if ((v19 & 0x10) != 0)
  {
    if (v31 != 501 && [v5 domain] != 502) {
      goto LABEL_38;
    }
LABEL_35:
    id v32 = *(void **)(a1 + 64);
    [v5 confidence];
    uint64_t v35 = v8[2](v8);
    goto LABEL_36;
  }
  if (v31 == 600 && (*(unsigned char *)(a1 + 80) & 0x20) != 0)
  {
    id v36 = v5;
    id v37 = v7;
    long long v48 = v37;
    int v38 = [v36 isReliable];
    id v39 = @"NO";
    if (v38) {
      id v39 = @"YES";
    }
    id v40 = v39;
    uint64_t v47 = [v36 numberOfAssets];
    uint64_t v41 = [v36 numberOfHighConfidenceAssets];
    uint64_t v42 = [v36 numberOfSearchConfidenceAssets];
    id v43 = NSString;
    id v44 = [v37 keywordDescription];
    [v36 confidence];
    uint64_t v46 = v45;

    id v23 = [v43 stringWithFormat:@"%@ #all:%lu #highConf:%lu #searchConf:%lu reliable:%@ - (%0.2f)", v44, v47, v41, v42, v40, v46];

    [*(id *)(a1 + 72) addObject:v23];
    goto LABEL_37;
  }
  if ([v5 domain] == 503 && (*(unsigned char *)(a1 + 80) & 0x10) != 0) {
    goto LABEL_35;
  }
  if ([v5 domain] == 900 && (*(unsigned char *)(a1 + 80) & 0x10) != 0)
  {
    id v32 = *(void **)(a1 + 64);
LABEL_32:
    uint64_t v35 = [v7 keywordDescription];
LABEL_36:
    id v23 = (void *)v35;
    [v32 addObject:v35];
LABEL_37:
  }
LABEL_38:
}

id __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_3(uint64_t a1, double a2)
{
  id v3 = NSString;
  id v4 = [*(id *)(a1 + 32) keywordDescription];
  id v5 = [v3 stringWithFormat:@"%@ (%0.2f)", v4, *(void *)&a2];

  return v5;
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 domain] == 200)
  {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else
  {
    if ([v9 domain] != 201) {
      goto LABEL_6;
    }
    [v9 relevance];
    uint64_t v3 = v4;
  }
  id v5 = [v9 targetNode];
  id v6 = NSString;
  id v7 = [v5 keywordDescription];
  id v8 = [v6 stringWithFormat:@"%@ (%0.2f)", v7, v3];

  [*(id *)(a1 + 32) addObject:v8];
LABEL_6:
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 collection];
  id v5 = [v4 ownerNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_6;
  v7[3] = &unk_1E68EDA10;
  id v8 = v3;
  uint64_t v10 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateNodesUsingBlock:v7];
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = NSString;
  id v5 = [a3 keywordDescription];
  id v6 = [v4 stringWithFormat:@"%@", v5];

  [*(id *)(a1 + 32) addObject:v6];
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = NSString;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 label];
  id v7 = [v5 name];

  id v8 = [v3 stringWithFormat:@"[%@] - %@ (%0.2f)", v6, v7, *(void *)(a1 + 48)];

  [*(id *)(a1 + 40) addObject:v8];
}

- (id)debugDictionaryWithServiceManager:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = NSNumber;
  [(PGGraphMomentNode *)self graphScore];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"graphScore"];

  id v7 = objc_alloc_init(PGNeighborScoreComputer);
  id v8 = NSNumber;
  [(PGNeighborScoreComputer *)v7 neighborScoreWithMomentNode:self];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v4 setObject:v9 forKeyedSubscript:@"neighborScore"];

  uint64_t v10 = NSNumber;
  [(PGGraphMomentNode *)self contentScore];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v4 setObject:v11 forKeyedSubscript:@"curationScore"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGGraphMomentNode numberOfAssets](self, "numberOfAssets"));
  [v4 setObject:v12 forKeyedSubscript:@"numberOfAssets"];

  uint64_t v13 = [(PGGraphMomentNode *)self keywordsForRelatedType:63 focusOnNodes:0];
  uint64_t v14 = +[PGManager exportableDictionaryFromKeywords:v13];
  [v4 setObject:v14 forKeyedSubscript:@"keywords"];

  return v4;
}

- (int64_t)_compareToMomentNode:(id)a3 withSortDescriptors:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "compareObject:toObject:", self, v6, (void)v15);
        if (v12)
        {
          int64_t v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)laterMomentNode:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = (PGGraphMomentNode *)a3;
  id v5 = self;
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    id v7 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v6);
    v13[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    v13[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

    if ([(PGGraphMomentNode *)v5 _compareToMomentNode:v4 withSortDescriptors:v9] == -1)uint64_t v10 = v4; {
    else
    }
      uint64_t v10 = v5;
    uint64_t v11 = v10;

    id v5 = v11;
  }

  return v5;
}

- (id)earlierMomentNode:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = (PGGraphMomentNode *)a3;
  id v5 = self;
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    id v7 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v6);
    v13[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    v13[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

    if ([(PGGraphMomentNode *)v5 _compareToMomentNode:v4 withSortDescriptors:v9] == 1)uint64_t v10 = v4; {
    else
    }
      uint64_t v10 = v5;
    uint64_t v11 = v10;

    id v5 = v11;
  }

  return v5;
}

- (void)enumerateMeaningfulEventsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, PGGraphMomentNode *, unsigned char *))a3;
  char v5 = 0;
  if ([(PGGraphMomentNode *)self hasMeanings]) {
    v4[2](v4, self, &v5);
  }
}

- (void)enumerateReliableMeaningNodesUsingBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(PGGraphMomentNode *)self collection];
  char v5 = [v6 reliableMeaningNodes];
  [v5 enumerateNodesUsingBlock:v4];
}

- (void)enumerateMeaningNodesUsingBlock:(id)a3
{
}

- (void)enumerateAlternativeMeaningEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateMeaningEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateMeaningEdgesAndNodesWithDomain:(unsigned __int16)a3 block:(id)a4
{
}

- (id)alternativeMeaningLabelsIncludingParents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphMomentNode *)self alternativeMeaningLabels];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __61__PGGraphMomentNode_alternativeMeaningLabelsIncludingParents__block_invoke;
        v11[3] = &unk_1E68ED970;
        id v12 = v3;
        +[PGGraph traverseParentMeaningsForMeaningLabel:v8 usingBlock:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __61__PGGraphMomentNode_alternativeMeaningLabelsIncludingParents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)meaningLabelsIncludingParents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphMomentNode *)self meaningLabels];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __50__PGGraphMomentNode_meaningLabelsIncludingParents__block_invoke;
        v11[3] = &unk_1E68ED970;
        id v12 = v3;
        +[PGGraph traverseParentMeaningsForMeaningLabel:v8 usingBlock:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __50__PGGraphMomentNode_meaningLabelsIncludingParents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)alternativeMeaningNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 alternativeMeaningNodes];

  return v3;
}

- (id)alternativeMeaningLabels
{
  v2 = [(PGGraphMomentNode *)self alternativeMeaningNodes];
  id v3 = [v2 meaningLabels];

  return v3;
}

- (id)meaningNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 meaningNodes];

  return v3;
}

- (id)meaningLabels
{
  v2 = [(PGGraphMomentNode *)self meaningNodes];
  id v3 = [v2 meaningLabels];

  return v3;
}

- (BOOL)hasMeanings
{
  return [(MANode *)self hasEdgeWithLabel:@"MEANING" domain:700];
}

- (double)meaningScore
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = +[PGGraph frequentMeaningLabels];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__PGGraphMomentNode_meaningScore__block_invoke;
  v7[3] = &unk_1E68ED948;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = &v10;
  [(PGGraphMomentNode *)self enumerateMeaningNodesUsingBlock:v7];
  double v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __33__PGGraphMomentNode_meaningScore__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = [a2 label];
  LOBYTE(v5) = [v5 containsObject:v6];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = 0.5;
  if ((v5 & 1) == 0)
  {
    *a3 = 1;
    double v8 = 1.0;
  }
  *(double *)(v7 + 24) = v8;
}

- (id)publicEventNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphMomentNode_publicEventNodes__block_invoke;
  v6[3] = &unk_1E68ED920;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumeratePublicEventNodesUsingBlock:v6];

  return v4;
}

uint64_t __37__PGGraphMomentNode_publicEventNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)businessNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphMomentNode_businessNodes__block_invoke;
  v6[3] = &unk_1E68ED8F8;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateBusinessNodesUsingBlock:v6];

  return v4;
}

uint64_t __34__PGGraphMomentNode_businessNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)addressNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 addressNodes];
  id v4 = [v3 temporarySet];

  return v4;
}

- (BOOL)hasLocation
{
  return [(MANode *)self hasEdgeWithLabel:0 domain:200];
}

- (id)roiNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__PGGraphMomentNode_roiNodes__block_invoke;
  v6[3] = &unk_1E68ED8D0;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateROINodesUsingBlock:v6];

  return v4;
}

uint64_t __29__PGGraphMomentNode_roiNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)poiNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__PGGraphMomentNode_poiNodes__block_invoke;
  v6[3] = &unk_1E68ED8A8;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumeratePOINodesUsingBlock:v6];

  return v4;
}

uint64_t __29__PGGraphMomentNode_poiNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)celebratedHolidayNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphMomentNode_celebratedHolidayNodes__block_invoke;
  v6[3] = &unk_1E68EF038;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateCelebratedHolidayNodesUsingBlock:v6];

  return v4;
}

uint64_t __43__PGGraphMomentNode_celebratedHolidayNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)holidayNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PGGraphMomentNode_holidayNodes__block_invoke;
  v6[3] = &unk_1E68ED880;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateDateNodesUsingBlock:v6];

  return v4;
}

void __33__PGGraphMomentNode_holidayNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__PGGraphMomentNode_holidayNodes__block_invoke_2;
  v3[3] = &unk_1E68EF038;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateHolidayNodesUsingBlock:v3];
}

uint64_t __33__PGGraphMomentNode_holidayNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)seasonNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PGGraphMomentNode_seasonNodes__block_invoke;
  v6[3] = &unk_1E68ED880;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateDateNodesUsingBlock:v6];

  return v4;
}

void __32__PGGraphMomentNode_seasonNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 seasonNode];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (id)dateNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PGGraphMomentNode_dateNodes__block_invoke;
  v6[3] = &unk_1E68ED880;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateDateNodesUsingBlock:v6];

  return v4;
}

uint64_t __30__PGGraphMomentNode_dateNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)consolidatedPersonNodesPresentInAssets
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 consolidatedPersonNodesPresentInAssets];
  id v4 = [v3 set];

  return v4;
}

- (id)consolidatedPersonNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 consolidatedPersonNodes];
  id v4 = [v3 set];

  return v4;
}

- (id)personNodesInProximity
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 personNodesInProximity];
  id v4 = [v3 set];

  return v4;
}

- (id)socialGroupNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 socialGroupNodes];
  id v4 = [v3 set];

  return v4;
}

- (id)petNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 petNodes];
  id v4 = [v3 set];

  return v4;
}

- (id)personNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 personNodes];
  id v4 = [v3 set];

  return v4;
}

- (BOOL)hasPeopleCountingMe:(BOOL)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PGGraphMomentNode_hasPeopleCountingMe___block_invoke;
  v5[3] = &unk_1E68ED858;
  v5[4] = &v7;
  BOOL v6 = a3;
  [(PGGraphMomentNode *)self enumeratePersonNodesUsingBlock:v5];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __41__PGGraphMomentNode_hasPeopleCountingMe___block_invoke(uint64_t result, void *a2, unsigned char *a3)
{
  uint64_t v4 = result;
  if (*(unsigned char *)(result + 40))
  {
    char v5 = 1;
  }
  else
  {
    result = [a2 isMeNode];
    char v5 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = v5;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24);
  return result;
}

- (BOOL)happensAtFrequentLocation
{
  return [(MANode *)self hasEdgeWithLabel:@"IN" domain:204];
}

- (NSSet)frequentLocationNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  char v3 = [v2 frequentLocationNodes];
  uint64_t v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (void)enumeratePetNodesUsingBlock:(id)a3
{
}

- (void)enumerateFrequentLocationNodesUsingBlock:(id)a3
{
}

- (id)eventSortedMomentNodes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)enumeratePublicEventNodesUsingBlock:(id)a3
{
}

- (void)enumeratePublicEventEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateBusinessNodesUsingBlock:(id)a3
{
}

- (void)enumerateBusinessEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateSceneNodesUsingBlock:(id)a3
{
}

- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateROINodesUsingBlock:(id)a3
{
}

- (void)enumerateROIEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumeratePOINodesUsingBlock:(id)a3
{
}

- (void)enumeratePOIEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateSocialGroupNodesUsingBlock:(id)a3
{
}

- (void)enumerateSocialGroupEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateHighlightNodesUsingBlock:(id)a3
{
}

- (void)enumeratePersonNodesUsingBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(PGGraphMomentNode *)self collection];
  char v5 = [v6 personNodes];
  [v5 enumerateNodesUsingBlock:v4];
}

- (void)enumeratePersonEdgesAndNodesUsingBlock:(id)a3
{
}

- (id)remoteAddressEdges
{
  return [(MANode *)self edgesForLabel:@"REMOTE_ADDRESS" domain:200];
}

- (void)enumerateConsolidatedAddressesUsingBlock:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  long long v48 = (void (**)(id, id, unsigned char *))a3;
  id v4 = (void *)MEMORY[0x1D25FED50]();
  char v56 = 0;
  char v5 = [(PGGraphMomentNode *)self preciseAddressEdges];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v7 = [v5 anyObject];
      [(PGConsolidatedAddress *)v7 photoCoordinate];
      double v9 = v8;
      double v11 = v10;
      uint64_t v12 = [PGConsolidatedAddress alloc];
      uint64_t v13 = [(PGConsolidatedAddress *)v7 targetNode];
      v59[0] = v7;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
      long long v15 = -[PGConsolidatedAddress initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:](v12, "initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:", v13, v14, v9, v11);

      v48[2](v48, v15, &v56);
LABEL_30:

      goto LABEL_31;
    }
    long long v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestampUTCStart" ascending:1];
    long long v58 = v16;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    uint64_t v18 = [v5 sortedArrayUsingDescriptors:v17];

    long long v55 = 0uLL;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v7 = v18;
    uint64_t v20 = [(PGConsolidatedAddress *)v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v46 = v5;
      uint64_t v47 = v4;
      long long v15 = 0;
      uint64_t v49 = *(void *)v52;
      double v22 = 0.0;
      double v23 = 0.0;
      do
      {
        uint64_t v24 = 0;
        do
        {
          double v25 = v23;
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(v7);
          }
          uint64_t v26 = *(void **)(*((void *)&v51 + 1) + 8 * v24);
          uint64_t v27 = (void *)MEMORY[0x1D25FED50]();
          int v28 = v27;
          if (v56)
          {
            goto LABEL_22;
          }
          id v29 = [v26 targetNode];
          [v26 timestampUTCEnd];
          double v23 = v30;
          [v26 photoCoordinate];
          *(void *)&long long v50 = v31;
          *((void *)&v50 + 1) = v32;
          [v26 relevance];
          double v34 = v33;
          if (v15)
          {
            if ([(PGConsolidatedAddress *)v15 isSameNodeAsNode:v29]
              && ([v26 timestampUTCStart], v35 - v25 <= 14400.0)
              && (CLLocationCoordinate2DGetDistanceFrom(), v36 <= 1500.0))
            {
              [v19 addObject:v26];
              CLSCentroidForCoordinates();
              *(void *)&long long v55 = v41;
              *((void *)&v55 + 1) = v42;
              double v22 = v22 + v34;
            }
            else
            {
              id v37 = [PGConsolidatedAddress alloc];
              int v38 = [(PGConsolidatedAddress *)v37 initWithAddressNode:v15 addressEdgesSortedByTime:v19 centerCoordinates:v55];
              v48[2](v48, v38, &v56);
              id v39 = v29;

              long long v55 = v50;
              uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v26, 0);

              id v19 = (id)v40;
              double v22 = v34;
              long long v15 = v39;
            }
          }
          else
          {
            long long v15 = v29;
            long long v55 = v50;
            [v19 addObject:v26];
            double v22 = v34;
          }

          ++v24;
        }
        while (v21 != v24);
        uint64_t v43 = [(PGConsolidatedAddress *)v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
        uint64_t v21 = v43;
      }
      while (v43);
LABEL_22:

      if (!v15)
      {
        char v5 = v46;
        id v4 = v47;
        goto LABEL_29;
      }
      char v5 = v46;
      id v4 = v47;
      if (![v19 count] || v56) {
        goto LABEL_29;
      }
      id v44 = [PGConsolidatedAddress alloc];
      uint64_t v45 = [(PGConsolidatedAddress *)v44 initWithAddressNode:v15 addressEdgesSortedByTime:v19 centerCoordinates:v55];
      v48[2](v48, v45, &v56);
    }
    else
    {
      long long v15 = 0;
      uint64_t v45 = v7;
    }

LABEL_29:
    goto LABEL_30;
  }
LABEL_31:
}

- (void)enumerateRemoteAddressNodesUsingBlock:(id)a3
{
}

- (void)enumeratePreciseAddressNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMomentNode_enumeratePreciseAddressNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68ED800;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"ADDRESS" domain:200 usingBlock:v6];
}

void __60__PGGraphMomentNode_enumeratePreciseAddressNodesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPrecise]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumeratePreciseAddressEdgesAndNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphMomentNode_enumeratePreciseAddressEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68ED7D8;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"ADDRESS" domain:200 usingBlock:v6];
}

void __68__PGGraphMomentNode_enumeratePreciseAddressEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isPrecise]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateAddressEdgesAndNodesUsingBlock:(id)a3
{
}

- (BOOL)hasAddressNodes
{
  return [(MANode *)self hasEdgeWithLabel:@"ADDRESS" domain:200];
}

- (id)countryNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 addressNodes];
  id v4 = [v3 countryNodes];
  id v5 = [v4 temporarySet];

  return v5;
}

- (id)cityNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 addressNodes];
  id v4 = [v3 cityNodes];
  id v5 = [v4 temporarySet];

  return v5;
}

- (id)preciseAddressEdges
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphMomentNode_preciseAddressEdges__block_invoke;
  v6[3] = &unk_1E68ED7B0;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMomentNode *)self enumerateAddressEdgesAndNodesUsingBlock:v6];

  return v4;
}

void __40__PGGraphMomentNode_preciseAddressEdges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isPrecise]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)addressEdges
{
  return [(MANode *)self edgesForLabel:@"ADDRESS" domain:200];
}

- (BOOL)hasPersonNodes
{
  v2 = [(PGGraphMomentNode *)self collection];
  id v3 = [v2 personNodes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3
{
}

- (void)enumerateDateNodesUsingBlock:(id)a3
{
}

- (void)enumerateDateEdgesAndNodesUsingBlock:(id)a3
{
}

- (BOOL)isAggregation
{
  return 0;
}

- (BOOL)isTrip
{
  return 0;
}

- (BOOL)isShortTrip
{
  return 0;
}

- (BOOL)isLongTrip
{
  return 0;
}

- (BOOL)endsBeforeLocalDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return self->_localEndTimestamp <= v4;
}

- (BOOL)startsAfterLocalDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return self->_localStartTimestamp >= v4;
}

- (NSDate)universalEndDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_universalEndTimestamp];
}

- (NSDate)universalStartDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_universalStartTimestamp];
}

- (NSDate)localEndDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_localEndTimestamp];
}

- (NSDate)localStartDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_localStartTimestamp];
}

- (void)enumeratePartOfDayEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)_enumeratePartsOfDayWithThreshold:(double)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PGGraphMomentNode__enumeratePartsOfDayWithThreshold_usingBlock___block_invoke;
  v8[3] = &unk_1E68ED780;
  double v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(PGGraphMomentNode *)self enumeratePartOfDayEdgesAndNodesUsingBlock:v8];
}

void __66__PGGraphMomentNode__enumeratePartsOfDayWithThreshold_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  [a2 ratio];
  if (v5 >= *(double *)(a1 + 40))
  {
    [v6 partOfDay];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (unint64_t)_partsOfDayWithThreshold:(double)a3
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PGGraphMomentNode__partsOfDayWithThreshold___block_invoke;
  v5[3] = &unk_1E68ED758;
  v5[4] = &v6;
  void v5[5] = &v10;
  [(PGGraphMomentNode *)self _enumeratePartsOfDayWithThreshold:v5 usingBlock:a3];
  if (*((unsigned char *)v7 + 24))
  {
    unint64_t v3 = v11[3];
  }
  else
  {
    unint64_t v3 = 1;
    v11[3] = 1;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

uint64_t __46__PGGraphMomentNode__partsOfDayWithThreshold___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 != 1) {
    *(void *)(v2 + 24) = v3 | a2;
  }
  return result;
}

- (void)enumerateSignificantPartsOfDayUsingBlock:(id)a3
{
}

- (void)enumeratePartsOfDayUsingBlock:(id)a3
{
}

- (unint64_t)significantPartsOfDay
{
  return [(PGGraphMomentNode *)self _partsOfDayWithThreshold:0.4];
}

- (unint64_t)partsOfDay
{
  return [(PGGraphMomentNode *)self _partsOfDayWithThreshold:0.0];
}

- (CLLocationCoordinate2D)bestLocationCoordinate
{
  uint64_t v2 = [(PGGraphMomentNode *)self bestAddressNode];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1E750];
    double v7 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (id)bestAddressNode
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__60764;
  double v11 = __Block_byref_object_dispose__60765;
  id v12 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0xFFEFFFFFFFFFFFFFLL;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __36__PGGraphMomentNode_bestAddressNode__block_invoke;
  v4[3] = &unk_1E68ED730;
  v4[4] = v6;
  v4[5] = v5;
  v4[6] = &v7;
  [(PGGraphMomentNode *)self enumerateAddressEdgesAndNodesUsingBlock:v4];
  id v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);

  return v2;
}

void __36__PGGraphMomentNode_bestAddressNode__block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a3;
  [a2 relevance];
  double v7 = v6;
  double v8 = *(double *)(*(void *)(a1[4] + 8) + 24);
  if (v7 > v8)
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
    *(double *)(*(void *)(a1[4] + 8) + 24) = v7;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *(void *)(*(void *)(a1[5] + 8) + 24) = v9;
    goto LABEL_10;
  }
  if (v7 == v8)
  {
    unint64_t v9 = [v12 countOfEdgesWithLabel:@"ADDRESS" domain:200];
    unint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) countOfEdgesWithLabel:@"ADDRESS" domain:200];
      unint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
    }
    if (v10 < v9) {
      goto LABEL_9;
    }
    if (v10 == v9)
    {
      unint64_t v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) identifier];
      if (v11 < [v12 identifier]) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (PGGraphMomentNode)nextMomentNode
{
  id v2 = [(PGGraphMomentNode *)self collection];
  uint64_t v3 = [v2 nextMomentNodes];
  double v4 = [v3 anyNode];

  return (PGGraphMomentNode *)v4;
}

- (PGGraphMomentNode)previousMomentNode
{
  id v2 = [(PGGraphMomentNode *)self collection];
  uint64_t v3 = [v2 previousMomentNodes];
  double v4 = [v3 anyNode];

  return (PGGraphMomentNode *)v4;
}

- (PGGraphMomentNodeCollection)collection
{
  id v2 = [(MANodeCollection *)[PGGraphMomentNodeCollection alloc] initWithNode:self];
  return v2;
}

- (BOOL)isMeaningful
{
  return [(MANode *)self hasEdgeWithLabel:@"MEANING" domain:700];
}

- (BOOL)isPartOfTrip
{
  id v2 = [(PGGraphMomentNode *)self highlightNode];
  char v3 = [v2 isPartOfTrip];

  return v3;
}

- (PGGraphHighlightGroupNode)highlightGroupNode
{
  id v2 = [(PGGraphMomentNode *)self highlightNode];
  char v3 = [v2 highlightGroupNode];

  return (PGGraphHighlightGroupNode *)v3;
}

- (PGGraphHighlightNode)highlightNode
{
  id v2 = [(PGGraphMomentNode *)self collection];
  char v3 = [v2 highlightNodes];
  double v4 = [v3 anyNode];

  return (PGGraphHighlightNode *)v4;
}

- (unint64_t)locationMobilityType
{
  id v2 = [(PGGraphMomentNode *)self collection];
  char v3 = [v2 mobilityNodes];
  double v4 = [v3 anyNode];

  if (v4) {
    unint64_t v5 = [v4 mobilityType];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isInterestingForMemories
{
  id v2 = [(PGGraphMomentNode *)self collection];
  char v3 = [v2 interestingForMemoriesSubset];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)hasEnoughFacesProcessed
{
  [(PGGraphMomentNode *)self facesProcessedRatio];
  return v2 >= 0.9;
}

- (BOOL)hasEnoughScenesProcessed
{
  [(PGGraphMomentNode *)self scenesProcessedRatio];
  return v2 >= 0.9;
}

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PGGraphMomentNode *)self collection];
  char v6 = [v5 happensPartiallyAtHomeOrWorkOfPersonNodes:v4];

  return v6;
}

- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = [(PGGraphMomentNode *)self collection];
    char v6 = [v5 preciseAddressNodes];
    double v7 = [v4 workNodes];
    double v8 = [v7 addressNodes];
    char v9 = [v6 intersectsCollection:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = [(PGGraphMomentNode *)self collection];
    char v6 = [v5 preciseAddressNodes];
    double v7 = [v4 homeNodes];
    double v8 = [v7 addressNodes];
    char v9 = [v6 intersectsCollection:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MAFloatVector)clipFeatureVector
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
  id v12 = 0;
  id v4 = +[PGMomentIngestCLIPFeatureVectorExtractor decodeEncodedCLIPFeatureVector:encodedCLIPFeatureVector withError:&v12];
  id v5 = v12;
  if (v4)
  {
    if ([v4 count]) {
      char v6 = v4;
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    double v8 = +[PGLogging sharedLogging];
    char v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      localIdentifier = self->_localIdentifier;
      *(_DWORD *)buf = 138412290;
      long long v14 = localIdentifier;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Error decoding CLIP Feature for moment %@", buf, 0xCu);
    }

    id v7 = 0;
  }

  return (MAFloatVector *)v7;
}

- (NSString)UUID
{
  return self->_localIdentifier;
}

- (NSString)localIdentifier
{
  return (NSString *)[MEMORY[0x1E4F391A0] localIdentifierWithUUID:self->_localIdentifier];
}

- (unsigned)domain
{
  return 100;
}

- (id)label
{
  double v2 = @"Moment";
  return @"Moment";
}

- (NSDictionary)jsonDescription
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"type";
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  localIdentifier = self->_localIdentifier;
  v9[0] = v4;
  v9[1] = localIdentifier;
  v8[1] = @"localIdentifier";
  v8[2] = @"name";
  v9[2] = self->_name;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphMomentNode (%@, %@)", self->_localIdentifier, self->_name];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    uint64_t v5 = 88;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_15:
    char v9 = v6;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"clipfeature"])
  {
    uint64_t v5 = 40;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"utcs"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 120;
LABEL_14:
    id v6 = [v7 numberWithDouble:*(double *)((char *)&self->super.super.super.super.isa + v8)];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"utce"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 128;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"tzs"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 48;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"tze"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 56;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"tnop"])
  {
    unint64_t v11 = NSNumber;
    unint64_t numberOfAssetsInExtendedCuration = *((unsigned __int16 *)self + 37);
LABEL_21:
    id v6 = [v11 numberWithUnsignedInteger:numberOfAssetsInExtendedCuration];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"inhbtscr"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 96;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"lclid"])
  {
    uint64_t v5 = 32;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"cnt"])
  {
    unint64_t v11 = NSNumber;
    uint64_t v13 = 68;
LABEL_28:
    unint64_t numberOfAssetsInExtendedCuration = *(unsigned int *)((char *)&self->super.super.super.super.isa + v13);
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"sharingComposition"])
  {
    id v6 = [NSNumber numberWithUnsignedShort:self->_sharingComposition];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"nawp"])
  {
    unint64_t v11 = NSNumber;
    uint64_t v13 = 64;
    goto LABEL_28;
  }
  if ([v4 isEqualToString:@"intng"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 4) & 1;
LABEL_39:
    id v6 = [v14 numberWithBool:happensAtSensitiveLocation];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"intngaj"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 5) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"sintng"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 6) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"cntsc"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 104;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"cbsa"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 2) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"hghthnmprv"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = *((unsigned char *)self + 84) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"asswis"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 1) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"cnja"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 3) & 1;
    goto LABEL_39;
  }
  if ([v4 isEqualToString:@"sgem"])
  {
    unint64_t v11 = NSNumber;
    uint64_t v13 = 76;
    goto LABEL_28;
  }
  if ([v4 isEqualToString:@"rgem"])
  {
    unint64_t v11 = NSNumber;
    uint64_t v13 = 80;
    goto LABEL_28;
  }
  if ([v4 isEqualToString:@"bhsc"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 112;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"spr"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 136;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"fpr"])
  {
    id v7 = NSNumber;
    uint64_t v8 = 144;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"extc"])
  {
    unint64_t v11 = NSNumber;
    unint64_t numberOfAssetsInExtendedCuration = self->_numberOfAssetsInExtendedCuration;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"hasl"])
  {
    long long v14 = NSNumber;
    uint64_t happensAtSensitiveLocation = self->_happensAtSensitiveLocation;
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphMomentNode.", (uint8_t *)&v16, 0xCu);
  }
  char v9 = 0;
LABEL_16:

  return v9;
}

- (id)changingPropertiesWithProperties:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGGraphMomentNode *)self propertyDictionary];
  char v6 = [v5 isEqual:v4];

  if (v6)
  {
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"lclid"];
    if (v8 && ![(NSString *)self->_localIdentifier isEqualToString:v8])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412546;
        long long v14 = v8;
        __int16 v15 = 2112;
        int v16 = self;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to merge local identifier %@ into moment node %@", (uint8_t *)&v13, 0x16u);
      }
      id v7 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v7 = v4;
      char v9 = [v7 objectForKeyedSubscript:@"name"];
      unint64_t v10 = v9;
      if (v9 && ![v9 length])
      {
        unint64_t v11 = (void *)[v7 mutableCopy];
        [v11 removeObjectForKey:@"name"];

        id v7 = v11;
      }
    }
  }

  return v7;
}

- (id)propertyDictionary
{
  v34[27] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  if (!name) {
    name = (NSString *)&stru_1F283BC78;
  }
  v33[0] = @"name";
  v33[1] = @"clipfeature";
  encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
  if (!encodedCLIPFeatureVector) {
    encodedCLIPFeatureVector = (NSString *)&stru_1F283BC78;
  }
  v34[0] = name;
  v34[1] = encodedCLIPFeatureVector;
  v33[2] = @"utcs";
  uint64_t v32 = [NSNumber numberWithDouble:self->_universalStartTimestamp];
  v34[2] = v32;
  v33[3] = @"utce";
  uint64_t v31 = [NSNumber numberWithDouble:self->_universalEndTimestamp];
  v34[3] = v31;
  void v33[4] = @"tzs";
  double v30 = [NSNumber numberWithDouble:self->_localStartTimestamp];
  void v34[4] = v30;
  v33[5] = @"tze";
  id v29 = [NSNumber numberWithDouble:self->_localEndTimestamp];
  v34[5] = v29;
  v33[6] = @"tnop";
  int v28 = [NSNumber numberWithUnsignedInteger:*((unsigned __int16 *)self + 37)];
  v34[6] = v28;
  v33[7] = @"inhbtscr";
  uint64_t v5 = [NSNumber numberWithDouble:self->_inhabitationScore];
  uint64_t v27 = (void *)v5;
  localIdentifier = self->_localIdentifier;
  if (!localIdentifier) {
    localIdentifier = (NSString *)&stru_1F283BC78;
  }
  v34[7] = v5;
  v34[8] = localIdentifier;
  v33[8] = @"lclid";
  v33[9] = @"cnt";
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 17)];
  v34[9] = v26;
  v33[10] = @"sharingComposition";
  double v25 = [NSNumber numberWithUnsignedShort:self->_sharingComposition];
  v34[10] = v25;
  v33[11] = @"nawp";
  uint64_t v24 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 16)];
  v34[11] = v24;
  v33[12] = @"intng";
  double v23 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 4) & 1];
  v34[12] = v23;
  v33[13] = @"intngaj";
  double v22 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 5) & 1];
  v34[13] = v22;
  v33[14] = @"sintng";
  uint64_t v21 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 6) & 1];
  v34[14] = v21;
  v33[15] = @"cntsc";
  uint64_t v20 = [NSNumber numberWithDouble:self->_contentScore];
  v34[15] = v20;
  v33[16] = @"cbsa";
  id v19 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 2) & 1];
  v34[16] = v19;
  v33[17] = @"hghthnmprv";
  uint64_t v18 = [NSNumber numberWithBool:*((unsigned char *)self + 84) & 1];
  v34[17] = v18;
  v33[18] = @"asswis";
  id v7 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 1) & 1];
  v34[18] = v7;
  v33[19] = @"cnja";
  uint64_t v8 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 84) >> 3) & 1];
  v34[19] = v8;
  v33[20] = @"sgem";
  char v9 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 19)];
  v34[20] = v9;
  v33[21] = @"rgem";
  unint64_t v10 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 20)];
  v34[21] = v10;
  v33[22] = @"bhsc";
  unint64_t v11 = [NSNumber numberWithDouble:self->_behavioralScore];
  v34[22] = v11;
  v33[23] = @"spr";
  id v12 = [NSNumber numberWithDouble:self->_scenesProcessedRatio];
  v34[23] = v12;
  v33[24] = @"fpr";
  int v13 = [NSNumber numberWithDouble:self->_facesProcessedRatio];
  v34[24] = v13;
  v33[25] = @"extc";
  long long v14 = [NSNumber numberWithUnsignedInteger:self->_numberOfAssetsInExtendedCuration];
  v34[25] = v14;
  v33[26] = @"hasl";
  __int16 v15 = [NSNumber numberWithBool:self->_happensAtSensitiveLocation];
  v34[26] = v15;
  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:27];

  return v16;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    char v6 = [v5 objectForKeyedSubscript:@"lclid"];
    id v7 = v6;
    if (v6 && ![v6 isEqual:self->_localIdentifier]) {
      goto LABEL_59;
    }

    uint64_t v8 = [v5 objectForKeyedSubscript:@"name"];
    id v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_name]) {
        goto LABEL_59;
      }
    }

    char v9 = [v5 objectForKeyedSubscript:@"clipfeature"];
    id v7 = v9;
    if (v9)
    {
      if (![v9 isEqual:self->_encodedCLIPFeatureVector]) {
        goto LABEL_59;
      }
    }

    unint64_t v10 = [v5 objectForKeyedSubscript:@"utcs"];
    id v7 = v10;
    if (v10)
    {
      [v10 doubleValue];
      if (v11 != self->_universalStartTimestamp) {
        goto LABEL_59;
      }
    }

    id v12 = [v5 objectForKeyedSubscript:@"utce"];
    id v7 = v12;
    if (v12)
    {
      [v12 doubleValue];
      if (v13 != self->_universalEndTimestamp) {
        goto LABEL_59;
      }
    }

    long long v14 = [v5 objectForKeyedSubscript:@"tzs"];
    id v7 = v14;
    if (v14)
    {
      [v14 doubleValue];
      if (v15 != self->_localStartTimestamp) {
        goto LABEL_59;
      }
    }

    int v16 = [v5 objectForKeyedSubscript:@"tze"];
    id v7 = v16;
    if (v16)
    {
      [v16 doubleValue];
      if (v17 != self->_localEndTimestamp) {
        goto LABEL_59;
      }
    }

    uint64_t v18 = [v5 objectForKeyedSubscript:@"tnop"];
    id v7 = v18;
    if (v18)
    {
      if ([v18 unsignedIntegerValue] != *((unsigned __int16 *)self + 37)) {
        goto LABEL_59;
      }
    }

    id v19 = [v5 objectForKeyedSubscript:@"inhbtscr"];
    id v7 = v19;
    if (v19)
    {
      [v19 doubleValue];
      if (v20 != self->_inhabitationScore) {
        goto LABEL_59;
      }
    }

    uint64_t v21 = [v5 objectForKeyedSubscript:@"cnt"];
    id v7 = v21;
    if (v21)
    {
      if ([v21 unsignedIntegerValue] != *((_DWORD *)self + 17)) {
        goto LABEL_59;
      }
    }

    double v22 = [v5 objectForKeyedSubscript:@"sharingComposition"];
    id v7 = v22;
    if (v22)
    {
      if ([v22 unsignedShortValue] != self->_sharingComposition) {
        goto LABEL_59;
      }
    }

    double v23 = [v5 objectForKeyedSubscript:@"nawp"];
    id v7 = v23;
    if (v23)
    {
      if ([v23 unsignedIntegerValue] != *((_DWORD *)self + 16)) {
        goto LABEL_59;
      }
    }

    uint64_t v24 = [v5 objectForKeyedSubscript:@"intng"];
    id v7 = v24;
    if (v24)
    {
      if ([v24 BOOLValue] == ((*((unsigned char *)self + 84) & 0x10) == 0)) {
        goto LABEL_59;
      }
    }

    double v25 = [v5 objectForKeyedSubscript:@"intngaj"];
    id v7 = v25;
    if (v25)
    {
      if ([v25 BOOLValue] == ((*((unsigned char *)self + 84) & 0x20) == 0)) {
        goto LABEL_59;
      }
    }

    uint64_t v26 = [v5 objectForKeyedSubscript:@"sintng"];
    id v7 = v26;
    if (v26)
    {
      if ([v26 BOOLValue] == ((*((unsigned char *)self + 84) & 0x40) == 0)) {
        goto LABEL_59;
      }
    }

    uint64_t v27 = [v5 objectForKeyedSubscript:@"cntsc"];
    id v7 = v27;
    if (v27)
    {
      [v27 doubleValue];
      if (v28 != self->_contentScore) {
        goto LABEL_59;
      }
    }

    id v29 = [v5 objectForKeyedSubscript:@"cbsa"];
    id v7 = v29;
    if (v29)
    {
      if ([v29 BOOLValue] == ((*((unsigned char *)self + 84) & 4) == 0)) {
        goto LABEL_59;
      }
    }

    double v30 = [v5 objectForKeyedSubscript:@"hghthnmprv"];
    id v7 = v30;
    if (v30)
    {
      if ([v30 BOOLValue] == ((*((unsigned char *)self + 84) & 1) == 0)) {
        goto LABEL_59;
      }
    }

    uint64_t v31 = [v5 objectForKeyedSubscript:@"asswis"];
    id v7 = v31;
    if (v31)
    {
      if ([v31 BOOLValue] == ((*((unsigned char *)self + 84) & 2) == 0)) {
        goto LABEL_59;
      }
    }

    uint64_t v32 = [v5 objectForKeyedSubscript:@"cnja"];
    id v7 = v32;
    if (v32)
    {
      if ([v32 BOOLValue] == ((*((unsigned char *)self + 84) & 8) == 0)) {
        goto LABEL_59;
      }
    }

    double v33 = [v5 objectForKeyedSubscript:@"sgem"];
    id v7 = v33;
    if (v33)
    {
      if ([v33 unsignedIntegerValue] != *((_DWORD *)self + 19)) {
        goto LABEL_59;
      }
    }

    double v34 = [v5 objectForKeyedSubscript:@"rgem"];
    id v7 = v34;
    if (v34)
    {
      if ([v34 unsignedIntegerValue] != *((_DWORD *)self + 20)) {
        goto LABEL_59;
      }
    }

    double v35 = [v5 objectForKeyedSubscript:@"bhsc"];
    id v7 = v35;
    if (v35)
    {
      [v35 doubleValue];
      if (v36 != self->_behavioralScore) {
        goto LABEL_59;
      }
    }

    id v37 = [v5 objectForKeyedSubscript:@"spr"];
    id v7 = v37;
    if (v37)
    {
      [v37 doubleValue];
      if (v38 != self->_scenesProcessedRatio) {
        goto LABEL_59;
      }
    }

    id v39 = [v5 objectForKeyedSubscript:@"fpr"];
    id v7 = v39;
    if (v39)
    {
      [v39 doubleValue];
      if (v40 != self->_facesProcessedRatio) {
        goto LABEL_59;
      }
    }

    uint64_t v41 = [v5 objectForKeyedSubscript:@"extc"];
    id v7 = v41;
    if (v41)
    {
      if ([v41 unsignedIntegerValue] != self->_numberOfAssetsInExtendedCuration) {
        goto LABEL_59;
      }
    }

    uint64_t v42 = [v5 objectForKeyedSubscript:@"hasl"];
    id v7 = v42;
    if (v42 && self->_happensAtSensitiveLocation != [v42 BOOLValue]) {
LABEL_59:
    }
      BOOL v43 = 0;
    else {
      BOOL v43 = 1;
    }
  }
  else
  {
    BOOL v43 = 1;
  }

  return v43;
}

- (void)setLocalProperties:(id)a3
{
  id v49 = a3;
  if ([v49 count])
  {
    id v4 = [v49 objectForKeyedSubscript:@"name"];
    name = self->_name;
    self->_name = v4;

    char v6 = [v49 objectForKeyedSubscript:@"clipfeature"];
    encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
    self->_encodedCLIPFeatureVector = v6;

    uint64_t v8 = [v49 objectForKeyedSubscript:@"utcs"];
    [v8 doubleValue];
    self->_universalStartTimestamp = v9;

    unint64_t v10 = [v49 objectForKeyedSubscript:@"utce"];
    [v10 doubleValue];
    self->_universalEndTimestamp = v11;

    id v12 = [v49 objectForKeyedSubscript:@"tzs"];
    [v12 doubleValue];
    self->_localStartTimestamp = v13;

    long long v14 = [v49 objectForKeyedSubscript:@"tze"];
    [v14 doubleValue];
    self->_localEndTimestamp = v15;

    int v16 = [v49 objectForKeyedSubscript:@"tnop"];
    *((_WORD *)self + 37) = [v16 unsignedIntegerValue];

    double v17 = [v49 objectForKeyedSubscript:@"inhbtscr"];
    [v17 doubleValue];
    self->_inhabitationScore = v18;

    id v19 = [v49 objectForKeyedSubscript:@"lclid"];
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = v19;

    uint64_t v21 = [v49 objectForKeyedSubscript:@"nawp"];
    *((_DWORD *)self + 16) = [v21 unsignedIntegerValue];

    double v22 = [v49 objectForKeyedSubscript:@"cnt"];
    *((_DWORD *)self + 17) = [v22 unsignedIntegerValue];

    double v23 = [v49 objectForKeyedSubscript:@"sharingComposition"];
    self->_sharingComposition = [v23 unsignedShortValue];

    uint64_t v24 = [v49 objectForKeyedSubscript:@"intng"];
    if ([v24 BOOLValue]) {
      char v25 = 16;
    }
    else {
      char v25 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xEF | v25;

    uint64_t v26 = [v49 objectForKeyedSubscript:@"intngaj"];
    if ([v26 BOOLValue]) {
      char v27 = 32;
    }
    else {
      char v27 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xDF | v27;

    double v28 = [v49 objectForKeyedSubscript:@"sintng"];
    if ([v28 BOOLValue]) {
      char v29 = 64;
    }
    else {
      char v29 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xBF | v29;

    double v30 = [v49 objectForKeyedSubscript:@"cntsc"];
    [v30 doubleValue];
    self->_contentScore = v31;

    uint64_t v32 = [v49 objectForKeyedSubscript:@"cbsa"];
    if ([v32 BOOLValue]) {
      char v33 = 4;
    }
    else {
      char v33 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xFB | v33;

    double v34 = [v49 objectForKeyedSubscript:@"hghthnmprv"];
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xFE | [v34 BOOLValue];

    double v35 = [v49 objectForKeyedSubscript:@"asswis"];
    if ([v35 BOOLValue]) {
      char v36 = 2;
    }
    else {
      char v36 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xFD | v36;

    id v37 = [v49 objectForKeyedSubscript:@"cnja"];
    if ([v37 BOOLValue]) {
      char v38 = 8;
    }
    else {
      char v38 = 0;
    }
    *((unsigned char *)self + 84) = *((unsigned char *)self + 84) & 0xF7 | v38;

    id v39 = [v49 objectForKeyedSubscript:@"sgem"];
    *((_DWORD *)self + 19) = [v39 unsignedIntegerValue];

    double v40 = [v49 objectForKeyedSubscript:@"rgem"];
    *((_DWORD *)self + 20) = [v40 unsignedIntegerValue];

    uint64_t v41 = [v49 objectForKeyedSubscript:@"bhsc"];
    [v41 doubleValue];
    self->_behavioralScore = v42;

    BOOL v43 = [v49 objectForKeyedSubscript:@"spr"];
    [v43 doubleValue];
    self->_scenesProcessedRatio = v44;

    uint64_t v45 = [v49 objectForKeyedSubscript:@"fpr"];
    [v45 doubleValue];
    self->_facesProcessedRatio = v46;

    uint64_t v47 = [v49 objectForKeyedSubscript:@"extc"];
    self->_unint64_t numberOfAssetsInExtendedCuration = [v47 unsignedIntegerValue];

    long long v48 = [v49 objectForKeyedSubscript:@"hasl"];
    self->_uint64_t happensAtSensitiveLocation = [v48 BOOLValue];
  }
}

- (PGGraphMomentNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  id v7 = [(PGGraphNode *)self init];
  uint64_t v8 = v7;
  if (v7) {
    [(PGGraphMomentNode *)v7 setLocalProperties:v6];
  }

  return v8;
}

- (id)initFromMoment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMomentNode;
  uint64_t v5 = [(PGGraphNode *)&v8 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() propertiesWithMoment:v4];
    [(PGGraphMomentNode *)v5 setLocalProperties:v6];
  }
  return v5;
}

+ (MARelation)momentWithOnlySharedAssetsOfMoment
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[PGGraphMomentNode filter];
  id v7 = @"sharingComposition";
  v8[0] = &unk_1F28D29A0;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  uint64_t v5 = [v4 relation];

  return (MARelation *)v5;
}

+ (MARelation)momentWithOnlyPrivateAssetsOfMoment
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[PGGraphMomentNode filter];
  id v7 = @"sharingComposition";
  v8[0] = &unk_1F28D29B8;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  uint64_t v5 = [v4 relation];

  return (MARelation *)v5;
}

+ (MARelation)momentWithPrivateAndSharedAssetsOfMoment
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[PGGraphMomentNode filter];
  id v7 = @"sharingComposition";
  v8[0] = &unk_1F28D29D0;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  uint64_t v5 = [v4 relation];

  return (MARelation *)v5;
}

+ (MARelation)momentWithSharedAssetsOfMoment
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[PGGraphMomentNode filter];
  objc_super v8 = @"sharingComposition";
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&unk_1F28D29B8];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  id v6 = [v5 relation];

  return (MARelation *)v6;
}

+ (MARelation)momentWithPrivateAssetsOfMoment
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v2 = +[PGGraphMomentNode filter];
  objc_super v8 = @"sharingComposition";
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&unk_1F28D29A0];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  id v6 = [v5 relation];

  return (MARelation *)v6;
}

+ (MARelation)highlightOfMoment
{
  double v2 = +[PGGraphContainsEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)cityOfMoment
{
  v13[3] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = [a1 filter];
  id v4 = [v3 relation];
  uint64_t v5 = +[PGGraphLocationEdge filter];
  id v6 = [v5 outRelation];
  id v7 = [v6 transitiveClosure];
  v13[1] = v7;
  objc_super v8 = +[PGGraphLocationCityNode filter];
  double v9 = [v8 relation];
  v13[2] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v2 chain:v10];

  return (MARelation *)v11;
}

+ (MARelation)socialGroupInMoment
{
  double v2 = +[PGGraphSocialGroupEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)meaningHierarchyOfMoment
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = [a1 meaningOfMoment];
  v9[0] = v3;
  id v4 = +[PGGraphMeaningNode parentMeaningOfMeaning];
  uint64_t v5 = [v4 optionalStep];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (MARelation)celebratedHolidayOfMoment
{
  double v2 = +[PGGraphCelebratingEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)personActivityMeaningOfMoment
{
  double v2 = +[PGGraphPersonActivityMeaningEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)reliableMeaningOfMoment
{
  double v2 = +[PGGraphMeaningEdge reliableFilter];
  char v3 = [v2 outRelation];

  return v3;
}

+ (id)alternativeMeaningOfMoment
{
  double v2 = +[PGGraphMeaningEdge filter];
  char v3 = [v2 outRelation];

  return v3;
}

+ (MARelation)meaningOfMoment
{
  double v2 = +[PGGraphMeaningEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)businessOfMoment
{
  double v2 = +[PGGraphPlaceBusinessEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)petPresentInMoment
{
  double v2 = +[PGGraphPetPresentEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)mobilityOfMoment
{
  double v2 = +[PGGraphMobilityEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)significantPartOfDayOfMomentWithHasLegacyWeights:(BOOL)a3
{
  char v3 = +[PGGraphPartOfDayEdge significantFilterWithLegacyWeights:a3];
  id v4 = [v3 outRelation];

  return v4;
}

+ (MARelation)significantPartOfDayOfMoment
{
  double v2 = +[PGGraphPartOfDayEdge significantFilter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)partOfDayOfMoment
{
  double v2 = +[PGGraphPartOfDayEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)remoteAddressOfMoment
{
  double v2 = +[PGGraphRemoteAddressEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)addressOfMoment
{
  double v2 = +[PGGraphAddressEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)frequentLocationOfMoment
{
  double v2 = +[PGGraphFrequentLocationInEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)featureOfMoment
{
  double v2 = +[PGGraphMomentFeaturesEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)memoryOfMoment
{
  double v2 = +[PGGraphMemoryContainsAssetsFromEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)personPhysicallyPresentInMoment
{
  v14[4] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphPeoplePersonIsAroundEdge filter];
  id v4 = [v3 inRelation];
  v14[0] = v4;
  uint64_t v5 = +[PGGraphPersonProximityEdge filter];
  id v6 = [v5 inRelation];
  v14[1] = v6;
  id v7 = +[PGGraphPersonPresentEdge filter];
  objc_super v8 = [v7 inRelation];
  v14[2] = v8;
  double v9 = +[PGGraphAuthorEdge filter];
  unint64_t v10 = [v9 inRelation];
  v14[3] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  id v12 = [v2 union:v11];

  return (MARelation *)v12;
}

+ (MARelation)authorOfMoment
{
  double v2 = +[PGGraphAuthorEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)anniversaryPersonInMoment
{
  double v2 = +[PGGraphAnniversaryEventEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)birthdayPersonInMoment
{
  double v2 = +[PGGraphBirthdayEventEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)personExcludingMeInMoment
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphPersonPresentEdge filter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  uint64_t v5 = +[PGGraphPersonNode filterExcludingMe];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)personInProximityInMoment
{
  double v2 = +[PGGraphPersonProximityEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)consolidatedPersonPresentInAssets
{
  double v2 = +[PGGraphBasePresentEdge consolidatedPresentInAssetsFilter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)consolidatedPersonInMoment
{
  double v2 = +[PGGraphBasePresentEdge consolidatedFilter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)personInMoment
{
  double v2 = +[PGGraphPersonPresentEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)publicEventOfMoment
{
  double v2 = +[PGGraphPublicEventEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)specialPOIOfMoment
{
  double v2 = +[PGGraphPOIEdge filterSpecial];
  char v3 = [v2 outRelation];

  return v3;
}

+ (id)improvedPOIOfMoment
{
  double v2 = +[PGGraphPOIEdge filterImproved];
  char v3 = [v2 outRelation];

  return v3;
}

+ (id)poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3
{
  char v3 = +[PGGraphPOIEdge filterAboveConfidence:a3 hasLegacyWeights:0.0];
  id v4 = [v3 outRelation];

  return v4;
}

+ (MARelation)poiWithNonzeroConfidenceOfMoment
{
  double v2 = +[PGGraphPOIEdge filterAboveConfidence:0.0];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)poiOfMoment
{
  double v2 = +[PGGraphPOIEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3
{
  char v3 = +[PGGraphROIEdge filterAboveConfidence:a3 hasLegacyWeights:0.0];
  id v4 = [v3 outRelation];

  return v4;
}

+ (MARelation)roiWithNonzeroConfidenceOfMoment
{
  double v2 = +[PGGraphROIEdge filterAboveConfidence:0.0];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)roiOfMoment
{
  double v2 = +[PGGraphROIEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)weekendOfMoment
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphPartOfWeekEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  uint64_t v5 = +[PGGraphWeekendNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)weekdayOfMoment
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphPartOfWeekEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  uint64_t v5 = +[PGGraphWeekdayNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)reliableSceneOfMoment
{
  double v2 = +[PGGraphSceneEdge isReliableFilter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)sceneOfMoment
{
  double v2 = +[PGGraphSceneEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)dateOfMoment
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphDateEdge filter];
  id v4 = [v3 outRelation];
  v10[0] = v4;
  uint64_t v5 = +[PGGraphDateNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)previousMomentOfMoment
{
  double v2 = +[PGGraphMomentNextEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)nextMomentOfMoment
{
  double v2 = +[PGGraphMomentNextEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)preciseAddressOfMoment
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F71F18];
  char v3 = +[PGGraphMomentNode addressOfMoment];
  v9[0] = v3;
  id v4 = +[PGGraphAddressNode preciseFilter];
  uint64_t v5 = [v4 relation];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    id v7 = &stru_1F283BC78;
    if (v5) {
      id v7 = v5;
    }
    [NSString stringWithFormat:@"(:Moment)<-[:CONTAINS]-(%@:Highlight)", v7];
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    id v6 = &stru_1F283BC78;
    if (v5) {
      id v6 = v5;
    }
    [NSString stringWithFormat:@"(%@:Moment)", v6];
    objc_super v8 = LABEL_9:;
    goto LABEL_13;
  }
  double v9 = +[PGLogging sharedLogging];
  unint64_t v10 = [v9 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = v4;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  objc_super v8 = 0;
LABEL_13:

  return v8;
}

+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    id v7 = &stru_1F283BC78;
    if (v5) {
      id v7 = v5;
    }
    [NSString stringWithFormat:@"(%@:Highlight)-[:CONTAINS]->(:Moment)", v7];
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    id v6 = &stru_1F283BC78;
    if (v5) {
      id v6 = v5;
    }
    [NSString stringWithFormat:@"(%@:Moment)", v6];
    objc_super v8 = LABEL_9:;
    goto LABEL_13;
  }
  double v9 = +[PGLogging sharedLogging];
  unint64_t v10 = [v9 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = v4;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  objc_super v8 = 0;
LABEL_13:

  return v8;
}

+ (id)pathToTargetNodeDomain:(unsigned __int16)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 100) {
    return &stru_1F283BC78;
  }
  int v3 = a3;
  if (a3 == 102) {
    return @"<-[:CONTAINS]-(:Highlight)";
  }
  uint64_t v5 = +[PGLogging sharedLogging];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 100) {
    return &stru_1F283BC78;
  }
  int v3 = a3;
  if (a3 == 102) {
    return @"(:Highlight)-[:CONTAINS]->";
  }
  uint64_t v5 = +[PGLogging sharedLogging];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (id)pathToMoment
{
  return &stru_1F283BC78;
}

+ (id)pathFromMoment
{
  return &stru_1F283BC78;
}

+ (id)firstAndLastMomentNodesInMomentNodes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v4)
  {
    id v7 = 0;
    id v6 = 0;
    int v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v3);
      }
      unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (v6)
      {
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) earlierMomentNode:v6];

        id v6 = (id)v11;
        if (v7) {
          goto LABEL_8;
        }
      }
      else
      {
        id v6 = v10;
        if (v7)
        {
LABEL_8:
          uint64_t v12 = [v10 laterMomentNode:v7];

          id v7 = (id)v12;
          continue;
        }
      }
      id v7 = v10;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  }
  while (v5);
  int v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6 && v7)
  {
    v19[0] = v6;
    v19[1] = v7;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  }
LABEL_17:

  return v13;
}

+ (void)setNumberOfAssets:(unint64_t)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithUnsignedInteger:a3];
  [v8 persistModelProperty:v9 forKey:@"cnt" forNodeWithIdentifier:a4];
}

+ (void)setUniversalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"utce" forNodeWithIdentifier:a4];
}

+ (void)setUniversalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"utcs" forNodeWithIdentifier:a4];
}

+ (void)setLocalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"tze" forNodeWithIdentifier:a4];
}

+ (void)setLocalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7 = a5;
  [a3 timeIntervalSince1970];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 persistModelProperty:v8 forKey:@"tzs" forNodeWithIdentifier:a4];
}

+ (id)contentBasedPropertiesWithMoment:(id)a3
{
  v35[21] = *MEMORY[0x1E4F143B8];
  v34[0] = @"clipfeature";
  id v3 = a3;
  char v33 = [v3 encodedCLIPFeatureVector];
  v35[0] = v33;
  v34[1] = @"cnt";
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfItems"));
  v35[1] = v32;
  v34[2] = @"nawp";
  double v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfItemsWithPersons"));
  v35[2] = v31;
  v34[3] = @"intng";
  double v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isInteresting"));
  v35[3] = v30;
  void v34[4] = @"intngaj";
  char v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isInterestingWithAlternateJunking"));
  void v35[4] = v29;
  v34[5] = @"sintng";
  double v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSmartInteresting"));
  v35[5] = v28;
  v34[6] = @"cntsc";
  uint64_t v4 = NSNumber;
  [v3 contentScore];
  char v27 = objc_msgSend(v4, "numberWithDouble:");
  v35[6] = v27;
  v34[7] = @"cbsa";
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "containsBetterScoringAsset"));
  v35[7] = v26;
  v34[8] = @"hghthnmprv";
  char v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasHigherThanImprovedAssets"));
  v35[8] = v25;
  v34[9] = @"asswis";
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasAssetsWithInterestingScenes"));
  v35[9] = v24;
  v34[10] = @"cnja";
  double v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "containsNonJunkAssets"));
  v35[10] = v23;
  v34[11] = @"sgem";
  double v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfShinyGemItems"));
  v35[11] = v22;
  v34[12] = @"rgem";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfRegularGemItems"));
  v35[12] = v5;
  v34[13] = @"bhsc";
  id v6 = NSNumber;
  [v3 behavioralScore];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  v35[13] = v7;
  v34[14] = @"spr";
  id v8 = NSNumber;
  [v3 scenesProcessedRatio];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  v35[14] = v9;
  v34[15] = @"fpr";
  unint64_t v10 = NSNumber;
  [v3 facesProcessedRatio];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  v35[15] = v11;
  v34[16] = @"extc";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfAssetsInExtendedCuration"));
  v35[16] = v12;
  v34[17] = @"sharingComposition";
  int v13 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "sharingComposition"));
  v35[17] = v13;
  v34[18] = @"hasl";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "happensAtSensitiveLocation"));
  v35[18] = v14;
  v34[19] = @"tnop";
  long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "totalNumberOfPersons"));
  v35[19] = v15;
  v34[20] = @"inhbtscr";
  long long v16 = NSNumber;
  [v3 inhabitationScore];
  double v18 = v17;

  id v19 = [v16 numberWithDouble:v18];
  v35[20] = v19;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:21];

  return v20;
}

+ (id)timeBasedPropertiesWithMoment:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (timeBasedPropertiesWithMoment__onceToken != -1) {
    dispatch_once(&timeBasedPropertiesWithMoment__onceToken, &__block_literal_global_60989);
  }
  uint64_t v4 = [v3 localStartDate];
  if (v4)
  {
    uint64_t v20 = [(id)timeBasedPropertiesWithMoment__momentNameDateFormatter stringFromDate:v4];
    v23[0] = v20;
    v22[0] = @"name";
    v22[1] = @"utcs";
    uint64_t v5 = NSNumber;
    uint64_t v21 = [v3 universalStartDate];
    [v21 timeIntervalSince1970];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    v23[1] = v6;
    v22[2] = @"utce";
    id v7 = NSNumber;
    id v8 = [v3 universalEndDate];
    [v8 timeIntervalSince1970];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
    v23[2] = v9;
    v22[3] = @"tzs";
    unint64_t v10 = NSNumber;
    uint64_t v11 = [v3 localStartDate];
    [v11 timeIntervalSince1970];
    uint64_t v12 = objc_msgSend(v10, "numberWithDouble:");
    v23[3] = v12;
    v22[4] = @"tze";
    int v13 = NSNumber;
    uint64_t v14 = [v3 localEndDate];
    [v14 timeIntervalSince1970];
    long long v15 = objc_msgSend(v13, "numberWithDouble:");
    v23[4] = v15;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

    double v17 = v20;
  }
  else
  {
    double v18 = +[PGLogging sharedLogging];
    double v17 = [v18 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Cannot insert moment %@: localStartDate returned nil", buf, 0xCu);
    }
    long long v16 = 0;
  }

  return v16;
}

void __51__PGGraphMomentNode_timeBasedPropertiesWithMoment___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)timeBasedPropertiesWithMoment__momentNameDateFormatter;
  timeBasedPropertiesWithMoment__momentNameDateFormatter = (uint64_t)v0;

  [(id)timeBasedPropertiesWithMoment__momentNameDateFormatter setDateFormat:@"yyyy-MM-dd HH"];
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [(id)timeBasedPropertiesWithMoment__momentNameDateFormatter setTimeZone:v2];
}

+ (id)propertiesWithMoment:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v6 UUIDString];
  }
  uint64_t v12 = @"lclid";
  v13[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [a1 timeBasedPropertiesWithMoment:v4];
  [v8 addEntriesFromDictionary:v9];

  unint64_t v10 = [a1 contentBasedPropertiesWithMoment:v4];

  [v8 addEntriesFromDictionary:v10];
  return v8;
}

+ (int64_t)breakoutOfRoutineTypeWithNeighborScore:(double)a3
{
  if (a3 >= 0.6) {
    return 2;
  }
  else {
    return a3 >= 0.43;
  }
}

+ (id)contentScoreSortDescriptors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contentScore" ascending:0];
  id v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalStartDate", 1, v2);
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  _DWORD v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)filterEnoughFacesProcessed
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphMomentNode filter];
  id v7 = @"fpr";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:6 value:&unk_1F28D5848];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  return v5;
}

+ (id)filterEnoughScenesProcessed
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphMomentNode filter];
  id v7 = @"spr";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:6 value:&unk_1F28D5848];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  return v5;
}

+ (id)filterHappeningAtSensitiveLocation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphMomentNode filter];
  id v6 = @"hasl";
  v7[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return v4;
}

+ (id)filterWithUniversalDateInterval:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 startDate];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = [v3 endDate];

  [v7 timeIntervalSince1970];
  double v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F71E28]);
  uint64_t v11 = [NSNumber numberWithDouble:v9];
  uint64_t v12 = (void *)[v10 initWithComparator:4 value:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F71E28]);
  uint64_t v14 = [NSNumber numberWithDouble:v6];
  long long v15 = (void *)[v13 initWithComparator:6 value:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F71F00]);
  v20[0] = @"utcs";
  v20[1] = @"utce";
  v21[0] = v12;
  v21[1] = v15;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  double v18 = (void *)[v16 initWithLabel:@"Moment" domain:100 properties:v17];

  return v18;
}

+ (id)filterWithLocalDateInterval:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 startDate];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = [v3 endDate];

  [v7 timeIntervalSince1970];
  double v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F71E28]);
  uint64_t v11 = [NSNumber numberWithDouble:v9];
  uint64_t v12 = (void *)[v10 initWithComparator:4 value:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F71E28]);
  uint64_t v14 = [NSNumber numberWithDouble:v6];
  long long v15 = (void *)[v13 initWithComparator:6 value:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F71F00]);
  v20[0] = @"tzs";
  v20[1] = @"tze";
  v21[0] = v12;
  v21[1] = v15;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  double v18 = (void *)[v16 initWithLabel:@"Moment" domain:100 properties:v17];

  return v18;
}

+ (id)filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  uint64_t v11 = @"tnop";
  id v5 = objc_alloc(MEMORY[0x1E4F71E28]);
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = (void *)[v5 initWithComparator:6 value:v6];
  v12[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v9 = [v4 filterBySettingProperties:v8];

  return v9;
}

+ (id)filterWithUUID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  double v9 = @"lclid";
  v10[0] = v4;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithUUIDs:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filter];
  double v9 = @"lclid";
  v10[0] = v4;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)smartInterestingFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  double v6 = @"sintng";
  v7[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithLabel:@"Moment" domain:100 properties:v3];

  return v4;
}

+ (id)interestingWithAlternateJunkingFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  double v6 = @"intngaj";
  v7[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithLabel:@"Moment" domain:100 properties:v3];

  return v4;
}

+ (id)interestingFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  double v6 = @"intng";
  v7[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithLabel:@"Moment" domain:100 properties:v3];

  return v4;
}

+ (MANodeFilter)filterEncodedCLIPFeatureVectorNotEmpty
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PGGraphMomentNode filter];
  id v7 = @"clipfeature";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&stru_1F283BC78];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 filterBySettingProperties:v4];

  return (MANodeFilter *)v5;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Moment" domain:100];
  return v2;
}

- (double)graphScore
{
  uint64_t v54 = 0;
  long long v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke;
  v53[3] = &unk_1E68EE0C0;
  v53[4] = &v54;
  [(PGGraphMomentNode *)self enumeratePersonNodesUsingBlock:v53];
  unint64_t v3 = v55[3];
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  double v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  double v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  id v4 = [(PGGraphMomentNode *)self collection];
  id v5 = [v4 addressNodes];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_2;
  v40[3] = &unk_1E68EE0E8;
  v40[4] = &v49;
  v40[5] = &v45;
  v40[6] = &v41;
  [v5 enumerateNodesUsingBlock:v40];
  unint64_t v30 = v3;

  unint64_t v6 = v50[3];
  unint64_t v7 = v46[3];
  uint64_t v29 = v42[3];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  char v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_3;
  void v31[3] = &unk_1E68EE110;
  void v31[4] = &v36;
  v31[5] = &v32;
  [(PGGraphMomentNode *)self enumerateDateNodesUsingBlock:v31];
  unint64_t v8 = v37[3];
  uint64_t v9 = v33[3];
  unint64_t v10 = [(MANode *)self countOfEdgesWithLabel:@"CELEBRATING" domain:401];
  unint64_t v11 = [(MANode *)self countOfEdgesWithLabel:0 domain:301];
  unint64_t v12 = [(MANode *)self countOfEdgesWithLabel:@"SOCIALGROUP" domain:302];
  unint64_t v13 = [(MANode *)self countOfEdgesWithLabel:0 domain:501];
  unint64_t v14 = [(MANode *)self countOfEdgesWithLabel:0 domain:502];
  unint64_t v15 = [(MANode *)self countOfEdgesWithLabel:@"SCENE" domain:600];
  unint64_t v16 = 6;
  if (v30 < 6) {
    unint64_t v16 = v30;
  }
  double v17 = (double)v16;
  unint64_t v18 = 3;
  if (v6 < 3) {
    unint64_t v18 = v6;
  }
  double v19 = (double)v18;
  unint64_t v20 = 2;
  if (v7 >= 2) {
    unint64_t v21 = 2;
  }
  else {
    unint64_t v21 = v7;
  }
  double v22 = v17 + v19 + (double)v21;
  double v23 = 0.0;
  if (v29) {
    double v24 = 1.0;
  }
  else {
    double v24 = 0.0;
  }
  double v25 = v22 + v24;
  if (v8 < 2) {
    unint64_t v20 = v8;
  }
  double v26 = v25 + (double)v20;
  if (v9) {
    double v23 = 1.0;
  }
  double v27 = (v26
       + v23
       + fmin((double)v10, 1.0)
       + fmin((double)v11, 1.0)
       + fmin((double)v12, 1.0)
       + fmin((double)v13, 1.0)
       + fmin((double)v14, 1.0)
       + fmin((double)v15, 3.0))
      / 23.0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v54, 8);
  return v27;
}

void __40__PGGraphMomentNode_Scoring__graphScore__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isMeNode] & 1) == 0)
  {
    [v4 personScore];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (unint64_t)(v3 * 0.5 + 0.5);
  }
}

void __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_2(void *a1, void *a2)
{
  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  id v3 = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) += [v3 countOfEdgesWithLabel:@"AREA" domain:201];
  int v4 = [v3 hasEdgeWithLabel:@"IS_HOME_WORK" domain:202];

  if (v4) {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

uint64_t __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_3(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 countOfEdgesWithLabel:@"HOLIDAY" domain:401];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

@end