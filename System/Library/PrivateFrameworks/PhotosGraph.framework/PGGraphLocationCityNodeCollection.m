@interface PGGraphLocationCityNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphLocationCountryNodeCollection)countryNodes;
- (PGGraphLocationCountyNodeCollection)countyNodes;
- (PGGraphLocationStateNodeCollection)stateNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (unint64_t)numberOfMomentNodes;
@end

@implementation PGGraphLocationCityNodeCollection

- (unint64_t)numberOfMomentNodes
{
  v3 = +[PGGraphLocationCityNode momentInCity];
  unint64_t v4 = +[MANodeCollection numberOfNodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (PGGraphLocationCountyNodeCollection)countyNodes
{
  v3 = +[PGGraphLocationCityNode countyOfCity];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCountyNodeCollection *)v4;
}

- (PGGraphLocationStateNodeCollection)stateNodes
{
  v3 = +[PGGraphLocationCityNode stateOfCity];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationStateNodeCollection *)v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  v3 = +[PGGraphLocationCityNode countryOfCity];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphLocationCityNode momentInCity];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphLocationCityNode addressOfCity];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end