@interface PGGraphMemory
- (BOOL)generatedWithFallbackRequirements;
- (NSString)description;
- (NSString)uniqueMemoryIdentifier;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6;
- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6 generatedWithFallbackRequirements:(BOOL)a7;
- (PGGraphMomentNodeCollection)memoryMomentNodes;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
@end

@implementation PGGraphMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_memoryMomentNodes, 0);
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return self->_memoryFeatureNodes;
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return self->_memoryMomentNodes;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMemory;
  v4 = [(PGGraphMemory *)&v8 description];
  v5 = +[PGGraphBuilder memoryLabelForCategory:self->_memoryCategory];
  v6 = [v3 stringWithFormat:@"%@: %@, momentNodes: %@, featureNodes: %@", v4, v5, self->_memoryMomentNodes, self->_memoryFeatureNodes];

  return (NSString *)v6;
}

- (NSString)uniqueMemoryIdentifier
{
  v3 = +[PGGraphBuilder memoryLabelForCategory:self->_memoryCategory];
  v4 = +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:v3 featureNodes:self->_memoryFeatureNodes];

  return (NSString *)v4;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return self->_memoryFeatureNodes;
}

- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6
{
  return [(PGGraphMemory *)self initWithMemoryCategory:a3 memoryCategorySubcategory:a4 momentNodes:a5 featureNodes:a6 generatedWithFallbackRequirements:0];
}

- (PGGraphMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 momentNodes:(id)a5 featureNodes:(id)a6 generatedWithFallbackRequirements:(BOOL)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphMemory;
  v15 = [(PGGraphMemory *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_memoryCategory = a3;
    v15->_memoryCategorySubcategory = a4;
    objc_storeStrong((id *)&v15->_memoryMomentNodes, a5);
    objc_storeStrong((id *)&v16->_memoryFeatureNodes, a6);
    v16->_generatedWithFallbackRequirements = a7;
  }

  return v16;
}

@end