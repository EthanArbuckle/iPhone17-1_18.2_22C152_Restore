@interface PGHighlightEnrichmentUtilities
+ (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4;
+ (BOOL)canUseSharingComposition:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4;
+ (double)meaningScoreWithMeanings:(id)a3 forLongTrip:(BOOL)a4 graph:(id)a5 collection:(id)a6 keyAsset:(id)a7 keyAssetCriteriaScore:(double *)a8 curationManager:(id)a9;
+ (id)assetPropertySetsForEnrichment;
+ (id)childHighlightNodeOfGroupHighlightNode:(id)a3 withLocalIdentifier:(id)a4;
+ (id)filteredAssetsInAssets:(id)a3 withSharingComposition:(unsigned __int16)a4 forSharingFilter:(unsigned __int16)a5;
+ (id)filteredHighlightNodesWithHighlightNodes:(id)a3 forSharingFilter:(unsigned __int16)a4;
+ (id)filteredMomentNodesWithHighlightNode:(id)a3 forSharingFilter:(unsigned __int16)a4;
+ (id)filteredSummarizedFeaturesForHighlightWithInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
+ (id)headKeyAssetWithExtendedCuration:(id)a3;
+ (id)internalPredicateForFetchingAssetsForSharingFilter:(unsigned __int16)a3;
+ (id)keyAssetForDayGroupHighlightWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curationManager:(id)a5 progressBlock:(id)a6;
+ (id)keyAssetForMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3 keyAssetPrivate:(id)a4 keyAssetShared:(id)a5;
+ (id)requiredAssetsInAssets:(id)a3 withHighlightInfo:(id)a4;
+ (id)selectKeyAssetForSharingComposition:(unsigned __int16)a3 mixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a4 givenHighlightFilter:(unsigned __int16)a5 privateHandler:(id)a6 sharedHandler:(id)a7;
+ (unsigned)mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:(id)a3 keyAssetShared:(id)a4 shouldCompareHighlight:(BOOL)a5;
@end

@implementation PGHighlightEnrichmentUtilities

+ (id)filteredSummarizedFeaturesForHighlightWithInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  int v5 = a4;
  id v6 = a3;
  v7 = v6;
  if (v5 == 2)
  {
    uint64_t v8 = [v6 mixedSummarizedFeatures];
  }
  else if (v5 == 1)
  {
    uint64_t v8 = [v6 sharedSummarizedFeatures];
  }
  else
  {
    if (v5) {
      goto LABEL_8;
    }
    uint64_t v8 = [v6 privateSummarizedFeatures];
  }
  v4 = (void *)v8;
LABEL_8:

  return v4;
}

+ (id)selectKeyAssetForSharingComposition:(unsigned __int16)a3 mixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a4 givenHighlightFilter:(unsigned __int16)a5 privateHandler:(id)a6 sharedHandler:(id)a7
{
  int v8 = a5;
  unsigned int v9 = a4;
  int v10 = a3;
  id v11 = a6;
  id v12 = a7;
  v13 = v12;
  switch(v10)
  {
    case 2:
      id v12 = v11;
      if (v8)
      {
        if (v8 == 2)
        {
          id v12 = v11;
          if (v9 >= 2)
          {
            if (v9 != 2) {
              break;
            }
            id v12 = v13;
          }
        }
        else
        {
          id v12 = v13;
          if (v8 != 1) {
            break;
          }
        }
      }
      goto LABEL_11;
    case 1:
      if ((v8 - 1) >= 2) {
        break;
      }
LABEL_11:
      v14 = (*((void (**)(void))v12 + 2))();
      goto LABEL_16;
    case 0:
      id v12 = v11;
      if ((v8 & 0xFFFFFFFD) == 0) {
        goto LABEL_11;
      }
      break;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 infoNode];
  char v7 = [v6 canUseLocationDomain];

  if (v7)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unsigned int v9 = objc_msgSend(v5, "momentNodes", 0);
    uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) hasLocation])
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

