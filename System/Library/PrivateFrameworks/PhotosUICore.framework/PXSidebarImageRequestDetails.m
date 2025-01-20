@interface PXSidebarImageRequestDetails
- (NSIndexSet)mediaRequestIDs;
- (PXSidebarImageRequestDetails)init;
- (PXSidebarImageRequestDetails)initWithMediaProvider:(id)a3 mediaRequestIDs:(id)a4;
- (PXUIImageProvider)mediaProvider;
- (int64_t)sidebarRequestID;
- (void)cancel;
- (void)setMediaRequestIDs:(id)a3;
@end

@implementation PXSidebarImageRequestDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_mediaRequestIDs, 0);
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaRequestIDs:(id)a3
{
}

- (NSIndexSet)mediaRequestIDs
{
  return self->_mediaRequestIDs;
}

- (int64_t)sidebarRequestID
{
  return self->_sidebarRequestID;
}

- (void)cancel
{
  v3 = [(PXSidebarImageRequestDetails *)self mediaRequestIDs];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PXSidebarImageRequestDetails_cancel__block_invoke;
  v4[3] = &unk_1E5DD3010;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

void __38__PXSidebarImageRequestDetails_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) mediaProvider];
  [v3 cancelImageRequest:a2];
}

- (PXSidebarImageRequestDetails)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSidebarDataController.m", 74, @"%s is not available as initializer", "-[PXSidebarImageRequestDetails init]");

  abort();
}

- (PXSidebarImageRequestDetails)initWithMediaProvider:(id)a3 mediaRequestIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSidebarImageRequestDetails;
  v9 = [(PXSidebarImageRequestDetails *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_sidebarRequestID = (int)atomic_fetch_add(_nextRequestID, 1u);
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    objc_storeStrong((id *)&v10->_mediaRequestIDs, a4);
  }

  return v10;
}

@end