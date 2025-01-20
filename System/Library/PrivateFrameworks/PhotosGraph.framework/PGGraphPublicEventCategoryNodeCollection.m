@interface PGGraphPublicEventCategoryNodeCollection
+ (Class)nodeClass;
+ (id)publicEventCategoryNodesForCategories:(id)a3 inGraph:(id)a4;
+ (id)publicEventCategoryNodesForCategory:(id)a3 inGraph:(id)a4;
- (PGGraphPublicEventNodeCollection)publicEventNodes;
@end

@implementation PGGraphPublicEventCategoryNodeCollection

- (PGGraphPublicEventNodeCollection)publicEventNodes
{
  v3 = +[PGGraphPublicEventCategoryNode publicEventOfCategory];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPublicEventNodeCollection *)v4;
}

+ (id)publicEventCategoryNodesForCategories:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphPublicEventCategoryNode filterWithCategories:a3];
  v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)publicEventCategoryNodesForCategory:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphPublicEventCategoryNode filterWithCategory:a3];
  v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end