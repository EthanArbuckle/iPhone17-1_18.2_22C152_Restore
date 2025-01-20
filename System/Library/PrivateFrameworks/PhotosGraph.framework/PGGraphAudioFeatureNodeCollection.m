@interface PGGraphAudioFeatureNodeCollection
+ (Class)nodeClass;
+ (id)audioFeatureNodesForLabel:(id)a3 inGraph:(id)a4;
+ (id)audioFeatureNodesForLabels:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphAudioFeatureNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphAudioFeatureNode momentOfAudioFeature];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

+ (id)audioFeatureNodesForLabels:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphAudioFeatureNode filterForAudioFeatureLabels:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)audioFeatureNodesForLabel:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphAudioFeatureNode filterForAudioFeatureLabel:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end