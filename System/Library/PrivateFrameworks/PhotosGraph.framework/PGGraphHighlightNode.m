@interface PGGraphHighlightNode
+ ($73EC887EE5D1BAEF06918898D778235D)_promotionScoreDescriptorWithMomentNodes:(SEL)a3 neighborScoreComputer:(id)a4;
+ (MARelation)highlightGroupOfHighlight;
+ (MARelation)highlightWithPrivateAndSharedAssetsOfHighlight;
+ (MARelation)highlightWithPrivateAssetsOfHighlight;
+ (MARelation)highlightWithSharedAssetsOfHighlight;
+ (MARelation)momentInDayHighlight;
+ (MARelation)momentInHighlight;
+ (double)aboveAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3;
+ (double)averagePromotionScoreWithPromotionScoreDescriptor:(id *)a3;
+ (double)belowAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3;
+ (double)nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:(id *)a3 isAggregation:(BOOL)a4 enrichmentState:(unsigned __int16)a5;
+ (double)promotionScoreWithHighlightNode:(id)a3 enrichmentState:(unsigned __int16)a4 numberOfExtendedAssets:(unint64_t)a5 neighborScoreComputer:(id)a6;
+ (id)allHighlightsFilter;
+ (id)dayHighlightsFilter;
+ (id)filter;
+ (id)filterWithUUID:(id)a3;
+ (id)filterWithUUIDs:(id)a3;
+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)otherVeryMeaningfulMeanings;
+ (id)pathFromMoment;
+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3;
+ (id)pathToMoment;
+ (id)pathToTargetNodeDomain:(unsigned __int16)a3;
+ (id)promotionScoreSortDescriptors;
+ (id)propertiesWithHighlight:(id)a3;
- (BOOL)endsBeforeLocalDate:(id)a3;
- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3;
- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3;
- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3;
- (BOOL)hasLocation;
- (BOOL)hasPeopleCountingMe:(BOOL)a3;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isAggregation;
- (BOOL)isInteresting;
- (BOOL)isInterestingWithAlternateJunking;
- (BOOL)isLongTrip;
- (BOOL)isPartOfAggregation;
- (BOOL)isPartOfLongTrip;
- (BOOL)isPartOfShortTrip;
- (BOOL)isPartOfTrip;
- (BOOL)isShortTrip;
- (BOOL)isSmartInteresting;
- (BOOL)isTrip;
- (BOOL)petIsPresent;
- (BOOL)startsAfterLocalDate:(id)a3;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSString)UUID;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localIdentifier;
- (NSString)name;
- (NSString)uuid;
- (PGGraphHighlightGroupNode)highlightGroupNode;
- (PGGraphHighlightNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphHighlightNodeCollection)collection;
- (double)contentScore;
- (double)nonMeaningfulPromotionScoreForTripKeyAssetWithEnrichmentState:(unsigned __int16)a3 neighborScoreComputer:(id)a4;
- (double)timestampUTCEnd;
- (double)timestampUTCStart;
- (double)timezoneOffsetAtEnd;
- (double)timezoneOffsetAtStart;
- (double)weightForMoment:(id)a3;
- (id)addressNodes;
- (id)anniversaryPersonNodes;
- (id)birthdayPersonNodes;
- (id)businessNodes;
- (id)celebratedHolidayNodes;
- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3;
- (id)consolidatedPersonNodes;
- (id)consolidatedPersonNodesPresentInAssets;
- (id)dateNodes;
- (id)debugDictionaryWithServiceManager:(id)a3;
- (id)eventEnrichmentMomentNodes;
- (id)eventEnrichmentSortedMomentNodes;
- (id)eventSortedMomentNodes;
- (id)fetchAssetCollectionInPhotoLibrary:(id)a3;
- (id)holidayNodes;
- (id)initFromHighlight:(id)a3;
- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4;
- (id)label;
- (id)meaningLabels;
- (id)meaningfulEvent;
- (id)naturalLanguageFeatures;
- (id)personNodes;
- (id)personNodesInProximity;
- (id)petNodes;
- (id)poiNodes;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)publicEventNodes;
- (id)reliableMeaningLabels;
- (id)roiNodes;
- (id)seasonNodes;
- (id)socialGroupNodes;
- (unint64_t)featureType;
- (unint64_t)numberOfRegularGemAssets;
- (unint64_t)numberOfShinyGemAssets;
- (unsigned)domain;
- (unsigned)sharingComposition;
- (void)enumerateBusinessesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
- (void)setLocalProperties:(id)a3;
@end

@implementation PGGraphHighlightNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (double)timestampUTCEnd
{
  return self->_universalEndTimestamp;
}

- (double)timestampUTCStart
{
  return self->_universalStartTimestamp;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)naturalLanguageFeatures
{
  v3 = [PGTextFeatureGenerator alloc];
  v4 = [(PGGraphHighlightNode *)self collection];
  v5 = [v4 momentNodes];
  v6 = [v5 temporarySet];
  v7 = [(MANode *)self graph];
  v8 = [(PGTextFeatureGenerator *)v3 initWithMomentNodes:v6 graph:v7];

  v9 = [(PGTextFeatureGenerator *)v8 naturalLanguageFeatures];

  return v9;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphHighlightNode *)self localIdentifier];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 28;
}

- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v89 = self;
  v7 = [(PGGraphHighlightNode *)self collection];
  v8 = [v7 momentNodes];
  v9 = [v8 temporarySet];

  if ([v9 count] == 1)
  {
    v10 = [v9 anyObject];
    v11 = [v10 keywordsForRelatedType:a3 focusOnNodes:v6];

    goto LABEL_62;
  }
  v75 = [MEMORY[0x1E4F1CA48] array];
  v86 = [MEMORY[0x1E4F1CA48] array];
  v87 = [MEMORY[0x1E4F1CA48] array];
  v85 = [MEMORY[0x1E4F1CA48] array];
  v84 = [MEMORY[0x1E4F1CA48] array];
  v83 = [MEMORY[0x1E4F1CA48] array];
  if ((a3 & 2) != 0)
  {
    v12 = NSString;
    v13 = [(PGGraphHighlightNode *)v89 localStartDate];
    v14 = [v12 stringWithFormat:@"[EventStart] %@", v13];

    v15 = NSString;
    [(PGGraphHighlightNode *)v89 localEndDate];
    v17 = unint64_t v16 = a3;
    v18 = [v15 stringWithFormat:@"[EventEnd] %@", v17];

    a3 = v16;
    [v87 addObject:v14];
    [v87 addObject:v18];
  }
  unint64_t v82 = a3;
  v76 = v9;
  if (a3)
  {
    v19 = [(MANode *)v89 graph];
    v79 = [v19 meNode];

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    obuint64_t j = [(PGGraphHighlightNode *)v89 personNodes];
    uint64_t v78 = [obj countByEnumeratingWithState:&v115 objects:v125 count:16];
    if (!v78) {
      goto LABEL_44;
    }
    uint64_t v77 = *(void *)v116;
    id v74 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v116 != v77) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        if (v6 && ![v6 containsObject:*(void *)(*((void *)&v115 + 1) + 8 * i)]) {
          continue;
        }
        uint64_t v80 = i;
        v22 = (void *)MEMORY[0x1E4F28E78];
        v23 = [v21 keywordDescription];
        v81 = [v22 stringWithString:v23];

        if (!v79 || ([v21 isEqualToNode:v79] & 1) != 0) {
          goto LABEL_32;
        }
        v24 = [v21 edgesForLabel:0 domain:300];
        if (![v24 count]) {
          goto LABEL_31;
        }
        v25 = [MEMORY[0x1E4F1CA48] array];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        v72 = v24;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v111 objects:v124 count:16];
        if (!v27) {
          goto LABEL_28;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v112;
        do
        {
          uint64_t v30 = 0;
          uint64_t v88 = v28;
          do
          {
            if (*(void *)v112 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v111 + 1) + 8 * v30);
            v32 = [v31 oppositeNode:v21];
            if ([v32 domain] == 300)
            {
              v33 = [v32 label];
              if ([v33 isEqualToString:@"People"])
              {
              }
              else
              {
                [v32 label];
                uint64_t v34 = v29;
                id v35 = v26;
                v36 = v25;
                v38 = v37 = v21;
                int v39 = [v38 isEqualToString:@"Me"];

                v21 = v37;
                v25 = v36;
                id v26 = v35;
                uint64_t v29 = v34;
                uint64_t v28 = v88;

                if (!v39) {
                  goto LABEL_26;
                }
              }
              v40 = [v31 label];
              [v25 addObject:v40];
            }
LABEL_26:

            ++v30;
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v111 objects:v124 count:16];
        }
        while (v28);
