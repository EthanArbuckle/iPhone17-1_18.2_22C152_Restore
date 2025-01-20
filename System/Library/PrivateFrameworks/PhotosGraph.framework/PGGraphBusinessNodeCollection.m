@interface PGGraphBusinessNodeCollection
+ (Class)nodeClass;
+ (id)businessNodeForBusinessMuid:(unint64_t)a3 inGraph:(id)a4;
+ (id)businessNodesWithCIDINames:(id)a3 inGraph:(id)a4;
+ (id)restaurantBusinessNodesInGraph:(id)a3;
- (NSSet)businessNames;
- (PGGraphBusinessCategoryNodeCollection)categoryNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPublicEventNodeCollection)publicEventNodes;
@end

@implementation PGGraphBusinessNodeCollection

- (NSSet)businessNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphBusinessNodeCollection_businessNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

void __46__PGGraphBusinessNodeCollection_businessNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphBusinessNode momentOfBusiness];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphBusinessCategoryNodeCollection)categoryNodes
{
  id v3 = +[PGGraphBusinessNode categoryOfBusiness];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphBusinessCategoryNodeCollection *)v4;
}

- (PGGraphPublicEventNodeCollection)publicEventNodes
{
  id v3 = +[PGGraphBusinessNode publicEventOfBusiness];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPublicEventNodeCollection *)v4;
}

+ (id)restaurantBusinessNodesInGraph:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = @"Restaurant";
  v11[1] = @"Nightlife";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:2];
  id v7 = [v3 setWithArray:v6];

  v8 = +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategories:v7 inGraph:v5];

  v9 = [v8 businessNodes];

  return v9;
}

+ (id)businessNodesWithCIDINames:(id)a3 inGraph:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PGGraphBusinessNode filter];
  v14 = @"name";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:8 value:v7];

  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = [v8 filterBySettingProperties:v10];

  v12 = [a1 nodesMatchingFilter:v11 inGraph:v6];

  return v12;
}

+ (id)businessNodeForBusinessMuid:(unint64_t)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphBusinessNode filterWithMuid:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end