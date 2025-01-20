@interface PGGraphHighlightGroupNodeCollection
+ (Class)nodeClass;
+ (MARelation)areaFeatureOfHighlightGroup;
+ (MARelation)featureOfHighlightGroup;
+ (MARelation)locationFeatureOfHighlightGroup;
+ (MARelation)momentsOfHighlightGroup;
+ (id)highlightGroupNodesForUUIDs:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featuredLocationOrAreaNodes;
- (PGGraphFeatureNodeCollection)tripFeatureNodes;
- (PGGraphHighlightNodeCollection)highlightNodes;
- (PGGraphHighlightTypeNodeCollection)typeNodes;
- (id)momentNodes;
@end

@implementation PGGraphHighlightGroupNodeCollection

- (PGGraphFeatureNodeCollection)featuredLocationOrAreaNodes
{
  v3 = +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  v5 = +[PGGraphHighlightGroupNodeCollection areaFeatureOfHighlightGroup];
  v6 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v5];

  v7 = [v4 collectionByFormingUnionWith:v6];

  return (PGGraphFeatureNodeCollection *)v7;
}

- (PGGraphFeatureNodeCollection)tripFeatureNodes
{
  v3 = +[PGGraphHighlightGroupNodeCollection featureOfHighlightGroup];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphFeatureNodeCollection *)v4;
}

- (PGGraphHighlightTypeNodeCollection)typeNodes
{
  v3 = +[PGGraphHasTypeEdge filter];
  v4 = [v3 outRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphHighlightTypeNodeCollection *)v5;
}

- (id)momentNodes
{
  v2 = [(PGGraphHighlightGroupNodeCollection *)self highlightNodes];
  v3 = [v2 momentNodes];

  return v3;
}

- (PGGraphHighlightNodeCollection)highlightNodes
{
  v3 = +[PGGraphHighlightGroupNode highlightOfHighlightGroup];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHighlightNodeCollection *)v4;
}

+ (MARelation)momentsOfHighlightGroup
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphHighlightGroupNode highlightOfHighlightGroup];
  v8[0] = v3;
  v4 = +[PGGraphHighlightNode momentInDayHighlight];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v2 chain:v5];

  return (MARelation *)v6;
}

+ (MARelation)areaFeatureOfHighlightGroup
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphTripFeatureEdge filter];
  v4 = [v3 outRelation];
  v10[0] = v4;
  v5 = +[PGGraphAreaNode filter];
  v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)locationFeatureOfHighlightGroup
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphTripFeatureEdge filter];
  v4 = [v3 outRelation];
  v10[0] = v4;
  v5 = +[PGGraphNamedLocationNode filter];
  v6 = [v5 relation];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)featureOfHighlightGroup
{
  v2 = +[PGGraphTripFeatureEdge filter];
  v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)highlightGroupNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphHighlightGroupNode filterWithUUIDs:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end