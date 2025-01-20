@interface PGGraphROINodeCollection
+ (Class)nodeClass;
+ (id)roiNodesForLabels:(id)a3 inGraph:(id)a4;
+ (id)roiNodesOfType:(unint64_t)a3 inGraph:(id)a4;
+ (id)roiNodesOfTypes:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphROINodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphROINode momentOfROI];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)roiNodesForLabels:(id)a3 inGraph:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  v8 = [v6 setWithArray:a3];
  v9 = +[PGGraphROINode filterWithLabels:v8];
  v10 = [a1 nodesMatchingFilter:v9 inGraph:v7];

  return v10;
}

+ (id)roiNodesOfTypes:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphROINode filterForTypes:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)roiNodesOfType:(unint64_t)a3 inGraph:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a4;
  v8 = [v6 indexSetWithIndex:a3];
  v9 = [a1 roiNodesOfTypes:v8 inGraph:v7];

  return v9;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end