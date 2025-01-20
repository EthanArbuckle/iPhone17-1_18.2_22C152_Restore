@interface PGGraphPartOfWeekNodeCollection
+ (Class)nodeClass;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphPartOfWeekNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphPartOfWeekEdge filter];
  v4 = [v3 inRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

@end