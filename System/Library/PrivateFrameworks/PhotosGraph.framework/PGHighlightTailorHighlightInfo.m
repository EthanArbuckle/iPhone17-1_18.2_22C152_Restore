@interface PGHighlightTailorHighlightInfo
- (BOOL)petIsPresent;
- (CLSInvestigationPhotoKitFeeder)feeder;
- (NSArray)childHighlights;
- (NSArray)mixedSummarizedFeatures;
- (NSArray)privateSummarizedFeatures;
- (NSArray)sharedSummarizedFeatures;
- (NSArray)uuidsOfEligibleAssets;
- (NSDictionary)meaningLabelsByChildHighlightUUID;
- (NSSet)meaningLabels;
- (NSSet)momentNodes;
- (NSString)keyAssetPrivateUUID;
- (NSString)keyAssetSharedUUID;
- (PGGraphHighlightNode)highlightNode;
- (PGHighlightModel)highlight;
- (PGHighlightTailorContext)highlightTailorContext;
- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5;
- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 serviceManager:(id)a4 loggingConnection:(id)a5;
- (PHFetchResult)momentFetchResult;
- (double)promotionScore;
- (id)assetsForSharingFilter:(unsigned __int16)a3;
- (id)description;
- (id)generateSortedSummarizedFeaturesForSharingFilter:(unsigned __int16)a3 graph:(id)a4 featureSummaryGenerator:(id)a5;
- (id)initForTestingWithHighlight:(id)a3;
- (id)uuidsOfRequiredAssetsForSharingFilter:(unsigned __int16)a3;
- (unint64_t)numberOfExtendedAssets;
- (void)setChildHighlights:(id)a3;
- (void)setHighlightSummarizedFeaturesWithGraph:(id)a3;
- (void)setKeyAssetPrivateUUID:(id)a3;
- (void)setKeyAssetSharedUUID:(id)a3;
- (void)setMeaningLabels:(id)a3;
- (void)setNumberOfExtendedAssets:(unint64_t)a3;
- (void)setPromotionScore:(double)a3;
- (void)setUuidsOfEligibleAssets:(id)a3;
@end

@implementation PGHighlightTailorHighlightInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_sharedSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_privateSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_momentFetchResult, 0);
  objc_storeStrong((id *)&self->_highlightTailorContext, 0);
  objc_storeStrong((id *)&self->_childHighlights, 0);
  objc_storeStrong((id *)&self->_uuidsOfEligibleAssets, 0);
  objc_storeStrong((id *)&self->_keyAssetSharedUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivateUUID, 0);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_meaningLabelsByChildHighlightUUID, 0);
  objc_storeStrong((id *)&self->_meaningLabels, 0);
  objc_storeStrong((id *)&self->_highlightNode, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (NSArray)mixedSummarizedFeatures
{
  return self->_mixedSummarizedFeatures;
}

- (NSArray)sharedSummarizedFeatures
{
  return self->_sharedSummarizedFeatures;
}

- (NSArray)privateSummarizedFeatures
{
  return self->_privateSummarizedFeatures;
}

- (PGHighlightTailorContext)highlightTailorContext
{
  return (PGHighlightTailorContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)setChildHighlights:(id)a3
{
}

- (void)setUuidsOfEligibleAssets:(id)a3
{
}

- (NSArray)uuidsOfEligibleAssets
{
  return self->_uuidsOfEligibleAssets;
}

- (void)setNumberOfExtendedAssets:(unint64_t)a3
{
  self->_numberOfExtendedAssets = a3;
}

- (unint64_t)numberOfExtendedAssets
{
  return self->_numberOfExtendedAssets;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setKeyAssetSharedUUID:(id)a3
{
}

- (NSString)keyAssetSharedUUID
{
  return self->_keyAssetSharedUUID;
}

- (void)setKeyAssetPrivateUUID:(id)a3
{
}

- (NSString)keyAssetPrivateUUID
{
  return self->_keyAssetPrivateUUID;
}

- (CLSInvestigationPhotoKitFeeder)feeder
{
  return self->_feeder;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (BOOL)petIsPresent
{
  return self->_petIsPresent;
}

- (NSDictionary)meaningLabelsByChildHighlightUUID
{
  return self->_meaningLabelsByChildHighlightUUID;
}

- (void)setMeaningLabels:(id)a3
{
}

- (NSSet)meaningLabels
{
  return self->_meaningLabels;
}

- (PGGraphHighlightNode)highlightNode
{
  return self->_highlightNode;
}

- (PGHighlightModel)highlight
{
  return self->_highlight;
}

- (id)generateSortedSummarizedFeaturesForSharingFilter:(unsigned __int16)a3 graph:(id)a4 featureSummaryGenerator:(id)a5
{
  uint64_t v5 = a3;
  highlightNode = self->_highlightNode;
  id v7 = a5;
  v8 = +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:highlightNode forSharingFilter:v5];
  v9 = [v7 sortedSummarizedFeaturesForMomentNodes:v8];

  return v9;
}

- (PHFetchResult)momentFetchResult
{
  momentFetchResult = self->_momentFetchResult;
  if (!momentFetchResult)
  {
    v4 = [(PGHighlightTailorHighlightInfo *)self highlight];
    uint64_t v5 = [v4 assetCollection];

    v6 = [MEMORY[0x1E4F391A0] fetchMomentsInHighlight:v5 options:0];
    id v7 = self->_momentFetchResult;
    self->_momentFetchResult = v6;

    momentFetchResult = self->_momentFetchResult;
  }
  return momentFetchResult;
}

- (id)assetsForSharingFilter:(unsigned __int16)a3
{
  switch(a3)
  {
    case 2u:
      v3 = [(PGHighlightTailorHighlightInfo *)self feeder];
      uint64_t v4 = [v3 allItems];
      goto LABEL_7;
    case 1u:
      v3 = [(PGHighlightTailorHighlightInfo *)self feeder];
      uint64_t v4 = [v3 sharedItems];
      goto LABEL_7;
    case 0u:
      v3 = [(PGHighlightTailorHighlightInfo *)self feeder];
      uint64_t v4 = [v3 privateItems];
LABEL_7:
      uint64_t v5 = (void *)v4;

      goto LABEL_9;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:
  return v5;
}

- (id)uuidsOfRequiredAssetsForSharingFilter:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
  if (v3 == 1) {
    goto LABEL_5;
  }
  v6 = [(PGHighlightTailorHighlightInfo *)self keyAssetPrivateUUID];

  if (v6)
  {
    id v7 = [(PGHighlightTailorHighlightInfo *)self keyAssetPrivateUUID];
    [v5 addObject:v7];
  }
  if (v3)
  {
LABEL_5:
    v8 = [(PGHighlightTailorHighlightInfo *)self keyAssetSharedUUID];

    if (v8)
    {
      v9 = [(PGHighlightTailorHighlightInfo *)self keyAssetSharedUUID];
      [v5 addObject:v9];
    }
  }
  return v5;
}

- (NSArray)childHighlights
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (self->_childHighlights || [(PGHighlightModel *)self->_highlight kind] != 3) {
    goto LABEL_5;
  }
  int v3 = [(PGHighlightModel *)self->_highlight assetCollection];
  uint64_t v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 librarySpecificFetchOptions];

  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v16[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v5 setSortDescriptors:v8];

  v9 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:v3 options:v5];
  if ([v9 count])
  {
    v10 = [v9 fetchedObjects];
    childHighlights = self->_childHighlights;
    self->_childHighlights = v10;

LABEL_5:
    v12 = self->_childHighlights;
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    v15 = v3;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Day Group Highlight does not have any child day highlights: %@", (uint8_t *)&v14, 0xCu);
  }

  v12 = 0;
LABEL_6:
  return v12;
}

