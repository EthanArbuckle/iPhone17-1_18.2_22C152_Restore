@interface PGGraphHighlightNodeCollection
+ (Class)nodeClass;
+ (id)dayHighlightNodesInGraph:(id)a3;
+ (id)highlightNodeAsCollectionByHighlightUUIDForArrayOfHighlightUUIDs:(id)a3 inGraph:(id)a4;
+ (id)highlightNodeAsCollectionByHighlightUUIDForHighlightUUIDs:(id)a3 inGraph:(id)a4;
+ (id)highlightNodeForUUID:(id)a3 inGraph:(id)a4;
+ (id)highlightNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4;
+ (id)highlightNodesForUUIDs:(id)a3 inGraph:(id)a4;
- (NSSet)localIdentifiers;
- (NSSet)uuids;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes;
- (PGGraphHighlightNodeCollection)subsetWithBothPrivateAndSharedAssets;
- (PGGraphHighlightNodeCollection)subsetWithPrivateAssets;
- (PGGraphHighlightNodeCollection)subsetWithSharedAssets;
- (PGGraphMomentNodeCollection)momentNodes;
- (id)highConfidenceSceneNodes;
- (id)highlightNodeAsCollectionByHighlightUUID;
- (id)highlightNodeByHighlightUUID;
- (id)sceneNodes;
- (id)searchConfidenceSceneNodes;
- (void)enumerateUUIDs:(id)a3;
@end

@implementation PGGraphHighlightNodeCollection

- (PGGraphHighlightNodeCollection)subsetWithBothPrivateAndSharedAssets
{
  v3 = +[PGGraphHighlightNode highlightWithPrivateAndSharedAssetsOfHighlight];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)subsetWithPrivateAssets
{
  v3 = +[PGGraphHighlightNode highlightWithPrivateAssetsOfHighlight];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)subsetWithSharedAssets
{
  v3 = +[PGGraphHighlightNode highlightWithSharedAssetsOfHighlight];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightNodeCollection *)v4;
}

- (id)highlightNodeByHighlightUUID
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PGGraphHighlightNodeCollection_highlightNodeByHighlightUUID__block_invoke;
  v6[3] = &unk_1E68EB678;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return v4;
}

void __62__PGGraphHighlightNodeCollection_highlightNodeByHighlightUUID__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)highlightNodeAsCollectionByHighlightUUID
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PGGraphHighlightNodeCollection_highlightNodeAsCollectionByHighlightUUID__block_invoke;
  v8[3] = &unk_1E68EDD18;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __74__PGGraphHighlightNodeCollection_highlightNodeAsCollectionByHighlightUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [PGGraphHighlightNodeCollection alloc];
  id v7 = [*(id *)(a1 + 32) graph];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
  id v9 = [(MAElementCollection *)v6 initWithGraph:v7 elementIdentifiers:v8];

  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
}

- (NSSet)localIdentifiers
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphHighlightNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphHighlightNodeCollection *)self enumerateUUIDs:v6];

  return (NSSet *)v4;
}

void __50__PGGraphHighlightNodeCollection_localIdentifiers__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F39238], "localIdentifierWithUUID:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 length]) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

- (NSSet)uuids
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraphHighlightNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphHighlightNodeCollection *)self enumerateUUIDs:v6];

  return (NSSet *)v4;
}

void __39__PGGraphHighlightNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)enumerateUUIDs:(id)a3
{
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (id)searchConfidenceSceneNodes
{
  id v2 = [(PGGraphHighlightNodeCollection *)self momentNodes];
  id v3 = [v2 searchConfidenceSceneNodes];

  return v3;
}

- (id)highConfidenceSceneNodes
{
  id v2 = [(PGGraphHighlightNodeCollection *)self momentNodes];
  id v3 = [v2 highConfidenceSceneNodes];

  return v3;
}

- (id)sceneNodes
{
  id v2 = [(PGGraphHighlightNodeCollection *)self momentNodes];
  id v3 = [v2 sceneNodes];

  return v3;
}

- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes
{
  id v3 = +[PGGraphHighlightNode highlightGroupOfHighlight];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightGroupNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphHighlightNode momentInHighlight];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)highlightNodeAsCollectionByHighlightUUIDForArrayOfHighlightUUIDs:(id)a3 inGraph:(id)a4
{
  id v4 = +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:a3 inGraph:a4];
  id v5 = [v4 highlightNodeAsCollectionByHighlightUUID];

  return v5;
}

+ (id)highlightNodeAsCollectionByHighlightUUIDForHighlightUUIDs:(id)a3 inGraph:(id)a4
{
  id v4 = +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:a3 inGraph:a4];
  id v5 = [v4 highlightNodeAsCollectionByHighlightUUID];

  return v5;
}

+ (id)dayHighlightNodesInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphHighlightNode filter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)highlightNodeForUUID:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphHighlightNode filterWithUUID:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)highlightNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphHighlightNode filterWithUUIDs:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)highlightNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphHighlightNode filterWithUUIDs:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end