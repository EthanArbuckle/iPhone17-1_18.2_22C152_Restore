@interface PGMoodKeywordComputer
- (BOOL)_isCrowdedForMomentNodes:(id)a3;
- (NSArray)keywordsRegions;
- (NSOrderedSet)orderedKeywords;
- (PGGraphHighlightTypeNodeCollection)shortTripTypeNodeCollection;
- (PGGraphHolidayNodeCollection)lunarNewYearHolidayNodes;
- (PGGraphMomentNodeCollection)natureMomentNodes;
- (PGGraphPersonNodeCollection)familyOrPartnerPersonNodes;
- (PGGraphSocialGroupNodeCollection)bestSocialGroupNodes;
- (id)_bestSocialGroupNodesInGraph:(id)a3;
- (id)_celebratedHolidayKeywordsForMomentNodes:(id)a3 inGraph:(id)a4;
- (id)_familyOrPartnerPersonNodesInGraph:(id)a3;
- (id)_gatheringAndFamilyKeywordsForTriggeredMemory:(id)a3 isMeaningfulEventHoliday:(BOOL)a4 inGraph:(id)a5;
- (id)_keywordsSortedByPriority:(id)a3;
- (id)_locationTripKeywordsForMomentNodes:(id)a3 locationHelper:(id)a4;
- (id)_lunarNewYearHolidayNodesInGraph:(id)a3;
- (id)_natureMomentNodesInGraph:(id)a3;
- (id)_shortTripTypeNodeCollectionInGraph:(id)a3;
- (id)moodKeywordsForTriggeredMemory:(id)a3 suggestedMood:(unint64_t)a4 inGraph:(id)a5 locationHelper:(id)a6;
- (void)setBestSocialGroupNodes:(id)a3;
- (void)setFamilyOrPartnerPersonNodes:(id)a3;
- (void)setKeywordsRegions:(id)a3;
- (void)setLunarNewYearHolidayNodes:(id)a3;
- (void)setNatureMomentNodes:(id)a3;
- (void)setOrderedKeywords:(id)a3;
- (void)setShortTripTypeNodeCollection:(id)a3;
@end

@implementation PGMoodKeywordComputer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natureMomentNodes, 0);
  objc_storeStrong((id *)&self->_bestSocialGroupNodes, 0);
  objc_storeStrong((id *)&self->_familyOrPartnerPersonNodes, 0);
  objc_storeStrong((id *)&self->_shortTripTypeNodeCollection, 0);
  objc_storeStrong((id *)&self->_lunarNewYearHolidayNodes, 0);
  objc_storeStrong((id *)&self->_keywordsRegions, 0);
  objc_storeStrong((id *)&self->_orderedKeywords, 0);
}

- (void)setNatureMomentNodes:(id)a3
{
}

- (PGGraphMomentNodeCollection)natureMomentNodes
{
  return self->_natureMomentNodes;
}

- (void)setBestSocialGroupNodes:(id)a3
{
}

- (PGGraphSocialGroupNodeCollection)bestSocialGroupNodes
{
  return self->_bestSocialGroupNodes;
}

- (void)setFamilyOrPartnerPersonNodes:(id)a3
{
}

- (PGGraphPersonNodeCollection)familyOrPartnerPersonNodes
{
  return self->_familyOrPartnerPersonNodes;
}

- (void)setShortTripTypeNodeCollection:(id)a3
{
}

- (PGGraphHighlightTypeNodeCollection)shortTripTypeNodeCollection
{
  return self->_shortTripTypeNodeCollection;
}

- (void)setLunarNewYearHolidayNodes:(id)a3
{
}

- (PGGraphHolidayNodeCollection)lunarNewYearHolidayNodes
{
  return self->_lunarNewYearHolidayNodes;
}

- (void)setKeywordsRegions:(id)a3
{
}

- (void)setOrderedKeywords:(id)a3
{
}

