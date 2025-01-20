@interface PUSaveReviewAssetRequest
- (BOOL)supportsProgress;
- (NSURL)directory;
- (PHContentEditingOutput)contentEditingOutput;
- (PICompositionController)compositionController;
- (PUEditableAsset)editableAsset;
- (PUEditableMediaProvider)editableMediaProvider;
- (PUSaveReviewAssetRequest)init;
- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 contentEditingOutput:(id)a7 workImageVersion:(int64_t)a8;
- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 workImageVersion:(int64_t)a7;
- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 contentEditingOutput:(id)a6 workImageVersion:(int64_t)a7;
- (PUSaveReviewAssetRequest)initWithAssetForRevertToOriginal:(id)a3 mediaProvider:(id)a4 directory:(id)a5;
- (double)progress;
- (int)identifier;
- (int64_t)_imageRequestVersion;
- (int64_t)_videoRequestVersion;
- (int64_t)currentState;
- (int64_t)workImageVersion;
- (void)_finishWithAsset:(id)a3 error:(id)a4;
- (void)_handleOutputNodeFinishedWithError:(id)a3;
- (void)_performInternalSaveOperation;
- (void)_performSaveOperation;
- (void)_transitionToState:(int64_t)a3;
- (void)beginSaveOperationWithCompletionHandler:(id)a3;
- (void)cancelSaveOperation;
- (void)runNode:(id)a3 didCancelWithError:(id)a4;
- (void)runNode:(id)a3 didCompleteWithError:(id)a4;
@end

@implementation PUSaveReviewAssetRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_editableAsset, 0);
  objc_storeStrong((id *)&self->_editableMediaProvider, 0);
  objc_storeStrong((id *)&self->_videoExportNode, 0);
  objc_storeStrong((id *)&self->_outputNode, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NSURL)directory
{
  return self->_directory;
}

- (PUEditableAsset)editableAsset
{
  return self->_editableAsset;
}

- (PUEditableMediaProvider)editableMediaProvider
{
  return self->_editableMediaProvider;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)_transitionToState:(int64_t)a3
{
  int64_t currentState = self->_currentState;
  if (!currentState)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (currentState != 1 || (a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_6:
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUSaveReviewAssetRequest.m", 342, @"Invalid transition %ld %ld", self->_currentState, a3);
  }
LABEL_7:
  self->_int64_t currentState = a3;
}

- (double)progress
{
  double result = 1.0;
  if (self->_currentState != 2)
  {
    BOOL v4 = [(PUSaveReviewAssetRequest *)self supportsProgress];
    double result = 0.0;
    if (v4)
    {
      videoExportNode = self->_videoExportNode;
      if (videoExportNode)
      {
        [(PUVideoExportNode *)videoExportNode progress];
      }
    }
  }
  return result;
}

- (BOOL)supportsProgress
{
  v3 = [(PUSaveReviewAssetRequest *)self compositionController];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(PUSaveReviewAssetRequest *)self editableAsset];
  char v5 = [v4 isLivePhoto];
  if ([v4 mediaType] == 2) {
    char v5 = 1;
  }

  return v5;
}

- (void)_finishWithAsset:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v6) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
    [(PUSaveReviewAssetRequest *)self _transitionToState:v8];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v10 = v9;
    double beginTimestamp = self->_beginTimestamp;
    v12 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      double v16 = v10 - beginTimestamp;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "PUReviewAssetsSaveRequest operation took: %f sec", (uint8_t *)&v15, 0xCu);
    }

    completionHandler = (void (**)(id, id, id))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v6, v7);
      id v14 = self->_completionHandler;
      self->_completionHandler = 0;
    }
  }
}

- (void)cancelSaveOperation
{
  [(PXRunNode *)self->_outputNode cancel];
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x1E4F39800], 3072, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PUSaveReviewAssetRequest *)self _finishWithAsset:0 error:v3];
}

