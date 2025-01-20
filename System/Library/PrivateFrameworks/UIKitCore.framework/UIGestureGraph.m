@interface UIGestureGraph
- (NSSet)edgeLabels;
- (NSSet)nodeLabels;
- (UIGestureGraph)init;
- (id)_allEdges;
- (id)_allNodes;
- (id)_edgesForLabel:(id)a3;
- (id)_nodesForLabel:(id)a3;
- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6;
- (id)addNodeWithLabel:(id)a3;
- (id)addNodeWithLabel:(id)a3 properties:(id)a4;
- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6 properties:(id)a7;
- (id)addUniqueNodeWithLabel:(id)a3 properties:(id)a4;
- (id)description;
- (id)edgesForLabel:(id)a3;
- (id)edgesForLabel:(id)a3 properties:(id)a4;
- (id)nodesForLabel:(id)a3 properties:(id)a4;
- (unint64_t)edgeCount;
- (unint64_t)edgeCountForLabel:(id)a3;
- (unint64_t)nodeCount;
- (unint64_t)nodeCountForLabel:(id)a3;
- (void)_addEdge:(id)a3;
- (void)_addNode:(id)a3;
- (void)enumerateEdgesWithBlock:(id)a3;
- (void)enumerateEdgesWithLabel:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesWithBlock:(id)a3;
- (void)enumerateNodesWithLabel:(id)a3 usingBlock:(id)a4;
- (void)removeAllObjects;
- (void)removeEdge:(id)a3;
- (void)removeEdges:(id)a3;
- (void)removeNode:(id)a3;
- (void)removeNodeEdges:(id)a3;
- (void)removeNodes:(id)a3;
- (void)traverseGraphBreadthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5;
- (void)traverseGraphDepthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5;
@end

@implementation UIGestureGraph

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6 properties:(id)a7
{
  unsigned int v24 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v11 = -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:");
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
      id v17 = [v16 sourceNode];
      if (v17 == a4)
      {
        id v18 = [v16 targetNode];
        if (v18 == a5)
        {
          int v19 = [v16 hasProperties:a7];

          if (v19)
          {
            if ([v16 isDirected] == v24) {
              v21 = v16;
            }
            else {
              v21 = 0;
            }

            goto LABEL_20;
          }
          goto LABEL_10;
        }

        id v17 = a4;
      }

LABEL_10:
      if (v13 == ++v15)
      {
        uint64_t v20 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v13 = v20;
        if (v20) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v21 = [[UIGestureGraphEdge alloc] initWithLabel:a3 sourceNode:a4 targetNode:a5 directed:v24];
  [(UIGestureGraphElement *)v21 setProperties:a7];
  [(UIGestureGraph *)self _addEdge:v21];
LABEL_20:
  return v21;
}

- (id)_edgesForLabel:(id)a3
{
  if (a3) {
    -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
  }
  else {
  v3 = [(UIGestureGraph *)self _allEdges];
  }
  return v3;
}

- (void)removeNode:(id)a3
{
  -[UIGestureGraph removeNodeEdges:](self, "removeNodeEdges:");
  nodesByLabel = self->_nodesByLabel;
  v6 = [a3 label];
  id v8 = [(NSMapTable *)nodesByLabel objectForKey:v6];

  v7 = v8;
  if (v8)
  {
    [v8 removeObject:a3];
    v7 = v8;
  }
}

- (void)removeNodeEdges:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a3, "allEdges", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UIGestureGraph *)self removeEdge:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)addNodeWithLabel:(id)a3 properties:(id)a4
{
  uint64_t v6 = [(UIGestureGraphElement *)[UIGestureGraphNode alloc] initWithLabel:a3];
  [(UIGestureGraphElement *)v6 setProperties:a4];
  [(UIGestureGraph *)self _addNode:v6];
  return v6;
}