LABEL_28:

        if ([v25 count])
        {
          v41 = [v25 componentsJoinedByString:@"/"];
          [v81 appendFormat:@" - %@ -", v41];
        }
        v24 = v72;
LABEL_31:

LABEL_32:
        v42 = [v21 collection];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v43 = v76;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v107 objects:v123 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v108;
          double v47 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v108 != v46) {
                objc_enumerationMutation(v43);
              }
              v49 = *(void **)(*((void *)&v107 + 1) + 8 * j);
              v50 = [v49 collection];
              v51 = +[PGGraphEdgeCollection edgesFromNodes:v42 toNodes:v50];
              v52 = [v51 anyEdge];
              [v52 importance];
              double v54 = v53;

              [(PGGraphHighlightNode *)v89 weightForMoment:v49];
              double v47 = v47 + v55 * v54;
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v107 objects:v123 count:16];
          }
          while (v45);
        }
        else
        {
          double v47 = 0.0;
        }

        objc_msgSend(v81, "appendFormat:", @" (%0.2f)", *(void *)&v47);
        [v75 addObject:v81];

        id v6 = v74;
        uint64_t i = v80;
      }
      uint64_t v78 = [obj countByEnumeratingWithState:&v115 objects:v125 count:16];
      if (!v78)
      {
LABEL_44:

        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        v9 = v76;
        id v56 = v76;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v103 objects:v122 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = 0;
          uint64_t v60 = *(void *)v104;
          do
          {
            for (uint64_t k = 0; k != v58; ++k)
            {
              if (*(void *)v104 != v60) {
                objc_enumerationMutation(v56);
              }
              v59 += [*(id *)(*((void *)&v103 + 1) + 8 * k) totalNumberOfPersons];
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v103 objects:v122 count:16];
          }
          while (v58);
        }
        else
        {
          uint64_t v59 = 0;
        }

        v62 = objc_msgSend(NSString, "stringWithFormat:", @"[All Persons] %lu", v59);
        [v75 addObject:v62];

        break;
      }
    }
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v63 = v9;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v99 objects:v121 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v100;
    do
    {
      for (uint64_t m = 0; m != v65; ++m)
      {
        if (*(void *)v100 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v99 + 1) + 8 * m);
        [(PGGraphHighlightNode *)v89 weightForMoment:v68];
        uint64_t v70 = v69;
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke;
        v90[3] = &unk_1E68E5338;
        id v91 = v6;
        unint64_t v97 = v82;
        uint64_t v98 = v70;
        id v92 = v86;
        id v93 = v87;
        id v94 = v85;
        id v95 = v84;
        id v96 = v83;
        [v68 enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v90];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v99 objects:v121 count:16];
    }
    while (v65);
  }

  v119[0] = &unk_1F28D0738;
  v119[1] = &unk_1F28D0750;
  v120[0] = v75;
  v120[1] = v86;
  v119[2] = &unk_1F28D0768;
  v119[3] = &unk_1F28D0780;
  v120[2] = v87;
  v120[3] = v85;
  v119[4] = &unk_1F28D0798;
  v119[5] = &unk_1F28D07B0;
  v120[4] = v84;
  v120[5] = v83;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:6];

  v9 = v76;
LABEL_62:

  return v11;
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_2;
  aBlock[3] = &unk_1E68ED9C0;
  id v7 = v6;
  id v53 = v7;
  v8 = (void (**)(void))_Block_copy(aBlock);
  v9 = *(void **)(a1 + 32);
  if (!v9 || [v9 containsObject:v7])
  {
    if ([v5 domain] == 200 && (*(unsigned char *)(a1 + 80) & 4) != 0)
    {
      [v5 relevance];
      double v13 = *(double *)(a1 + 88);
      double v15 = v14 * v13;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_3;
      v50[3] = &unk_1E68E52E8;
      *(double *)&v51[1] = v14 * v13;
      *(double *)&v51[2] = v13;
      v12 = (id *)v51;
      v51[0] = *(id *)(a1 + 40);
      id v16 = v7;
      [v16 enumerateOutEdgesUsingBlock:v50];
      v17 = [v16 collection];
      v18 = [v17 homeWorkNodes];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_4;
      v47[3] = &unk_1E68EDA38;
      double v49 = v15;
      id v48 = *(id *)(a1 + 40);
      [v18 enumerateNodesUsingBlock:v47];

      goto LABEL_10;
    }
    if ([v5 domain] == 400 && (*(unsigned char *)(a1 + 80) & 2) != 0)
    {
      v10 = *(void **)(a1 + 48);
      v11 = [v7 keywordDescription];
      [v10 addObject:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_6;
        v45[3] = &unk_1E68E5310;
        v46[1] = *(void *)(a1 + 88);
        v12 = (id *)v46;
        v46[0] = *(id *)(a1 + 48);
        [v7 enumerateHolidayEdgesAndNodesUsingBlock:v45];
LABEL_10:
      }
    }
  }
  if ([v5 domain] == 301 && (*(unsigned char *)(a1 + 80) & 8) != 0)
  {
    v23 = [v5 label];
    if ([v23 isEqualToString:@"BIRTHDAY"]
      || [v23 isEqualToString:@"BIRTHDAY"])
    {
      uint64_t v29 = *(void **)(a1 + 56);
      [v5 confidence];
      uint64_t v30 = v8[2](v8);
      [v29 addObject:v30];
    }
    goto LABEL_35;
  }
  if ([v5 domain] == 401 && (*(unsigned char *)(a1 + 80) & 8) != 0)
  {
    uint64_t v28 = *(void **)(a1 + 56);
    goto LABEL_30;
  }
  int v19 = [v5 domain];
  uint64_t v20 = *(void *)(a1 + 80);
  if (v19 == 700 && (v20 & 8) != 0)
  {
    v21 = *(void **)(a1 + 56);
    v22 = NSString;
    v23 = [v5 label];
    v24 = [v23 capitalizedString];
    v25 = [v7 label];
    id v26 = [v22 stringWithFormat:@"[%@] %@", v24, v25];
    [v21 addObject:v26];

LABEL_35:
    goto LABEL_36;
  }
  int v27 = [v5 domain];
  if ((v20 & 0x10) != 0)
  {
    if (v27 != 501 && [v5 domain] != 502) {
      goto LABEL_36;
    }
LABEL_33:
    uint64_t v28 = *(void **)(a1 + 64);
    [v5 confidence];
    uint64_t v31 = v8[2](v8);
    goto LABEL_34;
  }
  if (v27 == 600 && (*(unsigned char *)(a1 + 80) & 0x20) != 0)
  {
    id v32 = v5;
    id v33 = v7;
    uint64_t v44 = v33;
    int v34 = [v32 isReliable];
    id v35 = @"NO";
    if (v34) {
      id v35 = @"YES";
    }
    v36 = v35;
    uint64_t v43 = [v32 numberOfAssets];
    uint64_t v37 = [v32 numberOfHighConfidenceAssets];
    uint64_t v38 = [v32 numberOfSearchConfidenceAssets];
    int v39 = NSString;
    v40 = [v33 keywordDescription];
    [v32 confidence];
    uint64_t v42 = v41;

    v23 = [v39 stringWithFormat:@"%@ #all:%lu #highConf:%lu #searchConf:%lu reliable:%@ - (%0.2f)", v40, v43, v37, v38, v36, v42];

    [*(id *)(a1 + 72) addObject:v23];
    goto LABEL_35;
  }
  if ([v5 domain] == 503 && (*(unsigned char *)(a1 + 80) & 0x10) != 0) {
    goto LABEL_33;
  }
  if ([v5 domain] == 900 && (*(unsigned char *)(a1 + 80) & 0x10) != 0)
  {
    uint64_t v28 = *(void **)(a1 + 64);
LABEL_30:
    uint64_t v31 = [v7 keywordDescription];
LABEL_34:
    v23 = (void *)v31;
    [v28 addObject:v31];
    goto LABEL_35;
  }
