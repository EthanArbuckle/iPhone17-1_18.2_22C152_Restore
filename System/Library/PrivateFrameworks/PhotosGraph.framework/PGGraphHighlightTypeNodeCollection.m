@interface PGGraphHighlightTypeNodeCollection
+ (Class)nodeClass;
+ (id)aggregationTypeNodesInGraph:(id)a3;
+ (id)concludedTripTypeNodesInGraph:(id)a3;
+ (id)defaultTypeNodesInGraph:(id)a3;
+ (id)longTripTypeNodesInGraph:(id)a3;
+ (id)onGoingTripTypeNodesInGraph:(id)a3;
+ (id)shortTripTypeNodesInGraph:(id)a3;
+ (id)tripTypeNodesInGraph:(id)a3;
+ (id)typeNodesWithLabel:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes;
- (PGGraphHighlightNodeCollection)highlightNodes;
@end

@implementation PGGraphHighlightTypeNodeCollection

+ (id)typeNodesWithLabel:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphHighlightTypeNode typeNodeFilterForLabel:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)defaultTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode defaultTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)onGoingTripTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode onGoingTripTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)aggregationTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode aggregationTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)shortTripTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode shortTripTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)longTripTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode longTripTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)concludedTripTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode concludedTripTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)tripTypeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHighlightTypeNode tripTypeNodeFilter];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes
{
  v2 = [(PGGraphHighlightTypeNodeCollection *)self highlightNodes];
  v3 = +[PGGraphNodeCollection subsetInCollection:v2];

  return (PGGraphHighlightGroupNodeCollection *)v3;
}

- (PGGraphHighlightNodeCollection)highlightNodes
{
  v3 = +[PGGraphHasTypeEdge filter];
  id v4 = [v3 inRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphHighlightNodeCollection *)v5;
}

@end