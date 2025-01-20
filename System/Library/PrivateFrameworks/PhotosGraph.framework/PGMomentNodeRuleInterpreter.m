@interface PGMomentNodeRuleInterpreter
- (PGGraph)graph;
- (PGMomentNodeRuleInterpreter)initWithGraph:(id)a3;
- (id)evaluateMomentNodes:(id)a3 forDateRangeCondition:(id)a4;
- (id)evaluateMomentNodes:(id)a3 forPersonCondition:(id)a4;
- (id)evaluateObjects:(id)a3 forCondition:(id)a4;
- (void)setGraph:(id)a3;
@end

@implementation PGMomentNodeRuleInterpreter

- (void).cxx_destruct
{
}

- (void)setGraph:(id)a3
{
}

- (PGGraph)graph
{
  return self->_graph;
}

- (id)evaluateMomentNodes:(id)a3 forPersonCondition:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a4 personUUIDs];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v8 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  v14 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:v8 inGraph:self->_graph];
  v15 = [v14 set];

  if ([v15 count])
  {
    v16 = [MEMORY[0x1E4F1CA80] set];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v6;
    id v27 = v6;
    uint64_t v17 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v17) {
      goto LABEL_20;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    while (1)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v27);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        v22 = [v21 consolidatedPersonNodesPresentInAssets];
        if ([v22 intersectsSet:v15])
        {
        }
        else
        {
          v23 = [v21 personNodesInProximity];
          int v24 = [v23 intersectsSet:v15];

          if (!v24) {
            continue;
          }
        }
        [v16 addObject:v21];
      }
      uint64_t v18 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (!v18)
      {
LABEL_20:

        id v6 = v26;
        goto LABEL_22;
      }
    }
  }
  v16 = [MEMORY[0x1E4F1CAD0] set];
LABEL_22:

  return v16;
}

- (id)evaluateMomentNodes:(id)a3 forDateRangeCondition:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 startDate];
  uint64_t v9 = [v6 endDate];

  uint64_t v10 = [v5 predicateWithFormat:@"localStartDate >= %@ && localEndDate <= %@", v8, v9];
  uint64_t v11 = [v7 filteredSetUsingPredicate:v10];

  return v11;
}

- (id)evaluateObjects:(id)a3 forCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 type];
  if (v8 == 2)
  {
    uint64_t v9 = [(PGMomentNodeRuleInterpreter *)self evaluateMomentNodes:v6 forPersonCondition:v7];
  }
  else
  {
    if (v8 == 1) {
      [(PGMomentNodeRuleInterpreter *)self evaluateMomentNodes:v6 forDateRangeCondition:v7];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (PGMomentNodeRuleInterpreter)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMomentNodeRuleInterpreter;
  id v6 = [(PGMomentNodeRuleInterpreter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

@end