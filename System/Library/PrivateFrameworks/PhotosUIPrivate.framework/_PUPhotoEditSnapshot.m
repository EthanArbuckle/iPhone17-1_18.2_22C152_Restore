@interface _PUPhotoEditSnapshot
- (NSData)baseImageData;
- (NSData)imageData;
- (PHAdjustmentData)adjustmentData;
- (id)_copyData:(id)a3;
- (int64_t)workImageVersion;
- (void)setAdjustmentData:(id)a3;
- (void)setBaseImageData:(id)a3;
- (void)setImageData:(id)a3;
- (void)setWorkImageVersion:(int64_t)a3;
@end

@implementation _PUPhotoEditSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

- (NSData)baseImageData
{
  return self->_baseImageData;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setAdjustmentData:(id)a3
{
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (id)_copyData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  v6 = NSTemporaryDirectory();
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v9 = [v6 stringByAppendingPathComponent:v8];

  [v5 writeToFile:v9 options:1073741825 error:0];
  v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v9 options:8 error:0];
  id v11 = v9;
  unlink((const char *)[v11 fileSystemRepresentation]);
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:10587 description:@"couldn't copy snapshot data"];
  }
  return v10;
}

- (void)setBaseImageData:(id)a3
{
  v4 = [(_PUPhotoEditSnapshot *)self _copyData:a3];
  baseImageData = self->_baseImageData;
  self->_baseImageData = v4;
}

- (void)setImageData:(id)a3
{
  v4 = [(_PUPhotoEditSnapshot *)self _copyData:a3];
  imageData = self->_imageData;
  self->_imageData = v4;
}

@end