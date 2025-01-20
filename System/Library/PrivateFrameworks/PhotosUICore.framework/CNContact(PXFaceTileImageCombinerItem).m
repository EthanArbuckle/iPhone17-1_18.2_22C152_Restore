@interface CNContact(PXFaceTileImageCombinerItem)
- (void)px_requestImageWithTargetSize:()PXFaceTileImageCombinerItem displayScale:isRTL:resultHandler:;
@end

@implementation CNContact(PXFaceTileImageCombinerItem)

- (void)px_requestImageWithTargetSize:()PXFaceTileImageCombinerItem displayScale:isRTL:resultHandler:
{
  id v13 = a4;
  if (a5 == *MEMORY[0x1E4F1DB30] && a6 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"CNContact+PXFaceTileImageCombinerItem.m", 21, @"Invalid parameter not satisfying: %@", @"!CGSizeEqualToSize(targetSize, CGSizeZero)" object file lineNumber description];
  }
  if (a7 <= 0.0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"CNContact+PXFaceTileImageCombinerItem.m", 22, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];

    if (v13) {
      goto LABEL_8;
    }
LABEL_10:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"CNContact+PXFaceTileImageCombinerItem.m", 23, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

    goto LABEL_8;
  }
  if (!v13) {
    goto LABEL_10;
  }
LABEL_8:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__CNContact_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v19[3] = &unk_1E5DD24C0;
  id v20 = v13;
  id v15 = v13;
  +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", a1, a3, 0, v19, a5, a6, a7);
}

@end