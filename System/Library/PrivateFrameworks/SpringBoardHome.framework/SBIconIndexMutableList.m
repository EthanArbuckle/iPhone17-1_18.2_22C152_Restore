@interface SBIconIndexMutableList
- (BOOL)containsNode:(id)a3;
- (BOOL)containsNodeIdentifier:(id)a3;
- (BOOL)directlyContainsNode:(id)a3;
- (BOOL)directlyContainsNodeIdentifier:(id)a3;
- (BOOL)directlyContainsNodeIdentifier:(id)a3 passingTest:(id)a4;
- (SBIconIndexMutableList)init;
- (SBIconIndexMutableList)initWithList:(id)a3 copyNodes:(BOOL)a4;
- (SBIconIndexMutableListObserver)observer;
- (SBIconIndexNode)firstNode;
- (SBIconIndexNode)lastNode;
- (id)containedNodeIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)directlyContainedNodeIdentifier:(id)a3;
- (id)indexDescriptionWithPrefix:(id)a3;
- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4;
- (id)indexesOfNodesPassingTest:(id)a3;
- (id)nodeAtIndex:(unint64_t)a3;
- (id)nodes;
- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4;
- (id)nodesAtIndexes:(id)a3;
- (id)nodesContainingNodeIdentifier:(id)a3;
- (id)nodesInRange:(_NSRange)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfNode:(id)a3;
- (unint64_t)indexOfNodeAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfNodePassingTest:(id)a3;
- (unint64_t)indexOfNodeWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)addNode:(id)a3;
- (void)assertIndexCoherent;
- (void)dealloc;
- (void)didAddNode:(id)a3;
- (void)didAddNodes:(id)a3;
- (void)didRemoveNode:(id)a3;
- (void)didRemoveNodes:(id)a3;
- (void)enumerateNodesAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateNodesUsingBlock:(id)a3;
- (void)enumerateNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertNode:(id)a3 atIndex:(unint64_t)a4;
- (void)insertNodes:(id)a3 atIndexes:(id)a4;
- (void)moveNode:(id)a3 toIndex:(unint64_t)a4;
- (void)moveNodes:(id)a3 toContiguousIndicesStartingAt:(unint64_t)a4;
- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)nodeDidMoveContainedNodes:(id)a3;
- (void)removeAllNodes;
- (void)removeLastNode;
- (void)removeNode:(id)a3;
- (void)removeNodeAtIndex:(unint64_t)a3;
- (void)removeNodeIdenticalTo:(id)a3;
- (void)removeNodesAtIndexes:(id)a3;
- (void)removeNodesInArray:(id)a3;
- (void)removeNodesInRange:(_NSRange)a3;
- (void)replaceNodeAtIndex:(unint64_t)a3 withNode:(id)a4;
- (void)setNodes:(id)a3;
- (void)setObserver:(id)a3;
- (void)sortUsingComparator:(id)a3;
- (void)sortUsingSelector:(SEL)a3;
@end

@implementation SBIconIndexMutableList

- (id)nodes
{
  v2 = (void *)[(NSMutableArray *)self->_nodes copy];
  return v2;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_nodes count];
}

- (id)nodeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nodes objectAtIndex:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_nodes countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)nodesAtIndexes:(id)a3
{
  return (id)[(NSMutableArray *)self->_nodes objectsAtIndexes:a3];
}

- (BOOL)directlyContainsNode:(id)a3
{
  return [(NSMutableArray *)self->_nodes containsObject:a3];
}

- (void)enumerateNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)removeNodesAtIndexes:(id)a3
{
  if (a3)
  {
    nodes = self->_nodes;
    id v5 = a3;
    id v6 = [(NSMutableArray *)nodes objectsAtIndexes:v5];
    [(NSMutableArray *)self->_nodes removeObjectsAtIndexes:v5];

    [(SBIconIndexMutableList *)self didRemoveNodes:v6];
  }
}

