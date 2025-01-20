@interface PGGraphMusicSessionNodeCollection
+ (id)filter;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphMusicSessionNodeCollection

+ (id)filter
{
  return +[PGGraphNode filter];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphMusicSessionNode momentOfMusicSession];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

@end