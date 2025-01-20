@interface PXPhotosDataSourceSectionCache
- (NSArray)assetCollections;
- (NSDictionary)assetCollectionToSection;
- (PHFetchResult)collectionListFetchResult;
- (PXPhotosDataSourceSectionCache)initWithCollectionListFetchResult:(id)a3;
- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed;
- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore;
- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataOnly;
- (int64_t)estimatedAssetCountWithEnrichmentStateComplete;
- (int64_t)estimatedAssetCountWithEnrichmentStateNotEnriched;
- (int64_t)estimatedOtherCount;
- (int64_t)estimatedPhotosCount;
- (int64_t)estimatedVideosCount;
- (int64_t)numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections;
- (int64_t)numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections;
- (int64_t)numberOfEnrichmentStateAssetMetadataOnlyAssetCollections;
- (int64_t)numberOfEnrichmentStateCompleteAssetCollections;
- (int64_t)numberOfEnrichmentStateNotEnrichedAssetCollections;
@end

@implementation PXPhotosDataSourceSectionCache

- (PXPhotosDataSourceSectionCache)initWithCollectionListFetchResult:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PXPhotosDataSourceSectionCache;
  v6 = [(PXPhotosDataSourceSectionCache *)&v38 init];
  if (v6)
  {
    id v30 = a3;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v35;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
          if ([v13 alwaysRecalculateCounts])
          {
            uint64_t v14 = 0;
            uint64_t v15 = 0;
            uint64_t v16 = 0;
          }
          else
          {
            uint64_t v14 = [v13 estimatedAssetCount];
            uint64_t v17 = [v13 estimatedPhotosCount];
            if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v15 = 0;
            }
            else {
              uint64_t v15 = v17;
            }
            uint64_t v18 = [v13 estimatedVideosCount];
            if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v16 = 0;
            }
            else {
              uint64_t v16 = v18;
            }
            if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v14 = 0;
            }
          }
          int64_t v19 = v6->_estimatedVideosCount + v16;
          v6->_estimatedPhotosCount += v15;
          v6->_estimatedVideosCount = v19;
          if (v14 < 1)
          {
            if (([v13 isRecent] & 1) == 0)
            {
LABEL_22:
              p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateComplete;
              p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateCompleteAssetCollections;
LABEL_23:
              ++*p_numberOfEnrichmentStateCompleteAssetCollections;
              *p_estimatedAssetCountWithEnrichmentStateComplete += v14;
            }
          }
          else
          {
            v6->_estimatedOtherCount += v14 - (v15 + v16);
            if (([v13 isRecent] & 1) == 0)
            {
              int v20 = objc_msgSend(v13, "px_highlightEnrichmentState");
              p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateNotEnriched;
              p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateNotEnrichedAssetCollections;
              switch(v20)
              {
                case 0:
                  goto LABEL_23;
                case 1:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataOnly;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataOnlyAssetCollections;
                  goto LABEL_23;
                case 2:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections;
                  goto LABEL_23;
                case 3:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections;
                  goto LABEL_23;
                case 4:
                  goto LABEL_22;
                default:
                  break;
              }
            }
          }
          [(NSArray *)v7 addObject:v13];
          v23 = [NSNumber numberWithUnsignedInteger:v10 + v12];
          [(NSDictionary *)v33 setObject:v23 forKeyedSubscript:v13];

          ++v12;
        }
        while (v9 != v12);
        v10 += v12;
        uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        uint64_t v9 = v24;
      }
      while (v24);
    }

    assetCollections = v6->_assetCollections;
    v6->_assetCollections = v7;
    v26 = v7;

    assetCollectionToSection = v6->_assetCollectionToSection;
    v6->_assetCollectionToSection = v33;
    v28 = v33;

    objc_storeStrong((id *)&v6->_collectionListFetchResult, v30);
    id v5 = v31;
  }

  return v6;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateNotEnriched
{
  return self->_estimatedAssetCountWithEnrichmentStateNotEnriched;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataOnly
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataOnly;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore;
}

- (int64_t)numberOfEnrichmentStateNotEnrichedAssetCollections
{
  return self->_numberOfEnrichmentStateNotEnrichedAssetCollections;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataOnlyAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataOnlyAssetCollections;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateComplete
{
  return self->_estimatedAssetCountWithEnrichmentStateComplete;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionToSection, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (NSDictionary)assetCollectionToSection
{
  return self->_assetCollectionToSection;
}

- (int64_t)numberOfEnrichmentStateCompleteAssetCollections
{
  return self->_numberOfEnrichmentStateCompleteAssetCollections;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections;
}

- (int64_t)estimatedOtherCount
{
  return self->_estimatedOtherCount;
}

- (int64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (int64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

@end