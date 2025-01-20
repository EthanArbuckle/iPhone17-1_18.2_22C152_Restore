@interface PGGraphMeaningNodeCollection
+ (Class)nodeClass;
+ (id)meaningNodesWithMeaning:(unint64_t)a3 inGraph:(id)a4;
+ (id)meaningNodesWithMeaningLabels:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMeaningEdgeCollection)reliableMeaningEdges;
- (PGGraphMeaningNodeCollection)childMeaningNodes;
- (PGGraphMeaningNodeCollection)parentMeaningNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (id)distinctMeaningNodesSubset;
- (id)localizedNames;
@end

@implementation PGGraphMeaningNodeCollection

- (id)distinctMeaningNodesSubset
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  v18[0] = @"Performance";
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Concert", 0);
  v19[0] = v4;
  v18[1] = @"SportEvent";
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Concert", 0);
  v19[1] = v5;
  v18[2] = @"Festival";
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Concert", 0);
  v19[2] = v6;
  v18[3] = @"NightOut";
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Concert", @"Festival", @"Theater", @"Dance", 0);
  v19[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__PGGraphMeaningNodeCollection_distinctMeaningNodesSubset__block_invoke;
  v15[3] = &unk_1E68E8AC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v3;
  id v9 = v3;
  id v10 = v8;
  [(MAElementCollection *)self enumerateIdentifiersAsCollectionsWithBlock:v15];
  v11 = [PGGraphMeaningNodeCollection alloc];
  v12 = [(MAElementCollection *)self graph];
  v13 = [(MAElementCollection *)v11 initWithGraph:v12 elementIdentifiers:v9];

  return v13;
}

void __58__PGGraphMeaningNodeCollection_distinctMeaningNodesSubset__block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 childMeaningNodes];
  char v7 = [v6 intersectsCollection:a1[4]];

  if ((v7 & 1) == 0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = objc_msgSend(a1[5], "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          v14 = [v5 meaningLabels];
          int v15 = [v14 containsObject:v13];

          if (v15)
          {
            id v16 = [a1[5] objectForKeyedSubscript:v13];
            id v17 = [a1[4] meaningLabels];
            char v18 = [v17 intersectsSet:v16];

            if (v18)
            {

              goto LABEL_13;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    [a1[6] addIdentifier:a2];
  }
LABEL_13:
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (id)localizedNames
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v4 = [(MANodeCollection *)self labels];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PGGraphMeaningNodeCollection_localizedNames__block_invoke;
  v7[3] = &unk_1E68ED970;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __46__PGGraphMeaningNodeCollection_localizedNames__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[PGGraphMeaningNode _localizedNameForLabel:a2];
  [v2 addObject:v3];
}

- (PGGraphMeaningEdgeCollection)reliableMeaningEdges
{
  id v3 = +[PGGraphMeaningEdge reliableFilter];
  v4 = +[MAEdgeCollection edgesToNodes:self matchingFilter:v3];

  return (PGGraphMeaningEdgeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphMeaningNode momentOfMeaning];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)parentMeaningNodes
{
  id v3 = +[PGGraphMeaningNode parentMeaningOfMeaning];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)childMeaningNodes
{
  id v3 = +[PGGraphMeaningNode childMeaningOfMeaning];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMeaningNodeCollection *)v4;
}

+ (id)meaningNodesWithMeaningLabels:(id)a3 inGraph:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F71F00];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];

  uint64_t v10 = (void *)[v8 initWithLabels:v9 domain:700 properties:MEMORY[0x1E4F1CC08]];
  uint64_t v11 = +[MANodeCollection nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)meaningNodesWithMeaning:(unint64_t)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphMeaningNode filterWithMeaning:a3];
  if (v7)
  {
    id v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];
  }
  else
  {
    id v8 = [(MAElementCollection *)[PGGraphMeaningNodeCollection alloc] initWithGraph:v6];
  }
  uint64_t v9 = v8;

  return v9;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end