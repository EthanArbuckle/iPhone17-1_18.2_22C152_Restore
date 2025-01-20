@interface PGMePersonMemoryGenerator
- (PGMePersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredSeasonConfiguration;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGMePersonMemoryGenerator

- (void).cxx_destruct
{
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  v7 = (void *)MEMORY[0x1E4F71E88];
  v8 = +[PGGraphFeatureNodeCollection momentOfFeature];
  v9 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PGMePersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E68E5120;
  id v12 = v5;
  id v10 = v5;
  [v9 enumerateTargetsBySourceWithBlock:v11];
}

void __83__PGMePersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (PGMePersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGMePersonMemoryGenerator;
  v3 = [(PGPersonMemoryGenerator *)&v7 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    featuredSeasonConfiguration = v3->_featuredSeasonConfiguration;
    v3->_featuredSeasonConfiguration = 0;
  }
  return v4;
}

@end