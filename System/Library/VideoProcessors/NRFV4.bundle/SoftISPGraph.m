@interface SoftISPGraph
- (SoftISPGraph)init;
- (id)addConnectionFromStage:(void *)a3 fromProperty:(void *)a4 toStage:(void *)a5 toProperty:;
- (id)description;
- (id)executionOrder;
- (uint64_t)addConnectionFromStage:(void *)a3 fromProperty:(void *)a4 toStage:(void *)a5 toProperty:(uint64_t)a6 isNullable:;
- (uint64_t)addStage:(void *)a3 withName:;
- (uint64_t)connectionsBySourceStage;
- (uint64_t)outputStageName;
- (uint64_t)stagesByName;
@end

@implementation SoftISPGraph

- (id)executionOrder
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v33 = objc_opt_new();
    if (!v33) {
      goto LABEL_38;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = *(id *)(a1 + 24);
    uint64_t v1 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v3 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v39 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v6 = objc_opt_new();
          if (!v6)
          {
            FigDebugAssert3();
            FigSignalErrorAt();

            goto LABEL_31;
          }
          v7 = (void *)v6;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v8 = [*(id *)(a1 + 24) objectForKeyedSubscript:v5];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v35 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = -[RawNightModeInputFrame pixelBuffer](*(void *)(*((void *)&v34 + 1) + 8 * j));
                [v7 addObject:v13];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v10);
          }

          [v33 setObject:v7 forKeyedSubscript:v5];
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }

    uint64_t v14 = [*(id *)(a1 + 32) mutableCopy];
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = objc_opt_new();
      if (v16)
      {
        v17 = (void *)v16;
        while ([v15 count])
        {
          v18 = [v15 firstObject];
          [v15 removeObjectAtIndex:0];
          if (([v18 destinationIsGraphOutput] & 1) == 0)
          {
            v19 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v18);
            v20 = [v33 objectForKeyedSubscript:v19];

            v21 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)v18);
            int v22 = [v20 containsObject:v21];

            if (!v22)
            {
              FigSignalErrorAt();

              goto LABEL_37;
            }
            v23 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)v18);
            [v20 removeObject:v23];

            if (![v20 count])
            {
              v24 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v18);
              [v33 removeObjectForKey:v24];

              v25 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v18);
              [v17 addObject:v25];

              v26 = *(void **)(a1 + 16);
              v27 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v18);
              v28 = [v26 objectForKeyedSubscript:v27];
              [v15 addObjectsFromArray:v28];
            }
          }
        }
        if (![v33 count])
        {
          id v29 = v17;

          goto LABEL_32;
        }
        FigSignalErrorAt();
LABEL_37:
      }
      else
      {
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    else
    {
LABEL_38:
      FigDebugAssert3();
      FigSignalErrorAt();
    }
LABEL_31:
    id v29 = 0;
LABEL_32:
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (uint64_t)addConnectionFromStage:(void *)a3 fromProperty:(void *)a4 toStage:(void *)a5 toProperty:(uint64_t)a6 isNullable:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (!a1)
  {
    uint64_t v35 = 0;
    goto LABEL_35;
  }
  if (!v11 || !v12 || !v13 || !v14)
  {
    FigDebugAssert3();
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_35;
  }
  id v39 = v11;
  int v16 = +[SoftISPConnection sourceNameIsInput:]((uint64_t)SoftISPConnection, v11);
  int v17 = +[SoftISPConnection destinationNameIsOutput:]((uint64_t)SoftISPConnection, v13);
  if ((v16 & 1) == 0
    && ([a1[1] objectForKeyedSubscript:v11],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18)
    || (v17 & 1) == 0
    && ([a1[1] objectForKeyedSubscript:v13],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        !v19))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_33:
    uint64_t v35 = 0;
    goto LABEL_34;
  }
  uint64_t v20 = [NSString stringWithFormat:@"%@#%@", v13, v15];
  if (!v20)
  {
    FigDebugAssert3();
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_34;
  }
  v21 = (void *)v20;
  if ([a1[6] containsObject:v20]
    || (id v22 = [[SoftISPConnection alloc] initFromStage:v39 fromProperty:v12 toStage:v13 toProperty:v15 isNullable:a6]) == 0)
  {
    FigDebugAssert3();
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_30;
  }
  v23 = v22;
  [a1[6] addObject:v21];
  if (v16)
  {
    [a1[4] addObject:v23];
    v25 = a1 + 7;
    id v24 = a1[7];
    if (v24)
    {
      objc_storeStrong(a1 + 7, v24);
      if (!v17) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v31 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v23);
      v32 = *v25;
      void *v25 = (void *)v31;

      if (!v17) {
        goto LABEL_25;
      }
    }
    goto LABEL_21;
  }
  v26 = [a1[2] objectForKeyedSubscript:v39];
  if (!v26)
  {
    uint64_t v27 = objc_opt_new();
    if (!v27) {
      goto LABEL_39;
    }
    v26 = (void *)v27;
    [a1[2] setObject:v27 forKeyedSubscript:v39];
  }
  [v26 addObject:v23];

  if (v17)
  {
LABEL_21:
    [a1[5] addObject:v23];
    id v30 = a1[8];
    id v29 = a1 + 8;
    v28 = v30;
    if (v30)
    {
      objc_storeStrong(v29, v28);
    }
    else
    {
      uint64_t v36 = -[SoftISPGraph connectionsBySourceStage]((uint64_t)v23);
      id v37 = *v29;
      *id v29 = (id)v36;
    }
    goto LABEL_33;
  }