- (id)_natureMomentNodesInGraph:(id)a3
{
  natureMomentNodes = self->_natureMomentNodes;
  if (!natureMomentNodes)
  {
    v5 = +[PGGraphROINodeCollection roiNodesOfType:4 inGraph:a3];
    v6 = [v5 momentNodes];
    v7 = self->_natureMomentNodes;
    self->_natureMomentNodes = v6;

    natureMomentNodes = self->_natureMomentNodes;
  }
  return natureMomentNodes;
}

- (id)_familyOrPartnerPersonNodesInGraph:(id)a3
{
  familyOrPartnerPersonNodes = self->_familyOrPartnerPersonNodes;
  if (!familyOrPartnerPersonNodes)
  {
    v5 = +[PGGraphNodeCollection nodesInGraph:a3];
    v6 = [v5 partnerPersonNodes];
    v7 = [v5 familyPersonNodes];
    v8 = [v6 collectionByFormingUnionWith:v7];
    v9 = self->_familyOrPartnerPersonNodes;
    self->_familyOrPartnerPersonNodes = v8;

    familyOrPartnerPersonNodes = self->_familyOrPartnerPersonNodes;
  }
  return familyOrPartnerPersonNodes;
}

- (id)_gatheringAndFamilyKeywordsForTriggeredMemory:(id)a3 isMeaningfulEventHoliday:(BOOL)a4 inGraph:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 triggerTypes];
  int v11 = [v10 containsIndex:3];

  if (v11 && [v8 memoryCategory] != 6 && objc_msgSend(v8, "memoryCategory") != 5)
  {
    v19 = [v8 memoryMomentNodes];
    v13 = [v19 personNodes];

    unint64_t v15 = [v13 count];
    if (!v15) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v12 = [v8 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  uint64_t v14 = [v13 count];
  if (!v14) {
    goto LABEL_11;
  }
  unint64_t v15 = v14;
  if (v11)
  {
LABEL_9:
    if (v15 > 2 || !v6)
    {
      v24 = [(PGMoodKeywordComputer *)self _familyOrPartnerPersonNodesInGraph:v9];
      v25 = [v24 collectionByIntersecting:v13];
      unint64_t v26 = [v25 count];

      v20 = (objc_class *)MEMORY[0x1E4F1CAD0];
      if ((double)v15 * 0.5 <= (double)v26)
      {
        id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:@"Family"];
        goto LABEL_13;
      }
LABEL_12:
      id v21 = objc_alloc_init(v20);
LABEL_13:
      id v22 = v21;
      goto LABEL_14;
    }
LABEL_11:
    v20 = (objc_class *)MEMORY[0x1E4F1CAD0];
    goto LABEL_12;
  }
  v16 = [(PGMoodKeywordComputer *)self _bestSocialGroupNodesInGraph:v9];
  v17 = [v13 socialGroupNodes];
  int v18 = [v16 intersectsCollection:v17];

  if (v18)
  {

    goto LABEL_9;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);

LABEL_14:
  return v22;
}

