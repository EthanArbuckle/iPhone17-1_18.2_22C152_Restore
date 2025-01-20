@interface PGGraphPublicEventNodeCollection
+ (Class)nodeClass;
+ (id)publicEventNodesWithCategories:(id)a3 inGraph:(id)a4;
- (NSSet)eventNames;
- (PGGraphBusinessNodeCollection)businessNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPerformerNodeCollection)performerNodes;
- (PGGraphPublicEventCategoryNodeCollection)categoryNodes;
@end

@implementation PGGraphPublicEventNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (NSSet)eventNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphPublicEventNodeCollection_eventNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

void __46__PGGraphPublicEventNodeCollection_eventNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphBusinessNodeCollection)businessNodes
{
  id v3 = +[PGGraphPublicEventNode businessOfPublicEvent];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphBusinessNodeCollection *)v4;
}

- (PGGraphPerformerNodeCollection)performerNodes
{
  id v3 = +[PGGraphPublicEventNode performerOfPublicEvent];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPerformerNodeCollection *)v4;
}

- (PGGraphPublicEventCategoryNodeCollection)categoryNodes
{
  id v3 = +[PGGraphPublicEventNode categoryOfPublicEvent];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPublicEventCategoryNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphPublicEventNode momentOfPublicEvent];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)publicEventNodesWithCategories:(id)a3 inGraph:(id)a4
{
  id v4 = +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategories:a3 inGraph:a4];
  v5 = [v4 publicEventNodes];

  return v5;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end