LABEL_25:
  v33 = [a1[3] objectForKeyedSubscript:v13];
  if (!v33)
  {
    uint64_t v34 = objc_opt_new();
    if (v34)
    {
      v33 = (void *)v34;
      [a1[3] setObject:v34 forKeyedSubscript:v13];
      goto LABEL_28;
    }
LABEL_39:
    FigDebugAssert3();
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_29;
  }
LABEL_28:
  [v33 addObject:v23];

  uint64_t v35 = 0;
LABEL_29:

LABEL_30:
LABEL_34:
  id v11 = v39;
LABEL_35:

  return v35;
}

- (uint64_t)connectionsBySourceStage
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)stagesByName
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (id)addConnectionFromStage:(void *)a3 fromProperty:(void *)a4 toStage:(void *)a5 toProperty:
{
  if (result) {
    return (id *)-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](result, a2, a3, a4, a5, 0);
  }
  return result;
}

- (uint64_t)addStage:(void *)a3 withName:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v5
      || !v6
      || ([*(id *)(a1 + 8) objectForKeyedSubscript:v6],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8)
      || (uint64_t v9 = objc_opt_new()) == 0)
    {
      FigDebugAssert3();
      uint64_t v11 = FigSignalErrorAt();
      goto LABEL_8;
    }
    uint64_t v10 = (void *)v9;
    [*(id *)(a1 + 8) setObject:v5 forKeyedSubscript:v7];
    [*(id *)(a1 + 16) setObject:v10 forKeyedSubscript:v7];
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (SoftISPGraph)init
{
  v17.receiver = self;
  v17.super_class = (Class)SoftISPGraph;
  uint64_t v2 = [(SoftISPGraph *)&v17 init];
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = objc_opt_new();
  stagesByName = v2->_stagesByName;
  v2->_stagesByName = (NSMutableDictionary *)v3;

  if (!v2->_stagesByName) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_new();
  connectionsBySourceStage = v2->_connectionsBySourceStage;
  v2->_connectionsBySourceStage = (NSMutableDictionary *)v5;

  if (!v2->_connectionsBySourceStage) {
    goto LABEL_10;
  }
  uint64_t v7 = objc_opt_new();
  connectionsByDestinationStage = v2->_connectionsByDestinationStage;
  v2->_connectionsByDestinationStage = (NSMutableDictionary *)v7;

  if (!v2->_connectionsByDestinationStage) {
    goto LABEL_10;
  }
  uint64_t v9 = objc_opt_new();
  inputConnections = v2->_inputConnections;
  v2->_inputConnections = (NSMutableArray *)v9;

  if (!v2->_inputConnections) {
    goto LABEL_10;
  }
  uint64_t v11 = objc_opt_new();
  outputConnections = v2->_outputConnections;
  v2->_outputConnections = (NSMutableArray *)v11;

  if (!v2->_outputConnections) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_opt_new();
  assignedDestinationNames = v2->_assignedDestinationNames;
  v2->_assignedDestinationNames = (NSMutableSet *)v13;

  if (v2->_assignedDestinationNames)
  {
    v15 = v2;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(NSMutableDictionary *)self->_stagesByName allKeys];
  uint64_t v7 = [v3 stringWithFormat:@"%@(stages=%@)", v5, v6];

  return v7;
}

- (uint64_t)outputStageName
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStageName, 0);
  objc_storeStrong((id *)&self->_inputStageName, 0);
  objc_storeStrong((id *)&self->_assignedDestinationNames, 0);
  objc_storeStrong((id *)&self->_outputConnections, 0);
  objc_storeStrong((id *)&self->_inputConnections, 0);
  objc_storeStrong((id *)&self->_connectionsByDestinationStage, 0);
  objc_storeStrong((id *)&self->_connectionsBySourceStage, 0);

  objc_storeStrong((id *)&self->_stagesByName, 0);
}

@end