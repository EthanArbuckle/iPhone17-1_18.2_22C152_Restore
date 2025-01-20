@interface PGNeighborScoreComputer
- (BOOL)_hasAddressNodesForMomentNode:(id)a3;
- (CLLocationCoordinate2D)_bestLocationCoordinateForMomentNode:(id)a3;
- (PGNeighborScoreComputer)init;
- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andDistanceBlock:(id)a5;
- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 referenceDistance:(double)a5 andDistanceBlock:(id)a6;
- (double)_densityScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andNumberOfAssets:(unint64_t)a5;
- (double)_locationScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andLocationCoordinate:(const CLLocationCoordinate2D *)a5;
- (double)_peopleScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andPersonLocalIdentifiers:(id)a5;
- (double)maximumNeighborScoreWithMomentNodes:(id)a3;
- (double)neighborScoreWithHighlightNode:(id)a3;
- (double)neighborScoreWithMomentNode:(id)a3;
- (id)_momentNodeCachedValuesForIdentifier:(unint64_t)a3;
- (id)_nextMomentNodeForMomentNode:(id)a3;
- (id)_personLocalIdentifiersForMomentNode:(id)a3;
- (id)_previousMomentNodeForMomentNode:(id)a3;
- (id)neighborsFromMomentNode:(id)a3 count:(unint64_t)a4 locationRequired:(BOOL)a5 minDayDuration:(unint64_t)a6 maxDayDuration:(unint64_t)a7;
@end

@implementation PGNeighborScoreComputer

- (void).cxx_destruct
{
}

- (id)neighborsFromMomentNode:(id)a3 count:(unint64_t)a4 locationRequired:(BOOL)a5 minDayDuration:(unint64_t)a6 maxDayDuration:(unint64_t)a7
{
  id v12 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  os_unfair_lock_lock(&self->_numberOfMomentNodesLock);
  unint64_t numberOfMomentNodes = self->_numberOfMomentNodes;
  if (!numberOfMomentNodes)
  {
    v15 = [v12 graph];
    v16 = +[PGGraphNodeCollection nodesInGraph:v15];
    self->_unint64_t numberOfMomentNodes = [v16 count];

    unint64_t numberOfMomentNodes = self->_numberOfMomentNodes;
  }
  os_unfair_lock_unlock(&self->_numberOfMomentNodesLock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__PGNeighborScoreComputer_neighborsFromMomentNode_count_locationRequired_minDayDuration_maxDayDuration___block_invoke;
  v22[3] = &unk_1E68E93B8;
  unint64_t v26 = a6;
  unint64_t v27 = a4;
  unint64_t v28 = a7;
  unint64_t v29 = numberOfMomentNodes;
  id v23 = v12;
  v24 = self;
  BOOL v30 = a5;
  id v17 = v13;
  id v25 = v17;
  id v18 = v12;
  v19 = (void (**)(void *, uint64_t))_Block_copy(v22);
  v19[2](v19, 1);
  v19[2](v19, 0);
  id v20 = v17;

  return v20;
}

void __104__PGNeighborScoreComputer_neighborsFromMomentNode_count_locationRequired_minDayDuration_maxDayDuration___block_invoke(uint64_t a1, char a2)
{
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
LABEL_2:
  v8 = v4;
  while (v5 < *(void *)(a1 + 56) || v7 < *(void *)(a1 + 64))
  {
    if (v5 >= *(void *)(a1 + 72) || v8 == 0) {
      break;
    }
    if ((unint64_t)++v6 > *(void *)(a1 + 80))
    {
      v14 = +[PGLogging sharedLogging];
      v15 = [v14 loggingConnection];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Too many iterations thru Moments's NEXT chain, triggering graph rebuild and bailing out", buf, 2u);
      }

      __assert_rtn("-[PGNeighborScoreComputer neighborsFromMomentNode:count:locationRequired:minDayDuration:maxDayDuration:]_block_invoke", "PGNeighborScoreComputer.m", 393, "NO");
    }
    v10 = *(void **)(a1 + 40);
    id v16 = v8;
    if (a2) {
      [v10 _previousMomentNodeForMomentNode:v8];
    }
    else {
    id v4 = [v10 _nextMomentNodeForMomentNode:v8];
    }

    v8 = 0;
    if (v4)
    {
      v11 = [*(id *)(a1 + 32) localStartDate];
      id v12 = [v4 localStartDate];
      [v11 timeIntervalSinceDate:v12];
      unint64_t v5 = vcvtmd_u64_f64(fabs(v13) / 86400.0);

      if (*(void *)(a1 + 72) > v5
        && (!*(unsigned char *)(a1 + 88) || [*(id *)(a1 + 40) _hasAddressNodesForMomentNode:v4]))
      {
        [*(id *)(a1 + 48) addObject:v4];
        ++v7;
      }
      goto LABEL_2;
    }
  }
}

- (BOOL)_hasAddressNodesForMomentNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  if ([v5 hasAddressNodesIsSet])
  {
    LOBYTE(v6) = [v5 hasAddressNodes];
  }
  else
  {
    uint64_t v6 = [v4 hasAddressNodes];
    [v5 setHasAddressNodes:v6];
    [v5 setHasAddressNodesIsSet:1];
  }

  return v6;
}

- (id)_nextMomentNodeForMomentNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  uint64_t v6 = [v5 nextMomentNode];
  unint64_t v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    uint64_t v8 = [v4 nextMomentNode];

    [v5 setNextMomentNode:v8];
    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (id)_previousMomentNodeForMomentNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  uint64_t v6 = [v5 previousMomentNode];
  unint64_t v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    uint64_t v8 = [v4 previousMomentNode];

    [v5 setPreviousMomentNode:v8];
    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (CLLocationCoordinate2D)_bestLocationCoordinateForMomentNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  [v5 bestLocationCoordinate];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.longitude = v11;
  result.latitude = v10;
  return result;
}

- (id)_personLocalIdentifiersForMomentNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  double v6 = [v5 personLocalIdentifiers];
  if (!v6)
  {
    double v7 = [v4 collection];
    double v8 = [v7 personNodes];
    double v6 = [v8 localIdentifiers];

    [v5 setPersonLocalIdentifiers:v6];
  }

  return v6;
}

- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 referenceDistance:(double)a5 andDistanceBlock:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = (double (**)(id, void *))a6;
  id v12 = objc_opt_new();
  uint64_t v40 = 0;
  v41 = (double *)&v40;
  uint64_t v42 = 0x2020000000;
  double v43 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        double v18 = v11[2](v11, v17);
        if (v10)
        {
          v19 = [v17 localStartDate];
          [v10 timeIntervalSinceDate:v19];
          double v21 = v20;

          double v18 = v18 / fmax((double)vcvtmd_u64_f64(fabs(v21) / 86400.0) * 0.5, 1.0);
        }
        v22 = [NSNumber numberWithDouble:v18];
        [v12 addObject:v22];

        v41[3] = v18 + v41[3];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v14);
  }

  uint64_t v23 = [v13 count];
  double v24 = v41[3] / (double)(unint64_t)(v23 + 1);
  v41[3] = v24;
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  double v35 = (a5 - v24) * (a5 - v24);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __115__PGNeighborScoreComputer__calculateScoreWithNeighborMomentNodes_referenceDate_referenceDistance_andDistanceBlock___block_invoke;
  v31[3] = &unk_1E68E9390;
  v31[4] = &v32;
  v31[5] = &v40;
  [v12 enumerateObjectsUsingBlock:v31];
  double v25 = sqrt(v33[3] / (double)(unint64_t)([v13 count] + 1));
  v33[3] = v25;
  double v26 = 0.0;
  if (v25 > 0.0)
  {
    double v27 = v41[3];
    double v28 = v27 - v25;
    double v29 = v25 + v27;
    if (v25 + v27 >= a5) {
      double v29 = a5;
    }
    if (v28 < v29) {
      double v28 = v29;
    }
    double v26 = (v25 + v28 - v27) / (v25 + v25);
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v40, 8);

  return v26;
}

double __115__PGNeighborScoreComputer__calculateScoreWithNeighborMomentNodes_referenceDate_referenceDistance_andDistanceBlock___block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3 - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 * v4 + *(double *)(v5 + 24);
  *(double *)(v5 + 24) = result;
  return result;
}

- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andDistanceBlock:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (double (**)(id, void *))a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v7);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v18 = v9[2](v9, v17);
        double v19 = v18;
        if (v8)
        {
          double v20 = [v17 localStartDate];
          [v8 timeIntervalSinceDate:v20];
          double v22 = floor(fabs(v21) / 86400.0);

          double v18 = v19 / fmax((double)(unint64_t)v22 * 0.5, 1.0);
        }
        if (v13 < v19) {
          double v13 = v19;
        }
        if (v14 >= v19) {
          double v14 = v19;
        }
        double v15 = v15 + v18;
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    double v15 = 0.0;
  }
  double v23 = v15 / (double)(unint64_t)[v7 count];
  if (v23 == 0.0 || v13 <= v14)
  {
    if (v13 >= 1.0 && v14 == v13) {
      double v26 = 1.0;
    }
    else {
      double v26 = 0.0;
    }
  }
  else
  {
    double v27 = (v23 - v14) / (v13 - v14);
    if (v27 > 1.0) {
      double v27 = 1.0;
    }
    double v26 = fmax(v27, 0.0);
  }

  return v26;
}

