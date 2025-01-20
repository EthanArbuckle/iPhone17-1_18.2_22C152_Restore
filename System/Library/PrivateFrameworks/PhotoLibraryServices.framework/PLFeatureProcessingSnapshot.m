@interface PLFeatureProcessingSnapshot
- (BOOL)hasConsistentMediaAnalysisImageVersion;
- (BOOL)photosKnowledgeGraphIsReady;
- (BOOL)vuIndexIsFullClustered;
- (NSDate)dateComputed;
- (NSDate)lastFullVUIndexClusterDate;
- (NSDictionary)dictionary;
- (PLFeatureProcessingSnapshot)init;
- (PLFeatureProcessingSnapshot)initWithDictionary:(id)a3;
- (double)fractionOfAllAssetsAnalyzedForScenes;
- (double)fractionOfAllAssetsWithCaptions;
- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
- (double)fractionOfCuratedAssetsIndexedInVUClustering;
- (double)fractionOfCuratedAssetsWithCaptions;
- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
- (double)fractionOfHighlightsEnriched;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)mediaAnalysisImageVersion;
- (unint64_t)totalAssetCount;
- (unint64_t)totalAssetForScenesCount;
- (unint64_t)totalCuratedAssetCount;
- (unint64_t)totalCuratedAssetForScenesCount;
- (void)resetSearchIndexState;
- (void)setDateComputed:(id)a3;
- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3;
- (void)setFractionOfAllAssetsWithCaptions:(double)a3;
- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3;
- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3;
- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3;
- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfHighlightsEnriched:(double)a3;
- (void)setHasConsistentMediaAnalysisImageVersion:(BOOL)a3;
- (void)setLastFullVUIndexClusterDate:(id)a3;
- (void)setMediaAnalysisImageVersion:(unint64_t)a3;
- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3;
- (void)setTotalAssetCount:(unint64_t)a3;
- (void)setTotalAssetForScenesCount:(unint64_t)a3;
- (void)setTotalCuratedAssetCount:(unint64_t)a3;
- (void)setTotalCuratedAssetForScenesCount:(unint64_t)a3;
- (void)setVuIndexIsFullClustered:(BOOL)a3;
@end

@implementation PLFeatureProcessingSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComputed, 0);
  objc_storeStrong((id *)&self->_lastFullVUIndexClusterDate, 0);
}

- (void)setDateComputed:(id)a3
{
}

- (NSDate)dateComputed
{
  return self->_dateComputed;
}

- (void)setHasConsistentMediaAnalysisImageVersion:(BOOL)a3
{
  self->_hasConsistentMediaAnalysisImageVersion = a3;
}

- (BOOL)hasConsistentMediaAnalysisImageVersion
{
  return self->_hasConsistentMediaAnalysisImageVersion;
}

- (void)setMediaAnalysisImageVersion:(unint64_t)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (unint64_t)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setTotalCuratedAssetForScenesCount:(unint64_t)a3
{
  self->_totalCuratedAssetForScenesCount = a3;
}

- (unint64_t)totalCuratedAssetForScenesCount
{
  return self->_totalCuratedAssetForScenesCount;
}

- (void)setTotalAssetForScenesCount:(unint64_t)a3
{
  self->_totalAssetForScenesCount = a3;
}

- (unint64_t)totalAssetForScenesCount
{
  return self->_totalAssetForScenesCount;
}

- (void)setTotalCuratedAssetCount:(unint64_t)a3
{
  self->_totalCuratedAssetCount = a3;
}

