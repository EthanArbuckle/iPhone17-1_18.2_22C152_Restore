@interface PGGraphRelationshipTagEdgeCollection
+ (Class)edgeClass;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphPersonRelationshipTagNodeCollection)tagNodes;
@end

@implementation PGGraphRelationshipTagEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphPersonRelationshipTagNodeCollection)tagNodes
{
  return (PGGraphPersonRelationshipTagNodeCollection *)+[MANodeCollection targetNodesOfEdges:self];
}

- (PGGraphPersonNodeCollection)personNodes
{
  return (PGGraphPersonNodeCollection *)+[MANodeCollection sourceNodesOfEdges:self];
}

@end