- (void)_handleOutputNodeFinishedWithError:(id)a3
{
  id v4 = a3;
  char v5 = [(PUReviewCreateAssetNode *)self->_outputNode reviewAsset];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PUSaveReviewAssetRequest__handleOutputNodeFinishedWithError___block_invoke;
  block[3] = &unk_1E5F2E908;
  block[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PUSaveReviewAssetRequest__handleOutputNodeFinishedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithAsset:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)runNode:(id)a3 didCancelWithError:(id)a4
{
  if (self->_outputNode == a3) {
    [(PUSaveReviewAssetRequest *)self _handleOutputNodeFinishedWithError:a4];
  }
}

- (void)runNode:(id)a3 didCompleteWithError:(id)a4
{
  if (self->_outputNode == a3) {
    [(PUSaveReviewAssetRequest *)self _handleOutputNodeFinishedWithError:a4];
  }
}

- (void)_performSaveOperation
{
  id v3 = [(PUSaveReviewAssetRequest *)self editableAsset];
  id v4 = [(PUSaveReviewAssetRequest *)self editableMediaProvider];
  char v5 = [(PUSaveReviewAssetRequest *)self directory];
  uint64_t v6 = [v3 playbackStyle];
  id v7 = 0;
  if ([v3 mediaType] == 1 && v6 != 5) {
    id v7 = [[PUEditableMediaProviderImageDataNode alloc] initWithAsset:v3 mediaProvider:v4 version:[(PUSaveReviewAssetRequest *)self _imageRequestVersion]];
  }
  BOOL v9 = [v3 mediaType] == 2 || v6 == 5;
  if (([v3 isLivePhoto] & 1) != 0 || v9)
  {
    int64_t v12 = [(PUSaveReviewAssetRequest *)self _videoRequestVersion];
    v11 = [[PUEditableMediaProviderVideoURLNode alloc] initWithAsset:v3 mediaProvider:v4 version:v12];
    if (v9) {
      id v10 = [[PUEditableMediaProviderVideoAssetNode alloc] initWithAsset:v3 mediaProvider:v4 version:v12];
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
    v11 = 0;
  }
  id v17 = v3;
  v13 = [[PUReviewInternalSaveNode alloc] initWithDirectory:v5 imageDataNode:v7 imageRenderNode:0 videoURLNode:v11 videoRenderNode:0];
  if (self->_contentEditingOutput
    || (id v14 = (PUReviewAdjustmentURLNode *)v13, [v17 isHighFramerateVideo]))
  {
    id v14 = [[PUReviewAdjustmentURLNode alloc] initWithReviewAsset:v17 directory:v5 contentEditingOutput:self->_contentEditingOutput];
  }
  int v15 = [[PUReviewCreateAssetNode alloc] initWithInputAsset:v17 imageInfoNode:v13 renderImageInfoNode:0 renderImageDataNode:0 videoURLNode:v13 videoAssetNode:v10 renderVideoURLNode:0 renderVideoAssetNode:0 adjustmentURLNode:v14];
  outputNode = self->_outputNode;
  self->_outputNode = v15;

  [(PXRunNode *)self->_outputNode setDelegate:self];
  [MEMORY[0x1E4F90628] processGraphForRunNode:self->_outputNode withQualityOfService:25];
}

- (void)_performInternalSaveOperation
{
  id v3 = [(PUSaveReviewAssetRequest *)self editableAsset];
  uint64_t v4 = [(PUSaveReviewAssetRequest *)self editableMediaProvider];
  uint64_t v5 = [(PUSaveReviewAssetRequest *)self directory];
  uint64_t v6 = [(PUSaveReviewAssetRequest *)self compositionController];
  int v7 = [v3 isLivePhoto];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
  }
  else
  {
    uint64_t v9 = 0;
  }
  v30 = (void *)v5;
  if ([v3 mediaType] == 2)
  {
    [v3 mediaType];
    id v10 = 0;
    BOOL v12 = 1;
LABEL_14:
    id v14 = [[PUEditableMediaProviderVideoURLNode alloc] initWithAsset:v3 mediaProvider:v4 version:[(PUSaveReviewAssetRequest *)self _videoRequestVersion]];
    int v15 = [[PUVideoExportNode alloc] initWithVideoURLNode:v14 imageURLNode:v10 quality:2 livePhotoPairingIdentifier:v9 compositionController:v6];
    goto LABEL_16;
  }
  uint64_t v11 = [v3 playbackStyle];
  BOOL v12 = v11 == 5;
  id v10 = 0;
  if ([v3 mediaType] == 1 && v11 != 5) {
    id v10 = [[PUEditableMediaProviderImageDataNode alloc] initWithAsset:v3 mediaProvider:v4 version:[(PUSaveReviewAssetRequest *)self _imageRequestVersion]];
  }
  if (v11 == 5) {
    int v13 = 1;
  }
  else {
    int v13 = v7;
  }
  if (v13 == 1) {
    goto LABEL_14;
  }
  BOOL v12 = 0;
  int v15 = 0;
  id v14 = 0;
LABEL_16:
  v31 = (void *)v9;
  v32 = (void *)v4;
  if (!v10) {
    goto LABEL_20;
  }
  if (!v7)
  {
    if (!v12)
    {
      id v17 = (void *)v6;
      v18 = v30;
      v19 = [PUImageDataRenderNode alloc];
      v20 = v10;
      v21 = 0;
      v22 = v17;
      uint64_t v23 = 0;
      goto LABEL_22;
    }
LABEL_20:
    id v17 = (void *)v6;
    v18 = v30;
    v24 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = v9;
  id v17 = (void *)v6;
  v18 = v30;
  v19 = [PUImageDataRenderNode alloc];
  v20 = v10;
  v21 = v14;
  v22 = v17;
  uint64_t v23 = v16;
LABEL_22:
  v24 = [(PUImageDataRenderNode *)v19 initWithImageInfoNode:v20 videoURLNode:v21 compositionController:v22 livePhotoPairingIdentifier:v23 jpegCompression:0.899999976];
LABEL_23:
  id v33 = v3;
  v25 = [[PUReviewInternalSaveNode alloc] initWithDirectory:v18 imageDataNode:v10 imageRenderNode:v24 videoURLNode:v14 videoRenderNode:v15];
  v26 = [[PUReviewCreateAssetNode alloc] initWithInputAsset:v33 imageInfoNode:v25 renderImageInfoNode:v25 renderImageDataNode:v25 videoURLNode:v25 videoAssetNode:0 renderVideoURLNode:v25 renderVideoAssetNode:0 adjustmentURLNode:v25];

  outputNode = self->_outputNode;
  self->_outputNode = v26;

  [(PXRunNode *)self->_outputNode setDelegate:self];
  videoExportNode = self->_videoExportNode;
  self->_videoExportNode = v15;
  v29 = v15;

  [MEMORY[0x1E4F90628] processGraphForRunNode:self->_outputNode withQualityOfService:25];
}

- (int64_t)_videoRequestVersion
{
  int64_t workImageVersion = self->_workImageVersion;
  if (workImageVersion == 3) {
    return 0;
  }
  if (workImageVersion == 2)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUSaveReviewAssetRequest.m" lineNumber:160 description:@"This isn't supported yet"];

    return 8;
  }
  else
  {
    if (!workImageVersion)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUSaveReviewAssetRequest.m" lineNumber:152 description:@"unknown work image version"];
    }
    return 1;
  }
}

