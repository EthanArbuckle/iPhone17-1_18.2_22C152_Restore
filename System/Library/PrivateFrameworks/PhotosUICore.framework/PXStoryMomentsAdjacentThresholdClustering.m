@interface PXStoryMomentsAdjacentThresholdClustering
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PXStoryMomentsAdjacentThresholdClustering

- (void).cxx_destruct
{
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, unsigned char *))a4;
  id v8 = a3;
  if (![v8 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXStoryAutoEditMomentsProvider.m", 117, @"Invalid parameter not satisfying: %@", @"dataset.count > 0" object file lineNumber description];
  }
  char v20 = 0;
  uint64_t v9 = [v8 count];
  v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v9];
  progress = self->_progress;
  self->_progress = v10;

  v21[0] = @"minimumNumberOfObjects";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects"));
  v21[1] = @"maximumDistance";
  v22[0] = v12;
  v13 = NSNumber;
  [(PLDataDensityClustering *)self maximumDistance];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v22[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  v16 = [(PLDataClustering *)self distanceBlock];
  v17 = PXStoryClusteringAlgorithmCutAdjacentWithAssetIndicesOptionsAndDistanceBlock(v8, v15, v16);

  [(NSProgress *)self->_progress setCompletedUnitCount:v9];
  if (v7)
  {
    [(NSProgress *)self->_progress fractionCompleted];
    v7[2](v7, &v20);
  }

  return v17;
}

@end