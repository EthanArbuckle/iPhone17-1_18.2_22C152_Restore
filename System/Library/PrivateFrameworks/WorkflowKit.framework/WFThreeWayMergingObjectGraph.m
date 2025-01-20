@interface WFThreeWayMergingObjectGraph
- (id)description;
- (void)addEdgeFromVertex:(void *)a3 toVertex:;
- (void)addStandaloneVertex:(uint64_t)a1;
- (void)initWithVertexComparator:(void *)a1;
@end

@implementation WFThreeWayMergingObjectGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directPredecessorsForVertexes, 0);
  objc_storeStrong((id *)&self->_directSuccessorsForVertexes, 0);
  objc_storeStrong((id *)&self->_orderedVertexes, 0);
  objc_storeStrong(&self->_vertexComparator, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self) {
    orderedVertexes = self->_orderedVertexes;
  }
  else {
    orderedVertexes = 0;
  }
  v8 = [v3 stringWithFormat:@"<%@: %p>\n             Ordered Vertexes: %@\n             Direct Successors Map: %@\n             Direct Predecessors Map: %@", v5, self, orderedVertexes, self->_directSuccessorsForVertexes, self->_directPredecessorsForVertexes];

  return v8;
}

- (void)initWithVertexComparator:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_initWithVertexComparator_, a1, @"WFThreeWayMergingObjectGraph.m", 67, @"Invalid parameter not satisfying: %@", @"comparator" object file lineNumber description];
    }
    v15.receiver = a1;
    v15.super_class = (Class)WFThreeWayMergingObjectGraph;
    a1 = objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      uint64_t v5 = _Block_copy(v4);
      v6 = (void *)a1[1];
      a1[1] = v5;

      uint64_t v7 = objc_opt_new();
      v8 = (void *)a1[2];
      a1[2] = v7;

      uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v10 = (void *)a1[3];
      a1[3] = v9;

      uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v12 = (void *)a1[4];
      a1[4] = v11;
    }
  }

  return a1;
}

- (void)addStandaloneVertex:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    if (!v3)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_addStandaloneVertex_, a1, @"WFThreeWayMergingObjectGraph.m", 107, @"Invalid parameter not satisfying: %@", @"vertex" object file lineNumber description];
    }
    id v4 = *(id *)(a1 + 16);
    uint64_t v5 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v4, "count"), 1024, *(void *)(a1 + 8));

    [*(id *)(a1 + 16) insertObject:v7 atIndex:v5];
    id v3 = v7;
  }
}

- (void)addEdgeFromVertex:(void *)a3 toVertex:
{
  id v14 = a2;
  id v5 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v14)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_addEdgeFromVertex_toVertex_, a1, @"WFThreeWayMergingObjectGraph.m", 114, @"Invalid parameter not satisfying: %@", @"from" object file lineNumber description];

    if (v5) {
      goto LABEL_4;
    }
LABEL_13:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:sel_addEdgeFromVertex_toVertex_, a1, @"WFThreeWayMergingObjectGraph.m", 115, @"Invalid parameter not satisfying: %@", @"to" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_13;
  }
LABEL_4:
  id v6 = *(id *)(a1 + 16);
  uint64_t v7 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v6, "count"), 1024, *(void *)(a1 + 8));

  [*(id *)(a1 + 16) insertObject:v14 atIndex:v7];
  id v8 = *(id *)(a1 + 16);
  uint64_t v9 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v8, "count"), 1024, *(void *)(a1 + 8));

  [*(id *)(a1 + 16) insertObject:v5 atIndex:v9];
  v10 = [*(id *)(a1 + 24) objectForKey:v14];
  if (!v10)
  {
    v10 = objc_opt_new();
    [*(id *)(a1 + 24) setObject:v10 forKey:v14];
  }
  objc_msgSend(v10, "insertObject:atIndex:", v5, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v10, "count"), 1024, *(void *)(a1 + 8)));
  uint64_t v11 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v11)
  {
    uint64_t v11 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v11 forKey:v5];
  }
  objc_msgSend(v11, "insertObject:atIndex:", v14, objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v11, "count"), 1024, *(void *)(a1 + 8)));

