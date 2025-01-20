@interface PXStoryMemoryMomentConcreteClusteringDistanceCalculator
- (PXStoryMemoryMomentConcreteClusteringDistanceCalculator)initWithWeights:(id)a3 locationsByAssetUUID:(id)a4 faceprintsByAssetUUID:(id)a5;
- (double)faceWeight;
- (double)locationWeight;
- (double)timeWeight;
- (id)densityClusteringDistanceBlockForAssets:(id)a3;
- (void)clusteringDistanceForAssets:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 resultHandler:(id)a6;
@end

@implementation PXStoryMemoryMomentConcreteClusteringDistanceCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintsByAssetUUID, 0);
  objc_storeStrong((id *)&self->_locationsByAssetUUID, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (double)faceWeight
{
  return self->_faceWeight;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (double)timeWeight
{
  return self->_timeWeight;
}

- (void)clusteringDistanceForAssets:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 resultHandler:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(void, __n128, __n128, __n128, __n128))a6;
  v12 = (void *)MEMORY[0x1AD10CB00]();
  if (v11)
  {
    v13 = [v10 objectAtIndex:a4];
    uint64_t v14 = [v10 objectAtIndex:a5];
    v19 = (void *)v14;
    if (v13 && v14)
    {
      v20 = [v13 creationDate];
      v21 = [v19 creationDate];
      [v20 timeIntervalSinceDate:v21];
      double v23 = v22;

      if (v23 < 0.0) {
        double v23 = -v23;
      }
      double v28 = 1.0;
      double v29 = 1.0;
      if (self->_locationWeight > 0.0)
      {
        locationsByAssetUUID = self->_locationsByAssetUUID;
        v31 = [v13 uuid];
        v32 = [(NSDictionary *)locationsByAssetUUID objectForKeyedSubscript:v31];

        v33 = self->_locationsByAssetUUID;
        v34 = [v19 uuid];
        v35 = [(NSDictionary *)v33 objectForKeyedSubscript:v34];

        if (v32 && v35)
        {
          [v32 distanceFromLocation:v35];
          double v29 = v36;
        }
      }
      if (self->_faceWeight > 0.0)
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        faceprintsByAssetUUID = self->_faceprintsByAssetUUID;
        v38 = [v13 uuid];
        v39 = [(NSDictionary *)faceprintsByAssetUUID objectForKeyedSubscript:v38];

        uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v72 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          v56 = v13;
          v57 = v12;
          v58 = v11;
          id v59 = v10;
          char v42 = 0;
          uint64_t v61 = *(void *)v68;
          v62 = v19;
          double v28 = 3.40282347e38;
          obuint64_t j = v39;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v68 != v61) {
                objc_enumerationMutation(obj);
              }
              v44 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              v45 = self;
              v46 = self->_faceprintsByAssetUUID;
              v47 = [v62 uuid];
              v48 = [(NSDictionary *)v46 objectForKeyedSubscript:v47];

              uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
              if (v49)
              {
                uint64_t v50 = v49;
                uint64_t v51 = *(void *)v64;
                do
                {
                  for (uint64_t j = 0; j != v50; ++j)
                  {
                    if (*(void *)v64 != v51) {
                      objc_enumerationMutation(v48);
                    }
                    v53 = [v44 computeDistance:*(void *)(*((void *)&v63 + 1) + 8 * j) withDistanceFunction:0 error:0];
                    v54 = v53;
                    if (v53)
                    {
                      [v53 doubleValue];
                      if (v28 >= v55) {
                        double v28 = v55;
                      }
                      char v42 = 1;
                    }
                  }
                  uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
                }
                while (v50);
              }

              self = v45;
            }
            uint64_t v41 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
          }
          while (v41);

          if ((v42 & 1) == 0) {
            double v28 = 1.0;
          }
          v11 = v58;
          id v10 = v59;
          v13 = v56;
          v12 = v57;
          v19 = v62;
        }
        else
        {
        }
      }
      v24.n128_f64[0] = v29 * self->_locationWeight + v23 * self->_timeWeight + v28 * self->_faceWeight;
      v25.n128_f64[0] = v29;
      v26.n128_f64[0] = v23;
      v27.n128_f64[0] = v28;
      v11[2](v11, v24, v25, v26, v27);
    }
    else
    {
      v15.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      v16.n128_u64[0] = 0;
      v17.n128_u64[0] = 0;
      v18.n128_u64[0] = 0;
      v11[2](v11, v15, v16, v17, v18);
    }
  }
}

- (id)densityClusteringDistanceBlockForAssets:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke;
  v8[3] = &unk_1E5DB7FE0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

double __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  __n128 v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = [v5 intValue];
  int v10 = [v6 intValue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke_2;
  v13[3] = &unk_1E5DB7FB8;
  v13[4] = &v14;
  [v7 clusteringDistanceForAssets:v8 fromIndex:v9 toIndex:v10 resultHandler:v13];
  double v11 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (PXStoryMemoryMomentConcreteClusteringDistanceCalculator)initWithWeights:(id)a3 locationsByAssetUUID:(id)a4 faceprintsByAssetUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryMemoryMomentConcreteClusteringDistanceCalculator;
  double v11 = [(PXStoryMemoryMomentConcreteClusteringDistanceCalculator *)&v24 init];
  if (v11)
  {
    v12 = [v8 objectForKeyedSubscript:@"time"];
    if (v12)
    {
      v13 = [v8 objectForKeyedSubscript:@"time"];
      [v13 doubleValue];
      *((void *)v11 + 5) = v14;
    }
    else
    {
      *((void *)v11 + 5) = 0x3FF0000000000000;
    }

    __n128 v15 = [v8 objectForKeyedSubscript:@"location"];
    if (v15)
    {
      uint64_t v16 = [v8 objectForKeyedSubscript:@"location"];
      [v16 doubleValue];
      *((void *)v11 + 6) = v17;
      __n128 v18 = v11 + 48;
    }
    else
    {
      *((void *)v11 + 6) = 0x3FF0000000000000;
      __n128 v18 = v11 + 48;
    }

    v19 = [v8 objectForKeyedSubscript:@"face"];
    if (v19)
    {
      v20 = [v8 objectForKeyedSubscript:@"face"];
      [v20 doubleValue];
      *((void *)v11 + 7) = v21;
      double v22 = v11 + 56;
    }
    else
    {
      *((void *)v11 + 7) = 0x3FF0000000000000;
      double v22 = v11 + 56;
    }

    if (!v10) {
      *double v22 = 0;
    }
    if ((unint64_t)[v9 count] <= 1) {
      *__n128 v18 = 0;
    }
    objc_storeStrong((id *)v11 + 3, a4);
    objc_storeStrong((id *)v11 + 4, a5);
  }

  return (PXStoryMemoryMomentConcreteClusteringDistanceCalculator *)v11;
}

@end