- (double)_locationScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andLocationCoordinate:(const CLLocationCoordinate2D *)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__PGNeighborScoreComputer__locationScoreWithNeighborMomentNodes_referenceDate_andLocationCoordinate___block_invoke;
  v6[3] = &unk_1E68E9368;
  v6[4] = self;
  v6[5] = a5;
  [(PGNeighborScoreComputer *)self _calculateScoreWithNeighborMomentNodes:a3 referenceDate:a4 andDistanceBlock:v6];
  return result;
}

uint64_t __101__PGNeighborScoreComputer__locationScoreWithNeighborMomentNodes_referenceDate_andLocationCoordinate___block_invoke(uint64_t a1, uint64_t a2)
{
  return CLLocationCoordinate2DGetDistanceFrom();
}

- (double)_peopleScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andPersonLocalIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = (double)(unint64_t)[v7 count];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__PGNeighborScoreComputer__peopleScoreWithNeighborMomentNodes_referenceDate_andPersonLocalIdentifiers___block_invoke;
  v14[3] = &unk_1E68E9340;
  v14[4] = self;
  id v15 = v7;
  id v10 = v7;
  [(PGNeighborScoreComputer *)self _calculateScoreWithNeighborMomentNodes:v8 referenceDate:0 referenceDistance:v14 andDistanceBlock:v9];
  double v12 = v11;

  return v12;
}

double __103__PGNeighborScoreComputer__peopleScoreWithNeighborMomentNodes_referenceDate_andPersonLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [*(id *)(a1 + 32) _personLocalIdentifiersForMomentNode:a2];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(a1 + 40) containsObject:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)_densityScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andNumberOfAssets:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke;
  v19[3] = &unk_1E68EB798;
  v19[4] = v20;
  [v8 enumerateObjectsUsingBlock:v19];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_2;
  aBlock[3] = &unk_1E68E92F0;
  aBlock[4] = v20;
  id v10 = (double (**)(void *, unint64_t))_Block_copy(aBlock);
  double v11 = v10[2](v10, a5);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_3;
  v16[3] = &unk_1E68E9318;
  long long v12 = v10;
  id v17 = v12;
  [(PGNeighborScoreComputer *)self _calculateScoreWithNeighborMomentNodes:v8 referenceDate:v9 referenceDistance:v16 andDistanceBlock:v11];
  double v14 = v13;

  _Block_object_dispose(v20, 8);
  return v14;
}

unint64_t __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 numberOfAssets];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

double __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2) {
    return round(atan((double)a2 / 19.0985932) * 19.0985932);
  }
  else {
    return 0.0;
  }
}

uint64_t __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 numberOfAssets];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (double)maximumNeighborScoreWithMomentNodes:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PGNeighborScoreComputer_maximumNeighborScoreWithMomentNodes___block_invoke;
  v7[3] = &unk_1E68EF338;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateNodesUsingBlock:v7];
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __63__PGNeighborScoreComputer_maximumNeighborScoreWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) neighborScoreWithMomentNode:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
  return result;
}

- (double)neighborScoreWithHighlightNode:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v5 = [v4 collection];
  unint64_t v6 = [v5 momentNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PGNeighborScoreComputer_neighborScoreWithHighlightNode___block_invoke;
  v9[3] = &unk_1E68EF338;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateNodesUsingBlock:v9];

  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __58__PGNeighborScoreComputer_neighborScoreWithHighlightNode___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) neighborScoreWithMomentNode:a2];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (double)neighborScoreWithMomentNode:(id)a3
{
  id v4 = a3;
  double v5 = -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", [v4 identifier]);
  [v5 neighborScore];
  double v7 = v6;

  return v7;
}

- (id)_momentNodeCachedValuesForIdentifier:(unint64_t)a3
{
  momentNodeCachedValuesByIdentifier = self->_momentNodeCachedValuesByIdentifier;
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  double v7 = [(NSMutableDictionary *)momentNodeCachedValuesByIdentifier objectForKeyedSubscript:v6];

  if (!v7)
  {
    double v7 = objc_alloc_init(PGMomentNodeCachedValues);
    uint64_t v8 = self->_momentNodeCachedValuesByIdentifier;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (PGNeighborScoreComputer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGNeighborScoreComputer;
  uint64_t v2 = [(PGNeighborScoreComputer *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    momentNodeCachedValuesByIdentifier = v2->_momentNodeCachedValuesByIdentifier;
    v2->_momentNodeCachedValuesByIdentifier = v3;

    v2->_numberOfMomentNodesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end