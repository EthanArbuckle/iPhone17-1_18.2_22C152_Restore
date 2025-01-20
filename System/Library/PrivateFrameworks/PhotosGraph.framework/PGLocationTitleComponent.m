@interface PGLocationTitleComponent
- (BOOL)canMergeWithTitleComponent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)addressNodes;
- (NSString)personName;
- (PGGraphEdge)edge;
- (PGGraphNode)node;
- (PGLocationTitleComponent)init;
- (double)timestampStart;
- (double)weight;
- (unint64_t)hash;
- (unint64_t)type;
- (void)addAddressNode:(id)a3;
- (void)setAddressNodes:(id)a3;
- (void)setEdge:(id)a3;
- (void)setNode:(id)a3;
- (void)setPersonName:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateWithMomentNodes:(id)a3;
@end

@implementation PGLocationTitleComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edge, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_addressNodes, 0);
}

- (void)setPersonName:(id)a3
{
  self->_personName = (NSString *)a3;
}

- (NSString)personName
{
  return self->_personName;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)weight
{
  return self->_weight;
}

- (double)timestampStart
{
  return self->_timestampStart;
}

- (void)setAddressNodes:(id)a3
{
}

- (NSSet)addressNodes
{
  return &self->_addressNodes->super;
}

- (void)setEdge:(id)a3
{
}

- (PGGraphEdge)edge
{
  return self->_edge;
}

- (void)setNode:(id)a3
{
}

- (PGGraphNode)node
{
  return self->_node;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGLocationTitleComponent;
  if ([(PGLocationTitleComponent *)&v10 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    node = self->_node;
    if ((node == (PGGraphNode *)v5[2] || -[MANode isSameNodeAsNode:](node, "isSameNodeAsNode:"))
      && ((edge = self->_edge, edge == (PGGraphEdge *)v5[3]) || -[MAEdge isSameEdgeAsEdge:](edge, "isSameEdgeAsEdge:")))
    {
      char v8 = [(NSMutableSet *)self->_addressNodes isEqual:v5[1]];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MANode *)self->_node hash];
  unint64_t v4 = [(MAEdge *)self->_edge hash] ^ v3;
  return v4 ^ [(NSMutableSet *)self->_addressNodes hash];
}

- (void)updateWithMomentNodes:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v5 = [v4 anyObject];
  v6 = [v5 graph];

  if (v6)
  {
    v7 = [PGGraphAddressNodeCollection alloc];
    char v8 = [(PGLocationTitleComponent *)self addressNodes];
    v9 = [(MAElementCollection *)v7 initWithSet:v8 graph:v6];

    objc_super v10 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v4 graph:v6];
    v11 = +[PGGraphEdgeCollection edgesFromNodes:v10 toNodes:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PGLocationTitleComponent_updateWithMomentNodes___block_invoke;
    v12[3] = &unk_1E68E4BF0;
    v12[4] = &v13;
    v12[5] = &v17;
    [v11 enumerateEdgesUsingBlock:v12];
  }
  *(void *)&self->_timestampStart = v18[3];
  *(void *)&self->_weight = v14[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __50__PGLocationTitleComponent_updateWithMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestampUTCStart];
  double v5 = v4;
  [v3 relevance];
  double v7 = v6;

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v8 + 24) > v5) {
    *(double *)(v8 + 24) = v5;
  }
}

- (BOOL)canMergeWithTitleComponent:(id)a3
{
  double v4 = a3;
  node = self->_node;
  if ((node == (PGGraphNode *)v4[2] || -[MANode isSameNodeAsNode:](node, "isSameNodeAsNode:"))
    && ((edge = self->_edge, edge == (PGGraphEdge *)v4[3]) || -[MAEdge isSameEdgeAsEdge:](edge, "isSameEdgeAsEdge:")))
  {
    char v7 = [(NSMutableSet *)self->_addressNodes isEqual:v4[1]];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)addAddressNode:(id)a3
{
}

- (PGLocationTitleComponent)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGLocationTitleComponent;
  v2 = [(PGLocationTitleComponent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    addressNodes = v2->_addressNodes;
    v2->_addressNodes = (NSMutableSet *)v3;

    v2->_type = 0;
  }
  return v2;
}

@end