@interface CLSSceneTaxonomyHierarchyNode
- (BOOL)isIndexed;
- (CLSSceneTaxonomyHierarchyNode)initWithSceneTaxonomyNodeRef:(void *)a3 inSceneTaxonomy:(id)a4 forSceneNetOnly:(BOOL)a5;
- (NSSet)localizedSynonyms;
- (NSString)localizedName;
- (NSString)name;
- (unint64_t)identifier;
- (void)traverseChildrenUsingNameBlock:(id)a3;
- (void)visitChildrenUsingNameBlock:(id)a3;
- (void)visitParentsUsingNameBlock:(id)a3;
@end

@implementation CLSSceneTaxonomyHierarchyNode

- (void).cxx_destruct
{
}

- (void)visitParentsUsingNameBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PFSceneTaxonomyNodeVisitParents();
}

uint64_t __60__CLSSceneTaxonomyHierarchyNode_visitParentsUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1) {
    return 0;
  }
  v5 = [NSString stringWithUTF8String:*a3];
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

- (void)visitChildrenUsingNameBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PFSceneTaxonomyNodeVisitChildren();
}

uint64_t __61__CLSSceneTaxonomyHierarchyNode_visitChildrenUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1) {
    return 0;
  }
  v5 = [NSString stringWithUTF8String:*a3];
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

- (void)traverseChildrenUsingNameBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PFSceneTaxonomyNodeTraverseChildren();
}

uint64_t __64__CLSSceneTaxonomyHierarchyNode_traverseChildrenUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1) {
    return 0;
  }
  v5 = [NSString stringWithUTF8String:*a3];
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

- (BOOL)isIndexed
{
  return MEMORY[0x270F53B28](self->_taxonomyNodeRef, a2);
}

- (NSSet)localizedSynonyms
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = PFSceneTaxonomyNodeLocalizedSynonyms();
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSString)localizedName
{
  return (NSString *)PFSceneTaxonomyNodeLocalizedLabel();
}

- (unint64_t)identifier
{
  return MEMORY[0x270F53AF8](self->_taxonomyNodeRef, a2);
}

- (NSString)name
{
  return (NSString *)PFSceneTaxonomyNodeName();
}

- (CLSSceneTaxonomyHierarchyNode)initWithSceneTaxonomyNodeRef:(void *)a3 inSceneTaxonomy:(id)a4 forSceneNetOnly:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLSSceneTaxonomyHierarchyNode;
  v10 = [(CLSSceneTaxonomyHierarchyNode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_taxonomyNodeRef = a3;
    objc_storeStrong((id *)&v10->_sceneTaxonomy, a4);
    v11->_forSceneNetOnly = a5;
  }

  return v11;
}

@end