- (void)didRemoveNodes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(SBIconIndexMutableList *)self didRemoveNode:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [(NSMapTable *)self->_index objectForKey:v6];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v8)
  {

LABEL_17:
    long long v10 = [MEMORY[0x1E4F1CA80] set];
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  long long v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      unint64_t v14 = [(SBIconIndexMutableList *)self indexOfNode:v13];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(&cfstr_NodeIsNotInLis.isa, v6);
        v15 = SBLogIcon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v6;
          _os_log_error_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_ERROR, "Index believes node is in list but we didn't find it in the real array: %@", buf, 0xCu);
        }
      }
      else
      {
        v16 = [v18 indexPathByAddingIndex:v14];
        v15 = [v13 indexPathsForContainedNodeIdentifier:v6 prefixPath:v16];

        if (v10)
        {
          [v10 unionSet:v15];
        }
        else
        {
          v15 = v15;
          long long v10 = v15;
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  }
  while (v9);

  if (!v10) {
    goto LABEL_17;
  }
LABEL_18:

  return v10;
}

- (unint64_t)indexOfNode:(id)a3
{
  return [(NSMutableArray *)self->_nodes indexOfObject:a3];
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  v3 = [(NSMapTable *)self->_index objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)enumerateNodesUsingBlock:(id)a3
{
}

- (void)enumerateNodesAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfNodeWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return [(NSMutableArray *)self->_nodes indexOfObjectWithOptions:a3 passingTest:a4];
}

- (SBIconIndexMutableList)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBIconIndexMutableList;
  v2 = [(SBIconIndexMutableList *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    index = v2->_index;
    v2->_index = (NSMapTable *)v5;
  }
  return v2;
}

- (SBIconIndexMutableList)initWithList:(id)a3 copyNodes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)SBIconIndexMutableList;
  uint64_t v7 = [(SBIconIndexMutableList *)&v47 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:*((void *)v6 + 1) copyItems:v4];
    nodes = v7->_nodes;
    v7->_nodes = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    index = v7->_index;
    v7->_index = (NSMapTable *)v10;

    if (v4)
    {
      long long v45 = 0uLL;
      long long v46 = 0uLL;
      long long v43 = 0uLL;
      long long v44 = 0uLL;
      obuint64_t j = v7->_nodes;
      uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v32)
      {
        id v30 = v6;
        uint64_t v31 = *(void *)v44;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v44 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = v12;
            v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
            unint64_t v14 = [v13 containedNodeIdentifiers];
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v49 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v40 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                  long long v20 = v7->_index;
                  long long v21 = [MEMORY[0x1E4F28BD0] setWithObject:v13];
                  [(NSMapTable *)v20 setObject:v21 forKey:v19];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v49 count:16];
              }
              while (v16);
            }

            uint64_t v12 = v34 + 1;
          }
          while (v34 + 1 != v32);
          uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v32);
        id v6 = v30;
      }
    }
    else
    {
      long long v37 = 0uLL;
      long long v38 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      obuint64_t j = (NSMutableArray *)*((id *)v6 + 2);
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * j);
            v27 = [*((id *)v6 + 2) objectForKey:v26];
            v28 = (void *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithSet:v27];
            [(NSMapTable *)v7->_index setObject:v28 forKey:v26];
          }
          uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v23);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_nodes;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeNodeObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBIconIndexMutableList;
  [(SBIconIndexMutableList *)&v8 dealloc];
}

- (BOOL)directlyContainsNodeIdentifier:(id)a3
{
  id v4 = a3;
  nodes = self->_nodes;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SBIconIndexMutableList_directlyContainsNodeIdentifier___block_invoke;
  v8[3] = &unk_1E6AAEC90;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(nodes) = [(NSMutableArray *)nodes bs_containsObjectPassingTest:v8];

  return (char)nodes;
}

uint64_t __57__SBIconIndexMutableList_directlyContainsNodeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 nodeIdentifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (BOOL)directlyContainsNodeIdentifier:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  nodes = self->_nodes;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SBIconIndexMutableList_directlyContainsNodeIdentifier_passingTest___block_invoke;
  v12[3] = &unk_1E6AAECB8;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  LOBYTE(nodes) = [(NSMutableArray *)nodes bs_containsObjectPassingTest:v12];

  return (char)nodes;
}

uint64_t __69__SBIconIndexMutableList_directlyContainsNodeIdentifier_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 nodeIdentifier];
  if ([v4 isEqual:v5]) {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)directlyContainedNodeIdentifier:(id)a3
{
  id v4 = a3;
  nodes = self->_nodes;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SBIconIndexMutableList_directlyContainedNodeIdentifier___block_invoke;
  v10[3] = &unk_1E6AAECE0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableArray *)nodes indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = 0;
  }
  else
  {
    objc_super v8 = [(NSMutableArray *)self->_nodes objectAtIndex:v7];
  }

  return v8;
}

