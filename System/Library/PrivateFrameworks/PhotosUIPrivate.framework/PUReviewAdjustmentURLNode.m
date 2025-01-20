@interface PUReviewAdjustmentURLNode
- (NSURL)adjustmentURL;
- (NSURL)directory;
- (PHContentEditingOutput)contentEditingOutput;
- (PUReviewAdjustmentURLNode)initWithReviewAsset:(id)a3 directory:(id)a4 contentEditingOutput:(id)a5;
- (PUReviewAsset)reviewAsset;
- (void)run;
@end

@implementation PUReviewAdjustmentURLNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_adjustmentURL, 0);
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSURL)adjustmentURL
{
  return self->_adjustmentURL;
}

- (void)run
{
  v3 = [(PUReviewAdjustmentURLNode *)self contentEditingOutput];
  id v9 = [v3 assetAdjustmentsWithEditorBundleID:0];

  if (!v9)
  {
    if ([(PUReviewAsset *)self->_reviewAsset isHighFramerateVideo])
    {
      v4 = [(PUReviewAsset *)self->_reviewAsset providedVideoURL];
      v5 = [MEMORY[0x1E4F166C8] assetWithURL:v4];
      id v9 = [MEMORY[0x1E4F8CE18] defaultSlowMotionAdjustmentsForAsset:v5];
    }
    else
    {
      id v9 = 0;
    }
  }
  v6 = [(PUReviewAdjustmentURLNode *)self directory];
  v7 = +[PUReviewAsset fileURLForAdjustmentsInDirectory:v6];

  [v9 writeToURL:v7 atomically:0];
  adjustmentURL = self->_adjustmentURL;
  self->_adjustmentURL = v7;

  [(PXRunNode *)self complete];
}

- (PUReviewAdjustmentURLNode)initWithReviewAsset:(id)a3 directory:(id)a4 contentEditingOutput:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 || !v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUReviewAdjustmentURLNode.m", 19, @"Invalid parameter not satisfying: %@", @"reviewAsset && directory" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PUReviewAdjustmentURLNode;
  v13 = [(PXRunNode *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_reviewAsset, a3);
    objc_storeStrong((id *)&v14->_contentEditingOutput, a5);
    objc_storeStrong((id *)&v14->_directory, a4);
  }

  return v14;
}

@end