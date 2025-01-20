@interface PLFeatureAvailabilityConfig
- (BOOL)needsPhotosKnowledgeGraph;
- (NSDictionary)dictionary;
- (PLFeatureAvailabilityConfig)init;
- (PLFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3;
- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
- (double)fractionOfCuratedAssetsWithCaptionsThreshold;
- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
- (double)fractionOfHighlightsEnrichedThreshold;
- (unint64_t)minimumNumberOfCuratedAssets;
- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold:(double)a3;
- (void)setFractionOfCuratedAssetsWithCaptionsThreshold:(double)a3;
- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold:(double)a3;
- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold:(double)a3;
- (void)setFractionOfHighlightsEnrichedThreshold:(double)a3;
- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3;
- (void)setNeedsPhotosKnowledgeGraph:(BOOL)a3;
@end

@implementation PLFeatureAvailabilityConfig

- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3
{
  self->_minimumNumberOfCuratedAssets = a3;
}

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

- (void)setNeedsPhotosKnowledgeGraph:(BOOL)a3
{
  self->_needsPhotosKnowledgeGraph = a3;
}

- (BOOL)needsPhotosKnowledgeGraph
{
  return self->_needsPhotosKnowledgeGraph;
}

- (void)setFractionOfHighlightsEnrichedThreshold:(double)a3
{
  self->_fractionOfHighlightsEnrichedThreshold = a3;
}

- (double)fractionOfHighlightsEnrichedThreshold
{
  return self->_fractionOfHighlightsEnrichedThreshold;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
}

- (void)setFractionOfCuratedAssetsWithCaptionsThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptionsThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithCaptionsThreshold
{
  return self->_fractionOfCuratedAssetsWithCaptionsThreshold;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = a3;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
}

- (NSDictionary)dictionary
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v17[0] = @"fractionOfCuratedAssetsWithCaptionsThreshold";
  v3 = NSNumber;
  [(PLFeatureAvailabilityConfig *)self fractionOfCuratedAssetsWithCaptionsThreshold];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v18[0] = v4;
  v17[1] = @"fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold";
  v5 = NSNumber;
  [(PLFeatureAvailabilityConfig *)self fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v18[1] = v6;
  v17[2] = @"fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold";
  v7 = NSNumber;
  [(PLFeatureAvailabilityConfig *)self fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v18[2] = v8;
  v17[3] = @"fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold";
  v9 = NSNumber;
  [(PLFeatureAvailabilityConfig *)self fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v18[3] = v10;
  v17[4] = @"fractionOfHighlightsEnrichedThreshold";
  v11 = NSNumber;
  [(PLFeatureAvailabilityConfig *)self fractionOfHighlightsEnrichedThreshold];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v18[4] = v12;
  v17[5] = @"needsPhotosKnowledgeGraph";
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[PLFeatureAvailabilityConfig needsPhotosKnowledgeGraph](self, "needsPhotosKnowledgeGraph"));
  v18[5] = v13;
  v17[6] = @"minimumNumberOfCuratedAssets";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLFeatureAvailabilityConfig minimumNumberOfCuratedAssets](self, "minimumNumberOfCuratedAssets"));
  v18[6] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return (NSDictionary *)v15;
}

- (PLFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3
{
  v4 = [(PLFeatureAvailabilityConfig *)self init];
  v5 = v4;
  if (v4)
  {
    if (a3 - 2 < 2)
    {
      v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = 0.9;
    }
    else
    {
      if (a3 == 1)
      {
        __asm { FMOV            V0.2D, #0.75 }
        *(_OWORD *)&v4->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = _Q0;
        v4->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = 0.75;
        v4->_minimumNumberOfCuratedAssets = 50;
        goto LABEL_8;
      }
      if (a3 == 6)
      {
        v4->_fractionOfCuratedAssetsWithCaptionsThreshold = 0.9;
        v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = 0.8;
        v4->_fractionOfHighlightsEnrichedThreshold = 0.8;
LABEL_8:
        v4->_needsPhotosKnowledgeGraph = 1;
      }
    }
    v11 = v4;
  }

  return v5;
}

- (PLFeatureAvailabilityConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLFeatureAvailabilityConfig;
  v2 = [(PLFeatureAvailabilityConfig *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

@end