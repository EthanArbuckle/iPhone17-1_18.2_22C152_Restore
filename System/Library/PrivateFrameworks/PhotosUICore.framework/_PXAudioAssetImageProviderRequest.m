@interface _PXAudioAssetImageProviderRequest
- (CGSize)targetSize;
- (PXDisplayAsset)asset;
- (PXImageRequestOptions)options;
- (_PXAudioAssetImageProviderRequest)init;
- (_PXAudioAssetImageProviderRequest)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 requestID:(int64_t)a8 signpostID:(unint64_t)a9;
- (id)description;
- (id)resultHandler;
- (int64_t)contentMode;
- (int64_t)requestID;
- (unint64_t)signpostID;
@end

@implementation _PXAudioAssetImageProviderRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (int64_t)contentMode
{
  return self->_contentMode;
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

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PXAudioAssetImageProviderRequest *)self asset];
  [(_PXAudioAssetImageProviderRequest *)self targetSize];
  v7 = NSStringFromCGSize(v11);
  v8 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; asset: %@, targetSize: %@ requestID: %ld>",
                 v5,
                 self,
                 v6,
                 v7,
                 [(_PXAudioAssetImageProviderRequest *)self requestID]);

  return v8;
}

- (_PXAudioAssetImageProviderRequest)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 requestID:(int64_t)a8 signpostID:(unint64_t)a9
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_PXAudioAssetImageProviderRequest;
  v21 = [(_PXAudioAssetImageProviderRequest *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_asset, a3);
    v22->_targetSize.CGFloat width = width;
    v22->_targetSize.CGFloat height = height;
    v22->_contentMode = a5;
    objc_storeStrong((id *)&v22->_options, a6);
    uint64_t v23 = [v20 copy];
    id resultHandler = v22->_resultHandler;
    v22->_id resultHandler = (id)v23;

    v22->_requestID = a8;
    v22->_signpostID = a9;
  }

  return v22;
}

- (_PXAudioAssetImageProviderRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAudioAssetImageProvider.m", 226, @"%s is not available as initializer", "-[_PXAudioAssetImageProviderRequest init]");

  abort();
}

@end