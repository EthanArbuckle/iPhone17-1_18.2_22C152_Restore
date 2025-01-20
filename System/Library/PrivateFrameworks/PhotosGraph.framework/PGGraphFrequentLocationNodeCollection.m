@interface PGGraphFrequentLocationNodeCollection
+ (Class)nodeClass;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphAddressNodeCollection)preciseAddressNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (void)enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4;
- (void)enumerateUniversalEndDatesUsingBlock:(id)a3;
@end

@implementation PGGraphFrequentLocationNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphFrequentLocationNode momentOfFrequentLocation];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F71F18];
  v4 = +[PGGraphFrequentLocationNode addressOfFrequentLocation];
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
  v3 = +[PGGraphFrequentLocationNode addressOfFrequentLocation];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

- (void)enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__PGGraphFrequentLocationNodeCollection_enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending_usingBlock___block_invoke;
  v8[3] = &unk_1E68E8100;
  id v9 = v6;
  id v7 = v6;
  [(MANodeCollection *)self enumerateNodesAsCollectionsSortedByDoublePropertyForName:@"universalEndDate" ascending:v4 usingBlock:v8];
}

uint64_t __122__PGGraphFrequentLocationNodeCollection_enumerateNodesAsCollectionsSortedByUniversalEndDateWithOrderAscending_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PGGraphFrequentLocationNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"universalEndDate" withBlock:v6];
}

void __78__PGGraphFrequentLocationNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end