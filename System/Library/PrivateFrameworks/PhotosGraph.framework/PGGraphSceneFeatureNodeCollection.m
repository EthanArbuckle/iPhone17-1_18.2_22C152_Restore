@interface PGGraphSceneFeatureNodeCollection
+ (Class)nodeClass;
+ (id)sceneFeatureNodesForSceneName:(id)a3 inGraph:(id)a4;
+ (id)sceneFeatureNodesForSceneNames:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphSceneFeatureNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphSceneFeatureNode momentOfSceneFeature];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

+ (id)sceneFeatureNodesForSceneNames:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphSceneFeatureNode filterForSceneNames:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)sceneFeatureNodesForSceneName:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphSceneFeatureNode filterForSceneName:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end