uint64_t __58__SBIconIndexMutableList_directlyContainedNodeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 nodeIdentifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (id)nodesContainingNodeIdentifier:(id)a3
{
  return [(NSMapTable *)self->_index objectForKey:a3];
}

- (id)containedNodeIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_index keyEnumerator];
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
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length] <= a4
    || (unint64_t v7 = [v6 indexAtPosition:a4], v7 >= -[SBIconIndexMutableList count](self, "count")))
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4 + 1];
  }
  else
  {
    objc_super v8 = [(SBIconIndexMutableList *)self nodeAtIndex:v7];
    id v9 = [v8 nodesAlongIndexPath:v6 consumedIndexes:a4 + 1];
  }
  return v9;
}

- (unint64_t)indexOfNodePassingTest:(id)a3
{
  return [(NSMutableArray *)self->_nodes indexOfObjectPassingTest:a3];
}

- (unint64_t)indexOfNodeAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return [(NSMutableArray *)self->_nodes indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfNodesPassingTest:(id)a3
{
  return (id)[(NSMutableArray *)self->_nodes indexesOfObjectsPassingTest:a3];
}

- (BOOL)containsNode:(id)a3
{
  uint64_t v4 = [a3 nodeIdentifier];
  LOBYTE(self) = [(SBIconIndexMutableList *)self containsNodeIdentifier:v4];

  return (char)self;
}

- (SBIconIndexNode)firstNode
{
  return (SBIconIndexNode *)[(NSMutableArray *)self->_nodes firstObject];
}

- (SBIconIndexNode)lastNode
{
  return (SBIconIndexNode *)[(NSMutableArray *)self->_nodes lastObject];
}

- (id)nodesInRange:(_NSRange)a3
{
  return (id)-[NSMutableArray subarrayWithRange:](self->_nodes, "subarrayWithRange:", a3.location, a3.length);
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  nodes = self->_nodes;
  id v7 = a3;
  [(NSMutableArray *)nodes insertObject:v7 atIndex:a4];
  [(SBIconIndexMutableList *)self didAddNode:v7];
}

- (void)insertNodes:(id)a3 atIndexes:(id)a4
{
  nodes = self->_nodes;
  id v7 = a3;
  [(NSMutableArray *)nodes insertObjects:v7 atIndexes:a4];
  [(SBIconIndexMutableList *)self didAddNodes:v7];
}

- (void)addNode:(id)a3
{
  id v4 = a3;
  [(SBIconIndexMutableList *)self insertNode:v4 atIndex:[(SBIconIndexMutableList *)self count]];
}

- (void)replaceNodeAtIndex:(unint64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  id v7 = [(SBIconIndexMutableList *)self nodeAtIndex:a3];
  [(NSMutableArray *)self->_nodes replaceObjectAtIndex:a3 withObject:v6];
  [(SBIconIndexMutableList *)self didAddNode:v6];

  [(SBIconIndexMutableList *)self didRemoveNode:v7];
}

- (void)removeNode:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_nodes containsObject:v4])
  {
    nodes = self->_nodes;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__SBIconIndexMutableList_removeNode___block_invoke;
    v9[3] = &unk_1E6AAECE0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [(NSMutableArray *)nodes indexesOfObjectsPassingTest:v9];
    objc_super v8 = [(NSMutableArray *)self->_nodes objectsAtIndexes:v7];
    [(NSMutableArray *)self->_nodes removeObject:v6];
    [(SBIconIndexMutableList *)self didRemoveNodes:v8];
  }
}

uint64_t __37__SBIconIndexMutableList_removeNode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)removeNodeIdenticalTo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_nodes, "containsObject:"))
  {
    [(NSMutableArray *)self->_nodes removeObjectIdenticalTo:v4];
    [(SBIconIndexMutableList *)self didRemoveNode:v4];
  }
}

- (void)removeNodeAtIndex:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  [(SBIconIndexMutableList *)self removeNodesAtIndexes:v4];
}

- (void)removeNodesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[NSMutableArray subarrayWithRange:](self->_nodes, "subarrayWithRange:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_nodes, "removeObjectsInRange:", location, length);
  [(SBIconIndexMutableList *)self didRemoveNodes:v6];
}