- (unint64_t)totalCuratedAssetCount
{
  return self->_totalCuratedAssetCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setLastFullVUIndexClusterDate:(id)a3
{
}

- (NSDate)lastFullVUIndexClusterDate
{
  return self->_lastFullVUIndexClusterDate;
}

- (void)setVuIndexIsFullClustered:(BOOL)a3
{
  self->_vuIndexIsFullClustered = a3;
}

- (BOOL)vuIndexIsFullClustered
{
  return self->_vuIndexIsFullClustered;
}

- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3
{
  self->_photosKnowledgeGraphIsReady = a3;
}

- (BOOL)photosKnowledgeGraphIsReady
{
  return self->_photosKnowledgeGraphIsReady;
}

- (void)setFractionOfHighlightsEnriched:(double)a3
{
  self->_fractionOfHighlightsEnriched = a3;
}

- (double)fractionOfHighlightsEnriched
{
  return self->_fractionOfHighlightsEnriched;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3
{
  self->_fractionOfCuratedAssetsIndexedInVUClustering = a3;
}

- (double)fractionOfCuratedAssetsIndexedInVUClustering
{
  return self->_fractionOfCuratedAssetsIndexedInVUClustering;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithCaptions:(double)a3
{
  self->_fractionOfAllAssetsWithCaptions = a3;
}

- (double)fractionOfAllAssetsWithCaptions
{
  return self->_fractionOfAllAssetsWithCaptions;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3
{
  self->_fractionOfAllAssetsAnalyzedForScenes = a3;
}

- (double)fractionOfAllAssetsAnalyzedForScenes
{
  return self->_fractionOfAllAssetsAnalyzedForScenes;
}

- (void)resetSearchIndexState
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = 0.0;
  self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = 0.0;
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = 0.0;
}

- (NSDictionary)dictionary
{
  v34[17] = *MEMORY[0x1E4F143B8];
  v28 = (void *)MEMORY[0x1E4F1CA60];
  v33[0] = @"fractionOfAllAssetsAnalyzedForScenes";
  v3 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfAllAssetsAnalyzedForScenes];
  v32 = objc_msgSend(v3, "numberWithDouble:");
  v34[0] = v32;
  v33[1] = @"fractionOfAllAssetsWithSceneAnalysisInSearchIndex";
  v4 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfAllAssetsWithSceneAnalysisInSearchIndex];
  v31 = objc_msgSend(v4, "numberWithDouble:");
  v34[1] = v31;
  v33[2] = @"fractionOfAllAssetsWithMediaAnalysisInSearchIndex";
  v5 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
  v30 = objc_msgSend(v5, "numberWithDouble:");
  v34[2] = v30;
  v33[3] = @"fractionOfAllAssetsWithCaptions";
  v6 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfAllAssetsWithCaptions];
  v29 = objc_msgSend(v6, "numberWithDouble:");
  v34[3] = v29;
  v33[4] = @"fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex";
  v7 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
  v27 = objc_msgSend(v7, "numberWithDouble:");
  v34[4] = v27;
  v33[5] = @"fractionOfCuratedAssetsWithEmbeddingsInVectorIndex";
  v8 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
  v26 = objc_msgSend(v8, "numberWithDouble:");
  v34[5] = v26;
  v33[6] = @"fractionOfCuratedAssetsIndexedInVUClustering";
  v9 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfCuratedAssetsIndexedInVUClustering];
  v25 = objc_msgSend(v9, "numberWithDouble:");
  v34[6] = v25;
  v33[7] = @"fractionOfCuratedAssetsWithCaptions";
  v10 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfCuratedAssetsWithCaptions];
  v24 = objc_msgSend(v10, "numberWithDouble:");
  v34[7] = v24;
  v33[8] = @"fractionOfHighlightsEnriched";
  v11 = NSNumber;
  [(PLFeatureProcessingSnapshot *)self fractionOfHighlightsEnriched];
  v23 = objc_msgSend(v11, "numberWithDouble:");
  v34[8] = v23;
  v33[9] = @"photosKnowledgeGraphIsReady";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PLFeatureProcessingSnapshot photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady"));
  v34[9] = v22;
  v33[10] = @"vuIndexIsFullClustered";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PLFeatureProcessingSnapshot vuIndexIsFullClustered](self, "vuIndexIsFullClustered"));
  v34[10] = v12;
  v33[11] = @"totalAssetCount";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalAssetCount](self, "totalAssetCount"));
  v34[11] = v13;
  v33[12] = @"totalCuratedAssetCount";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalCuratedAssetCount](self, "totalCuratedAssetCount"));
  v34[12] = v14;
  v33[13] = @"totalAssetForScenesCount";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalAssetForScenesCount](self, "totalAssetForScenesCount"));
  v34[13] = v15;
  v33[14] = @"totalCuratedAssetForScenesCount";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalCuratedAssetForScenesCount](self, "totalCuratedAssetForScenesCount"));
  v34[14] = v16;
  v33[15] = @"mediaAnalysisImageVersion";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot mediaAnalysisImageVersion](self, "mediaAnalysisImageVersion"));
  v34[15] = v17;
  v33[16] = @"hasConsistentMediaAnalysisImageVersionKey";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[PLFeatureProcessingSnapshot hasConsistentMediaAnalysisImageVersion](self, "hasConsistentMediaAnalysisImageVersion"));
  v34[16] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:17];
  v20 = [v28 dictionaryWithDictionary:v19];

  [v20 setObject:self->_dateComputed forKeyedSubscript:@"dateComputed"];
  [v20 setObject:self->_lastFullVUIndexClusterDate forKeyedSubscript:@"lastFullVUIndexClusterDate"];
  return (NSDictionary *)v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PLFeatureProcessingSnapshot *)self dictionary];
  v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (PLFeatureProcessingSnapshot)initWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PLFeatureProcessingSnapshot;
  v5 = [(PLFeatureProcessingSnapshot *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fractionOfAllAssetsAnalyzedForScenes"];
    [v6 doubleValue];
    v5->_fractionOfAllAssetsAnalyzedForScenes = v7;

    v8 = [v4 objectForKeyedSubscript:@"fractionOfAllAssetsWithSceneAnalysisInSearchIndex"];
    [v8 doubleValue];
    v5->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = v9;

    v10 = [v4 objectForKeyedSubscript:@"fractionOfAllAssetsWithMediaAnalysisInSearchIndex"];
    [v10 doubleValue];
    v5->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = v11;

    v12 = [v4 objectForKeyedSubscript:@"fractionOfAllAssetsWithCaptions"];
    [v12 doubleValue];
    v5->_fractionOfAllAssetsWithCaptions = v13;

    v14 = [v4 objectForKeyedSubscript:@"fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex"];
    [v14 doubleValue];
    v5->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = v15;

    v16 = [v4 objectForKeyedSubscript:@"fractionOfCuratedAssetsWithEmbeddingsInVectorIndex"];
    [v16 doubleValue];
    v5->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v17;

    v18 = [v4 objectForKeyedSubscript:@"fractionOfCuratedAssetsIndexedInVUClustering"];
    [v18 doubleValue];
    v5->_fractionOfCuratedAssetsIndexedInVUClustering = v19;

    v20 = [v4 objectForKeyedSubscript:@"fractionOfCuratedAssetsWithCaptions"];
    [v20 doubleValue];
    v5->_fractionOfCuratedAssetsWithCaptions = v21;

    v22 = [v4 objectForKeyedSubscript:@"fractionOfHighlightsEnriched"];
    [v22 doubleValue];
    v5->_fractionOfHighlightsEnriched = v23;

    v24 = [v4 objectForKeyedSubscript:@"photosKnowledgeGraphIsReady"];
    v5->_photosKnowledgeGraphIsReady = [v24 BOOLValue];

    v25 = [v4 objectForKeyedSubscript:@"vuIndexIsFullClustered"];
    v26 = v25;
    if (v25) {
      char v27 = [v25 BOOLValue];
    }
    else {
      char v27 = 1;
    }
    v5->_vuIndexIsFullClustered = v27;
    uint64_t v28 = [v4 objectForKeyedSubscript:@"lastFullVUIndexClusterDate"];
    lastFullVUIndexClusterDate = v5->_lastFullVUIndexClusterDate;
    v5->_lastFullVUIndexClusterDate = (NSDate *)v28;

    v30 = [v4 objectForKeyedSubscript:@"totalAssetCount"];
    v5->_totalAssetCount = [v30 unsignedIntegerValue];

    v31 = [v4 objectForKeyedSubscript:@"totalCuratedAssetCount"];
    v5->_totalCuratedAssetCount = [v31 unsignedIntegerValue];

    v32 = [v4 objectForKeyedSubscript:@"totalAssetForScenesCount"];
    v5->_totalAssetForScenesCount = [v32 unsignedIntegerValue];

    v33 = [v4 objectForKeyedSubscript:@"totalCuratedAssetForScenesCount"];
    v5->_totalCuratedAssetForScenesCount = [v33 unsignedIntegerValue];

    v34 = [v4 objectForKeyedSubscript:@"mediaAnalysisImageVersion"];
    v5->_mediaAnalysisImageVersion = [v34 unsignedIntegerValue];

    v35 = [v4 objectForKeyedSubscript:@"hasConsistentMediaAnalysisImageVersionKey"];
    v5->_hasConsistentMediaAnalysisImageVersion = [v35 BOOLValue];

    uint64_t v36 = [v4 objectForKeyedSubscript:@"dateComputed"];
    dateComputed = v5->_dateComputed;
    v5->_dateComputed = (NSDate *)v36;

    v38 = v5;
  }

  return v5;
}

- (PLFeatureProcessingSnapshot)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLFeatureProcessingSnapshot;
  v2 = [(PLFeatureProcessingSnapshot *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end