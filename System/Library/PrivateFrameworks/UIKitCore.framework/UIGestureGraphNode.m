@interface UIGestureGraphNode
- (BOOL)hasEdgeBetweenNode:(id)a3;
- (BOOL)hasEdgeFromNode:(id)a3;
- (BOOL)hasEdgeTowardNode:(id)a3;
- (BOOL)isInEdge:(id)a3;
- (BOOL)isInOutEdge:(id)a3;
- (BOOL)isOutEdge:(id)a3;
- (NSSet)allEdges;
- (NSSet)inEdges;
- (NSSet)inOutEdges;
- (NSSet)outEdges;
- (id)_edgesForType:(unint64_t)a3 createIfNeeded:(BOOL)a4;
- (id)description;
- (id)edgesForLabel:(id)a3;
- (unint64_t)edgeCount;
- (unint64_t)edgeCountForLabel:(id)a3;
- (unint64_t)typeOfEdge:(id)a3;
- (void)_addEdge:(id)a3;
- (void)_removeEdge:(id)a3;
- (void)enumerateEdgesBetweenNode:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesFromNode:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesTowardNode:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborNodesUsingBlock:(id)a3;
@end

@implementation UIGestureGraphNode

- (BOOL)hasEdgeFromNode:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_inEdges;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sourceNode", (void)v12);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)edgesForLabel:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    v4 = -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
    uint64_t v5 = [v3 setWithSet:v4];
  }
  else
  {
    uint64_t v5 = [(UIGestureGraphNode *)self allEdges];
  }
  return v5;
}

- (void)_removeEdge:(id)a3
{
  -[UIGestureGraphNode _edgesForType:createIfNeeded:](self, "_edgesForType:createIfNeeded:", -[UIGestureGraphNode typeOfEdge:](self, "typeOfEdge:"), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  edgesByLabel = self->_edgesByLabel;
  uint64_t v6 = [a3 label];
  uint64_t v7 = [(NSMapTable *)edgesByLabel objectForKey:v6];

  if (v7) {
    [v7 removeObject:a3];
  }
  [v8 removeObject:a3];
}

- (void)_addEdge:(id)a3
{
  -[UIGestureGraphNode _edgesForType:createIfNeeded:](self, "_edgesForType:createIfNeeded:", -[UIGestureGraphNode typeOfEdge:](self, "typeOfEdge:"), 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  edgesByLabel = self->_edgesByLabel;
  if (!edgesByLabel)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v7 = self->_edgesByLabel;
    self->_edgesByLabel = v6;

    edgesByLabel = self->_edgesByLabel;
  }
  id v8 = [a3 label];
  id v9 = [(NSMapTable *)edgesByLabel objectForKey:v8];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
    BOOL v10 = self->_edgesByLabel;
    v11 = [a3 label];
    [(NSMapTable *)v10 setObject:v9 forKey:v11];
  }
  [v9 addObject:a3];
  [v12 addObject:a3];
}

- (unint64_t)typeOfEdge:(id)a3
{
  if (-[UIGestureGraphNode isInEdge:](self, "isInEdge:")) {
    return 0;
  }
  if ([(UIGestureGraphNode *)self isOutEdge:a3]) {
    return 2;
  }
  return 1;
}

- (id)_edgesForType:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  switch(a3)
  {
    case 2uLL:
      p_outEdges = &self->_outEdges;
      outEdges = self->_outEdges;
      if (outEdges) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = !a4;
      }
      if (v7) {
        goto LABEL_15;
      }
LABEL_14:
      uint64_t v8 = objc_opt_new();
      id v9 = *p_outEdges;
      *p_outEdges = (NSMutableSet *)v8;

      outEdges = *p_outEdges;
LABEL_15:
      BOOL v10 = outEdges;
      goto LABEL_17;
    case 1uLL:
      uint64_t v4 = 40;
      goto LABEL_12;
    case 0uLL:
      uint64_t v4 = 24;
