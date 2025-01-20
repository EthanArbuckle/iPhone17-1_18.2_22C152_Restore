@interface PXSharedLibraryPhotoKitImageProvider
- (PXSharedLibraryPhotoKitImageProvider)init;
- (PXSharedLibraryPhotoKitImageProvider)initWithParticipant:(id)a3;
- (PXSharedLibraryPhotoKitImageProvider)initWithPerson:(id)a3;
- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6;
- (void)_handleResultForRequestWithIdentifier:(int64_t)a3 image:(id)a4 isDegraded:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)cancelRequestWithIdentifier:(int64_t)a3;
@end

@implementation PXSharedLibraryPhotoKitImageProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)_handleResultForRequestWithIdentifier:(int64_t)a3 image:(id)a4 isDegraded:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(void))a7;
  if (self->_identifier == a3)
  {
    id v15 = v18;
    if (v18 && !v13)
    {
      v16 = 0;
      goto LABEL_8;
    }

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSharedLibraryImageProviderErrorDomain", -1001, v13, @"Request failed");
  }
  else
  {

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryImageProviderErrorDomain", -1000, @"Request was cancelled");
  }
  v16 = (void *)v17;
  id v15 = 0;
LABEL_8:
  id v19 = v15;
  v14[2](v14);
}

- (void)cancelRequestWithIdentifier:(int64_t)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitImageProvider.m", 109, @"Invalid parameter not satisfying: %@", @"identifier != PXSharedLibraryImageProviderRequestIdentifierInvalid" object file lineNumber description];
  }
  if (self->_identifier == a3) {
    self->_identifier = a3 + 1;
  }
}

- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = a6;
  PXSizeIsEmpty();
}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleResultForRequestWithIdentifier:*(void *)(a1 + 48) image:v10 isDegraded:v9 error:v8 completionHandler:*(void *)(a1 + 32)];
}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = @"Image was nil from image request for participant.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v7 = (void *)[v8 initWithDomain:@"PXSharedLibraryErrorDomain" code:-1000 userInfo:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Monogram was nil from image request for participant.");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXSharedLibraryPhotoKitImageProvider)initWithParticipant:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitImageProvider.m", 45, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitImageProvider;
  id v7 = [(PXSharedLibraryPhotoKitImageProvider *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    v7->_identifier = 0;
    objc_storeStrong((id *)&v7->_participant, a3);
  }

  return v8;
}

- (PXSharedLibraryPhotoKitImageProvider)initWithPerson:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitImageProvider.m", 34, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitImageProvider;
  id v7 = [(PXSharedLibraryPhotoKitImageProvider *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    v7->_identifier = 0;
    objc_storeStrong((id *)&v7->_person, a3);
  }

  return v8;
}

- (PXSharedLibraryPhotoKitImageProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryPhotoKitImageProvider.m", 30, @"%s is not available as initializer", "-[PXSharedLibraryPhotoKitImageProvider init]");

  abort();
}

@end