- (void)removeNodesInArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(SBIconIndexMutableList *)self removeNode:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeLastNode
{
  id v3 = [(NSMutableArray *)self->_nodes lastObject];
  [(NSMutableArray *)self->_nodes removeLastObject];
  [(SBIconIndexMutableList *)self didRemoveNode:v3];
}

- (void)removeAllNodes
{
  uint64_t v3 = [(NSMutableArray *)self->_nodes count];
  -[SBIconIndexMutableList removeNodesInRange:](self, "removeNodesInRange:", 0, v3);
}

- (void)setNodes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_nodes;
  uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  nodes = self->_nodes;
  self->_nodes = v6;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](v5, "containsObject:", v13, (void)v14)) {
          [(NSMutableArray *)v5 removeObject:v13];
        }
        else {
          [(SBIconIndexMutableList *)self didAddNode:v13];
        }
        [(NSMutableArray *)self->_nodes addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(SBIconIndexMutableList *)self didRemoveNodes:v5];
}

- (void)moveNode:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v9 count:1];

  -[SBIconIndexMutableList moveNodes:toContiguousIndicesStartingAt:](self, "moveNodes:toContiguousIndicesStartingAt:", v8, a4, v9, v10);
}

- (void)moveNodes:(id)a3 toContiguousIndicesStartingAt:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v39;
    unint64_t v11 = a4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= v11 + i != [(SBIconIndexMutableList *)self indexOfNode:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      v11 += v8;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v8);
    if (v9)
    {
      uint64_t v13 = [(NSMutableArray *)self->_nodes count];
      uint64_t v14 = [v6 count];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            [(NSMutableArray *)self->_nodes removeObject:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v17);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v20 = v15;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        unint64_t v23 = v13 - v14;
        uint64_t v24 = *(void *)v31;
        unint64_t v25 = a4;
        do
        {
          for (uint64_t k = 0; k != v22; ++k)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v20);
            }
            uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * k);
            nodes = self->_nodes;
            if (v23 <= a4) {
              -[NSMutableArray addObject:](nodes, "addObject:", v27, (void)v30);
            }
            else {
              [(NSMutableArray *)nodes insertObject:v27 atIndex:v25++];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
        }
        while (v22);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      [WeakRetained listDidMoveNodes:self];
    }
  }
}

- (void)sortUsingSelector:(SEL)a3
{
}

- (void)sortUsingComparator:(id)a3
{
}

- (void)didAddNode:(id)a3
{
  id v4 = a3;
  [v4 addNodeObserver:self];
  id v5 = [v4 containedNodeIdentifiers];
  [(SBIconIndexMutableList *)self node:v4 didAddContainedNodeIdentifiers:v5];
}

- (void)didAddNodes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(SBIconIndexMutableList *)self didAddNode:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)didRemoveNode:(id)a3
{
  id v4 = a3;
  [v4 removeNodeObserver:self];
  id v5 = [v4 containedNodeIdentifiers];
  [(SBIconIndexMutableList *)self node:v4 didRemoveContainedNodeIdentifiers:v5];
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained) {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  }
  else {
    uint64_t v8 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = -[NSMapTable objectForKey:](self->_index, "objectForKey:", v13, WeakRetained);
        id v15 = v14;
        if (v14)
        {
          if (([v14 containsObject:v6] & 1) == 0) {
            [v8 addObject:v13];
          }
          uint64_t v16 = v15;
          id v17 = v6;
        }
        else
        {
          index = self->_index;
          uint64_t v19 = [MEMORY[0x1E4F28BD0] setWithObject:v6];
          [(NSMapTable *)index setObject:v19 forKey:v13];

          uint64_t v16 = v8;
          id v17 = v13;
        }
        [v16 addObject:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  [WeakRetained list:self didAddContainedNodeIdentifiers:v8];
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained) {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BD0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  }
  else {
    uint64_t v9 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = -[NSMapTable objectForKey:](self->_index, "objectForKey:", v15, (void)v17);
        [v16 removeObject:v6];
        if (![v16 count])
        {
          [(NSMapTable *)self->_index removeObjectForKey:v15];
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [WeakRetained list:self didRemoveContainedNodeIdentifiers:v9];
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained listDidMoveNodes:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMutableArray *)self->_nodes mutableCopyWithZone:a3];
    id v7 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v9 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v8;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = self->_index;
    uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [(NSMapTable *)self->_index objectForKey:v14];
          uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28BD0], "allocWithZone:", a3), "initWithSet:", v15);
          [*(id *)(v5 + 16) setObject:v16 forKey:v14];
        }
        uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v17 = (id)v5;
  }

  return (id)v5;
}

