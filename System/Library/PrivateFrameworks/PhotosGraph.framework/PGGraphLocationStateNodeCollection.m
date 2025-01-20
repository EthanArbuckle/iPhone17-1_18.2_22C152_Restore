@interface PGGraphLocationStateNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphLocationCountryNodeCollection)countryNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (unint64_t)numberOfMomentNodes;
@end

@implementation PGGraphLocationStateNodeCollection

- (unint64_t)numberOfMomentNodes
{
  v3 = +[PGGraphLocationStateNode momentOfState];
  unint64_t v4 = +[MANodeCollection numberOfNodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  v3 = +[PGGraphLocationStateNode countryOfState];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphLocationStateNode momentOfState];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphLocationStateNode addressOfState];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end