- (id)_celebratedHolidayKeywordsForMomentNodes:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  v7 = [(PGMoodKeywordComputer *)self _lunarNewYearHolidayNodesInGraph:a4];
  id v8 = [v6 celebratedHolidayNodes];

  if ([v8 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v10 = [v7 intersectsCollection:v8];
    int v11 = [v8 collectionBySubtracting:v7];
    uint64_t v12 = [v11 count];

    if (v10 && !v12) {
      [v9 addObject:@"ChineseLunarNewYear"];
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v9;
}

- (id)_lunarNewYearHolidayNodesInGraph:(id)a3
{
  lunarNewYearHolidayNodes = self->_lunarNewYearHolidayNodes;
  if (!lunarNewYearHolidayNodes)
  {
    v5 = +[PGGraphHolidayNodeCollection holidayNodesWithNames:&unk_1F28D3B70 inGraph:a3];
    id v6 = self->_lunarNewYearHolidayNodes;
    self->_lunarNewYearHolidayNodes = v5;

    lunarNewYearHolidayNodes = self->_lunarNewYearHolidayNodes;
  }
  return lunarNewYearHolidayNodes;
}

- (id)_locationTripKeywordsForMomentNodes:(id)a3 locationHelper:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v32 = v6;
  id v8 = [v6 temporaryArray];
  v30 = v7;
  id v9 = [v7 relevantAddressNodesForMomentNodes:v8 applyDensestCloseLocationNode:0];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        unint64_t v15 = [(PGMoodKeywordComputer *)self keywordsRegions];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v40;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v40 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
              [v14 coordinate];
              if (objc_msgSend(v20, "containsCoordinate:"))
              {
                id v21 = [v20 identifier];
                [v34 addObject:v21];

                goto LABEL_16;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }

  uint64_t v22 = [obj count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = v34;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * k);
        if ([v23 countForObject:v28] == v22) {
          [v31 addObject:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v25);
  }

  return v31;
}

- (NSArray)keywordsRegions
{
  v19[4] = *MEMORY[0x1E4F143B8];
  keywordsRegions = self->_keywordsRegions;
  if (!keywordsRegions)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v5 = CLLocationCoordinate2DMake(40.7004225, -73.9530945);
    id v6 = objc_msgSend(v4, "initWithCenter:radius:identifier:", @"New York City", v5.latitude, v5.longitude, 26000.0);
    v19[0] = v6;
    id v7 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(51.5001944, -0.118103027);
    id v9 = objc_msgSend(v7, "initWithCenter:radius:identifier:", @"London", v8.latitude, v8.longitude, 15000.0);
    v19[1] = v9;
    id v10 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(48.8583905, 2.34352112);
    uint64_t v12 = objc_msgSend(v10, "initWithCenter:radius:identifier:", @"Paris", v11.latitude, v11.longitude, 10000.0);
    v19[2] = v12;
    id v13 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(26.7259868, -157.631836);
    unint64_t v15 = objc_msgSend(v13, "initWithCenter:radius:identifier:", @"Hawaii", v14.latitude, v14.longitude, 1460000.0);
    v19[3] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    uint64_t v17 = self->_keywordsRegions;
    self->_keywordsRegions = v16;

    keywordsRegions = self->_keywordsRegions;
  }
  return keywordsRegions;
}

- (id)_shortTripTypeNodeCollectionInGraph:(id)a3
{
  shortTripTypeNodeCollection = self->_shortTripTypeNodeCollection;
  if (!shortTripTypeNodeCollection)
  {
    CLLocationCoordinate2D v5 = +[PGGraphHighlightTypeNodeCollection shortTripTypeNodesInGraph:a3];
    id v6 = self->_shortTripTypeNodeCollection;
    self->_shortTripTypeNodeCollection = v5;

    shortTripTypeNodeCollection = self->_shortTripTypeNodeCollection;
  }
  return shortTripTypeNodeCollection;
}

- (id)_bestSocialGroupNodesInGraph:(id)a3
{
  bestSocialGroupNodes = self->_bestSocialGroupNodes;
  if (!bestSocialGroupNodes)
  {
    id v5 = a3;
    id v6 = [PGGraphSocialGroupNodeCollection alloc];
    id v7 = [v5 bestSocialGroupNodes];
    CLLocationCoordinate2D v8 = [(MAElementCollection *)v6 initWithArray:v7 graph:v5];

    id v9 = self->_bestSocialGroupNodes;
    self->_bestSocialGroupNodes = v8;

    bestSocialGroupNodes = self->_bestSocialGroupNodes;
  }
  return bestSocialGroupNodes;
}

- (BOOL)_isCrowdedForMomentNodes:(id)a3
{
  v3 = [a3 subsetWithTotalNumberOfPersonsGreaterThanOrEqualTo:11];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_keywordsSortedByPriority:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGMoodKeywordComputer *)self orderedKeywords];
  id v6 = (void *)MEMORY[0x1E4F29008];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PGMoodKeywordComputer__keywordsSortedByPriority___block_invoke;
  v12[3] = &unk_1E68EF618;
  id v13 = v5;
  id v7 = v5;
  CLLocationCoordinate2D v8 = [v6 sortDescriptorWithKey:0 ascending:1 comparator:v12];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [v4 sortedArrayUsingDescriptors:v9];

  return v10;
}

uint64_t __51__PGMoodKeywordComputer__keywordsSortedByPriority___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 indexOfObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