LABEL_36:
}

id __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_2(uint64_t a1, double a2)
{
  v3 = NSString;
  v4 = [*(id *)(a1 + 32) keywordDescription];
  id v5 = [v3 stringWithFormat:@"%@ (%0.2f)", v4, *(void *)&a2];

  return v5;
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 domain] == 200)
  {
    double v3 = *(double *)(a1 + 40);
  }
  else
  {
    if ([v9 domain] != 201) {
      goto LABEL_6;
    }
    [v9 relevance];
    double v3 = v4 * *(double *)(a1 + 48);
  }
  id v5 = [v9 targetNode];
  id v6 = NSString;
  id v7 = [v5 keywordDescription];
  v8 = [v6 stringWithFormat:@"%@ (%0.2f)", v7, *(void *)&v3];

  [*(id *)(a1 + 32) addObject:v8];
LABEL_6:
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 collection];
  id v5 = [v4 ownerNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_5;
  v7[3] = &unk_1E68EDA10;
  id v8 = v3;
  uint64_t v10 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateNodesUsingBlock:v7];
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = NSString;
  id v5 = [a3 keywordDescription];
  id v6 = [v4 stringWithFormat:@"%@ (%0.2f)", v5, *(void *)(a1 + 40)];

  [*(id *)(a1 + 32) addObject:v6];
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = NSString;
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 label];
  id v7 = [v5 name];

  id v8 = [v3 stringWithFormat:@"[%@] - %@ (%0.2f)", v6, v7, *(void *)(a1 + 48)];

  [*(id *)(a1 + 40) addObject:v8];
}

- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(PGGraphHighlightNode *)self domain] == a3)
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:self];
  }
  else if (v3 == 100)
  {
    id v6 = [(PGGraphHighlightNode *)self eventCollection];
    id v7 = [v6 eventMomentNodes];
    id v5 = [v7 temporarySet];
  }
  else
  {
    id v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v3;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Unsupported target domain: %u", (uint8_t *)v11, 8u);
    }

    id v5 = 0;
  }
  return v5;
}

- (double)weightForMoment:(id)a3
{
  int v3 = [(MANode *)self anyEdgeTowardNode:a3];
  [v3 weight];
  double v5 = v4;

  return v5;
}

- (id)debugDictionaryWithServiceManager:(id)a3
{
  v34[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [PGTitleGenerationContext alloc];
  id v6 = [(MANode *)self graph];
  uint64_t v7 = [(PGTitleGenerationContext *)v5 initWithGraph:v6 serviceManager:v4];

  id v32 = (void *)v7;
  id v8 = [[PGHighlightTitleGenerator alloc] initWithCollection:self curatedAssetCollection:0 keyAsset:0 createVerboseTitle:0 titleGenerationContext:v7];
  id v9 = [(PGHighlightTitleGenerator *)v8 titleTuple];
  uint64_t v10 = [v9 title];
  uint64_t v11 = [v10 stringValue];
  uint64_t v12 = (void *)v11;
  if (v11) {
    double v13 = (__CFString *)v11;
  }
  else {
    double v13 = &stru_1F283BC78;
  }
  uint64_t v31 = v13;

  double v14 = [v9 subtitle];
  uint64_t v15 = [v14 stringValue];
  id v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_1F283BC78;
  }
  v18 = v17;

  uint64_t v19 = [v10 category];
  uint64_t v20 = [[PGHighlightTitleGenerator alloc] initWithCollection:self curatedAssetCollection:0 keyAsset:0 createVerboseTitle:1 titleGenerationContext:v7];

  v21 = [(PGHighlightTitleGenerator *)v20 titleTuple];
  v22 = [v21 subtitle];
  v23 = [v22 stringValue];

  v33[0] = @"weightedAverageContentScore";
  v24 = NSNumber;
  [(PGGraphHighlightNode *)self contentScore];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  v34[0] = v25;
  v34[1] = v31;
  v33[1] = @"title";
  v33[2] = @"subtitle";
  v34[2] = v18;
  v34[3] = v23;
  v33[3] = @"verboseSmartDescription";
  v33[4] = @"titleCategory";
  id v26 = [NSNumber numberWithInteger:v19];
  v34[4] = v26;
  v33[5] = @"meaningLabels";
  int v27 = [(PGGraphHighlightNode *)self meaningLabels];
  uint64_t v28 = [v27 allObjects];
  v34[5] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:6];

  return v29;
}

- (id)meaningfulEvent
{
  return 0;
}

- (void)enumerateBusinessesUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PGGraphHighlightNode *)self collection];
  id v6 = [v5 momentNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PGGraphHighlightNode_enumerateBusinessesUsingBlock___block_invoke;
  v8[3] = &unk_1E68E9C68;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateNodesUsingBlock:v8];
}

uint64_t __54__PGGraphHighlightNode_enumerateBusinessesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateBusinessesUsingBlock:*(void *)(a1 + 32)];
}

