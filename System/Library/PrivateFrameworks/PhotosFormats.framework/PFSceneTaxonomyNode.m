@interface PFSceneTaxonomyNode
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isRoot;
- (NSSet)children;
- (NSSet)detectors;
- (NSSet)parents;
- (NSString)name;
- (PFSceneTaxonomy)taxonomy;
- (PFSceneTaxonomyNode)initWithNodeRef:(void *)a3 taxonomy:(id)a4;
- (double)f0point5Threshold;
- (double)f1Threshold;
- (double)f2Threshold;
- (double)graphHighPrecisionThreshold;
- (double)graphHighRecallThreshold;
- (double)highPrecisionThreshold;
- (double)highRecallThreshold;
- (double)precision0point6Threshold;
- (double)searchThreshold;
- (id)description;
- (id)localizedLabel;
- (id)localizedSynonyms;
- (unint64_t)extendedSceneClassId;
- (unint64_t)hash;
- (unint64_t)networkId;
- (unsigned)sceneClassId;
- (void)traverse:(int64_t)a3 visitor:(id)a4;
@end

@implementation PFSceneTaxonomyNode

- (void).cxx_destruct
{
}

- (PFSceneTaxonomy)taxonomy
{
  return (PFSceneTaxonomy *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  return PFSceneTaxonomyNodeDescription((uint64_t *)self->_nodeRef, self->_taxonomy);
}

- (unint64_t)hash
{
  nodeRef = (uint64_t *)self->_nodeRef;
  uint64_t v3 = *nodeRef;
  uint64_t v4 = nodeRef[9];
  v5 = (char *)nodeRef + v4 + 72;
  if (v4 == 1) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  return boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()(v6) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PFSceneTaxonomyNode *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PFSceneTaxonomyNode *)self isEqualToNode:v4];
  }

  return v5;
}

- (BOOL)isEqualToNode:(id)a3
{
  BOOL result = a3
        && ((nodeRef = self->_nodeRef, uint64_t v4 = (void *)*((void *)a3 + 1), nodeRef) ? (v5 = v4 == 0) : (v5 = 1), !v5)
        && *nodeRef == *v4;
  return result;
}

- (id)localizedSynonyms
{
  v2 = PFSceneTaxonomyNodeLocalizedSynonyms((pf::SceneTaxonomyNode *)self->_nodeRef, self->_taxonomy);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)localizedLabel
{
  return PFSceneTaxonomyNodeLocalizedLabel((pf::SceneTaxonomyNode *)self->_nodeRef, self->_taxonomy);
}

- (void)traverse:(int64_t)a3 visitor:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 1)
  {
    nodeRef = self->_nodeRef;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke_2;
    v11[3] = &unk_1E5B2E298;
    v11[4] = self;
    id v12 = v6;
    PFSceneTaxonomyNodeTraverseChildren((uint64_t)nodeRef, v11);
    v9 = v12;
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid PFSceneTaxonomyNodeTraversal passed: %lu", a3);
      goto LABEL_7;
    }
    v8 = self->_nodeRef;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke;
    v13[3] = &unk_1E5B2E298;
    v13[4] = self;
    id v14 = v6;
    PFSceneTaxonomyNodeTraverseParents((uint64_t)v8, v13);
    v9 = v14;
  }

LABEL_7:
}

uint64_t __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:a2 taxonomy:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v4;
}

uint64_t __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:a2 taxonomy:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v4;
}

- (NSSet)detectors
{
  uint64_t v3 = PFSceneTaxonomyNodeDetectorsCount((uint64_t)self->_nodeRef);
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v3];
    nodeRef = self->_nodeRef;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__PFSceneTaxonomyNode_detectors__block_invoke;
    v10[3] = &unk_1E5B2E270;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;
    PFSceneTaxonomyNodeVisitDetectors((uint64_t)nodeRef, v10);
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return (NSSet *)v8;
}

uint64_t __32__PFSceneTaxonomyNode_detectors__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:a2 taxonomy:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(a1 + 40) addObject:v3];

  return 0;
}