- (NSOrderedSet)orderedKeywords
{
  v9[19] = *MEMORY[0x1E4F143B8];
  orderedKeywords = self->_orderedKeywords;
  if (!orderedKeywords)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAA0];
    v9[0] = @"Wedding";
    v9[1] = @"Disney";
    v9[2] = @"Universal";
    v9[3] = @"Paris";
    v9[4] = @"New York City";
    v9[5] = @"London";
    v9[6] = @"Hawaii";
    v9[7] = @"ChineseLunarNewYear";
    v9[8] = @"Babies";
    v9[9] = @"Pets";
    v9[10] = @"Birthday";
    v9[11] = @"Anniversary";
    v9[12] = @"Winter Holiday";
    v9[13] = @"Beach";
    v9[14] = @"Family";
    v9[15] = @"Nature";
    v9[16] = @"Sports";
    v9[17] = @"Party";
    v9[18] = @"Gathering";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:19];
    id v6 = [v4 orderedSetWithArray:v5];
    unint64_t v7 = self->_orderedKeywords;
    self->_orderedKeywords = v6;

    orderedKeywords = self->_orderedKeywords;
  }
  return orderedKeywords;
}

- (id)moodKeywordsForTriggeredMemory:(id)a3 suggestedMood:(unint64_t)a4 inGraph:(id)a5 locationHelper:(id)a6
{
  __int16 v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((v8 & 0x3EF) == 0)
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_79;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  CLLocationCoordinate2D v14 = [v10 memoryMomentNodes];
  uint64_t v50 = [v10 memoryFeatureNodes];
  uint64_t v15 = [v10 memoryCategory];
  unint64_t v51 = PGMemorySourceTypeFromCategory(v15) - 1;
  uint64_t v16 = [v14 frequentLocationNodes];
  uint64_t v17 = [(PGMoodKeywordComputer *)v16 count];

  id v49 = v11;
  if (v15 == 10 || v15 == 28)
  {
    [v13 addObject:@"Pets"];
  }
  else if (v15 == 11)
  {
    [v13 addObject:@"Babies"];
    BOOL v48 = 0;
    int v18 = 0;
    goto LABEL_34;
  }
  int v18 = v15 == 16;
  if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 0x10)
  {
    long long v45 = +[PGGraphNodeCollection subsetInCollection:v50];
    uint64_t v16 = [v45 meaningLabels];
    if ([(PGMoodKeywordComputer *)v16 containsObject:@"SportEvent"]) {
      [v13 addObject:@"Sports"];
    }
    if ([(PGMoodKeywordComputer *)v16 containsObject:@"Anniversary"]) {
      [v13 addObject:@"Anniversary"];
    }
    if ([(PGMoodKeywordComputer *)v16 containsObject:@"Wedding"]) {
      [v13 addObject:@"Wedding"];
    }
    if (([(PGMoodKeywordComputer *)v16 containsObject:@"NightOut"] & 1) != 0
      || [(PGMoodKeywordComputer *)v16 containsObject:@"Performance"])
    {
      [v13 addObject:@"Party"];
    }
    if ([(PGMoodKeywordComputer *)v16 containsObject:@"Birthday"]) {
      [v13 addObject:@"Birthday"];
    }
    if (!v17)
    {
      if ([(PGMoodKeywordComputer *)v16 containsObject:@"Beaching"]) {
        [v13 addObject:@"Beach"];
      }
      if ([(PGMoodKeywordComputer *)v16 containsObject:@"Hiking"]
        && ![(PGMoodKeywordComputer *)self _isCrowdedForMomentNodes:v14])
      {
        [v13 addObject:@"Nature"];
      }
    }
    uint64_t v46 = v17;
    v20 = +[PGGraphNodeCollection subsetInCollection:v50];
    uint64_t v21 = [v20 count];
    BOOL v48 = v21 != 0;

    if (v21)
    {
      long long v44 = self;
      uint64_t v22 = [v14 dateNodes];
      id v23 = [v22 seasonNodes];
      uint64_t v24 = [v23 names];
      int v25 = [v24 containsObject:@"Winter"];

      if (v25) {
        [v13 addObject:@"Winter Holiday"];
      }
      self = v44;
      uint64_t v26 = [(PGMoodKeywordComputer *)v44 _celebratedHolidayKeywordsForMomentNodes:v14 inGraph:v49];
      [v13 unionSet:v26];
    }
    int v18 = v15 == 16;
    uint64_t v17 = v46;
  }
  else
  {
    if (v15 == 19)
    {
      [(PGMoodKeywordComputer *)self _shortTripTypeNodeCollectionInGraph:v49];
      v27 = uint64_t v47 = v17;
      uint64_t v28 = +[PGGraphNodeCollection subsetInCollection:v50];
      [v28 typeNodes];
      v29 = uint64_t v16 = self;
      int v18 = [v29 intersectsCollection:v27];

      self = v16;
      uint64_t v17 = v47;
    }
    BOOL v48 = 0;
  }