- (id)seasonNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  id v6 = [v5 dateNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PGGraphHighlightNode_seasonNodes__block_invoke;
  v9[3] = &unk_1E68ED880;
  id v7 = v3;
  id v10 = v7;
  [v6 enumerateNodesUsingBlock:v9];

  return v7;
}

void __35__PGGraphHighlightNode_seasonNodes__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 seasonNode];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    int v3 = v4;
  }
}

- (id)publicEventNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PGGraphHighlightNode_publicEventNodes__block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __40__PGGraphHighlightNode_publicEventNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PGGraphHighlightNode_publicEventNodes__block_invoke_2;
  v3[3] = &unk_1E68ED920;
  id v4 = *(id *)(a1 + 32);
  [a2 enumeratePublicEventNodesUsingBlock:v3];
}

uint64_t __40__PGGraphHighlightNode_publicEventNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)businessNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PGGraphHighlightNode_businessNodes__block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __37__PGGraphHighlightNode_businessNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PGGraphHighlightNode_businessNodes__block_invoke_2;
  v3[3] = &unk_1E68ED8F8;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateBusinessNodesUsingBlock:v3];
}

uint64_t __37__PGGraphHighlightNode_businessNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)addressNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  int v3 = [v2 momentNodes];
  id v4 = [v3 addressNodes];
  double v5 = [v4 set];

  return v5;
}

- (BOOL)hasLocation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(PGGraphHighlightNode *)self collection];
  int v3 = [v2 momentNodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PGGraphHighlightNode_hasLocation__block_invoke;
  v5[3] = &unk_1E68EB798;
  v5[4] = &v6;
  [v3 enumerateNodesUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__PGGraphHighlightNode_hasLocation__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 hasLocation];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)roiNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PGGraphHighlightNode_roiNodes__block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __32__PGGraphHighlightNode_roiNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__PGGraphHighlightNode_roiNodes__block_invoke_2;
  v3[3] = &unk_1E68ED8D0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateROINodesUsingBlock:v3];
}

uint64_t __32__PGGraphHighlightNode_roiNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)poiNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PGGraphHighlightNode_poiNodes__block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __32__PGGraphHighlightNode_poiNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__PGGraphHighlightNode_poiNodes__block_invoke_2;
  v3[3] = &unk_1E68ED8A8;
  id v4 = *(id *)(a1 + 32);
  [a2 enumeratePOINodesUsingBlock:v3];
}

uint64_t __32__PGGraphHighlightNode_poiNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)celebratedHolidayNodes
{
  int v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  id v6 = [v5 dateNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke;
  v9[3] = &unk_1E68ED880;
  id v7 = v3;
  id v10 = v7;
  [v6 enumerateNodesUsingBlock:v9];

  return v7;
}

void __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke_2;
  v3[3] = &unk_1E68EF038;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateHolidayNodesUsingBlock:v3];
}

void __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasEdgeWithLabel:@"CELEBRATING" domain:401]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)holidayNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  id v6 = [v5 dateNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__PGGraphHighlightNode_holidayNodes__block_invoke;
  v9[3] = &unk_1E68ED880;
  id v7 = v3;
  id v10 = v7;
  [v6 enumerateNodesUsingBlock:v9];

  return v7;
}

void __36__PGGraphHighlightNode_holidayNodes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PGGraphHighlightNode_holidayNodes__block_invoke_2;
  v3[3] = &unk_1E68EF038;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateHolidayNodesUsingBlock:v3];
}

uint64_t __36__PGGraphHighlightNode_holidayNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)dateNodes
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  id v6 = [v5 dateNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__PGGraphHighlightNode_dateNodes__block_invoke;
  v9[3] = &unk_1E68ED880;
  id v7 = v3;
  id v10 = v7;
  [v6 enumerateNodesUsingBlock:v9];

  return v7;
}

uint64_t __33__PGGraphHighlightNode_dateNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)consolidatedPersonNodesPresentInAssets
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 consolidatedPersonNodesPresentInAssets];
  double v5 = [v4 set];

  return v5;
}

- (id)consolidatedPersonNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 consolidatedPersonNodes];
  double v5 = [v4 set];

  return v5;
}

- (id)personNodesInProximity
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 personNodesInProximity];
  double v5 = [v4 set];

  return v5;
}

- (id)socialGroupNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 socialGroupNodes];
  double v5 = [v4 set];

  return v5;
}

- (id)petNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 petNodes];
  double v5 = [v4 set];

  return v5;
}

- (id)personNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 personNodes];
  double v5 = [v4 set];

  return v5;
}

- (BOOL)hasPeopleCountingMe:(BOOL)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v4 = [(PGGraphHighlightNode *)self collection];
  double v5 = [v4 momentNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PGGraphHighlightNode_hasPeopleCountingMe___block_invoke;
  v7[3] = &unk_1E68E52C0;
  BOOL v8 = a3;
  void v7[4] = &v9;
  [v5 enumerateNodesUsingBlock:v7];

  LOBYTE(v4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

uint64_t __44__PGGraphHighlightNode_hasPeopleCountingMe___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 hasPeopleCountingMe:*(unsigned __int8 *)(a1 + 40)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)fetchAssetCollectionInPhotoLibrary:(id)a3
{
  id v4 = a3;
  double v5 = [(MANode *)self graph];
  id v6 = [v5 highlightForHighlightNode:self inPhotoLibrary:v4];

  return v6;
}

- (id)anniversaryPersonNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 anniversaryPersonNodes];

  return v4;
}

- (id)birthdayPersonNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 birthdayPersonNodes];

  return v4;
}

- (id)reliableMeaningLabels
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 reliableMeaningNodes];
  double v5 = [v4 meaningLabels];

  return v5;
}

- (id)meaningLabels
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [v3 meaningNodes];
  double v5 = [v4 meaningLabels];

  return v5;
}

- (id)eventEnrichmentSortedMomentNodes
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  double v5 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v4);
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  BOOL v8 = [v3 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)eventEnrichmentMomentNodes
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];

  return v3;
}

