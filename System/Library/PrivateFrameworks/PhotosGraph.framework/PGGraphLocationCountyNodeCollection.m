@interface PGGraphLocationCountyNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphLocationCountyNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphLocationCountyNode momentOfCounty];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphLocationCountyNode addressOfCounty];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end