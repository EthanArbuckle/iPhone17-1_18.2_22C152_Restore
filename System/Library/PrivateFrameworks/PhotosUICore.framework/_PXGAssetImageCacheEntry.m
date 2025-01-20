@interface _PXGAssetImageCacheEntry
- (BOOL)isDegraded;
- (CGImage)cgImage;
- (CGSize)imageSize;
- (CGSize)targetSize;
- (NSMutableIndexSet)requestIDs;
- (PXDisplayAsset)asset;
- (_PXGAssetImageCacheEntry)init;
- (unsigned)imageOrientation;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAsset:(id)a3;
- (void)setCgImage:(CGImage *)a3;
- (void)setImageOrientation:(unsigned int)a3;
- (void)setIsDegraded:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
@end

@implementation _PXGAssetImageCacheEntry

- (CGSize)imageSize
{
  [(_PXGAssetImageCacheEntry *)self cgImage];
  [(_PXGAssetImageCacheEntry *)self imageOrientation];
  PXCGImageGetSizeWithOrientation();
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (CGImage)cgImage
{
  CGImageRef v2 = CGImageRetain(self->_cgImage);
  v3 = v2;
  if (v2) {
    CFAutorelease(v2);
  }
  return v3;
}

- (void)setAsset:(id)a3
{
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (_PXGAssetImageCacheEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXGAssetImageCacheEntry;
  CGImageRef v2 = [(_PXGAssetImageCacheEntry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    requestIDs = v2->_requestIDs;
    v2->_requestIDs = v3;
  }
  return v2;
}

- (NSMutableIndexSet)requestIDs
{
  return self->_requestIDs;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (void)setImageOrientation:(unsigned int)a3
{
  self->_imageOrientation = a3;
}

- (void)setCgImage:(CGImage *)a3
{
  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    CGImageRelease(cgImage);
    self->_cgImage = a3;
    CGImageRetain(a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requestIDs, 0);
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)prepareForReuse
{
  v3 = [(_PXGAssetImageCacheEntry *)self requestIDs];
  [v3 removeAllIndexes];

  [(_PXGAssetImageCacheEntry *)self setAsset:0];
  [(_PXGAssetImageCacheEntry *)self setCgImage:0];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[_PXGAssetImageCacheEntry setTargetSize:](self, "setTargetSize:", v4, v5);
}

- (void)dealloc
{
  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)_PXGAssetImageCacheEntry;
  [(_PXGAssetImageCacheEntry *)&v3 dealloc];
}

@end