- (id)eventSortedMomentNodes
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  double v5 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v4);
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  BOOL v8 = [v3 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (double)contentScore
{
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PGGraphHighlightNode_contentScore__block_invoke;
  v7[3] = &unk_1E68EDC78;
  void v7[4] = &v12;
  void v7[5] = &v8;
  [v3 enumerateNodesUsingBlock:v7];

  unint64_t v4 = v9[3];
  if (v4)
  {
    double v5 = v13[3] / (double)v4;
    v13[3] = v5;
  }
  else
  {
    double v5 = v13[3];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

double __36__PGGraphHighlightNode_contentScore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 numberOfAssets];
  [v3 contentScore];
  double v6 = v5;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v7 + 24) + v6 * (double)v4;
  *(double *)(v7 + 24) = result;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v4;
  return result;
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

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(PGGraphHighlightNode *)self collection];
    double v6 = [v5 momentNodes];
    uint64_t v7 = [v6 preciseAddressNodes];
    uint64_t v8 = [v4 homeOrWorkNodes];
    uint64_t v9 = [v8 addressNodes];
    char v10 = [v7 intersectsCollection:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(PGGraphHighlightNode *)self collection];
    double v6 = [v5 momentNodes];
    uint64_t v7 = [v6 preciseAddressNodes];
    uint64_t v8 = [v4 workNodes];
    uint64_t v9 = [v8 addressNodes];
    char v10 = [v7 intersectsCollection:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(PGGraphHighlightNode *)self collection];
    double v6 = [v5 momentNodes];
    uint64_t v7 = [v6 preciseAddressNodes];
    uint64_t v8 = [v4 homeNodes];
    uint64_t v9 = [v8 addressNodes];
    char v10 = [v7 intersectsCollection:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)numberOfShinyGemAssets
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphHighlightNode_numberOfShinyGemAssets__block_invoke;
  v6[3] = &unk_1E68EB798;
  v6[4] = &v7;
  [v3 enumerateNodesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__PGGraphHighlightNode_numberOfShinyGemAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfShinyGemAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfRegularGemAssets
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphHighlightNode_numberOfRegularGemAssets__block_invoke;
  v6[3] = &unk_1E68EB798;
  v6[4] = &v7;
  [v3 enumerateNodesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__PGGraphHighlightNode_numberOfRegularGemAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfRegularGemAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)isSmartInteresting
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  unint64_t v4 = [v3 smartInterestingSubset];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)isInterestingWithAlternateJunking
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  unint64_t v4 = [v3 interestingWithAlternateJunkingSubset];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)isInteresting
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  unint64_t v4 = [v3 interestingSubset];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)petIsPresent
{
  v2 = [(PGGraphHighlightNode *)self collection];
  id v3 = [v2 momentNodes];
  unint64_t v4 = [v3 petNodes];
  BOOL v5 = [v4 count] != 0;

  return v5;
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

- (BOOL)isPartOfAggregation
{
  v2 = [(PGGraphHighlightNode *)self highlightGroupNode];
  char v3 = [v2 isAggregation];

  return v3;
}

- (BOOL)isPartOfShortTrip
{
  v2 = [(PGGraphHighlightNode *)self highlightGroupNode];
  char v3 = [v2 isShortTrip];

  return v3;
}

- (BOOL)isPartOfLongTrip
{
  v2 = [(PGGraphHighlightNode *)self highlightGroupNode];
  char v3 = [v2 isLongTrip];

  return v3;
}

- (BOOL)isPartOfTrip
{
  v2 = [(PGGraphHighlightNode *)self highlightGroupNode];
  char v3 = [v2 isTrip];

  return v3;
}

- (double)timezoneOffsetAtEnd
{
  return self->_localEndTimestamp - self->_universalEndTimestamp;
}

- (double)timezoneOffsetAtStart
{
  return self->_localStartTimestamp - self->_universalStartTimestamp;
}

- (PGGraphHighlightGroupNode)highlightGroupNode
{
  v2 = [(PGGraphHighlightNode *)self collection];
  char v3 = [v2 highlightGroupNodes];
  unint64_t v4 = [v3 anyNode];

  return (PGGraphHighlightGroupNode *)v4;
}

- (NSString)UUID
{
  return self->_uuid;
}

- (NSString)localIdentifier
{
  return (NSString *)[MEMORY[0x1E4F39238] localIdentifierWithUUID:self->_uuid];
}

- (PGGraphHighlightNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphHighlightNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 102;
}

- (id)label
{
  v2 = @"Highlight";
  return @"Highlight";
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphHighlightNode (%@, %@)", self->_uuid, self->_name];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    uint64_t v5 = 56;
LABEL_3:
    double v6 = *(__CFString **)((char *)&self->super.super.super.super.isa + v5);
    if (!v6) {
      double v6 = &stru_1F283BC78;
    }
    uint64_t v7 = v6;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"utcs"])
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = 72;
LABEL_14:
    uint64_t v7 = [v8 numberWithDouble:*(double *)((char *)&self->super.super.super.super.isa + v9)];
LABEL_15:
    uint64_t v10 = v7;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"utce"])
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = 80;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"tzs"])
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = 32;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"tze"])
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = 40;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"id"])
  {
    uint64_t v5 = 64;
    goto LABEL_3;
  }
  if ([v4 isEqualToString:@"sharingComposition"])
  {
    uint64_t v7 = [NSNumber numberWithUnsignedShort:self->_sharingComposition];
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on %@.", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v10 = 0;
LABEL_16:

  return v10;
}

- (id)propertyDictionary
{
  v14[7] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  if (!name) {
    name = (NSString *)&stru_1F283BC78;
  }
  v14[0] = name;
  v13[0] = @"name";
  v13[1] = @"utcs";
  id v4 = [NSNumber numberWithDouble:self->_universalStartTimestamp];
  v14[1] = v4;
  v13[2] = @"utce";
  uint64_t v5 = [NSNumber numberWithDouble:self->_universalEndTimestamp];
  v14[2] = v5;
  v13[3] = @"tzs";
  double v6 = [NSNumber numberWithDouble:self->_localStartTimestamp];
  v14[3] = v6;
  v13[4] = @"tze";
  uint64_t v7 = [NSNumber numberWithDouble:self->_localEndTimestamp];
  uint64_t v8 = (void *)v7;
  uuid = self->_uuid;
  if (!uuid) {
    uuid = (NSString *)&stru_1F283BC78;
  }
  v14[4] = v7;
  v14[5] = uuid;
  v13[5] = @"id";
  v13[6] = @"sharingComposition";
  uint64_t v10 = [NSNumber numberWithUnsignedShort:self->_sharingComposition];
  v14[6] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v11;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    double v6 = [v5 objectForKeyedSubscript:@"id"];
    uint64_t v7 = v6;
    if (v6 && ![v6 isEqual:self->_uuid]) {
      goto LABEL_11;
    }

    uint64_t v8 = [v5 objectForKeyedSubscript:@"name"];
    uint64_t v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_name]) {
        goto LABEL_11;
      }
    }

    uint64_t v9 = [v5 objectForKeyedSubscript:@"sharingComposition"];
    uint64_t v7 = v9;
    if (v9 && [v9 unsignedShortValue] != self->_sharingComposition) {
LABEL_11:
    }
      BOOL v10 = 0;
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)setLocalProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"name"];
  name = self->_name;
  self->_name = v5;

  uint64_t v7 = [v4 objectForKeyedSubscript:@"utcs"];
  [v7 doubleValue];
  self->_universalStartTimestamp = v8;

  uint64_t v9 = [v4 objectForKeyedSubscript:@"utce"];
  [v9 doubleValue];
  self->_universalEndTimestamp = v10;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"tzs"];
  [v11 doubleValue];
  self->_localStartTimestamp = v12;

  double v13 = [v4 objectForKeyedSubscript:@"tze"];
  [v13 doubleValue];
  self->_localEndTimestamp = v14;

  id v15 = [v4 objectForKeyedSubscript:@"id"];
  uuid = self->_uuid;
  self->_uuid = v15;

  id v17 = [v4 objectForKeyedSubscript:@"sharingComposition"];

  self->_sharingComposition = [v17 unsignedShortValue];
}