- (void)_addNode:(id)a3
{
  nodesByLabel = self->_nodesByLabel;
  uint64_t v6 = [a3 label];
  id v9 = [(NSMapTable *)nodesByLabel objectForKey:v6];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = self->_nodesByLabel;
    uint64_t v8 = [a3 label];
    [(NSMapTable *)v7 setObject:v9 forKey:v8];
  }
  [v9 addObject:a3];
}

- (void)removeEdges:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UIGestureGraph removeEdge:](self, "removeEdge:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeEdge:(id)a3
{
  edgesByLabel = self->_edgesByLabel;
  uint64_t v5 = [a3 label];
  id v8 = [(NSMapTable *)edgesByLabel objectForKey:v5];

  if (v8) {
    [v8 removeObject:a3];
  }
  uint64_t v6 = [a3 sourceNode];
  [v6 _removeEdge:a3];

  if (([a3 isLoop] & 1) == 0)
  {
    uint64_t v7 = [a3 targetNode];
    [v7 _removeEdge:a3];
  }
}

- (void)_addEdge:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 sourceNode];
  [v5 _addEdge:a3];

  if (([a3 isLoop] & 1) == 0)
  {
    uint64_t v6 = [a3 targetNode];
    [v6 _addEdge:a3];
  }
  edgesByLabel = self->_edgesByLabel;
  id v8 = [a3 label];
  long long v9 = [(NSMapTable *)edgesByLabel objectForKey:v8];

  if (!v9)
  {
    long long v9 = [MEMORY[0x1E4F1CA80] set];
    long long v10 = self->_edgesByLabel;
    long long v11 = [a3 label];
    [(NSMapTable *)v10 setObject:v9 forKey:v11];
  }
  [v9 addObject:a3];
  unint64_t v12 = [v9 count];
  if (v12 >= UIGestureGraphEdgeLimit)
  {
    uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Gesture", &_addEdge____s_category) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v13;
      int v15 = 134217984;
      uint64_t v16 = [v9 count];
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Abnormal number of gesture recognizer dependencies: %lu. System performance may be affected. Please investigate reducing gesture recognizers and/or their dependencies.", (uint8_t *)&v15, 0xCu);
    }
    UIGestureGraphEdgeLimit += 50;
  }
}

- (void)traverseGraphDepthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_new();
  id v8 = objc_opt_new();
  char v49 = 0;
  [v7 addObject:a3];
  if ([v7 count])
  {
    v36 = v8;
    id v34 = a5;
    while (1)
    {
      long long v9 = objc_msgSend(v7, "lastObject", v34);
      uint64_t v10 = [v7 count];
      if ([v8 containsObject:v9]) {
        goto LABEL_4;
      }
      int v11 = (*((uint64_t (**)(id, void *, char *))a5 + 2))(a5, v9, &v49);
      if (v49)
      {

        goto LABEL_36;
      }
      int v12 = v11;
      [v8 addObject:v9];
      if (v12) {
        break;
      }
LABEL_33:

      if (![v7 count]) {
        goto LABEL_36;
      }
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v13 = [v9 outEdges];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v45 + 1) + 8 * i) targetNode];
          [v7 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v15);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v19 = [v9 inOutEdges];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v19);
          }
          unsigned int v24 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          long long v25 = [v24 targetNode];
          int v26 = [v9 isEqual:v25];

          if (v26) {
            [v24 sourceNode];
          }
          else {
          long long v27 = [v24 targetNode];
          }
          [v7 addObject:v27];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v21);
    }

    a5 = v34;
    id v8 = v36;
    if (!a4)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v28 = [v9 inEdges];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = [*(id *)(*((void *)&v37 + 1) + 8 * k) sourceNode];
            [v7 addObject:v33];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v30);
      }

      id v8 = v36;
    }
LABEL_4:
    [v7 removeObjectAtIndex:v10 - 1];
    goto LABEL_33;
  }
LABEL_36:
}

