@interface PGGraphSceneNodeCollection
+ (Class)nodeClass;
+ (id)sceneNodesForSceneIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)sceneNodesForSceneName:(id)a3 inGraph:(id)a4;
+ (id)sceneNodesForSceneNames:(id)a3 inGraph:(id)a4;
- (NSSet)localizedSceneNames;
- (NSSet)sceneIdentifiers;
- (NSSet)sceneNames;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphMomentNodeCollection)momentNodesThroughReliableEdges;
- (PGGraphMomentNodeCollection)momentNodesWithDominantSceneAssets;
- (PGGraphMomentNodeCollection)momentNodesWithHighConfidenceAssets;
- (PGGraphMomentNodeCollection)momentNodesWithSearchConfidenceAssets;
- (void)enumerateLocalizedNamesUsingBlock:(id)a3;
- (void)enumerateSceneIdentifiersUsingBlock:(id)a3;
@end

@implementation PGGraphSceneNodeCollection

- (void)enumerateSceneIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PGGraphSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDCF0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateUnsignedLongLongPropertyValuesForKey:@"sceneIdentifier" withBlock:v6];
}

uint64_t __66__PGGraphSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateLocalizedNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localizedName" withBlock:v6];
}

uint64_t __64__PGGraphSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (NSSet)sceneIdentifiers
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphSceneNodeCollection_sceneIdentifiers__block_invoke;
  v6[3] = &unk_1E68EA838;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateUnsignedLongLongPropertyValuesForKey:@"sceneIdentifier" withBlock:v6];

  return (NSSet *)v4;
}

void __46__PGGraphSceneNodeCollection_sceneIdentifiers__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (NSSet)localizedSceneNames
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PGGraphSceneNodeCollection_localizedSceneNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localizedName" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __49__PGGraphSceneNodeCollection_localizedSceneNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSSet)sceneNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(MANodeCollection *)self labels];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "lowercaseString", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (PGGraphMomentNodeCollection)momentNodesWithDominantSceneAssets
{
  v3 = +[PGGraphSceneNode momentOfSceneWithDominantSceneAssets];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodesWithSearchConfidenceAssets
{
  v3 = +[PGGraphSceneNode momentOfSceneWithSearchConfidenceAssets];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodesWithHighConfidenceAssets
{
  v3 = +[PGGraphSceneNode momentOfSceneWithHighConfidenceAssets];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodesThroughReliableEdges
{
  v3 = +[PGGraphSceneNode momentOfReliableScene];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphSceneNode momentOfScene];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)sceneNodesForSceneIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphSceneNode filterWithSceneIdentifiers:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)sceneNodesForSceneNames:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphSceneNode filterForSceneNames:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)sceneNodesForSceneName:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[PGGraphSceneNode filterForSceneName:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end