LABEL_34:
  uint64_t v30 = [v14 count];
  BOOL v33 = (v15 == 14 || v51 < 2) && v17 == 0;
  if (v30 == 1)
  {
    if (!v33)
    {
      int v18 = 1;
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  if (v33)
  {
    if ((v18 & 1) == 0)
    {
      uint64_t v16 = [(MAElementCollection *)[PGGraphPOINodeCollection alloc] initWithGraph:v49];
      int v18 = 0;
      goto LABEL_50;
    }
LABEL_48:
    uint64_t v16 = [v14 poiNodes];
    int v18 = 1;
LABEL_50:
    if (![(PGMoodKeywordComputer *)v16 count])
    {
      id v34 = v12;
      long long v35 = [(PGMoodKeywordComputer *)self _natureMomentNodesInGraph:v49];
      if ([v35 intersectsCollection:v14])
      {
        BOOL v36 = [(PGMoodKeywordComputer *)self _isCrowdedForMomentNodes:v14];

        id v12 = v34;
        if (!v36) {
          [v13 addObject:@"Nature"];
        }
      }
      else
      {

        id v12 = v34;
      }
    }
  }
LABEL_56:
  if (v15 == 15 || v51 <= 1)
  {
    long long v37 = [PGSpecialPOIResolver alloc];
    long long v38 = [v14 temporaryArray];
    uint64_t v16 = [(PGSpecialPOIResolver *)v37 initWithMomentNodes:v38];

    if (v18) {
      double v39 = 0.6;
    }
    else {
      double v39 = 0.9;
    }
    if (-[PGMoodKeywordComputer momentsContainSpecialPOI:withMomentRatio:](v16, "momentsContainSpecialPOI:withMomentRatio:", 1, v39))[v13 addObject:@"Disney"]; {
    if (-[PGMoodKeywordComputer momentsContainSpecialPOI:withMomentRatio:](v16, "momentsContainSpecialPOI:withMomentRatio:", 2, v39))[v13 addObject:@"Universal"];
    }
  }
  int v40 = 1;
  if ((unint64_t)(v15 - 5) >= 2)
  {
    id v11 = v49;
    if (v15 != 219)
    {
      uint64_t v16 = [v10 triggerTypes];
      int v40 = [(PGMoodKeywordComputer *)v16 containsIndex:3] | v48;
    }
  }
  else
  {
    id v11 = v49;
  }
  if ((unint64_t)(v15 - 5) >= 2 && v15 != 219) {

  }
  if (v40)
  {
    long long v41 = [(PGMoodKeywordComputer *)self _gatheringAndFamilyKeywordsForTriggeredMemory:v10 isMeaningfulEventHoliday:v48 inGraph:v11];
    [v13 unionSet:v41];
  }
  if ((unint64_t)(v15 - 12) < 3 || v51 <= 1)
  {
    long long v42 = [(PGMoodKeywordComputer *)self _locationTripKeywordsForMomentNodes:v14 locationHelper:v12];
    [v13 unionSet:v42];
  }
  v19 = [(PGMoodKeywordComputer *)self _keywordsSortedByPriority:v13];

LABEL_79:
  return v19;
}

@end