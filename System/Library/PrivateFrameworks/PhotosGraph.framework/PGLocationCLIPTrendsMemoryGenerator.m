@interface PGLocationCLIPTrendsMemoryGenerator
- (PGLocationCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4;
- (unint64_t)minimumSceneAnalysisVersion;
- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3;
@end

@implementation PGLocationCLIPTrendsMemoryGenerator

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (PGLocationCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PGLocationCLIPTrendsMemoryGenerator;
  v4 = [(PGLocationTrendsMemoryGenerator *)&v6 initWithMemoryGenerationContext:a3 configurations:a4];
  if (v4) {
    v4->_minimumSceneAnalysisVersion = [MEMORY[0x1E4F8EB20] latestVersion];
  }
  return v4;
}

@end