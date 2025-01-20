@interface PGGraphSeasonNodeCollection
+ (Class)nodeClass;
+ (id)seasonNodesForSeasonName:(id)a3 inGraph:(id)a4;
- (NSSet)names;
- (PGGraphDateNodeCollection)dateNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (void)enumerateNamesUsingBlock:(id)a3;
@end

@implementation PGGraphSeasonNodeCollection

- (void)enumerateNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphSeasonNodeCollection_enumerateNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];
}

uint64_t __56__PGGraphSeasonNodeCollection_enumerateNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)names
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphSeasonNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __36__PGGraphSeasonNodeCollection_names__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphDateNodeCollection)dateNodes
{
  id v3 = +[PGGraphSeasonNode dateOfSeason];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphDateNodeCollection *)v4;
}

+ (id)seasonNodesForSeasonName:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphSeasonNode filterForSeasonName:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end