- (PGGraphHighlightNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(PGGraphNode *)self init];
  double v8 = v7;
  if (v7) {
    [(PGGraphHighlightNode *)v7 setLocalProperties:v6];
  }

  return v8;
}

- (id)initFromHighlight:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphHighlightNode;
  uint64_t v5 = [(PGGraphNode *)&v8 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() propertiesWithHighlight:v4];
    [(PGGraphHighlightNode *)v5 setLocalProperties:v6];
  }
  return v5;
}

+ (MARelation)highlightWithPrivateAndSharedAssetsOfHighlight
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphHighlightNode filter];
  uint64_t v7 = @"sharingComposition";
  v8[0] = &unk_1F28D0720;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  uint64_t v5 = [v4 relation];

  return (MARelation *)v5;
}

+ (MARelation)highlightWithSharedAssetsOfHighlight
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphHighlightNode filter];
  objc_super v8 = @"sharingComposition";
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&unk_1F28D0708];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  id v6 = [v5 relation];

  return (MARelation *)v6;
}

+ (MARelation)highlightWithPrivateAssetsOfHighlight
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphHighlightNode filter];
  objc_super v8 = @"sharingComposition";
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:2 value:&unk_1F28D06F0];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v2 filterBySettingProperties:v4];

  id v6 = [v5 relation];

  return (MARelation *)v6;
}

+ (MARelation)momentInHighlight
{
  v10[2] = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F71F18];
  id v4 = +[PGGraphHighlightGroupNode highlightOfHighlightGroup];
  uint64_t v5 = [v4 optionalStep];
  v10[0] = v5;
  id v6 = [a1 momentInDayHighlight];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v8 = [v3 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)highlightGroupOfHighlight
{
  v2 = +[PGGraphGroupContainsEdge filter];
  char v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentInDayHighlight
{
  v2 = +[PGGraphContainsEdge filter];
  char v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    uint64_t v7 = &stru_1F283BC78;
    if (v5) {
      uint64_t v7 = v5;
    }
    [NSString stringWithFormat:@"(%@:Highlight)", v7];
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    id v6 = &stru_1F283BC78;
    if (v5) {
      id v6 = v5;
    }
    [NSString stringWithFormat:@"(:Highlight)-[:CONTAINS]->(%@:Moment)", v6];
    objc_super v8 = LABEL_9:;
    goto LABEL_13;
  }
  uint64_t v9 = +[PGLogging sharedLogging];
  double v10 = [v9 loggingConnection];

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
    uint64_t v7 = &stru_1F283BC78;
    if (v5) {
      uint64_t v7 = v5;
    }
    [NSString stringWithFormat:@"(%@:Highlight)", v7];
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    id v6 = &stru_1F283BC78;
    if (v5) {
      id v6 = v5;
    }
    [NSString stringWithFormat:@"(%@:Moment)<-[:CONTAINS]-(:Highlight)", v6];
    objc_super v8 = LABEL_9:;
    goto LABEL_13;
  }
  uint64_t v9 = +[PGLogging sharedLogging];
  double v10 = [v9 loggingConnection];

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
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 == 102)
  {
    int v4 = &stru_1F283BC78;
  }
  else
  {
    int v3 = a3;
    if (a3 == 100)
    {
      int v4 = [(id)objc_opt_class() pathToMoment];
    }
    else
    {
      uint64_t v5 = +[PGLogging sharedLogging];
      id v6 = [v5 loggingConnection];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v3;
        _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v8, 8u);
      }

      int v4 = 0;
    }
  }
  return v4;
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 == 102)
  {
    int v4 = &stru_1F283BC78;
  }
  else
  {
    int v3 = a3;
    if (a3 == 100)
    {
      int v4 = [(id)objc_opt_class() pathFromMoment];
    }
    else
    {
      uint64_t v5 = +[PGLogging sharedLogging];
      id v6 = [v5 loggingConnection];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v3;
        _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v8, 8u);
      }

      int v4 = 0;
    }
  }
  return v4;
}

+ (id)pathToMoment
{
  return @"-[:CONTAINS]->(:Moment)";
}

+ (id)pathFromMoment
{
  return @"(:Moment)<-[:CONTAINS]-";
}

+ (id)promotionScoreSortDescriptors
{
  if (promotionScoreSortDescriptors_onceToken != -1) {
    dispatch_once(&promotionScoreSortDescriptors_onceToken, &__block_literal_global_4203);
  }
  v2 = (void *)promotionScoreSortDescriptors_sortDescriptors;
  return v2;
}

void __53__PGGraphHighlightNode_promotionScoreSortDescriptors__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"promotionScore" ascending:0];
  v1 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"localStartDate", 1, v0);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  int v4 = (void *)promotionScoreSortDescriptors_sortDescriptors;
  promotionScoreSortDescriptors_sortDescriptors = v3;
}

+ (id)propertiesWithHighlight:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  id v6 = [v4 uuid];
  [v5 setObject:v6 forKeyedSubscript:@"id"];
  uint64_t v7 = NSNumber;
  objc_super v8 = [v4 localStartDate];
  [v8 timeIntervalSince1970];
  uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
  [v5 setObject:v9 forKeyedSubscript:@"tzs"];

  double v10 = NSNumber;
  uint64_t v11 = [v4 startDate];
  [v11 timeIntervalSince1970];
  double v12 = objc_msgSend(v10, "numberWithDouble:");
  [v5 setObject:v12 forKeyedSubscript:@"utcs"];

  int v13 = NSNumber;
  uint64_t v14 = [v4 localEndDate];
  [v14 timeIntervalSince1970];
  id v15 = objc_msgSend(v13, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:@"tze"];

  __int16 v16 = NSNumber;
  id v17 = [v4 endDate];
  [v17 timeIntervalSince1970];
  uint64_t v18 = objc_msgSend(v16, "numberWithDouble:");
  [v5 setObject:v18 forKeyedSubscript:@"utce"];

  uint64_t v19 = NSNumber;
  uint64_t v20 = [v4 sharingComposition];

  v21 = [v19 numberWithUnsignedShort:v20];
  [v5 setObject:v21 forKeyedSubscript:@"sharingComposition"];

  return v5;
}

+ (id)filterWithUUID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 allHighlightsFilter];
  uint64_t v9 = @"id";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterWithUUIDs:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 allHighlightsFilter];
  uint64_t v9 = @"id";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)allHighlightsFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:102];
  return v2;
}

+ (id)dayHighlightsFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Highlight" domain:102];
  return v2;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Highlight" domain:102];
  return v2;
}

- (double)nonMeaningfulPromotionScoreForTripKeyAssetWithEnrichmentState:(unsigned __int16)a3 neighborScoreComputer:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(PGGraphHighlightNode *)self eventEnrichmentMomentNodes];
  objc_super v8 = [v7 temporarySet];

  if ([v8 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = objc_opt_class();
    if (v9)
    {
      [v9 _promotionScoreDescriptorWithMomentNodes:v8 neighborScoreComputer:v6];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
    }
    *((void *)&v16 + 1) = -1;
    uint64_t v11 = objc_opt_class();
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    v14[3] = v18;
    [v11 nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:v14 isAggregation:0 enrichmentState:v4];
    double v10 = v12;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

+ (double)belowAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  double result = 0.35;
  if (!a3->var11 && !a3->var16)
  {
    if (a3->var17)
    {
      return 0.34;
    }
    else
    {
      double result = 0.25;
      if (a3->var14 > 0.5) {
        return 0.33;
      }
    }
  }
  return result;
}

+ (double)averagePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  if (a3->var17 + a3->var16 > 1) {
    return 0.4;
  }
  double result = 0.25;
  if (!a3->var5 && (a3->var1 || a3->var12 >= 0x11 && a3->var14 > 0.3)) {
    return 0.4;
  }
  return result;
}