+ (BOOL)canUseSharingComposition:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4
{
  BOOL v4 = (a3 - 1) < 2;
  BOOL v5 = (a3 & 0xFFFD) == 0;
  if (a4) {
    BOOL v5 = 0;
  }
  if (a4 != 1) {
    BOOL v4 = v5;
  }
  return a4 == 2 || v4;
}

+ (id)keyAssetForMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3 keyAssetPrivate:(id)a4 keyAssetShared:(id)a5
{
  int v6 = a3;
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = v8;
  if (v6 == 2)
  {
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  uint64_t v10 = v7;
  if (v6 == 1)
  {
LABEL_7:
    id v12 = v10;
    goto LABEL_9;
  }
  if (!v6)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    uint64_t v10 = v7;
    if (v11)
    {
      *(_WORD *)long long v14 = 0;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Mixed composition has unspecified key asset relationship: using private key asset.", v14, 2u);
      uint64_t v10 = v7;
    }
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

+ (unsigned)mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:(id)a3 keyAssetShared:(id)a4 shouldCompareHighlight:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 curationScore];
  double v10 = v9;
  [v8 curationScore];
  double v12 = v11;
  if (v5 && v10 >= *MEMORY[0x1E4F8E740] && v11 >= *MEMORY[0x1E4F8E740])
  {
    long long v14 = [v7 photoLibrary];
    long long v15 = [v14 librarySpecificFetchOptions];

    [v15 setFetchLimit:1];
    long long v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
    [v15 setPredicate:v16];

    v17 = [MEMORY[0x1E4F39238] fetchAssetCollectionsContainingAsset:v7 withType:6 options:v15];
    uint64_t v18 = [v17 firstObject];

    v19 = [MEMORY[0x1E4F39238] fetchAssetCollectionsContainingAsset:v8 withType:6 options:v15];
    v20 = [v19 firstObject];

    if (v18 && v20)
    {
      [v18 promotionScore];
      double v22 = v21;
      [v20 promotionScore];
      if (v22 > v23)
      {
        unsigned __int16 v24 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (v23 > v22)
      {
        unsigned __int16 v24 = 2;
        goto LABEL_24;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = [v7 uuid];
      v26 = [v18 uuid];
      v27 = [v8 uuid];
      v28 = [v20 uuid];
      *(_DWORD *)buf = 138413058;
      v37 = v25;
      __int16 v38 = 2112;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v27;
      __int16 v42 = 2112;
      v43 = v28;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot find corresponding highlight for key asset private %@: %@, key asset shared %@: %@", buf, 0x2Au);
    }
  }
  if (v10 > v12) {
    goto LABEL_17;
  }
  if (v12 > v10) {
    goto LABEL_19;
  }
  [v7 overallAestheticScore];
  float v30 = v29;
  [v8 overallAestheticScore];
  if (v30 > v31)
  {
LABEL_17:
    unsigned __int16 v24 = 1;
    goto LABEL_25;
  }
  if (v31 > v30)
  {
LABEL_19:
    unsigned __int16 v24 = 2;
    goto LABEL_25;
  }
  v32 = [v7 uuid];
  v33 = [v8 uuid];
  uint64_t v34 = [v32 compare:v33];

  if (v34 == -1) {
    unsigned __int16 v24 = 1;
  }
  else {
    unsigned __int16 v24 = 2;
  }
LABEL_25:

  return v24;
}

+ (id)filteredHighlightNodesWithHighlightNodes:(id)a3 forSharingFilter:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  int v6 = v5;
  if (v4)
  {
    if (v4 == 1)
    {
      id v7 = [v5 subsetWithSharedAssets];
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = [v5 subsetWithPrivateAssets];
  }
  id v8 = v7;

  return v8;
}

+ (id)filteredMomentNodesWithHighlightNode:(id)a3 forSharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 sharingComposition];
  if ([a1 canUseSharingComposition:v7 forSharingFilter:v4])
  {
    if (v7 != 2)
    {
LABEL_6:
      id v8 = [v6 eventEnrichmentMomentNodes];
      goto LABEL_9;
    }
    switch(v4)
    {
      case 0:
        double v10 = [v6 eventEnrichmentMomentNodes];
        uint64_t v11 = [v10 subsetWithPrivateAssets];
        goto LABEL_8;
      case 1:
        double v10 = [v6 eventEnrichmentMomentNodes];
        uint64_t v11 = [v10 subsetWithSharedAssets];
        goto LABEL_8;
      case 2:
        goto LABEL_6;
    }
  }
  double v9 = [PGGraphMomentNodeCollection alloc];
  double v10 = [v6 graph];
  uint64_t v11 = [(MAElementCollection *)v9 initWithGraph:v10];
LABEL_8:
  id v8 = (void *)v11;

LABEL_9:
  return v8;
}

