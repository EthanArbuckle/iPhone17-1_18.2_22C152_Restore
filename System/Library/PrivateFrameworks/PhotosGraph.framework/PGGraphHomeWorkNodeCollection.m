@interface PGGraphHomeWorkNodeCollection
+ (Class)nodeClass;
+ (id)homeNodesInGraph:(id)a3;
+ (id)workNodesInGraph:(id)a3;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphAddressNodeCollection)preciseAddressNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphPersonNodeCollection)ownerNodes;
@end

@implementation PGGraphHomeWorkNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphPersonNodeCollection)ownerNodes
{
  v3 = +[PGGraphHomeWorkNode ownerOfHomeWork];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F71F18];
  v4 = +[PGGraphHomeWorkNode addressOfHomeWork];
  v11[0] = v4;
  v5 = +[PGGraphAddressNode preciseFilter];
  v6 = [v5 relation];
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8 = [v3 chain:v7];

  v9 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v8];

  return (PGGraphAddressNodeCollection *)v9;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphHomeWorkNode addressOfHomeWork];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (id)workNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHomeWorkNode workFilter];
  v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)homeNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = +[PGGraphHomeWorkNode homeFilter];
  v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end