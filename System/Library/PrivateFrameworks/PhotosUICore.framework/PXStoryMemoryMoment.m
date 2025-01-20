@interface PXStoryMemoryMoment
- (PXDisplayAsset)firstAsset;
- (PXDisplayAsset)lastAsset;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4;
- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4 diagnosticDistanceCalculator:(id)a5;
- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indicesArray:(id)a4 diagnosticDistanceCalculator:(id)a5;
- (PXStoryMemoryMomentClusteringDistanceCalculator)diagnosticDistanceCalculator;
- (_NSRange)assetIndexRange;
- (double)faceClusteringDistance;
- (double)locationClusteringDistance;
- (double)timeClusteringDistance;
- (double)totalWeightedClusteringDistance;
- (id)assetAtIndex:(unint64_t)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)firstGlobalIndex;
- (unint64_t)lastGlobalIndex;
- (void)_calculateDiagnostics;
- (void)enumerateAssetsUsingBlock:(id)a3;
@end

@implementation PXStoryMemoryMoment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticDistanceCalculator, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

- (PXStoryMemoryMomentClusteringDistanceCalculator)diagnosticDistanceCalculator
{
  return self->_diagnosticDistanceCalculator;
}

- (double)faceClusteringDistance
{
  if (!self->_diagnosticsCalculated) {
    [(PXStoryMemoryMoment *)self _calculateDiagnostics];
  }
  return self->_faceClusteringDistance;
}

- (double)timeClusteringDistance
{
  if (!self->_diagnosticsCalculated) {
    [(PXStoryMemoryMoment *)self _calculateDiagnostics];
  }
  return self->_timeClusteringDistance;
}

- (double)locationClusteringDistance
{
  if (!self->_diagnosticsCalculated) {
    [(PXStoryMemoryMoment *)self _calculateDiagnostics];
  }
  return self->_locationClusteringDistance;
}

- (double)totalWeightedClusteringDistance
{
  if (!self->_diagnosticsCalculated) {
    [(PXStoryMemoryMoment *)self _calculateDiagnostics];
  }
  return self->_totalWeightedClusteringDistance;
}

- (void)_calculateDiagnostics
{
  self->_diagnosticsCalculated = 1;
  diagnosticDistanceCalculator = self->_diagnosticDistanceCalculator;
  displayAssets = self->_displayAssets;
  unint64_t v5 = [(PXStoryMemoryMoment *)self firstGlobalIndex];
  unint64_t v6 = [(PXStoryMemoryMoment *)self lastGlobalIndex];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PXStoryMemoryMoment__calculateDiagnostics__block_invoke;
  v7[3] = &unk_1E5DC1678;
  v7[4] = self;
  [(PXStoryMemoryMomentClusteringDistanceCalculator *)diagnosticDistanceCalculator clusteringDistanceForAssets:displayAssets fromIndex:v5 toIndex:v6 resultHandler:v7];
}

uint64_t __44__PXStoryMemoryMoment__calculateDiagnostics__block_invoke(uint64_t result, double a2, double a3, double a4, double a5)
{
  *(double *)(*(void *)(result + 32) + 32) = a2;
  *(double *)(*(void *)(result + 32) + 40) = a3;
  *(double *)(*(void *)(result + 32) + 48) = a4;
  *(double *)(*(void *)(result + 32) + 56) = a5;
  return result;
}

- (unint64_t)lastGlobalIndex
{
  return [(NSIndexSet *)self->_indices lastIndex];
}

- (unint64_t)firstGlobalIndex
{
  return [(NSIndexSet *)self->_indices firstIndex];
}

- (_NSRange)assetIndexRange
{
  NSUInteger v3 = [(NSIndexSet *)self->_indices firstIndex];
  NSUInteger v4 = [(NSIndexSet *)self->_indices count];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (PXDisplayAsset)lastAsset
{
  NSUInteger v3 = [(NSIndexSet *)self->_indices count] - 1;
  return (PXDisplayAsset *)[(PXStoryMemoryMoment *)self assetAtIndex:v3];
}

- (PXDisplayAsset)firstAsset
{
  return (PXDisplayAsset *)[(PXStoryMemoryMoment *)self assetAtIndex:0];
}

- (unint64_t)count
{
  return [(NSIndexSet *)self->_indices count];
}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  id v4 = a3;
  indices = self->_indices;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXStoryMemoryMoment_enumerateAssetsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DD06A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSIndexSet *)indices enumerateIndexesUsingBlock:v7];
}

void __49__PXStoryMemoryMoment_enumerateAssetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 16) firstIndex];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)assetAtIndex:(unint64_t)a3
{
  if ([(PXStoryMemoryMoment *)self count] <= a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryMoment.m", 71, @"Index %ld beyond bounds [0 .. %ld]", a3, -[PXStoryMemoryMoment count](self, "count") - 1);
  }
  NSUInteger v6 = [(NSIndexSet *)self->_indices firstIndex] + a3;
  displayAssets = self->_displayAssets;
  return (id)[(PXDisplayAssetFetchResult *)displayAssets objectAtIndex:v6];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; display asset range = [%ld, %ld]",
               objc_opt_class(),
               self,
               [(NSIndexSet *)self->_indices firstIndex],
               [(NSIndexSet *)self->_indices lastIndex]);
}

- (PXDisplayAssetFetchResult)displayAssets
{
}

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4 diagnosticDistanceCalculator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)[v10 rangeCount] >= 2)
  {
    uint64_t v12 = [v10 firstIndex];
    uint64_t v13 = [v10 lastIndex];
    uint64_t v14 = v13 - [v10 firstIndex] + 1;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", v12, v14);
    uint64_t v16 = [v15 copy];

    id v10 = (id)v16;
  }
  v22.receiver = self;
  v22.super_class = (Class)PXStoryMemoryMoment;
  v17 = [(PXStoryMemoryMoment *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAssets, a3);
    uint64_t v19 = [v10 copy];
    indices = v18->_indices;
    v18->_indices = (NSIndexSet *)v19;

    objc_storeStrong((id *)&v18->_diagnosticDistanceCalculator, a5);
  }

  return v18;
}

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4
{
  return [(PXStoryMemoryMoment *)self initWithDisplayAssets:a3 indexSet:a4 diagnosticDistanceCalculator:0];
}

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indicesArray:(id)a4 diagnosticDistanceCalculator:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "addIndex:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16++), "unsignedIntegerValue", (void)v19));
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  v17 = [(PXStoryMemoryMoment *)self initWithDisplayAssets:v8 indexSet:v11 diagnosticDistanceCalculator:v10];
  return v17;
}

@end