+ (id)internalPredicateForFetchingAssetsForSharingFilter:(unsigned __int16)a3
{
  if (a3 == 2)
  {
    v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else if (a3 == 1)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F8A950], "predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:");
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x1E4F8A950] predicateToIncludePrivateLibraryAssetsAllowingIndexingOnParticipationState:1];
  }
  return v3;
}

+ (id)filteredAssetsInAssets:(id)a3 withSharingComposition:(unsigned __int16)a4 forSharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (![a1 canUseSharingComposition:v6 forSharingFilter:v5])
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_15;
  }
  if (v6 != 2)
  {
    id v11 = v8;
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else
  {
    if (v5 == 1)
    {
      double v9 = (void *)MEMORY[0x1E4F28F60];
      double v10 = @"clsIsInSharedLibrary == YES";
    }
    else
    {
      if (v5)
      {
        long long v13 = 0;
        goto LABEL_14;
      }
      double v9 = (void *)MEMORY[0x1E4F28F60];
      double v10 = @"clsIsInSharedLibrary == NO";
    }
    uint64_t v12 = [v9 predicateWithFormat:v10];
  }
  long long v13 = (void *)v12;
LABEL_14:
  id v11 = [v8 filteredArrayUsingPredicate:v13];

LABEL_15:
  return v11;
}

+ (id)requiredAssetsInAssets:(id)a3 withHighlightInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 keyAssetPrivateUUID];
  double v9 = [v6 keyAssetSharedUUID];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "uuid", (void)v18);
        if (([v15 isFavorite] & 1) != 0
          || ([v16 isEqualToString:v8] & 1) != 0
          || [v16 isEqualToString:v9])
        {
          [v7 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v7;
}

+ (id)headKeyAssetWithExtendedCuration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = 4;
    double v9 = -1.79769313e308;
    *(double *)&unint64_t v10 = -1.79769313e308;
LABEL_3:
    uint64_t v11 = 0;
    double v12 = *(double *)&v10;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v3);
      }
      if ((uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v11),
            objc_msgSend(v13, "clsContentScore", (void)v20),
            double v15 = v14,
            [v13 clsAestheticScore],
            *(double *)&unint64_t v10 = v16,
            v6)
        && v15 <= v9
        && (v15 == v9 ? (BOOL v17 = v16 <= v12) : (BOOL v17 = 1), v17))
      {
        *(double *)&unint64_t v10 = v12;
      }
      else
      {
        id v18 = v13;

        double v9 = v15;
        id v6 = v18;
      }
      if (!--v8) {
        break;
      }
      ++v11;
      double v12 = *(double *)&v10;
      if (v5 == v11)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (double)meaningScoreWithMeanings:(id)a3 forLongTrip:(BOOL)a4 graph:(id)a5 collection:(id)a6 keyAsset:(id)a7 keyAssetCriteriaScore:(double *)a8 curationManager:(id)a9
{
  BOOL v12 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v31 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a9;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v17 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    if (v12) {
      double v20 = 0.2;
    }
    else {
      double v20 = 0.4;
    }
    double v21 = 0.0;
    double v22 = 0.0;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * v23);
        double v25 = 0.0;
        switch(+[PGGraph meaningForMeaningLabel:v24])
        {
          case 1uLL:
            double v25 = 0.5;
            break;
          case 2uLL:
          case 3uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 9uLL:
          case 16uLL:
            double v25 = 0.1;
            break;
          case 4uLL:
            double v25 = 0.3;
            break;
          case 10uLL:
          case 11uLL:
          case 12uLL:
          case 13uLL:
          case 14uLL:
            double v25 = v20;
            break;
          default:
            break;
        }
        if (v25 >= v22)
        {
          v26 = [v16 curationCriteriaFactory];
          v27 = [v26 curationCriteriaWithCollection:v14 meaningLabel:v24 inGraph:v31 client:0];

          double v32 = 0.0;
          if ([v27 passesForItem:v15 score:&v32]
            && (v25 > v22 || v25 == v22 && v32 >= v21))
          {
            double v21 = v32;
            double v22 = v25;
          }
        }
        ++v23;
      }
      while (v18 != v23);
      uint64_t v28 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v18 = v28;
    }
    while (v28);
  }
  else
  {
    double v21 = 0.0;
    double v22 = 0.0;
  }
  if (a8) {
    *a8 = v21;
  }

  return v22;
}

