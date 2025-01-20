@interface PUPhotoEditSnapshot
+ (void)captureSnapshotForAsset:(id)a3 mediaProvider:(id)a4 completion:(id)a5;
- (AVURLAsset)baseVideoComplement;
- (AVURLAsset)videoComplement;
- (NSData)baseImageData;
- (NSData)imageData;
- (NSString)imageUTI;
- (PHAdjustmentData)adjustmentData;
- (PUPhotoEditSnapshot)init;
- (id)_copyAsset:(id)a3;
- (id)_copyData:(id)a3;
- (id)_copyDataAtURL:(id)a3;
- (int64_t)workImageVersion;
- (void)_copySourceData:(id)a3 destinationData:(id *)a4 destinationURL:(id *)a5;
- (void)_setAdjustmentData:(id)a3;
- (void)_setBaseImageData:(id)a3;
- (void)_setBaseVideoComplement:(id)a3;
- (void)_setImageData:(id)a3;
- (void)_setImageUTI:(id)a3;
- (void)_setVideoComplement:(id)a3;
- (void)_setWorkImageVersion:(int64_t)a3;
@end

@implementation PUPhotoEditSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUTI, 0);
  objc_storeStrong((id *)&self->_baseVideoComplement, 0);
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_baseImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

- (NSString)imageUTI
{
  return self->_imageUTI;
}

- (AVURLAsset)baseVideoComplement
{
  return self->_baseVideoComplement;
}

- (AVURLAsset)videoComplement
{
  return self->_videoComplement;
}

- (NSData)baseImageData
{
  return self->_baseImageData;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)_setAdjustmentData:(id)a3
{
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)_setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void)_copySourceData:(id)a3 destinationData:(id *)a4 destinationURL:(id *)a5
{
  id v9 = a3;
  v10 = NSTemporaryDirectory();
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  v13 = [v10 stringByAppendingPathComponent:v12];

  [v9 writeToFile:v13 options:1073741825 error:0];
  v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v13 options:8 error:0];
  id v16 = v13;
  unlink((const char *)[v16 fileSystemRepresentation]);
  if (v14)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2 object:self file:@"PUPhotoEditSnapshot.m" lineNumber:134 description:@"couldn't copy snapshot data"];

  if (a4) {
LABEL_3:
  }
    *a4 = v14;
LABEL_4:
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
  }
}

- (id)_copyDataAtURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  v5 = [a3 path];
  v6 = [v4 dataWithContentsOfFile:v5 options:8 error:0];

  id v9 = 0;
  [(PUPhotoEditSnapshot *)self _copySourceData:v6 destinationData:0 destinationURL:&v9];
  id v7 = v9;

  return v7;
}

- (id)_copyData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = 0;
  [(PUPhotoEditSnapshot *)self _copySourceData:a3 destinationData:&v5 destinationURL:0];
  id v3 = v5;
  return v3;
}

- (id)_copyAsset:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 URL];
  id v5 = [(PUPhotoEditSnapshot *)self _copyDataAtURL:v4];
  v6 = [MEMORY[0x1E4F166C8] assetWithURL:v5];

  return v6;
}

- (void)_setBaseVideoComplement:(id)a3
{
  v4 = [(PUPhotoEditSnapshot *)self _copyAsset:a3];
  baseVideoComplement = self->_baseVideoComplement;
  self->_baseVideoComplement = v4;
}

- (void)_setVideoComplement:(id)a3
{
  v4 = [(PUPhotoEditSnapshot *)self _copyAsset:a3];
  videoComplement = self->_videoComplement;
  self->_videoComplement = v4;
}

- (void)_setBaseImageData:(id)a3
{
  v4 = [(PUPhotoEditSnapshot *)self _copyData:a3];
  baseImageData = self->_baseImageData;
  self->_baseImageData = v4;
}

- (void)_setImageUTI:(id)a3
{
}

- (void)_setImageData:(id)a3
{
  v4 = [(PUPhotoEditSnapshot *)self _copyData:a3];
  imageData = self->_imageData;
  self->_imageData = v4;
}

- (PUPhotoEditSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditSnapshot;
  result = [(PUPhotoEditSnapshot *)&v3 init];
  if (result) {
    result->_workImageVersion = 1;
  }
  return result;
}

+ (void)captureSnapshotForAsset:(id)a3 mediaProvider:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [[PUEditableMediaProviderAdjustmentDataNode alloc] initWithAsset:v14 mediaProvider:v7];
  v10 = [[PUPhotoEditBaseMediaNode alloc] initWithAdjustmentNode:v9];
  v11 = [[PUEditableMediaProviderImageDataNode alloc] initWithAsset:v14 mediaProvider:v7 version:0];
  v12 = 0;
  if ([v14 isLivePhoto]) {
    v12 = [[PUEditableMediaProviderVideoAssetNode alloc] initWithAsset:v14 mediaProvider:v7 version:0];
  }
  v13 = [[PUPhotoEditSnapshotFinishingNode alloc] initWithAdjustmentNode:v9 baseMediaNode:v10 currentImageNode:v11 currentVideoNode:v12 completionHandler:v8];

  [MEMORY[0x1E4F90628] processGraphForRunNode:v13];
}

@end