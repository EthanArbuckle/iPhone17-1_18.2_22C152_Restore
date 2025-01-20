@interface PGMeaningCriteriaMomentNodeCache
- (BOOL)happensAtFrequentLocation;
- (BOOL)happensPartiallyAtMyHome;
- (BOOL)happensPartiallyAtMyHomeOrWork;
- (BOOL)happensPartiallyAtMyWork;
- (BOOL)hasAddressNodes;
- (NSArray)sceneEdges;
- (NSSet)personNodes;
- (NSSet)poiNodes;
- (NSSet)preciseAddressNodes;
- (NSSet)preciseAreaNodes;
- (NSSet)roiNodes;
- (NSSet)specialPOINodes;
- (PGGraphPublicEventCategoryNodeCollection)publicEventCategoryNodes;
- (PGMeaningCriteriaMomentNodeCache)initWithMomentNode:(id)a3;
- (id)preciseAddressNodeCollection;
- (unint64_t)partsOfDay;
- (unint64_t)significantPartsOfDay;
- (void)_computeHomeWork;
- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3;
- (void)setSceneEdges:(id)a3;
@end

@implementation PGMeaningCriteriaMomentNodeCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoryNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_specialPOINodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_preciseAreaNodes, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodeCollection, 0);
  objc_storeStrong((id *)&self->_meNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_momentNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_sceneEdges, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
}

- (void)setSceneEdges:(id)a3
{
}

- (NSArray)sceneEdges
{
  return self->_sceneEdges;
}

- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  sceneEdges = self->_sceneEdges;
  if (!sceneEdges)
  {
    v6 = +[PGGraphEdgeCollection edgesFromNodes:self->_momentNodeAsCollection];
    v7 = [v6 array];
    v8 = self->_sceneEdges;
    self->_sceneEdges = v7;

    sceneEdges = self->_sceneEdges;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = sceneEdges;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      v15 = [v14 oppositeNode:self->_momentNode];
      unsigned __int8 v16 = 0;
      v4[2](v4, v14, v15, &v16);
      LODWORD(v14) = v16;

      if (v14) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (PGGraphPublicEventCategoryNodeCollection)publicEventCategoryNodes
{
  publicEventCategoryNodes = self->_publicEventCategoryNodes;
  if (!publicEventCategoryNodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection publicEventNodes];
    v5 = [v4 categoryNodes];
    v6 = self->_publicEventCategoryNodes;
    self->_publicEventCategoryNodes = v5;

    publicEventCategoryNodes = self->_publicEventCategoryNodes;
  }
  return publicEventCategoryNodes;
}

- (NSSet)roiNodes
{
  roiNodes = self->_roiNodes;
  if (!roiNodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection roiNodes];
    v5 = [v4 set];
    v6 = self->_roiNodes;
    self->_roiNodes = v5;

    roiNodes = self->_roiNodes;
  }
  return roiNodes;
}

- (NSSet)specialPOINodes
{
  specialPOINodes = self->_specialPOINodes;
  if (!specialPOINodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection specialPOINodes];
    v5 = [v4 set];
    v6 = self->_specialPOINodes;
    self->_specialPOINodes = v5;

    specialPOINodes = self->_specialPOINodes;
  }
  return specialPOINodes;
}

- (NSSet)poiNodes
{
  poiNodes = self->_poiNodes;
  if (!poiNodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection poiNodes];
    v5 = [v4 set];
    v6 = self->_poiNodes;
    self->_poiNodes = v5;

    poiNodes = self->_poiNodes;
  }
  return poiNodes;
}

- (NSSet)preciseAreaNodes
{
  preciseAreaNodes = self->_preciseAreaNodes;
  if (!preciseAreaNodes)
  {
    v4 = [(PGMeaningCriteriaMomentNodeCache *)self preciseAddressNodeCollection];
    v5 = [v4 areaNodes];
    v6 = [v5 set];
    v7 = self->_preciseAreaNodes;
    self->_preciseAreaNodes = v6;

    preciseAreaNodes = self->_preciseAreaNodes;
  }
  return preciseAreaNodes;
}

- (NSSet)preciseAddressNodes
{
  preciseAddressNodes = self->_preciseAddressNodes;
  if (!preciseAddressNodes)
  {
    v4 = [(PGMeaningCriteriaMomentNodeCache *)self preciseAddressNodeCollection];
    v5 = [v4 set];
    v6 = self->_preciseAddressNodes;
    self->_preciseAddressNodes = v5;

    preciseAddressNodes = self->_preciseAddressNodes;
  }
  return preciseAddressNodes;
}

- (NSSet)personNodes
{
  personNodes = self->_personNodes;
  if (!personNodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection personNodes];
    v5 = [v4 set];
    v6 = self->_personNodes;
    self->_personNodes = v5;

    personNodes = self->_personNodes;
  }
  return personNodes;
}