LABEL_9:
}

void __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastObject];
  [*(id *)(a1 + 32) removeLastObject];
  if (v2) {
    id v3 = (void *)v2[1];
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v4];
  id v6 = v5;
  v46 = v2;
  id v47 = v4;
  if (!v2)
  {
    unint64_t v8 = 0;
LABEL_6:
    uint64_t v9 = *(void **)(a1 + 48);
    v10 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    [v9 setObject:v10 forKey:v4];

    uint64_t v11 = *(void **)(a1 + 56);
    v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    [v11 setObject:v12 forKey:v4];

    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    [*(id *)(a1 + 64) addObject:v4];
    goto LABEL_18;
  }
  uint64_t v7 = v2[2];
  unint64_t v8 = v2[3];
  if (v7 != 1)
  {
    if (v7) {
      goto LABEL_18;
    }
    goto LABEL_6;
  }
  v13 = [v5 objectAtIndex:v2[3]];
  id v14 = *(void **)(a1 + 56);
  objc_super v15 = NSNumber;
  v16 = [v14 objectForKey:v4];
  unint64_t v17 = [v16 unsignedIntegerValue];

  v18 = [*(id *)(a1 + 56) objectForKey:v13];
  unint64_t v19 = [v18 unsignedIntegerValue];

  if (v17 >= v19) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v17;
  }
  id v4 = v47;
  v21 = [v15 numberWithUnsignedInteger:v20];
  [v14 setObject:v21 forKey:v47];

  ++v8;
LABEL_18:
  while (v8 < [v6 count])
  {
    v22 = (void *)MEMORY[0x1C87CA430]();
    v23 = [v6 objectAtIndex:v8];
    v24 = [*(id *)(a1 + 48) objectForKey:v23];

    if (!v24)
    {
      id v43 = v4;
      v44 = objc_alloc((Class)self);
      v45 = -[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initWithVertex:step:predecessorIndex:](v44, v43, 1, v8);

      [*(id *)(a1 + 32) addObject:v45];
      v42 = +[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initialItemWithVertex:]((uint64_t)WFThreeWayMergingObjectGraphComponentEnumerationStackItem, v23);

      [*(id *)(a1 + 32) addObject:v42];
      goto LABEL_23;
    }
    if ([*(id *)(a1 + 64) containsObject:v23])
    {
      v25 = *(void **)(a1 + 56);
      v26 = NSNumber;
      v27 = [v25 objectForKey:v4];
      unint64_t v28 = [v27 unsignedIntegerValue];

      v29 = [*(id *)(a1 + 48) objectForKey:v23];
      unint64_t v30 = [v29 unsignedIntegerValue];

      id v4 = v47;
      if (v28 >= v30) {
        unint64_t v31 = v30;
      }
      else {
        unint64_t v31 = v28;
      }
      v32 = [v26 numberWithUnsignedInteger:v31];
      [v25 setObject:v32 forKey:v47];
    }
    ++v8;
  }
  v33 = [*(id *)(a1 + 56) objectForKey:v4];
  v34 = [*(id *)(a1 + 48) objectForKey:v4];
  int v35 = [v33 isEqualToNumber:v34];

  if (v35)
  {
    uint64_t v36 = [*(id *)(a1 + 64) indexOfObject:v4];
    uint64_t v37 = [*(id *)(a1 + 64) count] - v36;
    v38 = objc_opt_new();
    v39 = *(void **)(a1 + 64);
    v40 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v36, v37);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke_2;
    v48[3] = &unk_1E6556DA0;
    id v49 = v38;
    id v41 = v38;
    [v39 enumerateObjectsAtIndexes:v40 options:2 usingBlock:v48];

    objc_msgSend(*(id *)(a1 + 64), "removeObjectsInRange:", v36, v37);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  v42 = v46;
LABEL_23:
}

uint64_t __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end