@interface PGSearchMetadataComputer
- (PGGraph)graph;
- (PGSearchMetadataComputer)initWithGraph:(id)a3;
- (id)_mePersonUUID;
- (id)_suggestableLocalizedSceneNames;
- (id)searchMetadataWithOptions:(id)a3;
@end

@implementation PGSearchMetadataComputer

- (void).cxx_destruct
{
}

- (PGGraph)graph
{
  return (PGGraph *)objc_getProperty(self, a2, 8, 1);
}

void __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 localizedName];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke_2;
    v18[3] = &unk_1E68E8060;
    id v6 = v5;
    id v19 = v6;
    id v20 = a1[4];
    id v21 = a1[5];
    [v3 traverseParentMeaningHierarchyUsingBlock:v18];
    if (a1[4])
    {
      id v7 = a1[5];
      v8 = [v3 label];
      LODWORD(v7) = [v7 containsObject:v8];

      if (v7) {
        [v6 addObject:a1[4]];
      }
    }
    if ([v6 count])
    {
      [a1[6] setObject:v6 forKeyedSubscript:v4];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v9 = objc_msgSend(v3, "localizedSynonyms", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            [a1[6] setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
}

void __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 localizedName];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  if (*(void *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 48);
    v5 = [v6 label];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4) {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }
}

- (id)_suggestableLocalizedSceneNames
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[PGGraphSceneNode suggestableSceneNames];
  v4 = +[PGGraphSceneNodeCollection sceneNodesForSceneNames:v3 inGraph:self->_graph];
  v5 = [v4 localizedSceneNames];
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)_mePersonUUID
{
  v2 = [(PGGraph *)self->_graph meNode];
  id v3 = (void *)MEMORY[0x1E4F391F0];
  v4 = [v2 localIdentifier];
  v5 = [v3 uuidFromLocalIdentifier:v4];

  if ([v5 length]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)searchMetadataWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = [(PGSearchMetadataComputer *)self _mePersonUUID];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F8B6E8]];

  id v6 = [(PGSearchMetadataComputer *)self _suggestableLocalizedSceneNames];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F8B6F0]];

  id v7 = [(PGSearchMetadataComputer *)self _blockedMeaningsByMeaning];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F8B6E0]];

  return v4;
}

- (PGSearchMetadataComputer)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSearchMetadataComputer;
  id v6 = [(PGSearchMetadataComputer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

@end