- (UIGestureGraph)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIGestureGraph;
  v2 = [(UIGestureGraph *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    nodesByLabel = v2->_nodesByLabel;
    v2->_nodesByLabel = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    edgesByLabel = v2->_edgesByLabel;
    v2->_edgesByLabel = (NSMapTable *)v5;
  }
  return v2;
}

- (id)description
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(UIGestureGraph *)self nodeLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v28 + 1) + 8 * i), -[UIGestureGraph nodeCountForLabel:](self, "nodeCountForLabel:", *(void *)(*((void *)&v28 + 1) + 8 * i))];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  long long v9 = [(UIGestureGraph *)self nodeLabels];
  uint64_t v10 = [v9 count];

  if (v10) {
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v12 = [(UIGestureGraph *)self edgeLabels];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v24 + 1) + 8 * j), -[UIGestureGraph edgeCountForLabel:](self, "edgeCountForLabel:", *(void *)(*((void *)&v24 + 1) + 8 * j))];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(UIGestureGraph *)self edgeLabels];
  uint64_t v18 = [v17 count];

  if (v18) {
    objc_msgSend(v11, "deleteCharactersInRange:", objc_msgSend(v11, "length") - 2, 2);
  }
  int v19 = NSString;
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  uint64_t v22 = [v19 stringWithFormat:@"[%@] nodeCount:[%ld] edgesCount:[%ld]\n\tnodesLabels:[%@]\n\tedgesLabels:[%@]", v21, -[UIGestureGraph nodeCount](self, "nodeCount"), -[UIGestureGraph edgeCount](self, "edgeCount"), v3, v11];

  return v22;
}

- (id)addNodeWithLabel:(id)a3
{
  id v4 = [(UIGestureGraphElement *)[UIGestureGraphNode alloc] initWithLabel:a3];
  [(UIGestureGraph *)self _addNode:v4];
  return v4;
}

- (void)removeNodes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UIGestureGraph removeNode:](self, "removeNode:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)nodeCountForLabel:(id)a3
{
  id v3 = [(UIGestureGraph *)self _nodesForLabel:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)nodesForLabel:(id)a3 properties:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIGestureGraph *)self _nodesForLabel:a3];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasProperties:", a4, (void)v15)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithSet:v6];

  return v13;
}

- (id)addUniqueNodeWithLabel:(id)a3 properties:(id)a4
{
  id v7 = -[UIGestureGraph nodesForLabel:properties:](self, "nodesForLabel:properties:");
  if ([v7 count] == 1)
  {
    uint64_t v8 = [v7 anyObject];
  }
  else if ([v7 count])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(UIGestureGraphElement *)[UIGestureGraphNode alloc] initWithLabel:a3];
    [(UIGestureGraphElement *)v8 setProperties:a4];
    [(UIGestureGraph *)self _addNode:v8];
  }

  return v8;
}

- (unint64_t)nodeCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_nodesByLabel objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSSet)nodeLabels
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = NSAllMapTableKeys(self->_nodesByLabel);
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (void)enumerateNodesWithLabel:(id)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v17 = 0;
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(UIGestureGraph *)self _nodesForLabel:a3];
  id v7 = [v5 setWithSet:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      (*((void (**)(id, void, char *))a4 + 2))(a4, *(void *)(*((void *)&v13 + 1) + 8 * v12), &v17);
      if (v17) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateNodesWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = NSAllMapTableValues(self->_nodesByLabel);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    unint64_t v8 = 0x1E4F1C000uLL;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = v8;
        uint64_t v11 = [*(id *)(v8 + 2768) setWithSet:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v18 + 1) + 8 * j), &v26);
              if (v26)
              {

                goto LABEL_18;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        unint64_t v8 = v10;
        uint64_t v7 = v17;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v6);
  }
LABEL_18:
}

