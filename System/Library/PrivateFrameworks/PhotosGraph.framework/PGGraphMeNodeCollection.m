@interface PGGraphMeNodeCollection
+ (Class)nodeClass;
- (id)inferredPersonNodes;
@end

@implementation PGGraphMeNodeCollection

- (id)inferredPersonNodes
{
  v3 = +[PGGraphMeNode inferredPersonOfMe];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end