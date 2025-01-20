@interface PGGraphLocationNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (id)childLocationNodes;
- (id)deepChildLocationNodes;
- (id)deepChildLocationNodesWithLabel:(id)a3;
- (id)deepParentLocationNodes;
- (id)deepParentLocationNodesWithLabel:(id)a3;
- (id)nearestDeepChildLocationNodesWithLabel:(id)a3;
- (id)nearestDeepNeighborWithLabel:(id)a3 usingOutEdges:(BOOL)a4;
- (id)nearestDeepParentLocationNodesWithLabel:(id)a3;
- (id)parentLocationNodes;
@end

@implementation PGGraphLocationNodeCollection

- (id)nearestDeepParentLocationNodesWithLabel:(id)a3
{
  return [(PGGraphLocationNodeCollection *)self nearestDeepNeighborWithLabel:a3 usingOutEdges:1];
}

- (id)deepParentLocationNodesWithLabel:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphLocationNode parentLocationOfLocation];
  v6 = [v5 transitiveClosure];

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F71F18];
    v15[0] = v6;
    id v8 = objc_alloc(MEMORY[0x1E4F71F00]);
    v9 = (void *)[v8 initWithLabel:v4 domain:(unsigned __int16)*MEMORY[0x1E4F71F38]];
    v10 = [v9 relation];
    v15[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v12 = [v7 chain:v11];

    v6 = (void *)v12;
  }
  v13 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v6];

  return v13;
}

- (id)deepParentLocationNodes
{
  v3 = +[PGGraphLocationNode parentLocationOfLocation];
  id v4 = [v3 transitiveClosure];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)parentLocationNodes
{
  v3 = +[PGGraphLocationNode parentLocationOfLocation];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (id)nearestDeepChildLocationNodesWithLabel:(id)a3
{
  return [(PGGraphLocationNodeCollection *)self nearestDeepNeighborWithLabel:a3 usingOutEdges:0];
}

- (id)deepChildLocationNodesWithLabel:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphLocationNode childLocationOfLocation];
  v6 = [v5 transitiveClosure];

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F71F18];
    v15[0] = v6;
    id v8 = objc_alloc(MEMORY[0x1E4F71F00]);
    v9 = (void *)[v8 initWithLabel:v4 domain:(unsigned __int16)*MEMORY[0x1E4F71F38]];
    v10 = [v9 relation];
    v15[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v12 = [v7 chain:v11];

    v6 = (void *)v12;
  }
  v13 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v6];

  return v13;
}

- (id)deepChildLocationNodes
{
  v3 = +[PGGraphLocationNode childLocationOfLocation];
  id v4 = [v3 transitiveClosure];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)childLocationNodes
{
  v3 = +[PGGraphLocationNode childLocationOfLocation];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return v4;
}

- (id)nearestDeepNeighborWithLabel:(id)a3 usingOutEdges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = +[PGGraphLocationEdge filter];
  v9 = [v8 relationWithType:v7];

  id v10 = objc_alloc(MEMORY[0x1E4F71F00]);
  v11 = (void *)[v10 initWithLabel:v6 domain:(unsigned __int16)*MEMORY[0x1E4F71F38]];
  uint64_t v12 = [v11 relation];

  v13 = self;
  v14 = 0;
  do
  {
    v15 = v14;
    v16 = v13;
    v13 = +[MANodeCollection nodesRelatedToNodes:v13 withRelation:v9];

    v14 = +[MANodeCollection nodesRelatedToNodes:v13 withRelation:v12];
  }
  while (![v14 count] && -[MAElementCollection count](v13, "count"));

  return v14;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphLocationNode addressOfLocation];
  BOOL v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end