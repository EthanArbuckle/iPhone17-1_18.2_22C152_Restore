@interface TUIGuideLayoutController
- (TUIGuideLayoutController)init;
- (double)computeLength;
- (double)offsetForGuide:(id)a3;
- (id)_nodeFromGuide:(id)a3;
- (id)guideForSpec:(id)a3;
- (id)guideForSpec:(id)a3 withOffset:(double)a4;
- (unint64_t)layoutPhase;
- (void)_enumerateSolution:(id)a3;
- (void)addEdgeFrom:(id)a3 to:(id)a4 length:(id *)a5;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)setLayoutPhase:(unint64_t)a3;
- (void)solve;
@end

@implementation TUIGuideLayoutController

- (TUIGuideLayoutController)init
{
  v10.receiver = self;
  v10.super_class = (Class)TUIGuideLayoutController;
  v2 = [(TUIGuideLayoutController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    guides = v2->_guides;
    v2->_guides = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    nodes = v2->_nodes;
    v2->_nodes = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    edges = v2->_edges;
    v2->_edges = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)reset
{
  [(NSMutableArray *)self->_edges removeAllObjects];
  [(NSMapTable *)self->_nodes removeAllObjects];

  [(TUIGuideLayoutController *)self setLayoutPhase:0];
}

- (void)setLayoutPhase:(unint64_t)a3
{
  if (self->_layoutPhase != a3)
  {
    self->_layoutPhase = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) guideLayoutController:self changedPhase:a3];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)guideForSpec:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 kind] == (char *)&def_141F14 + 1)
    {
      id v6 = [[_TUIGuideInstance alloc] initWithSpec:v5];
    }
    else
    {
      id v6 = [(NSMutableDictionary *)self->_guides objectForKeyedSubscript:v5];
      if (!v6)
      {
        id v6 = [[_TUIGuideInstance alloc] initWithSpec:v5];
        [(NSMutableDictionary *)self->_guides setObject:v6 forKeyedSubscript:v5];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)guideForSpec:(id)a3 withOffset:(double)a4
{
  uint64_t v5 = [(TUIGuideLayoutController *)self guideForSpec:a3];
  [v5 setOffset:a4];

  return v5;
}

- (id)_nodeFromGuide:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_nodes objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = objc_opt_new();
    [(NSMapTable *)self->_nodes setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)addEdgeFrom:(id)a3 to:(id)a4 length:(id *)a5
{
  if (!self->_layoutPhase)
  {
    uint64_t v6 = v5;
    id v10 = a4;
    id v15 = [(TUIGuideLayoutController *)self _nodeFromGuide:a3];
    long long v11 = [(TUIGuideLayoutController *)self _nodeFromGuide:v10];

    long long v12 = objc_opt_new();
    [v12 setTo:v11];
    [v12 setLength:a5 v6];
    long long v13 = [v15 edges];
    [v13 addObject:v12];

    v14 = [v11 dependencies];
    [v14 addObject:v15];

    [(NSMutableArray *)self->_edges addObject:v12];
  }
}

- (double)offsetForGuide:(id)a3
{
  uint64_t v3 = [(TUIGuideLayoutController *)self _nodeFromGuide:a3];
  id v4 = v3;
  if (v3) {
    double v5 = COERCE_FLOAT([v3 accumulatedLength]);
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

- (void)solve
{
  uint64_t v3 = +[NSHashTable hashTableWithOptions:512];
  id v4 = +[NSHashTable hashTableWithOptions:512];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v28 = self;
  double v5 = [(NSMapTable *)self->_nodes objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v11 = [v10 dependencies];
        id v12 = [v11 count];

        if (!v12) {
          [v3 addObject:v10];
        }
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }
  v29 = v4;

  if ([v3 count])
  {
    do
    {
      long long v13 = [v3 anyObject];
      v14 = v3;
      [v3 removeObject:v13];
      [v29 removeObject:v13];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = [v13 edges];
      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (!v16) {
        goto LABEL_26;
      }
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          v21 = [v20 to];
          float v22 = fmaxf(COERCE_FLOAT([v21 accumulatedLength]), COERCE_FLOAT([v13 accumulatedLength]) + COERCE_FLOAT([v20 length]));
          if (v22 <= -3.4028e38)
          {
            uint64_t v24 = 4286578687;
          }
          else
          {
            if (v22 < 3.4028e38)
            {
              uint64_t v23 = LODWORD(v22) | 0x7FC0000000000000;
              goto LABEL_22;
            }
            uint64_t v24 = 2139095039;
          }
          uint64_t v23 = v24 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000;
LABEL_22:
          [v21 setAccumulatedLength:v23 2143289344];
          v25 = [v21 dependencies];
          [v25 removeObject:v13];

          v26 = [v21 dependencies];
          id v27 = [v26 count];

          if (!v27) {
            [v14 addObject:v21];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v17);
LABEL_26:

      uint64_t v3 = v14;
    }
    while ([v14 count]);
  }
  [(TUIGuideLayoutController *)v28 _enumerateSolution:&stru_252D80];
  [(TUIGuideLayoutController *)v28 setLayoutPhase:1];
}

- (double)computeLength
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_nodes objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v6 = fmax(v6, COERCE_FLOAT([*(id *)(*((void *)&v9 + 1) + 8 * i) accumulatedLength]));
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)_enumerateSolution:(id)a3
{
  id v4 = (void (**)(id, void, double))a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(NSMapTable *)self->_nodes keyEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          long long v11 = [(NSMapTable *)self->_nodes objectForKey:v10];
          v4[2](v4, v10, COERCE_FLOAT([v11 accumulatedLength]));
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = +[NSHashTable hashTableWithOptions:517];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (unint64_t)layoutPhase
{
  return self->_layoutPhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_guides, 0);
  objc_storeStrong((id *)&self->_edges, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end