- (unint64_t)significantPartsOfDay
{
  unint64_t result = self->_significantPartsOfDay;
  if (!result)
  {
    unint64_t result = [(PGGraphMomentNode *)self->_momentNode significantPartsOfDay];
    self->_significantPartsOfDay = result;
  }
  return result;
}

- (unint64_t)partsOfDay
{
  unint64_t result = self->_partsOfDay;
  if (!result)
  {
    unint64_t result = [(PGGraphMomentNode *)self->_momentNode partsOfDay];
    self->_partsOfDay = result;
  }
  return result;
}

- (BOOL)happensPartiallyAtMyHomeOrWork
{
  if ([(PGMeaningCriteriaMomentNodeCache *)self happensPartiallyAtMyHome]) {
    return 1;
  }
  return [(PGMeaningCriteriaMomentNodeCache *)self happensPartiallyAtMyWork];
}

- (BOOL)happensAtFrequentLocation
{
  char happensAtFrequentLocation = self->_happensAtFrequentLocation;
  if (!happensAtFrequentLocation)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection frequentLocationNodes];
    uint64_t v5 = [v4 count];

    if (v5) {
      char happensAtFrequentLocation = 2;
    }
    else {
      char happensAtFrequentLocation = 1;
    }
    self->_char happensAtFrequentLocation = happensAtFrequentLocation;
  }
  return happensAtFrequentLocation == 2;
}

- (BOOL)happensPartiallyAtMyWork
{
  int happensPartiallyAtMyWork = self->_happensPartiallyAtMyWork;
  if (!self->_happensPartiallyAtMyWork)
  {
    [(PGMeaningCriteriaMomentNodeCache *)self _computeHomeWork];
    int happensPartiallyAtMyWork = self->_happensPartiallyAtMyWork;
  }
  return happensPartiallyAtMyWork == 2;
}

- (BOOL)happensPartiallyAtMyHome
{
  int happensPartiallyAtMyHome = self->_happensPartiallyAtMyHome;
  if (!self->_happensPartiallyAtMyHome)
  {
    [(PGMeaningCriteriaMomentNodeCache *)self _computeHomeWork];
    int happensPartiallyAtMyHome = self->_happensPartiallyAtMyHome;
  }
  return happensPartiallyAtMyHome == 2;
}

- (void)_computeHomeWork
{
  id v11 = [(PGMeaningCriteriaMomentNodeCache *)self preciseAddressNodeCollection];
  v3 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection homeNodes];
  v4 = [v3 addressNodes];
  int v5 = [v11 intersectsCollection:v4];

  if (v5) {
    char v6 = 2;
  }
  else {
    char v6 = 1;
  }
  self->_int happensPartiallyAtMyHome = v6;
  v7 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection workNodes];
  v8 = [v7 addressNodes];
  int v9 = [v11 intersectsCollection:v8];

  if (v9) {
    char v10 = 2;
  }
  else {
    char v10 = 1;
  }
  self->_int happensPartiallyAtMyWork = v10;
}

- (BOOL)hasAddressNodes
{
  char hasAddressNodes = self->_hasAddressNodes;
  if (!hasAddressNodes)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection addressNodes];
    uint64_t v5 = [v4 count];

    if (v5) {
      char hasAddressNodes = 2;
    }
    else {
      char hasAddressNodes = 1;
    }
    self->_char hasAddressNodes = hasAddressNodes;
  }
  return hasAddressNodes == 2;
}

- (id)preciseAddressNodeCollection
{
  preciseAddressNodeCollection = self->_preciseAddressNodeCollection;
  if (!preciseAddressNodeCollection)
  {
    v4 = [(PGGraphMomentNodeCollection *)self->_momentNodeAsCollection preciseAddressNodes];
    uint64_t v5 = self->_preciseAddressNodeCollection;
    self->_preciseAddressNodeCollection = v4;

    preciseAddressNodeCollection = self->_preciseAddressNodeCollection;
  }
  return preciseAddressNodeCollection;
}

- (PGMeaningCriteriaMomentNodeCache)initWithMomentNode:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGMeaningCriteriaMomentNodeCache;
  char v6 = [(PGMeaningCriteriaMomentNodeCache *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_momentNode, a3);
    uint64_t v8 = [(PGGraphMomentNode *)v7->_momentNode collection];
    momentNodeAsCollection = v7->_momentNodeAsCollection;
    v7->_momentNodeAsCollection = (PGGraphMomentNodeCollection *)v8;

    char v10 = [(MANode *)v7->_momentNode graph];
    uint64_t v11 = +[PGGraphNodeCollection nodesInGraph:v10];
    meNodeAsCollection = v7->_meNodeAsCollection;
    v7->_meNodeAsCollection = (PGGraphMeNodeCollection *)v11;
  }
  return v7;
}

@end