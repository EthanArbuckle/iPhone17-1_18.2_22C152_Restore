@interface REFeatureTransmuter
- (BOOL)_supportedFeature:(id)a3;
- (REFeatureSet)inputFeatures;
- (REFeatureSet)outputFeatures;
- (REFeatureTransmuter)initWithInputFeatures:(id)a3 outputFeatures:(id)a4 outputFeatureMapGenerator:(id)a5;
- (id)_buildGraph;
- (id)transformFeatureMaps:(id)a3;
- (void)dealloc;
@end

@implementation REFeatureTransmuter

- (id)_buildGraph
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [[REDependencyGraph alloc] initWithPointerFunctions:0];
  v4 = [(REFeatureSet *)self->_outputSet allFeatures];
  v5 = (void *)[v4 mutableCopy];

  v6 = [MEMORY[0x263EFF9C0] set];
  while ([v5 count])
  {
    v7 = [v5 lastObject];
    [v5 removeLastObject];
    v8 = [v6 member:v7];

    if (v8 != v7)
    {
      if (![(REDependencyGraph *)v3 containsItem:v7]) {
        [(REDependencyGraph *)v3 addItem:v7];
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = objc_msgSend(v7, "_dependentFeatures", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            if (![(REDependencyGraph *)v3 containsItem:v14]) {
              [(REDependencyGraph *)v3 addItem:v14];
            }
            [(REDependencyGraph *)v3 markItem:v7 dependentOnItem:v14];
            [v5 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }

  return v3;
}

void __86__REFeatureTransmuter_initWithInputFeatures_outputFeatures_outputFeatureMapGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_supportedFeature:") & 1) == 0) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature %@ isn't supported", v3, v4, v5, v6, v7, v8, (uint64_t)v9);
  }
}

- (BOOL)_supportedFeature:(id)a3
{
  uint64_t v3 = objc_opt_class();
  if (([v3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([v3 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return [v3 isSubclassOfClass:v5];
}

- (REFeatureSet)outputFeatures
{
  return self->_outputSet;
}

- (REFeatureTransmuter)initWithInputFeatures:(id)a3 outputFeatures:(id)a4 outputFeatureMapGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)REFeatureTransmuter;
  uint64_t v11 = [(REFeatureTransmuter *)&v28 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outputFeatureMapGenerator, a5);
    uint64_t v13 = [v8 copy];
    inputSet = v12->_inputSet;
    v12->_inputSet = (REFeatureSet *)v13;

    uint64_t v15 = [v9 copy];
    outputSet = v12->_outputSet;
    v12->_outputSet = (REFeatureSet *)v15;

    REOptimizeFeatureSetGraph(v12->_outputSet);
    long long v17 = [(REFeatureTransmuter *)v12 _buildGraph];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__REFeatureTransmuter_initWithInputFeatures_outputFeatures_outputFeatureMapGenerator___block_invoke;
    v26[3] = &unk_2644BE3B0;
    long long v18 = v12;
    v27 = v18;
    [v17 enumerateObjectsUsingBlock:v26];
    uint64_t v19 = [v17 topologicalSortedItems];
    orderedFeatures = v18->_orderedFeatures;
    v18->_orderedFeatures = (NSArray *)v19;

    uint64_t v21 = [[REFeatureMapGenerator alloc] initWithFeatureList:v18->_orderedFeatures];
    orderedFeatureMapGenerator = v18->_orderedFeatureMapGenerator;
    v18->_orderedFeatureMapGenerator = v21;

    uint64_t v23 = [(REFeatureMapGenerator *)v18->_orderedFeatureMapGenerator createFeatureMap];
    scratchValues = v18->_scratchValues;
    v18->_scratchValues = (REFeatureMap *)v23;

    v18->_scratchTaggedValues = (unint64_t *)malloc_type_calloc([(REFeatureMap *)v18->_scratchValues featureCount], 8uLL, 0x100004000313F17uLL);
  }

  return v12;
}

- (void)dealloc
{
  free(self->_scratchTaggedValues);
  v3.receiver = self;
  v3.super_class = (Class)REFeatureTransmuter;
  [(REFeatureTransmuter *)&v3 dealloc];
}

- (id)transformFeatureMaps:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(REFeatureMapGenerator *)self->_outputFeatureMapGenerator createFeatureMap];
  [(REFeatureMap *)self->_scratchValues removeAllValues];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __44__REFeatureTransmuter_transformFeatureMaps___block_invoke;
  v60[3] = &unk_2644BE3D8;
  v60[4] = self;
  id v37 = v4;
  id v61 = v37;
  id v6 = v5;
  id v62 = v6;
  uint64_t v7 = (uint64_t (**)(void, void))MEMORY[0x223C31700](v60);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __44__REFeatureTransmuter_transformFeatureMaps___block_invoke_2;
  v58[3] = &unk_2644BE400;
  v58[4] = self;
  id v36 = v6;
  id v59 = v36;
  v40 = (void (**)(void, void, void))MEMORY[0x223C31700](v58);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = self->_orderedFeatures;
  uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v55;
    v45 = self;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 transformer];
          v43 = v9;
          uint64_t v11 = [v9 _dependentFeatures];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = 0;
            uint64_t v16 = *(void *)v51;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v51 != v16) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v18 = v7[2](v7, *(void *)(*((void *)&v50 + 1) + 8 * j));
                if (!v18)
                {

                  goto LABEL_30;
                }
                self->_scratchTaggedValues[v15++] = v18;
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v64 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v15 = 0;
          }

          v33 = (const void *)[v10 _createTransformFromValues:self->_scratchTaggedValues count:v15];
          ((void (**)(void, void *, const void *))v40)[2](v40, v43, v33);
          REReleaseFeatureValueTaggedPointer(v33);