- (id)_allNodes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = NSAllMapTableValues(self->_nodesByLabel);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_nodesForLabel:(id)a3
{
  if (a3) {
    -[NSMapTable objectForKey:](self->_nodesByLabel, "objectForKey:");
  }
  else {
  uint64_t v3 = [(UIGestureGraph *)self _allNodes];
  }
  return v3;
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6
{
  uint64_t v7 = [[UIGestureGraphEdge alloc] initWithLabel:a3 sourceNode:a4 targetNode:a5 directed:a6];
  [(UIGestureGraph *)self _addEdge:v7];
  return v7;
}

- (id)edgesForLabel:(id)a3
{
  uint64_t v3 = [(UIGestureGraph *)self _edgesForLabel:a3];
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return v4;
}

- (id)edgesForLabel:(id)a3 properties:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIGestureGraph *)self _edgesForLabel:a3];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasProperties:", a4, (void)v15)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  long long v13 = [MEMORY[0x1E4F1CAD0] setWithSet:v6];

  return v13;
}

- (unint64_t)edgeCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_edgesByLabel objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)edgeCountForLabel:(id)a3
{
  uint64_t v3 = [(UIGestureGraph *)self _edgesForLabel:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (NSSet)edgeLabels
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = NSAllMapTableKeys(self->_edgesByLabel);
  unint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (void)enumerateEdgesWithLabel:(id)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v17 = 0;
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(UIGestureGraph *)self _edgesForLabel:a3];
  id v7 = [v5 setWithSet:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      (*((void (**)(id, void, char *))a4 + 2))(a4, *(void *)(*((void *)&v13 + 1) + 8 * v12), &v17);
      if (v17) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEdgesWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v4 = NSAllMapTableValues(self->_edgesByLabel);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    unint64_t v8 = 0x1E4F1C000uLL;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = v8;
        uint64_t v11 = [*(id *)(v8 + 2768) setWithSet:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v18 + 1) + 8 * j), &v26);
              if (v26)
              {

                goto LABEL_18;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        unint64_t v8 = v10;
        uint64_t v7 = v17;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v6);
  }
LABEL_18:
}

- (id)_allEdges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = NSAllMapTableValues(self->_edgesByLabel);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)removeAllObjects
{
  [(NSMapTable *)self->_nodesByLabel removeAllObjects];
  edgesByLabel = self->_edgesByLabel;
  [(NSMapTable *)edgesByLabel removeAllObjects];
}

- (void)traverseGraphBreadthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  char v46 = 0;
  [v6 addObject:a3];
  if ([v6 count])
  {
    while (1)
    {
      unint64_t v8 = [v6 firstObject];
      if ([v7 containsObject:v8]) {
        goto LABEL_3;
      }
      int v9 = (*((uint64_t (**)(id, void *, char *))a5 + 2))(a5, v8, &v46);
      if (v46)
      {

        goto LABEL_35;
      }
      int v10 = v9;
      [v7 addObject:v8];
      if (v10) {
        break;
      }
LABEL_32:

      if (![v6 count]) {
        goto LABEL_35;
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v11 = [v8 outEdges];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v42 + 1) + 8 * i) targetNode];
          [v6 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v13);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v17 = [v8 inOutEdges];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          long long v23 = [v22 targetNode];
          int v24 = [v8 isEqual:v23];

          if (v24) {
            [v22 sourceNode];
          }
          else {
          long long v25 = [v22 targetNode];
          }
          [v6 addObject:v25];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v19);
    }

    if (!a4)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      char v26 = [v8 inEdges];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v47 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v35;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v35 != v29) {
              objc_enumerationMutation(v26);
            }
            long long v31 = [*(id *)(*((void *)&v34 + 1) + 8 * k) sourceNode];
            [v6 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v47 count:16];
        }
        while (v28);
      }
    }
LABEL_3:
    [v6 removeObject:v8];
    goto LABEL_32;
  }
LABEL_35:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_nodesByLabel, 0);
}

@end