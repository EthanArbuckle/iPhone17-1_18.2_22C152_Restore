@interface PGPotentialPastSupersetMemory
- (NSDateInterval)supersetDateInterval;
- (PGGraphLocationNode)supersetLocationNode;
- (PGGraphLocationNodeCollection)supersetLocationNodes;
- (PGGraphMomentNodeCollection)interestingMomentNodes;
- (PGPotentialPastSupersetMemory)initWithSupersetLocationNode:(id)a3 supersetDateInterval:(id)a4 interestingMomentNodes:(id)a5 momentNodes:(id)a6;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (void)setSupersetLocationNodes:(id)a3;
@end

@implementation PGPotentialPastSupersetMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersetLocationNodes, 0);
  objc_storeStrong((id *)&self->_interestingMomentNodes, 0);
  objc_storeStrong((id *)&self->_supersetDateInterval, 0);
  objc_storeStrong((id *)&self->_supersetLocationNode, 0);
}

- (void)setSupersetLocationNodes:(id)a3
{
}

- (PGGraphLocationNodeCollection)supersetLocationNodes
{
  return (PGGraphLocationNodeCollection *)objc_getProperty(self, a2, 200, 1);
}

- (PGGraphMomentNodeCollection)interestingMomentNodes
{
  return (PGGraphMomentNodeCollection *)objc_getProperty(self, a2, 192, 1);
}

- (NSDateInterval)supersetDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 184, 1);
}

- (PGGraphLocationNode)supersetLocationNode
{
  return (PGGraphLocationNode *)objc_getProperty(self, a2, 176, 1);
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F71E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(PGGraphLocationNode *)self->_supersetLocationNode label];
  if (([v7 isEqualToString:@"City"] & 1) != 0
    || ([v7 isEqualToString:@"State"] & 1) != 0
    || [v7 isEqualToString:@"Country"])
  {
    objc_msgSend(v6, "addIdentifier:", -[MANode identifier](self->_supersetLocationNode, "identifier"));
  }
  v8 = [(PGGraphMomentNodeCollection *)self->_interestingMomentNodes frequentLocationNodes];
  v9 = [v8 elementIdentifiers];
  [v6 unionWithIdentifierSet:v9];

  v10 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v5 elementIdentifiers:v6];
  return v10;
}

- (unint64_t)memoryCategorySubcategory
{
  return 13001;
}

- (unint64_t)memoryCategory
{
  return 20;
}

- (PGPotentialPastSupersetMemory)initWithSupersetLocationNode:(id)a3 supersetDateInterval:(id)a4 interestingMomentNodes:(id)a5 momentNodes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [a6 set];
  v17.receiver = self;
  v17.super_class = (Class)PGPotentialPastSupersetMemory;
  v15 = [(PGPotentialMemory *)&v17 initWithCategory:301 subcategory:211 momentNodes:v14 sourceType:3];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_supersetLocationNode, a3);
    objc_storeStrong((id *)&v15->_supersetDateInterval, a4);
    objc_storeStrong((id *)&v15->_interestingMomentNodes, a5);
  }

  return v15;
}

@end