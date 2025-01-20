@interface PXVideoFormatMetadataProviderObjc
- (PXVideoFormatMetadataProviderObjc)initWithImageManager:(id)a3;
- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)metadataProvider;
- (void)cancelActiveRequest;
- (void)requestVideoMetadataForItem:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
- (void)setMetadataProvider:(id)a3;
@end

@implementation PXVideoFormatMetadataProviderObjc

- (void).cxx_destruct
{
}

- (void)setMetadataProvider:(id)a3
{
}

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (void)requestVideoMetadataForItem:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PXVideoFormatMetadataProviderObjc *)self metadataProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PXVideoFormatMetadataProviderObjc_requestVideoMetadataForItem_processingQueue_callbackQueue_completion___block_invoke;
  v16[3] = &unk_1E5DB2B58;
  id v17 = v10;
  id v15 = v10;
  [v14 requestVideoMetadataFor:v13 processingQueue:v12 callbackQueue:v11 completion:v16];
}

void __106__PXVideoFormatMetadataProviderObjc_requestVideoMetadataForItem_processingQueue_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (v7)
  {
    v6 = [[PXVideoFormatMetadataObjc alloc] initWithMetadata:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)cancelActiveRequest
{
  id v2 = [(PXVideoFormatMetadataProviderObjc *)self metadataProvider];
  [v2 cancelActiveRequest];
}

- (PXVideoFormatMetadataProviderObjc)initWithImageManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoFormatMetadataProviderObjc;
  id v5 = [(PXVideoFormatMetadataProviderObjc *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC12PhotosUICore29PXVideoFormatMetadataProvider alloc] initWithImageManager:v4];
    metadataProvider = v5->_metadataProvider;
    v5->_metadataProvider = v6;
  }
  return v5;
}

@end