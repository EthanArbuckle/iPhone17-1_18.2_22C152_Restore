@interface CLSSceneTaxonomyHierarchy
- (BOOL)nodeExistsForName:(id)a3;
- (id)initForSceneNetOnly:(BOOL)a3;
- (id)nodeForIdentifier:(unint64_t)a3;
- (id)nodeForName:(id)a3;
- (id)rootNode;
@end

@implementation CLSSceneTaxonomyHierarchy

- (void).cxx_destruct
{
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  uint64_t v4 = [(PFSceneTaxonomy *)self->_sceneTaxonomy nodeRefForExtendedSceneClassId:a3];
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1) {
    v5 = 0;
  }
  else {
    v5 = [[CLSSceneTaxonomyHierarchyNode alloc] initWithSceneTaxonomyNodeRef:v4 inSceneTaxonomy:self->_sceneTaxonomy forSceneNetOnly:self->_forSceneNetOnly];
  }
  return v5;
}

- (BOOL)nodeExistsForName:(id)a3
{
  uint64_t v4 = [(PFSceneTaxonomy *)self->_sceneTaxonomy nodeRefForName:a3];
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1) {
    uint64_t v4 = 0;
  }
  return v4 != 0;
}

- (id)nodeForName:(id)a3
{
  uint64_t v4 = [(PFSceneTaxonomy *)self->_sceneTaxonomy nodeRefForName:a3];
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1) {
    v5 = 0;
  }
  else {
    v5 = [[CLSSceneTaxonomyHierarchyNode alloc] initWithSceneTaxonomyNodeRef:v4 inSceneTaxonomy:self->_sceneTaxonomy forSceneNetOnly:self->_forSceneNetOnly];
  }
  return v5;
}

- (id)rootNode
{
  v2 = [[CLSSceneTaxonomyHierarchyNode alloc] initWithSceneTaxonomyNodeRef:[(PFSceneTaxonomy *)self->_sceneTaxonomy rootNodeRef] inSceneTaxonomy:self->_sceneTaxonomy forSceneNetOnly:self->_forSceneNetOnly];
  return v2;
}

- (id)initForSceneNetOnly:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSSceneTaxonomyHierarchy;
  uint64_t v4 = [(CLSSceneTaxonomyHierarchy *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F5DF68]) initWithLatestTaxonomy];
    sceneTaxonomy = v4->_sceneTaxonomy;
    v4->_sceneTaxonomy = (PFSceneTaxonomy *)v5;

    v4->_forSceneNetOnly = a3;
  }
  return v4;
}

@end