- (NSSet)children
{
  uint64_t v3 = PFSceneTaxonomyNodeChildrenCount((uint64_t)self->_nodeRef);
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v3];
    nodeRef = self->_nodeRef;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__PFSceneTaxonomyNode_children__block_invoke;
    v10[3] = &unk_1E5B2E270;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;
    PFSceneTaxonomyNodeVisitChildren((uint64_t)nodeRef, v10);
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return (NSSet *)v8;
}

uint64_t __31__PFSceneTaxonomyNode_children__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:a2 taxonomy:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(a1 + 40) addObject:v3];

  return 0;
}

- (NSSet)parents
{
  uint64_t v3 = PFSceneTaxonomyNodeParentsCount((uint64_t)self->_nodeRef);
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v3];
    nodeRef = self->_nodeRef;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__PFSceneTaxonomyNode_parents__block_invoke;
    v10[3] = &unk_1E5B2E270;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;
    PFSceneTaxonomyNodeVisitParents((uint64_t)nodeRef, v10);
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return (NSSet *)v8;
}

uint64_t __30__PFSceneTaxonomyNode_parents__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PFSceneTaxonomyNode alloc] initWithNodeRef:a2 taxonomy:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(a1 + 40) addObject:v3];

  return 0;
}

- (double)graphHighRecallThreshold
{
  return PFSceneTaxonomyNodeGraphHighRecallThreshold((double *)self->_nodeRef);
}

- (double)graphHighPrecisionThreshold
{
  return PFSceneTaxonomyNodeGraphHighPrecisionThreshold((uint64_t)self->_nodeRef);
}

- (double)f2Threshold
{
  return PFSceneTaxonomyNodeF2Threshold((uint64_t)self->_nodeRef);
}

- (double)f1Threshold
{
  return PFSceneTaxonomyNodeF1Threshold((uint64_t)self->_nodeRef);
}

- (double)f0point5Threshold
{
  return PFSceneTaxonomyNodeF0Point5Threshold((uint64_t)self->_nodeRef);
}

- (double)precision0point6Threshold
{
  return PFSceneTaxonomyNodePrecision0Point6Threshold((uint64_t)self->_nodeRef);
}

- (double)highPrecisionThreshold
{
  return PFSceneTaxonomyNodeHighPrecisionThreshold((uint64_t)self->_nodeRef);
}

- (double)highRecallThreshold
{
  return PFSceneTaxonomyNodeHighRecallThreshold((uint64_t)self->_nodeRef);
}

- (double)searchThreshold
{
  return PFSceneTaxonomyNodeSearchThreshold((uint64_t)self->_nodeRef);
}

- (BOOL)isIndexed
{
  return PFSceneTaxonomyNodeIsIndexed((uint64_t)self->_nodeRef);
}

- (unint64_t)networkId
{
  return PFSceneTaxonomyNodeNetworkId((uint64_t)self->_nodeRef);
}

- (unint64_t)extendedSceneClassId
{
  return PFSceneTaxonomyNodeExtendedSceneClassId((uint64_t)self->_nodeRef);
}

- (unsigned)sceneClassId
{
  if ([(PFSceneTaxonomyNode *)self extendedSceneClassId] >> 32) {
    return 0;
  }
  else {
    return [(PFSceneTaxonomyNode *)self extendedSceneClassId];
  }
}

- (NSString)name
{
  return (NSString *)PFSceneTaxonomyNodeName((uint64_t)self->_nodeRef);
}

- (BOOL)isRoot
{
  return PFSceneTaxonomyNodeIsRoot((pf::SceneTaxonomyNode *)self->_nodeRef);
}

- (PFSceneTaxonomyNode)initWithNodeRef:(void *)a3 taxonomy:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)PFSceneTaxonomyNode;
    id v8 = [(PFSceneTaxonomyNode *)&v11 init];
    v9 = v8;
    if (v8)
    {
      v8->_nodeRef = a3;
      objc_storeStrong((id *)&v8->_taxonomy, a4);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

@end