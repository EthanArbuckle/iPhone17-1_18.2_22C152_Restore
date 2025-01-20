@interface PXStoryMomentsOneClustering
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PXStoryMomentsOneClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStoryAutoEditMomentsProvider.m", 48, @"Invalid parameter not satisfying: %@", @"dataset.count > 0" object file lineNumber description];
  }
  v7 = [MEMORY[0x1E4F8A788] clusterWithObjects:v6];
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v8;
}

@end