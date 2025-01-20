@interface _PXFlexMusicMediaProviderRequest
- (PXAudioRequestOptions)options;
- (PXFlexMusicAsset)asset;
- (_PXFlexMusicMediaProviderRequest)init;
- (_PXFlexMusicMediaProviderRequest)initWithAsset:(id)a3 options:(id)a4 requestID:(int64_t)a5 resultHandler:(id)a6;
- (id)resultHandler;
- (int64_t)requestID;
@end

@implementation _PXFlexMusicMediaProviderRequest

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

- (PXAudioRequestOptions)options
{
  return self->_options;
}

- (PXFlexMusicAsset)asset
{
  return self->_asset;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (_PXFlexMusicMediaProviderRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicMediaProvider.m", 192, @"%s is not available as initializer", "-[_PXFlexMusicMediaProviderRequest init]");

  abort();
}

- (_PXFlexMusicMediaProviderRequest)initWithAsset:(id)a3 options:(id)a4 requestID:(int64_t)a5 resultHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_PXFlexMusicMediaProviderRequest;
  v14 = [(_PXFlexMusicMediaProviderRequest *)&v21 init];
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