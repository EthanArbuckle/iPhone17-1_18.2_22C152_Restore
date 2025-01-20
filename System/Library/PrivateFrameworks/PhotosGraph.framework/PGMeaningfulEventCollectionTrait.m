@interface PGMeaningfulEventCollectionTrait
- (BOOL)isActive;
- (PGGraphNodeCollection)negativeNodes;
- (PGGraphNodeCollection)nodes;
- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3;
- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4;
- (id)additionalMatchingBlock;
- (id)debugDescriptionWithMomentNode:(id)a3;
- (void)setAdditionalMatchingBlock:(id)a3;
@end

@implementation PGMeaningfulEventCollectionTrait

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalMatchingBlock, 0);
  objc_storeStrong((id *)&self->_negativeNodes, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (void)setAdditionalMatchingBlock:(id)a3
{
}

- (id)additionalMatchingBlock
{
  return self->_additionalMatchingBlock;
}

- (PGGraphNodeCollection)negativeNodes
{
  return self->_negativeNodes;
}

- (PGGraphNodeCollection)nodes
{
  return self->_nodes;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke;
  aBlock[3] = &unk_1E68EE070;
  id v17 = v4;
  id v5 = v4;
  v6 = (void (**)(void *, PGGraphNodeCollection *))_Block_copy(aBlock);
  v7 = v6[2](v6, self->_nodes);
  v8 = v6[2](v6, self->_negativeNodes);
  v9 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventCollectionTrait;
  v10 = [(PGMeaningfulEventTrait *)&v15 debugDescriptionWithMomentNode:v5];
  uint64_t v11 = [v8 count];
  v12 = @" ";
  if (!v11) {
    v12 = &stru_1F283BC78;
  }
  v13 = [v9 stringWithFormat:@"%@ %@%@%@", v10, v7, v12, v8];

  return v13;
}

id __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke_2;
  v10[3] = &unk_1E68EE048;
  id v11 = *(id *)(a1 + 32);
  id v6 = v5;
  id v12 = v6;
  [v4 enumerateNodesUsingBlock:v10];

  v7 = v12;
  id v8 = v6;

  return v8;
}

void __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v23 = a2;
  v3 = [*(id *)(a1 + 32) anyEdgeTowardNode:v23];
  if ([v23 domain] == 501 || objc_msgSend(v23, "domain") == 502)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = NSString;
    id v6 = [v23 label];
    [v3 confidence];
    id v8 = [v5 stringWithFormat:@"%@ (%.2f)", v6, v7];
    [v4 addObject:v8];
  }
  else
  {
    v9 = [v23 label];
    int v10 = [v9 isEqualToString:@"Address"];

    if (v10)
    {
      [v23 coordinate];
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      objc_super v15 = *(void **)(a1 + 40);
      v16 = NSString;
      [v3 relevance];
      id v6 = [v16 stringWithFormat:@"{%.8f, %.8f} (%.2f)", v12, v14, v17];
      [v15 addObject:v6];
    }
    else
    {
      id v6 = [v23 name];
      v18 = *(void **)(a1 + 40);
      v19 = NSString;
      uint64_t v20 = [v6 length];
      v21 = v6;
      if (!v20)
      {
        v21 = [v23 label];
      }
      v22 = [v19 stringWithFormat:@"%@", v21];
      [v18 addObject:v22];

      if (!v20) {
    }
      }
  }
}

- (BOOL)isActive
{
  return [(MAElementCollection *)self->_nodes count]
      || [(MAElementCollection *)self->_negativeNodes count] != 0;
}

- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMeaningfulEventCollectionTrait;
  v9 = [(PGMeaningfulEventTrait *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_negativeNodes, a4);
  }

  return v10;
}

- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3
{
  return [(PGMeaningfulEventCollectionTrait *)self initWithNodes:a3 negativeNodes:0];
}

@end