- (id)indexDescriptionWithPrefix:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v70 = (__CFString *)a3;
  unint64_t v4 = 0x1E4F1C000uLL;
  NSUInteger v86 = [(NSMapTable *)self->_index count];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v91 = self;
  obuint64_t j = [(NSMapTable *)self->_index keyEnumerator];
  uint64_t v6 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
  v93 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v88 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v99 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)v91->_index objectForKey:v9];
        uint64_t v11 = objc_msgSend(*(id *)(v4 + 2632), "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v94 objects:v102 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v95 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = [*(id *)(*((void *)&v94 + 1) + 8 * j) nodeIdentifier];
              long long v18 = SBIconIndexDebugStringForNodeIdentifier(v17);
              [v11 addObject:v18];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v94 objects:v102 count:16];
          }
          while (v14);
        }

        [v11 sortUsingComparator:&__block_literal_global_20];
        long long v19 = SBIconIndexDebugStringForNodeIdentifier(v9);
        [v11 insertObject:v19 atIndex:0];

        uint64_t v5 = v93;
        [v93 addObject:v11];

        unint64_t v4 = 0x1E4F1C000;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
    }
    while (v7);
  }

  [v5 sortUsingComparator:&__block_literal_global_12_0];
  uint64_t v92 = [@" -> " length];
  uint64_t v82 = objc_msgSend(@", ", "length");
  uint64_t v72 = [@"  |  " length];
  long long v20 = 0;
  long long v21 = 0;
  unint64_t v89 = 0;
  unint64_t v22 = 0;
  long long v23 = 0;
  long long v24 = 0;
  uint64_t v25 = 1;
  NSUInteger v26 = v86;
  do
  {
    unint64_t v71 = v89;
    v76 = v20;
    v78 = v21;
    unint64_t obja = v22;
    unint64_t v27 = v22 + 1;
    unint64_t v28 = v26 / (v22 + 1);
    if (v26 % (v22 + 1)) {
      ++v28;
    }
    unint64_t v74 = v28;
    if (v28 <= 1) {
      unint64_t v28 = 1;
    }
    unint64_t v89 = v28;
    if (v24) {
      free(v24);
    }
    long long v21 = malloc_type_malloc(8 * v27, 0x100004000313F17uLL);
    if (v23) {
      free(v23);
    }
    v29 = malloc_type_malloc(8 * v27, 0x100004000313F17uLL);
    long long v20 = v29;
    unint64_t v80 = v27;
    if (v27)
    {
      uint64_t v30 = 0;
      do
      {
        v29[v30] = 0;
        v21[v30++] = 0;
      }
      while (v25 != v30);
    }
    if (v26)
    {
      unint64_t v31 = 0;
      do
      {
        long long v32 = [v5 objectAtIndex:v31];
        unint64_t v33 = [v32 count];
        unint64_t v34 = v31 / v89;
        long long v35 = [v32 objectAtIndex:0];
        unint64_t v36 = [v35 length];

        unint64_t v37 = v21[v31 / v89];
        if (v37 <= v36) {
          unint64_t v37 = v36;
        }
        v21[v34] = v37;
        unint64_t v38 = v36 + v92;
        if (v33 >= 2)
        {
          for (uint64_t k = 1; k != v33; ++k)
          {
            long long v40 = [v32 objectAtIndex:k];
            v38 += [v40 length];
          }
        }
        unint64_t v41 = v20[v34];
        if (v41 <= v38) {
          unint64_t v41 = v38;
        }
        v20[v34] = v41;

        ++v31;
        NSUInteger v26 = v86;
        uint64_t v5 = v93;
      }
      while (v31 != v86);
    }
    unint64_t v42 = *v20 + obja * v72;
    unint64_t v22 = v80;
    if (v80 >= 2)
    {
      uint64_t v43 = 0;
      do
        v42 += v20[++v43];
      while (obja != v43);
    }
    if (v74 < 2) {
      break;
    }
    ++v25;
    long long v23 = v76;
    long long v24 = v78;
  }
  while (v42 < 0xC8);
  if (obja)
  {
    long long v20 = v76;
    long long v44 = v78;
  }
  else
  {
    long long v44 = v21;
  }
  if (obja) {
    unint64_t v45 = v71;
  }
  else {
    unint64_t v45 = v89;
  }
  if (obja) {
    uint64_t v46 = obja;
  }
  else {
    uint64_t v46 = 1;
  }
  objc_super v47 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v46];
  if (obja <= 1) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = obja;
  }
  uint64_t v49 = v48;
  do
  {
    v50 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v45];
    [v47 addObject:v50];

    --v49;
  }
  while (v49);
  if (v26)
  {
    for (unint64_t m = 0; m != v26; ++m)
    {
      v52 = [v47 objectAtIndex:m / v45];
      v53 = [v5 objectAtIndex:m];
      [v52 addObject:v53];
    }
  }
  v54 = &stru_1F2FA0300;
  if (v70) {
    v54 = v70;
  }
  v75 = v54;

  v55 = [MEMORY[0x1E4F28E78] string];
  if (v45)
  {
    unint64_t v56 = 0;
    unint64_t v73 = v45;
    uint64_t v79 = v48;
    v81 = v47;
    v77 = v20;
    do
    {
      if (v56)
      {
        [v55 appendString:@"\n"];
        v57 = @"       ";
      }
      else
      {
        v57 = @"Index: ";
      }
      [v55 appendString:v75];
      [v55 appendString:v57];
      uint64_t v58 = 0;
      id objb = (id)v56;
      do
      {
        v59 = [v47 objectAtIndex:v58];
        if (v56 < [v59 count])
        {
          if (v58) {
            [v55 appendString:@"  |  "];
          }
          v90 = v59;
          v60 = [v59 objectAtIndex:v56];
          unint64_t v61 = [v60 count];
          uint64_t v62 = v44[v58];
          v63 = [v60 objectAtIndex:0];
          [v55 appendString:v63];
          v87 = v63;
          for (unint64_t n = [v63 length]; n < v44[v58]; ++n)
            [v55 appendString:@" "];
          unint64_t v65 = v62 + v92 + (v61 - 2) * v82;
          [v55 appendString:@" -> "];
          if (v61 > 1)
          {
            v66 = [v60 objectAtIndex:1];
            [v55 appendString:v66];
            v65 += [v66 length];

            if (v61 != 2)
            {
              for (iuint64_t i = 2; ii != v61; ++ii)
              {
                v68 = [v60 objectAtIndex:ii];
                [v55 appendString:@", "];
                [v55 appendString:v68];
                v65 += [v68 length];
              }
            }
          }
          long long v20 = v77;
          while (v65 < v77[v58])
          {
            [v55 appendString:@" "];
            ++v65;
          }

          uint64_t v48 = v79;
          objc_super v47 = v81;
          unint64_t v56 = (unint64_t)objb;
          v59 = v90;
        }

        ++v58;
      }
      while (v58 != v48);
      ++v56;
    }
    while (v56 != v73);
  }
  if (v44) {
    free(v44);
  }
  if (v20) {
    free(v20);
  }

  return v55;
}

uint64_t __53__SBIconIndexMutableList_indexDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

uint64_t __53__SBIconIndexMutableList_indexDescriptionWithPrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectAtIndex:0];
  uint64_t v6 = [v4 objectAtIndex:0];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)assertIndexCoherent
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMapTable *)self->_index keyEnumerator];
  id v4 = [v3 allObjects];
  uint64_t v5 = (void *)[v4 mutableCopy];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v22 = self;
  obuint64_t j = self->_nodes;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 nodeIdentifier];
        [v5 removeObject:v11];
        [v6 addObject:v11];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = [v10 containedNodeIdentifiers];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              [v5 removeObject:v17];
              [v6 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  long long v18 = [(NSMapTable *)v22->_index keyEnumerator];
  uint64_t v19 = [v18 nextObject];
  if (v19)
  {
    long long v20 = (void *)v19;
    do
    {
      [v6 removeObject:v20];
      uint64_t v21 = [v18 nextObject];

      long long v20 = (void *)v21;
    }
    while (v21);
  }
}

- (SBIconIndexMutableListObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBIconIndexMutableListObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end