LABEL_12:
      p_outEdges = (NSMutableSet **)((char *)self + v4);
      outEdges = *(NSMutableSet **)((char *)&self->super.super.isa + v4);
      if (outEdges || !a4) {
        goto LABEL_15;
      }
      goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_17:
  return v10;
}

- (NSSet)outEdges
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_outEdges];
}

- (BOOL)isInEdge:(id)a3
{
  uint64_t v5 = [a3 targetNode];
  if (v5 == self) {
    char v6 = [a3 isDirected];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (NSSet)inEdges
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_inEdges];
}

- (NSSet)allEdges
{
  v3 = [MEMORY[0x1E4F1CA80] setWithSet:self->_inEdges];
  [v3 unionSet:self->_inOutEdges];
  [v3 unionSet:self->_outEdges];
  return (NSSet *)v3;
}

- (NSSet)inOutEdges
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_inOutEdges];
}

- (BOOL)isOutEdge:(id)a3
{
  uint64_t v5 = [a3 sourceNode];
  if (v5 == self) {
    char v6 = [a3 isDirected];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_inOutEdges, 0);
  objc_storeStrong((id *)&self->_outEdges, 0);
  objc_storeStrong((id *)&self->_inEdges, 0);
}

- (unint64_t)edgeCount
{
  uint64_t v3 = [(NSMutableSet *)self->_inEdges count];
  uint64_t v4 = [(NSMutableSet *)self->_inOutEdges count] + v3;
  return v4 + [(NSMutableSet *)self->_outEdges count];
}

- (unint64_t)edgeCountForLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
    unint64_t v5 = [v4 count];

    return v5;
  }
  else
  {
    return [(UIGestureGraphNode *)self edgeCount];
  }
}

- (BOOL)hasEdgeTowardNode:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_outEdges;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "targetNode", (void)v12);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasEdgeBetweenNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_inOutEdges;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "oppositeNode:", self, (void)v13);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == a3)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isInOutEdge:(id)a3
{
  if (![a3 isDirected]) {
    return 1;
  }
  uint64_t v5 = [a3 sourceNode];
  uint64_t v6 = [a3 targetNode];
  if (v5 == v6)
  {
    uint64_t v8 = [a3 sourceNode];
    BOOL v7 = v8 == self;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)enumerateEdgesTowardNode:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_outEdges count])
  {
    char v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v7 = [(NSMutableSet *)self->_outEdges allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = [v12 targetNode];

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18) {
            break;
          }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateEdgesFromNode:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_inEdges count])
  {
    char v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v7 = [(NSMutableSet *)self->_inEdges allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = [v12 sourceNode];

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18) {
            break;
          }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateEdgesBetweenNode:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_inOutEdges count])
  {
    char v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v7 = [(NSMutableSet *)self->_inOutEdges allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = [v12 oppositeNode:self];

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18) {
            break;
          }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateNeighborNodesUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(UIGestureGraphNode *)self allEdges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 oppositeNode:self];
        long long v12 = v11;
        if (v11)
        {
          if (([v11 isEqual:self] & 1) == 0)
          {
            (*((void (**)(id, void *, void *, char *))a3 + 2))(a3, v10, v12, &v17);
            if (v17)
            {

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(UIGestureGraphNode *)self edgeCount];
  uint64_t v7 = [(NSMutableSet *)self->_inEdges count];
  uint64_t v8 = [(NSMutableSet *)self->_outEdges count];
  uint64_t v9 = [(NSMutableSet *)self->_inOutEdges count];
  v13.receiver = self;
  v13.super_class = (Class)UIGestureGraphNode;
  uint64_t v10 = [(UIGestureGraphElement *)&v13 description];
  uint64_t v11 = [v3 stringWithFormat:@"[<%@ %p>] edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld] inOutEdgesCount:[%ld] %@", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

@end