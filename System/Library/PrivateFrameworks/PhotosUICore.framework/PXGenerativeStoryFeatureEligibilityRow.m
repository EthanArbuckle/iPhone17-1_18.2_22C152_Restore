@interface PXGenerativeStoryFeatureEligibilityRow
- (Class)tableViewCellClass;
- (PHPhotoLibrary)photoLibrary;
- (PXGenerativeStoryFeatureEligibilityRow)init;
- (PXGenerativeStoryFeatureEligibilityRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultUIAction;
@end

@implementation PXGenerativeStoryFeatureEligibilityRow

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
  v4[2] = __57__PXGenerativeStoryFeatureEligibilityRow_defaultUIAction__block_invoke;
  v4[3] = &unk_1E5DCD7C0;
  v4[4] = self;
  v4[5] = a2;
  v2 = [MEMORY[0x1E4F94190] actionWithHandler:v4];
  return v2;
}

uint64_t __57__PXGenerativeStoryFeatureEligibilityRow_defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
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
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    v23 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v23);
    v24 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:v21, v22, @"PXGenerativeStoryFeatureEligibilityRow.m", 82, @"%@ should be an instance inheriting from %@, but it is %@", @"row", v20, v24 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v16 handleFailureInMethod:v17, v18, @"PXGenerativeStoryFeatureEligibilityRow.m", 82, @"%@ should be an instance inheriting from %@, but it is nil", @"row", v20 object file lineNumber description];
  }

LABEL_3:
  v8 = [v7 photoLibrary];

  id v9 = v8;
  id v10 = v6;
  v11 = v10;
  if (!v9)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    [v25 handleFailureInFunction:v26, @"PXGenerativeStoryFeatureEligibilityRow.m", 25, @"Invalid parameter not satisfying: %@", @"photoLibrary" file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
LABEL_10:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentFullDescriptionAlertForLibrary(PHPhotoLibrary *__strong, UIViewController *__strong)");
    [v27 handleFailureInFunction:v28, @"PXGenerativeStoryFeatureEligibilityRow.m", 26, @"Invalid parameter not satisfying: %@", @"viewController" file lineNumber description];

    goto LABEL_5;
  }
  if (!v10) {
    goto LABEL_10;
  }
LABEL_5:
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F39230]) initWithPhotoLibrary:v9];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke;
  v29[3] = &unk_1E5DB1B80;
  id v30 = v9;
  id v31 = v11;
  id v13 = v11;
  id v14 = v9;
  +[PXGenerativeStoryFeatureEligibilityDataSource generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:v12 photoLibrary:v14 completionHandler:v29];

  return 1;
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXGenerativeStoryFeatureEligibilityRow alloc];
  photoLibrary = self->_photoLibrary;
  id v6 = [(PXGenerativeStoryFeatureEligibilityRow *)self titleKeyPath];
  id v7 = [(PXGenerativeStoryFeatureEligibilityRow *)self imageKeyPath];
  v8 = [(PXGenerativeStoryFeatureEligibilityRow *)v4 initWithPhotoLibrary:photoLibrary titleKeyPath:v6 imageKeyPath:v7];

  return v8;
}

- (PXGenerativeStoryFeatureEligibilityRow)initWithPhotoLibrary:(id)a3 titleKeyPath:(id)a4 imageKeyPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGenerativeStoryFeatureEligibilityRow;
  v12 = [(PXGenerativeStoryFeatureEligibilityRow *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    [(PXGenerativeStoryFeatureEligibilityRow *)v13 setTitleKeyPath:v10];
    [(PXGenerativeStoryFeatureEligibilityRow *)v13 setImageKeyPath:v11];
  }

  return v13;
}

- (PXGenerativeStoryFeatureEligibilityRow)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 51, @"%s is not available as initializer", "-[PXGenerativeStoryFeatureEligibilityRow init]");

  abort();
}

@end