- (void)setHighlightSummarizedFeaturesWithGraph:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [[PGDayHighlightFeatureSummaryGenerator alloc] initWithHighlightNode:self->_highlightNode loggingConnection:self->_loggingConnection highlightTailorContext:self->_highlightTailorContext graph:v18];
  int v5 = [(PGHighlightModel *)self->_highlight sharingComposition];
  if (v5 == 2)
  {
    v10 = [(PGHighlightTailorHighlightInfo *)self generateSortedSummarizedFeaturesForSharingFilter:0 graph:v18 featureSummaryGenerator:v4];
    privateSummarizedFeatures = self->_privateSummarizedFeatures;
    self->_privateSummarizedFeatures = v10;

    v12 = [(PGHighlightTailorHighlightInfo *)self generateSortedSummarizedFeaturesForSharingFilter:1 graph:v18 featureSummaryGenerator:v4];
    sharedSummarizedFeatures = self->_sharedSummarizedFeatures;
    self->_sharedSummarizedFeatures = v12;

    int v14 = [(PGHighlightTailorHighlightInfo *)self generateSortedSummarizedFeaturesForSharingFilter:2 graph:v18 featureSummaryGenerator:v4];
    mixedSummarizedFeatures = self->_mixedSummarizedFeatures;
    self->_mixedSummarizedFeatures = v14;
  }
  else
  {
    if (v5 == 1)
    {
      v16 = self->_privateSummarizedFeatures;
      v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
      self->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E4F1CBF0];

      v17 = [(PGHighlightTailorHighlightInfo *)self generateSortedSummarizedFeaturesForSharingFilter:1 graph:v18 featureSummaryGenerator:v4];
      v8 = self->_sharedSummarizedFeatures;
      self->_sharedSummarizedFeatures = v17;
    }
    else
    {
      if (v5) {
        goto LABEL_9;
      }
      v6 = [(PGHighlightTailorHighlightInfo *)self generateSortedSummarizedFeaturesForSharingFilter:0 graph:v18 featureSummaryGenerator:v4];
      id v7 = self->_privateSummarizedFeatures;
      self->_privateSummarizedFeatures = v6;

      v8 = self->_sharedSummarizedFeatures;
      v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
      self->_sharedSummarizedFeatures = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    mixedSummarizedFeatures = self->_mixedSummarizedFeatures;
    self->_mixedSummarizedFeatures = v9;
  }

LABEL_9:
}

- (id)description
{
  int v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightTailorHighlightInfo;
  uint64_t v4 = [(PGHighlightTailorHighlightInfo *)&v9 description];
  int v5 = [(PGHighlightTailorHighlightInfo *)self highlight];
  v6 = [(PGHighlightTailorHighlightInfo *)self highlightNode];
  id v7 = [v3 stringWithFormat:@"%@: %@, %@", v4, v5, v6];

  return v7;
}

- (id)initForTestingWithHighlight:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightTailorHighlightInfo;
  v6 = [(PGHighlightTailorHighlightInfo *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_highlight, a3);
  }

  return v7;
}

- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 serviceManager:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PGHighlightTailorHighlightInfo;
  v12 = [(PGHighlightTailorHighlightInfo *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_highlight, a3);
    int v14 = [v9 assetCollection];
    v15 = [v14 photoLibrary];

    v16 = [[PGHighlightTailorContext alloc] initWithPhotoLibrary:v15 graph:0 serviceManager:v10 loggingConnection:v11];
    highlightTailorContext = v13->_highlightTailorContext;
    v13->_highlightTailorContext = v16;

    v13->_promotionScore = -1.0;
    privateSummarizedFeatures = v13->_privateSummarizedFeatures;
    id v32 = v10;
    v19 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v13->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E4F1CBF0];

    sharedSummarizedFeatures = v13->_sharedSummarizedFeatures;
    v13->_sharedSummarizedFeatures = v19;

    mixedSummarizedFeatures = v13->_mixedSummarizedFeatures;
    v13->_mixedSummarizedFeatures = v19;

    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    v22 = [v15 librarySpecificFetchOptions];
    v23 = +[PGCurationManager assetPropertySetsForCuration];
    v24 = (void *)[v23 mutableCopy];

    [v24 addObject:*MEMORY[0x1E4F39508]];
    [v22 addFetchPropertySets:v24];
    v25 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
    v26 = (void *)MEMORY[0x1E4F76CF0];
    v27 = [v9 assetCollection];
    v28 = [(PGHighlightTailorContext *)v13->_highlightTailorContext curationContext];
    uint64_t v29 = [v26 feederForAssetCollection:v27 options:v22 feederPrefetchOptions:v25 curationContext:v28];
    feeder = v13->_feeder;
    v13->_feeder = (CLSInvestigationPhotoKitFeeder *)v29;

    id v10 = v32;
  }

  return v13;
}

- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 loggingConnection];
  v13 = [v9 uuid];
  int v14 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v13 inGraph:v10];
  v15 = [v14 anyNode];

  id obj = v15;
  if (!v15)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v70 = v13;
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "Cannot find highlight node for highlightUUID %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v16 = [v15 eventEnrichmentMomentNodes];
  v17 = [v16 temporarySet];

  if (![v17 count])
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v70 = obj;
      __int16 v71 = 2112;
      v72 = v13;
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "No Moment nodes connected to highlight node %@ with highlightUUID %@", buf, 0x16u);
    }

LABEL_18:
    v41 = 0;
    goto LABEL_26;
  }
  v67.receiver = self;
  v67.super_class = (Class)PGHighlightTailorHighlightInfo;
  id v18 = [(PGHighlightTailorHighlightInfo *)&v67 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_highlight, a3);
    objc_storeStrong((id *)&v19->_highlightTailorContext, a5);
    v19->_promotionScore = -1.0;
    privateSummarizedFeatures = v19->_privateSummarizedFeatures;
    v21 = v17;
    v22 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v19->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E4F1CBF0];

    sharedSummarizedFeatures = v19->_sharedSummarizedFeatures;
    v19->_sharedSummarizedFeatures = v22;

    mixedSummarizedFeatures = v19->_mixedSummarizedFeatures;
    v19->_mixedSummarizedFeatures = v22;

    objc_storeStrong((id *)&v19->_loggingConnection, v12);
    p_highlightNode = (id *)&v19->_highlightNode;
    v26 = obj;
    objc_storeStrong((id *)&v19->_highlightNode, obj);
    v59 = v21;
    objc_storeStrong((id *)&v19->_momentNodes, v21);
    v60 = v13;
    v61 = v12;
    if ([(PGGraphHighlightNode *)v19->_highlightNode isTrip])
    {
      id v56 = v11;
      id v57 = v10;
      id v58 = v9;
      v27 = (NSSet *)*p_highlightNode;
      v28 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v55 = v27;
      uint64_t v29 = [(NSSet *)v27 highlightNodes];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v64 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            v35 = [v34 eventEnrichmentMomentNodes];
            v36 = [v35 meaningNodes];
            v37 = [v36 meaningLabels];
            v38 = [v34 localIdentifier];
            [(NSDictionary *)v28 setObject:v37 forKeyedSubscript:v38];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v31);
      }

      meaningLabelsByChildHighlightUUID = v19->_meaningLabelsByChildHighlightUUID;
      v19->_meaningLabelsByChildHighlightUUID = v28;

      id v10 = v57;
      id v9 = v58;
      p_highlightNode = (id *)&v19->_highlightNode;
      id v11 = v56;
      v26 = obj;
      meaningLabels = v55;
    }
    else
    {
      uint64_t v42 = [obj meaningLabels];
      meaningLabels = v19->_meaningLabels;
      v19->_meaningLabels = (NSSet *)v42;
    }

    v19->_petIsPresent = [v26 petIsPresent];
    if (_os_feature_enabled_impl()
      && ([*p_highlightNode isAggregation] & 1) == 0
      && ([*p_highlightNode isTrip] & 1) == 0)
    {
      [(PGHighlightTailorHighlightInfo *)v19 setHighlightSummarizedFeaturesWithGraph:v10];
    }
    v43 = [v11 photoLibrary];
    v44 = [v43 librarySpecificFetchOptions];

    v45 = +[PGCurationManager assetPropertySetsForCuration];
    v46 = (void *)[v45 mutableCopy];

    [v46 addObject:*MEMORY[0x1E4F39508]];
    [v44 addFetchPropertySets:v46];
    v47 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
    v48 = (void *)MEMORY[0x1E4F76CF0];
    v49 = [v9 assetCollection];
    [v11 curationContext];
    v51 = id v50 = v11;
    uint64_t v52 = [v48 feederForAssetCollection:v49 options:v44 feederPrefetchOptions:v47 curationContext:v51];
    feeder = v19->_feeder;
    v19->_feeder = (CLSInvestigationPhotoKitFeeder *)v52;

    id v11 = v50;
    v13 = v60;
    v12 = v61;
    v17 = v59;
  }
  self = v19;

  v41 = self;
LABEL_26:

  return v41;
}

@end