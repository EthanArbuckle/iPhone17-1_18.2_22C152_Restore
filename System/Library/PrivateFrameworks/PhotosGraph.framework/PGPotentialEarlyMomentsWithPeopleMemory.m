@interface PGPotentialEarlyMomentsWithPeopleMemory
- (NSArray)facedAssetLocalIdentifiers;
- (NSSet)personNodes;
- (PGPotentialEarlyMomentsWithPeopleMemory)initWithMomentNodes:(id)a3 personNodes:(id)a4;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (void)setFacedAssetLocalIdentifiers:(id)a3;
@end

@implementation PGPotentialEarlyMomentsWithPeopleMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facedAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
}

- (void)setFacedAssetLocalIdentifiers:(id)a3
{
}

- (NSArray)facedAssetLocalIdentifiers
{
  return self->_facedAssetLocalIdentifiers;
}

- (NSSet)personNodes
{
  return self->_personNodes;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:self->_personNodes graph:v4];

  v6 = [(PGGraphPersonNodeCollection *)v5 featureNodeCollection];

  return v6;
}

- (unint64_t)memoryCategorySubcategory
{
  return 2004;
}

- (unint64_t)memoryCategory
{
  return 4;
}

- (PGPotentialEarlyMomentsWithPeopleMemory)initWithMomentNodes:(id)a3 personNodes:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPotentialEarlyMomentsWithPeopleMemory;
  v8 = [(PGPotentialMemory *)&v11 initWithCategory:219 subcategory:0 momentNodes:a3 sourceType:2];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_personNodes, a4);
  }

  return v9;
}

@end