LABEL_30:
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = i;
            v44 = v9;
            uint64_t v19 = [v9 features];
            v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v19, "count"));
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v21 = v19;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v63 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = 0;
              uint64_t v25 = *(void *)v47;
              while (2)
              {
                for (uint64_t k = 0; k != v23; ++k)
                {
                  if (*(void *)v47 != v25) {
                    objc_enumerationMutation(v21);
                  }
                  v27 = *(void **)(*((void *)&v46 + 1) + 8 * k);
                  uint64_t v28 = ((uint64_t (**)(void, void *))v7)[2](v7, v27);
                  if (!v28)
                  {

                    goto LABEL_32;
                  }
                  v45->_scratchTaggedValues[v24++] = v28;
                  v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "_bitCount"));
                  [v20 addObject:v29];
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v63 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }

            uint64_t v30 = RECrossFeatureValues((uint64_t)v45->_scratchTaggedValues, v20);
            v31 = (const void *)RECreateIntegerFeatureValueTaggedPointer(v30);
            ((void (**)(void, void *, const void *))v40)[2](v40, v44, v31);
            REReleaseFeatureValueTaggedPointer(v31);
LABEL_32:

            uint64_t i = v38;
            self = v45;
          }
          else
          {
            uint64_t v32 = ((uint64_t (**)(void, void *))v7)[2](v7, v9);
            ((void (**)(void, void *, uint64_t))v40)[2](v40, v9, v32);
          }
        }
      }
      uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v42);
  }

  id v34 = v36;
  return v34;
}

uint64_t __44__REFeatureTransmuter_transformFeatureMaps___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 8) containsFeature:v3])
  {
    id v4 = (id *)(a1 + 40);
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 16) containsFeature:v3])
  {
    id v4 = (id *)(a1 + 48);
  }
  else
  {
    id v4 = (id *)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v5 = [*v4 valueForFeature:v3];

  return v5;
}

void __44__REFeatureTransmuter_transformFeatureMaps___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v7 = a2;
  if (objc_msgSend(v5, "containsFeature:")) {
    id v6 = (id *)(a1 + 40);
  }
  else {
    id v6 = (id *)(*(void *)(a1 + 32) + 40);
  }
  [*v6 setValue:a3 forFeature:v7];
}

- (REFeatureSet)inputFeatures
{
  return self->_inputSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValuesCacheLock, 0);
  objc_storeStrong((id *)&self->_featureValuesCache, 0);
  objc_storeStrong((id *)&self->_outputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_scratchValues, 0);
  objc_storeStrong((id *)&self->_orderedFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_orderedFeatures, 0);
  objc_storeStrong((id *)&self->_outputSet, 0);
  objc_storeStrong((id *)&self->_inputSet, 0);
}

@end