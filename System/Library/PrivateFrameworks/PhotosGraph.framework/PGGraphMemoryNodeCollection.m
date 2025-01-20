@interface PGGraphMemoryNodeCollection
+ (Class)nodeClass;
+ (id)memoryNodeAsCollectionWithUniqueIdentifier:(id)a3 inGraph:(id)a4;
+ (id)memoryNodesOfCategories:(id)a3 inGraph:(id)a4;
+ (id)memoryNodesOfCategory:(unint64_t)a3 inGraph:(id)a4;
+ (id)memoryNodesWithUniqueIdentifierArray:(id)a3 inGraph:(id)a4;
+ (id)memoryNodesWithUniqueIdentifiers:(id)a3 inGraph:(id)a4;
- (NSArray)memoryCategorySubcategories;
- (NSSet)uniqueMemoryIdentifiers;
- (PGGraphFeatureNodeCollection)featureNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (id)subsetWithMemoryCategories:(id)a3;
- (id)subsetWithMemoryCategory:(unint64_t)a3;
- (void)enumerateMemoryCategorySubcategoriesUsingBlock:(id)a3;
- (void)enumerateMemoryUniqueIdentifierUsingBlock:(id)a3;
@end

@implementation PGGraphMemoryNodeCollection

- (void)enumerateMemoryUniqueIdentifierUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PGGraphMemoryNodeCollection_enumerateMemoryUniqueIdentifierUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"memid" withBlock:v6];
}

uint64_t __73__PGGraphMemoryNodeCollection_enumerateMemoryUniqueIdentifierUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateMemoryCategorySubcategoriesUsingBlock:(id)a3
{
}

- (id)subsetWithMemoryCategories:(id)a3
{
  id v4 = +[PGGraphMemoryNode filterWithMemoryCategories:a3];
  id v5 = [v4 relation];
  v6 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v5];

  return v6;
}

- (id)subsetWithMemoryCategory:(unint64_t)a3
{
  id v4 = +[PGGraphMemoryNode filterWithMemoryCategory:a3];
  id v5 = objc_opt_class();
  v6 = [v4 relation];
  id v7 = [v5 nodesRelatedToNodes:self withRelation:v6];

  return v7;
}

- (NSArray)memoryCategorySubcategories
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PGGraphMemoryNodeCollection_memoryCategorySubcategories__block_invoke;
  v6[3] = &unk_1E68EA838;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"subcategory" withBlock:v6];

  return (NSArray *)v4;
}

void __58__PGGraphMemoryNodeCollection_memoryCategorySubcategories__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (NSSet)uniqueMemoryIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphMemoryNodeCollection_uniqueMemoryIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"memid" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __54__PGGraphMemoryNodeCollection_uniqueMemoryIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphMemoryNode momentOfMemory];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  id v3 = +[PGGraphMemoryNode featureOfMemory];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphFeatureNodeCollection *)v4;
}

+ (id)memoryNodesWithUniqueIdentifierArray:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMemoryNode filterWithUniqueMemoryIdentifierArray:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)memoryNodesWithUniqueIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMemoryNode filterWithUniqueMemoryIdentifiers:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)memoryNodeAsCollectionWithUniqueIdentifier:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMemoryNode filterWithUniqueMemoryIdentifier:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)memoryNodesOfCategories:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMemoryNode filterWithMemoryCategories:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)memoryNodesOfCategory:(unint64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphMemoryNode filterWithMemoryCategory:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end