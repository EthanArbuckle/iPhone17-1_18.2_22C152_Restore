@interface PGMeaningfulEventProcessorCache
- (PGGraphMomentNodeCollection)momentNodes;
- (PGMeaningfulEventProcessorCache)initWithMomentNodes:(id)a3;
- (id)addressNodesForMomentNodes:(id)a3;
- (id)dateNodesForMomentNodes:(id)a3;
- (id)mobilityNodesForMomentNodes:(id)a3;
- (id)peopleNodesForMomentNodes:(id)a3;
- (id)poiNodesWithNonzeroConfidenceForMomentNodes:(id)a3;
- (id)preciseAddressNodesForMomentNodes:(id)a3;
- (id)publicEventCategoryNodesForMomentNodes:(id)a3;
- (id)reliableSceneNodesForMomentNodes:(id)a3;
- (id)roiNodesWithNonzeroConfidenceForMomentNodes:(id)a3;
- (id)sceneNodesForMomentNodes:(id)a3;
- (id)socialGroupNodesForMomentNodes:(id)a3;
- (unint64_t)partsOfDayForMomentNodes:(id)a3;
- (unint64_t)significantPartsOfDayForMomentNodes:(id)a3;
@end

@implementation PGMeaningfulEventProcessorCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_mobilityNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_significantPartOfDayNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_partOfDayNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_publicEventCategoryNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_socialGroupNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_personNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_dateNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_addressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_roiNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_poiNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_reliableSceneNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_sceneNodesByMomentNode, 0);
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (id)mobilityNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mobilityNodesByMomentNode = self->_mobilityNodesByMomentNode;
  if (!mobilityNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode mobilityOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_mobilityNodesByMomentNode;
    self->_mobilityNodesByMomentNode = v10;

    mobilityNodesByMomentNode = self->_mobilityNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)mobilityNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (unint64_t)significantPartsOfDayForMomentNodes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  significantPartOfDayNodesByMomentNode = self->_significantPartOfDayNodesByMomentNode;
  if (!significantPartOfDayNodesByMomentNode)
  {
    v7 = [v4 graph];
    BOOL v8 = (unint64_t)([v7 version] - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v11 = +[PGGraphMomentNode significantPartOfDayOfMomentWithHasLegacyWeights:v8];
    v12 = [v9 adjacencyWithSources:momentNodes relation:v11 targetsClass:objc_opt_class()];
    v13 = self->_significantPartOfDayNodesByMomentNode;
    self->_significantPartOfDayNodesByMomentNode = v12;

    significantPartOfDayNodesByMomentNode = self->_significantPartOfDayNodesByMomentNode;
  }
  v14 = [(MABinaryAdjacency *)significantPartOfDayNodesByMomentNode targetsForSources:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = objc_msgSend(v14, "partsOfDay", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    unint64_t v19 = 1;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v19 |= [*(id *)(*((void *)&v22 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
  else
  {
    unint64_t v19 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v19;
}

- (unint64_t)partsOfDayForMomentNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  partOfDayNodesByMomentNode = self->_partOfDayNodesByMomentNode;
  if (!partOfDayNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode partOfDayOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_partOfDayNodesByMomentNode;
    self->_partOfDayNodesByMomentNode = v10;

    partOfDayNodesByMomentNode = self->_partOfDayNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)partOfDayNodesByMomentNode targetsForSources:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = objc_msgSend(v12, "partsOfDay", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    unint64_t v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v17 |= [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
  else
  {
    unint64_t v17 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v17;
}

- (id)publicEventCategoryNodesForMomentNodes:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  publicEventCategoryNodesByMomentNode = self->_publicEventCategoryNodesByMomentNode;
  if (!publicEventCategoryNodesByMomentNode)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F71E90]);
    BOOL v8 = +[PGGraphMomentNode publicEventOfMoment];
    v16[0] = v8;
    v9 = +[PGGraphPublicEventNode categoryOfPublicEvent];
    v16[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v11 = (void *)[v7 initWithSteps:v10];

    v12 = [MEMORY[0x1E4F71E88] adjacencyWithSources:self->_momentNodes relation:v11 targetsClass:objc_opt_class()];
    v13 = self->_publicEventCategoryNodesByMomentNode;
    self->_publicEventCategoryNodesByMomentNode = v12;

    publicEventCategoryNodesByMomentNode = self->_publicEventCategoryNodesByMomentNode;
  }
  uint64_t v14 = [(MABinaryAdjacency *)publicEventCategoryNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)socialGroupNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  socialGroupNodesByMomentNode = self->_socialGroupNodesByMomentNode;
  if (!socialGroupNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode socialGroupInMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_socialGroupNodesByMomentNode;
    self->_socialGroupNodesByMomentNode = v10;

    socialGroupNodesByMomentNode = self->_socialGroupNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)socialGroupNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)peopleNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  personNodesByMomentNode = self->_personNodesByMomentNode;
  if (!personNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode personInMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_personNodesByMomentNode;
    self->_personNodesByMomentNode = v10;

    personNodesByMomentNode = self->_personNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)personNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)dateNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dateNodesByMomentNode = self->_dateNodesByMomentNode;
  if (!dateNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode dateOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_dateNodesByMomentNode;
    self->_dateNodesByMomentNode = v10;

    dateNodesByMomentNode = self->_dateNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)dateNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)preciseAddressNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preciseAddressNodesByMomentNode = self->_preciseAddressNodesByMomentNode;
  if (!preciseAddressNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode preciseAddressOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_preciseAddressNodesByMomentNode;
    self->_preciseAddressNodesByMomentNode = v10;

    preciseAddressNodesByMomentNode = self->_preciseAddressNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)preciseAddressNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)addressNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  addressNodesByMomentNode = self->_addressNodesByMomentNode;
  if (!addressNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode addressOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_addressNodesByMomentNode;
    self->_addressNodesByMomentNode = v10;

    addressNodesByMomentNode = self->_addressNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)addressNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)roiNodesWithNonzeroConfidenceForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  roiNodesByMomentNode = self->_roiNodesByMomentNode;
  if (!roiNodesByMomentNode)
  {
    id v7 = [v4 graph];
    BOOL v8 = (unint64_t)([v7 version] - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v11 = +[PGGraphMomentNode roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:v8];
    v12 = [v9 adjacencyWithSources:momentNodes relation:v11 targetsClass:objc_opt_class()];
    v13 = self->_roiNodesByMomentNode;
    self->_roiNodesByMomentNode = v12;

    roiNodesByMomentNode = self->_roiNodesByMomentNode;
  }
  uint64_t v14 = [(MABinaryAdjacency *)roiNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)poiNodesWithNonzeroConfidenceForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  poiNodesByMomentNode = self->_poiNodesByMomentNode;
  if (!poiNodesByMomentNode)
  {
    id v7 = [v4 graph];
    BOOL v8 = (unint64_t)([v7 version] - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v11 = +[PGGraphMomentNode poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:v8];
    v12 = [v9 adjacencyWithSources:momentNodes relation:v11 targetsClass:objc_opt_class()];
    v13 = self->_poiNodesByMomentNode;
    self->_poiNodesByMomentNode = v12;

    poiNodesByMomentNode = self->_poiNodesByMomentNode;
  }
  uint64_t v14 = [(MABinaryAdjacency *)poiNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)reliableSceneNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  reliableSceneNodesByMomentNode = self->_reliableSceneNodesByMomentNode;
  if (!reliableSceneNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode reliableSceneOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_reliableSceneNodesByMomentNode;
    self->_reliableSceneNodesByMomentNode = v10;

    reliableSceneNodesByMomentNode = self->_reliableSceneNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)reliableSceneNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)sceneNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sceneNodesByMomentNode = self->_sceneNodesByMomentNode;
  if (!sceneNodesByMomentNode)
  {
    id v7 = (void *)MEMORY[0x1E4F71E88];
    momentNodes = self->_momentNodes;
    v9 = +[PGGraphMomentNode sceneOfMoment];
    v10 = [v7 adjacencyWithSources:momentNodes relation:v9 targetsClass:objc_opt_class()];
    v11 = self->_sceneNodesByMomentNode;
    self->_sceneNodesByMomentNode = v10;

    sceneNodesByMomentNode = self->_sceneNodesByMomentNode;
  }
  v12 = [(MABinaryAdjacency *)sceneNodesByMomentNode targetsForSources:v4];
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (PGMeaningfulEventProcessorCache)initWithMomentNodes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMeaningfulEventProcessorCache;
  v6 = [(PGMeaningfulEventProcessorCache *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_momentNodes, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

@end