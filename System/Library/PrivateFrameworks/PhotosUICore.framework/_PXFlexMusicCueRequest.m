@interface _PXFlexMusicCueRequest
- (PXFlexMusicAsset)asset;
- (_PXFlexMusicCueRequest)init;
- (_PXFlexMusicCueRequest)initWithAsset:(id)a3 resultHandler:(id)a4;
- (id)resultHandler;
@end

@implementation _PXFlexMusicCueRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (PXFlexMusicAsset)asset
{
  return self->_asset;
}

- (_PXFlexMusicCueRequest)initWithAsset:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXFlexMusicCueRequest;
  v9 = [(_PXFlexMusicCueRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = [v8 copy];
    id resultHandler = v10->_resultHandler;
    v10->_id resultHandler = (id)v11;
  }
  return v10;
}

- (_PXFlexMusicCueRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicCueProvider.m", 103, @"%s is not available as initializer", "-[_PXFlexMusicCueRequest init]");

  abort();
}

@end