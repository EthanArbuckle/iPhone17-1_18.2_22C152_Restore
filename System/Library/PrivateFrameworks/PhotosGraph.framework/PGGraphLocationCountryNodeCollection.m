@interface PGGraphLocationCountryNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphLanguageNodeCollection)languageNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (unint64_t)numberOfMomentNodes;
@end

@implementation PGGraphLocationCountryNodeCollection

- (unint64_t)numberOfMomentNodes
{
  v3 = +[PGGraphLocationCountryNode momentInCountry];
  unint64_t v4 = +[MANodeCollection numberOfNodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (PGGraphLanguageNodeCollection)languageNodes
{
  v3 = +[PGGraphLocationCountryNode languageOfCountry];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLanguageNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphLocationCountryNode momentInCountry];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphLocationCountryNode addressOfCountry];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end