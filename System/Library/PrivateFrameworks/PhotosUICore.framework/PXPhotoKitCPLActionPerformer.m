@interface PXPhotoKitCPLActionPerformer
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3;
- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3 photoLibrary:(id)a4;
@end

@implementation PXPhotoKitCPLActionPerformer

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitCPLActionPerformer.m", 91, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXPhotoKitCPLActionPerformer;
  v9 = [(PXActionPerformer *)&v13 initWithActionType:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
  }

  return v10;
}

- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitCPLActionPerformer.m", 87, @"%s is not available as initializer", "-[PXPhotoKitCPLActionPerformer initWithActionType:]");

  abort();
}

@end