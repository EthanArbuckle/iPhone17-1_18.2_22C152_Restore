@interface PGCLIPTrendsMemoryGenerator
+ (id)CLIPTrendsConfigurations;
+ (id)_CLIPTrends;
- (PGCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4;
- (unint64_t)minimumSceneAnalysisVersion;
- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3;
@end

@implementation PGCLIPTrendsMemoryGenerator

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (PGCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PGCLIPTrendsMemoryGenerator;
  v4 = [(PGTrendsMemoryGenerator *)&v6 initWithMemoryGenerationContext:a3 configurations:a4];
  if (v4) {
    v4->_minimumSceneAnalysisVersion = [MEMORY[0x1E4F8EB20] latestVersion];
  }
  return v4;
}

+ (id)CLIPTrendsConfigurations
{
  v2 = [a1 _CLIPTrends];
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PGCLIPTrendsMemoryGenerator_CLIPTrendsConfigurations__block_invoke;
    v6[3] = &unk_1E68E5858;
    uint64_t v8 = 0x3FF0000000000000;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

void __55__PGCLIPTrendsMemoryGenerator_CLIPTrendsConfigurations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v4];

  objc_super v6 = [PGCLIPTrendsConfiguration alloc];
  v9[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v8 = [(PGConfiguration *)v6 initWithSources:v7 version:*(double *)(a1 + 40)];

  if (v8) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

+ (id)_CLIPTrends
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PGRemoteConfiguration);
  id v3 = [(PGRemoteConfiguration *)v2 dictionaryValueForKey:@"com.apple.photos.memories.trendsmemory.CLIPTrendsQueries" withFallbackValue:MEMORY[0x1E4F1CC08]];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = @"com.apple.photos.memories.trendsmemory.CLIPTrendsQueries";
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't load remotely configured CLIP Trends dictionary from Trial factor %@", (uint8_t *)&v6, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

@end