- (int64_t)_imageRequestVersion
{
  int64_t workImageVersion = self->_workImageVersion;
  switch(workImageVersion)
  {
    case 3:
      return 0;
    case 2:
      return 8;
    case 0:
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUSaveReviewAssetRequest.m" lineNumber:131 description:@"unknown work image version"];

      break;
  }
  return 1;
}

- (void)beginSaveOperationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PUSaveReviewAssetRequest *)self _transitionToState:1];
  uint64_t v5 = (void *)[v4 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v5;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_double beginTimestamp = v7;
  uint64_t v8 = [(PUSaveReviewAssetRequest *)self compositionController];

  if (v8)
  {
    [(PUSaveReviewAssetRequest *)self _performInternalSaveOperation];
  }
  else
  {
    [(PUSaveReviewAssetRequest *)self _performSaveOperation];
  }
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 contentEditingOutput:(id)a7 workImageVersion:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PUSaveReviewAssetRequest;
  v20 = [(PUSaveReviewAssetRequest *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_identifier = atomic_fetch_add(_mediaDestinationRequestIdentifier, 1u) + 1;
    objc_storeStrong((id *)&v20->_editableAsset, a3);
    objc_storeStrong((id *)&v21->_editableMediaProvider, a4);
    uint64_t v22 = [v17 copy];
    directory = v21->_directory;
    v21->_directory = (NSURL *)v22;

    uint64_t v24 = [v18 copy];
    compositionController = v21->_compositionController;
    v21->_compositionController = (PICompositionController *)v24;

    objc_storeStrong((id *)&v21->_contentEditingOutput, a7);
    v21->_int64_t workImageVersion = a8;
    v21->_int64_t currentState = 0;
  }

  return v21;
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 workImageVersion:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v16)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUSaveReviewAssetRequest.m", 87, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];
  }
  id v17 = [(PUSaveReviewAssetRequest *)self initWithAsset:v13 mediaProvider:v14 directory:v15 compositionController:v16 contentEditingOutput:0 workImageVersion:a7];

  return v17;
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 contentEditingOutput:(id)a6 workImageVersion:(int64_t)a7
{
  return [(PUSaveReviewAssetRequest *)self initWithAsset:a3 mediaProvider:a4 directory:a5 compositionController:0 contentEditingOutput:a6 workImageVersion:a7];
}

- (PUSaveReviewAssetRequest)initWithAssetForRevertToOriginal:(id)a3 mediaProvider:(id)a4 directory:(id)a5
{
  return [(PUSaveReviewAssetRequest *)self initWithAsset:a3 mediaProvider:a4 directory:a5 contentEditingOutput:0 workImageVersion:1];
}

- (PUSaveReviewAssetRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUSaveReviewAssetRequest.m" lineNumber:72 description:@"use the designated initializer"];

  return 0;
}

@end