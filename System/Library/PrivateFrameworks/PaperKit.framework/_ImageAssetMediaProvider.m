@interface _ImageAssetMediaProvider
- (NSData)data;
- (_ImageAssetMediaProvider)initWithData:(id)a3;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
@end

@implementation _ImageAssetMediaProvider

- (_ImageAssetMediaProvider)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ImageAssetMediaProvider;
  v5 = [(_ImageAssetMediaProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v9 = a7;
  v10 = [a3 image];
  (*((void (**)(id, void *, void))a7 + 2))(v9, v10, MEMORY[0x263EFFA78]);

  return 0;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v9 = a7;
  id v10 = a3;
  id v11 = [v10 image];
  uint64_t v12 = [v11 CGImage];
  v13 = [v10 image];

  uint64_t v14 = [v13 imageOrientation];
  (*((void (**)(id, uint64_t, uint64_t, void))a7 + 2))(v9, v12, v14, MEMORY[0x263EFFA78]);

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end