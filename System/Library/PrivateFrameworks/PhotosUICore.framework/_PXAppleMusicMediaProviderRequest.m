@interface _PXAppleMusicMediaProviderRequest
- (PXAppleMusicAsset)asset;
- (PXAudioRequestOptions)options;
- (_PXAppleMusicMediaProviderRequest)init;
- (_PXAppleMusicMediaProviderRequest)initWithAsset:(id)a3 options:(id)a4 requestID:(int64_t)a5 resultHandler:(id)a6;
- (id)resultHandler;
- (int64_t)requestID;
- (int64_t)signpostID;
- (void)setSignpostID:(int64_t)a3;
@end

@implementation _PXAppleMusicMediaProviderRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setSignpostID:(int64_t)a3
{
  self->_signpostID = a3;
}

- (int64_t)signpostID
{
  return self->_signpostID;
}

- (PXAudioRequestOptions)options
{
  return self->_options;
}

- (PXAppleMusicAsset)asset
{
  return self->_asset;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (_PXAppleMusicMediaProviderRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicMediaProvider.m", 57, @"%s is not available as initializer", "-[_PXAppleMusicMediaProviderRequest init]");

  abort();
}

- (_PXAppleMusicMediaProviderRequest)initWithAsset:(id)a3 options:(id)a4 requestID:(int64_t)a5 resultHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_PXAppleMusicMediaProviderRequest;
  v14 = [(_PXAppleMusicMediaProviderRequest *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_requestID = a5;
    objc_storeStrong((id *)&v14->_asset, a3);
    uint64_t v16 = [v12 copy];
    options = v15->_options;
    v15->_options = (PXAudioRequestOptions *)v16;

    uint64_t v18 = [v13 copy];
    id resultHandler = v15->_resultHandler;
    v15->_id resultHandler = (id)v18;
  }
  return v15;
}

@end