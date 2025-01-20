@interface PXPhotoLibraryProcessingProgressRow
- (Class)tableViewCellClass;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoLibraryProcessingProgressRow)init;
- (PXPhotoLibraryProcessingProgressRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultUIAction;
@end

@implementation PXPhotoLibraryProcessingProgressRow

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)defaultUIAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PXPhotoLibraryProcessingProgressRow_defaultUIAction__block_invoke;
  v4[3] = &unk_1E5DCD7C0;
  v4[4] = self;
  v4[5] = a2;
  v2 = [MEMORY[0x1E4F94190] actionWithHandler:v4];
  return v2;
}

uint64_t __54__PXPhotoLibraryProcessingProgressRow_defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v21 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v21);
    v22 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:v19, v20, @"PXPhotoLibraryProcessingProgressRow.m", 74, @"%@ should be an instance inheriting from %@, but it is %@", @"row", v18, v22 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 handleFailureInMethod:v15, v16, @"PXPhotoLibraryProcessingProgressRow.m", 74, @"%@ should be an instance inheriting from %@, but it is nil", @"row", v18 object file lineNumber description];
  }

LABEL_3:
  v8 = [v7 photoLibrary];

  id v9 = v8;
  id v10 = v6;
  v11 = v10;
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    [v23 handleFailureInFunction:v24, @"PXPhotoLibraryProcessingProgressRow.m", 25, @"Invalid parameter not satisfying: %@", @"photoLibrary" file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
LABEL_10:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    [v25 handleFailureInFunction:v26, @"PXPhotoLibraryProcessingProgressRow.m", 26, @"Invalid parameter not satisfying: %@", @"viewController" file lineNumber description];

    goto LABEL_5;
  }
  if (!v10) {
    goto LABEL_10;
  }
LABEL_5:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_261441;
  v27[3] = &unk_1E5DCD810;
  id v28 = v11;
  id v12 = v11;
  +[PXPhotoLibraryProcessingProgressReport requestFullDescriptionForLibrary:v9 resultBlock:v27];

  return 1;
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXPhotoLibraryProcessingProgressRow alloc];
  photoLibrary = self->_photoLibrary;
  id v6 = [(PXPhotoLibraryProcessingProgressRow *)self titleKeyPath];
  id v7 = [(PXPhotoLibraryProcessingProgressRow *)self imageKeyPath];
  v8 = [(PXPhotoLibraryProcessingProgressRow *)v4 initWithPhotoLibrary:photoLibrary titleKeyPath:v6 imageKeyPath:v7];

  return v8;
}

- (PXPhotoLibraryProcessingProgressRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoLibraryProcessingProgressRow;
  id v12 = [(PXPhotoLibraryProcessingProgressRow *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    [(PXPhotoLibraryProcessingProgressRow *)v13 setTitleKeyPath:v10];
    [(PXPhotoLibraryProcessingProgressRow *)v13 setImageKeyPath:v11];
  }

  return v13;
}

- (PXPhotoLibraryProcessingProgressRow)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 48, @"%s is not available as initializer", "-[PXPhotoLibraryProcessingProgressRow init]");

  abort();
}

@end