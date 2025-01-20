@interface PXStoryDefaultAutoEditDecisionListsProducerFactory
- (PXStoryConfiguration)storyConfiguration;
- (PXStoryDefaultAutoEditDecisionListsProducerFactory)initWithStoryConfiguration:(id)a3;
- (id)autoEditDecisionListsProducerForAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7;
- (id)fallbackAutoEditDecisionListsProducer;
@end

@implementation PXStoryDefaultAutoEditDecisionListsProducerFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (id)fallbackAutoEditDecisionListsProducer
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = PFStoryColorGradeSupportedCategories();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  memset(&v35, 0, sizeof(v35));
  [(PFStoryAutoEditConfiguration *)self->_configuration outroDurationForSongPace:2];
  CMTimeMakeWithSeconds(&v35, v5, 600);
  v6 = [(PXStoryDefaultAutoEditDecisionListsProducerFactory *)self storyConfiguration];
  uint64_t v7 = [v6 disableNUp] ^ 1;

  v8 = [PXStoryConcreteAutoEditDecisionList alloc];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
  long long v32 = v24;
  long long v33 = v23;
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 64);
  long long v34 = v22;
  long long v20 = *MEMORY[0x1E4F8D288];
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 16);
  long long v30 = *MEMORY[0x1E4F8D288];
  long long v31 = v21;
  CMTime v29 = v35;
  v9 = [(PXStoryConcreteAutoEditDecisionList *)v8 initWithColorGradeCategory:0 song:0 clipCatalog:0 constrainedOverallDurationInfo:&v30 outroDuration:&v29 allowsNUp:v7];
  [v4 addObject:v9];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = [PXStoryConcreteAutoEditDecisionList alloc];
        long long v32 = v24;
        long long v33 = v23;
        long long v34 = v22;
        long long v30 = v20;
        long long v31 = v21;
        CMTime v29 = v35;
        v17 = [(PXStoryConcreteAutoEditDecisionList *)v16 initWithColorGradeCategory:v15 song:0 clipCatalog:0 constrainedOverallDurationInfo:&v30 outroDuration:&v29 allowsNUp:v7];
        [v4 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v12);
  }

  v18 = [[PXStoryPassthroughAutoEditDecisionListsProducer alloc] initWithAutoEditDecisionLists:v4];
  return v18;
}

- (id)autoEditDecisionListsProducerForAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [PXStorySongsAutoEditDecisionListsProducer alloc];
  configuration = self->_configuration;
  v18 = [(PXStoryDefaultAutoEditDecisionListsProducerFactory *)self storyConfiguration];
  long long v19 = *(_OWORD *)&a7->var1.var1.var3;
  v23[2] = *(_OWORD *)&a7->var1.var1.var0;
  v23[3] = v19;
  v23[4] = *(_OWORD *)&a7->var1.var2.var1;
  long long v20 = *(_OWORD *)&a7->var1.var0.var1;
  v23[0] = *(_OWORD *)&a7->var0;
  v23[1] = v20;
  long long v21 = [(PXStorySongsAutoEditDecisionListsProducer *)v16 initWithAssetCollection:v15 displayAssets:v14 movieHighlights:v13 chapterCollection:v12 targetOverallDurationInfo:v23 configuration:configuration storyConfiguration:v18];

  return v21;
}

- (PXStoryDefaultAutoEditDecisionListsProducerFactory)initWithStoryConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryDefaultAutoEditDecisionListsProducerFactory;
  v6 = [(PXStoryDefaultAutoEditDecisionListsProducerFactory *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
    uint64_t v8 = +[PXStoryAutoEditConfigurationFactory autoEditConfiguration];
    configuration = v7->_configuration;
    v7->_configuration = (PFStoryAutoEditConfiguration *)v8;
  }
  return v7;
}

@end