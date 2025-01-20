@interface PGGraphUpdateRelatedDetails
- (NSMutableSet)accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
- (NSSet)identifiersForMemoriesRelatedToDeletedMoments;
- (NSSet)identifiersForMomentRelatedToDeletedPersons;
- (NSSet)identifiersForMomentRelatedToUpdatedPersons;
- (PGGraphUpdateRelatedDetails)init;
- (id)_momentNodesFromPersonNodes:(id)a3;
- (void)_accumulateMomentIdentifiersInto:(id)a3 forPersonNodes:(id)a4;
- (void)accumulateDetailsForDeletedMomentNodes:(id)a3;
- (void)accumulateDetailsForDeletedPersonNodes:(id)a3;
- (void)accumulateDetailsForUpdatedPersonNode:(id)a3 personChange:(id)a4;
- (void)setAccumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments:(id)a3;
- (void)setAccumulatedIdentifiersForMomentNodesRelatedToDeletedPersons:(id)a3;
- (void)setAccumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons:(id)a3;
@end

@implementation PGGraphUpdateRelatedDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments, 0);
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons, 0);
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons, 0);
}

- (void)setAccumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments:(id)a3
{
}

- (NSMutableSet)accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments
{
  return self->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
}

- (void)setAccumulatedIdentifiersForMomentNodesRelatedToDeletedPersons:(id)a3
{
}

- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons
{
  return self->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
}

- (void)setAccumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons:(id)a3
{
}

- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons
{
  return self->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
}

- (id)_momentNodesFromPersonNodes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) collection];
        v11 = [v10 momentNodes];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __59__PGGraphUpdateRelatedDetails__momentNodesFromPersonNodes___block_invoke;
        v13[3] = &unk_1E68EF578;
        id v14 = v4;
        [v11 enumerateNodesUsingBlock:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __59__PGGraphUpdateRelatedDetails__momentNodesFromPersonNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_accumulateMomentIdentifiersInto:(id)a3 forPersonNodes:(id)a4
{
  id v5 = a3;
  id v7 = [a4 momentNodes];
  uint64_t v6 = [v7 uuids];
  [v5 unionSet:v6];
}

- (void)accumulateDetailsForDeletedMomentNodes:(id)a3
{
  id v4 = a3;
  id v7 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments];
  id v5 = [v4 memoryNodes];

  uint64_t v6 = [v5 uniqueMemoryIdentifiers];
  [v7 unionSet:v6];
}

- (void)accumulateDetailsForDeletedPersonNodes:(id)a3
{
  id v4 = a3;
  id v7 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons];
  id v5 = [v4 momentNodes];

  uint64_t v6 = [v5 uuids];
  [v7 unionSet:v6];
}

- (void)accumulateDetailsForUpdatedPersonNode:(id)a3 personChange:(id)a4
{
  id v12 = a3;
  uint64_t v6 = [a4 propertyNames];
  if (searchIndexProcessorIsInterestedInChangedPersonProperties_onceToken != -1) {
    dispatch_once(&searchIndexProcessorIsInterestedInChangedPersonProperties_onceToken, &__block_literal_global_27420);
  }
  int v7 = [v6 intersectsSet:searchIndexProcessorIsInterestedInChangedPersonProperties_personPropertiesOfInterest];

  if (v7)
  {
    uint64_t v8 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons];
    v9 = [v12 collection];
    v10 = [v9 momentNodes];
    v11 = [v10 uuids];
    [v8 unionSet:v11];
  }
}

- (NSSet)identifiersForMemoriesRelatedToDeletedMoments
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments];
  id v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)identifiersForMomentRelatedToDeletedPersons
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons];
  id v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (NSSet)identifiersForMomentRelatedToUpdatedPersons
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(PGGraphUpdateRelatedDetails *)self accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons];
  id v4 = [v2 setWithSet:v3];

  return (NSSet *)v4;
}

- (PGGraphUpdateRelatedDetails)init
{
  v10.receiver = self;
  v10.super_class = (Class)PGGraphUpdateRelatedDetails;
  v2 = [(PGGraphUpdateRelatedDetails *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons = v2->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
    v2->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons = v2->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
    v2->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments = v2->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
    v2->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments = (NSMutableSet *)v7;
  }
  return v2;
}

@end