@interface PGGraphPOINodeCollection
+ (Class)nodeClass;
+ (id)poiNodesForLabel:(id)a3 inGraph:(id)a4;
+ (id)poiNodesForLabels:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphPOINodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphPOINode momentOfPOI];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)poiNodesForLabels:(id)a3 inGraph:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  v8 = [v6 setWithArray:a3];
  v9 = +[PGGraphPOINode filterWithLabels:v8];
  v10 = [a1 nodesMatchingFilter:v9 inGraph:v7];

  return v10;
}

+ (id)poiNodesForLabel:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphPOINode filterWithLabel:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end