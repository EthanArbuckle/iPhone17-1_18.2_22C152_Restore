@interface FCIssueThumbnail
+ (id)issueThumbnailWithAssetHandle:(id)a3 thumbnailSize:(CGSize)a4;
- (CGSize)thumbnailSize;
- (FCAssetHandle)thumbnailAssetHandle;
- (void)setThumbnailAssetHandle:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
@end

@implementation FCIssueThumbnail

+ (id)issueThumbnailWithAssetHandle:(id)a3 thumbnailSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (!v6 || (width == *MEMORY[0x1E4F1DB30] ? (BOOL v7 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v7 = 0), v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(FCIssueThumbnail);
    [(FCIssueThumbnail *)v8 setThumbnailAssetHandle:v6];
    -[FCIssueThumbnail setThumbnailSize:](v8, "setThumbnailSize:", width, height);
  }

  return v8;
}

- (FCAssetHandle)thumbnailAssetHandle
{
  return self->_thumbnailAssetHandle;
}

- (void)setThumbnailAssetHandle:(id)a3
{
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (void).cxx_destruct
{
}

@end