+ (double)aboveAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  if (a3->var0) {
    return 0.6;
  }
  if (a3->var7)
  {
    if (a3->var1)
    {
      return 0.55;
    }
    else
    {
      double result = 0.45;
      if (!a3->var2 && !a3->var3)
      {
        BOOL v4 = a3->var14 > 0.3 && a3->var12 > 0x10;
        double result = 0.43;
        if (!v4) {
          return 0.25;
        }
      }
    }
  }
  else if (a3->var16 <= 1)
  {
    double result = 0.25;
    if (!a3->var5 && (a3->var2 || a3->var3)) {
      return 0.41;
    }
  }
  else
  {
    return 0.42;
  }
  return result;
}

+ (double)nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:(id *)a3 isAggregation:(BOOL)a4 enrichmentState:(unsigned __int16)a5
{
  BOOL v5 = a4;
  if (a3->var6 && !a3->var8) {
    return 0.25;
  }
  if (a5 >= 3u)
  {
    if (a3->var5)
    {
      if (a3->var10) {
        goto LABEL_21;
      }
    }
    else
    {
      if (a3->var16 + a3->var17) {
        goto LABEL_21;
      }
      BOOL v10 = a5 == 3 || a3->var4;
      if (a3->var9) {
        goto LABEL_21;
      }
      if (!a3->var10) {
        BOOL v10 = 0;
      }
      if (v10) {
        goto LABEL_21;
      }
    }
    double v8 = 0.25;
    if (a3->var13 <= 4) {
      goto LABEL_28;
    }
LABEL_21:
    long long v11 = *(_OWORD *)&a3->var12;
    long long v19 = *(_OWORD *)&a3->var0;
    long long v20 = v11;
    long long v12 = *(_OWORD *)&a3->var16;
    long long v21 = *(_OWORD *)&a3->var14;
    long long v22 = v12;
    [a1 aboveAveragePromotionScoreWithPromotionScoreDescriptor:&v19];
    if (v13 == 0.25)
    {
      long long v14 = *(_OWORD *)&a3->var12;
      long long v19 = *(_OWORD *)&a3->var0;
      long long v20 = v14;
      long long v15 = *(_OWORD *)&a3->var16;
      long long v21 = *(_OWORD *)&a3->var14;
      long long v22 = v15;
      [a1 averagePromotionScoreWithPromotionScoreDescriptor:&v19];
    }
    if (v13 == 0.25)
    {
      long long v16 = *(_OWORD *)&a3->var12;
      long long v19 = *(_OWORD *)&a3->var0;
      long long v20 = v16;
      long long v17 = *(_OWORD *)&a3->var16;
      long long v21 = *(_OWORD *)&a3->var14;
      long long v22 = v17;
      [a1 belowAveragePromotionScoreWithPromotionScoreDescriptor:&v19];
    }
    double v8 = 0.31;
    if (v13 != 0.25)
    {
      double v8 = v13;
      if (v5) {
        double v8 = fmin(v13, 0.39);
      }
    }
    goto LABEL_28;
  }
  if (a3->var9) {
    goto LABEL_21;
  }
  if (a3->var14 >= 0.4) {
    goto LABEL_21;
  }
  double v8 = 0.25;
  if (a3->var15 > 0.5) {
    goto LABEL_21;
  }
LABEL_28:
  double result = 0.31;
  if (!a3->var6 || v8 < 0.31) {
    return v8;
  }
  return result;
}

+ ($73EC887EE5D1BAEF06918898D778235D)_promotionScoreDescriptorWithMomentNodes:(SEL)a3 neighborScoreComputer:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v49 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  uint64_t v60 = retstr;
  double v8 = [v7 anyObject];
  uint64_t v9 = [v8 graph];

  id v48 = [v9 meNodeCollection];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v7;
  uint64_t v50 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (!v50)
  {
    BOOL v14 = 0;
    BOOL v15 = 0;
    BOOL v40 = 0;
    char v16 = 0;
    char v39 = 0;
    double v37 = 0.0;
    double v17 = 0.0;
    double v38 = 0.0;
    double v18 = 0.0;
    double v36 = 0.0;
    goto LABEL_53;
  }
  uint64_t v42 = v9;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  int v43 = 0;
  unint64_t v58 = 0;
  uint64_t v59 = 0;
  unint64_t v13 = 0;
  BOOL v14 = 0;
  BOOL v15 = 0;
  char v16 = 0;
  uint64_t v47 = *(void *)v65;
  double v17 = 0.0;
  double v18 = 0.0;
  do
  {
    uint64_t v19 = 0;
    int v51 = HIDWORD(v45);
    int v63 = v45;
    int v61 = v43;
    uint64_t v62 = v44;
    do
    {
      if (*(void *)v65 != v47) {
        objc_enumerationMutation(obj);
      }
      long long v20 = *(void **)(*((void *)&v64 + 1) + 8 * v19);
      [v49 neighborScoreWithMomentNode:v20];
      BOOL v22 = v21 >= 0.6;
      BOOL v54 = v21 >= 0.43;
      if (v59)
      {
        LOBYTE(v59) = 1;
        if (!v15) {
          goto LABEL_8;
        }
      }
      else
      {
        LOBYTE(v59) = [v20 isInteresting];
        if (!v15)
        {
LABEL_8:
          char v23 = [v20 isSmartInteresting];
          goto LABEL_11;
        }
      }
      char v23 = 1;
LABEL_11:
      char v57 = v23;
      BOOL v55 = v22;
      BOOL v24 = v14 || [v20 numberOfAssetsWithPersons] != 0;
      BOOL v56 = v24;
      uint64_t v25 = [v20 numberOfAssets];
      int v26 = [v20 happensPartiallyAtWorkOfPersonNodes:v48];
      if (v26) {
        uint64_t v27 = v25;
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v53 = v27;
      if (v26 | [v20 happensPartiallyAtHomeOfPersonNodes:v48]) {
        uint64_t v28 = v25;
      }
      else {
        uint64_t v28 = 0;
      }
      uint64_t v52 = v28;
      if (!v61)
      {
        [v20 inhabitationScore];
        if (v29 < 0.1)
        {
          int v61 = 0;
          goto LABEL_25;
        }
        int v43 = 1;
        v60->var7 = 1;
      }
      int v61 = 1;
LABEL_25:
      if (v51) {
        int v30 = 0;
      }
      else {
        int v30 = v26;
      }
      if (v30 == 1)
      {
        [v20 inhabitationScore];
        unint64_t v31 = v58;
        if (v32 >= 0.5)
        {
          HIDWORD(v45) = 1;
          v60->var8 = 1;
          int v51 = 1;
        }
        else
        {
          int v51 = 0;
        }
      }
      else
      {
        unint64_t v31 = v58;
      }
      if (v62) {
        goto LABEL_36;
      }
      if ([v20 hasHigherThanImprovedAssets])
      {
        LODWORD(v44) = 1;
        v60->var9 = 1;
LABEL_36:
        LODWORD(v62) = 1;
        goto LABEL_37;
      }
      LODWORD(v62) = 0;
LABEL_37:
      if (HIDWORD(v62)) {
        goto LABEL_40;
      }
      if ([v20 hasAssetsWithInterestingScenes])
      {
        HIDWORD(v44) = 1;
        v60->var10 = 1;
LABEL_40:
        HIDWORD(v62) = 1;
        goto LABEL_41;
      }
      HIDWORD(v62) = 0;
LABEL_41:
      if (v63) {
        goto LABEL_44;
      }
      if ([v20 containsBetterScoringAsset])
      {
        LODWORD(v45) = 1;
        v60->var11 = 1;
LABEL_44:
        int v63 = 1;
        goto LABEL_45;
      }
      int v63 = 0;
LABEL_45:
      BYTE4(v59) |= v55;
      v16 |= v54;
      unint64_t v58 = v53 + v31;
      v13 += v52;
      v12 += v25;
      v60->var12 = v12;
      [v20 contentScore];
      double v17 = v33 + v17;
      v60->var14 = v17;
      v11 += [v20 numberOfShinyGemAssets];
      v60->var16 = v11;
      v10 += [v20 numberOfRegularGemAssets];
      v60->var17 = v10;
      [v20 behavioralScore];
      double v18 = v18 + v34;
      ++v19;
      BOOL v14 = v56;
      BOOL v15 = v57;
    }
    while (v50 != v19);
    uint64_t v35 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    uint64_t v50 = v35;
  }
  while (v35);
  double v36 = (double)v13;
  double v37 = (double)v12;
  double v38 = (double)v58;
  uint64_t v9 = v42;
  BOOL v40 = v59;
  char v39 = BYTE4(v59);
LABEL_53:

  v60->var14 = v17 / (double)(unint64_t)[obj count];
  v60->var0 = v39 & 1;
  v60->var1 = v16 & 1;
  v60->var2 = v40;
  v60->var3 = v15;
  v60->var4 = v14;
  v60->var5 = v36 / v37 >= 0.5;
  v60->var6 = v38 / v37 >= 0.5;
  v60->var15 = v18 / (double)(unint64_t)objc_msgSend(obj, "count", v38 / v37);

  return result;
}

