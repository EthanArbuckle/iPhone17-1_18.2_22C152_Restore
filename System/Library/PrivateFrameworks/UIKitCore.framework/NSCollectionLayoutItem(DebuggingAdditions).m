@interface NSCollectionLayoutItem(DebuggingAdditions)
- (id)_visualDescription;
@end

@implementation NSCollectionLayoutItem(DebuggingAdditions)

- (id)_visualDescription
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], 1000.0, 1000.0, 0.0, 0.0, 0.0, 0.0);
  v3 = -[_UICollectionLayoutItemSolver initWithItem:]([_UICollectionLayoutItemSolver alloc], a1);
  v4 = v3;
  if (v3)
  {
    [(_UICollectionLayoutItemSolver *)(uint64_t)v3 _solveForContainer:2 layoutAxis:0 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:0 layoutRTL:0 preferredSizes:0 largestKnownItemSize:*MEMORY[0x1E4F1DB30] solutionRecursionDepth:*(double *)(MEMORY[0x1E4F1DB30] + 8)];
    [v4[3] contentSize];
    double v6 = v5;
    [v4[3] contentSize];
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v6, v7);
    v9 = [(_UICollectionLayoutItemSolver *)(uint64_t)v4 queryFramesApplyingFrameOffset:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
    v10 = [v9 valueForKey:@"frame"];
    v16[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12 = [v11 arrayByAddingObjectsFromArray:v10];

    v13 = [[_UIASCIIArtFramesRenderer alloc] initWithFrames:v12];
    v14 = [(_UIASCIIArtFramesRenderer *)v13 description];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end