+ (id)childHighlightNodeOfGroupHighlightNode:(id)a3 withLocalIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__64389;
  uint64_t v17 = __Block_byref_object_dispose__64390;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__PGHighlightEnrichmentUtilities_childHighlightNodeOfGroupHighlightNode_withLocalIdentifier___block_invoke;
  v10[3] = &unk_1E68EE768;
  id v7 = v6;
  id v11 = v7;
  BOOL v12 = &v13;
  [v5 enumerateHighlightNodesUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __93__PGHighlightEnrichmentUtilities_childHighlightNodeOfGroupHighlightNode_withLocalIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 localIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)keyAssetForDayGroupHighlightWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curationManager:(id)a5 progressBlock:(id)a6
{
  uint64_t v8 = a4;
  v177[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v131 = a5;
  id v11 = a6;
  BOOL v12 = (void (**)(void *, void *, double))_Block_copy(v11);
  double v13 = 0.0;
  id v14 = (double *)&unk_1D1F48000;
  if (v12)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v151) = 0;
      v12[2](v12, &v151, 0.0);
      if ((_BYTE)v151)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 61;
          *(_WORD *)&v157[4] = 2080;
          *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightEnrichmentUtilities.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = 0;
        goto LABEL_123;
      }
      double v13 = Current;
    }
  }
  id v124 = a1;
  id v116 = v11;
  uint64_t v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"promotionScore" ascending:0];
  v177[0] = v17;
  id v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v177[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v177[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:3];

  double v21 = [v10 childHighlights];
  double v22 = [v21 sortedArrayUsingDescriptors:v20];

  uint64_t v23 = [v10 highlightNode];
  LODWORD(v19) = [v23 isTrip];
  v130 = v23;
  v123 = [v23 graph];
  v118 = v10;
  uint64_t v24 = v131;
  v135 = v12;
  int v144 = (int)v19;
  if (v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v149 = [v10 highlight];
    v147 = [v149 assetCollection];
    double v25 = [v147 uuid];
    v26 = [v10 highlight];
    v27 = [v26 assetCollection];
    uint64_t v28 = [v27 localizedTitle];
    float v29 = [v118 highlight];
    float v30 = [v29 assetCollection];
    id v31 = [v30 localizedSubtitle];
    *(_DWORD *)buf = 138412802;
    *(void *)v157 = v25;
    *(_WORD *)&v157[8] = 2112;
    *(void *)&v157[10] = v28;
    __int16 v158 = 2112;
    v159 = v31;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "TripKeyAsset: highlight (%@): %@, %@", buf, 0x20u);

    BOOL v12 = v135;
    id v10 = v118;

    id v14 = (double *)&unk_1D1F48000;
    uint64_t v24 = v131;
  }
  double v32 = [v24 photoLibrary];
  long long v33 = [v32 librarySpecificFetchOptions];

  [v33 setSharingFilter:v8];
  [v33 setIncludeGuestAssets:1];
  long long v34 = +[PGCurationManager assetPropertySetsForCuration];
  [v33 setFetchPropertySets:v34];

  v114 = v33;
  long long v35 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:v22 options:v33];
  long long v36 = (void *)MEMORY[0x1E4F38EB8];
  v148 = v35;
  v37 = [v35 allValues];
  uint64_t v38 = [v10 highlightTailorContext];
  v39 = [v38 curationContext];
  [v36 prefetchOnAssets:v37 options:31 curationContext:v39];

  __int16 v40 = [v10 highlightTailorContext];
  v119 = [v40 neighborScoreComputer];

  v122 = [v10 meaningLabelsByChildHighlightUUID];
  if (v144)
  {
    v121 = [v24 sceneGeography];
  }
  else
  {
    v121 = 0;
  }
  v115 = (void *)v20;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v41 = v22;
  id obj = v41;
  uint64_t v150 = [v41 countByEnumeratingWithState:&v152 objects:v176 count:16];
  if (!v150)
  {
    v145 = 0;
    goto LABEL_114;
  }
  char v129 = 0;
  v145 = 0;
  uint64_t v146 = *(void *)v153;
  double v42 = *MEMORY[0x1E4F8E750];
  uint64_t v43 = 1;
  double v44 = 0.0;
  double v45 = 0.0;
  double v46 = 0.0;
  double v47 = 0.0;
  double v141 = 0.0;
  double v117 = *MEMORY[0x1E4F8E750];
  while (2)
  {
    for (uint64_t i = 0; i != v150; ++i)
    {
      if (*(void *)v153 != v146) {
        objc_enumerationMutation(obj);
      }
      v49 = *(void **)(*((void *)&v152 + 1) + 8 * i);
      v50 = (void *)MEMORY[0x1D25FED50]();
      if (v12)
      {
        double v51 = CFAbsoluteTimeGetCurrent();
        if (v51 - v13 >= v14[87])
        {
          LOBYTE(v151) = 0;
          v12[2](v12, &v151, 0.5);
          if ((_BYTE)v151)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v157 = 109;
              *(_WORD *)&v157[4] = 2080;
              *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightEnrichmentUtilities.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v109 = obj;

            id v16 = 0;
            id v10 = v118;
            v110 = v115;
            id v11 = v116;
            v111 = v114;
            goto LABEL_120;
          }
          double v13 = v51;
        }
      }
      v52 = [v49 uuid];
      v53 = [v148 objectForKeyedSubscript:v52];

      if (v53)
      {
        BOOL v54 = 1;
        if (([v53 clsAvoidIfPossibleAsKeyItemForMemories:0 allowGuestAsset:1] & 1) == 0)
        {
          [v53 curationScore];
          BOOL v54 = v55 <= v42;
        }
        BOOL v56 = !v54;
        if (!(v43 | !v54))
        {
          uint64_t v43 = 0;
          goto LABEL_38;
        }
        [v49 promotionScore];
        double v58 = v57;
        if (v57 >= v44) {
          char v59 = 1;
        }
        else {
          char v59 = v144;
        }
        if ((v59 & 1) == 0)
        {
          if ((v43 & 1) == 0)
          {

            id v14 = (double *)&unk_1D1F48000;
            id v41 = obj;
            goto LABEL_114;
          }
          if (v45 > v42 && v54)
          {
            uint64_t v43 = 1;
LABEL_38:
            id v14 = (double *)&unk_1D1F48000;
            goto LABEL_106;
          }
        }
        double v140 = v45;
        uint64_t v151 = 0;
        [v53 overallAestheticScore];
        float v62 = v61;
        double v63 = 0.0;
        double v138 = v47;
        double v139 = v44;
        double v142 = v13;
        if (!v144)
        {
          int v73 = 0;
          int v137 = 0;
          LODWORD(v66) = 0;
          int v74 = 1;
          double v75 = 0.0;
          double v70 = v58;
          goto LABEL_78;
        }
        unsigned int v136 = v43;
        id v64 = v130;
        v65 = [v49 localIdentifier];
        uint64_t v66 = [v124 childHighlightNodeOfGroupHighlightNode:v64 withLocalIdentifier:v65];

        if (!v66)
        {

          int v73 = 0;
          int v137 = 0;
          int v74 = 1;
          double v75 = 0.0;
          double v70 = v58;
          BOOL v12 = v135;
          uint64_t v43 = v136;
          goto LABEL_78;
        }
        v126 = v50;
        v67 = [v49 localIdentifier];
        uint64_t v68 = [v122 objectForKeyedSubscript:v67];

        v127 = v64;
        objc_msgSend(v124, "meaningScoreWithMeanings:forLongTrip:graph:collection:keyAsset:keyAssetCriteriaScore:curationManager:", v68, objc_msgSend(v64, "isLongTrip"), v123, v66, v53, &v151, v131);
        double v63 = v69;
        double v70 = v58;
        v132 = (void *)v66;
        if (v58 >= 0.6)
        {
          double v70 = v58;
          if (v69 == 0.0)
          {
            objc_msgSend((id)v66, "nonMeaningfulPromotionScoreForTripKeyAssetWithEnrichmentState:neighborScoreComputer:", objc_msgSend(v49, "enrichmentState"), v119);
            double v70 = v71;
          }
        }
        BOOL v12 = v135;
        if (v63 <= v47)
        {
          BOOL v72 = v63 == v47;
          if (v70 <= v44) {
            BOOL v72 = 0;
          }
        }
        else
        {
          BOOL v72 = 1;
        }
        BOOL v133 = v72;
        v76 = (void *)v68;
        BOOL v77 = v63 == v47;
        if (v70 != v44) {
          BOOL v77 = 0;
        }
        BOOL v134 = v77;
        if (v121)
        {
          double v120 = v46;
          [v53 clsIconicSceneScoreWithSceneGeography:v121];
          double v75 = v78;
          v79 = [v53 curationModel];
          v80 = [v79 iconicScoreModel];

          v81 = [v145 curationModel];
          v82 = [v81 iconicScoreModel];

          [v80 minimumMeaningfulIconicScore];
          double v84 = v83;
          [v80 similarIconicScoreThreshold];
          double v86 = v85;
          if (v75 >= v84)
          {
            v87 = [v53 curationModel];
            int v128 = [v87 isAestheticallyPrettyGoodWithAsset:v53];
          }
          else
          {
            int v128 = 0;
          }
          if (v145)
          {
            uint64_t v88 = [v82 version];
            uint64_t v89 = [v80 version];
            double v90 = vabdd_f64(v75, v141);
            if (v88 == v89) {
              int v91 = v128;
            }
            else {
              int v91 = 0;
            }
            if (v90 <= v86) {
              int v92 = v91;
            }
            else {
              int v92 = 0;
            }
            unint64_t v93 = [v80 bucketForIconicScore:v75];
            unint64_t v94 = [v82 bucketForIconicScore:v141];
            double v42 = v117;
            int v125 = v92;
            if (v128) {
              int v137 = (v93 > v94) & ~v92;
            }
            else {
              int v137 = 0;
            }
            double v46 = v120;
            v76 = (void *)v68;
          }
          else
          {
            int v137 = 0;
            int v125 = 0;
            double v42 = v117;
            double v46 = v120;
          }

          BOOL v12 = v135;
        }
        else
        {
          int v137 = 0;
          LOBYTE(v128) = 0;
          int v125 = 0;
          double v75 = 0.0;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v95 = [v49 uuid];
          v96 = [v49 localizedTitle];
          v97 = [v49 localizedSubtitle];
          v98 = [v76 allObjects];
          v99 = [v98 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138414850;
          *(void *)v157 = v95;
          *(_WORD *)&v157[8] = 2112;
          *(void *)&v157[10] = v96;
          __int16 v158 = 2112;
          v159 = v97;
          __int16 v160 = 2112;
          v161 = v99;
          __int16 v162 = 2048;
          double v163 = v63;
          __int16 v164 = 2048;
          double v165 = v70;
          __int16 v166 = 2048;
          double v167 = v58;
          __int16 v168 = 1024;
          BOOL v169 = v133;
          __int16 v170 = 1024;
          int v171 = v134;
          __int16 v172 = 2048;
          uint64_t v173 = v151;
          __int16 v174 = 2048;
          double v175 = v75;
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "TripKeyAsset: child (%@): %@, %@\n\t[%@], meaningScore = %.3f, promotionScore = %.3f (%.3f), hasHigherMeaningScore %d, hasSameMeaningScore %d, criteriaScore %.3f, iconicSceneScore %.3f", buf, 0x68u);

          BOOL v12 = v135;
        }

        int v74 = v134;
        if (v134)
        {
          uint64_t v43 = v136;
          v50 = v126;
          LODWORD(v66) = v125;
          if (!v133)
          {
            int v73 = 0;
            v129 |= v128;
            int v74 = 1;
            goto LABEL_78;
          }
        }
        else
        {
          uint64_t v43 = v136;
          v50 = v126;
          LODWORD(v66) = v125;
          if (!v133)
          {
            int v73 = 0;
            int v74 = 0;
LABEL_78:
            double v100 = v62;
            [v53 clsContentScore];
            double v45 = v101;
            double v102 = v46;
            double v103 = vabdd_f64(v100, v46);
            if (v145)
            {
              if (v43 & v56 | v54)
              {
                if (v43 & v56 & 1 | (v101 > v140)) {
                  goto LABEL_96;
                }
              }
              else if (v129)
              {
                if ((v73 | v74 & v137)) {
                  goto LABEL_96;
                }
                BOOL v104 = v101 > v140;
                char v105 = v74 & v66;
                if (v103 <= 0.025) {
                  char v105 = 0;
                }
                if (v102 >= v100) {
                  char v105 = 0;
                }
                if (v105 & 1 | ((v74 & 1) == 0) | ((v66 & 1) == 0) | (v103 > 0.025)) {
                  BOOL v104 = v105;
                }
                if (v104) {
                  goto LABEL_96;
                }
              }
              else
              {
                if (v73) {
                  goto LABEL_96;
                }
                char v106 = v102 < v100;
                if (v74 & (v101 > v140) | ((v74 & 1) == 0) | (v101 != v140)) {
                  char v106 = v74 & (v101 > v140);
                }
                if (v106) {
                  goto LABEL_96;
                }
              }
              double v63 = v138;
              double v70 = v139;
              BOOL v54 = v43;
              double v45 = v140;
              double v100 = v102;
              id v107 = v145;
LABEL_105:
              id v14 = (double *)&unk_1D1F48000;
              double v44 = v70;
              uint64_t v43 = v54;
              double v46 = v100;
              double v47 = v63;
              v145 = v107;
              double v13 = v142;
              goto LABEL_106;
            }
LABEL_96:
            id v107 = v53;

            double v108 = v141;
            if (v75 > v141) {
              double v108 = v75;
            }
            if (!v66) {
              double v108 = v75;
            }
            double v141 = v108;
            if (v103 <= 0.025 && v102 >= v100) {
              double v100 = v102;
            }
            goto LABEL_105;
          }
        }
        int v73 = 1;
        char v129 = v128;
        goto LABEL_78;
      }
LABEL_106:
    }
    id v41 = obj;
    uint64_t v150 = [obj countByEnumeratingWithState:&v152 objects:v176 count:16];
    if (v150) {
      continue;
    }
    break;
  }
LABEL_114:

  id v10 = v118;
  v110 = v115;
  id v11 = v116;
  v111 = v114;
  if (v12 && CFAbsoluteTimeGetCurrent() - v13 >= v14[87] && (LOBYTE(v151) = 0, v12[2](v12, &v151, 1.0), (_BYTE)v151))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v157 = 248;
      *(_WORD *)&v157[4] = 2080;
      *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Enrich/PGHighlightEnrichmentUtilities.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v16 = 0;
    v109 = obj;
LABEL_120:
    id v112 = v145;
  }
  else
  {
    id v112 = v145;
    id v16 = v112;
    v109 = obj;
  }

LABEL_123:
  return v16;
}

+ (id)assetPropertySetsForEnrichment
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F394C0];
  v5[0] = *MEMORY[0x1E4F39448];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

@end