+ (id)otherVeryMeaningfulMeanings
{
  if (otherVeryMeaningfulMeanings_onceToken != -1) {
    dispatch_once(&otherVeryMeaningfulMeanings_onceToken, &__block_literal_global_24242);
  }
  v2 = (void *)otherVeryMeaningfulMeanings_meanings;
  return v2;
}

uint64_t __67__PGGraphHighlightNode_PromotionScore__otherVeryMeaningfulMeanings__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E60] indexSet];
  v1 = (void *)otherVeryMeaningfulMeanings_meanings;
  otherVeryMeaningfulMeanings_meanings = v0;

  [(id)otherVeryMeaningfulMeanings_meanings addIndex:13];
  v2 = (void *)otherVeryMeaningfulMeanings_meanings;
  return [v2 addIndex:6];
}

+ (double)promotionScoreWithHighlightNode:(id)a3 enrichmentState:(unsigned __int16)a4 numberOfExtendedAssets:(unint64_t)a5 neighborScoreComputer:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  unint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  BOOL v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  char v12 = [v10 isTrip];
  unint64_t v13 = +[PGGraph veryMeaningfulMeanings];
  unint64_t v28 = a5;
  BOOL v14 = [a1 otherVeryMeaningfulMeanings];
  BOOL v15 = +[PGGraph lessMeaningfulMeanings];
  char v16 = [v10 collection];
  double v17 = [v16 momentNodes];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __133__PGGraphHighlightNode_PromotionScore__promotionScoreWithHighlightNode_enrichmentState_numberOfExtendedAssets_neighborScoreComputer___block_invoke;
  v34[3] = &unk_1E68E7A20;
  char v44 = v12;
  double v38 = &v45;
  char v39 = &v65;
  BOOL v40 = &v49;
  id v18 = v13;
  id v35 = v18;
  id v19 = v14;
  id v36 = v19;
  uint64_t v41 = &v61;
  id v20 = v15;
  id v37 = v20;
  uint64_t v42 = &v57;
  int v43 = &v53;
  [v17 enumerateNodesUsingBlock:v34];

  if (*((unsigned char *)v46 + 24)) {
    char v21 = v12;
  }
  else {
    char v21 = 1;
  }
  if (*((unsigned char *)v46 + 24)) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.2;
  }
  if ((v21 & 1) == 0)
  {
    if (*((unsigned char *)v50 + 24))
    {
      double v22 = 0.9;
      if (!*((unsigned char *)v66 + 24) && !*((unsigned char *)v62 + 24)) {
        double v22 = dbl_1D1F4F1D0[*((unsigned char *)v58 + 24) == 0];
      }
    }
    else if (*((unsigned char *)v54 + 24))
    {
      double v22 = 0.6;
    }
    else
    {
      char v23 = [v10 eventEnrichmentMomentNodes];
      BOOL v24 = [v23 temporarySet];

      if ([v24 count])
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        [a1 _promotionScoreDescriptorWithMomentNodes:v24 neighborScoreComputer:v11];
        *((void *)&v31 + 1) = v28;
        uint64_t v25 = [v10 isAggregation];
        v29[0] = v30;
        v29[1] = v31;
        v29[2] = v32;
        v29[3] = v33;
        [a1 nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:v29 isAggregation:v25 enrichmentState:v8];
        double v22 = v26;
      }
      else
      {
        double v22 = 0.25;
      }
    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v22;
}

void __133__PGGraphHighlightNode_PromotionScore__promotionScoreWithHighlightNode_enrichmentState_numberOfExtendedAssets_neighborScoreComputer___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && [v5 containsNonJunkAssets]
    && ((*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1, *(unsigned char *)(a1 + 104))
     || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
  {
    *a3 = 1;
  }
  else
  {
    id v19 = v6;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = objc_msgSend(v6, "meaningLabels", a3);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = +[PGGraph meaningForMeaningLabel:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v12 != 16)
          {
            unint64_t v13 = v12;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
            if ([*(id *)(a1 + 32) containsIndex:v12])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
              unsigned char *v18 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
              goto LABEL_20;
            }
            char v14 = [*(id *)(a1 + 40) containsIndex:v13];
            uint64_t v15 = a1 + 80;
            if ((v14 & 1) != 0
              || (char v16 = [*(id *)(a1 + 48) containsIndex:v13], v15 = a1 + 88, (v16 & 1) != 0))
            {
              *(unsigned char *)(*(void *)(*(void *)v15 + 8) + 24) = 1;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    id v6 = v19;
    double v17 = [v19 publicEventNodes];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= [v17 count] != 0;
  }
}

@end