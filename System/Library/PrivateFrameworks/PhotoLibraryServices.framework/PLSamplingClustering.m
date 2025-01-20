@interface PLSamplingClustering
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (unint64_t)numberOfClusters;
- (void)setNumberOfClusters:(unint64_t)a3;
@end

@implementation PLSamplingClustering

- (void)setNumberOfClusters:(unint64_t)a3
{
  self->_numberOfClusters = a3;
}

- (unint64_t)numberOfClusters
{
  return self->_numberOfClusters;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_numberOfClusters <= 1) {
    unint64_t numberOfClusters = 1;
  }
  else {
    unint64_t numberOfClusters = self->_numberOfClusters;
  }
  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:numberOfClusters];
  float v10 = (float)(unint64_t)[v6 count] / (float)numberOfClusters;
  unint64_t v11 = vcvtps_u32_f32(v10);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__35662;
  v33 = __Block_byref_object_dispose__35663;
  id v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __57__PLSamplingClustering_performWithDataset_progressBlock___block_invoke;
  v22 = &unk_1E5868F68;
  float v28 = v10;
  id v12 = v9;
  id v23 = v12;
  v26 = &v29;
  unint64_t v27 = v11;
  id v13 = v7;
  id v25 = v13;
  id v14 = v6;
  id v24 = v14;
  [v14 enumerateObjectsUsingBlock:&v19];
  if (objc_msgSend((id)v30[5], "count", v19, v20, v21, v22))
  {
    v15 = +[PLDataCluster clusterWithObjects:v30[5]];
    [v12 addObject:v15];
  }
  v16 = v24;
  id v17 = v12;

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __57__PLSamplingClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v14 = a2;
  float v7 = (float)a3;
  unint64_t v8 = (unint64_t)(float)((float)a3 / *(float *)(a1 + 72)) - 1;
  if (v8 == [*(id *)(a1 + 32) count])
  {
    v9 = +[PLDataCluster clusterWithObjects:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [*(id *)(a1 + 32) addObject:v9];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 64)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, double))(v13 + 16))(v13, a4, (float)(v7 / (float)(unint64_t)[*(id *)(a1 + 40) count]));
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v14];
}

@end